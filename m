Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B614E4F7BDE
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300581.512788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncObX-0002P2-Vc; Thu, 07 Apr 2022 09:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300581.512788; Thu, 07 Apr 2022 09:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncObX-0002MH-S3; Thu, 07 Apr 2022 09:39:03 +0000
Received: by outflank-mailman (input) for mailman id 300581;
 Thu, 07 Apr 2022 09:39:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mzit=UR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ncObW-0002MB-NV
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:39:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e43933d-b656-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 11:39:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EEFF91F85A;
 Thu,  7 Apr 2022 09:39:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C04CA13A66;
 Thu,  7 Apr 2022 09:39:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zjJlLTSxTmKcMQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 07 Apr 2022 09:39:00 +0000
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
X-Inumbo-ID: 8e43933d-b656-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649324340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t80M3AxgwPtFqBrAe3eNHmWvOG2zVPYy43qfmNkj2UM=;
	b=qt5W8Jyn9g+xgxIpsFNHAe1jRMg+ww9Hwr/2wces4xQ6LPSHQrPrlRsGY+8Xv7n+f2OxGf
	x1uZyqDArGdHlMfem7DcN6viT33f+H9GiS03IuWqZcaHygPJ410EmdfvqX5TQXY3+hFMxV
	hkiqfiqYKOpqRY4fWR5ONLyUptPfrEw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/balloon: don't use PV mode extra memory for zone device allocations
Date: Thu,  7 Apr 2022 11:38:57 +0200
Message-Id: <20220407093857.1485-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running as a Xen PV guest use the extra memory (memory which isn't
allocated for the guest at boot time) only for ballooning purposes and
not for zone device allocations. This will remove some code without any
lack of functionality.

While at it move some code to get rid of another #ifdef.

Remove a comment which is stale since some time now.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/balloon.c           | 54 ++++++++++++++-------------------
 drivers/xen/unpopulated-alloc.c | 33 --------------------
 2 files changed, 23 insertions(+), 64 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index dfe26fa17e95..617a7f4f07a8 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -689,29 +689,34 @@ void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pages)
 }
 EXPORT_SYMBOL(xen_free_ballooned_pages);
 
-#if defined(CONFIG_XEN_PV) && !defined(CONFIG_XEN_UNPOPULATED_ALLOC)
-static void __init balloon_add_region(unsigned long start_pfn,
-				      unsigned long pages)
+static void __init balloon_add_regions(void)
 {
+#if defined(CONFIG_XEN_PV)
+	unsigned long start_pfn, pages;
 	unsigned long pfn, extra_pfn_end;
+	unsigned int i;
 
-	/*
-	 * If the amount of usable memory has been limited (e.g., with
-	 * the 'mem' command line parameter), don't add pages beyond
-	 * this limit.
-	 */
-	extra_pfn_end = min(max_pfn, start_pfn + pages);
+	for (i = 0; i < XEN_EXTRA_MEM_MAX_REGIONS; i++) {
+		pages = xen_extra_mem[i].n_pfns;
+		if (!pages)
+			continue;
 
-	for (pfn = start_pfn; pfn < extra_pfn_end; pfn++) {
-		/* totalram_pages and totalhigh_pages do not
-		   include the boot-time balloon extension, so
-		   don't subtract from it. */
-		balloon_append(pfn_to_page(pfn));
-	}
+		start_pfn = xen_extra_mem[i].start_pfn;
 
-	balloon_stats.total_pages += extra_pfn_end - start_pfn;
-}
+		/*
+		 * If the amount of usable memory has been limited (e.g., with
+		 * the 'mem' command line parameter), don't add pages beyond
+		 * this limit.
+		 */
+		extra_pfn_end = min(max_pfn, start_pfn + pages);
+
+		for (pfn = start_pfn; pfn < extra_pfn_end; pfn++)
+			balloon_append(pfn_to_page(pfn));
+
+		balloon_stats.total_pages += extra_pfn_end - start_pfn;
+	}
 #endif
+}
 
 static int __init balloon_init(void)
 {
@@ -745,20 +750,7 @@ static int __init balloon_init(void)
 	register_sysctl_table(xen_root);
 #endif
 
-#if defined(CONFIG_XEN_PV) && !defined(CONFIG_XEN_UNPOPULATED_ALLOC)
-	{
-		int i;
-
-		/*
-		 * Initialize the balloon with pages from the extra memory
-		 * regions (see arch/x86/xen/setup.c).
-		 */
-		for (i = 0; i < XEN_EXTRA_MEM_MAX_REGIONS; i++)
-			if (xen_extra_mem[i].n_pfns)
-				balloon_add_region(xen_extra_mem[i].start_pfn,
-						   xen_extra_mem[i].n_pfns);
-	}
-#endif
+	balloon_add_regions();
 
 	task = kthread_run(balloon_thread, NULL, "xen-balloon");
 	if (IS_ERR(task)) {
diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index a8b41057c382..a39f2d36dd9c 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -230,39 +230,6 @@ void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 }
 EXPORT_SYMBOL(xen_free_unpopulated_pages);
 
-#ifdef CONFIG_XEN_PV
-static int __init init(void)
-{
-	unsigned int i;
-
-	if (!xen_domain())
-		return -ENODEV;
-
-	if (!xen_pv_domain())
-		return 0;
-
-	/*
-	 * Initialize with pages from the extra memory regions (see
-	 * arch/x86/xen/setup.c).
-	 */
-	for (i = 0; i < XEN_EXTRA_MEM_MAX_REGIONS; i++) {
-		unsigned int j;
-
-		for (j = 0; j < xen_extra_mem[i].n_pfns; j++) {
-			struct page *pg =
-				pfn_to_page(xen_extra_mem[i].start_pfn + j);
-
-			pg->zone_device_data = page_list;
-			page_list = pg;
-			list_count++;
-		}
-	}
-
-	return 0;
-}
-subsys_initcall(init);
-#endif
-
 static int __init unpopulated_init(void)
 {
 	int ret;
-- 
2.34.1


