Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA1497B31
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 10:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259766.448358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvO0-0002GH-5L; Mon, 24 Jan 2022 09:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259766.448358; Mon, 24 Jan 2022 09:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvNz-0002BE-VT; Mon, 24 Jan 2022 09:11:39 +0000
Received: by outflank-mailman (input) for mailman id 259766;
 Mon, 24 Jan 2022 09:11:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4uJJ=SI=bombadil.srs.infradead.org=BATV+b18af077b488c69bdec9+6728+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nBvNy-0000Il-Bn
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 09:11:38 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1f14a58-7cf5-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 10:11:37 +0100 (CET)
Received: from [2001:4bb8:184:72a4:a337:a75f:a24e:7e39] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvNm-002k5I-1V; Mon, 24 Jan 2022 09:11:26 +0000
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
X-Inumbo-ID: a1f14a58-7cf5-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NiiyVm7T1RSoly2lncOqK9SkmVJ5v0QSThOfEky6q20=; b=uQnKyxlBATH48XXMAb11fRaY6U
	JDgIt9v36xeqHHccRtBuJmLACwlTViCtwkmxIVPuEFW7kvY+MJO+C3HJCac5MsNDsXwzZdYHpiaCS
	xjd5qsyPodf6zk5JxUqX06+nsCeHEOdxgNy2jZW+0HwVhV50gbP9RNNXuGRL2+vF5w4ajs/PB4acy
	g3hpQczrKcQfwSiBgZT0QjLvcjnlQGSAJTsS3o8oonhqPzSfiXWTX68X3HFn6kePqKvZ60czgWHtG
	1x/07YBTnEnKbA1UMRopVqUCBS4tYhmsau3QL7kKnF9J+FT05uROJe+B3RTPSfODPy8Q7rV2IB/u+
	5n9Nm5Lw==;
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
Subject: [PATCH 06/19] dm-crypt: remove clone_init
Date: Mon, 24 Jan 2022 10:10:54 +0100
Message-Id: <20220124091107.642561-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124091107.642561-1-hch@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Just open code it next to the bio allocations, which saves a few lines
of code, prepares for future changes and allows to remove the duplicate
bi_opf assignment for the bio_clone_fast case in kcryptd_io_read.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-crypt.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 20abe3486aba1..3c5ecd35d3483 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -234,7 +234,7 @@ static volatile unsigned long dm_crypt_pages_per_client;
 #define DM_CRYPT_MEMORY_PERCENT			2
 #define DM_CRYPT_MIN_PAGES_PER_CLIENT		(BIO_MAX_VECS * 16)
 
-static void clone_init(struct dm_crypt_io *, struct bio *);
+static void crypt_endio(struct bio *clone);
 static void kcryptd_queue_crypt(struct dm_crypt_io *io);
 static struct scatterlist *crypt_get_sg_data(struct crypt_config *cc,
 					     struct scatterlist *sg);
@@ -1673,7 +1673,10 @@ static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned size)
 		mutex_lock(&cc->bio_alloc_lock);
 
 	clone = bio_alloc_bioset(GFP_NOIO, nr_iovecs, &cc->bs);
-	clone_init(io, clone);
+	clone->bi_private = io;
+	clone->bi_end_io = crypt_endio;
+	bio_set_dev(clone, cc->dev->bdev);
+	clone->bi_opf = io->base_bio->bi_opf;
 
 	remaining_size = size;
 
@@ -1826,16 +1829,6 @@ static void crypt_endio(struct bio *clone)
 	crypt_dec_pending(io);
 }
 
-static void clone_init(struct dm_crypt_io *io, struct bio *clone)
-{
-	struct crypt_config *cc = io->cc;
-
-	clone->bi_private = io;
-	clone->bi_end_io  = crypt_endio;
-	bio_set_dev(clone, cc->dev->bdev);
-	clone->bi_opf	  = io->base_bio->bi_opf;
-}
-
 static int kcryptd_io_read(struct dm_crypt_io *io, gfp_t gfp)
 {
 	struct crypt_config *cc = io->cc;
@@ -1850,10 +1843,12 @@ static int kcryptd_io_read(struct dm_crypt_io *io, gfp_t gfp)
 	clone = bio_clone_fast(io->base_bio, gfp, &cc->bs);
 	if (!clone)
 		return 1;
+	clone->bi_private = io;
+	clone->bi_end_io = crypt_endio;
+	bio_set_dev(clone, cc->dev->bdev);
 
 	crypt_inc_pending(io);
 
-	clone_init(io, clone);
 	clone->bi_iter.bi_sector = cc->start + io->sector;
 
 	if (dm_crypt_integrity_io_alloc(io, clone)) {
-- 
2.30.2


