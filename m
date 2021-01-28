Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 622C2306E30
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76569.138195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51T6-0003Og-0k; Thu, 28 Jan 2021 07:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76569.138195; Thu, 28 Jan 2021 07:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51T5-0003OB-T6; Thu, 28 Jan 2021 07:11:51 +0000
Received: by outflank-mailman (input) for mailman id 76569;
 Thu, 28 Jan 2021 07:11:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51T4-0003No-KE
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:11:50 +0000
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd66f260-13a4-4693-b98f-d42b9279e01c;
 Thu, 28 Jan 2021 07:11:48 +0000 (UTC)
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:11:47 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:56:07 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:11:46 -0800
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
X-Inumbo-ID: cd66f260-13a4-4693-b98f-d42b9279e01c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611817908; x=1643353908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eWet3+GOqUNRw+dCyihtl3LTOeV3gTTJDd7Ea4w+clg=;
  b=iMqWOGYFcU/z4lo7PoOXYZTsAbxO7VKfU3WDTRM+XIro0cg2PZ+UoR0O
   zOdKL9nsRm6UChk8kvAImXLNrXJuxtg9dlr6ojpj8kID5TkhQqGaQom60
   wg25bVcYzhDP0hWBoVNCOqFXxW6GTSHb0yNNXD5+gv5Wkm+LjrW6aYuGx
   08xgPmCTvnNHJwhyhDcKS8dTurEhHbjHm85Thosp/DiIXf16omtWeRAg7
   NNXUdRg9wKKx0J20ty0i+us+O+79Fvluj55eIdqfCHHNcmbDTN+WC/O/r
   Pw/Nru94ujijYu/STDWWO3smL5bQcTvzOlXUigAN7uyuGXjOLbWYdODyP
   Q==;
IronPort-SDR: Cg0YySq52S1BuYvbYJA5tV8RN60kOfaJ8QXPIarU8RJmGG3ZSm/zgGgxYXimAfRAR57BaBhNGr
 eklxNYueuhkztz/2Y53pIGN8qULIrhRgLGXXMPGlwjENBeiZpicXu9PleRFAF5EDK5xsI6HFFu
 8TG9KKCq/uYMXasbYK6QEKHI3/w6UReRb5bl4JJboF1ixvE3MVGP9ojTuASPW1PjQGHXqKIKNq
 TFF0e9aMJlt2AjHUKWh6Hr/xiC6D1AVKrOgP2fTJxoUyl6aj5HEI46V+2is+atUd3Q0NGhKsAA
 I08=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="162963089"
IronPort-SDR: CQ3xngbmWgBCY128PrOjv3YPIhdzR5/rdx7EQv1x+b0HTwFN4ltwdNFQv5FvA1TbS4ULFawWPm
 kwT2sibF6IG3KiSh+LGFEWCNi2B/00GnBOk4cp/TDLePP49TiHQd8DgSijwnSZiTydgmYgLvYS
 KcLPasadLharbWJpg07S5Ezzl0RrLkJ3twr/qU043n8xTi/DMptOxbb20eNEECbQEOlfBU4uWd
 7NoP/Y4QBbrDoXvqexuZ776uaQPac/TQHhI3PEFF9dMqayERupQaa+CULj8SgwqQ46dfOiCsy0
 jENBUexABXv5dcxgCfqU2R3T
IronPort-SDR: UO027L+w2LmrSv+r4jHc7V6MfhclxochZ4q/gKoOnHb/alTZT7F9/4KjZrNCZAKJPJHjEl8zjQ
 btfDHq8ntGB6arYkxikoGObA79gqCi3nJZAFBbpTjKtHzOWqNheZit1SHeKrnOkOlZqda10wHA
 lKzVa+peWlZiSXNoZnitf2s3YH424/Lf6Od0Q5TvGZLxtIxoLSsxIGie29rcLN/atLab1ULG9S
 UmjXPLLRWItiporouoLkwAzUh8fELyClcBeyT3S1PWdOuFAmZ6ShYxhRystXSbBeBsPW0LixEL
 geY=
