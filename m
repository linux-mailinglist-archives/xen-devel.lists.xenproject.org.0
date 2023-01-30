Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 527F86804D2
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 05:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486521.753890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLZa-00010V-LJ; Mon, 30 Jan 2023 04:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486521.753890; Mon, 30 Jan 2023 04:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLZa-0000yG-Hw; Mon, 30 Jan 2023 04:15:14 +0000
Received: by outflank-mailman (input) for mailman id 486521;
 Mon, 30 Jan 2023 04:15:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JFid=53=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pMLRL-000485-I6
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 04:06:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 803d39b6-a053-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 05:06:41 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDC1F1FB;
 Sun, 29 Jan 2023 20:07:22 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 331583F64C;
 Sun, 29 Jan 2023 20:06:37 -0800 (PST)
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
X-Inumbo-ID: 803d39b6-a053-11ed-b8d1-410ff93cb8f0
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 4/4] xen/arm: Clean-up in p2m_init() and p2m_final_teardown()
Date: Mon, 30 Jan 2023 12:06:14 +0800
Message-Id: <20230130040614.188296-5-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130040614.188296-1-Henry.Wang@arm.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the change in previous patch, the initial 16 pages in the P2M
pool is not necessary anymore. Drop them for code simplification.

Also the call to p2m_teardown() from arch_domain_destroy() is not
necessary anymore since the movement of the P2M allocation out of
arch_domain_create(). Drop the code and the above in-code comment
mentioning it.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
I am not entirely sure if I should also drop the "TODO" on top of
the p2m_set_entry(). Because although we are sure there is no
p2m pages populated in domain_create() stage now, but we are not
sure if anyone will add more in the future...Any comments?
v1 -> v2:
1. Add Reviewed-by tag from Michal.
---
 xen/arch/arm/include/asm/p2m.h |  4 ----
 xen/arch/arm/p2m.c             | 20 +-------------------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index bf5183e53a..cf06d3cc21 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -200,10 +200,6 @@ int p2m_init(struct domain *d);
  *  - p2m_final_teardown() will be called when domain struct is been
  *    freed. This *cannot* be preempted and therefore one small
  *    resources should be freed here.
- *  Note that p2m_final_teardown() will also call p2m_teardown(), to properly
- *  free the P2M when failures happen in the domain creation with P2M pages
- *  already in use. In this case p2m_teardown() is called non-preemptively and
- *  p2m_teardown() will always return 0.
  */
 int p2m_teardown(struct domain *d, bool allow_preemption);
 void p2m_final_teardown(struct domain *d);
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index f1ccd7efbd..46406a9eb1 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
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


