Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3495D5B1FBA
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 15:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403383.645494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWI0O-0003Xp-UD; Thu, 08 Sep 2022 13:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403383.645494; Thu, 08 Sep 2022 13:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWI0O-0003Tm-RP; Thu, 08 Sep 2022 13:55:44 +0000
Received: by outflank-mailman (input) for mailman id 403383;
 Thu, 08 Sep 2022 13:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fLS5=ZL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oWI0N-0002rI-KC
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 13:55:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id eda87057-2f7d-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 15:55:42 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13AE8153B;
 Thu,  8 Sep 2022 06:55:48 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E45EF3F7B4;
 Thu,  8 Sep 2022 06:55:38 -0700 (PDT)
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
X-Inumbo-ID: eda87057-2f7d-11ed-a31c-8f8a9ae3403f
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 5/9] xen/arm: Add additional reference to owner domain when the owner is allocated
Date: Thu,  8 Sep 2022 21:55:09 +0800
Message-Id: <20220908135513.1800511-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908135513.1800511-1-Penny.Zheng@arm.com>
References: <20220908135513.1800511-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Borrower domain will fail to get a page ref using the owner domain
during allocation, when the owner is created after borrower.

So here, we decide to get and add the right amount of reference, which
is the number of borrowers, when the owner is allocated.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v8 changes:
- no change
---
v7 changes:
- change "unsigned long bank" to "unsigned int bank"
---
v6 change:
- adapt to the change of "nr_shm_borrowers"
- add in-code comment to explain if the borrower is created first, we intend to
add pages in the P2M without reference.
---
v5 change:
- no change
---
v4 changes:
- no change
---
v3 change:
- printk rather than dprintk since it is a serious error
---
v2 change:
- new commit
---
 xen/arch/arm/domain_build.c | 60 +++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fe0a96764d..4aab9b0865 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -761,6 +761,30 @@ static void __init assign_static_memory_11(struct domain *d,
 }
 
 #ifdef CONFIG_STATIC_SHM
+static int __init acquire_nr_borrower_domain(struct domain *d,
+                                             paddr_t pbase, paddr_t psize,
+                                             unsigned long *nr_borrowers)
+{
+    unsigned int bank;
+
+    /* Iterate reserved memory to find requested shm bank. */
+    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
+    {
+        paddr_t bank_start = bootinfo.reserved_mem.bank[bank].start;
+        paddr_t bank_size = bootinfo.reserved_mem.bank[bank].size;
+
+        if ( (pbase == bank_start) && (psize == bank_size) )
+            break;
+    }
+
+    if ( bank == bootinfo.reserved_mem.nr_banks )
+        return -ENOENT;
+
+    *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_borrowers;
+
+    return 0;
+}
+
 /*
  * This function checks whether the static shared memory region is
  * already allocated to dom_io.
@@ -827,6 +851,8 @@ static int __init assign_shared_memory(struct domain *d,
 {
     mfn_t smfn;
     int ret = 0;
+    unsigned long nr_pages, nr_borrowers, i;
+    struct page_info *page;
 
     dprintk(XENLOG_INFO,
             "%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
@@ -840,6 +866,7 @@ static int __init assign_shared_memory(struct domain *d,
      * DOMID_IO is not auto-translated (i.e. it sees RAM 1:1). So we do not need
      * to create mapping in the P2M.
      */
+    nr_pages = PFN_DOWN(psize);
     if ( d != dom_io )
     {
         ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn,
@@ -851,6 +878,39 @@ static int __init assign_shared_memory(struct domain *d,
         }
     }
 
+    /*
+     * Get the right amount of references per page, which is the number of
+     * borrower domains.
+     */
+    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
+    if ( ret )
+        return ret;
+
+    /*
+     * Instead of letting borrower domain get a page ref, we add as many
+     * additional reference as the number of borrowers when the owner
+     * is allocated, since there is a chance that owner is created
+     * after borrower.
+     * So if the borrower is created first, it will cause adding pages
+     * in the P2M without reference.
+     */
+    page = mfn_to_page(smfn);
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        if ( !get_page_nr(page + i, d, nr_borrowers) )
+        {
+            printk(XENLOG_ERR
+                   "Failed to add %lu references to page %"PRI_mfn".\n",
+                   nr_borrowers, mfn_x(smfn) + i);
+            goto fail;
+        }
+    }
+
+    return 0;
+
+ fail:
+    while ( --i >= 0 )
+        put_page_nr(page + i, nr_borrowers);
     return ret;
 }
 
-- 
2.25.1


