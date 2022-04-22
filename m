Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5D450BBC2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 17:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311053.528048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhvKR-0008RR-Ak; Fri, 22 Apr 2022 15:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311053.528048; Fri, 22 Apr 2022 15:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhvKR-0008PW-6U; Fri, 22 Apr 2022 15:36:15 +0000
Received: by outflank-mailman (input) for mailman id 311053;
 Fri, 22 Apr 2022 15:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9oV9=VA=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1nhvKP-0008PQ-PS
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 15:36:13 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efcbd4da-c251-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 17:36:11 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id h25so5569121wrc.13
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 08:36:11 -0700 (PDT)
Received: from banana.davidvrabel.org.uk (banana.davidvrabel.org.uk.
 [82.70.146.42]) by smtp.googlemail.com with ESMTPSA id
 m21-20020a05600c3b1500b003928f20b7besm1829096wms.42.2022.04.22.08.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 08:36:10 -0700 (PDT)
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
X-Inumbo-ID: efcbd4da-c251-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FHYrzSvh6xDWNNAItKaBBuh/jI95qz9hOrlWNTaNwg0=;
        b=MRqaI3YjIVqk4qTKuNsJwDtZ34tiQNTkbdDDZJXccGvWclxDCJmzV0/eKWGtXDUVku
         slpCBYJr6NaD2UIFecon65GJT95LHTBx95VgqntwHWkttOWxbz5rSqDPzVNc51EJUo3L
         07UTbRCyJYc5hoBrz9N5IV7PjbSlu4tU2W5G+mMsEFWMITYTIngrFK60ueolqHGwYtYO
         ZbT6gfzf++Y6higrXp3GpVn7LiBZqzhgxT5+riYdb4loRd07ZDlW637siZdG/PFfHwwB
         C1/zOIgMnL7sl0wptHUePVEuImz11Ac5mVIFoxFgPuYB5X1zd40jL0lV0NXohLCmSIWv
         PF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=FHYrzSvh6xDWNNAItKaBBuh/jI95qz9hOrlWNTaNwg0=;
        b=2vBnuX5Tm2A7v06Q823NPQ+FKr5uNV2r5PJ0puQBjHKxhIwhKeUNzIWfeoraRxZCo6
         ydZrFVWWfIYvgCv4iAvY1Pi5ydvOi7ZMncRri/vv7g1EwjsBfdlUPNV6OnZ7n6A6CO29
         Hl64nvyH9EtaNIbe9bVisvZtoWa7IwmZ2+sIGJ4hhBzYqv2SUyw2RPaM/Haxux1e6JaT
         0+75WOxxRvzc8F/b/4Ps/xpjWD8wZgWFsahW/7CkcQdiujFUGjxpyiV9wgB78fzr1l53
         D/RKH2hDiegwH7Xt6PFwgbMBYIaa5efhii8PRJEvvZ9CXjL/3raQRJa8JKl4KPCeUblA
         mbqw==
X-Gm-Message-State: AOAM530zxfKZtPRbkk2FRhRuL4UY5oZjMHtXhSa8us2H7lM5ocqUeBEl
	e03TdqqBmm/RJ/OUcKSN9UyDtWN7xmuFFNqq
X-Google-Smtp-Source: ABdhPJyR6RwA1Ot8vLJYrOt6/ft0LIUL9nRnFY2FQfgrwndD84Woc/irIbYYI44b4ZOq2SjkGG2UkQ==
X-Received: by 2002:adf:e60a:0:b0:20a:c402:6810 with SMTP id p10-20020adfe60a000000b0020ac4026810mr4380911wrm.45.1650641770811;
        Fri, 22 Apr 2022 08:36:10 -0700 (PDT)
Sender: David Vrabel <d.vrabel.98@gmail.com>
From: David Vrabel <dvrabel@cantab.net>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	David Vrabel <dvrabel@amazon.co.uk>
Subject: [PATCH v3] page_alloc: assert IRQs are enabled in heap alloc/free
Date: Fri, 22 Apr 2022 16:36:01 +0100
Message-Id: <20220422153601.967318-1-dvrabel@cantab.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Vrabel <dvrabel@amazon.co.uk>

Heap pages can only be safely allocated and freed with interuupts
enabled as they may require a TLB flush which will send IPIs.

Normally spinlock debugging would catch calls from the incorrect
context, but not from stop_machine_run() action functions as these are
called with spin lock debugging disabled.

Enhance the assertions in alloc_xenheap_pages() and
alloc_domheap_pages() to check interrupts are enabled. For consistency
the same asserts are used when freeing heap pages.

As an exception, when only 1 PCPU is online, allocations are permitted
with interrupts disabled as any TLB flushes would be local only. This
is necessary during early boot.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
---
Changes in v3:
- Use num_online_cpus() in assert.

Changes in v2:
- Set SYS_STATE_smp_boot on arm.
---
 xen/common/page_alloc.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 319029140f..516ffa2a97 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -162,6 +162,13 @@
 static char __initdata opt_badpage[100] = "";
 string_param("badpage", opt_badpage);
 
+/*
+ * Heap allocations may need TLB flushes which require IRQs to be
+ * enabled (except during early boot when only 1 PCPU is online).
+ */
+#define ASSERT_ALLOC_CONTEXT() \
+    ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() == 1))
+
 /*
  * no-bootscrub -> Free pages are not zeroed during boot.
  */
@@ -2160,7 +2167,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     pg = alloc_heap_pages(MEMZONE_XEN, MEMZONE_XEN,
                           order, memflags | MEMF_no_scrub, NULL);
@@ -2173,7 +2180,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 
 void free_xenheap_pages(void *v, unsigned int order)
 {
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( v == NULL )
         return;
@@ -2202,7 +2209,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     struct page_info *pg;
     unsigned int i;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( xenheap_bits && (memflags >> _MEMF_bits) > xenheap_bits )
         memflags &= ~MEMF_bits(~0U);
@@ -2224,7 +2231,7 @@ void free_xenheap_pages(void *v, unsigned int order)
     struct page_info *pg;
     unsigned int i;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( v == NULL )
         return;
@@ -2249,7 +2256,7 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
 {
     mfn_t smfn, emfn;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     smfn = maddr_to_mfn(round_pgup(ps));
     emfn = maddr_to_mfn(round_pgdown(pe));
@@ -2369,7 +2376,7 @@ struct page_info *alloc_domheap_pages(
     unsigned int bits = memflags >> _MEMF_bits, zone_hi = NR_ZONES - 1;
     unsigned int dma_zone;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     bits = domain_clamp_alloc_bitsize(memflags & MEMF_no_owner ? NULL : d,
                                       bits ? : (BITS_PER_LONG+PAGE_SHIFT));
@@ -2419,7 +2426,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
     unsigned int i;
     bool drop_dom_ref;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( unlikely(is_xen_heap_page(pg)) )
     {
@@ -2738,7 +2745,7 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
 {
     struct page_info *pg;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     pg = acquire_staticmem_pages(smfn, nr_mfns, memflags);
     if ( !pg )
-- 
2.30.2


