Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A4A31DB6F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 15:25:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86284.161881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNlO-0005LX-ET; Wed, 17 Feb 2021 14:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86284.161881; Wed, 17 Feb 2021 14:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNlO-0005Kq-80; Wed, 17 Feb 2021 14:25:10 +0000
Received: by outflank-mailman (input) for mailman id 86284;
 Wed, 17 Feb 2021 14:25:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCNlM-0005Jb-Vv
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 14:25:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCNlM-0004eb-6H; Wed, 17 Feb 2021 14:25:08 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCNlL-00057m-TP; Wed, 17 Feb 2021 14:25:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=eHbALjFmdHYfqoCsH6vCHJNGB5r0g1/oYxtKAGV8sK0=; b=JYG72ERHoej3PUjHk2Ezhu6HI
	6R/Jd6aWbu6IG7m/idXbr+zjnMm4YDUpSLitQsM0p3sdFlVMYxW+Y4SehyOKFh6vWnDyufcfjxkcE
	giAPs4bmXmGSCWr/sm29fqlQmzIR+ogVnElCABJ24D83UU9bgwQGoOm1acNo3zL1PLYMs=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [for-4.15][PATCH v3 3/3] xen/iommu: x86: Harden the IOMMU page-table allocator
Date: Wed, 17 Feb 2021 14:24:58 +0000
Message-Id: <20210217142458.3769-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217142458.3769-1-julien@xen.org>
References: <20210217142458.3769-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

At the moment, we are assuming that only iommu_map() can allocate
IOMMU page-table.

Given the complexity of the IOMMU framework, it would be sensible to
have a check closer to the IOMMU allocator. This would avoid to leak
IOMMU page-tables again in the future.

iommu_alloc_pgtable() is now checking if the domain is dying before
adding the page in the list. We are relying on &hd->arch.pgtables.lock
to synchronize d->is_dying.

Take the opportunity to add an ASSERT() in arch_iommu_domain_destroy()
to check if we freed all the IOMMU page tables.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Changes in v3:
    - Rename the patch. This was originally "xen/iommu: x86: Don't leak
    the IOMMU page-tables"
    - Rework the commit message
    - Move the patch towards the end of the series

Changes in v2:
    - Rework the approach
    - Move the patch earlier in the series
---
 xen/drivers/passthrough/x86/iommu.c | 33 ++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index faa0078db595..a67075f0045d 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -149,6 +149,13 @@ int arch_iommu_domain_init(struct domain *d)
 
 void arch_iommu_domain_destroy(struct domain *d)
 {
+    /*
+     * There should be not page-tables left allocated by the time the
+     * domain is destroyed. Note that arch_iommu_domain_destroy() is
+     * called unconditionally, so pgtables may be unitialized.
+     */
+    ASSERT(dom_iommu(d)->platform_ops == NULL ||
+           page_list_empty(&dom_iommu(d)->arch.pgtables.list));
 }
 
 static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
@@ -279,6 +286,9 @@ int iommu_free_pgtables(struct domain *d)
      */
     hd->platform_ops->clear_root_pgtable(d);
 
+    /* After this barrier no new page allocations can occur. */
+    spin_barrier(&hd->arch.pgtables.lock);
+
     while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
     {
         free_domheap_page(pg);
@@ -296,6 +306,7 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
     unsigned int memflags = 0;
     struct page_info *pg;
     void *p;
+    bool alive = false;
 
 #ifdef CONFIG_NUMA
     if ( hd->node != NUMA_NO_NODE )
@@ -315,9 +326,29 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
     unmap_domain_page(p);
 
     spin_lock(&hd->arch.pgtables.lock);
-    page_list_add(pg, &hd->arch.pgtables.list);
+    /*
+     * The IOMMU page-tables are freed when relinquishing the domain, but
+     * nothing prevent allocation to happen afterwards. There is no valid
+     * reasons to continue to update the IOMMU page-tables while the
+     * domain is dying.
+     *
+     * So prevent page-table allocation when the domain is dying.
+     *
+     * We relying on &hd->arch.pgtables.lock to synchronize d->is_dying.
+     */
+    if ( likely(!d->is_dying) )
+    {
+        alive = true;
+        page_list_add(pg, &hd->arch.pgtables.list);
+    }
     spin_unlock(&hd->arch.pgtables.lock);
 
+    if ( unlikely(!alive) )
+    {
+        free_domheap_page(pg);
+        pg = NULL;
+    }
+
     return pg;
 }
 
-- 
2.17.1


