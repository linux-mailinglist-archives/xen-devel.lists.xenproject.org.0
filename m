Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB00AFB75B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 17:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035669.1408021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnlv-00031q-1U; Mon, 07 Jul 2025 15:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035669.1408021; Mon, 07 Jul 2025 15:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnlu-0002zu-Ux; Mon, 07 Jul 2025 15:28:46 +0000
Received: by outflank-mailman (input) for mailman id 1035669;
 Mon, 07 Jul 2025 15:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqWx=ZU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uYnls-0002zo-CZ
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 15:28:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0db0a7b6-5b47-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 17:28:38 +0200 (CEST)
Received: from nico.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 323444EE9BBE;
 Mon,  7 Jul 2025 17:28:34 +0200 (CEST)
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
X-Inumbo-ID: 0db0a7b6-5b47-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=79.60.221.62
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1751902117;
	b=EgEt/UfLQYieGKWIJW513MTyUiPUzjyk0klfBf2g+x5VIe/26Y+TOSGet0UoKhj6dYBK
	 zM+KqL0GYZC/ULbKy5Na+YoMGYpzwaVLp9boI+5lrGVJEFj1fBnPN735TfZPfL9ruSClD
	 +O3YPkq4/qacVOpF/qbUSa+YlTHxfssnxQx3ehOPX8HRn5ZPkaLw11elckLa0sIe+xxM8
	 1Ka9DO/5Y2vxn7sENLBR/+MMK57ESsHaZboCbfCKjDX2dgykli9pl/06FCJlnvPW6Z42Q
	 zWzY5JBSFXTj/xzE6wSH3slD/CX26AM+oW2QCA5GGycbKSNrQFP88RxWX3PdZhzwWjCEd
	 UpPV+yQ075LR0E3jgDZkl5kwnSbzjJxdiftlyLkOqirrg4SiYrMXik/90px4X8Isjczh1
	 u62UKvJB+12M7FNu+XqvgZilmCgPfPqks5/EkJoVVcCP0s7ohQsukYSqNzGw8kgywNa7m
	 iBvrxys3vuuJF2YaXo8u5dlmtwTcqbbgC1pgUSowy9EWRgPSXRrCcCgASAMXWmPKVl0sR
	 gkur1vqRocpuHxDOxAVuzixuBB/KRR5X3zNvKU5aCdGCRJ35JVE4SuQfJx3I/hsgGz2qc
	 iSs92UdpUMUactck1tx7aD43PwCTLEji7CFz36wR+wX3U+EDGUv9wu0x8/3G4n0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1751902117;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oSIkMz3s9+9rEityjsxTdpf286Hj35+frJA/Tdc4LO4=;
	b=VAM+/OA2G+O/ewvKNeU6T2WBwo/K6vsN/HHZ3J3z1KZk2VOXwDHB0T/pLM86ZbC4xfig
	 4xg1y4Yc9WthUpfNFaOFVIPmk/hcFfI8H1fP8vpg4/O2UQAqBLds6VhbJwqEaeDEK12i8
	 D111YVehBSjnx34tHlIYdjyvIxj8rmgoK69sp6K7gg/HzxJLJ7tzH4W3cRnGvU64ET/xf
	 Ntar49Yp/att6X5n/zHfV3HudovMopMEf0FEJtqLkaRfNgO1Cg1mCCQHU7igPM7IcjMbp
	 zi24Lrf/HSusYwqT5GXA0pTPwliLPOj8GVGLEhPCEliPGkVxLZ44gP6rmEx8pvqTt7iEB
	 YwdJ9VeYxUAUtD14KK+EgXxi0mxwizlcaDmi9x47IxN/DM0LDYA5YpSP1jFHf4V6cmb9F
	 VCDzl33oHUah4/5vn6ThN4oQ3yOMqK3wbI5BNguxKLktLgsUGoQBa8HdzSB2DTQuh7opr
	 7nF1Rbnx5SKRJc6nwygVZpKZmheDHQq+Qg8Rfyt959oQUUSMdYjZ93Fx2WaWeNx7qN88C
	 GJ1NBEUbtLICfABBLsEpxgLUkxagqeyRUMDMphSQGPahihfn8sJtOt4lCOkd/Ba/SXJlF
	 ijQi9jJijTJm/WoyTVuLG+x+B5ujEX2JEAL5iV3/skyUIVC/rtXz5RNi3tkeq5E=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=79.60.221.62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1751902117; bh=rSdAjcJzz/I85k/ESRNptGN720P21uugul2ZZZqbN+o=;
	h=From:To:Cc:Subject:Date:From;
	b=RWWs82dWBsupl12/xm7P70fTPbfOCdI06p3BAE+r2j/WSw/lf+QNFjUlaWsUWcTc8
	 quiGjgoEs9IHwnZbtt+oeXDYv6dxsXWNaDV3RK+NKirg1cGpiJ/W4m3nTImHllanUh
	 ZzBxcgwJNfryXrl1djMEtBzGvs0kTbk4pblDcBbJaOPKUCF/t/gdYe+0HSXKBnJz+N
	 XGlzYtVn8uHCNKkNnR+1pZoPJL/HdlwXu5P4CDOdK+vLLEgPkwg1joHeMgcu5W5+sp
	 RcaGGW5r7F7VhFIUAZBczzaQwHqmGA3Uy/WPJzx8xt1urY8Y5YeIOKnIIYyADLbGbq
	 sC/dmd4DZwbag==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Anthony Perard <anthony.perard@vates.tech>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [XEN PATCH v2] automation/eclair: Make report browsing URL configurable.
