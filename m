Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424F43BFA85
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 14:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153072.282811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1TNv-0006Uv-7z; Thu, 08 Jul 2021 12:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153072.282811; Thu, 08 Jul 2021 12:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1TNv-0006Qq-4b; Thu, 08 Jul 2021 12:44:07 +0000
Received: by outflank-mailman (input) for mailman id 153072;
 Thu, 08 Jul 2021 12:44:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pQIU=MA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m1TNt-0005Vi-Gv
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 12:44:05 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42a12c1b-72d6-410e-91d3-2d6cb7fc8d93;
 Thu, 08 Jul 2021 12:43:54 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B74A62196E;
 Thu,  8 Jul 2021 12:43:53 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 74C2912FF6;
 Thu,  8 Jul 2021 12:43:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id EARJGwnz5mCCYAAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 08 Jul 2021 12:43:53 +0000
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
X-Inumbo-ID: 42a12c1b-72d6-410e-91d3-2d6cb7fc8d93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1625748233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6XFRHPnaBepuoc+g0wkn7qafVkVXfKovIiQKKuCigY0=;
	b=BXFPPPGLMorJwQJ/GBAcYquuPoBZv0JZuWqXHV8Uakpm4PYoIFYsrVZaXWXbkIe5qsl0d2
	moJj/mx6I15y4Zg+tYjoRLtiw/NSzyzKZN7QTWu0Wv936j8y3qEQ+YbeEsxVJyIy7y60m9
	3wbGtStlqlhO9oeX43eCEorvroh4ff4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 1/3] xen/blkfront: read response from backend only once
Date: Thu,  8 Jul 2021 14:43:43 +0200
Message-Id: <20210708124345.10173-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210708124345.10173-1-jgross@suse.com>
References: <20210708124345.10173-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to avoid problems in case the backend is modifying a response
on the ring page while the frontend has already seen it, just read the
response into a local buffer in one go and then operate on that buffer
only.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 drivers/block/xen-blkfront.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 8d49f8fa98bb..86356014d35e 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1539,7 +1539,7 @@ static bool blkif_completion(unsigned long *id,
 static irqreturn_t blkif_interrupt(int irq, void *dev_id)
 {
 	struct request *req;
-	struct blkif_response *bret;
+	struct blkif_response bret;
 	RING_IDX i, rp;
 	unsigned long flags;
 	struct blkfront_ring_info *rinfo = (struct blkfront_ring_info *)dev_id;
@@ -1556,8 +1556,9 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
 	for (i = rinfo->ring.rsp_cons; i != rp; i++) {
 		unsigned long id;
 
-		bret = RING_GET_RESPONSE(&rinfo->ring, i);
-		id   = bret->id;
+		RING_COPY_RESPONSE(&rinfo->ring, i, &bret);
+		id = bret.id;
+
 		/*
 		 * The backend has messed up and given us an id that we would
 		 * never have given to it (we stamp it up to BLK_RING_SIZE -
@@ -1565,39 +1566,39 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
 		 */
 		if (id >= BLK_RING_SIZE(info)) {
 			WARN(1, "%s: response to %s has incorrect id (%ld)\n",
-			     info->gd->disk_name, op_name(bret->operation), id);
+			     info->gd->disk_name, op_name(bret.operation), id);
 			/* We can't safely get the 'struct request' as
 			 * the id is busted. */
 			continue;
 		}
 		req  = rinfo->shadow[id].request;
 
-		if (bret->operation != BLKIF_OP_DISCARD) {
+		if (bret.operation != BLKIF_OP_DISCARD) {
 			/*
 			 * We may need to wait for an extra response if the
 			 * I/O request is split in 2
 			 */
-			if (!blkif_completion(&id, rinfo, bret))
+			if (!blkif_completion(&id, rinfo, &bret))
 				continue;
 		}
 
 		if (add_id_to_freelist(rinfo, id)) {
 			WARN(1, "%s: response to %s (id %ld) couldn't be recycled!\n",
-			     info->gd->disk_name, op_name(bret->operation), id);
+			     info->gd->disk_name, op_name(bret.operation), id);
 			continue;
 		}
 
-		if (bret->status == BLKIF_RSP_OKAY)
+		if (bret.status == BLKIF_RSP_OKAY)
 			blkif_req(req)->error = BLK_STS_OK;
 		else
 			blkif_req(req)->error = BLK_STS_IOERR;
 
-		switch (bret->operation) {
+		switch (bret.operation) {
 		case BLKIF_OP_DISCARD:
-			if (unlikely(bret->status == BLKIF_RSP_EOPNOTSUPP)) {
+			if (unlikely(bret.status == BLKIF_RSP_EOPNOTSUPP)) {
 				struct request_queue *rq = info->rq;
 				printk(KERN_WARNING "blkfront: %s: %s op failed\n",
-					   info->gd->disk_name, op_name(bret->operation));
+					   info->gd->disk_name, op_name(bret.operation));
 				blkif_req(req)->error = BLK_STS_NOTSUPP;
 				info->feature_discard = 0;
 				info->feature_secdiscard = 0;
@@ -1607,15 +1608,15 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
 			break;
 		case BLKIF_OP_FLUSH_DISKCACHE:
 		case BLKIF_OP_WRITE_BARRIER:
-			if (unlikely(bret->status == BLKIF_RSP_EOPNOTSUPP)) {
+			if (unlikely(bret.status == BLKIF_RSP_EOPNOTSUPP)) {
 				printk(KERN_WARNING "blkfront: %s: %s op failed\n",
-				       info->gd->disk_name, op_name(bret->operation));
+				       info->gd->disk_name, op_name(bret.operation));
 				blkif_req(req)->error = BLK_STS_NOTSUPP;
 			}
-			if (unlikely(bret->status == BLKIF_RSP_ERROR &&
+			if (unlikely(bret.status == BLKIF_RSP_ERROR &&
 				     rinfo->shadow[id].req.u.rw.nr_segments == 0)) {
 				printk(KERN_WARNING "blkfront: %s: empty %s op failed\n",
-				       info->gd->disk_name, op_name(bret->operation));
+				       info->gd->disk_name, op_name(bret.operation));
 				blkif_req(req)->error = BLK_STS_NOTSUPP;
 			}
 			if (unlikely(blkif_req(req)->error)) {
@@ -1628,9 +1629,9 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
 			fallthrough;
 		case BLKIF_OP_READ:
 		case BLKIF_OP_WRITE:
-			if (unlikely(bret->status != BLKIF_RSP_OKAY))
+			if (unlikely(bret.status != BLKIF_RSP_OKAY))
 				dev_dbg(&info->xbdev->dev, "Bad return from blkdev data "
-					"request: %x\n", bret->status);
+					"request: %x\n", bret.status);
 
 			break;
 		default:
-- 
2.26.2


