Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200A6F36D4
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528090.820780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCg-0001HZ-WC; Mon, 01 May 2023 19:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528090.820780; Mon, 01 May 2023 19:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCg-0001A9-Kh; Mon, 01 May 2023 19:28:54 +0000
Received: by outflank-mailman (input) for mailman id 528090;
 Mon, 01 May 2023 19:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCe-0006PY-IW
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:28:52 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66769ded-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:28:51 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aaf706768cso10981755ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:28:51 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:28:49 -0700 (PDT)
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
X-Inumbo-ID: 66769ded-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969329; x=1685561329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTcYn70jypAxoGiZWNhXW/f3wJ7PRfT+UBBqvcdtR7Y=;
        b=lB3Z6fcbmN3PCDkgSSAUdLyGGv/N+aWg88Xq/3YBAOLHjjeKvsEOyPJ7qOvQJsTwm/
         r41UWIzlQ/5Ax+ha7xRNy8kdIkTNxjA3q1QX8n9bXAh3z/8wB6GEn84UnvlT4jKe1qmu
         sQyc9OGXZjTePH+r4Y6e6ozh0UMlJ+VYjsnu2YRncxwQaVJ+Cf7Nqth6cXAsabwTRyMX
         v6eeeBBdHDjqYX6OiT4X4zQkg5l42dCb/DNQDsMWC1atimcSE8JSmejQfjKp+N8Ip6uu
         zd2ZsR9jcfUX1/JB5xCLWPO6fdSMIACYocvg6A/MPAxkpU5nLiRN3WCB2A8Uz52//cN+
         kz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969329; x=1685561329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTcYn70jypAxoGiZWNhXW/f3wJ7PRfT+UBBqvcdtR7Y=;
        b=CHyRK/wx8jeHpdFXyIRmr/Wovzk2W1cxA2z6GMP/HyrEGKcf4VRhpScUDUK9JcP6AY
         q3a9H82+Y/KzV0n2dpO+DDdK6hLuQTPmqTdAlN+d3nfEYNcNudOQ9oN73f/8spaBMZNe
         TfRHcEjT+6bZ5tSXq+YcCX9SsgelYhyM8SwdchCxzPMMF45XUVMc5aYvmaUyxdwo/hg0
         D+6gS0NQiFw/zyG1l53NaMPzbX4mJyaJsvBZUGC7pn5TrEQ579/66B6xx5xPtufOcy71
         fs6rxGEBxZU+OW0+xTO2M4PGcj4meHAugB9/IVcLvfB60eRcWntH182G0evw/49pk0hJ
         CICA==
X-Gm-Message-State: AC+VfDwuO6MNGd4F/dsO2Ew6uGt/FBh7xWxwhvZynkf+OQUGA32qaXkC
	VJrd2EBOvIQSEwDoaABqOUw=
X-Google-Smtp-Source: ACHHUZ6RkKtjORSVVTbvqSb/nEXqQaQ9JTIasvSEW6m9mcivHjmudekwdvS8zsaYUeAaqoCEzf8v6w==
X-Received: by 2002:a17:903:24c:b0:1a6:4a64:4d27 with SMTP id j12-20020a170903024c00b001a64a644d27mr17386318plh.40.1682969329458;
        Mon, 01 May 2023 12:28:49 -0700 (PDT)
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
Subject: [PATCH v2 11/34] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon,  1 May 2023 12:28:06 -0700
Message-Id: <20230501192829.17086-12-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bbd44f43e375..a2a1bca84ada 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2911,12 +2911,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
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
@@ -2929,7 +2929,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2953,7 +2953,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.39.2


