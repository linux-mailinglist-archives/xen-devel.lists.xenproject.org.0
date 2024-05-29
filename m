Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0628D2BF6
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 07:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731373.1136812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVA-0002KX-U8; Wed, 29 May 2024 05:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731373.1136812; Wed, 29 May 2024 05:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVA-0002Il-R3; Wed, 29 May 2024 05:05:28 +0000
Received: by outflank-mailman (input) for mailman id 731373;
 Wed, 29 May 2024 05:05:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7nM=NA=bombadil.srs.infradead.org=BATV+c55c297d46ee5715703b+7584+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCBV6-0002IO-VQ
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 05:05:27 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cd62887-1d79-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 07:05:23 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCBUv-00000002pSP-1Lzk; Wed, 29 May 2024 05:05:13 +0000
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
X-Inumbo-ID: 0cd62887-1d79-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=/OLpY6jO6BGmZUZluvnHNfe+GDP4sT7VwC1y29SpC6U=; b=OeadjJJGioCa4ge9VNZLLPIeJ8
	O9S5rUx9FafsfCUd/nVJdDPOpkJsv/E9yKCxbOOv290nnhE62p3wpyYQNPmrOmNyU3hzVOzhGPQxa
	5a4T1lTIFSW+n3MtalzxAOCYtI3DQHhzspZ8bYnEdLFBuQ+bNkNK5b871ug/c8Zf1MXixhuq1fwcL
	BxKay23FFqMmNqBL5VSxy6HUEZFvyI7zrsX4GqEOmWHd2HuIc7ZktQuuiNYT9hnqC19jbRgfOjXtD
	KR9+Ssjbvj0F4kFxGdIepfLmbgfwNS35I/CDczeE6V2t2s7vUtO9/Gkm7F3aD4SXdu4zuGlpm8kbx
	t86dAPmA==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 01/12] ubd: untagle discard vs write zeroes not support handling
Date: Wed, 29 May 2024 07:04:03 +0200
Message-ID: <20240529050507.1392041-2-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Discard and Write Zeroes are different operation and implemented
by different fallocate opcodes for ubd.  If one fails the other one
can work and vice versa.

Split the code to disable the operations in ubd_handler to only
disable the operation that actually failed.

Fixes: 50109b5a03b4 ("um: Add support for DISCARD in the UBD Driver")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/um/drivers/ubd_kern.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index ef805eaa9e013d..a79a3b7c33a647 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -471,9 +471,14 @@ static void ubd_handler(void)
 		for (count = 0; count < n/sizeof(struct io_thread_req *); count++) {
 			struct io_thread_req *io_req = (*irq_req_buffer)[count];
 
-			if ((io_req->error == BLK_STS_NOTSUPP) && (req_op(io_req->req) == REQ_OP_DISCARD)) {
-				blk_queue_max_discard_sectors(io_req->req->q, 0);
-				blk_queue_max_write_zeroes_sectors(io_req->req->q, 0);
+			if (io_req->error == BLK_STS_NOTSUPP) {
+				struct request_queue *q = io_req->req->q;
+
+				if (req_op(io_req->req) == REQ_OP_DISCARD)
+					blk_queue_max_discard_sectors(q, 0);
+				if (req_op(io_req->req) == REQ_OP_WRITE_ZEROES)
+					blk_queue_max_write_zeroes_sectors(q,
+							0);
 			}
 			blk_mq_end_request(io_req->req, io_req->error);
 			kfree(io_req);
-- 
2.43.0


