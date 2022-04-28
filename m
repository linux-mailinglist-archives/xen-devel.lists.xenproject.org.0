Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A30512E61
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316178.535029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVH-0007PM-0y; Thu, 28 Apr 2022 08:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316178.535029; Thu, 28 Apr 2022 08:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVG-00078K-5f; Thu, 28 Apr 2022 08:27:58 +0000
Received: by outflank-mailman (input) for mailman id 316178;
 Thu, 28 Apr 2022 08:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njzVB-0005SM-EE
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:27:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17755833-c6cd-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 10:27:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7D74021876;
 Thu, 28 Apr 2022 08:27:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5049213491;
 Thu, 28 Apr 2022 08:27:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CKAEEgZQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:50 +0000
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
X-Inumbo-ID: 17755833-c6cd-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651134470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YDGIDWKPRWQB7unVe+D0Q46rvuLr6BdasgzAbPg2LQ4=;
	b=T5xs3W2ptqXsPfAvqIrcBVCVmeIIst8eIXsa6BQstyNsdU/WQh1htmsRml82tfTV2fGZ3M
	7cGIdDix3zSa2IetRSiHt7IZIEFkNcvniiOV1J8BaTLWaoZ1RioIq/s150J0i7xKAcImqK
	uRJEG3SHaqX4FP/qg/DOiCvut/Qn7YI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 10/19] xen/xenbus: add xenbus_setup_ring() service function
Date: Thu, 28 Apr 2022 10:27:34 +0200
Message-Id: <20220428082743.16593-11-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428082743.16593-1-jgross@suse.com>
References: <20220428082743.16593-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most PV device frontends share very similar code for setting up shared
ring buffers:

- allocate page(s)
- init the ring admin data
- give the backend access to the ring via grants

Tearing down the ring requires similar actions in all frontends again:

- remove grants
- free the page(s)

Provide service functions xenbus_setup_ring() and xenbus_teardown_ring()
for that purpose.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/xenbus/xenbus_client.c | 69 ++++++++++++++++++++++++++++++
 include/xen/xenbus.h               |  4 ++
 2 files changed, 73 insertions(+)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index df6890681231..1a2e0d94ccd1 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -407,6 +407,75 @@ int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
 }
 EXPORT_SYMBOL_GPL(xenbus_grant_ring);
 
+/*
+ * xenbus_setup_ring
+ * @dev: xenbus device
+ * @vaddr: pointer to starting virtual address of the ring
+ * @nr_pages: number of pages to be granted
+ * @grefs: grant reference array to be filled in
+ *
+ * Allocate physically contiguous pages for a shared ring buffer and grant it
+ * to the peer of the given device. The ring buffer is initially filled with
+ * zeroes. The virtual address of the ring is stored at @vaddr and the
+ * grant references are stored in the @grefs array. In case of error @vaddr
+ * will be set to NULL and @grefs will be filled with INVALID_GRANT_REF.
+ */
+int xenbus_setup_ring(struct xenbus_device *dev, gfp_t gfp, void **vaddr,
+		      unsigned int nr_pages, grant_ref_t *grefs)
+{
+	unsigned long ring_size = nr_pages * XEN_PAGE_SIZE;
+	unsigned int i;
+	int ret;
+
+	*vaddr = alloc_pages_exact(ring_size, gfp | __GFP_ZERO);
+	if (!*vaddr) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	ret = xenbus_grant_ring(dev, *vaddr, nr_pages, grefs);
+	if (ret)
+		goto err;
+
+	return 0;
+
+ err:
+	if (*vaddr)
+		free_pages_exact(*vaddr, ring_size);
+	for (i = 0; i < nr_pages; i++)
+		grefs[i] = INVALID_GRANT_REF;
+	*vaddr = NULL;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xenbus_setup_ring);
+
+/*
+ * xenbus_teardown_ring
+ * @vaddr: starting virtual address of the ring
+ * @nr_pages: number of pages
+ * @grefs: grant reference array
+ *
+ * Remove grants for the shared ring buffer and free the associated memory.
+ * On return the grant reference array is filled with INVALID_GRANT_REF.
+ */
+void xenbus_teardown_ring(void **vaddr, unsigned int nr_pages,
+			  grant_ref_t *grefs)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr_pages; i++) {
+		if (grefs[i] != INVALID_GRANT_REF) {
+			gnttab_end_foreign_access(grefs[i], 0);
+			grefs[i] = INVALID_GRANT_REF;
+		}
+	}
+
+	if (*vaddr)
+		free_pages_exact(*vaddr, nr_pages * XEN_PAGE_SIZE);
+	*vaddr = NULL;
+}
+EXPORT_SYMBOL_GPL(xenbus_teardown_ring);
 
 /**
  * Allocate an event channel for the given xenbus_device, assigning the newly
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index b13eb86395e0..b533b4adc835 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -226,6 +226,10 @@ int xenbus_watch_pathfmt(struct xenbus_device *dev, struct xenbus_watch *watch,
 int xenbus_switch_state(struct xenbus_device *dev, enum xenbus_state new_state);
 int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
 		      unsigned int nr_pages, grant_ref_t *grefs);
+int xenbus_setup_ring(struct xenbus_device *dev, gfp_t gfp, void **vaddr,
+		      unsigned int nr_pages, grant_ref_t *grefs);
+void xenbus_teardown_ring(void **vaddr, unsigned int nr_pages,
+			  grant_ref_t *grefs);
 int xenbus_map_ring_valloc(struct xenbus_device *dev, grant_ref_t *gnt_refs,
 			   unsigned int nr_grefs, void **vaddr);
 
-- 
2.34.1


