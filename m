Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HABXGwFdImrdVQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 07:22:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB3645282
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 07:22:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CNfdyksG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1328926.1593157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVMzt-0002Gn-2F; Fri, 05 Jun 2026 05:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328926.1593157; Fri, 05 Jun 2026 05:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVMzs-0002E2-VW; Fri, 05 Jun 2026 05:21:32 +0000
Received: by outflank-mailman (input) for mailman id 1328926;
 Fri, 05 Jun 2026 05:21:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wVMzr-000219-JL
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 05:21:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVMzq-00HJSo-P1
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:21:30 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a225ccc-e002-0a2a0a5209dd-0a2a4502a4c8-16
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:21:30 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a225cd9-af86-0a2a45020019-d1558031e0df-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:21:30 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so18109435e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 22:21:30 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.204])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2c9ea37sm31922435e9.0.2026.06.04.22.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 22:21:28 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780636889; x=1781241689; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHWDeiNA+imJX8eeXdwKA190eQAUDsJXyCufUuF7d40=;
        b=CNfdyksGwx/eDjIbaWsQxgj+RBU546QukOWMhpXhENg0ZemHnGOM0rZTyu6SMFLBws
         IdQW3JxQrswr3Lf4qTWcp9K98chyFZiLzliLLb0mphnn0zOCr73BXbSixk4PVpp0EWA0
         ksMxdPO9pCCjWheP6HXOoK1XycCkAH1nz5e86TcOu0UWPl0w9HBjyqqRBxg2HCSF/jrZ
         U7cgZcuhhuBk9RHGklrKGwIgV/aaG6NrN+i+IWVAMPTB7fwVxDuTXYr4VZEmH4UzD4Ko
         D+iym05LjAajhiyNC8srkZ7ExD/a6lbAYCnFvcILpfki7ce9WW0e6zpo+FiTCOkGn0I/
         CpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780636889; x=1781241689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AHWDeiNA+imJX8eeXdwKA190eQAUDsJXyCufUuF7d40=;
        b=AOR8FTcxOQq9DKvqNyIQSqWD7HrfTyomLEWtmoLPnspmLR94RKbFZurg2BNqnJU7w2
         Bx669ZY+7sFrllLTUWPCPBb3bulcr85zgwFdsdmKTpaTuW4oluyzsNir1gQMrdmAKbi4
         kBn+qK5Z6W2vXjJmFDl4xkqDG3ZMUxb7gQlBAmiSoYuLoA2tZjzlwEJ6Bub8TF72Y78M
         5n0oxgts7OG/lYjMg68jNnRJcdwAU6Nn1CVBDsOb7YwhgbexAtc7JihjYeaTRwLudBEq
         U5QxluJEw2aQOEQpYjejVLy/ILYaoEmQfni+zmrQ/LPo0u7myBprwzUXRz9C82wURboz
         wZfg==
X-Gm-Message-State: AOJu0YwRvXQF6nslO71Eyz4AKIjf2ce9uCPNt7QiUQDHy2fEt3sQNVYi
	pPc110Y3u6hgD3UYa0MTKQA889cmprLHGR9Ln54RSHeiHCLmEgzNknbGc89qCg==
X-Gm-Gg: Acq92OEKeG7DvErlbwF7ZA8MteTup9Q0JwTc/jApXwlKWnfMTQx6bzPz2O2+RhgPbxR
	Ysk1321j65kQdbZK3aIZ1wwRlbxNoUILzobIwQt78gWcPPR0RcKND5LBlylWw2y8rIa7FsB3V0n
	4O+lMmP3KszcCaJaCN3ZtPYM5fIBaEM94+X9niM7hSlGwKT5ydxQtXKgi6+asbc+lluiyMVkBaa
	aXqgASSzuoKXL2g4DA6RnQ8uTdZr7uEm8INz/mp+kgjKGzFKwmtjuuzhS8zwrVNVb8aeN/BjMdn
	rXKugSaENdrcsTYCpoiTPqTmJdXjCZJyu/mKK7xTLLk4phHpdDp/vm6ubu6OCSKidTJFPMB+ecM
	BJauLTI5dZBwMcLgQXtyMAUbCwTWyBIt1O5RPhZtZJBDgEGiDSAkZCxvnplkLGCKlnSLah8XNET
	Q3i0PVhF+V+W/jhhEFSOfB9/i+BFC90NLw0TUG1A==
X-Received: by 2002:a05:600c:524a:b0:490:b11f:2560 with SMTP id 5b1f17b1804b1-490c256f131mr27988045e9.9.1780636889273;
        Thu, 04 Jun 2026 22:21:29 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.22 v2 1/2] xen/arm: split DTB/initrd placement helpers
Date: Fri,  5 Jun 2026 08:19:07 +0300
Message-ID: <11537d2b05a6c36d4ba0d852efadeba91d9f6225.1780602987.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780602987.git.mykola_kvach@epam.com>
References: <cover.1780602987.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780636890-A917D161-7B1E564F/0/0
X-purgate-type: clean
X-purgate-size: 10019
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DFB3645282

