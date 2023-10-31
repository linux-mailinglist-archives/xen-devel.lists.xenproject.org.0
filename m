Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 604167DCDC0
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625718.975315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiN-00054K-2r; Tue, 31 Oct 2023 13:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625718.975315; Tue, 31 Oct 2023 13:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiM-0004y6-TR; Tue, 31 Oct 2023 13:23:26 +0000
Received: by outflank-mailman (input) for mailman id 625718;
 Tue, 31 Oct 2023 13:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1/u=GN=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qxoiL-0003uy-EU
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:23:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ab0187b6-77f0-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 14:23:24 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F97CDA7;
 Tue, 31 Oct 2023 06:24:05 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9171F3F738;
 Tue, 31 Oct 2023 06:23:22 -0700 (PDT)
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
X-Inumbo-ID: ab0187b6-77f0-11ee-98d6-6d05b1d4d9a1
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH v2 5/8] [WIP]codestyle.py: Protect generic piece of code
Date: Tue, 31 Oct 2023 13:23:01 +0000
Message-Id: <20231031132304.2573924-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031132304.2573924-1-luca.fancellu@arm.com>
References: <20231031132304.2573924-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a way to protect generic piece of code from being formatted.

Use the exclude-list to pass also a structure to the scripts,
that structure will be used from the codestyle.py script to
understand which piece of code of which file needs to be left
with the original format.

Update exclude-list.rst documentation.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misra/exclude-list.rst                   |  6 +-
 xen/scripts/codestyle.py                      | 96 ++++++++++++-------
 .../xen_analysis/exclusion_file_list.py       | 15 ++-
 3 files changed, 76 insertions(+), 41 deletions(-)

