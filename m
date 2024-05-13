Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A2A8C3F87
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 13:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720817.1123833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6TbA-0006Ri-5n; Mon, 13 May 2024 11:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720817.1123833; Mon, 13 May 2024 11:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tb9-0006Gr-IF; Mon, 13 May 2024 11:12:03 +0000
Received: by outflank-mailman (input) for mailman id 720817;
 Mon, 13 May 2024 11:12:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Tb6-00036L-PO
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 11:12:00 +0000
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com
 [99.78.197.219]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c47b21e-1119-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 13:11:58 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-80008.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 11:11:51 +0000
Received: from EX19MTAUEA002.ant.amazon.com [10.0.29.78:57211]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.60.166:2525]
 with esmtp (Farcaster)
 id 5ea62801-8630-4432-90a1-4613b44f2052; Mon, 13 May 2024 11:11:50 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:50 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:50 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 11:11:48 +0000
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
X-Inumbo-ID: 9c47b21e-1119-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715598718; x=1747134718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YYAC4ge8TxViu8X0NtP8ExO8g2vNW+lgMuOpIFb06t0=;
  b=ksW0gEW0jUTVSil7zZV51DaSQEkSrqItaZOvY4dY7ryJNXhPbjUd/AGm
   zQ7t6V6gByd5IyQiSF6rJ9FYaWJN+wuOOUW5RkzgprMwpbQGd1pIGrAmB
   venz/dH/jNnz1j4jgM54NL75LB7VzKHDevUk8gWm/Tu2ClSjvw1tjb+t0
   s=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="88736865"
X-Farcaster-Flow-ID: 5ea62801-8630-4432-90a1-4613b44f2052
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V3 12/19] x86/setup: vmap heap nodes when they are outside the direct map
Date: Mon, 13 May 2024 11:11:10 +0000
Message-ID: <20240513111117.68828-13-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513111117.68828-1-eliasely@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Hongyan Xia <hongyxia@amazon.com>

When we do not have a direct map, archs_mfn_in_direct_map() will always
return false, thus init_node_heap() will allocate xenheap pages from an
existing node for the metadata of a new node. This means that the
metadata of a new node is in a different node, slowing down heap
allocation.

Since we now have early vmap, vmap the metadata locally in the new node.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in v2:
        * vmap_contig_pages() was renamed to vmap_contig()
        * Fix indentation and coding style

    Changes from Hongyan's version:
        * arch_mfn_in_direct_map() was renamed to
          arch_mfns_in_direct_map()
        * Use vmap_contig_pages() rather than __vmap(...).
        * Add missing include (xen/vmap.h) so it compiles on Arm

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index dfb2c05322..3c0909f333 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -136,6 +136,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/spinlock.h>
+#include <xen/vmap.h>
 
 #include <asm/flushtlb.h>
 #include <asm/page.h>
@@ -605,22 +606,44 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
         needed = 0;
     }
     else if ( *use_tail && nr >= needed &&
-              arch_mfns_in_directmap(mfn + nr - needed, needed) &&
               (!xenheap_bits ||
-               !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
+              !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
-        _heap[node] = mfn_to_virt(mfn + nr - needed);
-        avail[node] = mfn_to_virt(mfn + nr - 1) +
-                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+        if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
+        {
+            _heap[node] = mfn_to_virt(mfn + nr - needed);
+            avail[node] = mfn_to_virt(mfn + nr - 1) +
+                          PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+        }
+        else
+        {
+            mfn_t needed_start = _mfn(mfn + nr - needed);
+
+            _heap[node] = vmap_contig(needed_start, needed);
+            BUG_ON(!_heap[node]);
+            avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
+                          sizeof(**avail) * NR_ZONES;
+        }
     }
     else if ( nr >= needed &&
-              arch_mfns_in_directmap(mfn, needed) &&
               (!xenheap_bits ||
-               !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
+              !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
-        _heap[node] = mfn_to_virt(mfn);
-        avail[node] = mfn_to_virt(mfn + needed - 1) +
-                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+        if ( arch_mfns_in_directmap(mfn, needed) )
+        {
+            _heap[node] = mfn_to_virt(mfn);
+            avail[node] = mfn_to_virt(mfn + needed - 1) +
+                          PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+        }
+        else
+        {
+            mfn_t needed_start = _mfn(mfn);
+
+            _heap[node] = vmap_contig(needed_start, needed);
+            BUG_ON(!_heap[node]);
+            avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
+                          sizeof(**avail) * NR_ZONES;
+        }
         *use_tail = false;
     }
     else if ( get_order_from_bytes(sizeof(**_heap)) ==
-- 
2.40.1


