Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17976F6DAA
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 16:26:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529796.824614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZtr-0004l6-M0; Thu, 04 May 2023 14:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529796.824614; Thu, 04 May 2023 14:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZtr-0004hm-HZ; Thu, 04 May 2023 14:25:39 +0000
Received: by outflank-mailman (input) for mailman id 529796;
 Thu, 04 May 2023 14:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZDr=AZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1puZtp-00049d-MN
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 14:25:37 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8949c1f3-ea87-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 16:25:36 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D3A4139F;
 Thu,  4 May 2023 07:26:20 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90E7E3F67D;
 Thu,  4 May 2023 07:25:34 -0700 (PDT)
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
X-Inumbo-ID: 8949c1f3-ea87-11ed-b226-6b7b168915f2
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
Subject: [PATCH 2/2] xen/misra: diff-report.py: add report patching feature
Date: Thu,  4 May 2023 15:25:23 +0100
Message-Id: <20230504142523.2989306-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504142523.2989306-1-luca.fancellu@arm.com>
References: <20230504142523.2989306-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a feature to the diff-report.py script that improves the comparison
between two analysis report, one from a baseline codebase and the other
from the changes applied to the baseline.

The comparison between reports of different codebase is an issue because
entries in the baseline could have been moved in position due to addition
or deletion of unrelated lines or can disappear because of deletion of
the interested line, making the comparison between two revisions of the
code harder.

Having a baseline report, a report of the codebase with the changes
called "new report" and a git diff format file that describes the
changes happened to the code from the baseline, this feature can
understand which entries from the baseline report are deleted or shifted
in position due to changes to unrelated lines and can modify them as
they will appear in the "new report".

Having the "patched baseline" and the "new report", now it's simple
to make the diff between them and print only the entry that are new.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/scripts/diff-report.py                    |  55 ++++-
 xen/scripts/xen_analysis/diff_tool/debug.py   |  19 ++
 xen/scripts/xen_analysis/diff_tool/report.py  |  84 ++++++++
 .../diff_tool/unified_format_parser.py        | 202 ++++++++++++++++++
 4 files changed, 358 insertions(+), 2 deletions(-)
 create mode 100644 xen/scripts/xen_analysis/diff_tool/unified_format_parser.py

diff --git a/xen/scripts/diff-report.py b/xen/scripts/diff-report.py
index 4913fb43a8f9..17f707f5d34e 100755
--- a/xen/scripts/diff-report.py
+++ b/xen/scripts/diff-report.py
@@ -5,6 +5,10 @@ from argparse import ArgumentParser
 from xen_analysis.diff_tool.debug import Debug
 from xen_analysis.diff_tool.report import ReportError
 from xen_analysis.diff_tool.cppcheck_report import CppcheckReport
+from xen_analysis.diff_tool.unified_format_parser import \
+    (UnifiedFormatParser, UnifiedFormatParseError)
+from xen_analysis.utils import invoke_command
+from xen_analysis.settings import repo_dir
 
 
 def log_info(text, end='\n'):
@@ -32,9 +36,32 @@ def main(argv):
                              "against the baseline.")
     parser.add_argument("-v", "--verbose", action='store_true',
                         help="Print more informations during the run.")
+    parser.add_argument("--patch", type=str,
+                        help="The patch file containing the changes to the "
+                             "code, from the baseline analysis result to the "
+                             "'check report' analysis result.\n"
+                             "Do not use with --baseline-rev/--report-rev")
+    parser.add_argument("--baseline-rev", type=str,
+                        help="Revision or SHA of the codebase analysed to "
+                             "create the baseline report.\n"
+                             "Use together with --report-rev")
+    parser.add_argument("--report-rev", type=str,
+                        help="Revision or SHA of the codebase analysed to "
+                             "create the 'check report'.\n"
+                             "Use together with --baseline-rev")
 
     args = parser.parse_args()
 
