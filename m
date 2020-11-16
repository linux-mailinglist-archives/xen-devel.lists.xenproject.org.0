Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D72B48C7
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:11:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28271.57361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kegAQ-0006m2-4z; Mon, 16 Nov 2020 15:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28271.57361; Mon, 16 Nov 2020 15:11:41 +0000
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
	id 1kegAP-0006gu-1Y; Mon, 16 Nov 2020 15:11:41 +0000
Received: by outflank-mailman (input) for mailman id 28271;
 Mon, 16 Nov 2020 15:11:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1keg0y-0006ni-5l
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:01:56 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c90f4ce8-abdf-4f23-9023-68b347ea78dc;
 Mon, 16 Nov 2020 14:59:19 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefyA-0003wx-DT; Mon, 16 Nov 2020 14:59:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1keg0y-0006ni-5l
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:01:56 +0000
X-Inumbo-ID: c90f4ce8-abdf-4f23-9023-68b347ea78dc
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c90f4ce8-abdf-4f23-9023-68b347ea78dc;
	Mon, 16 Nov 2020 14:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9MasGm4sRMlqjIfBzvyRbCzoZ9vCizFcPgSc5rhaRew=; b=uXQm/yyIiJQnYODeCv7tLBroh6
	arXMrp0Tk+2mkvK5mlMoVYQZhqOzsPFVFoVsNhqaXKjdbjxT6ddIFdHimSsiofqQFd042iVeyoPjf
	kjJVvZC7dJvRJWgFk5vnXEzcfiS2wRI+9CAHzFb6PaF2pf3aK/Vv/y+iBA3+wNlveiknIb+cM4k72
	sy6+79pc3yQnXdRLw5qP9MUrMQWCUQr94hrqb0BHYJRuZX0RRf1WPApUNdGnDYjJKsodIy93uSBGl
	mXFAo94CwxYf32WkNugPW9wMsBEd2E2lCs3nmZ+m6b8g/Nfawh6vTjWCNJv2VNFFCFBCwJLajvHZl
	HFZ0RH2Q==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyA-0003wx-DT; Mon, 16 Nov 2020 14:59:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 37/78] block: split block_class_lock
Date: Mon, 16 Nov 2020 15:57:28 +0100
Message-Id: <20201116145809.410558-38-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Split the block_class_lock mutex into one each to protect bdev_map
and major_names.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/genhd.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 482f7b89802010..2a20372756625e 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -25,7 +25,6 @@
 
 #include "blk.h"
 
-static DEFINE_MUTEX(block_class_lock);
 static struct kobject *block_depr;
 
 struct bdev_map {
@@ -37,6 +36,7 @@ struct bdev_map {
 	int (*lock)(dev_t, void *);
 	void *data;
 } *bdev_map[255];
+static DEFINE_MUTEX(bdev_map_lock);
 
 /* for extended dynamic devt allocation, currently only one major is used */
 #define NR_EXT_DEVT		(1 << MINORBITS)
@@ -400,6 +400,7 @@ static struct blk_major_name {
 	int major;
 	char name[16];
 } *major_names[BLKDEV_MAJOR_HASH_SIZE];
+static DEFINE_MUTEX(major_names_lock);
 
 /* index in the above - for now: assume no multimajor ranges */
 static inline int major_to_index(unsigned major)
@@ -412,11 +413,11 @@ void blkdev_show(struct seq_file *seqf, off_t offset)
 {
 	struct blk_major_name *dp;
 
-	mutex_lock(&block_class_lock);
+	mutex_lock(&major_names_lock);
 	for (dp = major_names[major_to_index(offset)]; dp; dp = dp->next)
 		if (dp->major == offset)
 			seq_printf(seqf, "%3d %s\n", dp->major, dp->name);
-	mutex_unlock(&block_class_lock);
+	mutex_unlock(&major_names_lock);
 }
 #endif /* CONFIG_PROC_FS */
 
@@ -445,7 +446,7 @@ int register_blkdev(unsigned int major, const char *name)
 	struct blk_major_name **n, *p;
 	int index, ret = 0;
 
-	mutex_lock(&block_class_lock);
+	mutex_lock(&major_names_lock);
 
 	/* temporary */
 	if (major == 0) {
@@ -498,7 +499,7 @@ int register_blkdev(unsigned int major, const char *name)
 		kfree(p);
 	}
 out:
-	mutex_unlock(&block_class_lock);
+	mutex_unlock(&major_names_lock);
 	return ret;
 }
 