From: Mykola Kvach <mykola_kvach@epam.com>

The Arm zImage loader currently computes the kernel load address and
places the DTB/initrd in one local flow. The hardware-domain memory
allocator needs to reuse those placement rules before it chooses bank 0,
but open-coding the same calculations there would make the fix harder to
audit.

Split the existing logic into small helpers:
- kernel_zimage_place_in_bank() computes the zImage load address for a
  given bank.
- first_bank_can_fit_modules() checks the aggregate first-bank
  footprint.
- find_dtb_initrd_placement() chooses the DTB/initrd location within a
  known bank and kernel range.

Rename place_modules() to place_dtb_initrd() so the code distinguishes
the kernel image from the DTB/initrd placement area. Also update the
stale xg_dom_arm.c path in the placement comment.

The caller still panics in the same cases as before, so this is intended
to be behavior preserving.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- New patch split out from the hardware-domain first-bank fix.
- Rename the DTB/initrd placement helpers to avoid treating the kernel
  and DTB/initrd as the same kind of module.
- Pass the RAM end address to find_dtb_initrd_placement() instead of
  recomputing it from the RAM size.
- Update the stale xg_dom_arm.c reference in the placement comment.
---
 xen/arch/arm/kernel.c                 | 147 ++++++++++++++++----------
 xen/common/device-tree/domain-build.c |   6 +-
 2 files changed, 97 insertions(+), 56 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index b72585b7fe..d1be4d8074 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -40,27 +40,59 @@ struct minimal_dtb_header {
     /* There are other fields but we don't use them yet. */
 };
 
-static void __init place_modules(struct kernel_info *info,
-                                 paddr_t kernbase, paddr_t kernend)
+static paddr_t __init
+kernel_zimage_place_in_bank(const struct kernel_info *info,
+                            paddr_t bank_start, paddr_t bank_size)
 {
-    /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
-    const struct boot_module *mod = info->bd.initrd;
-    const struct membanks *mem = kernel_info_get_mem(info);
-    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
-    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
-    const paddr_t modsize = initrd_len + dtb_len;
+    paddr_t load_addr;
 
-    /* Convenient */
-    const paddr_t rambase = mem->bank[0].start;
-    const paddr_t ramsize = mem->bank[0].size;
-    const paddr_t ramend = rambase + ramsize;
+#ifdef CONFIG_HAS_DOMAIN_TYPE
+    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
+        return bank_start + info->image.text_offset;
+#endif
+
+    /*
+     * If start is zero, the zImage is position independent, in this
+     * case Documentation/arm/Booting recommends loading below 128MiB
+     * and above 32MiB. Load it as high as possible within these
+     * constraints, while also avoiding the DTB.
+     */
+    if ( info->image.start == 0 )
+    {
+        paddr_t load_end;
+
+        load_end = bank_start + bank_size;
+        load_end = MIN(bank_start + MB(128), load_end);
+
+        load_addr = load_end - info->image.len;
+        /* Align to 2MB */
+        load_addr &= ~(MB(2) - 1);
+    }
+    else
+        load_addr = info->image.start;
+
+    return load_addr;
+}
+
+static bool __init first_bank_can_fit_modules(paddr_t ramsize,
+                                              paddr_t kernbase, paddr_t kernend,
+                                              paddr_t dtb_initrd_size)
+{
     const paddr_t kernsize = ROUNDUP(kernend, MB(2)) - kernbase;
-    const paddr_t ram128mb = rambase + MB(128);
 
-    paddr_t modbase;
+    /*
+     * Check only the aggregate kernel + DTB/initrd footprint. The actual
+     * DTB/initrd location is selected by find_dtb_initrd_placement().
+     */
+    return dtb_initrd_size + kernsize <= ramsize;
+}
 
-    if ( modsize + kernsize > ramsize )
-        panic("Not enough memory in the first bank for the kernel+dtb+initrd\n");
+static bool __init find_dtb_initrd_placement(paddr_t rambase, paddr_t ramend,
+                                             paddr_t kernbase, paddr_t kernend,
+                                             paddr_t dtb_initrd_size,
+                                             paddr_t *dtb_base)
+{
+    const paddr_t ram128mb = rambase + MB(128);
 
     /*
      * DTB must be loaded such that it does not conflict with the
@@ -77,55 +109,64 @@ static void __init place_modules(struct kernel_info *info,
      * just before the kernel.
      *
      * If changing this then consider
-     * tools/libxc/xc_dom_arm.c:arch_setup_meminit as well.
+     * tools/libs/guest/xg_dom_arm.c:meminit as well.
      */
-    if ( ramend >= ram128mb + modsize && kernend < ram128mb )
-        modbase = ram128mb;
-    else if ( ramend - modsize > ROUNDUP(kernend, MB(2)) )
-        modbase = ramend - modsize;
-    else if ( kernbase - rambase > modsize )
-        modbase = kernbase - modsize;
-    else
+    if ( ramend >= ram128mb + dtb_initrd_size && kernend < ram128mb )
     {
-        panic("Unable to find suitable location for dtb+initrd\n");
-        return;
+        *dtb_base = ram128mb;
+        return true;
     }
 
-    info->dtb_paddr = modbase;
-    info->initrd_paddr = info->dtb_paddr + dtb_len;
+    if ( ramend - dtb_initrd_size > ROUNDUP(kernend, MB(2)) )
+    {
+        *dtb_base = ramend - dtb_initrd_size;
+        return true;
+    }
+
+    if ( kernbase - rambase > dtb_initrd_size )
+    {
+        *dtb_base = kernbase - dtb_initrd_size;
+        return true;
+    }
+
+    return false;
 }
 
