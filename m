Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8D780C3B5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 09:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651512.1017185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCc4a-0008EE-M9; Mon, 11 Dec 2023 08:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651512.1017185; Mon, 11 Dec 2023 08:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCc4a-0008BN-Ii; Mon, 11 Dec 2023 08:55:32 +0000
Received: by outflank-mailman (input) for mailman id 651512;
 Mon, 11 Dec 2023 08:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCc4Y-0008BA-PT
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 08:55:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 083c4611-9803-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 09:55:28 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id E3BEF4EE073E;
 Mon, 11 Dec 2023 09:55:26 +0100 (CET)
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
X-Inumbo-ID: 083c4611-9803-11ee-98e8-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v2] automation/eclair_analysis: file exclusion automation
Date: Mon, 11 Dec 2023 09:55:16 +0100
Message-Id: <31a802364de17dd457f3ec265302ea27e90ed518.1702284801.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file exclude-list.json contains files that are classified as
adopted code for MISRA compliance. Therefore, this file is used to
automatically generate a suitable .ecl configuration for ECLAIR.

As such, many entries in out_of_scope.ecl can be removed, as they
would be duplicates.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- move include/xen/libfdt/* to exclude-list.json
---
 automation/eclair_analysis/ECLAIR/adopted.sh  | 30 +++++++++
 .../eclair_analysis/ECLAIR/analysis.ecl       |  3 +
 automation/eclair_analysis/ECLAIR/analyze.sh  |  3 +
 .../eclair_analysis/ECLAIR/generate_ecl.sh    | 15 +++++
 .../eclair_analysis/ECLAIR/out_of_scope.ecl   | 64 -------------------
 .../ECLAIR/print_analyzed_files.sh            |  4 +-
 docs/misra/exclude-list.json                  |  4 ++
 7 files changed, 58 insertions(+), 65 deletions(-)
 create mode 100755 automation/eclair_analysis/ECLAIR/adopted.sh
 create mode 100755 automation/eclair_analysis/ECLAIR/generate_ecl.sh

diff --git a/automation/eclair_analysis/ECLAIR/adopted.sh b/automation/eclair_analysis/ECLAIR/adopted.sh
new file mode 100755
index 000000000000..9adbc4e58218
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/adopted.sh
@@ -0,0 +1,30 @@
+#!/bin/bash
+
+# Generates the adopted.ecl file
+
+set -eu
+
+script_name="$(basename "$0")"
+script_dir="$(
+  cd "$(dirname "$0")"
+  echo "${PWD}"
+)"
+
+fatal() {
+  echo "${script_name}: $*" >&2
+  exit 1
+}
+
+usage() {
+  fatal "Usage: ${script_name}"
+}
+
+exclude_list=$1
+outfile=${script_dir}/adopted.ecl
+
+(
+  echo "-doc_begin=\"Adopted files.\"" >"${outfile}"
+  sed -n -E -e 's|^\s+"rel_path":\s+"([^"]*).*$|-file_tag+={adopted,"^xen/\1$"}|p' "${exclude_list}" |
+    sed -E -e 's|\.([ch])|\\\\.\1|g' -e 's|\*|.*|g' >>"${outfile}"
+  printf "%s\n" "-doc_end" >>"${outfile}"
+)
diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
index f8d4cc8c9990..a604582da335 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -21,6 +21,9 @@ map_strings("scheduled-analysis",analysis_kind)
 
 -eval_file=toolchain.ecl
 -eval_file=public_APIs.ecl
+if(not(scheduled_analysis),
+    eval_file("adopted.ecl")
+)
 if(not(scheduled_analysis),
     eval_file("out_of_scope.ecl")
 )
diff --git a/automation/eclair_analysis/ECLAIR/analyze.sh b/automation/eclair_analysis/ECLAIR/analyze.sh
index 47cdbb03cee7..a127e7aaed2d 100755
--- a/automation/eclair_analysis/ECLAIR/analyze.sh
+++ b/automation/eclair_analysis/ECLAIR/analyze.sh
@@ -82,6 +82,9 @@ export ECLAIR_PROJECT_ROOT="${PWD}"
 rm -rf "${ECLAIR_OUTPUT_DIR:?}/*"
 mkdir -p "${ECLAIR_DATA_DIR}"
 
+# Generate additional configuration files 
+"${SCRIPT_DIR}/generate_ecl.sh"
+
 # Perform the build (from scratch) in an ECLAIR environment.
 "${ECLAIR_BIN_DIR}eclair_env" \
     "-config_file='${SCRIPT_DIR}/analysis.ecl'" \
diff --git a/automation/eclair_analysis/ECLAIR/generate_ecl.sh b/automation/eclair_analysis/ECLAIR/generate_ecl.sh
new file mode 100755
index 000000000000..de20728eb1f9
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/generate_ecl.sh
@@ -0,0 +1,15 @@
+#!/bin/bash
+
+# Generates the .ecl files
+
+set -eu
+
+script_dir="$(
+  cd "$(dirname "$0")"
+  echo "${PWD}"
+)"
+
+exclude_list="${ECLAIR_PROJECT_ROOT}/docs/misra/exclude-list.json"
+
+# Generate the exclude list file
+"${script_dir}/adopted.sh" "${exclude_list}"
diff --git a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
index e1ec4a607c63..fd870716cf8d 100644
--- a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
+++ b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
@@ -1,55 +1,3 @@
--doc_begin="Imported from Linux: ignore for now."
--file_tag+={adopted,"^xen/common/libfdt/.*$"}
--file_tag+={adopted,"^xen/include/xen/libfdt/.*$"}
--file_tag+={adopted,"^xen/common/xz/.*$"}
--file_tag+={adopted,"^xen/common/zstd/.*$"}
--file_tag+={adopted,"^xen/drivers/acpi/apei/.*$"}
--file_tag+={adopted,"^xen/drivers/acpi/tables/.*$"}
--file_tag+={adopted,"^xen/drivers/acpi/utilities/.*$"}
--file_tag+={adopted,"^xen/drivers/video/font_.*$"}
--file_tag+={adopted,"^xen/arch/arm/arm64/cpufeature\\.c$"}
--file_tag+={adopted,"^xen/arch/arm/arm64/insn\\.c$"}
--file_tag+={adopted,"^xen/arch/arm/arm64/lib/find_next_bit\\.c$"}
--file_tag+={adopted,"^xen/common/bitmap\\.c$"}
--file_tag+={adopted,"^xen/common/bunzip2\\.c$"}
--file_tag+={adopted,"^xen/common/earlycpio\\.c$"}
--file_tag+={adopted,"^xen/common/inflate\\.c$"}
--file_tag+={adopted,"^xen/common/lzo\\.c$"}
--file_tag+={adopted,"^xen/common/lz4/decompress\\.c$"}
--file_tag+={adopted,"^xen/common/radix-tree\\.c$"}
--file_tag+={adopted,"^xen/common/ubsan/ubsan\\.c$"}
--file_tag+={adopted,"^xen/drivers/acpi/hwregs\\.c$"}
--file_tag+={adopted,"^xen/drivers/acpi/numa\\.c$"}
--file_tag+={adopted,"^xen/drivers/acpi/osl\\.c$"}
--file_tag+={adopted,"^xen/drivers/acpi/tables\\.c$"}
--file_tag+={adopted,"^xen/include/xen/acpi\\.h$"}
--file_tag+={adopted,"^xen/include/acpi/acpiosxf\\.h$"}
--file_tag+={adopted,"^xen/include/acpi/acpixf\\.h$"}
--file_tag+={adopted,"^xen/lib/list-sort\\.c$"}
--file_tag+={adopted,"^xen/lib/rbtree\\.c$"}
--file_tag+={adopted,"^xen/lib/xxhash.*\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/acpi/boot\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/acpi/cpu_idle\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/acpi/cpufreq/cpufreq\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/acpi/cpuidle_menu\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/acpi/lib\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/cpu/amd\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/cpu/centaur\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/cpu/common\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/cpu/hygon\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/cpu/intel\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/cpu/intel_cacheinfo\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/cpu/mcheck/non-fatal\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/cpu/mtrr/.*$"}
--file_tag+={adopted,"^xen/arch/x86/cpu/mwait-idle\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/delay\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/dmi_scan\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/mpparse\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/srat\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/time\\.c$"}
--file_tag+={adopted,"^xen/arch/x86/x86_64/mmconf-fam10h\\.c$"}
--doc_end
-
 -doc_begin="Intel specific source files are out of scope."
 -file_tag+={out_of_scope,"^xen/arch/x86/cpu/intel\\.c$"}
 -file_tag+={out_of_scope,"^xen/arch/x86/cpu/intel_cacheinfo\\.c$"}
@@ -69,18 +17,6 @@
 -file_tag+={out_of_scope,"^xen/arch/x86/include/asm/intel-family\\.h$"}
 -doc_end
 
--doc_begin="Not in scope initially as it generates many violations and it is not enabled in safety configurations."
--file_tag+={adopted,"^xen/xsm/flask/.*$"}
--doc_end
-
--doc_begin="unlz4.c implementation by Yann Collet, the others un* are from Linux, ignore for now."
--file_tag+={adopted,"^xen/common/un.*\\.c$"}
--doc_end
-
--doc_begin="Origin is external and documented in xen/crypto/README.source ."
--file_tag+={adopted,"^xen/crypto/.*$"}
--doc_end
-
 -doc_begin="Files imported from the gnu-efi package"
 -file_tag+={adopted,"^xen/include/efi/.*$"}
 -file_tag+={adopted,"^xen/arch/x86/include/asm/x86_64/efibind\\.h$"}
diff --git a/automation/eclair_analysis/ECLAIR/print_analyzed_files.sh b/automation/eclair_analysis/ECLAIR/print_analyzed_files.sh
index c19a8ecbd061..7d231271617c 100755
--- a/automation/eclair_analysis/ECLAIR/print_analyzed_files.sh
+++ b/automation/eclair_analysis/ECLAIR/print_analyzed_files.sh
@@ -46,7 +46,9 @@ fi
 "${ECLAIR_BIN_DIR}eclair_report" -db="${DB}" -files_txt="${files_txt}"
 
 {
-  # Extracting out of scope code
+  # Extracting out of scope and adopted code
+  adopted_ecl="${script_dir}/adopted.ecl"
+  extrapolate_regex adopted,             "${adopted_ecl}"
   out_of_scope_ecl="${script_dir}/out_of_scope.ecl"
   extrapolate_regex adopted,             "${out_of_scope_ecl}"
   extrapolate_regex out_of_scope_tools,  "${out_of_scope_ecl}"
diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 24e4de3ca524..48f671c548b6 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -117,6 +117,10 @@
             "rel_path": "common/libfdt/*",
             "comment": "External library"
         },
+        {
+          "rel_path": "include/xen/libfdt/*",
+          "comment": "External library"
+        },
         {
             "rel_path": "common/livepatch_elf.c",
             "comment": "Not in scope initially as it generates many violations and it is not enabled in safety configurations"
-- 
2.34.1


