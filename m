Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C24A2A9D22
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 20:04:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21008.47216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb72Y-0005X3-Cy; Fri, 06 Nov 2020 19:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21008.47216; Fri, 06 Nov 2020 19:04:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb72Y-0005W9-7M; Fri, 06 Nov 2020 19:04:50 +0000
Received: by outflank-mailman (input) for mailman id 21008;
 Fri, 06 Nov 2020 19:04:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kb72W-0004zS-S9
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:04:48 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6fca161-46f1-4d6e-a553-1005fb0dbc04;
 Fri, 06 Nov 2020 19:04:20 +0000 (UTC)
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb71l-0000vc-9Z; Fri, 06 Nov 2020 19:04:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VpbQ=EM=casper.srs.infradead.org=batv+cc05c5534fc856bb48c0+6284+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kb72W-0004zS-S9
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 19:04:48 +0000
X-Inumbo-ID: b6fca161-46f1-4d6e-a553-1005fb0dbc04
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b6fca161-46f1-4d6e-a553-1005fb0dbc04;
	Fri, 06 Nov 2020 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S6R/LHkwABMFjsoJfGZBhUHQ6k4Dx5wFWz0jliJ5rD4=; b=U1It/9VbhOthOZFs+YaVYw6zCF
	hNCoh8Q0VrrRw+fcw+giRCsYx4IzyJqpYjQUkT9hnCEW7vlBjyfGp4xQIQZdpzcZqGIczsa9Rbzeq
	csXqFZUcF409NVlMSBJ6emZObaktQ+PW12dNKE6Wt3cwNbOS6p1R+LMqGZ6N5QYbqrmyAk58AFU7i
	vOL8ZxppeFPE2SWuIK6cM1/GCx9SodNxTSAOH8MIGdsdIVTf6kNR7ak6SkuuXu0m07Pf4gSvqNRxz
	GZKRdWmd7ZGqToecIIzl+SJ6plPlZPGQgVa0wCWrE9dOJ0tigJgjfSwvF9I0uonfZF33Uc7mHc/4w
	bMzYnQig==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb71l-0000vc-9Z; Fri, 06 Nov 2020 19:04:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 07/24] nbd: remove the call to set_blocksize
Date: Fri,  6 Nov 2020 20:03:19 +0100
Message-Id: <20201106190337.1973127-8-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106190337.1973127-1-hch@lst.de>
References: <20201106190337.1973127-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Block driver have no business setting the file system concept of a
block size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index c4f9ccf5cc2ac5..f618688a196654 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -296,7 +296,7 @@ static void nbd_size_clear(struct nbd_device *nbd)
 	}
 }
 
-static void nbd_size_update(struct nbd_device *nbd, bool start)
+static void nbd_size_update(struct nbd_device *nbd)
 {
 	struct nbd_config *config = nbd->config;
 	struct block_device *bdev = bdget_disk(nbd->disk, 0);
@@ -311,11 +311,9 @@ static void nbd_size_update(struct nbd_device *nbd, bool start)
 	blk_queue_physical_block_size(nbd->disk->queue, config->blksize);
 	set_capacity(nbd->disk, nr_sectors);
 	if (bdev) {
-		if (bdev->bd_disk) {
+		if (bdev->bd_disk)
 			bd_set_nr_sectors(bdev, nr_sectors);
-			if (start)
-				set_blocksize(bdev, config->blksize);
-		} else
+		else
 			set_bit(GD_NEED_PART_SCAN, &nbd->disk->state);
 		bdput(bdev);
 	}
@@ -329,7 +327,7 @@ static void nbd_size_set(struct nbd_device *nbd, loff_t blocksize,
 	config->blksize = blocksize;
 	config->bytesize = blocksize * nr_blocks;
 	if (nbd->task_recv != NULL)
-		nbd_size_update(nbd, false);
+		nbd_size_update(nbd);
 }
 
 static void nbd_complete_rq(struct request *req)
@@ -1309,7 +1307,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 		args->index = i;
 		queue_work(nbd->recv_workq, &args->work);
 	}
-	nbd_size_update(nbd, true);
+	nbd_size_update(nbd);
 	return error;
 }
 
-- 
2.28.0


