Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BX/LQr+jWm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E8912F4F3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229476.1535455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRS-0006wD-Um; Thu, 12 Feb 2026 16:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229476.1535455; Thu, 12 Feb 2026 16:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRS-0006pv-NZ; Thu, 12 Feb 2026 16:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1229476;
 Thu, 12 Feb 2026 16:21:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqZRQ-0005jV-PO
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:21:20 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd4090f0-082e-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 17:21:20 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-483337aa225so23765e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 08:21:20 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e5c635sm13938426f8f.37.2026.02.12.08.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 08:21:18 -0800 (PST)
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
X-Inumbo-ID: dd4090f0-082e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770913279; x=1771518079; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZVTmyjQ+cfxWV4H5phu2iSv8MlikEWciPmm+cING7w=;
        b=mGB4J1ukpJXKn/SE8tfC/OH2RlYPGzz3CgXzDysajvgU7PFByVsBppUYMmvbydeHRE
         QUtU0tRlSLqo3r8mdmeA+o2qmfHChj06KZLy5mgP8cFTEs8J77PiWb8H5iipFC/5HyG6
         OfZp4nGbd6nRRaWTH9wie7cBaBhzIrXrhjEIbaEftHmWZYIBo+wJSLOaOC8gnNXZsbQU
         5afFTUqyGPSgGYJ0Oj5FxP0ky9v3xbEiadf4ygbi64fBoSaUOhZ3V16P9JwMo872wy9P
         IUKLM6sO59JuQ73BUYVMIucP0bXgYnGUSQZHqvboYWoPLOOSIaGfiebUnaYh21AzfYL7
         CFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770913279; x=1771518079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uZVTmyjQ+cfxWV4H5phu2iSv8MlikEWciPmm+cING7w=;
        b=jawL4XaYggIpdgV4D6NGdVQU4H+lcjkbXA7zrfQUNfp5tpyAZnM2VFrExc3e3QeQx1
         UJto1/42m6odPQo+2L8NGfopL3QgvBRCYLlC0ijiwGj7QFza/OmNHmgX/1fr5wVm8gVU
         IfKFgg3AD9MxpZIypsrB+pC5HK2Wy7Z+4qYM3D1y+ZixaEgoh+D4bBKFC/f3/zC/pMQ8
         VwF1VW60oX1W3kQrdezu69F+Xr71tfOkRzZZc/7wt8Lyuz+2KTVcjTgWVk7jEI4jvJy1
         g//lwuMEQVKVjPAxosJVBpZee7Bk3CbNwv+RcCJeDTPL3UsDsWtJvCipNwEA3sav1/X9
         7ciA==
X-Gm-Message-State: AOJu0YwsrVtfL+OTIzeXfoJjayExBR8pvLF3SWL1ZUhP4CEOwN6IVX5Q
	iSCSkrxxtKzlzFkxhxvTIMjRdKvb+CUqkbWqa9VNoVuOFLqS0KUsvWZqDRlNpQar
X-Gm-Gg: AZuq6aILfi1pU5GfgQPqhYe7ivUxDdKMewDnW3rT4PzKBbjbcPtmCZyDvAFbpPZ2UxJ
	d6tQAlxfmWbiLsHh7YQyVEZyAZyNlulLm2lThOHUqhCxq91Qx5kbGBwOkDbRgQnuZqSuEXLh9Y6
	cpwDw5f4Zmfg0+Muxn1Dizwv5N7pHG0wguvvJcpSyPBWuT/0awzuS0ZfJy+z25rUIpuAOwg9jiP
	aA7kCQAisI9WY/i4bb2FzUJCMscGDN19K+tGK1kBuIoTbQdkZrsH3n/INdoE1feFjHKFAcCiCGS
	D4mPquzmSd6P2D5dQarOyEB2xqideO69elpXAPIgOahDMcyhgKvWp7j6u7EErbk9P2Ss3op5HIt
	892zxT6iil8BnwnKGdOl0JXkPAW5loKdwKBhVB3BCJN99c5yfBasVjjKGxfKiiHLD542mDO6U4N
	qa3ESSk7FTzp2sc9hCIys/eanR0mOYnnk0fAjVWPuMKUW/WvGH1In0t0EebFH7oGNwVA==
