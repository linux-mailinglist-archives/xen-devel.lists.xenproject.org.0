Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B65512E88
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316241.535145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzaQ-00006p-Jb; Thu, 28 Apr 2022 08:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316241.535145; Thu, 28 Apr 2022 08:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzaQ-0008Vt-FZ; Thu, 28 Apr 2022 08:33:18 +0000
Received: by outflank-mailman (input) for mailman id 316241;
 Thu, 28 Apr 2022 08:33:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njzVH-0005SL-Bm
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:27:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18eaf877-c6cd-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 10:27:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EF2F21F88E;
 Thu, 28 Apr 2022 08:27:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C01E513491;
 Thu, 28 Apr 2022 08:27:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mIuaLQhQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:52 +0000
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
X-Inumbo-ID: 18eaf877-c6cd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651134472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DySE+lWBPx7VwNEF3X1lwYDq+4S10O0jUUqyaBArCE0=;
	b=nbgsI2l8XvMPHhwykxKcjmjFm5ic18dsQ4iNKTc8cOED/bFxCbEf3NTRN8JBCmnMBKGyQ2
	qXLhAX68u5bD4eceSKKH1djjOsiFninHCccZsIkSwMsZEy1jxCtv8Ps2onc8BrAtqKGNng
	Yy+egfDuGQZXpsqZG2QPjJvI84+Pz7Q=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 19/19] xen/xenbus: eliminate xenbus_grant_ring()
Date: Thu, 28 Apr 2022 10:27:43 +0200
Message-Id: <20220428082743.16593-20-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428082743.16593-1-jgross@suse.com>
References: <20220428082743.16593-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no external user of xenbus_grant_ring() left, so merge it into
the only caller xenbus_setup_ring().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- make error message more precise (Andrew Cooper)
---
 drivers/xen/xenbus/xenbus_client.c | 65 +++++++++---------------------
 include/xen/xenbus.h               |  2 -
 2 files changed, 19 insertions(+), 48 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 1a2e0d94ccd1..d6fdd2d209d3 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -363,50 +363,6 @@ static void xenbus_switch_fatal(struct xenbus_device *dev, int depth, int err,
 		__xenbus_switch_state(dev, XenbusStateClosing, 1);
 }
 
-/**
- * xenbus_grant_ring
- * @dev: xenbus device
- * @vaddr: starting virtual address of the ring
- * @nr_pages: number of pages to be granted
- * @grefs: grant reference array to be filled in
- *
- * Grant access to the given @vaddr to the peer of the given device.
- * Then fill in @grefs with grant references.  Return 0 on success, or
- * -errno on error.  On error, the device will switch to
- * XenbusStateClosing, and the error will be saved in the store.
- */
-int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
-		      unsigned int nr_pages, grant_ref_t *grefs)
-{
-	int err;
-	unsigned int i;
-	grant_ref_t gref_head;
-
-	err = gnttab_alloc_grant_references(nr_pages, &gref_head);
-	if (err) {
-		xenbus_dev_fatal(dev, err, "granting access to ring page");
-		return err;
-	}
-
-	for (i = 0; i < nr_pages; i++) {
-		unsigned long gfn;
-
-		if (is_vmalloc_addr(vaddr))
-			gfn = pfn_to_gfn(vmalloc_to_pfn(vaddr));
-		else
-			gfn = virt_to_gfn(vaddr);
-
-		grefs[i] = gnttab_claim_grant_reference(&gref_head);
-		gnttab_grant_foreign_access_ref(grefs[i], dev->otherend_id,
-						gfn, 0);
-
-		vaddr = vaddr + XEN_PAGE_SIZE;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(xenbus_grant_ring);
-
 /*
  * xenbus_setup_ring
  * @dev: xenbus device
@@ -424,6 +380,7 @@ int xenbus_setup_ring(struct xenbus_device *dev, gfp_t gfp, void **vaddr,
 		      unsigned int nr_pages, grant_ref_t *grefs)
 {
 	unsigned long ring_size = nr_pages * XEN_PAGE_SIZE;
+	grant_ref_t gref_head;
 	unsigned int i;
 	int ret;
 
@@ -433,9 +390,25 @@ int xenbus_setup_ring(struct xenbus_device *dev, gfp_t gfp, void **vaddr,
 		goto err;
 	}
 
-	ret = xenbus_grant_ring(dev, *vaddr, nr_pages, grefs);
-	if (ret)
+	ret = gnttab_alloc_grant_references(nr_pages, &gref_head);
+	if (ret) {
+		xenbus_dev_fatal(dev, ret, "granting access to %u ring pages",
+				 nr_pages);
 		goto err;
+	}
+
+	for (i = 0; i < nr_pages; i++) {
+		unsigned long gfn;
+
+		if (is_vmalloc_addr(*vaddr))
+			gfn = pfn_to_gfn(vmalloc_to_pfn(vaddr[i]));
+		else
+			gfn = virt_to_gfn(vaddr[i]);
+
+		grefs[i] = gnttab_claim_grant_reference(&gref_head);
+		gnttab_grant_foreign_access_ref(grefs[i], dev->otherend_id,
+						gfn, 0);
+	}
 
 	return 0;
 
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index b533b4adc835..eaa932b99d8a 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -224,8 +224,6 @@ int xenbus_watch_pathfmt(struct xenbus_device *dev, struct xenbus_watch *watch,
 			 const char *pathfmt, ...);
 
 int xenbus_switch_state(struct xenbus_device *dev, enum xenbus_state new_state);
-int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
-		      unsigned int nr_pages, grant_ref_t *grefs);
 int xenbus_setup_ring(struct xenbus_device *dev, gfp_t gfp, void **vaddr,
 		      unsigned int nr_pages, grant_ref_t *grefs);
 void xenbus_teardown_ring(void **vaddr, unsigned int nr_pages,
-- 
2.34.1


