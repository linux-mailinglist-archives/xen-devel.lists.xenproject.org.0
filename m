Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC297F3333
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:07:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637950.994113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THg-0002r9-0o; Tue, 21 Nov 2023 16:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637950.994113; Tue, 21 Nov 2023 16:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THf-0002oK-Tr; Tue, 21 Nov 2023 16:07:31 +0000
Received: by outflank-mailman (input) for mailman id 637950;
 Tue, 21 Nov 2023 16:07:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5THe-0002HT-5q
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:07:30 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11f26ba8-8888-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 17:07:29 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-409299277bbso23519455e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:07:29 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 m26-20020a05600c3b1a00b0040b2b38a1fasm1950957wms.4.2023.11.21.08.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:07:27 -0800 (PST)
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
X-Inumbo-ID: 11f26ba8-8888-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700582849; x=1701187649; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lNDRCElyOb258n1fKG7QxMoPmJ1R7ayXwBT54m1Rig=;
        b=FdQfT8Wu7jWhmvf3tNO4wsZ2chmhKoUmnlZGXM/d12gCF4KlYgRUuW0as6xfpgUaMR
         LV3SzN+dDjV6CIjb/Fhy0QyaQC74Ys9X4Qbz3Nnp6DonEEaGhPabmoch4npogbNoUqvx
         NIAySYR6uuz8M5aVFdF1gh+aVqTe0WtF84ihQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582849; x=1701187649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lNDRCElyOb258n1fKG7QxMoPmJ1R7ayXwBT54m1Rig=;
        b=E+2IL5kl05MWLFFfhQ2eASQHXE1jOW9onsOD8pfJlnQKMxhnzK96Nv7OeOE8/cl6zZ
         /irbVGKKQRg2GZfq5zRaPKkpmHxCgfGucw5zOips4LJ+CcDnn00L5y0YZRujliehLobE
         lxWV5rFCCTI38SF/dkqXg0RNGOJFpuJgYtZI9Ej/VXnRiByMUpQFJ/YyQ1Qwuo4nf5Fr
         xAwaO4R0PjLSXQJNspVkBHCfd7UjzLP7QXdxLyVVAgegS0g1yyJtvVGdsSZ8c/bWAWem
         k4z5dVN0kTQtMYR0YFndQY51GBnMO39lPS2nl1xeyRmaMx3qqNOMkhfj+kK4Ibtl/ChB
         mepw==
X-Gm-Message-State: AOJu0YyvfmOslf2d8QWe/Cv+S++gXoXo2k9l1Ht3Slrn5bFzJYsWsDEK
	9K7pJr0Ice4tArBPSoQs3RXHWP7M+plI2X2kFLM=
X-Google-Smtp-Source: AGHT+IG0JGH0X74kjT9rB/dTBZWAPOVFSXyvwrZVVW6hWpoBZM4xQMBtn0zfd+xCt195lg7P2JfNTQ==
X-Received: by 2002:a05:600c:3b25:b0:407:3b6d:b561 with SMTP id m37-20020a05600c3b2500b004073b6db561mr7605929wms.9.1700582848784;
        Tue, 21 Nov 2023 08:07:28 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/7] automation: add Xen timestamps to all tests
Date: Tue, 21 Nov 2023 17:03:54 +0100
Message-ID: <20231121160358.8080-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121160358.8080-1-roger.pau@citrix.com>
References: <20231121160358.8080-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v1:
 - Expand to all tests.
---
 automation/scripts/qemu-alpine-x86_64.sh          | 2 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh       | 2 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh       | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm32.sh   | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm64.sh   | 2 +-
 automation/scripts/qemu-xtf-dom0less-arm64.sh     | 2 +-
 automation/scripts/qubes-x86-64.sh                | 2 +-
 automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index a1c41c030a47..8e398dcea34b 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -68,7 +68,7 @@ cd ../..
 cat >> binaries/pxelinux.0 << EOF
 #!ipxe
 
-kernel xen console=com1
+kernel xen console=com1 console_timestamps=boot
 module bzImage console=hvc0
 module xen-rootfs.cpio.gz
 boot
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 281cae38b4bd..a4b487b08055 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -63,7 +63,7 @@ XEN="xen-qemuarm"
 DOM0_KERNEL="zImage"
 DOM0_RAMDISK="initrd.gz"
 DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/sbin/init"
-XEN_CMD="console=dtuart dom0_mem=1024M bootscrub=0"
+XEN_CMD="console=dtuart dom0_mem=1024M bootscrub=0 console_timestamps=boot"
 
 NUM_DOMUS=0
 
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index bb3d3a6a816e..e0bb37af3610 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -79,7 +79,7 @@ DEVICE_TREE="virt-gicv2.dtb"
 XEN="xen"
 DOM0_KERNEL="Image"
 DOM0_RAMDISK="xen-rootfs.cpio.gz"
-XEN_CMD="console=dtuart dom0_mem=1024M"
+XEN_CMD="console=dtuart dom0_mem=1024M console_timestamps=boot"
 
 NUM_DOMUS=0
 
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index 737adaf1a9ad..7e3cfbe9c4d0 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -89,7 +89,7 @@ MEMORY_END="0xC0000000"
 
 DEVICE_TREE="virt.dtb"
 XEN="xen"
-XEN_CMD="console=dtuart dom0_mem=512M bootscrub=0"
+XEN_CMD="console=dtuart dom0_mem=512M bootscrub=0 console_timestamps=boot"
 
 DOM0_KERNEL="vmlinuz"
 DOM0_RAMDISK="initrd.gz"
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index b5ce7efdd44e..e748b8ef1699 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -137,7 +137,7 @@ DEVICE_TREE="virt-gicv2.dtb"
 XEN="xen"
 DOM0_KERNEL="Image"
 DOM0_RAMDISK="dom0-rootfs.cpio.gz"
-XEN_CMD="console=dtuart dom0_mem=512M"
+XEN_CMD="console=dtuart dom0_mem=512M console_timestamps=boot"
 
 NUM_DOMUS=1
 DOMU_KERNEL[0]="Image"
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index 0c4578eda66e..a667e0412c92 100755
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -33,7 +33,7 @@ MEMORY_END="0xC0000000"
 XEN="xen"
 DEVICE_TREE="virt-gicv2.dtb"
 
-XEN_CMD="console=dtuart"
+XEN_CMD="console=dtuart console_timestamps=boot"
 
 DOMU_KERNEL[0]="xtf-test"
 DOMU_MEM[0]="128"
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index adec0f1f25c7..d81ed7b931cf 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -185,7 +185,7 @@ TFTP=/scratch/gitlab-runner/tftp
 CONTROLLER=control@thor.testnet
 
 echo "
-multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G $extra_xen_opts
+multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot $extra_xen_opts
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
 module2 (http)/gitlab-ci/initrd-dom0
 " > $TFTP/grub.cfg
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 2bf786f6ee86..4a071c6ef148 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -94,7 +94,7 @@ DEVICE_TREE="mpsoc_smmu.dtb"
 XEN="xen"
 DOM0_KERNEL="Image"
 DOM0_RAMDISK="dom0-rootfs.cpio.gz"
-XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=1024M"
+XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=1024M console_timestamps=boot"
 
 NUM_DOMUS=1
 DOMU_KERNEL[0]="Image"
-- 
2.42.0


