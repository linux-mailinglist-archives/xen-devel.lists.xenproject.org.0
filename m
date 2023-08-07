Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7302B77335B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578976.906766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9I4-0002mK-RS; Mon, 07 Aug 2023 23:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578976.906766; Mon, 07 Aug 2023 23:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9I4-0002jR-NU; Mon, 07 Aug 2023 23:05:32 +0000
Received: by outflank-mailman (input) for mailman id 578976;
 Mon, 07 Aug 2023 23:05:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9I2-0001NY-8E
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:05:30 +0000
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6cf0228-3576-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 01:05:29 +0200 (CEST)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3a741f46fadso3760170b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:05:29 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:05:28 -0700 (PDT)
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
X-Inumbo-ID: e6cf0228-3576-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449528; x=1692054328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xo55EeeiRtqMJzFppY7LfosEC+4EKSW+Y1wbH/R/zko=;
        b=Q3CUliICB5ucW5n1+cyfiOVvgvAwhYv3ZRrcZge/C2xN1y7mPAKTaAhnTC4tg457In
         GS5yV5pdx2fEbQ6Paw0G9gZpAwxLk7uLiA6v3+SIa2nM9cjP9BC4TMrWHjABBg1TkaAc
         jFqkxuJnd0T58a+3c4oi7Pn3k6jPqHaryISvoGLWFF1pysLGpyRN4pc1ANxWoEwI+30p
         K69XzaaIceuwI5auke9JvMGfHaTbti7Lrj0CNiE6K9RZ1Cm9I6s2gJdVHKhyUn9Bc8fw
         XFhL6ezBClgRYA33kHsXSFVngHlISmggGRScePESZQUU6OPVK5MugkAHJIXH8vtrGuLn
         AiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449528; x=1692054328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xo55EeeiRtqMJzFppY7LfosEC+4EKSW+Y1wbH/R/zko=;
        b=LRQNeLNnX6fmipgkIfaHKrNrkFWuPpr2RypLV9jnbRGZyHxoqUh3XiR6Lqn5uII2iA
         zBZmzvabWzThPmWLdoXSLMkNTwWvHxxMXezTigv5q0IK81SUw83NKfj4/o8UhspmgrDn
         zQLiFB9eob+0Usx+EC6cwPP7g3AdIwuzD14sWl2y9RD8Xr9GzeWNc0LWcRqTgzAgAXLE
         YxmJRZqUcskCh1KU+SLhDajccgU5OO9x7k9bIYP8q5H0wkY+AljKVMPMPWH4bdqQW0Ys
         h2b8/3VAQVyXczdhr9GSiCzgyEQ1jXOlhtcbXUkz8bgvQzCiV8qJU2G79TbMKxcAwOee
         aXjA==
X-Gm-Message-State: AOJu0Ywa71KrH2t3TX3nMBQvJnrpU2UiRzhbb+dEEv1QO1una03qHH8u
	TMk3bXrPSZt/CIFFaIAqsMk=
X-Google-Smtp-Source: AGHT+IEuvpqTpP0gccwCdePAresyzfHn008a21Ty6dvsje55NxjSSMn6qMCPG3M+rc/X2+vc3Y/lYA==
X-Received: by 2002:a54:4886:0:b0:3a7:238a:143e with SMTP id r6-20020a544886000000b003a7238a143emr10421463oic.2.1691449528538;
        Mon, 07 Aug 2023 16:05:28 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 05/31] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon,  7 Aug 2023 16:04:47 -0700
Message-Id: <20230807230513.102486-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f6d14a5fe747..6aea8fb671f1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2860,7 +2860,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2872,7 +2872,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2902,7 +2902,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 956aad8aff34..3606ef72ba70 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6134,14 +6134,14 @@ void __init ptlock_cache_init(void)
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


