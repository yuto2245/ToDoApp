//
//  ContentView.swift
//  hello1.2
//
//  Created by 延時優斗 on 2021/12/27.
//

import SwiftUI



struct ContentView: View {
    
    @State var newitem: String = ""
    @State var tasks: [String] = []
    // 切り替える状態（初期値はfalse）
    @State var check = false
    
    
    var body: some View {
        
        NavigationView {
            /// 取得したデータをリスト表示
            VStack{
                List {
                        ForEach(tasks, id: \.self) { task in
                        ///タスクの表示
                            HStack {
                                Image(systemName: check
                                          ? "checkmark.circle.fill"
                                          : "circle")
                                    .onTapGesture {
                                        check.toggle()
                                        UIImpactFeedbackGenerator(style: .medium)
                                                .impactOccurred()
                                    }
                                Text(task)
                                    .strikethrough(check ? true : false)
                                Spacer()
                            }
                            
                                                               
                            }
                                .onMove(perform: rowReplace)
                                .onDelete(perform: delete)
                        }
                          .navigationTitle("リスト")
                        .toolbar{
                              ToolbarItem(placement: .navigationBarLeading) {
                                    EditButton()
                       }
                                           
                   }
            
                           HStack{
                                        TextField("入力してください", text: $newitem)
                                   .padding(.vertical,12)
                                   .padding(.horizontal)
                                   .cornerRadius(5)
                                   .frame(width: 300 , height:60)
                                   .foregroundColor(.black)
                                            Button(action: {
                                                                                      self.tasks.append(self.newitem)
                                                                                      self.newitem = ""
                                                                                      
                                                                                  }){
                                                                                                                   Image(systemName: "plus").foregroundColor(.black)
                                                                                      
                                                                                  }
                                                   
                                               
                           }
            }
                       
            
}
    }
    
    /// タスクの削除
    func delete(at offsets: IndexSet) {
            tasks.remove(atOffsets: offsets)
        }

    /// タスクの移動
    func rowReplace(_ from: IndexSet, _ to: Int) {
            tasks.move(fromOffsets: from, toOffset: to)
        }
    
    
}


struct ImputView: View {
    @State private var task = ""
    @State var newitem: String = ""
    @State var tasks: [String] = []
    
    var body: some View {
        Text("a")
            .navigationTitle("タスク詳細")
    }
            
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