-static paddr_t __init kernel_zimage_place(struct kernel_info *info)
+static void __init place_dtb_initrd(struct kernel_info *info,
+                                    paddr_t kernbase, paddr_t kernend)
 {
+    /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
+    const struct boot_module *initrd = info->bd.initrd;
     const struct membanks *mem = kernel_info_get_mem(info);
-    paddr_t load_addr;
+    const paddr_t initrd_len = ROUNDUP(initrd ? initrd->size : 0, MB(2));
+    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
+    const paddr_t dtb_initrd_size = initrd_len + dtb_len;
 
-#ifdef CONFIG_HAS_DOMAIN_TYPE
-    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
-        return mem->bank[0].start + info->image.text_offset;
-#endif
+    /* Convenient */
+    const paddr_t rambase = mem->bank[0].start;
+    const paddr_t ramsize = mem->bank[0].size;
+    const paddr_t ramend = rambase + ramsize;
 
-    /*
-     * If start is zero, the zImage is position independent, in this
-     * case Documentation/arm/Booting recommends loading below 128MiB
-     * and above 32MiB. Load it as high as possible within these
-     * constraints, while also avoiding the DTB.
-     */
-    if ( info->image.start == 0 )
-    {
-        paddr_t load_end;
+    paddr_t dtb_base;
 
-        load_end = mem->bank[0].start + mem->bank[0].size;
-        load_end = MIN(mem->bank[0].start + MB(128), load_end);
+    if ( !first_bank_can_fit_modules(ramsize, kernbase, kernend,
+                                     dtb_initrd_size) )
+        panic("Not enough memory in the first bank for the kernel+dtb+initrd\n");
 
-        load_addr = load_end - info->image.len;
-        /* Align to 2MB */
-        load_addr &= ~((2 << 20) - 1);
-    }
-    else
-        load_addr = info->image.start;
+    if ( !find_dtb_initrd_placement(rambase, ramend, kernbase, kernend,
+                                    dtb_initrd_size, &dtb_base) )
+        panic("Unable to find suitable location for dtb+initrd\n");
 
-    return load_addr;
+    info->dtb_paddr = dtb_base;
+    info->initrd_paddr = info->dtb_paddr + dtb_len;
+}
+
+static paddr_t __init kernel_zimage_place(struct kernel_info *info)
+{
+    const struct membanks *mem = kernel_info_get_mem(info);
+
+    return kernel_zimage_place_in_bank(info, mem->bank[0].start,
+                                       mem->bank[0].size);
 }
 
 static void __init kernel_zimage_load(struct kernel_info *info)
@@ -143,7 +184,7 @@ static void __init kernel_zimage_load(struct kernel_info *info)
     if ( info->entry == 0 )
         info->entry = load_addr;
 
-    place_modules(info, load_addr, load_addr + len);
+    place_dtb_initrd(info, load_addr, load_addr + len);
 
     printk("Loading zImage from %"PRIpaddr" to %"PRIpaddr"-%"PRIpaddr"\n",
            paddr, load_addr, load_addr + len);
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 2a760b007b..f3ba496f1e 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -245,8 +245,8 @@ out:
  * hardware domain to have memory reachable by devices with limited DMA address
  * capabilities (e.g. 32-bit DMA).
  *
- * The first bank allocated must be large enough for place_modules() to fit
- * the kernel, DTB and initrd.
+ * The first bank allocated must be large enough for place_dtb_initrd() to
+ * fit the kernel, DTB and initrd.
  */
 static bool __init allocate_hwdom_memory(struct kernel_info *kinfo)
 {
@@ -302,7 +302,7 @@ static bool __init allocate_hwdom_memory(struct kernel_info *kinfo)
         paddr_t bank_size;
 
         /*
-         * The first bank must be large enough for place_modules() to
+         * The first bank must be large enough for place_dtb_initrd() to
          * fit the kernel, DTB and initrd.  Skip small regions to avoid
          * ending up with a tiny first bank.
          */
-- 
2.43.0


