Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DC287CBBD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 11:59:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693750.1082229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hr-0001Ci-Fm; Fri, 15 Mar 2024 10:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693750.1082229; Fri, 15 Mar 2024 10:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hr-000172-Af; Fri, 15 Mar 2024 10:59:43 +0000
Received: by outflank-mailman (input) for mailman id 693750;
 Fri, 15 Mar 2024 10:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5Hq-0000xG-AC
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:42 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ef74117-e2bb-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 11:59:40 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so222892866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:40 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 en6-20020a17090728c600b00a465a012cf1sm1621493ejc.18.2024.03.15.03.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:59:39 -0700 (PDT)
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
X-Inumbo-ID: 1ef74117-e2bb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710500379; x=1711105179; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWLty+UmaFeSrZ8CDxzo05Ip09kKWG0NEp9+DODidks=;
        b=ldiOgj3xJn5axnXkIuNYwNxKrbZ+bFUu9GJBfYeMdTiJhLD9gtg0MTOhMJm78J50g4
         itTUfh3ZyzG0GEn3xH6Fg3rTmNDbGtLZkdttBvSlKbwEH/4PbQO6+EkgSp3tve2eqOLo
         SYpv1uCT55kSzwRGisaP3Ph4s8kbcsFmhUQrZKgk6gsuRIUa0CD8hxtqZrcHu70dJQ9H
         yIW3Tn0CRzhAZp3yaytDfCMEuHeMAIPJojxWKZni76W4ALhls/V8h8FkLXRwNlcO908K
         TN1BfpBNudXQRvTselnAzRQkpvV5Wk/M+UpWBmTROjemLbUVreOkqb0KhLBcxl4etYGj
         gIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500379; x=1711105179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWLty+UmaFeSrZ8CDxzo05Ip09kKWG0NEp9+DODidks=;
        b=S7A3t576kxJariIu06ce6unjzqHEGcilH8znFQwT+jifklbQlkYWgzq7izX8PM09O1
         mXU8L2HT/mqGAslPPPmR5VB6vR4N6p4QbMkgK07/lsfvexcqXBbm+TDDZHHzQehCawtY
         JLSwxtE0J4mwb9d4TF6k9avrbSqMFlNWxHfxQVrlps4p8Hmt+UajVG0c4AVeJ1YCBbZA
         PJo7rS53b5r6pTPXaCKQahrS+krLfyDbikl0nUUj4pinID1P9T4mFKWziR+7Jqy5fMZh
         NSYZboq0F13k4f3mbOT0cr6u+/SAdIycBBLg0tjK0N8SLoQnlMvsISlvTF/rJAk1fFT+
         f/hg==
X-Gm-Message-State: AOJu0YzEzH0uklMwB+F343MCHMxGzw1jj+zoVwQt16Kh5AjmceIfJIQC
	PW3BtGoDI9h9/Sw3NsAHwc1I4Jn8jM3PerNanOOZSl3xClzR/Xw+drPDdcw/kOiTrK3DZo+Y1Nq
	2q6Y=
X-Google-Smtp-Source: AGHT+IGyDlyKdPdWuWCjfVqFNKccm5QWYNVLFSk/SQKMB8nHSuqPqqc0RsTIGPi//EncToi9WPg4iw==
X-Received: by 2002:a17:906:80da:b0:a46:8c40:dabf with SMTP id a26-20020a17090680da00b00a468c40dabfmr666865ejx.31.1710500379690;
        Fri, 15 Mar 2024 03:59:39 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 03/14] xen/arm: permit non direct-mapped Dom0 construction
Date: Fri, 15 Mar 2024 11:58:51 +0100
Message-Id: <20240315105902.160047-4-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
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
v7:
- allocate_memory() now uses the host layout when called on the hwdom
v6:
- new patch
---
 xen/arch/arm/dom0less-build.c           | 43 -----------
 xen/arch/arm/domain_build.c             | 99 ++++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain_build.h |  1 +
 3 files changed, 96 insertions(+), 47 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 1142f7f74a..992080e61a 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -49,49 +49,6 @@ bool __init is_dom0less_mode(void)
     return ( !dom0found && domUfound );
 }
 
-static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
-{
-    unsigned int i;
-    paddr_t bank_size;
-
-    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
-           /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo->unassigned_mem >> 20), d);
-
-    kinfo->mem.nr_banks = 0;
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
-    for( i = 0; i < kinfo->mem.nr_banks; i++ )
-    {
-        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
-               d,
-               i,
-               kinfo->mem.bank[i].start,
-               kinfo->mem.bank[i].start + kinfo->mem.bank[i].size,
-               /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(kinfo->mem.bank[i].size >> 20));
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
index 085d88671e..d21be2c57b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -415,7 +415,6 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
-#ifdef CONFIG_DOM0LESS_BOOT
 bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
                                  gfn_t sgfn, paddr_t tot_size)
 {
@@ -477,7 +476,96 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
 
     return true;
 }
-#endif
+
+/* Forward declaration */
+static int __init find_unallocated_memory(const struct kernel_info *kinfo,
+                                          struct meminfo *ext_regions);
+
+void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
+{
+    unsigned int i = 0;
+    unsigned int nr_banks = 2;
+    paddr_t bank_start, bank_size;
+    struct meminfo *hwdom_free_mem = NULL;
+
+    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
+           /* Don't want format this as PRIpaddr (16 digit hex) */
+           (unsigned long)(kinfo->unassigned_mem >> 20), d);
+
+    kinfo->mem.nr_banks = 0;
+    /*
+     * Use host memory layout for hwdom. Only case for this is when LLC coloring
+     * is enabled.
+     */
+    if ( is_hardware_domain(d) )
+    {
+        ASSERT(llc_coloring_enabled);
+
+        hwdom_free_mem = xzalloc(struct meminfo);
+        if ( !hwdom_free_mem )
+            goto fail;
+
+        if ( find_unallocated_memory(kinfo, hwdom_free_mem) )
+            goto fail;
+
+        nr_banks = hwdom_free_mem->nr_banks;
+    }
+
+    for ( ; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
+    {
+        if ( is_hardware_domain(d) )
+        {
+            bank_start = hwdom_free_mem->bank[i].start;
+            bank_size = hwdom_free_mem->bank[i].size;
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
+    for( i = 0; i < kinfo->mem.nr_banks; i++ )
+    {
+        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
+               d,
+               i,
+               kinfo->mem.bank[i].start,
+               kinfo->mem.bank[i].start + kinfo->mem.bank[i].size,
+               /* Don't want format this as PRIpaddr (16 digit hex) */
+               (unsigned long)(kinfo->mem.bank[i].size >> 20));
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
 
 /*
  * When PCI passthrough is available we want to keep the
@@ -1161,7 +1249,7 @@ int __init make_hypervisor_node(struct domain *d,
         if ( !ext_regions )
             return -ENOMEM;
 
-        if ( is_domain_direct_mapped(d) )
+        if ( domain_use_host_layout(d) )
         {
             if ( !is_iommu_enabled(d) )
                 res = find_unallocated_memory(kinfo, ext_regions);
@@ -2073,7 +2161,10 @@ static int __init construct_dom0(struct domain *d)
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
index da9e6025f3..b8e171e5cc 100644
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


