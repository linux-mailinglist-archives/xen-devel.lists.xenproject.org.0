Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 208F75248A6
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 11:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327502.550361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np4s1-00025t-VN; Thu, 12 May 2022 09:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327502.550361; Thu, 12 May 2022 09:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np4s1-00021R-NX; Thu, 12 May 2022 09:12:29 +0000
Received: by outflank-mailman (input) for mailman id 327502;
 Thu, 12 May 2022 09:12:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsCQ=VU=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1np4rz-0000K4-BM
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 09:12:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a3ed0d8a-d1d3-11ec-a406-831a346695d4;
 Thu, 12 May 2022 11:12:26 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98C16106F;
 Thu, 12 May 2022 02:12:25 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D95683F73D;
 Thu, 12 May 2022 02:12:22 -0700 (PDT)
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
X-Inumbo-ID: a3ed0d8a-d1d3-11ec-a406-831a346695d4
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 5/8] xen/arm: Add additional reference to owner domain when the owner is allocated
Date: Thu, 12 May 2022 17:11:26 +0800
Message-Id: <20220512091129.2802997-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512091129.2802997-1-Penny.Zheng@arm.com>
References: <20220512091129.2802997-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Borrower domain will fail to get a page ref using the owner domain
during allocation, when the owner is created after borrower.

So here, we decide to get and add the right amount of reference, which
is the number of borrowers, when the owner is allocated.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 change:
- printk rather than dprintk since it is a serious error
---
v2 change:
- new commit
---
 xen/arch/arm/domain_build.c | 62 +++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9c53b9fa7b..293e79e4e7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -791,6 +791,34 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
 
 }
 
+static int __init acquire_nr_borrower_domain(struct domain *d,
+                                             paddr_t pbase, paddr_t psize,
+                                             unsigned long *nr_borrowers)
+{
+    unsigned long bank;
+
+    /* Iterate reserved memory to find requested shm bank. */
+    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
+    {
+        paddr_t bank_start = bootinfo.reserved_mem.bank[bank].start;
+        paddr_t bank_size = bootinfo.reserved_mem.bank[bank].size;
+
+        if ( pbase == bank_start && psize == bank_size )
+            break;
+    }
+
+    if ( bank == bootinfo.reserved_mem.nr_banks )
+        return -ENOENT;
+
+    if ( d == dom_io )
+        *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_domain;
+    else
+        /* Exclude the owner domain itself. */
+        *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_domain - 1;
+
+    return 0;
+}
+
 /*
  * Func allocate_shared_memory is supposed to be only called
  * from the owner.
@@ -802,6 +830,8 @@ static int __init allocate_shared_memory(struct domain *d,
 {
     mfn_t smfn;
     int ret = 0;
+    unsigned long nr_pages, nr_borrowers, i;
+    struct page_info *page;
 
     dprintk(XENLOG_INFO,
             "Allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
@@ -816,6 +846,7 @@ static int __init allocate_shared_memory(struct domain *d,
      * DOMID_IO is the domain, like DOMID_XEN, that is not auto-translated.
      * It sees RAM 1:1 and we do not need to create P2M mapping for it
      */
+    nr_pages = PFN_DOWN(psize);
     if ( d != dom_io )
     {
         ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));
@@ -827,6 +858,37 @@ static int __init allocate_shared_memory(struct domain *d,
         }
     }
 
+    /*
+     * Get the right amount of references per page, which is the number of
+     * borrow domains.
+     */
+    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
+    if ( ret )
+        return ret;
+
+    /*
+     * Instead of let borrower domain get a page ref, we add as many
+     * additional reference as the number of borrowers when the owner
+     * is allocated, since there is a chance that owner is created
+     * after borrower.
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


