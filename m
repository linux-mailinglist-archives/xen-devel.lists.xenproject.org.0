Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C34C3806A58
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 10:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649019.1013296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAns0-0005g4-Qz; Wed, 06 Dec 2023 09:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649019.1013296; Wed, 06 Dec 2023 09:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAns0-0005ck-Ll; Wed, 06 Dec 2023 09:07:04 +0000
Received: by outflank-mailman (input) for mailman id 649019;
 Wed, 06 Dec 2023 09:07:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4rn=HR=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1rAnry-0002Yw-Cj
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 09:07:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d061339e-9416-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 10:07:00 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E139D139F;
 Wed,  6 Dec 2023 01:07:45 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E8F2C3F762;
 Wed,  6 Dec 2023 01:06:56 -0800 (PST)
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
X-Inumbo-ID: d061339e-9416-11ee-98e5-6d05b1d4d9a1
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org,
	michal.orzel@amd.com
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v5 07/11] xen/arm: remove shm holes for extended regions
Date: Wed,  6 Dec 2023 17:06:19 +0800
Message-Id: <20231206090623.1932275-8-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206090623.1932275-1-Penny.Zheng@arm.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static shared memory acts as reserved memory in guest, so it shall be
excluded from extended regions.

Extended regions are taken care of under three different scenarios:
normal DomU, direct-map domain with iommu on, and direct-map domain
with iommu off.

For normal DomU, we create a new function "remove_shm_holes_for_domU", to
firstly transfer original outputs into the format of "struct rangeset",
then use "remove_shm_from_rangeset" to remove static shm from them.

For direct-map domain with iommu on, after we get guest shm info from "kinfo",
we use "remove_shm_from_rangeset" to remove static shm.

For direct-map domain with iommu off, as static shm has already been taken
care of through reserved memory banks, we do nothing.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>

---
v1 -> v2:
- new commit
---
v2 -> v3:
- error out non-zero res before remove_shm_holes_for_domU
- rebase
---
v3 -> v4:
rebase and no change
---
v4 -> v5:
rebase and no change
---
 xen/arch/arm/domain_build.c             | 19 +++++-
 xen/arch/arm/include/asm/domain_build.h |  2 +
 xen/arch/arm/include/asm/static-shmem.h | 17 +++++
 xen/arch/arm/static-shmem.c             | 83 +++++++++++++++++++++++++
 4 files changed, 118 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c58996e3e9..e040f8a6d9 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -887,8 +887,8 @@ int __init make_memory_node(const struct domain *d,
     return res;
 }
 
-static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
-                                  void *data)
+int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
+                           void *data)
 {
     struct meminfo *ext_regions = data;
     paddr_t start, size;
@@ -1062,6 +1062,8 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
  * - MMIO
  * - Host RAM
  * - PCI aperture
+ * - Static shared memory regions, which are described by special property
+ *   "xen,static-shm"
  */
 static int __init find_memory_holes(const struct kernel_info *kinfo,
                                     struct meminfo *ext_regions)
@@ -1078,6 +1080,14 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     if ( !mem_holes )
         return -ENOMEM;
 
+    /* Remove static shared memory regions */
+    if ( kinfo->shminfo.nr_banks != 0 )
+    {
+        res = remove_shm_from_rangeset(kinfo, mem_holes);
+        if ( res )
+            goto out;
+    }
+
     /* Start with maximum possible addressable physical memory range */
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
@@ -1180,7 +1190,10 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
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
index 1b75a4c6a8..0433e76e68 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -56,6 +56,8 @@ bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
                              void *mem, enum meminfo_type type);
 #endif
 
+int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
+
 #endif
 
 /*
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index a67445cec8..d149985291 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -27,6 +27,12 @@ int process_shm_node(const void *fdt, int node, uint32_t address_cells,
 void retrieve_shm_meminfo(void *mem, unsigned int *max_mem_banks,
                           struct membank **bank,
                           unsigned int **nr_banks);
+
+int remove_shm_from_rangeset(const struct kernel_info *kinfo,
+                             struct rangeset *rangeset);
+
+int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
+                              struct meminfo *orig_ext);
 #else /* !CONFIG_STATIC_SHM */
 
 static inline int make_resv_memory_node(const struct domain *d, void *fdt,
@@ -55,6 +61,17 @@ static inline int process_shm_node(const void *fdt, int node,
     return -EINVAL;
 }
 
+static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
+                                           struct rangeset *rangeset)
+{
+    return 0;
+}
+
+static inline int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
+                                            struct meminfo *orig_ext)
+{
+    return 0;
+}
 #endif /* CONFIG_STATIC_SHM */
 
 #endif /* __ASM_STATIC_SHMEM_H_ */
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index b04e58172b..a06949abaf 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/libfdt/libfdt.h>
+#include <xen/rangeset.h>
 #include <xen/sched.h>
 
 #include <asm/domain_build.h>
@@ -818,6 +819,88 @@ int __init make_resv_memory_node(const struct domain *d, void *fdt,
     return res;
 }
 
+int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
+                                    struct rangeset *rangeset)
+{
+    unsigned int i;
+
+    /* Remove static shared memory regions */
+    for ( i = 0; i < kinfo->shminfo.nr_banks; i++ )
+    {
+        struct membank membank = kinfo->shminfo.bank[i].membank;
+        paddr_t start, end;
+        int res;
+
+        start = membank.start;
+        end = membank.start + membank.size - 1;
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
+                                     struct meminfo *orig_ext)
+{
+    struct rangeset *guest_holes;
+    unsigned int i = 0, tail;
+    int res;
+    paddr_t start, end;
+
+    /* No static shared memory region. */
+    if ( kinfo->shminfo.nr_banks == 0 )
+        return 0;
+
+    dt_dprintk("Remove static shared memory holes for extended regions of DomU\n");
+
+    guest_holes = rangeset_new(NULL, NULL, 0);
+    if ( !guest_holes )
+        return -ENOMEM;
+
+    for ( ; i < orig_ext->nr_banks; i++ )
+    {
+        start = orig_ext->bank[i].start;
+        end = start + orig_ext->bank[i].size - 1;
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
+    tail = orig_ext->nr_banks - 1;
+    start = orig_ext->bank[0].start;
+    end = orig_ext->bank[tail].start + orig_ext->bank[tail].size - 1;
+
+    /* Reset original extended regions to hold new value */
+    orig_ext->nr_banks = 0;
+    res = rangeset_report_ranges(guest_holes, start, end,
+                                 add_ext_regions, orig_ext);
+    if ( res )
+        orig_ext->nr_banks = 0;
+    else if ( !orig_ext->nr_banks )
+        res = -ENOENT;
+
+out:
+    rangeset_destroy(guest_holes);
+
+    return res;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


