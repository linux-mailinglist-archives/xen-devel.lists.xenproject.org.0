Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB284D5FAD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 11:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288926.490119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nScbx-0005bz-Pl; Fri, 11 Mar 2022 10:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288926.490119; Fri, 11 Mar 2022 10:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nScbx-0005a7-Lr; Fri, 11 Mar 2022 10:35:05 +0000
Received: by outflank-mailman (input) for mailman id 288926;
 Fri, 11 Mar 2022 10:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nScbw-00047V-0W
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 10:35:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7e4c480-a126-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 11:35:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1505421901;
 Fri, 11 Mar 2022 10:35:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D69EB13A85;
 Fri, 11 Mar 2022 10:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pe8nM9YlK2I5dgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 11 Mar 2022 10:35:02 +0000
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
X-Inumbo-ID: e7e4c480-a126-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646994903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cl8eXsZGXE2910dV3+hGtO5AmlArXF2/CNH7AFhna9A=;
	b=jzLP/R1zJqyhsxtF02jryM8k300pfwJZXj8gxvxt/4Nm6TDhvTgoPKqENjWl1clmPGCMbt
	UIL2Xl9sT9WOeDqiCb8WyElSfyhKO6RDIANpNYwGrrZN/pHL8Z7FWmqzuDzEpdMtsLQpdh
	GxViyLpxS0aatuAWvXEwYj0rudthaDU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] xen/usb: don't use arbitrary_virt_to_machine()
Date: Fri, 11 Mar 2022 11:35:00 +0100
Message-Id: <20220311103500.12885-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arbitrary_virt_to_machine() is meant to be used in PV guests only.
Replace its usage with virt_to_gfn().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/usb/host/xen-hcd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/host/xen-hcd.c b/drivers/usb/host/xen-hcd.c
index 5f4a00df4f1c..01db5c767251 100644
--- a/drivers/usb/host/xen-hcd.c
+++ b/drivers/usb/host/xen-hcd.c
@@ -589,14 +589,12 @@ static void xenhcd_gnttab_map(struct xenhcd_info *info, void *addr, int length,
 			      int nr_pages, int flags)
 {
 	grant_ref_t ref;
-	unsigned long buffer_mfn;
 	unsigned int offset;
 	unsigned int len = length;
 	unsigned int bytes;
 	int i;
 
 	for (i = 0; i < nr_pages; i++) {
-		buffer_mfn = PFN_DOWN(arbitrary_virt_to_machine(addr).maddr);
 		offset = offset_in_page(addr);
 
 		bytes = PAGE_SIZE - offset;
@@ -605,7 +603,7 @@ static void xenhcd_gnttab_map(struct xenhcd_info *info, void *addr, int length,
 
 		ref = gnttab_claim_grant_reference(gref_head);
 		gnttab_grant_foreign_access_ref(ref, info->xbdev->otherend_id,
-						buffer_mfn, flags);
+						virt_to_gfn(addr), flags);
 		seg[i].gref = ref;
 		seg[i].offset = (__u16)offset;
 		seg[i].length = (__u16)bytes;
-- 
2.34.1


