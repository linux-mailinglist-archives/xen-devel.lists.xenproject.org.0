Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770EA60C7D6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 11:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429668.680810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onG6R-0003Rd-2X; Tue, 25 Oct 2022 09:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429668.680810; Tue, 25 Oct 2022 09:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onG6Q-0003Mz-V5; Tue, 25 Oct 2022 09:20:06 +0000
Received: by outflank-mailman (input) for mailman id 429668;
 Tue, 25 Oct 2022 09:20:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBMn=22=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1onG6P-0002yZ-92
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 09:20:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 32f0f52e-5446-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 11:20:00 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 293ECD6E;
 Tue, 25 Oct 2022 02:20:08 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D00513F792;
 Tue, 25 Oct 2022 02:19:59 -0700 (PDT)
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
X-Inumbo-ID: 32f0f52e-5446-11ed-8fd0-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.13 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in p2m_init()
Date: Tue, 25 Oct 2022 09:19:37 +0000
Message-Id: <20221025091937.44961-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221025091937.44961-1-Henry.Wang@arm.com>
References: <20221025091937.44961-1-Henry.Wang@arm.com>

Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
when the domain is created. Considering the worst case of page tables
which requires 6 P2M pages as the two pages will be consecutive but not
necessarily in the same L3 page table and keep a buffer, populate 16
pages as the default value to the P2M pages pool in p2m_init() at the
domain creation stage to satisfy the GICv2 requirement. For GICv3, the
above-mentioned P2M mapping is not necessary, but since the allocated
16 pages here would not be lost, hence populate these pages
unconditionally.

With the default 16 P2M pages populated, there would be a case that
failures would happen in the domain creation with P2M pages already in
use. To properly free the P2M for this case, firstly support the
optionally preemption of p2m_teardown(), then call p2m_teardown() and
p2m_set_allocation(d, 0, NULL) non-preemptively in p2m_final_teardown().
As non-preemptive p2m_teardown() should only return 0, use a
BUG_ON to confirm that.

Since p2m_final_teardown() is called either after
domain_relinquish_resources() where relinquish_p2m_mapping() has been
called, or from failure path of domain_create()/arch_domain_create()
where mappings that require p2m_put_l3_page() should never be created,
relinquish_p2m_mapping() is not added in p2m_final_teardown(), add
in-code comments to refer this.

Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M pool")
Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
(cherry picked from commit: c7cff1188802646eaa38e918e5738da0e84949be)
---
 xen/arch/arm/domain.c     |  2 +-
 xen/arch/arm/p2m.c        | 34 ++++++++++++++++++++++++++++++++--
 xen/include/asm-arm/p2m.h | 14 ++++++++++----
 3 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 31abe7d6f9..98395173db 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1018,7 +1018,7 @@ int domain_relinquish_resources(struct domain *d)
         /* Fallthrough */
 
     case RELMEM_p2m:
-        ret = p2m_teardown(d);
+        ret = p2m_teardown(d, true);
         if ( ret )
             return ret;
 
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index fa6d0a83e9..ae0c8d23d4 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1629,7 +1629,7 @@ static void p2m_free_vmid(struct domain *d)
     spin_unlock(&vmid_alloc_lock);
 }
 
-int p2m_teardown(struct domain *d)
+int p2m_teardown(struct domain *d, bool allow_preemption)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     unsigned long count = 0;
@@ -1637,6 +1637,9 @@ int p2m_teardown(struct domain *d)
     unsigned int i;
     int rc = 0;
 
+    if ( page_list_empty(&p2m->pages) )
+        return 0;
+
     p2m_write_lock(p2m);
 
     /*
@@ -1660,7 +1663,7 @@ int p2m_teardown(struct domain *d)
         p2m_free_page(p2m->domain, pg);
         count++;
         /* Arbitrarily preempt every 512 iterations */
-        if ( !(count % 512) && hypercall_preempt_check() )
+        if ( allow_preemption && !(count % 512) && hypercall_preempt_check() )
         {
             rc = -ERESTART;
             break;
@@ -1680,7 +1683,20 @@ void p2m_final_teardown(struct domain *d)
     if ( !p2m->domain )
         return;
 
+    /*
+     * No need to call relinquish_p2m_mapping() here because
+     * p2m_final_teardown() is called either after domain_relinquish_resources()
+     * where relinquish_p2m_mapping() has been called, or from failure path of
+     * domain_create()/arch_domain_create() where mappings that require
+     * p2m_put_l3_page() should never be created. For the latter case, also see
+     * comment on top of the p2m_set_entry() for more info.
+     */
+
+    BUG_ON(p2m_teardown(d, false));
     ASSERT(page_list_empty(&p2m->pages));
+
+    while ( p2m_teardown_allocation(d) == -ERESTART )
+        continue; /* No preemption support here */
     ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
 
     if ( p2m->root )
@@ -1747,6 +1763,20 @@ int p2m_init(struct domain *d)
     if ( rc )
         return rc;
 
+    /*
+     * Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
+     * when the domain is created. Considering the worst case for page
+     * tables and keep a buffer, populate 16 pages to the P2M pages pool here.
+     * For GICv3, the above-mentioned P2M mapping is not necessary, but since
+     * the allocated 16 pages here would not be lost, hence populate these
+     * pages unconditionally.
+     */
+    spin_lock(&d->arch.paging.lock);
+    rc = p2m_set_allocation(d, 16, NULL);
+    spin_unlock(&d->arch.paging.lock);
+    if ( rc )
+        return rc;
+
     return 0;
 }
 
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
index b1c9b947bb..45d535830f 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -173,14 +173,18 @@ int p2m_init(struct domain *d);
 
 /*
  * The P2M resources are freed in two parts:
- *  - p2m_teardown() will be called when relinquish the resources. It
- *    will free large resources (e.g. intermediate page-tables) that
- *    requires preemption.
+ *  - p2m_teardown() will be called preemptively when relinquish the
+ *    resources, in which case it will free large resources (e.g. intermediate
+ *    page-tables) that requires preemption.
  *  - p2m_final_teardown() will be called when domain struct is been
  *    freed. This *cannot* be preempted and therefore one small
  *    resources should be freed here.
+ *  Note that p2m_final_teardown() will also call p2m_teardown(), to properly
+ *  free the P2M when failures happen in the domain creation with P2M pages
+ *  already in use. In this case p2m_teardown() is called non-preemptively and
+ *  p2m_teardown() will always return 0.
  */
-int p2m_teardown(struct domain *d);
+int p2m_teardown(struct domain *d, bool allow_preemption);
 void p2m_final_teardown(struct domain *d);
 
 /*
@@ -245,6 +249,8 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
 /*
  * Direct set a p2m entry: only for use by the P2M code.
  * The P2M write lock should be taken.
+ * TODO: Add a check in __p2m_set_entry() to avoid creating a mapping in
+ * arch_domain_create() that requires p2m_put_l3_page() to be called.
  */
 int p2m_set_entry(struct p2m_domain *p2m,
                   gfn_t sgfn,
-- 
2.17.1


