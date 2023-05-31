Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D9B718D59
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542096.845686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TW6-0004H6-9j; Wed, 31 May 2023 21:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542096.845686; Wed, 31 May 2023 21:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TW5-00042T-GJ; Wed, 31 May 2023 21:38:01 +0000
Received: by outflank-mailman (input) for mailman id 542096;
 Wed, 31 May 2023 21:37:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TPt-0006zB-TB
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:37 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84e22f42-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:31:36 +0200 (CEST)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-565cfe4ece7so747477b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:36 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:34 -0700 (PDT)
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
X-Inumbo-ID: 84e22f42-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568695; x=1688160695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oaubVECbDcpncGofy3SyRxI7NQgpixW3FZHbyn9Yjk=;
        b=ditcnS71SBC9ni8k286RH+lbOQgfG7PCRFPFB/+gsGtd91WJDFwTiqS8wSFxx5SqNm
         NDEu55kAliwqkv4+OeAiBx4Dtlk6APsI2JGOnAuJmD3QcfvBggdvrn23yK3wDSKM6a8t
         e32asmJ/Rn3K4ua1Ni58ZwRhYlStsE+77Viu6GCYO1u0Ujf908XsQZtJlTqrHFJAkKkK
         Mjajw5BTeegwx0KghNxbnl2uzVS9ZiBwBGYnqna7EVzWEplqQfDV4S8WEKdXyIryNNy8
         tJSCeZKUks8IOUQQh+yhMBSuygAiQUvt/2CrjYMsfZwcI4YczZhuoKfku3jgAV+GNYVx
         ktNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568695; x=1688160695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oaubVECbDcpncGofy3SyRxI7NQgpixW3FZHbyn9Yjk=;
        b=UaGcElmkN4qnsWmye+cNX+ex/+cDN7WCA0WZF8mKGjss3pcBJrn+NwBwDiB92HF9hW
         zbh2M4tPTVxO3XROQV5j6s+JCYlIPiw7AGAIHPkmYv4ECCfIeQjwBnoFhbZm2xBjD7JG
         NlHZigsQXNqYMqlDlIKO1VOxDbetr6PpF8nh5Bq94+9EN2asmPjl90CyM3FeTpYCbWjc
         YIqWKM+BIHoLnwl05cY5HBX33b4xlfOo26l4kA4vtCsJdpFfy/TZeZopFppjXduS9+bu
         lwmrnsJQQOcuJlPZgbRmQQ7qk11q0bLU9iFy9+lQ2oJkegi/uhdvocTRvz7m5Lxwkr/U
         bJxg==
X-Gm-Message-State: AC+VfDzHzftinvoqLt5oqw+/u070lUKWadjWtsB0RPDV2PNm/XxxEU7D
	T1wMcY+ociCxZXP3YCBzy5IYpFmxw54A5g==
X-Google-Smtp-Source: ACHHUZ5aCiPljYuheD8NnJvwTTWKzTm6/fHh7z9wHXOX5DNM+ib+INiEbpn3KPIafpnwazjaJRxT7w==
X-Received: by 2002:a81:5294:0:b0:561:e540:b1b3 with SMTP id g142-20020a815294000000b00561e540b1b3mr7813627ywb.38.1685568694951;
        Wed, 31 May 2023 14:31:34 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v3 13/34] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
Date: Wed, 31 May 2023 14:30:11 -0700
Message-Id: <20230531213032.25338-14-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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
index 72725aa6c30d..2c7d27348ea9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2867,20 +2867,34 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
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
@@ -2962,20 +2976,34 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
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