X-Received: by 2002:a05:600c:83c8:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-4836570ec0cmr40317005e9.19.1770913278999;
        Thu, 12 Feb 2026 08:21:18 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 3/6] xen/riscv: add zImage kernel loading support
Date: Thu, 12 Feb 2026 17:21:04 +0100
Message-ID: <308c5bc1de15b23c643d48f975799739f44dde8d.1770821989.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770821989.git.oleksii.kurochko@gmail.com>
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 42E8912F4F3
X-Rspamd-Action: no action

Introduce support for loading a Linux zImage kernel on RISC-V.

Note that if panic() is used instead of returning an error as common code
doesn't expect to have return code and it is something that should be
done separately.

This prepares the RISC-V port for booting Linux guests using the common
domain build infrastructure.

The code is based on Xen Arm code.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile             |   1 +
 xen/arch/riscv/include/asm/config.h |  13 +++
 xen/arch/riscv/kernel.c             | 156 ++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 xen/arch/riscv/kernel.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 90210799e038..2e15f894fdd4 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -7,6 +7,7 @@ obj-y += guestcopy.o
 obj-y += imsic.o
 obj-y += intc.o
 obj-y += irq.o
+obj-y += kernel.o
 obj-y += mm.o
 obj-y += p2m.o
 obj-y += paging.o
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 86a95df018b5..d24b54d656b8 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -152,6 +152,19 @@
 extern unsigned long phys_offset; /* = load_start - XEN_VIRT_START */
 #endif
 
