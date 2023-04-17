Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEBC6E52BD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:54:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522335.811644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrB-00078d-5c; Mon, 17 Apr 2023 20:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522335.811644; Mon, 17 Apr 2023 20:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrA-0006z7-ME; Mon, 17 Apr 2023 20:53:48 +0000
Received: by outflank-mailman (input) for mailman id 522335;
 Mon, 17 Apr 2023 20:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqN-0005NG-LN
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:52:59 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4e37050-dd61-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 22:52:58 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id i8so18357972plt.10
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:52:58 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:52:56 -0700 (PDT)
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
X-Inumbo-ID: d4e37050-dd61-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764776; x=1684356776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0S9vHWOxLue2VyFd3w8q0WLRZoA25NyvyllT+RcawU=;
        b=XGW0pwJ3AeguS3BSEjZkQda83npB8B7RbJEymTCypauBOGiv3vWjnUTzzYfl8eoJ/G
         l8vpSac3iXyBMdZp/fMD6sum0gW4MOCVqLS502CXgyi0RUYYf3ntgvAGSXGBolZoNn2i
         V+ToiFcIdhtDlP2wctGltXpdu2C91rdsIF1S9oPOQ0O7Jf0vF/Q8QloTMvDXpKn4JpZo
         XwyusDwNIWazvsnj/elh4vmpM936WP8JEzePXhLQ+OdbmLb8t8oYaUiKKrqV8mjQTuNV
         U8/37jTeHtYYWs9KLzMjZZ9An2VnMVkd7CaDSgdHdeupgwKBIBRRGFzwxZa8/Q4lnujL
         ZhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764776; x=1684356776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0S9vHWOxLue2VyFd3w8q0WLRZoA25NyvyllT+RcawU=;
        b=WYnU0uvgpWd2PLgKHmWUDHTnI0Ye0Ha0hUO7n+qWlbnNs9DsJ0Au1pJavS8O5vWTmp
         c752bN0Vavl5sOK0oXxS70Upx6sfMFubsJokZ+ZD2kzrSObMZa27xXd+U9XaU/Qhrjwu
         v2cqnKN78pFomJu5NEU7AuEYJJcq3HM1Wsqotc8H9xAfcpUoWOiVCzkOlmSXnoAA9RoS
         qXbj9W+J0kIP2BVtD+0xJw6G3u45BCWML84yx0cem2oq4hIgdal8k3YgA09rA0L78GhE
         8VtzQdeqd+zgeUrUZTG/cZLaWhVyf6BBhKq7FgEzSjP1bkWI5dNlTf3UFt2gMsYO+n2v
         Si3g==
X-Gm-Message-State: AAQBX9e5iNzusjYBeouIERLXT4MDHtbOhDd9T4MW8jg2nNYl2BMK60U2
	oH0i+DLwm20EHGvMoJOiBxY=
X-Google-Smtp-Source: AKy350ZxT8mmBCzqXXqE8vhbMJvpIdAkvQhshhpl/b9NVru4kEOX264b08aZJzrt7Emcu03WoO14SQ==
X-Received: by 2002:a17:90a:3fc8:b0:23d:15d8:1bc3 with SMTP id u8-20020a17090a3fc800b0023d15d81bc3mr16271900pjm.39.1681764776607;
        Mon, 17 Apr 2023 13:52:56 -0700 (PDT)
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
Subject: [PATCH 08/33] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:23 -0700
Message-Id: <20230417205048.15870-9-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ed8dd0464841..7eb562909b2c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2903,12 +2903,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
-static inline bool pmd_ptlock_init(struct page *page)
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	page->pmd_huge_pte = NULL;
+	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(page);
+	return ptlock_init(ptdesc_page(ptdesc));
 }
 
 static inline void pmd_ptlock_free(struct page *page)
@@ -2928,7 +2928,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -2944,7 +2944,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.39.2


