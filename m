Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C090508BA7
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309349.525505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBxy-00049U-AA; Wed, 20 Apr 2022 15:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309349.525505; Wed, 20 Apr 2022 15:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBxy-00046K-6K; Wed, 20 Apr 2022 15:10:02 +0000
Received: by outflank-mailman (input) for mailman id 309349;
 Wed, 20 Apr 2022 15:10:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhBxw-0003l4-Ly
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:10:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1ad0c12-c0bb-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 17:09:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C16421115;
 Wed, 20 Apr 2022 15:09:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6227213AE0;
 Wed, 20 Apr 2022 15:09:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aMK0FkYiYGJILQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:09:58 +0000
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
X-Inumbo-ID: f1ad0c12-c0bb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650467398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8T6Z7jV+2E1LG0Lx6kFTGECOTx+ZZjBB+fMJq4VZyPo=;
	b=WF4b9n87A3M7HYOr+N4ZjOY+Cgid8wI0c6irsUK8+pQROZTqJnInO/MAVODMUxLWX9V4V0
	Z+LcPet04JF89QS0wEomkfON2JmmAd36vHuHA/rqkTO0zUey1+1KZplpI+cvYdc6r6WSe9
	cji3xX1G6SjGEefquTF4b8p4MGSO6uo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 01/18] xen/blkfront: switch blkfront to use INVALID_GRANT_REF
Date: Wed, 20 Apr 2022 17:09:25 +0200
Message-Id: <20220420150942.31235-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420150942.31235-1-jgross@suse.com>
References: <20220420150942.31235-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a private macro for an invalid grant reference use
the common one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/block/xen-blkfront.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 003056d4f7f5..7f35e30e626a 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -229,8 +229,6 @@ static unsigned int nr_minors;
 static unsigned long *minors;
 static DEFINE_SPINLOCK(minor_lock);
 
-#define GRANT_INVALID_REF	0
-
 #define PARTS_PER_DISK		16
 #define PARTS_PER_EXT_DISK      256
 
@@ -321,7 +319,7 @@ static int fill_grant_buffer(struct blkfront_ring_info *rinfo, int num)
 			gnt_list_entry->page = granted_page;
 		}
 
-		gnt_list_entry->gref = GRANT_INVALID_REF;
+		gnt_list_entry->gref = INVALID_GRANT_REF;
 		list_add(&gnt_list_entry->node, &rinfo->grants);
 		i++;
 	}
@@ -350,7 +348,7 @@ static struct grant *get_free_grant(struct blkfront_ring_info *rinfo)
 					  node);
 	list_del(&gnt_list_entry->node);
 
-	if (gnt_list_entry->gref != GRANT_INVALID_REF)
+	if (gnt_list_entry->gref != INVALID_GRANT_REF)
 		rinfo->persistent_gnts_c--;
 
 	return gnt_list_entry;
@@ -372,7 +370,7 @@ static struct grant *get_grant(grant_ref_t *gref_head,
 	struct grant *gnt_list_entry = get_free_grant(rinfo);
 	struct blkfront_info *info = rinfo->dev_info;
 
-	if (gnt_list_entry->gref != GRANT_INVALID_REF)
+	if (gnt_list_entry->gref != INVALID_GRANT_REF)
 		return gnt_list_entry;
 
 	/* Assign a gref to this page */
@@ -396,7 +394,7 @@ static struct grant *get_indirect_grant(grant_ref_t *gref_head,
 	struct grant *gnt_list_entry = get_free_grant(rinfo);
 	struct blkfront_info *info = rinfo->dev_info;
 
-	if (gnt_list_entry->gref != GRANT_INVALID_REF)
+	if (gnt_list_entry->gref != INVALID_GRANT_REF)
 		return gnt_list_entry;
 
 	/* Assign a gref to this page */
@@ -1221,7 +1219,7 @@ static void blkif_free_ring(struct blkfront_ring_info *rinfo)
 		list_for_each_entry_safe(persistent_gnt, n,
 					 &rinfo->grants, node) {
 			list_del(&persistent_gnt->node);
-			if (persistent_gnt->gref != GRANT_INVALID_REF) {
+			if (persistent_gnt->gref != INVALID_GRANT_REF) {
 				gnttab_end_foreign_access(persistent_gnt->gref,
 							  0UL);
 				rinfo->persistent_gnts_c--;
@@ -1283,9 +1281,9 @@ static void blkif_free_ring(struct blkfront_ring_info *rinfo)
 
 	/* Free resources associated with old device channel. */
 	for (i = 0; i < info->nr_ring_pages; i++) {
-		if (rinfo->ring_ref[i] != GRANT_INVALID_REF) {
+		if (rinfo->ring_ref[i] != INVALID_GRANT_REF) {
 			gnttab_end_foreign_access(rinfo->ring_ref[i], 0);
-			rinfo->ring_ref[i] = GRANT_INVALID_REF;
+			rinfo->ring_ref[i] = INVALID_GRANT_REF;
 		}
 	}
 	free_pages_exact(rinfo->ring.sring,
@@ -1475,7 +1473,7 @@ static int blkif_completion(unsigned long *id,
 			 * to the tail of the list, so it will not be picked
 			 * again unless we run out of persistent grants.
 			 */
-			s->grants_used[i]->gref = GRANT_INVALID_REF;
+			s->grants_used[i]->gref = INVALID_GRANT_REF;
 			list_add_tail(&s->grants_used[i]->node, &rinfo->grants);
 		}
 	}
@@ -1500,7 +1498,7 @@ static int blkif_completion(unsigned long *id,
 					indirect_page = s->indirect_grants[i]->page;
 					list_add(&indirect_page->lru, &rinfo->indirect_pages);
 				}
-				s->indirect_grants[i]->gref = GRANT_INVALID_REF;
+				s->indirect_grants[i]->gref = INVALID_GRANT_REF;
 				list_add_tail(&s->indirect_grants[i]->node, &rinfo->grants);
 			}
 		}
@@ -1687,7 +1685,7 @@ static int setup_blkring(struct xenbus_device *dev,
 	grant_ref_t gref[XENBUS_MAX_RING_GRANTS];
 
 	for (i = 0; i < info->nr_ring_pages; i++)
-		rinfo->ring_ref[i] = GRANT_INVALID_REF;
+		rinfo->ring_ref[i] = INVALID_GRANT_REF;
 
 	sring = alloc_pages_exact(ring_size, GFP_NOIO);
 	if (!sring) {
@@ -2544,13 +2542,13 @@ static void purge_persistent_grants(struct blkfront_info *info)
 
 		list_for_each_entry_safe(gnt_list_entry, tmp, &rinfo->grants,
 					 node) {
-			if (gnt_list_entry->gref == GRANT_INVALID_REF ||
+			if (gnt_list_entry->gref == INVALID_GRANT_REF ||
 			    !gnttab_try_end_foreign_access(gnt_list_entry->gref))
 				continue;
 
 			list_del(&gnt_list_entry->node);
 			rinfo->persistent_gnts_c--;
-			gnt_list_entry->gref = GRANT_INVALID_REF;
+			gnt_list_entry->gref = INVALID_GRANT_REF;
 			list_add_tail(&gnt_list_entry->node, &grants);
 		}
 
-- 
2.34.1


