Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B357F9950
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 07:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641553.1000197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7V0Y-00020L-Mv; Mon, 27 Nov 2023 06:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641553.1000197; Mon, 27 Nov 2023 06:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7V0Y-0001uU-Ht; Mon, 27 Nov 2023 06:22:14 +0000
Received: by outflank-mailman (input) for mailman id 641553;
 Mon, 27 Nov 2023 06:22:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6Ye=HI=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1r7V0X-0008S4-BI
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 06:22:13 +0000
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c0c522c-8ced-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 07:22:12 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SdwV6000Dz4f3k5c
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 14:22:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id CE8311A0BA5
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 14:22:08 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP1 (Coremail) with SMTP id cCh0CgDX2hB+NWRlrcU8CA--.57866S12;
 Mon, 27 Nov 2023 14:22:08 +0800 (CST)
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
X-Inumbo-ID: 4c0c522c-8ced-11ee-98e2-6d05b1d4d9a1
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
Subject: [PATCH block/for-next v2 08/16] btrfs: use new helper to get inode from block_device
Date: Mon, 27 Nov 2023 14:21:08 +0800
Message-Id: <20231127062116.2355129-9-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDX2hB+NWRlrcU8CA--.57866S12
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1xKFykCFWxKFyUKFy5CFg_yoW5XFWkpr
	9xCF98tw4UXr1jga1kW3yvvr1Sqa1vkayxCr93Jw4S9rWxtryYqFyqkry8Za40yrW8JF17
	XF4jk3yUXr10krJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6r
	xdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Cr1j6rxdMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnIWIevJa73UjIFyTuYvjfUOBTY
	UUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

From: Yu Kuai <yukuai3@huawei.com>

Which is more efficiency, and also prepare to remove the field
'bd_inode' from block_device.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 fs/btrfs/disk-io.c | 6 +++---
 fs/btrfs/volumes.c | 4 ++--
 fs/btrfs/zoned.c   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 401ea09ae4b8..88b20cd4d046 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -3653,7 +3653,7 @@ struct btrfs_super_block *btrfs_read_dev_one_super(struct block_device *bdev,
 	struct btrfs_super_block *super;
 	struct page *page;
 	u64 bytenr, bytenr_orig;
-	struct address_space *mapping = bdev->bd_inode->i_mapping;
+	struct address_space *mapping = bdev_inode(bdev)->i_mapping;
 	int ret;
 
 	bytenr_orig = btrfs_sb_offset(copy_num);
@@ -3740,7 +3740,7 @@ static int write_dev_supers(struct btrfs_device *device,
 			    struct btrfs_super_block *sb, int max_mirrors)
 {
 	struct btrfs_fs_info *fs_info = device->fs_info;
-	struct address_space *mapping = device->bdev->bd_inode->i_mapping;
+	struct address_space *mapping = bdev_inode(device->bdev)->i_mapping;
 	SHASH_DESC_ON_STACK(shash, fs_info->csum_shash);
 	int i;
 	int errors = 0;
@@ -3857,7 +3857,7 @@ static int wait_dev_supers(struct btrfs_device *device, int max_mirrors)
 		    device->commit_total_bytes)
 			break;
 
-		page = find_get_page(device->bdev->bd_inode->i_mapping,
+		page = find_get_page(bdev_inode(device->bdev)->i_mapping,
 				     bytenr >> PAGE_SHIFT);
 		if (!page) {
 			errors++;
diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index c6f16625af51..bbf157cedab7 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -1257,8 +1257,8 @@ static struct btrfs_super_block *btrfs_read_disk_super(struct block_device *bdev
 		return ERR_PTR(-EINVAL);
 
 	/* pull in the page with our super */
-	page = read_cache_page_gfp(bdev->bd_inode->i_mapping, index, GFP_KERNEL);
-
+	page = read_cache_page_gfp(bdev_inode(bdev)->i_mapping, index,
+				   GFP_KERNEL);
 	if (IS_ERR(page))
 		return ERR_CAST(page);
 
diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index 188378ca19c7..a5f7f1458edf 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -120,7 +120,7 @@ static int sb_write_pointer(struct block_device *bdev, struct blk_zone *zones,
 		return -ENOENT;
 	} else if (full[0] && full[1]) {
 		/* Compare two super blocks */
-		struct address_space *mapping = bdev->bd_inode->i_mapping;
+		struct address_space *mapping = bdev_inode(bdev)->i_mapping;
 		struct page *page[BTRFS_NR_SB_LOG_ZONES];
 		struct btrfs_super_block *super[BTRFS_NR_SB_LOG_ZONES];
 		int i;
-- 
2.39.2


