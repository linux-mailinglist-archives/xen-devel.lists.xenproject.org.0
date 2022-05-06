Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1B151D235
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 09:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322650.544095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmsLq-0000My-TE; Fri, 06 May 2022 07:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322650.544095; Fri, 06 May 2022 07:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmsLq-0000Jx-Oy; Fri, 06 May 2022 07:26:10 +0000
Received: by outflank-mailman (input) for mailman id 322650;
 Fri, 06 May 2022 07:26:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5MfP=VO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nmsLo-0007P7-KV
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 07:26:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id cb80e8d5-cd0d-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 09:26:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0219A1063;
 Fri,  6 May 2022 00:26:07 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30C683FA27;
 Fri,  6 May 2022 00:26:03 -0700 (PDT)
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
X-Inumbo-ID: cb80e8d5-cd0d-11ec-8fc4-03012f2f19d4
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 5/9] xen/arm: Add additional reference to owner domain when the owner is allocated
Date: Fri,  6 May 2022 15:24:58 +0800
Message-Id: <20220506072502.2177828-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506072502.2177828-1-Penny.Zheng@arm.com>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Borrower domain will fail to get a page ref using the owner domain
during allocation, when the owner is created after borrower.

So here, we decide to get and add the right amount of reference, which
is the number of borrowers, when the owner is allocated.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 change:
- new commit
---
 xen/arch/arm/domain_build.c | 62 +++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f43378227a..b3ba0c501d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -792,6 +792,34 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
 
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
@@ -803,6 +831,8 @@ static int __init allocate_shared_memory(struct domain *d,
 {
     mfn_t smfn;
     int ret = 0;
+    unsigned long nr_pages, nr_borrowers, i;
+    struct page_info *page;
 
     dprintk(XENLOG_INFO,
             "Allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
@@ -817,6 +847,7 @@ static int __init allocate_shared_memory(struct domain *d,
      * DOMID_IO is the domain, like DOMID_XEN, that is not auto-translated.
      * It sees RAM 1:1 and we do not need to create P2M mapping for it.
      */
+    nr_pages = PFN_DOWN(psize);
     if ( d != dom_io )
     {
         ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));
@@ -828,6 +859,37 @@ static int __init allocate_shared_memory(struct domain *d,
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
+            dprintk(XENLOG_ERR,
+                    "Failed to add %lu references to page %"PRI_mfn".\n",
+                    nr_borrowers, mfn_x(smfn) + i);
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


