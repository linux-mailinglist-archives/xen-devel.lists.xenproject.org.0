Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3765D3152CF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:28:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83289.154638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UwK-0007Ge-KD; Tue, 09 Feb 2021 15:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83289.154638; Tue, 09 Feb 2021 15:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UwK-0007FY-Db; Tue, 09 Feb 2021 15:28:32 +0000
Received: by outflank-mailman (input) for mailman id 83289;
 Tue, 09 Feb 2021 15:28:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9UwI-0007BU-39
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:28:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9UwH-0000uI-88; Tue, 09 Feb 2021 15:28:29 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9UwG-0007gX-Vo; Tue, 09 Feb 2021 15:28:29 +0000
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
	 bh=LJMsVj+8JqORqU40yjLdihq8PI5kGbY5vaa1vtJvoyo=; b=1HwMrxON3gHEeOkxPa3M1UOf+
	PxJapha9kW1ZcdNlaab938I9SyajXZKb4wtLsi9UMdJvbYCsxZdlgkybphOLDLdLX8XJQB6ivNgvb
	PmT/kg9fLGCMKgIrqQjeML6vRPUaY/9cT6kxiR0SO9aj9RI9tJwQUR9UlabxCjRO/tMvI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [for-4.15][PATCH v2 4/5] xen/iommu: x86: Don't leak the IOMMU page-tables
Date: Tue,  9 Feb 2021 15:28:15 +0000
Message-Id: <20210209152816.15792-5-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210209152816.15792-1-julien@xen.org>
References: <20210209152816.15792-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The new IOMMU page-tables allocator will release the pages when
relinquish the domain resources. However, this is not sufficient when
the domain is dying because nothing prevents page-table to be allocated.

iommu_alloc_pgtable() is now checking if the domain is dying before
adding the page in the list. We are relying on &hd->arch.pgtables.lock
to synchronize d->is_dying.

Take the opportunity to check in arch_iommu_domain_destroy() that all
that page tables have been freed.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

There is one more bug that will be solved in the next patch as I felt
they each needed a long explanation.

Changes in v2:
    - Rework the approach
    - Move the patch earlier in the series
---
 xen/drivers/passthrough/x86/iommu.c | 36 ++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index cea1032b3d02..82d770107a47 100644
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
@@ -267,6 +274,12 @@ int iommu_free_pgtables(struct domain *d)
     struct page_info *pg;
     unsigned int done = 0;
 
+    if ( !is_iommu_enabled(d) )
+        return 0;
+
+    /* After this barrier no new page allocations can occur. */
+    spin_barrier(&hd->arch.pgtables.lock);
+
     while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
     {
         free_domheap_page(pg);
@@ -284,6 +297,7 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
     unsigned int memflags = 0;
     struct page_info *pg;
     void *p;
+    bool alive = false;
 
 #ifdef CONFIG_NUMA
     if ( hd->node != NUMA_NO_NODE )
@@ -303,9 +317,29 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
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


