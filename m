Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084BA3FA057
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 22:13:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173947.317369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDD-0000BR-Iw; Fri, 27 Aug 2021 20:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173947.317369; Fri, 27 Aug 2021 20:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDD-0008Qk-6L; Fri, 27 Aug 2021 20:12:27 +0000
Received: by outflank-mailman (input) for mailman id 173947;
 Fri, 27 Aug 2021 19:18:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8NxO=NS=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mJhNJ-0001H3-B0
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 19:18:49 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2ed6f55-78c3-4682-8ddf-5ff60b0a557b;
 Fri, 27 Aug 2021 19:18:23 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mJhMh-00D5B9-Dv; Fri, 27 Aug 2021 19:18:11 +0000
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
X-Inumbo-ID: c2ed6f55-78c3-4682-8ddf-5ff60b0a557b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=vLYLL0oFZhxGylgSJPWXsGjPK2psQoUWyxkb9au47Xw=; b=O3AoZlZnbbHQwfvGAtYvirog88
	EON0OdRqJ6ZNzUhguT3+31CMn99Dygty5KuFC7VLotkku9ilfuOy06Oc7/54lv5yP7YxlxivOMJuF
	hD2YhvsrCtHG51gDcXamrBh68I6Ogwu0ifCKgUDsQBoyWwXuMLFKxdlQcc+TFIr84VKkggf/t61i6
	e5dMcioA6KN+rhWZTtIsd8fu8k/YXGPA6Qfjktzpj0VLdY+6m1toijsuQeqiSXIcBBQSLwvDBDi+v
	lgKdIIRbsqr8QoIXbG3zrVctqdrqvShN+LA602q9Y7/vv5WNzB+RE7I1AQx/cTOh147AgEQchMFg2
	vWX3qxJg==;
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
Subject: [PATCH 08/10] nvdimm/blk: add error handling support for add_disk()
Date: Fri, 27 Aug 2021 12:18:07 -0700
Message-Id: <20210827191809.3118103-9-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827191809.3118103-1-mcgrof@kernel.org>
References: <20210827191809.3118103-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Since nvdimm/blk uses devm we just need to move the devm
registration towards the end. And in hindsight, that seems
to also provide a fix given del_gendisk() should not be
called unless the disk was already added via add_disk().
The probably of that issue happening is low though, like
OOM while calling devm_add_action(), so the fix is minor.

We manually unwind in case of add_disk() failure prior
to the devm registration.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/nvdimm/blk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvdimm/blk.c b/drivers/nvdimm/blk.c
index 591fa1f86f1e..9f1eb41404ac 100644
--- a/drivers/nvdimm/blk.c
+++ b/drivers/nvdimm/blk.c
@@ -265,7 +265,9 @@ static int nsblk_attach_disk(struct nd_namespace_blk *nsblk)
 	}
 
 	set_capacity(disk, available_disk_size >> SECTOR_SHIFT);
-	device_add_disk(dev, disk, NULL);
+	rc = device_add_disk(dev, disk, NULL);
+	if (rc)
+		goto out_before_devm_err;
 
 	/* nd_blk_release_disk() is called if this fails */
 	if (devm_add_action_or_reset(dev, nd_blk_release_disk, disk))
-- 
2.30.2


