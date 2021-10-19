Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5C8432E3B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 08:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212663.370633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZG-0000iU-Pu; Tue, 19 Oct 2021 06:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212663.370633; Tue, 19 Oct 2021 06:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mciZG-0000gT-Mc; Tue, 19 Oct 2021 06:25:46 +0000
Received: by outflank-mailman (input) for mailman id 212663;
 Tue, 19 Oct 2021 06:25:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpT6=PH=bombadil.srs.infradead.org=BATV+3b2d0d247c9f97582818+6631+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mciZF-0000gN-08
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 06:25:45 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 053c8ac3-fc21-47b1-b44c-2e0aa810195f;
 Tue, 19 Oct 2021 06:25:42 +0000 (UTC)
Received: from 089144192247.atnat0001.highway.a1.net ([89.144.192.247]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mciZ2-000HX0-PR; Tue, 19 Oct 2021 06:25:33 +0000
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
X-Inumbo-ID: 053c8ac3-fc21-47b1-b44c-2e0aa810195f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=itvvQJMlOd0qMZWya439KMIYfs2Y4pBye3jHCRjN2vI=; b=0WK/Nr+5apW24kzj3x7xKVx7vx
	wHu3IfTt08GM2a8iZHSu/L7P2/ShdB2Ni0GtKL8fKLR3xR1YFpYEVR2yG283mViN4RS4WOtPE1AsY
	fI3Docjlmro2vJpJxZ7PBO2fBZ5/+JsjvnL3ZFE64BOG1RQdmSdpKP4G4/3gKfOHM6U9mh+vK1XJn
	97WTNBQbr2LqiyjavYVqnzoz6kb8iJJN4Lm8x7e+eXjXCuSAZJ5EBUYBr+4JM8DnWbQXqkRZinxII
	UKPWx44EsalOi7/NkkkU5iG9za0HK1FDaM4FdcAifoM+JFBCGcc/EQSWszLyWfS3L4P3982Y+LfCg
	0IFcnfNw==;
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
Subject: cleanup block device inode syncing
Date: Tue, 19 Oct 2021 08:25:23 +0200
Message-Id: <20211019062530.2174626-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi Jens,

this series refactors parts of the sync code so that we have and always
use proper helpers for syncing data cached in the block device inode.

Diffstat:
 block/bdev.c                       |   28 +++++++++++-----
 drivers/block/xen-blkback/xenbus.c |    2 -
 fs/btrfs/volumes.c                 |    2 -
 fs/fat/inode.c                     |    6 +--
 fs/internal.h                      |   11 ------
 fs/ntfs3/inode.c                   |    2 -
 fs/sync.c                          |   62 +++++++++++++------------------------
 include/linux/blkdev.h             |    9 +++++
 8 files changed, 56 insertions(+), 66 deletions(-)