+    if args.patch and (args.baseline_rev or args.report_rev):
+        print("ERROR: '--patch' argument can't be used with '--baseline-rev'"
+              " or '--report-rev'.")
+        sys.exit(1)
+
+    if bool(args.baseline_rev) != bool(args.report_rev):
+        print("ERROR: '--baseline-rev' must be used together with "
+              "'--report-rev'.")
+        sys.exit(1)
+
     if args.out == "stdout":
         file_out = sys.stdout
     else:
@@ -59,11 +86,35 @@ def main(argv):
         new_rep.parse()
         debug.debug_print_parsed_report(new_rep)
         log_info(" [OK]")
-    except ReportError as e:
+        diff_source = None
+        if args.patch:
+            diff_source = os.path.realpath(args.patch)
+        elif args.baseline_rev:
+            git_diff = invoke_command(
+                "git diff --git-dir={} -C -C {}..{}".format(repo_dir,
+                                                            args.baseline_rev,
+                                                            args.report_rev),
+                True, "Error occured invoking:\n{}\n\n{}"
+            )
+            diff_source = git_diff.splitlines(keepends=True)
+        if diff_source:
+            log_info("Parsing changes...", "")
+            diffs = UnifiedFormatParser(diff_source)
+            debug.debug_print_parsed_diff(diffs)
+            log_info(" [OK]")
+    except (ReportError, UnifiedFormatParseError) as e:
         print("ERROR: {}".format(e))
         sys.exit(1)
 
-    output = new_rep - baseline
+    if args.patch or args.baseline_rev:
+        log_info("Patching baseline...", "")
+        baseline_patched = baseline.patch(diffs)
+        debug.debug_print_patched_report(baseline_patched)
+        log_info(" [OK]")
+        output = new_rep - baseline_patched
+    else:
+        output = new_rep - baseline
+
     print(output, end="", file=file_out)
 
     if len(output) > 0:
diff --git a/xen/scripts/xen_analysis/diff_tool/debug.py b/xen/scripts/xen_analysis/diff_tool/debug.py
index d46df3300d21..c314edbc8e38 100644
--- a/xen/scripts/xen_analysis/diff_tool/debug.py
+++ b/xen/scripts/xen_analysis/diff_tool/debug.py
@@ -2,6 +2,7 @@
 
 import os
 from .report import Report
+from .unified_format_parser import UnifiedFormatParser
 
 
 class Debug:
@@ -34,3 +35,21 @@ class Debug:
         if not self.args.debug:
             return
         self.__debug_print_report(report, ".parsed")
+
+    def debug_print_patched_report(self, report: Report) -> None:
+        if not self.args.debug:
+            return
+        # The patched report contains already .patched in its name
+        self.__debug_print_report(report, "")
+
+    def debug_print_parsed_diff(self, diff: UnifiedFormatParser) -> None:
+        if not self.args.debug:
+            return
+        diff_filename = diff.get_diff_path()
+        out_pathname = self.__get_debug_out_filename(diff_filename, ".parsed")
+        try:
+            with open(out_pathname, "wt") as outfile:
+                for change_obj in diff.get_change_sets().values():
+                    print(change_obj, end="", file=outfile)
+        except OSError as e:
+            print("ERROR: Issue opening file {}: {}".format(out_pathname, e))
diff --git a/xen/scripts/xen_analysis/diff_tool/report.py b/xen/scripts/xen_analysis/diff_tool/report.py
index d958d1816eb4..312d59682329 100644
--- a/xen/scripts/xen_analysis/diff_tool/report.py
+++ b/xen/scripts/xen_analysis/diff_tool/report.py
@@ -1,6 +1,7 @@
 #!/usr/bin/env python3
 
 import os
+from .unified_format_parser import UnifiedFormatParser, ChangeSet
 
 
 class ReportError(Exception):
@@ -65,6 +66,89 @@ class Report:
             self.__entries[entry_path] = [entry]
         self.__last_line_order += 1
 
