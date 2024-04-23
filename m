Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3198AEA7A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:15:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710803.1110342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHrG-00038f-8L; Tue, 23 Apr 2024 15:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710803.1110342; Tue, 23 Apr 2024 15:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHrG-00036Q-3e; Tue, 23 Apr 2024 15:14:58 +0000
Received: by outflank-mailman (input) for mailman id 710803;
 Tue, 23 Apr 2024 15:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=is0t=L4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rzHrE-00033C-20
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:14:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d1f0063-0184-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:14:54 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 121A74EE073C;
 Tue, 23 Apr 2024 17:14:54 +0200 (CEST)
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
X-Inumbo-ID: 3d1f0063-0184-11ef-909a-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [XEN PATCH] automation/eclair: reorganize pipelines
Date: Tue, 23 Apr 2024 17:14:33 +0200
Message-Id: <fe1fe9c964d1f2ba3cb46cbaf798cf698f341386.1713885065.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simone Ballarin <simone.ballarin@bugseng.com>

Introduce accepted_guidelines.sh: a script to autogenerate the
configuration file accepted.ecl from docs/misra/rules.rst which enables
all accepted guidelines.

Introduce monitored.ecl: a manual selection of accepted guidelines
which are clean or almost clean, it is intended to be used for the
analyses triggered by commits.

Reorganize tagging.ecl:
  -Remove "accepted" tags: keeping track of accepted guidelines tagging
   them as "accepted" in the configuration file tagging.ecl is no
   longer needed since docs/rules.rst is keeping track of them.
  -Tag more guidelines as clean.

Reorganize eclair pipelines:
  - Set1, Set2, Set3 are now obsolete: remove the corresponding
    pipelines and ecl files.
  - Amend scheduled eclair pipeline to use accepted.ecl.
  - Amend triggered eclair pipeline to use monitored.ecl.

Rename and improve action_check_clean_regressions.sh to print a
diagnostic in case a commit introduces a violation of a clean guideline.

An example of diagnostic is the following:

Failure: 13 regressions found for clean guidelines
  service MC3R1.R8.2: (required) Function types shall be in prototype form with named parameters:
   violation: 13

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/Set2.ecl    | 25 -------
 automation/eclair_analysis/ECLAIR/Set3.ecl    | 67 -------------------
 .../ECLAIR/accepted_guidelines.sh             | 13 ++++
 .../eclair_analysis/ECLAIR/action.helpers     |  3 +-
 .../eclair_analysis/ECLAIR/action.settings    |  1 +
 .../ECLAIR/action_check_clean_regressions.sh  | 38 +++++++++++
 .../ECLAIR/action_clean_added.sh              | 36 ----------
 automation/eclair_analysis/ECLAIR/analyze.sh  |  2 +-
 .../eclair_analysis/ECLAIR/generate_ecl.sh    |  4 ++
 .../ECLAIR/{Set1.ecl => monitored.ecl}        | 57 +++++++++++-----
 automation/eclair_analysis/ECLAIR/tagging.ecl | 15 +----
 automation/gitlab-ci/analyze.yaml             | 48 ++-----------
 automation/scripts/eclair                     |  8 +--
 13 files changed, 108 insertions(+), 209 deletions(-)
 delete mode 100644 automation/eclair_analysis/ECLAIR/Set2.ecl
 delete mode 100644 automation/eclair_analysis/ECLAIR/Set3.ecl
 create mode 100755 automation/eclair_analysis/ECLAIR/accepted_guidelines.sh
 create mode 100755 automation/eclair_analysis/ECLAIR/action_check_clean_regressions.sh
 delete mode 100755 automation/eclair_analysis/ECLAIR/action_clean_added.sh
 rename automation/eclair_analysis/ECLAIR/{Set1.ecl => monitored.ecl} (67%)

