Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA1E8D2BFA
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 07:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731378.1136857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVD-0003L3-HJ; Wed, 29 May 2024 05:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731378.1136857; Wed, 29 May 2024 05:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVD-0003Gn-DC; Wed, 29 May 2024 05:05:31 +0000
Received: by outflank-mailman (input) for mailman id 731378;
 Wed, 29 May 2024 05:05:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7nM=NA=bombadil.srs.infradead.org=BATV+c55c297d46ee5715703b+7584+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCBVC-0002IP-IA
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 05:05:30 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10c503f8-1d79-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 07:05:29 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCBV5-00000002pXT-2RwQ; Wed, 29 May 2024 05:05:24 +0000
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
X-Inumbo-ID: 10c503f8-1d79-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=TFSwqKWMmudUxPiHaYQymKxOAPLlhLvIfGoe7lZ0Qm8=; b=rkKRbg5+hgq4FGzAhQuNxXCeww
	mYQ8LVxno936/Ke445SPr6vK77vH49ODPijMtTeGT6y17DO9VfLcNXcbJC5f4YwikvZ/giTD5aSWr
	2/AHxlrhMzrmMO9T4Siy0wWkSgBb4UwcUKe9nErCSp2M0KBoTzzxuF7KCfENr2yMCRDFL5eOvmh5m
	DeI3cPeP2Ved5/finWngzKaglnh7GYz6CIk2ozhCEb5yygEKOZrT2sr+DGXVaF5ohZ5wPEa/h0W27
	kIoeJXcGLgBclxYAHBILjIeu4JHHgDvp6JkiOgDF6dY2FxeqMeWGRaO5M9Fa1XPikTiqcIhm1oz/O
	/sPDQu3w==;
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
Subject: [PATCH 05/12] sd: add a sd_disable_write_same helper
Date: Wed, 29 May 2024 07:04:07 +0200
Message-ID: <20240529050507.1392041-6-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Add helper to disable WRITE SAME when it is not supported and use it
instead of sd_config_write_same in the I/O completion handler.  This
avoids touching more fields than required in the I/O completion handler
and  prepares for converting sd to use the atomic queue limits API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/sd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index a8838381823254..09ffe9d826aeac 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1004,6 +1004,13 @@ static blk_status_t sd_setup_write_zeroes_cmnd(struct scsi_cmnd *cmd)
 	return sd_setup_write_same10_cmnd(cmd, false);
 }
 
+static void sd_disable_write_same(struct scsi_disk *sdkp)
+{
+	sdkp->device->no_write_same = 1;
+	sdkp->max_ws_blocks = 0;
+	blk_queue_max_write_zeroes_sectors(sdkp->disk->queue, 0);
+}
+
 static void sd_config_write_same(struct scsi_disk *sdkp)
 {
 	struct request_queue *q = sdkp->disk->queue;
@@ -2258,8 +2265,7 @@ static int sd_done(struct scsi_cmnd *SCpnt)
 				if (SCpnt->cmnd[1] & 8) { /* UNMAP */
 					sd_disable_discard(sdkp);
 				} else {
-					sdkp->device->no_write_same = 1;
-					sd_config_write_same(sdkp);
+					sd_disable_write_same(sdkp);
 					req->rq_flags |= RQF_QUIET;
 				}
 				break;
-- 
2.43.0


