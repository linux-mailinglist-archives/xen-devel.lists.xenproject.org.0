Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6D57F9977
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 07:23:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641568.1000241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7V1w-0005tA-0Q; Mon, 27 Nov 2023 06:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641568.1000241; Mon, 27 Nov 2023 06:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7V1v-0005qo-Tu; Mon, 27 Nov 2023 06:23:39 +0000
Received: by outflank-mailman (input) for mailman id 641568;
 Mon, 27 Nov 2023 06:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6Ye=HI=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1r7V1v-0005KR-0O
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 06:23:39 +0000
Received: from dggsgout12.his.huawei.com (unknown [45.249.212.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e6c88f3-8ced-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 07:23:36 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4SdwWl5fVBz4f3kG9
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 14:23:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 9D74F1A0AF2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 14:23:33 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP1 (Coremail) with SMTP id cCh0CgBXWhDeNWRlxeA8CA--.60190S6;
 Mon, 27 Nov 2023 14:23:33 +0800 (CST)
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
X-Inumbo-ID: 7e6c88f3-8ced-11ee-9b0e-b553b5be7939
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
Subject: [PATCH block/for-next v2 12/16] gfs2: use new helper to get inode from block_device
Date: Mon, 27 Nov 2023 14:22:48 +0800
Message-Id: <20231127062252.2367645-3-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127062252.2367645-1-yukuai1@huaweicloud.com>
References: <20231127062252.2367645-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgBXWhDeNWRlxeA8CA--.60190S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1rurWfGr4fAw4UAF15XFb_yoW8Jw1fpr
	9rJF1YkF4kWrnIgaykuF4Fq3WUuay8G3yIy3s5Cwn0vrsrGw1aga92kF4DJayrXa97ZwsI
	ga1a9w4avr1Ygr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6rxdM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Cr1j6rxdMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJw
	CI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnIWIevJa73UjIFyTuYvjfUFrcTDUUU
	U
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

From: Yu Kuai <yukuai3@huawei.com>

Which is more efficiency, and also prepare to remove the field
'bd_inode' from block_device.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 fs/gfs2/glock.c      | 2 +-
 fs/gfs2/ops_fstype.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index d6bf1f8c25dc..ec6394544ebb 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1210,7 +1210,7 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
 	mapping = gfs2_glock2aspace(gl);
 	if (mapping) {
                 mapping->a_ops = &gfs2_meta_aops;
-		mapping->host = s->s_bdev->bd_inode;
+		mapping->host = bdev_inode(s->s_bdev);
 		mapping->flags = 0;
 		mapping_set_gfp_mask(mapping, GFP_NOFS);
 		mapping->private_data = NULL;
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index b108c5d26839..dfc4735cfd54 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -114,7 +114,7 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 
 	address_space_init_once(mapping);
 	mapping->a_ops = &gfs2_rgrp_aops;
-	mapping->host = sb->s_bdev->bd_inode;
+	mapping->host = bdev_inode(sb->s_bdev);
 	mapping->flags = 0;
 	mapping_set_gfp_mask(mapping, GFP_NOFS);
 	mapping->private_data = NULL;
-- 
2.39.2