Date: Mon,  7 Jul 2025 17:28:26 +0200
Message-ID: <a4653f50651af8463f7543793e38c40111790648.1751901789.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the URL where the ECLAIR MISRA C scan reports are saved
is hardcoded; making it configurable allows multiple runners and storage
servers to be used without resorting to publishing all artifacts
to the same report server.

Additionally, reports will be accessed publicly by using a proxy,
therefore the address that needs to be printed in GitLab analysis logs
is that of the public url, rather than the location where they are stored.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in V2:
- Use single variable for eclair_report host and port
- Introduced variable in analyze.yaml for the public url used in logs

This needs to be committed in coordination with setting up the proxy
indicated in analyze.yaml
---
 .../eclair_analysis/ECLAIR/action.helpers     | 10 +++----
 .../eclair_analysis/ECLAIR/action.settings    | 30 ++++++++++++++-----
 automation/gitlab-ci/analyze.yaml             |  3 ++
 3 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/action.helpers b/automation/eclair_analysis/ECLAIR/action.helpers
index 9d4ae1f979f6..3a4c9d2b2855 100644
--- a/automation/eclair_analysis/ECLAIR/action.helpers
+++ b/automation/eclair_analysis/ECLAIR/action.helpers
@@ -58,7 +58,7 @@ summary() {
         ;;
     esac
 
-    currentDbReportsUrl="${eclairReportUrlPrefix}/fs${jobDir}/PROJECT.ecd;/by_service.html#service&kind"
+    currentDbReportsUrl="${eclairResultsUrl}/fs${jobDir}/PROJECT.ecd;/by_service.html#service&kind"
     if [ -z "${newReports}" ]; then
         fixedMsg="No fixed reports as there is no baseline"
         unfixedMsg="Unfixed reports: ${unfixedReports}"
@@ -69,11 +69,11 @@ summary() {
         unfixedMsg="Unfixed reports: ${unfixedReports} [new: ${newReports}]"
         case "${event}" in
         pull_request | auto_pull_request)
-            referenceDbReportsUrl="${eclairReportUrlPrefix}/fs${jobDir}/base/PROJECT.ecd;/by_service.html#service&kind"
+            referenceDbReportsUrl="${eclairResultsUrl}/fs${jobDir}/base/PROJECT.ecd;/by_service.html#service&kind"
             reference_kind=base
             ;;
         push)
-            referenceDbReportsUrl="${eclairReportUrlPrefix}/fs${jobDir}/prev/PROJECT.ecd;/by_service.html#service&kind"
+            referenceDbReportsUrl="${eclairResultsUrl}/fs${jobDir}/prev/PROJECT.ecd;/by_service.html#service&kind"
             reference_kind=previous
             ;;
         *)
