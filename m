Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIjfMW1U/GlOOAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1354E55EE
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302338.1576343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZi-00043e-TB; Thu, 07 May 2026 08:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302338.1576343; Thu, 07 May 2026 08:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZi-000401-E9; Thu, 07 May 2026 08:59:18 +0000
Received: by outflank-mailman (input) for mailman id 1302338;
 Thu, 07 May 2026 08:59:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKuZg-0003sK-OG
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:59:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuZg-005UsV-4q
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:59:16 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc545f-e002-0a2a0a5209dd-0a2a4501ca64-28
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:15 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5463-c1f2-0a2a45010019-d155da2fb86f-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:15 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-bc2a455fd55so84106666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:59:15 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc81d5e9583sm57549966b.17.2026.05.07.01.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 01:59:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778144354; x=1778749154; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5JrowEde3AEZewOr27HDt+oy+DAfl7walW+rv1nHYY=;
        b=mP/nPJIEtGqWpm+tqvmLR/rbg1uXu455kUbVDjckrCUnhE7MIGSg1ABjd9/6vLBGlL
         J2bcdj/h040AGePpNnMvRS7+dkf7faWNY/8x8EQjGF7dV/PLMidL2FdbLNUnJRFLpddO
         /IkzLG7qVMpJPW/8VxYqqQlzFPe3fycUBoPA7kfflpb6eAZ6GoObN//kwV95+p8kABIU
         lxrEYl52riDBlwiLAsbJD8SSGmFuJwSnI4AopkNgId07ijTQJr2ZmlTtGRJk6fhOerLh
         fNr6QO2el+Tg+X7JljSL84L/5jtLkuiThgmaEbK/VVkOe3Ymr8WU+fGmNg2OHQyIxlV9
         Tn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144354; x=1778749154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b5JrowEde3AEZewOr27HDt+oy+DAfl7walW+rv1nHYY=;
        b=RU3MmjjvTJHIkitV/PI0ZpV+iDMs9sjC8NLEf9asT94ukD1xzlAsfylGwfOloxNo2P
         YEHlwGKdat0ps4Al5HtJWnXK5t9+3xxv0RkO5YLDE2ShiOYk3wiikBExazj/S+QB4yBt
         Y/cGKs+yF6z2NFeUD1DkUz4ng3jmGTDApXN926rPnVMz7PkK2vZT0UsZ7P9mB80PJqeP
         W6646SHGg4Li6axWLmck0BGL40JDMOHW85NbWPNpZqMjzKNcWWL5Q36p28BRv50fJBbN
         nI4AlBQNjT6CQn4YVBCVho5NlBvRDKP1hKMnMI3i2j8Wyj8g/fyBY2NpVsHuIKlxidId
         I9yQ==
X-Gm-Message-State: AOJu0YyEOcx0aMCYfLdDRDln+DTSohfEa4RHujUjN3rKjqY2sadPeoAh
	O/BnvT1SNhNifuiGLMNZ0tvHTSXRJawwuM5nZSb29nF8XObErNRh58bHJgABhg==
X-Gm-Gg: AeBDieuh+xY7M7A35w1dCLWTl80unv+DMh9epdFj5+pogNyFZpOPuDxZB5RfJQl5OPG
	mf4njd+xyLE9+0V9oYlBFM0mbYRPMWSCIwC73aFI65UTWW2QqP87r0v9xjUaXZbpSsjOEShv4HB
	UQ5Qom408PmGUmgGxfXbsHzTDcKjO2ObYs8lw9ZrdD3REWSwrhPyWziqfDSo7L9zdqJ/plc//3M
	fXSBaPNq0iCFahr58Vy+IndY079gu+sj/i6HD8UF29jtYacqBM1I3yutSYEeCukrT+eoU+kLbDL
	LrdS5mXUQudO+if6IPE0JK1QdTGLTkooM/pbA8Sktr76BMnO0ytDtuUmcvliWniENtP/q44+vr7
	g4B9aEJtmuwrn2mzwWmthhU6jaLgtrgesN8sWdoE1wSxh+vvZAbKOtthhV3Otvk7FTp5SIHJMm/
	og8Xha+3j6bt6po3e9Cgk4QV7SFhMtNF4qR2dsCogFnIL8GBMjlvg1NEBT33nhMKLbJfrdZmm28
	GOO
X-Received: by 2002:a17:906:99c1:b0:bc4:75be:62e3 with SMTP id a640c23a62f3a-bc56d137fc6mr400889466b.33.1778144352960;
        Thu, 07 May 2026 01:59:12 -0700 (PDT)
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
Subject: [PATCH v5 07/11] xen/riscv: add Linux kernel loading support
Date: Thu,  7 May 2026 10:58:46 +0200
Message-ID: <f77ef278b7df729a3a97a0e1b3ed0b4ee4d08fac.1778140240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778140240.git.oleksii.kurochko@gmail.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778144355-B715BFF4-9BCA9DAE/10/73395122804
X-purgate-type: spam
X-purgate-size: 12546
X-Rspamd-Queue-Id: 5B1354E55EE
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
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

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
Changes in v5:
 - Introduce MODULES_ALIGNMENT and use it inside place_modules().
 - Add if() to avoid underflow when modbase is calculated in the case when
   modules would overlap the kernel.
 - Drop unnessary dprintk()s.
 - "&& size > effective_size" in kernel_image64_probe().
 - Use 'size_t' for image_size in struct kernel_info to
   fit both RV32 and RV64.
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
 xen/arch/riscv/kernel.c             | 249 ++++++++++++++++++++++++++++
 xen/include/xen/fdt-kernel.h        |  11 +-
 4 files changed, 272 insertions(+), 2 deletions(-)
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
index 000000000000..8580cdb32d7a
--- /dev/null
+++ b/xen/arch/riscv/kernel.c
@@ -0,0 +1,249 @@
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
+/*
+ * Machine word alignment could be useful for copying to be more efficient.
+ * There is no reason for now to have bigger module alignment.
+ */
+#define MODULES_ALIGNMENT sizeof(unsigned long)
+
+static void __init place_modules(struct kernel_info *info, paddr_t kernbase,
+                                 paddr_t kernend)
+{
+    const struct boot_module *mod = info->bd.initrd;
+    const struct membanks *banks = kernel_info_get_mem_const(info);
+    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0,
+                                       MODULES_ALIGNMENT);
+    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt),
+                                    MODULES_ALIGNMENT);
+    const paddr_t modsize = initrd_len + dtb_len;
+    unsigned int bi = banks->nr_banks;
+
+    if ( modsize < initrd_len )
+        panic("Module size overflow: initrd + dtb size wraps paddr_t\n");
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
+        modbase = ROUNDDOWN(bank_end - modsize, MODULES_ALIGNMENT);
+
+        if ( modbase < bank->start )
+            continue;
+
+        /*
+         * If modules would overlap the kernel, try placing them below it.
+         */
+        if ( (modbase < ROUNDUP(kernend, MODULES_ALIGNMENT)) &&
+             (modbase + modsize > kernbase) )
+        {
+            /* Avoid underflow below */
+            if ( kernbase < modsize )
+                continue;
+
+            modbase = ROUNDDOWN(kernbase - modsize, MODULES_ALIGNMENT);
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
+    if ( !effective_size )
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
index 8cd1670c2c6f..00c37be101bf 100644
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
+            size_t image_size; /* Effective size of Image */
 #endif
             paddr_t start; /* Must be 0 for 64-bit Image */
         } image;
-- 
2.54.0


