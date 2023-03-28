Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A606CB7CB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 09:14:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515555.798571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph3X7-0002sz-Db; Tue, 28 Mar 2023 07:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515555.798571; Tue, 28 Mar 2023 07:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph3X7-0002qX-9a; Tue, 28 Mar 2023 07:14:17 +0000
Received: by outflank-mailman (input) for mailman id 515555;
 Tue, 28 Mar 2023 07:14:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TlhL=7U=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ph3X5-0001nm-VL
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 07:14:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 255b2265-cd38-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 09:14:14 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 869AEC14;
 Tue, 28 Mar 2023 00:14:58 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 970303F73F;
 Tue, 28 Mar 2023 00:14:11 -0700 (PDT)
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
X-Inumbo-ID: 255b2265-cd38-11ed-85db-49a42c6b2330
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3 4/4] xen/arm: Clean-up in p2m_init() and p2m_final_teardown()
Date: Tue, 28 Mar 2023 15:13:34 +0800
Message-Id: <20230328071334.2098429-5-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230328071334.2098429-1-Henry.Wang@arm.com>
References: <20230328071334.2098429-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the change in previous patch, the initial 16 pages in the P2M
pool is not necessary anymore. Drop them for code simplification.

Also the call to p2m_teardown() from arch_domain_destroy() is not
necessary anymore since the movement of the P2M allocation out of
arch_domain_create(). Drop the code and the above in-code comment
mentioning it. Take the opportunity to fix a typo in the original
in-code comment.

With above clean-up, the second parameter of p2m_teardown() is
also not needed anymore. Drop this parameter and the logic related
to this parameter.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v2 -> v3:
1. Correct a typo in original in-code comment, slightly modify
   the wording to avoid the presence of preemptive/non-preemptive
   p2m_teardown() call assumption.
2. Drop the (now) unnecessary second parameter of p2m_teardown().
3. Update the commit message.
v1 -> v2:
1. Add Reviewed-by tag from Michal.
---
 xen/arch/arm/domain.c          |  2 +-
 xen/arch/arm/include/asm/p2m.h | 14 +++++---------
 xen/arch/arm/p2m.c             | 24 +++---------------------
 3 files changed, 9 insertions(+), 31 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index b8a4a60570..d8ef6501ff 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1030,7 +1030,7 @@ int domain_relinquish_resources(struct domain *d)
         p2m_clear_root_pages(&d->arch.p2m);
 
     PROGRESS(p2m):
-        ret = p2m_teardown(d, true);
+        ret = p2m_teardown(d);
         if ( ret )
             return ret;
 
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index bf5183e53a..f67e9ddc72 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -194,18 +194,14 @@ int p2m_init(struct domain *d);
 
 /*
  * The P2M resources are freed in two parts:
- *  - p2m_teardown() will be called preemptively when relinquish the
- *    resources, in which case it will free large resources (e.g. intermediate
- *    page-tables) that requires preemption.
+ *  - p2m_teardown() will be called when relinquish the resources. It
+ *    will free large resources (e.g. intermediate page-tables) that
+ *    requires preemption.
  *  - p2m_final_teardown() will be called when domain struct is been
- *    freed. This *cannot* be preempted and therefore one small
+ *    freed. This *cannot* be preempted and therefore only small
  *    resources should be freed here.
- *  Note that p2m_final_teardown() will also call p2m_teardown(), to properly
- *  free the P2M when failures happen in the domain creation with P2M pages
- *  already in use. In this case p2m_teardown() is called non-preemptively and
- *  p2m_teardown() will always return 0.
  */
-int p2m_teardown(struct domain *d, bool allow_preemption);
+int p2m_teardown(struct domain *d);
 void p2m_final_teardown(struct domain *d);
 
 /*
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index f1ccd7efbd..418997843d 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1713,7 +1713,7 @@ static void p2m_free_vmid(struct domain *d)
     spin_unlock(&vmid_alloc_lock);
 }
 
-int p2m_teardown(struct domain *d, bool allow_preemption)
+int p2m_teardown(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     unsigned long count = 0;
@@ -1727,7 +1727,7 @@ int p2m_teardown(struct domain *d, bool allow_preemption)
         p2m_free_page(p2m->domain, pg);
         count++;
         /* Arbitrarily preempt every 512 iterations */
-        if ( allow_preemption && !(count % 512) && hypercall_preempt_check() )
+        if ( !(count % 512) && hypercall_preempt_check() )
         {
             rc = -ERESTART;
             break;
@@ -1750,13 +1750,9 @@ void p2m_final_teardown(struct domain *d)
     /*
      * No need to call relinquish_p2m_mapping() here because
      * p2m_final_teardown() is called either after domain_relinquish_resources()
-     * where relinquish_p2m_mapping() has been called, or from failure path of
-     * domain_create()/arch_domain_create() where mappings that require
-     * p2m_put_l3_page() should never be created. For the latter case, also see
-     * comment on top of the p2m_set_entry() for more info.
+     * where relinquish_p2m_mapping() has been called.
      */
 
-    BUG_ON(p2m_teardown(d, false));
     ASSERT(page_list_empty(&p2m->pages));
 
     while ( p2m_teardown_allocation(d) == -ERESTART )
@@ -1827,20 +1823,6 @@ int p2m_init(struct domain *d)
     if ( rc )
         return rc;
 
-    /*
-     * Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
-     * when the domain is created. Considering the worst case for page
-     * tables and keep a buffer, populate 16 pages to the P2M pages pool here.
-     * For GICv3, the above-mentioned P2M mapping is not necessary, but since
-     * the allocated 16 pages here would not be lost, hence populate these
-     * pages unconditionally.
-     */
-    spin_lock(&d->arch.paging.lock);
-    rc = p2m_set_allocation(d, 16, NULL);
-    spin_unlock(&d->arch.paging.lock);
-    if ( rc )
-        return rc;
-
     return 0;
 }
 
-- 
2.25.1


