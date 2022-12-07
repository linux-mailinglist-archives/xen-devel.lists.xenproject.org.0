Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96BE645A6B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 14:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456300.714085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2u8w-0004mD-EJ; Wed, 07 Dec 2022 13:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456300.714085; Wed, 07 Dec 2022 13:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2u8w-0004ia-AA; Wed, 07 Dec 2022 13:07:22 +0000
Received: by outflank-mailman (input) for mailman id 456300;
 Wed, 07 Dec 2022 13:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbZ5=4F=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p2u8t-0004EJ-MP
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 13:07:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 12de07bd-7630-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 14:07:16 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E84E6ED1;
 Wed,  7 Dec 2022 05:07:22 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB9CD3F73D;
 Wed,  7 Dec 2022 05:07:14 -0800 (PST)
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
X-Inumbo-ID: 12de07bd-7630-11ed-91b6-6bf2151ebd3b
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
Subject: [PATCH v3 2/5] xen/scripts: add cppcheck tool to the xen-analysis.py script
Date: Wed,  7 Dec 2022 13:07:01 +0000
Message-Id: <20221207130704.20573-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207130704.20573-1-luca.fancellu@arm.com>
References: <20221207130704.20573-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Cppcheck analysis to the xen-analysis.py script using the
arguments --run-cppcheck.

Now cppcheck analysis will build Xen while the analysis is performed
on the source files, it will produce a text report and an additional
html output when the script is called with --cppcheck-html.

With this patch cppcheck will benefit of platform configuration files
that will help it to understand the target of the compilation and
improve the analysis. These are XML files placed in
xen/tools/cppcheck-plat/, describing to cppcheck the length of basic
types to help it in the analysis.

To do so:
 - Update xen-analysis.py with the code to integrate cppcheck.
 - add platform configuration files for cppcheck..
 - add cppcheck-cc.sh script that is a wrapper for cppcheck and it's
   used as Xen compiler, it will intercept all flags given from the
   make build system and it will execute cppcheck on the compiled
   file together with the file compilation.
 - guarded hypercall-defs.c with CPPCHECK define because cppcheck
   gets confused as the file does not contain c code.
 - add false-positive-cppcheck.json file
 - update documentation.
 - update .gitignore

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3 changes:
 - used right argument on echo command in cppcheck-cc.sh (Stefano)
 - improved help in the script, now --build-only will generate
   also cppcheck report when cppcheck is called (Stefano)
 - add a comment in documenting-violation.rst to show how to locate
   the proprietary violation id of cppcheck in its reports (Stefano)
v2 changes:
 - changes to commit message (Jan)
 - changes to the cppcheck-cc.sh script and on
   platform XML files, fixed version handling
   in cppcheck_analysis.py (Stefano)
 - Move revert of Makefile and xen/tools/merge_cppcheck_reports.py
   to the following patch, modified .gitignore to handle the
   presence of both Makefile invoked cppcheck and this new method
   (Stefano)
---
---
 .gitignore                                    |   6 +
 docs/misra/cppcheck.txt                       |  27 +-
 docs/misra/documenting-violations.rst         |  27 +-
 docs/misra/false-positive-cppcheck.json       |  12 +
 docs/misra/xen-static-analysis.rst            |  42 ++-
 xen/include/hypercall-defs.c                  |   9 +
 xen/scripts/xen-analysis.py                   |  18 +-
 xen/scripts/xen_analysis/cppcheck_analysis.py | 273 ++++++++++++++++++
 .../xen_analysis/cppcheck_report_utils.py     | 130 +++++++++
 xen/scripts/xen_analysis/generic_analysis.py  |   9 +-
 xen/scripts/xen_analysis/settings.py          |  88 +++++-
 xen/tools/cppcheck-cc.sh                      | 223 ++++++++++++++
 xen/tools/cppcheck-plat/arm32-wchar_t4.xml    |  17 ++
 xen/tools/cppcheck-plat/arm64-wchar_t2.xml    |  17 ++
 xen/tools/cppcheck-plat/x86_64-wchar_t2.xml   |  17 ++
 15 files changed, 864 insertions(+), 51 deletions(-)
 create mode 100644 docs/misra/false-positive-cppcheck.json
 create mode 100644 xen/scripts/xen_analysis/cppcheck_analysis.py
 create mode 100644 xen/scripts/xen_analysis/cppcheck_report_utils.py
 create mode 100755 xen/tools/cppcheck-cc.sh
 create mode 100644 xen/tools/cppcheck-plat/arm32-wchar_t4.xml
 create mode 100644 xen/tools/cppcheck-plat/arm64-wchar_t2.xml
 create mode 100644 xen/tools/cppcheck-plat/x86_64-wchar_t2.xml

diff --git a/.gitignore b/.gitignore
index f5a66f6194dd..39efe2933a33 100644
--- a/.gitignore
+++ b/.gitignore
@@ -8,8 +8,11 @@
 *.d
 *.d2
 *.c.cppcheck
+*.cppcheck.txt
+*.cppcheck.xml
 *.opic
 *.a
+*.c.json
 *.safparse
 *.so
 *.so.[0-9]*
@@ -282,9 +285,11 @@ xen/arch/*/efi/efi.h
 xen/arch/*/efi/pe.c
 xen/arch/*/efi/runtime.c
 xen/arch/*/include/asm/asm-offsets.h
+xen/build-dir-cppcheck/
 xen/common/config_data.S
 xen/common/config.gz
 xen/cppcheck-htmlreport/
