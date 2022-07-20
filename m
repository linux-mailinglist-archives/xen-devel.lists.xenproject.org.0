Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088EF57B083
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 07:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371332.603193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE2Xd-0006pA-EJ; Wed, 20 Jul 2022 05:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371332.603193; Wed, 20 Jul 2022 05:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE2Xd-0006mE-AL; Wed, 20 Jul 2022 05:46:37 +0000
Received: by outflank-mailman (input) for mailman id 371332;
 Wed, 20 Jul 2022 05:46:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n6ZH=XZ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oE2Xb-0006lV-VO
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 05:46:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4f9991d8-07ef-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 07:46:33 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6181C15A1;
 Tue, 19 Jul 2022 22:46:33 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0447D3F70D;
 Tue, 19 Jul 2022 22:46:28 -0700 (PDT)
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
X-Inumbo-ID: 4f9991d8-07ef-11ed-bd2d-47488cf2e6aa
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Penny Zheng <penny.zheng@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v9 1/8] xen/arm: rename PGC_reserved to PGC_static
Date: Wed, 20 Jul 2022 13:46:04 +0800
Message-Id: <20220720054611.2695787-2-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720054611.2695787-1-Penny.Zheng@arm.com>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PGC_reserved could be ambiguous, and we have to tell what the pages are
reserved for, so this commit intends to rename PGC_reserved to
PGC_static, which clearly indicates the page is reserved for static
memory.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v8 changes:
- no change
---
v7 changes:
- no change
---
v6 changes:
- rename PGC_staticmem to PGC_static
---
v5 changes:
- new commit
---
 xen/arch/arm/include/asm/mm.h |  6 +++---
 xen/common/page_alloc.c       | 22 +++++++++++-----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index c4bc3cd1e5..8b2481c1f3 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -108,9 +108,9 @@ struct page_info
   /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
-  /* Page is reserved */
-#define _PGC_reserved     PG_shift(3)
-#define PGC_reserved      PG_mask(1, 3)
+  /* Page is static memory */
+#define _PGC_static    PG_shift(3)
+#define PGC_static     PG_mask(1, 3)
 /* ... */
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index fe0e15429a..ed56379b96 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -151,8 +151,8 @@
 #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
 #endif
 
-#ifndef PGC_reserved
-#define PGC_reserved 0
+#ifndef PGC_static
+#define PGC_static 0
 #endif
 
 /*
@@ -2286,7 +2286,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_reserved)));
+            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2346,7 +2346,7 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
+            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
 
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
@@ -2652,8 +2652,8 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
             scrub_one_page(pg);
         }
 
-        /* In case initializing page of static memory, mark it PGC_reserved. */
-        pg[i].count_info |= PGC_reserved;
+        /* In case initializing page of static memory, mark it PGC_static. */
+        pg[i].count_info |= PGC_static;
     }
 }
 
@@ -2682,8 +2682,8 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
 
     for ( i = 0; i < nr_mfns; i++ )
     {
-        /* The page should be reserved and not yet allocated. */
-        if ( pg[i].count_info != (PGC_state_free | PGC_reserved) )
+        /* The page should be static and not yet allocated. */
+        if ( pg[i].count_info != (PGC_state_free | PGC_static) )
         {
             printk(XENLOG_ERR
                    "pg[%lu] Static MFN %"PRI_mfn" c=%#lx t=%#x\n",
@@ -2697,10 +2697,10 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
                                 &tlbflush_timestamp);
 
         /*
-         * Preserve flag PGC_reserved and change page state
+         * Preserve flag PGC_static and change page state
          * to PGC_state_inuse.
          */
-        pg[i].count_info = PGC_reserved | PGC_state_inuse;
+        pg[i].count_info = PGC_static | PGC_state_inuse;
         /* Initialise fields which have other uses for free pages. */
         pg[i].u.inuse.type_info = 0;
         page_set_owner(&pg[i], NULL);
@@ -2722,7 +2722,7 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
 
  out_err:
     while ( i-- )
-        pg[i].count_info = PGC_reserved | PGC_state_free;
+        pg[i].count_info = PGC_static | PGC_state_free;
 
     spin_unlock(&heap_lock);
 
-- 
2.25.1


