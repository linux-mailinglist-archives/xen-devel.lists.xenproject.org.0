Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC6C7F994F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 07:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641547.1000137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7V0R-0000Ol-Iw; Mon, 27 Nov 2023 06:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641547.1000137; Mon, 27 Nov 2023 06:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7V0R-0000IG-Co; Mon, 27 Nov 2023 06:22:07 +0000
Received: by outflank-mailman (input) for mailman id 641547;
 Mon, 27 Nov 2023 06:22:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6Ye=HI=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1r7V0P-0008S3-RE
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 06:22:05 +0000
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4448111e-8ced-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 07:22:00 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SdwTq4PKKz4f3mHH
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 14:21:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 0AAFB1A0DC9
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 14:21:56 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP1 (Coremail) with SMTP id cCh0CgDX2hB+NWRlrcU8CA--.57866S5;
 Mon, 27 Nov 2023 14:21:55 +0800 (CST)
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
X-Inumbo-ID: 4448111e-8ced-11ee-9b0e-b553b5be7939
From: Yu Kuai <yukuai1@huaweicloud.com>
To: hch@infradead.org,
	ming.lei@redhat.com,
	axboe@kernel.dk,
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
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	nico@fluxnic.net,
	xiang@kernel.org,
	chao@kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
	agruenba@redhat.com,
	jack@suse.com,
	konishi.ryusuke@gmail.com,
	dchinner@redhat.com,
	linux@weissschuh.net,
	min15.li@samsung.com,
	yukuai3@huawei.com,
	dlemoal@kernel.org,
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
	linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH block/for-next v2 01/16] block: add a new helper to get inode from block_device
Date: Mon, 27 Nov 2023 14:21:01 +0800
Message-Id: <20231127062116.2355129-2-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDX2hB+NWRlrcU8CA--.57866S5
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1kur1UZFWfWw45tr1rtFb_yoW8Aw4rpF
	nxGFy5GrWDWry2gF4vvw17Zry3K3W0k3y8JrZaqw4Y9ayUtr1IgF1ktr17Ary0vrZ3KF4j
	gF1Y9rW8urWUC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUOR6z
	UUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

From: Yu Kuai <yukuai3@huawei.com>

block_devcie is allocated from bdev_alloc() by bdev_alloc_inode(), and
currently block_device contains a pointer that point to the address of
inode, while such inode is allocated together:

bdev_alloc
 inode = new_inode()
  // inode is &bdev_inode->vfs_inode
 bdev = I_BDEV(inode)
  // bdev is &bdev_inode->bdev
 bdev->inode = inode

Add a new helper to get address of inode from bdev by add operation
instead of memory access, which is more efficiency.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 block/bdev.c              |  5 -----
 include/linux/blk_types.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index e4cfb7adb645..7509389095b7 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -30,11 +30,6 @@
 #include "../fs/internal.h"
 #include "blk.h"
 
-struct bdev_inode {
-	struct block_device bdev;
-	struct inode vfs_inode;
-};
-
 static inline struct bdev_inode *BDEV_I(struct inode *inode)
 {
 	return container_of(inode, struct bdev_inode, vfs_inode);
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index d5c5e59ddbd2..06de8393dcd1 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -85,6 +85,18 @@ struct block_device {
 #define bdev_kobj(_bdev) \
 	(&((_bdev)->bd_device.kobj))
 
+struct bdev_inode {
+	struct block_device bdev;
+	struct inode vfs_inode;
+};
+
+static inline struct inode *bdev_inode(struct block_device *bdev)
+{
+	struct bdev_inode *bi = container_of(bdev, struct bdev_inode, bdev);
+
+	return &bi->vfs_inode;
+}
+
 /*
  * Block error status values.  See block/blk-core:blk_errors for the details.
  * Alpha cannot write a byte atomically, so we need to use 32-bit value.
-- 
2.39.2


