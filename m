Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC0323C32
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 13:52:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89331.168141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEtdw-0006ut-Ud; Wed, 24 Feb 2021 12:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89331.168141; Wed, 24 Feb 2021 12:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEtdw-0006uU-RG; Wed, 24 Feb 2021 12:51:52 +0000
Received: by outflank-mailman (input) for mailman id 89331;
 Wed, 24 Feb 2021 12:51:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6hyu=H2=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1lEtdv-0006uP-9p
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 12:51:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e9161a8-5b32-4243-ac65-e07a74ccb58c;
 Wed, 24 Feb 2021 12:51:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A48C64F35;
 Wed, 24 Feb 2021 12:51:48 +0000 (UTC)
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
X-Inumbo-ID: 9e9161a8-5b32-4243-ac65-e07a74ccb58c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614171110;
	bh=1voqjsAoBFLxX7rDbdvLrvHACJsPGL3qdmFT+MVPv9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=spjwNbA3ZtlvtPipEn6gfBOlftIW6w7odr2XfL2181T9bK8cCwsM2LBQNoGUtghVL
	 +buNAx7SgQMw6ZIpQxTknwVpx5NTpass/l7ybj6RtHiqw9UifteXfGfnkOwSCWkU4i
	 +eBluSCs+cPiUN6qhMjkc3eoReO4D1oa9TLyuyE4tq8CN6fadJcqZBZAI1aZZ7k9cD
	 E3yRxJH9Z7tX130usP78uATGssnbZnpngxHbuZmw7O9YU3ORHsxEqmWUN5YE2qR+8x
	 2J/Vt5H8IzJBZzsLr2Ld6nXRjj1t9XqhG1tLoj/1TkTDZVWtIxCDwIiZOwDXvLRHs2
	 +1WGDif58wmhw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 62/67] xen-blkback: fix error handling in xen_blkbk_map()
Date: Wed, 24 Feb 2021 07:50:20 -0500
Message-Id: <20210224125026.481804-62-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125026.481804-1-sashal@kernel.org>
References: <20210224125026.481804-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Jan Beulich <jbeulich@suse.com>

[ Upstream commit 871997bc9e423f05c7da7c9178e62dde5df2a7f8 ]

The function uses a goto-based loop, which may lead to an earlier error
getting discarded by a later iteration. Exit this ad-hoc loop when an
error was encountered.

The out-of-memory error path additionally fails to fill a structure
field looked at by xen_blkbk_unmap_prepare() before inspecting the
handle which does get properly set (to BLKBACK_INVALID_HANDLE).

Since the earlier exiting from the ad-hoc loop requires the same field
filling (invalidation) as that on the out-of-memory path, fold both
paths. While doing so, drop the pr_alert(), as extra log messages aren't
going to help the situation (the kernel will log oom conditions already
anyway).

This is XSA-365.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <julien@xen.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/xen-blkback/blkback.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 9ebf53903d7bf..9301de1386436 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -794,8 +794,13 @@ static int xen_blkbk_map(struct xen_blkif_ring *ring,
 			pages[i]->persistent_gnt = persistent_gnt;
 		} else {
 			if (gnttab_page_cache_get(&ring->free_pages,
-						  &pages[i]->page))
-				goto out_of_memory;
+						  &pages[i]->page)) {
+				gnttab_page_cache_put(&ring->free_pages,
+						      pages_to_gnt,
+						      segs_to_map);
+				ret = -ENOMEM;
+				goto out;
+			}
 			addr = vaddr(pages[i]->page);
 			pages_to_gnt[segs_to_map] = pages[i]->page;
 			pages[i]->persistent_gnt = NULL;
@@ -882,17 +887,18 @@ static int xen_blkbk_map(struct xen_blkif_ring *ring,
 	}
 	segs_to_map = 0;
 	last_map = map_until;
-	if (map_until != num)
+	if (!ret && map_until != num)
 		goto again;
 
-	return ret;
-
-out_of_memory:
-	pr_alert("%s: out of memory\n", __func__);
-	gnttab_page_cache_put(&ring->free_pages, pages_to_gnt, segs_to_map);
-	for (i = last_map; i < num; i++)
+out:
+	for (i = last_map; i < num; i++) {
+		/* Don't zap current batch's valid persistent grants. */
+		if(i >= last_map + segs_to_map)
+			pages[i]->persistent_gnt = NULL;
 		pages[i]->handle = BLKBACK_INVALID_HANDLE;
-	return -ENOMEM;
+	}
+
+	return ret;
 }
 
 static int xen_blkbk_map_seg(struct pending_req *pending_req)
-- 
2.27.0


