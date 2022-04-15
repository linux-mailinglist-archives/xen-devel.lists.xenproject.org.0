Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723EA5021B2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 06:54:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305214.520119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfDxd-00050f-Lz; Fri, 15 Apr 2022 04:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305214.520119; Fri, 15 Apr 2022 04:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfDxd-0004yk-HT; Fri, 15 Apr 2022 04:53:33 +0000
Received: by outflank-mailman (input) for mailman id 305214;
 Fri, 15 Apr 2022 04:53:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5UAI=UZ=bombadil.srs.infradead.org=BATV+2d633663de0085320ac7+6809+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nfDxc-0004TJ-02
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 04:53:32 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fec9ba66-bc77-11ec-8fbe-03012f2f19d4;
 Fri, 15 Apr 2022 06:53:31 +0200 (CEST)
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDxR-008Ooe-Ik; Fri, 15 Apr 2022 04:53:21 +0000
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
X-Inumbo-ID: fec9ba66-bc77-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=OTIsP1OizukmDhxFkiULvJk6rKtH8rZ66Toc2zFZ06c=; b=ooMRjv2JAUzFUPyfh+XZqWb8QW
	Q9pjLNLNX62Z8C2MtoU6HU3VpVt4OAZRBuYSsD6pXMOi8ZjLOdl54eYy3Tp24LGUVsHa2hBE7Y0RM
	gDKNIKXjx2hbqJA1iCpB6nzk3wFq7ScIOiguPmNGaxWjNFoSpuysiesbbWxhRLyGcBXCzqkMTGuuD
	XDeeqdLlxhy91bRF+ZdOWJypNUbEcjrD8gjGqtH4BhZffx0JY9uZOYdBApIPmQ3bzD93iVI7xEHYb
	JNb40WmRbrFCmN1/+6dAisHF7eHMEiTWRFZXLfqhSoZ7Cj20tDlAxwUfcT/Ob7kj6Vu7zsHN8pcpE
	pX9GukFg==;
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
Subject: [PATCH 03/27] target: fix discard alignment on partitions
Date: Fri, 15 Apr 2022 06:52:34 +0200
Message-Id: <20220415045258.199825-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use the proper bdev_discard_alignment helper that accounts for partition
offsets.

Fixes: c66ac9db8d4a ("[SCSI] target: Add LIO target core v4.0.0-rc6")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 drivers/target/target_core_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
index 3a1ec705cd80b..16e775bcf4a7c 100644
--- a/drivers/target/target_core_device.c
+++ b/drivers/target/target_core_device.c
@@ -849,8 +849,8 @@ bool target_configure_unmap_from_queue(struct se_dev_attrib *attrib,
 	 */
 	attrib->max_unmap_block_desc_count = 1;
 	attrib->unmap_granularity = q->limits.discard_granularity / block_size;
-	attrib->unmap_granularity_alignment = q->limits.discard_alignment /
-								block_size;
+	attrib->unmap_granularity_alignment =
+		bdev_discard_alignment(bdev) / block_size;
 	return true;
 }
 EXPORT_SYMBOL(target_configure_unmap_from_queue);
-- 
2.30.2


