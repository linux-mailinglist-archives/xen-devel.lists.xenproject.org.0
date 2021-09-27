Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 486D641A1FB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 00:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197201.350212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygS-00028Z-Bo; Mon, 27 Sep 2021 22:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197201.350212; Mon, 27 Sep 2021 22:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygS-00023f-6L; Mon, 27 Sep 2021 22:01:12 +0000
Received: by outflank-mailman (input) for mailman id 197201;
 Mon, 27 Sep 2021 22:01:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0LRd=OR=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mUygR-0000mS-ES
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 22:01:11 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38d858f2-84fe-4674-8f1f-42af4c0ee3ab;
 Mon, 27 Sep 2021 22:00:49 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyfw-004Suu-Fq; Mon, 27 Sep 2021 22:00:40 +0000
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
X-Inumbo-ID: 38d858f2-84fe-4674-8f1f-42af4c0ee3ab
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=DvHJoJ6f5lcZ7SxjJw+FCx0/QeyauIuzT+VR1mX8TXg=; b=elnPQS+ctA3KT/ki2GQVFEC0IV
	RTWRmV32tiJGwilpjX3SNpHglIJBAVIeGXZKH+X3ixYZ7S6APxsLuq0LBFdyBEm0bI5NylSr6YGJk
	QzCSLP3xfX3rbUJ7B1uiGuEVT/xJeyaVhGqxlGo2m9uPPj12ehaPIOrXhs5sc+AnUE0yB322PBODD
	eVZWnMKrVd6oBx/TZLLisZG4oTrBSlBnaHMoONzXuDEfAylMjbvMOj7kvRLv5BYXdpUYCctkN9jT4
	zAlwg4mNR2tncvqZkqop5VrsUe7e8ibXvwtwAWUbxE+wPFTxBdbc1EVxV5wEO/TWYCRG1WD3mm1Wl
	l3K/xSmA==;
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
Subject: [PATCH v2 04/10] nvdimm/btt: do not call del_gendisk() if not needed
Date: Mon, 27 Sep 2021 15:00:33 -0700
Message-Id: <20210927220039.1064193-5-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220039.1064193-1-mcgrof@kernel.org>
References: <20210927220039.1064193-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

We know we don't need del_gendisk() if we haven't added
the disk, so just skip it. This should fix a bug on older
kernels, as del_gendisk() became able to deal with
disks not added only recently, after the patch titled
"block: add flag for add_disk() completion notation".

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/nvdimm/btt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 52de60b7adee..29cc7325e890 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1538,7 +1538,6 @@ static int btt_blk_init(struct btt *btt)
 		int rc = nd_integrity_init(btt->btt_disk, btt_meta_size(btt));
 
 		if (rc) {
-			del_gendisk(btt->btt_disk);
 			blk_cleanup_disk(btt->btt_disk);
 			return rc;
 		}
-- 
2.30.2


