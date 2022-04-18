Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAFA504C18
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 07:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306935.522171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJWw-00018u-Fa; Mon, 18 Apr 2022 05:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306935.522171; Mon, 18 Apr 2022 05:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJWw-00016R-CR; Mon, 18 Apr 2022 05:02:30 +0000
Received: by outflank-mailman (input) for mailman id 306935;
 Mon, 18 Apr 2022 05:02:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7HF=U4=bombadil.srs.infradead.org=BATV+786b5b18f0b4466cc734+6812+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1ngJP0-0001do-Qb
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 04:54:18 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 941fd8d7-bed3-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 06:54:08 +0200 (CEST)
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngJOW-00FYuM-S5; Mon, 18 Apr 2022 04:53:49 +0000
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
X-Inumbo-ID: 941fd8d7-bed3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=FtH/TzYq8qAlMP8iMYBlGWDgAyvZ+dC0QKeXw0CO9iY=; b=BUsTo3zH0HXFlc2PINU8GKGh7x
	xOheprcMV4SR/Bv+uFwxwEEXQNbDYNV0dXmpOloJvszTTFIFrVWaZxvzBY3RFcl0N0jCpn4vw3nb4
	mTGNcSlargn2+/9oPzLzWJrWP+vix6g0SW/61Ow0uZFQlb8WOgevrVuktiq9QO8aHLzYorKaOwQBQ
	CfxG3eR2YUokj3T01RV5d+uhBYCjSMPbPfvUkXoiOxJvCqf7RvI027xldIPQkqonm5kkPHmkKj1CY
	TNHlrnSp6mhzujyAzSdQ8dHMYyS7hxSExdUVN15TaHiISjHO2rUQKK97SneL+jfBatao0hyUgCdvx
	1/5nIEmg==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Song Liu <song@kernel.org>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	dm-devel@redhat.com
Subject: [PATCH 11/11] xen-blkback: use bdev_discard_alignment
Date: Mon, 18 Apr 2022 06:53:14 +0200
Message-Id: <20220418045314.360785-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220418045314.360785-1-hch@lst.de>
References: <20220418045314.360785-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use bdev_discard_alignment to calculate the correct discard alignment
offset even for partitions instead of just looking at the queue limit.

Also switch to use bdev_discard_granularity to get rid of the last direct
queue reference in xen_blkbk_discard.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/xen-blkback/xenbus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index b21bffc9c50bc..04c90cb8955f6 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -583,14 +583,14 @@ static void xen_blkbk_discard(struct xenbus_transaction xbt, struct backend_info
 	if (bdev_max_discard_sectors(bdev)) {
 		err = xenbus_printf(xbt, dev->nodename,
 			"discard-granularity", "%u",
-			q->limits.discard_granularity);
+			bdev_discard_granularity(bdev));
 		if (err) {
 			dev_warn(&dev->dev, "writing discard-granularity (%d)", err);
 			return;
 		}
 		err = xenbus_printf(xbt, dev->nodename,
 			"discard-alignment", "%u",
-			q->limits.discard_alignment);
+			bdev_discard_alignment(bdev));
 		if (err) {
 			dev_warn(&dev->dev, "writing discard-alignment (%d)", err);
 			return;
-- 
2.30.2


