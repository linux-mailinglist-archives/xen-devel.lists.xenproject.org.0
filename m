Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B707A61781
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:26:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914872.1320512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8n3-0004Ap-Ip; Fri, 14 Mar 2025 17:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914872.1320512; Fri, 14 Mar 2025 17:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8n3-000481-F4; Fri, 14 Mar 2025 17:25:45 +0000
Received: by outflank-mailman (input) for mailman id 914872;
 Fri, 14 Mar 2025 17:25:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt8n2-0003IK-87
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:25:44 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bdca9bb-00f9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:25:43 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac2a9a74d9cso482348166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:25:43 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb24sm250677566b.9.2025.03.14.10.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:25:42 -0700 (PDT)
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
X-Inumbo-ID: 5bdca9bb-00f9-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741973143; x=1742577943; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFenvx66HA+6v8NxSa9ViLoF7QrMBRbRtQz2J0bReoE=;
        b=Gbmf5vwTeDRdSDAA0MkgetkisQsjCn3zsqKpXTXyiNuelXdtguNh8xF7jjzcf0UCi1
         67enMWv9V1nvO+WaF2jgWdoZ0yMXMPKHKGxJtxJh9dtQwWKNX01BpHMTHArfTv/dBk+F
         Z9EYtKPgFTBTpoiHDyg2tZfFfIsSozqCMpRLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973143; x=1742577943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFenvx66HA+6v8NxSa9ViLoF7QrMBRbRtQz2J0bReoE=;
        b=KFMVVTTEP9u0AnlVTqTytJoFi7uxC3NTAgCuXaHeI4F16JRDfSqH4SkIq5xBKJ3Z8u
         KgLn+k3idlsUaQslgw9dOAwo/yGhHKvZRgjrxcbspEv7gNNvmsqxZBqL4qJxuFw3LG1I
         R77IxqFDTSazIrYmGGSb/r/8BVfzxY/6uKnR9aLPHkuLBdy/eLdxD8vJezjkH03T6PNA
         MLxgWRZIGBuHzFoh4ZhCcBFuJVPQ4OGPTQa3rxYQOCRKmKgFv7r/8W2yfJOLjsrW5XT4
         VBy1SwcZW9cPfDN7/dWHs2pE4muPjhk/PYd60vcyd2Ixp+XXgV4VxBkYL0zJbHMQ78TE
         zw6A==
X-Gm-Message-State: AOJu0YwS1CB+FP8cGioylBg2MFAnr2xLPqFuyskCE0CX2aVM3sChbRZE
	DzYtRB3xz8Ym45Ahqf0P7JtiXa8MYhu5lgXro3L49xqnyyLcH7tkzqHqbh75VMRZapEq1LtxLtP
	c
X-Gm-Gg: ASbGncsBgyotF67Olg03ldIG84/EVG5sbDXhd4imv+vX1qYDV6tEHN0nAlFgcmQSbE/
	jeQ1NUubCwiqqVByTKyEloOETLwQqWKyt+499Bs5HPTJs6G+cvxptUvuGsmfCQEn+fNao2FIW3A
	JcBeFA42OMZ201LwPuyBMuDHZ0U6DMvN0EVbYnAfBFXAJHCWZVNuEz86KUgNEHjy9ZvY+VkSHJR
	roRYQb6a1WPtn0HeIhz4iU6dCwWtt3oRUiuC79TMirv0D+jxp7fHRlNag8pT3z25OiLV3OIBXAg
	iGT23+FyM9jh4XrI5vG+1TRWmPjzd0/7eE80lEkvWi6gGtoc/jKyOvb3wTSgobUcVIM=
X-Google-Smtp-Source: AGHT+IG8xBocfTx86Mu0vxS3AmDloPZohIWbVfv2YZa+3EWOiP2ooez9VIyHoRUuoFpOT57DzDG6cg==
X-Received: by 2002:a17:907:7215:b0:ac2:9ac:a062 with SMTP id a640c23a62f3a-ac3301ea35dmr297824366b.23.1741973142916;
        Fri, 14 Mar 2025 10:25:42 -0700 (PDT)
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
Subject: [PATCH 03/11] xen/page_alloc: Add static per-node counts of free pages
Date: Fri, 14 Mar 2025 17:24:54 +0000
Message-ID: <20250314172502.53498-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are effectively the sum of free memory in all zones of each node.
It's an optimization to avoid doing that operation frequently in
following patches that introduce exact-node claims.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/common/page_alloc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 49c3258169db..733b0300a767 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -485,6 +485,9 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
 static unsigned long *avail[MAX_NUMNODES];
 static long total_avail_pages;
 
+/* Per-node counts of free pages */
+static unsigned long pernode_avail_pages[MAX_NUMNODES];
+
 static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
 
@@ -1033,6 +1036,7 @@ static struct page_info *alloc_heap_pages(
 
     ASSERT(avail[node][zone] >= request);
     avail[node][zone] -= request;
+    pernode_avail_pages[node] -= request;
     total_avail_pages -= request;
     ASSERT(total_avail_pages >= 0);
 
@@ -1191,6 +1195,8 @@ static int reserve_offlined_page(struct page_info *head)
             continue;
 
         avail[node][zone]--;
+        ASSERT(pernode_avail_pages[node] > 0);
+        pernode_avail_pages[node]--;
         total_avail_pages--;
         ASSERT(total_avail_pages >= 0);
 
@@ -1515,6 +1521,7 @@ static void free_heap_pages(
     }
 
     avail[node][zone] += 1 << order;
+    pernode_avail_pages[node] += 1 << order;
     total_avail_pages += 1 << order;
     if ( need_scrub )
     {
-- 
2.48.1


