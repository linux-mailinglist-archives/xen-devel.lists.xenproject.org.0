Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901CA2B48C9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:11:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28274.57372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kegAR-0006qG-Uk; Mon, 16 Nov 2020 15:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28274.57372; Mon, 16 Nov 2020 15:11:43 +0000
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
	id 1kegAQ-0006li-7D; Mon, 16 Nov 2020 15:11:42 +0000
Received: by outflank-mailman (input) for mailman id 28274;
 Mon, 16 Nov 2020 15:11:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kefzR-0006ni-2g
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:00:21 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a7bc4d3-87c4-4f72-884c-ef266ed2069c;
 Mon, 16 Nov 2020 14:58:54 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefxo-0003rX-KZ; Mon, 16 Nov 2020 14:58:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kefzR-0006ni-2g
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:00:21 +0000
X-Inumbo-ID: 7a7bc4d3-87c4-4f72-884c-ef266ed2069c
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7a7bc4d3-87c4-4f72-884c-ef266ed2069c;
	Mon, 16 Nov 2020 14:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Vj0GgZOGZUCqHagrDbWIgIb68CNEMN1B5n/upu75+9M=; b=vJvWy+M6q2aairpF0Q89oICkxI
	PS5amLRUZxt3TDLOTCJKifVBAbRS3ozPh9ssbARTX05RTcowruj+r6DaYiko+IA8YM6yKnqqO9hZ0
	YLPWVj8bReI6zNXL311McIRo6JgWss20/ic0IkcgvXqouBBov4LHHRc3LFvEHbyGhAEZ6L49Q+h8z
	LPV18Yh1YwBXDnHfnQyxhLqXZkED99bdFyjJYXBanIYI+26WlIFdrhNuludlP3Zi5bFQ1Jai7SYT8
	kxlPZdfsH/hR1Of6f1mV+sb6fFGWqYqS2gk4bZxnQp6B+oIaE6yoC0rkzi1aN8TgGTKSgtY0FwCjd
	PfyxB0dA==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefxo-0003rX-KZ; Mon, 16 Nov 2020 14:58:41 +0000
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
Subject: [PATCH 22/78] virtio-blk: remove a spurious call to revalidate_disk_size
Date: Mon, 16 Nov 2020 15:57:13 +0100
Message-Id: <20201116145809.410558-23-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

revalidate_disk_size just updates the block device size from the disk
size.  Thus calling it from virtblk_update_cache_mode doesn't actually
do anything.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/block/virtio_blk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 3e812b4c32e669..145606dc52db1e 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -598,7 +598,6 @@ static void virtblk_update_cache_mode(struct virtio_device *vdev)
 	struct virtio_blk *vblk = vdev->priv;
 
 	blk_queue_write_cache(vblk->disk->queue, writeback, false);
-	revalidate_disk_size(vblk->disk, true);
 }
 
 static const char *const virtblk_cache_types[] = {
-- 
2.29.2


