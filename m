Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B59E42FEE8
	for <lists+xen-devel@lfdr.de>; Sat, 16 Oct 2021 01:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211141.368320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbWfl-0003kj-7Y; Fri, 15 Oct 2021 23:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211141.368320; Fri, 15 Oct 2021 23:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbWfl-0003hw-1x; Fri, 15 Oct 2021 23:31:33 +0000
Received: by outflank-mailman (input) for mailman id 211141;
 Fri, 15 Oct 2021 23:31:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZYBM=PD=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mbWfk-0000i4-4S
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 23:31:32 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26397316-d3ca-4d18-9a4b-cf635678a856;
 Fri, 15 Oct 2021 23:30:57 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mbWej-0095v7-E9; Fri, 15 Oct 2021 23:30:29 +0000
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
X-Inumbo-ID: 26397316-d3ca-4d18-9a4b-cf635678a856
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=rG9IqTjAKDoxlaB9WcX4+FIDpVpRocTi/WMidAyqb5E=; b=zZoTqdfJ9Fxpi6GVhbzlxeBy5Z
	TSHUOtdRa3bmpLqWSLW0djXO8cm89eWDPeRyuLhvJmh9r4yCfAdeswev1Akm1dngsVKrFxxVL/vwK
	/o0NcsEQRPnpKqBDS1R1QPBK6jlB+L2FrQUNxMjpJa0MZyI7LNFOdAQQxAqGzBZuu+NpaCLnK3MOq
	nsEWwUrmMKWD9Ul/gId96Lp5lFjisiK/c0hgYHvTulpiaTXtvHI9nZC5vP4MLTaqoMmCcfqzH0mzI
	6UZRd/twOEufTonfDKYrunADAuSDWqwpR01BKU3v0w7aRz+6+suErEvLj7p0zymwJC/+eLN8Tnv2x
	9guF9rCQ==;
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	agk@redhat.com,
	snitzer@redhat.com,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	roger.pau@citrix.com,
	geert@linux-m68k.org,
	ulf.hansson@linaro.org,
	tj@kernel.org,
	hare@suse.de,
	jdike@addtoit.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes.berg@intel.com,
	krisman@collabora.com,
	chris.obbard@collabora.com,
	thehajime@gmail.com,
	zhuyifei1999@gmail.com,
	haris.iqbal@ionos.com,
	jinpu.wang@ionos.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org
Cc: linux-scsi@vger.kernel.org,
	dm-devel@redhat.com,
	linux-bcache@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 8/9] rnbd: add error handling support for add_disk()
Date: Fri, 15 Oct 2021 16:30:27 -0700
Message-Id: <20211015233028.2167651-9-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015233028.2167651-1-mcgrof@kernel.org>
References: <20211015233028.2167651-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Acked-by: Jack Wang <jinpu.wang@ionos.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/rnbd/rnbd-clt.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index 5864c9b46cb9..3b78dc55a9a2 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -1384,8 +1384,10 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
 	blk_queue_write_cache(dev->queue, dev->wc, dev->fua);
 }
 
-static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
+static int rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
 {
+	int err;
+
 	dev->gd->major		= rnbd_client_major;
 	dev->gd->first_minor	= idx << RNBD_PART_BITS;
 	dev->gd->minors		= 1 << RNBD_PART_BITS;
@@ -1410,7 +1412,11 @@ static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
 
 	if (!dev->rotational)
 		blk_queue_flag_set(QUEUE_FLAG_NONROT, dev->queue);
-	add_disk(dev->gd);
+	err = add_disk(dev->gd);
+	if (err)
+		blk_cleanup_disk(dev->gd);
+
+	return err;
 }
 
 static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
@@ -1426,8 +1432,7 @@ static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
 	rnbd_init_mq_hw_queues(dev);
 
 	setup_request_queue(dev);
-	rnbd_clt_setup_gen_disk(dev, idx);
-	return 0;
+	return rnbd_clt_setup_gen_disk(dev, idx);
 }
 
 static struct rnbd_clt_dev *init_dev(struct rnbd_clt_session *sess,
-- 
2.30.2


