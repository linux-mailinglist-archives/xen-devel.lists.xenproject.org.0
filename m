Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C10718D56
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542083.845655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVz-0002kY-It; Wed, 31 May 2023 21:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542083.845655; Wed, 31 May 2023 21:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVz-0002e7-3O; Wed, 31 May 2023 21:37:55 +0000
Received: by outflank-mailman (input) for mailman id 542083;
 Wed, 31 May 2023 21:37:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQS-0006zB-Qb
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:32:12 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a32ac6e-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:32:11 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-568a1011488so976197b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:32:11 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:32:10 -0700 (PDT)
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
X-Inumbo-ID: 9a32ac6e-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568731; x=1688160731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GRmBDGAiDB5ohg5xpMsC/Ie0xVPC3qwwrjfZtpy6VU=;
        b=TzIQcYP8UmEvu1XoUXTmQnAashbo2T6eYaCRckVyeMmLMro7gHhzasHCkMcWFCcICP
         qASPopGO4jPsUUoq2oo54YJvtjYAvzC57SSS0Yqri4mv3NjvTdLMSdkLvvM7oA4Ee24y
         wtM1hRp99610fYgP6iNO/jZdKl6qkgz0kh/qsgBmVzQ/w0d6rCW5SOQFK0BhVT7CHUOG
         qPxfe0g3o4O3N6ywZpv0i38BDLHQS9YQOgCA2owyv5y3xv1tuRhfQmBHrNK0am7f5K2A
         BF7Ua5SoJjDL0sDtWpclX2w1tSSbohGXIW608mTIM4bjGCvoZIGoxKxNqCAe4MAT2CZW
         ovbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568731; x=1688160731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GRmBDGAiDB5ohg5xpMsC/Ie0xVPC3qwwrjfZtpy6VU=;
        b=V3XsIo9dPGA7ebNUEKIarlEHN6PR8/26sN69KgGsN1ryqr4SyeZaNyhBC+WeULDNfQ
         FL2wM6KRgfS3ErETTdJTyO1gdMQ62Opkw2RVJyce0gym4XfRLEYyv1fHzoXZcGtUX9y4
         YvYjGuYiKNUhENYCoketUuKyut3XWSFPP7a1/mh5Ut+TgsiYFWk2+A2qKDs7JTbhuieu
         2KeyJnJoLF/sL+3mjz84TM+KifuCDGoO/iZ0jVqFVFhI2k831QFl10c19UNssbQ43jo8
         cuIe36+aVeuokPjIG2iZop+llEP6AR1QgG1ohKYLKxl2pBviMUREwkHhFiTw2KNSs4ES
         PvEQ==
X-Gm-Message-State: AC+VfDwYnkReSB4OH03JQEzwqgXqZDIcWOtX5MmcK8wjjLkaGiGCIIJw
	VBgpOeraDzEquKZxJGIfKrE=
X-Google-Smtp-Source: ACHHUZ5LYpeqVXEBxKdhnKxPXFX2lgcS9ekTnfnLE12pRifhXXzQCAWJFiLd7o1EIw9HUUaJU74F+Q==
X-Received: by 2002:a0d:e24d:0:b0:561:949d:a7fd with SMTP id l74-20020a0de24d000000b00561949da7fdmr7343037ywe.45.1685568730646;
        Wed, 31 May 2023 14:32:10 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v3 31/34] sparc64: Convert various functions to use ptdescs
Date: Wed, 31 May 2023 14:30:29 -0700
Message-Id: <20230531213032.25338-32-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/init_64.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 04f9db0c3111..8a1618c3b435 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2893,14 +2893,15 @@ pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
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
+	return (pte_t *) ptdesc_address(ptdesc);
 }
 
 void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
@@ -2910,10 +2911,10 @@ void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 
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


