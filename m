Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601396B97F3
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:28:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509666.785901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5dL-0004sZ-4u; Tue, 14 Mar 2023 14:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509666.785901; Tue, 14 Mar 2023 14:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5dL-0004qa-1a; Tue, 14 Mar 2023 14:28:11 +0000
Received: by outflank-mailman (input) for mailman id 509666;
 Tue, 14 Mar 2023 14:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6q5S=7G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pc5dJ-0003Pt-7s
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:28:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 700b305f-c274-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:28:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E472721C64;
 Tue, 14 Mar 2023 14:28:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B523C13A26;
 Tue, 14 Mar 2023 14:28:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c7PSKnaEEGTJHQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Mar 2023 14:28:06 +0000
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
X-Inumbo-ID: 700b305f-c274-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678804086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zEkV0KKFS11XXVqEf9jhtR2fN1YoNqxonAwEeQxw4s=;
	b=l0QTSYHFh/JivXw+osBjNn21s5R3lRFmR9Oj6r6PZGQHRM/5+BKk1Sp64V6BCAy3lzvs5R
	3aBOzw9tLKmQUHC1MoAelABg3epuWR5hZqVejuwdUvX3Jo3NZBAGkqcs3WcZteYXX1tXnv
	L/PKbobwmaT70QsnpbQXKm3/cbaKuFA=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 4/4] xen/blkback: move blkif_get_x86_*_req() into blkback.c
Date: Tue, 14 Mar 2023 15:27:41 +0100
Message-Id: <20230314142741.24917-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230314142741.24917-1-jgross@suse.com>
References: <20230314142741.24917-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is no need to have the functions blkif_get_x86_32_req() and
blkif_get_x86_64_req() in a header file, as they are used in one place
only.

So move them into the using source file and drop the inline qualifier.

While at it fix some style issues, and simplify the code by variable
reusing and using min() instead of open coding it.

Instead of using barrier() use READ_ONCE() for avoiding multiple reads
of nr_segments.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
V2:
- add const, use unsigned int for loop counters (Roger Pau Monné)
---
 drivers/block/xen-blkback/blkback.c | 104 ++++++++++++++++++++++++++++
 drivers/block/xen-blkback/common.h  |  96 -------------------------
 2 files changed, 104 insertions(+), 96 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 243712b59a05..ab6308b2d328 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -1072,7 +1072,111 @@ static void end_block_io_op(struct bio *bio)
 	bio_put(bio);
 }
 
+static void blkif_get_x86_32_req(struct blkif_request *dst,
+				 const struct blkif_x86_32_request *src)
+{
+	unsigned int i, n;
+
+	dst->operation = READ_ONCE(src->operation);
+
+	switch (dst->operation) {
+	case BLKIF_OP_READ:
+	case BLKIF_OP_WRITE:
+	case BLKIF_OP_WRITE_BARRIER:
+	case BLKIF_OP_FLUSH_DISKCACHE:
+		dst->u.rw.nr_segments = READ_ONCE(src->u.rw.nr_segments);
+		dst->u.rw.handle = src->u.rw.handle;
+		dst->u.rw.id = src->u.rw.id;
+		dst->u.rw.sector_number = src->u.rw.sector_number;
+		n = min_t(unsigned int, BLKIF_MAX_SEGMENTS_PER_REQUEST,
+			  dst->u.rw.nr_segments);
+		for (i = 0; i < n; i++)
+			dst->u.rw.seg[i] = src->u.rw.seg[i];
+		break;
+
+	case BLKIF_OP_DISCARD:
+		dst->u.discard.flag = src->u.discard.flag;
+		dst->u.discard.id = src->u.discard.id;
+		dst->u.discard.sector_number = src->u.discard.sector_number;
+		dst->u.discard.nr_sectors = src->u.discard.nr_sectors;
+		break;
+
+	case BLKIF_OP_INDIRECT:
+		dst->u.indirect.indirect_op = src->u.indirect.indirect_op;
+		dst->u.indirect.nr_segments =
+			READ_ONCE(src->u.indirect.nr_segments);
+		dst->u.indirect.handle = src->u.indirect.handle;
+		dst->u.indirect.id = src->u.indirect.id;
+		dst->u.indirect.sector_number = src->u.indirect.sector_number;
+		n = min(MAX_INDIRECT_PAGES,
+			INDIRECT_PAGES(dst->u.indirect.nr_segments));
+		for (i = 0; i < n; i++)
+			dst->u.indirect.indirect_grefs[i] =
+				src->u.indirect.indirect_grefs[i];
+		break;
+
+	default:
+		/*
+		 * Don't know how to translate this op. Only get the
+		 * ID so failure can be reported to the frontend.
+		 */
+		dst->u.other.id = src->u.other.id;
+		break;
+	}
+}
 
