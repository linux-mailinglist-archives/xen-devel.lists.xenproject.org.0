Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C176782213
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 06:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587205.918555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXw6V-00047P-3v; Mon, 21 Aug 2023 04:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587205.918555; Mon, 21 Aug 2023 04:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXw6V-00043Y-00; Mon, 21 Aug 2023 04:01:23 +0000
Received: by outflank-mailman (input) for mailman id 587205;
 Mon, 21 Aug 2023 04:01:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Scea=EG=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qXw6U-0003VX-53
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 04:01:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6289e56a-3fd7-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 06:01:20 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40FA11FB;
 Sun, 20 Aug 2023 21:02:00 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CED123F740;
 Sun, 20 Aug 2023 21:01:16 -0700 (PDT)
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
X-Inumbo-ID: 6289e56a-3fd7-11ee-9b0c-b553b5be7939
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 3/8] xen/arm: introduce allocate_domheap_memory and guest_physmap_memory
Date: Mon, 21 Aug 2023 12:00:41 +0800
Message-Id: <20230821040046.2965665-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821040046.2965665-1-Penny.Zheng@arm.com>
References: <20230821040046.2965665-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We split the code of allocate_bank_memory into two parts,
allocate_domheap_memory and guest_physmap_memory.

One is about allocating guest RAM from heap, which could be re-used later for
allocating static shared memory from heap when host address is not provided.
The other is building up guest P2M mapping.

We also define a set of MACRO helpers to access common fields in data
structure of "meminfo" type, e.g. "struct meminfo" is one of them, and
later new "struct shm_meminfo" is also one of them.
This kind of structures must have the following characteristics:
- an array of "struct membank"
- a member called "nr_banks" indicating current array size
- a field indicating the maximum array size
When introducing a new data structure, according callbacks with function type
"retrieve_fn" shall be defined for using MACRO helpers.
This commit defines callback "retrieve_meminfo" for data structure
"struct meminfo".

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v1 -> v2:
-  define a set of MACRO helpers to access common fields in data structure of
"meminfo" type. "struct meminfo" is one of them, and according callback
"retrieve_meminfo" is also introduced here.
- typo of changing 1ULL to 1UL
---
v2 -> v3
- rebase and no changes
---
 xen/arch/arm/domain_build.c      | 119 ++++++++++++++++++++++++-------
 xen/arch/arm/include/asm/setup.h |  33 +++++++++
 2 files changed, 127 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b639d3dc78..97f9db1175 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -99,6 +99,26 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
  */
 #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
 
