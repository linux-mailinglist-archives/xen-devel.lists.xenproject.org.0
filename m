Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF982C2720
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:28:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35993.67726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYNG-0000mT-Or; Tue, 24 Nov 2020 13:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35993.67726; Tue, 24 Nov 2020 13:28:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYNG-0000lL-JJ; Tue, 24 Nov 2020 13:28:50 +0000
Received: by outflank-mailman (input) for mailman id 35993;
 Tue, 24 Nov 2020 13:28:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1khYNF-0000Qf-1Q
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:28:49 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4856bb45-c322-4086-a1cb-94c910b09985;
 Tue, 24 Nov 2020 13:28:26 +0000 (UTC)
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMb-0006Vh-99; Tue, 24 Nov 2020 13:28:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1khYNF-0000Qf-1Q
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:28:49 +0000
X-Inumbo-ID: 4856bb45-c322-4086-a1cb-94c910b09985
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4856bb45-c322-4086-a1cb-94c910b09985;
	Tue, 24 Nov 2020 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qLuO7hD0TG0p9aylN+kHqBJxf5z3v4FVxxZ2M17hRmY=; b=cByrnVSUwNsV+8vL6OejYZMzYW
	g8VICMIEorS+0pOBvVioVLf/hyD/zxobeo8PAet5DaDiGdRDYy0L5JNIcM3yD1NCnwpsR6gWUVB5i
	Lptsh/7GyC3dYE+HryC4wV9CakS+3V2vvPvT4vRhVftfmO4XobgclczjV5yeEVlKRsJvJ9LwjX+8o
	1vNw6Sl4pqdKC25En8sUougbgcvCNyLxzyGGHsEPu8enWgOfJoKU0RIKHjBkbhK7GxVxYfvwMvJI6
	Vf9vnnAEkii3NBNG4XOnzwMMzJMYdhpc7IAUijTjrAXJlfebUq3ghdAO/ZeMpsZrhIZUAVgWmW/K4
	kMYMHe4Q==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYMb-0006Vh-99; Tue, 24 Nov 2020 13:28:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	dm-devel@redhat.com,
	Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 10/45] dm: remove the block_device reference in struct mapped_device
Date: Tue, 24 Nov 2020 14:27:16 +0100
Message-Id: <20201124132751.3747337-11-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Get rid of the long-lasting struct block_device reference in
struct mapped_device.  The only remaining user is the freeze code,
where we can trivially look up the block device at freeze time
and release the reference at thaw time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm-core.h |  2 --
 drivers/md/dm.c      | 25 ++++++++++++++-----------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index aace147effcacb..086d293c2b036c 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -102,8 +102,6 @@ struct mapped_device {
 	/* kobject and completion */
 	struct dm_kobject_holder kobj_holder;
 
-	struct block_device *bdev;
-
 	struct dm_stats stats;
 
 	/* for blk-mq request-based DM support */
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index ab0a8335f098d9..48051db006f30c 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1744,11 +1744,6 @@ static void cleanup_mapped_device(struct mapped_device *md)
 
 	cleanup_srcu_struct(&md->io_barrier);
 
-	if (md->bdev) {
-		bdput(md->bdev);
-		md->bdev = NULL;
-	}
-
 	mutex_destroy(&md->suspend_lock);
 	mutex_destroy(&md->type_lock);
 	mutex_destroy(&md->table_devices_lock);
@@ -1840,10 +1835,6 @@ static struct mapped_device *alloc_dev(int minor)
 	if (!md->wq)
 		goto bad;
 
-	md->bdev = bdget_disk(md->disk, 0);
-	if (!md->bdev)
-		goto bad;
-
 	dm_stats_init(&md->stats);
 
 	/* Populate the mapping, nobody knows we exist yet */
@@ -2384,11 +2375,16 @@ struct dm_table *dm_swap_table(struct mapped_device *md, struct dm_table *table)
  */
 static int lock_fs(struct mapped_device *md)
 {
+	struct block_device *bdev;
 	int r;
 
 	WARN_ON(test_bit(DMF_FROZEN, &md->flags));
 
-	r = freeze_bdev(md->bdev);
+	bdev = bdget_disk(md->disk, 0);
+	if (!bdev)
+		return -ENOMEM;
+	r = freeze_bdev(bdev);
+	bdput(bdev);
 	if (!r)
 		set_bit(DMF_FROZEN, &md->flags);
 	return r;
@@ -2396,9 +2392,16 @@ static int lock_fs(struct mapped_device *md)
 
 static void unlock_fs(struct mapped_device *md)
 {
+	struct block_device *bdev;
+
 	if (!test_bit(DMF_FROZEN, &md->flags))
 		return;
-	thaw_bdev(md->bdev);
+
+	bdev = bdget_disk(md->disk, 0);
+	if (!bdev)
+		return;
+	thaw_bdev(bdev);
+	bdput(bdev);
 	clear_bit(DMF_FROZEN, &md->flags);
 }
 
-- 
2.29.2


