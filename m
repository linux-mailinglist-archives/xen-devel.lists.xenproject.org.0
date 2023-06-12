Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF2972D22E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547537.855070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8on8-0008W3-VN; Mon, 12 Jun 2023 21:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547537.855070; Mon, 12 Jun 2023 21:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8on8-0008Mb-Jj; Mon, 12 Jun 2023 21:09:34 +0000
Received: by outflank-mailman (input) for mailman id 547537;
 Mon, 12 Jun 2023 21:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8ojX-0007zJ-U7
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:51 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e88034f7-0964-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 23:05:50 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-56d4f50427cso6518967b3.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:50 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:48 -0700 (PDT)
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
X-Inumbo-ID: e88034f7-0964-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603949; x=1689195949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6EpXhLB/ZnHGYzIKEyphwqiyS9zUDTms38NuP0TFmY=;
        b=HZjqN37hCOK48cvGmZP3MyXHPsSWerODKITkESa+8okEvm66QeHMRWeJrMA+h9zAy/
         b08e3G4t5lsUUKbLUtaHE2GPHfm2Y6f2xgW3YiErhjVlP8jaPnDQQDBBPDgWToXRn7mW
         PpzBiVyA5JSxI70xxYGR2PwmojuW4ejIHH6298KzStJQkqMFOYKQH99Y1J/uWKo9ZDSM
         eRMw42CLQFJ3ndhOIFwgLE2rhtWcbpTrYEwDV/LXUoaY8xrQBL0kpr9KnDHMQo57XMNA
         dJaliHJT5dELYDcW6j8kH/iUc98Tn/GD3Nr/eiXjSdRocwfmdaU0ArfMHM4wLvGwtdMu
         leiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603949; x=1689195949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6EpXhLB/ZnHGYzIKEyphwqiyS9zUDTms38NuP0TFmY=;
        b=BqI8VHeqQBWszuzhuKNduyzTYWvTbKySqRAESR6wwbX+GA0ANvUtAGsNW6QR0v3Kqx
         bGl1pW+9OZMOVM7Iaty5NfHfEghXrKHmqmEbOdVPgV7niofJy3kd3qgrERjrTRCIIjTO
         MhxHpZGN9YlYXbEo6Q6Uzuwir/OD/pjbuiH12pPfuPQvZVaCZnALFHpiOSyAwIN6SZ52
         ZMoNLvMnPhLrHJMk4axLunp94J/b5k5e5EmQBATWN/wrG/OkYDre/diunk+C43AU8LiV
         M/fjXLNoSVgZ9WN2TVZz5oycHriqk9ZVj1LlWcXdMmGVd/piZLIBXp+OuoECVju/BRRJ
         02KA==
X-Gm-Message-State: AC+VfDzenA5UL9KTeZHalE9QmX+d1R172MB3yH3OdYFn8NT4Km1Uo5yT
	UGZogIwPVaOAfF6a71qmyQs=
X-Google-Smtp-Source: ACHHUZ45RyLy6yl6Drr+w1zJryROJeWNSP67xpIchmrzxG/I82VOblMbJJSkZ2edvv8Qj+2hZ+73Vw==
X-Received: by 2002:a81:7bd6:0:b0:565:d517:e714 with SMTP id w205-20020a817bd6000000b00565d517e714mr7606123ywc.25.1686603949233;
        Mon, 12 Jun 2023 14:05:49 -0700 (PDT)
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
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v4 31/34] sparc64: Convert various functions to use ptdescs
Date: Mon, 12 Jun 2023 14:04:20 -0700
Message-Id: <20230612210423.18611-32-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/init_64.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 04f9db0c3111..105915cd2eee 100644
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
+	return ptdesc_address(ptdesc);
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


