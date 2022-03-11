Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5B84D5FB0
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 11:35:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288933.490141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSccN-0006q8-Ah; Fri, 11 Mar 2022 10:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288933.490141; Fri, 11 Mar 2022 10:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSccN-0006oA-6G; Fri, 11 Mar 2022 10:35:31 +0000
Received: by outflank-mailman (input) for mailman id 288933;
 Fri, 11 Mar 2022 10:35:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nSccL-00047U-TJ
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 10:35:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f87ff06e-a126-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 11:35:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 18DCC21900;
 Fri, 11 Mar 2022 10:35:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE33E13A85;
 Fri, 11 Mar 2022 10:35:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2CMJMfAlK2JydgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 11 Mar 2022 10:35:28 +0000
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
X-Inumbo-ID: f87ff06e-a126-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646994929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2A0s9MNxg2Q3sbNoaDjqzamUO4PIFL9q9tcCNyUQzoo=;
	b=kOTKT+erKLJg8Sd4nahKDsq5kn2bQQGml4MXQ+m1NTG+glUxRhoBrK+ftjenbbb2FK5k4N
	eJMBxr9G8aAIvMFDCdAYBBuywecStRBkVAMuu2sI8CW0jHZ3ZUIZZpAs+Mz/MUbN1DD61B
	Go1rLUSZ6tZYV9RL/MORon1oqiyXz4s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/blkfront: speed up purge_persistent_grants()
Date: Fri, 11 Mar 2022 11:35:27 +0100
Message-Id: <20220311103527.12931-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

purge_persistent_grants() is scanning the grants list for persistent
grants being no longer in use by the backend. When having found such a
grant, it will be set to "invalid" and pushed to the tail of the list.

Instead of pushing it directly to the end of the list, add it first to
a temporary list, avoiding to scan those entries again in the main
list traversal. After having finished the scan, append the temporary
list to the grant list.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/block/xen-blkfront.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index aa996b637d0b..378262ec47ae 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2533,6 +2533,7 @@ static void purge_persistent_grants(struct blkfront_info *info)
 
 	for_each_rinfo(info, rinfo, i) {
 		struct grant *gnt_list_entry, *tmp;
+		LIST_HEAD(grants);
 
 		spin_lock_irqsave(&rinfo->ring_lock, flags);
 
@@ -2550,9 +2551,11 @@ static void purge_persistent_grants(struct blkfront_info *info)
 			list_del(&gnt_list_entry->node);
 			rinfo->persistent_gnts_c--;
 			gnt_list_entry->gref = GRANT_INVALID_REF;
-			list_add_tail(&gnt_list_entry->node, &rinfo->grants);
+			list_add_tail(&gnt_list_entry->node, &grants);
 		}
 
+		list_splice_tail(&grants, &rinfo->grants);
+
 		spin_unlock_irqrestore(&rinfo->ring_lock, flags);
 	}
 }
-- 
2.34.1


