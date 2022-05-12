Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21F25248A5
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 11:12:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327495.550349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np4rx-0001a2-Aq; Thu, 12 May 2022 09:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327495.550349; Thu, 12 May 2022 09:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np4rx-0001Wz-6Q; Thu, 12 May 2022 09:12:25 +0000
Received: by outflank-mailman (input) for mailman id 327495;
 Thu, 12 May 2022 09:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsCQ=VU=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1np4rw-0000Wp-1r
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 09:12:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a1f9c86e-d1d3-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 11:12:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67EFE106F;
 Thu, 12 May 2022 02:12:22 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89FF63F73D;
 Thu, 12 May 2022 02:12:19 -0700 (PDT)
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
X-Inumbo-ID: a1f9c86e-d1d3-11ec-8fc4-03012f2f19d4
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 4/8] xen/arm: introduce put_page_nr and get_page_nr
Date: Thu, 12 May 2022 17:11:25 +0800
Message-Id: <20220512091129.2802997-5-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512091129.2802997-1-Penny.Zheng@arm.com>
References: <20220512091129.2802997-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Later, we need to add the right amount of references, which should be
the number of borrower domains, to the owner domain. Since we only have
get_page() to increment the page reference by 1, a loop is needed per
page, which is inefficient and time-consuming.

To save the loop time, this commit introduces a set of new helpers
put_page_nr() and get_page_nr() to increment/drop the page reference by nr.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- check overflow with "n"
- remove spurious change
- bring back the check that we enter the loop only when count_info is
greater than 0
---
v2 change:
- new commit
---
 xen/arch/arm/include/asm/mm.h |  4 ++++
 xen/arch/arm/mm.c             | 36 ++++++++++++++++++++++++++---------
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 424aaf2823..c737d51e4d 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -347,6 +347,10 @@ void free_init_memory(void);
 int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
                                           unsigned int order);
 
+extern bool get_page_nr(struct page_info *page, const struct domain *domain,
+                        unsigned long nr);
+extern void put_page_nr(struct page_info *page, unsigned long nr);
+
 extern void put_page_type(struct page_info *page);
 static inline void put_page_and_type(struct page_info *page)
 {
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 7b1f2f4906..a9461e07aa 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1537,7 +1537,8 @@ long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
     return 0;
 }
 
-struct domain *page_get_owner_and_reference(struct page_info *page)
+static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
+                                                      unsigned long nr)
 {
     unsigned long x, y = page->count_info;
     struct domain *owner;
@@ -1548,10 +1549,10 @@ struct domain *page_get_owner_and_reference(struct page_info *page)
          * Count ==  0: Page is not allocated, so we cannot take a reference.
          * Count == -1: Reference count would wrap, which is invalid.
          */
-        if ( unlikely(((x + 1) & PGC_count_mask) <= 1) )
+        if ( unlikely(((x + nr) & PGC_count_mask) <= 1) )
             return NULL;
     }
-    while ( (y = cmpxchg(&page->count_info, x, x + 1)) != x );
+    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
 
     owner = page_get_owner(page);
     ASSERT(owner);
@@ -1559,14 +1560,20 @@ struct domain *page_get_owner_and_reference(struct page_info *page)
     return owner;
 }
 
-void put_page(struct page_info *page)
+struct domain *page_get_owner_and_reference(struct page_info *page)
+{
+    return page_get_owner_and_nr_reference(page, 1);
+}
+
+void put_page_nr(struct page_info *page, unsigned long nr)
 {
     unsigned long nx, x, y = page->count_info;
 
     do {
-        ASSERT((y & PGC_count_mask) != 0);
+        ASSERT(((y & PGC_count_mask) != 0) &&
+               (((y - nr) & PGC_count_mask) >= 0));
         x  = y;
-        nx = x - 1;
+        nx = x - nr;
     }
     while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
 
@@ -1576,19 +1583,30 @@ void put_page(struct page_info *page)
     }
 }
 
-bool get_page(struct page_info *page, const struct domain *domain)
+void put_page(struct page_info *page)
 {
-    const struct domain *owner = page_get_owner_and_reference(page);
+    put_page_nr(page, 1);
+}
+
+bool get_page_nr(struct page_info *page, const struct domain *domain,
+                 unsigned long nr)
+{
+    const struct domain *owner = page_get_owner_and_nr_reference(page, nr);
 
     if ( likely(owner == domain) )
         return true;
 
     if ( owner != NULL )
-        put_page(page);
+        put_page_nr(page, nr);
 
     return false;
 }
 
+bool get_page(struct page_info *page, const struct domain *domain)
+{
+    return get_page_nr(page, domain, 1);
+}
+
 /* Common code requires get_page_type and put_page_type.
  * We don't care about typecounts so we just do the minimum to make it
  * happy. */
-- 
2.25.1


