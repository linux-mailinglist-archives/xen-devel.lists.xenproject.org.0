Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E39805473
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 13:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647742.1011322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAUhI-00038I-UW; Tue, 05 Dec 2023 12:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647742.1011322; Tue, 05 Dec 2023 12:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAUhI-00035W-Qk; Tue, 05 Dec 2023 12:38:44 +0000
Received: by outflank-mailman (input) for mailman id 647742;
 Tue, 05 Dec 2023 12:38:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JQhx=HQ=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1rAUhH-00035L-6Y
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 12:38:43 +0000
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3520b307-936b-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 13:38:39 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Sl0Sl5mkSz4f3jYk
 for <xen-devel@lists.xenproject.org>; Tue,  5 Dec 2023 20:38:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id D2FD81A0808
 for <xen-devel@lists.xenproject.org>; Tue,  5 Dec 2023 20:38:32 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP1 (Coremail) with SMTP id cCh0CgDnNw7GGW9lr8E8Cw--.35507S4;
 Tue, 05 Dec 2023 20:38:32 +0800 (CST)
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
X-Inumbo-ID: 3520b307-936b-11ee-9b0f-b553b5be7939
From: Yu Kuai <yukuai1@huaweicloud.com>
To: axboe@kernel.dk,
	roger.pau@citrix.com,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	joern@lazybastard.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	sth@linux.ibm.com,
	hoeppner@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	nico@fluxnic.net,
	xiang@kernel.org,
	chao@kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
	agruenba@redhat.com,
	jack@suse.com,
	konishi.ryusuke@gmail.com,
	willy@infradead.org,
	akpm@linux-foundation.org,
	hare@suse.de,
	p.raghav@samsung.com
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH -next RFC 00/14] block: don't access bd_inode directly from other modules
Date: Tue,  5 Dec 2023 20:37:14 +0800
Message-Id: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDnNw7GGW9lr8E8Cw--.35507S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4Utry8XFW7Zr18Jr43Wrg_yoW8WF1kpr
	y3KF1fGr1Uu347Zaya9an7tryrJw4kGay7GF17t34rZr13JryfAr4ktrW8Ja48Jr9rXr4k
	Xw1DtryFgr10gaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4U
	JwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	fUoL0eDUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

From: Yu Kuai <yukuai3@huawei.com>

Patch 1 add some bdev apis, then follow up patches will use these apis
to avoid access bd_inode directly, and hopefully the field bd_inode can
be removed eventually(after figure out a way for fs/buffer.c).

Yu Kuai (14):
  block: add some bdev apis
  xen/blkback: use bdev api in xen_update_blkif_status()
  bcache: use bdev api in read_super()
  mtd: block2mtd: use bdev apis
  s390/dasd: use bdev api in dasd_format()
  scsicam: use bdev api in scsi_bios_ptable()
  bcachefs: remove dead function bdev_sectors()
  btrfs: use bdev apis
  cramfs: use bdev apis in cramfs_blkdev_read()
  erofs: use bdev api
  ext4: use bdev apis
  jbd2: use bdev apis
  gfs2: use bdev api
  nilfs2: use bdev api in nilfs_attach_log_writer()

 block/bdev.c                       | 116 +++++++++++++++++++++++++++++
 block/bio.c                        |   1 +
 block/blk.h                        |   2 -
 drivers/block/xen-blkback/xenbus.c |   3 +-
 drivers/md/bcache/super.c          |  11 ++-
 drivers/mtd/devices/block2mtd.c    |  80 +++++++++-----------
 drivers/s390/block/dasd_ioctl.c    |   5 +-
 drivers/scsi/scsicam.c             |   3 +-
 fs/bcachefs/util.h                 |   5 --
 fs/btrfs/disk-io.c                 |  68 ++++++++---------
 fs/btrfs/volumes.c                 |  17 ++---
 fs/btrfs/zoned.c                   |  12 ++-
 fs/cramfs/inode.c                  |  35 +++------
 fs/erofs/data.c                    |  17 +++--
 fs/erofs/internal.h                |   1 +
 fs/ext4/dir.c                      |   6 +-
 fs/ext4/ext4_jbd2.c                |   6 +-
 fs/ext4/super.c                    |  27 +------
 fs/gfs2/glock.c                    |   2 +-
 fs/gfs2/ops_fstype.c               |   2 +-
 fs/jbd2/journal.c                  |   3 +-
 fs/jbd2/recovery.c                 |   6 +-
 fs/nilfs2/segment.c                |   2 +-
 include/linux/blkdev.h             |  27 +++++++
 include/linux/buffer_head.h        |   5 +-
 25 files changed, 273 insertions(+), 189 deletions(-)

-- 
2.39.2


