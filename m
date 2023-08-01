Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF9976B017
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:58:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574030.899225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQm8m-00024j-5u; Tue, 01 Aug 2023 09:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574030.899225; Tue, 01 Aug 2023 09:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQm8m-00021k-1q; Tue, 01 Aug 2023 09:58:08 +0000
Received: by outflank-mailman (input) for mailman id 574030;
 Tue, 01 Aug 2023 09:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u66X=DS=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qQm8k-0001NH-KZ
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:58:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e83784b4-3051-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 11:58:04 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 8062B4EE0741;
 Tue,  1 Aug 2023 11:58:04 +0200 (CEST)
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
X-Inumbo-ID: e83784b4-3051-11ee-8613-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 3/4] automation/eclair: add scheduled pipelines
Date: Tue,  1 Aug 2023 11:57:03 +0200
Message-Id: <76f3cdddcba485e8124659566b2f992b3b14da17.1690881495.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690881495.git.simone.ballarin@bugseng.com>
References: <cover.1690881495.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces six new ECLAIR jobs that run only
when triggered by a GitLab scheduled pipeline.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 .../eclair_analysis/ECLAIR/action.settings    |  2 +-
 automation/gitlab-ci/analyze.yaml             | 65 +++++++++++++++++--
 2 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
index 71c10d5141..528bc24c72 100644
--- a/automation/eclair_analysis/ECLAIR/action.settings
+++ b/automation/eclair_analysis/ECLAIR/action.settings
@@ -73,7 +73,7 @@ gitlab)
         headCommitId="${CI_COMMIT_SHA}"
         baseCommitId="${CI_MERGE_REQUEST_DIFF_BASE_SHA}"
         ;;
-    push | pipeline | web)
+    push | pipeline | web | schedule)
         event=push
         if [ -n "${CI_COMMIT_BRANCH:-}" ]; then
             ref_kind=branch
diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 3d8166572b..3325ef9d9a 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -8,6 +8,8 @@
     ENABLE_ECLAIR_BOT: "n"
     AUTO_PR_BRANCH: "staging"
     AUTO_PR_REPOSITORY: "xen-project/xen"
+  script:
+    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
   artifacts:
     when: always
     paths:
@@ -23,8 +25,6 @@ eclair-x86_64:
     LOGFILE: "eclair-x86_64.log"
     VARIANT: "X86_64"
     RULESET: "Set1"
-  script:
-    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
   allow_failure: true
 
 eclair-ARM64:
@@ -33,6 +33,63 @@ eclair-ARM64:
     LOGFILE: "eclair-ARM64.log"
     VARIANT: "ARM64"
     RULESET: "Set1"
-  script:
-    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
+  allow_failure: true
+
+.eclair-analysis:on-schedule:
+  extends: .eclair-analysis
+  rules:
+    - if: $CI_PIPELINE_SOURCE == "schedule"
+
+eclair-x86_64-Set1:on-schedule:
+  extends: .eclair-analysis:on-schedule
+  variables:
+    VARIANT: "X86_64"
+    RULESET: "Set1"
+    ANALYSIS_KIND: "${RULESET}-scheduled"
+    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
+  allow_failure: true
+
+eclair-x86_64-Set2:on-schedule:
+  extends: .eclair-analysis:on-schedule
+  variables:
+    VARIANT: "X86_64"
+    RULESET: "Set2"
+    ANALYSIS_KIND: "${RULESET}-scheduled"
+    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
+  allow_failure: true
+
+eclair-x86_64-Set3:on-schedule:
+  extends: .eclair-analysis:on-schedule
+  variables:
+    VARIANT: "X86_64"
+    RULESET: "Set3"
+    ANALYSIS_KIND: "${RULESET}-scheduled"
+    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
+  allow_failure: true
+
+eclair-ARM64-Set1:on-schedule:
+  extends: .eclair-analysis:on-schedule
+  variables:
+    VARIANT: "ARM64"
+    RULESET: "Set1"
+    ANALYSIS_KIND: "${RULESET}-scheduled"
+    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
+  allow_failure: true
+
+eclair-ARM64-Set2:on-schedule:
+  extends: .eclair-analysis:on-schedule
+  variables:
+    VARIANT: "ARM64"
+    RULESET: "Set2"
+    ANALYSIS_KIND: "${RULESET}-scheduled"
+    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
+  allow_failure: true
+
+eclair-ARM64-Set3:on-schedule:
+  extends: .eclair-analysis:on-schedule
+  variables:
+    VARIANT: "ARM64"
+    RULESET: "Set3"
+    ANALYSIS_KIND: "${RULESET}-scheduled"
+    LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
   allow_failure: true
-- 
2.34.1


