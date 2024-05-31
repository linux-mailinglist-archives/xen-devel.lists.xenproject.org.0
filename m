Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EBF8D5BDD
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 09:49:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733346.1139572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0a-00064x-VM; Fri, 31 May 2024 07:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733346.1139572; Fri, 31 May 2024 07:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0a-00062M-Qs; Fri, 31 May 2024 07:49:04 +0000
Received: by outflank-mailman (input) for mailman id 733346;
 Fri, 31 May 2024 07:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rv5j=NC=bombadil.srs.infradead.org=BATV+4872a67a45e6d46d0c49+7586+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCx0Z-0004o6-DZ
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 07:49:03 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f190ec8-1f22-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 09:49:03 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-5ba9-f4da-76fa-44a9.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:5ba9:f4da:76fa:44a9] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCx0S-00000009XbL-2AyO; Fri, 31 May 2024 07:48:57 +0000
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
X-Inumbo-ID: 3f190ec8-1f22-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=FAwSfn6ckfnQfuPEUHGpbbgoT8gFgpbbTIk4PRDlm6U=; b=fbXoGRqkGTVOs0QpSZx1za9SJZ
	wqVDSjCy1no2SJW1DLELgUUweO0zbCp7XqisGNgydQGJuEz4rVDUKXUgRM5AmJuAPPjYJlYUvwtkh
	TWFfhZlnAQj3Rw/BSfNpRA6U1AHETgyqHOaeb5qOgQAV5sGO0cu1Qce5CKmhis721gFK7f6ewt+Hl
	mzjO2pXvW3XVfYoA51SiP+wqtSR6lDKtbcJiyvM1VF7YK5J/zJk0XCfyiKO92WAR3AjBFDLtodw43
	uZ6lQl/D07TmW80lgSIq98oUc4YJVGrlTrsAfUYYrzsd9K7Sfua52KNVwv31wAcbpsDwQ18f37u4H
	QmsvUDdw==;
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
Subject: [PATCH 05/14] sd: simplify the ZBC case in provisioning_mode_store
Date: Fri, 31 May 2024 09:48:00 +0200
Message-ID: <20240531074837.1648501-6-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Don't reset the discard settings to no-op over and over when a user
writes to the provisioning attribute as that is already the default
mode for ZBC devices.  In hindsight we should have made writing to
the attribute fail for ZBC devices, but the code has probably been
around for far too long to change this now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/scsi/sd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 3dff9150ce11e2..83aa17fea39d39 100644
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
 
+	/* ignore the provisioning mode for ZBC devices */
+	if (sd_is_zoned(sdkp))
+		return count;
+
 	mode = sysfs_match_string(lbp_mode, buf);
 	if (mode < 0)
 		return -EINVAL;
-- 
2.43.0