diff --git a/automation/eclair_analysis/ECLAIR/Set2.ecl b/automation/eclair_analysis/ECLAIR/Set2.ecl
deleted file mode 100644
index 7608335cf4..0000000000
--- a/automation/eclair_analysis/ECLAIR/Set2.ecl
+++ /dev/null
@@ -1,25 +0,0 @@
--doc_begin="Set 2 of Xen MISRA C guidelines"
--enable=MC3R1.R10.1
--enable=MC3R1.R10.2
--enable=MC3R1.R10.3
--enable=MC3R1.R10.4
--enable=MC3R1.R10.6
--enable=MC3R1.R10.7
--enable=MC3R1.R10.8
--enable=MC3R1.R11.1
--enable=MC3R1.R11.2
--enable=MC3R1.R11.3
--enable=MC3R1.R11.6
--enable=MC3R1.R11.7
--enable=MC3R1.R11.8
--enable=MC3R1.R11.9
--enable=MC3R1.R12.2
--enable=MC3R1.R13.1
--enable=MC3R1.R13.2
--enable=MC3R1.R13.5
--enable=MC3R1.R13.6
--enable=MC3R1.R14.1
--enable=MC3R1.R14.2
--enable=MC3R1.R14.3
--enable=MC3R1.R14.4
--doc_end
diff --git a/automation/eclair_analysis/ECLAIR/Set3.ecl b/automation/eclair_analysis/ECLAIR/Set3.ecl
deleted file mode 100644
index d2c2c4b21f..0000000000
--- a/automation/eclair_analysis/ECLAIR/Set3.ecl
+++ /dev/null
@@ -1,67 +0,0 @@
--doc_begin="Set 3 of Xen MISRA C guidelines"
--enable=MC3R1.D4.12
--enable=MC3R1.R5.5
--enable=MC3R1.R5.7
--enable=MC3R1.R5.8
--enable=MC3R1.R15.2
--enable=MC3R1.R15.3
--enable=MC3R1.R15.6
--enable=MC3R1.R15.7
--enable=MC3R1.R16.1
--enable=MC3R1.R16.2
--enable=MC3R1.R16.3
--enable=MC3R1.R16.4
--enable=MC3R1.R16.5
--enable=MC3R1.R16.6
--enable=MC3R1.R16.7
--enable=MC3R1.R17.1
--enable=MC3R1.R17.2
--enable=MC3R1.R17.5
--enable=MC3R1.R17.7
--enable=MC3R1.R18.1
--enable=MC3R1.R18.2
--enable=MC3R1.R18.3
--enable=MC3R1.R18.6
--enable=MC3R1.R18.7
--enable=MC3R1.R18.8
--enable=MC3R1.R20.2
--enable=MC3R1.R20.3
--enable=MC3R1.R20.4
--enable=MC3R1.R20.6
--enable=MC3R1.R20.7
--enable=MC3R1.R20.8
--enable=MC3R1.R20.9
--enable=MC3R1.R20.11
--enable=MC3R1.R20.12
--enable=MC3R1.R20.13
--enable=MC3R1.R20.14
--enable=MC3R1.R21.1
--enable=MC3R1.R21.2
--enable=MC3R1.R21.3
--enable=MC3R1.R21.4
--enable=MC3R1.R21.5
--enable=MC3R1.R21.6
--enable=MC3R1.R21.7
--enable=MC3R1.R21.8
--enable=MC3R1.R21.9
--enable=MC3R1.R21.10
--enable=MC3R1.R21.12
--enable=MC3R1.R21.14
--enable=MC3R1.R21.15
--enable=MC3R1.R21.16
--enable=MC3R1.R22.1
--enable=MC3R1.R22.3
--enable=MC3R1.R22.7
--enable=MC3R1.R22.8
--enable=MC3R1.R22.9
--enable=MC3R1.R22.10
--enable=MC3R1.R2.6
--enable=MC3R1.R4.2
--doc_end
-
--doc_begin="Guidelines added with Xen MISRA C Task (a): Xen Coding Guidelines v1.1, June 1, 2023"
--enable=MC3R1.R21.11
--enable=MC3R1.D4.4
--enable=MC3R1.R8.9
--enable=MC3R1.R12.4
--doc_end
diff --git a/automation/eclair_analysis/ECLAIR/accepted_guidelines.sh b/automation/eclair_analysis/ECLAIR/accepted_guidelines.sh
new file mode 100755
index 0000000000..b308bd4cda
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/accepted_guidelines.sh
@@ -0,0 +1,13 @@
+#!/bin/bash
+# Stop immediately if any executed command has exit status different from 0.
+set -eu
+
+script_dir="$(
+  cd "$(dirname "$0")"
+  echo "${PWD}"
+)"
+
+accepted_rst=$1
+
+grep -Eo "\`(Dir|Rule) [0-9]+\.[0-9]+" ${accepted_rst} \
+     | sed -e 's/`Rule /MC3R1.R/' -e  's/`Dir /MC3R1.D/' -e 's/.*/-enable=&/' > ${script_dir}/accepted.ecl
diff --git a/automation/eclair_analysis/ECLAIR/action.helpers b/automation/eclair_analysis/ECLAIR/action.helpers
index df9bf2bd11..9d4ae1f979 100644
--- a/automation/eclair_analysis/ECLAIR/action.helpers
+++ b/automation/eclair_analysis/ECLAIR/action.helpers
@@ -127,7 +127,7 @@ EOF
     fi
     case ${ci} in
     github)
