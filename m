Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889BE769DB3
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573255.897865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJQ-0003hL-IJ; Mon, 31 Jul 2023 17:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573255.897865; Mon, 31 Jul 2023 17:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJQ-0003bc-7p; Mon, 31 Jul 2023 17:04:04 +0000
Received: by outflank-mailman (input) for mailman id 573255;
 Mon, 31 Jul 2023 17:04:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJO-0000C0-Rx
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:04:02 +0000
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e8b2538-2fc4-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 19:04:01 +0200 (CEST)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5860c7fc2fcso17243107b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:04:01 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:03:59 -0700 (PDT)
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
X-Inumbo-ID: 3e8b2538-2fc4-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823040; x=1691427840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM8s3dDlKIn9bcZ3Rv1fAyQJ11tvy15JiujAITQGQIU=;
        b=WsnCjEuFun6IuHpPh6Ck/rBg4AZLbVHEs2jk+7TEc5kPbUlyDbLU82vMQ8hYNiUbEV
         KmukkQXHlnalx2MRwxX9OA1ED5qQ+cRzMsv/rlYCU41nnUNJeib6/uXFu8sMt236/2Ud
         yhZAMNcebKfkSv6mc59ZybiKh0RsfAPQpPnm2pft2DHqmzXA9/C0fNB/u3wlBocoiSJC
         LtpkvTvVemtPOevOsyRiBPGxBKIgXaumZpQx0YFqajcNPkaTnpsizZKv1A3XIPWZnK5y
         p/CzUaAjAQ1JZb9e9DygJrxewNU/aZAjuX8qYUs6cV2yG2QRoeh00nb4O3A983HwtiRJ
         fbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823040; x=1691427840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GM8s3dDlKIn9bcZ3Rv1fAyQJ11tvy15JiujAITQGQIU=;
        b=RtDmsjOVDmhYZTPoWrf7PX3ETJldj4iG+t7WNnCVf+HEtD/P1CsYWqOa+tgaZjd4kX
         ew8iE9yWVvY0SbJYQsv6MoawJPfHeJ0QphD4tuPmiLiXS8wYUbLq19eHWR862plqTmfS
         OMZYu0vRRQvVwb3uN+iA9FtA1VRsGne9nRTtX8EGwAk6aXATgFMC/PN3raAGwOAJp8Jn
         4ybGXuefKRkvP27ucC5w0mztXb5jjocsLvqA++sMj48cUJq5kbw0z/VIbEBeRTKWW+wK
         vfxgbV/g9wYtAICz8/lw8axIjbOiaI0ItKV/AOVzpt60hJbcN+ocr4xe1lRI44ML2Mt2
         MCbQ==
X-Gm-Message-State: ABy/qLbfs+4QVbT5C7SfJ3HyGAig5Td7cm5TNh8VbYE1KW4ZtBJHLY2q
	w1paVfYFK+Rc2nZYLZg0abg=
X-Google-Smtp-Source: APBJJlHch/jSJCdVVtDWb1WClZ5gGKwbX6GY1zRRfwmE6xAtgRg67mCRvfprsxzmmxwehzomhr3VNg==
X-Received: by 2002:a25:c7d1:0:b0:d08:20f1:f7cd with SMTP id w200-20020a25c7d1000000b00d0820f1f7cdmr8274869ybe.16.1690823039767;
        Mon, 31 Jul 2023 10:03:59 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 11/31] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
Date: Mon, 31 Jul 2023 10:03:12 -0700
Message-Id: <20230731170332.69404-12-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create pagetable_pte_ctor(), pagetable_pmd_ctor(), pagetable_pte_dtor(),
and pagetable_pmd_dtor() and make the original pgtable
constructor/destructors wrappers.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 56 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ffddae95af78..bd3d99d81984 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2902,20 +2902,34 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
-static inline bool pgtable_pte_page_ctor(struct page *page)
+static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
-	if (!ptlock_init(page_ptdesc(page)))
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	if (!ptlock_init(ptdesc))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	__folio_set_pgtable(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 	return true;
 }
 
+static inline bool pgtable_pte_page_ctor(struct page *page)
+{
+	return pagetable_pte_ctor(page_ptdesc(page));
+}
+
+static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	ptlock_free(ptdesc);
+	__folio_clear_pgtable(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page_ptdesc(page));
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	pagetable_pte_dtor(page_ptdesc(page));
 }
 
 pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp);
@@ -3013,20 +3027,34 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 	return ptl;
 }
 
-static inline bool pgtable_pmd_page_ctor(struct page *page)
+static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
 {
-	if (!pmd_ptlock_init(page_ptdesc(page)))
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	if (!pmd_ptlock_init(ptdesc))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	__folio_set_pgtable(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 	return true;
 }
 
+static inline bool pgtable_pmd_page_ctor(struct page *page)
+{
+	return pagetable_pmd_ctor(page_ptdesc(page));
+}
+
+static inline void pagetable_pmd_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	pmd_ptlock_free(ptdesc);
+	__folio_clear_pgtable(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page_ptdesc(page));
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	pagetable_pmd_dtor(page_ptdesc(page));
 }
 
 /*
-- 
2.40.1


