Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A902E72D174
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547477.854947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8oim-00017Z-3v; Mon, 12 Jun 2023 21:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547477.854947; Mon, 12 Jun 2023 21:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8oim-00013Y-0c; Mon, 12 Jun 2023 21:05:04 +0000
Received: by outflank-mailman (input) for mailman id 547477;
 Mon, 12 Jun 2023 21:05:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8oij-0007V0-Qq
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:01 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb447538-0964-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 23:05:01 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-56ce88ee294so19024327b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:01 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:04:59 -0700 (PDT)
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
X-Inumbo-ID: cb447538-0964-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603900; x=1689195900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csibueTQMI8hz/axFpDokmCUVKS4XWTLf0OEMRBu+sg=;
        b=FDAUnHm2faFSWGwfZS5hO+D9w8GP4e4g1ML7/tmHqNMsyYqyAD51ooe/UZAynheb45
         JUNAZVEGWiy3FM+aYWlvoHKaBUFoNzNTwUdIl4kQAVJN12Picp2GbnIh1UwydO/qddyi
         DCuNf5aNp8X4OTmdAm+cAeL3CGsOgaZ27ub95e/8MTqIlBQGK4N048waW9QZBpSO9XHI
         sWfFM9CmbvJbA3uGm5rS2JNk4GtvKzbhh98S182OZhG/f2sSkxT71cjOLs4vhjGq3bqf
         ArQftxucDa5+VY1eeLZl1/JDXSt6Px6z9h8EFmxArPTIN+H3XkndN1zswUa8dX9vrXU3
         5Q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603900; x=1689195900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csibueTQMI8hz/axFpDokmCUVKS4XWTLf0OEMRBu+sg=;
        b=l95j98eR9rFgICLD+az4PEe91ec/yRe1MID06EFKz5ARIioyLCCQ3TjC9wCJVsLq0W
         wCAI5MQ0MUxQbJk7vTGq6hldd6ILVXmKAHb2f+U68H+rtEBlN3rrcx7m2pe9+f/+Hlsd
         Pn++Vh0K4u92h7/kafmtI5KV70Bw5c+l29Z4Nm7O/v3wHvuGk/ylot76jxUm0xOkTz5Y
         ktMFDlxVkN9oDsAlQOMHA9AhK6bEv+NewgY0GAPn/QGm8Tnk5/dU/7ccQojKtIlOIK7c
         WjqRwv7WaxEAHRnUuVQCulPf0vnehCwpMcHww5aD74T6JGQ9Sr66FqyEawkuQkqkPBX5
         d1lQ==
X-Gm-Message-State: AC+VfDx6MDiZIepwUClLTWuk+4wv6x4vGeqo6iPARENonC0Codvq3Iim
	e+FAK9zy+jO4r26EPMlMmd4=
X-Google-Smtp-Source: ACHHUZ7XKzfLRWmcjDH1kOSVD0e6fKxxbDH/DoQa8Wv3QDYuxgXM2gpDCQ5rMsZn09dpzldtR2HsSA==
X-Received: by 2002:a0d:e294:0:b0:56d:5041:78b with SMTP id l142-20020a0de294000000b0056d5041078bmr1552114ywe.2.1686603900209;
        Mon, 12 Jun 2023 14:05:00 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v4 07/34] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon, 12 Jun 2023 14:03:56 -0700
Message-Id: <20230612210423.18611-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
index 088b7664f897..e6f1be2a405e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2825,7 +2825,7 @@ static inline void pagetable_clear(void *x)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2837,7 +2837,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2867,7 +2867,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 80ce9dda2779..ba9579117686 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5934,14 +5934,14 @@ void __init ptlock_cache_init(void)
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


