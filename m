Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC401432E3E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 08:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212669.370677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZb-00027e-0e; Tue, 19 Oct 2021 06:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212669.370677; Tue, 19 Oct 2021 06:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZa-00024f-Sb; Tue, 19 Oct 2021 06:26:06 +0000
Received: by outflank-mailman (input) for mailman id 212669;
 Tue, 19 Oct 2021 06:26:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpT6=PH=bombadil.srs.infradead.org=BATV+3b2d0d247c9f97582818+6631+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mciZY-0000gN-S1
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 06:26:04 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f6ee1bd-8896-4c5b-878e-7fbc0af569d4;
 Tue, 19 Oct 2021 06:25:54 +0000 (UTC)
Received: from 089144192247.atnat0001.highway.a1.net ([89.144.192.247]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mciZI-000HaB-1X; Tue, 19 Oct 2021 06:25:48 +0000
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
X-Inumbo-ID: 6f6ee1bd-8896-4c5b-878e-7fbc0af569d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=2oPjr/CmcgLY9x84ULlH3Ff6Xbo0qFK9LD8/6togFZA=; b=NmleJeKN1g8pEYKNinAzcH1jFW
	YVzZPzhzgKyPmp7TB1Ltmv00TeeI/hto2YW37T69//rbf+Nm4+mj9nydcHUW9DrmtRpdHx8Fi/Fzo
	1NKGKe7HuNLCG/KCOJfbOkFEsBcUQW7is1N0PUDRsGRU4DXtFlkDsK/l979/BPtac6T+tGfM9xbD3
	lpv4i1Yp/wTNXV/aC+5TgkvwywJ9iElv2wuSnP/vGd3+TpVcWT4Tscb7sXljwDFbVg3Y0SAJMMs+6
	BzKCsHP8M2Yf6xLFlnmib88C7gbfz+Y0BlNlE5lfDEjfMICHGNJNMYzubZ7YdN9HwDct/4CCIEPFd
	ma7YqgQg==;
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
Subject: [PATCH 4/7] btrfs: use sync_blockdev
Date: Tue, 19 Oct 2021 08:25:27 +0200
Message-Id: <20211019062530.2174626-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019062530.2174626-1-hch@lst.de>
References: <20211019062530.2174626-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use sync_blockdev instead of opencoding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/volumes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 2ec3b8ac8fa35..b51e4b464103e 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -508,7 +508,7 @@ btrfs_get_bdev_and_sb(const char *device_path, fmode_t flags, void *holder,
 	}
 
 	if (flush)
-		filemap_write_and_wait((*bdev)->bd_inode->i_mapping);
+		sync_blockdev(*bdev);
 	ret = set_blocksize(*bdev, BTRFS_BDEV_BLOCKSIZE);
 	if (ret) {
 		blkdev_put(*bdev, flags);
-- 
2.30.2


