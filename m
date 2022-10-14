Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F7E5FEA27
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 10:09:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422523.668603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojFlA-0008U8-F9; Fri, 14 Oct 2022 08:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422523.668603; Fri, 14 Oct 2022 08:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojFlA-0008R8-Ba; Fri, 14 Oct 2022 08:09:36 +0000
Received: by outflank-mailman (input) for mailman id 422523;
 Fri, 14 Oct 2022 08:09:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pkr=2P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojFl8-0008R1-RC
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 08:09:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 887923b6-4b97-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 10:09:32 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBFFD1424;
 Fri, 14 Oct 2022 01:09:37 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A78E3F67D;
 Fri, 14 Oct 2022 01:09:29 -0700 (PDT)
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
X-Inumbo-ID: 887923b6-4b97-11ed-8fd0-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in arch_domain_create()
Date: Fri, 14 Oct 2022 08:09:17 +0000
Message-Id: <20221014080917.14980-1-Henry.Wang@arm.com>
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
p2m_set_allocation(d, 0, NULL) in p2m_final_teardown() if needed.

Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M pool")
Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
This should also be backported to 4.13, 4.14, 4.15 and 4.16.
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
 xen/arch/arm/domain.c          | 16 +++++++++++++++-
 xen/arch/arm/include/asm/p2m.h | 11 +++++++----
 xen/arch/arm/p2m.c             | 15 +++++++++++++--
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2c84e6dbbb..831e248ad7 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -740,6 +740,20 @@ int arch_domain_create(struct domain *d,
         BUG();
     }
 
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
+        goto fail;
+
     if ( (rc = domain_vgic_register(d, &count)) != 0 )
         goto fail;
 
@@ -1064,7 +1078,7 @@ int domain_relinquish_resources(struct domain *d)
             return ret;
 
     PROGRESS(p2m):
-        ret = p2m_teardown(d);
+        ret = p2m_teardown(d, true);
         if ( ret )
             return ret;
 
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 42bfd548c4..480d65e95e 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -194,14 +194,17 @@ int p2m_init(struct domain *d);
 
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
+ *  already in use. In this case p2m_teardown() is called non-preemptively.
  */
-int p2m_teardown(struct domain *d);
+int p2m_teardown(struct domain *d, bool allow_preemption);
 void p2m_final_teardown(struct domain *d);
 
 /*
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index f17500ddf3..707bd3e2e3 100644
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
@@ -1716,7 +1716,7 @@ int p2m_teardown(struct domain *d)
         p2m_free_page(p2m->domain, pg);
         count++;
         /* Arbitrarily preempt every 512 iterations */
-        if ( !(count % 512) && hypercall_preempt_check() )
+        if ( allow_preemption && !(count % 512) && hypercall_preempt_check() )
         {
             rc = -ERESTART;
             break;
@@ -1736,6 +1736,17 @@ void p2m_final_teardown(struct domain *d)
     if ( !p2m->domain )
         return;
 
+    if ( !page_list_empty(&p2m->pages) )
+        p2m_teardown(d, false);
+
+    if ( d->arch.paging.p2m_total_pages != 0 )
+    {
+        spin_lock(&d->arch.paging.lock);
+        p2m_set_allocation(d, 0, NULL);
+        spin_unlock(&d->arch.paging.lock);
+        ASSERT(d->arch.paging.p2m_total_pages == 0);
+    }
+
     ASSERT(page_list_empty(&p2m->pages));
     ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
 
-- 
2.17.1


