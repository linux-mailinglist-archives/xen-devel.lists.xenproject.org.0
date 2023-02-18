Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CD769B695
	for <lists+xen-devel@lfdr.de>; Sat, 18 Feb 2023 01:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497383.768362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTAlf-0004V5-AN; Sat, 18 Feb 2023 00:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497383.768362; Sat, 18 Feb 2023 00:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTAlf-0004RY-7h; Sat, 18 Feb 2023 00:07:55 +0000
Received: by outflank-mailman (input) for mailman id 497383;
 Sat, 18 Feb 2023 00:07:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEmr=6O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pTAle-00049k-9V
 for xen-devel@lists.xenproject.org; Sat, 18 Feb 2023 00:07:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48f14359-af20-11ed-93b5-47a8fe42b414;
 Sat, 18 Feb 2023 01:07:52 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 502FE62027;
 Sat, 18 Feb 2023 00:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26F5C433D2;
 Sat, 18 Feb 2023 00:07:49 +0000 (UTC)
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
X-Inumbo-ID: 48f14359-af20-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676678870;
	bh=eUlQ2APESts0KA52L+gW/CObn9jC9xSw37MuWYocq/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S/6bIW8WuMo6WZuj+xNOII5k/p1taF2QhZ9oyCU1Hvf880dbJMlgouSWHR1+Lc7c2
	 T85c6lClqNHXHmV/ViHl6Flg0+eTy5lukFV81JO5Rj6GPE2Q0vC6T1SzddAx1P7ZS0
	 H+Q1r9Z4AdwKsM0PX+3KxtTGbaAAv2zdYpUwiX1HqHqeSd3NCthBu4gbrxYEFQeJOl
	 Ok2joly/5PzlcIbYPju7dfY4J4NkPAqfqabjJnmoB/DQS6IOU8BxSEoudcYLj6nASM
	 ifWzwXA4kQK0BW8AavDtXYwAvgg2gUVZJLO8KCPpw/nOBthvwhNviO+E4EkGT8jDPs
	 5EzRZjmghAxYA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v3 1/3] automation: move yocto jobs to build stage
Date: Fri, 17 Feb 2023 16:07:45 -0800
Message-Id: <20230218000747.2965719-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302171606480.2127160@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302171606480.2127160@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

We are going to use artifacts produced by the Yocto builds in test jobs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/build.yaml | 51 +++++++++++++++++++++++++++++++++
 automation/gitlab-ci/test.yaml  | 45 -----------------------------
 2 files changed, 51 insertions(+), 45 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 079e9b73f6..b6ae1c663b 100644
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
@@ -699,6 +734,22 @@ archlinux-current-gcc-riscv64-debug-randconfig:
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
index c0b4a90e0d..00273b21c8 100644
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
@@ -317,19 +288,3 @@ qemu-smoke-riscv64-gcc:
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


