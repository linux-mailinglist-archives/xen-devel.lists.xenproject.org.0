Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D905A306E41
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 08:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76588.138254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Tr-0003s8-Oq; Thu, 28 Jan 2021 07:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76588.138254; Thu, 28 Jan 2021 07:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l51Tr-0003rQ-KU; Thu, 28 Jan 2021 07:12:39 +0000
Received: by outflank-mailman (input) for mailman id 76588;
 Thu, 28 Jan 2021 07:12:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YU/W=G7=wdc.com=prvs=655a99766=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1l51Tq-0003qq-5c
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 07:12:38 +0000
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58e0f633-b27f-4e8e-86ad-fd02acf6d291;
 Thu, 28 Jan 2021 07:12:37 +0000 (UTC)
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:12:36 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 22:56:56 -0800
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:12:36 -0800
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
X-Inumbo-ID: 58e0f633-b27f-4e8e-86ad-fd02acf6d291
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611817956; x=1643353956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QAiSNZxQXn+fhhqJHg770cKqGnQ7j5esbXKR/QGBS14=;
  b=RNtHyDvzb2x/JasSn0QZOEbJpP5zeOlEybaSVBsHNyZvxPZ1mQGM8OeE
   /mpvvBXQgzPpFvNGZca4WFxZP0t0Uq9vH+64z1pDkKLeawUgvGYHVBfyo
   7/4l6mOAmK3q+07LZS3UNYFO3NLprJpMcnFDB+U54SwkA28XzApXFkUYZ
   MXwA2yx8ggC+K5heZa/s7tie9hxHhrBy0Ex/X3ueF9OrmOTx6Va9IaT/K
   XBQrAMKSXKuuayq9HAu743O+Pxt6EZGX2RHd1EY+Gcvtf04n0HCcd0MrI
   HT3904xH+7hIRuFfbGvBaeDIO7YED1Sq4cVHeeSW0GKEfHdRoQBMuJEQ2
   w==;
IronPort-SDR: kkfh2b6qDZAWIFYtXf668AHkiwL7PBIDCO8UPwmQDjTuaqYiTqcF9nYaGsfvVS91wjyCRHdVpS
 nX1qTP1HHfffZ1h9GQL5w9W40zsdmB5eG0mvPR1YvlvowbGcV4NtdgtlCUspEjJNIGhFax0l+l
 0zGlqwjenESb2s3K4GP47y6DllMSHTshKwSERecfI1N2oCsYknQcna5jrRdSE2rwglnaibdsWd
 grUc6kkHYSNkd5ctPLZv3H3F7A/Hq6Gsoe6loPQ5dmYO3BA7blvckU8dmaE8Xc6Bb40Y7PGscN
 clY=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="162963171"
IronPort-SDR: FrQsHzGc00ExQMSekcvMaBGoE349MWo/XVecILS7niIoC4AQL01JxBqVXLyWYIETsh9G9vWiyd
 4QyQeir0qu5mjPU5L832JHclxPbVGJ4DjxH+3NAC4tOxSyr2eeGtOGfpaMztiaM/OGhc9jqcvq
 v3a9ZeL+YhwN9DpY6b/5SXk/T39ATO/qwuPhVnvm5gMQ7wjoroiIjHVuRKjTNgdAfwScAVCA7H
 Py0Dsbb+arES1UqY1GzhLm/fE4j788EQfIxkMcM4D4klkEZ5c6eFBHhLB2vq7/hZ2jSN6Omegf
 cKqnTfSheVsEwleuxlJlk1tI
IronPort-SDR: Luc6lg4Pa+bVHOb4HzkXJiWLGqMg6JC6Nyg0Lqb88ZIBDNylXDUPHvAGuri+ui5nWB8hV8jug9
 qFWTXFaOWHAL0oehOyPdERabJ1LaG9aVOt3b6RTgmVCVF9xZaJrmkG+mjzow98LgNG5t1Hjoni
 gqXmojTILo9AyCGo2PpCozas3remWiyjnR1rz1m7Heq2aoYdQ+f2mWDUtJhIIR3UJyQKknW4V+
 XZO06It7hG6XcBrRwkAZf9a8HSkB5bDSC1ddzu75XBYoKVtN9lipurMfP/HgqVuXVuz/kSCAwn
 InQ=
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
Subject: [RFC PATCH 06/34] zram: use bio_new
Date: Wed, 27 Jan 2021 23:11:05 -0800
Message-Id: <20210128071133.60335-7-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/zram/zram_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index d7018543842e..5d744e528d4f 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -587,12 +587,11 @@ static int read_from_bdev_async(struct zram *zram, struct bio_vec *bvec,
 {
 	struct bio *bio;
 
-	bio = bio_alloc(GFP_ATOMIC, 1);
+	bio = bio_alloc(zram->bdev, entry * (PAGE_SIZE >> 9), 0, 0,
+			1, GFP_ATOMIC);
 	if (!bio)
 		return -ENOMEM;
 
-	bio->bi_iter.bi_sector = entry * (PAGE_SIZE >> 9);
-	bio_set_dev(bio, zram->bdev);
 	if (!bio_add_page(bio, bvec->bv_page, bvec->bv_len, bvec->bv_offset)) {
 		bio_put(bio);
 		return -EIO;
-- 
2.22.1


