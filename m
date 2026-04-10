Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEliNm4d2WmLmQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB123D9DFE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279419.1563880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECV-00080r-7S; Fri, 10 Apr 2026 15:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279419.1563880; Fri, 10 Apr 2026 15:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECV-0007wr-2E; Fri, 10 Apr 2026 15:55:19 +0000
Received: by outflank-mailman (input) for mailman id 1279419;
 Fri, 10 Apr 2026 15:55:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBECS-0007Yn-SI
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:55:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBECS-00Cgsb-89
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:55:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d62-e002-0a2a0a5209dd-0a2a4509a384-2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:16 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d64-bf79-0a2a45090019-d155802daca4-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:16 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso17203645e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:55:16 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm78285605e9.12.2026.04.10.08.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 08:55:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775836515; x=1776441315; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5ZH7rQJo78iVZbYMuHhA9Tl/XiBD/nIpAdpGmDqucg=;
        b=nnd6pLLacLLQxFXoQZTBTas/aAPaGs+zWXRWBMHvtIZSL6uMkaKs5KbxepNfEUsyfC
         hRhvttFifqzWzm5r5j7jxvUSZcdP7peadLcWDo0IZQqDXgEKM/axwiP83RMgp/zIMwU+
         ie0yGW/9EMqjRl7TZN/QRCnSkXWIoSp90Fz7vx74zYnHXoJeS+MttWM3DB6h6J6hozOR
         /WBC6E+LNSJ9W68bApkhejh7yJg+wh4XMCudZVcncs5f2whu2iI4yfv+MNaCfEy6tT7P
         bPcvbBbmtfAQjI/UcHoFSUQuwBo2Rupt7VW+J5DtGSOHWicv8Vb5uN5R3yXBb2X75OTr
         xF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836515; x=1776441315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B5ZH7rQJo78iVZbYMuHhA9Tl/XiBD/nIpAdpGmDqucg=;
        b=i7kl1To89uhG5UBm4jwSBUiYut+pfozoNz3KD4ZgFj+4pKulVlpJ8ySworzf4dEQlt
         qze5pvPmLn7pqyFsFaReRFPWc8IzpLupKkkEjIBQIkAzhLdGwEyKM7RVvo+vExoxm6L2
         N53I3x+gtA0HFtKXR3Hm94h75ZaExpJsj+cbWp9fUmhoWjTRsNYQoaNc4czDGSfA3C5O
         SIl0VHXp2R5qnuuXWhNz+wZDThHt5RpW7zMlgYACYtzC4VF1BYyWHi1som8p2+C9RUec
         0WxFenxQ6bp6JyH34aI5ZHuaRfCZZy1zFH93RDTA0voyVgJ9DziZ9x4I5OBflvLRFMHd
         Ha/Q==
X-Gm-Message-State: AOJu0YxCKrA6JE0CM88VHzANRTKaKiXWVXIvrjrnmf2yVAyiFCZ27kpp
	T5vucy1y8tmOQIvWOOTKlnRT0aA4ELeUweBo//omoZSzQCFxLAhP4cCip52jBA==
X-Gm-Gg: AeBDievn0SMBEvyr7fOYEjCl8mdigIgU1DiHd3xcJ0PnunD+bZxKPOYZ1NgvVoxRfm0
	iopLCDcsG6kskPA4nUxCml4fQU/rz8Q7Ur1zmv8nBt82t1U091QwMvurnizgJU6cjg8seOWqmGY
	mdk68wQrzbimANBYawyPxjZlxSpPpfQvkiNveQmJFc7D+gfakRxXhzAZIBy84tUCP9HD5z85RK4
	gjzMQcD4XWQmoxa2UK8/9IqErE3L93NO25eQjL8rEDntlMAtzZ9ql7/FQq3f6Jo/l5Jh3H8m4G5
	xbMl+eghclq0PJQcLJyZBGYagUWjaA79oJs2ZFW7ODQnztYDFjVUCFGKWHXraHQxSfYoyt3gkCj
	K39JXDX6tbzbx2Zp9J4EiqnBVdsdEiGDla9lgdK2j+JRp8QxaGbFBjoTls9lI3WFdV9GDruFKrT
	hce1+Tl2+wf28bSCMoJM/t+B9bX1GiZZfzs0sJ8ExcHVV0FXMRmABm4sqDQGcyln/TGQ==
