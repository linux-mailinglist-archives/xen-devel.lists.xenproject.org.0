Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB12FAE9669
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 08:39:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025899.1401142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUgG9-0002Mk-A4; Thu, 26 Jun 2025 06:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025899.1401142; Thu, 26 Jun 2025 06:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUgG9-0002Ju-7I; Thu, 26 Jun 2025 06:38:57 +0000
Received: by outflank-mailman (input) for mailman id 1025899;
 Thu, 26 Jun 2025 06:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZhAb=ZJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uUgG6-0002Jo-ST
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 06:38:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28f9d17c-5258-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 08:38:25 +0200 (CEST)
Received: from nico.tail79467d.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 697934EE989B;
 Thu, 26 Jun 2025 08:38:22 +0200 (CEST)
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
X-Inumbo-ID: 28f9d17c-5258-11f0-a30f-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1750919904;
	b=yLHdS4Q7PKMNmMvv6i9wf/mJv525rpzURRWJwQjsOGQ3GxwtH8Yns9DuBAZ6vJSrq4Fh
	 yCA9PpPstmlAscS+pZ+eXEY5m27JZyuYD9gZlMQt1q4hXM6SYe/RkEyqm7qnhTmH4c/5D
	 fvV90zUUAYfJ/dKReFBb8gspaPJH+ErMO3UvVrvUG3bUilfXvdw7fDfLDtZD9ekNHsNW3
	 jC9b0dqpWvQt2WHXujPttKDg9Vv3o6rlx4ZeZwIS1ZVZkOS2EgsdbKmWv4JkvFqIzonSX
	 ID3AVsLWR3UgyuXVN2MRgp6gUhvEFrzuAsb2L7MRUAgF3ojgCZu/Hhegx7FcRdisbSD3k
	 WLUbaRVpKiEM4maV/dhXCr6/2LObtA42wXlp0OC0i1z/lwOWszL4P9U1M9tmKhP6qg8d9
	 m9RqYzg1ifG9tDg2Fnk80BLhxDJAEc35eMaL2DZuGDrQMblRC1AuJYQFd9hHzXx82Z2sf
	 Fqm8fJT9OjXODwjnZNuFhx/vqOGPfcrwnQSQFg50ZvJFlslXq4KFOk0aGi+V5JwaMB+sH
	 RWIk4bhMNGRCggZKotZhJPt5YeTHV7UNAqFzXdiNQornV4I/Ec27kdYVGwB7LsyPRTT0O
	 E9xp2Qv0GEVFdm8CNzvQfN6SZvhfalBnWXYzsKTZexKkPwQUKtowHjSf/WMS5C8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1750919904;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oQrXzCRUj/9EDUcm1lVVMIZUPbolg+1+jcZaFR2XY8c=;
	b=aHoiHG5l39k5UcGzwTsBeispIZPwjEnP9w7iPEHZB4ttcT3Ww3ZrGwlXSsjd1PR18/aV
	 GFEiJFILD1EDl9t2Van4i4biliKq9HnlpDXSA2CbOpEGVVo3iND+w2eAyHqTcKP0vGcLF
	 9oOEw/UkRzbv0uOw4IgpZeEFnCqOCeTE/MUa9dN4Nkn3IuFXn0WX0PRA9Cw17y3qfTUL9
	 Vwt191fCM9nI90QYmfnNeHl8KCHUKC/W/jAZfbmDkshmARNqYBulmQKgOS14rEUPTsSi7
	 38B38xK/QHJQeky/M7SCzJOXuh3xs+faD4I4RSx/kCHPAtv8cAEDcta/c6mOgQJ4hdrW+
	 ucZOT11m2cBZMmd1q4f/5nf6SFhYkPnxG0A/lDqowAYLHLe2tmF/hqZv58+fyC7jHrBUG
	 VnLAyFfJOchwPElCIqihS//FWdOcY9wJ4JhOwI7FlZLRC0/xKOWaVm8zq2VgX/4BXinOV
	 CqtVog0+BkRFgUDlM0tMAztKGrxOeq6HN4L9e5dGxxs3JNg9d+WbMiiLqaFZfoZhwsoV7
	 vSqZJS80VgtwgLkU37t19KoYdKi0dEYh4w/RnJ130iL4g8DFbA+ycyFu9mEznYZ3SlStS
	 KI0fSxxcJXcgoug3FsLZoifOlSwM8xwEsyGLuA7a5Ak3G6MNfq3020E7qN6AD2U=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1750919903; bh=ijvoRc6978K4tpVuonXlG24o0J0Oueq2vRD/faZQN40=;
	h=From:To:Cc:Subject:Date:From;
	b=Jkjqh09Mz1M/amAXa9HcZZVAZIULYwc+SklVfiapDWbHvvogTrjkJeqj6nwTp4Vc8
	 +FBOq4DomjsbrS6a6qe3JEjwQTJFEmSDkyEA7eJyDDlNEdbL+DvpYD8IrkVHN37oR3
	 x5cbb30d7X2CytBn90UsnvcSFzhPraY+k/7pcV+WyEbRLTiGVm/s94A91KDeMJ+AoN
	 2PbdvhdqAUpEe7v+oi/rVAHH7HVJs2fyjfG/jN5eWWFbMQk1l1lybHuUsBXK9bzZqM
	 p2RhNyrWDlsZ6Kze+2vT/V3rBcHWq8yIMadfb2s5pWZBAOvkn8TeU/B3tkrvftU1+0
	 +tMgbCdJk5JYQ==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Anthony Perard <anthony@xenproject.org>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [XEN PATCH] automation/eclair: Make report browsing URL configurable.
