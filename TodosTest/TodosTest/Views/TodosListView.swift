//
//  TodosListView.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import SwiftUI

struct TodosListView: View {
    
    @State private var viewModel = TodosListViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.searchResults, id: \.id) { todo in
                NavigationLink {
                    DetailTodoView(todo: todo)
                } label: {
                    ToDoRowView(todo: todo)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Tasks")
            .searchable(text: $viewModel.searchText)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Text("\(viewModel.searchResults.count) \(viewModel.searchResults.count == 1 ? "task" : "tasks")")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    NavigationLink {
                        AddTodoItemView()
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }

                }
            }
            
        }
        .tint(.yellow)
    }
    
}

#Preview {
    TodosListView()
}
