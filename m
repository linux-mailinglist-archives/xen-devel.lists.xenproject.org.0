Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE17F645A6D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 14:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456299.714072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2u8t-0004Tl-UC; Wed, 07 Dec 2022 13:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456299.714072; Wed, 07 Dec 2022 13:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2u8t-0004Rs-Qy; Wed, 07 Dec 2022 13:07:19 +0000
Received: by outflank-mailman (input) for mailman id 456299;
 Wed, 07 Dec 2022 13:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbZ5=4F=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p2u8s-0004EJ-1u
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 13:07:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 11f907cb-7630-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 14:07:15 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6394AD6E;
 Wed,  7 Dec 2022 05:07:21 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CCB63F73D;
 Wed,  7 Dec 2022 05:07:13 -0800 (PST)
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
X-Inumbo-ID: 11f907cb-7630-11ed-91b6-6bf2151ebd3b
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
Subject: [PATCH v3 1/5] xen/scripts: add xen-analysis.py for coverity and eclair analysis
Date: Wed,  7 Dec 2022 13:07:00 +0000
Message-Id: <20221207130704.20573-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207130704.20573-1-luca.fancellu@arm.com>
References: <20221207130704.20573-1-luca.fancellu@arm.com>

Add new script for coverity/eclair analysis tool that will enable
the procedure to suppress findings when these tool are used.
The procedure is documented in docs/misra/documenting-violations.rst
and the script is documented in docs/misra/xen-static-analysis.rst.

Add in docs/misra/ the files safe.json and
false-positive-{coverity,eclair}.json that are JSON files containing
the data structures for the justifications, they are used by the
analysis script to link the Xen tags to the proprietary tool comment.

Add docs/misra/documenting-violations.rst to explain how to add
justifications.

Add docs/misra/xen-static-analysis.rst to explain how to use the
script to analyse Xen.

Add analysis artifacts files to .gitignore.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3 changes:
 - improved help content in the script (Stefano)
 - used utils.invoke_command from this patch (Stefano)
v2 changes:
 - no change
---
---
 .gitignore                                   |   1 +
 docs/misra/documenting-violations.rst        | 191 +++++++++++++++++++
 docs/misra/false-positive-coverity.json      |  12 ++
 docs/misra/false-positive-eclair.json        |  12 ++
 docs/misra/safe.json                         |  11 ++
 docs/misra/xen-static-analysis.rst           |  54 ++++++
 xen/scripts/xen-analysis.py                  |  31 +++
 xen/scripts/xen_analysis/__init__.py         |   0
 xen/scripts/xen_analysis/generic_analysis.py |  87 +++++++++
 xen/scripts/xen_analysis/settings.py         | 111 +++++++++++
 xen/scripts/xen_analysis/tag_database.py     | 109 +++++++++++
 xen/scripts/xen_analysis/utils.py            |  56 ++++++
 12 files changed, 675 insertions(+)
 create mode 100644 docs/misra/documenting-violations.rst
 create mode 100644 docs/misra/false-positive-coverity.json
 create mode 100644 docs/misra/false-positive-eclair.json
 create mode 100644 docs/misra/safe.json
 create mode 100644 docs/misra/xen-static-analysis.rst
 create mode 100755 xen/scripts/xen-analysis.py
 create mode 100644 xen/scripts/xen_analysis/__init__.py
 create mode 100644 xen/scripts/xen_analysis/generic_analysis.py
 create mode 100644 xen/scripts/xen_analysis/settings.py
 create mode 100644 xen/scripts/xen_analysis/tag_database.py
 create mode 100644 xen/scripts/xen_analysis/utils.py

diff --git a/.gitignore b/.gitignore
index ea3243af9dde..f5a66f6194dd 100644
--- a/.gitignore
+++ b/.gitignore
@@ -10,6 +10,7 @@
 *.c.cppcheck
 *.opic
 *.a
+*.safparse
 *.so
 *.so.[0-9]*
 *.bin
