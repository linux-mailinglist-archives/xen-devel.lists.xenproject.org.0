Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0C3629012
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 03:53:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443637.698330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4N-0000uT-1l; Tue, 15 Nov 2022 02:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443637.698330; Tue, 15 Nov 2022 02:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4M-0000sV-Ul; Tue, 15 Nov 2022 02:53:02 +0000
Received: by outflank-mailman (input) for mailman id 443637;
 Tue, 15 Nov 2022 02:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4L-0000BJ-F9
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:53:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 9da6ccbd-6490-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 03:53:00 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F65211FB;
 Mon, 14 Nov 2022 18:53:06 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E60E3F73B;
 Mon, 14 Nov 2022 18:52:56 -0800 (PST)
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
X-Inumbo-ID: 9da6ccbd-6490-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 03/13] xen/arm: introduce allocate_domheap_memory and guest_physmap_memory
Date: Tue, 15 Nov 2022 10:52:25 +0800
Message-Id: <20221115025235.1378931-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115025235.1378931-1-Penny.Zheng@arm.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We split the codes of allocate_bank_memory into two parts,
allocate_domheap_memory and guest_physmap_memory.

One is about allocating guest RAM from heap, which could be re-used later for
allocating static shared memory from heap when host address is not provided.

The other is building up guest P2M mapping.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 93 +++++++++++++++++++++++++++----------
 1 file changed, 68 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d2b9e60b5c..92763e96fc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -390,34 +390,18 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
-static bool __init allocate_bank_memory(struct domain *d,
-                                        struct kernel_info *kinfo,
-                                        gfn_t sgfn,
-                                        paddr_t tot_size)
+static bool __init allocate_domheap_memory(struct domain *d,
+                                           paddr_t tot_size,
+                                           struct meminfo *mem)
 {
-    int res;
     struct page_info *pg;
-    struct membank *bank;
     unsigned int max_order = ~0;
 
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
-
     while ( tot_size > 0 )
     {
         unsigned int order = get_allocation_size(tot_size);
 
         order = min(max_order, order);
-
         pg = alloc_domheap_pages(d, order, 0);
         if ( !pg )
         {
@@ -437,15 +421,74 @@ static bool __init allocate_bank_memory(struct domain *d,
             continue;
         }
 
-        res = guest_physmap_add_page(d, sgfn, page_to_mfn(pg), order);
-        if ( res )
-        {
-            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
+        if ( mem->nr_banks == NR_MEM_BANKS )
             return false;
-        }
+
+        mem->bank[mem->nr_banks].start = mfn_to_maddr(page_to_mfn(pg));
+        mem->bank[mem->nr_banks].size = 1UL << (PAGE_SHIFT + order);
+        mem->nr_banks++;
+        tot_size -= (1UL << (PAGE_SHIFT + order));
+    }
+
+    return true;
+}
+
+static int __init guest_physmap_memory(struct domain *d,
+                                       const struct meminfo *mem, gfn_t sgfn)
+{
+    unsigned int i;
+    int res;
+
+    for ( i = 0; i < mem->nr_banks; i++ )
+    {
+        paddr_t size = mem->bank[i].size;
+        unsigned int order = get_order_from_bytes(size);
+
+        /* Size must be power of two */
+        BUG_ON(!size || (size & (size - 1)));
+        res = guest_physmap_add_page(d, sgfn, maddr_to_mfn(mem->bank[i].start),
+                                     order);
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
+    struct meminfo host = {0};
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
+    if ( !allocate_domheap_memory(d, total_size, &host) )
+    {
+        printk(XENLOG_ERR "Failed to allocate (%"PRIpaddr"MB) pages to %pd\n",
+               total_size >> 20, d);
+        return false;
+    }
+
+    if ( guest_physmap_memory(d, &host, sgfn) )
+    {
+        printk(XENLOG_ERR "Failed to map (%"PRIpaddr"MB) pages to %pd\n",
+               total_size >> 20, d);
+        return false;
     }
 
     kinfo->mem.nr_banks++;
-- 
2.25.1


