#!/bin/bash

# Define the folder to watch for changes
folder_to_watch="/home/ec2-user/.jupyter/MyNotebooks"

# Navigate to your Git repository root
cd /path/to/your/git/repository

while inotifywait -r -e create "$folder_to_watch"; do
  # Add all new files in the specified folder to the staging area
  git add "$folder_to_watch"/*

  # Check if there are any changes to commit
  if [ -n "$(git status --porcelain)" ]; then
    # Commit with a generic message (customize as needed)
    git commit -m "Automated commit: Add new files"

    # Push to the default remote and branch (e.g., origin main)
    git push origin main
  fi
done