-        cat "${summaryTxt}" >"${GITHUB_STEP_SUMMARY}"
+        cat "${summaryTxt}" "${cleanRegressionsLog}" >"${GITHUB_STEP_SUMMARY}"
         ;;
     gitlab)
         open_section ECLAIR_summary "ECLAIR analysis summary" ""
@@ -140,6 +140,7 @@ ${analysisSummaryMsgLog}
 ${currentReportsMsgLog}
 ${referenceReportsMsgLog}
 EOF
+        cat ${cleanRegressionsLog}
         close_section ECLAIR_summary
         ;;
     jenkins)
diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
index 3cba1a3afb..1577368b61 100644
--- a/automation/eclair_analysis/ECLAIR/action.settings
+++ b/automation/eclair_analysis/ECLAIR/action.settings
@@ -175,6 +175,7 @@ eclairReportUrlPrefix=https://saas.eclairit.com:3787
 
 jobDir="${artifactsDir}/${subDir}/${jobId}"
 updateLog="${analysisOutputDir}/update.log"
+cleanRegressionsLog="${analysisOutputDir}/clean_regressions.log"
 commentLog="${analysisOutputDir}/comment.json"
 indexHtmlUrl="${eclairReportUrlPrefix}/fs${jobDir}/index.html"
 summaryTxt="${analysisOutputDir}/summary.txt"
