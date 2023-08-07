Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDDE77335F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578978.906786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9I8-0003N7-GP; Mon, 07 Aug 2023 23:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578978.906786; Mon, 07 Aug 2023 23:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9I8-0003Kj-Cb; Mon, 07 Aug 2023 23:05:36 +0000
Received: by outflank-mailman (input) for mailman id 578978;
 Mon, 07 Aug 2023 23:05:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9I7-0001NS-AQ
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:05:35 +0000
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [2607:f8b0:4864:20::b33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e94c9ecc-3576-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:05:33 +0200 (CEST)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d3563cb41e9so4205371276.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:05:33 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:05:32 -0700 (PDT)
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
X-Inumbo-ID: e94c9ecc-3576-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449532; x=1692054332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dV51lKtiOhMWQgAl7GNvRpOxJtkn3o5Ia4Rm5PKGOL0=;
        b=WW7U9RxJoy+3YY4y3qa+Z9OsxlwmyOU3wMBaX5rDPLFmIEHt/X6v4NdYOpBq8PRkh5
         HGAvbPPuVPcaXp+7bIkcS5zKLOts7aoRAq2rmpfhl809GhQ5Z7qhyD2D1O9jUw02JT8D
         ByQrQ+74LtD1rxejz5iV5Ji3t3biqjBaLILP+cGmcXMABNbKMRqAqcPv+Q5eVbDOwvco
         pnySxrcubM/hR4SWo6309aJr0ghUYXqxorm9LprpxBDG4pKG7rw8FnMSIxuCIl+L3G3f
         pQ7sJFVehZ1e4LudKLyLwUTD+K2Hcr+cYbBqgmDPIUau/hEmU0pgvAzvLPGNFfNzyEIP
         WwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449532; x=1692054332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dV51lKtiOhMWQgAl7GNvRpOxJtkn3o5Ia4Rm5PKGOL0=;
        b=abKTO7xtTv/TAci8e+m/adWGyPecJ6aHM0rcMpQfavtvLZL3ES6pQWTwu/1SkHkLbq
         xL0jGjhGwrAB1p4yy4oOY4RG82GsTHVaE4+kWuULp4IPhPiadHA+MoJqFo9TvDVy3uSO
         TU/Lk8QLQBApe5fffKkCghCf9Nqghj1fkeOqxv1pC7D/Jr50saM+X5hejhju9PfxRWFN
         +p9VsOw3jo7y3t/AkW8AC05fHF6kmto/0EzdUQmDNk5bzUn0wW1gwpG62l3zllI+2f0/
         wmv924+6NhMoOBXD2fZf713YweBsVFcPjLPxOoO9bnRNqNdNKYVhqCSDcGqnrozVQ0x9
         7Zlw==
X-Gm-Message-State: AOJu0YwmDhs6EmOtxKr0VbPIJLZEqbeHCBHOCkpJNJXh6ksfLioVnobT
	DKO+qOovz+VtZtFMl+Gx+qs=
X-Google-Smtp-Source: AGHT+IEvrDCY+UE05HZYU4gf4n6Ovk9myxbAlbrTcNmkwiJKi0vLSKG9giGoSfLWvI4ILhQ42gUDlQ==
X-Received: by 2002:a25:bd7:0:b0:d14:6e28:69a4 with SMTP id 206-20020a250bd7000000b00d146e2869a4mr9317696ybl.29.1691449532541;
        Mon, 07 Aug 2023 16:05:32 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 07/31] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon,  7 Aug 2023 16:04:49 -0700
Message-Id: <20230807230513.102486-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bc82a64e5f01..040982fe9063 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2993,12 +2993,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
-static inline bool pmd_ptlock_init(struct page *page)
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	page->pmd_huge_pte = NULL;
+	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(page);
+	return ptlock_init(ptdesc_page(ptdesc));
 }
 
 static inline void pmd_ptlock_free(struct page *page)
@@ -3018,7 +3018,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -3034,7 +3034,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.40.1


