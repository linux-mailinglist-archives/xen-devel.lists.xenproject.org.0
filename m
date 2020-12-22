Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9522E0CD8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 16:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57963.101678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krjpE-0006ic-T0; Tue, 22 Dec 2020 15:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57963.101678; Tue, 22 Dec 2020 15:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krjpE-0006hY-MS; Tue, 22 Dec 2020 15:43:48 +0000
Received: by outflank-mailman (input) for mailman id 57963;
 Tue, 22 Dec 2020 15:43:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krjpC-0006e6-E6
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 15:43:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krjpC-0001q2-3U; Tue, 22 Dec 2020 15:43:46 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krjpB-0002Vd-RL; Tue, 22 Dec 2020 15:43:46 +0000
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
	 bh=mOorAOnuty5dT4XVPxHkS2yx8rloYCwOnZM9EKJjgIk=; b=ZnR5j8EBlvK2vr5hUlW5i/rcV
	vFAjgpRLLsxxT33LPriWdzoJlmk8Mxs4++xBSS6onpZt6PnkaU0lUdzvpZ4YvDtbGuXEOqFgSBL3Q
	QUPEXZc5pIUociG5agRoDz1F5tSnWr8aD3p1hhih0IZIZlPbn31UKxD5zdekhhy9Ze9p8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.15 4/4] xen/iommu: x86: Don't leak the IOMMU page-tables
Date: Tue, 22 Dec 2020 15:43:38 +0000
Message-Id: <20201222154338.9459-5-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222154338.9459-1-julien@xen.org>
References: <20201222154338.9459-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The new IOMMU page-tables allocator will release the pages when
relinquish the domain resources. However, this is not sufficient in two
cases:
    1) domain_relinquish_resources() is not called when the domain
    creation fails.
    2) There is nothing preventing page-table allocations when the
    domain is dying.

In both cases, this can be solved by freeing the page-tables again
when the domain destruction. Although, this may result to an high
number of page-tables to free.

In the second case, it is pointless to allow page-table allocation when
the domain is going to die. iommu_alloc_pgtable() will now return an
error when it is called while the domain is dying.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/x86/domain.c               |  2 +-
 xen/drivers/passthrough/x86/iommu.c | 32 +++++++++++++++++++++++++++--
 xen/include/asm-x86/iommu.h         |  2 +-
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index b9ba04633e18..1b7ee5c1a8cb 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2290,7 +2290,7 @@ int domain_relinquish_resources(struct domain *d)
 
     PROGRESS(iommu_pagetables):
 
-        ret = iommu_free_pgtables(d);
+        ret = iommu_free_pgtables(d, false);
         if ( ret )
             return ret;
 
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 99a23177b3d2..4a083e4b8f11 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -149,6 +149,21 @@ int arch_iommu_domain_init(struct domain *d)
 
 void arch_iommu_domain_destroy(struct domain *d)
 {
+    struct domain_iommu *hd = dom_iommu(d);
+    int rc;
+
+    /*
+     * The relinquish code will not be executed if the domain creation
+     * failed. To avoid any memory leak, we want to free any IOMMU
+     * page-tables that may have been allocated.
+     */
+    rc = iommu_free_pgtables(d, false);
+
+    /* The preemption was disabled, so the call should never fail. */
+    if ( rc )
+        ASSERT_UNREACHABLE();
+
+    ASSERT(page_list_empty(&hd->arch.pgtables.list));
 }
 
 static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
@@ -261,7 +276,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
         return;
 }
 
-int iommu_free_pgtables(struct domain *d)
+int iommu_free_pgtables(struct domain *d, bool preempt)
 {
     struct domain_iommu *hd = dom_iommu(d);
     struct page_info *pg;
@@ -282,7 +297,7 @@ int iommu_free_pgtables(struct domain *d)
     {
         free_domheap_page(pg);
 
-        if ( !(++done & 0xff) && general_preempt_check() )
+        if ( !(++done & 0xff) && preempt && general_preempt_check() )
         {
             spin_unlock(&hd->arch.pgtables.lock);
             return -ERESTART;
@@ -305,6 +320,19 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
         memflags = MEMF_node(hd->node);
 #endif
 
+    /*
+     * The IOMMU page-tables are freed when relinquishing the domain, but
+     * nothing prevent allocation to happen afterwards. There is no valid
+     * reasons to continue to update the IOMMU page-tables while the
+     * domain is dying.
+     *
+     * So prevent page-table allocation when the domain is dying. Note
+     * this doesn't fully prevent the race because d->is_dying may not
+     * yet be seen.
+     */
+    if ( d->is_dying )
+        return NULL;
+
     pg = alloc_domheap_page(NULL, memflags);
     if ( !pg )
         return NULL;
diff --git a/xen/include/asm-x86/iommu.h b/xen/include/asm-x86/iommu.h
index 970eb06ffac5..874bb5bbfbde 100644
--- a/xen/include/asm-x86/iommu.h
+++ b/xen/include/asm-x86/iommu.h
@@ -135,7 +135,7 @@ int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
         iommu_vcall(ops, sync_cache, addr, size);       \
 })
 
-int __must_check iommu_free_pgtables(struct domain *d);
+int __must_check iommu_free_pgtables(struct domain *d, bool preempt);
 struct page_info *__must_check iommu_alloc_pgtable(struct domain *d);
 
 #endif /* !__ARCH_X86_IOMMU_H__ */
-- 
2.17.1


