Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C47733E9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579026.906876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Ju-0001W3-4T; Mon, 07 Aug 2023 23:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579026.906876; Mon, 07 Aug 2023 23:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Jt-0001Tr-Vn; Mon, 07 Aug 2023 23:07:25 +0000
Received: by outflank-mailman (input) for mailman id 579026;
 Mon, 07 Aug 2023 23:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9Ip-0001NS-6u
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:06:19 +0000
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0356d06e-3577-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:06:17 +0200 (CEST)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3a74d759be4so3751260b6e.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:06:17 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:06:16 -0700 (PDT)
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
X-Inumbo-ID: 0356d06e-3577-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449576; x=1692054376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BaWlDiv5V7gFuBlQl83W1x9C2ZQPjYd5FMjDEEKLfk=;
        b=cpy8Xcl19ScHIaEJohMfnXLz1DqejMUY8L9glfoRJKsJ7GTvGcuQsYlnxy1uVil+vX
         sKLd/jl5n7/nYQY+c94D1q52xLTeGbCjuaSsuOaGb/1E2rdiSHktCUTDo4f7HqbeV+dj
         TPAGwr0CoWyRhx6mzwQflnUob8s/y/rCKdVhSwURC5eFFFvRnN/tn2Qy2PbiuytULAR6
         gF0MKwRWTHX4EnLLnTfGRqqibjjUEq59j99BhXKpF7aj2wSWqBVgMsp2RTnzW+/7J2fC
         DAIl8+bDSwnR/XjlkNOvluV6Us9KQMDrngkUDG9ywXNDgTmwYNXsy+sDpdm8duXtW4+4
         Ov0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449576; x=1692054376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BaWlDiv5V7gFuBlQl83W1x9C2ZQPjYd5FMjDEEKLfk=;
        b=Q9VFQpUYK+ajwAm+F/eni6OekKDpuW3P4IgcMQT/NgZuofant0tzsxiSQtvnGAI9OX
         tn4fSehsmW8J5m2E+0shF+kiyL28E5KXobboOBI5GrOWPpQwLDx/ThqkdBUbKRrHG77g
         dau+cjsnvFrkAceLPR49LtWSpDT3Hizx/ZPahAdA6RWSQlD2yFXF0e5dAFLjIox5xV+7
         aysSt1jirbUkV7YMnOZeHSjSDy1C2uMnV4McZAlaXvjBd51F1QjVTWCvzU5svOp6klAk
         wOhDY3ua6LuW72URL+Wca4e3w7lzHWI02gKXgnT8sIO/9czwd+dW+kY36eIGHWvEWDNl
         p8eg==
X-Gm-Message-State: AOJu0Yy5brNV/6AkZew2Gb7utv0VAIDY9V9UYpECV4yeZKw1bWk4kSBw
	kkD6PuEUFPBGLcrgoOpp1Vs=
X-Google-Smtp-Source: AGHT+IHyrg/p55954UWSWEFSK4VAgtzO3wGDAXzmBNoLynnb9Xv8FQKgcm7kods1XM481PofrT4NJA==
X-Received: by 2002:a05:6808:23d3:b0:3a3:e6eb:9c53 with SMTP id bq19-20020a05680823d300b003a3e6eb9c53mr13630414oib.23.1691449576353;
        Mon, 07 Aug 2023 16:06:16 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 28/31] sparc64: Convert various functions to use ptdescs
Date: Mon,  7 Aug 2023 16:05:10 -0700
Message-Id: <20230807230513.102486-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/init_64.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 680ef206565c..f83017992eaa 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2907,14 +2907,15 @@ pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
-	struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	if (!page)
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);
+
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
+	if (!pagetable_pte_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
-	return (pte_t *) page_address(page);
+	return ptdesc_address(ptdesc);
 }
 
 void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
@@ -2924,10 +2925,10 @@ void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 
 static void __pte_free(pgtable_t pte)
 {
-	struct page *page = virt_to_page(pte);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pte);
 
-	pgtable_pte_page_dtor(page);
-	__free_page(page);
+	pagetable_pte_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 void pte_free(struct mm_struct *mm, pgtable_t pte)
-- 
2.40.1


