Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574208794C3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:04:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691818.1078290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nZ-0006yx-KZ; Tue, 12 Mar 2024 13:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691818.1078290; Tue, 12 Mar 2024 13:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nZ-0006tl-ER; Tue, 12 Mar 2024 13:04:05 +0000
Received: by outflank-mailman (input) for mailman id 691818;
 Tue, 12 Mar 2024 13:04:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91vH=KS=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rk1nX-0004WU-Dj
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:04:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ff012a35-e070-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 14:04:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7428715A1;
 Tue, 12 Mar 2024 06:04:38 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4B2E3F762;
 Tue, 12 Mar 2024 06:03:59 -0700 (PDT)
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
X-Inumbo-ID: ff012a35-e070-11ee-a1ee-f123f15fe8a2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH 09/11] xen/arm: remove shm holes for extended regions
Date: Tue, 12 Mar 2024 13:03:29 +0000
Message-Id: <20240312130331.78418-10-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312130331.78418-1-luca.fancellu@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

Static shared memory acts as reserved memory in guest, so it shall be
excluded from extended regions.

Extended regions are taken care of under three different scenarios:
normal DomU, direct-map domain with iommu on, and direct-map domain
with iommu off.

For normal DomU, we create a new function "remove_shm_holes_for_domU",
to firstly transfer original outputs into the format of
"struct rangeset", then use "remove_shm_from_rangeset" to remove static
shm from them.

For direct-map domain with iommu on, after we get guest shm info from "kinfo",
we use "remove_shm_from_rangeset" to remove static shm.

For direct-map domain with iommu off, as static shm has already been taken
care of through reserved memory banks, we do nothing.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v1:
 - Rework of https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-8-Penny.Zheng@arm.com/
---
 xen/arch/arm/domain_build.c             | 16 ++++-
 xen/arch/arm/include/asm/domain_build.h |  2 +
 xen/arch/arm/include/asm/static-shmem.h | 18 ++++++
 xen/arch/arm/static-shmem.c             | 86 +++++++++++++++++++++++++
 4 files changed, 119 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9fad9e8b2c40..740c483ea2db 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -817,8 +817,8 @@ int __init make_memory_node(const struct domain *d,
     return res;
 }
 
-static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
-                                  void *data)
+int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
+                           void *data)
 {
     struct membanks *ext_regions = data;
     paddr_t start, size;
@@ -969,6 +969,8 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
  * - MMIO
  * - Host RAM
  * - PCI aperture
+ * - Static shared memory regions, which are described by special property
+ *   "xen,domain-shared-memory-v1"
  */
 static int __init find_memory_holes(const struct kernel_info *kinfo,
                                     struct membanks *ext_regions)
@@ -985,6 +987,11 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     if ( !mem_holes )
         return -ENOMEM;
 
+    /* Remove static shared memory regions */
+    res = remove_shm_from_rangeset(kinfo, mem_holes);
+    if ( res )
+        goto out;
+
     /* Start with maximum possible addressable physical memory range */
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
@@ -1089,7 +1096,10 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
         res = 0;
     }
 
-    return res;
+    if ( res )
+        return res;
+
+    return remove_shm_holes_for_domU(kinfo, ext_regions);
 }
 
 int __init make_hypervisor_node(struct domain *d,
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index a6f276cc4263..026d975da28e 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -51,6 +51,8 @@ static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo)
 int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
 #endif
 
+int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
+
 #endif
 
 /*
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index c6fac9906656..2f70aed53ac7 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -29,6 +29,12 @@ void early_print_info_shmem(void);
 
 void init_sharedmem_pages(void);
 
+int remove_shm_from_rangeset(const struct kernel_info *kinfo,
+                             struct rangeset *rangeset);
+
+int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
+                              struct membanks *ext_regions);
+
 #else /* !CONFIG_STATIC_SHM */
 
 static inline int make_resv_memory_node(const struct domain *d,
@@ -61,6 +67,18 @@ static inline void early_print_info_shmem(void) {};
 
 static inline void init_sharedmem_pages(void) {};
 
+static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
+                                           struct rangeset *rangeset)
+{
+    return 0;
+}
+
+static inline int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
+                                            struct membanks *ext_regions)
+{
+    return 0;
+}
+
 #endif /* CONFIG_STATIC_SHM */
 
 #endif /* __ASM_STATIC_SHMEM_H_ */
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 6143f52cb991..b3e2105dd3f2 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/libfdt/libfdt.h>
+#include <xen/rangeset.h>
 #include <xen/sched.h>
 
 #include <asm/domain_build.h>
@@ -564,6 +565,91 @@ void __init init_sharedmem_pages(void)
         init_staticmem_bank(&shmem->bank[bank]);
 }
 
+int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
+                                    struct rangeset *rangeset)
+{
+    const struct membanks *shm_mem = &kinfo->shm_mem.common;
+    unsigned int i;
+
+    /* Remove static shared memory regions */
+    for ( i = 0; i < shm_mem->nr_banks; i++ )
+    {
+        paddr_t start, end;
+        int res;
+
+        start = shm_mem->bank[i].start;
+        end = shm_mem->bank[i].start + shm_mem->bank[i].size - 1;
+        res = rangeset_remove_range(rangeset, start, end);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
+                   start, end);
+            return -EINVAL;
+        }
+    }
+
+    return 0;
+}
+
+int __init remove_shm_holes_for_domU(const struct kernel_info *kinfo,
+                                     struct membanks *ext_regions)
+{
+    const struct membanks *shm_mem = &kinfo->shm_mem.common;
+    struct rangeset *guest_holes;
+    unsigned int i;
+    paddr_t start;
+    paddr_t end;
+    int res;
+
+    /* No static shared memory region. */
+    if ( shm_mem->nr_banks == 0 )
+        return 0;
+
+    dt_dprintk("Remove static shared memory holes for extended regions of DomU\n");
+
+    guest_holes = rangeset_new(NULL, NULL, 0);
+    if ( !guest_holes )
+        return -ENOMEM;
+
+    /* Copy extended regions sets into the rangeset */
+    for ( i = 0; i < ext_regions->nr_banks; i++ )
+    {
+        start = ext_regions->bank[i].start;
+        end = start + ext_regions->bank[i].size - 1;
+
+        res = rangeset_add_range(guest_holes, start, end);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
+                   start, end);
+            goto out;
+        }
+    }
+
+    /* Remove static shared memory regions */
+    res = remove_shm_from_rangeset(kinfo, guest_holes);
+    if ( res )
+        goto out;
+
+    i = ext_regions->nr_banks - 1;
+    start = ext_regions->bank[0].start;
+    end = ext_regions->bank[i].start + ext_regions->bank[i].size - 1;
+
+    /* Reset original extended regions to hold new value */
+    ext_regions->nr_banks = 0;
+    res = rangeset_report_ranges(guest_holes, start, end, add_ext_regions,
+                                 ext_regions);
+    if ( res )
+        ext_regions->nr_banks = 0;
+    else if ( !ext_regions->nr_banks )
+        res = -ENOENT;
+
+ out:
+    rangeset_destroy(guest_holes);
+
+    return res;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


