Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8522B4892
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:09:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28078.56746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keg8W-0000zy-9K; Mon, 16 Nov 2020 15:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28078.56746; Mon, 16 Nov 2020 15:09:44 +0000
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
	id 1keg8V-0000yK-Jg; Mon, 16 Nov 2020 15:09:43 +0000
Received: by outflank-mailman (input) for mailman id 28078;
 Mon, 16 Nov 2020 15:09:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1keg3x-0006ni-Cu
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:05:01 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 240846f7-9bd4-4522-b166-72cff2f224fb;
 Mon, 16 Nov 2020 15:00:06 +0000 (UTC)
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kefz0-0004Hn-7B; Mon, 16 Nov 2020 14:59:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DM7u=EW=casper.srs.infradead.org=batv+29a21e8ca386e11a5a78+6294+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1keg3x-0006ni-Cu
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:05:01 +0000
X-Inumbo-ID: 240846f7-9bd4-4522-b166-72cff2f224fb
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 240846f7-9bd4-4522-b166-72cff2f224fb;
	Mon, 16 Nov 2020 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hARJkWQlpNoJdj/vxwczaVdCfVVvfIUC8NDH/Nikt6k=; b=in7tsAV0pYzdDaH23WhnwAKR3R
	7xf04zdmNOdEtYs8arbN89y3kw4LApo5bLo3N/m4GrsdUYv2To+bUfGPGTQpzQd4TQGyrpK4e5lHC
	eCShsJJjHfdRG2ZVv14MPwihM8z3yu6kfNX1CiibXDctlXHH5jeZRUvheSFxZ/0kcEtUXIuEjWms/
	mhndsgiWlZLvqm1AI73/nDAEmdFQJYfIewjJl63lmaezSXoLWkADqyILaKsE+S6dzaUQc9rbYpEsZ
	grwi29hhSKISbnn7jD3DaEY2GFWHItE9E68g0ieNppWIL+4Ck8rzVBmAR0Eftf+VYl62odfp1ooaP
	Zg8s5EIQ==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefz0-0004Hn-7B; Mon, 16 Nov 2020 14:59:54 +0000
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
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 72/78] block: use disk_part_iter_exit in disk_part_iter_next
Date: Mon, 16 Nov 2020 15:58:03 +0100
Message-Id: <20201116145809.410558-73-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Call disk_part_iter_exit in disk_part_iter_next instead of duplicating
the functionality.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 999f7142b04e7d..56bc37e98ed852 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -230,8 +230,7 @@ struct hd_struct *disk_part_iter_next(struct disk_part_iter *piter)
 	int inc, end;
 
 	/* put the last partition */
-	disk_put_part(piter->part);
-	piter->part = NULL;
+	disk_part_iter_exit(piter);
 
 	/* get part_tbl */
 	rcu_read_lock();
-- 
2.29.2


