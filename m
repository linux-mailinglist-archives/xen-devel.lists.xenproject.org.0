Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B254F5575
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 08:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299538.510467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbyo8-0004hh-3N; Wed, 06 Apr 2022 06:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299538.510467; Wed, 06 Apr 2022 06:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbyo7-0004dv-VX; Wed, 06 Apr 2022 06:06:19 +0000
Received: by outflank-mailman (input) for mailman id 299538;
 Wed, 06 Apr 2022 06:06:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=huFP=UQ=bombadil.srs.infradead.org=BATV+4210fbe0094d03a681f9+6800+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nbyo5-0000hu-Rn
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 06:06:17 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab40242b-b56f-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 08:06:17 +0200 (CEST)
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbynq-003v9s-8N; Wed, 06 Apr 2022 06:06:02 +0000
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
X-Inumbo-ID: ab40242b-b56f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6QVq+WRTbBiZAGVnN7IJPNcrDbkE5gjblRwCavAMwLY=; b=iYaG9VkUCm4D5TSOODWzio+3DR
	ytZ5+1QAyty9m+UBWG1IlrNmfBUfcieyEgGbnGvY+TeziydmDWxyUyplf08DqEXPrSA6ogGWlWBdc
	eN+NdSm2eI+GluAazic6ThRfk6EDWhUlwAFB1sgAiTcA0zTyVy4xoxDN7lNirp1PXWPDjCYKA8P/e
	a8Slx22YjqPgPpaGfnOLHtBTxMkfAK1Qngg3xOt/ieRRfzMYcYXFMoAX7pejVqOX04vm+E3B6daNl
	No56Cgl46IA8J2O0CAKFddZqGLAK02p4IZLzzaiPdfWcvculhrlYOGpmXilPV0+0lJWjaiLUMp8xe
	qYLNQzvg==;
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
Subject: [PATCH 11/27] block: add a bdev_write_cache helper
Date: Wed,  6 Apr 2022 08:05:00 +0200
Message-Id: <20220406060516.409838-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Add a helper to check the write cache flag based on the block_device
instead of having to poke into the block layer internal request_queue.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rnbd/rnbd-srv.c       | 2 +-
 drivers/block/xen-blkback/xenbus.c  | 2 +-
 drivers/target/target_core_iblock.c | 8 ++------
 fs/btrfs/disk-io.c                  | 3 +--
 include/linux/blkdev.h              | 5 +++++
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index f04df6294650b..f8cc3c5fecb4b 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -558,7 +558,7 @@ static void rnbd_srv_fill_msg_open_rsp(struct rnbd_msg_open_rsp *rsp,
 	rsp->secure_discard =
 		cpu_to_le16(rnbd_dev_get_secure_discard(rnbd_dev));
 	rsp->cache_policy = 0;
-	if (test_bit(QUEUE_FLAG_WC, &q->queue_flags))
+	if (bdev_write_cache(rnbd_dev->bdev))
 		rsp->cache_policy |= RNBD_WRITEBACK;
 	if (blk_queue_fua(q))
 		rsp->cache_policy |= RNBD_FUA;
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index f09040435e2e5..8b691fe50475f 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -517,7 +517,7 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 		vbd->type |= VDISK_REMOVABLE;
 
 	q = bdev_get_queue(bdev);
-	if (q && test_bit(QUEUE_FLAG_WC, &q->queue_flags))
+	if (bdev_write_cache(bdev))
 		vbd->flush_support = true;
 
 	if (q && blk_queue_secure_erase(q))
diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index b41ee5c3b5b82..03013e85ffc03 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -737,7 +737,7 @@ iblock_execute_rw(struct se_cmd *cmd, struct scatterlist *sgl, u32 sgl_nents,
 		if (test_bit(QUEUE_FLAG_FUA, &q->queue_flags)) {
 			if (cmd->se_cmd_flags & SCF_FUA)
 				opf |= REQ_FUA;
-			else if (!test_bit(QUEUE_FLAG_WC, &q->queue_flags))
+			else if (!bdev_write_cache(ib_dev->ibd_bd))
 				opf |= REQ_FUA;
 		}
 	} else {
@@ -886,11 +886,7 @@ iblock_parse_cdb(struct se_cmd *cmd)
 
 static bool iblock_get_write_cache(struct se_device *dev)
 {
-	struct iblock_dev *ib_dev = IBLOCK_DEV(dev);
-	struct block_device *bd = ib_dev->ibd_bd;
-	struct request_queue *q = bdev_get_queue(bd);
-
-	return test_bit(QUEUE_FLAG_WC, &q->queue_flags);
+	return bdev_write_cache(IBLOCK_DEV(dev)->ibd_bd);
 }
 
 static const struct target_backend_ops iblock_ops = {
diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index b30309f187cf0..d80adee32128d 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -4247,8 +4247,7 @@ static void write_dev_flush(struct btrfs_device *device)
 	 * of simplicity, since this is a debug tool and not meant for use in
 	 * non-debug builds.
 	 */
-	struct request_queue *q = bdev_get_queue(device->bdev);
-	if (!test_bit(QUEUE_FLAG_WC, &q->queue_flags))
+	if (bdev_write_cache(device->bdev))
 		return;
 #endif
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 3a9578e14a6b0..807a49aa5a27a 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1331,6 +1331,11 @@ static inline bool bdev_nonrot(struct block_device *bdev)
 	return blk_queue_nonrot(bdev_get_queue(bdev));
 }
 
+static inline bool bdev_write_cache(struct block_device *bdev)
+{
+	return test_bit(QUEUE_FLAG_WC, &bdev_get_queue(bdev)->queue_flags);
+}
+
 static inline enum blk_zoned_model bdev_zoned_model(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
-- 
2.30.2


