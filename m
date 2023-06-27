Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7873F193
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555694.867710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzAz-00077F-EK; Tue, 27 Jun 2023 03:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555694.867710; Tue, 27 Jun 2023 03:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzAz-000749-4t; Tue, 27 Jun 2023 03:15:33 +0000
Received: by outflank-mailman (input) for mailman id 555694;
 Tue, 27 Jun 2023 03:15:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzAx-0003uL-IO
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:15:31 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de6187ef-1498-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 05:15:30 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-57028539aadso44554257b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:15:30 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:15:28 -0700 (PDT)
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
X-Inumbo-ID: de6187ef-1498-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835729; x=1690427729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSwuU7fg/k+TT5PagWIdYLap7GxOydHG9fnVI01D6B4=;
        b=Lg2sjw4Fq7Jsh/1bPb8/Bz5bb4WbWygT3r2OYZVXGMBEwfozbqxm0/F6bIElAKjdHD
         k9tw765etUmPaJavNHOgRAh4TrN9WtYkyFJDXO4e8zB0CLQ7CKYG2S6Z4giPdak3TlLV
         dBQDIQS2mzx3Rkho31FJSGH9B3yVhFoSm33zMOn6yvA7Um5yH03kqWlR3ymYgVkxmZrE
         IJEFqdSDC0V+0/+0zxMFLR8Zuzl0eiDJ5KrxbBEu73g+J0vEbUyjW5NugtcJ2jWIZ/MO
         3IUWIpYlYW1hiX8BTPI8estSfzK1mYASEDhKfgKz4greHIhYdQhx0bK/LpN/7ezGhpY+
         FpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835729; x=1690427729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSwuU7fg/k+TT5PagWIdYLap7GxOydHG9fnVI01D6B4=;
        b=SNGX3COpInCw/BYS7+DvxpiQhLPPQxMkCURCUTuoD9l871FBX8bUfYaB6TZW9yTgXb
         w1WsA+jGO8ZqZ6bbNvn50uPH42LbgkkWnjhrrS/8wUBwEbKYryJ0CSF2HCpQyWE0MsdV
         7O/SJEhddag3M7G8Oxi4TLKV1pq1iFhOoCBhPoJ1ISNeUQ3wRTAHWPf4dVT9bzUt6DuC
         8r5kRitfIWdel1dwSlBBh+m90dVWIgYlDT+BCdBeKimTgQXZGzhRTq1lLfIf6/9Jf+OH
         lBiHiCgBwtNPJrb67hUOxMyp/CGmxpaPoE3poH2MFp7BTIcDdSjyp0QjkWJTn0rngrZV
         +F+A==
X-Gm-Message-State: AC+VfDwks6qTvcKrvputCONF8uGUq/Kbs73uj8da46FhVaWJkJUUuu1q
	1z0CbqfZH/weq2fIjkk0jdg=
X-Google-Smtp-Source: ACHHUZ46AY3BqwTWqQUYpGbmhIWT6fwcR58AoQIOUKYPJMkYvs0jOnx1fxcN7fC61p35DP7uAiDexw==
X-Received: by 2002:a81:6887:0:b0:565:cf47:7331 with SMTP id d129-20020a816887000000b00565cf477331mr37299896ywc.2.1687835728818;
        Mon, 26 Jun 2023 20:15:28 -0700 (PDT)
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
Subject: [PATCH v6 10/33] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:08 -0700
Message-Id: <20230627031431.29653-11-vishal.moola@gmail.com>
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


