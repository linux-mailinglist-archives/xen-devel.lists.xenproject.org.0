Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D344B85B5CD
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683235.1062670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLot-0007KT-3O; Tue, 20 Feb 2024 08:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683235.1062670; Tue, 20 Feb 2024 08:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLos-0007Gc-Up; Tue, 20 Feb 2024 08:49:42 +0000
Received: by outflank-mailman (input) for mailman id 683235;
 Tue, 20 Feb 2024 08:49:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDQo=J5=bombadil.srs.infradead.org=BATV+d5dc426667c65ded4f96+7485+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rcLor-0006U9-2J
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:49:41 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fba6f962-cfcc-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 09:49:40 +0100 (CET)
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rcLoo-0000000DnUj-02wS; Tue, 20 Feb 2024 08:49:38 +0000
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
X-Inumbo-ID: fba6f962-cfcc-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-Type:Content-ID:Content-Description;
	bh=qK76sLiKHDaIugADThNdCeAdCITdHp3R7WCpvZ/50Ys=; b=q+Xuv9UDwXHK+tkLGsYolzNTXG
	R4i+Mt0BZDHHWj0bFjoTaTV4Uf+ZLRjvOqwQnQ1QjdrjASB6LM+HWRzK56SCswy2aYtxd+lwQfOUz
	M1bu2VrcT7cgwkCOsvMNYemtsmevCZLF7gegxUDWG7sE9LYMV7Jb7xt7TyJ/9iUSdR4RG5IIK1ajt
	m5YEP4N9yEmyRAdoE62Vt5brNcei+BJohjnoWUwfYatrm4fKoPJDech8QrTVHR7nWoGlpFKJoBK6e
	/0W1zm/+qrYqHmXJDwLThtVyh3O1D/IfYEdgsCSgxxBHtaCdU8NUXUWYRwFAljvbygirx8S5992Sk
	E75cYLdg==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: [PATCH 3/4] xen-blkfront: don't redundantly set max_sements in blkif_recover
Date: Tue, 20 Feb 2024 09:49:34 +0100
Message-Id: <20240220084935.3282351-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220084935.3282351-1-hch@lst.de>
References: <20240220084935.3282351-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

blkif_set_queue_limits already sets the max_sements limits, so don't do
it a second time.  Also remove a comment about a long fixe bug in
blk_mq_update_nr_hw_queues.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/xen-blkfront.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 1258f24b285500..7664638a0abbfa 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2008,14 +2008,10 @@ static int blkif_recover(struct blkfront_info *info)
 	struct request *req, *n;
 	int rc;
 	struct bio *bio;
-	unsigned int segs;
 	struct blkfront_ring_info *rinfo;
 
 	blkfront_gather_backend_features(info);
-	/* Reset limits changed by blk_mq_update_nr_hw_queues(). */
 	blkif_set_queue_limits(info);
-	segs = info->max_indirect_segments ? : BLKIF_MAX_SEGMENTS_PER_REQUEST;
-	blk_queue_max_segments(info->rq, segs / GRANTS_PER_PSEG);
 
 	for_each_rinfo(info, rinfo, r_index) {
 		rc = blkfront_setup_indirect(rinfo);
@@ -2035,7 +2031,9 @@ static int blkif_recover(struct blkfront_info *info)
 	list_for_each_entry_safe(req, n, &info->requests, queuelist) {
 		/* Requeue pending requests (flush or discard) */
 		list_del_init(&req->queuelist);
-		BUG_ON(req->nr_phys_segments > segs);
+		BUG_ON(req->nr_phys_segments >
+		       (info->max_indirect_segments ? :
+			BLKIF_MAX_SEGMENTS_PER_REQUEST));
 		blk_mq_requeue_request(req, false);
 	}
 	blk_mq_start_stopped_hw_queues(info->rq, true);
-- 
2.39.2


