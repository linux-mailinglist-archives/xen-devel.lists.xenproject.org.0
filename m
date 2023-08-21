Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7C87825DD
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 10:55:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587407.918794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0gQ-0007q2-Gk; Mon, 21 Aug 2023 08:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587407.918794; Mon, 21 Aug 2023 08:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0gQ-0007o3-DS; Mon, 21 Aug 2023 08:54:46 +0000
Received: by outflank-mailman (input) for mailman id 587407;
 Mon, 21 Aug 2023 08:54:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixuA=EG=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qY0gP-0007nI-Ag
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 08:54:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f425fbf-4000-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 10:54:44 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 4F7894EE0739;
 Mon, 21 Aug 2023 10:54:43 +0200 (CEST)
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
X-Inumbo-ID: 5f425fbf-4000-11ee-8782-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	andrew.cooper3@citrix.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 1/2] automation/eclair: avoid unintentional ECLAIR analysis
Date: Mon, 21 Aug 2023 10:54:06 +0200
Message-Id: <4de9a2e93015b12186675b9a3f7ebff7fcd71baa.1692607487.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692607487.git.simone.ballarin@bugseng.com>
References: <cover.1692607487.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With this patch, ECLAIR jobs will need to be manually
started for "people/.*" pipelines and will not be triggered
if the WTOKEN variable is missing.

This avoids occupying the runner on analyzes that might
not be used by developers.

If developers want to analyze their own repositories
they need to launch them from GitLab.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
- avoid ECLAIR jobs if the WTOKEN variable is not defined.
---
 automation/gitlab-ci/analyze.yaml | 22 +++++++++++++++++-----
 automation/scripts/eclair         |  5 -----
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 4aa4abe2ee..bd9a68de31 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -18,28 +18,40 @@
       - '*.log'
     reports:
       codequality: gl-code-quality-report.json
+  rules:
+    - if: $WTOKEN == null
+      when: never
+    - when: always
   needs: []
 
-eclair-x86_64:
+.eclair-analysis:triggered:
   extends: .eclair-analysis
+  allow_failure: true
+  rules:
+    - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
+      when: manual
+    - !reference [.eclair-analysis, rules]
+
+eclair-x86_64:
+  extends: .eclair-analysis:triggered
   variables:
     LOGFILE: "eclair-x86_64.log"
     VARIANT: "X86_64"
     RULESET: "Set1"
-  allow_failure: true
 
 eclair-ARM64:
-  extends: .eclair-analysis
+  extends: .eclair-analysis:triggered
   variables:
     LOGFILE: "eclair-ARM64.log"
     VARIANT: "ARM64"
     RULESET: "Set1"
-  allow_failure: true
 
 .eclair-analysis:on-schedule:
   extends: .eclair-analysis
   rules:
-    - if: $CI_PIPELINE_SOURCE == "schedule"
+    - if: $CI_PIPELINE_SOURCE != "schedule"
+      when: never
+    - !reference [.eclair-analysis, rules]
 
 eclair-x86_64-Set1:on-schedule:
   extends: .eclair-analysis:on-schedule
diff --git a/automation/scripts/eclair b/automation/scripts/eclair
index 813a56eb6a..14e47a6f97 100755
--- a/automation/scripts/eclair
+++ b/automation/scripts/eclair
@@ -4,11 +4,6 @@ ECLAIR_ANALYSIS_DIR=automation/eclair_analysis
 ECLAIR_DIR="${ECLAIR_ANALYSIS_DIR}/ECLAIR"
 ECLAIR_OUTPUT_DIR=$(realpath "${ECLAIR_OUTPUT_DIR}")
 
-if [ -z "${WTOKEN:-}" ]; then
-    echo "Failure: the WTOKEN variable is not defined." >&2
-    exit 1
-fi
-
 "${ECLAIR_ANALYSIS_DIR}/prepare.sh" "${VARIANT}"
 
 ex=0
-- 
2.34.1


