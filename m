Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7007182BC
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 15:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541811.844950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4M8F-0003Ub-VL; Wed, 31 May 2023 13:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541811.844950; Wed, 31 May 2023 13:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4M8F-0003RP-Rz; Wed, 31 May 2023 13:44:55 +0000
Received: by outflank-mailman (input) for mailman id 541811;
 Wed, 31 May 2023 13:44:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MZqJ=BU=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1q4M8E-0003R8-2j
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 13:44:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51ad0365-ffb9-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 15:44:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE96563B92;
 Wed, 31 May 2023 13:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603B9C433D2;
 Wed, 31 May 2023 13:44:50 +0000 (UTC)
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
X-Inumbo-ID: 51ad0365-ffb9-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685540691;
	bh=ngj77xP5JuQ0WSEzUbr2XD51zkljVFU1XP7Ct4Ddi8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yy5RftwDQ3NkP/xoC9eVMtK2lbZE9FLRfkq5CQ4nOpcylejny9HXufhFdetyLfHcw
	 Av7py+s9/OtZZjWqbLq3GnTh5Ut28WRmlYRhjlwH66vCv+lMiU2Y2ipjhGA75Vq2g1
	 AD/VR0OHQfoXXLDn7Cf9alnb6nl2aI6d7F1jHLp/y/PI08lyjcw7mT3URjcNDHYT8X
	 HGN50BcGjsVIXqwQJCu7szdlStWkgogWWpead94G3OqMxHI8XTibHJnEeJqLiNYkY5
	 VYsuobv00SC/3Kwh36rXCNyqvGd2bzSdDBq31snRUfaBdW1CYRCtptLi7YlGs0Cx7e
	 bJIFTdlbic0gQ==
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
Subject: [PATCH AUTOSEL 5.10 20/21] xen/blkfront: Only check REQ_FUA for writes
Date: Wed, 31 May 2023 09:44:13 -0400
Message-Id: <20230531134415.3384458-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134415.3384458-1-sashal@kernel.org>
References: <20230531134415.3384458-1-sashal@kernel.org>
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
index 6f33d62331b1f..d68a8ca2161fb 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -792,7 +792,8 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
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


