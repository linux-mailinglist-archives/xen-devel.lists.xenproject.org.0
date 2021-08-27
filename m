Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223CA3FA05E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 22:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173953.317393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDF-0000pq-L5; Fri, 27 Aug 2021 20:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173953.317393; Fri, 27 Aug 2021 20:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDE-0000W6-VB; Fri, 27 Aug 2021 20:12:28 +0000
Received: by outflank-mailman (input) for mailman id 173953;
 Fri, 27 Aug 2021 19:19:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8NxO=NS=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mJhNY-0001H3-BU
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 19:19:04 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47423aed-dd4b-4224-a5b5-04d9bb0ba2d8;
 Fri, 27 Aug 2021 19:18:23 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mJhMh-00D5BC-FT; Fri, 27 Aug 2021 19:18:11 +0000
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
X-Inumbo-ID: 47423aed-dd4b-4224-a5b5-04d9bb0ba2d8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KzwjtOOfTw3O+GVEV4PWsbl44+6kR5dP++6Kf9jn+mM=; b=22AEbFZXnUBijnmWHGiRM2ca1G
	I7DdRw6q+h1AAkzSSsriWrRm6rwQttirydRWTxP+Dc9ypWHGLmyBkFTpVBbwVVN07dFqnD9aBeiW1
	oTj47B/RZJlwgZTa3Mvy0Z2HINQE1ANIR5vX3wgFRLERYG89rawNAiCgeBr3FqDrB/czdQF1B6XIp
	Y+XgiGc3NadMhe8cZIBRxzuCtj3wgELhBZsQklN3du2PKCibgxt1CkHiHjYKl0SXXjZCp3PdmSI0U
	D1Oum0CpCf1bGZ/OZm1TiyGZOKJOMo0Bl8dluQpmwqyy42PlPzUePzImhvPpzLv9ZMVomsm/80u0z
	pidRqVQg==;
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
Subject: [PATCH 09/10] xen-blkfront: add error handling support for add_disk()
Date: Fri, 27 Aug 2021 12:18:08 -0700
Message-Id: <20210827191809.3118103-10-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827191809.3118103-1-mcgrof@kernel.org>
References: <20210827191809.3118103-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

We never checked for errors on device_add_disk() as this function
returned void. Now that this is fixed, use the shiny new error
handling. The function xlvbd_alloc_gendisk() typically does the
unwinding on error on allocating the disk and creating the tag,
but since all that error handling was stuffed inside
xlvbd_alloc_gendisk() we must repeat the tag free'ing as well.

We set the info->rq to NULL to ensure blkif_free() doesn't crash
on blk_mq_stop_hw_queues() on device_add_disk() error as the queue
will be long gone by then.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/xen-blkfront.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 715bfa8aca7f..9fe28af5f6d9 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2343,7 +2343,13 @@ static void blkfront_connect(struct blkfront_info *info)
 	for_each_rinfo(info, rinfo, i)
 		kick_pending_request_queues(rinfo);
 
-	device_add_disk(&info->xbdev->dev, info->gd, NULL);
+	err = device_add_disk(&info->xbdev->dev, info->gd, NULL);
+	if (err) {
+		blk_cleanup_disk(info->gd);
+		blk_mq_free_tag_set(&info->tag_set);
+		info->rq = NULL;
+		goto fail;
+	}
 
 	info->is_ready = 1;
 	return;
-- 
2.30.2


