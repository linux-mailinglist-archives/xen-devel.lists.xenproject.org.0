Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D14FA303
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 06:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301896.515373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd34M-0001CN-Hj; Sat, 09 Apr 2022 04:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301896.515373; Sat, 09 Apr 2022 04:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd34M-00018e-Cb; Sat, 09 Apr 2022 04:51:30 +0000
Received: by outflank-mailman (input) for mailman id 301896;
 Sat, 09 Apr 2022 04:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6m1B=UT=bombadil.srs.infradead.org=BATV+43fc5532e856fea764d1+6803+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nd34K-0006gL-5B
 for xen-devel@lists.xenproject.org; Sat, 09 Apr 2022 04:51:28 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b687bbf3-b7c0-11ec-8fbc-03012f2f19d4;
 Sat, 09 Apr 2022 06:51:27 +0200 (CEST)
Received: from 213-147-167-116.nat.highway.webapn.at ([213.147.167.116]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd348-0020i9-Di; Sat, 09 Apr 2022 04:51:16 +0000
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
X-Inumbo-ID: b687bbf3-b7c0-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Bh+vV8H1PUD+w/3YWj6wMRz8JdOJ8okMcDjW6Mx/Fiw=; b=DWf7imoDvMSXJTtirA5ltk+rtE
	YeH7NxKahOANJaW3JeWmpEL0KWvrQ+sUioHsm0dQaUs7Tks6Ss/UVOXMhmulR7QEBLriQYI1KEMzQ
	aO9ISV0dwvPZErcNPFhlMeFi6wIDVT8NvUOYYMlUOKdrnhvM68xwDYg36srZ722XpvX8aIcmuYcaD
	sB1HtVb3yxckb8p+8Hs6srY4Fa9xc+Rr/tmxJaQIFCFAy3LRp9g0YB5fD3IXoh+PksnNKd9R9552Q
	DFKI2Il5Y+lOkByKWQ2YD6LETuE64wDq4THU/F5OZAcQu9U4H1sQRvyeZgS12iohkvkHfPdltFjhr
	Z+SPB7CA==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com,
	linux-mm@kvack.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [PATCH 09/27] ntfs3: use bdev_logical_block_size instead of open coding it
Date: Sat,  9 Apr 2022 06:50:25 +0200
Message-Id: <20220409045043.23593-10-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409045043.23593-1-hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 278dcf5024102..cd30e81abbce0 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -920,7 +920,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	}
 
 	/* Parse boot. */
-	err = ntfs_init_from_boot(sb, rq ? queue_logical_block_size(rq) : 512,
+	err = ntfs_init_from_boot(sb, bdev_logical_block_size(bdev),
 				  bdev_nr_bytes(bdev));
 	if (err)
 		goto out;
-- 
2.30.2


