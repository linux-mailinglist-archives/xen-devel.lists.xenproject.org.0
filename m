Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAyUJmvF8GktYgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA034870BA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296337.1572808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVh-0006uv-IB; Tue, 28 Apr 2026 14:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296337.1572808; Tue, 28 Apr 2026 14:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVh-0006sd-9G; Tue, 28 Apr 2026 14:34:01 +0000
Received: by outflank-mailman (input) for mailman id 1296337;
 Tue, 28 Apr 2026 14:33:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHjVf-0006cZ-Bm
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:33:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjVe-000RTW-Nk
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:33:58 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c548-2eae-0a2a0a5409dd-0a2a4501d626-48
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:58 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c556-c1f2-0a2a45010019-d155802ee026-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:58 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so196655385e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:33:58 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774b6300sm19302145e9.16.2026.04.28.07.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 07:33:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777386838; x=1777991638; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJSZfDZmsT3CIOe+qmGhvl/hB/yKGv3ZJ6HZqE/FbGU=;
        b=FPRkagivTRTkvPrr9DgTrmPJ6A5qzrmzZNs2fIZsLQ8ZPmxEPetYngzYCW0q2XyJ7z
         NUJ50SXTThw/w2DeUDz4rgRhLghew6Pl8X1DjZ2ejH6sJZG9l4h67h+amrKi1nzIUDlm
         cwHzpWA4Qq+DPQTe6Lxm9Uk1jLF1M5lvkcAUs77bfbOrCgWMaZEoG5XA5vH3ByfRjtZf
         d6fChtIOnjeISsNRZLrXz8uE/cK4hxv55dqA+4qYe5se10PD9Q2f8XtvU4nAAPTYq9dY
         ZyvPoPoSJABf7Mnh8VqYs2W9WZmjKlfIEMYBsKQt/Juu/RNHzLBLgnuG4OGTbYS0lYCy
         rQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386838; x=1777991638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bJSZfDZmsT3CIOe+qmGhvl/hB/yKGv3ZJ6HZqE/FbGU=;
        b=PReBikdlPq6Yei4Ymis4ZBQ31q1qRImHjRDjc3+vk2lYEurIluSS+mnfcbAdhpXQa2
         +jSyMTEVqANq9RkCImBLpYDq3BiRBInUbEFOudZBIIrGoEPowxp4HJy4VkwvrLPhaP6+
         OdIgzAQqWd/7WNqycIH4JaQPb+iEtes9+89rSehTSkPSF2L6UMsTZcCR2s3jPKdh/5lz
         E69eyp9F6EpVAZ8Lw5KhpVFPmu6GhfNdhqFowNGC0ARP8QQ8waiwazWaE5KNKYHSUAsb
         7AcrnMZMEmj4BogITD3uwOftxUMkcfGip58B3GOeedRvKAkLTXqZlvT02WeC37x9gkzg
         +m2Q==
X-Gm-Message-State: AOJu0YyiMmXrqVt4dGs2niYM3I29CDM+lCTX82WHn1cRdxRG9Zjucwpe
	fjVJiuhJiz2AWKiW/xJcL7tEu1eYX6Z+ZAogQLmkgckWukbQDVo5aR41AcaiNg==
X-Gm-Gg: AeBDieu3g/A6h1TG0H5/O5M/jDbJJgZ8aGFkcUqts8582EC6Ei5i3r/dUtz5wirWQAu
	GGxwPsfBcref1u97vsjInCf9jFqbWS2OylQ96zMvyFzjcNGzaLxkZE6xon63bPfuN9fsqhQ+P3s
	efiwrwWNllp0z/0+nwYxxQCELTwodCzM59GBQYZmg/Ah6Bugg5Dbi409ldX5EKJmcannK01YAEI
	gl8qJtNWF0dUBiD8QQpIqdA7xiXoSzF6evCrWebtkW8zkSAbPlBob8noE6TqTPXh37We5ISoqGr
	CNbPEkI6YPXLfq7FfLPuQMDAnQp0DK2w7W1C4yFxBW+mnzFW6nARX63iLsgDgU7pEzvfbfsFe2a
	Vd/z/VD1R2QL6t/oVoF/C4QK+l7SzsxL5nqO20jw1RI34XcuierutEoFmXrFAehyCQ8QBDmLUa7
	sq8gdEnZOcnfQccCqByZQfYPqk7IhVOil7Gtc2UUqCwa04D0iTr5IsNY8TCwtt/YPav58V4zE54
	lEG