@@ -92,7 +92,7 @@ summary() {
 ${fixedMsg}${eol}
 ${unfixedMsg}                                                                              ${eol}
 <a href="https://www.bugseng.com/eclair">
-  <img src="${eclairReportUrlPrefix}/rsrc/eclair.svg" width="100" />
+  <img src="${eclairResultsUrl}/rsrc/eclair.svg" width="100" />
 </a>
 <h3>${jobHeadline}</h3>
 <a href="${indexHtmlUrl}">Browse analysis summary</a>
@@ -106,7 +106,7 @@ EOF
         fi
         cat <<EOF >"${summaryTxt}"
 <a href="https://www.bugseng.com/eclair">
-  <img src="${eclairReportUrlPrefix}/rsrc/eclair.svg" width="100" />
+  <img src="${eclairResultsUrl}/rsrc/eclair.svg" width="100" />
 </a>
 Analysis Summary
 
diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
index 1577368b613b..a9904377252a 100644
--- a/automation/eclair_analysis/ECLAIR/action.settings
+++ b/automation/eclair_analysis/ECLAIR/action.settings
@@ -14,9 +14,6 @@ autoPRRepository="${AUTO_PR_REPOSITORY:-}"
 # Customized
 autoPRBranch="${AUTO_PR_BRANCH:-}"
 
-# Customized
-artifactsRoot=/var/local/eclair
-
 case "${ci}" in
 github)
     # To be customized
@@ -166,16 +163,35 @@ esac
 
 ECLAIR_BIN_DIR=/opt/bugseng/eclair/bin/
 
-artifactsDir="${artifactsRoot}/xen-project.ecdf/${repository}/ECLAIR_${ANALYSIS_KIND}"
+# Artifacts URL served by the eclair_report server
+if [ -z "${ECLAIR_ECDF_DIR}" ]
+then
+  echo "WARNING: No ecdf dir supplied, using default"
+fi
+artifactsEcdfDir="${ECLAIR_ECDF_DIR:-/var/local/eclair/xen-project.ecdf}"
+artifactsDir="${artifactsEcdfDir}/${repository}/ECLAIR_${ANALYSIS_KIND}"
 subDir="${subDir}${variantSubDir}"
 jobHeadline="${jobHeadline}${variantHeadline}"
 
-# Customized
-eclairReportUrlPrefix=https://saas.eclairit.com:3787
+# Remote eclair_report hosting server
+if [ -z "${ECLAIR_REPORT_HOST}" ]
+then
+  echo "WARNING: No eclair_report host supplied, using default"
+fi
+
+# URL to browse eclair reports
+if [ -z "${ECLAIR_ANALYSIS_RESULTS}" ]
+then
+  echo "WARNING: No URL to browse analysis results is set, using default"
+fi
+
+eclairReportHost="${ECLAIR_REPORT_HOST:-saas.eclairit.com:3787}"
+eclairReportUrlPrefix="https://${eclairReportHost}"
+eclairResultsUrl="${ECLAIR_ANALYSIS_RESULTS:-${eclairReportUrlPrefix}}"
 
 jobDir="${artifactsDir}/${subDir}/${jobId}"
 updateLog="${analysisOutputDir}/update.log"
 cleanRegressionsLog="${analysisOutputDir}/clean_regressions.log"
 commentLog="${analysisOutputDir}/comment.json"
-indexHtmlUrl="${eclairReportUrlPrefix}/fs${jobDir}/index.html"
+indexHtmlUrl="${eclairResultsUrl}/fs${jobDir}/index.html"
 summaryTxt="${analysisOutputDir}/summary.txt"
diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 5b00b9f25ca6..9cec0f65a439 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -8,7 +8,10 @@
     ENABLE_ECLAIR_BOT: "n"
     AUTO_PR_BRANCH: "staging"
     AUTO_PR_REPOSITORY: "xen-project/xen"
+    ECLAIR_ANALYSIS_RESULTS: "https://eclair-analysis-logs.xenproject.org"
   script:
+    - export ECLAIR_ECDF_DIR
+    - export ECLAIR_REPORT_HOST
     - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
   artifacts:
     when: always
-- 
2.43.0


