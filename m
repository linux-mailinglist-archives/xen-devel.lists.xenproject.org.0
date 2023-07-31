Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A247A769DA3
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573247.897805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJD-0001MY-Hy; Mon, 31 Jul 2023 17:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573247.897805; Mon, 31 Jul 2023 17:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJD-0001Ix-E1; Mon, 31 Jul 2023 17:03:51 +0000
Received: by outflank-mailman (input) for mailman id 573247;
 Mon, 31 Jul 2023 17:03:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJC-0008Np-KH
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:03:50 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3745d37b-2fc4-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 19:03:48 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-d35e565071aso479681276.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:03:48 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:03:47 -0700 (PDT)
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
X-Inumbo-ID: 3745d37b-2fc4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823028; x=1691427828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLtCJBysrabsGyMeKlbK2lKTjEzHhmjaMpElw0hOQuQ=;
        b=XxfUVCtc+QbMuKLsIQZYFotQjD1uPn39bJPNzHnLSpRxaT3fJeSLcUYSJwnJQ3Db/g
         leWI/21K6KvWZhIzEH7DHukGj5D7XdCtwzeO763ZUH4LeT7PuPE1GzPcQcYVnv/vf13j
         n79Pu8SKl7LjDKW1vidx9U3g5HX3hsbCLIInKKKoydsrph/bfVYnRh1jLyq8obFjpp4I
         8/fNfhvrK0O+QQmUluanQgTc5DFDNrxKYjhdFJW8WfDVLkfAQZABhu93QV+IfN33Z8yL
         iOGQEq8tdk7NtoCkxwkrl9w2lNi5iRHnhmaZ+oTac0bEezCH6FvgLddmkBsJ59So10Oj
         RPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823028; x=1691427828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLtCJBysrabsGyMeKlbK2lKTjEzHhmjaMpElw0hOQuQ=;
        b=hEVS5xdm3B9B8jN9aTztGwQ5Z4jGukOr7t4mA3iQRtOwkb0/UyoI+eyyJtuQWVdRSb
         s4bNu4fc99B46fFqwJRHT4s8htEWZch8Qc9d6kdg55nEOMTzGHf1GqCEaJB1W4CFhHRn
         xteW8FJrX7I3nj6PlUmYp1ZSoyVoV/eUuxeR+BUP6WMikqnYqazguWm17aYqBY2DXtiK
         7G8EKCiL8rgt6/H3JE5feDIi4Oo2oMVJKm0DjkdOTi1Tkt4KFyr5lwLyZylhdnp2u/Xz
         WxXhT7ckROG+TUn+I4dmSnXvcdWUZSe/KcI+if/GTM2MxyPC15bqacwjfVvvRoZu007q
         paqg==
X-Gm-Message-State: ABy/qLYYXej8wi14omGsVVEON1G9djloXEmy3drDigb2fWgRNASRVnX6
	BKoS8PouhRQlSB5OlJcIqCo=
X-Google-Smtp-Source: APBJJlGaLQRI5Q0HqdaC/SmgbvgNuoyQchTQtq0hJYQ2S7wch31RC4bpLlQZjYY1DDyT4+2cD/rUkg==
X-Received: by 2002:a25:9bc8:0:b0:c91:cc0e:1aef with SMTP id w8-20020a259bc8000000b00c91cc0e1aefmr8613166ybo.58.1690823027825;
        Mon, 31 Jul 2023 10:03:47 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 05/31] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:06 -0700
Message-Id: <20230731170332.69404-6-vishal.moola@gmail.com>
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
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf552a106e4a..b3fce0bfe201 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2841,7 +2841,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2853,7 +2853,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2883,7 +2883,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 2130bad76eb1..4fee273595e2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6231,14 +6231,14 @@ void __init ptlock_cache_init(void)
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
2.40.1


