Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447998D2BF5
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 07:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731377.1136854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVD-0003Gq-Bn; Wed, 29 May 2024 05:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731377.1136854; Wed, 29 May 2024 05:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVD-0003Cu-5L; Wed, 29 May 2024 05:05:31 +0000
Received: by outflank-mailman (input) for mailman id 731377;
 Wed, 29 May 2024 05:05:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7nM=NA=bombadil.srs.infradead.org=BATV+c55c297d46ee5715703b+7584+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCBVA-0002IO-QW
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 05:05:28 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 105a5f3c-1d79-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 07:05:28 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCBV3-00000002pVu-0qka; Wed, 29 May 2024 05:05:21 +0000
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
X-Inumbo-ID: 105a5f3c-1d79-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1JKlKb0rmvW5PqJBHaV8Z8irK92Phe1LJwE6MWVRDfE=; b=hJnNXsXQgRIiijHRvkaC6khCDF
	FhMzB8UJBdujjVljnDILBpYyunHOLvQg97pJOqG8XS5Whld4a0FcSgNMLgv3e8z5FfNuUuyM35mH1
	rA33ugsElhDFF0pZpkQit2lJ4OqMhM5E7KKhT1x78n7aAnbtwYNeMsxWsjmJqay24Qv9y1kPNe/5F
	7ec0yGLmxMbLmdigGhh3bMS9CnfUVyYMLLol/0ucZtenyTuC0ERyCTtGXeffDCkZv/aLYTFu8u/Ul
	ryNj7V2iyodmaJw9byE7qPkk5yipU3slWKM7DX1jCQo+bbwptA6rN1NwEfIFSAbQCLytl/7ejWh+z
	iHKPUiaQ==;
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
Subject: [PATCH 04/12] sd: add a sd_disable_discard helper
Date: Wed, 29 May 2024 07:04:06 +0200
Message-ID: <20240529050507.1392041-5-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Add helper to disable discard when it is not supported and use it
instead of sd_config_discard in the I/O completion handler.  This avoids
touching more fields than required in the I/O completion handler and
prepares for converting sd to use the atomic queue limits API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/sd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 15d0035048d902..a8838381823254 100644
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


