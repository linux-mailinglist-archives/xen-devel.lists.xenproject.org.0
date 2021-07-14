Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F78D3C7AB0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 02:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155851.287652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3T59-0003bF-RJ; Wed, 14 Jul 2021 00:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155851.287652; Wed, 14 Jul 2021 00:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3T59-0003YO-NQ; Wed, 14 Jul 2021 00:48:59 +0000
Received: by outflank-mailman (input) for mailman id 155851;
 Wed, 14 Jul 2021 00:48:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m3T58-0003Et-Sw
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 00:48:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44c93f4e-e43d-11eb-87c6-12813bfff9fa;
 Wed, 14 Jul 2021 00:48:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7085611AC;
 Wed, 14 Jul 2021 00:48:55 +0000 (UTC)
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
X-Inumbo-ID: 44c93f4e-e43d-11eb-87c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626223736;
	bh=uAe5ce07AyeZidUJgVPIxlpzXYZq94Yro+8L3O62nyc=;
	h=From:To:Cc:Subject:Date:From;
	b=bJt7AcDNXNOe5Xj8JvuliLyBbx09Oh1e5Z2Bpd8sL2KMQEt15baM5GOYF4YpT0/fK
	 gj0vJaBb56xwXiYeWOtfmDvkJTo6D9jgY+VnJydl50Bt+q03HZlP9TS+z+Bi+iK0ud
	 M+xLGd9NLAOEN33wqCLIVGNePGndoPDXAeTMCjvCWG6z1mtEGTNnNnHQzWU1NEpFcQ
	 mL9/NYUXDaP8LrYBy8m7VXcjDUz7moIwiymIH3Xr/seS/3o+3nxbVeQlhqVhlEVlW9
	 wA1SuBcPr14EK1OIEhoB8FpMs1/Ym2TFi39pe07N2Hrrlj3jOBT7OCEu35Ctz5yFTD
	 pbWMkYx1HqAsA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH RESEND 1/2] gitlab-ci: add qemu-system-arm to the existing tests-artifacts container
Date: Tue, 13 Jul 2021 17:48:53 -0700
Message-Id: <20210714004854.31135-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Add qemu-system-arm to the existing test-artifacts qemu container (which
doesn't get build for every iteration but only updated once in a while.)

With qemu-system-arm available, we'll be able to run ARM32 tests.

This patch also bumps the QEMU version to v6.0.0 for both arm32 and
arm64 (the test-artifacts container is one, shared for both).

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/gitlab-ci/build.yaml                    | 14 ++++++++++++--
 automation/gitlab-ci/test.yaml                     |  4 ++--
 ...arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} |  5 +++--
 3 files changed, 17 insertions(+), 6 deletions(-)
 rename automation/tests-artifacts/qemu-system-aarch64/{5.2.0-arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} (95%)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d177da1710..75a3830a14 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -585,9 +585,9 @@ kernel-5.9.9-arm64-export:
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
@@ -596,3 +596,13 @@ qemu-system-aarch64-5.2.0-arm64-export:
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
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 91a10febbf..d3b670b156 100644
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
@@ -57,7 +57,7 @@ qemu-smoke-arm64-gcc:
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
2.17.1


