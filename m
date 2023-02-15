Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005EF6972F7
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 01:59:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495667.766061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS67o-0003Lw-QX; Wed, 15 Feb 2023 00:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495667.766061; Wed, 15 Feb 2023 00:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS67o-0003Jb-MK; Wed, 15 Feb 2023 00:58:20 +0000
Received: by outflank-mailman (input) for mailman id 495667;
 Wed, 15 Feb 2023 00:58:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HlLs=6L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pS67n-00031p-4O
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 00:58:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4b6d72c-accb-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 01:58:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B9046196F;
 Wed, 15 Feb 2023 00:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C64C433EF;
 Wed, 15 Feb 2023 00:58:14 +0000 (UTC)
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
X-Inumbo-ID: d4b6d72c-accb-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676422695;
	bh=Tso1s+NNc0babg5gBaw2ZRssYgQb1dk1kR0QDs857oM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h9sEomkJbhXuQA5ATZFvf47ocWOiT3f43NB5E/VOQL9pvF+Ycb4EMmDdsWd4WuiVk
	 gEi+BNSiLbdORB2jE4vM8JBhAhv0HLnNxCX7HxWiD5voQVNZ4sdTeISEGlFiBQwOHf
	 11FAIcGRechRd5cbFMMBJrkovENNjM9fBxZQBN0YBGLyz4uG6KX6DONaWc2laomcf/
	 S4odQbxQrsM4+LGfkybjNIQRIELqr+xtlywEZbJfrQBJLbi7bQYZlXVKB7+6dzq4vn
	 1AI+BAY6JYiX7JTC8WDylNgt7mGlAvcPKb9/bV6Sqqgx7U6CVprscX8taFoyZ8+LnL
	 HBN8RCpShtnfQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 1/3] automation: move yocto jobs to build stage
Date: Tue, 14 Feb 2023 16:58:09 -0800
Message-Id: <20230215005811.2126759-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302141642520.2025117@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302141642520.2025117@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

We are going to use artifacts produced by the Yocto builds in test jobs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/gitlab-ci/build.yaml | 51 +++++++++++++++++++++++++++++++++
 automation/gitlab-ci/test.yaml  | 45 -----------------------------
 2 files changed, 51 insertions(+), 45 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index a053c5c732..f62cf21f45 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -199,6 +199,41 @@
   variables:
     <<: *gcc
 
+.yocto-test:
+  stage: build
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  except:
+    - master
+    - smoke
+    - /^coverity-tested\/.*/
+    - /^stable-.*/
+  script:
+    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD}
+  variables:
+    YOCTO_VERSION: kirkstone
+    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}-${YOCTO_HOST}
+  artifacts:
+    paths:
+      - 'logs/*'
+    when: always
+  needs: []
+
+.yocto-test-arm64:
+  extends: .yocto-test
+  variables:
+    YOCTO_HOST: arm64v8
+  tags:
+    - arm64
+
+# This is not used by any test job as we only run Yocto on arm based machines.
+# Keep it here so that someone having x86 hardware can easily add jobs.
+.yocto-test-x86-64:
+  extends: .yocto-test
+  variables:
+    YOCTO_HOST: amd64
+  tags:
+    - x86_64
+
 # Jobs below this line
 
 archlinux-gcc:
@@ -679,6 +714,22 @@ archlinux-current-gcc-riscv64-debug-randconfig:
     EXTRA_FIXED_RANDCONFIG:
       CONFIG_COVERAGE=n
 
+# Yocto test jobs
+yocto-qemuarm64:
+  extends: .yocto-test-arm64
+  variables:
+    YOCTO_BOARD: qemuarm64
+
+yocto-qemuarm:
+  extends: .yocto-test-arm64
+  variables:
+    YOCTO_BOARD: qemuarm
+
+yocto-qemux86-64:
+  extends: .yocto-test-arm64
+  variables:
+    YOCTO_BOARD: qemux86-64
+
 ## Test artifacts common
 
 .test-jobs-artifact-common:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index ce543ef5c0..9570085a60 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -67,35 +67,6 @@
   tags:
     - x86_64
 
-.yocto-test:
-  extends: .test-jobs-common
-  script:
-    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD}
-  variables:
-    YOCTO_VERSION: kirkstone
-    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}-${YOCTO_HOST}
-  artifacts:
-    paths:
-      - 'logs/*'
-    when: always
-  needs: []
-
-.yocto-test-arm64:
-  extends: .yocto-test
-  variables:
-    YOCTO_HOST: arm64v8
-  tags:
-    - arm64
-
-# This is not used by any test job as we only run Yocto on arm based machines.
-# Keep it here so that someone having x86 hardware can easily add jobs.
-.yocto-test-x86-64:
-  extends: .yocto-test
-  variables:
-    YOCTO_HOST: amd64
-  tags:
-    - x86_64
-
 # Test jobs
 build-each-commit-gcc:
   extends: .test-jobs-common
@@ -253,19 +224,3 @@ qemu-smoke-riscv64-gcc:
     - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - archlinux-current-gcc-riscv64-debug
-
-# Yocto test jobs
-yocto-qemuarm64:
-  extends: .yocto-test-arm64
-  variables:
-    YOCTO_BOARD: qemuarm64
-
-yocto-qemuarm:
-  extends: .yocto-test-arm64
-  variables:
-    YOCTO_BOARD: qemuarm
-
-yocto-qemux86-64:
-  extends: .yocto-test-arm64
-  variables:
-    YOCTO_BOARD: qemux86-64
-- 
2.25.1


