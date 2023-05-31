Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B5718C04
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542015.845433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPh-0000Mz-5F; Wed, 31 May 2023 21:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542015.845433; Wed, 31 May 2023 21:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPg-0000I4-Vc; Wed, 31 May 2023 21:31:24 +0000
Received: by outflank-mailman (input) for mailman id 542015;
 Wed, 31 May 2023 21:31:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TPf-0006xu-6N
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:23 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ceb407c-fffa-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 23:31:22 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-566586b180fso959697b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:22 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:21 -0700 (PDT)
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
X-Inumbo-ID: 7ceb407c-fffa-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568681; x=1688160681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQi1r9n8ZvdAYjhQrP0RtpOHDwCF0T3SkT9pOHS3grY=;
        b=I4ZK3ufVe7mv71vTYogtgymswU5NJnWubvNrBVwVZ1xQ0v/p7EI5y5eDyiHJRrHKpG
         azRQJKWH7AViYgdCK9GdEYZ8omA3oIlbOzs852fLZAEvIF+ozvEvZkK1/lCOTaAOLLWg
         oij0mtTKcWvOTyQV92r6jSH492LqXNF3KyTROTbV0zOPwz64hVwHxQg5gRw6g2twpMr+
         Syr51H68T+2e3gvOiE/6C7bywaJcNLAGV+Y3hFA7u25fKQ4NEmZwbyYlQc7gCZ6R/kVr
         pYNZAd+SPL7/3au6VqcXubefeyJmThujQisY5D7sD9GWsMGa+7uty95WSWwZ8guF3AKi
         4svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568681; x=1688160681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQi1r9n8ZvdAYjhQrP0RtpOHDwCF0T3SkT9pOHS3grY=;
        b=DWD63bHsk4XnbPxf0G7VA37ES0uQ4tE+ulpXsnolh6y1uVKWJYdxmQtvoukzeh/0vC
         9BH+5a7aiITZZ1VEc/jhtRSBlkIeN/UKQAnQ0qvs0kQ6Bye5eK/xKKFGDZCKpWRAp48x
         alE7TxIo+KLfvFYk2kc9MmLNVtS0RGPMqGoyapIu+XikXgJCjpfL4QIQgQZOud5iUJyx
         dD/WhZGMMd3jYahDU5JUY6+OIvSA9IC/MJtzH3mMA2VwpKbLYbtBU1J0Pli60GT/qhbL
         ciwwfgTj0QDcIuFaHMK516BJTmCgLz8JyvEK1iftkMlEeLP2VCGMURZkdSsP2LsoUKN0
         NKJg==
X-Gm-Message-State: AC+VfDw3SNo7bV8JL7TsjvNielHIFsjkbyI6ORyF/RT0iG4RE98U9VUg
	AYAksn9CgjT6+YrEpGm+TwU=
X-Google-Smtp-Source: ACHHUZ4MgiQhTnDT0ikSenPgoz+0X6zm2wOF95JZP/LWMfbyCLY8nB5YKCMBE1n0Fb7UhukNcNCVlw==
X-Received: by 2002:a0d:f5c6:0:b0:561:1c14:b8df with SMTP id e189-20020a0df5c6000000b005611c14b8dfmr6643798ywf.47.1685568681477;
        Wed, 31 May 2023 14:31:21 -0700 (PDT)
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
Subject: [PATCH v3 06/34] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Date: Wed, 31 May 2023 14:30:04 -0700
Message-Id: <20230531213032.25338-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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
index 620537e2f94f..3a9c40e90dd7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2912,15 +2912,15 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 
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
@@ -2939,7 +2939,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1


