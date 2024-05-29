Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5998D2BF3
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 07:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731379.1136872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVF-0003pp-Ry; Wed, 29 May 2024 05:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731379.1136872; Wed, 29 May 2024 05:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBVF-0003mP-O4; Wed, 29 May 2024 05:05:33 +0000
Received: by outflank-mailman (input) for mailman id 731379;
 Wed, 29 May 2024 05:05:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7nM=NA=bombadil.srs.infradead.org=BATV+c55c297d46ee5715703b+7584+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCBVE-0002IO-8I
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 05:05:32 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 124ad58e-1d79-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 07:05:31 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCBV8-00000002pZH-1Swh; Wed, 29 May 2024 05:05:26 +0000
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
X-Inumbo-ID: 124ad58e-1d79-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=YGmOwuIW0DehI4KXZwtqg3QuYxifQjapgz3/0XZe+RA=; b=KhFS/hxRb8UpO9uvnt4jA68rPG
	xVySn1pHD4jIRemyRbCCEdqXZl0xtjnDLGWGYQO/VqtIGw3kO7PMotHaHvYeF3y7+zrWI6JoWm7Pu
	K36zrJ5O9E7hHC8jFyqb0xPEFI8urWGQgmpxKmKvuJcI1lc4KbirfQgyMqZqdMiNOH0Qn6YwwfkIE
	fgfo+VGAtqPz4gTfBDOjANwyIRtH8WAho9J73pWTOMMk8H6xVuduHp7xwShRKISMLaacYAKT5bsRv
	hrsO1G72IRV/pFLruJ2/ijU+K3F58b+tzy0n/xqUnJBi8VNnAK04O7UkNZ4e+JaGUDKq6/ezYTnGO
	RPYgZo2w==;
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
Subject: [PATCH 06/12] sd: simplify the disable case in sd_config_discard
Date: Wed, 29 May 2024 07:04:08 +0200
Message-ID: <20240529050507.1392041-7-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Fall through to the main call to blk_queue_max_discard_sectors given that
max_blocks has been initialized to zero above instead of duplicating the
call.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/sd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 09ffe9d826aeac..437743e3a0d37d 100644
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


