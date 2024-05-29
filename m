Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FD48D2BF8
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 07:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731376.1136833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVC-0002je-1h; Wed, 29 May 2024 05:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731376.1136833; Wed, 29 May 2024 05:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVB-0002cQ-SC; Wed, 29 May 2024 05:05:29 +0000
Received: by outflank-mailman (input) for mailman id 731376;
 Wed, 29 May 2024 05:05:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7nM=NA=bombadil.srs.infradead.org=BATV+c55c297d46ee5715703b+7584+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCBV9-0002IO-N5
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 05:05:27 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f7b9e1b-1d79-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 07:05:27 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCBV0-00000002pUR-1qVO; Wed, 29 May 2024 05:05:18 +0000
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
X-Inumbo-ID: 0f7b9e1b-1d79-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=82BW6iQIk3FEFa4vhGtCkVzTHLP2megWywmDpB65ENg=; b=hT/SqbUWW+toXI5dMcqp4EA6Ee
	2PfJQLcR6iUvvvln1Iq2dGvlxDcvOm3MLw+bOGmfLSogQIOvsjUL5vqFC3t73TNL6yM38fzzTaHrF
	n3z3Uvx+PGLTAB560kOxs7K1nVBdUv6SHEDRKzIXrl7rcheULwalz5Awc07DH0HXLqz81X274x5m9
	4XGVCGLrrm21fNbYM3Tc6cbQkSazy+xeHzyQl85scPGKr1yLk0nmDJ6mvHN/CJr/bsmdhPJwzPQcW
	Cp1nnfhjKm1SYDktgoBXFVQycuzK0RJ/33dd5Y/upj+g1VIUurP/Ax3IWFmNEyPIcqKcAmzwwhJtu
	1DkDX8nA==;
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
Subject: [PATCH 03/12] sd: simplify the ZBC case in provisioning_mode_store
Date: Wed, 29 May 2024 07:04:05 +0200
Message-ID: <20240529050507.1392041-4-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Don't reset the discard settings to no-op over and over when a user
writes to the provisioning attribute as that is already the default
mode for ZBC devices.  In hindsight we should have made writing to
the attribute fail for ZBC devices, but the code has probably been
around for far too long to change this now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/sd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 3dff9150ce11e2..15d0035048d902 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -461,14 +461,13 @@ provisioning_mode_store(struct device *dev, struct device_attribute *attr,
 	if (!capable(CAP_SYS_ADMIN))
 		return -EACCES;
 
-	if (sd_is_zoned(sdkp)) {
-		sd_config_discard(sdkp, SD_LBP_DISABLE);
-		return count;
-	}
-
 	if (sdp->type != TYPE_DISK)
 		return -EINVAL;
 
+	/* ignore the proivisioning mode for ZBB devices */
+	if (sd_is_zoned(sdkp))
+		return count;
+
 	mode = sysfs_match_string(lbp_mode, buf);
 	if (mode < 0)
 		return -EINVAL;
-- 
2.43.0


