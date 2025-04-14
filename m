Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 154F6A87E7C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949711.1346189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hgc-0000Sv-Gv; Mon, 14 Apr 2025 11:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949711.1346189; Mon, 14 Apr 2025 11:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hgc-0000P1-CI; Mon, 14 Apr 2025 11:09:10 +0000
Received: by outflank-mailman (input) for mailman id 949711;
 Mon, 14 Apr 2025 11:09:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Hga-0000MU-Nw
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:09:08 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e220a06e-1920-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 13:09:07 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso47883105e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 04:09:07 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb8dsm176820405e9.7.2025.04.14.04.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 04:09:05 -0700 (PDT)
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
X-Inumbo-ID: e220a06e-1920-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744628946; x=1745233746; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBsbtJWmb5Zjdqx5uqaCyBE8HBftWoPnuYYOOu+JrK4=;
        b=K7aXmDmdfjApTyw7xTUEavAFIsO/4b1tGBpc8NQzCloYdKyI55RGk2Hap00hPEzzNk
         hrsBoE27fv0dJYEEwYK2P344UY0HTYFVcRSj7WgjgioUCS27D4aj8KlpPrVP1ZoomMJf
         0KPhNRKCNuoTkZZrWW0XLCuvVFJrpIfR5NvqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744628946; x=1745233746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBsbtJWmb5Zjdqx5uqaCyBE8HBftWoPnuYYOOu+JrK4=;
        b=f7L0nPphXVWBofrwuzs000Rpgw568xHkafhVrjxEViokVn7Y47elC84JCz39ppihou
         LTAmZC7BQ5Wc6EJ+TI0FXz+VR+kccDMctyy1rRmQyQZIMRicm4Ww3QivTwoJLzQpGi9H
         mJkwGyfqFlKE9cxyV1krVmnUdc0m55hAI3P0DqrfJNn8mduXaqS0qWOAbHnn9fNEGhjE
         NdbifAMYvOEXSkx3gWE6It7aO4kaeVVQN0yFBlypGmw357d5KYWfa1vyP8yLE+J3UIaS
         FrwBNFoFe6MXk0q0iE1LRA89xhPA5k7ac663K4DKoMkAV0VuIqMJfTZ8jpO5XXjUo/Hk
         RcTQ==
X-Gm-Message-State: AOJu0YwtPidPi+wRoEa868zyNbrP2gpqRkZF4aj7R19NK1js/LUPKOeC
	3l6hvZ6GQV6QBRBlVN8RD8vT7B5LFsCdZJNCrUTxwdD1g9GOlmsIb+NJt9h4YtGS1httlvnMT5w
	CknM=
X-Gm-Gg: ASbGncscMhASDKVZuyk35YS9ydmcXCNem5CFzGLeFBAa/RXfKh259vPJzN47M/jq/8D
	Ze8HVsqsnruYfR387jkHDJXz0gBYOdteMNpbhxXaPD//xKACT3tfXWDXbl6DE1ahp05rCT7g096
	kba00eT09npyeyWuDO6Ti5m6O5DlkMdJN9egKr+RBDevr0aXZMZ7cDTzdDj8ohYZlcBMB15HTWw
	IzIEmSyKsKF0+zAYLn6UzNcDHlV/x4JT26ezpXEqwfhF1sphPRB8hx0WugcTmjcNd2mN4tjSmUF
	ur+4b69q9/VajeW2zaACDL332CSFP6leRlZwIGE0vSlNZWSEIEKm5F7uKBnbgBznrhxcy0EWW6m
	Fsx67CWMITwnfMw==
X-Google-Smtp-Source: AGHT+IGRrOJO2/s0qdC9+UYnzuhqfQU7WPJnHgdOGp2ljp2CYzPrhmFz5zMHaZtxGrbYYkmHkcz7Aw==
X-Received: by 2002:a05:600c:83c6:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-43f3a7db13dmr114462585e9.0.1744628946440;
        Mon, 14 Apr 2025 04:09:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 1/6] CI: Rename intermediate artefacts in qemu-* scripts
