Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F60497B2B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 10:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259762.448310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvNr-0000ij-9F; Mon, 24 Jan 2022 09:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259762.448310; Mon, 24 Jan 2022 09:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvNr-0000bi-1F; Mon, 24 Jan 2022 09:11:31 +0000
Received: by outflank-mailman (input) for mailman id 259762;
 Mon, 24 Jan 2022 09:11:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4uJJ=SI=bombadil.srs.infradead.org=BATV+b18af077b488c69bdec9+6728+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nBvNp-0000If-Pd
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 09:11:29 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cdd5d7b-7cf5-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 10:11:29 +0100 (CET)
Received: from [2001:4bb8:184:72a4:a337:a75f:a24e:7e39] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvNa-002jzZ-UA; Mon, 24 Jan 2022 09:11:15 +0000
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
X-Inumbo-ID: 9cdd5d7b-7cf5-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7QPyuzOR2N2LqXuXA08GkKhJ7fsHc2fxZXqTeovi8aQ=; b=2kZbM0T8QbsM92lbMKqXzE0qN2
	BriYoV4AmiZRKSGpRmt1ddIwn28XJ7g+yBaV1K4id1qDq8Pv48KVl9NtssO6c1vWo4jkhX3iORWze
	kh5EiBljdNHNvsDLJO6R+tnfX9vWUmnrDiZYXxyIrOEeexYhsimX7cdkKwI+Ju4bAO8b7afxXuYfB
	ZGoprdRWUIkzCymUv80hK8SCFVqF4kUf0wcLCJaVymk3vX6D/JEMW+djci/m/kvJDut4IzkrML+3l
	aTXx4e+8l8JI71daFpL4tsVOfzrp/ZSz3X2y4SzN0vz4tycRc583YoUfd0/5Dt/Q1+sjPg/e9lr6d
	WjO16WFA==;
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
Subject: [PATCH 02/19] nilfs2: remove nilfs_alloc_seg_bio
Date: Mon, 24 Jan 2022 10:10:50 +0100
Message-Id: <20220124091107.642561-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124091107.642561-1-hch@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

bio_alloc will never fail when it can sleep.  Remove the now simple
nilfs_alloc_seg_bio helper and open code it in the only caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/nilfs2/segbuf.c | 31 ++++---------------------------
 1 file changed, 4 insertions(+), 27 deletions(-)

diff --git a/fs/nilfs2/segbuf.c b/fs/nilfs2/segbuf.c
index 43287b0d3e9b6..53b7c6d21cdd8 100644
--- a/fs/nilfs2/segbuf.c
+++ b/fs/nilfs2/segbuf.c
@@ -371,29 +371,6 @@ static int nilfs_segbuf_submit_bio(struct nilfs_segment_buffer *segbuf,
 	return err;
 }
 
-/**
- * nilfs_alloc_seg_bio - allocate a new bio for writing log
- * @nilfs: nilfs object
- * @start: start block number of the bio
- * @nr_vecs: request size of page vector.
- *
- * Return Value: On success, pointer to the struct bio is returned.
- * On error, NULL is returned.
- */
-static struct bio *nilfs_alloc_seg_bio(struct the_nilfs *nilfs, sector_t start,
-				       int nr_vecs)
-{
-	struct bio *bio;
-
-	bio = bio_alloc(GFP_NOIO, nr_vecs);
-	if (likely(bio)) {
-		bio_set_dev(bio, nilfs->ns_bdev);
-		bio->bi_iter.bi_sector =
-			start << (nilfs->ns_blocksize_bits - 9);
-	}
-	return bio;
-}
-
 static void nilfs_segbuf_prepare_write(struct nilfs_segment_buffer *segbuf,
 				       struct nilfs_write_info *wi)
 {
@@ -414,10 +391,10 @@ static int nilfs_segbuf_submit_bh(struct nilfs_segment_buffer *segbuf,
 	BUG_ON(wi->nr_vecs <= 0);
  repeat:
 	if (!wi->bio) {
-		wi->bio = nilfs_alloc_seg_bio(wi->nilfs, wi->blocknr + wi->end,
-					      wi->nr_vecs);
-		if (unlikely(!wi->bio))
-			return -ENOMEM;
+		wi->bio = bio_alloc(GFP_NOIO, wi->nr_vecs);
+		bio_set_dev(wi->bio, wi->nilfs->ns_bdev);
+		wi->bio->bi_iter.bi_sector = (wi->blocknr + wi->end) <<
+			(wi->nilfs->ns_blocksize_bits - 9);
 	}
 
 	len = bio_add_page(wi->bio, bh->b_page, bh->b_size, bh_offset(bh));
-- 
2.30.2


