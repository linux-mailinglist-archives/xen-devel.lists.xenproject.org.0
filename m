Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9668D5BDE
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 09:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733343.1139537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0X-000588-1z; Fri, 31 May 2024 07:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733343.1139537; Fri, 31 May 2024 07:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0W-00054B-UT; Fri, 31 May 2024 07:49:00 +0000
Received: by outflank-mailman (input) for mailman id 733343;
 Fri, 31 May 2024 07:48:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rv5j=NC=bombadil.srs.infradead.org=BATV+4872a67a45e6d46d0c49+7586+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCx0V-0004oC-DK
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 07:48:59 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bede7cd-1f22-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 09:48:57 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-5ba9-f4da-76fa-44a9.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:5ba9:f4da:76fa:44a9] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCx0K-00000009XWY-3uLP; Fri, 31 May 2024 07:48:49 +0000
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
X-Inumbo-ID: 3bede7cd-1f22-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=rhxveVy4ScfquPw+Ix55dD12V3sv6PgWUOdWXrb/Dgc=; b=J4nlNlkbb/6E8DoWjrWzBe17s+
	CJVqEecG19yjleGxex9L/rhFT9qasHn6qna9Ox4xdCtfT2NL2WybUr+Btt1JBtMiN63u2AYIWSWYp
	x/b5RauYpwQbW6TG2qy5VU8YmAs4LK1RJ0azUWoICI7ChyFsp1PntmHJb1zjTQ1qbjAApinNKsCX3
	3UxuUS6VXFWwGUdhPdyE9jBuRrwWRfNrp862wHcecAY3+bCIcTlA9yjGFxVf6N9I6LrqtpjuKoH1w
	/hMhiL+hKd/CwPMEmeWIWF8VMYlcztrGWuM8vJw6GkXqKBTc9aMxPq8nTUApUw6ocrxKXVdwFsOXs
	sp7B+rOg==;
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
	linux-scsi@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH 02/14] ubd: untagle discard vs write zeroes not support handling
Date: Fri, 31 May 2024 09:47:57 +0200
Message-ID: <20240531074837.1648501-3-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
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
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 arch/um/drivers/ubd_kern.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index 0c9542d58c01b7..093c87879d08ba 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -449,10 +449,11 @@ static int bulk_req_safe_read(
 
 static void ubd_end_request(struct io_thread_req *io_req)
 {
-	if (io_req->error == BLK_STS_NOTSUPP &&
-	    req_op(io_req->req) == REQ_OP_DISCARD) {
-		blk_queue_max_discard_sectors(io_req->req->q, 0);
-		blk_queue_max_write_zeroes_sectors(io_req->req->q, 0);
+	if (io_req->error == BLK_STS_NOTSUPP) {
+		if (req_op(io_req->req) == REQ_OP_DISCARD)
+			blk_queue_max_discard_sectors(io_req->req->q, 0);
+		else if (req_op(io_req->req) == REQ_OP_WRITE_ZEROES)
+			blk_queue_max_write_zeroes_sectors(io_req->req->q, 0);
 	}
 	blk_mq_end_request(io_req->req, io_req->error);
 	kfree(io_req);
-- 
2.43.0