Date: Thu, 26 Jun 2025 08:38:18 +0200
Message-ID: <2c0003504925e6f62b0bb1a13711c206e40f9393.1750919773.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the URL where the ECLAIR MISRA C scan reports are saved
is hardcoded; making it configurable allows multiple runners and storage
servers to be used without resorting to publishing all artifacts
to the same report server.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Note: this is a key enabler for drafting more comprehensive community
analyses that can be possibly split between different machines
---
 .../eclair_analysis/ECLAIR/action.settings    | 31 +++++++++++++++----
 .../eclair_analysis/ECLAIR/action_push.sh     |  2 +-
 automation/gitlab-ci/analyze.yaml             |  2 ++
 automation/scripts/eclair                     | 13 +++++++-
 4 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
index 1577368b613b..f822f0ea66d7 100644
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
@@ -166,12 +163,34 @@ esac
 
 ECLAIR_BIN_DIR=/opt/bugseng/eclair/bin/
 
-artifactsDir="${artifactsRoot}/xen-project.ecdf/${repository}/ECLAIR_${ANALYSIS_KIND}"
+# Artifacts URL served by the eclair_report server
+if [ -z "${MACHINE_ARTIFACTS_ROOT}" ];
+then
+  echo "WARNING: No artifacts root supplied, using default"
+fi
+if [ -z "${MACHINE_ECDF_DIR}" ];
+then
+  echo "WARNING: No ecdf dir supplied, using default"
+fi
+artifactsRoot="${MACHINE_ARTIFACTS_ROOT:-/var/local/eclair}"
+artifactsEcdfDir="${MACHINE_ECDF_DIR:-xen-project.ecdf}"
+artifactsDir="${artifactsRoot}/${artifactsEcdfDir}/${repository}/ECLAIR_${ANALYSIS_KIND}"
 subDir="${subDir}${variantSubDir}"
 jobHeadline="${jobHeadline}${variantHeadline}"
 
-# Customized
-eclairReportUrlPrefix=https://saas.eclairit.com:3787
+# Remote eclair_report hosting server
+if [ -z "${MACHINE_HOST}" ];
+then
+  echo "WARNING: No machine host supplied, using default"
+fi
+if [ -z "${MACHINE_PORT}" ];
+then
+  echo "WARNING: No machine port supplied, using default"
+fi
+
+eclairReportHost="${MACHINE_HOST:-saas.eclairit.com}"
+eclairReportPort="${MACHINE_PORT:-3787}"
+eclairReportUrlPrefix="https://${eclairReportHost}:${eclairReportPort}"
 
 jobDir="${artifactsDir}/${subDir}/${jobId}"
 updateLog="${analysisOutputDir}/update.log"
diff --git a/automation/eclair_analysis/ECLAIR/action_push.sh b/automation/eclair_analysis/ECLAIR/action_push.sh
index 45215fbf005b..5002b48522e2 100755
--- a/automation/eclair_analysis/ECLAIR/action_push.sh
+++ b/automation/eclair_analysis/ECLAIR/action_push.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-set -eu
+set -eux
 
 usage() {
     echo "Usage: $0 WTOKEN ANALYSIS_OUTPUT_DIR" >&2
diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 5b00b9f25ca6..f027c6bc90b1 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -8,6 +8,8 @@
     ENABLE_ECLAIR_BOT: "n"
     AUTO_PR_BRANCH: "staging"
     AUTO_PR_REPOSITORY: "xen-project/xen"
+    MACHINE_ARTIFACTS_ROOT: "/space"
+    MACHINE_ECDF_DIR: "XEN.ecdf"
   script:
     - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
   artifacts:
diff --git a/automation/scripts/eclair b/automation/scripts/eclair
index 0a2353c20a92..7020eaa0982f 100755
--- a/automation/scripts/eclair
+++ b/automation/scripts/eclair
@@ -1,4 +1,15 @@
-#!/bin/sh -eu
+#!/bin/sh -eux
+
+# Runner-specific variables
+ex=0
+export "$(env | grep MACHINE_ARTIFACTS_ROOT)" || ex=$?
+[ "${ex}" = 0 ] || exit "${ex}"
+export "$(env | grep MACHINE_ECDF_DIR)" || ex=$?
+[ "${ex}" = 0 ] || exit "${ex}"
+export "$(env | grep MACHINE_HOST)" || ex=$?
+[ "${ex}" = 0 ] || exit "${ex}"
+export "$(env | grep MACHINE_PORT)" || ex=$?
+[ "${ex}" = 0 ] || exit "${ex}"
 
 ECLAIR_ANALYSIS_DIR=automation/eclair_analysis
 ECLAIR_DIR="${ECLAIR_ANALYSIS_DIR}/ECLAIR"
-- 
2.43.0


