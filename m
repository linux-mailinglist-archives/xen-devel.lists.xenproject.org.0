Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B24A497B30
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 10:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259765.448348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvNw-0001pB-Jt; Mon, 24 Jan 2022 09:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259765.448348; Mon, 24 Jan 2022 09:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvNw-0001m2-EZ; Mon, 24 Jan 2022 09:11:36 +0000
Received: by outflank-mailman (input) for mailman id 259765;
 Mon, 24 Jan 2022 09:11:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4uJJ=SI=bombadil.srs.infradead.org=BATV+b18af077b488c69bdec9+6728+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nBvNu-0000Il-EJ
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 09:11:34 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f8500a5-7cf5-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 10:11:33 +0100 (CET)
Received: from [2001:4bb8:184:72a4:a337:a75f:a24e:7e39] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvNj-002k3M-8B; Mon, 24 Jan 2022 09:11:23 +0000
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
X-Inumbo-ID: 9f8500a5-7cf5-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3LrK4aJmaFdogyqU1iGTwXaIOJsn5a0nWoXb/YpJask=; b=dOpJ6VWs7GeKGh/hw/8P4SP7FK
	RXz/peApW9FKh8sSsu7uUo+QtvkbnDZDwTOcd5J5Pq5W3XgHqglOKXW799+pUl2WvrjLJprVkTHCA
	p3/3aoG7Mwr53C5WGPXIK6Qqp+gEU7yP0fW+guIJKj3SHE0tRoCgRPkLGqnIJP2biH8/WVSZA7oAH
	pzi1ZQ3awROYglH+FkL+uPSH3p22Q32npWjBeWaOyja3i/9lrLRMlYivos3JfT31vW+hBRer+0qmA
	npqDdh0oZ4yylM4qRHIr/2/DipAO6d3JmwA4VavBQsVevlc2tlTIP6TRjz194kx3o7cOVaSIfO4Io
	RbUoCZzg==;
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
	drbd-dev@lists.linbit.com
Subject: [PATCH 05/19] dm: bio_alloc can't fail if it is allowed to sleep
Date: Mon, 24 Jan 2022 10:10:53 +0100
Message-Id: <20220124091107.642561-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124091107.642561-1-hch@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Remove handling of NULL returns from sleeping bio_alloc calls given that
those can't fail.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-crypt.c          |  5 +----
 drivers/md/dm-log-writes.c     | 18 ------------------
 drivers/md/dm-thin.c           | 25 +++++++++----------------
 drivers/md/dm-zoned-metadata.c | 11 -----------
 drivers/md/dm.c                |  2 --
 5 files changed, 10 insertions(+), 51 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index d4ae31558826a..20abe3486aba1 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1673,9 +1673,6 @@ static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned size)
 		mutex_lock(&cc->bio_alloc_lock);
 
 	clone = bio_alloc_bioset(GFP_NOIO, nr_iovecs, &cc->bs);
-	if (!clone)
-		goto out;
-
 	clone_init(io, clone);
 
 	remaining_size = size;
@@ -1702,7 +1699,7 @@ static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned size)
 		bio_put(clone);
 		clone = NULL;
 	}
-out:
+
 	if (unlikely(gfp_mask & __GFP_DIRECT_RECLAIM))
 		mutex_unlock(&cc->bio_alloc_lock);
 
diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index 139b09b06eda9..25f5e8d2d417b 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -218,10 +218,6 @@ static int write_metadata(struct log_writes_c *lc, void *entry,
 	size_t ret;
 
 	bio = bio_alloc(GFP_KERNEL, 1);
-	if (!bio) {
-		DMERR("Couldn't alloc log bio");
-		goto error;
-	}
 	bio->bi_iter.bi_size = 0;
 	bio->bi_iter.bi_sector = sector;
 	bio_set_dev(bio, lc->logdev->bdev);
@@ -276,11 +272,6 @@ static int write_inline_data(struct log_writes_c *lc, void *entry,
 		atomic_inc(&lc->io_blocks);
 
 		bio = bio_alloc(GFP_KERNEL, bio_pages);
-		if (!bio) {
-			DMERR("Couldn't alloc inline data bio");
-			goto error;
-		}
-
 		bio->bi_iter.bi_size = 0;
 		bio->bi_iter.bi_sector = sector;
 		bio_set_dev(bio, lc->logdev->bdev);
@@ -322,7 +313,6 @@ static int write_inline_data(struct log_writes_c *lc, void *entry,
 error_bio:
 	bio_free_pages(bio);
 	bio_put(bio);
-error:
 	put_io_block(lc);
 	return -1;
 }
@@ -364,10 +354,6 @@ static int log_one_block(struct log_writes_c *lc,
 
 	atomic_inc(&lc->io_blocks);
 	bio = bio_alloc(GFP_KERNEL, bio_max_segs(block->vec_cnt));
-	if (!bio) {
-		DMERR("Couldn't alloc log bio");
-		goto error;
-	}
 	bio->bi_iter.bi_size = 0;
 	bio->bi_iter.bi_sector = sector;
 	bio_set_dev(bio, lc->logdev->bdev);
@@ -387,10 +373,6 @@ static int log_one_block(struct log_writes_c *lc,
 			submit_bio(bio);
 			bio = bio_alloc(GFP_KERNEL,
 					bio_max_segs(block->vec_cnt - i));
-			if (!bio) {
-				DMERR("Couldn't alloc log bio");
-				goto error;
-			}
 			bio->bi_iter.bi_size = 0;
 			bio->bi_iter.bi_sector = sector;
 			bio_set_dev(bio, lc->logdev->bdev);
diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index ec119d2422d5d..76a9c2e9aeeea 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -1180,24 +1180,17 @@ static void process_prepared_discard_passdown_pt1(struct dm_thin_new_mapping *m)
 	}
 
 	discard_parent = bio_alloc(GFP_NOIO, 1);
-	if (!discard_parent) {
-		DMWARN("%s: unable to allocate top level discard bio for passdown. Skipping passdown.",
-		       dm_device_name(tc->pool->pool_md));
-		queue_passdown_pt2(m);
+	discard_parent->bi_end_io = passdown_endio;
+	discard_parent->bi_private = m;
 
-	} else {
-		discard_parent->bi_end_io = passdown_endio;
-		discard_parent->bi_private = m;
-
-		if (m->maybe_shared)
-			passdown_double_checking_shared_status(m, discard_parent);
-		else {
-			struct discard_op op;
+	if (m->maybe_shared)
+		passdown_double_checking_shared_status(m, discard_parent);
+	else {
+		struct discard_op op;
 
-			begin_discard(&op, tc, discard_parent);
-			r = issue_discard(&op, m->data_block, data_end);
-			end_discard(&op, r);
-		}
+		begin_discard(&op, tc, discard_parent);
+		r = issue_discard(&op, m->data_block, data_end);
+		end_discard(&op, r);
 	}
 }
 
diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index ee4626d085574..5718b83cc7182 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -551,10 +551,6 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
 		return ERR_PTR(-ENOMEM);
 
 	bio = bio_alloc(GFP_NOIO, 1);
-	if (!bio) {
-		dmz_free_mblock(zmd, mblk);
-		return ERR_PTR(-ENOMEM);
-	}
 
 	spin_lock(&zmd->mblk_lock);
 
@@ -726,10 +722,6 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 		return -EIO;
 
 	bio = bio_alloc(GFP_NOIO, 1);
-	if (!bio) {
-		set_bit(DMZ_META_ERROR, &mblk->state);
-		return -ENOMEM;
-	}
 
 	set_bit(DMZ_META_WRITING, &mblk->state);
 
@@ -760,9 +752,6 @@ static int dmz_rdwr_block(struct dmz_dev *dev, int op,
 		return -EIO;
 
 	bio = bio_alloc(GFP_NOIO, 1);
-	if (!bio)
-		return -ENOMEM;
-
 	bio->bi_iter.bi_sector = dmz_blk2sect(block);
 	bio_set_dev(bio, dev->bdev);
 	bio_set_op_attrs(bio, op, REQ_SYNC | REQ_META | REQ_PRIO);
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index c0ae8087c6027..81449cbdafa81 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -520,8 +520,6 @@ static struct dm_io *alloc_io(struct mapped_device *md, struct bio *bio)
 	struct bio *clone;
 
 	clone = bio_alloc_bioset(GFP_NOIO, 0, &md->io_bs);
-	if (!clone)
-		return NULL;
 
 	tio = container_of(clone, struct dm_target_io, clone);
 	tio->inside_dm_io = true;
-- 
2.30.2