X-Received: by 2002:a05:600c:8284:b0:488:d228:a133 with SMTP id 5b1f17b1804b1-488d683d280mr45886265e9.14.1775836515301;
        Fri, 10 Apr 2026 08:55:15 -0700 (PDT)
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
Subject: [PATCH v3 05/12] xen/riscv: add kernel loading support
Date: Fri, 10 Apr 2026 17:54:51 +0200
Message-ID: <29ec8e444792caa925ba92cdc406ef8c0b3bd678.1775836193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775836193.git.oleksii.kurochko@gmail.com>
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1775836516-57941152-7002F875/10/73395122804
X-purgate-type: spam
X-purgate-size: 11722
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4AB123D9DFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v3:
 - s/kernel.o/kernel.init.o.
 - s/struct kernel_info *info/const struct kernel_info *info for kernel_image_place
 - s/ioremap_wc/ioremap_cache() inside kernel_image_load().
 - s/u<N>/uint<N>.
 - Drop hard tabs.
 - Add le{32,64}_to_cpu() when correpondent le endian  fields are read.
 - Update the comment in kernel_image64_probe() about initialization of end of
 image64.
 - Introduce image_size to pass to kernel load function total size of kernel
  it will have at runtime.
- Update kernel_image_place() to not put Image always to bank 0.
- Update place_modules() function to deal with different banks.
- Propage error up the call chain in kernel_image_probe(). 
---
Changes in v2:
 - s/zimage/image as RISC-V doesn't support zImages, only Image and
   Image.{gz,...}.
 - Update the commit message.
---
 xen/arch/riscv/Makefile             |   1 +
 xen/arch/riscv/include/asm/config.h |  13 ++
 xen/arch/riscv/kernel.c             | 230 ++++++++++++++++++++++++++++
 xen/include/xen/fdt-kernel.h        |  11 +-
 4 files changed, 253 insertions(+), 2 deletions(-)
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
index 000000000000..6d58f3372358
--- /dev/null
+++ b/xen/arch/riscv/kernel.c
@@ -0,0 +1,230 @@
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
+    int bi;
+
+    BUG_ON(modsize < initrd_len);
+
+    /*
+     * Place modules as high in RAM as possible, scanning banks from
+     * last to first so that the end of the last bank is preferred.
+     */
+    for ( bi = banks->nr_banks - 1; bi >= 0; bi-- )
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
+         * If the kernel resides in this bank, ensure modules do not
+         * overlap with it.
+         */
+        if ( (kernbase >= bank->start) && (kernbase < bank_end) &&
+             (modbase < ROUNDUP(kernend, KERNEL_LOAD_ADDR_ALIGNMENT)) &&
+             (modbase + modsize > kernbase) )
+            continue;
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
+        for ( bi = 0; bi != nr_banks; bi++ )
+        {
+            const struct membank *bank = &banks->bank[bi];
+            paddr_t bank_start = bank->start;
+            paddr_t bank_end = bank_start + bank->size;
+
+            if ( (load_addr >= bank_start) && (load_addr < bank_end) &&
+                 (bank_end - load_addr) >= image_size )
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
+    printk("Loading Image from %"PRIpaddr" to %"PRIpaddr"-%"PRIpaddr"\n",
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
+    /* riscv/boot-image-header.rst */
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
+    return -EOPNOTSUPP;
+#endif
+}
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 2af3bd5f0722..aa977a50f4fc 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -52,8 +52,15 @@ struct kernel_info {
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


