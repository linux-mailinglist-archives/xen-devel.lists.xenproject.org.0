Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B400D41A1FE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 00:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197198.350178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygE-00015l-8D; Mon, 27 Sep 2021 22:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197198.350178; Mon, 27 Sep 2021 22:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygE-00012a-4u; Mon, 27 Sep 2021 22:00:58 +0000
Received: by outflank-mailman (input) for mailman id 197198;
 Mon, 27 Sep 2021 22:00:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0LRd=OR=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mUygC-0000mS-EJ
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 22:00:56 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92853f46-28ba-4555-aa0d-75f551b4771f;
 Mon, 27 Sep 2021 22:00:49 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyfw-004Sue-Cr; Mon, 27 Sep 2021 22:00:40 +0000
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
X-Inumbo-ID: 92853f46-28ba-4555-aa0d-75f551b4771f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=hYL8LO+ietZVLiEWE2oEBW5mwRVdCiTP81FH5yaWaJI=; b=1BIITuUWUphtncAHlR3onSNJxl
	M6CmnasxwYUC18J5dAsyxcU45RRwAvsUth2gvXvlZCPWdpLhxADiTdWmmJnwp3Uk6w06QS7PX+wFY
	xppaHnOXRVB6MSKkNlcAfcp3c19hINrak2wAZGn+6pA7bP0hbBcVLP+ysEnGBFB8hzMRoaOxh9d8N
	EmHK04hOyMeu/LPfTOWs+mRlcoafAuyFpBBN3nOB+ukUTwMoJKSfcf/9HcGCwOOXot+mH5FL/B6ke
	PyL9SssBEH7fnKGJu6Uq+ETgRscCbWtIhSkBzmnno/dRwxrZeb5mjc5Tr1f/Pm86EFqDvRow06OXL
	BrqrshjA==;
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	kbusch@kernel.org,
	sagi@grimberg.me,
	vishal.l.verma@intel.com,
	dan.j.williams@intel.com,
	dave.jiang@intel.com,
	ira.weiny@intel.com,
	konrad.wilk@oracle.com,
	roger.pau@citrix.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	minchan@kernel.org,
	ngupta@vflare.org,
	senozhatsky@chromium.org
Cc: xen-devel@lists.xenproject.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v2 02/10] bcache: add error handling support for add_disk()
Date: Mon, 27 Sep 2021 15:00:31 -0700
Message-Id: <20210927220039.1064193-3-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220039.1064193-1-mcgrof@kernel.org>
References: <20210927220039.1064193-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

This driver doesn't do any unwinding with blk_cleanup_disk()
even on errors after add_disk() and so we follow that
tradition.

Acked-by: Coly Li <colyli@suse.de>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/md/bcache/super.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index f2874c77ff79..f0c32cdd6594 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -1082,7 +1082,9 @@ int bch_cached_dev_run(struct cached_dev *dc)
 		closure_sync(&cl);
 	}
 
-	add_disk(d->disk);
+	ret = add_disk(d->disk);
+	if (ret)
+		goto out;
 	bd_link_disk_holder(dc->bdev, dc->disk.disk);
 	/*
 	 * won't show up in the uevent file, use udevadm monitor -e instead
@@ -1534,10 +1536,11 @@ static void flash_dev_flush(struct closure *cl)
 
 static int flash_dev_run(struct cache_set *c, struct uuid_entry *u)
 {
+	int err = -ENOMEM;
 	struct bcache_device *d = kzalloc(sizeof(struct bcache_device),
 					  GFP_KERNEL);
 	if (!d)
-		return -ENOMEM;
+		goto err_ret;
 
 	closure_init(&d->cl, NULL);
 	set_closure_fn(&d->cl, flash_dev_flush, system_wq);
@@ -1551,9 +1554,12 @@ static int flash_dev_run(struct cache_set *c, struct uuid_entry *u)
 	bcache_device_attach(d, c, u - c->uuids);
 	bch_sectors_dirty_init(d);
 	bch_flash_dev_request_init(d);
-	add_disk(d->disk);
+	err = add_disk(d->disk);
+	if (err)
+		goto err;
 
-	if (kobject_add(&d->kobj, &disk_to_dev(d->disk)->kobj, "bcache"))
+	err = kobject_add(&d->kobj, &disk_to_dev(d->disk)->kobj, "bcache");
+	if (err)
 		goto err;
 
 	bcache_device_link(d, c, "volume");
@@ -1567,7 +1573,8 @@ static int flash_dev_run(struct cache_set *c, struct uuid_entry *u)
 	return 0;
 err:
 	kobject_put(&d->kobj);
-	return -ENOMEM;
+err_ret:
+	return err;
 }
 
 static int flash_devs_run(struct cache_set *c)
-- 
2.30.2


