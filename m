Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7EB4D5FAC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 11:35:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288917.490093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nScbV-0004EX-38; Fri, 11 Mar 2022 10:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288917.490093; Fri, 11 Mar 2022 10:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nScbU-0004AF-RK; Fri, 11 Mar 2022 10:34:36 +0000
Received: by outflank-mailman (input) for mailman id 288917;
 Fri, 11 Mar 2022 10:34:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nScbT-00047U-K8
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 10:34:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7973e09-a126-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 11:34:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A6E151F38D;
 Fri, 11 Mar 2022 10:34:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E45213FA6;
 Fri, 11 Mar 2022 10:34:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sBSlHbklK2LxdQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 11 Mar 2022 10:34:33 +0000
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
X-Inumbo-ID: d7973e09-a126-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646994873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zIKrcrVv8sT7uGpdxBONglT2SrtoCB1xadTjqU49EQU=;
	b=ELDyhB/pH3g1wNJ9NCIGljJ0NiUjr/eV44nW0TBeCBZEPxzRjH0TAZleF2TcInRM3GMZq5
	bNyCjCx4Dprb3ou9V62DzSxf8GOTp6WpxPDTeucbqFJA2wZV0cbT+bvqNkLKnF8vFrPzz4
	QEZNLWqGh6PdbE6DjGcNB4TU1l/RBK8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] xen/grant-table: remove gnttab_*transfer*() functions
Date: Fri, 11 Mar 2022 11:34:28 +0100
Message-Id: <20220311103429.12845-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311103429.12845-1-jgross@suse.com>
References: <20220311103429.12845-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All grant table operations related to the "transfer" functionality
are unused currently. There have been users in the old days of the
"Xen-o-Linux" kernel, but those didn't make it upstream.

