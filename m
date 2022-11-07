Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4F461F11B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 11:48:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439285.693333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzfW-0002Z8-2S; Mon, 07 Nov 2022 10:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439285.693333; Mon, 07 Nov 2022 10:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzfV-0002W9-TJ; Mon, 07 Nov 2022 10:47:53 +0000
Received: by outflank-mailman (input) for mailman id 439285;
 Mon, 07 Nov 2022 10:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=or3T=3H=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1orzfU-0002Pj-Gt
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 10:47:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9eebd907-5e89-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 11:47:49 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9397823A;
 Mon,  7 Nov 2022 02:47:55 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23ED53F73D;
 Mon,  7 Nov 2022 02:47:48 -0800 (PST)
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
X-Inumbo-ID: 9eebd907-5e89-11ed-8fd1-01056ac49cbb
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
Subject: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and analysis-eclair
Date: Mon,  7 Nov 2022 10:47:36 +0000
Message-Id: <20221107104739.10404-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221107104739.10404-1-luca.fancellu@arm.com>
References: <20221107104739.10404-1-luca.fancellu@arm.com>

Add new targets to makefile, analysis-{coverity,eclair} that will:
 - Create a tag database using a new tool called xenfusa-gen-tags.py
 - Get every file with the FuSa tag SAF- in-code comment, create a
   copy of it as <file>.safparse and substituting the tags with
   proprietary tool syntax in-code comments using the database.
 - build Xen, coverity and eclair are capable of intercepting the
   compiler invocation on every build file so the only action from
   them is to run these new targets, the file they will analyse will
   automatically contain understandable suppression in-code comment
   for them.
 - call analysis-clean to restore original files.

In case of any error, the user needs to manually run the target
analysis-clean to restore the original files, before that step, any
following run of analysis-{coverity,eclair} will stop and won't
overwrite the original files.

Add in docs/misra/ the files safe.json and
false-positive-{coverity,eclair}.json that are JSON files containing
the data structures for the justifications, they are used by the
xenfusa-gen-tags.py to create the substitution list.

Add docs/misra/documenting-violations.rst to explain how to add
justifications.

Add files to .gitignore and update clean rule content in Makefile.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .gitignore                              |   2 +
 docs/misra/documenting-violations.rst   | 172 ++++++++++++++++++++++++
 docs/misra/false-positive-coverity.json |  12 ++
 docs/misra/false-positive-eclair.json   |  12 ++
 docs/misra/safe.json                    |  11 ++
 xen/Makefile                            |  50 ++++++-
 xen/tools/xenfusa-gen-tags.py           |  81 +++++++++++
 7 files changed, 338 insertions(+), 2 deletions(-)
 create mode 100644 docs/misra/documenting-violations.rst
 create mode 100644 docs/misra/false-positive-coverity.json
 create mode 100644 docs/misra/false-positive-eclair.json
 create mode 100644 docs/misra/safe.json
 create mode 100755 xen/tools/xenfusa-gen-tags.py

diff --git a/.gitignore b/.gitignore
index 418bdfaebf36..b48e1e20c4fc 100644
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
@@ -314,6 +315,7 @@ xen/xsm/flask/policy.*
 xen/xsm/flask/xenpolicy-*
 tools/flask/policy/policy.conf
 tools/flask/policy/xenpolicy-*
