Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362F0718C0A
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542017.845444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPk-0000q3-Mj; Wed, 31 May 2023 21:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542017.845444; Wed, 31 May 2023 21:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPk-0000lh-HW; Wed, 31 May 2023 21:31:28 +0000
Received: by outflank-mailman (input) for mailman id 542017;
 Wed, 31 May 2023 21:31:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TPj-0006zB-2v
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:27 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e0b6392-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:31:24 +0200 (CEST)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-565a63087e9so745227b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:24 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:23 -0700 (PDT)
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
X-Inumbo-ID: 7e0b6392-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568683; x=1688160683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27lyfpZ04FD2UDRY/I33l74zvzgaqoXO3tIGNjTPBPg=;
        b=ekb2h5vYZpG+cwgCVg4fQK7EHYCXZwnN3tICBhvbAXV/qaJ4duvuh8+ArMRtJnIp/1
         3RGo21yGJSysDJalslm0N3KJ+xBemufNmCM4QUS+AlLps3g1asXmgD446fAwgWFlRe+6
         a7aoyacEmBOwDL/dieiMjv/UIxc7tBtkwjPRg8HdgpDriWcSnd2JpyypDy8aN9IwIMR1
         dAM+p/G53wM0julinDJp886bQVRAOW6SvsbsPDW7Xp4BxlToFfeY++p5U7tcCmWgdlyl
         aRBYNbpeHC4ndh8fG8DxUBYpHsoQ7lFfl1tkv5LwqehXHAbOBlEVGGEVzchpWOIR1fN9
         uokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568683; x=1688160683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27lyfpZ04FD2UDRY/I33l74zvzgaqoXO3tIGNjTPBPg=;
        b=guzH1zzM/QzJiTRuoeqqdQ8FvI1dG7UdFBmzbEIPtTWdXKNNfs6c+iFGV1gxkBYsga
         Oy/i932nzlq1uGydhNRTLKHuyZr4IJDUjZE29cmjMnMCuDQmwMXyau5Kcm0WyOE+UkMj
         lX4CORodyq1c/0cHGKJnULsT+aIjkQI6tD5PGWP0CdzehmN9kV2egqqiE/KqRiafz/bf
         ZZSg+IY+WXZliyk9DybL9jxSZtqQpbcWGcqnmpwVQX0d/bLswRAC/EYAh8IUQCg1IzIB
         5oCaxNDRSTMG1CzoWoxCvg8cp6x1ClhQy0XogTk0RwrhuXizy5Vuv0rWxJmgivecpfRl
         mKrg==
X-Gm-Message-State: AC+VfDwYnVkfIT8f0tO8dnaiQXyIu877vy31+cDpfx3K/JwP4WzKOrrO
	YmyC/szn55+J0dlBCnBVmUw=
X-Google-Smtp-Source: ACHHUZ6dr8MPeM7AL/jHaXXQ52piABkpCgdGqBTW+dyh+LgB10RRsXu3Y1HlJGFoY/78HDuWSu9FGg==
X-Received: by 2002:a0d:d741:0:b0:565:dff1:d1e2 with SMTP id z62-20020a0dd741000000b00565dff1d1e2mr7923571ywd.18.1685568683472;
        Wed, 31 May 2023 14:31:23 -0700 (PDT)
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
Subject: [PATCH v3 07/34] mm: Convert ptlock_alloc() to use ptdescs
Date: Wed, 31 May 2023 14:30:05 -0700
Message-Id: <20230531213032.25338-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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
index 3a9c40e90dd7..1fd16ac96036 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2806,7 +2806,7 @@ static inline void pagetable_clear(void *x)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2818,7 +2818,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2848,7 +2848,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 8358f3b853f2..8d37dd302f2f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5938,14 +5938,14 @@ void __init ptlock_cache_init(void)
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