diff --git a/docs/misra/exclude-list.rst b/docs/misra/exclude-list.rst
index ade314100663..946f3793aad7 100644
--- a/docs/misra/exclude-list.rst
+++ b/docs/misra/exclude-list.rst
@@ -25,7 +25,8 @@ Here is an example of the exclude-list.json file::
 |        {
 |            "rel_path": "relative/path/from/xen/folder/*",
 |            "comment": "This folder is a library",
-|            "checkers": "xen-analysis some-checker"
+|            "checkers": "xen-analysis some-checker",
+|            "xen-analysis": {...}
 |        },
 |        {
 |            "rel_path": "relative/path/from/xen/mem*.c",
@@ -48,6 +49,9 @@ Here is an explanation of the fields inside an object of the "content" array:
       and static analysis scan. (Implemented only for Cppcheck tool)
     - codestyle: the codestyle.py script exclude this entry from the formatting
       tool.
+ - <checker>: an optional parameter to pass a configuration to the checker about
+   this entry. The parameter to be specified is one of the value listed for the
+   "checkers" value.
 
 To ease the review and the modifications of the entries, they shall be listed in
 alphabetical order referring to the rel_path field.
diff --git a/xen/scripts/codestyle.py b/xen/scripts/codestyle.py
index ab3df66fc2e2..92482d586f7a 100755
--- a/xen/scripts/codestyle.py
+++ b/xen/scripts/codestyle.py
@@ -36,36 +36,36 @@ def action_protect_asm(filename, file_lines, protect):
     opening_asm = False
     cf_off_comment = '/* clang-format off */'
     cf_on_comment = '/* clang-format on */'
-    asm_stx = '(?:asm|__asm__)(?:\s(?:volatile|__volatile__))?\s?\('
-    asm_stx_close = ');'
+
+    config = filename[1]["protect"]
 
     if protect:
         # Look for closing parenthesis with semicolon ');'
-        closing_asm_rgx_rule = rf'^.*{re.escape(asm_stx_close)}.*$'
+        closing_asm_rgx_rule = lambda cl_stx: rf'^.*{re.escape(cl_stx)}.*$'
         # Look for opening asm syntax
-        opening_asm_rgx_rule = rf'^\s*{asm_stx}.*$'
+        opening_asm_rgx_rule = lambda op_stx: rf'^\s*{op_stx}.*$'
         macro_start_rgx_rule = r'^\s?#\s?define.*\\$'
-        opening_asm_find = rf'({asm_stx})'
+        opening_asm_find = lambda op_stx: rf'({op_stx})'
         opening_asm_replace = cf_off_comment + r'\1'
         opening_def_find = r'#\s?define'
         opening_def_replace = f'{cf_off_comment}#define'
-        closing_asm_find    = re.escape(asm_stx_close)
-        closing_asm_replace = asm_stx_close + cf_on_comment
+        closing_asm_find    = lambda cl_stx: re.escape(cl_stx)
+        closing_asm_replace = lambda cl_stx: cl_stx + cf_on_comment
         closing_def_find    = '\n'
         closing_def_replace = cf_on_comment + '\n'
     else:
         # Look for closing parenthesis with semicolon ');' and with the
         # special clang-format comment
-        closing_asm_rgx_rule = \
-            rf'^.*{re.escape(asm_stx_close)}.*{re.escape(cf_on_comment)}.*$'
+        closing_asm_rgx_rule = lambda cl_stx: \
+            rf'^.*{re.escape(cl_stx)}.*{re.escape(cf_on_comment)}.*$'
         # Look for opening asm syntax preceded by the special clang-format
         # comment, the comment is optional to generalise the algorithm to
         # un-protect asm outside and inside macros. The case outside is easy
         # because we will find '/* clang-format off */asm', instead the case
         # inside is more tricky and we are going to find only 'asm' and then
         # go backwards until we find '/* clang-format off */#define'
-        opening_asm_rgx_rule = \
-            rf'^\s*({re.escape(cf_off_comment)})?{asm_stx}.*$'
+        opening_asm_rgx_rule = lambda op_stx: \
+            rf'^\s*({re.escape(cf_off_comment)})?{op_stx}.*$'
         # Look for the define just before the asm invocation, here we look for
         # '/* clang-format off */#define' or '#define', this is to handle a rare
         # corner case where an asm invocation is inside a macro, but was not
@@ -76,24 +76,27 @@ def action_protect_asm(filename, file_lines, protect):
         # comments, but at least the tool won't complain
         macro_start_rgx_rule = \
             rf'^\s?(?:{re.escape(cf_off_comment)})?#\s?define.*\\$'
-        opening_asm_find = rf'({re.escape(cf_off_comment)}({asm_stx}))'
+        opening_asm_find = \
+            lambda op_stx: rf'({re.escape(cf_off_comment)}({op_stx}))'
         opening_asm_replace = r'\2'
         opening_def_find = rf'(?:{re.escape(cf_off_comment)})?#\s?define'
         opening_def_replace = '#define'
-        closing_asm_find \
-            = rf'{re.escape(asm_stx_close)}.*{re.escape(cf_on_comment)}'
-        closing_asm_replace = asm_stx_close
+        closing_asm_find = lambda cl_stx: \
+            rf'{re.escape(cl_stx)}.*{re.escape(cf_on_comment)}'
+        closing_asm_replace = lambda cl_stx: cl_stx
         closing_def_find    = cf_on_comment + '\n'
         closing_def_replace = '\n'
 
-    opening_asm_rgx = re.compile(opening_asm_rgx_rule)
-    closing_asm_rgx = re.compile(closing_asm_rgx_rule)
+    closing_asm_rgx = None
     macro_start_rgx = re.compile(macro_start_rgx_rule)
+    regx_open = ""
+    regx_close = ""
 
     i = 0
     i_max = len(file_lines)
     macro_begin = -1
     while i < i_max:
+        opening_match = False
         # Keep track of the last define we found
         if macro_start_rgx.match(file_lines[i]):
             macro_begin = i
@@ -101,7 +104,17 @@ def action_protect_asm(filename, file_lines, protect):
         # touch asm syntax inside macros that usually have the line ended by
         # a backslash, this is because insert stuff in them will have issues
         # when later clang-format will format the macro itself
-        if (not opening_asm) and opening_asm_rgx.match(file_lines[i]):
+        if (not opening_asm):
+            for elem in config:
+                regx_open = elem["syntax_opening"]
+                if re.match(opening_asm_rgx_rule(regx_open), file_lines[i]):
+                    regx_close = elem["syntax_closing"]
+                    closing_asm_rgx = \
+                        re.compile(closing_asm_rgx_rule(regx_close))
+                    opening_match = True
+                    break
+
+        if (not opening_asm) and opening_match:
             line_before = (i > 0) and file_lines[i-1].endswith('\\\n')
             if file_lines[i].endswith('\\\n') or line_before:
                 # This should never happen, but if it does, it means an
@@ -109,7 +122,7 @@ def action_protect_asm(filename, file_lines, protect):
                 if macro_begin < 0:
                     raise Exception("Begin of macro not found in {}\n"
                                     "The asm invocation is on line {}"
-                                    .format(filename, i))
+                                    .format(filename[0], i))
 
                 # asm invocation inside macro, need to protect the entire macro,
                 # macro_begin should point to this define
@@ -148,14 +161,15 @@ def action_protect_asm(filename, file_lines, protect):
             else:
                 # asm invocation is not inside a macro, protect the asm syntax
                 opening_asm = True
-                file_lines[i] = re.sub(opening_asm_find, opening_asm_replace,
-                                       file_lines[i])
+                file_lines[i] = re.sub(opening_asm_find(regx_open),
+                                       opening_asm_replace, file_lines[i])
 
         # Try to find in the current line the asm closing syntax, only if a
         # previous line already found an opening asm syntax
         if opening_asm and closing_asm_rgx.match(file_lines[i]):
             opening_asm = False
