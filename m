Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF23FAC1235
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 19:37:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994481.1377475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI9qb-00042q-C4; Thu, 22 May 2025 17:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994481.1377475; Thu, 22 May 2025 17:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI9qb-000419-83; Thu, 22 May 2025 17:36:49 +0000
Received: by outflank-mailman (input) for mailman id 994481;
 Thu, 22 May 2025 17:36:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI9qZ-0003Za-Ic
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 17:36:47 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55b7818f-3733-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 19:36:47 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-acacb8743a7so23655266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 10:36:47 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d442069sm1116063366b.103.2025.05.22.10.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 10:36:45 -0700 (PDT)
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
X-Inumbo-ID: 55b7818f-3733-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747935406; x=1748540206; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYyhCSHRy5HjeJM5vXD7f7xwD1MyIqvj5Lom+JBxOYs=;
        b=hGGlNNGpf4xm0malAJyrycBtckdjd/f2vJSZi3jPs24FZ6/IZRyq9Gmu4/jFmhvLsu
         V7yUdk0YnMPb0ajFHr0RP+x4TkTU1bEGrAwbv6J90HfuRyBTE2qAfUvZ3ysYBHoxGIHC
         nr//62h1qj3ikfRHSiGVvQpczaZNU4hOhpB30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935406; x=1748540206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYyhCSHRy5HjeJM5vXD7f7xwD1MyIqvj5Lom+JBxOYs=;
        b=ufvoWUMB7dcEyPbLmFn924EgUyGOeGuxf2Gsw/W86Ah/VW7QltxhzDtc/yT1OqfyX+
         ZjnRDWZPANhTglDf7Egm2wgoDF4Dirj94rvj7yxnAPn1kXvMePVuakKDQBI4UxJBMdlY
         iFy5cCO0jfERtF5TimCXNpCmClentK/ZtvKaHvnyAmJmp4KqUvsrvBrJLnEpMgs19TlE
         CXldlKHTx3S/MRimiaemrm+BVaDgF+eHEeiMCSYp6fhb0pU/6EPT3OSI0kr6sPJuRD7p
         BzjYvh2p9W7y/F6NAVeRAzYti/2Ce3XgeCF/1BhynAs48rEUy9aDFVKpdTbKyNGwjICv
         euvw==
X-Gm-Message-State: AOJu0YxSr71VpNmnqnENeEZGX8eqtprYkReOoSeiMwH1VjWiUqD2GwRg
	hs2LDeOT6BYaNvYm5yPLrq9JpFLywtwwsHGKbMtbI3ztnpdzQ2x3DFDkDmLKoXF8RFskkFkiFEg
	wLO6x
X-Gm-Gg: ASbGncsKfm0djOTC9J4g5CPRW4ltEObZzg3jKDnp5H8oC+rQm4O5jVSdhHPBwtv9OPJ
	qfo8gpL3+aMyZLZPjVIFWsGVRP7qJUaoJwurc9GHcPVXADcuIyi0rInOdbW515sQyPlKmKfTDth
	reSkDWu5BKCBic5kjvp2OWjyXpXwfgIgEUQtuicibcaHIyHYoI+SIJJhRM870sqF6wgPYWB/lCg
	M9nfbW06+bAlpqFd7P0uRhprjLs2qoUzBiBWc89rMQlUQUPSB0ZEvyKBaSaOxjXNiOgj4/iZHG/
	NVAY0Eg8CnF30IBKT8/cDdY62vRsKLNV+mE87AkbCW0kG4a3QXPVjgLUVOKvUTlstk1CIOtIqUm
	qlgEaJQN57F0M0AG+AZi6AYKW
X-Google-Smtp-Source: AGHT+IHWMogHCQeB9SJwpxg6yOOzinf1lZpu5URRocfLqaqgAeyz6UskeDQJ/1eJJRMxZON6lgEIug==
X-Received: by 2002:a17:907:f497:b0:aca:95eb:12e with SMTP id a640c23a62f3a-ad64e921e3cmr26741466b.24.1747935406203;
        Thu, 22 May 2025 10:36:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 3/3] CI: Adjust how domU is packaged in dom0
Date: Thu, 22 May 2025 18:36:40 +0100
Message-Id: <20250522173640.575452-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522173640.575452-1-andrew.cooper3@citrix.com>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Package domU in /root for dom0 and insert into the uncompressed part of dom0's
rootfs, rather than recompressing it as part of the overlay.

For Qubes, this avoids putting the domU kernel in dom0's rootfs for tests
which aren't going to boot a guest.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh            | 20 +++++++++++++------
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 16 +++++++++++----
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 1dd3f48b3d29..17a37134f46a 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -154,8 +154,8 @@ esac
 domU_config="
 type = '${domU_type}'
 name = 'domU'
-kernel = '/boot/vmlinuz'
-ramdisk = '/boot/initrd-domU'
+kernel = '/root/vmlinuz-domU'
+ramdisk = '/root/initrd-domU'
 cmdline = 'root=/dev/ram0 console=hvc0'
 memory = 512
 vif = [ ${domU_vif} ]
@@ -185,12 +185,24 @@ Kernel \r on an \m (\l)
     find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
     cd ..
     rm -rf rootfs
+
+    # Package domU kernel+rootfs in /root for dom0 (uncompressed)
+    mkdir -p rootfs/root
+    cd rootfs
+    cp ../binaries/bzImage root/vmlinuz-domU
+    cp ../binaries/domU-rootfs.cpio.gz root/initrd-domU
+    find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
+    cd ..
+    rm -rf rootfs
 fi
 
 # Dom0 rootfs.  The order or concatination is important; ucode wants to come
 # first, and all uncompressed must be ahead of compressed.
 parts=(
     binaries/ucode.cpio
+)
+[ -n "$domU_check" ] && parts+=(binaries/domU-in-dom0.cpio)
+parts+=(
     binaries/rootfs.cpio.gz
     binaries/xen-tools.cpio.gz
 )
@@ -238,10 +250,6 @@ mkdir -p etc/default
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
-cp ../binaries/bzImage boot/vmlinuz
-if [ -n "$domU_check" ]; then
-    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
-fi
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 0fbabb41054a..29817ff81d0a 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -22,8 +22,8 @@ DOMU_CMD=""
 DOMU_CFG='
 type = "pvh"
 name = "domU"
-kernel = "/boot/vmlinuz"
-ramdisk = "/boot/initrd-domU"
+kernel = "/root/vmlinuz-domU"
+ramdisk = "/root/initrd-domU"
 extra = "root=/dev/ram0 console=hvc0"
 memory = 512
 '
@@ -103,10 +103,20 @@ find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
 cd ..
 rm -rf rootfs
 
+# Package domU kernel+rootfs in /root for dom0 (uncompressed)
+mkdir -p rootfs/root
+cd rootfs
+cp ../binaries/bzImage root/vmlinuz-domU
+cp ../binaries/domU-rootfs.cpio.gz root/initrd-domU
+find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
+cd ..
+rm -rf rootfs
+
 # Dom0 rootfs.  The order or concatination is important; ucode wants to come
 # first, and all uncompressed must be ahead of compressed.
 parts=(
     binaries/ucode.cpio
+    binaries/domU-in-dom0.cpio
     binaries/rootfs.cpio.gz
     binaries/xen-tools.cpio.gz
 )
@@ -127,8 +137,6 @@ echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
-cp ../binaries/bzImage boot/vmlinuz
-cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
-- 
2.39.5


