Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34F3B50434
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 19:16:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117242.1463432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw1wM-0001CE-TN; Tue, 09 Sep 2025 17:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117242.1463432; Tue, 09 Sep 2025 17:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw1wM-0001A8-Ph; Tue, 09 Sep 2025 17:15:34 +0000
Received: by outflank-mailman (input) for mailman id 1117242;
 Tue, 09 Sep 2025 17:15:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0KN=3U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uw1wL-0001A0-Ju
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 17:15:33 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96231f7c-8da0-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 19:15:30 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45dde353b47so16100625e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 10:15:30 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df27dd30asm25105085e9.15.2025.09.09.10.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 10:15:28 -0700 (PDT)
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
X-Inumbo-ID: 96231f7c-8da0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757438129; x=1758042929; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMM8h6Ao3FP5NHBqqYwxtCT3JS8hxYwxHVVU8dEoPUs=;
        b=OC1U/FpLQM100WdfbNaZiT4nk0dSlYgIRqA8Xgy63wvME3FIJ2r9wbza+u0WQgUYWz
         N5uJUDV49N/mrKm597c0x56JLSn9iEggK6iQ0MW+i/OeZlyc3Rg8dGb2l/i+BuyZtcF4
         fO/Hdk4McePrxNnDiuIOLFbb2heqpL/o92gTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438129; x=1758042929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMM8h6Ao3FP5NHBqqYwxtCT3JS8hxYwxHVVU8dEoPUs=;
        b=LvINBJxFkPZGYGilj1QVPwQvK0Clf/8HH52bSE8MiiCo8DRH4kQ4GqBrmwKvQL9Won
         5qIwRCYiTfUtiTcqdBZ+4ZDQRu9FzjoAeHvNxzqmN5UZci5ul/7U9sfR7PFcTL+M5MSd
         DOctVdpWQsjvqUH60deKAnFg1VyhFf38vnq7o3jW8vm1kDddU8LFwiKQ9++DcMlaXEMJ
         yUj7NEOMhM5VbRzfQ+luxTtl06naZ6Szi0RXPLNPxShBpUsMT+1sK1CbNZske+CKyBQU
         H6/K3MGdTahxKxhK6oVRhbFjF/OPPww65VoiGlYohNJYkllHARw/3NYRRDwI7W6ANmOB
         XN5Q==
X-Gm-Message-State: AOJu0Yw0tSt8a8i2BCWNt3jb5JtLpxuX7lV0P6XTx0Lt4z2IUhFVLmN2
	tvQWLJ4hVWrJApnViV6vpsOrBeUgaBohBWOBemGi8jiWbSOf0gGhSthc6VOnpqifLekGrYnpp+s
	/yt8X
X-Gm-Gg: ASbGnct3SrrUiiTV99Y1UomSYorh1/ovmLbR2RZAbfUgdRzdMgMm4Gc9pXpSs4XvTcW
	adcfyeXfbGscm6iNDWRr4BeGFkEFtwaD8+mQ540RyJGnAKr42GBhcF687RXtPuQBNTTY+rLyAjg
	UMhYFh8NDMa58reCjl1xRMKU+KPF6AaJ5vvK6N2jIxBJ7a8yj3abgEXmQvkAybSBS7v3cufJnzW
	rtj57oy7IhKRBwNJaNaEPyIqAAsTGydCHaFYusKGwZnw5FakThJNZoX2IC9+Pn2jbshyyjg1caP
	NohvRHozd0m79vigXgaHwNC641AIegM1AIPyTSYqMATeKYW7tvVBksrevreUjr+Zx+Psp/FnsC1
	CxSO3s6TOa3JE22yUArc00e4NdCw9bXe9xs/kzuexULPWLcZebsBXjmdnXqt0JDFzqg1G+rgtqx
	YXwVeDkcmGVpE=
X-Google-Smtp-Source: AGHT+IHCNTNsawXqVURtf2iXsb70FlqvMqR0LjXDmkoXhgJh1PjxelHLSDBsgP1f1M3BW94Dgr6r4w==
X-Received: by 2002:a05:600c:4688:b0:45d:d2d2:f095 with SMTP id 5b1f17b1804b1-45deb702e1dmr50687885e9.19.1757438129386;
        Tue, 09 Sep 2025 10:15:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] CI: Create initrd fragments explicitly as root
Date: Tue,  9 Sep 2025 18:15:27 +0100
Message-Id: <20250909171527.1813097-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have a mix of root and non-root containers, and are trying to become
rootless.  This can cause the local CPIO fragements to end up being user:user
in the test environment.

Nothing seems to go wrong so far, but it's a trap waiting to happen.

Make everything consistently root for the initrds, irrespective of the
rootness of the container the test is running in.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Best reviewed with `git show --colour-words`

I'm intending to backport this all trees as part of the fixes for the root vs
rootless mismatch.
---
 automation/scripts/build                          | 2 +-
 automation/scripts/qemu-alpine-x86_64.sh          | 4 ++--
 automation/scripts/qemu-smoke-dom0-arm32.sh       | 4 ++--
 automation/scripts/qemu-smoke-dom0-arm64.sh       | 4 ++--
 automation/scripts/qemu-smoke-dom0less-arm32.sh   | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm64.sh   | 4 ++--
 automation/scripts/qubes-x86-64.sh                | 6 +++---
 automation/scripts/xilinx-smoke-dom0-x86_64.sh    | 6 +++---
 automation/scripts/xilinx-smoke-dom0less-arm64.sh | 4 ++--
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index 0e7494ff6d87..d0511843e7ea 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -108,6 +108,6 @@ else
     # Note: Some smoke tests depending on finding binaries/xen on a full build
     # even though dist/ contains everything, while some containers don't even
     # build Xen
