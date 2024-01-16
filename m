Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D0082F500
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668018.1039855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPol6-0006e4-TL; Tue, 16 Jan 2024 19:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668018.1039855; Tue, 16 Jan 2024 19:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPol6-0006bY-Pe; Tue, 16 Jan 2024 19:06:00 +0000
Received: by outflank-mailman (input) for mailman id 668018;
 Tue, 16 Jan 2024 19:05:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoXy-0002UD-NF
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:52:26 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6294a509-b4a0-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 19:52:25 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-9fe6ad2f.us-east-1.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:52:23 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
 by email-inbound-relay-iad-1a-m6i4x-9fe6ad2f.us-east-1.amazon.com (Postfix)
 with ESMTPS id 63A89899F5; Tue, 16 Jan 2024 18:52:20 +0000 (UTC)
Received: from EX19MTAUEA001.ant.amazon.com [10.0.44.209:26324]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.41.129:2525]
 with esmtp (Farcaster)
 id 017ffc13-78d7-4ea7-a4ca-46863278c9c5; Tue, 16 Jan 2024 18:52:20 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:10 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:09 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:52:07 +0000
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
X-Inumbo-ID: 6294a509-b4a0-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431145; x=1736967145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SgoUYRGfBhQWiY7NendWHvruacHBLERYGlNvfzPucEo=;
  b=XmVXyfFFxVS+opJwfrERXHHZmpWpI4Hr6aHiC8U6OhHdBKZVfgI8YZVE
   GC1qPCHNdWBPLjFTUmZ8tudg1/7rkvewV4gaLp52t9rcn9KWl67appRNV
   Eh4LQM+G6LXQ3643ntf6M/JC34dYddr74Z1BUXkwepqkfuQMTgnZGt/A5
   k=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="267182286"
X-Farcaster-Flow-ID: 017ffc13-78d7-4ea7-a4ca-46863278c9c5
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2] xen/page_alloc: Add a path for xenheap when there is no direct map
Date: Tue, 16 Jan 2024 18:50:47 +0000
Message-ID: <20240116185056.15000-19-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Hongyan Xia <hongyxia@amazon.com>

When there is not an always-mapped direct map, xenheap allocations need
to be mapped and unmapped on-demand.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    I have left the call to map_pages_to_xen() and destroy_xen_mappings()
    in the split heap for now. I am not entirely convinced this is necessary
    because in that setup only the xenheap would be always mapped and
    this doesn't contain any guest memory (aside the grant-table).
    So map/unmapping for every allocation seems unnecessary.

    Changes in v2:
        * Fix remaining wrong indentation in alloc_xenheap_pages()

    Changes since Hongyan's version:
        * Rebase
        * Fix indentation in alloc_xenheap_pages()
        * Fix build for arm32

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index a3746cfbcf..52934ec5c1 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2237,6 +2237,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
 void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
+    void *ret;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2245,17 +2246,36 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     if ( unlikely(pg == NULL) )
         return NULL;
 
+    ret = page_to_virt(pg);
+
+    if ( !has_directmap() &&
+         map_pages_to_xen((unsigned long)ret, page_to_mfn(pg), 1UL << order,
+                          PAGE_HYPERVISOR) )
+    {
+        /* Failed to map xenheap pages. */
+        free_heap_pages(pg, order, false);
+        return NULL;
+    }
+
     return page_to_virt(pg);
 }
 
 
 void free_xenheap_pages(void *v, unsigned int order)
 {
+    unsigned long va = (unsigned long)v & PAGE_MASK;
+
     ASSERT_ALLOC_CONTEXT();
 
     if ( v == NULL )
         return;
 
+    if ( !has_directmap() &&
+         destroy_xen_mappings(va, va + (1UL << (order + PAGE_SHIFT))) )
+        dprintk(XENLOG_WARNING,
+                "Error while destroying xenheap mappings at %p, order %u\n",
+                v, order);
+
     free_heap_pages(virt_to_page(v), order, false);
 }
 
@@ -2279,6 +2299,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
     unsigned int i;
+    void *ret;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2291,16 +2312,28 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     if ( unlikely(pg == NULL) )
         return NULL;
 
+    ret = page_to_virt(pg);
+
+    if ( !has_directmap() &&
+         map_pages_to_xen((unsigned long)ret, page_to_mfn(pg), 1UL << order,
+                          PAGE_HYPERVISOR) )
+    {
+        /* Failed to map xenheap pages. */
+        free_domheap_pages(pg, order);
+        return NULL;
+    }
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
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2312,6 +2345,12 @@ void free_xenheap_pages(void *v, unsigned int order)
     for ( i = 0; i < (1u << order); i++ )
         pg[i].count_info &= ~PGC_xen_heap;
 
+    if ( !has_directmap() &&
+         destroy_xen_mappings(va, va + (1UL << (order + PAGE_SHIFT))) )
+        dprintk(XENLOG_WARNING,
+                "Error while destroying xenheap mappings at %p, order %u\n",
+                v, order);
+
     free_heap_pages(pg, order, true);
 }
 
-- 
2.40.1


