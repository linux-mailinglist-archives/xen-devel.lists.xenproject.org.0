Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6A343A9CB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 03:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216155.375671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBTg-0002CR-9Z; Tue, 26 Oct 2021 01:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216155.375671; Tue, 26 Oct 2021 01:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBTg-00029o-5L; Tue, 26 Oct 2021 01:42:12 +0000
Received: by outflank-mailman (input) for mailman id 216155;
 Tue, 26 Oct 2021 01:42:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zbS=PO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfBTe-0001Zx-Lq
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 01:42:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2a19dd3-c513-4b1b-80f8-6e8668b534a1;
 Tue, 26 Oct 2021 01:42:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4328160041;
 Tue, 26 Oct 2021 01:42:04 +0000 (UTC)
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
X-Inumbo-ID: c2a19dd3-c513-4b1b-80f8-6e8668b534a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635212524;
	bh=mvnhBoB/kIkG732gUvVDI6GT3xtvGIUsrPyx8vSP5Qo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D2hpE7ysQr7wrinGPFTuUj3vDE5AR5QMOmm/XRUx+0dmnDvWl2kpGqnWc+neNQIhg
	 NDWqqD4cqh51EeCe7I+rXCPzbC2Iz8QfM7NjGjgzI6Aa9kIOumc8r5iZKWSy1e2M1Q
	 T+UOHPADg24UOK5C7qAYepm9yunDVBv4E+4Ks6bOeRx2gaKUxb1vOohS0d1XUejnTb
	 yPKxj/cZtF7FJ80UBKPTEjyuEhRjK2Zuresu2Q+shkz5zt9aOhJkAwIXijHK53H00x
	 bklZ4lqZ2RyzNX+QuqBmkLO3dFGruQHjMsZQlcvbZ9JYl22vgZlMjHjS+Xh8iuvuS6
	 xg9n9z3PWrQVg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	iwj@xenproject.org,
	cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 2/3] automation: Linux 5.10.74 test-artifact
Date: Mon, 25 Oct 2021 18:41:59 -0700
Message-Id: <20211026014200.32102-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2110251836020.4586@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110251836020.4586@sstabellini-ThinkPad-T480s>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Build a 5.10 kernel to be used as Dom0 and DomU kernel for testing. This
is almost the same as the existing ARM64 recipe for Linux 5.9, the
only differences are:
- upgrade to latest 5.10.x stable
- force Xen modules to built-in (on ARM it was already done by defconfig)

Also add the exporting job to build.yaml so that the binary can be used
during gitlab-ci runs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---

Note that make tinyconfig cannot be used because it doesn't boot on QEMU

Changes in 2:
- use two RUNs
- remove apt-get cleanup earlier
---
 automation/gitlab-ci/build.yaml               | 11 ++++++
 .../tests-artifacts/kernel/5.10.74.dockerfile | 38 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 automation/tests-artifacts/kernel/5.10.74.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 76b73beead..0034c50950 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -609,3 +609,14 @@ alpine-3.12-rootfs-export:
       - binaries/initrd.tar.gz
   tags:
     - x86_64
+
+kernel-5.10.74-export:
+  stage: build
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.10.74
+  script:
+    - mkdir binaries && cp /bzImage binaries/bzImage
+  artifacts:
+    paths:
+      - binaries/bzImage
+  tags:
+    - x86_64
diff --git a/automation/tests-artifacts/kernel/5.10.74.dockerfile b/automation/tests-artifacts/kernel/5.10.74.dockerfile
new file mode 100644
index 0000000000..112e27fe45
--- /dev/null
+++ b/automation/tests-artifacts/kernel/5.10.74.dockerfile
@@ -0,0 +1,38 @@
+FROM debian:unstable
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV LINUX_VERSION=5.10.74
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        build-essential \
+        libssl-dev \
+        bc \
+        curl \
+        flex \
+        bison \
+        libelf-dev \
+        && \
+    apt-get autoremove -y && \
+    apt-get clean && \
+    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+
+# Build the kernel
+RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
+    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
+    cd linux-"$LINUX_VERSION" && \
+    make defconfig && \
+    make xen.config && \
+    cp .config .config.orig && \
+    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
+    make -j$(nproc) bzImage && \
+    cp arch/x86/boot/bzImage / && \
+    cd /build && \
+    rm -rf linux-"$LINUX_VERSION"*
-- 
2.17.1


