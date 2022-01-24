Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14839497B63
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 10:12:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259780.448435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvOK-0006Jf-KJ; Mon, 24 Jan 2022 09:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259780.448435; Mon, 24 Jan 2022 09:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvOK-0006DN-F1; Mon, 24 Jan 2022 09:12:00 +0000
Received: by outflank-mailman (input) for mailman id 259780;
 Mon, 24 Jan 2022 09:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4uJJ=SI=bombadil.srs.infradead.org=BATV+b18af077b488c69bdec9+6728+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nBvOI-0000Il-QL
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 09:11:58 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae265d1c-7cf5-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 10:11:58 +0100 (CET)
Received: from [2001:4bb8:184:72a4:a337:a75f:a24e:7e39] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvO5-002kIy-Ur; Mon, 24 Jan 2022 09:11:46 +0000
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
X-Inumbo-ID: ae265d1c-7cf5-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=H757LVIKTEq+1tqMYPD2FmecyVVQJSjnAtYvboQfhHo=; b=GomJocQW08/7qSga4w2CIK+2BK
	FRgJe8mSaZskxJ8huGQ3GCdY9JE51mbqy6LTZP5/YJyxok+aR/+68blZ6+ZP+ajrQVextKMiV73s0
	O3/szJPnf4HWKTQSvlC7KVDKo2hVtkQTucrUuFvorjuCiVuhrj8XVhvIBsZKv8JrOhI9rOjBBBy2q
	JrWeUnQsHk+x6KZcQgs8hS/8CS3knCeuA/DkOkGH2UwWPKz9zz/ha5JUjASlrdD6t3a5IhP8sdLfC
	3lDTVz8uN3dxArIrTUsI2n0McDZIMinlI24UY/n3qYNCJVo4bo09GVt6hvdFf2RQsHbnPKVqo6S+s
	emR21HqQ==;
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
Subject: [PATCH 13/19] block: move blk_next_bio to bio.c
Date: Mon, 24 Jan 2022 10:11:01 +0100
Message-Id: <20220124091107.642561-14-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124091107.642561-1-hch@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Keep blk_next_bio next to the core bio infrastructure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 block/bio.c     | 13 +++++++++++++
 block/blk-lib.c | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 4312a8085396b..1536579ed490a 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -344,6 +344,19 @@ void bio_chain(struct bio *bio, struct bio *parent)
 }
 EXPORT_SYMBOL(bio_chain);
 
+struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp)
+{
+	struct bio *new = bio_alloc(gfp, nr_pages);
+
+	if (bio) {
+		bio_chain(bio, new);
+		submit_bio(bio);
+	}
+
+	return new;
+}
+EXPORT_SYMBOL_GPL(blk_next_bio);
+
 static void bio_alloc_rescue(struct work_struct *work)
 {
 	struct bio_set *bs = container_of(work, struct bio_set, rescue_work);
diff --git a/block/blk-lib.c b/block/blk-lib.c
index 9f09beadcbe30..9245b300ef73e 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -10,19 +10,6 @@
 
 #include "blk.h"
 
-struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp)
-{
-	struct bio *new = bio_alloc(gfp, nr_pages);
-
-	if (bio) {
-		bio_chain(bio, new);
-		submit_bio(bio);
-	}
-
-	return new;
-}
-EXPORT_SYMBOL_GPL(blk_next_bio);
-
 int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 		sector_t nr_sects, gfp_t gfp_mask, int flags,
 		struct bio **biop)
-- 
2.30.2