@@ -510,7 +511,7 @@ void unregister_blkdev(unsigned int major, const char *name)
 	struct blk_major_name *p = NULL;
 	int index = major_to_index(major);
 
-	mutex_lock(&block_class_lock);
+	mutex_lock(&major_names_lock);
 	for (n = &major_names[index]; *n; n = &(*n)->next)
 		if ((*n)->major == major)
 			break;
@@ -520,7 +521,7 @@ void unregister_blkdev(unsigned int major, const char *name)
 		p = *n;
 		*n = p->next;
 	}
-	mutex_unlock(&block_class_lock);
+	mutex_unlock(&major_names_lock);
 	kfree(p);
 }
 
@@ -671,7 +672,7 @@ void blk_register_region(dev_t devt, unsigned long range, struct module *module,
 		p->data = data;
 	}
 
-	mutex_lock(&block_class_lock);
+	mutex_lock(&bdev_map_lock);
 	for (i = 0, p -= n; i < n; i++, p++, index++) {
 		struct bdev_map **s = &bdev_map[index % 255];
 		while (*s && (*s)->range < range)
@@ -679,7 +680,7 @@ void blk_register_region(dev_t devt, unsigned long range, struct module *module,
 		p->next = *s;
 		*s = p;
 	}
-	mutex_unlock(&block_class_lock);
+	mutex_unlock(&bdev_map_lock);
 }
 EXPORT_SYMBOL(blk_register_region);
 
@@ -690,7 +691,7 @@ void blk_unregister_region(dev_t devt, unsigned long range)
 	unsigned i;
 	struct bdev_map *found = NULL;
 
-	mutex_lock(&block_class_lock);
+	mutex_lock(&bdev_map_lock);
 	for (i = 0; i < min(n, 255u); i++, index++) {
 		struct bdev_map **s;
 		for (s = &bdev_map[index % 255]; *s; s = &(*s)->next) {
@@ -703,7 +704,7 @@ void blk_unregister_region(dev_t devt, unsigned long range)
 			}
 		}
 	}
-	mutex_unlock(&block_class_lock);
+	mutex_unlock(&bdev_map_lock);
 	kfree(found);
 }
 EXPORT_SYMBOL(blk_unregister_region);
@@ -1034,7 +1035,7 @@ static struct gendisk *lookup_gendisk(dev_t dev, int *partno)
 	unsigned long best = ~0UL;
 
 retry:
-	mutex_lock(&block_class_lock);
+	mutex_lock(&bdev_map_lock);
 	for (p = bdev_map[MAJOR(dev) % 255]; p; p = p->next) {
 		struct kobject *(*probe)(dev_t, int *, void *);
 		struct module *owner;
@@ -1055,7 +1056,7 @@ static struct gendisk *lookup_gendisk(dev_t dev, int *partno)
 			module_put(owner);
 			continue;
 		}
-		mutex_unlock(&block_class_lock);
+		mutex_unlock(&bdev_map_lock);
 		kobj = probe(dev, partno, data);
 		/* Currently ->owner protects _only_ ->probe() itself. */
 		module_put(owner);
@@ -1063,7 +1064,7 @@ static struct gendisk *lookup_gendisk(dev_t dev, int *partno)
 			return dev_to_disk(kobj_to_dev(kobj));
 		goto retry;
 	}
-	mutex_unlock(&block_class_lock);
+	mutex_unlock(&bdev_map_lock);
 	return NULL;
 }
 
-- 
2.29.2


