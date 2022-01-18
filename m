Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05416491FE1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 08:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258338.444727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9inA-0003M8-UW; Tue, 18 Jan 2022 07:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258338.444727; Tue, 18 Jan 2022 07:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9inA-0003E5-ML; Tue, 18 Jan 2022 07:20:32 +0000
Received: by outflank-mailman (input) for mailman id 258338;
 Tue, 18 Jan 2022 07:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lOsy=SC=bombadil.srs.infradead.org=BATV+4fe6c3c60fc7db690b35+6722+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1n9in8-0000in-V9
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 07:20:30 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d704ffd-782f-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 08:20:30 +0100 (CET)
Received: from [2001:4bb8:184:72a4:a4a9:19c0:5242:7768] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9imx-000ZVy-OM; Tue, 18 Jan 2022 07:20:20 +0000
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
X-Inumbo-ID: 1d704ffd-782f-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=4PJ62PiUSqVTEDu9t5XKsdWvml10LeApsJZhDuN6muM=; b=1E+EvGeCylmw2Vxy3ARjESgm0u
	xduERX2fZIaBPTxxD3bpnYc4v1N6UmjdrlzyCHGGfnsuxIuHLrKUXtO51CWfWIQAcVVwXLTh5FnlV
	Gt3+QjZJxoXDYS8TVAmqdcKUDIV4+4bkdbu/VIzMduOfwc6FPdWyp/Q+tvUuCWisZ4CCevQy56u1n
	fFFppvRSAhllXSRXrpSpzugykBDM+io31+WbLWv/f17f3bWqAcEeykuA1oh5iwqoomBJnvDjSSCmO
	2nt+odbBMt3GudvV8wNpiLLTQc/hG0kdLg0RiW3tYuoK2E3yolmAhAadHlKrfaIim1NoqZW6ynTHD
	H2w3iUtg==;
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.co>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-block@vger.kernel.org,
	dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org,
	ntfs3@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	drbd-dev@lists.linbit.com
Subject: [PATCH 09/19] drbd: bio_alloc can't fail if it is allow to sleep
Date: Tue, 18 Jan 2022 08:19:42 +0100
Message-Id: <20220118071952.1243143-10-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118071952.1243143-1-hch@lst.de>
References: <20220118071952.1243143-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Remove handling of NULL returns from sleeping bio_alloc calls given that
those can't fail.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_receiver.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 6df2539e215ba..90402abb77e93 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1281,14 +1281,13 @@ static void submit_one_flush(struct drbd_device *device, struct issue_flush_cont
 {
 	struct bio *bio = bio_alloc(GFP_NOIO, 0);
 	struct one_flush_context *octx = kmalloc(sizeof(*octx), GFP_NOIO);
-	if (!bio || !octx) {
-		drbd_warn(device, "Could not allocate a bio, CANNOT ISSUE FLUSH\n");
+
+	if (!octx) {
+		drbd_warn(device, "Could not allocate a octx, CANNOT ISSUE FLUSH\n");
 		/* FIXME: what else can I do now?  disconnecting or detaching
 		 * really does not help to improve the state of the world, either.
 		 */
-		kfree(octx);
-		if (bio)
-			bio_put(bio);
+		bio_put(bio);
 
 		ctx->error = -ENOMEM;
 		put_ldev(device);
@@ -1688,10 +1687,6 @@ int drbd_submit_peer_request(struct drbd_device *device,
 	 */
 next_bio:
 	bio = bio_alloc(GFP_NOIO, nr_pages);
-	if (!bio) {
-		drbd_err(device, "submit_ee: Allocation of a bio failed (nr_pages=%u)\n", nr_pages);
-		goto fail;
-	}
 	/* > peer_req->i.sector, unless this is the first bio */
 	bio->bi_iter.bi_sector = sector;
 	bio_set_dev(bio, device->ldev->backing_bdev);
@@ -1726,14 +1721,6 @@ int drbd_submit_peer_request(struct drbd_device *device,
 		drbd_submit_bio_noacct(device, fault_type, bio);
 	} while (bios);
 	return 0;
-
-fail:
-	while (bios) {
-		bio = bios;
-		bios = bios->bi_next;
-		bio_put(bio);
-	}
-	return err;
 }
 
 static void drbd_remove_epoch_entry_interval(struct drbd_device *device,
-- 
2.30.2