-    (cd dist/install; find | cpio -o -H newc | gzip) > binaries/xen-tools.cpio.gz
+    (cd dist/install; find | cpio -R 0:0 -o -H newc | gzip) > binaries/xen-tools.cpio.gz
     collect_xen_artefacts
 fi
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index c4666b9507dc..242ffca693fe 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -25,7 +25,7 @@ mount -t devtmpfs devtmpfs /dev
 chmod +x initrd/init
 # DomU rootfs
 cd initrd
-find . | cpio -H newc -o | gzip > ../domU-rootfs.cpio.gz
+find . | cpio -R 0:0 -H newc -o | gzip > ../domU-rootfs.cpio.gz
 cd ..
 
 # Dom0 rootfs
@@ -57,7 +57,7 @@ xl -vvv create -c /root/domU.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-find . | cpio -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
+find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
 cd ../..
 
 cat >> binaries/pxelinux.0 << EOF
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 36c47daa4212..58797f7d30d3 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -30,13 +30,13 @@ curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-c
 mkdir rootfs
 cd rootfs
 tar xvzf ../initrd.tar.gz
-find . | cpio -H newc -o | gzip > ../root/initrd.cpio.gz
+find . | cpio -R 0:0 -H newc -o | gzip > ../root/initrd.cpio.gz
 cd ..
 rm -rf rootfs
 rm initrd.tar.gz
 
 cp ../zImage ./root
-find . | cpio -H newc -o | gzip > ../initrd.gz
+find . | cpio -R 0:0 -H newc -o | gzip > ../initrd.gz
 cd ..
 
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index ee682015a061..05962bdc0203 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -24,7 +24,7 @@ mount -t devtmpfs devtmpfs /dev
 /bin/sh" > initrd/init
 chmod +x initrd/init
 cd initrd
-find . | cpio -H newc -o | gzip > ../domU-rootfs.cpio.gz
+find . | cpio -R 0:0 -H newc -o | gzip > ../domU-rootfs.cpio.gz
 cd ..
 
 # Dom0 rootfs
@@ -54,7 +54,7 @@ xl -vvv create -c /root/domU.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-find . | cpio -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
+find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
 cd ../..
 
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index e27636dc9e8f..627d890a3926 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -75,7 +75,7 @@ mount -t devtmpfs devtmpfs /dev
 ${domU_check}
 /bin/sh" > init
 chmod +x init
-find . | cpio -H newc -o | gzip > ../initrd.gz
+find . | cpio -R 0:0 -H newc -o | gzip > ../initrd.gz
 cd ..
 
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index e660485f3a41..05c4a6acbb59 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -111,7 +111,7 @@ ${domU_check}
 /bin/sh" > initrd/init
 chmod +x initrd/init
 cd initrd
-find . | cpio --create --format='newc' | gzip > ../binaries/initrd
+find . | cpio -R 0:0 -o -H newc | gzip > ../binaries/initrd
 cd ..
 
 # Dom0 rootfs
@@ -139,7 +139,7 @@ xl network-attach 1 type=vif
 ${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -R 0:0 -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 # ImageBuilder
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index bd939dc94894..7a59fa5f1116 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -184,7 +184,7 @@ ${domU_check}
 Kernel \r on an \m (\l)
 
 " > etc/issue
-    find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
+    find . | cpio -R 0:0 -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
     cd ..
     rm -rf rootfs
 
@@ -193,7 +193,7 @@ Kernel \r on an \m (\l)
     cd rootfs
     cp ../binaries/bzImage boot/vmlinuz-domU
     cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
-    find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
+    find . | cpio -R 0:0 -H newc -o > ../binaries/domU-in-dom0.cpio
     cd ..
     rm -rf rootfs
 
@@ -252,7 +252,7 @@ mkdir -p etc/default
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
-find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -R 0:0 -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 96f534f3aaa7..5379738019a7 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -102,7 +102,7 @@ echo "domU Welcome to Alpine Linux
 Kernel \r on an \m (\l)
 
 " > etc/issue
-find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
+find . | cpio -R 0:0 -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
 cd ..
 rm -rf rootfs
 
@@ -111,7 +111,7 @@ mkdir -p rootfs/boot
 cd rootfs
 cp ../binaries/bzImage boot/vmlinuz-domU
 cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
-find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
+find . | cpio -R 0:0 -H newc -o > ../binaries/domU-in-dom0.cpio
 cd ..
 rm -rf rootfs
 
@@ -141,7 +141,7 @@ echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
-find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -R 0:0 -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 # Load software into TFTP server directory.
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index a6da7a830c35..61d6c686f745 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -50,7 +50,7 @@ echo "#!/bin/sh
 ${domU_check}
 /bin/sh" > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
+find . | cpio -R 0:0 -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
 cd ..
 rm -rf rootfs
 
@@ -71,7 +71,7 @@ bash /etc/init.d/xencommons start
 ${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -R 0:0 -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 

base-commit: 2275bf83a1db579661b27fc4b310a7d92594dbc0
-- 
2.39.5


