Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNqNENJqwWkVTAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EE22F83A3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259458.1552783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iBG-0006kn-N2; Mon, 23 Mar 2026 16:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259458.1552783; Mon, 23 Mar 2026 16:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iBG-0006iy-J4; Mon, 23 Mar 2026 16:31:06 +0000
Received: by outflank-mailman (input) for mailman id 1259458;
 Mon, 23 Mar 2026 16:31:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w4iBF-0006dN-5M
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:31:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4iBC-005uwX-VW
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 17:31:04 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16ab9-e002-0a2a0a5209dd-0a2a45089f86-26
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:31:04 +0100
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16ac8-1950-0a2a45080019-d155d031c55d-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:31:04 +0100
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-668d70fabc4so918666a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 09:31:04 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm536248166b.17.2026.03.23.09.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:30:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20230601 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283464; x=1774888264; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1r0zN6nVpndBbZj2EAngA6PIoeO7gCPLDD4SqQQvZ3o=;
        b=jqKHXS6HrPhdC9i/U5gPSuFSfO7HIaO8bY2w5nFxVk5ey3Dmti5UGPzhDBKiEH8qck
         U7YaYJaywuGg8dBpuY62o/JTI2mGGf13i/dVlAkOnhCyrUfqpDeelg/gOU1sFXqgf78h
         fGT2Kpz33UAw7rnffg7ZT/nl4hSgfQHA6rC0388RReaqEn9u3iTg1BUh4tULPGeBLdiZ
         2BBS/O+XCnAIyypuZy68bV9PQKnQ17flTrXBJBDnE6xEQKHZ+S/d8H+HDLc4Uv5WrK2h
         qkVAUkqJrJ83xO/kvaGl53nafBaAKHrm0b4gC4KxCXvmVjy3H2Ba11s5/VjGDGCPitkT
         6iYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283464; x=1774888264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1r0zN6nVpndBbZj2EAngA6PIoeO7gCPLDD4SqQQvZ3o=;
        b=DmDBODJvJy6wu7e9ree5w/PXJZDw6EkZ4b4emkuJihM/T5N10EZt/ur2GKWLZRuSlA
         Ge34y+QWzjAP8NGTYIIsgC4/9aIZtAidUFKnu2qnGa7QbxbVa+zuro2BOGXlfoMLbi75
         m7agUIiz1I7s2k0JNlSKwmaNviqe6T7QkUq5f4p36fHYMLuVIqzPDXmhaqtX2yoRTroz
         MV74ZZcj1uSGVzjRcySFFuF2ldf0Mxiuyn57FjXlsrRviLa/DfLDPt+IExJBngCT0OP9
         BcTtKKSAxdiK77Nd+ifaIPaH5NTcU5t1dpvOregTvz8UTKs0p6OUFOdSXYJpR8ly9ww2
         SH5Q==
X-Gm-Message-State: AOJu0Yy8m0GA9Qt4GBpHnRDmvL93x5dfKP7oR0o59+9kujvitWV09WXW
	VAr3kYGJlD2z/7YITLu+alAXyTpY/ZKHSXYsSJiO6Ip0u7ItC+nlsUACbop81Q==
X-Gm-Gg: ATEYQzxgBrOS+8nJbnkEsHSmrWUcm3E55TaXVJX8MdcKNQJZQAbnWLX6lrLq3CHbVBl
	qChkS1bz4G3L3W77cPXuzDrfs7QTYPbmPsUKbwYRLY7C13H9O+8FVzazBNUz4kWFice0waoBhOP
	NjwZxitXpqhfJ91mK7JV0Nf/pLzZDNDZfwTF1Pn8qiK7/uzbrzXKSfNVLM+uED/T2FC3fCaSe5+
	539m7eBX75xFe2ehY8X3KrTo6hivSGU+RpllOOsO9jN+LhL1cvc2efGQzvON9LXkOlzVx+Dcu0p
	1uSeA+7KeY3iWauJdb3mEHIum3g83/v3MfEwnQgTQ7cMdE3F37PSQRPcD676+gNyeFbo2VMfUlu
	VkOkR396dadF2p0qjnyHTNR0erJeso5yphVk1XVnv7HUFdYPQK5Gt8+vf+WCkBuqpR7ESMARWb5
	6NcKuQFKMeJ1ml86gq8s8l3xy3vVzKX/jbFqNM7KnW0P4RyIaMhla08RZrYXHbSO+mgQ==
