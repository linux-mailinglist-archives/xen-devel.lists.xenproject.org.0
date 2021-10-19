Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35F5432E40
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 08:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212671.370688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZf-0002aI-Ja; Tue, 19 Oct 2021 06:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212671.370688; Tue, 19 Oct 2021 06:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZf-0002Wo-F3; Tue, 19 Oct 2021 06:26:11 +0000
Received: by outflank-mailman (input) for mailman id 212671;
 Tue, 19 Oct 2021 06:26:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpT6=PH=bombadil.srs.infradead.org=BATV+3b2d0d247c9f97582818+6631+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mciZd-0000gN-S1
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 06:26:09 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7eb7a040-8117-43a0-b0bc-d78b51fe8bfd;
 Tue, 19 Oct 2021 06:25:57 +0000 (UTC)
Received: from 089144192247.atnat0001.highway.a1.net ([89.144.192.247]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mciZL-000Haq-Cr; Tue, 19 Oct 2021 06:25:52 +0000
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
X-Inumbo-ID: 7eb7a040-8117-43a0-b0bc-d78b51fe8bfd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6G6Emq5ChhmlcaDtzCXji8dJmryMmwXGPmCdOZlKPPY=; b=j4UB2nSod+LlsBHiimZOBDpcAy
	u6tB26X30Q2k2GBEgBacqFxiVQDVPzkRZiYu4lqEfkXIB3yzaQiuGy9S4c0VDN7/AnGFYxJmJk7eA
	/moXk9K3qVOhJ5TVQ8R8dQu/tf697hXRZazlcb0VCPamOZuuxa9DhrhL284ceHMsP1Z3Ko+i221Iq
	m40wQohw06W10smZ91d0PtMkNL5lSN2RvzsOAjlkQ7FNgMfQdw7x1VOvA5v6yJIB6JC8yZsBjuna8
	Cra8m+LDTCQRLNkntWeqLfMSwGVOwGTGNFezv1/lSkmVmL/tiGmekXUOrAS52cWwWAxcLeFw/i7C/
	JzdPpvUw==;
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
Subject: [PATCH 5/7] fat: use sync_blockdev_nowait
Date: Tue, 19 Oct 2021 08:25:28 +0200
Message-Id: <20211019062530.2174626-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019062530.2174626-1-hch@lst.de>
References: <20211019062530.2174626-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use sync_blockdev_nowait instead of opencoding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/fat/inode.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index de0c9b013a851..2fd5bfddb6958 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -1943,10 +1943,8 @@ int fat_flush_inodes(struct super_block *sb, struct inode *i1, struct inode *i2)
 		ret = writeback_inode(i1);
 	if (!ret && i2)
 		ret = writeback_inode(i2);
-	if (!ret) {
-		struct address_space *mapping = sb->s_bdev->bd_inode->i_mapping;
-		ret = filemap_flush(mapping);
-	}
+	if (!ret)
+		ret = sync_blockdev_nowait(sb->s_bdev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(fat_flush_inodes);
-- 
2.30.2


