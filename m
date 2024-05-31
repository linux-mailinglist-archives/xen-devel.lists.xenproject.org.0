Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D9C8D5BDA
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 09:49:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733344.1139553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0Y-0005YR-G4; Fri, 31 May 2024 07:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733344.1139553; Fri, 31 May 2024 07:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0Y-0005VW-Bg; Fri, 31 May 2024 07:49:02 +0000
Received: by outflank-mailman (input) for mailman id 733344;
 Fri, 31 May 2024 07:49:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rv5j=NC=bombadil.srs.infradead.org=BATV+4872a67a45e6d46d0c49+7586+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCx0X-0004oC-9h
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 07:49:01 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d3a3e68-1f22-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 09:48:59 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-5ba9-f4da-76fa-44a9.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:5ba9:f4da:76fa:44a9] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCx0N-00000009XXW-22Ka; Fri, 31 May 2024 07:48:52 +0000
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
X-Inumbo-ID: 3d3a3e68-1f22-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=0q2p+u53R9YY1ujQIkkIYHdGljvaoYfmRjVYZa1pGUw=; b=NQeQhA2UOUYImH9TH8f84PjtdO
	ObERM3qoC8ul3CKlxRBe0dwRdXaSSfDKIuJPDJKIXddbCk4DuIEOabi0xeClPM4iSB5KZs7KRVBke
	QXuG41cYK3YbO5bkABYuBrfzr2b20SayGqug5sRun1euqWYw8yIMYgwVe7df1qO/MfVZyOgF1Y4jH
	8S8LuTfmFWj0aSfI2cvZCNBbal2QtT+CQ6/gS37bIRRARF26B6AGUCKpsAA2d+30Zq8U6sLyU8dBv
	Bk3tXLY8MqgLz5OO3tA8AK0iTNwDc6TpStdHEqtPrSKHpQTid5SoU4/Ug1OFPywaZgXzR2J5gCky/
	tKVHxQ0Q==;
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
Subject: [PATCH 03/14] rbd: increase io_opt again
Date: Fri, 31 May 2024 09:47:58 +0200
Message-ID: <20240531074837.1648501-4-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Commit 16d80c54ad42 ("rbd: set io_min, io_opt and discard_granularity to
alloc_size") lowered the io_opt size for rbd from objset_bytes which is
4MB for typical setup to alloc_size which is typically 64KB.

The commit mostly talks about discard behavior and does mention io_min
in passing.  Reducing io_opt means reducing the readahead size, which
seems counter-intuitive given that rbd currently abuses the user
max_sectors setting to actually increase the I/O size.  Switch back
to the old setting to allow larger reads (the readahead size despite it's
name actually limits the size of any buffered read) and to prepare
for using io_opt in the max_sectors calculation and getting drivers out
of the business of overriding the max_user_sectors value.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 26ff5cd2bf0abc..46dc487ccc17eb 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -4955,8 +4955,8 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	struct queue_limits lim = {
 		.max_hw_sectors		= objset_bytes >> SECTOR_SHIFT,
 		.max_user_sectors	= objset_bytes >> SECTOR_SHIFT,
+		.io_opt			= objset_bytes,
 		.io_min			= rbd_dev->opts->alloc_size,
-		.io_opt			= rbd_dev->opts->alloc_size,
 		.max_segments		= USHRT_MAX,
 		.max_segment_size	= UINT_MAX,
 	};
-- 
2.43.0


