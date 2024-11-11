Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 164C69C3F5E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833736.1248999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDH-00014b-FB; Mon, 11 Nov 2024 13:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833736.1248999; Mon, 11 Nov 2024 13:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDH-0000xX-7Q; Mon, 11 Nov 2024 13:12:15 +0000
Received: by outflank-mailman (input) for mailman id 833736;
 Mon, 11 Nov 2024 13:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUDF-0007pD-9I
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:13 +0000
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com
 [52.119.213.150]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8df78f85-a02e-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 14:12:09 +0100 (CET)
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.124.125.6])
 by smtp-border-fw-52002.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:12:08 +0000
Received: from EX19MTAUEC002.ant.amazon.com [10.0.44.209:28838]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.85.229:2525]
 with esmtp (Farcaster)
 id 319c51b8-85f5-4ed2-8ac8-8e45a7ed2184; Mon, 11 Nov 2024 13:12:08 +0000 (UTC)
Received: from EX19D008UEC003.ant.amazon.com (10.252.135.194) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:07 +0000
Received: from EX19MTAUEB002.ant.amazon.com (10.252.135.47) by
 EX19D008UEC003.ant.amazon.com (10.252.135.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:07 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.124.125.2) by mail-relay.amazon.com (10.252.135.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:12:06 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id 6993D42116; Mon, 11 Nov 2024 13:12:05 +0000 (UTC)
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
X-Inumbo-ID: 8df78f85-a02e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjUyLjExOS4yMTMuMTUwIiwiaGVsbyI6InNtdHAtZnctNTIwMDIuYW1hem9uLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjhkZjc4Zjg1LWEwMmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzMwNzI5LjQ1NTMzNSwic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330729; x=1762866729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rB2rRpiYmlYYuH1CdMTLnLcInkmyXxjNS6D+YHWGoNQ=;
  b=mU27vuLZTT6oQ6+MTdfN6xxUbq9qdH3bLzqIxHS93xgQPRzVgCl/JbxY
   dB1o73Svcc9fJTTUo+AcsBoTRLnFnPEd68zOVttGENsIBuUAE6czE2i4D
   ELWBE6z231wbj0guucwoaSwYQXZac4M7WG+JQERpjhJ2dRrBH5xCcI3Zh
   4=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="673030963"
X-Farcaster-Flow-ID: 319c51b8-85f5-4ed2-8ac8-8e45a7ed2184
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V4 08/15] xen/page_alloc: Add a path for xenheap when there is no direct map
Date: Mon, 11 Nov 2024 13:11:41 +0000
Message-ID: <20241111131148.52568-9-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
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

    Changes in v4:
        * Call printk instead of dprintk()

    Changes in v2:
        * Fix remaining wrong indentation in alloc_xenheap_pages()

    Changes since Hongyan's version:
        * Rebase
        * Fix indentation in alloc_xenheap_pages()
        * Fix build for arm32

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index b0be246780b7..2cef521ad85a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2243,6 +2243,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
 void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
+    void *virt_addr;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2251,17 +2252,36 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     if ( unlikely(pg == NULL) )
         return NULL;
 
-    return page_to_virt(pg);
+    virt_addr = page_to_virt(pg);
+
+    if ( !has_directmap() &&
+         map_pages_to_xen((unsigned long)virt_addr, page_to_mfn(pg), 1UL << order,
+                          PAGE_HYPERVISOR) )
+    {
+        /* Failed to map xenheap pages. */
+        free_heap_pages(pg, order, false);
+        return NULL;
+    }
+
+    return virt_addr;
 }
 
 
 void free_xenheap_pages(void *v, unsigned int order)
 {
+    unsigned long va = (unsigned long)v & PAGE_MASK;
+
     ASSERT_ALLOC_CONTEXT();
 
     if ( v == NULL )
         return;
 
+    if ( !has_directmap() &&
+         destroy_xen_mappings(va, va + (PAGE_SIZE << order)) )
+        printk(XENLOG_WARNING,
+                "Error while destroying xenheap mappings at %p, order %u\n",
+                v, order);
+
     free_heap_pages(virt_to_page(v), order, false);
 }
 
@@ -2285,6 +2305,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
     unsigned int i;
+    void *virt_addr;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2297,16 +2318,28 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     if ( unlikely(pg == NULL) )
         return NULL;
 
+    virt_addr = page_to_virt(pg);
+
+    if ( !has_directmap() &&
+         map_pages_to_xen((unsigned long)virt_addr, page_to_mfn(pg), 1UL << order,
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
+    return virt_addr;
 }
 
 void free_xenheap_pages(void *v, unsigned int order)
 {
     struct page_info *pg;
     unsigned int i;
+    unsigned long va = (unsigned long)v & PAGE_MASK;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2318,6 +2351,12 @@ void free_xenheap_pages(void *v, unsigned int order)
     for ( i = 0; i < (1u << order); i++ )
         pg[i].count_info &= ~PGC_xen_heap;
 
+    if ( !has_directmap() &&
+         destroy_xen_mappings(va, va + (PAGE_SIZE << order)) )
+        printk(XENLOG_WARNING
+                "Error while destroying xenheap mappings at %p, order %u\n",
+                v, order);
+
     free_heap_pages(pg, order, true);
 }
 
-- 
2.40.1


