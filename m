Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1D58B9F09
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 18:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715946.1117936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zih-0006cN-CW; Thu, 02 May 2024 16:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715946.1117936; Thu, 02 May 2024 16:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zih-0006an-6X; Thu, 02 May 2024 16:55:43 +0000
Received: by outflank-mailman (input) for mailman id 715946;
 Thu, 02 May 2024 16:55:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/Nh=MF=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s2Zif-0006Lf-Bn
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 16:55:41 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce959dcb-08a4-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 18:55:40 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a4702457ccbso1157253466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 09:55:40 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 mq30-20020a170907831e00b00a5987fbfb83sm29103ejc.152.2024.05.02.09.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 09:55:39 -0700 (PDT)
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
X-Inumbo-ID: ce959dcb-08a4-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1714668939; x=1715273739; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okh8duaE+EFMPEO4FhT3MzEyU6q3kS1zoVKRzTYnIo0=;
        b=YsLw4RvwdV3j1BdDTCzJ0VbrZynYZIzldbHHf4L9M7usWrlUNVQSWrWEU+XUG/sXiF
         Da63TUupIvjGKe0zFYseJdeIklpHgaeFFvC8TePKZOgXvPd5Z0Hd3R35EbHq8hLLxSnn
         /UG79/8YwLttDgQn8tb+IiW3SdTU6LaVl8eum5ocF58e0OHqQZFCvAm8SzNqWxdxQCEL
         5k2QIeL+7ryXu7/H+V/dhX1v5UX6+NFzyGP9fZHpaNXOJazG9QBCKdW7bn3fSagCu9GX
         MrkUKnTzecoIYgJ/N2/pTrBsGzO0tBb0TaGfHHcKwu5ZkaLO3W8KzpeNffKplPRBskUH
         8I2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714668939; x=1715273739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okh8duaE+EFMPEO4FhT3MzEyU6q3kS1zoVKRzTYnIo0=;
        b=v7h9OmUe9XXsbsYAXBs0SQh597BoVhnbBqU87k+ktrTF/TGU5BT+SbZlecz6FxjNw1
         /dXqW/5kiJAF0+lAtae2kXRFUNV/4vTX+rbAJQylRRNbH/TBM7e2g09Z1n99dnTdAUZQ
         LqHHIzH3qLxoYB++DBbijoQTA+Z3fbbm2kk9PfsHhdnIKiK9tujPwsjknQ+10NWoNVwV
         GKcdYCKdvz00EinepZ8E8cM6h22kRWiGKz1URkUX3BQSKtWES4E65tp2xHhZNy3YJOFG
         prPJHTD8R6DMHzE5Hs5rTeXQNI3YyhMXGcjoAMbWRIDB8AVHztRtBu0XAqHHer2wKEz3
         +mAw==
X-Gm-Message-State: AOJu0YwEEbqCaapfzjXD3WYMvZNoygcjckW1XWV+RI+OKhus26+JoLiu
	dZZUg+IqjM81+UBxezxX1v2kboefuerNBCFeVrvG93/zV/O9IkH8HeghW+XCraGXZlkEcH91Mi9
	Y
X-Google-Smtp-Source: AGHT+IGHjOT87G7UTWtB/PiIPUk65gmJVKYGc/SIGIKgPC0DhCwF2tIf+GoOIE1hkPBxW5p8pnGwVw==
X-Received: by 2002:a17:906:110c:b0:a59:719d:2735 with SMTP id h12-20020a170906110c00b00a59719d2735mr54793eja.64.1714668939702;
        Thu, 02 May 2024 09:55:39 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 03/13] xen/arm: permit non direct-mapped Dom0 construction
Date: Thu,  2 May 2024 18:55:23 +0200
Message-Id: <20240502165533.319988-4-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
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
index ca7519cf3b..c6bc4ee59c 100644
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
-    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
-                               bank_size) )
-        goto fail;
-
-    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
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
index 0784e4c5e3..ba2e48ecc7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
-#ifdef CONFIG_DOM0LESS_BOOT
 bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
                                  gfn_t sgfn, paddr_t tot_size)
 {
@@ -479,7 +478,6 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
 
     return true;
 }
-#endif
 
 /*
  * When PCI passthrough is available we want to keep the
@@ -968,6 +966,94 @@ out:
     return res;
 }
 
+void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
+{
+    struct membanks *mem = kernel_info_get_mem(kinfo);
+    unsigned int i, nr_banks = 2;
+    paddr_t bank_start, bank_size;
+    struct membanks *hwdom_ext_regions = NULL;
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
+        hwdom_ext_regions = xzalloc_flex_struct(struct membanks, bank,
+                                                NR_MEM_BANKS);
+        if ( !hwdom_ext_regions )
+            goto fail;
+        hwdom_ext_regions->max_banks = NR_MEM_BANKS;
+
+        if ( find_unallocated_memory(kinfo, hwdom_ext_regions) )
+            goto fail;
+
+        nr_banks = hwdom_ext_regions->nr_banks;
+    }
+
+    for ( i = 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
+    {
+        if ( is_hardware_domain(d) )
+        {
+            bank_start = hwdom_ext_regions->bank[i].start;
+            bank_size = hwdom_ext_regions->bank[i].size;
+
+            if ( bank_size < min_t(paddr_t, kinfo->unassigned_mem, MB(128)) )
+                continue;
+        }
+        else
+        {
+            if ( i == 0 )
+            {
+                bank_start = GUEST_RAM0_BASE;
+                bank_size = GUEST_RAM0_SIZE;
+            }
+            else if ( i == 1 )
+            {
+                bank_start = GUEST_RAM1_BASE;
+                bank_size = GUEST_RAM1_SIZE;
+            }
+            else
+                goto fail;
+        }
+
+        bank_size = MIN(bank_size, kinfo->unassigned_mem);
+        if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(bank_start),
+                                   bank_size) )
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
+    xfree(hwdom_ext_regions);
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
@@ -1188,7 +1274,7 @@ int __init make_hypervisor_node(struct domain *d,
 
         ext_regions->max_banks = NR_MEM_BANKS;
 
-        if ( is_domain_direct_mapped(d) )
+        if ( domain_use_host_layout(d) )
         {
             if ( !is_iommu_enabled(d) )
                 res = find_unallocated_memory(kinfo, ext_regions);
@@ -2117,7 +2203,10 @@ static int __init construct_dom0(struct domain *d)
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
index 45936212ca..943a6d438e 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -8,6 +8,7 @@ typedef __be32 gic_interrupt_t[3];
 
 bool allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
                           gfn_t sgfn, paddr_t tot_size);
+void allocate_memory(struct domain *d, struct kernel_info *kinfo);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
 int make_chosen_node(const struct kernel_info *kinfo);
-- 
2.34.1


