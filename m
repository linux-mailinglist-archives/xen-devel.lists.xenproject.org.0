Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE7902FFD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 07:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737601.1144021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGtvT-000069-9V; Tue, 11 Jun 2024 05:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737601.1144021; Tue, 11 Jun 2024 05:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGtvT-0008Ul-54; Tue, 11 Jun 2024 05:20:07 +0000
Received: by outflank-mailman (input) for mailman id 737601;
 Tue, 11 Jun 2024 05:20:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7An=NN=bombadil.srs.infradead.org=BATV+2fedbe304aabaf399917+7597+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sGtvS-0006gk-Jw
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 05:20:06 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41f05385-27b2-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 07:20:05 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sGtv6-00000007Qry-3x0S; Tue, 11 Jun 2024 05:19:48 +0000
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
X-Inumbo-ID: 41f05385-27b2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=eTQ/ypSzK4lWAaVunDc3tjHt1iOpV7nN08jg8TeOXAw=; b=sHoQc0fUtpHycjsITV56G6LvHu
	Xm6IZXN1xSVejiDFIWNtspmlJUAy3p7hyoPQDHaK2j8uPpjWRbLpfhR0ew8O9GOJzk9M0kamdKVSK
	h+gO2FlpjqqnZU18qlfXHcI65jms2sw8Gusy9MG0fvAfD2y9LgREXQqEidgiJekt6Ad0BXV8H7wJ7
	laGv8UKsVQsPiuQ/hLbDrBliLkQDBQpg9pL4x4e1mvw/4MdqnWTVfp+cTO0elCEI+YMIJ7UGMAb5i
	o+KErO/5ahImbdE+1ecP+Db6dV/kjpPeVfK/+qvScno/vTvojiYJmwz/wDzBrXkKvWBAHc0v7OlDs
	cGWiEsNA==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: [PATCH 05/26] loop: regularize upgrading the lock size for direct I/O
Date: Tue, 11 Jun 2024 07:19:05 +0200
Message-ID: <20240611051929.513387-6-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The LOOP_CONFIGURE path automatically upgrades the block size to that
of the underlying file for O_DIRECT file descriptors, but the
LOOP_SET_BLOCK_SIZE path does not.  Fix this by lifting the code to
pick the block size into common code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index c658282454af1b..4f6d8514d19bd6 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -975,10 +975,24 @@ loop_set_status_from_info(struct loop_device *lo,
 	return 0;
 }
 
+static unsigned short loop_default_blocksize(struct loop_device *lo,
+		struct block_device *backing_bdev)
+{
+	/* In case of direct I/O, match underlying block size */
+	if ((lo->lo_backing_file->f_flags & O_DIRECT) && backing_bdev)
+		return bdev_logical_block_size(backing_bdev);
+	return 512;
+}
+
 static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
 {
+	struct file *file = lo->lo_backing_file;
+	struct inode *inode = file->f_mapping->host;
 	struct queue_limits lim;
 
+	if (!bsize)
+		bsize = loop_default_blocksize(lo, inode->i_sb->s_bdev);
+
 	lim = queue_limits_start_update(lo->lo_queue);
 	lim.logical_block_size = bsize;
 	lim.physical_block_size = bsize;
@@ -997,7 +1011,6 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	int error;
 	loff_t size;
 	bool partscan;
-	unsigned short bsize;
 	bool is_loop;
 
 	if (!file)
@@ -1076,15 +1089,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	if (!(lo->lo_flags & LO_FLAGS_READ_ONLY) && file->f_op->fsync)
 		blk_queue_write_cache(lo->lo_queue, true, false);
 
-	if (config->block_size)
-		bsize = config->block_size;
-	else if ((lo->lo_backing_file->f_flags & O_DIRECT) && inode->i_sb->s_bdev)
-		/* In case of direct I/O, match underlying block size */
-		bsize = bdev_logical_block_size(inode->i_sb->s_bdev);
-	else
-		bsize = 512;
-
-	error = loop_reconfigure_limits(lo, bsize);
+	error = loop_reconfigure_limits(lo, config->block_size);
 	if (WARN_ON_ONCE(error))
 		goto out_unlock;
 
-- 
2.43.0


