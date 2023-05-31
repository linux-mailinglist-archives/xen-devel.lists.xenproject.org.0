Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF9B71828E
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 15:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541808.844940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4M7V-0002up-Ly; Wed, 31 May 2023 13:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541808.844940; Wed, 31 May 2023 13:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4M7V-0002tA-J1; Wed, 31 May 2023 13:44:09 +0000
Received: by outflank-mailman (input) for mailman id 541808;
 Wed, 31 May 2023 13:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MZqJ=BU=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1q4M7T-0002sy-WF
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 13:44:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3558fa9a-ffb9-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 15:44:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7BDE863B55;
 Wed, 31 May 2023 13:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F46C4339E;
 Wed, 31 May 2023 13:44:02 +0000 (UTC)
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
X-Inumbo-ID: 3558fa9a-ffb9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685540643;
	bh=pV9uChkc0H4x4MSq/JUNMWPSxLJQXSvHsCVIU8XyKYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pSk/ef7XqtDyHJtvLmw8nsfj/JHJjeyb7mPNF6k+Jn1hVBBULmCBBJ2lPI+EFcc+G
	 J05a9DDS5jjrBAobce5HDuKOFyJfXsaUNFDmHrWNJbMV2aJdBsDscCHWQ4QR77T4X8
	 gXCV6JqYWzUCqzUi6J7Va39+wJLvCkxcL45I79JYNbDoBu+XvdIdFLcgOd+MckXGLd
	 R06ks5TDmGwCHmQw6oxYd7mPWAPFpFllFSf6DCucd4Vfqm+rmN8PuKTeVY+OskW7PB
	 zeEiZ1kDsG5Pv/29qO7CLwVOjIzIOX2iLPARjJAbxV2g/JzIxJRBiHtrMa3m/wmrcw
	 BgiQjbtxRcigg==
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
Subject: [PATCH AUTOSEL 5.15 22/24] xen/blkfront: Only check REQ_FUA for writes
Date: Wed, 31 May 2023 09:43:18 -0400
Message-Id: <20230531134320.3384102-22-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134320.3384102-1-sashal@kernel.org>
References: <20230531134320.3384102-1-sashal@kernel.org>
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
index 24a86d829f92a..831747ba8113c 100644
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