+    def remove_entries(self, entry_file_path: str) -> None:
+        del self.__entries[entry_file_path]
+
+    def remove_entry(self, entry_path: str, line_id: int) -> None:
+        if entry_path in self.__entries.keys():
+            len_entry_path = len(self.__entries[entry_path])
+            if len_entry_path == 1:
+                del self.__entries[entry_path]
+            else:
+                if line_id in self.__entries[entry_path]:
+                    self.__entries[entry_path].remove(line_id)
+
+    def patch(self, diff_obj: UnifiedFormatParser) -> 'Report':
+        filename, file_extension = os.path.splitext(self.__path)
+        patched_report = self.__class__(filename + ".patched" + file_extension)
+        remove_files = []
+        rename_files = []
+        remove_entry = []
+        ChangeMode = ChangeSet.ChangeMode
+
+        # Copy entries from this report to the report we are going to patch
+        for entries in self.__entries.values():
+            for entry in entries:
+                patched_report.add_entry(entry.file_path, entry.line_number,
+                                         entry.text)
+
+        # Patch the output report
+        patched_rep_entries = patched_report.get_report_entries()
+        for file_diff, change_obj in diff_obj.get_change_sets().items():
+            if change_obj.is_change_mode(ChangeMode.COPY):
+                # Copy the original entry pointed by change_obj.orig_file into
+                # a new key in the patched report named change_obj.dst_file,
+                # that here is file_diff variable content, because this
+                # change_obj is pushed into the change_sets with the
+                # change_obj.dst_file key
+                if change_obj.orig_file in self.__entries.keys():
+                    for entry in self.__entries[change_obj.orig_file]:
+                        patched_report.add_entry(file_diff,
+                                                 entry.line_number,
+                                                 entry.text)
+
+            if file_diff in patched_rep_entries.keys():
+                if change_obj.is_change_mode(ChangeMode.DELETE):
+                    # No need to check changes here, just remember to delete
+                    # the file from the report
+                    remove_files.append(file_diff)
+                    continue
+                elif change_obj.is_change_mode(ChangeMode.RENAME):
+                    # Remember to rename the file entry on this report
+                    rename_files.append(change_obj)
+
+                for line_num, change_type in change_obj.get_change_set():
+                    len_rep = len(patched_rep_entries[file_diff])
+                    for i in range(len_rep):
+                        rep_item = patched_rep_entries[file_diff][i]
+                        if change_type == ChangeSet.ChangeType.REMOVE:
+                            if rep_item.line_number == line_num:
+                                # This line is removed with this changes,
+                                # append to the list of entries to be removed
+                                remove_entry.append(rep_item)
+                            elif rep_item.line_number > line_num:
+                                rep_item.line_number -= 1
+                        elif change_type == ChangeSet.ChangeType.ADD:
+                            if rep_item.line_number >= line_num:
+                                rep_item.line_number += 1
+                    # Remove deleted entries from the list
+                    if len(remove_entry) > 0:
+                        for entry in remove_entry:
+                            patched_report.remove_entry(entry.file_path,
+                                                        entry.line_id)
+                        remove_entry.clear()
+
+        if len(remove_files) > 0:
+            for file_name in remove_files:
+                patched_report.remove_entries(file_name)
+
+        if len(rename_files) > 0:
+            for change_obj in rename_files:
+                patched_rep_entries[change_obj.dst_file] = \
+                    patched_rep_entries.pop(change_obj.orig_file)
+
+        return patched_report
+
     def to_list(self) -> list:
         report_list = []
         for _, entries in self.__entries.items():