X-Received: by 2002:a17:907:7fa3:b0:b98:4799:e6de with SMTP id a640c23a62f3a-b984799e8afmr731143366b.48.1774283463418;
        Mon, 23 Mar 2026 09:31:03 -0700 (PDT)
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
Subject: [PATCH v2 05/11] xen/riscv: add kernel loading support
Date: Mon, 23 Mar 2026 17:29:46 +0100
Message-ID: <1688c6e0e616b2d1bc1a9050d66f007e0e65d3b2.1774281309.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774281309.git.oleksii.kurochko@gmail.com>
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1774283464-E3A9B726-99E1AC7C/0/0
X-purgate-type: clean
X-purgate-size: 7282
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
X-Rspamd-Queue-Id: A2EE22F83A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce support for loading a Linux kernel Image (its compressed
version) on RISC-V.

kernel_image_load() and place_modules() currently call panic() on
failure rather than returning an error. This is because the common
kernel_load() in common/device-tree/kernel.c does not expect a
return code. Handling errors gracefully would require a separate
refactor.

The implementation is based on the Xen Arm kernel loading code.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - s/zimage/image as RISC-V doesn't support zImages, only Image and
   Image.{gz,...}.
 - Update the commit message.
---
 xen/arch/riscv/Makefile             |   1 +
 xen/arch/riscv/include/asm/config.h |  13 +++
 xen/arch/riscv/kernel.c             | 158 ++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 xen/arch/riscv/kernel.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 6d3c822409b8..d90afc7ad23f 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -8,6 +8,7 @@ obj-y += guestcopy.o
 obj-y += imsic.o
 obj-y += intc.o
 obj-y += irq.o
+obj-y += kernel.o
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
index 000000000000..be5b17dc22c3
--- /dev/null
+++ b/xen/arch/riscv/kernel.c
@@ -0,0 +1,158 @@
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
+static paddr_t __init kernel_image_place(struct kernel_info *info)
+{
+    paddr_t load_addr;
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
+     * If `start` is zero, the Image is position independent. */
+    if ( likely(!info->image.start) )
+        /*
+         * According to boot.rst kernel load address should be properly
+         * aligned:
+         *   https://docs.kernel.org/arch/riscv/boot.html#kernel-location
+         */
+        load_addr = ROUNDUP(info->mem.bank[0].start, KERNEL_LOAD_ADDR_ALIGNMENT);
+    else
+        load_addr = info->image.start;
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
+    void *kernel;
+
+    info->entry = load_addr;
+
+    place_modules(info, load_addr, load_addr + len);
+
+    printk("Loading Image from %"PRIpaddr" to %"PRIpaddr"-%"PRIpaddr"\n",
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
+static int __init kernel_image64_probe(struct kernel_info *info,
+                                       paddr_t addr, paddr_t size)
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
+    } image;
+    uint64_t start, end;
+
+    if ( size < sizeof(image) )
+        return -EINVAL;
+
+    copy_from_paddr(&image, addr, sizeof(image));
+
+    /* Magic v1 is deprecated and may be removed.  Only use v2 */
+    if ( image.magic2 != IMAGE64_MAGIC_V2 )
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
+    info->image.kernel_addr = addr;
+    info->image.len = end - start;
+    info->image.text_offset = image.text_offset;
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
+    int rc;
+
+#ifdef CONFIG_RISCV_64
+    rc = kernel_image64_probe(info, addr, size);
+    if ( rc < 0 )
+        panic("Failed to probe kernel image\n");
+#else
+    panic("Only RISC-V 64 is supported\n");
+#endif
+
+    return rc;
+}
-- 
2.53.0


