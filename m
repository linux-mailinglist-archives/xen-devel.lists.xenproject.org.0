Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED290A07177
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 10:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867927.1279466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVoq6-0006ZK-GW; Thu, 09 Jan 2025 09:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867927.1279466; Thu, 09 Jan 2025 09:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVoq6-0006Xk-D6; Thu, 09 Jan 2025 09:28:30 +0000
Received: by outflank-mailman (input) for mailman id 867927;
 Thu, 09 Jan 2025 09:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FDwX=UB=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tVoq4-0006Xe-Nl
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 09:28:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1401d896-ce6c-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 10:28:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB0AC1516;
 Thu,  9 Jan 2025 01:28:53 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C20723F59E;
 Thu,  9 Jan 2025 01:28:24 -0800 (PST)
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
X-Inumbo-ID: 1401d896-ce6c-11ef-a0df-8be0dac302b0
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: Fully initialise struct membanks_hdr fields
Date: Thu,  9 Jan 2025 09:28:16 +0000
Message-Id: <20250109092816.1619834-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a14593e3995a ("xen/device-tree: Allow region overlapping with
/memreserve/ ranges") introduced a type in the 'struct membanks_hdr'
but forgot to update the 'struct kernel_info' initialiser, while
it doesn't lead to failures because the field is not currently
used while managing kernel_info structures, it's good to have it
for completeness.

There are other instance of structures using 'struct membanks_hdr'
that are dynamically allocated and don't fully initialise these
fields, provide a static inline helper for that.

Fixes: a14593e3995a ("xen/device-tree: Allow region overlapping with /memreserve/ ranges")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v1:
 - Changed commit title and body msg
 - initialised max_banks and type for all structures using 'struct membanks_hdr'

I didn't get why the fixes tag is wrong, but please feel free to
correct it on commit or suggest the good one
---
---
 xen/arch/arm/domain_build.c       | 13 ++++---------
 xen/arch/arm/include/asm/kernel.h |  5 ++++-
 xen/arch/arm/static-shmem.c       |  3 ++-
 xen/include/xen/bootfdt.h         | 16 ++++++++++++++++
 4 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b072a16249fe..9e3132fb21d8 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1039,7 +1039,7 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
      */
     if ( is_hardware_domain(d) )
     {
-        struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
+        struct membanks *gnttab = membanks_xzalloc(1, RESERVED_MEMORY);
         /*
          * Exclude the following regions:
          * 1) Remove reserved memory
@@ -1057,13 +1057,10 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
         gnttab->bank[0].start = kinfo->gnttab_start;
         gnttab->bank[0].size = kinfo->gnttab_size;
 
-        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
-                                             NR_MEM_BANKS);
+        hwdom_free_mem = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
         if ( !hwdom_free_mem )
             goto fail;
 
-        hwdom_free_mem->max_banks = NR_MEM_BANKS;
-
         if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
                                      hwdom_free_mem, add_hwdom_free_regions) )
             goto fail;
@@ -1293,7 +1290,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
                                              struct membanks *ext_regions)
 {
     int res;
-    struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
+    struct membanks *gnttab = membanks_xzalloc(1, RESERVED_MEMORY);
 
     /*
      * Exclude the following regions:
@@ -1374,12 +1371,10 @@ int __init make_hypervisor_node(struct domain *d,
     }
     else
     {
-        ext_regions = xzalloc_flex_struct(struct membanks, bank, NR_MEM_BANKS);
+        ext_regions = membanks_xzalloc(NR_MEM_BANKS, RESERVED_MEMORY);
         if ( !ext_regions )
             return -ENOMEM;
 
-        ext_regions->max_banks = NR_MEM_BANKS;
-
         if ( domain_use_host_layout(d) )
         {
             if ( !is_iommu_enabled(d) )
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 7e6e3c82a477..de3f945ae54c 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -92,7 +92,9 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
 }
 
 #ifdef CONFIG_STATIC_SHM
-#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_SHMEM_BANKS,
+#define KERNEL_INFO_SHM_MEM_INIT                \
+    .shm_mem.common.max_banks = NR_SHMEM_BANKS, \
+    .shm_mem.common.type = STATIC_SHARED_MEMORY,
 #else
 #define KERNEL_INFO_SHM_MEM_INIT
 #endif
@@ -100,6 +102,7 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
 #define KERNEL_INFO_INIT                        \
 {                                               \
     .mem.common.max_banks = NR_MEM_BANKS,       \
+    .mem.common.type = MEMORY,                  \
     KERNEL_INFO_SHM_MEM_INIT                    \
 }
 
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 66088a426785..8f87154c3587 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -20,7 +20,8 @@ static struct {
     struct membanks_hdr common;
     struct membank bank[NR_SHMEM_BANKS];
 } shm_heap_banks __initdata = {
-    .common.max_banks = NR_SHMEM_BANKS
+    .common.max_banks = NR_SHMEM_BANKS,
+    .common.type = STATIC_SHARED_MEMORY
 };
 
 static inline struct membanks *get_shmem_heap_banks(void)
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index c8bbfd8979b2..80a90e53c001 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -4,6 +4,7 @@
 #include <xen/types.h>
 #include <xen/kernel.h>
 #include <xen/macros.h>
+#include <xen/xmalloc.h>
 
 #define MIN_FDT_ALIGN 8
 
@@ -219,4 +220,19 @@ static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
 }
 #endif
 
+static inline struct membanks *membanks_xzalloc(unsigned int nr,
+                                                enum region_type type)
+{
+    struct membanks *banks = xzalloc_flex_struct(struct membanks, bank, nr);
+
+    if ( !banks )
+        goto out;
+
+    banks->max_banks = nr;
+    banks->type = type;
+
+ out:
+    return banks;
+}
+
 #endif /* XEN_BOOTFDT_H */
-- 
2.34.1


