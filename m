Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3D09E0940
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 18:00:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846763.1261916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9li-0007Bc-Dt; Mon, 02 Dec 2024 16:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846763.1261916; Mon, 02 Dec 2024 16:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9li-00074G-8j; Mon, 02 Dec 2024 16:59:30 +0000
Received: by outflank-mailman (input) for mailman id 846763;
 Mon, 02 Dec 2024 16:59:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no4W=S3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tI9lh-0006wq-6i
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 16:59:29 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cacafa36-b0ce-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 17:59:28 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5cfa1ec3b94so5223153a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 08:59:28 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e64c4sm526802666b.97.2024.12.02.08.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 08:59:27 -0800 (PST)
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
X-Inumbo-ID: cacafa36-b0ce-11ef-a0d2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733158768; x=1733763568; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuTlneISEoSBSqnNXr83jGC6mPB/G48PgoDktHtlOF0=;
        b=K40McR3XPkhKWxiIfIxA2DAcHfk3hA5Im1711WxHb0WSUOJshW10DoqWV9UBf+2jp4
         vuTCuv8dNko/D71VeJYzOISm+kp3uQUnu5xATFffz8aS7kFYAXIonuVbUPg0sOVJzuCw
         +6dRpgSsMr2qLqZ+EBo77tnzBu7IgEmbw2Fn005sVKbm1V7WhnTVRv1tULEt39He+6mX
         IVE66npqSVPiiNHQJtBmsYwUzZ6vXaIrec3w+HpYDOZBD9RlOcWOc67AUOGI3y15zqGb
         QXAljdoEeJxT05HJh/TEFcaOk2RBcL3ZVKC8NDLV+MuyUpO/R0qT8YWIzFc5Zcf5VCYo
         /cKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733158768; x=1733763568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuTlneISEoSBSqnNXr83jGC6mPB/G48PgoDktHtlOF0=;
        b=n2N5OiKvIsTzybW+vUJisvkGKXRx+ATpRwv2SB6om3HbQU4R7YGaN/U+J0lFtKTN4T
         pPxhEPWuwEpl4QSGtCcwtSpsv00I60lWH8KLw0LegkwF/1AXrRsvy8FjkIQiTKoitE6u
         Sr4ri68pZqZcHzedKPMyX+0tkSUW2E+Z240SGKCPvindeBiO30m+i2xkY6AGQl1ndFxr
         aH8/r3BoHovjeO3u8EnoGx9oi/fN5TeEDGXDL0ER8AziqgIUlLXE6hx8Ay0AjQ1Gj2l5
         JhJ4t3AOw9E+l0fmLRHAbzFf2xFkkyJ/bSxU6f8GgJoVGA5grJ/BopSY/ACNQl7NZzFc
         9wvQ==
X-Gm-Message-State: AOJu0YxZEiJj8uyOL8RYmCafGQaNviLxA6ZyxIqCtNpadnlmuKkJquIE
	eb+qkGaHzm22P3kFjw5V4HR+yUDyO+KlbG1GZ+svSFOLivRJK/+fxBfSA0BiS5cprwh1RF1mnyd
	f
X-Gm-Gg: ASbGnctZ2NuIO6QsJT6HGiMbFeCsOFFvo5TB3FpdDlIM8Lzt4sCpn5yuBDwT3E1Mnwd
	hK5eiiEOGeN/AZWRZkqELAGVLy0cIxo/msbMSyitm6rYzcJB2DCSiTR+Jx8ffh6VkZWNApnGhj9
	Rytzbpt/WxOSRTWp4A0+pWOQFpGL4PJgPOtNwy+I+VRQrwBknjQ0z5OQBZgdZB+lU7lHIh2Mk6Y
	6Hxsiessq3ia6ngNcKQfK2AeQ1S8feACZlr6rhhuhN1/jHTe3hxG3okYdtZhvHuOWQszlZc2bjV
	G6B168Tgyk0MMPEryXQgOofURkGpeXEYuS+XaN10yXw47y1HJziW
X-Google-Smtp-Source: AGHT+IFSZN81YR3At05jAS8Y5uQq55EBJLmehdRTJEzxbzXI+AUKAbipwqjZXa5+/6ZAgCJN3HW5rQ==
X-Received: by 2002:a17:906:3d29:b0:aa5:1699:e25a with SMTP id a640c23a62f3a-aa580ee98eamr1733280466b.10.1733158767753;
        Mon, 02 Dec 2024 08:59:27 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0 construction
Date: Mon,  2 Dec 2024 17:59:12 +0100
Message-ID: <20241202165921.249585-4-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache coloring requires Dom0 not to be direct-mapped because of its non
contiguous mapping nature, so allocate_memory() is needed in this case.
8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
moved allocate_memory() in dom0less_build.c. In order to use it
in Dom0 construction bring it back to domain_build.c and declare it in
domain_build.h.

Take the opportunity to adapt the implementation of allocate_memory() so
that it uses the host layout when called on the hwdom, via
find_unallocated_memory().

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v11:
- GUEST_RAM_BANKS instead of hardcoding the number of banks in allocate_memory()
- hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
- added a comment in allocate_memory() when skipping small banks
v10:
- fixed a compilation bug that happened when dom0less support was disabled
v9:
- no changes
v8:
- patch adapted to new changes to allocate_memory()
v7:
- allocate_memory() now uses the host layout when called on the hwdom
v6:
- new patch
---
 xen/arch/arm/dom0less-build.c           | 44 -----------
 xen/arch/arm/domain_build.c             | 97 ++++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain_build.h |  1 +
 3 files changed, 94 insertions(+), 48 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index d93a85434e..67b1503647 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
     return ( !dom0found && domUfound );
 }
 
