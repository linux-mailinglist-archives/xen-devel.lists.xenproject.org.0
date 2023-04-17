Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8F16E52AD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522331.811629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVr9-0006lq-L5; Mon, 17 Apr 2023 20:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522331.811629; Mon, 17 Apr 2023 20:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVr9-0006bg-Dz; Mon, 17 Apr 2023 20:53:47 +0000
Received: by outflank-mailman (input) for mailman id 522331;
 Mon, 17 Apr 2023 20:52:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqI-0005M2-R3
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:52:54 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d32d2349-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:52:54 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id d15so10118422pll.12
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:52:54 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:52:53 -0700 (PDT)
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
X-Inumbo-ID: d32d2349-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764774; x=1684356774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seoMdP0S43tB5tHiAJsyEn/McuL6oTkl/wxfiJ8zej0=;
        b=m9/ZIcz+Tqctc8DsupfPgmRFjJ+xGEJ5QFcDJn618MR0YPogH6sfzkHf8JHJze9cJp
         x5NQYQBUB4f261Rif3c3u/e/lVyrkb7fkfJolfOwhFk6XOwO7D63t/TQQqs9S95k9Ae8
         FKQXzDTaphWXYOHY2MRQP+XNQ8wh3L+YHkBgztA18oGJHjweyg/A/nWWIx5QMqDpAEPB
         X0wu3GkIqgBlm9RuBmiAr6UEFrV7LCwD9Gy8HkrUbR2REAIxrVGyinkjPCtpi11n6vo5
         ARCTsKi2jOZHutSbPq4tlksgdP3OAZq4N0EqMo6MlYwn+u6KLBtMzuBeO5yqTZEreTX6
         9o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764774; x=1684356774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seoMdP0S43tB5tHiAJsyEn/McuL6oTkl/wxfiJ8zej0=;
        b=DEa+JWBuKyEk1Hnvmbm408ppRqJWemyFIL3kffEW0Jkv/sujz/j6YepHcNgsjCZ3+u
         WN9Hjo7Dn9k/+Z7W6Ls7vZssIUm8P1nHNmcS6H2DYfBmQuulalOJXJXDDBfgefEPrIvF
         yeYmERb0RSSBphKmA2KF01270uYu1yji+Hk9EXWJs8fk9Z/uKfRbxPBfrigQIVm/2aZA
         CAOlidS1H+B4HTxcnhN6YElud+fioiZpN0fPIh9JhdUnYkRp9HokCV2JVzaQeg06OC50
         l1DcYlCqJKY61SMJkUOng61D4q8POliQhNfGkTgu2DMsjQ5DR/hAgCXZpwB33Qws1dSO
         YHag==
X-Gm-Message-State: AAQBX9fXs/xZdAmOjY+sC4isfSTrHrdnouoyTXRyMEQKIkHC+3j8PxfF
	r2BCTUlD8ztsblANFhjb85E=
X-Google-Smtp-Source: AKy350aUejw0DeO6puoaXC3R5n6x3DzcxqacgAq+Qj51dxkW8glMsrCpGOXbLfdvjTORWF+TApg9qw==
X-Received: by 2002:a05:6a20:b21:b0:eb:8d47:332a with SMTP id x33-20020a056a200b2100b000eb8d47332amr14024065pzf.36.1681764773709;
        Mon, 17 Apr 2023 13:52:53 -0700 (PDT)
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
Subject: [PATCH 06/33] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:21 -0700
Message-Id: <20230417205048.15870-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 069187e84e35..17dc6e37ea03 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2786,7 +2786,7 @@ static inline void ptdesc_clear(void *x)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2798,7 +2798,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2828,7 +2828,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index d4d7df041b6f..37d408ac1b8d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5926,14 +5926,14 @@ void __init ptlock_cache_init(void)
 			SLAB_PANIC, NULL);
 }
 
-bool ptlock_alloc(struct page *page)
+bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	spinlock_t *ptl;
 
 	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
 	if (!ptl)
 		return false;
-	page->ptl = ptl;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-- 
2.39.2


