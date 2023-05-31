Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D418D718BDF
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542009.845383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPX-0007HW-8h; Wed, 31 May 2023 21:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542009.845383; Wed, 31 May 2023 21:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPX-0007Er-5B; Wed, 31 May 2023 21:31:15 +0000
Received: by outflank-mailman (input) for mailman id 542009;
 Wed, 31 May 2023 21:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TPV-0006xu-K2
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:13 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76ea81ac-fffa-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 23:31:12 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-568900c331aso733787b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:12 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:11 -0700 (PDT)
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
X-Inumbo-ID: 76ea81ac-fffa-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568671; x=1688160671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bX969DJmm0QSNKJIBN0sjsA5M6jg25Ht5D0PDUGbnFg=;
        b=P7FbSxrmAPv3mGtl9KCze7nT8iCFSFWQSZd60mX+cJFZkb27WYcyDR38HUvSUNwOfA
         WyleVMjeIqtLEEwRc2YnbZ7txjSr2kC1Bu6eSjk/V4zQ7iY1ikjarw2unChyDBFaqyHl
         qrkXBVTcGnA2v9yMUpvE/svfRz2vIL9d0Nbx7Bw2sQnHGn9MhsASWeYBsHvbspQGObju
         1ipMDLV38bpj6HIH1n6AHSjFxILtRbDR5cBiuIg4YWigaXfk1Rbe6tGcUyluemp1MpHz
         Go7YaG8Vo7KSrA3KfxzMvgw5BO+v7vQIsvpOcy7enjsShHfHLHc+oYi1vHe+rSK3PBLh
         b6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568671; x=1688160671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bX969DJmm0QSNKJIBN0sjsA5M6jg25Ht5D0PDUGbnFg=;
        b=BFAiwLovTVwb+JP/HHeOttuQOvaMfn72A5nGX6HO51I+QaY2XCTvgW4NFCpFkd1Zac
         8hILcmx2sH4uWwi+oZEVeOMFoHuD1QYJFOdDN2nRtofenTWJU8kR+HfQrztPYO8W/efV
         8SeNGwzvpHxXkq51k9oDGw9F9NShKoJcZfuIe4AILaAU6h3WAQSbRn3yQkbN7hZvK6Dd
         wDYAnGck0w3QkLEqrxhWip2d4lLFqjqa8EA3JbjgVOpyAkMC4vMZOJBdUuGb9d87q07h
         cBmpzcTHl9gNfHEvplTGoNpyWPWsDBxFHC59skmkJzvA83WP67dJqjewjy3HavBeURed
         MvOg==
X-Gm-Message-State: AC+VfDz7h4XivDCS2xMYI7X6bmchshPOYcSvDd+P083/z5EjVotPXSrZ
	cbb31i6+MhJ5iXZp62emIsI=
X-Google-Smtp-Source: ACHHUZ49VjuEJEQYDlxCOib/9Ri8bRDKMaFSJKO9JbdYMtejkSn38dasbkcATHh4yJ4tcm7dGKQETg==
X-Received: by 2002:a0d:e7c3:0:b0:565:a081:a925 with SMTP id q186-20020a0de7c3000000b00565a081a925mr7102903ywe.29.1685568671501;
        Wed, 31 May 2023 14:31:11 -0700 (PDT)
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
Subject: [PATCH v3 01/34] mm: Add PAGE_TYPE_OP folio functions
Date: Wed, 31 May 2023 14:29:59 -0700
Message-Id: <20230531213032.25338-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No folio equivalents for page type operations have been defined, so
define them for later folio conversions.

Also changes the Page##uname macros to take in const struct page* since
we only read the memory here.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/page-flags.h | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 92a2063a0a23..e99a616b9bcd 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -908,6 +908,8 @@ static inline bool is_page_hwpoison(struct page *page)
 
 #define PageType(page, flag)						\
 	((page->page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
+#define folio_test_type(folio, flag)					\
+	((folio->page.page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
 
 static inline int page_type_has_type(unsigned int page_type)
 {
@@ -920,20 +922,34 @@ static inline int page_has_type(struct page *page)
 }
 
 #define PAGE_TYPE_OPS(uname, lname)					\
-static __always_inline int Page##uname(struct page *page)		\
+static __always_inline int Page##uname(const struct page *page)		\
 {									\
 	return PageType(page, PG_##lname);				\
 }									\
+static __always_inline int folio_test_##lname(const struct folio *folio)\
+{									\
+	return folio_test_type(folio, PG_##lname);			\
+}									\
 static __always_inline void __SetPage##uname(struct page *page)		\
 {									\
 	VM_BUG_ON_PAGE(!PageType(page, 0), page);			\
 	page->page_type &= ~PG_##lname;					\
 }									\
+static __always_inline void __folio_set_##lname(struct folio *folio)	\
+{									\
+	VM_BUG_ON_FOLIO(!folio_test_type(folio, 0), folio);		\
+	folio->page.page_type &= ~PG_##lname;				\
+}									\
 static __always_inline void __ClearPage##uname(struct page *page)	\
 {									\
 	VM_BUG_ON_PAGE(!Page##uname(page), page);			\
 	page->page_type |= PG_##lname;					\
-}
+}									\
+static __always_inline void __folio_clear_##lname(struct folio *folio)	\
+{									\
+	VM_BUG_ON_FOLIO(!folio_test_##lname(folio), folio);		\
+	folio->page.page_type |= PG_##lname;				\
+}									\
 
 /*
  * PageBuddy() indicates that the page is free and in the buddy system
-- 
2.40.1


