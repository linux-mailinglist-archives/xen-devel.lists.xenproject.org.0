Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C1D2B48C4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28255.57319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kegAG-0006JW-Vj; Mon, 16 Nov 2020 15:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28255.57319; Mon, 16 Nov 2020 15:11:32 +0000
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
	id 1kegAF-0006DF-Hj; Mon, 16 Nov 2020 15:11:31 +0000
Received: by outflank-mailman (input) for mailman id 28255;
 Mon, 16 Nov 2020 15:11:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1keg0t-0006ni-5U
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:01:51 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f8cc8eb-c40a-4454-bd97-0c2eaf0f39fc;
 Mon, 16 Nov 2020 14:59:18 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefyB-0003xB-Ni; Mon, 16 Nov 2020 14:59:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1keg0t-0006ni-5U
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:01:51 +0000
X-Inumbo-ID: 0f8cc8eb-c40a-4454-bd97-0c2eaf0f39fc
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0f8cc8eb-c40a-4454-bd97-0c2eaf0f39fc;
	Mon, 16 Nov 2020 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=j9YzX4Imfj42oekp8Tth+LQoKAxJAOk+J48Ms5WWyRs=; b=tNKy0A5I0JGyRwszKo8CS5i8OD
	+8V953YfFx3Xman6sQ8F42cjnDZ+fEMnGq+5JSKyBoWRq84B0ROGouApW++jZ44y6feigXqLuqKsR
	cxqh2lFOkiVIegiphp90kij1qmc1NDslqQZNsGbC21VOg69MDd/n08QOAs5NDSIePC2uZIeQod82Z
	T6wB+Z9xXg1/0NZKtWCv5t7lkIbvOb2buar5vD5Qry8bhovOugY2M7SSd4S16Dl+mklfVYWbkqbny
	8IY3ZaEc9JVI0kFlBfL2Zv+6ubgx5Kd03xor/wsERRQOPm0Gj4ArtdUOT7w0cJYRw8cIK/bIaVXYw
	0ktG/eKQ==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyB-0003xB-Ni; Mon, 16 Nov 2020 14:59:04 +0000
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
Subject: [PATCH 38/78] block: rework requesting modules for unclaimed devices
Date: Mon, 16 Nov 2020 15:57:29 +0100
Message-Id: <20201116145809.410558-39-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Instead of reusing the ranges in bdev_map, add a new helper that is
called if no ranges was found.  This is a first step to unpeel and
eventually remove the complex ranges structure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/genhd.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 2a20372756625e..8391e7d83a6920 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1028,6 +1028,13 @@ static ssize_t disk_badblocks_store(struct device *dev,
 	return badblocks_store(disk->bb, page, len, 0);
 }
 
+static void request_gendisk_module(dev_t devt)
+{
+	if (request_module("block-major-%d-%d", MAJOR(devt), MINOR(devt)) > 0)
+		/* Make old-style 2.4 aliases work */
+		request_module("block-major-%d", MAJOR(devt));
+}
+
 static struct gendisk *lookup_gendisk(dev_t dev, int *partno)
 {
 	struct kobject *kobj;
@@ -1052,6 +1059,14 @@ static struct gendisk *lookup_gendisk(dev_t dev, int *partno)
 		probe = p->probe;
 		best = p->range - 1;
 		*partno = dev - p->dev;
+
+		if (!probe) {
+			mutex_unlock(&bdev_map_lock);
+			module_put(owner);
+			request_gendisk_module(dev);
+			goto retry;
+		}
+
 		if (p->lock && p->lock(dev, data) < 0) {
 			module_put(owner);
 			continue;
@@ -1290,15 +1305,6 @@ static const struct seq_operations partitions_op = {
 };
 #endif
 
-
-static struct kobject *base_probe(dev_t devt, int *partno, void *data)
-{
-	if (request_module("block-major-%d-%d", MAJOR(devt), MINOR(devt)) > 0)
-		/* Make old-style 2.4 aliases work */
-		request_module("block-major-%d", MAJOR(devt));
-	return NULL;
-}
-
 static void bdev_map_init(void)
 {
 	struct bdev_map *base;
@@ -1310,7 +1316,6 @@ static void bdev_map_init(void)
 
 	base->dev = 1;
 	base->range = ~0 ;
-	base->probe = base_probe;
 	for (i = 0; i < 255; i++)
 		bdev_map[i] = base;
 }
-- 
2.29.2


