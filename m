Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B1F504BD9
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 06:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306875.522072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJOX-00029g-Ku; Mon, 18 Apr 2022 04:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306875.522072; Mon, 18 Apr 2022 04:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJOX-0001y1-CP; Mon, 18 Apr 2022 04:53:49 +0000
Received: by outflank-mailman (input) for mailman id 306875;
 Mon, 18 Apr 2022 04:53:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7HF=U4=bombadil.srs.infradead.org=BATV+786b5b18f0b4466cc734+6812+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1ngJOV-0001c8-Dj
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 04:53:47 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84c8facb-bed3-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 06:53:43 +0200 (CEST)
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngJO0-00FYhR-Fv; Mon, 18 Apr 2022 04:53:17 +0000
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
X-Inumbo-ID: 84c8facb-bed3-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=tyZKBZElFW6HvHSlv9xeAjIG3dO7xKdX7mIPZUu3++o=; b=Fc1PLXWY+U61UCduGVVmNa4xRX
	W2DkcCfgMrkwb1FtowTBpkb1LuVkZ8TInpQDBRu63s01XGNymYAVBze9K7cuggrvtLVCsRIQvDof7
	ljUfhulALzTsFS4w+l71wYoV1q2Lm4YK8vgQZhkj/Np9aC0Yu9S1JLLXx3eykhjg6NsyORI3PutJm
	sTMvqTpRRhFFdcZ7EV5IvV6e5FER4KWu6+dJ4duc2TYsclYeI94eZYYw/+h90AObggztOx4giuutC
	Qw7muGk8qWXO7hVhEGAmI1WIrhzpj4Cevvqzf0Uppevy9o3pTO/Ek4OGE2kkDtP//trS4bSL7nhaU
	+mBAe6Vg==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Song Liu <song@kernel.org>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	dm-devel@redhat.com
Subject: fix and cleanup discard_alignment handling
Date: Mon, 18 Apr 2022 06:53:03 +0200
Message-Id: <20220418045314.360785-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

the somewhat confusing name of the discard_alignment queue limit, that
really is an offset for the discard granularity mislead a lot of driver
authors to set it to an incorrect value.  This series tries to fix up
all these cases.

Diffstat:
 arch/um/drivers/ubd_kern.c         |    1 -
 drivers/block/loop.c               |    1 -
 drivers/block/nbd.c                |    3 ---
 drivers/block/null_blk/main.c      |    1 -
 drivers/block/rnbd/rnbd-srv-dev.h  |    2 +-
 drivers/block/virtio_blk.c         |    7 ++++---
 drivers/block/xen-blkback/xenbus.c |    4 ++--
 drivers/md/dm-zoned-target.c       |    2 +-
 drivers/md/raid5.c                 |    1 -
 drivers/nvme/host/core.c           |    1 -
 drivers/s390/block/dasd_fba.c      |    1 -
 11 files changed, 8 insertions(+), 16 deletions(-)

