Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4521E41A1FA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 00:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197209.350255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygm-00049z-J5; Mon, 27 Sep 2021 22:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197209.350255; Mon, 27 Sep 2021 22:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygm-00047X-Dm; Mon, 27 Sep 2021 22:01:32 +0000
Received: by outflank-mailman (input) for mailman id 197209;
 Mon, 27 Sep 2021 22:01:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0LRd=OR=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mUygl-0000mS-F7
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 22:01:31 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cf0e5b8-187c-4d9c-80b9-ddd084603ee4;
 Mon, 27 Sep 2021 22:00:50 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyfw-004SvY-Q6; Mon, 27 Sep 2021 22:00:40 +0000
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
X-Inumbo-ID: 6cf0e5b8-187c-4d9c-80b9-ddd084603ee4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Zp3peWChzsLwJZgR1i8Dtyh3FOO544lFeJzlWbkfyco=; b=xyicbK2H0CR7mxWgNNAbZZVOoG
	f/TY+aOtnMS/uoVtMXqtPXis+vbZhtpiS/ndUP0AdX9IDRGIobYET1+iWMgf0eic3hI0JSLbAulKG
	8wvXxEzmhDvXeOmmj8TPh+HGQ0Q2wvHySLXwxFAgsiQ0IWl+sk40LXHXcOXOHWUbo3breLF9OOmtC
	aU5QvqBV5mC+pgxhFyfAWSzB39tzj8teDlNoEJNNKk8zoulQfqxsIBVBuYTJraMMbw8Z6hDN9ZQpa
	LM244ocJ/fpPGEyLZkxh+GCiIuoIMgqFitcviGyRgvFztoaDWVexx1nlLNy/oEUY4relGyOFoN2oa
	SP4Bj1fA==;
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
Subject: [PATCH v2 10/10] zram: add error handling support for add_disk()
Date: Mon, 27 Sep 2021 15:00:39 -0700
Message-Id: <20210927220039.1064193-11-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220039.1064193-1-mcgrof@kernel.org>
References: <20210927220039.1064193-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/zram/zram_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index f61910c65f0f..59086e178fbd 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1953,7 +1953,9 @@ static int zram_add(void)
 		blk_queue_max_write_zeroes_sectors(zram->disk->queue, UINT_MAX);
 
 	blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, zram->disk->queue);
-	device_add_disk(NULL, zram->disk, zram_disk_attr_groups);
+	ret = device_add_disk(NULL, zram->disk, zram_disk_attr_groups);
+	if (ret)
+		goto out_cleanup_disk;
 
 	strlcpy(zram->compressor, default_compressor, sizeof(zram->compressor));
 
@@ -1961,6 +1963,8 @@ static int zram_add(void)
 	pr_info("Added device: %s\n", zram->disk->disk_name);
 	return device_id;
 
+out_cleanup_disk:
+	blk_cleanup_disk(zram->disk);
 out_free_idr:
 	idr_remove(&zram_index_idr, device_id);
 out_free_dev:
-- 
2.30.2