X-Received: by 2002:a05:600c:4f92:b0:489:19e9:b139 with SMTP id 5b1f17b1804b1-48a77ae54f4mr52698725e9.1.1777386837671;
        Tue, 28 Apr 2026 07:33:57 -0700 (PDT)
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
Subject: [PATCH v4 07/11] xen/riscv: add Linux kernel loading support
Date: Tue, 28 Apr 2026 16:33:36 +0200
Message-ID: <af89f0b696c5a1ae477dc0903a9a99b84df26f7a.1777303844.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777303844.git.oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1777386838-B727DFF4-D3108EBD/10/73395122804
X-purgate-type: spam
X-purgate-size: 11996
X-Rspamd-Queue-Id: 1FA034870BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	NEURAL_SPAM(0.00)[0.721];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Introduce support for loading a Linux kernel Image which is got by
uncompressing of Image.gz on RISC-V.

kernel_image_load() and place_modules() currently call panic() on
failure rather than returning an error. This is because the common
kernel_load() in common/device-tree/kernel.c does not expect a
return code. Handling errors gracefully would require a separate
refactor.

The implementation is based on the Xen Arm kernel loading code.

text_offset is available for both 32-bit and 64-bit Image, so fix
that.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Update the patch subject: add "... Linux kernel ...".
 - Make bi variable unsigned. And use while() instead of for().
 - Update the condition which calculates overlapping of kernel with modules.
 - Reject a malformed image before the loop to avoid wrapping
   load_addr + image_size in the per-bankcheck below.
 - Use  mathematical representation to print ranges.
 - Use #error instead of just returning unsupported.
 - Update the comment above stuct image in kernel_image64_probe().
---
---
 xen/arch/riscv/Makefile             |   1 +
 xen/arch/riscv/include/asm/config.h |  13 ++
 xen/arch/riscv/kernel.c             | 242 ++++++++++++++++++++++++++++
 xen/include/xen/fdt-kernel.h        |  11 +-
 4 files changed, 265 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/kernel.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index cfc3fdf7d208..eecdcbc76867 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -8,6 +8,7 @@ obj-y += guestcopy.o
 obj-y += imsic.o
 obj-y += intc.o
 obj-y += irq.o
