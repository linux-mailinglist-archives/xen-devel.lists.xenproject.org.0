Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502BA8A9455
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:44:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708063.1106663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMRa-0004Hw-RS; Thu, 18 Apr 2024 07:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708063.1106663; Thu, 18 Apr 2024 07:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMRa-0004Ea-Mo; Thu, 18 Apr 2024 07:44:30 +0000
Received: by outflank-mailman (input) for mailman id 708063;
 Thu, 18 Apr 2024 07:44:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyP4=LX=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rxMKe-00046V-OO
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:37:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7bb438ca-fd56-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 09:37:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 044ED339;
 Thu, 18 Apr 2024 00:37:46 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55B893F64C;
 Thu, 18 Apr 2024 00:37:17 -0700 (PDT)
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
X-Inumbo-ID: 7bb438ca-fd56-11ee-94a3-07e782e9044d
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 12/12] xen/arm: List static shared memory regions as /memory nodes
Date: Thu, 18 Apr 2024 08:36:52 +0100
Message-Id: <20240418073652.3622828-13-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418073652.3622828-1-luca.fancellu@arm.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Xen is not exporting the static shared memory regions
to the device tree as /memory node, this commit is fixing this
issue.

Given that now make_memory_node needs a parameter 'struct kernel_info'
in order to call the new function shm_mem_node_fill_reg_range,
take the occasion to remove the unused struct domain parameter.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3:
 - removed previous patch that was merging the intervals, rebase
   changes.
v2:
 - try to use make_memory_node, don't add overlapping ranges of
   memory, commit message changed.
v1:
 - new patch
---
---
 xen/arch/arm/dom0less-build.c           |  2 +-
 xen/arch/arm/domain_build.c             | 34 +++++++++++++++++--------
 xen/arch/arm/include/asm/domain_build.h |  2 +-
 xen/arch/arm/include/asm/static-shmem.h | 15 +++++++++++
 xen/arch/arm/static-shmem.c             | 23 +++++++++++++++++
 5 files changed, 63 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 51cf03221d56..74f053c242f4 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -642,7 +642,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    ret = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
+    ret = make_memory_node(kinfo, addrcells, sizecells,
                            kernel_info_get_mem(kinfo));
     if ( ret )
         goto err;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 68532ddc084c..15f888169c4e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -756,15 +756,14 @@ int __init domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit)
     return fdt_begin_node(fdt, buf);
 }
 
-int __init make_memory_node(const struct domain *d,
-                            void *fdt,
-                            int addrcells, int sizecells,
-                            const struct membanks *mem)
+int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
+                            int sizecells, const struct membanks *mem)
 {
+    void *fdt = kinfo->fdt;
     unsigned int i;
     int res, reg_size = addrcells + sizecells;
     int nr_cells = 0;
-    __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
+    __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
     __be32 *cells;
 
     if ( mem->nr_banks == 0 )
@@ -797,14 +796,28 @@ int __init make_memory_node(const struct domain *d,
         if ( mem->bank[i].type == MEMBANK_STATIC_DOMAIN )
             continue;
 
-        dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
-                   i, start, start + size);
-
         nr_cells += reg_size;
         BUG_ON(nr_cells >= ARRAY_SIZE(reg));
         dt_child_set_range(&cells, addrcells, sizecells, start, size);
     }
 
+    /*
+     * static shared memory banks need to be listed as /memory node, so when
+     * this function is handling the normal memory, add the banks.
+     */
+    if ( mem == kernel_info_get_mem(kinfo) )
+        shm_mem_node_fill_reg_range(kinfo, reg, &nr_cells, addrcells,
+                                    sizecells);
+
+    for ( cells = reg, i = 0; cells < reg + nr_cells; i++, cells += reg_size )
+    {
+        u64 start = dt_read_number(cells, addrcells);
+        u64 size = dt_read_number(cells + addrcells, sizecells);
+
+        dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
+                   i, start, start + size);
+    }
+
     dt_dprintk("(reg size %d, nr cells %d)\n", reg_size, nr_cells);
 
     res = fdt_property(fdt, "reg", reg, nr_cells * sizeof(*reg));
