Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7C0504BDA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 06:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306880.522127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJOd-0003nW-Cc; Mon, 18 Apr 2022 04:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306880.522127; Mon, 18 Apr 2022 04:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJOd-0003gx-5f; Mon, 18 Apr 2022 04:53:55 +0000
Received: by outflank-mailman (input) for mailman id 306880;
 Mon, 18 Apr 2022 04:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7HF=U4=bombadil.srs.infradead.org=BATV+786b5b18f0b4466cc734+6812+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1ngJOb-0001do-RW
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 04:53:53 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b1b7e18-bed3-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 06:53:53 +0200 (CEST)
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngJOK-00FYlu-W5; Mon, 18 Apr 2022 04:53:37 +0000
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
X-Inumbo-ID: 8b1b7e18-bed3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=rEun4CykQNh9XCzIn07hcf266lJSo8SoQFV5h3aZDN4=; b=Iyi59rQ8jx9ZFvYgDjqU1HKgI3
	3ER3HIO6el0yfwsbhwUqMaebwGQMLJp2Ty8pfApDcdy/dox4NBRD0zlAwgVZHz3C//ttRe2EpMMpE
	TlYo85CuBa66xfYMYNTFqP97nYG9E4UMoh/+mq+XldHcgyiYn8t88j0p38CFlHyG1WnflGfc9N6IQ
	ALupyQSKl6Do9NriswZQgpSbmVhWvg3qZzOpBx8BeEjzA/SfHSRhmM03Xd44QDRw6m5kWouXbMQLj
	EsfQEvQ7/s2jVpOeH9ws1tRZrnKNo3KfR2dNjEk6WSbmEVrg/W3E52Bl0bOqmREpLbkSwxlK3mr9T
	SboayqTg==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Song Liu <song@kernel.org>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	dm-devel@redhat.com
Subject: [PATCH 07/11] dasd: don't set the discard_alignment queue limit
Date: Mon, 18 Apr 2022 06:53:10 +0200
Message-Id: <20220418045314.360785-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220418045314.360785-1-hch@lst.de>
References: <20220418045314.360785-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The discard_alignment queue limit is named a bit misleading means the
offset into the block device at which the discard granularity starts.
Setting it to PAGE_SIZE while the discard granularity is the block size
that is smaller or the same as PAGE_SIZE as done by dasd is mostly
harmless but also useless.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/s390/block/dasd_fba.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/s390/block/dasd_fba.c b/drivers/s390/block/dasd_fba.c
index 8bd5665db9198..60be7f7bf2d16 100644
--- a/drivers/s390/block/dasd_fba.c
+++ b/drivers/s390/block/dasd_fba.c
@@ -782,7 +782,6 @@ static void dasd_fba_setup_blk_queue(struct dasd_block *block)
 	blk_queue_segment_boundary(q, PAGE_SIZE - 1);
 
 	q->limits.discard_granularity = logical_block_size;
-	q->limits.discard_alignment = PAGE_SIZE;
 
 	/* Calculate max_discard_sectors and make it PAGE aligned */
 	max_bytes = USHRT_MAX * logical_block_size;
-- 
2.30.2


