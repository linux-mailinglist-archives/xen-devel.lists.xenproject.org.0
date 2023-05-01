Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2EB6F36D6
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528091.820785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCh-0001Qj-RK; Mon, 01 May 2023 19:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528091.820785; Mon, 01 May 2023 19:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCh-0001HT-F1; Mon, 01 May 2023 19:28:55 +0000
Received: by outflank-mailman (input) for mailman id 528091;
 Mon, 01 May 2023 19:28:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCe-0006FS-S4
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:28:52 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67394254-e856-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:28:52 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso29038905b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:28:52 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:28:50 -0700 (PDT)
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
X-Inumbo-ID: 67394254-e856-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969331; x=1685561331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mt3HE6L47sPJBYnAKPMz0/DxNRKvA6oRz72+XbjGX9E=;
        b=bRmqBPTZgCa5IrhecvrTPyLDuab4M/2pWmm67Ij9kB88cqyNYvHpKZf2c822tlLINs
         V7g4wokwjyA5yoaxqgkTwqtzjgfghwoIfl0NbPXtXdg2Gw3C4PIS2FYz/KLko7etiChc
         s5Y++dzV39ZBew8o5WYNHoWZR+E9Lx1p8UATOni2Z3kTd3MdcR3ji+KJhcCE5jLMM79j
         4rcgjvbB4U2t2rwTpoiUyWgvBTuTWbg65E+Konk9GYsk7NMgNhoUvQ9jMEmXFDz/6lzW
         5y5R3ETL6C6d8IdLyMxau5jgOeNqS9ewzuT1HexEBx4VHGUimuQrmfTb2llKzaIBnzUu
         BV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969331; x=1685561331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mt3HE6L47sPJBYnAKPMz0/DxNRKvA6oRz72+XbjGX9E=;
        b=ffSG/0GCjz3zNdpHkJ+G7LNMN/+dvWjxSkdN4x5RiI+r/2S+eMtgsl3TQp1RyOtiLe
         hg8g6ucqu5VfHXT/25A57f+zzWMiS+Xf75vQm/3T2WvtcQ5KpioDt8DY63qDOX3QEDbV
         X0AYWmzTZILiglR/ay9LPdG2h9dIo/yOE00IOYbftmb1TM8LJIXjs1s5lG/qQeGu9DFS
         HA21nB/uHrVXBniNFKG3h61zDj3Yow/ewgu6kZxqBZh+HpCXeMMh43iO/dPjhmBMZWwN
         5GkAPeCG2zLq6V9cbOJ4+c7jdoRog47YQiusHCAxaNxMytlY+z0L7Ze8G0+Kn90xlN2I
         +NyA==
X-Gm-Message-State: AC+VfDzBTqFrUT3Lx7SRF6c6cst6CUfVfX+Y6PGos6vPRotq5tWvaCDk
	fMNHSu2T8pM1C5S53UklrGQ=
X-Google-Smtp-Source: ACHHUZ6xNyoMsdtkeuJYwr4JFA16W7bSDCfft0wt/spwymptVQy+yHqySIROmads3b5d2VYC5oAliA==
X-Received: by 2002:a17:902:ced1:b0:1a9:3c1d:66de with SMTP id d17-20020a170902ced100b001a93c1d66demr18699403plg.15.1682969330907;
        Mon, 01 May 2023 12:28:50 -0700 (PDT)
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
Subject: [PATCH v2 12/34] mm: Convert ptlock_free() to use ptdescs
Date: Mon,  1 May 2023 12:28:07 -0700
Message-Id: <20230501192829.17086-13-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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
index a2a1bca84ada..58c911341a33 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2787,7 +2787,7 @@ static inline void ptdesc_clear(void *x)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2803,7 +2803,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2844,7 +2844,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2858,7 +2858,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2916,7 +2916,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index ba0dd1b2d616..7a0b36560e28 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5950,8 +5950,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
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
2.39.2


