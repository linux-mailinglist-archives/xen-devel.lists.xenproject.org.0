Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2988B62900B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 03:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443640.698364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4W-0001xY-2Z; Tue, 15 Nov 2022 02:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443640.698364; Tue, 15 Nov 2022 02:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4V-0001te-SZ; Tue, 15 Nov 2022 02:53:11 +0000
Received: by outflank-mailman (input) for mailman id 443640;
 Tue, 15 Nov 2022 02:53:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4U-0000BJ-PQ
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:53:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a323f596-6490-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 03:53:09 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5309D11FB;
 Mon, 14 Nov 2022 18:53:15 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 74C063F73B;
 Mon, 14 Nov 2022 18:53:06 -0800 (PST)
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
X-Inumbo-ID: a323f596-6490-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 06/13] xen/arm: assign shared memory to owner when host address not provided
Date: Tue, 15 Nov 2022 10:52:28 +0800
Message-Id: <20221115025235.1378931-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115025235.1378931-1-Penny.Zheng@arm.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the introduction of new scenario where host address is not provided
in "xen,shared-mem", the function "assign_shared_memory" shall be adapted
to it too.

Shared memory will already be allocated from heap, when calling
"assign_shared_memory" with unprovided host address.
So in "assign_shared_memory", we just need to assign these static shared pages
to its owner domain using function "assign_pages", and add as many
additional reference as the number of borrowers.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 160 ++++++++++++++++++++++++++++++------
 1 file changed, 133 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3de96882a5..faf0784bb0 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -817,8 +817,12 @@ static bool __init is_shm_allocated_to_domio(struct shm_membank *shm_membank)
 {
     struct page_info *page;
     struct domain *d;
+    paddr_t pbase;
 
-    page = maddr_to_page(shm_membank->mem.bank->start);
+    pbase = shm_membank->mem.banks.meminfo ?
+            shm_membank->mem.banks.meminfo->bank[0].start :
+            shm_membank->mem.bank->start;
+    page = maddr_to_page(pbase);
     d = page_get_owner_and_reference(page);
     if ( d == NULL )
         return false;
@@ -907,6 +911,7 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
     mfn_t smfn;
     unsigned long nr_pfns;
     int res;
+    struct page_info *page;
 
     /*
      * Pages of statically shared memory shall be included
@@ -922,33 +927,82 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
     d->max_pages += nr_pfns;
 
     smfn = maddr_to_mfn(pbase);
-    res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
-    if ( res )
+    page = mfn_to_page(smfn);
+    /*
+     * If page is allocated from heap as static shared memory, then we just
+     * assign it to the owner domain
+     */
+    if ( page->count_info == (PGC_state_inuse | PGC_static) )
     {
-        printk(XENLOG_ERR
-               "%pd: failed to acquire static memory: %d.\n", d, res);
-        d->max_pages -= nr_pfns;
-        return INVALID_MFN;
+        res = assign_pages(page, nr_pfns, d, 0);
+        if ( res )
+        {
+            printk(XENLOG_ERR
+                   "%pd: failed to assign static memory: %d.\n", d, res);
+            return INVALID_MFN;
+        }
+    }
+    else
+    {
+        res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
+        if ( res )
+        {
+            printk(XENLOG_ERR
+                   "%pd: failed to acquire static memory: %d.\n", d, res);
+                   d->max_pages -= nr_pfns;
+            return INVALID_MFN;
+        }
     }
 
     return smfn;
 }
 
-static int __init assign_shared_memory(struct domain *d,
-                                       struct shm_membank *shm_membank,
-                                       paddr_t gbase)
+static void __init remove_shared_memory_ref(struct page_info *page,
+                                            unsigned long nr_pages,
+                                            unsigned long nr_borrowers)
 {
-    mfn_t smfn;
-    int ret = 0;
-    unsigned long nr_pages, nr_borrowers, i;
-    struct page_info *page;
-    paddr_t pbase, psize;
+    while ( --nr_pages >= 0 )
+         put_page_nr(page + nr_pages, nr_borrowers);
+}
 