+xen/cppcheck-report/
 xen/cppcheck-misra.*
 xen/include/headers*.chk
 xen/include/compat/*
@@ -315,6 +320,7 @@ xen/xsm/flask/xenpolicy-*
 tools/flask/policy/policy.conf
 tools/flask/policy/xenpolicy-*
 xen/xen
+xen/suppression-list.txt
 xen/xen-cppcheck.xml
 xen/xen-syms
 xen/xen-syms.map
diff --git a/docs/misra/cppcheck.txt b/docs/misra/cppcheck.txt
index 25d8c3050b72..f7b9f678b4d5 100644
--- a/docs/misra/cppcheck.txt
+++ b/docs/misra/cppcheck.txt
@@ -3,8 +3,7 @@ Cppcheck for Xen static and MISRA analysis
 
 Xen can be analysed for both static analysis problems and MISRA violation using
 cppcheck, the open source tool allows the creation of a report with all the
-findings. Xen has introduced the support in the Makefile so it's very easy to
-use and in this document we can see how.
+findings.
 
 The minimum version required for cppcheck is 2.7. Note that at the time of
 writing (June 2022), the version 2.8 is known to be broken [1].
@@ -38,27 +37,7 @@ Dependencies are listed in the readme.md of the project repository.
 Use cppcheck to analyse Xen
 ===========================
 
-Using cppcheck integration is very simple, it requires few steps:
-
- 1) Compile Xen
- 2) call the cppcheck make target to generate a report in xml format:
-    make CPPCHECK_MISRA=y cppcheck
- 3) call the cppcheck-html make target to generate a report in xml and html
-    format:
-    make CPPCHECK_MISRA=y cppcheck-html
-
-    In case the cppcheck binaries are not in the PATH, CPPCHECK and
-    CPPCHECK_HTMLREPORT variables can be overridden with the full path to the
-    binaries:
-
-    make -C xen \
-        CPPCHECK=/path/to/cppcheck \
-        CPPCHECK_HTMLREPORT=/path/to/cppcheck-htmlreport \
-        CPPCHECK_MISRA=y \
-        cppcheck-html
-
-The output is by default in a folder named cppcheck-htmlreport, but the name
-can be changed by passing it in the CPPCHECK_HTMLREPORT_OUTDIR variable.
-
+To analyse Xen using cppcheck, please refer to the document
+xen-static-analysis.rst, section "Analyse Xen with Cppcheck".
 
 [1] https://sourceforge.net/p/cppcheck/discussion/general/thread/bfc3ab6c41/?limit=25
diff --git a/docs/misra/documenting-violations.rst b/docs/misra/documenting-violations.rst
index 1d23447556d2..0d02a8e6f905 100644
--- a/docs/misra/documenting-violations.rst
+++ b/docs/misra/documenting-violations.rst
@@ -51,6 +51,7 @@ Here is an example to add a new justification in safe.json::
 |        {
 |            "id": "SAF-0-safe",
 |            "analyser": {
+|                "cppcheck": "misra-c2012-20.7",
 |                "coverity": "misra_c_2012_rule_20_7_violation",
 |                "eclair": "MC3R1.R20.7"
 |            },
@@ -77,9 +78,9 @@ Here is an explanation of the fields inside an object of the "content" array:
    It tells the tool to substitute a Xen in-code comment having this structure:
    /* SAF-0-safe [...] \*/
  - analyser: it is an object containing pair of key-value strings, the key is
-   the analyser, so it can be coverity or eclair, the value is the proprietary
-   id corresponding on the finding, for example when coverity is used as
-   analyser, the tool will translate the Xen in-code coment in this way:
+   the analyser, so it can be cppcheck, coverity or eclair, the value is the
+   proprietary id corresponding on the finding, for example when coverity is
+   used as analyser, the tool will translate the Xen in-code coment in this way:
    /* SAF-0-safe [...] \*/ -> /* coverity[misra_c_2012_rule_20_7_violation] \*/
    if the object doesn't have a key-value, then the corresponding in-code
    comment won't be translated.
@@ -189,3 +190,23 @@ the same line and the same "violation ID".
 
 Also, the same tag can be used on other symbols from the linker that are
 declared in the codebase, because the justification holds for them too.
+
+A possible violation found by Cppcheck can be handled in the same way, from the
+cppcheck text report it is possible to identify the violation id:
+
+| include/public/arch-arm.h(226,0):misra-c2012-20.7:style:Expressions resulting from the expansion of macro parameters shall be enclosed in parentheses (Misra rule 20.7)
+
+The violation id can be located also in the HTML report, opening index.html from
+the browser, the violations can be filtered by id in the left side panel, under
+the column "Defect ID". On the right there will be a list of files with the type
+of violation and the violation line number, for the same violation above, there
+will be an entry like the following and the violation id will be in the column
+"Id":
+
+| include/public/arch-arm.h
+| [...]
+| 226 misra-c2012-20.7  style Expressions resulting from the expansion of macro parameters shall be enclosed in parentheses (Misra rule 20.7)
+| [...]
+
+Given the violation id "misra-c2012-20.7", the procedure above can be followed
+to justify this finding.
diff --git a/docs/misra/false-positive-cppcheck.json b/docs/misra/false-positive-cppcheck.json
new file mode 100644
index 000000000000..5d4da2ce6170
--- /dev/null
+++ b/docs/misra/false-positive-cppcheck.json
@@ -0,0 +1,12 @@
+{
+    "version": "1.0",
+    "content": [
+        {
+            "id": "SAF-0-false-positive-cppcheck",
+            "violation-id": "",
+            "tool-version": "",
+            "name": "Sentinel",
+            "text": "Next ID to be used"
+        }
+    ]
+}
diff --git a/docs/misra/xen-static-analysis.rst b/docs/misra/xen-static-analysis.rst
index 5b886474d4a0..2712255db1b0 100644
--- a/docs/misra/xen-static-analysis.rst
+++ b/docs/misra/xen-static-analysis.rst
@@ -7,9 +7,8 @@ The Xen codebase integrates some scripts and tools that helps the developer to
 perform static analysis of the code, currently Xen supports three analysis tool
 that are eclair, coverity and cppcheck.
 The Xen tree has a script (xen-analysis.py) available to ease the analysis
-process and it integrates a way to suppress findings on these tools (only Eclair
-and Coverity are currently supported by the script), please check the
-documenting-violation.rst document to know more about it.
+process and it integrates a way to suppress findings on these tools, please
+check the documenting-violation.rst document to know more about it.
 
 Analyse Xen with Coverity or Eclair
 -----------------------------------
@@ -52,3 +51,40 @@ When invoking the script, the procedure below will be followed:
     this step, call the script adding the --no-clean argument, but before
     running again the script, call it with the --clean-only argument, that will
     execute only this cleaning step.
