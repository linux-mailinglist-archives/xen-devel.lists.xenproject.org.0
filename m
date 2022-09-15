Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9815B9D2A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 16:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407446.649979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpu4-0003kz-J6; Thu, 15 Sep 2022 14:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407446.649979; Thu, 15 Sep 2022 14:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpu4-0003hu-GB; Thu, 15 Sep 2022 14:31:44 +0000
Received: by outflank-mailman (input) for mailman id 407446;
 Thu, 15 Sep 2022 14:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/0/a=ZS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oYpu2-0003hV-Kh
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 14:31:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d4e6c5c-3503-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 16:31:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D1CD31F8AF;
 Thu, 15 Sep 2022 14:31:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9DA73133B6;
 Thu, 15 Sep 2022 14:31:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DRsmJUw3I2OVegAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 15 Sep 2022 14:31:40 +0000
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
X-Inumbo-ID: 1d4e6c5c-3503-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663252300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dzoAgu6mheUOzlynwIyePFbncbuBp9hucJwC4AGAEMg=;
	b=cBu5DlTCREcpIg2AL2xFilshrjAlZTvrjdO687YcesK9GrOmCA581P3FxwwuYLrZ+YkHpE
	Sf7gTfCFQhBDBDudEhF0MI7TmSLcA60AMgyUI28s9e2hH5T3IFxj25WBCY7sZwFQXroC3E
	yL1W20RErwozixvr7renhuJpHHkbSjI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	stable@vger.kernel.org,
	Sander Eikelenboom <linux@eikelenboom.it>
Subject: [PATCH] xen/xenbus: fix xenbus_setup_ring()
Date: Thu, 15 Sep 2022 16:31:37 +0200
Message-Id: <20220915143137.1763-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4573240f0764 ("xen/xenbus: eliminate xenbus_grant_ring()")
introduced an error for initialization of multi-page rings.

Cc: stable@vger.kernel.org
Fixes: 4573240f0764 ("xen/xenbus: eliminate xenbus_grant_ring()")
Reported-by: Sander Eikelenboom <linux@eikelenboom.it>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/xenbus/xenbus_client.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index d5f3f763717e..caa5c5c32f8e 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -382,9 +382,10 @@ int xenbus_setup_ring(struct xenbus_device *dev, gfp_t gfp, void **vaddr,
 	unsigned long ring_size = nr_pages * XEN_PAGE_SIZE;
 	grant_ref_t gref_head;
 	unsigned int i;
+	void *addr;
 	int ret;
 
-	*vaddr = alloc_pages_exact(ring_size, gfp | __GFP_ZERO);
+	addr = *vaddr = alloc_pages_exact(ring_size, gfp | __GFP_ZERO);
 	if (!*vaddr) {
 		ret = -ENOMEM;
 		goto err;
@@ -401,13 +402,15 @@ int xenbus_setup_ring(struct xenbus_device *dev, gfp_t gfp, void **vaddr,
 		unsigned long gfn;
 
 		if (is_vmalloc_addr(*vaddr))
-			gfn = pfn_to_gfn(vmalloc_to_pfn(vaddr[i]));
+			gfn = pfn_to_gfn(vmalloc_to_pfn(addr));
 		else
-			gfn = virt_to_gfn(vaddr[i]);
+			gfn = virt_to_gfn(addr);
 
 		grefs[i] = gnttab_claim_grant_reference(&gref_head);
 		gnttab_grant_foreign_access_ref(grefs[i], dev->otherend_id,
 						gfn, 0);
+
+		addr += PAGE_SIZE;
 	}
 
 	return 0;
-- 
2.35.3