Date: Mon, 14 Apr 2025 12:08:58 +0100
Message-Id: <20250414110903.2355303-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, we have initrd.cpio.gz as domU, and initrd.tar.gz as the base for
dom0.

Rename initrd.cpio.gz to domU-rootfs.cpio.gz, and xen-rootfs.cpio.gz to
dom0-rootfs.cpio.gz to make it clearer which is which.  Rename the VM from
test to domU.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

v3:
 * New

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1765822634
---
 automation/scripts/qemu-alpine-x86_64.sh    | 16 ++++++++--------
 automation/scripts/qemu-smoke-dom0-arm64.sh | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 89bdb4df7dac..569bd766d31e 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -25,7 +25,7 @@ mount -t devtmpfs devtmpfs /dev
 chmod +x initrd/init
 # DomU rootfs
 cd initrd
-find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
+find . | cpio -H newc -o | gzip > ../domU-rootfs.cpio.gz
 cd ..
 
 # initrd.tar.gz is Dom0 rootfs
@@ -38,15 +38,15 @@ mkdir srv
 mkdir sys
 rm var/run
 cp -ar ../dist/install/* .
-mv ../initrd.cpio.gz ./root
+mv ../domU-rootfs.cpio.gz ./root
 cp ../bzImage ./root
-echo "name=\"test\"
+echo "name=\"domU\"
 memory=512
 vcpus=1
 kernel=\"/root/bzImage\"
-ramdisk=\"/root/initrd.cpio.gz\"
+ramdisk=\"/root/domU-rootfs.cpio.gz\"
 extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
-" > root/test.cfg
+" > root/domU.cfg
 echo "#!/bin/bash
 
 set -x
@@ -56,13 +56,13 @@ bash /etc/init.d/xencommons start
 
 xl list
 
-xl -vvv create -c /root/test.cfg
+xl -vvv create -c /root/domU.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
 # rebuild Dom0 rootfs
-find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip > ../dom0-rootfs.cpio.gz
 cd ../..
 
 cat >> binaries/pxelinux.0 << EOF
@@ -70,7 +70,7 @@ cat >> binaries/pxelinux.0 << EOF
 
 kernel xen console=com1 console_timestamps=boot
 module bzImage console=hvc0
-module xen-rootfs.cpio.gz
+module dom0-rootfs.cpio.gz
 boot
 EOF
 
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 51d037b0003e..e8e49ded245a 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -24,7 +24,7 @@ mount -t devtmpfs devtmpfs /dev
 /bin/sh" > initrd/init
 chmod +x initrd/init
 cd initrd
-find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
+find . | cpio -H newc -o | gzip > ../domU-rootfs.cpio.gz
 cd ..
 
 mkdir -p rootfs
@@ -36,15 +36,15 @@ mkdir srv
 mkdir sys
 rm var/run
 cp -ar ../dist/install/* .
-mv ../initrd.cpio.gz ./root
+mv ../domU-rootfs.cpio.gz ./root
 cp ../Image ./root
-echo "name=\"test\"
+echo "name=\"domU\"
 memory=512
 vcpus=1
 kernel=\"/root/Image\"
-ramdisk=\"/root/initrd.cpio.gz\"
+ramdisk=\"/root/domU-rootfs.cpio.gz\"
 extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
-" > root/test.cfg
+" > root/domU.cfg
 echo "#!/bin/bash
 
 export LD_LIBRARY_PATH=/usr/local/lib
@@ -52,12 +52,12 @@ bash /etc/init.d/xencommons start
 
 xl list
 
-xl -vvv create -c /root/test.cfg
+xl -vvv create -c /root/domU.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
-find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip > ../dom0-rootfs.cpio.gz
 cd ../..
 
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
@@ -78,7 +78,7 @@ MEMORY_END="0xC0000000"
 DEVICE_TREE="virt-gicv2.dtb"
 XEN="xen"
 DOM0_KERNEL="Image"
-DOM0_RAMDISK="xen-rootfs.cpio.gz"
+DOM0_RAMDISK="dom0-rootfs.cpio.gz"
 XEN_CMD="console=dtuart dom0_mem=1024M console_timestamps=boot"
 
 NUM_DOMUS=0
-- 
2.39.5


