Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A22B48BC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:11:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28221.57240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kegA0-0005QP-3s; Mon, 16 Nov 2020 15:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28221.57240; Mon, 16 Nov 2020 15:11:15 +0000
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
	id 1keg9y-0005Jp-IC; Mon, 16 Nov 2020 15:11:14 +0000
Received: by outflank-mailman (input) for mailman id 28221;
 Mon, 16 Nov 2020 15:11:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1keg18-0006ni-64
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:02:06 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d239da22-5f61-4b54-af6f-9324bbc9feb8;
 Mon, 16 Nov 2020 14:59:22 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefyD-0003xZ-0p; Mon, 16 Nov 2020 14:59:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1keg18-0006ni-64
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:02:06 +0000
X-Inumbo-ID: d239da22-5f61-4b54-af6f-9324bbc9feb8
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d239da22-5f61-4b54-af6f-9324bbc9feb8;
	Mon, 16 Nov 2020 14:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ISq8BehFRmfA7X2bUEKuKNCEzkzF+ixwO2P3vH2Ca4g=; b=d73ns3M7F3JRR21anbEXFxuf9g
	A1xWTv4tBpopyBGHuve4hdPzPLwGluE0C2j9u+A4uk1WzPvrWwUq+wvI0IfwLikycPsXYuDfNoqOe
	m8TfyEmDYqxSeCEPv8OHRnRxlZa2BK0Mb/DUIm1Z0f6pGaDzcvBobxYIJlmaIdSdeUSaf89GVeTXM
	JufiFirvEUqjxlNXxHVTpo2WhwYvjUKrOkF5h55ecknCMyA1me/y2F2FdynUFWj9zZc5XKzC9ijl9
	HJGyPVpfezAKOMvhyISvMkEFsLN1uvdIFVszTvvkCN35wOb/aMbNL+Xc75GBLtiIukt+24033x1tu
	55Dk0zgg==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyD-0003xZ-0p; Mon, 16 Nov 2020 14:59:05 +0000
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
Subject: [PATCH 39/78] block: add an optional probe callback to major_names
Date: Mon, 16 Nov 2020 15:57:30 +0100
Message-Id: <20201116145809.410558-40-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Add a callback to the major_names array that allows a driver to override
how to probe for dev_t that doesn't currently have a gendisk registered.
This will help separating the lookup of the gendisk by dev_t vs probe
action for a not currently registered dev_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/genhd.c         | 21 ++++++++++++++++++---
 include/linux/genhd.h |  5 ++++-
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 8391e7d83a6920..dc8690bc281c16 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -399,6 +399,7 @@ static struct blk_major_name {
 	struct blk_major_name *next;
 	int major;
 	char name[16];
+	void (*probe)(dev_t devt);
 } *major_names[BLKDEV_MAJOR_HASH_SIZE];
 static DEFINE_MUTEX(major_names_lock);
 
@@ -441,7 +442,8 @@ void blkdev_show(struct seq_file *seqf, off_t offset)
  * See Documentation/admin-guide/devices.txt for the list of allocated
  * major numbers.
  */
-int register_blkdev(unsigned int major, const char *name)
+int __register_blkdev(unsigned int major, const char *name,
+		void (*probe)(dev_t devt))
 {
 	struct blk_major_name **n, *p;
 	int index, ret = 0;
@@ -480,6 +482,7 @@ int register_blkdev(unsigned int major, const char *name)
 	}
 
 	p->major = major;
+	p->probe = probe;
 	strlcpy(p->name, name, sizeof(p->name));
 	p->next = NULL;
 	index = major_to_index(major);
@@ -502,8 +505,7 @@ int register_blkdev(unsigned int major, const char *name)
 	mutex_unlock(&major_names_lock);
 	return ret;
 }
-
-EXPORT_SYMBOL(register_blkdev);
+EXPORT_SYMBOL(__register_blkdev);
 
 void unregister_blkdev(unsigned int major, const char *name)
 {
@@ -1030,6 +1032,19 @@ static ssize_t disk_badblocks_store(struct device *dev,
 
 static void request_gendisk_module(dev_t devt)
 {
+	unsigned int major = MAJOR(devt);
+	struct blk_major_name **n;
+
+	mutex_lock(&major_names_lock);
+	for (n = &major_names[major_to_index(major)]; *n; n = &(*n)->next) {
+		if ((*n)->major == major && (*n)->probe) {
+			(*n)->probe(devt);
+			mutex_unlock(&major_names_lock);
+			return;
+		}
+	}
+	mutex_unlock(&major_names_lock);
+
 	if (request_module("block-major-%d-%d", MAJOR(devt), MINOR(devt)) > 0)
 		/* Make old-style 2.4 aliases work */
 		request_module("block-major-%d", MAJOR(devt));
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 8427ad8bef520d..04f6a6bf577a90 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -366,7 +366,10 @@ extern void blk_unregister_region(dev_t devt, unsigned long range);
 
 #define alloc_disk(minors) alloc_disk_node(minors, NUMA_NO_NODE)
 
-int register_blkdev(unsigned int major, const char *name);
+int __register_blkdev(unsigned int major, const char *name,
+		void (*probe)(dev_t devt));
+#define register_blkdev(major, name) \
+	__register_blkdev(major, name, NULL)
 void unregister_blkdev(unsigned int major, const char *name);
 
 void revalidate_disk_size(struct gendisk *disk, bool verbose);
-- 
2.29.2


