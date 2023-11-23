Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BE67F625D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 16:10:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639778.997481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6BL7-0004YW-Oo; Thu, 23 Nov 2023 15:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639778.997481; Thu, 23 Nov 2023 15:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6BL7-0004Wi-MC; Thu, 23 Nov 2023 15:10:01 +0000
Received: by outflank-mailman (input) for mailman id 639778;
 Thu, 23 Nov 2023 15:10:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/TSj=HE=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r6BL6-0004Wa-EA
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 15:10:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cd2d271-8a12-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 16:09:57 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 249D24EE073C;
 Thu, 23 Nov 2023 16:09:56 +0100 (CET)
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
X-Inumbo-ID: 5cd2d271-8a12-11ee-9b0e-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2] automation/eclair: improve scheduled analyses
Date: Thu, 23 Nov 2023 16:09:13 +0100
Message-Id: <36ea68b24a1e336ef9170b7f89949d282ee1e746.1700752056.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The scheduled analyses are intended to maintain an overall vision
of the MISRA complaince of the entire project. For this reason,
the file exclusions in "out_of_scope.ecl" should not be applied.

This patch amends ECLAIR settings to prevent exempting files for
scheduled analyses.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
Changes in v2:
- drop changes to inhibit test and build stages in scheduled pipelines.
---
 automation/eclair_analysis/ECLAIR/action.settings |  2 +-
 automation/eclair_analysis/ECLAIR/analysis.ecl    | 12 ++++++++++--
 automation/gitlab-ci/analyze.yaml                 |  2 ++
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
index f96368ffc7..3cba1a3afb 100644
--- a/automation/eclair_analysis/ECLAIR/action.settings
+++ b/automation/eclair_analysis/ECLAIR/action.settings
@@ -134,7 +134,7 @@ push)
     badgeLabel="ECLAIR ${ANALYSIS_KIND} ${ref}${variantHeadline} #${jobId}"
     ;;
 auto_pull_request)
-    git remote remove autoPRRemote || true
+    git remote remove autoPRRemote 2>/dev/null || true
     git remote add autoPRRemote "${autoPRRemoteUrl}"
     git fetch -q autoPRRemote
     subDir="${ref}"
diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
index fe418d6da1..2507a8e787 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -2,7 +2,13 @@
 -project_name=getenv("ECLAIR_PROJECT_NAME")
 -project_root=getenv("ECLAIR_PROJECT_ROOT")
 
--setq=data_dir,getenv("ECLAIR_DATA_DIR")
+setq(data_dir,getenv("ECLAIR_DATA_DIR"))
+setq(analysis_kind,getenv("ANALYSIS_KIND"))
+setq(scheduled_analysis,nil)
+
+strings_map("scheduled-analysis",500,"","^.*scheduled$",0,setq(scheduled_analysis,t))
+strings_map("scheduled-analysis",500,"","^.*$",0)
+map_strings("scheduled-analysis",analysis_kind)
 
 -verbose
 
@@ -15,7 +21,9 @@
 
 -eval_file=toolchain.ecl
 -eval_file=public_APIs.ecl
--eval_file=out_of_scope.ecl
+if(scheduled_analysis,
+    eval_file("out_of_scope.ecl")
+)
 -eval_file=deviations.ecl
 -eval_file=call_properties.ecl
 -eval_file=tagging.ecl
diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index bd9a68de31..6631db53fa 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -28,6 +28,8 @@
   extends: .eclair-analysis
   allow_failure: true
   rules:
+    - if: $CI_PIPELINE_SOURCE == "schedule"
+      when: never
     - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
       when: manual
     - !reference [.eclair-analysis, rules]
-- 
2.34.1


