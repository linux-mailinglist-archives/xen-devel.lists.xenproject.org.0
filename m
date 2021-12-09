Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077EA46F49A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 21:06:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243311.420914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPfn-0005NV-QR; Thu, 09 Dec 2021 20:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243311.420914; Thu, 09 Dec 2021 20:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvPfn-0005Ka-Lr; Thu, 09 Dec 2021 20:05:47 +0000
Received: by outflank-mailman (input) for mailman id 243311;
 Thu, 09 Dec 2021 20:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OcP=Q2=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mvPfl-0004Xd-VB
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 20:05:45 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 647a245a-592b-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 21:05:44 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id cf39so2064200lfb.8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Dec 2021 12:05:45 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o12sm87371lft.134.2021.12.09.12.05.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Dec 2021 12:05:44 -0800 (PST)
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
X-Inumbo-ID: 647a245a-592b-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S5p+2FMTZ9me3f7MgyffrybzDu1cB0H0WkSIssxF4tQ=;
        b=L+12IgIWe9epXxHZEYZ6HgwZbTEbj/L3wLIDxUpfg2E1xfGiWQMCwOe4aBrheOaE0z
         wACfBvNIMkXEf+nya8oleo9e8liD3Up08GRb4Pf37/nVLwjUKrMltKBaKTIRQizuPTHa
         kiB2eeFQVyRO63kGFUo/eHdq51GIFL/uNXEQrwXCo/A+hV/HCtFwDoXNyGsTEKlu6OmK
         enU+r1Tg1ZYL1MEeX5Ui3wMAW53n6E8DRTyEXCbfwpJxJDVvdGA6r445ekgReyO47/KG
         4eMBCsKkqlUsop0XMggtfAv6ao4oSO6uuSiJshxVb2O+ztOTDIWehgeVPb4vaQXzfM9s
         kn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S5p+2FMTZ9me3f7MgyffrybzDu1cB0H0WkSIssxF4tQ=;
        b=tFJd13PsjAUFPt9h9emw15BStdFKsoSBlLX3SgRnz8R5jk3L/BVZunpfJDB0OMoZ52
         uRGp501JinsTfqNCKeML3TnKDH20xn9FWRDRG5dHbCmPaJNMX0QgosFLCOwkx/oMWiBS
         4kuuEdif2FuJnRS/cbQg005PPM3H94QhQktb1vkEiI7nlvR7Jx6zk2OxWSpDiZEVtlzC
         rf9q+87Lq3FV0l5vmENgosxSTIE49r1c6EjfADOKuTM0iacpHllDBBhEKducH61B3A69
         smlB2zCy9IRUcur4n/ZwHgAPHcgLqAhTgxk7OTLVSo0GaR6VOyEde8Zsha/ARDSrrwKK
         41Rw==
X-Gm-Message-State: AOAM533wcbM9mrkRB9AY+C0DKt/Kw0XaQ46kVWa394rYNLDW4X23RpYR
	aiqJxr5Vr4CNbfHulZg3vJbpxau82l9+dQ==
X-Google-Smtp-Source: ABdhPJzXmNpIc4USAluGA5qsH7ufiWxU3sy77PqmbLRlZ2c4zMxbHDRyt5AvEYyGUnPsWWW7TFMqdg==
X-Received: by 2002:a05:6512:3052:: with SMTP id b18mr8189605lfb.424.1639080344638;
        Thu, 09 Dec 2021 12:05:44 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V4 3/6] xen/balloon: Bring alloc(free)_xenballooned_pages helpers back
Date: Thu,  9 Dec 2021 22:05:33 +0200
Message-Id: <1639080336-26573-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639080336-26573-1-git-send-email-olekstysh@gmail.com>
References: <1639080336-26573-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch rolls back some of the changes introduced by commit
121f2faca2c0a "xen/balloon: rename alloc/free_xenballooned_pages"
in order to make possible to still allocate xenballooned pages
if CONFIG_XEN_UNPOPULATED_ALLOC is enabled.

On Arm the unpopulated pages will be allocated on top of extended
regions provided by Xen via device-tree (the subsequent patches
will add required bits to support unpopulated-alloc feature on Arm).
The problem is that extended regions feature has been introduced
into Xen quite recently (during 4.16 release cycle). So this
effectively means that Linux must only use unpopulated-alloc on Arm
if it is running on "new Xen" which advertises these regions.
But, it will only be known after parsing the "hypervisor" node
at boot time, so before doing that we cannot assume anything.

In order to keep working if CONFIG_XEN_UNPOPULATED_ALLOC is enabled
and the extended regions are not advertised (Linux is running on
"old Xen", etc) we need the fallback to alloc_xenballooned_pages().

