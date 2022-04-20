Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F56E508BDB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:13:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309416.525688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhC0z-0006vG-DP; Wed, 20 Apr 2022 15:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309416.525688; Wed, 20 Apr 2022 15:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhC0z-0006t8-AC; Wed, 20 Apr 2022 15:13:09 +0000
Received: by outflank-mailman (input) for mailman id 309416;
 Wed, 20 Apr 2022 15:13:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhBy6-0003l9-7o
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:10:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3fba793-c0bb-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 17:10:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 870F51F75C;
 Wed, 20 Apr 2022 15:10:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 602B213AD5;
 Wed, 20 Apr 2022 15:10:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2PBIFkoiYGJILQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:10:02 +0000
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
X-Inumbo-ID: f3fba793-c0bb-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650467402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QLFILJSyTHZFwq9omiEC/cxiL5bUIoRxF/dV9SsWN+s=;
	b=fU0EP2NLCoJe8acGsjUQq+tmbjd9EV5kJ837Yvpjtv3R+E+3rdGLFrVs3chlN8uv83+s3P
	V2mWF1R7X54tVlLdCKJydZmarq3eFTC+1QOhIfPS3iXNwVxAbQaf+CszPw4cSbP+RQi0bK
	PRYJay9LyAUNVTxOluvKtHQACb11R0A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 18/18] xen/xenbus: eliminate xenbus_grant_ring()
Date: Wed, 20 Apr 2022 17:09:42 +0200
Message-Id: <20220420150942.31235-19-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420150942.31235-1-jgross@suse.com>
References: <20220420150942.31235-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no external user of xenbus_grant_ring() left, so merge it into
the only caller xenbus_setup_ring().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/xenbus/xenbus_client.c | 64 +++++++++---------------------
 include/xen/xenbus.h               |  2 -
 2 files changed, 18 insertions(+), 48 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 1a2e0d94ccd1..7b1f7f86b6e5 100644
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
 
@@ -433,9 +390,24 @@ int xenbus_setup_ring(struct xenbus_device *dev, gfp_t gfp, void **vaddr,
 		goto err;
 	}
 
-	ret = xenbus_grant_ring(dev, *vaddr, nr_pages, grefs);
-	if (ret)
+	ret = gnttab_alloc_grant_references(nr_pages, &gref_head);
+	if (ret) {
+		xenbus_dev_fatal(dev, ret, "granting access to ring page");
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


