Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB03436E01
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 01:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214624.373256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdhD4-0007qW-7u; Thu, 21 Oct 2021 23:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214624.373256; Thu, 21 Oct 2021 23:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdhD4-0007o7-41; Thu, 21 Oct 2021 23:10:54 +0000
Received: by outflank-mailman (input) for mailman id 214624;
 Thu, 21 Oct 2021 23:10:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FXrv=PJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mdhD2-0007Xs-PJ
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 23:10:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22683254-32c4-11ec-839a-12813bfff9fa;
 Thu, 21 Oct 2021 23:10:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E27646135F;
 Thu, 21 Oct 2021 23:10:50 +0000 (UTC)
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
X-Inumbo-ID: 22683254-32c4-11ec-839a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634857851;
	bh=anK1IWiowWa3QzIYeypqJDTgghewGZPtlPhXiip9xco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ezVGuG4czhHVfzMxnuxYuS7wD9FUREil9i8auRTkT+zoQoBCO0VmLjTUEUUHKYpRu
	 QwGYf/OT+wQHcHOaSGSehlaR5V+mMqR2AsracPkE51kIRagBcuRypbRXpTc9JQFrNZ
	 shC3AxgbeigS79UThEIytULUs/GtUoddIO53OzbZ42moU7EAIgEOJc+SgrwAMQtbk2
	 hhzGIaC3jtDINfiIZwdcQ1wH4HWifx1aSjCqBV3w9PpgyDQRgeMLnEQTntOiqVotlu
	 uhder5mNnsvtVZw9nw9PVu3S3eIIKsJHuL6o5INJqoAWf2PzyWv3RS5ckhZXEKfGXo
	 a1cNoZNgUFMUg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	iwj@xenproject.org,
	cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
Date: Thu, 21 Oct 2021 16:08:38 -0700
Message-Id: <20211021230839.10794-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Build a 5.10 kernel to be used as Dom0 and DomU kernel for testing. This
is almost the same as the existing ARM64 recipe for Linux 5.9, the
only differences are:
- upgrade to latest 5.10.x stable
- force Xen modules to built-in (on ARM it was already done by defconfig)

Also add the exporting job to build.yaml so that the binary can be used
during gitlab-ci runs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
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
index 0000000000..f2dbbecf74
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
+    \
+    # Build the kernel
+    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
+    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
+    cd linux-"$LINUX_VERSION" && \
+    make defconfig && \
+    make xen.config && \
+    cp .config .config.orig && \
+    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
+    make -j$(nproc) bzImage && \
+    cp arch/x86/boot/bzImage / && \
+    cd /build && \
+    rm -rf linux-"$LINUX_VERSION"* && \
+    apt-get autoremove -y && \
+    apt-get clean && \
+    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-- 
2.17.1


