Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB6806A54
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 10:06:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649010.1013266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnro-00042b-Kd; Wed, 06 Dec 2023 09:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649010.1013266; Wed, 06 Dec 2023 09:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnro-00040G-Gp; Wed, 06 Dec 2023 09:06:52 +0000
Received: by outflank-mailman (input) for mailman id 649010;
 Wed, 06 Dec 2023 09:06:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4rn=HR=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1rAnrm-0002Yw-VM
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 09:06:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ca2f57a6-9416-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 10:06:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 834FD139F;
 Wed,  6 Dec 2023 01:07:35 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B32A3F762;
 Wed,  6 Dec 2023 01:06:46 -0800 (PST)
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
X-Inumbo-ID: ca2f57a6-9416-11ee-98e5-6d05b1d4d9a1
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
Subject: [PATCH v5 04/11] xen/arm: introduce allocate_domheap_memory and guest_physmap_memory
Date: Wed,  6 Dec 2023 17:06:16 +0800
Message-Id: <20231206090623.1932275-5-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206090623.1932275-1-Penny.Zheng@arm.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
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
v3 -> v4:
rebase and no change
---
v4 -> v5:
rebase and no change
---
 xen/arch/arm/domain_build.c      | 119 +++++++++++++++++++++++++------
 xen/arch/arm/include/asm/setup.h |  33 +++++++++
 2 files changed, 129 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 64ae944431..a8bc78baa5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -51,6 +51,28 @@ boolean_param("ext_regions", opt_ext_regions);
 static u64 __initdata dom0_mem;
 static bool __initdata dom0_mem_set;
 
+#ifdef CONFIG_DOM0LESS_BOOT
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
+#endif
+
 static int __init parse_dom0_mem(const char *s)
 {
     dom0_mem_set = true;
@@ -415,32 +437,20 @@ static void __init allocate_memory_11(struct domain *d,
 }
 
 #ifdef CONFIG_DOM0LESS_BOOT
-bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
-                                 gfn_t sgfn, paddr_t tot_size)
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
@@ -460,15 +470,78 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
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
+bool __init allocate_bank_memory(struct domain *d,
+                                 struct kernel_info *kinfo,
+                                 gfn_t sgfn,
+                                 paddr_t total_size)
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
index 3a2b35ea46..bc5f08be97 100644
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


