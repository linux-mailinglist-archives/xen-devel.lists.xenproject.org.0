Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF97718C1F
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542021.845478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPq-0001zU-F1; Wed, 31 May 2023 21:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542021.845478; Wed, 31 May 2023 21:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPq-0001u4-3i; Wed, 31 May 2023 21:31:34 +0000
Received: by outflank-mailman (input) for mailman id 542021;
 Wed, 31 May 2023 21:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TPn-0006xu-Se
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:31 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 827cee1c-fffa-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 23:31:31 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-568900c331aso736367b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:31 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:30 -0700 (PDT)
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
X-Inumbo-ID: 827cee1c-fffa-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568691; x=1688160691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1jEnioq7k9B+WnYjAw3S6OIwBriiVkAgPsVN7nSKAQ=;
        b=sRB3lx4kAmnM8+wptcE+ajVYWk3XjheLnACKkDukTCUf9xFbPcDCYhPah6bex/BYdh
         giGFY1Br6w10nUQCd9DWblMM8GH+uaGuqnqROXiLO3UcERmYA2lDrQkgyUuZp7Z8kkqA
         nuRpQ/9G4vNwfZmkO1bs5HdxOej2dcQ5VFdd4ryduclGMMN3123XdTOk5+I53fDJyOM9
         XY0ZeZ9oP8N1MEbhuB5it+QgLHnwrzlk6MNwsUUfvNiqVb/KKB+BbxPk/D/IjrOXLBJg
         QnLP5YOwWWUD0KCage2oW1q2o8nxOiUGc6Utker8eoaHUzZhr+sfeHDiQePcAYy+fUoc
         EHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568691; x=1688160691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1jEnioq7k9B+WnYjAw3S6OIwBriiVkAgPsVN7nSKAQ=;
        b=UG310g5QLkQlX5bmjjzTRQbEStub79yoFSChNGQe6fTRuIlww392dvKO+r9vVDhJJ3
         +V/y+4ek89y3P3qHVkZisdnpBbtSvMgBkznvVVGkPnO9hnWHk8DhY1iG2lOtGTcNyrgr
         Qrqsj8s7wF+19NONCdqDK5Fn/rWBcQerrCbxp+zCEZUhFzDpEq+1Yi0e6+Edb0oAkjio
         9FvkDKYYHCAY4Hg/p6iw/8MUYToZYEmc2wr/KkU/GZsGbp2MEqAnwOcO7vzAeT9Rpcz9
         ZgHJ1ANFQJHaYZZ34uyJzvdlr3uuByhJPHx96mjozhondVsJgtfp0vrYfZ8sUdb2FqoI
         bA0Q==
X-Gm-Message-State: AC+VfDx4oT+/DImFfSfi/QVDhwGS/8sSn60pEpv1JzN6jycE9deRm2RU
	L7cvWrQrkiWJSTNriUECM9XPANv476q4lw==
X-Google-Smtp-Source: ACHHUZ5VBnMU9jyAiESUYWnGmIowgKT6gU4T3B/pZNfl2GNdmiRLLxEPQJ4tr+ESELmCnMZcerU5cA==
X-Received: by 2002:a81:49cf:0:b0:561:c5d4:ee31 with SMTP id w198-20020a8149cf000000b00561c5d4ee31mr7393100ywa.38.1685568690985;
        Wed, 31 May 2023 14:31:30 -0700 (PDT)
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
Subject: [PATCH v3 11/34] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Wed, 31 May 2023 14:30:09 -0700
Message-Id: <20230531213032.25338-12-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bc2f139de4e7..ffc82355fea6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2931,12 +2931,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
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
@@ -2949,7 +2949,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2973,7 +2973,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1