diff --git a/automation/eclair_analysis/ECLAIR/action_check_clean_regressions.sh b/automation/eclair_analysis/ECLAIR/action_check_clean_regressions.sh
new file mode 100755
index 0000000000..31b90e5241
--- /dev/null
+++ b/automation/eclair_analysis/ECLAIR/action_check_clean_regressions.sh
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+set -eu
+
+usage() {
+    echo "Usage: $0 ANALYSIS_OUTPUT_DIR" >&2
+    exit 2
+}
+
+[ $# -eq 1 ] || usage
+
+analysisOutputDir=$1
+
+# Load settings and helpers
+. "$(dirname "$0")/action.helpers"
+. "$(dirname "$0")/action.settings"
+
+cleanRegressionsTxt=${analysisOutputDir}/clean_regressions.txt
+
+cleanRegressionCount=$("${ECLAIR_BIN_DIR}eclair_report" \
+    "-db='${analysisOutputDir}/PROJECT.ecd'" \
+    "-sel_unfixed=unfixed" \
+    "-sel_tag_glob=violation_only,kind,violation" \
+    "-sel_tag_glob=clean_added,clean,added" \
+    "-report_counts_txt=service,'${cleanRegressionsTxt}'" \
+    "-print='',reports_count()")
+
+if [ "${cleanRegressionCount}" -gt 0 ]; then
+    {
+        echo "Failure: ${cleanRegressionCount} regressions found for clean guidelines"
+        sed -n '/^Number of.*$/,/^$/{ /^Number of.*$/! { /^$/! p } }' ${cleanRegressionsTxt}
+    } > ${cleanRegressionsLog}
+    rm ${cleanRegressionsTxt}
+    exit 1
+else
+    echo "Success: No regressions for clean guidelines" > ${cleanRegressionsLog}
+    rm ${cleanRegressionsTxt}
+fi
diff --git a/automation/eclair_analysis/ECLAIR/action_clean_added.sh b/automation/eclair_analysis/ECLAIR/action_clean_added.sh
deleted file mode 100755
index 59bc35fd13..0000000000
--- a/automation/eclair_analysis/ECLAIR/action_clean_added.sh
+++ /dev/null
@@ -1,36 +0,0 @@
-#!/bin/sh
-
-set -eu
-
-usage() {
-    echo "Usage: $0 ANALYSIS_OUTPUT_DIR" >&2
-    exit 2
-}
-
-[ $# -eq 1 ] || usage
-
-analysisOutputDir=$1
-
-cleanAddedTxt="${analysisOutputDir}/clean_added.log"
-
-# Load settings and helpers
-. "$(dirname "$0")/action.helpers"
-. "$(dirname "$0")/action.settings"
-
-unexpectedReports=$("${ECLAIR_BIN_DIR}eclair_report" \
-    "-db='${analysisOutputDir}/PROJECT.ecd'" \
-    "-sel_unfixed=unfixed" \
-    "-sel_tag_glob=clean_added,clean,added" \
-    "-print='',reports_count()")
-
-if [ "${unexpectedReports}" -gt 0 ]; then
-    cat <<EOF >"${cleanAddedTxt}"
-Failure: ${unexpectedReports} unexpected reports found.
-Unexpected reports are tagged 'clean:added'.
-EOF
-    exit 1
-else
-    cat <<EOF >"${cleanAddedTxt}"
-Success: No unexpected reports.
-EOF
-fi
diff --git a/automation/eclair_analysis/ECLAIR/analyze.sh b/automation/eclair_analysis/ECLAIR/analyze.sh
index a127e7aaed..0ea5520c93 100755
--- a/automation/eclair_analysis/ECLAIR/analyze.sh
+++ b/automation/eclair_analysis/ECLAIR/analyze.sh
@@ -52,7 +52,7 @@ VARIANT="${XEN_TARGET_ARCH}"
 
 # Used in analysis.ecl
 case "$2" in
-Set0|Set1|Set2|Set3)
+accepted|monitored)
   export SET="$2"
   ;;
 *)
diff --git a/automation/eclair_analysis/ECLAIR/generate_ecl.sh b/automation/eclair_analysis/ECLAIR/generate_ecl.sh
index de20728eb1..66766b23ab 100755
--- a/automation/eclair_analysis/ECLAIR/generate_ecl.sh
+++ b/automation/eclair_analysis/ECLAIR/generate_ecl.sh
@@ -10,6 +10,10 @@ script_dir="$(
 )"
 
 exclude_list="${ECLAIR_PROJECT_ROOT}/docs/misra/exclude-list.json"
+accepted_rst="${ECLAIR_PROJECT_ROOT}/docs/misra/rules.rst"
 
 # Generate the exclude list file
 "${script_dir}/adopted.sh" "${exclude_list}"
+
+# Generate accepted guidelines
+"${script_dir}/accepted_guidelines.sh" "${accepted_rst}"
diff --git a/automation/eclair_analysis/ECLAIR/Set1.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
similarity index 67%
rename from automation/eclair_analysis/ECLAIR/Set1.ecl
rename to automation/eclair_analysis/ECLAIR/monitored.ecl
index 86b8e7e772..69308ea51c 100644
--- a/automation/eclair_analysis/ECLAIR/Set1.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -1,36 +1,57 @@
--doc_begin="Set 1 of Xen MISRA C guidelines"
--enable=MC3R1.R9.1
+-doc_begin="A set of guidelines that are clean or that only have few violations left."
+-enable=MC3R1.D1.1
+-enable=MC3R1.D2.1
+-enable=MC3R1.D4.1
+-enable=MC3R1.D4.10
+-enable=MC3R1.D4.11
+-enable=MC3R1.D4.12
+-enable=MC3R1.D4.14
+-enable=MC3R1.D4.3
+-enable=MC3R1.D4.7
+-enable=MC3R1.R10.1
+-enable=MC3R1.R10.2
+-enable=MC3R1.R1.1
+-enable=MC3R1.R11.1
+-enable=MC3R1.R11.7
+-enable=MC3R1.R11.8
+-enable=MC3R1.R11.9
 -enable=MC3R1.R12.5
