Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C8E915E6C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 07:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747183.1154514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLz6o-0002sU-70; Tue, 25 Jun 2024 05:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747183.1154514; Tue, 25 Jun 2024 05:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLz6o-0002qc-44; Tue, 25 Jun 2024 05:52:50 +0000
Received: by outflank-mailman (input) for mailman id 747183;
 Tue, 25 Jun 2024 05:52:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o8Ww=N3=bombadil.srs.infradead.org=BATV+ee3bcc3f6418456cddbd+7611+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sLz6k-0002qU-VB
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 05:52:48 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2417b83c-32b7-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 07:52:45 +0200 (CEST)
Received: from [2001:4bb8:2dc:a91f:de7e:f7c0:f265:d96e] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sLz6f-00000001jNR-2t83; Tue, 25 Jun 2024 05:52:42 +0000
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
X-Inumbo-ID: 2417b83c-32b7-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=YTqoi2mljEbOakIcyABD2RlNt0qxMc+ByhNNWPILtBo=; b=qxjfUNGrFRJ3+bkq5zQGMbxXyp
	NShKIzRbzMRz0vpAorvKvJfJjSQJfoJtrm43kX6bIGy2MQyBPJEU8FtCghwFFE3FmruB0OtD3b88k
	tUs2LJ8Ad/65Sq08z3+iGg0G0cR2WGaY3qNf4q3HcyMd1SkbBQmlpTLawnaRNnuR+Rl1J1ufWNQe+
	XezKmH0tg/tUX5pBJyykoXC9AWG7lr3Z2S0xN+kMnjM6zGaAh19lcXl7UiQPwL7+M5WR+hijlW+GT
	vRHwRtBHK+VwoSA+GzA0MNGmfYmYgj3/KoMe1g1JQY4GUE//zEKVqxJJxEu/IIZ06T1SsGkYEJWlk
	kzmtEWWw==;
From: Christoph Hellwig <hch@lst.de>
To: roger.pau@citrix.com
Cc: jgross@suse.com,
	marmarek@invisiblethingslab.com,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	Rusty Bird <rustybird@net-c.com>
Subject: [PATCH] xen-blkfront: fix sector_size propagation to the block layer
Date: Tue, 25 Jun 2024 07:52:38 +0200
Message-ID: <20240625055238.7934-1-hch@lst.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Ensure that info->sector_size and info->physical_sector_size are set
before the call to blkif_set_queue_limits by doing away with the
local variables and arguments that propagate them.

Thanks to Marek Marczykowski-Górecki and Jürgen Groß for root causing
the issue.

Fixes: ba3f67c11638 ("xen-blkfront: atomically update queue limits")
Reported-by: Rusty Bird <rustybird@net-c.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/xen-blkfront.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index fa3a2ba525458b..59ce113b882a0e 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1070,8 +1070,7 @@ static char *encode_disk_name(char *ptr, unsigned int n)
 }
 
 static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
-		struct blkfront_info *info, u16 sector_size,
-		unsigned int physical_sector_size)
+		struct blkfront_info *info)
 {
 	struct queue_limits lim = {};
 	struct gendisk *gd;
@@ -1165,8 +1164,6 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 
 	info->rq = gd->queue;
 	info->gd = gd;
-	info->sector_size = sector_size;
-	info->physical_sector_size = physical_sector_size;
 
 	xlvbd_flush(info);
 
@@ -2320,8 +2317,6 @@ static void blkfront_gather_backend_features(struct blkfront_info *info)
 static void blkfront_connect(struct blkfront_info *info)
 {
 	unsigned long long sectors;
-	unsigned long sector_size;
-	unsigned int physical_sector_size;
 	int err, i;
 	struct blkfront_ring_info *rinfo;
 
@@ -2360,7 +2355,7 @@ static void blkfront_connect(struct blkfront_info *info)
 	err = xenbus_gather(XBT_NIL, info->xbdev->otherend,
 			    "sectors", "%llu", &sectors,
 			    "info", "%u", &info->vdisk_info,
-			    "sector-size", "%lu", &sector_size,
+			    "sector-size", "%lu", &info->sector_size,
 			    NULL);
 	if (err) {
 		xenbus_dev_fatal(info->xbdev, err,
@@ -2374,9 +2369,9 @@ static void blkfront_connect(struct blkfront_info *info)
 	 * provide this. Assume physical sector size to be the same as
 	 * sector_size in that case.
 	 */
-	physical_sector_size = xenbus_read_unsigned(info->xbdev->otherend,
+	info->physical_sector_size = xenbus_read_unsigned(info->xbdev->otherend,
 						    "physical-sector-size",
-						    sector_size);
+						    info->sector_size);
 	blkfront_gather_backend_features(info);
 	for_each_rinfo(info, rinfo, i) {
 		err = blkfront_setup_indirect(rinfo);
@@ -2388,8 +2383,7 @@ static void blkfront_connect(struct blkfront_info *info)
 		}
 	}
 
-	err = xlvbd_alloc_gendisk(sectors, info, sector_size,
-				  physical_sector_size);
+	err = xlvbd_alloc_gendisk(sectors, info);
 	if (err) {
 		xenbus_dev_fatal(info->xbdev, err, "xlvbd_add at %s",
 				 info->xbdev->otherend);
-- 
2.43.0


