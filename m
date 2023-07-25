Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB926761C5F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:58:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569768.890857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJUE-0005HW-9H; Tue, 25 Jul 2023 14:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569768.890857; Tue, 25 Jul 2023 14:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJUE-0005En-6Y; Tue, 25 Jul 2023 14:58:06 +0000
Received: by outflank-mailman (input) for mailman id 569768;
 Tue, 25 Jul 2023 14:58:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p13o=DL=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qOJUC-0004O3-KG
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:58:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a805113b-2afb-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 16:58:04 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.161.75.91])
 by support.bugseng.com (Postfix) with ESMTPSA id 49E694EE0739;
 Tue, 25 Jul 2023 16:58:03 +0200 (CEST)
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
X-Inumbo-ID: a805113b-2afb-11ee-b23f-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 3/4] automation: Add ECLAIR pipelines
Date: Tue, 25 Jul 2023 16:55:56 +0200
Message-Id: <5e0b4afa229e29914392ffee736129f5ec2462cd.1690294965.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690294965.git.simone.ballarin@bugseng.com>
References: <cover.1690294965.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two pipelines that analyze an ARM64 and a X86_64 build with the
ECLAIR static analyzer on the guidelines contained in Set1.

The analysis configuration is stored in automation/eclair_analysis.

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
variable named ECLAIR_BOT_TOKEN is set with the impersonation token of
an account with enough privileges to write on all repositories.

Additionaly any repository should be able to read a masked variable
named WTOKEN with the token provided by BUGSENG.

The analysis fails if it contains violations of guidelines tagged as
clean:added. The list of clean guidelines are maintained in
automation/eclair_analysis/ECLAIR/tagging.ecl.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

--
Changes in v3:
- split definitions of the ECLAIR pipelines in a separate patch;
- if the WTOKEN variable is missing now the analysis fails immediately.

Changes in v2:
- add ECLAIR configuration files (before they were fetched from a separate
    repository);
- now the pipeline fails if there are new violations of guidelines tagged
    with clean:added.
---
 .gitlab-ci.yml                    |  2 ++
 automation/gitlab-ci/analyze.yaml | 38 +++++++++++++++++++++++++++++++
 automation/gitlab-ci/build.yaml   |  1 +
 automation/scripts/eclair         | 34 +++++++++++++++++++++++++++
 4 files changed, 75 insertions(+)
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
index 0000000000..3d8166572b
--- /dev/null
+++ b/automation/gitlab-ci/analyze.yaml
@@ -0,0 +1,38 @@
+.eclair-analysis:
+  stage: analyze
+  tags:
+    - eclair-analysis
+  variables:
+    ECLAIR_OUTPUT_DIR: "ECLAIR_out"
+    ANALYSIS_KIND: "normal"
+    ENABLE_ECLAIR_BOT: "n"
+    AUTO_PR_BRANCH: "staging"
+    AUTO_PR_REPOSITORY: "xen-project/xen"
+  artifacts:
+    when: always
+    paths:
+      - "${ECLAIR_OUTPUT_DIR}/*.log"
+      - "${ECLAIR_OUTPUT_DIR}/*.txt"
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
+  allow_failure: true
+
+eclair-ARM64:
+  extends: .eclair-analysis
+  variables:
+    LOGFILE: "eclair-ARM64.log"
+    VARIANT: "ARM64"
+    RULESET: "Set1"
+  script:
+    - ./automation/scripts/eclair 2>&1 | tee "${LOGFILE}"
+  allow_failure: true
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index c401f62d61..f01e2c32bb 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -11,6 +11,7 @@
       - '*.log'
       - '*/*.log'
     when: always
+  needs: []
   except:
     - master
     - smoke
diff --git a/automation/scripts/eclair b/automation/scripts/eclair
new file mode 100755
index 0000000000..55888617b3
--- /dev/null
+++ b/automation/scripts/eclair
@@ -0,0 +1,34 @@
+#!/bin/sh -eu
+
+ECLAIR_ANALYSIS_DIR=automation/eclair_analysis
+ECLAIR_DIR="${ECLAIR_ANALYSIS_DIR}/ECLAIR"
+ECLAIR_OUTPUT_DIR=$(realpath "${ECLAIR_OUTPUT_DIR}")
+
+if [ -z "${WTOKEN:-}" ]; then
+    echo "Failure: the WTOKEN variable is not defined." >&2
+    exit 1
+fi
+
+"${ECLAIR_ANALYSIS_DIR}/prepare.sh" "${VARIANT}"
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
+# Fail in case of new reports
+"${ECLAIR_DIR}/action_clean_added.sh" "${ECLAIR_OUTPUT_DIR}" || ex=$?
+"${ECLAIR_DIR}/action_log.sh" DIFF_CHECK_LOG \
+                             "ECLAIR diff check" \
+                             "${ECLAIR_OUTPUT_DIR}/clean_added.log" \
+                             "${ex}"
+
+[ "${ex}" = 0 ] || exit "${ex}"
-- 
2.34.1