-static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
-{
-    struct membanks *mem = kernel_info_get_mem(kinfo);
-    unsigned int i;
-    paddr_t bank_size;
-
-    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
-           /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo->unassigned_mem >> 20), d);
-
-    mem->nr_banks = 0;
-    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
-                               bank_size) )
-        goto fail;
-
-    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
-                               bank_size) )
-        goto fail;
-
-    if ( kinfo->unassigned_mem )
-        goto fail;
-
-    for( i = 0; i < mem->nr_banks; i++ )
-    {
-        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
-               d,
-               i,
-               mem->bank[i].start,
-               mem->bank[i].start + mem->bank[i].size,
-               /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(mem->bank[i].size >> 20));
-    }
-
-    return;
-
-fail:
-    panic("Failed to allocate requested domain memory."
-          /* Don't want format this as PRIpaddr (16 digit hex) */
-          " %ldKB unallocated. Fix the VMs configurations.\n",
-          (unsigned long)kinfo->unassigned_mem >> 10);
-}
-
 #ifdef CONFIG_VGICV2
 static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 {
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2c30792de8..2b8cba9b2f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
-#ifdef CONFIG_DOM0LESS_BOOT
 bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
                                     alloc_domheap_mem_cb cb, void *extra)
 {
@@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
 
     return true;
 }
-#endif
 
 /*
  * When PCI passthrough is available we want to keep the
@@ -1003,6 +1001,94 @@ out:
     return res;
 }
 
+void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
+{
+    struct membanks *mem = kernel_info_get_mem(kinfo);
+    unsigned int i, nr_banks = GUEST_RAM_BANKS;
+    paddr_t bank_start, bank_size;
+    struct membanks *hwdom_free_mem = NULL;
+    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
+
+    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
+           /* Don't want format this as PRIpaddr (16 digit hex) */
+           (unsigned long)(kinfo->unassigned_mem >> 20), d);
+
+    mem->nr_banks = 0;
+    /*
+     * Use host memory layout for hwdom. Only case for this is when LLC coloring
+     * is enabled.
+     */
+    if ( is_hardware_domain(d) )
+    {
+        ASSERT(llc_coloring_enabled);
+
+        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
+                                             NR_MEM_BANKS);
+        if ( !hwdom_free_mem )
+            goto fail;
+
+        hwdom_free_mem->max_banks = NR_MEM_BANKS;
+
+        if ( find_unallocated_memory(kinfo, hwdom_free_mem) )
+            goto fail;
+
+        nr_banks = hwdom_free_mem->nr_banks;
+    }
+
+    for ( i = 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
+    {
+        if ( is_hardware_domain(d) )
+        {
+            bank_start = hwdom_free_mem->bank[i].start;
+            bank_size = hwdom_free_mem->bank[i].size;
+
+            /*
+             * Skip banks that are too small. The first bank must contain
+             * dom0 kernel + ramdisk + dtb and 128 MB is the same limit used
+             * in allocate_memory_11().
+             */
+            if ( bank_size < min_t(paddr_t, kinfo->unassigned_mem, MB(128)) )
+                continue;
+        }
+        else
+        {
+            if ( i >= GUEST_RAM_BANKS )
+                goto fail;
+
+            bank_start = bankbase[i];
+            bank_size = banksize[i];
+        }
+
+        bank_size = MIN(bank_size, kinfo->unassigned_mem);
+        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
+            goto fail;
+    }
+
+    if ( kinfo->unassigned_mem )
+        goto fail;
+
+    for( i = 0; i < mem->nr_banks; i++ )
+    {
+        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
+               d,
+               i,
+               mem->bank[i].start,
+               mem->bank[i].start + mem->bank[i].size,
+               /* Don't want format this as PRIpaddr (16 digit hex) */
+               (unsigned long)(mem->bank[i].size >> 20));
+    }
+
+    xfree(hwdom_free_mem);
+    return;
+
+fail:
+    panic("Failed to allocate requested domain memory."
+          /* Don't want format this as PRIpaddr (16 digit hex) */
+          " %ldKB unallocated. Fix the VMs configurations.\n",
+          (unsigned long)kinfo->unassigned_mem >> 10);
+}
+
 static int __init handle_pci_range(const struct dt_device_node *dev,
                                    uint64_t addr, uint64_t len, void *data)
 {
@@ -1223,7 +1309,7 @@ int __init make_hypervisor_node(struct domain *d,
 
         ext_regions->max_banks = NR_MEM_BANKS;
 
-        if ( is_domain_direct_mapped(d) )
+        if ( domain_use_host_layout(d) )
         {
             if ( !is_iommu_enabled(d) )
                 res = find_unallocated_memory(kinfo, ext_regions);
@@ -2152,7 +2238,10 @@ static int __init construct_dom0(struct domain *d)
     /* type must be set before allocate_memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory_11(d, &kinfo);
+    if ( is_domain_direct_mapped(d) )
+        allocate_memory_11(d, &kinfo);
+    else
+        allocate_memory(d, &kinfo);
     find_gnttab_region(d, &kinfo);
 
     rc = process_shm_chosen(d, &kinfo);
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index e712afbc7f..5d77af2e8b 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -11,6 +11,7 @@ bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
                              alloc_domheap_mem_cb cb, void *extra);
 bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
                           paddr_t tot_size);
+void allocate_memory(struct domain *d, struct kernel_info *kinfo);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
 int make_chosen_node(const struct kernel_info *kinfo);
-- 
2.43.0