-            file_lines[i] = re.sub(closing_asm_find, closing_asm_replace,
+            file_lines[i] = re.sub(closing_asm_find(regx_close),
+                                   closing_asm_replace(regx_close),
                                    file_lines[i])
 
         i += 1
@@ -163,7 +177,7 @@ def action_protect_asm(filename, file_lines, protect):
     # This should never happen, but if it does, it means an unexpected syntax
     # is found in the file
     if opening_asm:
-        raise Exception("Unbalanced asm parenthesis in {}".format(filename))
+        raise Exception("Unbalanced asm parenthesis in {}".format(filename[0]))
 
     return file_lines
 
@@ -180,19 +194,19 @@ def stage(filename, actions):
         return
 
     try:
-        with open(filename, "rt") as infile:
+        with open(filename[0], "rt") as infile:
             file_lines = infile.readlines()
     except OSError as e:
-        raise Exception("Issue with reading file {}: {}".format(filename, e))
+        raise Exception("Issue with reading file {}: {}".format(filename[0], e))
 
     for task in actions:
         file_lines = task(filename, file_lines)
 
     try:
-        with open(filename, "wt") as outfile:
+        with open(filename[0], "wt") as outfile:
             outfile.writelines(file_lines)
     except OSError as e:
-        raise Exception("Issue writing file {}: {}".format(filename, e))
+        raise Exception("Issue writing file {}: {}".format(filename[0], e))
 
 
 def main(argv):
@@ -236,27 +250,37 @@ def main(argv):
 
     # Transform the lists of absolute path in the second element of the
     # exclusion_list into a plain list of absolute path to be exluded
-    excluded_c_files = [j for i in exclusion_list for j in i[1]]
+    excluded_c_files = [(j, i[2]) for i in exclusion_list for j in i[1]]
 
     file_to_format = []
+    default_config = {
+        "syntax_opening": "(?:asm|__asm__)(?:\s(?:volatile|__volatile__))?\s?\(",
+        "syntax_closing": ");"
+    }
     for file in c_files:
         add_to_list = True
+        cfg = {"protect": [default_config]}
         for excl in excluded_c_files:
-            if excl in file:
-                add_to_list = False
+            if excl[0] in file:
+                if excl[1] is not None and "protect" in excl[1]:
+                    excl[1]["protect"].append(default_config)
+                    cfg = excl[1]
+                else:
+                    add_to_list = False
                 break
         if add_to_list:
-            file_to_format.append(file)
+            file_to_format.append((file, cfg))
         elif len_args > 0:
             print("ERROR: file {} is excluded!".format(file))
             sys.exit(1)
 
-    for file in file_to_format:
+    for file_entry in file_to_format:
         try:
-            stage(file, pre_stage_actions)
-            utils.invoke_command("clang-format -i {}".format(file), False,
-                                 Exception, "Error occured invoking: {}\n")
-            stage(file, post_stage_actions)
+            stage(file_entry, pre_stage_actions)
+            utils.invoke_command("clang-format -i {}".format(file_entry[0]),
+                                 False, Exception,
+                                 "Error occured invoking: {}\n")
+            stage(file_entry, post_stage_actions)
         except Exception as e:
             print("ERROR: {}\n".format(e))
 
diff --git a/xen/scripts/xen_analysis/exclusion_file_list.py b/xen/scripts/xen_analysis/exclusion_file_list.py
index 8b10665a19e8..340c25f876fd 100644
--- a/xen/scripts/xen_analysis/exclusion_file_list.py
+++ b/xen/scripts/xen_analysis/exclusion_file_list.py
@@ -20,11 +20,12 @@ def cppcheck_exclusion_file_list(input_file):
 
 
 # Reads the exclusion file list and returns an array containing a set where the
-# first entry is what was listed in the exclusion list file, and the second
-# entry is the absolute path of the first entry.
+# first entry is what was listed in the exclusion list file, the second
+# entry is the absolute path of the first entry, the third entry is a checker
+# specific configuration if provided otherwise it will be None.
 # If the first entry contained a wildcard '*', the second entry will have an
 # array of the solved absolute path for that entry.
-# Returns [('path',[path,path,...]), ('path',[path,path,...]), ...]
+# Returns [('path',[path,path,...],<obj>), ('path',[path,path,...],<obj>), ...]
 def load_exclusion_file_list(input_file, checker=""):
     ret = []
     try:
@@ -63,6 +64,12 @@ def load_exclusion_file_list(input_file, checker=""):
         if checker not in entry_checkers:
             continue
 
+        # Get checker specific configuration if any
+        try:
+            checker_config = entry[checker] if checker != "" else None
+        except KeyError:
+            checker_config = None
+
         abs_path = settings.xen_dir + "/" + path
         check_path = [abs_path]
 
@@ -78,6 +85,6 @@ def load_exclusion_file_list(input_file, checker=""):
                     .format(path, filepath_object)
                 )
 
-        ret.append((path, check_path))
+        ret.append((path, check_path, checker_config))
 
     return ret
-- 
2.34.1