@@ -1783,7 +1796,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         if ( res )
             return res;
 
-        res = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
+        res = make_memory_node(kinfo, addrcells, sizecells,
                                kernel_info_get_mem(kinfo));
         if ( res )
             return res;
@@ -1794,8 +1807,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
          */
         if ( reserved_mem->nr_banks > 0 )
         {
-            res = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                   reserved_mem);
+            res = make_memory_node(kinfo, addrcells, sizecells, reserved_mem);
             if ( res )
                 return res;
         }
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 026d975da28e..45936212ca21 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -14,7 +14,7 @@ int make_chosen_node(const struct kernel_info *kinfo);
 int make_cpus_node(const struct domain *d, void *fdt);
 int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
                          int addrcells, int sizecells);
-int make_memory_node(const struct domain *d, void *fdt, int addrcells,
+int make_memory_node(const struct kernel_info *kinfo, int addrcells,
                      int sizecells, const struct membanks *mem);
 int make_psci_node(void *fdt);
 int make_timer_node(const struct kernel_info *kinfo);
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index 7495a91e7a31..3b6569e5703f 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -3,10 +3,15 @@
 #ifndef __ASM_STATIC_SHMEM_H_
 #define __ASM_STATIC_SHMEM_H_
 
+#include <xen/types.h>
 #include <asm/kernel.h>
+#include <asm/setup.h>
 
 #ifdef CONFIG_STATIC_SHM
 
+/* Worst case /memory node reg element: (addrcells + sizecells) */
+#define DT_MEM_NODE_REG_RANGE_SIZE ((NR_MEM_BANKS + NR_SHMEM_BANKS) * 4)
+
 int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
                           int sizecells);
 
@@ -37,8 +42,14 @@ int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
 int make_shm_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
                               int sizecells);
 
+void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo, __be32 *reg,
+                                 int *nr_cells, int addrcells, int sizecells);
+
 #else /* !CONFIG_STATIC_SHM */
 
+/* Worst case /memory node reg element: (addrcells + sizecells) */
+#define DT_MEM_NODE_REG_RANGE_SIZE (NR_MEM_BANKS * 4)
+
 static inline int make_resv_memory_node(const struct kernel_info *kinfo,
                                         int addrcells, int sizecells)
 {
@@ -86,6 +97,10 @@ static inline int make_shm_resv_memory_node(const struct kernel_info *kinfo,
     return 0;
 }
 
+static inline void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
+                                               __be32 *reg, int *nr_cells,
+                                               int addrcells, int sizecells) {};
+
 #endif /* CONFIG_STATIC_SHM */
 
 #endif /* __ASM_STATIC_SHMEM_H_ */
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index c85f60dd1bf7..07c93a820508 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/rangeset.h>
 #include <xen/sched.h>
@@ -668,6 +669,28 @@ int __init remove_shm_holes_for_domU(const struct kernel_info *kinfo,
     return res;
 }
 
+void __init shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
+                                        __be32 *reg, int *nr_cells,
+                                        int addrcells, int sizecells)
+{
+    const struct membanks *mem = &kinfo->shm_mem.common;
+    unsigned int i;
+    __be32 *cells;
+
+    BUG_ON(!nr_cells || !reg);
+
+    cells = &reg[*nr_cells];
+    for ( i = 0; i < mem->nr_banks; i++ )
+    {
+        u64 start = mem->bank[i].start;
+        u64 size = mem->bank[i].size;
+
+        *nr_cells += addrcells + sizecells;
+        BUG_ON(*nr_cells >= DT_MEM_NODE_REG_RANGE_SIZE);
+        dt_child_set_range(&cells, addrcells, sizecells, start, size);
+    }
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


