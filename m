Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE80432E3C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 08:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212667.370667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZV-0001gy-N4; Tue, 19 Oct 2021 06:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212667.370667; Tue, 19 Oct 2021 06:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZV-0001eo-Hq; Tue, 19 Oct 2021 06:26:01 +0000
Received: by outflank-mailman (input) for mailman id 212667;
 Tue, 19 Oct 2021 06:25:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpT6=PH=bombadil.srs.infradead.org=BATV+3b2d0d247c9f97582818+6631+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mciZT-0000gN-Rn
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 06:25:59 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac79a240-fd27-446e-bc98-f129e3eaa0f1;
 Tue, 19 Oct 2021 06:25:50 +0000 (UTC)
Received: from 089144192247.atnat0001.highway.a1.net ([89.144.192.247]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mciZE-000HYS-Kb; Tue, 19 Oct 2021 06:25:45 +0000
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
X-Inumbo-ID: ac79a240-fd27-446e-bc98-f129e3eaa0f1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=S4CUuCzH5lqDJB4MuGXgQVUVRBAgyFaG9eQzfRY3vKs=; b=Y76U8j2/7fMjSInt7+CXGBDOhc
	CZY3kWorzZ2XPyjb2tyz44lq9E/ZVzRaAEAwhRHsFtJoldrC1Bz7ygkgOAP4PjegThAdcN59PVRnx
	EoqzxNHR8HF2r+3LHKmbkqPU3gX98CERX8a9xovUUHNUdCqzg/SaZ8TWDCI9dpEkH99+mUQYHjlvH
	OU4uFyZ0MFPNFVBHys6c+5ihObcQ9kr4ugeCnSkXlolmvravRiugyya4H7qIvrhXaNUnEmvdXsK2i
	FYUBNrrNufIVcV83q4hcD3MKW8wZif2UlfwLDuf96LNy8crV7wf6vsX/d7s75O4gXzmCvHTEGC2MF
	3/pQctLQ==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ntfs3@lists.linux.dev
Subject: [PATCH 3/7] xen-blkback: use sync_blockdev
Date: Tue, 19 Oct 2021 08:25:26 +0200
Message-Id: <20211019062530.2174626-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019062530.2174626-1-hch@lst.de>
References: <20211019062530.2174626-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use sync_blockdev instead of opencoding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/xen-blkback/xenbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index 33eba3df4dd9a..914587aabca0c 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -98,7 +98,7 @@ static void xen_update_blkif_status(struct xen_blkif *blkif)
 		return;
 	}
 
-	err = filemap_write_and_wait(blkif->vbd.bdev->bd_inode->i_mapping);
+	err = sync_blockdev(blkif->vbd.bdev);
 	if (err) {
 		xenbus_dev_error(blkif->be->dev, err, "block flush");
 		return;
-- 
2.30.2