+xen/*.sed
 xen/xen
 xen/xen-cppcheck.xml
 xen/xen-syms
diff --git a/docs/misra/documenting-violations.rst b/docs/misra/documenting-violations.rst
new file mode 100644
index 000000000000..3430abfaa177
--- /dev/null
+++ b/docs/misra/documenting-violations.rst
@@ -0,0 +1,172 @@
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
+named as safe.json and false-positive-<tool>.json, they have JSON format.
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
+Here is an example to add a new justification in false-positive-<tool>.json::
+
+|{
+|    "version": "1.0",
+|    "content": [
+|        {
+|            "id": "SAF-0-false-positive-<tool>",
+|            "analyser": {
+|                "<tool>": "<proprietary-id>"
+|            },
+|            "tool-version": "<version>",
+|            "name": "R20.7 [...]",
+|            "text": "[...]"
+|        },
+|        {
+|            "id": "SAF-1-false-positive-<tool>",
+|            "analyser": {},
+|            "tool-version": "",
+|            "name": "Sentinel",
+|            "text": "Next ID to be used"
+|        }
+|    ]
+|}
+
+To document a finding, just add another block {[...]} before the sentinel block,
+using the id contained in the sentinel block and increment by one the number
+contained in the id of the sentinel block.
+
+Here an explanation of the field inside an object of the "content" array:
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
index 000000000000..f8e6a014acb5
--- /dev/null
+++ b/docs/misra/false-positive-coverity.json
@@ -0,0 +1,12 @@
+{
+    "version": "1.0",
+    "content": [
+        {
+            "id": "SAF-0-false-positive-coverity",
+            "analyser": {},
+            "tool-version": "",
+            "name": "Sentinel",
+            "text": "Next ID to be used"
+        }
+    ]
+}
diff --git a/docs/misra/false-positive-eclair.json b/docs/misra/false-positive-eclair.json
new file mode 100644
index 000000000000..63d00e160f9c
--- /dev/null
+++ b/docs/misra/false-positive-eclair.json
@@ -0,0 +1,12 @@
+{
+    "version": "1.0",
+    "content": [
+        {
+            "id": "SAF-0-false-positive-eclair",
+            "analyser": {},
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
diff --git a/xen/Makefile b/xen/Makefile
index 9d0df5e2c543..3b8d1acd1697 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -457,7 +457,8 @@ endif # need-config
 
 __all: build
 
-main-targets := build install uninstall clean distclean MAP cppcheck cppcheck-html
+main-targets := build install uninstall clean distclean MAP cppcheck \
+    cppcheck-html analysis-coverity analysis-eclair
 .PHONY: $(main-targets)
 ifneq ($(XEN_TARGET_ARCH),x86_32)
 $(main-targets): %: _% ;
@@ -572,7 +573,7 @@ _clean:
 	rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.stripped
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
-	rm -f cppcheck-misra.* xen-cppcheck.xml
+	rm -f cppcheck-misra.* xen-cppcheck.xml *.sed
 
 .PHONY: _distclean
 _distclean: clean
@@ -757,6 +758,51 @@ cppcheck-version:
 $(objtree)/include/generated/compiler-def.h:
 	$(Q)$(CC) -dM -E -o $@ - < /dev/null
 
+JUSTIFICATION_FILES := $(XEN_ROOT)/docs/misra/safe.json \
+                       $(XEN_ROOT)/docs/misra/false-positive-$$*.json
+
+# The following command is using grep to find all files that contains a comment
+# containing "SAF-<anything>" on a single line.
+# %.safparse will be the original files saved from the build system, these files
+# will be restored at the end of the analysis step
+PARSE_FILE_LIST := $(addsuffix .safparse,$(filter-out %.safparse,\
+$(shell grep -ERl '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree))))
+
+.PRECIOUS: $(PARSE_FILE_LIST) $(objtree)/%.sed
+
+.SECONDEXPANSION:
+$(objtree)/%.sed: $(JUSTIFICATION_FILES) $(srctree)/tools/xenfusa-gen-tags.py
+	$(PYTHON) $(srctree)/tools/xenfusa-gen-tags.py \
+		$(foreach file, $(filter %.json, $^), --input $(file)) --output $@ \
+		--tool $*
+
+%.safparse: %
+# Create a copy of the original file (-p preserves also timestamp)
+	$(Q)if [ -f "$@" ]; then \
+		echo "Found $@, please check the integrity of $*"; \
+		exit 1; \
+	fi
+	$(Q)cp -p "$*" "$@"
+
+analysis-parse-tags-%: $(PARSE_FILE_LIST) $(objtree)/%.sed
+	$(Q)for file in $(patsubst %.safparse,%,$(PARSE_FILE_LIST)); do \
+		sed -i -f "$(objtree)/$*.sed" "$${file}"; \
+	done
+
+analysis-build-%: analysis-parse-tags-%
+	$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile build
+
+analysis-clean:
+# Reverts the original file (-p preserves also timestamp)
+	$(Q)find $(srctree) -type f -name "*.safparse" -print | \
+	while IFS= read file; do \
+		cp -p "$${file}" "$${file%.safparse}"; \
+		rm -f "$${file}"; \
+	done
+
+_analysis-%: analysis-build-%
+	$(Q)$(MAKE) O=$(abs_objtree) -f $(srctree)/Makefile analysis-clean
+
 endif #config-build
 endif # need-sub-make
 
diff --git a/xen/tools/xenfusa-gen-tags.py b/xen/tools/xenfusa-gen-tags.py
new file mode 100755
index 000000000000..4ab8c0f07a52
--- /dev/null
+++ b/xen/tools/xenfusa-gen-tags.py
@@ -0,0 +1,81 @@
+#!/usr/bin/env python
+
+import sys, getopt, json
+
+def help():
+    print('Usage: {} [OPTION] ...'.format(sys.argv[0]))
+    print('')
+    print('This script converts the justification file to a set of sed rules')
+    print('that will replace generic tags from Xen codebase in-code comments')
+    print('to in-code comments having the proprietary syntax for the selected')
+    print('tool.')
+    print('')
+    print('Options:')
+    print('  -i/--input   Json file containing the justifications, can be')
+    print('               passed multiple times for multiple files')
+    print('  -o/--output  Sed file containing the substitution rules')
+    print('  -t/--tool    Tool that will use the in-code comments')
+    print('')
+
+# This is the dictionary for the rules that translates to proprietary comments:
+#  - cppcheck: /* cppcheck-suppress[id] */
+#  - coverity: /* coverity[id] */
+#  - eclair:   /* -E> hide id 1 "" */
+# Add entries to support more analyzers
+tool_syntax = {
+    "cppcheck":"s,^.*/*[[:space:]]*TAG.*$,/* cppcheck-suppress[VID] */,g",
+    "coverity":"s,^.*/*[[:space:]]*TAG.*$,/* coverity[VID] */,g",
+    "eclair":"s,^.*/*[[:space:]]*TAG.*$,/* -E> hide VID 1 \"\" */,g"
+}
+
+def main(argv):
+    infiles = []
+    justifications = []
+    outfile = ''
+    tool = ''
+
+    try:
+        opts, args = getopt.getopt(argv,"hi:o:t:",["input=","output=","tool="])
+    except getopt.GetoptError:
+        help()
+        sys.exit(2)
+    for opt, arg in opts:
+        if opt == '-h':
+            help()
+            sys.exit(0)
+        elif opt in ("-i", "--input"):
+            infiles.append(arg)
+        elif opt in ("-o", "--output"):
+            outfile = arg
+        elif opt in ("-t", "--tool"):
+            tool = arg
+
+    # Open all input files
+    for file in infiles:
+        try:
+            handle = open(file, 'rt')
+            content = json.load(handle)
+            justifications = justifications + content['content']
+            handle.close()
+        except json.JSONDecodeError:
+            print('JSON decoding error in file: ' + file)
+        except:
+            print('Error opening ' + file)
+            sys.exit(1)
+
+    try:
+        outstr = open(outfile, "w")
+    except:
+        print('Error creating ' + outfile)
+        sys.exit(1)
+
+    for j in justifications:
+        if tool in j['analyser']:
+            comment=tool_syntax[tool].replace("TAG",j['id'])
+            comment=comment.replace("VID",j['analyser'][tool])
+            outstr.write('{}\n'.format(comment))
+
+    outstr.close()
+
+if __name__ == "__main__":
+   main(sys.argv[1:])
\ No newline at end of file
-- 
2.17.1


