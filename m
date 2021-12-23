Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C63747E1CD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 11:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250993.432231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0Lil-0005bE-DW; Thu, 23 Dec 2021 10:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250993.432231; Thu, 23 Dec 2021 10:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0Lil-0005Z1-AE; Thu, 23 Dec 2021 10:53:15 +0000
Received: by outflank-mailman (input) for mailman id 250993;
 Thu, 23 Dec 2021 10:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n0Lik-0005Yv-GP
 for xen-devel@lists.xenproject.org; Thu, 23 Dec 2021 10:53:14 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 865e9243-63de-11ec-9e60-abaf8a552007;
 Thu, 23 Dec 2021 11:53:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BCACB210DB;
 Thu, 23 Dec 2021 10:53:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D19113E4C;
 Thu, 23 Dec 2021 10:53:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zOzSJBhVxGFGHwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Dec 2021 10:53:12 +0000
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
X-Inumbo-ID: 865e9243-63de-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1640256792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pEet0UNjNiJJwdUa4GB5z/GjJ/9loWEgRoSSHCDo0MI=;
	b=GsWW+u52CVrXy/vpfXc8KX5A2yWqgv3EK9oOirwgQ0Gr0O1h7xYNy1dzIr7CVwH8pIyy1E
	4287Ay+xHRmD4BjwygX/wErVLaDyhhemTFZkE8F3fip+NO9hkES8nue3xTE7y4Ib6lQ6YE
	Uzosznh1ttmMURDOL0bwbPDSr0cwvDI=
From: Juergen Gross <jgross@suse.com>
To: stable@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/blkfront: fix bug in backported patch
Date: Thu, 23 Dec 2021 11:53:08 +0100
Message-Id: <20211223105308.17077-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The backport of commit 8f5a695d99000fc ("xen/blkfront: don't take local
copy of a request from the ring page") to stable 4.4 kernel introduced
a bug when adding the needed blkif_ring_get_request() function, as
info->ring.req_prod_pvt was incremented twice now.

Fix that be deleting the now superfluous increments after calling that
function.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/block/xen-blkfront.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 1e44b7880200..ae2c47e99c88 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -493,8 +493,6 @@ static int blkif_queue_discard_req(struct request *req)
 	else
 		ring_req->u.discard.flag = 0;
 
-	info->ring.req_prod_pvt++;
-
 	/* Copy the request to the ring page. */
 	*final_ring_req = *ring_req;
 	info->shadow[id].inflight = true;
@@ -711,8 +709,6 @@ static int blkif_queue_rw_req(struct request *req)
 	if (setup.segments)
 		kunmap_atomic(setup.segments);
 
-	info->ring.req_prod_pvt++;
-
 	/* Copy request(s) to the ring page. */
 	*final_ring_req = *ring_req;
 	info->shadow[id].inflight = true;
-- 
2.26.2


