Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17433BFA88
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 14:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153071.282800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1TNp-00067R-SQ; Thu, 08 Jul 2021 12:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153071.282800; Thu, 08 Jul 2021 12:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1TNp-00064R-P9; Thu, 08 Jul 2021 12:44:01 +0000
Received: by outflank-mailman (input) for mailman id 153071;
 Thu, 08 Jul 2021 12:44:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pQIU=MA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m1TNo-0005Vi-Gc
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 12:44:00 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d8c5b08-7436-465e-b966-aadad158685b;
 Thu, 08 Jul 2021 12:43:54 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C3DB2198B;
 Thu,  8 Jul 2021 12:43:54 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id BC119133FE;
 Thu,  8 Jul 2021 12:43:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ADi5LAnz5mCCYAAAGKfGzw
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
X-Inumbo-ID: 2d8c5b08-7436-465e-b966-aadad158685b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1625748234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P4npa89ZahTLG6OBPNclvRbrcVBcLwXWzLAhBZSh1SY=;
	b=kQxNjstg82kL4O4ZbGnRoUnxhb1jfiG/cNcdtcWx6GOnVEHDD/BIvDQn1QL50wL2g7eREQ
	KqL6OG17bCJJPC/EAF6ca9HUJFjNj1LV9M3DbH3D37UtCY2ggjLGBQkostZ7F+AZ7jDqdi
	6YlCyZaiFi82VevtT4x4ee0iMGO5qiQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 2/3] xen/blkfront: don't take local copy of a request from the ring page
Date: Thu,  8 Jul 2021 14:43:44 +0200
Message-Id: <20210708124345.10173-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210708124345.10173-1-jgross@suse.com>
References: <20210708124345.10173-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to avoid a malicious backend being able to influence the local
copy of a request build the request locally first and then copy it to
the ring page instead of doing it the other way round as today.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- init variable to avoid potential compiler warning (Jan Beulich)
---
 drivers/block/xen-blkfront.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 86356014d35e..80701860870a 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -546,7 +546,7 @@ static unsigned long blkif_ring_get_request(struct blkfront_ring_info *rinfo,
 	rinfo->shadow[id].status = REQ_WAITING;
 	rinfo->shadow[id].associated_id = NO_ASSOCIATED_ID;
 
-	(*ring_req)->u.rw.id = id;
+	rinfo->shadow[id].req.u.rw.id = id;
 
 	return id;
 }
@@ -554,11 +554,12 @@ static unsigned long blkif_ring_get_request(struct blkfront_ring_info *rinfo,
 static int blkif_queue_discard_req(struct request *req, struct blkfront_ring_info *rinfo)
 {
 	struct blkfront_info *info = rinfo->dev_info;
-	struct blkif_request *ring_req;
+	struct blkif_request *ring_req, *final_ring_req;
 	unsigned long id;
 
 	/* Fill out a communications ring structure. */
-	id = blkif_ring_get_request(rinfo, req, &ring_req);
+	id = blkif_ring_get_request(rinfo, req, &final_ring_req);
+	ring_req = &rinfo->shadow[id].req;
 
 	ring_req->operation = BLKIF_OP_DISCARD;
 	ring_req->u.discard.nr_sectors = blk_rq_sectors(req);
@@ -569,8 +570,8 @@ static int blkif_queue_discard_req(struct request *req, struct blkfront_ring_inf
 	else
 		ring_req->u.discard.flag = 0;
 
-	/* Keep a private copy so we can reissue requests when recovering. */
-	rinfo->shadow[id].req = *ring_req;
+	/* Copy the request to the ring page. */
+	*final_ring_req = *ring_req;
 
 	return 0;
 }
@@ -703,6 +704,7 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
 {
 	struct blkfront_info *info = rinfo->dev_info;
 	struct blkif_request *ring_req, *extra_ring_req = NULL;
+	struct blkif_request *final_ring_req, *final_extra_ring_req = NULL;
 	unsigned long id, extra_id = NO_ASSOCIATED_ID;
 	bool require_extra_req = false;
 	int i;
@@ -747,7 +749,8 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
 	}
 
 	/* Fill out a communications ring structure. */
-	id = blkif_ring_get_request(rinfo, req, &ring_req);
+	id = blkif_ring_get_request(rinfo, req, &final_ring_req);
+	ring_req = &rinfo->shadow[id].req;
 
 	num_sg = blk_rq_map_sg(req->q, req, rinfo->shadow[id].sg);
 	num_grant = 0;
@@ -798,7 +801,9 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
 		ring_req->u.rw.nr_segments = num_grant;
 		if (unlikely(require_extra_req)) {
 			extra_id = blkif_ring_get_request(rinfo, req,
-							  &extra_ring_req);
+							  &final_extra_ring_req);
+			extra_ring_req = &rinfo->shadow[extra_id].req;
+
 			/*
 			 * Only the first request contains the scatter-gather
 			 * list.
@@ -840,10 +845,10 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
 	if (setup.segments)
 		kunmap_atomic(setup.segments);
 
-	/* Keep a private copy so we can reissue requests when recovering. */
-	rinfo->shadow[id].req = *ring_req;
+	/* Copy request(s) to the ring page. */
+	*final_ring_req = *ring_req;
 	if (unlikely(require_extra_req))
-		rinfo->shadow[extra_id].req = *extra_ring_req;
+		*final_extra_ring_req = *extra_ring_req;
 
 	if (new_persistent_gnts)
 		gnttab_free_grant_references(setup.gref_head);
-- 
2.26.2


