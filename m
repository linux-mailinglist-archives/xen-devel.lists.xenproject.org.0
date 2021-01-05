Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0446A2EB590
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 23:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62215.110047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwvHu-00031Y-75; Tue, 05 Jan 2021 22:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62215.110047; Tue, 05 Jan 2021 22:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwvHu-00030y-0s; Tue, 05 Jan 2021 22:58:50 +0000
Received: by outflank-mailman (input) for mailman id 62215;
 Tue, 05 Jan 2021 22:58:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kwvHs-00030R-HK
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 22:58:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44fe46ea-2084-4b22-b8cb-912c24e72333;
 Tue, 05 Jan 2021 22:58:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D426E22E00;
 Tue,  5 Jan 2021 22:58:46 +0000 (UTC)
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
X-Inumbo-ID: 44fe46ea-2084-4b22-b8cb-912c24e72333
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609887527;
	bh=Bo3bpKNOhSBLPNUCPy6Vwzq5MAk46fQZxQTlaelSBr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kSoEGvDnU5JkEAXA122w5lnMpw4EtlZzZLmRRd9WP17zZN7lulghgZz+/CoNTdA7D
	 LMrLncIVOegwQBLq9uymPBcfuSbX0RdyTznx+o6XGtEuDz0tHM8wjPqBeoyFDAX02c
	 zAul4G5s37krKKJKD638zgRiG50XrU7Z8x6Zwkl3S5ssbZDbyBpqcpPnY1ovn3T8bR
	 T8XhmXDSFg0xSxTxFq5oDKD9e3VFZW0/JqCMZ7o67FwJtWu+Kt/h+1bznKDBJrWnbn
	 Y9/ieXMj794XDxDERglJOp6VDkCdGFiOyvXX3nYgafXo2aNHsI4KtdOgi7NBeVOfH7
	 RTkluNg1acyNA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 1/3] automation: add qemu-system-aarch64 to test-artifacts
Date: Tue,  5 Jan 2021 14:58:43 -0800
Message-Id: <20210105225845.30346-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2101051452480.4307@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101051452480.4307@sstabellini-ThinkPad-T480s>

Currently we are using Debian's qemu-system-aarch64 for our tests.
However, sometimes it crashes. It is hard to debug and even harder to
apply any fixes to it.

Instead, build our own QEMU as one of our test-artifacts, which are only
built once, then imported into each pipeline via phony jobs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 .../5.2.0-arm64v8.dockerfile                  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 automation/tests-artifacts/qemu-system-aarch64/5.2.0-arm64v8.dockerfile

diff --git a/automation/tests-artifacts/qemu-system-aarch64/5.2.0-arm64v8.dockerfile b/automation/tests-artifacts/qemu-system-aarch64/5.2.0-arm64v8.dockerfile
new file mode 100644
index 0000000000..e105a1c636
--- /dev/null
+++ b/automation/tests-artifacts/qemu-system-aarch64/5.2.0-arm64v8.dockerfile
@@ -0,0 +1,75 @@
+FROM arm64v8/debian:unstable
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV QEMU_VERSION=5.2.0
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        build-essential \
+        curl \
+        python3 \
+        ninja-build \
+        pkg-config \
+        libglib2.0-dev \
+        libpixman-1-dev \
+        && \
+    \
+    curl -fsSLO https://download.qemu.org/qemu-"$QEMU_VERSION".tar.xz && \
+    tar xvJf qemu-"$QEMU_VERSION".tar.xz && \
+    cd qemu-"$QEMU_VERSION" && \
+    ./configure                \
+        --target-list=aarch64-softmmu \
+        --enable-system        \
+        --disable-blobs        \
+        --disable-bsd-user     \
+        --disable-debug-info   \
+        --disable-glusterfs    \
+        --disable-gtk          \
+        --disable-guest-agent  \
+        --disable-linux-user   \
+        --disable-sdl          \
+        --disable-spice        \
+        --disable-tpm          \
+        --disable-vhost-net    \
+        --disable-vhost-scsi   \
+        --disable-vhost-user   \
+        --disable-vhost-vsock  \
+        --disable-virtfs       \
+        --disable-vnc          \
+        --disable-werror       \
+        --disable-xen          \
+        --disable-safe-stack   \
+        --disable-libssh       \
+        --disable-opengl       \
+        --disable-tools        \
+        --disable-virglrenderer  \
+        --disable-stack-protector  \
+        --disable-containers   \
+        --disable-replication  \
+        --disable-cloop        \
+        --disable-dmg          \
+        --disable-vvfat        \
+        --disable-vdi          \
+        --disable-parallels    \
+        --disable-qed          \
+        --disable-bochs        \
+        --disable-qom-cast-debug  \
+        --disable-vhost-vdpa   \
+        --disable-vhost-kernel \
+        --disable-qcow1        \
+        --disable-live-block-migration \
+    && \
+    make -j$(nproc) && \
+    cp ./build/qemu-system-aarch64 / && \
+    cd /build && \
+    rm -rf qemu-"$QEMU_VERSION"* && \
+    apt-get autoremove -y && \
+    apt-get clean && \
+    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-- 
2.17.1


