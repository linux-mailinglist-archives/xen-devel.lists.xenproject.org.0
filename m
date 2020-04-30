Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C427E1C088C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:50:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG8K-0004P5-H7; Thu, 30 Apr 2020 20:50:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG8J-0004Ov-OR
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:50:11 +0000
X-Inumbo-ID: 2ee5217a-8b24-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ee5217a-8b24-11ea-9887-bc764e2007e4;
 Thu, 30 Apr 2020 20:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uv/yzMUx1QdBCN124eu+OU2bGCwQI9wMhMOGicg+2lw=; b=DShHz1Nz/o6zRMx8Lqm66YrFlZ
 yXOu6yAXfPlYM+hbeb8Rxsx0m+4okLioSESpWgPDtPww7uMPO+3wQ11/iy2Cbkx3QnDyEZ6Yrbo3X
 dMAtlAquopm2dJcrZ8z8/eouK0P2bTEpTtZpP644hLZ/O5Ll/QLrkaSpXvq1T8kwaUnA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG8I-0004Uf-Od; Thu, 30 Apr 2020 20:50:10 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG3H-0005wj-Pa; Thu, 30 Apr 2020 20:45:00 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 15/16] x86/setup: vmap heap nodes when they are outside the
 direct map
Date: Thu, 30 Apr 2020 21:44:24 +0100
Message-Id: <dfa5598b20c83ab496f33a7b0720f659d904cb50.1588278317.git.hongyxia@amazon.com>
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

When we do not have a direct map, arch_mfn_in_direct_map() will always
return false, thus init_node_heap() will allocate xenheap pages from an
existing node for the metadata of a new node. This means that the
metadata of a new node is in a different node, slowing down heap
allocation.

Since we now have early vmap, vmap the metadata locally in the new node.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/common/page_alloc.c | 40 ++++++++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1285fc5977..1e18b45caf 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -584,22 +584,46 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
         needed = 0;
     }
     else if ( *use_tail && nr >= needed &&
-              arch_mfn_in_directmap(mfn + nr) &&
               (!xenheap_bits ||
                !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
-        _heap[node] = mfn_to_virt(mfn + nr - needed);
-        avail[node] = mfn_to_virt(mfn + nr - 1) +
-                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+        if ( arch_mfn_in_directmap(mfn + nr) )
+        {
+            _heap[node] = mfn_to_virt(mfn + nr - needed);
+            avail[node] = mfn_to_virt(mfn + nr - 1) +
+                          PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+        }
+        else
+        {
+            mfn_t needed_start = _mfn(mfn + nr - needed);
+
+            _heap[node] = __vmap(&needed_start, needed, 1, 1, PAGE_HYPERVISOR,
+                                 VMAP_DEFAULT);
+            BUG_ON(!_heap[node]);
+            avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
+                          sizeof(**avail) * NR_ZONES;
+        }
     }
     else if ( nr >= needed &&
-              arch_mfn_in_directmap(mfn + needed) &&
               (!xenheap_bits ||
                !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
-        _heap[node] = mfn_to_virt(mfn);
-        avail[node] = mfn_to_virt(mfn + needed - 1) +
-                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+        if ( arch_mfn_in_directmap(mfn + needed) )
+        {
+            _heap[node] = mfn_to_virt(mfn);
+            avail[node] = mfn_to_virt(mfn + needed - 1) +
+                          PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+        }
+        else
+        {
+            mfn_t needed_start = _mfn(mfn);
+
+            _heap[node] = __vmap(&needed_start, needed, 1, 1, PAGE_HYPERVISOR,
+                                 VMAP_DEFAULT);
+            BUG_ON(!_heap[node]);
+            avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
+                          sizeof(**avail) * NR_ZONES;
+        }
         *use_tail = false;
     }
     else if ( get_order_from_bytes(sizeof(**_heap)) ==
-- 
2.24.1.AMZN


