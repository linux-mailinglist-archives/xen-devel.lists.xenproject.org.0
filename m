Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BADF8D5BE5
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 09:49:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733351.1139602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0l-0007Fh-1w; Fri, 31 May 2024 07:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733351.1139602; Fri, 31 May 2024 07:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0k-0007Cl-UF; Fri, 31 May 2024 07:49:14 +0000
Received: by outflank-mailman (input) for mailman id 733351;
 Fri, 31 May 2024 07:49:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rv5j=NC=bombadil.srs.infradead.org=BATV+4872a67a45e6d46d0c49+7586+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCx0j-0004oC-72
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 07:49:13 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4460cb50-1f22-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 09:49:11 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-5ba9-f4da-76fa-44a9.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:5ba9:f4da:76fa:44a9] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCx0a-00000009Xfo-0bb2; Fri, 31 May 2024 07:49:04 +0000
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
X-Inumbo-ID: 4460cb50-1f22-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=HN2Hktsuqrp8T8GVou6AHcXHJfFLm1CDuoHLTArZtbQ=; b=lzSvXRRwzld/pMYWiFEKRDRG2R
	S8H/9KAsLWG+7rCB0xOZNV350iYhUSHRfAKBFICCqHErh6IeHq2cVZLjPLGTNwt0sKNOjOyQMdSDV
	AEJE2W/7wU/JPARqknHB/teDENsrfXzvflDt8grlnj+PbL6uFlGnmyIPKa9bJ37oUrbUpR+ZsEMve
	N/VNYOyU0GCIc2LMMuiQtuHRwpXnbqjHrYK53jvCzl6pWVmFQXJCKXQHsMvt3zWuBGJhUyOSUlMbY
	CkQ2uUkan33bspD1IDNqzU7wQgTUkNAjBNx4O8h/zxKzZMwt7T8O1npKByu3eerVKPrQQXprz/j9N
	t+/ZgFRw==;
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
	linux-scsi@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH 08/14] sd: simplify the disable case in sd_config_discard
Date: Fri, 31 May 2024 09:48:03 +0200
Message-ID: <20240531074837.1648501-9-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Fall through to the main call to blk_queue_max_discard_sectors given that
max_blocks has been initialized to zero above instead of duplicating the
call.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/scsi/sd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 70211d0b187652..0dbc6eb7a7cac3 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -844,8 +844,7 @@ static void sd_config_discard(struct scsi_disk *sdkp, unsigned int mode)
 
 	case SD_LBP_FULL:
 	case SD_LBP_DISABLE:
-		blk_queue_max_discard_sectors(q, 0);
-		return;
+		break;
 
 	case SD_LBP_UNMAP:
 		max_blocks = min_not_zero(sdkp->max_unmap_blocks,
-- 
2.43.0


