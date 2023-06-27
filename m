Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FCA73F196
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555695.867720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzB0-0007Zv-Qj; Tue, 27 Jun 2023 03:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555695.867720; Tue, 27 Jun 2023 03:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzB0-0007Ru-Hu; Tue, 27 Jun 2023 03:15:34 +0000
Received: by outflank-mailman (input) for mailman id 555695;
 Tue, 27 Jun 2023 03:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzAy-0003pv-GM
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:15:32 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df982c28-1498-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 05:15:32 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-57688a146ecso35954577b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:15:31 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:15:30 -0700 (PDT)
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
X-Inumbo-ID: df982c28-1498-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835731; x=1690427731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhgUYiKwQSwYMGFv9d1r56wjiuPfdLCT9N5JwdJpvSY=;
        b=NN6JuQbcJSEhuQl119fqyrzmvfTJLSgZNGPIizHO44moV6zy7vRkkkGbpzNnm+T/zk
         LfpssTQxYHLCLcRT6ur03GhfUH0PR3hr1gEAZWn4KlOVQ/bRaXKu0XwyzIXh7FK2T78w
         GV5aBHngJRtwmpryMrqg1wnpyNcK63Z6rXozTP8pqdze8wtkdCn+4d6Nxd1VmHHTwiSp
         Hj2gVskjJaa7d3mxLgebdTWNoaiyWHEkTnVETMwzQNfFNqae/PKVEKJL0sEqbBCs/7Gc
         Lg3rR1WUfvzFXQfsjuyOG1PSX82wJS5wL2NRG2ks6qk/cPnX1GTuY36dOOOiPPB0JsGq
         3KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835731; x=1690427731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhgUYiKwQSwYMGFv9d1r56wjiuPfdLCT9N5JwdJpvSY=;
        b=ZUJIGSBcAnzl5l96ktVyr+JmRtbFAdekimuUG9p716FHW9OMRzM9RWGy4jBRqr+TBb
         u8Z6Us6Ip5S1hZ+RVqSq+C6RiYY1CQDtCXfHJiXtjZNly3abaGPxqNzdBNHNXK2VCmvs
         KpaJq7eEmjz386jtI2VbK1bbIlqwtmT70odwxD/cBan4oFFqPMaphJGWNZrJq/EOHgux
         fFegZXqnqo87nwp7SmdjaUwzG4xaPdhbOE2mRzG6tNahB6oxf0OI7k1cupdiFujNlvCi
         t2mJRPhthFUCmXxBMMdfe0EF7EZzcegV/CcekAhX1qgWVQ8/h8fvv0aQsf+RWGZsSLT/
         81jg==
X-Gm-Message-State: AC+VfDxjKf5D7RUxN+FO/06BnUgrTU5o9s+9+NbxU0rjv1h+99zYNkIQ
	6wzT2vsrHGc1xydzmzFV2sheX8p3jvIGEg==
X-Google-Smtp-Source: ACHHUZ77IlfDYtyaiNtbQBvQ+hst+uMDswEhJokbRedTnkaskK+XBmCINjFgoTdvnk/TaS9G8YnT8Q==
X-Received: by 2002:a81:6cc3:0:b0:56f:fcb0:26f6 with SMTP id h186-20020a816cc3000000b0056ffcb026f6mr25623334ywc.52.1687835730840;
        Mon, 26 Jun 2023 20:15:30 -0700 (PDT)
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
Subject: [PATCH v6 11/33] mm: Convert ptlock_free() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:09 -0700
Message-Id: <20230627031431.29653-12-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 10 +++++-----
 mm/memory.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0221675e4dc5..69e6d6696c44 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2799,7 +2799,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2815,7 +2815,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2856,7 +2856,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2870,7 +2870,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2939,7 +2939,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index 2ff14f50c7b3..8743aef6095b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5931,8 +5931,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
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


