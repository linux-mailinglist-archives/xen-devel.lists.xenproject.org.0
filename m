Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EF7432E41
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 08:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212675.370699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZk-00032q-Sm; Tue, 19 Oct 2021 06:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212675.370699; Tue, 19 Oct 2021 06:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZk-00030X-Ni; Tue, 19 Oct 2021 06:26:16 +0000
Received: by outflank-mailman (input) for mailman id 212675;
 Tue, 19 Oct 2021 06:26:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpT6=PH=bombadil.srs.infradead.org=BATV+3b2d0d247c9f97582818+6631+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mciZi-0000gN-S5
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 06:26:14 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4128587b-9758-48d9-9a72-f8c89ce6b4da;
 Tue, 19 Oct 2021 06:26:02 +0000 (UTC)
Received: from 089144192247.atnat0001.highway.a1.net ([89.144.192.247]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mciZO-000HcH-TJ; Tue, 19 Oct 2021 06:25:55 +0000
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
X-Inumbo-ID: 4128587b-9758-48d9-9a72-f8c89ce6b4da
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=DDi853FEag9qzxEvbV2OqURCgYlh/7S1dK8LyuS7zbQ=; b=omDhi7pjmT2o70QnIOulNXChKy
	4vvsfBwPdds39Wa0alTtHRCJEagmexQT86Y/350PSM/qo+0Wi7CiU5NJrLAw0XEZe6oz3SZWf0UpT
	E2gJwoqVG9RAYdb8CtGvg24knqSyGDKGe1lOkpHVUvEcA4vZIKwJJSVfpwl3AU/ZleBs6ynP9aW4N
	H3iuwKADkUKdZfqLuwPA/HFPWY/VjYvkTzOKA+b6VbKrCDup2CQ1vuFuZ2+YGM+R8ZDeqSa49os8/
	y0gb8ezk2N4vPZImbbUBLufOBzmo4VSYE86ZmJmHn5I/ja6v02SrFfrJNgIPZMj321LJdyljHmgQ/
	ehi1DZyw==;
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
Subject: [PATCH 6/7] ntfs3: use sync_blockdev_nowait
Date: Tue, 19 Oct 2021 08:25:29 +0200
Message-Id: <20211019062530.2174626-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019062530.2174626-1-hch@lst.de>
References: <20211019062530.2174626-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use sync_blockdev_nowait instead of opencoding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ntfs3/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 859951d785cb2..a87ab3ad3cd38 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1046,7 +1046,7 @@ int ntfs_flush_inodes(struct super_block *sb, struct inode *i1,
 	if (!ret && i2)
 		ret = writeback_inode(i2);
 	if (!ret)
-		ret = filemap_flush(sb->s_bdev->bd_inode->i_mapping);
+		ret = sync_blockdev_nowait(sb->s_bdev);
 	return ret;
 }
 
-- 
2.30.2


