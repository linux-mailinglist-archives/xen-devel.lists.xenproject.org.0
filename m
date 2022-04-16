Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6F7503203
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 02:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305999.521181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfW7g-0005dU-8E; Sat, 16 Apr 2022 00:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305999.521181; Sat, 16 Apr 2022 00:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfW7g-0005ah-5B; Sat, 16 Apr 2022 00:17:08 +0000
Received: by outflank-mailman (input) for mailman id 305999;
 Sat, 16 Apr 2022 00:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijIa=U2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfW7e-0005ZY-JX
 for xen-devel@lists.xenproject.org; Sat, 16 Apr 2022 00:17:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bc253b9-bd1a-11ec-a405-831a346695d4;
 Sat, 16 Apr 2022 02:17:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CF7DCB82E4A;
 Sat, 16 Apr 2022 00:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FAAC385A5;
 Sat, 16 Apr 2022 00:17:03 +0000 (UTC)
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
X-Inumbo-ID: 8bc253b9-bd1a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650068223;
	bh=6fcuGmN0VOLiEsFwZuvE42PfLHtwz8AS00f3BuXsHLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pmApBdSJcHbWbnfh+wsXmuRYSnhYIeiPQPRc4utM1Ay1wZAcwlg9eARU4nGFie76I
	 PsvlRrYXaf4UdX0165uOp7ChN1y2AwXvQpPFnJwUiDXxu5C6dQf81pDwXHKfvAGA4z
	 T6BIWl9KhXAJyfQ8hRWTCh9gVxCIlbCX97jbX/IwuR6uQJdn4iaxUYWfsVgB5+u864
	 g6G3UOO4ec7D0Iqt8BMPw8/DxIoZROyDWTdd4CJrInXjC+69/ilbCUcjV58zvS3v5y
	 wQxHd8egnwz8ohRMB9SdkYv4k3IKUD6ZEpUCLWwEc0pVFu7REztgesJJxPbhrUL+n5
	 7XbL0a/A47Uug==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	bertrand.marquis@arm.com,
	michal.orzel@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v5 1/2] gitlab-ci: add qemu-system-arm to the existing tests-artifacts container
Date: Fri, 15 Apr 2022 17:17:00 -0700
Message-Id: <20220416001701.1301324-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2204151715100.915916@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2204151715100.915916@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Add qemu-system-arm to the existing test-artifacts qemu container (which
doesn't get build for every iteration but only updated once in a while.)

With qemu-system-arm available, we'll be able to run ARM32 tests.

This patch also bumps the QEMU version to v6.0.0 for both arm32 and
arm64 (the test-artifacts container is one, shared for both).

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/gitlab-ci/build.yaml                    | 14 ++++++++++++--
 automation/gitlab-ci/test.yaml                     |  4 ++--
 ...arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} |  5 +++--
 3 files changed, 17 insertions(+), 6 deletions(-)
 rename automation/tests-artifacts/qemu-system-aarch64/{5.2.0-arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} (95%)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index cc36428cf5..72f2a317ac 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -591,9 +591,9 @@ kernel-5.9.9-arm64-export:
   tags:
     - arm64
 
-qemu-system-aarch64-5.2.0-arm64-export:
+qemu-system-aarch64-6.0.0-arm64-export:
   stage: build
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:5.2.0-arm64v8
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
   script:
     - mkdir binaries && cp /qemu-system-aarch64 binaries/qemu-system-aarch64
   artifacts:
@@ -602,6 +602,16 @@ qemu-system-aarch64-5.2.0-arm64-export:
   tags:
     - arm64
 
+qemu-system-aarch64-6.0.0-arm32-export:
+  stage: build
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
+  script:
+    - mkdir binaries && cp /qemu-system-arm binaries/qemu-system-arm
+  artifacts:
+    paths:
+      - binaries/qemu-system-arm
+  tags:
+    - arm64
 
 # x86_64 test artifacts
 
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 47e8704df3..ec2a2e1607 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -33,7 +33,7 @@ qemu-alpine-arm64-gcc:
     - alpine-3.12-gcc-arm64
     - alpine-3.12-arm64-rootfs-export
     - kernel-5.9.9-arm64-export
-    - qemu-system-aarch64-5.2.0-arm64-export
+    - qemu-system-aarch64-6.0.0-arm64-export
   artifacts:
     paths:
       - smoke.serial
@@ -81,7 +81,7 @@ qemu-smoke-arm64-gcc:
   dependencies:
     - debian-unstable-gcc-arm64
     - kernel-5.9.9-arm64-export
-    - qemu-system-aarch64-5.2.0-arm64-export
+    - qemu-system-aarch64-6.0.0-arm64-export
   artifacts:
     paths:
       - smoke.serial
diff --git a/automation/tests-artifacts/qemu-system-aarch64/5.2.0-arm64v8.dockerfile b/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
similarity index 95%
rename from automation/tests-artifacts/qemu-system-aarch64/5.2.0-arm64v8.dockerfile
rename to automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
index e105a1c636..793432d40b 100644
--- a/automation/tests-artifacts/qemu-system-aarch64/5.2.0-arm64v8.dockerfile
+++ b/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
@@ -3,7 +3,7 @@ LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
 ENV DEBIAN_FRONTEND=noninteractive
-ENV QEMU_VERSION=5.2.0
+ENV QEMU_VERSION=6.0.0
 ENV USER root
 
 RUN mkdir /build
@@ -25,7 +25,7 @@ RUN apt-get update && \
     tar xvJf qemu-"$QEMU_VERSION".tar.xz && \
     cd qemu-"$QEMU_VERSION" && \
     ./configure                \
-        --target-list=aarch64-softmmu \
+        --target-list=arm-softmmu,aarch64-softmmu \
         --enable-system        \
         --disable-blobs        \
         --disable-bsd-user     \
@@ -68,6 +68,7 @@ RUN apt-get update && \
     && \
     make -j$(nproc) && \
     cp ./build/qemu-system-aarch64 / && \
+    cp ./build/qemu-system-arm / && \
     cd /build && \
     rm -rf qemu-"$QEMU_VERSION"* && \
     apt-get autoremove -y && \
-- 
2.25.1


