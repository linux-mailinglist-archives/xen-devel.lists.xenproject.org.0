Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E509AFEE5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 11:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825707.1240023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Gy3-0006KS-V2; Fri, 25 Oct 2024 09:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825707.1240023; Fri, 25 Oct 2024 09:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Gy3-0006Hd-Qm; Fri, 25 Oct 2024 09:50:51 +0000
Received: by outflank-mailman (input) for mailman id 825707;
 Fri, 25 Oct 2024 09:50:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3YV=RV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1t4Gy1-0005WM-Ex
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 09:50:49 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cfd4f0c-92b6-11ef-a0bf-8be0dac302b0;
 Fri, 25 Oct 2024 11:50:48 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c9454f3bfaso2075309a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 02:50:48 -0700 (PDT)
Received: from carlo-ubuntu.home
 (dynamic-adsl-94-34-131-227.clienti.tiscali.it. [94.34.131.227])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629e17dsm446938a12.34.2024.10.25.02.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 02:50:47 -0700 (PDT)
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
X-Inumbo-ID: 9cfd4f0c-92b6-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1729849848; x=1730454648; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlFDDa4ZrFLlxW+3Ne0OFz0TY2bWLtIk8s4XXnwOgUE=;
        b=fgFqoLUhH7yKwSUqTsOMknfrgXaogXC/UWRQioCPMlZL/U/8lN4WDW4qBj6ppIQ9zl
         /ThWqtSzrr4/auKETCcwgqnXALHzxYcq495kQbKZMWT0qd6s2cir1oCDq2H1ig9vnOjw
         Baj+mhThfzhf92SstMGCk3awzrvJVFYMyHr/4oitS7IHf3OByWdWc8WO0Defqv+2jJLP
         z7QW98DELl3MyOFYbpFfQdIqVSsyapxWGY9eyRGxu99/wJ+e8/S9M3jY+SE9KIWrqoO0
         9EXIhrPAdJyy5Bh8UMJvQIU7YV9jtHKqLG2NBtfmeT3wQJJk0qoDDnIqg9bVyLQ+bRzx
         0Tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849848; x=1730454648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlFDDa4ZrFLlxW+3Ne0OFz0TY2bWLtIk8s4XXnwOgUE=;
        b=pEkkyyLTvrJCCrgbmJYSqzGKMkQ3dBrOv5MT0mEa9RFW69q4yhQdAqL45tjY5e5Ar7
         vBXgyd3H+PfGHpRG+xj+KSx+S0BmEulk3GTGKamDh1kbXoFmdhXaUfOQKx+3BEHZQng5
         79UnAmtwwCp4yWywGWXCHkvsFMvSoOenM7tOIquTsK5SCQbxZR60/vnMu6pZfgzm9MCm
         CUohe+Q+ScWB0aA6KxIhJs6lE8XbkYHcaH48cfDHRMB6xykwdyILbzth7tGNOnhB00wa
         hDkHh90jJOLnZQHcN6t8opR3N/5Sm8tnN/CYLTyS8LfNi/O+OrluoYvYP875xy80Jko2
         h5NA==
X-Gm-Message-State: AOJu0YzXBoKOT4Woqv24pchLqFmrrjpwghwDTKnSMOXyp8fSHMD68lMx
	g0Xm6+s5dyBfgtn8WQiJJNxu8OZR7rS3CVNa2RISAzDW2U5SVqwkRd9z8OZhdkIO0DhX0l+JjxY
	v9aY=
X-Google-Smtp-Source: AGHT+IGxAYmK0QJKqvmeb5tU723EYBX93t201MQkqBzPZDKjqdVKEpylh1KM7X9tWhPVW5XHS5R85w==
X-Received: by 2002:a05:6402:3906:b0:5c9:813a:b1b3 with SMTP id 4fb4d7f45d1cf-5cb8b2a94f7mr8445936a12.35.1729849847920;
        Fri, 25 Oct 2024 02:50:47 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 03/13] xen/arm: permit non direct-mapped Dom0 construction
Date: Fri, 25 Oct 2024 11:50:04 +0200
Message-ID: <20241025095014.42376-4-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
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
v9:
- no changes
v8:
- patch adapted to new changes to allocate_memory()
v7:
- allocate_memory() now uses the host layout when called on the hwdom
v6:
- new patch
---
 xen/arch/arm/dom0less-build.c           | 44 ------------
 xen/arch/arm/domain_build.c             | 96 ++++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain_build.h |  1 +
 3 files changed, 94 insertions(+), 47 deletions(-)

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
index 2c30792de8..71bdc2b89c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -456,6 +456,7 @@ bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
 
     return true;
 }
+#endif
 
 static bool __init guest_map_pages(struct domain *d, struct page_info *pg,
                                    unsigned int order, void *extra)
@@ -508,7 +509,6 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
 
     return true;
 }
-#endif
 
 /*
  * When PCI passthrough is available we want to keep the
@@ -1003,6 +1003,93 @@ out:
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
@@ -1223,7 +1310,7 @@ int __init make_hypervisor_node(struct domain *d,
 
         ext_regions->max_banks = NR_MEM_BANKS;
 
-        if ( is_domain_direct_mapped(d) )
+        if ( domain_use_host_layout(d) )
         {
             if ( !is_iommu_enabled(d) )
                 res = find_unallocated_memory(kinfo, ext_regions);
@@ -2152,7 +2239,10 @@ static int __init construct_dom0(struct domain *d)
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


