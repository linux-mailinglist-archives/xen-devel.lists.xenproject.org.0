Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A6073F198
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555688.867660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzAn-0005B8-AW; Tue, 27 Jun 2023 03:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555688.867660; Tue, 27 Jun 2023 03:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzAn-00057x-7Z; Tue, 27 Jun 2023 03:15:21 +0000
Received: by outflank-mailman (input) for mailman id 555688;
 Tue, 27 Jun 2023 03:15:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzAm-0003pv-4g
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:15:20 +0000
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [2607:f8b0:4864:20::112b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d83eb13c-1498-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 05:15:19 +0200 (CEST)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-56ffd7d7fedso42547747b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:15:19 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:15:17 -0700 (PDT)
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
X-Inumbo-ID: d83eb13c-1498-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835718; x=1690427718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MMx6i8bJUxARp5QNqsq1CJUY3hOxlwkAEMcUNtK7dI=;
        b=MeM3v1KjtFoJ68g67QFEF1NyVxMiMYgvdlNUvONCKTcddCTBLfXbCvjdDQ2rkMkntp
         NglXMwE26fCvz5F9nMSZMUxoetH1ZAcsVpi0efOXfEwN4DA6ftYlLFo1JApHI/tubC37
         33sHqn+NMB2tr9HBuBdSW/hwIa8uL6U/SOUDWuLzyTAiHAPzWUOM8CjVLD+EbbHd/5kR
         FnMJGohaY21AmJl4Lrba1v1FCtiqCThvY8//FgKgMI5nMolrkjqa5ElszWe7So6X4/NA
         29o+uMEWd5I0Ihfj0/TIUUwfyyspThDiVrfoH9mpbEwmREVQeVNhmFuIVnTUiZMir9ah
         1F3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835718; x=1690427718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MMx6i8bJUxARp5QNqsq1CJUY3hOxlwkAEMcUNtK7dI=;
        b=SgKzdCbLEy1TpPkssJLEXEEJTv6gw8XVUd4eZdw1coVF/e4G+S3v7o1YPcrk72vcpJ
         r6uZ5m2/qjddL3URY+OqjDvZEvfEa4VapN0y5dyso9ZzVy5ffyGcP7AtByJ4Fqk6Ay4u
         FAxu7rGBp9VJcdj/Ppw/qW3mMz29o7+LapCN3emFa4aiBS/7sLJOfei5h4eoI2tFK37c
         yHIdxG2JcUNOCAE+Ohe8fhjca8QaV3BG4/YoNfpAnPBqXyJXrFJdoj6O4RbEBkDFfHDh
         mtouv55aaZ68jhv4J//tKWObDD20qLgzVRgegwHhDol3LDbAHkVJp5PS8ai4CF67yWsx
         W41g==
X-Gm-Message-State: AC+VfDzeoXC6LEtqhXxATK3FPcg0rE/JEaboJH/YQFN37c9zixsZ3rAo
	ZIOH2WUICK38O6EhiW8mvMQ=
X-Google-Smtp-Source: ACHHUZ7jG3JdEOLXHoTlHZs7iMneXhbSi5TTL08hXZ/YgCW6ZXi6BK/DGPcEgnHcQP1gwkgg+JH2AQ==
X-Received: by 2002:a0d:c506:0:b0:56f:e627:8545 with SMTP id h6-20020a0dc506000000b0056fe6278545mr30778532ywd.39.1687835718493;
        Mon, 26 Jun 2023 20:15:18 -0700 (PDT)
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
Subject: [PATCH v6 05/33] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Date: Mon, 26 Jun 2023 20:14:03 -0700
Message-Id: <20230627031431.29653-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 14d95d494958..1511faf0263c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2915,15 +2915,15 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
 
 #if USE_SPLIT_PMD_PTLOCKS
 
-static inline struct page *pmd_pgtable_page(pmd_t *pmd)
+static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 {
 	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
-	return virt_to_page((void *)((unsigned long) pmd & mask));
+	return virt_to_ptdesc((void *)((unsigned long) pmd & mask));
 }
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -2942,7 +2942,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1


