Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119A490A3BC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 08:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741594.1148210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5V7-0001Sa-UC; Mon, 17 Jun 2024 06:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741594.1148210; Mon, 17 Jun 2024 06:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5V7-0001Pj-Qo; Mon, 17 Jun 2024 06:05:57 +0000
Received: by outflank-mailman (input) for mailman id 741594;
 Mon, 17 Jun 2024 06:05:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvID=NT=bombadil.srs.infradead.org=BATV+625ba2f6da96caf54eae+7603+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sJ5V5-0001PY-Hw
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 06:05:56 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5997ad4-2c6f-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 08:05:51 +0200 (CEST)
Received: from [91.187.204.140] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sJ5Uk-00000009IBH-3zsu; Mon, 17 Jun 2024 06:05:35 +0000
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
X-Inumbo-ID: a5997ad4-2c6f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=w5I58mRKj5AU6Yqi3NMuzFTOUn3zWDih3UgJBo1+OXs=; b=xHDYpaffUakf5PuOWBpPooKbf/
	9TfbzNtEmDZrZ632SAc4SRfUuVJxNjnIE5gNHB7SDcAJ13WXLVDplEzCkwbhxr8th8FA1AGmh61+R
	g24j1QTav3xOiX0eITNyRi5Mz2E8AK3xQKNReoItBJuLvJZGhaoHXPsRavxTQyGXej16tbWpW9fkb
	MiE3u8l6QDmidGewrW4mjUWDPWBwBicf+CUbBFJdBIXJq2Vt/dKLWmd1vyB4Oh0xvZA38NfBT/pij
	A+DvQuobhBHBxhKADMh8M+nXHtE0Qh4gwc7U1XvGwmsXXCd4Sd1vVhVl6cw/4+q61JkWAXyCyIYQD
	kLWvV1DA==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: move features flags into queue_limits v2
Date: Mon, 17 Jun 2024 08:04:27 +0200
Message-ID: <20240617060532.127975-1-hch@lst.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

this is the third and last major series to convert settings to
queue_limits for this merge window.  After a bunch of prep patches to
get various drivers in shape, it moves all the queue_flags that specify
driver controlled features into the queue limits so that they can be
set atomically and are separated from the blk-mq internal flags.

Note that I've only Cc'ed the maintainers for drivers with non-mechanical
changes as the Cc list is already huge.

This series sits on top of the for-6.11/block-limits branch.

A git tree is available here:

    git://git.infradead.org/users/hch/block.git block-limit-flags

Gitweb:

    http://git.infradead.org/?p=users/hch/block.git;a=shortlog;h=refs/heads/block-limit-flags


Changes since v1:
 - fix an inverted condition
 - fix the runtime flush disable in xen-blkfront
 - remove sd_is_zoned entirely
 - use SECTOR_SIZE in a few more places
 - fix REQ_NOWAIT disabling for dm targets that don't support it
 - fix typos
 - reword various commit logs

Diffstat:
 Documentation/block/writeback_cache_control.rst |   67 ++++----
 arch/m68k/emu/nfblock.c                         |    1 
 arch/um/drivers/ubd_kern.c                      |    3 
 arch/xtensa/platforms/iss/simdisk.c             |    5 
 block/blk-core.c                                |    7 
 block/blk-flush.c                               |   36 ++--
 block/blk-mq-debugfs.c                          |   13 -
 block/blk-mq.c                                  |   42 +++--
 block/blk-settings.c                            |   46 ++----
 block/blk-sysfs.c                               |  118 ++++++++-------
 block/blk-wbt.c                                 |    4 
 block/blk.h                                     |    2 
 drivers/block/amiflop.c                         |    5 
 drivers/block/aoe/aoeblk.c                      |    1 
 drivers/block/ataflop.c                         |    5 
 drivers/block/brd.c                             |    6 
 drivers/block/drbd/drbd_main.c                  |    6 
 drivers/block/floppy.c                          |    3 
 drivers/block/loop.c                            |   79 ++++------
 drivers/block/mtip32xx/mtip32xx.c               |    2 
 drivers/block/n64cart.c                         |    2 
 drivers/block/nbd.c                             |   24 +--
 drivers/block/null_blk/main.c                   |   13 -
 drivers/block/null_blk/zoned.c                  |    3 
 drivers/block/pktcdvd.c                         |    1 
 drivers/block/ps3disk.c                         |    8 -
 drivers/block/rbd.c                             |   12 -
 drivers/block/rnbd/rnbd-clt.c                   |   14 -
 drivers/block/sunvdc.c                          |    1 
 drivers/block/swim.c                            |    5 
 drivers/block/swim3.c                           |    5 
 drivers/block/ublk_drv.c                        |   21 +-
 drivers/block/virtio_blk.c                      |   37 ++--
 drivers/block/xen-blkfront.c                    |   53 +++---
 drivers/block/zram/zram_drv.c                   |    6 
 drivers/cdrom/gdrom.c                           |    1 
 drivers/md/bcache/super.c                       |    9 -
 drivers/md/dm-table.c                           |  183 +++++-------------------
 drivers/md/dm-zone.c                            |    2 
 drivers/md/dm-zoned-target.c                    |    2 
 drivers/md/dm.c                                 |   13 -
 drivers/md/md.c                                 |   40 -----
 drivers/md/raid5.c                              |    6 
 drivers/mmc/core/block.c                        |   42 ++---
 drivers/mmc/core/queue.c                        |   20 +-
 drivers/mmc/core/queue.h                        |    3 
 drivers/mtd/mtd_blkdevs.c                       |    9 -
 drivers/nvdimm/btt.c                            |    4 
 drivers/nvdimm/pmem.c                           |   14 -
 drivers/nvme/host/core.c                        |   33 ++--
 drivers/nvme/host/multipath.c                   |   24 ---
 drivers/nvme/host/zns.c                         |    3 
 drivers/s390/block/dasd_genhd.c                 |    1 
 drivers/s390/block/dcssblk.c                    |    2 
 drivers/s390/block/scm_blk.c                    |    5 
 drivers/scsi/iscsi_tcp.c                        |    8 -
 drivers/scsi/scsi_lib.c                         |    5 
 drivers/scsi/sd.c                               |   66 +++-----
 drivers/scsi/sd.h                               |    5 
 drivers/scsi/sd_zbc.c                           |   25 +--
 include/linux/blkdev.h                          |  119 ++++++++++-----
 61 files changed, 572 insertions(+), 728 deletions(-)

