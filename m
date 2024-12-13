Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749359F1217
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856849.1269397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Wk-0004lN-Ni; Fri, 13 Dec 2024 16:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856849.1269397; Fri, 13 Dec 2024 16:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Wk-0004jB-KC; Fri, 13 Dec 2024 16:28:30 +0000
Received: by outflank-mailman (input) for mailman id 856849;
 Fri, 13 Dec 2024 16:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM8Wi-0003wR-PW
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:28:28 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 486a3e7c-b96f-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 17:28:28 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso386860866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 08:28:28 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech ([193.207.202.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa673474d96sm841759266b.96.2024.12.13.08.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 08:28:27 -0800 (PST)
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
X-Inumbo-ID: 486a3e7c-b96f-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734107307; x=1734712107; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OETE9xbD98S4584ewKKfCkxeqyNzsOb/5grRyUywQEk=;
        b=DVmwM9QxMz2hwnnC5TlNNIHOacwDOpQ2ynqiwqaxu+/e47B75smnNHy6KEsQoBl/Lb
         Mn5sA9U7fhVCnYgwD9q9uKjQKbbKiNC9AuJUhAUmZaqAjkMTCt4HY+6+3Lu8ttav7R/6
         6F7wFySzqBSbE7sQfoACri/Qg1unFy5BCPre6hXOvJefKeKZ51W6QbqhiLq4dNCpBgLk
         QO/K1DSvPsVIANDtxl9B/uRqOE/w1b6tS/HdCA9ztRAgfdOtYiNJDQalvdsdElxhbL2m
         Qfgsd/HuY1rsfG8LR8SIFGbH02z+fBU4fuVh5UfsMJ3lhJgcRod4YH4G6yc0kJkf8zpw
         ApYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107307; x=1734712107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OETE9xbD98S4584ewKKfCkxeqyNzsOb/5grRyUywQEk=;
        b=fg+H0PXBThY7cCg/1pzwtHgXtexgwbH3NUbYykj/6H4gYJDETT1kEiXcUxkfbckUOO
         5TXbIPN5lNLOxVGbMA+gxI98JF3CS9H+37X3CDAeOIwESJXTucwPKNmEaJVCUVURL0hX
         NP13N7xR1w3ZYcAgUf34F8XivfyCYuW7FLBZZGZTRXg3kpbCQd5erqpUKH1YOH8VH5MQ
         GxwOJAa6BIz3Xx7xfDXRmX38mwXFcEyOxOqMJPiKzrDAmSpHCd+1sy88bvbgtu4kZtOU
         W/9WkwjuD6tfDskf2U6gw46zMQUbpHzkp0rZh0O8Au2zf1eU8xP4XKIWI4sQz7ziA2z3
         ZFtQ==
X-Gm-Message-State: AOJu0Yw37dPCN/7jhfmbLw+cTaPzWh2yRBox/V6naPGbRTje+Vq4G/ax
	l5o7ZQMeXWHg3aNqJAILK94jqBaaf1C9+gYzlzhleCLlBtQYs8yU2mN/9ZlH4ELqbt46Kvz+VSf
	tNy8=
X-Gm-Gg: ASbGncsy22Xt2z89em1h/rdfw0n89Nhb0t5oyT/syiNYdBqxNZ/Lr92X55JaNfVVOd7
	eySH/F08olm+uQ2s/RnrgdqRrrtoNGkFtI6Qxt2PTsxtN9EIx/7r//Tn6rkj157zynGGyZPYOCq
	M2A20Jv1mF9s4kRuHLmdfi5FgQcaallgeGNxQGVoCJfOYlcDIs54D661575w3fjVWnxPJtvNeDc
	zchY5MRMz8ppgc81iiWqeig6oYbZsxex8BrjNPnQKDFe7IjZjMrlGjMX38JGTl5LAqOW2UNMvgs
	WeaGFFunFgIV9lxr
X-Google-Smtp-Source: AGHT+IEcx2gZe58o1gLiYKKiwDXlXjo9jbU9N+hkp7pJ6yTyKRURflePtFEgjWjcbIG7Ja4cNVJLFg==
X-Received: by 2002:a17:906:7952:b0:aa6:7438:2a30 with SMTP id a640c23a62f3a-aab779c7204mr448090766b.29.1734107307367;
        Fri, 13 Dec 2024 08:28:27 -0800 (PST)
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
Subject: [PATCH v12 03/12] xen/arm: permit non direct-mapped Dom0 construction
Date: Fri, 13 Dec 2024 17:28:06 +0100
Message-ID: <20241213162815.9196-4-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache coloring requires Dom0 not to be direct-mapped because of its non
contiguous mapping nature, so allocate_memory() is needed in this case.
8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
moved allocate_memory() in dom0less_build.c. In order to use it
in Dom0 construction bring it back to domain_build.c and declare it in
domain_build.h.

Adapt the implementation of allocate_memory() so that it uses the host
layout when called on the hwdom, via find_unallocated_memory(). Take the
opportunity to keep the parameter order consistent with
rangeset_report_ranges() and move the membanks struct after the callback
function in find_unallocated_memory().

Introduce add_hwdom_free_regions() callback to add hwdom banks in descending
order.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v12:
- used the new generic find_unallocated_memory()
- added add_hwdom_free_regions() callback
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
 xen/arch/arm/dom0less-build.c           |  44 -------
 xen/arch/arm/domain_build.c             | 164 +++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain_build.h |   4 +
 3 files changed, 161 insertions(+), 51 deletions(-)

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
index adf26f2778..bfcff99194 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2,6 +2,7 @@
 #include <xen/init.h>
 #include <xen/compile.h>
 #include <xen/lib.h>
+#include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/domain_page.h>
@@ -416,7 +417,6 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
-#ifdef CONFIG_DOM0LESS_BOOT
 bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
                                     alloc_domheap_mem_cb cb, void *extra)
 {
@@ -508,7 +508,6 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
 
     return true;
 }
-#endif
 
 /*
  * When PCI passthrough is available we want to keep the
@@ -900,6 +899,52 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
     return 0;
 }
 
+static int __init add_hwdom_free_regions(unsigned long s_gfn,
+                                         unsigned long e_gfn, void *data)
+{
+    struct membanks *free_regions = data;
+    paddr_t start, size;
+    paddr_t s = pfn_to_paddr(s_gfn);
+    paddr_t e = pfn_to_paddr(e_gfn);
+    unsigned int i, j;
+
+    if ( free_regions->nr_banks >= free_regions->max_banks )
+        return 0;
+
+    /*
+     * Both start and size of the free region should be 2MB aligned to
+     * potentially allow superpage mapping.
+     */
+    start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
+    if ( start > e )
+        return 0;
+
+    /*
+     * e is actually "end-1" because it is called by rangeset functions
+     * which are inclusive of the last address.
+     */
+    e += 1;
+    size = (e - start) & ~(SZ_2M - 1);
+
+    /* Find the insert position (descending order). */
+    for ( i = 0; i < free_regions->nr_banks ; i++)
+        if ( size > free_regions->bank[i].size )
+            break;
+
+    /* Move the other banks to make space. */
+    for ( j = free_regions->nr_banks; j > i ; j-- )
+    {
+        free_regions->bank[j].start = free_regions->bank[j - 1].start;
+        free_regions->bank[j].size = free_regions->bank[j - 1].size;
+    }
+
+    free_regions->bank[i].start = start;
+    free_regions->bank[i].size = size;
+    free_regions->nr_banks++;
+
+    return 0;
+}
+
 /*
  * Find unused regions of Host address space which can be exposed to domain
  * using the host memory layout. In order to calculate regions we exclude every
@@ -908,10 +953,10 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
 static int __init find_unallocated_memory(const struct kernel_info *kinfo,
                                           const struct membanks *mem_banks[],
                                           unsigned int nr_mem_banks,
-                                          struct membanks *free_regions,
                                           int (*cb)(unsigned long s_gfn,
                                                     unsigned long e_gfn,
-                                                    void *data))
+                                                    void *data),
+                                          struct membanks *free_regions)
 {
     const struct membanks *mem = bootinfo_get_mem();
     struct rangeset *unalloc_mem;
@@ -977,6 +1022,108 @@ out:
     return res;
 }
 
+void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
+{
+    struct membanks *mem = kernel_info_get_mem(kinfo);
+    unsigned int i, nr_banks = GUEST_RAM_BANKS;
+    struct membanks *hwdom_free_mem = NULL;
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
+        struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
+        /*
+         * Exclude the following regions:
+         * 1) Remove reserved memory
+         * 2) Grant table assigned to Dom0
+         */
+        const struct membanks *mem_banks[] = {
+            bootinfo_get_reserved_mem(),
+            gnttab,
+        };
+
+        ASSERT(llc_coloring_enabled);
+
+        if ( !gnttab )
+            goto fail;
+
+        gnttab->nr_banks = 1;
+        gnttab->bank[0].start = kinfo->gnttab_start;
+        gnttab->bank[0].size = kinfo->gnttab_start + kinfo->gnttab_size;
+
+        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
+                                             NR_MEM_BANKS);
+        if ( !hwdom_free_mem )
+            goto fail;
+
+        hwdom_free_mem->max_banks = NR_MEM_BANKS;
+
+        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
+                                     add_hwdom_free_regions, hwdom_free_mem) )
+            goto fail;
+
+        nr_banks = hwdom_free_mem->nr_banks;
+        xfree(gnttab);
+    }
+
+    for ( i = 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
+    {
+        paddr_t bank_start, bank_size;
+
+        if ( is_hardware_domain(d) )
+        {
+            bank_start = hwdom_free_mem->bank[i].start;
+            bank_size = hwdom_free_mem->bank[i].size;
+        }
+        else
+        {
+            const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
+            const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
+
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
@@ -1176,7 +1323,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
     gnttab->bank[0].size = kinfo->gnttab_size;
 
     res = find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
-                                  ext_regions, add_ext_regions);
+                                  add_ext_regions, ext_regions);
     xfree(gnttab);
 
     return res;
@@ -1235,7 +1382,7 @@ int __init make_hypervisor_node(struct domain *d,
 
         ext_regions->max_banks = NR_MEM_BANKS;
 
-        if ( is_domain_direct_mapped(d) )
+        if ( domain_use_host_layout(d) )
         {
             if ( !is_iommu_enabled(d) )
                 res = find_host_extended_regions(kinfo, ext_regions);
@@ -2164,8 +2311,11 @@ static int __init construct_dom0(struct domain *d)
     /* type must be set before allocate_memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory_11(d, &kinfo);
     find_gnttab_region(d, &kinfo);
+    if ( is_domain_direct_mapped(d) )
+        allocate_memory_11(d, &kinfo);
+    else
+        allocate_memory(d, &kinfo);
 
     rc = process_shm_chosen(d, &kinfo);
     if ( rc < 0 )
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index e712afbc7f..b0d646e173 100644
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
@@ -54,6 +55,9 @@ static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo)
 int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
 #endif
 
+typedef int (*add_free_regions_fn)(unsigned long s_gfn, unsigned long e_gfn,
+                                   void *data);
+
 int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
 
 #endif
-- 
2.43.0


