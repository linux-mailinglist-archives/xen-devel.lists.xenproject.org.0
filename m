Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6268372D170
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547480.854977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ois-0002Iu-NX; Mon, 12 Jun 2023 21:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547480.854977; Mon, 12 Jun 2023 21:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ois-0002DJ-FO; Mon, 12 Jun 2023 21:05:10 +0000
Received: by outflank-mailman (input) for mailman id 547480;
 Mon, 12 Jun 2023 21:05:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8oip-0007V0-VI
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:07 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceea87f2-0964-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 23:05:07 +0200 (CEST)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-19f30256921so3580708fac.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:07 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:06 -0700 (PDT)
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
X-Inumbo-ID: ceea87f2-0964-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603906; x=1689195906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8r19jukxjbsIB2/Mx0wfUFI2Md2D0Tal9unGSXZoJa8=;
        b=bBBhxHhwNc0dlcaV8h2a4XYBtWHGe22hvKvpniF7KzCYgALGdtw6ZDxkDC9x8Aeb3u
         L7SfltNSUTPpMMAZAPZwSuq1VjJBBWwWiBaC+Bz46NWJJnZ6VvwLLTRGFLrpelYb2La+
         Z5XBEGo2Lx+4Q4s65Lii1xiAS9gXRmCdJj9fBmU+7pl8WPQzciZNN9tEea4s2EymiOfj
         uSb7iAfMXBR2nKnU1BBVn2AVnOIW9drJ/7GGkqivFyyrk3Sd/OJyxdPtL4bbaX3dpY3E
         iXz0Nc/l9PDCGRHW4+I9NS6xogIi8lZKNWODyR8ULfa6yt07nj/HtSeI3w5uor1wLjvR
         igBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603906; x=1689195906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8r19jukxjbsIB2/Mx0wfUFI2Md2D0Tal9unGSXZoJa8=;
        b=D1i5fzWJAZ4rGedy1w65SXs2bmZVPxREaFMAwLrTfz0HqJgdQfD3jQoCM7mTDXSYtp
         CSB3iq6gcg3qgqwzwTBK4nUsxcaSPqMxhbktA7FUB2sWpS23cRABDsdlcnKeUb7SBp51
         7Y6Ysm/hU6Onr85CvfYzBSUY2sTYkK8jujF67I7I5sXBAdADx2BoLpFy4/f+VeU7dnVh
         dFu+m3rqw4JiChajNUOrTgl+JoDazh9LgNDLJ3wZAXWDPxvSm6McfHwmfaFRfh8DVftY
         qgD6MdeUiuaVstO/j3neOJgTyVB38cf8NNJL/5c8auP5dQkNxy77MZMy/YQiJDYczGM9
         HJ1w==
X-Gm-Message-State: AC+VfDygiUQXmnGLgr79HVyL1Xlz/BRPUr4hZesM4FHZGNHB7kA1ho2s
	75SxoC6RGayQhLhAUS7jppY=
X-Google-Smtp-Source: ACHHUZ6a/96wj8UsR1eewejCsUK79jNNmW6NRKVRY6WskMtRjwMJM0HWL1CF60/WviLDJygSxMchcw==
X-Received: by 2002:a05:6870:989c:b0:1a3:4072:58f1 with SMTP id eg28-20020a056870989c00b001a3407258f1mr7318868oab.6.1686603906371;
        Mon, 12 Jun 2023 14:05:06 -0700 (PDT)
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
Subject: [PATCH v4 10/34] mm: Convert ptlock_init() to use ptdescs
Date: Mon, 12 Jun 2023 14:03:59 -0700
Message-Id: <20230612210423.18611-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index daecf1db6cf1..f48e626d9c98 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2857,7 +2857,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
-static inline bool ptlock_init(struct page *page)
+static inline bool ptlock_init(struct ptdesc *ptdesc)
 {
 	/*
 	 * prep_new_page() initialize page->private (and therefore page->ptl)
@@ -2866,10 +2866,10 @@ static inline bool ptlock_init(struct page *page)
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
 
@@ -2882,13 +2882,13 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
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
@@ -2947,7 +2947,7 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(ptdesc_page(ptdesc));
+	return ptlock_init(ptdesc);
 }
 
 static inline void pmd_ptlock_free(struct page *page)
-- 
2.40.1