diff --git a/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py b/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py
new file mode 100644
index 000000000000..e34cc8ac063f
--- /dev/null
+++ b/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py
@@ -0,0 +1,202 @@
+#!/usr/bin/env python3
+
+import re
+from enum import Enum
+from typing import Tuple
+
+
+class UnifiedFormatParseError(Exception):
+    pass
+
+
+class ParserState(Enum):
+    FIND_DIFF_HEADER = 0
+    REGISTER_CHANGES = 1
+    FIND_HUNK_OR_DIFF_HEADER = 2
+
+
+class ChangeSet:
+    class ChangeType(Enum):
+        REMOVE = 0
+        ADD = 1
+
+    class ChangeMode(Enum):
+        NONE = 0
+        CHANGE = 1
+        RENAME = 2
+        DELETE = 3
+        COPY = 4
+
+    def __init__(self, a_file: str, b_file: str) -> None:
+        self.orig_file = a_file
+        self.dst_file = b_file
+        self.change_mode = ChangeSet.ChangeMode.NONE
+        self.__changes = []
+
+    def __str__(self) -> str:
+        str_out = "{}: {} -> {}:\n{}\n".format(
+            str(self.change_mode), self.orig_file, self.dst_file,
+            str(self.__changes)
+        )
+        return str_out
+
+    def set_change_mode(self, change_mode: ChangeMode) -> None:
+        self.change_mode = change_mode
+
+    def is_change_mode(self, change_mode: ChangeMode) -> bool:
+        return self.change_mode == change_mode
+
+    def add_change(self, line_number: int, change_type: ChangeType) -> None:
+        self.__changes.append((line_number, change_type))
+
+    def get_change_set(self) -> dict:
+        return self.__changes
+
+
+class UnifiedFormatParser:
+    def __init__(self, args: str | list) -> None:
+        if isinstance(args, str):
+            self.__diff_file = args
+            try:
+                with open(self.__diff_file, "rt") as infile:
+                    self.__diff_lines = infile.readlines()
+            except OSError as e:
+                raise UnifiedFormatParseError(
+                    "Issue with reading file {}: {}"
+                    .format(self.__diff_file, e)
+                )
+        elif isinstance(args, list):
+            self.__diff_file = "git-diff-local.txt"
+            self.__diff_lines = args
+        else:
+            raise UnifiedFormatParseError(
+                "UnifiedFormatParser constructor called with wrong arguments")
+
+        self.__git_diff_header = re.compile(r'^diff --git a/(.*) b/(.*)$')
+        self.__git_hunk_header = \
+            re.compile(r'^@@ -\d+,(\d+) \+(\d+),(\d+) @@.*$')
+        self.__diff_set = {}
+        self.__parse()
+
+    def get_diff_path(self) -> str:
+        return self.__diff_file
+
+    def add_change_set(self, change_set: ChangeSet) -> None:
+        if not change_set.is_change_mode(ChangeSet.ChangeMode.NONE):
+            if change_set.is_change_mode(ChangeSet.ChangeMode.COPY):
+                # Add copy change mode items using the dst_file key, because
+                # there might be other changes for the orig_file in this diff
+                self.__diff_set[change_set.dst_file] = change_set
+            else:
+                self.__diff_set[change_set.orig_file] = change_set
+
+    def __parse(self) -> None:
+        def parse_diff_header(line: str) -> ChangeSet | None:
+            change_item = None
+            diff_head = self.__git_diff_header.match(line)
+            if diff_head and diff_head.group(1) and diff_head.group(2):
+                change_item = ChangeSet(diff_head.group(1), diff_head.group(2))
+
+            return change_item
+
+        def parse_hunk_header(line: str) -> Tuple[int, int, int]:
+            file_linenum = -1
+            hunk_a_linemax = -1
+            hunk_b_linemax = -1
+            hunk_head = self.__git_hunk_header.match(line)
+            if hunk_head and hunk_head.group(1) and hunk_head.group(2) \
+               and hunk_head.group(3):
+                file_linenum = int(hunk_head.group(2))
+                hunk_a_linemax = int(hunk_head.group(1))
+                hunk_b_linemax = int(hunk_head.group(3))
+
+            return (file_linenum, hunk_a_linemax, hunk_b_linemax)
+
+        file_linenum = 0
+        hunk_a_linemax = 0
+        hunk_b_linemax = 0
+        diff_elem = None
+        parse_state = ParserState.FIND_DIFF_HEADER
+        ChangeMode = ChangeSet.ChangeMode
+        ChangeType = ChangeSet.ChangeType
+
+        for line in self.__diff_lines:
+            if parse_state == ParserState.FIND_DIFF_HEADER:
+                diff_elem = parse_diff_header(line)
+                if diff_elem:
+                    # Found the diff header, go to the next stage
+                    parse_state = ParserState.FIND_HUNK_OR_DIFF_HEADER
+            elif parse_state == ParserState.FIND_HUNK_OR_DIFF_HEADER:
+                # Here only these change modalities will be registered:
+                # deleted file mode <mode>
+                # rename from <path>
+                # rename to <path>
+                # copy from <path>
+                # copy to <path>
+                #
+                # These will be ignored:
+                # old mode <mode>
+                # new mode <mode>
+                # new file mode <mode>
+                #
+                # Also these info will be ignored
+                # similarity index <number>
+                # dissimilarity index <number>
+                # index <hash>..<hash> <mode>
+                if line.startswith("deleted file"):
+                    # If the file is deleted, register it but don't go through
+                    # the changes that will be only a set of lines removed
+                    diff_elem.set_change_mode(ChangeMode.DELETE)
+                    parse_state = ParserState.FIND_DIFF_HEADER
+                elif line.startswith("new file"):
+                    # If the file is new, skip it, as it doesn't give any
+                    # useful information on the report translation
+                    parse_state = ParserState.FIND_DIFF_HEADER
+                elif line.startswith("rename to"):
+                    # Renaming operation can be a pure renaming or a rename
+                    # and a set of change, so keep looking for the hunk
+                    # header
+                    diff_elem.set_change_mode(ChangeMode.RENAME)
+                elif line.startswith("copy to"):
+                    # This is a copy operation, mark it
+                    diff_elem.set_change_mode(ChangeMode.COPY)
+                else:
+                    # Look for the hunk header
+                    (file_linenum, hunk_a_linemax, hunk_b_linemax) = \
+                        parse_hunk_header(line)
+                    if file_linenum >= 0:
+                        if diff_elem.is_change_mode(ChangeMode.NONE):
+                            # The file has only changes
+                            diff_elem.set_change_mode(ChangeMode.CHANGE)
+                        parse_state = ParserState.REGISTER_CHANGES
+                    else:
+                        # ... or there could be a diff header
+                        new_diff_elem = parse_diff_header(line)
+                        if new_diff_elem:
+                            # Found a diff header, register the last change
+                            # item
+                            self.add_change_set(diff_elem)
+                            diff_elem = new_diff_elem
+            elif parse_state == ParserState.REGISTER_CHANGES:
+                if (hunk_b_linemax > 0) and line.startswith("+"):
+                    diff_elem.add_change(file_linenum, ChangeType.ADD)
+                    hunk_b_linemax -= 1
+                elif (hunk_a_linemax > 0) and line.startswith("-"):
+                    diff_elem.add_change(file_linenum, ChangeType.REMOVE)
+                    hunk_a_linemax -= 1
+                    file_linenum -= 1
+                elif ((hunk_a_linemax + hunk_b_linemax) > 0) and \
+                        line.startswith(" "):
+                    hunk_a_linemax -= 1 if (hunk_a_linemax > 0) else 0
+                    hunk_b_linemax -= 1 if (hunk_b_linemax > 0) else 0
+
+                if (hunk_a_linemax + hunk_b_linemax) <= 0:
+                    parse_state = ParserState.FIND_HUNK_OR_DIFF_HEADER
+
+                file_linenum += 1
+
+        if diff_elem is not None:
+            self.add_change_set(diff_elem)
+
+    def get_change_sets(self) -> dict:
+        return self.__diff_set
-- 
2.34.1


