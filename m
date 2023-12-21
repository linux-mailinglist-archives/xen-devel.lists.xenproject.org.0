Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6332481B0E9
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 09:59:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658604.1027874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGEts-0002WW-Cz; Thu, 21 Dec 2023 08:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658604.1027874; Thu, 21 Dec 2023 08:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGEts-0002PN-6n; Thu, 21 Dec 2023 08:59:28 +0000
Received: by outflank-mailman (input) for mailman id 658604;
 Thu, 21 Dec 2023 08:59:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8MA4=IA=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1rGEtp-0001b5-Ln
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 08:59:25 +0000
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a4e7dc5-9fdf-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 09:59:22 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SwkrL08TPz4f3lWC
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 16:59:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 42F191A049B
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 16:59:19 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP1 (Coremail) with SMTP id cCh0CgDnNw5d_oNlEQPvEA--.24929S8;
 Thu, 21 Dec 2023 16:59:18 +0800 (CST)
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
X-Inumbo-ID: 3a4e7dc5-9fdf-11ee-9b0f-b553b5be7939
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
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	nico@fluxnic.net,
	xiang@kernel.org,
	chao@kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
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
	linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH RFC v3 for-6.8/block 04/17] mtd: block2mtd: use bdev apis
Date: Thu, 21 Dec 2023 16:56:59 +0800
Message-Id: <20231221085712.1766333-5-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDnNw5d_oNlEQPvEA--.24929S8
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1DtryDWw17CF45XFyrZwb_yoW7Aw18pa
	y3Ca95Aw4UKrn8urs7Xwn8Zr12g3sFqa1Uuay7C3yakFyfXryIkas7ta45tFyrKry8AFWk
	XF4DAr4rXF40grJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU
	OBTYUUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

From: Yu Kuai <yukuai3@huawei.com>

On the one hand covert to use folio while reading bdev inode, on the
other hand prevent to access bd_inode directly.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/mtd/devices/block2mtd.c | 81 +++++++++++++++------------------
 1 file changed, 36 insertions(+), 45 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index aa44a23ec045..cf201bf73184 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -46,40 +46,34 @@ struct block2mtd_dev {
 /* Static info about the MTD, used in cleanup_module */
 static LIST_HEAD(blkmtd_device_list);
 
-
-static struct page *page_read(struct address_space *mapping, pgoff_t index)
-{
-	return read_mapping_page(mapping, index, NULL);
-}
-
 /* erase a specified part of the device */
 static int _block2mtd_erase(struct block2mtd_dev *dev, loff_t to, size_t len)
 {
-	struct address_space *mapping =
-				dev->bdev_handle->bdev->bd_inode->i_mapping;
-	struct page *page;
+	struct block_device *bdev = dev->bdev_handle->bdev;
+	struct folio *folio;
 	pgoff_t index = to >> PAGE_SHIFT;	// page index
 	int pages = len >> PAGE_SHIFT;
 	u_long *p;
 	u_long *max;
 
 	while (pages) {
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		folio = bdev_read_folio(bdev, index << PAGE_SHIFT);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-		max = page_address(page) + PAGE_SIZE;
-		for (p=page_address(page); p<max; p++)
+		max = folio_address(folio) + folio_size(folio);
+		for (p = folio_address(folio); p < max; p++)
 			if (*p != -1UL) {
-				lock_page(page);
-				memset(page_address(page), 0xff, PAGE_SIZE);
-				set_page_dirty(page);
-				unlock_page(page);
-				balance_dirty_pages_ratelimited(mapping);
+				folio_lock(folio);
+				memset(folio_address(folio), 0xff,
+				       folio_size(folio));
+				folio_mark_dirty(folio);
+				folio_unlock(folio);
+				bdev_balance_dirty_pages_ratelimited(bdev);
 				break;
 			}
 
-		put_page(page);
+		folio_put(folio);
 		pages--;
 		index++;
 	}
@@ -106,9 +100,7 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
 	struct block2mtd_dev *dev = mtd->priv;
-	struct address_space *mapping =
-				dev->bdev_handle->bdev->bd_inode->i_mapping;
-	struct page *page;
+	struct folio *folio;
 	pgoff_t index = from >> PAGE_SHIFT;
 	int offset = from & (PAGE_SIZE-1);
 	int cpylen;
@@ -120,12 +112,13 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 			cpylen = len;	// this page
 		len = len - cpylen;
 
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		folio = bdev_read_folio(dev->bdev_handle->bdev,
+					index << PAGE_SHIFT);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-		memcpy(buf, page_address(page) + offset, cpylen);
-		put_page(page);
+		memcpy(buf, folio_address(folio) + offset, cpylen);
+		folio_put(folio);
 
 		if (retlen)
 			*retlen += cpylen;
@@ -141,9 +134,8 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int _block2mtd_write(struct block2mtd_dev *dev, const u_char *buf,
 		loff_t to, size_t len, size_t *retlen)
 {
-	struct page *page;
-	struct address_space *mapping =
-				dev->bdev_handle->bdev->bd_inode->i_mapping;
+	struct block_device *bdev = dev->bdev_handle->bdev;
+	struct folio *folio;
 	pgoff_t index = to >> PAGE_SHIFT;	// page index
 	int offset = to & ~PAGE_MASK;	// page offset
 	int cpylen;
@@ -155,18 +147,18 @@ static int _block2mtd_write(struct block2mtd_dev *dev, const u_char *buf,
 			cpylen = len;			// this page
 		len = len - cpylen;
 
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		folio = bdev_read_folio(bdev, index << PAGE_SHIFT);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-		if (memcmp(page_address(page)+offset, buf, cpylen)) {
-			lock_page(page);
-			memcpy(page_address(page) + offset, buf, cpylen);
-			set_page_dirty(page);
-			unlock_page(page);
-			balance_dirty_pages_ratelimited(mapping);
+		if (memcmp(folio_address(folio) + offset, buf, cpylen)) {
+			folio_lock(folio);
+			memcpy(folio_address(folio) + offset, buf, cpylen);
+			folio_mark_dirty(folio);
+			folio_unlock(folio);
+			bdev_balance_dirty_pages_ratelimited(bdev);
 		}
-		put_page(page);
+		folio_put(folio);
 
 		if (retlen)
 			*retlen += cpylen;
@@ -211,8 +203,7 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
 	kfree(dev->mtd.name);
 
 	if (dev->bdev_handle) {
-		invalidate_mapping_pages(
-			dev->bdev_handle->bdev->bd_inode->i_mapping, 0, -1);
+		invalidate_bdev(dev->bdev_handle->bdev);
 		bdev_release(dev->bdev_handle);
 	}
 
@@ -295,7 +286,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 		goto err_free_block2mtd;
 	}
 
-	if ((long)bdev->bd_inode->i_size % erase_size) {
+	if (bdev_nr_bytes(bdev) % erase_size) {
 		pr_err("erasesize must be a divisor of device size\n");
 		goto err_free_block2mtd;
 	}
@@ -313,7 +304,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 
 	dev->mtd.name = name;
 
-	dev->mtd.size = bdev->bd_inode->i_size & PAGE_MASK;
+	dev->mtd.size = bdev_nr_bytes(bdev) & PAGE_MASK;
 	dev->mtd.erasesize = erase_size;
 	dev->mtd.writesize = 1;
 	dev->mtd.writebufsize = PAGE_SIZE;
-- 
2.39.2


