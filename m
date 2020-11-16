Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A10D2B46BA
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 15:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28002.56582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kefy1-0006wR-36; Mon, 16 Nov 2020 14:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28002.56582; Mon, 16 Nov 2020 14:58:53 +0000
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
	id 1kefy0-0006vp-VO; Mon, 16 Nov 2020 14:58:52 +0000
Received: by outflank-mailman (input) for mailman id 28002;
 Mon, 16 Nov 2020 14:58:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kefxy-0006ni-W8
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 14:58:51 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f94e0b88-1e5d-4aa5-b7e4-c2388518e708;
 Mon, 16 Nov 2020 14:58:34 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefxM-0003ii-UU; Mon, 16 Nov 2020 14:58:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kefxy-0006ni-W8
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 14:58:51 +0000
X-Inumbo-ID: f94e0b88-1e5d-4aa5-b7e4-c2388518e708
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f94e0b88-1e5d-4aa5-b7e4-c2388518e708;
	Mon, 16 Nov 2020 14:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k53tbKeUbVsb5uwUbGW8UpW/h79If5n0w+H4eZR3xSU=; b=tuJMnQttaybo9F4t8cP+N2hLQq
	RXrM7+cD1yLqquFQbtlx4GxTcGrgpRY8HWo0g3CxND1nv1GYyQPkp8q3K2wzD/dngpDWkkquqHkp4
	sHuLCh62/kacnFU017uJ6lg3sIxNoOE/FenrUxQsyI4PysSw0WPutcnk5f8h8OTz6qITqDy4OBoNX
	j839YHJ1VKl6fCqCZwFmQOwQQf+y4oyipnv0MRAtvY48Ogo6z5wy5t7KJxz/QqkUnQuTFox/n8y/r
	oz3SnuiJlz5Z/j6oveEA/Y/B74scFktzTg4AjYglEkJ4LnQzCz3bmbG+4ANwTszKKWHBb195E+1pa
	yP5eNyVA==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefxM-0003ii-UU; Mon, 16 Nov 2020 14:58:13 +0000
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
	linux-fsdevel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 02/78] loop: let set_capacity_revalidate_and_notify update the bdev size
Date: Mon, 16 Nov 2020 15:56:53 +0100
Message-Id: <20201116145809.410558-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

There is no good reason to call revalidate_disk_size separately.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/block/loop.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index a58084c2ed7ceb..0a0c0c3a68ec4c 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -251,12 +251,8 @@ loop_validate_block_size(unsigned short bsize)
  */
 static void loop_set_size(struct loop_device *lo, loff_t size)
 {
-	struct block_device *bdev = lo->lo_device;
-
-	bd_set_nr_sectors(bdev, size);
-
-	if (!set_capacity_revalidate_and_notify(lo->lo_disk, size, false))
-		kobject_uevent(&disk_to_dev(bdev->bd_disk)->kobj, KOBJ_CHANGE);
+	if (!set_capacity_revalidate_and_notify(lo->lo_disk, size, true))
+		kobject_uevent(&disk_to_dev(lo->lo_disk)->kobj, KOBJ_CHANGE);
 }
 
 static inline int
-- 
2.29.2


