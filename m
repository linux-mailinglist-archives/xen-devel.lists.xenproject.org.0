Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6CF497B4F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 10:12:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259778.448414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvOE-00057D-FM; Mon, 24 Jan 2022 09:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259778.448414; Mon, 24 Jan 2022 09:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvOE-00053l-7M; Mon, 24 Jan 2022 09:11:54 +0000
Received: by outflank-mailman (input) for mailman id 259778;
 Mon, 24 Jan 2022 09:11:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4uJJ=SI=bombadil.srs.infradead.org=BATV+b18af077b488c69bdec9+6728+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nBvOC-0000If-CR
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 09:11:52 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa3c0498-7cf5-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 10:11:51 +0100 (CET)
Received: from [2001:4bb8:184:72a4:a337:a75f:a24e:7e39] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvNz-002kEY-Se; Mon, 24 Jan 2022 09:11:40 +0000
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
X-Inumbo-ID: aa3c0498-7cf5-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=VAKGKCfUBMSLG+YSR57H57ZEkLN6BewyVneVTtK6CWk=; b=oNwS32SfnvZJzN8YyHWJOl3UJU
	oK8E3D1k2MzQjGFbwP74nx+zncMg4ZWN26Kwvr8W7I4e9e+Y2L6hy8cpR3L2XvXtzzYDyhbNqnqQ9
	w03qKB9NAJTwCUVmpEyQq/gm6i42QNyDMbAORMlSkObthZ5e+9xBZSkWvRXDHW2RLODBCZFFBDTrs
	EMymxa1CDJEFDnU1OlGtKeq3PjJ0QNeK8lOUxAaDnGzgcQJ8d/hZdCBE6puiu59q6FQ1mBBRCIzID
	FO2pjHe0vexE4Y0H8hjmtMw3SfeAJNZX3xL/2I1jXcD18x0pr5FmgVw5oBcO8INdt0T5mPhiusMMR
	kSjMrqTQ==;
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
Subject: [PATCH 11/19] rnbd-srv: remove struct rnbd_dev_blk_io
Date: Mon, 24 Jan 2022 10:10:59 +0100
Message-Id: <20220124091107.642561-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124091107.642561-1-hch@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Only the priv field of rnbd_dev_blk_io is used, so store the value of
that in bio->bi_private directly and remove the entire bio_set overhead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rnbd/rnbd-srv-dev.c |  4 +---
 drivers/block/rnbd/rnbd-srv-dev.h | 13 ++-----------
 drivers/block/rnbd/rnbd-srv.c     | 27 ++++-----------------------
 drivers/block/rnbd/rnbd-srv.h     |  1 -
 4 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-srv-dev.c b/drivers/block/rnbd/rnbd-srv-dev.c
index 98d3e591a0885..c5d0a03911659 100644
--- a/drivers/block/rnbd/rnbd-srv-dev.c
+++ b/drivers/block/rnbd/rnbd-srv-dev.c
@@ -12,8 +12,7 @@
 #include "rnbd-srv-dev.h"
 #include "rnbd-log.h"
 
-struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags,
-			       struct bio_set *bs)
+struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags)
 {
 	struct rnbd_dev *dev;
 	int ret;
@@ -30,7 +29,6 @@ struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags,
 
 	dev->blk_open_flags = flags;
 	bdevname(dev->bdev, dev->name);
-	dev->ibd_bio_set = bs;
 
 	return dev;
 
diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
index 1a14ece0be726..2c3df02b5e8ec 100644
--- a/drivers/block/rnbd/rnbd-srv-dev.h
+++ b/drivers/block/rnbd/rnbd-srv-dev.h
@@ -14,25 +14,16 @@
 
 struct rnbd_dev {
 	struct block_device	*bdev;
-	struct bio_set		*ibd_bio_set;
 	fmode_t			blk_open_flags;
 	char			name[BDEVNAME_SIZE];
 };
 
-struct rnbd_dev_blk_io {
-	struct rnbd_dev *dev;
-	void		 *priv;
-	/* have to be last member for front_pad usage of bioset_init */
-	struct bio	bio;
-};
-
 /**
  * rnbd_dev_open() - Open a device
+ * @path:	path to open
  * @flags:	open flags
- * @bs:		bio_set to use during block io,
  */
-struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags,
-			       struct bio_set *bs);
+struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags);
 
 /**
  * rnbd_dev_close() - Close a device
diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index 6d228af1dcc35..ff9b389976078 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -116,9 +116,7 @@ rnbd_get_sess_dev(int dev_id, struct rnbd_srv_session *srv_sess)
 
 static void rnbd_dev_bi_end_io(struct bio *bio)
 {
-	struct rnbd_dev_blk_io *io = bio->bi_private;
-
-	rnbd_endio(io->priv, blk_status_to_errno(bio->bi_status));
+	rnbd_endio(bio->bi_private, blk_status_to_errno(bio->bi_status));
 	bio_put(bio);
 }
 
@@ -131,7 +129,6 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
 	struct rnbd_srv_sess_dev *sess_dev;
 	u32 dev_id;
 	int err;
-	struct rnbd_dev_blk_io *io;
 	struct bio *bio;
 	short prio;
 
@@ -152,7 +149,7 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
 	priv->sess_dev = sess_dev;
 	priv->id = id;
 
-	bio = bio_alloc_bioset(GFP_KERNEL, 1, sess_dev->rnbd_dev->ibd_bio_set);
+	bio = bio_alloc(GFP_KERNEL, 1);
 	if (bio_add_page(bio, virt_to_page(data), datalen,
 			offset_in_page(data)) != datalen) {
 		rnbd_srv_err(sess_dev, "Failed to map data to bio\n");
@@ -160,12 +157,8 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
 		goto bio_put;
 	}
 
-	io = container_of(bio, struct rnbd_dev_blk_io, bio);
-	io->dev = sess_dev->rnbd_dev;
-	io->priv = priv;
-
 	bio->bi_end_io = rnbd_dev_bi_end_io;
-	bio->bi_private = io;
+	bio->bi_private = priv;
 	bio->bi_opf = rnbd_to_bio_flags(le32_to_cpu(msg->rw));
 	bio->bi_iter.bi_sector = le64_to_cpu(msg->sector);
 	bio->bi_iter.bi_size = le32_to_cpu(msg->bi_size);
@@ -260,7 +253,6 @@ static void destroy_sess(struct rnbd_srv_session *srv_sess)
 
 out:
 	xa_destroy(&srv_sess->index_idr);
-	bioset_exit(&srv_sess->sess_bio_set);
 
 	pr_info("RTRS Session %s disconnected\n", srv_sess->sessname);
 
@@ -289,16 +281,6 @@ static int create_sess(struct rtrs_srv_sess *rtrs)
 		return -ENOMEM;
 
 	srv_sess->queue_depth = rtrs_srv_get_queue_depth(rtrs);
-	err = bioset_init(&srv_sess->sess_bio_set, srv_sess->queue_depth,
-			  offsetof(struct rnbd_dev_blk_io, bio),
-			  BIOSET_NEED_BVECS);
-	if (err) {
-		pr_err("Allocating srv_session for path %s failed\n",
-		       pathname);
-		kfree(srv_sess);
-		return err;
-	}
-
 	xa_init_flags(&srv_sess->index_idr, XA_FLAGS_ALLOC);
 	INIT_LIST_HEAD(&srv_sess->sess_dev_list);
 	mutex_init(&srv_sess->lock);
@@ -747,8 +729,7 @@ static int process_msg_open(struct rnbd_srv_session *srv_sess,
 		goto reject;
 	}
 
-	rnbd_dev = rnbd_dev_open(full_path, open_flags,
-				 &srv_sess->sess_bio_set);
+	rnbd_dev = rnbd_dev_open(full_path, open_flags);
 	if (IS_ERR(rnbd_dev)) {
 		pr_err("Opening device '%s' on session %s failed, failed to open the block device, err: %ld\n",
 		       full_path, srv_sess->sessname, PTR_ERR(rnbd_dev));
diff --git a/drivers/block/rnbd/rnbd-srv.h b/drivers/block/rnbd/rnbd-srv.h
index e5604bce123ab..be2ae486d407e 100644
--- a/drivers/block/rnbd/rnbd-srv.h
+++ b/drivers/block/rnbd/rnbd-srv.h
@@ -23,7 +23,6 @@ struct rnbd_srv_session {
 	struct rtrs_srv_sess	*rtrs;
 	char			sessname[NAME_MAX];
 	int			queue_depth;
-	struct bio_set		sess_bio_set;
 
 	struct xarray		index_idr;
 	/* List of struct rnbd_srv_sess_dev */
-- 
2.30.2


