Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7275B47C67
	for <lists+xen-devel@lfdr.de>; Sun,  7 Sep 2025 18:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114194.1461346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI8K-0004MT-I4; Sun, 07 Sep 2025 16:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114194.1461346; Sun, 07 Sep 2025 16:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvI8K-0004JB-EW; Sun, 07 Sep 2025 16:20:52 +0000
Received: by outflank-mailman (input) for mailman id 1114194;
 Sun, 07 Sep 2025 16:20:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCRb=3S=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1uvI42-00009z-Nd
 for xen-devel@lists.xenproject.org; Sun, 07 Sep 2025 16:16:26 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00344c93-8c06-11f0-9809-7dc792cee155;
 Sun, 07 Sep 2025 18:16:25 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b046f6fb230so604182166b.1
 for <xen-devel@lists.xenproject.org>; Sun, 07 Sep 2025 09:16:25 -0700 (PDT)
Received: from MinisforumBD795m.phoenix-carat.ts.net
 ([2a02:1748:f7df:8cb1:5474:d7c3:6edd:e683])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047b61cf00sm908263766b.15.2025.09.07.09.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 09:16:23 -0700 (PDT)
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
X-Inumbo-ID: 00344c93-8c06-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757261784; x=1757866584; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBTzAM9dJn/x75BZsxvktFF5ekUsBrdK+iYKuv7j92Y=;
        b=Ehd7Nxq1zVQLYJAv33FDslPZN7BVOQLT/G0L4euiksG3FNcFkQ0utT+d1mf0dMLsEV
         K+1SeIu2+IakYyBvM2k+6mlxir91mMcQORLcJFiiv9AnAmuUKlVmeap/+Vttj6g1U1lr
         lKvqmT0A24Yf+zGEXN7UtgGI8nRpelsjoMgVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757261784; x=1757866584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBTzAM9dJn/x75BZsxvktFF5ekUsBrdK+iYKuv7j92Y=;
        b=iE9jbJd4dFA8ve0fXZfkI8An9z9BfuMcS+SEukz2Qdg58X90CMSluIDRO36NqBBxNi
         vhJvpCJQX/FcXvb6k1TYLtO/0YPjie0DJCE7TVsGMZT7hpgCXRK8CRPaFOQgI1UuKNiU
         oZOTpbZqUWX+j5TfCmXp2PKX0TGMZV+MK+IWez3rN+9nDRs/U18rKYf+oiovXZAgYbhG
         ZHpNdelNolHE8XmoAlT8/afMq5x3KVLSGNPPJllaWNZG2orbekyUDxmKjd4gKP26JBB2
         UVsLarcyHYJR4rPGbD4QEnHvmHDSEwUvJOt6prIDKe/2RD8KQ4R7MBA2wPSWfjKg+G1J
         11Fg==
X-Gm-Message-State: AOJu0Yzj3jBlSERwNX7qLmAyMKapd0SNaBJFsqFegjbpbvewly0n2SkR
	QB5skVRTa9Db4fq/wlqWizs8nFpH28zui2bp9ImyjzsOAUqKG0qHBmr+g8Gnn2mR8vtuXaEwY2m
	n047UIUY=
X-Gm-Gg: ASbGncsIzNlbmovo48jc4vgobIdQjBp/ENa1qIfqAqCGLX1do5k+d+tPvl1zMQW8zAY
	BmF39m30e+LwuiTmdzcV82ACHWj47JlK/GoOhGi4ZdZvf0ckv1r4KJNowS2pecXnfFTPVICG2A8
	jpbZT1v35Rfnjl1+Oe0vKKVxro2AvkOGklQV3r6U9kozVxQfyKGvqtEvMVmMOWYicpeAvx93oNv
	vJEaeiqmO5VvH3wPnUqtr7tIVKbstKxYtp/CoZvHjBfa537elEgQcRn01LSxoqwYSR9E0KxQSqi
	ok/9cRCpfnp5LpDQsypQ2b9O1lk7C8ODcYSt34AxNTJfmNpuJQcb+kekGQ4zJzT1U8zMVJHz6AN
	8uPbQT9YVH1v51fgyj276vGNienp97C60TBWymEvfl5cUnwJ3KeEIbwznHcbLf9hEvUMsZdybBw
	k4iA==
X-Google-Smtp-Source: AGHT+IFNkJmollUYz0E9myq+0ab1Fzt9pFOg5uIHhtER2VpUj1FgGRJDBcAtjSl+tX9M37Qw/YC6FA==
X-Received: by 2002:a17:907:805:b0:afe:94d7:7283 with SMTP id a640c23a62f3a-b04932a2452mr1010424466b.32.1757261784279;
        Sun, 07 Sep 2025 09:16:24 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 6/7] xen/page_alloc: Protect claimed memory against other allocations
Date: Sun,  7 Sep 2025 18:15:21 +0200
Message-ID: <b37634dd9a37b52030bc8196dcdeec896a5706a6.1757261045.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757261045.git.bernhard.kaindl@cloud.com>
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend get_free_buddy() to only allocate from nodes with enough
unclaimed memory left, unless the allocation is made by a domain
with sufficient claims on this node to cover the allocation.

Signed-off-by: Marcus Granado <marcus.granado@cloud.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>

---
Changes in v3:

Rewritten based on a check by Marcus Granado which needs to be inside
the NUMA node loop of get_free_buddy() to only allow it to allocating
from NUMA nodes with enough unclaimed memory.

It was originally only intented for when looping over all NUMA nodes,
but the check also needs to be done when falling back to other nodes:

I updated the check to be generic: Now, it used for all requests by
integrating the check of the claim of the domain from Alejandro's
can_alloc() helper into it.

This fixes the issue that when falling back from a nodemask to allocate
from (based on MEMF_get_node(memflags) or from d->node_affinity):

When falling back to other NUMA nodes, still only allocate from nodes
with enough unclaimed memory left, unless the allocation is made by
a domain with sufficient claims on this node to cover the allocation.

This makes the can_alloc() helper function obsolete, as the needed
checks are done for the NUMA nodes as they are considered, not only
for the orignally requested NUMA node (not just before searching).
---
 xen/common/page_alloc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index ebf41a1b33..b866076b78 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -980,9 +980,19 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
     {
         zone = zone_hi;
         do {
-            /* Check if target node can support the allocation. */
-            if ( !avail[node] || (avail[node][zone] < (1UL << order)) )
-                continue;
+            unsigned long request = 1UL << order;
+            /*
+             * Check if this node is currently suitable for this allocation.
+             * 1. It has sufficient memory in the requested zone and the
+             * 2. request must fit in the unclaimed memory of the node minus
+             *    outstanding claims, unless the allocation is made by a domain
+             *    with sufficient node-claimed memory to cover the allocation.
+             */
+            if ( !avail[node] || (avail[node][zone] < request) ||
+                 (insufficient_memory(node, request) &&
+                  (!d || node != d->claim_node ||     /* a domain with claims */
+                   request > d->outstanding_pages)) ) /* claim covers request */
+                continue;  /* next zone/node if insufficient memory or claims */
 
             /* Find smallest order which can satisfy the request. */
             for ( j = order; j <= MAX_ORDER; j++ )
-- 
2.43.0


