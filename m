Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050B572D176
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547482.854997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8oiv-00037W-LE; Mon, 12 Jun 2023 21:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547482.854997; Mon, 12 Jun 2023 21:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8oiv-00032e-EG; Mon, 12 Jun 2023 21:05:13 +0000
Received: by outflank-mailman (input) for mailman id 547482;
 Mon, 12 Jun 2023 21:05:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8oit-0007V0-Tb
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:11 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d146c057-0964-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 23:05:11 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-bc9782291f5so1846012276.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:11 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:09 -0700 (PDT)
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
X-Inumbo-ID: d146c057-0964-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603910; x=1689195910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3tBY7hT3/idMeTvV/y5HT5RaeYwytDxSu3wHZHQdRM=;
        b=RjdfKdwo6GGvbEWocjhzyfrIG+s4yeNfDttrrqwnEGORQ/YPC7ZVmdyS10JF0LYqJm
         b6bU5xmGwzXI5ZQkTCKkSHLlY6xUp5TM7mFPqEQ9UqdLvwpNas5BJtZzv+iakqyWNnr7
         ZbUjNLXHM5JpGCASroX3mIknKspaiVxCKS4EWppAxztT7eGSIBBwCNu77Cy7Q7mvbAeg
         nTWfF3Iwgf3p1K6E3gymTY1cP1wx9AawPcYyp7n9Z4TFzq2NVk0pgr/BAa6wSZIWoNVz
         1+4z+b7cL83but8FZFxeoUPYZLJOz76q6IoC2hSwlZOG2NbQ38EQV2G66LjHRDN0bxiF
         BZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603910; x=1689195910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3tBY7hT3/idMeTvV/y5HT5RaeYwytDxSu3wHZHQdRM=;
        b=f9ZwTVssjSuhQGvz4B/56tsBJxMyHxecUU9n+bfEGpdYZXKkf63Y6W2DFFElsbM0vj
         eu59T2XQM9qOCMbuOyGv50x0UT6atvwilE93X43O9kVZIFyVPz4bI43Rwux7k9f0fba6
         xIj51O+mFbo9g83puZEilT2AioBr9fwE/61YhYwrifTvCsemz+XGCDHAqva29NUqwYhJ
         /ac9k2N4fhZcEE3atYKqlXaMAIpU7gve7cGjLbaORL9HNrxLKQ6Q+lQ4EokC/Dik6mqD
         uGW0lkQA44EUTaYR45pYXaSeCgB5RnuLjnPmSJc+CPzsqey6JfIqpZd/OiwuqVKWVUpr
         8aYg==
X-Gm-Message-State: AC+VfDz0WeB1zP5zmLpQKtzArEBJQwPDIACk/vM7gMbmwyL5XYuDLUl/
	C3TV91a8doOCZHH+9HfNFrQ=
X-Google-Smtp-Source: ACHHUZ7G4LX/rzVzMPXBxUvcWoM4NVaiAOMXANZTQdr/GK3rhr2fg9ZSIMvpPffGov7SQ8stbPFS3w==
X-Received: by 2002:a05:6902:2c7:b0:ba6:e17a:abc2 with SMTP id w7-20020a05690202c700b00ba6e17aabc2mr8959494ybh.63.1686603910188;
        Mon, 12 Jun 2023 14:05:10 -0700 (PDT)
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
Subject: [PATCH v4 12/34] mm: Convert ptlock_free() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:01 -0700
Message-Id: <20230612210423.18611-13-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 mm/memory.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3b54bb4c9753..a1af7983e1bd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2826,7 +2826,7 @@ static inline void pagetable_clear(void *x)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2842,7 +2842,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2883,7 +2883,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2897,7 +2897,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2955,7 +2955,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index ba9579117686..d4d2ea5cf0fd 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5945,8 +5945,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-void ptlock_free(struct page *page)
+void ptlock_free(struct ptdesc *ptdesc)
 {
-	kmem_cache_free(page_ptl_cachep, page->ptl);
+	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
-- 
2.40.1


