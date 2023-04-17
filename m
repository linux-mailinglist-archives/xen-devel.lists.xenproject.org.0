Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79076E52A8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522328.811621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVr8-0006bj-Vr; Mon, 17 Apr 2023 20:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522328.811621; Mon, 17 Apr 2023 20:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVr8-0006OB-QB; Mon, 17 Apr 2023 20:53:46 +0000
Received: by outflank-mailman (input) for mailman id 522328;
 Mon, 17 Apr 2023 20:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqH-0005M2-Qj
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:52:53 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d249996c-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:52:52 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id la15so4089694plb.11
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:52:52 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:52:51 -0700 (PDT)
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
X-Inumbo-ID: d249996c-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764772; x=1684356772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPCTGsUKFtNZ0E2E3gxAeEJL+3qovRd//xVc9xUETqc=;
        b=IRDdSAScs3TBGztRzu6QZgH4fMR7/UKueaVS3DDhFsZMLZlJQUDaWkKiPXvov39z8Z
         bssT73UYUy1LP7uOeEalBEo3irDXhaxWlDKHCjJjWa82XbzBt1YrruOwks0GGaa/KE2/
         kcH9ajFlIINgfw2e+eWdEuaQpWFwhb8tF79JjCU2EAC5A/73X/TUfQV/8mop72+F/v41
         nZHSSM2ss9/OewEDYIYb1Iz4F1hF7m8KXVNPHD0iWKxsJnaQ4CmjrVdNW0xNgbwEICJR
         VACO7VFEKZxOIvTtIDcu6wtwdqmMEpSRB4owcroJF6TbGx9VSAN4uiN81drhHklILqhb
         p9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764772; x=1684356772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPCTGsUKFtNZ0E2E3gxAeEJL+3qovRd//xVc9xUETqc=;
        b=aZCkZi1xqlSGv9u8pHmgkyKKn8hY5YsJsviRDnEnIG2z9KnQ8Anbo5gE7mLF46VtOD
         eNT+PzmRRSvaYAJ0b4/mjoVs+xOSE4UDr25EaZqcLeX1Nun8l8cfRtn8sa/LuNNOm169
         nuHsSb6Qj6CAfndaW8JgUJtCGRIKyrrIZbyntJlDuLdEtijsDVEjhF1euElFwOC6zlL8
         ZXtfS+C8cR1953bizwjccqsy7ISKzMyagtlHRKJSANvsCXoXHwnmoKqk4PINpLvWszLA
         Mc86i1LrJr7LbqI7M8oY8RhZ5tXJTWRQjQdIoFjauYog+lUJ/aqO16M5QxBzZY/YiMkD
         u+QA==
X-Gm-Message-State: AAQBX9dLW3iSEaWRzHCEk0Kw2pPEa/1bt33G78OicuFoy3IhzO8rsE/n
	ZzKiinvO2tAaBa98+HCi3PU=
X-Google-Smtp-Source: AKy350bms9aSjWgOwaAnzsnpGuFvcEqsOo1myEWAVSaCBXxzFAqV0lCr0DmPVe9wT5EHiIOY8l5jIQ==
X-Received: by 2002:a17:90b:f84:b0:246:fc58:d77b with SMTP id ft4-20020a17090b0f8400b00246fc58d77bmr15834371pjb.44.1681764772342;
        Mon, 17 Apr 2023 13:52:52 -0700 (PDT)
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
Subject: [PATCH 05/33] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Date: Mon, 17 Apr 2023 13:50:20 -0700
Message-Id: <20230417205048.15870-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ec3cbe2fa665..069187e84e35 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2892,15 +2892,15 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 
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
@@ -2919,7 +2919,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.39.2


