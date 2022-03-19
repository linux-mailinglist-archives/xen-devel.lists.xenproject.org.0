Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8894DE4DF
	for <lists+xen-devel@lfdr.de>; Sat, 19 Mar 2022 01:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292295.496520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVN2V-0000qj-Nc; Sat, 19 Mar 2022 00:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292295.496520; Sat, 19 Mar 2022 00:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVN2V-0000oq-KB; Sat, 19 Mar 2022 00:33:51 +0000
Received: by outflank-mailman (input) for mailman id 292295;
 Sat, 19 Mar 2022 00:33:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/Ld=T6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nVN2U-0000oh-Vh
 for xen-devel@lists.xenproject.org; Sat, 19 Mar 2022 00:33:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e6952fc-a71c-11ec-a405-831a346695d4;
 Sat, 19 Mar 2022 01:33:49 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 965C96172C;
 Sat, 19 Mar 2022 00:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EB3C340E8;
 Sat, 19 Mar 2022 00:33:47 +0000 (UTC)
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
X-Inumbo-ID: 3e6952fc-a71c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647650027;
	bh=6fcuGmN0VOLiEsFwZuvE42PfLHtwz8AS00f3BuXsHLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJBrcvGzAwk2NJLCL2vgWEwgRqsm7D2NQAs4UedGwFSJxTl1OJlLAS7gPybXIgyWU
	 0IIXrncNTajY95Ybj5a+X9DJahIfJOvThqIfat3MajaaE/gaUXXviIVALvB+U94Ui5
	 kmlm6kT9b/foecyKTD0AC6MCjtLqAjLBODqIaTM5t3jHkWMMXFo3G0pnAgmVkpL/4q
	 XM2xD5uAxomGi9jPLFqew504SNpqu7Wcz57Q1JMyrAOh0JGqkI/xXchwuXHMvUD61X
	 PY4NTlbhJVAY+aaDhjXczlTY6lN9Lo4Fh1Xxva4/8CjKQLm8myn7jwGYJvZyTxb7dn
	 nRxY01Vkm74pw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	bertrand.marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 1/2] gitlab-ci: add qemu-system-arm to the existing tests-artifacts container
Date: Fri, 18 Mar 2022 17:32:20 -0700
Message-Id: <20220319003221.3012314-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2203181729490.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203181729490.2910984@ubuntu-linux-20-04-desktop>
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


