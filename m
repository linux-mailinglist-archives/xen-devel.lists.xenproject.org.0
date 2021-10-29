Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D12943FE62
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 16:22:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218570.379070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgSm2-0003Dv-LD; Fri, 29 Oct 2021 14:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218570.379070; Fri, 29 Oct 2021 14:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgSm2-0003C2-I0; Fri, 29 Oct 2021 14:22:26 +0000
Received: by outflank-mailman (input) for mailman id 218570;
 Fri, 29 Oct 2021 14:22:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3izX=PR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mgSm1-0003Bw-HO
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 14:22:25 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 667d7d82-8cd8-41f8-9aaa-3d3b14c5670c;
 Fri, 29 Oct 2021 14:22:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 669F221968;
 Fri, 29 Oct 2021 14:22:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C28F13F6F;
 Fri, 29 Oct 2021 14:22:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S0YmDZ8DfGECNAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 29 Oct 2021 14:22:23 +0000
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
X-Inumbo-ID: 667d7d82-8cd8-41f8-9aaa-3d3b14c5670c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635517343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b3hbVsW/qd4JlhNtySvVHNwOWfFRRa/WfskrRS8x0kU=;
	b=Q/TsdwhKvafsw3XIx0DN0WD1Emzd6dtaD7TcSz5Q+GEs1/TZufUMxi4MHAYThNeTCVkEPX
	LHjHIkWcaSgKoh2hs4j5xohjeUX8Ee1utuCPb6sblhMkolS3iYlk99xfIOR0e6d897yE0x
	yjsq0I3BMcfLcFPgcASRNhzBGS7HjKI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/balloon: rename alloc/free_xenballooned_pages
Date: Fri, 29 Oct 2021 16:22:19 +0200
Message-Id: <20211029142219.25357-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alloc_xenballooned_pages() and free_xenballooned_pages() are used as
direct replacements of xen_alloc_unpopulated_pages() and
xen_free_unpopulated_pages() in case CONFIG_XEN_UNPOPULATED_ALLOC isn't
defined.

Guard both functions with !CONFIG_XEN_UNPOPULATED_ALLOC and rename them
to the xen_*() variants they are replacing. This allows to remove some
ifdeffery from the xen.h header file.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/balloon.c | 18 ++++++++++--------
 include/xen/balloon.h |  3 ---
 include/xen/xen.h     |  6 ------
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 98fae43d4cec..35fac7fb513a 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -575,6 +575,7 @@ void balloon_set_new_target(unsigned long target)
 }
 EXPORT_SYMBOL_GPL(balloon_set_new_target);
 
+#ifndef CONFIG_XEN_UNPOPULATED_ALLOC
 static int add_ballooned_pages(int nr_pages)
 {
 	enum bp_state st;
@@ -603,12 +604,12 @@ static int add_ballooned_pages(int nr_pages)
 }
 
 /**
- * alloc_xenballooned_pages - get pages that have been ballooned out
+ * xen_alloc_unpopulated_pages - get pages that have been ballooned out
  * @nr_pages: Number of pages to get
  * @pages: pages returned
  * @return 0 on success, error otherwise
  */
-int alloc_xenballooned_pages(int nr_pages, struct page **pages)
+int xen_alloc_unpopulated_pages(int nr_pages, struct page **pages)
 {
 	int pgno = 0;
 	struct page *page;
@@ -645,7 +646,7 @@ int alloc_xenballooned_pages(int nr_pages, struct page **pages)
 	return 0;
  out_undo:
 	mutex_unlock(&balloon_mutex);
-	free_xenballooned_pages(pgno, pages);
+	xen_free_unpopulated_pages(pgno, pages);
 	/*
 	 * NB: free_xenballooned_pages will only subtract pgno pages, but since
 	 * target_unpopulated is incremented with nr_pages at the start we need
@@ -654,14 +655,14 @@ int alloc_xenballooned_pages(int nr_pages, struct page **pages)
 	balloon_stats.target_unpopulated -= nr_pages - pgno;
 	return ret;
 }
-EXPORT_SYMBOL(alloc_xenballooned_pages);
+EXPORT_SYMBOL(xen_alloc_unpopulated_pages);
 
 /**
- * free_xenballooned_pages - return pages retrieved with get_ballooned_pages
+ * xen_free_unpopulated_pages - return pages retrieved with get_ballooned_pages
  * @nr_pages: Number of pages
  * @pages: pages to return
  */
-void free_xenballooned_pages(int nr_pages, struct page **pages)
+void xen_free_unpopulated_pages(int nr_pages, struct page **pages)
 {
 	int i;
 
@@ -680,9 +681,9 @@ void free_xenballooned_pages(int nr_pages, struct page **pages)
 
 	mutex_unlock(&balloon_mutex);
 }
-EXPORT_SYMBOL(free_xenballooned_pages);
+EXPORT_SYMBOL(xen_free_unpopulated_pages);
 
-#if defined(CONFIG_XEN_PV) && !defined(CONFIG_XEN_UNPOPULATED_ALLOC)
+#if defined(CONFIG_XEN_PV)
 static void __init balloon_add_region(unsigned long start_pfn,
 				      unsigned long pages)
 {
@@ -705,6 +706,7 @@ static void __init balloon_add_region(unsigned long start_pfn,
 	balloon_stats.total_pages += extra_pfn_end - start_pfn;
 }
 #endif
+#endif
 
 static int __init balloon_init(void)
 {
diff --git a/include/xen/balloon.h b/include/xen/balloon.h
index 95a4187f263b..d6ee920fafa4 100644
--- a/include/xen/balloon.h
+++ b/include/xen/balloon.h
@@ -27,9 +27,6 @@ extern struct balloon_stats balloon_stats;
 
 void balloon_set_new_target(unsigned long target);
 
-int alloc_xenballooned_pages(int nr_pages, struct page **pages);
-void free_xenballooned_pages(int nr_pages, struct page **pages);
-
 #ifdef CONFIG_XEN_BALLOON
 void xen_balloon_init(void);
 #else
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 43efba045acc..9f031b5faa54 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -52,13 +52,7 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
 extern u64 xen_saved_max_mem_size;
 #endif
 
-#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
 int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
 void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
-#else
-#define xen_alloc_unpopulated_pages alloc_xenballooned_pages
-#define xen_free_unpopulated_pages free_xenballooned_pages
-#include <xen/balloon.h>
-#endif
 
 #endif	/* _XEN_XEN_H */
-- 
2.26.2


