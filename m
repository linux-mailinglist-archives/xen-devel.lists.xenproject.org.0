Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B596769DA6
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573249.897825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJJ-00022x-Af; Mon, 31 Jul 2023 17:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573249.897825; Mon, 31 Jul 2023 17:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJJ-00020K-3G; Mon, 31 Jul 2023 17:03:57 +0000
Received: by outflank-mailman (input) for mailman id 573249;
 Mon, 31 Jul 2023 17:03:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJG-0008Np-M0
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:03:54 +0000
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39b452a4-2fc4-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 19:03:53 +0200 (CEST)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-d0b597e7ac1so5043183276.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:03:53 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:03:51 -0700 (PDT)
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
X-Inumbo-ID: 39b452a4-2fc4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823032; x=1691427832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0E0BACLvXh2vpBt6imfUOZqEuzu1odD4oW+AaIJCus=;
        b=YUReldkgnetLqvGL1NS71WdWnAzNWWYQnltnVm2rTkEUcOO9WrPWjz/VupfwLsV4R5
         O5U+HAQBX2TEiL7rUmM64hTiM4qIIq6sg/drG9M/BGuBJ33Wydz1s/G+0U+eMZJumoRB
         f1161HPnuyBRb78dTfpgaCSHu9Qo0gegUmxh0kC4FT9lRFkm1YwjVBx9HbpfTIAYT8q1
         zvd8Be582ZnNdhPs3i3IT6jC/uh09at7IMfH8Z/47sZBuFG6ajCrrTeAaD1eGKL98sQ4
         Picd2DUZ0mNQhUFLQyvKhXnHde4rCRB/z+5yBj02B6B5K38q9rbIBp+H/OlzOyaGOHuW
         1Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823032; x=1691427832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0E0BACLvXh2vpBt6imfUOZqEuzu1odD4oW+AaIJCus=;
        b=ZKZu1BimGRfOFSN8yDljczrZ3PJINvjlXBoGecfyGtUDi8c+gV9cIP0+FiE7Y8Z4t9
         pxwlv3eHIEYMRkkS2GPjzzPvwNt4WaQNheIXHLFHGvgi7XBW4DeiMD8tkqXpPcWGdJON
         UnjE1zfp9N2WuTpzW+ATFqA7jn+Q8oz4CjhEk88IhPcF7WJHqTBR5jwVlmBGvC+KY4HD
         dnxkrmC2JSc7BzE70tK/rIPQASSjM+A/rWa63W9U/WY3L+brX4FhXCwYVsz3SHrN7QLs
         V79RpEPaRzhsgZaHBnqWIydzuF7UBoCt4QjicOFnCCEcF7J5BsVkvqrAuqB7JhyozCcN
         bJDQ==
X-Gm-Message-State: ABy/qLaIWfSUOLtFQ5alAvqL1aaZW6NWgQ538iGbvXnot0qtWrC+FlLt
	ubcaFowcJvaOYqz8LZu6zGY=
X-Google-Smtp-Source: APBJJlHh2ZxIPqvNCWcG3uzKtYIqmu+SYBCgcUqQThaKL5dLb97zd0arq7kj2mXQ9GbTc2zqN8ZRqQ==
X-Received: by 2002:a25:84:0:b0:c67:5adb:36fc with SMTP id 126-20020a250084000000b00c675adb36fcmr11678833yba.38.1690823031787;
        Mon, 31 Jul 2023 10:03:51 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 07/31] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:08 -0700
Message-Id: <20230731170332.69404-8-vishal.moola@gmail.com>
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
index c155f82dd2cc..52ef09c100a2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2974,12 +2974,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
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
@@ -2999,7 +2999,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -3015,7 +3015,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.40.1


