Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11E80898C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 14:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649873.1014938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEor-0002ef-QI; Thu, 07 Dec 2023 13:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649873.1014938; Thu, 07 Dec 2023 13:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEor-0002cc-MP; Thu, 07 Dec 2023 13:53:37 +0000
Received: by outflank-mailman (input) for mailman id 649873;
 Thu, 07 Dec 2023 13:53:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCsk=HS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBEoq-0002bv-6w
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 13:53:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 030ad929-9508-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 14:53:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AD19139F;
 Thu,  7 Dec 2023 05:54:19 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C348F3F6C4;
 Thu,  7 Dec 2023 05:53:30 -0800 (PST)
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
X-Inumbo-ID: 030ad929-9508-11ee-9b0f-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH 1/5] automation: Add a Dockerfile for running FVP_Base jobs
Date: Thu,  7 Dec 2023 21:53:14 +0800
Message-Id: <20231207135318.1912846-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207135318.1912846-1-Henry.Wang@arm.com>
References: <20231207135318.1912846-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed Virtual Platforms (FVPs) are complete simulations of an Arm
system, including processor, memory and peripherals. These are set
out in a "programmer's view", which gives programmers a comprehensive
model on which to build and test software. FVP can be configured to
different setups by its cmdline parameters, and hence having the FVP
in CI will provide us with the flexibility to test Arm features and
setups that we find difficult to use real hardware or emulators.

This commit adds a Dockerfile for the new arm64v8 container with
FVP installed, based on the debian bookworm-arm64v8 image. This
container will be used to run the FVP test jobs. Compared to the
debian bookworm-arm64v8 image, the packages in the newly added FVP
container does not contain the `u-boot-qemu`, and adds the `expect`
to run expect scripts introduced by following commits, `telnet` to
connect to FVP, and `tftpd-hpa` to provide the TFTP service for
the FVP.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 .../debian/bookworm-arm64v8-fvp.dockerfile    | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 automation/build/debian/bookworm-arm64v8-fvp.dockerfile

diff --git a/automation/build/debian/bookworm-arm64v8-fvp.dockerfile b/automation/build/debian/bookworm-arm64v8-fvp.dockerfile
new file mode 100644
index 0000000000..3b87dc5a5b
--- /dev/null
+++ b/automation/build/debian/bookworm-arm64v8-fvp.dockerfile
@@ -0,0 +1,64 @@
+FROM --platform=linux/arm64/v8 debian:bookworm
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ARG FVP_BASE_VERSION="11.23_9_Linux64_armv8l"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        build-essential \
+        zlib1g-dev \
+        libncurses5-dev \
+        libssl-dev \
+        python3-dev \
+        python3-setuptools \
+        xorg-dev \
+        uuid-dev \
+        libyajl-dev \
+        libaio-dev \
+        libglib2.0-dev \
+        clang \
+        libpixman-1-dev \
+        pkg-config \
+        flex \
+        bison \
+        acpica-tools \
+        libfdt-dev \
+        bin86 \
+        bcc \
+        liblzma-dev \
+        libnl-3-dev \
+        ocaml-nox \
+        libfindlib-ocaml-dev \
+        markdown \
+        transfig \
+        pandoc \
+        checkpolicy \
+        wget \
+        git \
+        nasm \
+        # for test phase, fvp-smoke-* jobs
+        u-boot-tools \
+        expect \
+        device-tree-compiler \
+        curl \
+        cpio \
+        busybox-static \
+        telnet \
+        tftpd-hpa \
+        && \
+        apt-get autoremove -y && \
+        apt-get clean && \
+        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+
+RUN wget https://developer.arm.com/-/media/Files/downloads/ecosystem-models/FVP_Base_RevC-2xAEMvA_${FVP_BASE_VERSION}.tgz && \
+    mkdir -p /FVP/FVP_Base_RevC-2xAEMvA && \
+    tar -xvzf FVP_Base_RevC-2xAEMvA_${FVP_BASE_VERSION}.tgz -C /FVP/FVP_Base_RevC-2xAEMvA && \
+    rm FVP_Base_RevC-2xAEMvA_${FVP_BASE_VERSION}.tgz
-- 
2.25.1


