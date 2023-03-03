Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 737DB6A9446
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 10:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505654.778530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY1se-0001yG-60; Fri, 03 Mar 2023 09:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505654.778530; Fri, 03 Mar 2023 09:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY1se-0001uE-0b; Fri, 03 Mar 2023 09:39:12 +0000
Received: by outflank-mailman (input) for mailman id 505654;
 Fri, 03 Mar 2023 09:39:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YmbX=63=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pY1sc-0001qu-LE
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 09:39:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3ede42d0-b9a7-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 10:39:09 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CAD6150C;
 Fri,  3 Mar 2023 01:39:51 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBFDF3F587;
 Fri,  3 Mar 2023 01:39:06 -0800 (PST)
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
X-Inumbo-ID: 3ede42d0-b9a7-11ed-96af-2f268f93b82a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/3] xen/cppcheck: add a way to exclude files from the scan
Date: Fri,  3 Mar 2023 09:38:54 +0000
Message-Id: <20230303093856.2169227-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303093856.2169227-1-luca.fancellu@arm.com>
References: <20230303093856.2169227-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a way to exclude files from the scan, in this way we can skip
some findings from the report on those files that Xen doesn't own.

To do that, introduce the exclude-list.json file under docs/misra,
this file will be populated with relative path to the files/folder
to be excluded.
Introduce a new module, exclusion_file_list.py, to deal with the
exclusion list file and use the new module in cppcheck_analysis.py
to take a list of excluded paths to update the suppression list of
cppcheck.
Modified --suppress flag for cppcheck tool to remove
unmatchedSuppression findings for those external file that are
listed but for example not built for the current architecture.

Add documentation for the file.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v2:
 - enforce excluded folder path to end with '/*', so update docs
   and drop the code that handled (badly) that case from
   exclusion_file_list.py, __cppcheck_path_exclude_syntax(...)
   (Stefano)
Changes from v1:
 - Indentation fixed (Jan)
---
---
 docs/misra/exclude-list.json                  |  4 ++
 docs/misra/exclude-list.rst                   | 46 ++++++++++++
 xen/scripts/xen_analysis/cppcheck_analysis.py | 20 +++++-
 .../xen_analysis/exclusion_file_list.py       | 70 +++++++++++++++++++
 4 files changed, 138 insertions(+), 2 deletions(-)
 create mode 100644 docs/misra/exclude-list.json
 create mode 100644 docs/misra/exclude-list.rst
 create mode 100644 xen/scripts/xen_analysis/exclusion_file_list.py

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
new file mode 100644
index 000000000000..1fb0ac67747b
--- /dev/null
+++ b/docs/misra/exclude-list.json
@@ -0,0 +1,4 @@
+{
+    "version": "1.0",
+    "content": []
+}
diff --git a/docs/misra/exclude-list.rst b/docs/misra/exclude-list.rst
new file mode 100644
index 000000000000..c97431a86120
--- /dev/null
+++ b/docs/misra/exclude-list.rst
@@ -0,0 +1,46 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Exclude file list for xen-analysis script
+=========================================
+
+The code analysis is performed on the Xen codebase for both MISRA
+checkers and static analysis checkers, there are some files however that
+needs to be removed from the findings report for various reasons (e.g.
+they are imported from external sources, they generate too many false
+positive results, etc.).
+
+For this reason the file docs/misra/exclude-list.json is used to exclude every
+entry listed in that file from the final report.
+Currently only the cppcheck analysis will use this file.
+
+Here is an example of the exclude-list.json file::
+
+|{
+|    "version": "1.0",
+|    "content": [
+|        {
+|            "rel_path": "relative/path/from/xen/file",
+|            "comment": "This file is originated from ..."
+|        },
+|        {
+|            "rel_path": "relative/path/from/xen/folder/*",
+|            "comment": "This folder is a library"
+|        },
+|        {
+|            "rel_path": "relative/path/from/xen/mem*.c",
+|            "comment": "memcpy.c, memory.c and memcmp.c are from the outside"
+|        }
+|    ]
+|}
+
+Here is an explanation of the fields inside an object of the "content" array:
+ - rel_path: it is the relative path from the Xen folder to the file/folder that
+   needs to be excluded from the analysis report, it can contain a wildcard to
+   match more than one file/folder at the time. This field is mandatory.
+ - comment: an optional comment to explain why the file is removed from the
+   analysis.
+
+To ease the review and the modifications of the entries, they shall be listed in
+alphabetical order referring to the rel_path field.
+Excluded folder paths shall end with '/*' in order to match everything on that
+folder.
diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
index cc1f403d315e..e385e2c8f54a 100644
--- a/xen/scripts/xen_analysis/cppcheck_analysis.py
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -1,7 +1,8 @@
 #!/usr/bin/env python3
 
 import os, re, shutil
