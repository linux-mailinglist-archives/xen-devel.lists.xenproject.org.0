Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874A77D80CA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 12:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623678.971773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxfh-0007Fq-6S; Thu, 26 Oct 2023 10:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623678.971773; Thu, 26 Oct 2023 10:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxfh-0007AZ-33; Thu, 26 Oct 2023 10:33:01 +0000
Received: by outflank-mailman (input) for mailman id 623678;
 Thu, 26 Oct 2023 10:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oycl=GI=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qvxff-0006fs-Re
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 10:32:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 07456219-73eb-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 12:32:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 531061480;
 Thu, 26 Oct 2023 03:33:38 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABAE73F738;
 Thu, 26 Oct 2023 03:32:55 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 07456219-73eb-11ee-9b0e-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [for-4.19 PATCH 2/2] exclude-list: generalise exclude-list
Date: Thu, 26 Oct 2023 11:32:43 +0100
Message-Id: <20231026103243.2077516-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026103243.2077516-1-luca.fancellu@arm.com>
References: <20231026103243.2077516-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently exclude-list.json is used by the xen-analysis tool to
remove from the report (cppcheck for now) violations from the
files listed in it, however that list can be used by different
users that might want to exclude some of the files from their
computation for many reasons.

So add a new field that can be part of each entry to link
the tool supposed to consider that exclusion.

Update exclusion_file_list.py to implement the logic and update
the documentation to reflect this change.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misra/exclude-list.rst                   | 31 ++++++++++++-------
 .../xen_analysis/exclusion_file_list.py       | 16 ++++++++--
 2 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/docs/misra/exclude-list.rst b/docs/misra/exclude-list.rst
index c97431a86120..42dbceb82523 100644
--- a/docs/misra/exclude-list.rst
+++ b/docs/misra/exclude-list.rst
@@ -1,17 +1,16 @@
 .. SPDX-License-Identifier: CC-BY-4.0
 
-Exclude file list for xen-analysis script
-=========================================
+Exclude file list for xen scripts
+=================================
 
-The code analysis is performed on the Xen codebase for both MISRA
-checkers and static analysis checkers, there are some files however that
-needs to be removed from the findings report for various reasons (e.g.
-they are imported from external sources, they generate too many false
-positive results, etc.).
+Different Xen scripts can perform operations on the codebase to check its
+compliance for a set of rules, however Xen contains some files that are taken
+from other projects (e.g. linux) and they can't be updated to ease backporting
+fixes from their source, for this reason the file docs/misra/exclude-list.json
+is kept as a source of all these files that are external to the Xen project.
 
-For this reason the file docs/misra/exclude-list.json is used to exclude every
-entry listed in that file from the final report.
-Currently only the cppcheck analysis will use this file.
+Every entry of the file can be linked to different checkers, so that this list
+can be used by multiple scripts selecting only the required entries.
 
 Here is an example of the exclude-list.json file::
 
@@ -20,11 +19,13 @@ Here is an example of the exclude-list.json file::
 |    "content": [
 |        {
 |            "rel_path": "relative/path/from/xen/file",
-|            "comment": "This file is originated from ..."
+|            "comment": "This file is originated from ...",
+|            "checkers": "xen-analysis"
 |        },
 |        {
 |            "rel_path": "relative/path/from/xen/folder/*",
-|            "comment": "This folder is a library"
+|            "comment": "This folder is a library",
+|            "checkers": "xen-analysis some-checker"
 |        },
 |        {
 |            "rel_path": "relative/path/from/xen/mem*.c",
@@ -39,6 +40,12 @@ Here is an explanation of the fields inside an object of the "content" array:
    match more than one file/folder at the time. This field is mandatory.
  - comment: an optional comment to explain why the file is removed from the
    analysis.
+ - checkers: an optional list of checkers that will exclude this entries from
+   their results. This field is optional and when not specified, it means every
+   checker will use that entry.
+   Current implemented values for this field are:
+    - xen-analysis: the xen-analysis.py script exclude this entry for both MISRA
+      and static analysis scan. (Implemented only for Cppcheck tool)
 
 To ease the review and the modifications of the entries, they shall be listed in
 alphabetical order referring to the rel_path field.
diff --git a/xen/scripts/xen_analysis/exclusion_file_list.py b/xen/scripts/xen_analysis/exclusion_file_list.py
index 79ebd34f55ec..8b10665a19e8 100644
--- a/xen/scripts/xen_analysis/exclusion_file_list.py
+++ b/xen/scripts/xen_analysis/exclusion_file_list.py
@@ -9,7 +9,7 @@ class ExclusionFileListError(Exception):
 
 def cppcheck_exclusion_file_list(input_file):
     ret = []
-    excl_list = load_exclusion_file_list(input_file)
+    excl_list = load_exclusion_file_list(input_file, "xen-analysis")
 
     for entry in excl_list:
         # Prepending * to the relative path to match every path where the Xen
@@ -25,7 +25,7 @@ def cppcheck_exclusion_file_list(input_file):
 # If the first entry contained a wildcard '*', the second entry will have an
 # array of the solved absolute path for that entry.
 # Returns [('path',[path,path,...]), ('path',[path,path,...]), ...]
-def load_exclusion_file_list(input_file):
+def load_exclusion_file_list(input_file, checker=""):
     ret = []
     try:
         with open(input_file, "rt") as handle:
@@ -51,6 +51,18 @@ def load_exclusion_file_list(input_file):
             raise ExclusionFileListError(
                 "Malformed JSON entry: rel_path field not found!"
             )
+        # Check the checker field
+        try:
+            entry_checkers = entry['checkers']
+        except KeyError:
+            # If the field doesn't exists, assume that this entry is for every
+            # checker
+            entry_checkers = checker
+
+        # Check if this entry is for the selected checker
+        if checker not in entry_checkers:
+            continue
+
         abs_path = settings.xen_dir + "/" + path
         check_path = [abs_path]
 
-- 
2.34.1