WDCIronportException: Internal
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org,
	linux-mm@kvack.org
Cc: axboe@kernel.dk,
	philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	konrad.wilk@oracle.com,
	roger.pau@citrix.com,
	minchan@kernel.org,
	ngupta@vflare.org,
	sergey.senozhatsky.work@gmail.com,
	agk@redhat.com,
	snitzer@redhat.com,
	hch@lst.de,
	sagi@grimberg.me,
	chaitanya.kulkarni@wdc.com,
	martin.petersen@oracle.com,
	viro@zeniv.linux.org.uk,
	tytso@mit.edu,
	jaegeuk@kernel.org,
	ebiggers@kernel.org,
	djwong@kernel.org,
	shaggy@kernel.org,
	konishi.ryusuke@gmail.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	damien.lemoal@wdc.com,
	naohiro.aota@wdc.com,
	jth@kernel.org,
	rjw@rjwysocki.net,
	len.brown@intel.com,
	pavel@ucw.cz,
	akpm@linux-foundation.org,
	hare@suse.de,
	gustavoars@kernel.org,
	tiwai@suse.de,
	alex.shi@linux.alibaba.com,
	asml.silence@gmail.com,
	ming.lei@redhat.com,
	tj@kernel.org,
	osandov@fb.com,
	bvanassche@acm.org,
	jefflexu@linux.alibaba.com
Subject: [RFC PATCH 01/34] block: move common code into blk_next_bio()
Date: Wed, 27 Jan 2021 23:11:00 -0800
Message-Id: <20210128071133.60335-2-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

blk_next_bio() is the central function which allocates the bios for
discard, write-same, write-zeroes and zone-mgmt. The initialization of
various bio members is duplicated in disacrd, write-same, write-zeores.
In this preparation patch we add bdev, sector, op, and opf arguments to
the blk_next_bio() to reduce the duplication. 

In the next patch we introduce bio_new(), this prepration patch allows
us to call it inside blk_next_bio().

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 block/blk-lib.c   | 36 +++++++++++++++---------------------
 block/blk-zoned.c |  4 +---
 block/blk.h       |  5 +++--
 3 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 752f9c722062..fb486a0bdb58 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -10,7 +10,9 @@
 
 #include "blk.h"
 
-struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp)
+struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
+			sector_t sect, unsigned op, unsigned opf,
+			unsigned int nr_pages, gfp_t gfp)
 {
 	struct bio *new = bio_alloc(gfp, nr_pages);
 
@@ -19,6 +21,10 @@ struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp)
 		submit_bio(bio);
 	}
 
+	new->bi_iter.bi_sector = sect;
+	bio_set_dev(new, bdev);
+	bio_set_op_attrs(new, op, opf);
+
 	return new;
 }
 
@@ -94,11 +100,7 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 
 		WARN_ON_ONCE((req_sects << 9) > UINT_MAX);
 
-		bio = blk_next_bio(bio, 0, gfp_mask);
-		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
-		bio_set_op_attrs(bio, op, 0);
-
+		bio = blk_next_bio(bio, bdev, sector, op, 0, 0, gfp_mask);
 		bio->bi_iter.bi_size = req_sects << 9;
 		sector += req_sects;
 		nr_sects -= req_sects;
