Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7FD72D178
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547489.855008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8oiz-0003kN-Uq; Mon, 12 Jun 2023 21:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547489.855008; Mon, 12 Jun 2023 21:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8oiz-0003iH-Ns; Mon, 12 Jun 2023 21:05:17 +0000
Received: by outflank-mailman (input) for mailman id 547489;
 Mon, 12 Jun 2023 21:05:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8oix-0007zJ-TY
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:15 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d281d2d6-0964-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 23:05:13 +0200 (CEST)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-561b7729a12so85788297b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:13 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:11 -0700 (PDT)
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
X-Inumbo-ID: d281d2d6-0964-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603912; x=1689195912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpDrDA23aZZSOuD9ECPgZVlXX9wPcibxiFG6a9Pg6kw=;
        b=YrxPmjxN/Qkfa39Za5HTgq4QQ3f9/zju1xoEkMHY76VWuya44wSbPKtXjzKY3v7sqU
         GBxsM+H0usX0mr3+rL1pflvYDpTa44gJOcWxVcOnDkRvcMNiHbLrpt96vvJ6FNwKJltW
         cMJPyFVQ/eSt9EDvrymbmWnro3jKR5HGdt4l2wI6AjCbDnCnt1cg4A0jjRLl9BCzyZ7N
         VzgyM4qBAMmkmToFHzJWSn2lcW28mUGQcMgbZJj1Lk3UeDxgd0pcGGp9/tqybVBUSS6z
         sfRYAsqcMK0gYJ/10nym3sY5+OJ+ZE83bX/QwPKBvH0660Lco3siIL8/QCwpR8viXQgt
         6rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603912; x=1689195912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpDrDA23aZZSOuD9ECPgZVlXX9wPcibxiFG6a9Pg6kw=;
        b=ZcTGlCT6WAnZYyDvHg7x+t8EAx5pe7y5vV8rQKfZ3R5ACsfO014J8H76IN9gD51/hG
         9CHeDtrISThnUDPCJQjOVYRbKPLRGFr1m1jH3tdz0KyZFxD6fEeuJPwYltUZOy23WKKB
         SWYh29WRRS2MHXsdEveT5N1hm6rsse7QkiZL9i9zmwr68Kl9ajywYQukixX1KItAWeml
         m//elvHGJ8xjR8IjbncyNsGvt+qrrjcfD7taHCGLsMabZmHwaOqsqGn3tZ6aT24Q9ESt
         aVPkMGPSVJ242Fv4IaOUHWyKoc9WoPd2kDlRiY5L6sTHt2BJbdC5PXkkEs3q23IMAYB3
         1szg==
X-Gm-Message-State: AC+VfDxJjpk2oyVqpvllac5ULXcf8V/ue/ua1f+FGv/6VYWRaqfaRxy0
	EM9yitv4xK2pyE0Ort+J74k=
X-Google-Smtp-Source: ACHHUZ4rEtwsIJS0u8/qiBl+7RQztIv/50rVsQeASCwgplg4IOIGaQtPyW+cRDHUBMrIJvgIE2xULQ==
X-Received: by 2002:a81:4e4b:0:b0:569:e92f:72a with SMTP id c72-20020a814e4b000000b00569e92f072amr14103246ywb.16.1686603912361;
        Mon, 12 Jun 2023 14:05:12 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v4 13/34] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
Date: Mon, 12 Jun 2023 14:04:02 -0700
Message-Id: <20230612210423.18611-14-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Creates pagetable_pte_ctor(), pagetable_pmd_ctor(), pagetable_pte_dtor(),
and pagetable_pmd_dtor() and make the original pgtable
constructor/destructors wrappers.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 56 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a1af7983e1bd..dc211c43610b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2886,20 +2886,34 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
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
+	__folio_set_table(folio);
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
+	__folio_clear_table(folio);
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
 
 #define pte_offset_map_lock(mm, pmd, address, ptlp)	\
@@ -2981,20 +2995,34 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
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
+	__folio_set_table(folio);
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
+	__folio_clear_table(folio);
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


