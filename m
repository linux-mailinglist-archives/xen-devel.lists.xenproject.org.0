Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76959A617BD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914976.1320662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8t9-00056M-La; Fri, 14 Mar 2025 17:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914976.1320662; Fri, 14 Mar 2025 17:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8t9-00051h-Fu; Fri, 14 Mar 2025 17:32:03 +0000
Received: by outflank-mailman (input) for mailman id 914976;
 Fri, 14 Mar 2025 17:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt8nL-0003IK-5c
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:26:03 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6720e508-00f9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:26:02 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso444803866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:26:02 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb24sm250677566b.9.2025.03.14.10.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:26:01 -0700 (PDT)
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
X-Inumbo-ID: 6720e508-00f9-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741973162; x=1742577962; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOoPVJhq5a/XEAMxWlBgBdgROSgA1Iks8/9HeBPk9Vk=;
        b=kwFwRMX/icEl6/PGslirYjI0YHysECTgiUie6QxjAMGhIO4TflSp4N3km3+a/X41sL
         cQ+R2bTWSrc8NYu64P3lwFMGfz+uiBJyZi3NSMAZvruHu7lnTyypHn6VinkqeuFviVR7
         vjhFRtsXf/xACzengGUDi/AasZH3M7P5cVMEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973162; x=1742577962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOoPVJhq5a/XEAMxWlBgBdgROSgA1Iks8/9HeBPk9Vk=;
        b=N8JJA5BFNRvZDmvCGZPmSvHYC9jQtAnhZuvADBoc5IZlatT4iVujxTNIQOX3oIUXBI
         sd7yRldV460cjYJM3vFJuuNtsEA7mwtOvsUUdB1Vz1j65ibj24NZkPEI1Q2xwqUlTIlx
         8WVFfVbDI4hr+1qdCCyS17a4VNFHupQvLGRqKXqPSrGXqptVn+xQt9IM3zkLz02eKVvi
         CXhy1ozyZXsKBu4BJQgkPR6dEBmWkn860Lm/HBUJrTKx1hR2FGryaerPdXkFxj+kOCJT
         y9qB1NId7oREdkag8zQzCCIxEaz9ySVRKhO9REP3BOiUHFv/sBWeMoFxZq1LqOwcqYyK
         vdwg==
X-Gm-Message-State: AOJu0Yxa+/cjQ8xamjrkNoNTJd8fGh55oNXe2By+1dQxyQoqG2mOQvTE
	1Tue16Te/UQq9fvQhKvgWPY5zFKSum4WFiH+e952OD+3KzgMZsH6qrF85CsRsvDBI2U/BKMcpzI
	v
X-Gm-Gg: ASbGncuyvzvwWZ5uoS5LymcQGsGtrZwzfllBAshJ7K8+V3bJDPKPT9gO4KjlUGnDPFc
	/OnOyxCYySnjlBYrWJgFQE82sM075EQaaBq7dXmSt2JcDGdkmQ2HDpDXomUkfa0u95BBMfaAz57
	32cnRTit2t4wQ6ufgYS0kHqu4cA9IY14DE82HytwKuCn0yMqpOrFRA0X/Ra2YXRwxN+wbubC08j
	70aWBEX1IxkZN5j/NigJKVkqJpe2XgVOQyqRUeGz4k+uXK2l9M7BnKZ3jbhppYbn0JhURQeZput
	tHcIc0vO0CRDlj8bvixfokxKOxhQIU0zzwVpgal876ARCo1uBUYsKF0qbkSA/ssRi7E=
X-Google-Smtp-Source: AGHT+IH7BlA4vCgTd4VLYiuH5xIPV1du5rzeNPEjhgKwzB0hRnTvUWdLLIXdHbXU2JzPDm4QdcUwAg==
X-Received: by 2002:a17:907:9713:b0:ac2:7e56:5ca5 with SMTP id a640c23a62f3a-ac3302771cdmr393348266b.34.1741973161918;
        Fri, 14 Mar 2025 10:26:01 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 07/11] xen/page_alloc: Set node affinity when claiming pages from an exact node
Date: Fri, 14 Mar 2025 17:24:58 +0000
Message-ID: <20250314172502.53498-8-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the domain's node affinity to the claimed node if the claim
specified an exact node. Do it immediately before making any changes in
case setting the affinity fails (even though it shouldn't).

This allows preferentially allocating from the closest NUMA node when
"exact" is not specified (e.g: p2m tables, etc).

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Toolstacks can just do it themselves, but it's more error prone. If it
claimed pages from an exact node (and remember we can only hold a single
claim at a time) it makes no sense for the domain to be intentionally
allocating from NUMA nodes other than its home node.
---
 xen/common/page_alloc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index cfaa64d3b858..e69a5fcc8d31 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -586,10 +586,16 @@ int domain_set_outstanding_pages(struct domain *d, nodeid_t node,
 
     if ( node != NUMA_NO_NODE )
     {
-        avail_pages = pernode_avail_pages[node] - pernode_oc[node];
+        nodemask_t affinity = NODE_MASK_NONE;
 
+        avail_pages = pernode_avail_pages[node] - pernode_oc[node];
         if ( pages > avail_pages )
             goto out;
+
+        node_set(node, affinity);
+        ret = domain_set_node_affinity(d, &affinity);
+        if ( ret )
+            goto out;
     }
 
     /* yay, claim fits in available memory, stake the claim, success! */
-- 
2.48.1


