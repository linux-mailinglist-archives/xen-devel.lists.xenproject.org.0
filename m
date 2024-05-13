Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BE8C3F82
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 13:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720814.1123814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tb7-0005sS-TC; Mon, 13 May 2024 11:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720814.1123814; Mon, 13 May 2024 11:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tb7-0005mj-Hr; Mon, 13 May 2024 11:12:01 +0000
Received: by outflank-mailman (input) for mailman id 720814;
 Mon, 13 May 2024 11:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Tb5-0003MC-9P
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 11:11:59 +0000
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com
 [207.171.188.206]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c794f31-1119-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 13:11:58 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-9106.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 11:11:48 +0000
Received: from EX19MTAUEB002.ant.amazon.com [10.0.29.78:34994]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.83.223:2525]
 with esmtp (Farcaster)
 id 1c94a46c-60d4-4506-be81-1115b85ee72d; Mon, 13 May 2024 11:11:47 +0000 (UTC)
Received: from EX19D008UEC003.ant.amazon.com (10.252.135.194) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:47 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEC003.ant.amazon.com (10.252.135.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:46 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 11:11:45 +0000
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
X-Inumbo-ID: 9c794f31-1119-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715598719; x=1747134719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NU5YSGcrFgwo4jtZeOfCQS23Pg2dIdFW+HjZiUxxomg=;
  b=fS5mDXXPl03/RtWlL+jUwrLUG5JUGvj2gV0U1RfT9NdWe5QBCjf0Uld2
   95KFi2SyjdFDybWs5CsnU8R9IFpUUjfvDfKt6cpep6OUd5a8qoQRW85Ch
   +H+7Jh+4vRVZ2NmVy5y7VEJG0UrRqKPFlKQFz+RJkxxFpiQe2oHdTNMht
   g=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="725407063"
X-Farcaster-Flow-ID: 1c94a46c-60d4-4506-be81-1115b85ee72d
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V3 10/19] xen/page_alloc: Add a path for xenheap when there is no direct map
Date: Mon, 13 May 2024 11:11:08 +0000
Message-ID: <20240513111117.68828-11-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513111117.68828-1-eliasely@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
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
index 9b7e4721cd..dfb2c05322 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2242,6 +2242,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
 void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
+    void *ret;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2250,17 +2251,36 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
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
 
@@ -2284,6 +2304,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
     unsigned int i;
+    void *ret;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2296,16 +2317,28 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
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
 
@@ -2317,6 +2350,12 @@ void free_xenheap_pages(void *v, unsigned int order)
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


