Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05A6760767
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569363.889882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Y9-0004ly-6Z; Tue, 25 Jul 2023 04:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569363.889882; Tue, 25 Jul 2023 04:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Y8-0004hF-Vy; Tue, 25 Jul 2023 04:21:28 +0000
Received: by outflank-mailman (input) for mailman id 569363;
 Tue, 25 Jul 2023 04:21:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Y6-0002Iw-TM
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:26 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b82d6b9f-2aa2-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 06:21:26 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-cb19b1b9a36so5683242276.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:26 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:24 -0700 (PDT)
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
X-Inumbo-ID: b82d6b9f-2aa2-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258885; x=1690863685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZ7ozcISUSGoixC5UzzNE5tJz0+L18C1Imj6XmV/DYM=;
        b=gPlpDfbgQUaDh17nMUuxk8LJn1nYdgEAVfSMEcDpmwNJCwXKDaomTlh0BY+xZkFMKd
         tFRmLrBoE1Vp0IzzPSrF8bgPZVxB+9aP3VrUcSHjKLr+y7jNlD4PpyjtmGaGnI3Rciw5
         xPEUpzqKKaVrLEfBMw5DD9c3Ng9G9PKL+n4eQ6Zcvb2wmVEKnYUeBmB54WntK+cvg6UK
         QgMdLEB/drGqPOPjrgcd99xnUW0qMuGMWDmaVMRTFx92PXfEsSeKT6B4JdtVKY4BOuL7
         QKWH8kGjoeg6j0VlgnYB4AI/+z50XhZH+jdg01QIwrxx7GkpXjxyDTkcgrBZeXNJtHxg
         DmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258885; x=1690863685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZ7ozcISUSGoixC5UzzNE5tJz0+L18C1Imj6XmV/DYM=;
        b=GCqSPct5XVEGWB5I2TqVH7RJxgRu3JQdI8oz+PyvT5WQwUzPMAhvTl3qLt02DstLW5
         trOOf8deAdnfrYoXNnpbvfRGJSUDGfmbzOpKSRM9FFS24rMk0XptoqyYAoEINDNPQ0lc
         qY1N+Xa27B61fzqxakmP68BVtFE64kqV//nWROD4NA7ulj0VbI2JlXpIfz4pBMY4xyGL
         L7f0ZECUO0eqOemuX2R2tc885zj2TWiwfyB3A17taZ3/k6yzH6xuhv5mel+RvvqBFKds
         PuwYEcA3GhTRo0Z1d0DaaKwJGFGkbsFZRk8q04nUP41HPsy9Tck7iBxRGIK1GVPN/eft
         TMCw==
X-Gm-Message-State: ABy/qLZHJAfliaG7tPcvPqBgdS3081ZlYlqDzAKZ8sLJQc5pCvYHzlXM
	9w6MXmrUIy9nOpuDIUDIIfM=
X-Google-Smtp-Source: APBJJlEU2X68Ojav0w5cqMxtXa5ryZpYlhi5g+xNY8vonB7Weqi80FZO/gUhwzOoBC/kjqTB4Zo1Gw==
X-Received: by 2002:a25:f827:0:b0:d0e:794f:64ef with SMTP id u39-20020a25f827000000b00d0e794f64efmr4552557ybd.0.1690258885213;
        Mon, 24 Jul 2023 21:21:25 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 09/31] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:29 -0700
Message-Id: <20230725042051.36691-10-vishal.moola@gmail.com>
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
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 675972d3f7e4..774fe83c0c16 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2982,12 +2982,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 	return ptlock_init(ptdesc);
 }
 
-static inline void pmd_ptlock_free(struct page *page)
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
+	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(page);
+	ptlock_free(ptdesc_page(ptdesc));
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
@@ -3000,7 +3000,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -3024,7 +3024,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1