+
+
+Analyse Xen with Cppcheck
+-------------------------
+
+Cppcheck tool is integrated in xen-analysis.py script, when using the script,
+the tool will be called on every source file compiled by the make build system.
+Here how to start the analysis with Cppcheck:
+
+ - xen-analysis.py --run-cppcheck [--cppcheck-misra] [--cppcheck-html] --
+   [optional make arguments]
+
+The command above tells the script to prepare the codebase and use Cppcheck tool
+for the analysis.
+The optional argument --cppcheck-misra activates the analysis also for MISRA
+compliance.
+The optional argument --cppcheck-html instruct cppcheck to produce an additional
+HTML report.
+
+When invoking the script for Cppcheck analysis, the followed procedure is
+similar to the one above for Coverity or Eclair, but it has some additional
+steps:
+
+ 1. This step is the same as step 1 for Coverity/Eclair.
+ 2. The cppcheck dependency are created, build directory for cppcheck analysis
+    and an header file containing internal compiler macro
+    (include/generated/compiler-def.h) are generated
+ 3. Xen compilation starts using every <additional make parameters> supplied
+    at the script invocation, but because cppcheck is not able to intercept the
+    compiled files and flags on compiler invocation, a script (cppcheck-cc.sh)
+    is passed as CC to the make system, it is a wrapper for the compiler that
+    will also execute cppcheck on every compiled file.
+ 4. After the compilation and analysis, the cppcheck report will be created
+    putting together all the cppcheck report fragments for every analysed file.
+    Cppcheck will produce a text fragment and an additional XML report fragment
+    if the script is configured to produce the HTML output.
+ 5. This step is the same as step 3 for Coverity/Eclair.
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 189612107402..41e1af01f6b2 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -60,6 +60,13 @@
  * are possible.
  */
 
+/*
+ * Cppcheck thinks this file needs to be analysed because it is preprocessed by
+ * the compiler, but it gets confused because this file does not contains C
+ * code. Hence protect the code when CPPCHECK is used.
+ */
+#ifndef CPPCHECK
+
 #ifdef CONFIG_HVM
 #define PREFIX_hvm hvm
 #else
@@ -288,3 +295,5 @@ mca                                do       do       -        -        -
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 paging_domctl_cont                 do       do       do       do       -
 #endif
+
+#endif /* !CPPCHECK */
diff --git a/xen/scripts/xen-analysis.py b/xen/scripts/xen-analysis.py
index b5d9ef1862c9..8e50c27cd898 100755
--- a/xen/scripts/xen-analysis.py
+++ b/xen/scripts/xen-analysis.py
@@ -1,28 +1,42 @@
 #!/usr/bin/env python3
 
 import sys
-from xen_analysis import settings, generic_analysis
+from xen_analysis import settings, generic_analysis, cppcheck_analysis
 from xen_analysis.generic_analysis import *
+from xen_analysis.cppcheck_analysis import *
+
+PhaseExceptions = (GetMakeVarsPhaseError, ParseTagPhaseError,
+                   CppcheckDepsPhaseError, BuildPhaseError,
+                   CppcheckReportPhaseError)
 
 
 def main(argv):
     ret_code = 0
     settings.parse_commandline(argv)
     try:
+        if settings.step_get_make_vars:
+            cppcheck_analysis.get_make_vars()
         if settings.step_parse_tags:
             generic_analysis.parse_xen_tags()
+        if settings.step_cppcheck_deps:
+            cppcheck_analysis.generate_cppcheck_deps()
         if settings.step_build_xen:
             generic_analysis.build_xen()
-    except (ParseTagPhaseError, BuildPhaseError) as e:
+        if settings.step_cppcheck_report:
+            cppcheck_analysis.generate_cppcheck_report()
+    except PhaseExceptions as e:
         print("ERROR: {}".format(e))
         if hasattr(e, "errorcode"):
             ret_code = e.errorcode
     finally:
         if settings.step_clean_analysis:
+            cppcheck_analysis.clean_analysis_artifacts()
             e = generic_analysis.clean_analysis_artifacts()
             if e:
                 print("ERROR: {}".format(e))
                 ret_code = 1
+        if settings.step_distclean_analysis:
+            cppcheck_analysis.clean_reports()
 
     sys.exit(ret_code)
 
diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
new file mode 100644
index 000000000000..0e952a169641
--- /dev/null
+++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
@@ -0,0 +1,273 @@
+#!/usr/bin/env python3
+
+import os, re, shutil
+from . import settings, utils, cppcheck_report_utils
+
+class GetMakeVarsPhaseError(Exception):
+    pass
+
+class CppcheckDepsPhaseError(Exception):
+    pass
+
+class CppcheckReportPhaseError(Exception):
+    pass
+
+CPPCHECK_BUILD_DIR = "build-dir-cppcheck"
+CPPCHECK_HTMLREPORT_OUTDIR = "cppcheck-htmlreport"
+CPPCHECK_REPORT_OUTDIR = "cppcheck-report"
+cppcheck_extra_make_args = ""
+xen_cc = ""
+
+def get_make_vars():
+    global xen_cc
+    invoke_make = utils.invoke_command(
+            "make -C {} {} export-variable-CC"
+                .format(settings.xen_dir, settings.make_forward_args),
+            True, GetMakeVarsPhaseError,
+            "Error occured retrieving make vars:\n{}"
+        )
+
+    cc_var_regex = re.search('^CC=(.*)$', invoke_make, flags=re.M)
+    if cc_var_regex:
+        xen_cc = cc_var_regex.group(1)
+
+    if xen_cc == "":
+        raise GetMakeVarsPhaseError("CC variable not found in Xen make output")
+
+
+def __generate_suppression_list(out_file):
+    # The following lambda function will return a file if it contains lines with
+    # a comment containing "cppcheck-suppress[*]" on a single line.
+    grep_action = lambda x: utils.grep(x,
+                    r'^[ \t]*/\* cppcheck-suppress\[(.*)\] \*/$')
+    # Look for a list of .h files that matches the condition above
+    headers = utils.recursive_find_file(settings.xen_dir, r'.*\.h$',
+                                        grep_action)
+
+    try:
+        with open(out_file, "wt") as supplist_file:
+            # Add this rule to skip every finding in the autogenerated
+            # header for cppcheck
+            supplist_file.write("*:*generated/compiler-def.h\n")
+
+            for entry in headers:
+                filename = entry["file"]
+                try:
+                    with open(filename, "rt") as infile:
+                        header_content = infile.readlines()
+                except OSError as e:
+                    raise CppcheckDepsPhaseError(
+                            "Issue with reading file {}: {}"
+                                .format(filename, e)
+                          )
+                header_lines_len = len(header_content)
+                # line_num in entry will be header_content[line_num-1], here we
+                # are going to search the first line after line_num that have
+                # anything different from comments or empty line, because the
+                # in-code comment suppression is related to that line then.
+                for line_num in entry["matches"]:
+                    cppcheck_violation_id = ""
+                    tmp_line = line_num
+                    # look up to which line is referring the comment at
+                    # line_num (which would be header_content[tmp_line-1])
+                    comment_section = False
+                    while tmp_line < header_lines_len:
+                        line = header_content[tmp_line]
+                        # Matches a line with just optional spaces/tabs and the
+                        # start of a comment '/*'
+                        comment_line_starts = re.match('^[ \t]*/\*.*$', line)
+                        # Matches a line with text and the end of a comment '*/'
+                        comment_line_stops = re.match('^.*\*/$', line)
+                        if (not comment_section) and comment_line_starts:
+                            comment_section = True
+                        if (len(line.strip()) != 0) and (not comment_section):
+                            cppcheck_violation_id = entry["matches"][line_num][0]
+                            break
+                        if comment_section and comment_line_stops:
+                            comment_section = False
+                        tmp_line = tmp_line + 1
+
+                    if cppcheck_violation_id == "":
+                        raise CppcheckDepsPhaseError(
+                            "Error matching cppcheck comment in {} at line {}."
+                                .format(filename, line_num)
+                          )
+                    # Write [error id]:[filename]:[line]
+                    # tmp_line refers to the array index, so translated to the
+                    # file line (that begins with 1) it is tmp_line+1
+                    supplist_file.write(
+                            "{}:{}:{}\n".format(cppcheck_violation_id, filename,
+                                                (tmp_line + 1))
+                        )
+    except OSError as e:
+        raise CppcheckDepsPhaseError("Issue with writing file {}: {}"
+                                     .format(out_file, e))
+
+
+def generate_cppcheck_deps():
+    global cppcheck_extra_make_args
+
+    # Compile flags to pass to cppcheck:
+    # - include config.h as this is passed directly to the compiler.
+    # - define CPPCHECK as we use it to disable or enable some specific part of
+    #   the code to solve some cppcheck issues.
+    # - explicitely enable some cppcheck checks as we do not want to use "all"
+    #   which includes unusedFunction which gives wrong positives as we check
+    #   file per file.
+    # - Explicitly suppress warnings on compiler-def.h because cppcheck throws
+    #   an unmatchedSuppression due to the rule we put in suppression-list.txt
+    #   to skip every finding in the file.
+    #
+    # Compiler defines are in compiler-def.h which is included in config.h
+    #
+    cppcheck_flags="""
+--cppcheck-build-dir={}/{}
+ --max-ctu-depth=10
+ --enable=style,information,missingInclude
+ --template=\'{{file}}({{line}},{{column}}):{{id}}:{{severity}}:{{message}}\'
+ --relative-paths={}
+ --inline-suppr
+ --suppressions-list={}/suppression-list.txt
+ --suppress='unmatchedSuppression:*generated/compiler-def.h'
+ --include={}/include/xen/config.h
+ -DCPPCHECK
+""".format(settings.outdir, CPPCHECK_BUILD_DIR, settings.xen_dir,
+           settings.outdir, settings.xen_dir)
+
+    invoke_cppcheck = utils.invoke_command(
+            "{} --version".format(settings.cppcheck_binpath),
+            True, CppcheckDepsPhaseError,
+            "Error occured retrieving cppcheck version:\n{}\n\n{}"
+        )
+
+    version_regex = re.search('^Cppcheck (.*)$', invoke_cppcheck, flags=re.M)
+    # Currently, only cppcheck version >= 2.7 is supported, but version 2.8 is
+    # known to be broken, please refer to docs/misra/cppcheck.txt
+    if (not version_regex) or (not version_regex.group(1).startswith("2.7")):
+        raise CppcheckDepsPhaseError(
+                "Can't find cppcheck version or version is not 2.7"
+              )
+
+    # If misra option is selected, append misra addon and generate cppcheck
+    # files for misra analysis
+    if settings.cppcheck_misra:
+        cppcheck_flags = cppcheck_flags + " --addon=cppcheck-misra.json"
+
+        utils.invoke_command(
+            "{}/convert_misra_doc.py -i {}/docs/misra/rules.rst"
+            " -o {}/cppcheck-misra.txt -j {}/cppcheck-misra.json"
+                .format(settings.tools_dir, settings.repo_dir,
+                        settings.outdir, settings.outdir),
+            False, CppcheckDepsPhaseError,
+            "An error occured when running:\n{}"
+        )
+
+    # Generate compiler macros
+    os.makedirs("{}/include/generated".format(settings.outdir), exist_ok=True)
+    utils.invoke_command(
+            "{} -dM -E -o \"{}/include/generated/compiler-def.h\" - < /dev/null"
+                .format(xen_cc, settings.outdir),
+            False, CppcheckDepsPhaseError,
+            "An error occured when running:\n{}"
+        )
+
+    # Generate cppcheck suppression list
+    __generate_suppression_list(
+        "{}/suppression-list.txt".format(settings.outdir))
+
+    # Generate cppcheck build folder
+    os.makedirs("{}/{}".format(settings.outdir, CPPCHECK_BUILD_DIR),
+                exist_ok=True)
+
+    cppcheck_cc_flags = """--compiler={} --cppcheck-cmd={} {}
+ --cppcheck-plat={}/cppcheck-plat --ignore-path=tools/
+ --ignore-path=arch/x86/efi/check.c
+""".format(xen_cc, settings.cppcheck_binpath, cppcheck_flags,
+           settings.tools_dir)
+
+    if settings.cppcheck_html:
+        cppcheck_cc_flags = cppcheck_cc_flags + " --cppcheck-html"
+
+    # Generate the extra make argument to pass the cppcheck-cc.sh wrapper as CC
+    cppcheck_extra_make_args = "CC=\"{}/cppcheck-cc.sh {} --\"".format(
+                                        settings.tools_dir,
+                                        cppcheck_cc_flags
+                                    ).replace("\n", "")
+
+
+def generate_cppcheck_report():
+    # Prepare text report
+    # Look for a list of .cppcheck.txt files, those are the txt report
+    # fragments
+    fragments = utils.recursive_find_file(settings.outdir, r'.*\.cppcheck.txt$')
+    text_report_dir = "{}/{}".format(settings.outdir,
+                                        CPPCHECK_REPORT_OUTDIR)
+    report_filename = "{}/xen-cppcheck.txt".format(text_report_dir)
+    os.makedirs(text_report_dir, exist_ok=True)
+    try:
+        cppcheck_report_utils.cppcheck_merge_txt_fragments(fragments,
+                                                           report_filename,
+                                                           [settings.xen_dir])
+    except cppcheck_report_utils.CppcheckTXTReportError as e:
+        raise CppcheckReportPhaseError(e)
+
+    # If HTML output is requested
+    if settings.cppcheck_html:
+        # Look for a list of .cppcheck.xml files, those are the XML report
+        # fragments
+        fragments = utils.recursive_find_file(settings.outdir,
+                                              r'.*\.cppcheck.xml$')
+        html_report_dir = "{}/{}".format(settings.outdir,
+                                         CPPCHECK_HTMLREPORT_OUTDIR)
+        xml_filename = "{}/xen-cppcheck.xml".format(html_report_dir)
+        os.makedirs(html_report_dir, exist_ok=True)
+        try:
+            cppcheck_report_utils.cppcheck_merge_xml_fragments(fragments,
+                                                               xml_filename,
+                                                               settings.xen_dir,
+                                                               settings.outdir)
+        except cppcheck_report_utils.CppcheckHTMLReportError as e:
+            raise CppcheckReportPhaseError(e)
+        # Call cppcheck-htmlreport utility to generate the HTML output
+        utils.invoke_command(
+            "{} --file={} --source-dir={} --report-dir={}/html --title=Xen"
+                .format(settings.cppcheck_htmlreport_binpath, xml_filename,
+                        settings.xen_dir, html_report_dir),
+            False, CppcheckReportPhaseError,
+            "Error occured generating Cppcheck HTML report:\n{}"
+        )
+        # Strip src and obj path from *.html files
+        html_files = utils.recursive_find_file(html_report_dir, r'.*\.html$')
+        try:
+            cppcheck_report_utils.cppcheck_strip_path_html(html_files,
+                                                           (settings.xen_dir,
+                                                            settings.outdir))
+        except cppcheck_report_utils.CppcheckHTMLReportError as e:
+            raise CppcheckReportPhaseError(e)
+
+
+def clean_analysis_artifacts():
+    clean_files = ("suppression-list.txt", "cppcheck-misra.txt",
+                   "cppcheck-misra.json")
+    cppcheck_build_dir = "{}/{}".format(settings.outdir, CPPCHECK_BUILD_DIR)
+    if os.path.isdir(cppcheck_build_dir):
+        shutil.rmtree(cppcheck_build_dir)
+    artifact_files = utils.recursive_find_file(settings.outdir,
+                                r'.*\.(?:c\.json|cppcheck\.txt|cppcheck\.xml)$')
+    for file in clean_files:
+        file = "{}/{}".format(settings.outdir, file)
+        if os.path.isfile(file):
+            artifact_files.append(file)
+    for delfile in artifact_files:
+        os.remove(delfile)
+
+
+def clean_reports():
+    text_report_dir = "{}/{}".format(settings.outdir,
+                                     CPPCHECK_REPORT_OUTDIR)
+    html_report_dir = "{}/{}".format(settings.outdir,
+                                     CPPCHECK_HTMLREPORT_OUTDIR)
+    if os.path.isdir(text_report_dir):
+        shutil.rmtree(text_report_dir)
+    if os.path.isdir(html_report_dir):
+        shutil.rmtree(html_report_dir)
diff --git a/xen/scripts/xen_analysis/cppcheck_report_utils.py b/xen/scripts/xen_analysis/cppcheck_report_utils.py
new file mode 100644
index 000000000000..02440aefdfec
--- /dev/null
+++ b/xen/scripts/xen_analysis/cppcheck_report_utils.py
@@ -0,0 +1,130 @@
+#!/usr/bin/env python3
+
+import os
+from xml.etree import ElementTree
+
+class CppcheckHTMLReportError(Exception):
+    pass
+
+class CppcheckTXTReportError(Exception):
+    pass
+
+
+def __elements_equal(el1, el2):
+    if type(el1) != type(el2): return False
+
+    if el1.find('location') is None: return False
+    if el2.find('location') is None: return False
+
+    el1_location = str(el1.find('location').attrib)
+    el2_location = str(el2.find('location').attrib)
+
+    if el1_location != el2_location: return False
+
+    return True
+
+
+def __contain_element(new, lst):
+    for elem in lst:
+        if __elements_equal(new, elem):
+            return True
+    return False
+
+
+def __get_xml_root_file(filename):
+    try:
+        result_xml_root = ElementTree.parse(filename).getroot()
+    except ElementTree.ParseError as e:
+        raise CppcheckHTMLReportError(
+                    "XML parsing error in {}: {}".format(filename, e)
+                )
+    return result_xml_root
+
+
+def __sanitize_cppcheck_xml_path(xml_tree, src_path, obj_path):
+    # Some path are relative to the source tree but some others are generated
+    # in the obj tree, for cppcheck when using cppcheck-htmlreport we can pass
+    # only one source tree where the files will be fetched if relative path are
+    # found. So for every path that does not exists in src tree, we guess it
+    # comes from obj tree and we put explicit absolute path to it
+    error_item_root = xml_tree.findall("errors")[0]
+    for error_item in error_item_root:
+        for location_item in error_item.findall("location"):
+            path = location_item.attrib["file"]
+            new_obj_path = obj_path + "/" + path
+            new_src_path = src_path + "/" + path
+            if (path[0] != "/") and (not os.path.isfile(new_src_path)) \
+               and os.path.isfile(new_obj_path):
+                location_item.attrib["file"] = new_obj_path
+
+
+def cppcheck_merge_xml_fragments(fragments_list, out_xml_file, src_path,
+                                 obj_path):
+
+    result_xml = __get_xml_root_file(fragments_list[0])
+    insert_point = result_xml.findall("errors")[0]
+    for xml_file in fragments_list[1:]:
+        xml_root = __get_xml_root_file(xml_file)
+        curr_elem_list = list(insert_point)
+        new_elem_list = list(xml_root.findall("errors")[0])
+        for xml_error_elem in new_elem_list:
+            if not __contain_element(xml_error_elem, curr_elem_list):
+                insert_point.insert(1, xml_error_elem)
+
+    if result_xml is None:
+        return False
+
+    __sanitize_cppcheck_xml_path(result_xml, src_path, obj_path)
+
+    ElementTree.ElementTree(result_xml).write(out_xml_file)
+
+    return True
+
+
+def cppcheck_merge_txt_fragments(fragments_list, out_txt_file, strip_paths):
+    try:
+        with open(out_txt_file, "wt") as outfile:
+            # Using a set will remove automatically the duplicate lines
+            text_report_content = set()
+            for file in fragments_list:
+                try:
+                    with open(file, "rt") as infile:
+                        frag_lines = infile.readlines()
+                except OSError as e:
+                    raise CppcheckTXTReportError(
+                            "Issue with reading file {}: {}"
+                                .format(file, e)
+                            )
+                text_report_content.update(frag_lines)
+
+            # Back to modifiable list
+            text_report_content = list(text_report_content)
+            # Strip path from report lines
+            for i in list(range(0, len(text_report_content))):
+                for path in strip_paths:
+                    text_report_content[i] = text_report_content[i].replace(
+                                                                path + "/", "")
+            # Write the final text report
+            outfile.writelines(text_report_content)
+    except OSError as e:
+        raise CppcheckTXTReportError("Issue with writing file {}: {}"
+                                            .format(out_txt_file, e))
+
+
+def cppcheck_strip_path_html(html_files, strip_paths):
+    for file in html_files:
+        try:
+            with open(file, "rt") as infile:
+                html_lines = infile.readlines()
+        except OSError as e:
+            raise CppcheckHTMLReportError("Issue with reading file {}: {}"
+                                                            .format(file, e))
+        for i in list(range(0, len(html_lines))):
+            for path in strip_paths:
+                html_lines[i] = html_lines[i].replace(path + "/", "")
+        try:
+            with open(file, "wt") as outfile:
+                outfile.writelines(html_lines)
+        except OSError as e:
+            raise CppcheckHTMLReportError("Issue with writing file {}: {}"
+                                                            .format(file, e))
diff --git a/xen/scripts/xen_analysis/generic_analysis.py b/xen/scripts/xen_analysis/generic_analysis.py
index 372ff3566442..94122aebace0 100644
--- a/xen/scripts/xen_analysis/generic_analysis.py
+++ b/xen/scripts/xen_analysis/generic_analysis.py
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 
-import os, subprocess
-from . import settings, utils, tag_database
+import os
+from . import settings, utils, tag_database, cppcheck_analysis
 
 class ParseTagPhaseError(Exception):
     pass
