Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D174504BDC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 06:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306886.522150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJOj-0004nG-JY; Mon, 18 Apr 2022 04:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306886.522150; Mon, 18 Apr 2022 04:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngJOj-0004jA-9X; Mon, 18 Apr 2022 04:54:01 +0000
Received: by outflank-mailman (input) for mailman id 306886;
 Mon, 18 Apr 2022 04:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7HF=U4=bombadil.srs.infradead.org=BATV+786b5b18f0b4466cc734+6812+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1ngJOh-0001c8-3i
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 04:53:59 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8df91ea5-bed3-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 06:53:58 +0200 (CEST)
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngJOR-00FYpT-19; Mon, 18 Apr 2022 04:53:43 +0000
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
X-Inumbo-ID: 8df91ea5-bed3-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=p9kVzatrYS3rOQLSwSVe7hP5f0rChlSo2rdSBrIcPYE=; b=0FL1fru1SsYGhSt8FM9Hn5xwZJ
	EmQtcyxuckYmdCptFk4+/gbaxge3l3nq3kRFPBP2il/Rof09pxe6Ws2nfts4MKx5OwwmpIZVuaYn4
	QeXpjkKcOgL+kIGAlsZf8TM3L2foTyd4yXmmcS+vpt95vjmJlLA2Izx3NJJBScVt157v41DjhjlqM
	L7UcHqXMheEW+Am7Onu8gXnRyneCudkfEE0daVhQvCm9moV6YBkxEJJ4GpFmY1uJvO31vQEX3ElTE
	DJMzx/mYKMVBU0H0c+NGX3DON4EMSxBXtNngeE5dikTPdCHtE3RUwtmqsEkdAx9DNdwjKW/ddgcK7
	QLRmmVOw==;
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
Subject: [PATCH 09/11] nvme: remove a spurious clear of discard_alignment
Date: Mon, 18 Apr 2022 06:53:12 +0200
Message-Id: <20220418045314.360785-10-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220418045314.360785-1-hch@lst.de>
References: <20220418045314.360785-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The nvme driver never sets a discard_alignment, so it also doens't need
to clear it to zero.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index b9b0fbde97c80..76a9ccd5d064a 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1628,7 +1628,6 @@ static void nvme_config_discard(struct gendisk *disk, struct nvme_ns *ns)
 	BUILD_BUG_ON(PAGE_SIZE / sizeof(struct nvme_dsm_range) <
 			NVME_DSM_MAX_RANGES);
 
-	queue->limits.discard_alignment = 0;
 	queue->limits.discard_granularity = size;
 
 	/* If discard is already enabled, don't reset queue limits */
-- 
2.30.2


