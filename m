Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD9769DB4
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573251.897845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJM-0002mU-Fv; Mon, 31 Jul 2023 17:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573251.897845; Mon, 31 Jul 2023 17:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJM-0002iM-9Z; Mon, 31 Jul 2023 17:04:00 +0000
Received: by outflank-mailman (input) for mailman id 573251;
 Mon, 31 Jul 2023 17:03:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJK-0008Np-J1
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:03:58 +0000
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [2607:f8b0:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c0013e8-2fc4-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 19:03:56 +0200 (CEST)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3491516c4aeso4949435ab.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:03:56 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:03:55 -0700 (PDT)
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
X-Inumbo-ID: 3c0013e8-2fc4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823036; x=1691427836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZ7ozcISUSGoixC5UzzNE5tJz0+L18C1Imj6XmV/DYM=;
        b=YpVyYPxPRtPTKHT9+tyvzqfvzCuhkFnhsMCX6nJF7RWviYaDE6pxTcvqFICRytHQ3F
         mk3OEWmycmo6ouKKcTZJZ/J9GI0O0U+IOIhkq6cf5NcWzs3F3Ep7I9wPm/bnxo3IbGbP
         5A5D1El9yg833uJSmp138hZ30DYMCVkIUWUYXAVHfkbTx4hT6PxevukL8QnCpSiv14Rw
         Ab1JsXOoVAvxWjOf0Fsk8pxufrrxg62ZUs/sWVYn8yXcxdG4Ij3aN3bFcjr1GQQkDcpq
         XCDoC5WGNDUaZUPNMTX8kXKJ799hVc0z6s0hq6YfOkQjqMhJ1aFCFD+uKI8XA047G16z
         xszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823036; x=1691427836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZ7ozcISUSGoixC5UzzNE5tJz0+L18C1Imj6XmV/DYM=;
        b=V68o7YjGjwIYiWKiDDxh9cvgYpS26U6YaSrASsKtZEYx2JnwoK/plrCJ5lsVXXwN4M
         rF2+gssXpAXpqVktwuJmv8wYYpUs0KlzlrkbFI/s69tsHnj29gsjru44aYnbIql4RJLj
         /Dn2IBczhCoKUi4gJUkmcubenxtrMhCeUdoRx/HA0hHKkEBWXzvMKGlNKEFz4JlOmvMh
         gmMWEm7BWdp7uN9gjVLI+84YYTfJtcn2coyWSvRDesjvT0fAJtP0eNoa9rSedbrR5+HR
         tGc7tg0WQa2T5rzqGFH/p7haxKbY2CEbX/ilu94KzOWQoQGH0gO8qkSQ/NAJefWanLhg
         cKUA==
X-Gm-Message-State: ABy/qLbpwMVU+ABE8E7KsoBsZIojx06vKQlINxNmXjDA5Ng59elK3WSK
	7qAUMXRXCzndP+6YPA00i5I=
X-Google-Smtp-Source: APBJJlHoVkOsri9H/NdsUsto2q+Ey0kzzV9aD886+MBagBeourqVjWpbCtZ0aJitRhXpadhn4PaeZQ==
X-Received: by 2002:a05:6e02:1c26:b0:348:b910:313d with SMTP id m6-20020a056e021c2600b00348b910313dmr9675086ilh.14.1690823035707;
        Mon, 31 Jul 2023 10:03:55 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 09/31] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:10 -0700
Message-Id: <20230731170332.69404-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
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


