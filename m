Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7C2718C1E
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542020.845474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPp-0001tP-WD; Wed, 31 May 2023 21:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542020.845474; Wed, 31 May 2023 21:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPp-0001qC-M6; Wed, 31 May 2023 21:31:33 +0000
Received: by outflank-mailman (input) for mailman id 542020;
 Wed, 31 May 2023 21:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TPn-0006zB-Pf
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:31 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81617c7b-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:31:30 +0200 (CEST)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-568ba7abc11so707437b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:30 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:28 -0700 (PDT)
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
X-Inumbo-ID: 81617c7b-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568689; x=1688160689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xowfOyB08CJw8MKGIIgRKSCkyhh2uF8MvUFj9KXpTSw=;
        b=L8ygLqSRY2eqB8nseiiMf24A2f/spwq3tiGOrBuR5p7dj9EWG9ImFwe46ZZwXRtvRX
         /V86q8xSGkCuVPlvQOJ2SMa4rsoFmPrmu5autDJLeyd3yfLXEA6bbO2/4Yqm1LlWBfgW
         xJxuutRSGFBvTral/NTreMAMCGbSkBu5TZ5qxdEeFHUTponOUVV1jiviowhgii7tWLBq
         MEHuHS4DCf2z1UfCtRdUmDITSqJKFDRP0C3+jLAFaOsLApRcLJ8PsQ+aNZLN1wbuZUBY
         Px85P6DC+zY+Gwn3bCa+FGLrsmclVsP0ccqay7jLihOMLhj3/zlw+zFLVxYDPwbySfXO
         VKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568689; x=1688160689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xowfOyB08CJw8MKGIIgRKSCkyhh2uF8MvUFj9KXpTSw=;
        b=ZekeVHtadc+FJRIo3m1j+rZDgGK79Wuf6dA7IwRy7tYSQLnB/NDF9l3Rpvtpa4TLkC
         nIo2uoJs88bHz3HU++8Ej8v+wO8NKTcFcWhOHX5unF+iHAyU6Bw/QBZ2AyAf5y3iiqBx
         iwOSpi4a7JFfXBQZC4Tgf23VTQlGEU/hjbYtnQkrMyrhIuTGCcsJcVWUiIFxbYQDyzFW
         GjonhiyWMbyEhYG8wc6OjnDEgQHpngnrzr0Qy7s7kmOewPM4k7JCQtpFjMmEfwedETBM
         ODIdY5idVkjwve0N6XUWf6be7bxeEtG7H8/uIesxUEakIx1t6xC2KMg0vUBtbbawCFxE
         CkTw==
X-Gm-Message-State: AC+VfDzwkDqzyQ/LzNJPNA736JAgkJszlA/cnIEFGMQrRaA1wKg2PE3O
	fyGwpgb/oUioNby5p/eZJ/g=
X-Google-Smtp-Source: ACHHUZ4HC/p6n5oc2YZUDdXfXImpqPK7MSZMtRTu8JGDzMkRUKKOQ8wmCGx7YESYze8Eib1xLonoHg==
X-Received: by 2002:a81:5357:0:b0:561:c5c3:9d79 with SMTP id h84-20020a815357000000b00561c5c39d79mr7593955ywb.45.1685568689113;
        Wed, 31 May 2023 14:31:29 -0700 (PDT)
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
Subject: [PATCH v3 10/34] mm: Convert ptlock_init() to use ptdescs
Date: Wed, 31 May 2023 14:30:08 -0700
Message-Id: <20230531213032.25338-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8e63e60c399c..bc2f139de4e7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2838,7 +2838,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
-static inline bool ptlock_init(struct page *page)
+static inline bool ptlock_init(struct ptdesc *ptdesc)
 {
 	/*
 	 * prep_new_page() initialize page->private (and therefore page->ptl)
@@ -2847,10 +2847,10 @@ static inline bool ptlock_init(struct page *page)
 	 * It can happen if arch try to use slab for page table allocation:
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
-	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page_ptdesc(page)))
+	VM_BUG_ON_PAGE(*(unsigned long *)&ptdesc->ptl, ptdesc_page(ptdesc));
+	if (!ptlock_alloc(ptdesc))
 		return false;
-	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
+	spin_lock_init(ptlock_ptr(ptdesc));
 	return true;
 }
 
@@ -2863,13 +2863,13 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 static inline void ptlock_cache_init(void) {}
-static inline bool ptlock_init(struct page *page) { return true; }
+static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct page *page) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
 {
-	if (!ptlock_init(page))
+	if (!ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
@@ -2928,7 +2928,7 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(ptdesc_page(ptdesc));
+	return ptlock_init(ptdesc);
 }
 
 static inline void pmd_ptlock_free(struct page *page)
-- 
2.40.1


