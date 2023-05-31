Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F86D718260
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 15:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541800.844919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4M5F-0001rc-1x; Wed, 31 May 2023 13:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541800.844919; Wed, 31 May 2023 13:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4M5E-0001pO-VD; Wed, 31 May 2023 13:41:48 +0000
Received: by outflank-mailman (input) for mailman id 541800;
 Wed, 31 May 2023 13:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MZqJ=BU=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1q4M5E-0001pH-43
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 13:41:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2b5f65f-ffb8-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 15:41:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C7FE63B30;
 Wed, 31 May 2023 13:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D34C4339E;
 Wed, 31 May 2023 13:41:43 +0000 (UTC)
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
X-Inumbo-ID: e2b5f65f-ffb8-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685540505;
	bh=HlwpPDD095eWKjo4oiJTfkTblpFKG89ZfJEGh62GyPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I/AHXEi4gffcFw4H66NjLeAgQNUYA65+rfeyDw9g9EI9otB/vWnYXMywDCAPJM6mC
	 5tZlSW4po/mbyAXem2lAlTLjPpUODxdi1rvb2HIJ9ceHBoIQMao9wimysTy4If9eQO
	 O4JS4pa+Upf8wMKAibsOJiitfK++uSS6s6ZbcS8l9+6CdnKx2r0o3+6/c9/s8XR+1r
	 /WxTGS0PKR3e3Q5uJ57QQpWrStjhjeXT41+URM/KxRmAmg8QGbGJajaTF6O93pT4EQ
	 jSHyodjTI48Rr2cR1Z6pBOtecZf13LElNc5IsWyF7Rdne/II5CXCweCYO3cC0dlsIC
	 GBAamB3O5GgPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	sstabellini@kernel.org,
	roger.pau@citrix.com,
	axboe@kernel.dk,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 34/37] xen/blkfront: Only check REQ_FUA for writes
Date: Wed, 31 May 2023 09:40:16 -0400
Message-Id: <20230531134020.3383253-34-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134020.3383253-1-sashal@kernel.org>
References: <20230531134020.3383253-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Ross Lagerwall <ross.lagerwall@citrix.com>

[ Upstream commit b6ebaa8100090092aa602530d7e8316816d0c98d ]

The existing code silently converts read operations with the
REQ_FUA bit set into write-barrier operations. This results in data
loss as the backend scribbles zeroes over the data instead of returning
it.

While the REQ_FUA bit doesn't make sense on a read operation, at least
one well-known out-of-tree kernel module does set it and since it
results in data loss, let's be safe here and only look at REQ_FUA for
writes.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Acked-by: Juergen Gross <jgross@suse.com>
Link: https://lore.kernel.org/r/20230426164005.2213139-1-ross.lagerwall@citrix.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/xen-blkfront.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 23ed258b57f0e..c1890c8a9f6e7 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -780,7 +780,8 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
 		ring_req->u.rw.handle = info->handle;
 		ring_req->operation = rq_data_dir(req) ?
 			BLKIF_OP_WRITE : BLKIF_OP_READ;
-		if (req_op(req) == REQ_OP_FLUSH || req->cmd_flags & REQ_FUA) {
+		if (req_op(req) == REQ_OP_FLUSH ||
+		    (req_op(req) == REQ_OP_WRITE && (req->cmd_flags & REQ_FUA))) {
 			/*
 			 * Ideally we can do an unordered flush-to-disk.
 			 * In case the backend onlysupports barriers, use that.
-- 
2.39.2


