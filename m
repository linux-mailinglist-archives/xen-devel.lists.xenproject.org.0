Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D81773A9B9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 22:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553957.864944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRNl-0002oG-Gx; Thu, 22 Jun 2023 20:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553957.864944; Thu, 22 Jun 2023 20:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRNl-0002a4-9k; Thu, 22 Jun 2023 20:58:21 +0000
Received: by outflank-mailman (input) for mailman id 553957;
 Thu, 22 Jun 2023 20:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTT3=CK=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qCRNi-0006Mq-8u
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:58:18 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82deee1e-113f-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 22:58:17 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-be49e41a3d6so5948877276.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 13:58:17 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
 by smtp.googlemail.com with ESMTPSA id
 d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:58:16 -0700 (PDT)
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
X-Inumbo-ID: 82deee1e-113f-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467496; x=1690059496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSwuU7fg/k+TT5PagWIdYLap7GxOydHG9fnVI01D6B4=;
        b=I/bVEj+DUjJI8l/gEF/kUAGaYNT5Bo0ZW57h+bRIiIunD3HbfI+MBQBKO4xoy6kMld
         by9iDd+YOlloG6orphek9MUhK7idN+HCTnjbwImmtOZyc6e9u9PHx9KvfH/RMgtU+eEw
         KkmIT3OJU3QYrQoQpzTDW/lNw6UL91T+VL7WZPaAaf3blTIwnU3tSpIBE8mZnuXVnYm+
         rvZ17E5R9YwQ5EOQRDXtuuSLgHPTNFwHVzddHdU5MZn7f0HGX0TpCThXTZUeoTrDSQuu
         9j0W4VdWm0ZtykEhgIk1WPxDhiiNhplU95urAkZpVmBWbtxqWeEVwFyvBy3V06yBmQux
         q4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467496; x=1690059496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSwuU7fg/k+TT5PagWIdYLap7GxOydHG9fnVI01D6B4=;
        b=IfmDzNPyxGlo59j2RSmlSxNkx6QqF9JyIkn4sP8kcaPhb29Gu9+nmXyNTXaZfwYLe9
         JLUDbXK+V8WHYHtPQFN5RPxEYqcs22herzJ3pLsKays5g0qgKPbPjf9yAhBYmTT6aatF
         Ed+bdfs5Gr87P4VIAWTNmP1x4u/polQD2DkXj8ElqgaBR+ed2LmL3MaubQdTnUW1dAUQ
         rWVQtBWMI1mput0Pym/p56ybfcr6SK78buOgkASCGRNHQsfQRHg8XBVg904ciDKEtoBU
         3FHpfd4i+lbHFcCXAIG/PS4v4RpIUvqxHvGYKCk8Y2cIVvHYn4mfddQwX3d49ZpW1M+B
         8RZw==
X-Gm-Message-State: AC+VfDwh4qwuTk/pj/NE//027T4LFG0lwDjp21L4BgoUT9KQkBIwR65x
	w5bWCzCv5XPZGktUemloj1A=
X-Google-Smtp-Source: ACHHUZ4fKnSuVlprYtWMiqysn5f2VA+PJ55bhXLl+JTYwbJxQpJ17qCGbx2gEAsv8+8GLejR/TMFxQ==
X-Received: by 2002:a25:6982:0:b0:ba8:1c9e:c77f with SMTP id e124-20020a256982000000b00ba81c9ec77fmr9956027ybc.22.1687467496585;
        Thu, 22 Jun 2023 13:58:16 -0700 (PDT)
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
Subject: [PATCH v5 10/33] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:22 -0700
Message-Id: <20230622205745.79707-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
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
index 4af424e4015a..0221675e4dc5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2934,12 +2934,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
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
@@ -2952,7 +2952,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2976,7 +2976,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1