@@ -168,6 +170,7 @@ static int __blkdev_issue_write_same(struct block_device *bdev, sector_t sector,
 {
 	struct request_queue *q = bdev_get_queue(bdev);
 	unsigned int max_write_same_sectors;
+	unsigned int op = REQ_OP_WRITE_SAME;
 	struct bio *bio = *biop;
 	sector_t bs_mask;
 
@@ -188,14 +191,11 @@ static int __blkdev_issue_write_same(struct block_device *bdev, sector_t sector,
 	max_write_same_sectors = bio_allowed_max_sectors(q);
 
 	while (nr_sects) {
-		bio = blk_next_bio(bio, 1, gfp_mask);
-		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
+		bio = blk_next_bio(bio, bdev, sector, op, 0, 1, gfp_mask);
 		bio->bi_vcnt = 1;
 		bio->bi_io_vec->bv_page = page;
 		bio->bi_io_vec->bv_offset = 0;
 		bio->bi_io_vec->bv_len = bdev_logical_block_size(bdev);
-		bio_set_op_attrs(bio, REQ_OP_WRITE_SAME, 0);
 
 		if (nr_sects > max_write_same_sectors) {
 			bio->bi_iter.bi_size = max_write_same_sectors << 9;
@@ -249,7 +249,9 @@ static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 {
 	struct bio *bio = *biop;
 	unsigned int max_write_zeroes_sectors;
+	unsigned int op = REQ_OP_WRITE_ZEROES;
 	struct request_queue *q = bdev_get_queue(bdev);
+	unsigned int opf = flags & BLKDEV_ZERO_NOUNMAP ? REQ_NOUNMAP : 0;
 
 	if (!q)
 		return -ENXIO;
@@ -264,13 +266,7 @@ static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		return -EOPNOTSUPP;
 
 	while (nr_sects) {
-		bio = blk_next_bio(bio, 0, gfp_mask);
-		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
-		bio->bi_opf = REQ_OP_WRITE_ZEROES;
-		if (flags & BLKDEV_ZERO_NOUNMAP)
-			bio->bi_opf |= REQ_NOUNMAP;
-
+		bio = blk_next_bio(bio, bdev, sector, op, opf, 0, gfp_mask);
 		if (nr_sects > max_write_zeroes_sectors) {
 			bio->bi_iter.bi_size = max_write_zeroes_sectors << 9;
 			nr_sects -= max_write_zeroes_sectors;
@@ -303,6 +299,7 @@ static int __blkdev_issue_zero_pages(struct block_device *bdev,
 		sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
 		struct bio **biop)
 {
+	unsigned int nr_pages = __blkdev_sectors_to_bio_pages(nr_sects);
 	struct request_queue *q = bdev_get_queue(bdev);
 	struct bio *bio = *biop;
 	int bi_size = 0;
@@ -315,11 +312,8 @@ static int __blkdev_issue_zero_pages(struct block_device *bdev,
 		return -EPERM;
 
 	while (nr_sects != 0) {
-		bio = blk_next_bio(bio, __blkdev_sectors_to_bio_pages(nr_sects),
+		bio = blk_next_bio(bio, bdev, sector, REQ_OP_WRITE, 0, nr_pages,
 				   gfp_mask);
-		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
-		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 		while (nr_sects != 0) {
 			sz = min((sector_t) PAGE_SIZE, nr_sects << 9);
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 7a68b6e4300c..68e77628348d 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -231,8 +231,7 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 		return -EINVAL;
 
 	while (sector < end_sector) {
-		bio = blk_next_bio(bio, 0, gfp_mask);
-		bio_set_dev(bio, bdev);
+		bio = blk_next_bio(bio, bdev, 0 , op, REQ_SYNC, 0, gfp_mask);
 
 		/*
 		 * Special case for the zone reset operation that reset all
@@ -244,7 +243,6 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 			break;
 		}
 
-		bio->bi_opf = op | REQ_SYNC;
 		bio->bi_iter.bi_sector = sector;
 		sector += zone_sectors;
 
diff --git a/block/blk.h b/block/blk.h
index 0198335c5838..0a278bae5478 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -329,8 +329,9 @@ extern int blk_iolatency_init(struct request_queue *q);
 static inline int blk_iolatency_init(struct request_queue *q) { return 0; }
 #endif
 
-struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp);
-
+struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
+			sector_t sect, unsigned op, unsigned opf,
+			unsigned int nr_pages, gfp_t gfp);
 #ifdef CONFIG_BLK_DEV_ZONED
 void blk_queue_free_zone_bitmaps(struct request_queue *q);
 #else
-- 
2.22.1


