Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B544A5021AB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 06:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305213.520102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfDxc-0004Xr-Bs; Fri, 15 Apr 2022 04:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305213.520102; Fri, 15 Apr 2022 04:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfDxc-0004VN-4j; Fri, 15 Apr 2022 04:53:32 +0000
Received: by outflank-mailman (input) for mailman id 305213;
 Fri, 15 Apr 2022 04:53:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5UAI=UZ=bombadil.srs.infradead.org=BATV+2d633663de0085320ac7+6809+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nfDxa-0004TJ-EQ
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 04:53:30 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd14b36f-bc77-11ec-8fbe-03012f2f19d4;
 Fri, 15 Apr 2022 06:53:28 +0200 (CEST)
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDxP-008OnZ-2m; Fri, 15 Apr 2022 04:53:19 +0000
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
X-Inumbo-ID: fd14b36f-bc77-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6JVZQz23Gg3oLV4oYc05UwmOH+nGeMd1Qpin5+I9KgM=; b=p4/UQY65J530pBrFxSnyzz+s1S
	20vQFpTrN15G6NO5F9VDuyGriDpCNyWjbyKgPkMSrLLko0Q4FtJ1eCzi+YOgwapAyJib+3l/z0nqL
	+NYMVQXNHIEHx4U8dz9u48TnCqPcYXyNXVQmQKYJgAexB2zuX97VLPbrU2HmJIKE7g1fg+Kmpeu2X
	7In2j9JZDuGthZuxusAdOOuAjghMTjSwC/AdUlo5SnfFd1vgrm4uEPQ78/HVr7y9+RCydI3REXKPH
	s1r/AwsdOouUPRQPQY3Kuv+Zv/88cYk9RfHpmYADsU3re53XPeDNlC3OFKsZfaMhZuxBpfzjqoDMO
	ifzKUlSQ==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com,
	linux-mm@kvack.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>
Subject: [PATCH 02/27] target: pass a block_device to target_configure_unmap_from_queue
Date: Fri, 15 Apr 2022 06:52:33 +0200
Message-Id: <20220415045258.199825-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The SCSI target drivers is a consumer of the block layer and shoul
d generally work on struct block_device.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 drivers/target/target_core_device.c  | 5 +++--
 drivers/target/target_core_file.c    | 7 ++++---
 drivers/target/target_core_iblock.c  | 2 +-
 include/target/target_core_backend.h | 4 ++--
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
index fa866acef5bb2..3a1ec705cd80b 100644
--- a/drivers/target/target_core_device.c
+++ b/drivers/target/target_core_device.c
@@ -834,9 +834,10 @@ struct se_device *target_alloc_device(struct se_hba *hba, const char *name)
  * in ATA and we need to set TPE=1
  */
 bool target_configure_unmap_from_queue(struct se_dev_attrib *attrib,
-				       struct request_queue *q)
+				       struct block_device *bdev)
 {
-	int block_size = queue_logical_block_size(q);
+	struct request_queue *q = bdev_get_queue(bdev);
+	int block_size = bdev_logical_block_size(bdev);
 
 	if (!blk_queue_discard(q))
 		return false;
diff --git a/drivers/target/target_core_file.c b/drivers/target/target_core_file.c
index 8190b840065f3..8d191fdc33217 100644
--- a/drivers/target/target_core_file.c
+++ b/drivers/target/target_core_file.c
@@ -134,10 +134,11 @@ static int fd_configure_device(struct se_device *dev)
 	 */
 	inode = file->f_mapping->host;
 	if (S_ISBLK(inode->i_mode)) {
-		struct request_queue *q = bdev_get_queue(I_BDEV(inode));
+		struct block_device *bdev = I_BDEV(inode);
+		struct request_queue *q = bdev_get_queue(bdev);
 		unsigned long long dev_size;
 
-		fd_dev->fd_block_size = bdev_logical_block_size(I_BDEV(inode));
+		fd_dev->fd_block_size = bdev_logical_block_size(bdev);
 		/*
 		 * Determine the number of bytes from i_size_read() minus
 		 * one (1) logical sector from underlying struct block_device
@@ -150,7 +151,7 @@ static int fd_configure_device(struct se_device *dev)
 			dev_size, div_u64(dev_size, fd_dev->fd_block_size),
 			fd_dev->fd_block_size);
 
-		if (target_configure_unmap_from_queue(&dev->dev_attrib, q))
+		if (target_configure_unmap_from_queue(&dev->dev_attrib, bdev))
 			pr_debug("IFILE: BLOCK Discard support available,"
 				 " disabled by default\n");
 		/*
diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index 87ede165ddba4..b886ce1770bfd 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -119,7 +119,7 @@ static int iblock_configure_device(struct se_device *dev)
 	dev->dev_attrib.hw_max_sectors = queue_max_hw_sectors(q);
 	dev->dev_attrib.hw_queue_depth = q->nr_requests;
 
-	if (target_configure_unmap_from_queue(&dev->dev_attrib, q))
+	if (target_configure_unmap_from_queue(&dev->dev_attrib, bd))
 		pr_debug("IBLOCK: BLOCK Discard support available,"
 			 " disabled by default\n");
 
diff --git a/include/target/target_core_backend.h b/include/target/target_core_backend.h
index 675f3a1fe6139..773963a1e0b53 100644
--- a/include/target/target_core_backend.h
+++ b/include/target/target_core_backend.h
@@ -14,7 +14,7 @@
 #define TRANSPORT_FLAG_PASSTHROUGH_ALUA		0x2
 #define TRANSPORT_FLAG_PASSTHROUGH_PGR          0x4
 
-struct request_queue;
+struct block_device;
 struct scatterlist;
 
 struct target_backend_ops {
@@ -117,7 +117,7 @@ sense_reason_t passthrough_parse_cdb(struct se_cmd *cmd,
 bool target_sense_desc_format(struct se_device *dev);
 sector_t target_to_linux_sector(struct se_device *dev, sector_t lb);
 bool target_configure_unmap_from_queue(struct se_dev_attrib *attrib,
-				       struct request_queue *q);
+				       struct block_device *bdev);
 
 static inline bool target_dev_configured(struct se_device *se_dev)
 {
-- 
2.30.2