@@ -61,8 +61,9 @@ def parse_xen_tags():
 
 def build_xen():
     utils.invoke_command(
-            "make -C {} {} build"
-                .format(settings.xen_dir, settings.make_forward_args),
+            "make -C {} {} {} build"
+                .format(settings.xen_dir, settings.make_forward_args,
+                        cppcheck_analysis.cppcheck_extra_make_args),
             False, BuildPhaseError,
             "Build error occured when running:\n{}"
         )
diff --git a/xen/scripts/xen_analysis/settings.py b/xen/scripts/xen_analysis/settings.py
index e8d474eaf378..a8502e554e95 100644
--- a/xen/scripts/xen_analysis/settings.py
+++ b/xen/scripts/xen_analysis/settings.py
@@ -7,14 +7,23 @@ xen_dir = os.path.realpath(module_dir + "/../..")
 repo_dir = os.path.realpath(xen_dir + "/..")
 tools_dir = os.path.realpath(xen_dir + "/tools")
 
+step_get_make_vars = False
 step_parse_tags = True
+step_cppcheck_deps = False
 step_build_xen = True
+step_cppcheck_report = False
 step_clean_analysis = True
+step_distclean_analysis = False
 
 target_build = False
 target_clean = False
+target_distclean = False
 
 analysis_tool = ""
