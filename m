Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D449E8FD9D1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 00:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735811.1141956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEz1p-0006t1-F6; Wed, 05 Jun 2024 22:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735811.1141956; Wed, 05 Jun 2024 22:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEz1p-0006rW-BJ; Wed, 05 Jun 2024 22:22:45 +0000
Received: by outflank-mailman (input) for mailman id 735811;
 Wed, 05 Jun 2024 16:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUZb=NH=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1sEtuq-0003Hu-CP
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 16:55:12 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5db0cae7-235c-11ef-b4bb-af5377834399;
 Wed, 05 Jun 2024 18:55:09 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42155143cb0so682755e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jun 2024 09:55:08 -0700 (PDT)
Received: from Xen-host.domain.local ([89.216.37.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158111052sm28995205e9.16.2024.06.05.09.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 09:55:07 -0700 (PDT)
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
X-Inumbo-ID: 5db0cae7-235c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717606508; x=1718211308; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0v+4euvI1VeN0E+AOVIoBR9XyQW2czoSpmZlVUU7I4=;
        b=V11AdJB9L6Fca3r/rkBDcDqgOyK9iGYMyJy2y2k1ACUYkICkF/ivh6q/LyUV+mg9iO
         u/BYqzIjWBMHeL040tuSekCi89YILIOZ281NwRY2z8MW3SDLg6kI4cNZ4X5wl4lOV3FZ
         nE99Qe+JWPuAQ3x6J0ibWy7xJh5Xiv8RWoxgGUZKCCYMOCEwsINivnwOx9ZjyCQHLVG8
         OxrE75B/ZX6YPQIvLSwrBeL7qz29vqR0SuBizhX8Q6xTFgR4htPtS0GurVL7L2iE/mTI
         hYe+ezOR54wj+AXaw5cyeqBKNq2X948InkHhhlKIvT8v9EPvdnHGohYp1FkKTRJVtRIP
         QniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717606508; x=1718211308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0v+4euvI1VeN0E+AOVIoBR9XyQW2czoSpmZlVUU7I4=;
        b=liyckusy2vnbryl1sG6WQRVfN8fZhDkpfdtTKEtzzJlQo4FbTWdnLKwr+nrDS2+BJz
         2IHEiN11x44c3RQt56xjSwNljYMSk+5l7I0w1svn1SNIVXhVXrL9U3Oy9tnBwejfWRTE
         5NnJCmkptsYyQVJm6vGPynMqiqCDQfAo6oqcM/otBh7h2vKu+WAJkij8G+uoomKbFL1Z
         FVmEODtQMKOFqrjP8rHeIjqhN/AtmfwOHCsGv5tVY1k5mU6pRB55Hv5hIIVDsin928x/
         unpVh7CfbjWiO2NQyLREovGziYf275ngAnbrmjotOrb0FK5rtaJHrbO9Ey4H9jBn3hWI
         HRqQ==
X-Gm-Message-State: AOJu0YwvibZDE9PKmbUzloNFLsRAgx07PUvmogaU9vhaTsxeO6UZjbvA
	1ylChcPtsrSwfSwY0MkZ4JHiL+Nont1wpk2owlxLVxVQoJtgY+dLkIDSlxG7JQI=
X-Google-Smtp-Source: AGHT+IEf3/VgppoF9v6tYs0yYUiDzHeJp+jWAmWYjTK/bjPSTQaVQtitSyOk5A5iQ4LVUAKwULUmhg==
X-Received: by 2002:a05:600c:4f8e:b0:421:59b0:f364 with SMTP id 5b1f17b1804b1-42159b0f616mr13874815e9.40.1717606507830;
        Wed, 05 Jun 2024 09:55:07 -0700 (PDT)
From: milandjokic1995@gmail.com
To: xen-devel@lists.xenproject.org
Cc: milan.djokic@rt-rk.com,
	Nikola Jelic <nikola.jelic@rt-rk.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/riscv: PE/COFF image header for RISC-V target
Date: Wed,  5 Jun 2024 18:54:43 +0200
Message-Id: <87b5e458498bbff2e54ac011a50ff1f9555c3613.1717354932.git.milan.djokic@rt-rk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nikola Jelic <nikola.jelic@rt-rk.com>

Extended RISC-V xen image with PE/COFF headers,
in order to support xen boot from popular bootloaders like U-boot.
Image header is optionally included (with CONFIG_RISCV_EFI) so
both plain ELF and image with PE/COFF header can now be generated as build artifacts.

Tested on both QEMU and StarFive VisionFive 2 with OpenSBI->U-Boot->xen->dom0 boot chain.

Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>
---
 xen/arch/riscv/Kconfig             |  9 +++++
 xen/arch/riscv/include/asm/image.h | 62 ++++++++++++++++++++++++++++++
 xen/arch/riscv/riscv64/head.S      | 33 +++++++++++++++-
 3 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/image.h

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index f382b36f6c..59bf5aa2a6 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -9,6 +9,15 @@ config ARCH_DEFCONFIG
 	string
 	default "arch/riscv/configs/tiny64_defconfig"
 
+config RISCV_EFI
+	bool "UEFI boot service support"
+	depends on RISCV_64
+	default n
+	help
+	  This option provides support for boot services through
+	  UEFI firmware. A UEFI stub is provided to allow Xen to
+	  be booted as an EFI application.
+
 menu "Architecture Features"
 
 source "arch/Kconfig"
diff --git a/xen/arch/riscv/include/asm/image.h b/xen/arch/riscv/include/asm/image.h
new file mode 100644
index 0000000000..b379246290
--- /dev/null
+++ b/xen/arch/riscv/include/asm/image.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+
+#ifndef _ASM_RISCV_IMAGE_H
+#define _ASM_RISCV_IMAGE_H
+
+#define RISCV_IMAGE_MAGIC	"RISCV\0\0\0"
+#define RISCV_IMAGE_MAGIC2	"RSC\x05"
+
+#define RISCV_IMAGE_FLAG_BE_SHIFT	0
+#define RISCV_IMAGE_FLAG_BE_MASK	0x1
+
+#define RISCV_IMAGE_FLAG_LE		0
+#define RISCV_IMAGE_FLAG_BE		1
+
+#ifdef CONFIG_CPU_BIG_ENDIAN
+#error conversion of header fields to LE not yet implemented
+#else
+#define __HEAD_FLAG_BE		RISCV_IMAGE_FLAG_LE
+#endif
+
+#define __HEAD_FLAG(field)	(__HEAD_FLAG_##field << \
+				RISCV_IMAGE_FLAG_##field##_SHIFT)
+
+#define __HEAD_FLAGS		(__HEAD_FLAG(BE))
+
+#define RISCV_HEADER_VERSION_MAJOR 0
+#define RISCV_HEADER_VERSION_MINOR 2
+
+#define RISCV_HEADER_VERSION (RISCV_HEADER_VERSION_MAJOR << 16 | \
+			      RISCV_HEADER_VERSION_MINOR)
+
+#ifndef __ASSEMBLY__
+/*
+ * struct riscv_image_header - riscv xen image header
+ *
+ * @code0:		Executable code
+ * @code1:		Executable code
+ * @text_offset:	Image load offset
+ * @image_size:		Effective Image size
+ * @reserved:		reserved
+ * @reserved:		reserved
+ * @reserved:		reserved
+ * @magic:		Magic number
+ * @reserved:		reserved
+ * @reserved:		reserved (will be used for PE COFF offset)
+ */
+
+struct riscv_image_header {
+	u32 code0;
+	u32 code1;
+	u64 text_offset;
+	u64 image_size;
+	u64 res1;
+	u64 res2;
+	u64 res3;
+	u64 magic;
+	u32 res4;
+	u32 res5;
+};
+#endif /* __ASSEMBLY__ */
+#endif /* __ASM_IMAGE_H */
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 3261e9fce8..0edd35b20f 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,14 +1,40 @@
 #include <asm/asm.h>
 #include <asm/riscv_encoding.h>
+#include <asm/image.h>
 
         .section .text.header, "ax", %progbits
 
         /*
          * OpenSBI pass to start():
          *   a0 -> hart_id ( bootcpu_id )
-         *   a1 -> dtb_base 
+         *   a1 -> dtb_base
          */
 FUNC(start)
+#ifdef CONFIG_RISCV_EFI
+        j xen_start
+
+        /* -----------  Header -------------- */
+	.word 0
+	.balign 8
+#if __riscv_xlen == 64
+	/* Image load offset(2MB) from start of RAM */
+	.dword 0x200000
+#else
+	/* Image load offset(4MB) from start of RAM */
+	.dword 0x400000
+#endif
+	/* Effective size of xen image */
+	.dword _end - _start
+	.dword __HEAD_FLAGS
+	.word RISCV_HEADER_VERSION
+	.word 0
+	.dword 0
+	.ascii RISCV_IMAGE_MAGIC
+	.balign 4
+	.ascii RISCV_IMAGE_MAGIC2
+
+FUNC(xen_start)
+#endif
         /* Mask all interrupts */
         csrw    CSR_SIE, zero
 
@@ -60,6 +86,11 @@ FUNC(start)
         mv      a1, s1
 
         tail    start_xen
+
+#ifdef CONFIG_RISCV_EFI
+END(xen_start)
+#endif
+
 END(start)
 
         .section .text, "ax", %progbits
-- 
2.25.1


