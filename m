Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF9273F199
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555697.867731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzB3-0008FN-0i; Tue, 27 Jun 2023 03:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555697.867731; Tue, 27 Jun 2023 03:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzB2-0008Ar-S7; Tue, 27 Jun 2023 03:15:36 +0000
Received: by outflank-mailman (input) for mailman id 555697;
 Tue, 27 Jun 2023 03:15:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzB1-0003uL-QA
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:15:35 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0d2faa5-1498-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 05:15:34 +0200 (CEST)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5702415be17so30769937b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:15:34 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:15:32 -0700 (PDT)
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
X-Inumbo-ID: e0d2faa5-1498-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835733; x=1690427733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnNdr5PDFTKJu1h5zX1p1xVUKJvhUfKvVUh/w7ZbrdI=;
        b=GTe2EUys5qOsmL9h+39HkmdbRnOOR/ecm3IZWO97nmipqYf9WxPQOFqim+diknH7FN
         cktZXimy2BTWcqn/5d10bb15uuq3PUdsia+9j36BiOqVzXj30Geeor6rYSL1Rhj9WqCn
         LmJ9N5OLeEYa/H4vUyKvc7Otfz8SqaPNrXVtQODdE9ilutCJ24KAZJChe9ZmvWB1bUx1
         7bpUWrAZkpPXIiT5JcrWxhsn1qZ9K0WItSWhparWMs+/rm9Q3PdTkYO+KF0D1GfwN1hv
         0eQBee2svyGNdGSpwEO15WqpXr0WlpHBW3JMLWAP0NGZGcgLzbwqXYAJu19e1eeZo9JE
         G7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835733; x=1690427733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnNdr5PDFTKJu1h5zX1p1xVUKJvhUfKvVUh/w7ZbrdI=;
        b=PSP7Wk/aMtLeQJEluPcPsA4FXsZrMKGTOLSYi+WLQSE32ro0cEofqM8iYNMitpfGtA
         DizuN+vWVGP23eg8vXSEdvuKBkpRYbsW0W0zgc59bXwJL3y2Ide/hantm7hc945Qdery
         /d3mV94+owDA6tE1aAPGLvaWfPJ+9zpj9B2BLHVw0pWMYXIP+y3c7DS6ppzBXgCJoJj8
         ylxVGoBatlRgzS9jMXgqarYP2acsvfrX8+Tij272A30yTJS1LXSbi9GoWnIVUTvYKKQ7
         /aXBrg+dWR7fFohmtqrakKKJ2Z75wUleLLEGvIOPXrScyGioeXyPSF6Q+0By2xNW6Fg0
         Yomw==
X-Gm-Message-State: AC+VfDzY1BN1F8XxlCHdWOXUxLSrwzfJgn6CrS6gYPymhTIAWPe7nYSN
	QOzqXv6KJ0mP92ePYBFpAgQ=
X-Google-Smtp-Source: ACHHUZ42Y/0xAZG9OHSM8VrbwgLQ6VZ3weOziZPodRcVkI1essgSTHJwJyadoUyqzcMtcD2kr7P2zg==
X-Received: by 2002:a0d:e005:0:b0:573:4d89:ecb5 with SMTP id j5-20020a0de005000000b005734d89ecb5mr19780303ywe.39.1687835732948;
        Mon, 26 Jun 2023 20:15:32 -0700 (PDT)
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
Subject: [PATCH v6 12/33] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
Date: Mon, 26 Jun 2023 20:14:10 -0700
Message-Id: <20230627031431.29653-13-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
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
index 69e6d6696c44..356e79984cf9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2859,20 +2859,34 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
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
@@ -2965,20 +2979,34 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
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


