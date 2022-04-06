Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A064F5554
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 08:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299528.510421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbyni-0002gE-6K; Wed, 06 Apr 2022 06:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299528.510421; Wed, 06 Apr 2022 06:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbyni-0002eT-2y; Wed, 06 Apr 2022 06:05:54 +0000
Received: by outflank-mailman (input) for mailman id 299528;
 Wed, 06 Apr 2022 06:05:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=huFP=UQ=bombadil.srs.infradead.org=BATV+4210fbe0094d03a681f9+6800+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nbynf-0000i6-Ri
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 06:05:51 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98c9c264-b56f-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 08:05:46 +0200 (CEST)
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbynT-003usA-Kd; Wed, 06 Apr 2022 06:05:40 +0000
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
X-Inumbo-ID: 98c9c264-b56f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cTLTfYr7duFMbl13zCRXcRUBgEmH7Snqn+WlWdpEWNo=; b=ZV/CVrUb4qbpXBUImFAvqmY7OC
	YR/KmNB2+lAjq+EqA8oBYfyehyx3Nq+YwtV4TxCIA5A8L2WVXtNlev4guWoUuadGmFOwtgMiNwq9i
	yqX5G6E2+zNceTQVJtjM3l08MHhteYnLHXffM4/jtc5yfz/GeuE8HPUJ4reOje5U615tM7p768ryF
	Y/h9+5h+K+8NlHUqGExK7MtGefB5aNgyMmSmLlNaZTgeiyQAt5+xaIpSgQ/+zSSJmDjA+IoRmYh1L
	IwncIh14NoCZ6DbOmIaikx8OL30Ru/YZRUBoYvofpcHUxFXkbbQXdd7v+XeVl55WVE6NwYrNNaEln
	SKW/g4CA==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com,
	linux-mm@kvack.org
Subject: [PATCH 05/27] drbd: use bdev based limit helpers in drbd_send_sizes
Date: Wed,  6 Apr 2022 08:04:54 +0200
Message-Id: <20220406060516.409838-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use the bdev based limits helpers where they exist.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_main.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 74b1b2424efff..d20d84ee7a88e 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -924,7 +924,9 @@ int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enu
 
 	memset(p, 0, packet_size);
 	if (get_ldev_if_state(device, D_NEGOTIATING)) {
-		struct request_queue *q = bdev_get_queue(device->ldev->backing_bdev);
+		struct block_device *bdev = device->ldev->backing_bdev;
+		struct request_queue *q = bdev_get_queue(bdev);
+
 		d_size = drbd_get_max_capacity(device->ldev);
 		rcu_read_lock();
 		u_size = rcu_dereference(device->ldev->disk_conf)->disk_size;
@@ -933,16 +935,15 @@ int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enu
 		max_bio_size = queue_max_hw_sectors(q) << 9;
 		max_bio_size = min(max_bio_size, DRBD_MAX_BIO_SIZE);
 		p->qlim->physical_block_size =
-			cpu_to_be32(queue_physical_block_size(q));
+			cpu_to_be32(bdev_physical_block_size(bdev));
 		p->qlim->logical_block_size =
-			cpu_to_be32(queue_logical_block_size(q));
+			cpu_to_be32(bdev_logical_block_size(bdev));
 		p->qlim->alignment_offset =
 			cpu_to_be32(queue_alignment_offset(q));
-		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
-		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
+		p->qlim->io_min = cpu_to_be32(bdev_io_min(bdev));
+		p->qlim->io_opt = cpu_to_be32(bdev_io_opt(bdev));
 		p->qlim->discard_enabled = blk_queue_discard(q);
-		p->qlim->write_same_capable =
-			!!q->limits.max_write_same_sectors;
+		p->qlim->write_same_capable = 0;
 		put_ldev(device);
 	} else {
 		struct request_queue *q = device->rq_queue;
-- 
2.30.2