+static void __init retrieve_meminfo(void *mem, unsigned int *max_mem_banks,
+                                    struct membank **bank,
+                                    unsigned int **nr_banks)
+{
+    struct meminfo *meminfo = (struct meminfo *)mem;
+
+    if ( max_mem_banks )
+        *max_mem_banks = NR_MEM_BANKS;
+
+    if ( nr_banks )
+        *nr_banks = &(meminfo->nr_banks);
+
+    if ( bank )
+        *bank = meminfo->bank;
+}
+
+retrieve_fn __initdata retrievers[MAX_MEMINFO_TYPE] = {
+    [NORMAL_MEMINFO] = retrieve_meminfo,
+};
+
 unsigned int __init dom0_max_vcpus(void)
 {
     if ( opt_dom0_max_vcpus == 0 )
@@ -413,34 +433,20 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
-static bool __init allocate_bank_memory(struct domain *d,
-                                        struct kernel_info *kinfo,
-                                        gfn_t sgfn,
-                                        paddr_t tot_size)
+static bool __init allocate_domheap_memory(struct domain *d,
+                                           paddr_t tot_size,
+                                           void *mem, enum meminfo_type type)
 {
-    int res;
     struct page_info *pg;
-    struct membank *bank;
     unsigned int max_order = ~0;
-
-    /*
-     * allocate_bank_memory can be called with a tot_size of zero for
-     * the second memory bank. It is not an error and we can safely
-     * avoid creating a zero-size memory bank.
-     */
-    if ( tot_size == 0 )
-        return true;
-
-    bank = &kinfo->mem.bank[kinfo->mem.nr_banks];
-    bank->start = gfn_to_gaddr(sgfn);
-    bank->size = tot_size;
+    unsigned int *nr_banks = GET_NR_BANKS(mem, type);
 
     while ( tot_size > 0 )
     {
         unsigned int order = get_allocation_size(tot_size);
+        struct membank *membank;
 
         order = min(max_order, order);
-
         pg = alloc_domheap_pages(d, order, 0);
         if ( !pg )
         {
@@ -460,15 +466,78 @@ static bool __init allocate_bank_memory(struct domain *d,
             continue;
         }
 
-        res = guest_physmap_add_page(d, sgfn, page_to_mfn(pg), order);
-        if ( res )
-        {
-            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
+        if ( *nr_banks == MAX_MEM_BANKS(type) )
             return false;
-        }
+
+        membank = GET_MEMBANK(mem, type, *nr_banks);
+        membank->start = mfn_to_maddr(page_to_mfn(pg));
+        membank->size = 1ULL << (PAGE_SHIFT + order);
+        (*nr_banks)++;
+        tot_size -= membank->size;
+    }
+
+    return true;
+}
+
+static int __init guest_physmap_memory(struct domain *d,
+                                       void *mem, enum meminfo_type type,
+                                       gfn_t sgfn)
+{
+    unsigned int i;
+    int res;
+    unsigned int *nr_banks = GET_NR_BANKS(mem, type);
+
+    for ( i = 0; i < *nr_banks; i++ )
+    {
+        struct membank *membank = GET_MEMBANK(mem, type, i);
+        paddr_t start = membank->start;
+        paddr_t size = membank->size;
+        unsigned int order = get_order_from_bytes(size);
+
+        /* Size must be power of two */
+        BUG_ON(!size || (size & (size - 1)));
+        res = guest_physmap_add_page(d, sgfn, maddr_to_mfn(start), order);
+        if ( res )
+            return res;
 
         sgfn = gfn_add(sgfn, 1UL << order);
-        tot_size -= (1ULL << (PAGE_SHIFT + order));
+    }
+
+    return 0;
+}
+
+static bool __init allocate_bank_memory(struct domain *d,
+                                        struct kernel_info *kinfo,
+                                        gfn_t sgfn,
+                                        paddr_t total_size)
+{
+    struct membank *bank;
+    struct meminfo host = { 0 };
+
+    /*
+     * allocate_bank_memory can be called with a total_size of zero for
+     * the second memory bank. It is not an error and we can safely
+     * avoid creating a zero-size memory bank.
+     */
+    if ( total_size == 0 )
+        return true;
+
+    bank = &kinfo->mem.bank[kinfo->mem.nr_banks];
+    bank->start = gfn_to_gaddr(sgfn);
+    bank->size = total_size;
+
+    if ( !allocate_domheap_memory(d, total_size, (void *)&host, NORMAL_MEMINFO) )
+    {
+        printk(XENLOG_ERR "Failed to allocate (%"PRIpaddr"MB) pages to %pd\n",
+               total_size >> 20, d);
+        return false;
+    }
+
+    if ( guest_physmap_memory(d, (void *)&host, NORMAL_MEMINFO, sgfn) )
+    {
+        printk(XENLOG_ERR "Failed to map (%"PRIpaddr"MB) pages to %pd\n",
+               total_size >> 20, d);
+        return false;
     }
 
     kinfo->mem.nr_banks++;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 840ef50ef5..dba140d12f 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -57,6 +57,39 @@ struct meminfo {
     struct membank bank[NR_MEM_BANKS];
 };
 
+enum meminfo_type {
+    NORMAL_MEMINFO,
+    MAX_MEMINFO_TYPE,
+};
+
+/*
+ * Define a set of MACRO helpers to access meminfo_type, like "struct meminfo"
+ * as type of NORMAL_MEMINFO, etc.
+ * This kind of structure must have a array of "struct membank",
+ * a member called nr_banks indicating the current array size, and also a field
+ * indicating the maximum array size.
+ */
+typedef void (*retrieve_fn)(void *, unsigned int *, struct membank **,
+                            unsigned int **);
+
+#define MAX_MEM_BANKS(type) ({                              \
+    unsigned int _max_mem_banks;                            \
+    retrievers[type](NULL, &_max_mem_banks, NULL, NULL);    \
+    _max_mem_banks;                                         \
+})
+
+#define GET_MEMBANK(mem, type, index) ({                    \
+    struct membank *_bank;                                  \
+    retrievers[type]((void *)(mem), NULL, &_bank, NULL);    \
+    &(_bank[index]);                                        \
+})
+
+#define GET_NR_BANKS(mem, type) ({                          \
+    unsigned int *_nr_banks;                                \
+    retrievers[type]((void *)mem, NULL, NULL, &_nr_banks);  \
+    _nr_banks;                                              \
+})
+
 /*
  * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
  * The purpose of the domU flag is to avoid getting confused in
-- 
2.25.1


