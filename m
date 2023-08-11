Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A816D779110
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 15:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582443.912238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUSaG-0004tz-6a; Fri, 11 Aug 2023 13:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582443.912238; Fri, 11 Aug 2023 13:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUSaG-0004r3-3E; Fri, 11 Aug 2023 13:53:44 +0000
Received: by outflank-mailman (input) for mailman id 582443;
 Fri, 11 Aug 2023 13:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ho8F=D4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qUSaF-0004qD-8c
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 13:53:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a4f24a5-384e-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 15:53:40 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 25D474EE073A;
 Fri, 11 Aug 2023 15:53:40 +0200 (CEST)
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
X-Inumbo-ID: 7a4f24a5-384e-11ee-8613-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	andrew.cooper3@citrix.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 2/2] automation/eclair: avoid unintentional ECLAIR analysis
Date: Fri, 11 Aug 2023 15:52:55 +0200
Message-Id: <57bc71b428d439f933cdbb0b88a36b39bc77e45e.1691760935.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691760935.git.simone.ballarin@bugseng.com>
References: <cover.1691760935.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With this patch, ECLAIR jobs will need to be manually
started for "people/.*" pipelines.

This avoids occupying the runner on analyzes that might
not be used by developers.

If developers want to analyze their own repositories
they need to launch them from GitLab.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 automation/gitlab-ci/analyze.yaml | 14 ++++++++++----
 automation/gitlab-ci/build.yaml   |  6 ------
 automation/gitlab-ci/test.yaml    |  5 -----
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 4aa4abe2ee..f04ff99093 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -20,21 +20,27 @@
       codequality: gl-code-quality-report.json
   needs: []
 
-eclair-x86_64:
+.eclair-analysis:triggered:
   extends: .eclair-analysis
+  allow_failure: true
+  rules:
+    - if: $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
+      when: manual
+    - when: always
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
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 173613567c..e4b601943c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -12,11 +12,6 @@
       - '*/*.log'
     when: always
   needs: []
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 .gcc-tmpl:
   variables: &gcc
@@ -269,7 +264,6 @@
 .test-jobs-artifact-common:
   stage: build
   needs: []
-  except: !reference [.test-jobs-common, except]
 
 # Arm test artifacts
 
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 8ccce1fe26..11cb97ea4b 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -1,11 +1,6 @@
 .test-jobs-common:
   stage: test
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
 
 .arm64-test-needs: &arm64-test-needs
   - alpine-3.18-arm64-rootfs-export
-- 
2.34.1


