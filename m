Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF2649905
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 07:42:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459090.716762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4cVP-0008DR-Qn; Mon, 12 Dec 2022 06:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459090.716762; Mon, 12 Dec 2022 06:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4cVP-0008Ay-Nh; Mon, 12 Dec 2022 06:41:39 +0000
Received: by outflank-mailman (input) for mailman id 459090;
 Mon, 12 Dec 2022 06:41:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tmz+=4K=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p4cVO-0008As-0L
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 06:41:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 058a2905-79e8-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 07:41:35 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 207BF1FB;
 Sun, 11 Dec 2022 22:42:15 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BA053F71E;
 Sun, 11 Dec 2022 22:41:32 -0800 (PST)
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
X-Inumbo-ID: 058a2905-79e8-11ed-91b6-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Reduce redundant clear root pages when teardown p2m
Date: Mon, 12 Dec 2022 14:41:19 +0800
Message-Id: <20221212064119.2632626-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, p2m for a domain will be teardown from two paths:
(1) The normal path when a domain is destroyed.
(2) The arch_domain_destroy() in the failure path of domain creation.

When tearing down p2m from (1), the part to clear and clean the root
is only needed to do once rather than for every call of p2m_teardown().
If the p2m teardown is from (2), the clear and clean of the root
is unnecessary because the domain is not scheduled.

Therefore, this patch introduces a helper `p2m_clear_root_pages()` to
do the clear and clean of the root, and move this logic outside of
p2m_teardown(). With this movement, the `page_list_empty(&p2m->pages)`
check can be dropped.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/domain.c          |  5 +++++
 xen/arch/arm/include/asm/p2m.h |  1 +
 xen/arch/arm/p2m.c             | 23 ++++++++++++-----------
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 99577adb6c..29c189aab4 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1022,6 +1022,11 @@ int domain_relinquish_resources(struct domain *d)
             return ret;
 
     PROGRESS(p2m):
+        /*
+         * We are about to free the intermediate page-tables, so clear the
+         * root to prevent any walk to use them.
+         */
+        p2m_clear_root_pages(&d->arch.p2m);
         ret = p2m_teardown(d, true);
         if ( ret )
             return ret;
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 91df922e1c..bf5183e53a 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -281,6 +281,7 @@ int p2m_set_entry(struct p2m_domain *p2m,
 
 bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn);
 
+void p2m_clear_root_pages(struct p2m_domain *p2m);
 void p2m_invalidate_root(struct p2m_domain *p2m);
 
 /*
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 948f199d84..0c942c5923 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1314,6 +1314,18 @@ static void p2m_invalidate_table(struct p2m_domain *p2m, mfn_t mfn)
     p2m->need_flush = true;
 }
 
+void p2m_clear_root_pages(struct p2m_domain *p2m)
+{
+    unsigned int i;
+
+    p2m_write_lock(p2m);
+
+    for ( i = 0; i < P2M_ROOT_PAGES; i++ )
+        clear_and_clean_page(p2m->root + i);
+
+    p2m_write_unlock(p2m);
+}
+
 /*
  * Invalidate all entries in the root page-tables. This is
  * useful to get fault on entry and do an action.
@@ -1698,21 +1710,10 @@ int p2m_teardown(struct domain *d, bool allow_preemption)
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     unsigned long count = 0;
     struct page_info *pg;
-    unsigned int i;
     int rc = 0;
 
-    if ( page_list_empty(&p2m->pages) )
-        return 0;
-
     p2m_write_lock(p2m);
 
-    /*
-     * We are about to free the intermediate page-tables, so clear the
-     * root to prevent any walk to use them.
-     */
-    for ( i = 0; i < P2M_ROOT_PAGES; i++ )
-        clear_and_clean_page(p2m->root + i);
-
     /*
      * The domain will not be scheduled anymore, so in theory we should
      * not need to flush the TLBs. Do it for safety purpose.
-- 
2.25.1