So remove the "transfer" related functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/grant-table.c | 113 +-------------------------------------
 include/xen/grant_table.h |   8 ---
 2 files changed, 2 insertions(+), 119 deletions(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 5c83d41766c8..8963af8ec764 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -109,7 +109,7 @@ struct gnttab_ops {
 	void (*unmap_frames)(void);
 	/*
 	 * Introducing a valid entry into the grant table, granting the frame of
-	 * this grant entry to domain for accessing or transfering. Ref
+	 * this grant entry to domain for accessing. Ref
 	 * parameter is reference of this introduced grant entry, domid is id of
 	 * granted domain, frame is the page frame to be granted, and flags is
 	 * status of the grant entry to be updated.
@@ -125,14 +125,6 @@ struct gnttab_ops {
 	 * access for this entry and return success(==1).
 	 */
 	int (*end_foreign_access_ref)(grant_ref_t ref, int readonly);
-	/*
-	 * Stop granting a grant entry to domain for transfer. Ref parameter is
-	 * reference of a grant entry whose grant transfer will be stopped. If
-	 * tranfer has not started, just reclaim the grant entry and return
-	 * failure(==0). Otherwise, wait for the transfer to complete and then
-	 * return the frame.
-	 */
-	unsigned long (*end_foreign_transfer_ref)(grant_ref_t ref);
 	/*
 	 * Read the frame number related to a given grant reference.
 	 */
@@ -230,10 +222,7 @@ static void put_free_entry(grant_ref_t ref)
  * Following applies to gnttab_update_entry_v1 and gnttab_update_entry_v2.
  * Introducing a valid entry into the grant table:
  *  1. Write ent->domid.
- *  2. Write ent->frame:
- *      GTF_permit_access:   Frame to which access is permitted.
- *      GTF_accept_transfer: Pseudo-phys frame slot being filled by new
- *                           frame, or zero if none.
+ *  2. Write ent->frame: Frame to which access is permitted.
  *  3. Write memory barrier (WMB).
  *  4. Write ent->flags, inc. valid type.
  */
@@ -455,102 +444,6 @@ void gnttab_end_foreign_access(grant_ref_t ref, int readonly,
 }
 EXPORT_SYMBOL_GPL(gnttab_end_foreign_access);
 
-int gnttab_grant_foreign_transfer(domid_t domid, unsigned long pfn)
-{
-	int ref;
-
-	ref = get_free_entries(1);
-	if (unlikely(ref < 0))
-		return -ENOSPC;
-	gnttab_grant_foreign_transfer_ref(ref, domid, pfn);
-
-	return ref;
-}
-EXPORT_SYMBOL_GPL(gnttab_grant_foreign_transfer);
-
-void gnttab_grant_foreign_transfer_ref(grant_ref_t ref, domid_t domid,
-				       unsigned long pfn)
-{
-	gnttab_interface->update_entry(ref, domid, pfn, GTF_accept_transfer);
-}
-EXPORT_SYMBOL_GPL(gnttab_grant_foreign_transfer_ref);
-
-static unsigned long gnttab_end_foreign_transfer_ref_v1(grant_ref_t ref)
-{
-	unsigned long frame;
-	u16           flags;
-	u16          *pflags;
-
-	pflags = &gnttab_shared.v1[ref].flags;
-
-	/*
-	 * If a transfer is not even yet started, try to reclaim the grant
-	 * reference and return failure (== 0).
-	 */
-	while (!((flags = *pflags) & GTF_transfer_committed)) {
-		if (sync_cmpxchg(pflags, flags, 0) == flags)
-			return 0;
-		cpu_relax();
-	}
-
-	/* If a transfer is in progress then wait until it is completed. */
-	while (!(flags & GTF_transfer_completed)) {
-		flags = *pflags;
-		cpu_relax();
-	}
-
-	rmb();	/* Read the frame number /after/ reading completion status. */
-	frame = gnttab_shared.v1[ref].frame;
-	BUG_ON(frame == 0);
-
-	return frame;
-}
-
-static unsigned long gnttab_end_foreign_transfer_ref_v2(grant_ref_t ref)
-{
-	unsigned long frame;
-	u16           flags;
-	u16          *pflags;
-
-	pflags = &gnttab_shared.v2[ref].hdr.flags;
-
-	/*
-	 * If a transfer is not even yet started, try to reclaim the grant
-	 * reference and return failure (== 0).
-	 */
-	while (!((flags = *pflags) & GTF_transfer_committed)) {
-		if (sync_cmpxchg(pflags, flags, 0) == flags)
-			return 0;
-		cpu_relax();
-	}
-
-	/* If a transfer is in progress then wait until it is completed. */
-	while (!(flags & GTF_transfer_completed)) {
-		flags = *pflags;
-		cpu_relax();
-	}
-
-	rmb();  /* Read the frame number /after/ reading completion status. */
-	frame = gnttab_shared.v2[ref].full_page.frame;
-	BUG_ON(frame == 0);
-
-	return frame;
-}
-
-unsigned long gnttab_end_foreign_transfer_ref(grant_ref_t ref)
-{
-	return gnttab_interface->end_foreign_transfer_ref(ref);
-}
-EXPORT_SYMBOL_GPL(gnttab_end_foreign_transfer_ref);
-
-unsigned long gnttab_end_foreign_transfer(grant_ref_t ref)
-{
-	unsigned long frame = gnttab_end_foreign_transfer_ref(ref);
-	put_free_entry(ref);
-	return frame;
-}
-EXPORT_SYMBOL_GPL(gnttab_end_foreign_transfer);
-
 void gnttab_free_grant_reference(grant_ref_t ref)
 {
 	put_free_entry(ref);
@@ -1423,7 +1316,6 @@ static const struct gnttab_ops gnttab_v1_ops = {
 	.unmap_frames			= gnttab_unmap_frames_v1,
 	.update_entry			= gnttab_update_entry_v1,
 	.end_foreign_access_ref		= gnttab_end_foreign_access_ref_v1,
-	.end_foreign_transfer_ref	= gnttab_end_foreign_transfer_ref_v1,
 	.read_frame			= gnttab_read_frame_v1,
 };
 
@@ -1435,7 +1327,6 @@ static const struct gnttab_ops gnttab_v2_ops = {
 	.unmap_frames			= gnttab_unmap_frames_v2,
 	.update_entry			= gnttab_update_entry_v2,
 	.end_foreign_access_ref		= gnttab_end_foreign_access_ref_v2,
-	.end_foreign_transfer_ref	= gnttab_end_foreign_transfer_ref_v2,
 	.read_frame			= gnttab_read_frame_v2,
 };
 
diff --git a/include/xen/grant_table.h b/include/xen/grant_table.h
index c9fea9389ebe..9f9b1a297f0d 100644
--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -125,11 +125,6 @@ void gnttab_end_foreign_access(grant_ref_t ref, int readonly,
  */
 int gnttab_try_end_foreign_access(grant_ref_t ref);
 
-int gnttab_grant_foreign_transfer(domid_t domid, unsigned long pfn);
-
-unsigned long gnttab_end_foreign_transfer_ref(grant_ref_t ref);
-unsigned long gnttab_end_foreign_transfer(grant_ref_t ref);
-
 /*
  * operations on reserved batches of grant references
  */
@@ -162,9 +157,6 @@ static inline void gnttab_page_grant_foreign_access_ref_one(
 					readonly);
 }
 
-void gnttab_grant_foreign_transfer_ref(grant_ref_t, domid_t domid,
-				       unsigned long pfn);
-
 static inline void
 gnttab_set_map_op(struct gnttab_map_grant_ref *map, phys_addr_t addr,
 		  uint32_t flags, grant_ref_t ref, domid_t domid)
-- 
2.34.1


