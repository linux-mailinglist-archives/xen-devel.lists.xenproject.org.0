Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7078D5BE1
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 09:49:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733347.1139583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0f-0006Sc-7l; Fri, 31 May 2024 07:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733347.1139583; Fri, 31 May 2024 07:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0f-0006On-3d; Fri, 31 May 2024 07:49:09 +0000
Received: by outflank-mailman (input) for mailman id 733347;
 Fri, 31 May 2024 07:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rv5j=NC=bombadil.srs.infradead.org=BATV+4872a67a45e6d46d0c49+7586+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCx0d-0004oC-Jg
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 07:49:07 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41033a96-1f22-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 09:49:06 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-5ba9-f4da-76fa-44a9.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:5ba9:f4da:76fa:44a9] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCx0V-00000009Xcv-0vGx; Fri, 31 May 2024 07:48:59 +0000
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
X-Inumbo-ID: 41033a96-1f22-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=G254IYRsUd/F6t4PlJahixfTtyWkS+KjkuNozPFW2uM=; b=mCfAB2Q3IG7ARRB/1pICP3EKhx
	BtsvlSjEu+mUGJHdLHTvoJOmfRKjXxZbNxLy4KOfOIoTiP37YS600VEXpgV/uP9orX00qlWer8q/4
	MqGvCypDXaIwvVXmRrJ1K8o1tyNVFri/wRN+r8xhPtEgtnttXcI2/uR1po1i3iqcBuzQdmttvNtJF
	oChxsdFiMIHdgU8Fvaju7qPUGHzeaRTfRR1LK2zbdzzOelGNuR2nbzEhvJ15Xap/+vOuczm4IhNaA
	4KPN2ftKI7ksG9v6J9jDdoyHPHRrn7UXV85lXH0GCoodOce35RcaAaP3IEmY28xn6qGm+n9XQh5zR
	gLnZ0o+w==;
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
Subject: [PATCH 06/14] sd: add a sd_disable_discard helper
Date: Fri, 31 May 2024 09:48:01 +0200
Message-ID: <20240531074837.1648501-7-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Add helper to disable discard when it is not supported and use it
instead of sd_config_discard in the I/O completion handler.  This avoids
touching more fields than required in the I/O completion handler and
prepares for converting sd to use the atomic queue limits API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/scsi/sd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 83aa17fea39d39..f07d90474e682b 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -821,6 +821,12 @@ static unsigned char sd_setup_protect_cmnd(struct scsi_cmnd *scmd,
 	return protect;
 }
 
+static void sd_disable_discard(struct scsi_disk *sdkp)
+{
+	sdkp->provisioning_mode = SD_LBP_DISABLE;
+	blk_queue_max_discard_sectors(sdkp->disk->queue, 0);
+}
+
 static void sd_config_discard(struct scsi_disk *sdkp, unsigned int mode)
 {
 	struct request_queue *q = sdkp->disk->queue;
@@ -2245,12 +2251,12 @@ static int sd_done(struct scsi_cmnd *SCpnt)
 		case 0x24:	/* INVALID FIELD IN CDB */
 			switch (SCpnt->cmnd[0]) {
 			case UNMAP:
-				sd_config_discard(sdkp, SD_LBP_DISABLE);
+				sd_disable_discard(sdkp);
 				break;
 			case WRITE_SAME_16:
 			case WRITE_SAME:
 				if (SCpnt->cmnd[1] & 8) { /* UNMAP */
-					sd_config_discard(sdkp, SD_LBP_DISABLE);
+					sd_disable_discard(sdkp);
 				} else {
 					sdkp->device->no_write_same = 1;
 					sd_config_write_same(sdkp);
-- 
2.43.0


