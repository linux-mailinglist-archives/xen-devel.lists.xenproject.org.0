Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA35A497BB5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 10:17:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259796.448447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvTA-0000Ho-6T; Mon, 24 Jan 2022 09:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259796.448447; Mon, 24 Jan 2022 09:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvTA-0000Ej-32; Mon, 24 Jan 2022 09:17:00 +0000
Received: by outflank-mailman (input) for mailman id 259796;
 Mon, 24 Jan 2022 09:16:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4uJJ=SI=bombadil.srs.infradead.org=BATV+b18af077b488c69bdec9+6728+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nBvOK-0000Il-As
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 09:12:00 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aede8a41-7cf5-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 10:11:59 +0100 (CET)
Received: from [2001:4bb8:184:72a4:a337:a75f:a24e:7e39] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvO8-002kKA-Ni; Mon, 24 Jan 2022 09:11:49 +0000
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
X-Inumbo-ID: aede8a41-7cf5-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Cyxt1AOctq4MzkNVEEfEw2Tcf954gS3S1ZhtFoGMx7Y=; b=TnKQRyIaTmEWKd1NYWWMu/BczG
	3lBNgP/3hzLOc7n0/E2pt2/ehm0zUQgCHhTN5EyZuf6Vt6RbHj090KgVvAFXvEKD6DMBJEjWKbELw
	sazUsY1cxO6cSsUs2xJUeGlT1CNBProCFkPVFUcdu+QMp1opMiE1wRqsfgiLOMI3NtIyPiUywXSd0
	AGuq4hOqDcTsWUxmQhRNw/MCi2sfIAYOMW0aPQP7VKQBn8ud8TMuNZUMV74aobNB01AylxJCiVwYb
	FmegYV3cig4qd4KrsHbfKDi08zoISb1B//cCOVjRH3zqFEWBOvqFDlI8tNO02idkmguDd/ePBnTUX
	bEIfqFAw==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.co>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-block@vger.kernel.org,
	dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org,
	ntfs3@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	drbd-dev@lists.linbit.com,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: [PATCH 14/19] block: pass a block_device and opf to blk_next_bio
Date: Mon, 24 Jan 2022 10:11:02 +0100
Message-Id: <20220124091107.642561-15-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124091107.642561-1-hch@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

From: Chaitanya Kulkarni <kch@nvidia.com>

All callers need to set the block_device and operation, so lift that into
the common code.

Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c               |  6 +++++-
 block/blk-lib.c           | 19 +++++--------------
 block/blk-zoned.c         |  9 +++------
 block/blk.h               |  2 --
 drivers/nvme/target/zns.c |  6 +++---
 include/linux/bio.h       |  3 ++-
 6 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 1536579ed490a..a0166f29a05c3 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -344,10 +344,14 @@ void bio_chain(struct bio *bio, struct bio *parent)
 }
 EXPORT_SYMBOL(bio_chain);
 
-struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp)
+struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
+		unsigned int nr_pages, unsigned int opf, gfp_t gfp)
 {
 	struct bio *new = bio_alloc(gfp, nr_pages);
 
+	bio_set_dev(new, bdev);
+	new->bi_opf = opf;
+
 	if (bio) {
 		bio_chain(bio, new);
 		submit_bio(bio);
diff --git a/block/blk-lib.c b/block/blk-lib.c
index 9245b300ef73e..1b8ced45e4e55 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -82,11 +82,8 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 
 		WARN_ON_ONCE((req_sects << 9) > UINT_MAX);
 
-		bio = blk_next_bio(bio, 0, gfp_mask);
+		bio = blk_next_bio(bio, bdev, 0, op, gfp_mask);
 		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
-		bio_set_op_attrs(bio, op, 0);
-
 		bio->bi_iter.bi_size = req_sects << 9;
 		sector += req_sects;
 		nr_sects -= req_sects;
@@ -176,14 +173,12 @@ static int __blkdev_issue_write_same(struct block_device *bdev, sector_t sector,
 	max_write_same_sectors = bio_allowed_max_sectors(q);
 
 	while (nr_sects) {
-		bio = blk_next_bio(bio, 1, gfp_mask);
+		bio = blk_next_bio(bio, bdev, 1, REQ_OP_WRITE_SAME, gfp_mask);
 		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
 		bio->bi_vcnt = 1;
 		bio->bi_io_vec->bv_page = page;
 		bio->bi_io_vec->bv_offset = 0;
 		bio->bi_io_vec->bv_len = bdev_logical_block_size(bdev);
-		bio_set_op_attrs(bio, REQ_OP_WRITE_SAME, 0);
 
 		if (nr_sects > max_write_same_sectors) {
 			bio->bi_iter.bi_size = max_write_same_sectors << 9;
@@ -252,10 +247,8 @@ static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		return -EOPNOTSUPP;
 
 	while (nr_sects) {
-		bio = blk_next_bio(bio, 0, gfp_mask);
+		bio = blk_next_bio(bio, bdev, 0, REQ_OP_WRITE_ZEROES, gfp_mask);
 		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
-		bio->bi_opf = REQ_OP_WRITE_ZEROES;
 		if (flags & BLKDEV_ZERO_NOUNMAP)
 			bio->bi_opf |= REQ_NOUNMAP;
 
@@ -303,11 +296,9 @@ static int __blkdev_issue_zero_pages(struct block_device *bdev,
 		return -EPERM;
 
 	while (nr_sects != 0) {
-		bio = blk_next_bio(bio, __blkdev_sectors_to_bio_pages(nr_sects),
-				   gfp_mask);
+		bio = blk_next_bio(bio, bdev, __blkdev_sectors_to_bio_pages(nr_sects),
+				   REQ_OP_WRITE, gfp_mask);
 		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
-		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 		while (nr_sects != 0) {
 			sz = min((sector_t) PAGE_SIZE, nr_sects << 9);
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 774ecc598bee2..5ab755d792c81 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -215,9 +215,8 @@ static int blkdev_zone_reset_all_emulated(struct block_device *bdev,
 			continue;
 		}
 
-		bio = blk_next_bio(bio, 0, gfp_mask);
-		bio_set_dev(bio, bdev);
-		bio->bi_opf = REQ_OP_ZONE_RESET | REQ_SYNC;
+		bio = blk_next_bio(bio, bdev, 0, REQ_OP_ZONE_RESET | REQ_SYNC,
+				   gfp_mask);
 		bio->bi_iter.bi_sector = sector;
 		sector += zone_sectors;
 
@@ -306,9 +305,7 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 	}
 
 	while (sector < end_sector) {
-		bio = blk_next_bio(bio, 0, gfp_mask);
-		bio_set_dev(bio, bdev);
-		bio->bi_opf = op | REQ_SYNC;
+		bio = blk_next_bio(bio, bdev, 0, op | REQ_SYNC, gfp_mask);
 		bio->bi_iter.bi_sector = sector;
 		sector += zone_sectors;
 
diff --git a/block/blk.h b/block/blk.h
index 8bd43b3ad33d5..6b93de33e8a43 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -406,8 +406,6 @@ extern int blk_iolatency_init(struct request_queue *q);
 static inline int blk_iolatency_init(struct request_queue *q) { return 0; }
 #endif
 
-struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp);
-
 #ifdef CONFIG_BLK_DEV_ZONED
 void blk_queue_free_zone_bitmaps(struct request_queue *q);
 void blk_queue_clear_zone_settings(struct request_queue *q);
diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
index 46bc30fe85d2b..247de74247fab 100644
--- a/drivers/nvme/target/zns.c
+++ b/drivers/nvme/target/zns.c
@@ -412,10 +412,10 @@ static u16 nvmet_bdev_zone_mgmt_emulate_all(struct nvmet_req *req)
 
 	while (sector < get_capacity(bdev->bd_disk)) {
 		if (test_bit(blk_queue_zone_no(q, sector), d.zbitmap)) {
-			bio = blk_next_bio(bio, 0, GFP_KERNEL);
-			bio->bi_opf = zsa_req_op(req->cmd->zms.zsa) | REQ_SYNC;
+			bio = blk_next_bio(bio, bdev, 0,
+				zsa_req_op(req->cmd->zms.zsa) | REQ_SYNC,
+				GFP_KERNEL);
 			bio->bi_iter.bi_sector = sector;
-			bio_set_dev(bio, bdev);
 			/* This may take a while, so be nice to others */
 			cond_resched();
 		}
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 117d7f248ac96..edeae54074ede 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -790,6 +790,7 @@ static inline void bio_set_polled(struct bio *bio, struct kiocb *kiocb)
 		bio->bi_opf |= REQ_NOWAIT;
 }
 
-struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp);
+struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
+		unsigned int nr_pages, unsigned int opf, gfp_t gfp);
 
 #endif /* __LINUX_BIO_H */
-- 
2.30.2