diff --git a/docs/misra/documenting-violations.rst b/docs/misra/documenting-violations.rst
new file mode 100644
index 000000000000..1d23447556d2
--- /dev/null
+++ b/docs/misra/documenting-violations.rst
@@ -0,0 +1,191 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Documenting violations
+======================
+
+Static analysers are used on the Xen codebase for both static analysis and MISRA
+compliance.
+There might be the need to suppress some findings instead of fixing them and
+many tools permit the usage of in-code comments that suppress findings so that
+they are not shown in the final report.
+
+Xen includes a tool capable of translating a specific comment used in its
+codebase to the right proprietary in-code comment understandable by the selected
+analyser that suppress its finding.
+
+In the Xen codebase, these tags will be used to document and suppress findings:
+
+ - SAF-X-safe: This tag means that the next line of code contains a finding, but
+   the non compliance to the checker is analysed and demonstrated to be safe.
+ - SAF-X-false-positive-<tool>: This tag means that the next line of code
+   contains a finding, but the finding is a bug of the tool.
+
+SAF stands for Static Analyser Finding, the X is a placeholder for a positive
+number that starts from zero, the number after SAF- shall be incremental and
+unique, base ten notation and without leading zeros.
+
+Entries in the database shall never be removed, even if they are not used
+anymore in the code (if a patch is removing or modifying the faulty line).
+This is to make sure that numbers are not reused which could lead to conflicts
+with old branches or misleading justifications.
+
+An entry can be reused in multiple places in the code to suppress a finding if
+and only if the justification holds for the same non-compliance to the coding
+standard.
+
+An orphan entry, that is an entry who was justifying a finding in the code, but
+later that code was removed and there is no other use of that entry in the code,
+can be reused as long as the justification for the finding holds. This is done
+to avoid the allocation of a new entry with exactly the same justification, that
+would lead to waste of space and maintenance issues of the database.
+
+The files where to store all the justifications are in xen/docs/misra/ and are
+named as safe.json and false-positive-<tool>.json, they have JSON format, each
+one has a different justification schema which shares some fields.
+
+Here is an example to add a new justification in safe.json::
+
+|{
+|    "version": "1.0",
+|    "content": [
+|        {
+|            "id": "SAF-0-safe",
+|            "analyser": {
+|                "coverity": "misra_c_2012_rule_20_7_violation",
+|                "eclair": "MC3R1.R20.7"
+|            },
+|            "name": "R20.7 C macro parameters not used as expression",
+|            "text": "The macro parameters used in this [...]"
+|        },
+|        {
+|            "id": "SAF-1-safe",
+|            "analyser": {},
+|            "name": "Sentinel",
+|            "text": "Next ID to be used"
+|        }
+|    ]
+|}
+
+To document a finding in safe.json, just add another block {[...]} before the
+sentinel block, using the id contained in the sentinel block and increment by
+one the number contained in the id of the sentinel block.
+
+Here is an explanation of the fields inside an object of the "content" array:
+ - id: it is a unique string that is used to refer to the finding, many finding
+   can be tagged with the same id, if the justification holds for any applied
+   case.
+   It tells the tool to substitute a Xen in-code comment having this structure:
+   /* SAF-0-safe [...] \*/
+ - analyser: it is an object containing pair of key-value strings, the key is
+   the analyser, so it can be coverity or eclair, the value is the proprietary
+   id corresponding on the finding, for example when coverity is used as
+   analyser, the tool will translate the Xen in-code coment in this way:
+   /* SAF-0-safe [...] \*/ -> /* coverity[misra_c_2012_rule_20_7_violation] \*/
+   if the object doesn't have a key-value, then the corresponding in-code
+   comment won't be translated.
+ - name: a simple name for the finding
+ - text: a proper justification to turn off the finding.
+
+
+Here is an example to add a new justification in false-positive-<tool>.json::
+
+|{
+|    "version": "1.0",
+|    "content": [
+|        {
+|            "id": "SAF-0-false-positive-<tool>",
+|            "violation-id": "<proprietary-id>",
+|            "tool-version": "<version>",
+|            "name": "R20.7 [...]",
+|            "text": "[...]"
+|        },
+|        {
+|            "id": "SAF-1-false-positive-<tool>",
+|            "violation-id": "",
+|            "tool-version": "",
+|            "name": "Sentinel",
+|            "text": "Next ID to be used"
+|        }
+|    ]
+|}
+
+To document a finding in false-positive-<tool>.json, just add another block
+{[...]} before the sentinel block, using the id contained in the sentinel block
+and increment by one the number contained in the id of the sentinel block.
+
+Here is an explanation of the fields inside an object of the "content" array:
+ - id: it has the same meaning as in the "safe" justification schema.
+   It tells the tool to substitute a Xen in-code comment having this structure:
+   /* SAF-0-false-positive-<tool> [...] \*/
+ - violation-id: its value is a string containing the proprietary id
+   corresponding to the finding, for example when <tool> is coverity, the Xen
+   tool will translate the Xen in-code coment in this way:
+   /* SAF-0-false-positive-coverity [...] \*/ -> /* coverity[misra_c_2012_rule_20_7_violation] \*/
+   if the object doesn't have a value, then the corresponding in-code comment
+   won't be translated.
+ - tool-version: the version of the tool affected by the false positive, if it
+   is discovered in more than one version, this string can be a range
+   (eg. 2.7 - 3.0)
+ - name, text: they have the same meaning as in the "safe" justification schema.
+
+
+Justification example
+---------------------
+
+Here an example of the usage of the in-code comment tags to suppress a finding
+for the Rule 8.6:
+
+Eclair reports it in its web report, file xen/include/xen/kernel.h, line 68:
+
+| MC3R1.R8.6 for program 'xen/xen-syms', variable '_start' has no definition
+
+Also coverity reports it, here is an extract of the finding:
+
+| xen/include/xen/kernel.h:68:
+| 1. misra_c_2012_rule_8_6_violation: Function "_start" is declared but never
+ defined.
+
+The analysers are complaining because we have this in xen/include/xen/kernel.h
+at line 68::
+
+| extern char _start[], _end[], start[];
+
+Those are symbols exported by the linker, hence we will need to have a proper
+deviation for this finding.
+
+We will prepare our entry in the safe.json database::
+
+|{
+|    "version": "1.0",
+|    "content": [
+|        {
+|        [...]
+|        },
+|        {
+|            "id": "SAF-1-safe",
+|            "analyser": {
+|                "eclair": "MC3R1.R8.6",
+|                "coverity": "misra_c_2012_rule_8_6_violation"
+|            },
+|            "name": "Rule 8.6: linker script defined symbols",
+|            "text": "It is safe to declare this symbol because it is defined in the linker script."
+|        },
+|        {
+|            "id": "SAF-2-safe",
+|            "analyser": {},
+|            "name": "Sentinel",
+|            "text": "Next ID to be used"
+|        }
+|    ]
+|}
+
+And we will use the proper tag above the violation line::
+
+| /* SAF-1-safe R8.6 linker defined symbols */
+| extern char _start[], _end[], start[];
+
+This entry will fix also the violation on _end and start, because they are on
+the same line and the same "violation ID".
+
+Also, the same tag can be used on other symbols from the linker that are
+declared in the codebase, because the justification holds for them too.
diff --git a/docs/misra/false-positive-coverity.json b/docs/misra/false-positive-coverity.json
new file mode 100644
index 000000000000..462448414f80
--- /dev/null
+++ b/docs/misra/false-positive-coverity.json
@@ -0,0 +1,12 @@
+{
+    "version": "1.0",
+    "content": [
+        {
+            "id": "SAF-0-false-positive-coverity",
+            "violation-id": "",
+            "tool-version": "",
+            "name": "Sentinel",
+            "text": "Next ID to be used"
+        }
+    ]
+}
diff --git a/docs/misra/false-positive-eclair.json b/docs/misra/false-positive-eclair.json
new file mode 100644
index 000000000000..1d6ea5d7f045
--- /dev/null
+++ b/docs/misra/false-positive-eclair.json
@@ -0,0 +1,12 @@
+{
+    "version": "1.0",
+    "content": [
+        {
+            "id": "SAF-0-false-positive-eclair",
+            "violation-id": "",
+            "tool-version": "",
+            "name": "Sentinel",
+            "text": "Next ID to be used"
+        }
+    ]
+}
diff --git a/docs/misra/safe.json b/docs/misra/safe.json
new file mode 100644
index 000000000000..e079d3038120
--- /dev/null
+++ b/docs/misra/safe.json
@@ -0,0 +1,11 @@
+{
+    "version": "1.0",
+    "content": [
+        {
+            "id": "SAF-0-safe",
+            "analyser": {},
+            "name": "Sentinel",
+            "text": "Next ID to be used"
+        }
+    ]
+}
diff --git a/docs/misra/xen-static-analysis.rst b/docs/misra/xen-static-analysis.rst
new file mode 100644
index 000000000000..5b886474d4a0
--- /dev/null
+++ b/docs/misra/xen-static-analysis.rst
@@ -0,0 +1,54 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Xen static analysis
+===================
+
+The Xen codebase integrates some scripts and tools that helps the developer to
+perform static analysis of the code, currently Xen supports three analysis tool
+that are eclair, coverity and cppcheck.
+The Xen tree has a script (xen-analysis.py) available to ease the analysis
+process and it integrates a way to suppress findings on these tools (only Eclair
+and Coverity are currently supported by the script), please check the
+documenting-violation.rst document to know more about it.
+
+Analyse Xen with Coverity or Eclair
+-----------------------------------
+
+The xen-analysis.py script has two arguments to select which tool is used for
+the analysis:
+
+ - xen-analysis.py --run-coverity -- [optional make arguments]
+ - xen-analysis.py --run-eclair -- [optional make arguments]
+
+For example when using Coverity to analyse a Xen build obtained by passing these
+arguments to the make system: XEN_TARGET_ARCH=arm64
+CROSS_COMPILE=aarch64-linux-gnu-, the optional make arguments passed to
+xen-analysis.py must be the same and the command below should be passed to
+Coverity in its build phase:
+
+ - xen-analysis.py --run-coverity -- XEN_TARGET_ARCH=arm64
+   CROSS_COMPILE=aarch64-linux-gnu-
+
+Which tells to the script to prepare the codebase for an analysis by Coverity
+and forwards the make arguments to the make build invocation.
+
+When invoking the script, the procedure below will be followed:
+
+ 1. Find which files among \*.c and \*.h has any in-code comment as
+    /* SAF-X-[...] \*/, the meaning of these comments is explained in
+    documenting-violation.rst.
+    Save the files obtained as <file>.safparse and generate <file> files where
+    the special in-code comments above are substituted with the proprietary
+    in-code comment used by the selected analysis tool. The safe.json and
+    false-positive-<tool>.json text file database are used to link each Xen tag
+    to the right proprietary in-code comment.
+ 2. Now Xen compilation starts using every <additional make parameters> supplied
+    at the script invocation. Coverity and Eclair are capable of intercepting
+    the compiler running from make to perform their analysis without
+    instrumenting the makefile.
+ 3. As final step every <file>.safparse file are reverted back as <file> and
+    every artifact related to the analysis will be cleaned.
+    This step is performed even in case any of the previous step fail, to skip
+    this step, call the script adding the --no-clean argument, but before
+    running again the script, call it with the --clean-only argument, that will
+    execute only this cleaning step.
diff --git a/xen/scripts/xen-analysis.py b/xen/scripts/xen-analysis.py
new file mode 100755
index 000000000000..b5d9ef1862c9
--- /dev/null
+++ b/xen/scripts/xen-analysis.py
@@ -0,0 +1,31 @@
+#!/usr/bin/env python3
+
+import sys
+from xen_analysis import settings, generic_analysis
+from xen_analysis.generic_analysis import *
+
+
+def main(argv):
+    ret_code = 0
+    settings.parse_commandline(argv)
+    try:
+        if settings.step_parse_tags:
+            generic_analysis.parse_xen_tags()
+        if settings.step_build_xen:
+            generic_analysis.build_xen()
+    except (ParseTagPhaseError, BuildPhaseError) as e:
+        print("ERROR: {}".format(e))
+        if hasattr(e, "errorcode"):
+            ret_code = e.errorcode
+    finally:
+        if settings.step_clean_analysis:
+            e = generic_analysis.clean_analysis_artifacts()
+            if e:
+                print("ERROR: {}".format(e))
+                ret_code = 1
+
+    sys.exit(ret_code)
+
+
+if __name__ == "__main__":
+    main(sys.argv[1:])
diff --git a/xen/scripts/xen_analysis/__init__.py b/xen/scripts/xen_analysis/__init__.py
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/xen/scripts/xen_analysis/generic_analysis.py b/xen/scripts/xen_analysis/generic_analysis.py
new file mode 100644
index 000000000000..372ff3566442
--- /dev/null
+++ b/xen/scripts/xen_analysis/generic_analysis.py
@@ -0,0 +1,87 @@
+#!/usr/bin/env python3
+
+import os, subprocess
+from . import settings, utils, tag_database
+
+class ParseTagPhaseError(Exception):
+    pass
+
+class BuildPhaseError(Exception):
+    pass
+
+class CleanPhaseError(Exception):
+    pass
+
+
+def parse_xen_tags():
+    # Load the database for the Xen tags
+    subs_list = tag_database.load_tag_database(
+        settings.analysis_tool,
+        [settings.repo_dir + "/docs/misra/safe.json"]
+    )
+    subs_list = tag_database.load_tag_database(
+        settings.analysis_tool,
+        [settings.repo_dir + "/docs/misra/false-positive-{}.json"
+                                .format(settings.analysis_tool)],
+        subs_list,
+        "false-positive"
+    )
+
+    # Create outdir if it doesn't exists
+    os.makedirs(settings.outdir, exist_ok=True)
+
+    # The following lambda function will return a file if it contains lines with
+    # a comment containing "SAF-<number>-{safe|false-positive-<tool>}" on a
+    # single line.
+    grep_action = lambda x: utils.grep(x,
+                                    tag_database.get_xen_tag_comment_regex(
+                                                        settings.analysis_tool)
+    )
+    # Look for a list of .h/.c files that matches the condition above
+    parse_file_list = utils.recursive_find_file(settings.xen_dir, r'.*\.[ch]$',
+                                                grep_action)
+
+    for entry in parse_file_list:
+        file = entry["file"]
+        bkp_file = file + ".safparse"
+        if os.path.isfile(bkp_file):
+            raise ParseTagPhaseError(
+                "Found {}, please check the integrity of {}"
+                    .format(bkp_file,file)
+                )
+        os.rename(file, bkp_file)
+        time_bkp_file = os.stat(bkp_file)
+        # Create <file> from <file>.safparse but with the Xen tag parsed
+        tag_database.substitute_tags(settings.analysis_tool, bkp_file, entry,
+                                     subs_list)
+        # Set timestamp for file equal to bkp_file, so that if the file is
+        # modified during the process by the user, we can catch it
+        os.utime(file, (time_bkp_file.st_atime, time_bkp_file.st_mtime))
+
+
+def build_xen():
+    utils.invoke_command(
+            "make -C {} {} build"
+                .format(settings.xen_dir, settings.make_forward_args),
+            False, BuildPhaseError,
+            "Build error occured when running:\n{}"
+        )
+
+
+def clean_analysis_artifacts():
+    safparse_files = utils.recursive_find_file(settings.xen_dir,
+                                               r'.*.safparse$')
+    for original_file in safparse_files:
+        # This commands strips the .safparse extension, leaving <file>
+        parsed_file_path = os.path.splitext(original_file)[0]
+        mtime_original_file = os.stat(original_file).st_mtime
+        mtime_parsed_file = os.stat(parsed_file_path).st_mtime
+        if mtime_original_file != mtime_parsed_file:
+            return CleanPhaseError(
+                    "The file {} was modified during the analysis "
+                    "procedure, it is impossible now to restore from the "
+                    "content of {}, please handle it manually"
+                    .format(parsed_file_path, original_file)
+                )
+        # Replace <file>.safparse to <file>
+        os.replace(original_file, parsed_file_path)
diff --git a/xen/scripts/xen_analysis/settings.py b/xen/scripts/xen_analysis/settings.py
new file mode 100644
index 000000000000..e8d474eaf378
--- /dev/null
+++ b/xen/scripts/xen_analysis/settings.py
@@ -0,0 +1,111 @@
+#!/usr/bin/env python3
+
+import sys, re, os
+
+module_dir = os.path.dirname(os.path.realpath(__file__))
+xen_dir = os.path.realpath(module_dir + "/../..")
+repo_dir = os.path.realpath(xen_dir + "/..")
+tools_dir = os.path.realpath(xen_dir + "/tools")
+
+step_parse_tags = True
+step_build_xen = True
+step_clean_analysis = True
+
+target_build = False
+target_clean = False
+
+analysis_tool = ""
+make_forward_args = ""
+outdir = xen_dir
+
+
+def help():
+    msg="""
+Usage: {} [OPTION] ... [-- [make arguments]]
+
+This script runs the analysis on the Xen codebase.
+
+The phases for the analysis are <tags>, <build>, <clean>
+
+Depending on the options below, only some phases will run:
+
+<no options>: tags, build, clean
+--build-only: build
+--clean-only: clean
+--no-build:   tags, clean
+--no-clean:   tags, build
+
+--no-build/--no-clean can be passed together to avoid both clean and build
+phases.
+Tags and build phases need to specify --run-coverity or --run-eclair.
+
+Options:
+  --build-only    Run only the commands to build Xen with the optional make
+                  arguments passed to the script
+  --clean-only    Run only the commands to clean the analysis artifacts
+  -h, --help      Print this help
+  --no-build      Skip the build Xen phase
+  --no-clean      Don\'t clean the analysis artifacts on exit
+  --run-coverity  Run the analysis for the Coverity tool
+  --run-eclair    Run the analysis for the Eclair tool
+"""
+    print(msg.format(sys.argv[0]))
+
+
+def parse_commandline(argv):
+    global analysis_tool
+    global make_forward_args
+    global outdir
+    global step_parse_tags
+    global step_build_xen
+    global step_clean_analysis
+    global target_build
+    global target_clean
+    forward_to_make = False
+    for option in argv:
+        if forward_to_make:
+            # Intercept outdir
+            outdir_regex = re.match("^O=(.*)$", option)
+            if outdir_regex:
+                outdir = outdir_regex.group(1)
+            # Forward any make arguments
+            make_forward_args = make_forward_args + " " + option
+        elif option == "--build-only":
+            target_build = True
+        elif option == "--clean-only":
+            target_clean = True
+        elif (option == "--help") or (option == "-h"):
+            help()
+            sys.exit(0)
+        elif option == "--no-build":
+            step_build_xen = False
+        elif option == "--no-clean":
+            step_clean_analysis = False
+        elif (option == "--run-coverity") or (option == "--run-eclair"):
+            analysis_tool = option[6:]
+        elif option == "--":
+            forward_to_make = True
+        else:
+            print("Invalid option: {}".format(option))
+            help()
+            sys.exit(1)
+
+    if target_build and target_clean:
+        print("--build-only is not compatible with --clean-only argument.")
+        sys.exit(1)
+
+    if target_clean:
+        step_parse_tags = False
+        step_build_xen = False
+        step_clean_analysis = True
+        return
+
+    if analysis_tool == "":
+        print("Please specify one analysis tool.")
+        help()
+        sys.exit(1)
+
+    if target_build:
+        step_parse_tags = False
+        step_build_xen = True
+        step_clean_analysis = False
diff --git a/xen/scripts/xen_analysis/tag_database.py b/xen/scripts/xen_analysis/tag_database.py
new file mode 100644
index 000000000000..ca374bbb62dd
--- /dev/null
+++ b/xen/scripts/xen_analysis/tag_database.py
@@ -0,0 +1,109 @@
+#!/usr/bin/env python3
+
+import re, json
+
+class TagDatabaseError(Exception):
+    pass
+
+# This is the dictionary for the rules that translates to proprietary comments:
+#  - cppcheck: /* cppcheck-suppress[id] */
+#  - coverity: /* coverity[id] */
+#  - eclair:   /* -E> hide id 1 "" */
+# Add entries to support more analyzers
+tool_syntax = {
+    "cppcheck":"cppcheck-suppress[VID]",
+    "coverity":"coverity[VID]",
+    "eclair":"-E> hide VID 1 \"\""
+}
+
+
+def get_xen_tag_index_type_regex(tool):
+    return r'^SAF-(\d+)-(safe|false-positive-' + tool + ')$'
+
+
+def get_xen_tag_comment_regex(tool):
+    return r'^[ \t]*/\* +(SAF-\d+-(?:safe|false-positive-' + tool + ')).*\*/$'
+
+
+# Returns a data structure containing dictionaries for safe and false-positive-*
+# Xen tags, the key is the unique index of the tag and the content is the
+# proprietary in-code comment to be used when the tag is found in the codebase
+def load_tag_database(tool, input_files, data_struct = None, schema = "safe"):
+    ret = data_struct if data_struct is not None else {
+        "safe": {},
+        "false-positive-" + tool: {}
+    }
+    database = []
+
+    # Open all input files
+    for file in input_files:
+        try:
+            with open(file, "rt") as handle:
+                content = json.load(handle)
+                database = database + content['content']
+        except json.JSONDecodeError as e:
+            raise TagDatabaseError("JSON decoding error in file {}: {}"
+                                    .format(file, e))
+        except Exception as e:
+            raise TagDatabaseError("Can't open file {}: {}"
+                                    .format(file, e))
+
+    for entry in database:
+        # If the false-positive schema is used, check the proprietary id in the
+        # 'violation-id' field, otherwise rely on the "safe" schema.
+        if schema == "false-positive":
+            proprietary_id = entry['violation-id']
+        elif tool in entry['analyser']:
+            proprietary_id = entry['analyser'][tool]
+        else:
+            proprietary_id = ""
+        if proprietary_id != "":
+            comment=tool_syntax[tool].replace("VID",proprietary_id)
+            # Regex to capture the index of the Xen tag and the schema
+            xen_tag = re.compile(get_xen_tag_index_type_regex(tool))\
+                            .match(entry["id"])
+            if xen_tag and xen_tag.group(1) and xen_tag.group(2):
+                # Save in safe or false-positive-* the key {#id: "comment"}
+                id_number = int(xen_tag.group(1))
+                key = xen_tag.group(2)
+                ret[key][id_number] = "/* {} */\n".format(comment)
+            else:
+                raise TagDatabaseError(
+                        "Error in database file, entry {} has unexpected "
+                        "format.".format(entry["id"])
+                    )
+
+    return ret
+
+
+def substitute_tags(tool, input_file, grep_struct, subs_rules):
+    try:
+        with open(grep_struct["file"], "wt") as outfile:
+
+            try:
+                with open(input_file, "rt") as infile:
+                    parsed_content = infile.readlines()
+            except Exception as e:
+                raise TagDatabaseError("Issue with reading file {}: {}"
+                                       .format(input_file, e))
+
+            # grep_struct contains the line number where the comments are, the
+            # line number starts from 1 but in the array the first line is zero.
+            # For every line where there is a Xen tag comment, get the Xen tag
+            # that is in the capture group zero, extract from the Xen tag the
+            # unique index and the type (safe, false-positive-*) and with those
+            # information access the subs_rules dictionary to see if there is
+            # a match
+            for line_number in grep_struct["matches"]:
+                xen_tag = grep_struct["matches"][line_number][0]
+                xen_tag_regex_obj = re.compile(
+                            get_xen_tag_index_type_regex(tool)).match(xen_tag)
+                id_number = int(xen_tag_regex_obj.group(1))
+                key = xen_tag_regex_obj.group(2)
+                if id_number in subs_rules[key]:
+                    parsed_content[line_number-1] = subs_rules[key][id_number]
+
+            outfile.writelines(parsed_content)
+    except Exception as e:
+        raise TagDatabaseError("Issue with writing file {}: {}"
+                               .format(grep_struct["file"], e))
diff --git a/xen/scripts/xen_analysis/utils.py b/xen/scripts/xen_analysis/utils.py
new file mode 100644
index 000000000000..1193e3f4631e
--- /dev/null
+++ b/xen/scripts/xen_analysis/utils.py
@@ -0,0 +1,56 @@
+#!/usr/bin/env python3
+
+import os, re, subprocess
+
+
+def grep(filepath, regex):
+    regObj = re.compile(regex)
+    res = { "file": filepath, "matches": {} }
+    try:
+        with open(filepath, "rt") as f:
+            line_number = 1
+            for line in f:
+                match = regObj.match(line)
+                if match:
+                    res["matches"][line_number] = match.groups()
+                line_number = line_number + 1
+    except Exception as e:
+        print("WARNING: Can't open {}: {}".format(filepath, e))
+
+    # Return filename and line matches if there are
+    return res if res["matches"] else {}
+
+
+def recursive_find_file(path, filename_regex, action = None):
+    filename_reg_obj = re.compile(filename_regex)
+    res = []
+    for root, dirs, fnames in os.walk(path):
+        for fname in fnames:
+            if filename_reg_obj.match(fname):
+                if action is None:
+                    res.append(os.path.join(root, fname))
+                else:
+                    out = action(os.path.join(root, fname))
+                    if out:
+                        res.append(out)
+
+    return res
+
+
+def invoke_command(command, needs_output, exeption_type = Exception,
+                   exeption_msg = ""):
+    try:
+        pipe_stdout = subprocess.PIPE if (needs_output == True) else None
+        output = subprocess.run(command, shell=True, check=True,
+                                stdout=pipe_stdout, stderr=subprocess.STDOUT,
+                                encoding='utf8')
+    except (subprocess.CalledProcessError, subprocess.SubprocessError) as e:
+        if needs_output == True:
+            exeption_msg = exeption_msg.format(e.cmd, output.stdout)
+        else:
+            exeption_msg = exeption_msg.format(e.cmd)
+        excp = exeption_type(exeption_msg)
+        excp.errorcode = e.returncode if hasattr(e, 'returncode') else 1
+        raise excp
+
+    return output.stdout
-- 
2.17.1


