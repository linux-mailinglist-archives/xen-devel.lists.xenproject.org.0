Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A8B6F36CB
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528080.820679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCS-0006XY-Lj; Mon, 01 May 2023 19:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528080.820679; Mon, 01 May 2023 19:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCS-0006Uy-Im; Mon, 01 May 2023 19:28:40 +0000
Received: by outflank-mailman (input) for mailman id 528080;
 Mon, 01 May 2023 19:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCR-0006PY-34
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:28:39 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e33d582-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:28:37 +0200 (CEST)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b51fd2972so1993042b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:28:37 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:28:35 -0700 (PDT)
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
X-Inumbo-ID: 5e33d582-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969316; x=1685561316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i6mX6BOTgb2TGO86QCloW3rCrq78sBOKu0dxXwRHVs=;
        b=pYnEspIgQ/94L4B7QgE7HxUaLyMe6HQnu5gVv7XKe7wrHmtTwaLadWDte57s2SBwdQ
         8bePLJ5Ai3/AmYhH4RiAfK8IjGb+8BxlohLn4+W6ycJ9Pg3WMvHLkkZOviW7YYTD/mmK
         GtZnk734H4mZvUq9Iut38ZejJnfrw2oYgWeCZ6PRbVlgoGyBpRA67FKhICj+7yH7j8HF
         a3LIP2IDGGOTftrbrsZRq8EQiQ5R1WymqweCw9yu0t92fclq88jf6kqwtf3FextynpJY
         IncHO/7Qw6ErlKR7f7HeTzuXXgCmLczBJBgXHLIbesev1rm2mkGmxXqiRqgTqpx3oce1
         ZBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969316; x=1685561316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9i6mX6BOTgb2TGO86QCloW3rCrq78sBOKu0dxXwRHVs=;
        b=jO2Y331sc6XE+lr0s6rvDbUuy+l8h49ZoORwGByQG2XkBC6dPc7ksnrfjOpp+4D4u3
         lg2mzuBL4+17G0EsmSwZuWUytazyHETIcMH4BIh+ebCn5EmwBDPTl3AlQPs5nDpDJ3UD
         CSbQTL+1IpZhf2dWIC6P7DU9gN6/y8YRqMysa9bA/Z0WWacrVLJ68qpNrrXp/OrSGaHj
         5bGa9qcLz6x+2L9btERh3HqE4qLugZrs0HzpJQMqV9Zc5YGXUQN8fKjg1JsGhp6pJR+B
         EVfc2CKGfp68qEdHOT2aXPk/xPMGRURr0BFn6dh+/fl/GudJGAZ3Fyo3XlLdPNapoXVF
         JT5g==
X-Gm-Message-State: AC+VfDxxpxJCQYTqCmMZiVJUbD/dwNSh5VyMLf133NznVPa+qGQsnFSA
	CeruaxMILdCZfnQiXIJA4CQ=
X-Google-Smtp-Source: ACHHUZ4H6i4St7ld1wD0WuHlGapRQhff/8tSAzzBd7XutE+/MiRiNA1zmkp/wHjGquMcgELZnMsxdQ==
X-Received: by 2002:a17:903:1c3:b0:1a9:80a0:47dc with SMTP id e3-20020a17090301c300b001a980a047dcmr15039374plh.3.1682969315645;
        Mon, 01 May 2023 12:28:35 -0700 (PDT)
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
Subject: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
Date: Mon,  1 May 2023 12:27:56 -0700
Message-Id: <20230501192829.17086-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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
index 1c68d67b832f..607b495d1b57 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -902,6 +902,8 @@ static inline bool is_page_hwpoison(struct page *page)
 
 #define PageType(page, flag)						\
 	((page->page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
+#define folio_test_type(folio, flag)					\
+	((folio->page.page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
 
 static inline int page_type_has_type(unsigned int page_type)
 {
@@ -914,20 +916,34 @@ static inline int page_has_type(struct page *page)
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
2.39.2