This way we wouldn't reduce the amount of memory usable (wasting
RAM pages) for any of the external mappings anymore (and eliminate
XSA-300) with "new Xen", but would be still functional ballooning
out RAM pages with "old Xen".

Also rename alloc(free)_xenballooned_pages to xen_alloc(free)_ballooned_pages
and make xen_alloc(free)_unpopulated_pages static inline in xen.h
if CONFIG_XEN_UNPOPULATED_ALLOC is disabled.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes V2 -> V3:
   - new patch

Changes V3 -> V4:
   - no changes
---
 drivers/xen/balloon.c | 20 +++++++++-----------
 include/xen/balloon.h |  3 +++
 include/xen/xen.h     | 14 ++++++++++++++
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index ba2ea11..a2c4fc49 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -581,7 +581,6 @@ void balloon_set_new_target(unsigned long target)
 }
 EXPORT_SYMBOL_GPL(balloon_set_new_target);
 
-#ifndef CONFIG_XEN_UNPOPULATED_ALLOC
 static int add_ballooned_pages(unsigned int nr_pages)
 {
 	enum bp_state st;
@@ -610,12 +609,12 @@ static int add_ballooned_pages(unsigned int nr_pages)
 }
 
 /**
- * xen_alloc_unpopulated_pages - get pages that have been ballooned out
+ * xen_alloc_ballooned_pages - get pages that have been ballooned out
  * @nr_pages: Number of pages to get
  * @pages: pages returned
  * @return 0 on success, error otherwise
  */
-int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
+int xen_alloc_ballooned_pages(unsigned int nr_pages, struct page **pages)
 {
 	unsigned int pgno = 0;
 	struct page *page;
@@ -652,23 +651,23 @@ int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 	return 0;
  out_undo:
 	mutex_unlock(&balloon_mutex);
-	xen_free_unpopulated_pages(pgno, pages);
+	xen_free_ballooned_pages(pgno, pages);
 	/*
-	 * NB: free_xenballooned_pages will only subtract pgno pages, but since
+	 * NB: xen_free_ballooned_pages will only subtract pgno pages, but since
 	 * target_unpopulated is incremented with nr_pages at the start we need
 	 * to remove the remaining ones also, or accounting will be screwed.
 	 */
 	balloon_stats.target_unpopulated -= nr_pages - pgno;
 	return ret;
 }
-EXPORT_SYMBOL(xen_alloc_unpopulated_pages);
+EXPORT_SYMBOL(xen_alloc_ballooned_pages);
 
 /**
- * xen_free_unpopulated_pages - return pages retrieved with get_ballooned_pages
+ * xen_free_ballooned_pages - return pages retrieved with get_ballooned_pages
  * @nr_pages: Number of pages
  * @pages: pages to return
  */
-void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
+void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pages)
 {
 	unsigned int i;
 
@@ -687,9 +686,9 @@ void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 
 	mutex_unlock(&balloon_mutex);
 }
-EXPORT_SYMBOL(xen_free_unpopulated_pages);
+EXPORT_SYMBOL(xen_free_ballooned_pages);
 
-#if defined(CONFIG_XEN_PV)
+#if defined(CONFIG_XEN_PV) && !defined(CONFIG_XEN_UNPOPULATED_ALLOC)
 static void __init balloon_add_region(unsigned long start_pfn,
 				      unsigned long pages)
 {
@@ -712,7 +711,6 @@ static void __init balloon_add_region(unsigned long start_pfn,
 	balloon_stats.total_pages += extra_pfn_end - start_pfn;
 }
 #endif
-#endif
 
 static int __init balloon_init(void)
 {
diff --git a/include/xen/balloon.h b/include/xen/balloon.h
index e93d4f0..f78a6cc 100644
--- a/include/xen/balloon.h
+++ b/include/xen/balloon.h
@@ -26,6 +26,9 @@ extern struct balloon_stats balloon_stats;
 
 void balloon_set_new_target(unsigned long target);
 
+int xen_alloc_ballooned_pages(unsigned int nr_pages, struct page **pages);
+void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pages);
+
 #ifdef CONFIG_XEN_BALLOON
 void xen_balloon_init(void);
 #else
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 9f031b5..86c5b37 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -52,7 +52,21 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
 extern u64 xen_saved_max_mem_size;
 #endif
 
+#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
 int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
 void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
+#else
+#include <xen/balloon.h>
+static inline int xen_alloc_unpopulated_pages(unsigned int nr_pages,
+		struct page **pages)
+{
+	return xen_alloc_ballooned_pages(nr_pages, pages);
+}
+static inline void xen_free_unpopulated_pages(unsigned int nr_pages,
+		struct page **pages)
+{
+	xen_free_ballooned_pages(nr_pages, pages);
+}
+#endif
 
 #endif	/* _XEN_XEN_H */
-- 
2.7.4


