Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC2B41A202
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 00:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197203.350221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygX-0002aD-Is; Mon, 27 Sep 2021 22:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197203.350221; Mon, 27 Sep 2021 22:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygX-0002Y1-Ff; Mon, 27 Sep 2021 22:01:17 +0000
Received: by outflank-mailman (input) for mailman id 197203;
 Mon, 27 Sep 2021 22:01:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0LRd=OR=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mUygW-0000mS-EV
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 22:01:16 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a94eef9-03fa-4a35-bcd0-411b3f8d8836;
 Mon, 27 Sep 2021 22:00:49 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyfw-004Suk-EY; Mon, 27 Sep 2021 22:00:40 +0000
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
X-Inumbo-ID: 2a94eef9-03fa-4a35-bcd0-411b3f8d8836
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7F58wxD/dEQonKrzNoWM7DkNk/UH9ZF8NZLJCFZZJo4=; b=ZnlFI8fLEZC+pXL09OaLsKjdn8
	sG2hdDcnkdd7ZQAAOmWguGc7OnVMevoBr9Iei6cSMyXAQixEc8APBeN/A8M4gCqUCYojYyBiRia7O
	7wDEec/aFp7xuN5F775zNLNzsTp/rSR3Ay3VTbK1PNHfZokfRNvqNAX9BvqfJMUKuSdi3rm3MuWeX
	L6a8Q4FjRtkn9UeJ4Lhp3Lt/jbaePXbm+u8tO6lhIOBWl8Zvgdk3hjBymTruCXrQy+1R0u429f+a4
	B0bkzO9hXCn6QDiaV77uGrK+Hfqt+kENvWzGuFAfXSbunwOgQu1cHy4uiqeb5kU5vGXxTPlHBSNa9
	7+WGTsLw==;
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
Subject: [PATCH v2 03/10] nvme-multipath: add error handling support for add_disk()
Date: Mon, 27 Sep 2021 15:00:32 -0700
Message-Id: <20210927220039.1064193-4-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220039.1064193-1-mcgrof@kernel.org>
References: <20210927220039.1064193-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Since we now can tell for sure when a disk was added, move
setting the bit NVME_NSHEAD_DISK_LIVE only when we did
add the disk successfully.

Nothing to do here as the cleanup is done elsewhere. We take
care and use test_and_set_bit() because it is protects against
two nvme paths simultaneously calling device_add_disk() on the
same namespace head.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/nvme/host/multipath.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index e8ccdd398f78..35cace4f3f5f 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -496,13 +496,22 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 static void nvme_mpath_set_live(struct nvme_ns *ns)
 {
 	struct nvme_ns_head *head = ns->head;
+	int rc;
 
 	if (!head->disk)
 		return;
 
+	/*
+	 * test_and_set_bit() is used because it is protecting against two nvme
+	 * paths simultaneously calling device_add_disk() on the same namespace
+	 * head.
+	 */
 	if (!test_and_set_bit(NVME_NSHEAD_DISK_LIVE, &head->flags)) {
-		device_add_disk(&head->subsys->dev, head->disk,
-				nvme_ns_id_attr_groups);
+		rc = device_add_disk(&head->subsys->dev, head->disk,
+				     nvme_ns_id_attr_groups);
+		if (rc)
+			return;
+		set_bit(NVME_NSHEAD_DISK_LIVE, &head->flags);
 		nvme_add_ns_head_cdev(head);
 	}
 
-- 
2.30.2