+/*
+ * KERNEL_LOAD_ADDR_ALIGNMENT is defined based on paragraph of
+ * "Kernel location" of boot.rst:
+ * https://docs.kernel.org/arch/riscv/boot.html#kernel-location
+ */
+#if defined(CONFIG_RISCV_32)
+#define KERNEL_LOAD_ADDR_ALIGNMENT MB(4)
+#elif defined(CONFIG_RISCV_64)
+#define KERNEL_LOAD_ADDR_ALIGNMENT MB(2)
+#else
+#error "Define KERNEL_LOAD_ADDR_ALIGNMENT"
+#endif
+
 #endif /* ASM__RISCV__CONFIG_H */
 /*
  * Local variables:
diff --git a/xen/arch/riscv/kernel.c b/xen/arch/riscv/kernel.c
new file mode 100644
index 000000000000..f91e9ada8a9c
--- /dev/null
+++ b/xen/arch/riscv/kernel.c
@@ -0,0 +1,156 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/bug.h>
+#include <xen/compiler.h>
+#include <xen/errno.h>
+#include <xen/fdt-kernel.h>
+#include <xen/guest_access.h>
+#include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/mm.h>
+#include <xen/types.h>
+#include <xen/vmap.h>
+
+#include <asm/setup.h>
+
+#define ZIMAGE64_MAGIC_V2 0x05435352 /* Magic number 2, le, "RSC\x05" */
+
+static void __init place_modules(struct kernel_info *info, paddr_t kernbase,
+                                 paddr_t kernend)
+{
+    const struct boot_module *mod = info->bd.initrd;
+
+    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
+    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
+    const paddr_t modsize = initrd_len + dtb_len;
+
+    const paddr_t ramsize = info->mem.bank[0].size;
+    const paddr_t kernsize = ROUNDUP(kernend, MB(2)) - kernbase;
+
+    if ( modsize + kernsize > ramsize )
+        panic("Not enough memory in the first bank for the kernel+dtb+initrd\n");
+
+    info->dtb_paddr = ROUNDUP(kernend, MB(2));
+
+    info->initrd_paddr = info->dtb_paddr + dtb_len;
+}
+
+static paddr_t __init kernel_zimage_place(struct kernel_info *info)
+{
+    paddr_t load_addr;
+
+    /*
+     * At the moment, RISC-V's Linux kernel should be always position
+     * independent based on "Per-MMU execution" of boot.rst:
+     *   https://docs.kernel.org/arch/riscv/boot.html#pre-mmu-execution
+     *
+     * But just for the case when RISC-V's Linux kernel isn't position
+     * indepenet it is needed to take load address from
+     * info->zimage.start.
+     *
+     * If `start` is zero, the zImage is position independent. */
+    if ( likely(!info->zimage.start) )
+        /*
+         * According to boot.rst kernel load address should be properly
+         * aligned:
+         *   https://docs.kernel.org/arch/riscv/boot.html#kernel-location
+         */
+        load_addr = ROUNDUP(info->mem.bank[0].start, KERNEL_LOAD_ADDR_ALIGNMENT);
+    else
+        load_addr = info->zimage.start;
+
+    return load_addr;
+}
+
+static void __init kernel_zimage_load(struct kernel_info *info)
+{
+    int rc;
+    paddr_t load_addr = kernel_zimage_place(info);
+    paddr_t paddr = info->zimage.kernel_addr;
+    paddr_t len = info->zimage.len;
+    void *kernel;
+
+    info->entry = load_addr;
+
+    place_modules(info, load_addr, load_addr + len);
+
+    printk("Loading zImage from %"PRIpaddr" to %"PRIpaddr"-%"PRIpaddr"\n",
+            paddr, load_addr, load_addr + len);
+
+    kernel = ioremap_wc(paddr, len);
+
+    if ( !kernel )
+        panic("Unable to map kernel\n");
+
+    /* Move kernel to proper location in guest phys map */
+    rc = copy_to_guest_phys(info->bd.d, load_addr, kernel, len);
+
+    if ( rc )
+        panic("Unable to copy kernel to proper guest location\n");
+
+    iounmap(kernel);
+}
+
+/* Check if the image is a 64-bit Image */
+static int __init kernel_zimage64_probe(struct kernel_info *info,
+                                        paddr_t addr, paddr_t size)
+{
+    /* riscv/boot-image-header.rst */
+    struct {
+        u32 code0;		  /* Executable code */
+        u32 code1;		  /* Executable code */
+        u64 text_offset;  /* Image load offset, little endian */
+        u64 image_size;	  /* Effective Image size, little endian */
+        u64 flags;		  /* kernel flags, little endian */
+        u32 version;	  /* Version of this header */
+        u32 res1;		  /* Reserved */
+        u64 res2;		  /* Reserved */
+        u64 magic;        /* Deprecated: Magic number, little endian, "RISCV" */
+        u32 magic2;       /* Magic number 2, little endian, "RSC\x05" */
+        u32 res3;		  /* Reserved for PE COFF offset */
+    } zimage;
+    uint64_t start, end;
+
+    if ( size < sizeof(zimage) )
+        return -EINVAL;
+
+    copy_from_paddr(&zimage, addr, sizeof(zimage));
+
+    /* Magic v1 is deprecated and may be removed.  Only use v2 */
+    if ( zimage.magic2 != ZIMAGE64_MAGIC_V2 )
+        return -EINVAL;
+
+    /* Currently there is no length in the header, so just use the size */
+    start = 0;
+    end = size;
+
+    /*
+     * Given the above this check is a bit pointless, but leave it
+     * here in case someone adds a length field in the future.
+     */
+    if ( (end - start) > size )
+        return -EINVAL;
+
+    info->zimage.kernel_addr = addr;
+    info->zimage.len = end - start;
+    info->zimage.text_offset = zimage.text_offset;
+    info->zimage.start = 0;
+
+    info->load = kernel_zimage_load;
+
+    return 0;
+}
+
+int __init kernel_zimage_probe(struct kernel_info *info, paddr_t addr,
+                               paddr_t size)
+{
+    int rc;
+
+#ifdef CONFIG_RISCV_64
+    rc = kernel_zimage64_probe(info, addr, size);
+    if (rc < 0)
+#endif
+        panic("only RISC-V 64 is supported\n");
+
+    return rc;
+}
-- 
2.52.0