-from . import settings, utils, cppcheck_report_utils
+from . import settings, utils, cppcheck_report_utils, exclusion_file_list
+from .exclusion_file_list import ExclusionFileListError
 
 class GetMakeVarsPhaseError(Exception):
     pass
@@ -50,6 +51,21 @@ def __generate_suppression_list(out_file):
             # header for cppcheck
             supplist_file.write("*:*generated/compiler-def.h\n")
 
+            try:
+                exclusion_file = \
+                    "{}/docs/misra/exclude-list.json".format(settings.repo_dir)
+                exclusion_list = \
+                    exclusion_file_list.load_exclusion_file_list(exclusion_file)
+            except ExclusionFileListError as e:
+                raise CppcheckDepsPhaseError(
+                    "Issue with reading file {}: {}".format(exclusion_file, e)
+                )
+
+            # Append excluded files to the suppression list, using * as error id
+            # to suppress every findings on that file
+            for path in exclusion_list:
+                supplist_file.write("*:{}\n".format(path))
+
             for entry in headers:
                 filename = entry["file"]
                 try:
@@ -128,7 +144,7 @@ def generate_cppcheck_deps():
  --relative-paths={}
  --inline-suppr
  --suppressions-list={}/suppression-list.txt
- --suppress='unmatchedSuppression:*generated/compiler-def.h'
+ --suppress='unmatchedSuppression:*'
  --include={}/include/xen/config.h
  -DCPPCHECK
 """.format(settings.outdir, CPPCHECK_BUILD_DIR, settings.xen_dir,
diff --git a/xen/scripts/xen_analysis/exclusion_file_list.py b/xen/scripts/xen_analysis/exclusion_file_list.py
new file mode 100644
index 000000000000..871e480586bb
--- /dev/null
+++ b/xen/scripts/xen_analysis/exclusion_file_list.py
@@ -0,0 +1,70 @@
+#!/usr/bin/env python3
+
+import os, glob, json
+from . import settings
+
+class ExclusionFileListError(Exception):
+    pass
+
+
+def __cppcheck_path_exclude_syntax(path):
+    # Prepending * to the relative path to match every path where the Xen
+    # codebase could be
+    path = "*" + path
+
+    return path
+
+
+# Reads the exclusion file list and returns a list of relative path to be
+# excluded.
+def load_exclusion_file_list(input_file):
+    ret = []
+    try:
+        with open(input_file, "rt") as handle:
+            content = json.load(handle)
+            entries = content['content']
+    except json.JSONDecodeError as e:
+        raise ExclusionFileListError(
+                "JSON decoding error in file {}: {}".format(input_file, e)
+        )
+    except KeyError:
+        raise ExclusionFileListError(
+            "Malformed JSON file: content field not found!"
+        )
+    except Exception as e:
+        raise ExclusionFileListError(
+                "Can't open file {}: {}".format(input_file, e)
+        )
+
+    for entry in entries:
+        try:
+            path = entry['rel_path']
+        except KeyError:
+            raise ExclusionFileListError(
+                "Malformed JSON entry: rel_path field not found!"
+            )
+        abs_path = settings.xen_dir + "/" + path
+        check_path = [abs_path]
+
+        # If the path contains wildcards, solve them
+        if '*' in abs_path:
+            check_path = glob.glob(abs_path)
+
+        # Check that the path exists
+        for filepath_object in check_path:
+            if not os.path.exists(filepath_object):
+                raise ExclusionFileListError(
+                    "Malformed path: {} refers to {} that does not exists"
+                    .format(path, filepath_object)
+                )
+
+        if settings.analysis_tool == "cppcheck":
+            path = __cppcheck_path_exclude_syntax(path)
+        else:
+            raise ExclusionFileListError(
+                "Unimplemented for {}!".format(settings.analysis_tool)
+            )
+
+        ret.append(path)
+
+    return ret
-- 
2.34.1


