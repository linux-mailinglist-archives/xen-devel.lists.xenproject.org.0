Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF67825DA
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 10:54:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587408.918805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0gR-00088f-Q8; Mon, 21 Aug 2023 08:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587408.918805; Mon, 21 Aug 2023 08:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0gR-00084t-MU; Mon, 21 Aug 2023 08:54:47 +0000
Received: by outflank-mailman (input) for mailman id 587408;
 Mon, 21 Aug 2023 08:54:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixuA=EG=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qY0gP-0007nI-Vl
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 08:54:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60272ce1-4000-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 10:54:45 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C77444EE0737;
 Mon, 21 Aug 2023 10:54:44 +0200 (CEST)
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
X-Inumbo-ID: 60272ce1-4000-11ee-8782-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	andrew.cooper3@citrix.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 2/2] automation: avoid pipelines on specific branches
Date: Mon, 21 Aug 2023 10:54:07 +0200
Message-Id: <8ca21d49e7b95e788a4c092c1b8dcd3d1245d638.1692607487.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692607487.git.simone.ballarin@bugseng.com>
References: <cover.1692607487.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch avoids the execution of pipelines in the
following branches:
- master
- smoke
- coverirty-tested/.*
- stable-.*

The job-level exclusions have been removed as they are
pointless with this new workspace-level exclusion.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
- remove useless except clause in .yocto-test.
---
 .gitlab-ci.yml                  |  6 ++++++
 automation/gitlab-ci/build.yaml | 11 -----------
 automation/gitlab-ci/test.yaml  |  5 -----
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ee5430b8b7..ef4484e09a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,3 +1,9 @@
+workflow:
+  rules:
+    - if: $CI_COMMIT_BRANCH =~ /^(master|smoke|^coverity-tested\/.*|stable-.*)$/
+      when: never
+    - when: always
+
 stages:
   - analyze
   - build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 1a4a5e490d..b633facff4 100644
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
@@ -214,11 +209,6 @@
 .yocto-test:
   stage: build
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
-  except:
-    - master
-    - smoke
-    - /^coverity-tested\/.*/
-    - /^stable-.*/
   script:
     - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD} ${YOCTO_OUTPUT}
   variables:
@@ -269,7 +259,6 @@
 .test-jobs-artifact-common:
   stage: build
   needs: []
-  except: !reference [.test-jobs-common, except]
 
 # Arm test artifacts
 
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 810631bc46..8737f367c8 100644
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


