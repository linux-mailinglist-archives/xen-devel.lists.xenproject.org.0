Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEB472D175
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547481.854983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8oit-0002R4-8X; Mon, 12 Jun 2023 21:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547481.854983; Mon, 12 Jun 2023 21:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8oit-0002J3-0q; Mon, 12 Jun 2023 21:05:11 +0000
Received: by outflank-mailman (input) for mailman id 547481;
 Mon, 12 Jun 2023 21:05:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8oir-0007V0-TM
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:09 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d015f8ec-0964-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 23:05:09 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-56cfce8862aso26677827b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:09 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:08 -0700 (PDT)
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
X-Inumbo-ID: d015f8ec-0964-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603908; x=1689195908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/NReaJdz90gZ2NQIlUYsxuwjuA5PoSk9HvAIR22dRg=;
        b=cJPixJ7fvL8lj4msWoT6T4UdDliAegelx3fhfZFkllamFJSmCzzBfgBkJHvHf5VBH4
         +bFQaX0c9HvMpz3cMr64OoUwpvHF+4NrriYC39tboK0Z4VjLF9J6MmzkevSDnSF+eJ9S
         vsFP6THd62TglAym5r/waWV4KiQYY/X7Hysf9ft4FBrKTw7bicGfQMMhWM2I4CuvKtOv
         cwDTHbNBV8LRmkAEvkAc0kAr+XDxv+lhnXg68dTw4NnjCIip7ummoW4kmN1lP3wtz1t1
         rgvGb1IbL+Qt1u/Y4z+ep/GLJI6yTMWmeJDiLjESMtlIxdtrVlVrtQkxPe5yKm5XHK1M
         0mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603908; x=1689195908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/NReaJdz90gZ2NQIlUYsxuwjuA5PoSk9HvAIR22dRg=;
        b=PUuyzVHkrwuTfrMh0fOuCjF1X0mXg5YZTbsasu/Jn+8U8Wse3IvbHFKX3NqoRc4Q5o
         eKkSHunbJJUs7aADLhiscny6N8OEWWKUAVIWTEVuR7y29T8fVzZDnaOwWGZP7XuJ/4y7
         2yQ8Niv2HwE5j9/sWQKGxo4xMgsvA6bVso1Qq6IMo4jpqbFeJs0fQ6oMsJbHMttO+fNl
         mVqYyjyHJigEV2v8NV4cFN4WFj4rW0jhAjc9Ab5Mzc4/RBbQ4q4y6Xn+D28RAwwO/a+x
         6XjG0zbB5CUWz0OdPguFY4TBHBAbtX5wRrqkn7xlTSum11XxaAeAJL/EM+hg7Phj8hRM
         U95g==
X-Gm-Message-State: AC+VfDylGDgdVdL5j3yFI0BBdEwQUrILU+8msBV7U2cGveuWKtIGG3c/
	YmPoZ5I1GSbtlw9/agG3wh0=
X-Google-Smtp-Source: ACHHUZ5kijcVYXBTbbFcK1VnPllJL1iB2ONZxmZAAAXhO7jcUSS10Gkxlzbwqmp6U6Z9PG+yvX9PWw==
X-Received: by 2002:a81:9288:0:b0:56c:f916:905 with SMTP id j130-20020a819288000000b0056cf9160905mr7254032ywg.32.1686603908266;
        Mon, 12 Jun 2023 14:05:08 -0700 (PDT)
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
Subject: [PATCH v4 11/34] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:00 -0700
Message-Id: <20230612210423.18611-12-vishal.moola@gmail.com>
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
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f48e626d9c98..3b54bb4c9753 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2950,12 +2950,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
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
@@ -2968,7 +2968,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2992,7 +2992,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1


