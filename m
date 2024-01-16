Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B58982F501
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:06:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668019.1039861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPol7-0006jA-6d; Tue, 16 Jan 2024 19:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668019.1039861; Tue, 16 Jan 2024 19:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPol7-0006eO-1E; Tue, 16 Jan 2024 19:06:01 +0000
Received: by outflank-mailman (input) for mailman id 668019;
 Tue, 16 Jan 2024 19:05:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoXx-0002UD-Ug
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:52:25 +0000
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com
 [99.78.197.219]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 627ddc1f-b4a0-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 19:52:25 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-bbc6e425.us-east-1.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80008.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:52:22 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
 by email-inbound-relay-iad-1a-m6i4x-bbc6e425.us-east-1.amazon.com (Postfix)
 with ESMTPS id 3DD0D807A3; Tue, 16 Jan 2024 18:52:20 +0000 (UTC)
Received: from EX19MTAUEC001.ant.amazon.com [10.0.44.209:4913]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.15.248:2525]
 with esmtp (Farcaster)
 id de871c36-9ec9-4ec7-b295-f240a8062615; Tue, 16 Jan 2024 18:52:19 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:14 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:14 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:52:12 +0000
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
X-Inumbo-ID: 627ddc1f-b4a0-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431145; x=1736967145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BQwz5u8QWnu4kJOr/giiJYPgo6aRgBqNBhniW2zo2FE=;
  b=YnGdkP68oU7GJgEKFaNf9M2PKn2jARFRFUtMEsE/EnoNrrF2c7ynHdYu
   O2ZU1Qasr/RXagzDM2zgNciApWsOPRrOkyoUzXPP623TL2zQ1bUq7W/T8
   XFPAstHRAIREJmT5wN+el6VeY0jpgMw5RtOwqVQFUDAuB78wF7V/Ycxgb
   Q=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="58742934"
X-Farcaster-Flow-ID: de871c36-9ec9-4ec7-b295-f240a8062615
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH v2] x86/setup: vmap heap nodes when they are outside the direct map
Date: Tue, 16 Jan 2024 18:50:49 +0000
Message-ID: <20240116185056.15000-21-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
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