+obj-y += kernel.init.o
 obj-y += mm.o
 obj-y += p2m.o
 obj-y += paging.o
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 0613de008b13..fd69057826e1 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -151,6 +151,19 @@
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
index 000000000000..dd79f457732d
--- /dev/null
+++ b/xen/arch/riscv/kernel.c
@@ -0,0 +1,242 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
+#define IMAGE64_MAGIC_V2 0x05435352 /* Magic number 2, le, "RSC\x05" */
+
+static void __init place_modules(struct kernel_info *info, paddr_t kernbase,
+                                 paddr_t kernend)
+{
+    const struct boot_module *mod = info->bd.initrd;
+    const struct membanks *banks = kernel_info_get_mem_const(info);
+    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0,
+                                       KERNEL_LOAD_ADDR_ALIGNMENT);
+    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt),
+                                    KERNEL_LOAD_ADDR_ALIGNMENT);
+    const paddr_t modsize = initrd_len + dtb_len;
+    unsigned int bi = banks->nr_banks;
+
+    BUG_ON(modsize < initrd_len);
+
+    /*
+     * Place modules as high in RAM as possible, scanning banks from
+     * last to first so that the end of the last bank is preferred.
+     */
+    while ( bi-- > 0 )
+    {
+        const struct membank *bank = &banks->bank[bi];
+        const paddr_t bank_end = bank->start + bank->size;
+        paddr_t modbase;
+
+        if ( modsize > bank->size )
+            continue;
+
+        modbase = ROUNDDOWN(bank_end - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);
+
+        if ( modbase < bank->start )
+            continue;
+
+        /*
+         * If modules would overlap the kernel, try placing them below it.
+         */
+        if ( (modbase < ROUNDUP(kernend, KERNEL_LOAD_ADDR_ALIGNMENT)) &&
+             (modbase + modsize > kernbase) )
+        {
+            modbase = ROUNDDOWN(kernbase - modsize, KERNEL_LOAD_ADDR_ALIGNMENT);
+            if ( modbase < bank->start )
+                continue;
+        }
+
+        info->dtb_paddr = modbase;
+        info->initrd_paddr = modbase + dtb_len;
+
+        return;
+    }
+
+    panic("Unable to find suitable location for dtb+initrd\n");
+}
+
+static paddr_t __init kernel_image_place(struct kernel_info *info)
+{
+    paddr_t load_addr = INVALID_PADDR;
+    uint64_t image_size = info->image.image_size ?: info->image.len;
+    const struct membanks *banks = kernel_info_get_mem_const(info);
+    unsigned int nr_banks = banks->nr_banks;
+    unsigned int bi;
+
+    dprintk(XENLOG_DEBUG, "nr_banks(%u)\n", nr_banks);
+
+    /*
+     * At the moment, RISC-V's Linux kernel should be always position
+     * independent based on "Per-MMU execution" of boot.rst:
+     *   https://docs.kernel.org/arch/riscv/boot.html#pre-mmu-execution
+     *
+     * But just for the case when RISC-V's Linux kernel isn't position
+     * independent it is needed to take load address from
+     * info->image.start.
+     *
+     * If `start` is zero, the Image is position independent.
+     */
+    if ( likely(!info->image.start) )
+    {
+        for ( bi = 0; bi != nr_banks; bi++ )
+        {
+            const struct membank *bank = &banks->bank[bi];
+            paddr_t bank_start = bank->start;
+            /*
+             * According to boot.rst kernel load address should be properly
+             * aligned:
+             *   https://docs.kernel.org/arch/riscv/boot.html#kernel-location
+             *
+             * As Image in this case is PIC we can ignore
+             * info->image.text_offset.
+             */
+            paddr_t aligned_start = ROUNDUP(bank_start, KERNEL_LOAD_ADDR_ALIGNMENT);
+            paddr_t bank_end = bank_start + bank->size;
+            paddr_t bank_size;
+
+            if ( aligned_start > bank_end )
+                continue;
+
+            bank_size = bank_end - aligned_start;
+
+            dprintk(XENLOG_DEBUG, "bank[%u].start=%"PRIpaddr"\n", bi, bank->start);
+
+            if ( image_size <= bank_size )
+            {
+                load_addr = aligned_start;
+                break;
+            }
+        }
+    }
+    else
+    {
+        load_addr = info->image.start + info->image.text_offset;
+
+        WARN_ON(!IS_ALIGNED(load_addr, KERNEL_LOAD_ADDR_ALIGNMENT));
+
+        /*
+         * Reject a malformed image before the loop to avoid wrapping
+         * load_addr + image_size in the per-bank check below by setting
+         * bi = nr_banks.
+         *
+         * image_size covers the kernel from _start (placed at load_addr =
+         * start + text_offset) through _end.  The alignment gap
+         * [start, load_addr) is padding and need not lie within a bank.
+         */
+        bi = image_size <= (paddr_t)-1 - load_addr ? 0 : nr_banks;
+        for ( ; bi != nr_banks; bi++ )
+        {
+            const struct membank *bank = &banks->bank[bi];
+            paddr_t bank_start = bank->start;
+            paddr_t bank_end = bank_start + bank->size;
+
+            if ( (load_addr >= bank_start) &&
+                 (load_addr + image_size <= bank_end) )
+                break;
+        }
+    }
+
+    if ( bi == nr_banks )
+        panic("Failed to place kernel image in any memory bank\n");
+
+    info->entry = load_addr;
+
+    return load_addr;
+}
+
+static void __init kernel_image_load(struct kernel_info *info)
+{
+    int rc;
+    paddr_t load_addr = kernel_image_place(info);
+    paddr_t paddr = info->image.kernel_addr;
+    paddr_t len = info->image.len;
+    paddr_t effective_size = info->image.image_size ?: len;
+    void *kernel;
+
+    place_modules(info, load_addr, load_addr + effective_size);
+
+    printk("Loading Image from %"PRIpaddr" to [%"PRIpaddr",%"PRIpaddr")\n",
+            paddr, load_addr, load_addr + effective_size);
+
+    kernel = ioremap_cache(paddr, len);
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
+static int __init kernel_image64_probe(struct kernel_info *info,
+                                       paddr_t addr, paddr_t size)
+{
+    /* https://www.kernel.org/doc/Documentation/riscv/boot-image-header.rst */
+    struct {
+        uint32_t code0;         /* Executable code */
+        uint32_t code1;         /* Executable code */
+        uint64_t text_offset;   /* Image load offset, little endian */
+        uint64_t image_size;    /* Effective Image size, little endian */
+        uint64_t flags;         /* kernel flags, little endian */
+        uint32_t version;       /* Version of this header */
+        uint32_t res1;          /* Reserved */
+        uint64_t res2;          /* Reserved */
+        uint64_t magic;         /* Deprecated: Magic number, little endian, "RISCV" */
+        uint32_t magic2;        /* Magic number 2, little endian, "RSC\x05" */
+        uint32_t res3;          /* Reserved for PE COFF offset */
+    } image;
+    uint64_t effective_size;
+
+    if ( size < sizeof(image) )
+        return -EINVAL;
+
+    copy_from_paddr(&image, addr, sizeof(image));
+
+    /* Magic v1 is deprecated and may be removed.  Only use v2 */
+    if ( le32_to_cpu(image.magic2) != IMAGE64_MAGIC_V2 )
+        return -EINVAL;
+
+    effective_size = le64_to_cpu(image.image_size);
+
+    if ( effective_size && size > effective_size )
+        return -EINVAL;
+
+    info->image.kernel_addr = addr;
+    /* Actual size in the binary file */
+    info->image.len = size;
+    /* Total memory the kernel occupies at runtime */
+    info->image.image_size = effective_size;
+    info->image.text_offset = le64_to_cpu(image.text_offset);
+    info->image.start = 0;
+
+    info->load = kernel_image_load;
+
+    return 0;
+}
+
+int __init kernel_image_probe(struct kernel_info *info, paddr_t addr,
+                              paddr_t size)
+{
+#ifdef CONFIG_RISCV_64
+    return kernel_image64_probe(info, addr, size);
+#else
+#   error "Only 64-bit RISC-V is supported"
+#endif
+}
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 54be77aa191e..c69da642eba8 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -59,8 +59,15 @@ struct kernel_info {
         struct {
             paddr_t kernel_addr;
             paddr_t len;
-#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV_64)
-            paddr_t text_offset; /* 64-bit Image only */
+#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV)
+            /*
+             * ARM: 64-bit Image only.
+             * RISC-V: both 32-bit and 64-bit Images.
+             */
+            paddr_t text_offset;
+#endif
+#if defined(CONFIG_RISCV)
+            uint64_t image_size; /* Effective size of Image */
 #endif
             paddr_t start; /* Must be 0 for 64-bit Image */
         } image;
-- 
2.53.0


