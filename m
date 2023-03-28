Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC76CB9BD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 10:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515593.798621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph4y0-0007yD-Bg; Tue, 28 Mar 2023 08:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515593.798621; Tue, 28 Mar 2023 08:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph4y0-0007vZ-8F; Tue, 28 Mar 2023 08:46:08 +0000
Received: by outflank-mailman (input) for mailman id 515593;
 Tue, 28 Mar 2023 08:46:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLKu=7U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ph4xz-0007dl-6m
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 08:46:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f95cfe1f-cd44-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 10:46:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F2E521FDA1;
 Tue, 28 Mar 2023 08:46:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC5A91390D;
 Tue, 28 Mar 2023 08:46:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X72GKEypImQKLwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 28 Mar 2023 08:46:04 +0000
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
X-Inumbo-ID: f95cfe1f-cd44-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679993165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XkRrVX8XzPB5UHUjHXjJ+xWWlRyOClSfTOm/ZrUGMDw=;
	b=BXUn2XOtBlkO6BfqJ9xz1Y8JkP8uIsgjzDECMGZ0Jh/UurP91nuLzaw9ZDMKbiiO4tpgKn
	48XtNjyA4FGeWwJDGjFzuzqKiaGnm/Xh/6L5tLJypGtfmM2kE3IixxVyNd5tURiLH/24Hi
	XN7f7GP61eB39zwsjvWYRnfODaJQtPY=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] xen/scsiback: don't call scsiback_free_translation_entry() under lock
Date: Tue, 28 Mar 2023 10:46:02 +0200
Message-Id: <20230328084602.20729-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scsiback_free_translation_entry() shouldn't be called under spinlock,
as it can sleep.

This requires to split removing a translation entry from the v2p list
from actually calling kref_put() for the entry.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/lkml/Y+JUIl64UDmdkboh@kadam/
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/xen-scsiback.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/xen/xen-scsiback.c b/drivers/xen/xen-scsiback.c
index 954188b0b858..294f29cdc7aa 100644
--- a/drivers/xen/xen-scsiback.c
+++ b/drivers/xen/xen-scsiback.c
@@ -1010,12 +1010,6 @@ static int scsiback_add_translation_entry(struct vscsibk_info *info,
 	return err;
 }
 
-static void __scsiback_del_translation_entry(struct v2p_entry *entry)
-{
-	list_del(&entry->l);
-	kref_put(&entry->kref, scsiback_free_translation_entry);
-}
-
 /*
   Delete the translation entry specified
 */
@@ -1024,18 +1018,20 @@ static int scsiback_del_translation_entry(struct vscsibk_info *info,
 {
 	struct v2p_entry *entry;
 	unsigned long flags;
-	int ret = 0;
 
 	spin_lock_irqsave(&info->v2p_lock, flags);
 	/* Find out the translation entry specified */
 	entry = scsiback_chk_translation_entry(info, v);
 	if (entry)
-		__scsiback_del_translation_entry(entry);
-	else
-		ret = -ENOENT;
+		list_del(&entry->l);
 
 	spin_unlock_irqrestore(&info->v2p_lock, flags);
-	return ret;
+
+	if (!entry)
+		return -ENOENT;
+
+	kref_put(&entry->kref, scsiback_free_translation_entry);
+	return 0;
 }
 
 static void scsiback_do_add_lun(struct vscsibk_info *info, const char *state,
@@ -1239,14 +1235,19 @@ static void scsiback_release_translation_entry(struct vscsibk_info *info)
 {
 	struct v2p_entry *entry, *tmp;
 	struct list_head *head = &(info->v2p_entry_lists);
+	struct list_head tmp_list;
 	unsigned long flags;
 
 	spin_lock_irqsave(&info->v2p_lock, flags);
 
-	list_for_each_entry_safe(entry, tmp, head, l)
-		__scsiback_del_translation_entry(entry);
+	list_cut_before(&tmp_list, head, head);
 
 	spin_unlock_irqrestore(&info->v2p_lock, flags);
+
+	list_for_each_entry_safe(entry, tmp, &tmp_list, l) {
+		list_del(&entry->l);
+		kref_put(&entry->kref, scsiback_free_translation_entry);
+	}
 }
 
 static void scsiback_remove(struct xenbus_device *dev)
-- 
2.35.3