-    pbase = shm_membank->mem.bank->start;
-    psize = shm_membank->mem.bank->size;
+static int __init add_shared_memory_ref(struct domain *d, struct page_info *page,
+                                        unsigned long nr_pages,
+                                        unsigned long nr_borrowers)
+{
+    unsigned int i;
 
-    printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
-           d, pbase, pbase + psize);
+    /*
+     * Instead of letting borrower domain get a page ref, we add as many
+     * additional reference as the number of borrowers when the owner
+     * is allocated, since there is a chance that owner is created
+     * after borrower.
+     * So if the borrower is created first, it will cause adding pages
+     * in the P2M without reference.
+     */
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        if ( !get_page_nr(page + i, d, nr_borrowers) )
+        {
+            printk(XENLOG_ERR
+                   "Failed to add %lu references to page %"PRI_mfn".\n",
+                   nr_borrowers, mfn_x(page_to_mfn(page)) + i);
+            goto fail;
+        }
+    }
+    return 0;
+
+ fail:
+    remove_shared_memory_ref(page, i, nr_borrowers);
+    return -EINVAL;
+}
+
+static int __init acquire_shared_memory(struct domain *d,
+                                        paddr_t pbase, paddr_t psize,
+                                        paddr_t gbase)
+{
+    mfn_t smfn;
+    int ret = 0;
+    unsigned long nr_pages;
 
     smfn = acquire_shared_memory_bank(d, pbase, psize);
     if ( mfn_eq(smfn, INVALID_MFN) )
@@ -970,6 +1024,44 @@ static int __init assign_shared_memory(struct domain *d,
         }
     }
 
+    return 0;
+}
+
+static int __init assign_shared_memory(struct domain *d,
+                                       struct shm_membank *shm_membank,
+                                       paddr_t gbase)
+{
+    int ret = 0;
+    unsigned long nr_pages, nr_borrowers;
+    struct page_info *page;
+    unsigned int i;
+    struct meminfo *meminfo;
+
+    /* Host address is not provided in "xen,shared-mem" */
+    if ( shm_membank->mem.banks.meminfo )
+    {
+        meminfo = shm_membank->mem.banks.meminfo;
+        for ( i = 0; i < meminfo->nr_banks; i++ )
+        {
+            ret = acquire_shared_memory(d,
+                                        meminfo->bank[i].start,
+                                        meminfo->bank[i].size,
+                                        gbase);
+            if ( ret )
+                return ret;
+
+            gbase += meminfo->bank[i].size;
+        }
+    }
+    else
+    {
+        ret = acquire_shared_memory(d,
+                                    shm_membank->mem.bank->start,
+                                    shm_membank->mem.bank->size, gbase);
+        if ( ret )
+            return ret;
+    }
+
     /*
      * Get the right amount of references per page, which is the number of
      * borrower domains.
@@ -984,23 +1076,37 @@ static int __init assign_shared_memory(struct domain *d,
      * So if the borrower is created first, it will cause adding pages
      * in the P2M without reference.
      */
-    page = mfn_to_page(smfn);
-    for ( i = 0; i < nr_pages; i++ )
+    if ( shm_membank->mem.banks.meminfo )
     {
-        if ( !get_page_nr(page + i, d, nr_borrowers) )
+        meminfo = shm_membank->mem.banks.meminfo;
+        for ( i = 0; i < meminfo->nr_banks; i++ )
         {
-            printk(XENLOG_ERR
-                   "Failed to add %lu references to page %"PRI_mfn".\n",
-                   nr_borrowers, mfn_x(smfn) + i);
-            goto fail;
+            page = mfn_to_page(maddr_to_mfn(meminfo->bank[i].start));
+            nr_pages = PFN_DOWN(meminfo->bank[i].size);
+            ret = add_shared_memory_ref(d, page, nr_pages, nr_borrowers);
+            if ( ret )
+                goto fail;
         }
     }
+    else
+    {
+        page = mfn_to_page(
+                maddr_to_mfn(shm_membank->mem.bank->start));
+        nr_pages = shm_membank->mem.bank->size >> PAGE_SHIFT;
+        ret = add_shared_memory_ref(d, page, nr_pages, nr_borrowers);
+        if ( ret )
+            return ret;
+    }
 
     return 0;
 
  fail:
     while ( --i >= 0 )
-        put_page_nr(page + i, nr_borrowers);
+    {
+        page = mfn_to_page(maddr_to_mfn(meminfo->bank[i].start));
+        nr_pages = PFN_DOWN(meminfo->bank[i].size);
+        remove_shared_memory_ref(page, nr_pages, nr_borrowers);
+    }
     return ret;
 }
 
-- 
2.25.1


