Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C00600805
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 09:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424144.671358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okKpW-0005eR-M0; Mon, 17 Oct 2022 07:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424144.671358; Mon, 17 Oct 2022 07:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okKpW-0005cD-JD; Mon, 17 Oct 2022 07:46:34 +0000
Received: by outflank-mailman (input) for mailman id 424144;
 Mon, 17 Oct 2022 07:46:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rSUT=2S=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1okKpU-0005c7-F9
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 07:46:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cec7af96-4def-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 09:46:28 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B11471042;
 Mon, 17 Oct 2022 00:46:33 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30E433F792;
 Mon, 17 Oct 2022 00:46:24 -0700 (PDT)
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
X-Inumbo-ID: cec7af96-4def-11ed-91b4-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] xen/arm: p2m: Populate pages for GICv2 mapping in arch_domain_create()
Date: Mon, 17 Oct 2022 07:46:18 +0000
Message-Id: <20221017074618.36818-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1

Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
when the domain is created. Considering the worst case of page tables
which requires 6 P2M pages as the two pages will be consecutive but not
necessarily in the same L3 page table and keep a buffer, populate 16
pages as the default value to the P2M pages pool in arch_domain_create()
at the domain creation stage to satisfy the GICv2 requirement. For
GICv3, the above-mentioned P2M mapping is not necessary, but since the
allocated 16 pages here would not be lost, hence populate these pages
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
---
This should also be backported to 4.13, 4.14, 4.15 and 4.16.
v3 changes:
- Move the population of default pages to p2m_init().
- Use a loop over p2m_teardown_allocation() to implement the
  non-preemptive p2m_teardown_allocation() and avoid open-coding.
- Reorder assertions in p2m_final_teardown().
- Add p2m_teardown() will always return 0 if called non-preemptively in
  doc, move the page_list_empty(&p2m->pages) check to p2m_teardown()
  and use a BUG_ON to confirm p2m_teardown() will return 0 in
  p2m_final_teardown().
- Add a comment in p2m_final_teardown() to mention relinquish_p2m_mapping()
  does not need to be called, also update commit message.
v2 changes:
- Move the p2m_set_allocation(d, 0, NULL); to p2m_final_teardown().
- Support optionally preemption of p2m_teardown(), and make the calling of
  p2m_teardown() preemptively when relinquish the resources, non-preemptively
  in p2m_final_teardown().
- Refactor the error handling to make the code use less spin_unlock.
- Explain the worst case of page tables and the unconditional population
  of pages in commit message.
- Mention the unconditional population of pages in in-code comment.
---
 xen/arch/arm/domain.c          |  2 +-
 xen/arch/arm/include/asm/p2m.h | 14 ++++++++++----
 xen/arch/arm/p2m.c             | 34 ++++++++++++++++++++++++++++++++--
 3 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2c84e6dbbb..38e22f12af 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1064,7 +1064,7 @@ int domain_relinquish_resources(struct domain *d)
             return ret;
 
     PROGRESS(p2m):
-        ret = p2m_teardown(d);
+        ret = p2m_teardown(d, true);
         if ( ret )
             return ret;
 
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 42bfd548c4..c8f14d13c2 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -194,14 +194,18 @@ int p2m_init(struct domain *d);
 
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
@@ -266,6 +270,8 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
 /*
  * Direct set a p2m entry: only for use by the P2M code.
  * The P2M write lock should be taken.
+ * TODO: Add a check in __p2m_set_entry() to avoid creating a mapping in
+ * arch_domain_create() that requires p2m_put_l3_page() to be called.
  */
 int p2m_set_entry(struct p2m_domain *p2m,
                   gfn_t sgfn,
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index f17500ddf3..8c9ddf58e1 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1685,7 +1685,7 @@ static void p2m_free_vmid(struct domain *d)
     spin_unlock(&vmid_alloc_lock);
 }
 
-int p2m_teardown(struct domain *d)
+int p2m_teardown(struct domain *d, bool allow_preemption)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     unsigned long count = 0;
@@ -1693,6 +1693,9 @@ int p2m_teardown(struct domain *d)
     unsigned int i;
     int rc = 0;
 
+    if ( page_list_empty(&p2m->pages) )
+        return 0;
+
     p2m_write_lock(p2m);
 
     /*
@@ -1716,7 +1719,7 @@ int p2m_teardown(struct domain *d)
         p2m_free_page(p2m->domain, pg);
         count++;
         /* Arbitrarily preempt every 512 iterations */
-        if ( !(count % 512) && hypercall_preempt_check() )
+        if ( allow_preemption && !(count % 512) && hypercall_preempt_check() )
         {
             rc = -ERESTART;
             break;
@@ -1736,7 +1739,20 @@ void p2m_final_teardown(struct domain *d)
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
@@ -1762,6 +1778,20 @@ int p2m_init(struct domain *d)
     INIT_PAGE_LIST_HEAD(&p2m->pages);
     INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
 
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
+    if ( rc != 0 )
+        return rc;
+
     p2m->vmid = INVALID_VMID;
 
     rc = p2m_alloc_vmid(d);
-- 
2.17.1


