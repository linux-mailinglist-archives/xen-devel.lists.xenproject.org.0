Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5035ACBA70
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 19:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003740.1383349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM9Ey-0004J1-MM; Mon, 02 Jun 2025 17:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003740.1383349; Mon, 02 Jun 2025 17:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM9Ey-00048k-Gz; Mon, 02 Jun 2025 17:46:28 +0000
Received: by outflank-mailman (input) for mailman id 1003740;
 Mon, 02 Jun 2025 17:46:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKOU=YR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uM9Ex-00044r-BD
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 17:46:27 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8146c814-3fd9-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 19:46:26 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so34929005e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 10:46:26 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f0097539sm15997416f8f.63.2025.06.02.10.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 10:46:24 -0700 (PDT)
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
X-Inumbo-ID: 8146c814-3fd9-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748886385; x=1749491185; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMfDv5scN89KVrBk/1eG8UFcMNbpeEOdoqqQG+/hRZc=;
        b=ZDeVrbiK7eIH0qjbHwl64nDpHSB3BuS/2lt7hGrk+kQbnkK/xqW1gSmlSNesJozxjW
         fIQx52b9ox1jx6HuHTUdI96fWGk7dhBzhs7keBFjJH5d4v0z8XxBPcdN5IbAM/j966cH
         FMRZUPlodjkqN7rp6r/75epngWnuxhiaIowBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748886385; x=1749491185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMfDv5scN89KVrBk/1eG8UFcMNbpeEOdoqqQG+/hRZc=;
        b=qQcKvgVz3766vovEuNzGWzPhFlg3yPRknZgpRCD550ABdAIlLDUcq3BVrKmcYomUuS
         bzsvGRA4GgCKaR9O1WZbHCOkuV06/r5zeJHEUtfVs//YmsYq5P/xYNsWSf6/Pid0ERe9
         fAbRKfeETOa4Wf3p3K6KtPEqDh5Vj9vLv2PQzOUNppQaLLwsZ6TlZkPAgWg/VVUCE30r
         BUL2FWCs4bpwM6MFkO5v27EyMowEDJbNuHUGQ6e8SQBYc3WT4NJLgzMfENg0RFEBZ9U/
         ABhFGNvCh4WWhumN26MD5Z+bdt3GVL8JU4YfFogmTIFHJoAHWVNBIiBhxJqjfrESfWYp
         55Jg==
X-Gm-Message-State: AOJu0Yw1OJqB7JOKmZ8h/3gQWOXtTTVlRQ/BbJ+zBnoHMTO7VzhSkbhb
	VD6Xbn62wj12GMLEKekXshwI4mQ/6AATaEuLQllNBv2DOEt0vUBkee7bdUq+VTQZqXx2Z+MKYX3
	8G5M8
X-Gm-Gg: ASbGncuEQYCG79ZlLKoogfM8rMzY7L854tdLThM+wPDsxKw4qI+kD85UBB0GIycDWyp
	pXxARmw/NvnZUXDEd9ZzXPSstRfsP3BB/c1Aeu1jan/ClOO4BhogbKRlmjnh8dXrm4zIw8CUO7K
	mB2nGjd33p3HjGsSDv89jLJo7/AP7FdqgdRv7X5Uho8VN9I2hZnI+1KSXQPw8xmsM3ejMbdUXQ7
	D7BRKcYwGETwbdqH6qHmEJRko6b01PMHHmYd7wADSBjeRju3ms5lO8/fcz62n8QOIWcgtjxvuvK
	9MHBQCvsiiRHzI489KjNTMgeH77EGwodyQeQe/+O8w/MZnzyXFwfla63Rt4/wOC3LiuOxllGQ3F
	4M6bgdZRu26VZUEO8LBLuyTKi
X-Google-Smtp-Source: AGHT+IE/EagnuGrr5IlNIkzGdMRgLDqUa6swkTOIix8pZfplcFgLE6SCE79B+HL3TiQXEkWFCYfrxg==
X-Received: by 2002:a05:600c:6a93:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-451df07f5e4mr24603605e9.30.1748886385116;
        Mon, 02 Jun 2025 10:46:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 2/2] CI: Adjust how domU is packaged in dom0
Date: Mon,  2 Jun 2025 18:46:18 +0100
Message-Id: <20250602174618.2641439-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602174618.2641439-1-andrew.cooper3@citrix.com>
References: <20250602174618.2641439-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Package domU for dom0 and insert into the uncompressed part of dom0's rootfs,
rather than recompressing it as part of the overlay.

For Qubes, this avoids putting the domU kernel in dom0's rootfs for tests
which aren't going to boot a guest.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

v2:
 * Rebase over dom0_rootfs_extra_{un,}comp changes
 * Move back into boot.  There seem to be objections to having it in root.
---
 automation/scripts/qubes-x86-64.sh             | 17 ++++++++++++-----
 automation/scripts/xilinx-smoke-dom0-x86_64.sh | 14 +++++++++++---
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 5ec6eff6c469..d9ecc569c956 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -156,7 +156,7 @@ esac
 domU_config="
 type = '${domU_type}'
 name = 'domU'
-kernel = '/boot/vmlinuz'
+kernel = '/boot/vmlinuz-domU'
 ramdisk = '/boot/initrd-domU'
 cmdline = 'root=/dev/ram0 console=hvc0'
 memory = 512
@@ -187,6 +187,17 @@ Kernel \r on an \m (\l)
     find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
     cd ..
     rm -rf rootfs
+
+    # Package domU kernel+rootfs in /boot for dom0 (uncompressed)
+    mkdir -p rootfs/boot
+    cd rootfs
+    cp ../binaries/bzImage boot/vmlinuz-domU
+    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
+    find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
+    cd ..
+    rm -rf rootfs
+
+    dom0_rootfs_extra_uncomp+=(binaries/domU-in-dom0.cpio)
 fi
 
 # Dom0 rootfs.  The order or concatination is important; ucode wants to come
@@ -241,10 +252,6 @@ mkdir -p etc/default
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
index 45121f39400a..8981aee5d4f2 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -22,7 +22,7 @@ DOMU_CMD=""
 DOMU_CFG='
 type = "pvh"
 name = "domU"
-kernel = "/boot/vmlinuz"
+kernel = "/boot/vmlinuz-domU"
 ramdisk = "/boot/initrd-domU"
 extra = "root=/dev/ram0 console=hvc0"
 memory = 512
@@ -106,10 +106,20 @@ find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
 cd ..
 rm -rf rootfs
 
+# Package domU kernel+rootfs in /boot for dom0 (uncompressed)
+mkdir -p rootfs/boot
+cd rootfs
+cp ../binaries/bzImage boot/vmlinuz-domU
+cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
+find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
+cd ..
+rm -rf rootfs
+
 # Dom0 rootfs.  The order or concatination is important; ucode wants to come
 # first, and all uncompressed must be ahead of compressed.
 dom0_rootfs_parts=(
     binaries/ucode.cpio
+    binaries/domU-in-dom0.cpio
     "${dom0_rootfs_extra_uncomp[@]}"
     binaries/rootfs.cpio.gz
     binaries/xen-tools.cpio.gz
@@ -131,8 +141,6 @@ echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
-cp ../binaries/bzImage boot/vmlinuz
-cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
-- 
2.39.5


