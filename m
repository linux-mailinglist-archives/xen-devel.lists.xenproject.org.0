Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE77809BD0
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 06:47:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650350.1015831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBThV-00029R-EX; Fri, 08 Dec 2023 05:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650350.1015831; Fri, 08 Dec 2023 05:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBThV-00026f-Al; Fri, 08 Dec 2023 05:47:01 +0000
Received: by outflank-mailman (input) for mailman id 650350;
 Fri, 08 Dec 2023 05:46:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBThT-0001af-OM
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 05:46:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 33bdf6e4-958d-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 06:46:58 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA93711FB;
 Thu,  7 Dec 2023 21:47:43 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 442E53F5A1;
 Thu,  7 Dec 2023 21:46:54 -0800 (PST)
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
X-Inumbo-ID: 33bdf6e4-958d-11ee-98e8-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v2 2/5] automation: Add the Dockerfile to build TF-A and U-Boot for FVP
Date: Fri,  8 Dec 2023 13:46:34 +0800
Message-Id: <20231208054637.1973424-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208054637.1973424-1-Henry.Wang@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike the emulators that currently being used in the CI pipelines,
the FVP must start at EL3. Therefore we need the firmware, i.e. the
TrustedFirmware-A (TF-A), for corresponding functionality.

There is a dedicated board (vexpress_fvp) in U-Boot (serve as the
BL33 of the TF-A) for the FVP platform, so the U-Boot should also be
compiled for the FVP platform instead of reusing the U-Boot for the
existing emulators used in the CI pipelines.

To avoid compiling TF-A and U-Boot everytime in the job, adding a
Dockerfile to the test artifacts to build TF-A v2.9.0 and U-Boot
v2023.10 for FVP. The binaries for the TF-A and U-Boot, as well as
the device tree for the FVP platform, will be saved (and exported by
the CI job introduced by following commits). Note that, a patch for
the TF-A will be applied before building to enable the virtio-net
and the virtio-rng device on the FVP. The virtio-net device will
provide the networking service for FVP, and the virtio-rng device
will improve the speed of the FVP.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2:
- Add Stefano's Reviewed-by tag.
---
 .../2023.10-2.9.0-arm64v8.dockerfile          | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile

diff --git a/automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile b/automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile
new file mode 100644
index 0000000000..6566b60545
--- /dev/null
+++ b/automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile
@@ -0,0 +1,48 @@
+FROM --platform=linux/arm64/v8 debian:bookworm
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV UBOOT_VERSION="2023.10"
+ENV TFA_VERSION="v2.9.0"
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
+        git \
+        device-tree-compiler && \
+    apt-get autoremove -y && \
+    apt-get clean && \
+    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+
+# Build U-Boot and TF-A
+RUN curl -fsSLO https://ftp.denx.de/pub/u-boot/u-boot-"$UBOOT_VERSION".tar.bz2 && \
+    tar xvf u-boot-"$UBOOT_VERSION".tar.bz2 && \
+    cd u-boot-"$UBOOT_VERSION" && \
+    make -j$(nproc) V=1 vexpress_fvp_defconfig && \
+    make -j$(nproc) V=1 all && \
+    cd .. && \
+    git clone --branch "$TFA_VERSION" --depth 1 https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git && \
+    cd trusted-firmware-a && \
+    curl -fsSLO https://git.yoctoproject.org/meta-arm/plain/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp-base/0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch \
+         --output 0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch && \
+    git config --global user.email "you@example.com" && \
+    git config --global user.name "Your Name" && \
+    git am 0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch && \
+    make -j$(nproc) DEBUG=1 PLAT=fvp ARCH=aarch64 FVP_DT_PREFIX=fvp-base-gicv3-psci-1t all && \
+    make -j$(nproc) DEBUG=1 PLAT=fvp ARCH=aarch64 FVP_DT_PREFIX=fvp-base-gicv3-psci-1t fip BL33=../u-boot-"$UBOOT_VERSION"/u-boot.bin && \
+    cp build/fvp/debug/bl1.bin / && \
+    cp build/fvp/debug/fip.bin / && \
+    cp build/fvp/debug/fdts/fvp-base-gicv3-psci-1t.dtb / && \
+    cd /build && \
+    rm -rf u-boot-"$UBOOT_VERSION" trusted-firmware-a
-- 
2.25.1


