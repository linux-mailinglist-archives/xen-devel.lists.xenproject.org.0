Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB1373A9BB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 22:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553954.864914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRNf-0001B3-3Y; Thu, 22 Jun 2023 20:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553954.864914; Thu, 22 Jun 2023 20:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRNe-00017C-RS; Thu, 22 Jun 2023 20:58:14 +0000
Received: by outflank-mailman (input) for mailman id 553954;
 Thu, 22 Jun 2023 20:58:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTT3=CK=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qCRNc-0006Mq-9z
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:58:12 +0000
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [2607:f8b0:4864:20::b2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f40eb1f-113f-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 22:58:11 +0200 (CEST)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-bad0c4f6f50so1707021276.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 13:58:11 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
 by smtp.googlemail.com with ESMTPSA id
 d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:58:10 -0700 (PDT)
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
X-Inumbo-ID: 7f40eb1f-113f-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467490; x=1690059490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9Q71kHk0zB6vt5ahL9ZHs7069+SCA/PofhBzVdlAuY=;
        b=SXnr3kTV6njYUvauamdMyIGRqi3Z41OxkG9JlPzJUx0NriTeoHWuqaMEo3l+9h8t2a
         VYkat48qctNxV1/ppcRnfQARZuWAzrRCUbykSbsoBMp8966TwG20r91mIMZZWqpjcTmW
         hdpH7DDiGoYlRwkaTlsQfcolxJPdgdCgC9/4W8c/dT4apJrOeLX3lj0oWu+YQP0DxUAd
         osWDaPCIsD5h/hDouYKm/GWbJh0+G1rOXddszwPTKiRotQWqfvXUbSh9a+2twyPuDXpa
         FZNLCmQA2AiifhKNd54UF2voysI7AeqYSwKdAxxqSAv3Uf/qcrBy28RD1vznPZVN3aBc
         SnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467490; x=1690059490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9Q71kHk0zB6vt5ahL9ZHs7069+SCA/PofhBzVdlAuY=;
        b=W5py+Q+XAtBjSqi0Euxolshel7+OwWc8JoZ5wTfrkZGBvVpxllus5ynPUCTRgXThl+
         zsxNWvYFvhFqDQUvAyHq25C3vMLysrosZnR3D/xbjufcSqr10ho+sjdd3QjDl58SAQxc
         L4hl4J3Oa5AF2HiPVaj0GR7UNMEl4Nhx++nLO2vNzj1PS7amkY/MJuQYphRbexBA7EsJ
         1UnfgxrraSEy8aeaSsR2eodmubMDF+JUJNJhxQUNilEqIAlXPBK1xOuDSL/4EDwPICKk
         i3PK7gn7yY7WfbBIkwvGGwVJV12lTproO49ddx+RlX8wUE3/TDO94XZY3FoyRKMW/fD3
         f9/g==
X-Gm-Message-State: AC+VfDxaStfwxZuY1T2bwcdUgYFGA2Z6gpBgigO8p8Fkb8kRlzJ96liH
	CC17jw0YkXGBOGdCDoDjKaI=
X-Google-Smtp-Source: ACHHUZ6BwDtDcu2DafE0mELxOK/IzeJcBBP6EuYjmA8bqRWBwzcd6lelREQA4aNwT3EjfCEygFsIlw==
X-Received: by 2002:a25:2144:0:b0:bce:5e08:c330 with SMTP id h65-20020a252144000000b00bce5e08c330mr18770867ybh.29.1687467490539;
        Thu, 22 Jun 2023 13:58:10 -0700 (PDT)
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
Subject: [PATCH v5 07/33] mm: Convert ptlock_ptr() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:19 -0700
Message-Id: <20230622205745.79707-8-vishal.moola@gmail.com>
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
 arch/x86/xen/mmu_pv.c |  2 +-
 include/linux/mm.h    | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index e0a975165de7..8796ec310483 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -667,7 +667,7 @@ static spinlock_t *xen_pte_lock(struct page *page, struct mm_struct *mm)
 	spinlock_t *ptl = NULL;
 
 #if USE_SPLIT_PTE_PTLOCKS
-	ptl = ptlock_ptr(page);
+	ptl = ptlock_ptr(page_ptdesc(page));
 	spin_lock_nest_lock(ptl, &mm->page_table_lock);
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 39b0a4661e44..0b230d5d229a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2801,9 +2801,9 @@ void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
-static inline spinlock_t *ptlock_ptr(struct page *page)
+static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return page->ptl;
+	return ptdesc->ptl;
 }
 #else /* ALLOC_SPLIT_PTLOCKS */
 static inline void ptlock_cache_init(void)
@@ -2819,15 +2819,15 @@ static inline void ptlock_free(struct page *page)
 {
 }
 
-static inline spinlock_t *ptlock_ptr(struct page *page)
+static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return &page->ptl;
+	return &ptdesc->ptl;
 }
 #endif /* ALLOC_SPLIT_PTLOCKS */
 
 static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_page(*pmd));
+	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
 static inline bool ptlock_init(struct page *page)
@@ -2842,7 +2842,7 @@ static inline bool ptlock_init(struct page *page)
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
 	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
-	spin_lock_init(ptlock_ptr(page));
+	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
 	return true;
 }
 
@@ -2923,7 +2923,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
+	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
-- 
2.40.1


