Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4A71C088E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:50:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG8a-0004Vq-5j; Thu, 30 Apr 2020 20:50:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG8Y-0004VJ-Sb
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:50:26 +0000
X-Inumbo-ID: 2e6e8f89-8b24-11ea-9ab3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e6e8f89-8b24-11ea-9ab3-12813bfff9fa;
 Thu, 30 Apr 2020 20:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uiGyNUH2p33cZ+IUo5Oln93DkD9Vx7DyiuUT3pjDMT0=; b=aey+DHDqSODtkbq0t9Hwwo/d3g
 EP6M4/fDeLHgbGAz+AerEAn1WQ5DNbCAzIQQz0lmxW78Y5aSCThHx7v4Xvhq/TTlvKhO/ly8+KIo5
 GdSKM2A33MZigBhvfQoJ10nafkunwzZbG9KpaKSH6sfagQ3b73ZKT/PVzl7baGsWDFA8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG8I-0004UX-I4; Thu, 30 Apr 2020 20:50:10 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG3E-0005wj-LT; Thu, 30 Apr 2020 20:44:56 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 13/16] xen/page_alloc: add a path for xenheap when there is no
 direct map
Date: Thu, 30 Apr 2020 21:44:22 +0100
Message-Id: <32ae7c14babf7e78b60febb53095a74c5e865456.1588278317.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

When there is not an always-mapped direct map, xenheap allocations need
to be mapped and unmapped on-demand.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/common/page_alloc.c | 45 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 10b7aeca48..1285fc5977 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2143,6 +2143,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
 void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
+    void *ret;
 
     ASSERT(!in_irq());
 
@@ -2151,14 +2152,27 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     if ( unlikely(pg == NULL) )
         return NULL;
 
-    memguard_unguard_range(page_to_virt(pg), 1 << (order + PAGE_SHIFT));
+    ret = page_to_virt(pg);
 
-    return page_to_virt(pg);
+    if ( !arch_has_directmap() &&
+         map_pages_to_xen((unsigned long)ret, page_to_mfn(pg), 1UL << order,
+                          PAGE_HYPERVISOR) )
+        {
+            /* Failed to map xenheap pages. */
+            free_heap_pages(pg, order, false);
+            return NULL;
+        }
+
+    memguard_unguard_range(ret, 1 << (order + PAGE_SHIFT));
+
+    return ret;
 }
 
 
 void free_xenheap_pages(void *v, unsigned int order)
 {
+    unsigned long va = (unsigned long)v & PAGE_MASK;
+
     ASSERT(!in_irq());
 
     if ( v == NULL )
@@ -2166,6 +2180,12 @@ void free_xenheap_pages(void *v, unsigned int order)
 
     memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
 
+    if ( !arch_has_directmap() &&
+         destroy_xen_mappings(va, va + (1UL << (order + PAGE_SHIFT))) )
+        dprintk(XENLOG_WARNING,
+                "Error while destroying xenheap mappings at %p, order %u\n",
+                v, order)
+
     free_heap_pages(virt_to_page(v), order, false);
 }
 
@@ -2189,6 +2209,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
     unsigned int i;
+    void *ret;
 
     ASSERT(!in_irq());
 
@@ -2201,16 +2222,28 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     if ( unlikely(pg == NULL) )
         return NULL;
 
+    ret = page_to_virt(pg);
+
+    if ( !arch_has_directmap() &&
+         map_pages_to_xen((unsigned long)ret, page_to_mfn(pg), 1UL << order,
+                          PAGE_HYPERVISOR) )
+        {
+            /* Failed to map xenheap pages. */
+            free_domheap_pages(pg, order);
+            return NULL;
+        }
+
     for ( i = 0; i < (1u << order); i++ )
         pg[i].count_info |= PGC_xen_heap;
 
-    return page_to_virt(pg);
+    return ret;
 }
 
 void free_xenheap_pages(void *v, unsigned int order)
 {
     struct page_info *pg;
     unsigned int i;
+    unsigned long va = (unsigned long)v & PAGE_MASK;
 
     ASSERT(!in_irq());
 
@@ -2222,6 +2255,12 @@ void free_xenheap_pages(void *v, unsigned int order)
     for ( i = 0; i < (1u << order); i++ )
         pg[i].count_info &= ~PGC_xen_heap;
 
+    if ( !arch_has_directmap() &&
+         destroy_xen_mappings(va, va + (1UL << (order + PAGE_SHIFT))) )
+        dprintk(XENLOG_WARNING,
+                "Error while destroying xenheap mappings at %p, order %u\n",
+                v, order);
+
     free_heap_pages(pg, order, true);
 }
 
-- 
2.24.1.AMZN


