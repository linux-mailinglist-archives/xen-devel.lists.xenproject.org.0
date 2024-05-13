Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2228C4228
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 15:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720937.1124065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Vvi-0006XA-1d; Mon, 13 May 2024 13:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720937.1124065; Mon, 13 May 2024 13:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Vvh-0006SU-TB; Mon, 13 May 2024 13:41:25 +0000
Received: by outflank-mailman (input) for mailman id 720937;
 Mon, 13 May 2024 13:41:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Vvg-0002lY-QO
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 13:41:24 +0000
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c1a52f4-112e-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 15:41:22 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.2])
 by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:41:20 +0000
Received: from EX19MTAUEA001.ant.amazon.com [10.0.29.78:39746]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.60.166:2525]
 with esmtp (Farcaster)
 id 1e3f40c9-79ac-41ce-932f-75856514dfe8; Mon, 13 May 2024 13:41:19 +0000 (UTC)
Received: from EX19D008UEC003.ant.amazon.com (10.252.135.194) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:16 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEC003.ant.amazon.com (10.252.135.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:16 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 13:41:14 +0000
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
X-Inumbo-ID: 7c1a52f4-112e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715607683; x=1747143683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YYAC4ge8TxViu8X0NtP8ExO8g2vNW+lgMuOpIFb06t0=;
  b=XuxowVYgY+unnSnSihIiT4zROppuesi1m7+7d4V+S1gT/53YJ9fJHW6e
   1KR5OdwTnNCAsdWpk9vpoMisMm8v0+vqtae1tU8EBwi+ErUPS5PD6hT20
   WW2tjMH7AuUYPQtr/2LcEzqwOxO6KeQ/WDNWVKxyk3X21gkCDX9B99I/u
   w=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="396086505"
X-Farcaster-Flow-ID: 1e3f40c9-79ac-41ce-932f-75856514dfe8
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <jgrall@amazon.com>, Elias
 El Yandouzi <eliasely@amazon.com>
Subject: [PATCH V3 (resend) 12/19] x86/setup: vmap heap nodes when they are outside the direct map
Date: Mon, 13 May 2024 13:40:39 +0000
Message-ID: <20240513134046.82605-13-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513134046.82605-1-eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
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


