Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C282F583
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668159.1040185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPpGC-0004oi-I3; Tue, 16 Jan 2024 19:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668159.1040185; Tue, 16 Jan 2024 19:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPpGC-0004mt-EU; Tue, 16 Jan 2024 19:38:08 +0000
Received: by outflank-mailman (input) for mailman id 668159;
 Tue, 16 Jan 2024 19:38:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp5L-0002iI-Ef
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:26:55 +0000
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com
 [52.119.213.150]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33b40b5e-b4a5-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 20:26:53 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-529f0975.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52002.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:26:50 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
 by email-inbound-relay-iad-1e-m6i4x-529f0975.us-east-1.amazon.com (Postfix)
 with ESMTPS id 21B894A22B; Tue, 16 Jan 2024 19:26:48 +0000 (UTC)
Received: from EX19MTAUEC001.ant.amazon.com [10.0.0.204:44999]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.41.129:2525]
 with esmtp (Farcaster)
 id f94b5ab5-a209-4e45-9547-2bc37d5f6f7e; Tue, 16 Jan 2024 19:26:47 +0000 (UTC)
Received: from EX19D008UEA003.ant.amazon.com (10.252.134.116) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:40 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEA003.ant.amazon.com (10.252.134.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:40 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:39 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 33b40b5e-b4a5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433214; x=1736969214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BQwz5u8QWnu4kJOr/giiJYPgo6aRgBqNBhniW2zo2FE=;
  b=fK+gXXWJaTzHux0OYq9rmRDioM0IKYym2t0Dt/pwnXEbvemyK/tfLBB6
   FhVkmJ+MAZNd/AUCQK7X+hqnCtxSeOkHk9633jPbPB36cdU8XWXrVxwzO
   N5vwbou3ekg324YZRmkZI+WgZunxdz/f4Lnjb74gd5fNd3whnVUFO9FE1
   s=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="606818879"
X-Farcaster-Flow-ID: f94b5ab5-a209-4e45-9547-2bc37d5f6f7e
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2 (resend) 20/27] x86/setup: vmap heap nodes when they are outside the direct map
Date: Tue, 16 Jan 2024 19:26:04 +0000
Message-ID: <20240116192611.41112-21-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

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
index 52934ec5c1..42b9aaae1c 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -136,6 +136,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/spinlock.h>
+#include <xen/vmap.h>
 
 #include <asm/flushtlb.h>
 #include <asm/numa.h>
@@ -604,22 +605,44 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
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