+-enable=MC3R1.R1.3
+-enable=MC3R1.R13.6
+-enable=MC3R1.R1.4
+-enable=MC3R1.R14.1
+-enable=MC3R1.R14.4
+-enable=MC3R1.R16.2
+-enable=MC3R1.R16.6
+-enable=MC3R1.R16.7
+-enable=MC3R1.R17.1
 -enable=MC3R1.R17.3
 -enable=MC3R1.R17.4
+-enable=MC3R1.R17.5
 -enable=MC3R1.R17.6
 -enable=MC3R1.R19.1
+-enable=MC3R1.R20.12
+-enable=MC3R1.R20.13
+-enable=MC3R1.R20.14
+-enable=MC3R1.R20.4
+-enable=MC3R1.R20.9
+-enable=MC3R1.R2.1
 -enable=MC3R1.R21.13
 -enable=MC3R1.R21.17
 -enable=MC3R1.R21.18
 -enable=MC3R1.R21.19
 -enable=MC3R1.R21.20
 -enable=MC3R1.R21.21
+-enable=MC3R1.R2.2
 -enable=MC3R1.R22.2
 -enable=MC3R1.R22.4
 -enable=MC3R1.R22.5
 -enable=MC3R1.R22.6
--enable=MC3R1.D1.1
--enable=MC3R1.D2.1
--enable=MC3R1.D4.1
--enable=MC3R1.D4.3
--enable=MC3R1.D4.7
--enable=MC3R1.D4.10
--enable=MC3R1.D4.11
--enable=MC3R1.D4.14
--enable=MC3R1.R1.1
--enable=MC3R1.R1.3
--enable=MC3R1.R1.4
--enable=MC3R1.R2.1
--enable=MC3R1.R2.2
+-enable=MC3R1.R2.6
 -enable=MC3R1.R3.1
 -enable=MC3R1.R3.2
 -enable=MC3R1.R4.1
+-enable=MC3R1.R4.2
 -enable=MC3R1.R5.1
 -enable=MC3R1.R5.2
 -enable=MC3R1.R5.3
@@ -43,15 +64,15 @@
 -enable=MC3R1.R7.3
 -enable=MC3R1.R7.4
 -enable=MC3R1.R8.1
+-enable=MC3R1.R8.10
+-enable=MC3R1.R8.12
+-enable=MC3R1.R8.14
 -enable=MC3R1.R8.2
 -enable=MC3R1.R8.3
 -enable=MC3R1.R8.4
 -enable=MC3R1.R8.5
 -enable=MC3R1.R8.6
 -enable=MC3R1.R8.8
--enable=MC3R1.R8.10
--enable=MC3R1.R8.12
--enable=MC3R1.R8.14
 -enable=MC3R1.R9.2
 -enable=MC3R1.R9.3
 -enable=MC3R1.R9.4
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index a1dea32b21..d609b470eb 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -13,24 +13,13 @@
 -doc="Hide reports marked as disapplied."
 -remap_rtag={disapplied,hide}
 
-#######################
-# Accepted guidelines #
-#######################
-
--doc="Accepted guidelines as reported in XEN/docs/misra/rules.rst"
--service_selector={accepted_guidelines,
-    "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.3||MC3R1.D4.7||MC3R1.D4.10||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.1||MC3R1.R2.2||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.3||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.2||MC3R1.R8.3||MC3R1.R8.4||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.1||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R10.1||MC3R1.R10.2||MC3R1.R10.3||MC3R1.R10.4||MC3R1.R11.7||MC3R1.R11.8||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R13.1||MC3R1.R13.5||MC3R1.R13.6||MC3R1.R14.1||MC3R1.R14.2||MC3R1.R14.3||MC3R1.R16.7||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R18.3||MC3R1.R19.1||MC3R1.R20.7||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.17||MC3R1.R21.18||MC3R1.R21.19||MC3R1.R21.20||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
-}
--doc="All reports of accepted guidelines are tagged as accepted."
--reports+={status:accepted,"service(accepted_guidelines)"}
-
 ####################
 # Clean guidelines #
 ####################
 
 -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
 
