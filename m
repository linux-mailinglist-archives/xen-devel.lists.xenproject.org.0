Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90B78CBC56
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 09:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727266.1131727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9gld-0006dp-6W; Wed, 22 May 2024 07:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727266.1131727; Wed, 22 May 2024 07:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9glc-0006aK-VX; Wed, 22 May 2024 07:52:08 +0000
Received: by outflank-mailman (input) for mailman id 727266;
 Wed, 22 May 2024 07:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfTZ=MZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1s9glb-0005YY-HV
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 07:52:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2f414d23-1810-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 09:52:06 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7716B14BF;
 Wed, 22 May 2024 00:52:30 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 909813F766;
 Wed, 22 May 2024 00:52:05 -0700 (PDT)
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
X-Inumbo-ID: 2f414d23-1810-11ef-90a0-e314d9c70b13
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 5/7] xen/arm: Rework heap page allocation outside allocate_bank_memory
Date: Wed, 22 May 2024 08:51:49 +0100
Message-Id: <20240522075151.3373899-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522075151.3373899-1-luca.fancellu@arm.com>
References: <20240522075151.3373899-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function allocate_bank_memory allocates pages from the heap and
maps them to the guest using guest_physmap_add_page.

As a preparation work to support static shared memory bank when the
host physical address is not provided, Xen needs to allocate memory
from the heap, so rework allocate_bank_memory moving out the page
allocation in a new function called allocate_domheap_memory.

The function allocate_domheap_memory takes a callback function and
a pointer to some extra information passed to the callback and this
function will be called for every region, until a defined size is
reached.

In order to keep allocate_bank_memory functionality, the callback
passed to allocate_domheap_memory is a wrapper for
guest_physmap_add_page.

Let allocate_domheap_memory be externally visible, in order to use
it in the future from the static shared memory module.

Take the opportunity to change the signature of allocate_bank_memory
and remove the 'struct domain' parameter, which can be retrieved from
'struct kernel_info'.

No functional changes is intended.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v3 changes:
 - Add R-by Michal
v2:
 - Reduced scope of pg var in allocate_domheap_memory, removed not
   necessary BUG_ON(), changed callback to return bool and fix
   comment. (Michal)
---
 xen/arch/arm/dom0less-build.c           |  4 +-
 xen/arch/arm/domain_build.c             | 79 +++++++++++++++++--------
 xen/arch/arm/include/asm/domain_build.h |  9 ++-
 3 files changed, 62 insertions(+), 30 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 74f053c242f4..20ddf6f8f250 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -60,12 +60,12 @@ static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
 
     mem->nr_banks = 0;
     bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
+    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
                                bank_size) )
         goto fail;
 
     bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
+    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
                                bank_size) )
         goto fail;
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 02e741685102..669970c86fd5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -417,30 +417,15 @@ static void __init allocate_memory_11(struct domain *d,
 }
 
 #ifdef CONFIG_DOM0LESS_BOOT
-bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
-                                 gfn_t sgfn, paddr_t tot_size)
+bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
+                                    alloc_domheap_mem_cb cb, void *extra)
 {
-    struct membanks *mem = kernel_info_get_mem(kinfo);
-    int res;
-    struct page_info *pg;
-    struct membank *bank;
-    unsigned int max_order = ~0;
-
-    /*
-     * allocate_bank_memory can be called with a tot_size of zero for
-     * the second memory bank. It is not an error and we can safely
-     * avoid creating a zero-size memory bank.
-     */
-    if ( tot_size == 0 )
-        return true;
-
-    bank = &mem->bank[mem->nr_banks];
-    bank->start = gfn_to_gaddr(sgfn);
-    bank->size = tot_size;
+    unsigned int max_order = UINT_MAX;
 
     while ( tot_size > 0 )
     {
         unsigned int order = get_allocation_size(tot_size);
+        struct page_info *pg;
 
         order = min(max_order, order);
 
@@ -463,17 +448,61 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
             continue;
         }
 
-        res = guest_physmap_add_page(d, sgfn, page_to_mfn(pg), order);
-        if ( res )
-        {
-            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
+        if ( !cb(d, pg, order, extra) )
             return false;
-        }
 
-        sgfn = gfn_add(sgfn, 1UL << order);
         tot_size -= (1ULL << (PAGE_SHIFT + order));
     }
 
+    return true;
+}
+
+static bool __init guest_map_pages(struct domain *d, struct page_info *pg,
+                                   unsigned int order, void *extra)
+{
+    gfn_t *sgfn = (gfn_t *)extra;
+    int res;
+
+    BUG_ON(!sgfn);
+    res = guest_physmap_add_page(d, *sgfn, page_to_mfn(pg), order);
+    if ( res )
+    {
+        dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
+        return false;
+    }
+
+    *sgfn = gfn_add(*sgfn, 1UL << order);
+
+    return true;
+}
+
+bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
+                                 paddr_t tot_size)
+{
+    struct membanks *mem = kernel_info_get_mem(kinfo);
+    struct domain *d = kinfo->d;
+    struct membank *bank;
+
+    /*
+     * allocate_bank_memory can be called with a tot_size of zero for
+     * the second memory bank. It is not an error and we can safely
+     * avoid creating a zero-size memory bank.
+     */
+    if ( tot_size == 0 )
+        return true;
+
+    bank = &mem->bank[mem->nr_banks];
+    bank->start = gfn_to_gaddr(sgfn);
+    bank->size = tot_size;
+
+    /*
+     * Allocate pages from the heap until tot_size is zero and map them to the
+     * guest using guest_map_pages, passing the starting gfn as extra parameter
+     * for the map operation.
+     */
+    if ( !allocate_domheap_memory(d, tot_size, guest_map_pages, &sgfn) )
+        return false;
+
     mem->nr_banks++;
     kinfo->unassigned_mem -= bank->size;
 
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 45936212ca21..e712afbc7fbf 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -5,9 +5,12 @@
 #include <asm/kernel.h>
 
 typedef __be32 gic_interrupt_t[3];
-
-bool allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
-                          gfn_t sgfn, paddr_t tot_size);
+typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
+                                     unsigned int order, void *extra);
+bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
+                             alloc_domheap_mem_cb cb, void *extra);
+bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
+                          paddr_t tot_size);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
 int make_chosen_node(const struct kernel_info *kinfo);
-- 
2.34.1


