Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081CD42FEE7
	for <lists+xen-devel@lfdr.de>; Sat, 16 Oct 2021 01:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211137.368309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbWfg-0003Ek-Qc; Fri, 15 Oct 2021 23:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211137.368309; Fri, 15 Oct 2021 23:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbWfg-0003Bl-Lh; Fri, 15 Oct 2021 23:31:28 +0000
Received: by outflank-mailman (input) for mailman id 211137;
 Fri, 15 Oct 2021 23:31:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZYBM=PD=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mbWff-0000i4-4H
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 23:31:27 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27a045e9-e729-4dfc-ac2f-7a5ade56d66b;
 Fri, 15 Oct 2021 23:30:57 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mbWej-0095v9-FL; Fri, 15 Oct 2021 23:30:29 +0000
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
X-Inumbo-ID: 27a045e9-e729-4dfc-ac2f-7a5ade56d66b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1bxbk0s3lfDVOxUu9YL+DFpJGCsQmsW80G59PebYRqE=; b=aalz1ZDhgOT13yhanR/NqZ5sjs
	X5pioDiqsq7wCK2104+ErSt/d87llJaWu6pQoxxECmaoO81hQebB3KNTX5PwVwh0Wlle8KkYwZZBB
	EY4W4L6CCmX4otbH/vrigBKCha0gJhBOPJveGJURS1xTFt80WQfF7LB3v5CMYxLrjOS8eZd3kniVy
	HyXUMIAEzA7S5SKbG2+6Yqkl2uLf/5+8Zq1fNAP9Axdv7DJBliakso6t7DsDPgMdI8rCvMziP5o8M
	CGo1BDA88hi8eOF897sCgWMsxi2JB/fnJEqvFbB4ooRNqP1S/IXuebirvfHfM/xaTn3IphBxajPsD
	XdhftxIw==;
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
Subject: [PATCH 9/9] mtd: add add_disk() error handling
Date: Fri, 15 Oct 2021 16:30:28 -0700
Message-Id: <20211015233028.2167651-10-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015233028.2167651-1-mcgrof@kernel.org>
References: <20211015233028.2167651-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/mtd/mtd_blkdevs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index b8ae1ec14e17..4eaba6f4ec68 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -384,7 +384,9 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	if (new->readonly)
 		set_disk_ro(gd, 1);
 
-	device_add_disk(&new->mtd->dev, gd, NULL);
+	ret = device_add_disk(&new->mtd->dev, gd, NULL);
+	if (ret)
+		goto out_cleanup_disk;
 
 	if (new->disk_attributes) {
 		ret = sysfs_create_group(&disk_to_dev(gd)->kobj,
@@ -393,6 +395,8 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	}
 	return 0;
 
+out_cleanup_disk:
+	blk_cleanup_disk(new->disk);
 out_free_tag_set:
 	blk_mq_free_tag_set(new->tag_set);
 out_kfree_tag_set:
-- 
2.30.2