+cppcheck_binpath = "cppcheck"
+cppcheck_html = False
+cppcheck_htmlreport_binpath = "cppcheck-htmlreport"
+cppcheck_misra = False
 make_forward_args = ""
 outdir = xen_dir
 
@@ -25,44 +34,66 @@ Usage: {} [OPTION] ... [-- [make arguments]]
 
 This script runs the analysis on the Xen codebase.
 
-The phases for the analysis are <tags>, <build>, <clean>
+The phases for the analysis are <tags>, <build>, <clean>, <cppcheck report>
 
 Depending on the options below, only some phases will run:
 
-<no options>: tags, build, clean
---build-only: build
+<no options>: tags, build, [cppcheck report], clean
+--build-only: build, [cppcheck report]
 --clean-only: clean
+--distclean:  clean, [destroy cppcheck report]
 --no-build:   tags, clean
 --no-clean:   tags, build
 
 --no-build/--no-clean can be passed together to avoid both clean and build
 phases.
-Tags and build phases need to specify --run-coverity or --run-eclair.
+Tags and build phases need to specify --run-coverity, --run-eclair or
+--run-cppcheck.
+Cppcheck report creation phase runs only when --run-cppcheck is passed to the
+script.
 
 Options:
-  --build-only    Run only the commands to build Xen with the optional make
-                  arguments passed to the script
-  --clean-only    Run only the commands to clean the analysis artifacts
-  -h, --help      Print this help
-  --no-build      Skip the build Xen phase
-  --no-clean      Don\'t clean the analysis artifacts on exit
-  --run-coverity  Run the analysis for the Coverity tool
-  --run-eclair    Run the analysis for the Eclair tool
+  --build-only          Run only the commands to build Xen with the optional
+                        make arguments passed to the script
+  --clean-only          Run only the commands to clean the analysis artifacts
+  --cppcheck-bin=       Path to the cppcheck binary (Default: {})
+  --cppcheck-html       Produce an additional HTML output report for Cppcheck
+  --cppcheck-html-bin=  Path to the cppcheck-html binary (Default: {})
+  --cppcheck-misra      Activate the Cppcheck MISRA analysis
+  --distclean           Clean analysis artifacts and reports
+  -h, --help            Print this help
+  --no-build            Skip the build Xen phase
+  --no-clean            Don\'t clean the analysis artifacts on exit
+  --run-coverity        Run the analysis for the Coverity tool
+  --run-cppcheck        Run the Cppcheck analysis tool on Xen
+  --run-eclair          Run the analysis for the Eclair tool
 """
-    print(msg.format(sys.argv[0]))
+    print(msg.format(sys.argv[0], cppcheck_binpath,
+                     cppcheck_htmlreport_binpath))
 
 
 def parse_commandline(argv):
     global analysis_tool
+    global cppcheck_binpath
+    global cppcheck_html
+    global cppcheck_htmlreport_binpath
+    global cppcheck_misra
     global make_forward_args
     global outdir
+    global step_get_make_vars
     global step_parse_tags
+    global step_cppcheck_deps
     global step_build_xen
+    global step_cppcheck_report
     global step_clean_analysis
+    global step_distclean_analysis
     global target_build
     global target_clean
+    global target_distclean
     forward_to_make = False
     for option in argv:
+        args_with_content_regex = re.match(r'^(--[a-z]+[a-z-]*)=(.*)$', option)
+
         if forward_to_make:
             # Intercept outdir
             outdir_regex = re.match("^O=(.*)$", option)
@@ -74,6 +105,18 @@ def parse_commandline(argv):
             target_build = True
         elif option == "--clean-only":
             target_clean = True
+        elif args_with_content_regex and \
+             args_with_content_regex.group(1) == "--cppcheck-bin":
+            cppcheck_binpath = args_with_content_regex.group(2)
+        elif option == "--cppcheck-html":
+            cppcheck_html = True
+        elif args_with_content_regex and \
+             args_with_content_regex.group(1) == "--cppcheck-html-bin":
+            cppcheck_htmlreport_binpath = args_with_content_regex.group(2)
+        elif option == "--cppcheck-misra":
+            cppcheck_misra = True
+        elif option == "--distclean":
+            target_distclean = True
         elif (option == "--help") or (option == "-h"):
             help()
             sys.exit(0)
@@ -83,6 +126,11 @@ def parse_commandline(argv):
             step_clean_analysis = False
         elif (option == "--run-coverity") or (option == "--run-eclair"):
             analysis_tool = option[6:]
+        elif (option == "--run-cppcheck"):
+            analysis_tool = "cppcheck"
+            step_get_make_vars = True
+            step_cppcheck_deps = True
+            step_cppcheck_report = True
         elif option == "--":
             forward_to_make = True
         else:
@@ -90,13 +138,23 @@ def parse_commandline(argv):
             help()
             sys.exit(1)
 
-    if target_build and target_clean:
-        print("--build-only is not compatible with --clean-only argument.")
+    if target_build and (target_clean or target_distclean):
+        print("--build-only is not compatible with --clean-only/--distclean "
+              "argument.")
         sys.exit(1)
 
+    if target_distclean:
+        # Implicit activation of clean target
+        target_clean = True
+
+        step_distclean_analysis = True
+
     if target_clean:
+        step_get_make_vars = False
         step_parse_tags = False
+        step_cppcheck_deps = False
         step_build_xen = False
+        step_cppcheck_report = False
         step_clean_analysis = True
         return
 
diff --git a/xen/tools/cppcheck-cc.sh b/xen/tools/cppcheck-cc.sh
new file mode 100755
index 000000000000..f6728e4c1084
--- /dev/null
+++ b/xen/tools/cppcheck-cc.sh
@@ -0,0 +1,223 @@
+#!/usr/bin/env bash
+
+set -e
+
+function help() {
+    cat <<EOF
+Usage: ${0} [OPTION] ... -- <compiler arguments>
+
+This script is a wrapper for cppcheck that enables it to analyse the files that
+are the target for the build, it is used in place of a selected compiler and the
+make process will run it on every file that needs to be built.
+All the arguments passed to the original compiler are forwarded to it without
+modification, furthermore, they are used to improve the cppcheck analysis.
+
+Options:
+  --compiler=       Use this compiler for the build
+  --cppcheck-cmd=   Command line for the cppcheck analysis.
+  --cppcheck-html   Prepare for cppcheck HTML output
+  --cppcheck-plat=  Path to the cppcheck platform folder
+  --ignore-path=    This script won't run cppcheck on the files having this
+                    path, the compiler will run anyway on them. This argument
+                    can be specified multiple times.
+  -h, --help        Print this help
+EOF
+}
+
+CC_FILE=""
+COMPILER=""
+CPPCHECK_HTML="n"
+CPPCHECK_PLAT_PATH=""
+CPPCHECK_TOOL=""
+CPPCHECK_TOOL_ARGS=""
+FORWARD_FLAGS=""
+IGNORE_PATH="n"
+IGNORE_PATH_LIST=""
+JDB_FILE=""
+OBJTREE_PATH=""
+
+# Variable used for arg parsing
+forward_to_cc="n"
+sm_tool_args="n"
+obj_arg_content="n"
+
+for OPTION in "$@"
+do
+    if [ "${forward_to_cc}" = "y" ]; then
+        if [[ ${OPTION} == *.c ]]
+        then
+            CC_FILE="${OPTION}"
+        elif [ "${OPTION}" = "-o" ]
+        then
+            # After -o there is the path to the obj file, flag it
+            obj_arg_content="y"
+        elif [ "${obj_arg_content}" = "y" ]
+        then
+            # This must be the path to the obj file, turn off flag and save path
+            OBJTREE_PATH="$(dirname "${OPTION}")"
+            obj_arg_content="n"
+        fi
+        # Forward any argument to the compiler
+        FORWARD_FLAGS="${FORWARD_FLAGS} ${OPTION}"
+        continue
+    fi
+    case ${OPTION} in
+        -h|--help)
+            help
+            exit 0
+            ;;
+        --compiler=*)
+            COMPILER="${OPTION#*=}"
+            sm_tool_args="n"
+            ;;
+        --cppcheck-cmd=*)
+            CPPCHECK_TOOL="${OPTION#*=}"
+            sm_tool_args="y"
+            ;;
+        --cppcheck-html)
+            CPPCHECK_HTML="y"
+            sm_tool_args="n"
+            ;;
+        --cppcheck-plat=*)
+            CPPCHECK_PLAT_PATH="${OPTION#*=}"
+            sm_tool_args="n"
+            ;;
+        --ignore-path=*)
+            IGNORE_PATH_LIST="${IGNORE_PATH_LIST} ${OPTION#*=}"
+            sm_tool_args="n"
+            ;;
+        --)
+            forward_to_cc="y"
+            sm_tool_args="n"
+            ;;
+        *)
+            if [ "${sm_tool_args}" = "y" ]; then
+                CPPCHECK_TOOL_ARGS="${CPPCHECK_TOOL_ARGS} ${OPTION}"
+            else
+                echo "Invalid option ${OPTION}"
+                exit 1
+            fi
+            ;;
+    esac
+done
+
+if [ "${COMPILER}" = "" ]
+then
+    echo "--compiler arg is mandatory."
+    exit 1
+fi
+
+function create_jcd() {
+    local line="${1}"
+    local arg_num=0
+    local same_line=0
+
+    {
+        echo "["
+        echo "    {"
+        echo "        \"arguments\": ["
+
+        for arg in ${line}; do
+            # This code prevents to put comma in the last element of the list or
+            # on sequential lines that are going to be merged
+            if [ "${arg_num}" -ne 0 ] && [ "${same_line}" -eq 0 ]
+            then
+                echo ","
+            fi
+            if [ "${same_line}" -ne 0 ]
+            then
+                echo -n "${arg}\""
+                same_line=0
+            elif [ "${arg}" = "-iquote" ] || [ "${arg}" = "-I" ]
+            then
+                # cppcheck doesn't understand -iquote, substitute with -I
+                echo -n "            \"-I"
+                same_line=1
+            else
+                echo -n "            \"${arg}\""
+            fi
+            arg_num=$(( arg_num + 1 ))
+        done
+        echo ""
+        echo "        ],"
+        echo "        \"directory\": \"$(pwd -P)\","
+        echo "        \"file\": \"${CC_FILE}\""
+        echo "    }"
+        echo "]"
+    } > "${JDB_FILE}"
+}
+
+
+# Execute compiler with forwarded flags
+# Shellcheck complains about missing quotes on FORWARD_FLAGS, but they can't be
+# used here
+# shellcheck disable=SC2086
+${COMPILER} ${FORWARD_FLAGS}
+
+if [ -n "${CC_FILE}" ];
+then
+    for path in ${IGNORE_PATH_LIST}
+    do
+        if [[ ${CC_FILE} == *${path}* ]]
+        then
+            IGNORE_PATH="y"
+            echo "${0}: ${CC_FILE} ignored by --ignore-path matching *${path}*"
+        fi
+    done
+    if [ "${IGNORE_PATH}" = "n" ]
+    then
+        JDB_FILE="${OBJTREE_PATH}/$(basename "${CC_FILE}".json)"
+
+        # Prepare the Json Compilation Database for the file
+        create_jcd "${COMPILER} ${FORWARD_FLAGS}"
+
+        out_file="${OBJTREE_PATH}/$(basename "${CC_FILE%.c}".cppcheck.txt)"
+
+        # Select the right target platform, ARCH is generated from Xen Makefile
+        case ${ARCH} in
+            arm64)
+                # arm64 has efi code compiled with -fshort-wchar
+                platform="${CPPCHECK_PLAT_PATH}/arm64-wchar_t2.xml"
+                ;;
+            arm32)
+                # arm32 has no efi code
+                platform="${CPPCHECK_PLAT_PATH}/arm32-wchar_t4.xml"
+                ;;
+            x86_64)
+                # x86_64 has efi code compiled with -fshort-wchar
+                platform="${CPPCHECK_PLAT_PATH}/x86_64-wchar_t2.xml"
+                ;;
+            *)
+                echo "ARCH: ${ARCH} not expected!"
+                exit 1
+                ;;
+        esac
+
+        if [ ! -f "${platform}" ]
+        then
+            echo "${platform} not found!"
+            exit 1
+        fi
+
+        # Shellcheck complains about missing quotes on CPPCHECK_TOOL_ARGS, but
+        # they can't be used here
+        # shellcheck disable=SC2086
+        ${CPPCHECK_TOOL} ${CPPCHECK_TOOL_ARGS} \
+            --project="${JDB_FILE}" \
+            --output-file="${out_file}" \
+            --platform="${platform}"
+
+        if [ "${CPPCHECK_HTML}" = "y" ]
+        then
+            # Shellcheck complains about missing quotes on CPPCHECK_TOOL_ARGS,
+            # but they can't be used here
+            # shellcheck disable=SC2086
+            ${CPPCHECK_TOOL} ${CPPCHECK_TOOL_ARGS} \
+                --project="${JDB_FILE}" \
+                --output-file="${out_file%.txt}.xml" \
+                --platform="${platform}" \
+                -q \
+                --xml
+        fi
+    fi
+fi
diff --git a/xen/tools/cppcheck-plat/arm32-wchar_t4.xml b/xen/tools/cppcheck-plat/arm32-wchar_t4.xml
new file mode 100644
index 000000000000..3aefa7ba5c98
--- /dev/null
+++ b/xen/tools/cppcheck-plat/arm32-wchar_t4.xml
@@ -0,0 +1,17 @@
+<?xml version="1.0"?>
+<platform>
+  <char_bit>8</char_bit>
+  <default-sign>unsigned</default-sign>
+  <sizeof>
+    <short>2</short>
+    <int>4</int>
+    <long>4</long>
+    <long-long>8</long-long>
+    <float>4</float>
+    <double>8</double>
+    <long-double>8</long-double>
+    <pointer>4</pointer>
+    <size_t>4</size_t>
+    <wchar_t>4</wchar_t>
+  </sizeof>
+</platform>
diff --git a/xen/tools/cppcheck-plat/arm64-wchar_t2.xml b/xen/tools/cppcheck-plat/arm64-wchar_t2.xml
new file mode 100644
index 000000000000..b2dc2fb2cc50
--- /dev/null
+++ b/xen/tools/cppcheck-plat/arm64-wchar_t2.xml
@@ -0,0 +1,17 @@
+<?xml version="1.0"?>
+<platform>
+  <char_bit>8</char_bit>
+  <default-sign>unsigned</default-sign>
+  <sizeof>
+    <short>2</short>
+    <int>4</int>
+    <long>8</long>
+    <long-long>8</long-long>
+    <float>4</float>
+    <double>8</double>
+    <long-double>16</long-double>
+    <pointer>8</pointer>
+    <size_t>8</size_t>
+    <wchar_t>2</wchar_t>
+  </sizeof>
+</platform>
diff --git a/xen/tools/cppcheck-plat/x86_64-wchar_t2.xml b/xen/tools/cppcheck-plat/x86_64-wchar_t2.xml
new file mode 100644
index 000000000000..0b3bb6e0fb8e
--- /dev/null
+++ b/xen/tools/cppcheck-plat/x86_64-wchar_t2.xml
@@ -0,0 +1,17 @@
+<?xml version="1.0"?>
+<platform>
+  <char_bit>8</char_bit>
+  <default-sign>signed</default-sign>
+  <sizeof>
+    <short>2</short>
+    <int>4</int>
+    <long>8</long>
+    <long-long>8</long-long>
+    <float>4</float>
+    <double>8</double>
+    <long-double>16</long-double>
+    <pointer>8</pointer>
+    <size_t>8</size_t>
+    <wchar_t>2</wchar_t>
+  </sizeof>
+</platform>
-- 
2.17.1