--service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
+-service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
 }
 
 -setq=target,getenv("XEN_TARGET_ARCH")
@@ -40,7 +29,7 @@ if(string_equal(target,"x86_64"),
 )
 
 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R8.6||MC3R1.R9.3"})
+    service_selector({"additional_clean_guidelines","MC3R1.R16.6||MC3R1.R20.12||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R8.6||MC3R1.R9.3"})
 )
 
 -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 6631db53fa..46c9d8e2e5 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -39,14 +39,14 @@ eclair-x86_64:
   variables:
     LOGFILE: "eclair-x86_64.log"
     VARIANT: "X86_64"
-    RULESET: "Set1"
+    RULESET: "monitored"
 
 eclair-ARM64:
   extends: .eclair-analysis:triggered
   variables:
     LOGFILE: "eclair-ARM64.log"
     VARIANT: "ARM64"
-    RULESET: "Set1"
+    RULESET: "monitored"
 
 .eclair-analysis:on-schedule:
   extends: .eclair-analysis
@@ -55,56 +55,20 @@ eclair-ARM64:
       when: never
     - !reference [.eclair-analysis, rules]
 
-eclair-x86_64-Set1:on-schedule:
+eclair-x86_64:on-schedule:
   extends: .eclair-analysis:on-schedule
   variables:
     VARIANT: "X86_64"
-    RULESET: "Set1"
+    RULESET: "accepted"
     ANALYSIS_KIND: "${RULESET}-scheduled"
     LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
   allow_failure: true
 
-eclair-x86_64-Set2:on-schedule:
-  extends: .eclair-analysis:on-schedule
-  variables:
-    VARIANT: "X86_64"
-    RULESET: "Set2"
-    ANALYSIS_KIND: "${RULESET}-scheduled"
-    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
-  allow_failure: true
-
-eclair-x86_64-Set3:on-schedule:
-  extends: .eclair-analysis:on-schedule
-  variables:
-    VARIANT: "X86_64"
-    RULESET: "Set3"
-    ANALYSIS_KIND: "${RULESET}-scheduled"
-    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
-  allow_failure: true
-
-eclair-ARM64-Set1:on-schedule:
-  extends: .eclair-analysis:on-schedule
-  variables:
-    VARIANT: "ARM64"
-    RULESET: "Set1"
-    ANALYSIS_KIND: "${RULESET}-scheduled"
-    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
-  allow_failure: true
-
-eclair-ARM64-Set2:on-schedule:
-  extends: .eclair-analysis:on-schedule
-  variables:
-    VARIANT: "ARM64"
-    RULESET: "Set2"
-    ANALYSIS_KIND: "${RULESET}-scheduled"
-    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
-  allow_failure: true
-
-eclair-ARM64-Set3:on-schedule:
+eclair-ARM64:on-schedule:
   extends: .eclair-analysis:on-schedule
   variables:
     VARIANT: "ARM64"
-    RULESET: "Set3"
+    RULESET: "accepted"
     ANALYSIS_KIND: "${RULESET}-scheduled"
     LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
   allow_failure: true
diff --git a/automation/scripts/eclair b/automation/scripts/eclair
index 14e47a6f97..ebcaf09b54 100755
--- a/automation/scripts/eclair
+++ b/automation/scripts/eclair
@@ -18,12 +18,8 @@ ex=0
                              "${ex}"
 [ "${ex}" = 0 ] || exit "${ex}"
 
-# Fail in case of new reports
-"${ECLAIR_DIR}/action_clean_added.sh" "${ECLAIR_OUTPUT_DIR}" || ex=$?
-"${ECLAIR_DIR}/action_log.sh" DIFF_CHECK_LOG \
-                             "ECLAIR diff check" \
-                             "${ECLAIR_OUTPUT_DIR}/clean_added.log" \
-                             "${ex}"
+# Fail in case of new reports for clean guidelines
+"${ECLAIR_DIR}/action_check_clean_regressions.sh" "${ECLAIR_OUTPUT_DIR}" || ex=$?
 
 "${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
 [ "${ex}" = 0 ] || exit "${ex}"
-- 
2.34.1