+static void blkif_get_x86_64_req(struct blkif_request *dst,
+				 struct blkif_x86_64_request *src)
+{
+	int i, n;
+
+	dst->operation = READ_ONCE(src->operation);
+
+	switch (dst->operation) {
+	case BLKIF_OP_READ:
+	case BLKIF_OP_WRITE:
+	case BLKIF_OP_WRITE_BARRIER:
+	case BLKIF_OP_FLUSH_DISKCACHE:
+		dst->u.rw.nr_segments = READ_ONCE(src->u.rw.nr_segments);
+		dst->u.rw.handle = src->u.rw.handle;
+		dst->u.rw.id = src->u.rw.id;
+		dst->u.rw.sector_number = src->u.rw.sector_number;
+		n = min_t(int, BLKIF_MAX_SEGMENTS_PER_REQUEST,
+			  dst->u.rw.nr_segments);
+		for (i = 0; i < n; i++)
+			dst->u.rw.seg[i] = src->u.rw.seg[i];
+		break;
+
+	case BLKIF_OP_DISCARD:
+		dst->u.discard.flag = src->u.discard.flag;
+		dst->u.discard.id = src->u.discard.id;
+		dst->u.discard.sector_number = src->u.discard.sector_number;
+		dst->u.discard.nr_sectors = src->u.discard.nr_sectors;
+		break;
+
+	case BLKIF_OP_INDIRECT:
+		dst->u.indirect.indirect_op = src->u.indirect.indirect_op;
+		dst->u.indirect.nr_segments =
+			READ_ONCE(src->u.indirect.nr_segments);
+		dst->u.indirect.handle = src->u.indirect.handle;
+		dst->u.indirect.id = src->u.indirect.id;
+		dst->u.indirect.sector_number = src->u.indirect.sector_number;
+		n = min(MAX_INDIRECT_PAGES,
+			INDIRECT_PAGES(dst->u.indirect.nr_segments));
+		for (i = 0; i < n; i++)
+			dst->u.indirect.indirect_grefs[i] =
+				src->u.indirect.indirect_grefs[i];
+		break;
+
+	default:
+		/*
+		 * Don't know how to translate this op. Only get the
+		 * ID so failure can be reported to the frontend.
+		 */
+		dst->u.other.id = src->u.other.id;
+		break;
+	}
+}
 
 /*
  * Function to copy the from the ring buffer the 'struct blkif_request'
diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index fab8a8dee0da..40f67bfc052d 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -394,100 +394,4 @@ int xen_blkbk_barrier(struct xenbus_transaction xbt,
 struct xenbus_device *xen_blkbk_xenbus(struct backend_info *be);
 void xen_blkbk_unmap_purged_grants(struct work_struct *work);
 
-static inline void blkif_get_x86_32_req(struct blkif_request *dst,
-					struct blkif_x86_32_request *src)
-{
-	int i, n = BLKIF_MAX_SEGMENTS_PER_REQUEST, j;
-	dst->operation = READ_ONCE(src->operation);
-	switch (dst->operation) {
-	case BLKIF_OP_READ:
-	case BLKIF_OP_WRITE:
-	case BLKIF_OP_WRITE_BARRIER:
-	case BLKIF_OP_FLUSH_DISKCACHE:
-		dst->u.rw.nr_segments = src->u.rw.nr_segments;
-		dst->u.rw.handle = src->u.rw.handle;
-		dst->u.rw.id = src->u.rw.id;
-		dst->u.rw.sector_number = src->u.rw.sector_number;
-		barrier();
-		if (n > dst->u.rw.nr_segments)
-			n = dst->u.rw.nr_segments;
-		for (i = 0; i < n; i++)
-			dst->u.rw.seg[i] = src->u.rw.seg[i];
-		break;
-	case BLKIF_OP_DISCARD:
-		dst->u.discard.flag = src->u.discard.flag;
-		dst->u.discard.id = src->u.discard.id;
-		dst->u.discard.sector_number = src->u.discard.sector_number;
-		dst->u.discard.nr_sectors = src->u.discard.nr_sectors;
-		break;
-	case BLKIF_OP_INDIRECT:
-		dst->u.indirect.indirect_op = src->u.indirect.indirect_op;
-		dst->u.indirect.nr_segments = src->u.indirect.nr_segments;
-		dst->u.indirect.handle = src->u.indirect.handle;
-		dst->u.indirect.id = src->u.indirect.id;
-		dst->u.indirect.sector_number = src->u.indirect.sector_number;
-		barrier();
-		j = min(MAX_INDIRECT_PAGES, INDIRECT_PAGES(dst->u.indirect.nr_segments));
-		for (i = 0; i < j; i++)
-			dst->u.indirect.indirect_grefs[i] =
-				src->u.indirect.indirect_grefs[i];
-		break;
-	default:
-		/*
-		 * Don't know how to translate this op. Only get the
-		 * ID so failure can be reported to the frontend.
-		 */
-		dst->u.other.id = src->u.other.id;
-		break;
-	}
-}
-
-static inline void blkif_get_x86_64_req(struct blkif_request *dst,
-					struct blkif_x86_64_request *src)
-{
-	int i, n = BLKIF_MAX_SEGMENTS_PER_REQUEST, j;
-	dst->operation = READ_ONCE(src->operation);
-	switch (dst->operation) {
-	case BLKIF_OP_READ:
-	case BLKIF_OP_WRITE:
-	case BLKIF_OP_WRITE_BARRIER:
-	case BLKIF_OP_FLUSH_DISKCACHE:
-		dst->u.rw.nr_segments = src->u.rw.nr_segments;
-		dst->u.rw.handle = src->u.rw.handle;
-		dst->u.rw.id = src->u.rw.id;
-		dst->u.rw.sector_number = src->u.rw.sector_number;
-		barrier();
-		if (n > dst->u.rw.nr_segments)
-			n = dst->u.rw.nr_segments;
-		for (i = 0; i < n; i++)
-			dst->u.rw.seg[i] = src->u.rw.seg[i];
-		break;
-	case BLKIF_OP_DISCARD:
-		dst->u.discard.flag = src->u.discard.flag;
-		dst->u.discard.id = src->u.discard.id;
-		dst->u.discard.sector_number = src->u.discard.sector_number;
-		dst->u.discard.nr_sectors = src->u.discard.nr_sectors;
-		break;
-	case BLKIF_OP_INDIRECT:
-		dst->u.indirect.indirect_op = src->u.indirect.indirect_op;
-		dst->u.indirect.nr_segments = src->u.indirect.nr_segments;
-		dst->u.indirect.handle = src->u.indirect.handle;
-		dst->u.indirect.id = src->u.indirect.id;
-		dst->u.indirect.sector_number = src->u.indirect.sector_number;
-		barrier();
-		j = min(MAX_INDIRECT_PAGES, INDIRECT_PAGES(dst->u.indirect.nr_segments));
-		for (i = 0; i < j; i++)
-			dst->u.indirect.indirect_grefs[i] =
-				src->u.indirect.indirect_grefs[i];
-		break;
-	default:
-		/*
-		 * Don't know how to translate this op. Only get the
-		 * ID so failure can be reported to the frontend.
-		 */
-		dst->u.other.id = src->u.other.id;
-		break;
-	}
-}
-
 #endif /* __XEN_BLKIF__BACKEND__COMMON_H__ */
-- 
2.35.3


