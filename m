Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179DF2C276C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36043.67795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYO6-0001WR-TB; Tue, 24 Nov 2020 13:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36043.67795; Tue, 24 Nov 2020 13:29:42 +0000
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
	id 1khYO6-0001Vm-Mc; Tue, 24 Nov 2020 13:29:42 +0000
Received: by outflank-mailman (input) for mailman id 36043;
 Tue, 24 Nov 2020 13:29:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1khYO3-0000Qf-2g
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:29:39 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c38a68e8-be03-497f-9f6d-02fcc4642a2d;
 Tue, 24 Nov 2020 13:28:41 +0000 (UTC)
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMe-0006WC-FD; Tue, 24 Nov 2020 13:28:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=daQ6=E6=casper.srs.infradead.org=batv+cbe268a5dfa7b983a02e+6302+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1khYO3-0000Qf-2g
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:29:39 +0000
X-Inumbo-ID: c38a68e8-be03-497f-9f6d-02fcc4642a2d
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c38a68e8-be03-497f-9f6d-02fcc4642a2d;
	Tue, 24 Nov 2020 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/O13+dcLk1L7JyoO+1N94KNWJ8AA8wxdNDwugfkz49U=; b=T0mbtousMy3gTU4W+Hav1SXmPG
	ntoJpVsr1rVrypAPqknRPUnpesJSMBrUc00lVI6rw9tW7L0UTd5qDYChjsDIp5I+2p9rgRfczorvW
	myNaorvAqWHtFI8YzROhDDUSGaAL1oE03jbsWr7RUeag8w/Fra4vYKypkXrsbnoMydets0qq/jCNw
	kAWVxaa3y0zHwqhTRdVwYBa7yrqO3jWUl7tXKnrMDreCJh9HnCSyQhcMGVcHEbB5RfozmnnymLj8T
	T8hSeMtKcFNU6MG3WPtXCg75QSQ31Et+ZdTKD3UyLrPnveQ8KHIGAcZK2WiJCk91FG4lz+px4829j
	pUPMLhxA==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYMe-0006WC-FD; Tue, 24 Nov 2020 13:28:12 +0000
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
Subject: [PATCH 12/45] block: remove a superflous check in blkpg_do_ioctl
Date: Tue, 24 Nov 2020 14:27:18 +0100
Message-Id: <20201124132751.3747337-13-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

sector_t is now always a u64, so this check is not needed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/ioctl.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/block/ioctl.c b/block/ioctl.c
index 6b785181344fe1..0c09bb7a6ff35f 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -35,15 +35,6 @@ static int blkpg_do_ioctl(struct block_device *bdev,
 	start = p.start >> SECTOR_SHIFT;
 	length = p.length >> SECTOR_SHIFT;
 
-	/* check for fit in a hd_struct */
-	if (sizeof(sector_t) < sizeof(long long)) {
-		long pstart = start, plength = length;
-
-		if (pstart != start || plength != length || pstart < 0 ||
-		    plength < 0 || p.pno > 65535)
-			return -EINVAL;
-	}
-
 	switch (op) {
 	case BLKPG_ADD_PARTITION:
 		/* check if partition is aligned to blocksize */
-- 
2.29.2


