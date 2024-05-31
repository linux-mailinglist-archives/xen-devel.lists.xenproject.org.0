Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003648D5BE0
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 09:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733341.1139522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0V-0004qf-JA; Fri, 31 May 2024 07:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733341.1139522; Fri, 31 May 2024 07:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCx0V-0004oL-GJ; Fri, 31 May 2024 07:48:59 +0000
Received: by outflank-mailman (input) for mailman id 733341;
 Fri, 31 May 2024 07:48:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rv5j=NC=bombadil.srs.infradead.org=BATV+4872a67a45e6d46d0c49+7586+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sCx0T-0004o6-5E
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 07:48:58 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3afb0e0c-1f22-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 09:48:56 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-5ba9-f4da-76fa-44a9.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:5ba9:f4da:76fa:44a9] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sCx0C-00000009XUr-41fW; Fri, 31 May 2024 07:48:43 +0000
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
X-Inumbo-ID: 3afb0e0c-1f22-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=X6ZSIyh1cBG1UFDOkvLStzuDyEP+AFeCGGHYkP7yPXE=; b=wh98NvxtuA1xZGSKFRioyMm51I
	vrfovyzZnajBqXQQrJzm7vrjL319N5CmN22SqQEH5AWCG3vSYC2Ehtl5dcKGB5JTVnjGnZ5BKPqLM
	k/8mUprcZcrR0sLsTDn+NROurZ//Aujt8btpgMENtK0/To9YThW/cFbdJDIRSieOZxuCL8t6W/I55
	BtAv6L1mDU06KnafTVhy4T18Em8h0Ba2Y70K4JL0T5UE87wHrD0U6qXXRuxbTCgayrCNZ2qZ6PffF
	YrCVgO4qoHmBcSzLnvh4ZzHMZzUuHyvAU4HVYk4J4d95GDSA618ThURvQ6uULdXsoDERjoAsBWfP6
	qbtPlb0Q==;
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
Subject: convert the SCSI ULDs to the atomic queue limits API v2
Date: Fri, 31 May 2024 09:47:55 +0200
Message-ID: <20240531074837.1648501-1-hch@lst.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

this series converts the SCSI upper level drivers to the atomic queue
limits API.

The first patch is a bug fix for ubd that later patches depend on and
might be worth picking up for 6.10.

The second patch changes the max_sectors calculation to take the optimal
I/O size into account so that sd, nbd and rbd don't have to mess with
the user max_sector value.  I'd love to see a careful review from the
nbd and rbd maintainers for this one!

The following patches clean up a few lose ends in the sd driver, and
then convert sd and sr to the atomic queue limits API.  The final
patches remove the now unused block APIs, and convert a few to be
specific to their now more narrow use case.

The patches are against Jens' block-6.10 tree.  Due to the amount of
block layer changes in here, and other that will depend on it, it
would be good if this could eventually be merged through the block
tree, or at least a shared branch between the SCSI and block trees.

Changes since v1:
 - change the io_opt value for rbd
 - fix a left-over direct assignent to q->limits
 - add a new patch to refactor the ubd interrupt handler
 - use an else if to micro-optimize the ubd error handling
 - also remove disk_set_max_open_zones and disk_set_max_active_zones
 - use SECTOR_SHIFT in one more place
 - various spelling fixes
 - comment formating fix

Diffstat:
 arch/um/drivers/ubd_kern.c   |   50 +++------
 block/blk-settings.c         |  238 +------------------------------------------
 drivers/block/nbd.c          |    2 
 drivers/block/rbd.c          |    3 
 drivers/block/xen-blkfront.c |    4 
 drivers/scsi/sd.c            |  222 ++++++++++++++++++++--------------------
 drivers/scsi/sd.h            |    6 -
 drivers/scsi/sd_zbc.c        |   27 ++--
 drivers/scsi/sr.c            |   42 ++++---
 include/linux/blkdev.h       |   52 +++------
 10 files changed, 210 insertions(+), 436 deletions(-)

