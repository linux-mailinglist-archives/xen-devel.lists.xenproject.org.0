Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FB760772
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:21:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569359.889843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Y1-0003TL-Ss; Tue, 25 Jul 2023 04:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569359.889843; Tue, 25 Jul 2023 04:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Y1-0003Pi-OA; Tue, 25 Jul 2023 04:21:21 +0000
Received: by outflank-mailman (input) for mailman id 569359;
 Tue, 25 Jul 2023 04:21:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Y0-00023t-2w
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:20 +0000
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [2607:f8b0:4864:20::b33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b35b6c95-2aa2-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 06:21:18 +0200 (CEST)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-c5f98fc4237so4296915276.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:18 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:16 -0700 (PDT)
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
X-Inumbo-ID: b35b6c95-2aa2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258877; x=1690863677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLtCJBysrabsGyMeKlbK2lKTjEzHhmjaMpElw0hOQuQ=;
        b=gPFq/JoYwJjLf9rVCoB8Lw8LOssqafkFQKm1MRAos7/YFfmCVQ5zZtnC0rhhBdQCXk
         N7cP2rb2Gc3I1sIFDEA6WDVqpFvuzV9g0ksMwxcFOLrW1SrVCbGbF2JEMKH7iGrlo6kh
         szCDqr3K9qHITaCMG+6I4Bv2DGuidVlNjZotb70C80Hqf3ER0SLHbbdax/uMFjYuJbcP
         w5E647QIdwTWza0fMIXSMCOI01eppzdj1zv2JddPFf9pPmBUxHnIhf/jhE5I9HeeHTOn
         pGU0qrcAaECYa9O8B/YJzvoVn8SSXjyAEPRTA5PEQfVza6O4EJzAJ9koweASwJRx6Tml
         xocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258877; x=1690863677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLtCJBysrabsGyMeKlbK2lKTjEzHhmjaMpElw0hOQuQ=;
        b=fVm+YVde7wtk5wNM/RDXS3otVozwUp66OTekU3jCci4u1gSZWyT01cCkYxELM5FvvN
         RSPxGfgwLt0g+rCUClYJl+xzFR88VbEMGwT3XTu40GbA1lHJN/n9fZVZGPo8f4mDNlGT
         6t6m5ma+yP494NNCECeA4UHCC8hzbW08EXFEA8Xd22LNUOPX3263bDLDX+qnj5be1ODc
         jBaYlMPDg1OPGLwaUGQD9yoeQwU0JmzeS/cU8kezdd7vJhj2Gx6DBYLSixUn74OBS9wE
         86jPIwASO+ACjXnnesHkBwuQDuBti8vXzzF8rfL6AqxC4w9fh40XIOhkq3cs4jW7dE5y
         +NAQ==
X-Gm-Message-State: ABy/qLa1sty+YjiJs+gymQey+vIWFrYNBFFtLOtDkMfnl5pXq0XuW194
	1l+gmuLTKYpNgYFzgouhdtQ=
X-Google-Smtp-Source: APBJJlHyqmJ7X8HSspT6LddsJqdqN9Il/WFvcTF4BUwycttfbECYy8j8wA/EIsdExukzdWEa0jT4RQ==
X-Received: by 2002:a25:4cca:0:b0:d01:52da:9625 with SMTP id z193-20020a254cca000000b00d0152da9625mr7877273yba.13.1690258877265;
        Mon, 24 Jul 2023 21:21:17 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 05/31] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:25 -0700
Message-Id: <20230725042051.36691-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf552a106e4a..b3fce0bfe201 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2841,7 +2841,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2853,7 +2853,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2883,7 +2883,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 2130bad76eb1..4fee273595e2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6231,14 +6231,14 @@ void __init ptlock_cache_init(void)
 			SLAB_PANIC, NULL);
 }
 
-bool ptlock_alloc(struct page *page)
+bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	spinlock_t *ptl;
 
 	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
 	if (!ptl)
 		return false;
-	page->ptl = ptl;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-- 
2.40.1


