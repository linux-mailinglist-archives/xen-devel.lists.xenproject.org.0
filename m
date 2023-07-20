Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505A575B977
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 23:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566735.885969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMb64-0006oK-Cz; Thu, 20 Jul 2023 21:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566735.885969; Thu, 20 Jul 2023 21:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMb64-0006ld-9i; Thu, 20 Jul 2023 21:22:04 +0000
Received: by outflank-mailman (input) for mailman id 566735;
 Thu, 20 Jul 2023 21:22:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ODwM=DG=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qMb63-0006lX-68
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 21:22:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75845f2f-2743-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 23:21:58 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.161.99.255])
 by support.bugseng.com (Postfix) with ESMTPSA id 72C1E4EE0C89;
 Thu, 20 Jul 2023 23:21:57 +0200 (CEST)
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
X-Inumbo-ID: 75845f2f-2743-11ee-8611-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation: add ECLAIR pipeline
Date: Thu, 20 Jul 2023 23:20:29 +0200
Message-Id: <eb5fa852f306790160b967787592553d2fdf3de6.1689887842.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two pipelines that analyze an ARM64 and a X86_64 build with the
ECLAIR static analyzer on the guidelines contained in Set1.

The tool configuration is kept external to the xen repository for
practical reasons, it will be included in a subsequent phase.

All commits on the xen-project/xen:staging branch will be analyzed
and their artifacts will be stored indefinitely; the integration will
report differential information with respect to the previous analysis.

All commits on other branches or repositories will be analyzed and
only the last ten artifacts will be kept; the integration will report
differential information with respect to the analysis done on the common
ancestor with xen-project/xen:staging (if available).

Currently the pipeline variable ENABLE_ECLAIR_BOT is set to "n".
Doing so disables the generation of comments with the analysis summary
on the commit threads. The variable can be set to "y" if the a masked
variable named ECLAIRIT_TOKEN is set with the impersonation token of
an account with enough privileges to write on all repositories.

Additionaly any repository should be able to read a masked variable
named WTOKEN with the token provided by BUGSENG.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 .gitlab-ci.yml                    |  2 ++
 automation/gitlab-ci/analyze.yaml | 38 +++++++++++++++++++++++++++++++
 automation/scripts/eclair         | 26 +++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 automation/gitlab-ci/analyze.yaml
 create mode 100755 automation/scripts/eclair

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c8bd7519d5..ee5430b8b7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,9 @@
 stages:
+  - analyze
   - build
   - test
 
 include:
+  - 'automation/gitlab-ci/analyze.yaml'
   - 'automation/gitlab-ci/build.yaml'
   - 'automation/gitlab-ci/test.yaml'
diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
new file mode 100644
index 0000000000..be96d96e71
--- /dev/null
+++ b/automation/gitlab-ci/analyze.yaml
@@ -0,0 +1,38 @@
+.eclair-analysis:
+  stage: analyze
+  tags:
+    - eclair-analysis
+    - eclair
+    - misrac
+  variables:
+    ECLAIR_OUTPUT_DIR: "ECLAIR_out"
+    ANALYSIS_KIND: "normal"
+    ECLAIR_REPORT_URL: "saas.eclairit.com"
+    ENABLE_ECLAIR_BOT: "n"
+    AUTOPRBRANCH: "staging"
+    AUTOPRREPOSITORY: "xen-project/xen"
+  artifacts:
+    when: always
+    paths:
+      - "${ECLAIR_OUTPUT_DIR}"
+      - '*.log'
+    reports:
+      codequality: gl-code-quality-report.json
+
+eclair-x86_64:
+  extends: .eclair-analysis
+  variables:
+    LOGFILE: "eclair-x86_64.log"
+    VARIANT: "X86_64"
+    RULESET: "Set1"
+  script:
+    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
+
+eclair-ARM64:
+  extends: .eclair-analysis
+  variables:
+    LOGFILE: "eclair-ARM64.log"
+    VARIANT: "ARM64"
+    RULESET: "Set1"
+  script:
+    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
diff --git a/automation/scripts/eclair b/automation/scripts/eclair
new file mode 100755
index 0000000000..d7f0845aec
--- /dev/null
+++ b/automation/scripts/eclair
@@ -0,0 +1,26 @@
+#!/bin/bash -eu
+
+# ECLAIR configuration files are maintened by BUGSENG
+export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no"
+[ -d ECLAIR_scripts ] || git clone ssh://git@git.bugseng.com/eclair/scripts/XEN ECLAIR_scripts
+(cd ECLAIR_scripts; git pull --rebase)
+
+ECLAIR_DIR=ECLAIR_scripts/ECLAIR
+ECLAIR_OUTPUT_DIR=$(realpath "${ECLAIR_OUTPUT_DIR}")
+
+ECLAIR_scripts/prepare.sh "${VARIANT}"
+
+ex=0
+"${ECLAIR_DIR}/analyze.sh" "${VARIANT}" "${RULESET}" || ex=$?
+"${ECLAIR_DIR}/action_log.sh" ANALYSIS_LOG \
+                             "ECLAIR analysis log" \
+                             "${ECLAIR_OUTPUT_DIR}/ANALYSIS.log" \
+                             "${ex}"
+"${ECLAIR_DIR}/action_log.sh" REPORT_LOG \
+                             "ECLAIR report log" \
+                             "${ECLAIR_OUTPUT_DIR}/REPORT.log" \
+                             "${ex}"
+[ "${ex}" = 0 ] || exit "${ex}"
+"${ECLAIR_DIR}/action_push.sh" "${WTOKEN}" "${ECLAIR_OUTPUT_DIR}"
+
+rm -rf "${ECLAIR_OUTPUT_DIR}/.data"
-- 
2.34.1


