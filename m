Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751BC3FA05C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 22:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173941.317345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDC-0008CL-6z; Fri, 27 Aug 2021 20:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173941.317345; Fri, 27 Aug 2021 20:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDB-00081u-Uz; Fri, 27 Aug 2021 20:12:25 +0000
Received: by outflank-mailman (input) for mailman id 173941;
 Fri, 27 Aug 2021 19:18:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8NxO=NS=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mJhN4-0001H3-Al
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 19:18:34 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f46a61ef-6b04-46bf-bd42-29a0beb23698;
 Fri, 27 Aug 2021 19:18:22 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mJhMh-00D5B1-9r; Fri, 27 Aug 2021 19:18:11 +0000
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
X-Inumbo-ID: f46a61ef-6b04-46bf-bd42-29a0beb23698
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=27odH5nuWhozi1ECDZZ4goiUsLRrmSNLiICgWw9rj94=; b=RoVROwonXgehtqGc+uNEhBcWcZ
	R5TCqcCZrOdRGr9HUPwtMi32e/ae/EkxCUSAPtRc6M2LeT6rdituE92p30lXXWNaVFoW1e/c2e6Jb
	kraEvvyQ0M5bcOebJtmKBzhn/SKTI3nIuCgdJLTg8IUxMR9sn5GxY4zSbxxEz0K4wwzTyI0DP5qL4
	2x+bE9BxAJsWm1ucxECHkU1A/iGQVGxBjvTqucWQarpvTa/rJT4JydPtEf/YgYxRjQJlkZQbeG6KC
	TpQ8GMDtI1KQRlMQi4ArGei1Q6BvaQQHz0c7jbbmvYnpnnYjjiZOxdHBsmeZG072BsLXL5mGH59Kg
	DQxVvblQ==;
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	kbusch@kernel.org,
	sagi@grimberg.me,
	vishal.l.verma@intel.com,
	dan.j.williams@intel.com,
	dave.jiang@intel.com,
	ira.weiny@intel.com,
	konrad.wilk@oracle.com,
	roger.pau@citrix.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	minchan@kernel.org,
	ngupta@vflare.org,
	senozhatsky@chromium.org
Cc: xen-devel@lists.xenproject.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 05/10] nvdimm/btt: use goto error labels on btt_blk_init()
Date: Fri, 27 Aug 2021 12:18:04 -0700
Message-Id: <20210827191809.3118103-6-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827191809.3118103-1-mcgrof@kernel.org>
References: <20210827191809.3118103-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

This will make it easier to share common error paths.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/nvdimm/btt.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 3fd1bdb9fc05..275704d80109 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1520,10 +1520,11 @@ static int btt_blk_init(struct btt *btt)
 {
 	struct nd_btt *nd_btt = btt->nd_btt;
 	struct nd_namespace_common *ndns = nd_btt->ndns;
+	int rc = -ENOMEM;
 
 	btt->btt_disk = blk_alloc_disk(NUMA_NO_NODE);
 	if (!btt->btt_disk)
-		return -ENOMEM;
+		goto out;
 
 	nvdimm_namespace_disk_name(ndns, btt->btt_disk->disk_name);
 	btt->btt_disk->first_minor = 0;
@@ -1535,19 +1536,23 @@ static int btt_blk_init(struct btt *btt)
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, btt->btt_disk->queue);
 
 	if (btt_meta_size(btt)) {
-		int rc = nd_integrity_init(btt->btt_disk, btt_meta_size(btt));
-
-		if (rc) {
-			blk_cleanup_disk(btt->btt_disk);
-			return rc;
-		}
+		rc = nd_integrity_init(btt->btt_disk, btt_meta_size(btt));
+		if (rc)
+			goto out_cleanup_disk;
 	}
+
 	set_capacity(btt->btt_disk, btt->nlba * btt->sector_size >> 9);
 	device_add_disk(&btt->nd_btt->dev, btt->btt_disk, NULL);
+
 	btt->nd_btt->size = btt->nlba * (u64)btt->sector_size;
 	nvdimm_check_and_set_ro(btt->btt_disk);
 
 	return 0;
+
+out_cleanup_disk:
+	blk_cleanup_disk(btt->btt_disk);
+out:
+	return rc;
 }
 
 static void btt_blk_cleanup(struct btt *btt)
-- 
2.30.2


