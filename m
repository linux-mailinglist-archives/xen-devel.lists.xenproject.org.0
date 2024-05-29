Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BAE8D2BF9
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 07:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731380.1136881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVK-0004CF-3q; Wed, 29 May 2024 05:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731380.1136881; Wed, 29 May 2024 05:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVK-0004AG-0H; Wed, 29 May 2024 05:05:38 +0000
Received: by outflank-mailman (input) for mailman id 731380;
 Wed, 29 May 2024 05:05:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7nM=NA=bombadil.srs.infradead.org=BATV+c55c297d46ee5715703b+7584+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCBVH-0002IO-UF
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 05:05:35 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14852e35-1d79-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 07:05:35 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCBVB-00000002pbP-0kqv; Wed, 29 May 2024 05:05:29 +0000
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
X-Inumbo-ID: 14852e35-1d79-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=zW0EkOuxIkEXAr+kUSNAXR4zW6yla1v+V3lES4DaK0U=; b=JV2Lk341hcuT/7Vl5ccbx6rEF4
	LSvvlB9GQx61zLW6Ek9rMBriZIqorh2yE6n19JvBK8pX9/bCGIKdK8ZSpyJEO6QCmV4FTj9dJx9ct
	2mmqIL366QPU6zYx5zGQSrSTnDBwzdEgAuHzVnaP8EbOoN2JW7yLhrxCvxx4q95t/vZOmQ/fs/cKy
	Hwkml4dg7O0d9si4j5qAHqQU/FbHR3FB0PuKk8zFIIWsEMD/MnhlQRi1PZcYYk0TFsmHCcsFDcNLx
	/+4Z/3TAjBBZlqT2hEMfDtWsLUrRt4XNvmIyqd0q1bw8vLAqtevVrvfYTv+SnaOzLd/GwgYDhosg1
	p2ZtR9BA==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 07/12] sd: factor out a sd_discard_mode helper
Date: Wed, 29 May 2024 07:04:09 +0200
Message-ID: <20240529050507.1392041-8-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Split the logic to pick the right discard mode into a little helper
to prepare for further changes.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/sd.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 437743e3a0d37d..2d08b69154b995 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3201,6 +3201,25 @@ static void sd_read_app_tag_own(struct scsi_disk *sdkp, unsigned char *buffer)
 	return;
 }
 
+static unsigned int sd_discard_mode(struct scsi_disk *sdkp)
+{
+	if (!sdkp->lbpvpd) {
+		/* LBP VPD page not provided */
+		if (sdkp->max_unmap_blocks)
+			return SD_LBP_UNMAP;
+		return SD_LBP_WS16;
+	}
+
+	/* LBP VPD page tells us what to use */
+	if (sdkp->lbpu && sdkp->max_unmap_blocks)
+		return SD_LBP_UNMAP;
+	if (sdkp->lbpws)
+		return SD_LBP_WS16;
+	if (sdkp->lbpws10)
+		return SD_LBP_WS10;
+	return SD_LBP_DISABLE;
+}
+
 /**
  * sd_read_block_limits - Query disk device for preferred I/O sizes.
  * @sdkp: disk to query
@@ -3239,23 +3258,7 @@ static void sd_read_block_limits(struct scsi_disk *sdkp)
 			sdkp->unmap_alignment =
 				get_unaligned_be32(&vpd->data[32]) & ~(1 << 31);
 
-		if (!sdkp->lbpvpd) { /* LBP VPD page not provided */
-
-			if (sdkp->max_unmap_blocks)
-				sd_config_discard(sdkp, SD_LBP_UNMAP);
-			else
-				sd_config_discard(sdkp, SD_LBP_WS16);
-
-		} else {	/* LBP VPD page tells us what to use */
-			if (sdkp->lbpu && sdkp->max_unmap_blocks)
-				sd_config_discard(sdkp, SD_LBP_UNMAP);
-			else if (sdkp->lbpws)
-				sd_config_discard(sdkp, SD_LBP_WS16);
-			else if (sdkp->lbpws10)
-				sd_config_discard(sdkp, SD_LBP_WS10);
-			else
-				sd_config_discard(sdkp, SD_LBP_DISABLE);
-		}
+		sd_config_discard(sdkp, sd_discard_mode(sdkp));
 	}
 
  out:
-- 
2.43.0


