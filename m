Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 746DB6E5378
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522405.811809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwE-0000gW-Hj; Mon, 17 Apr 2023 20:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522405.811809; Mon, 17 Apr 2023 20:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwE-0000Zr-8x; Mon, 17 Apr 2023 20:59:02 +0000
Received: by outflank-mailman (input) for mailman id 522405;
 Mon, 17 Apr 2023 20:59:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqq-0005M2-P6
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:28 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6f33626-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:53:28 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 cm18-20020a17090afa1200b0024713adf69dso15386300pjb.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:28 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:26 -0700 (PDT)
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
X-Inumbo-ID: e6f33626-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764807; x=1684356807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIsUNYOwSPNxjYFxvF4LgB4Ah8JH2T7Nmtlw8Cz+gsw=;
        b=fsz9HBXpyixYv0zGEIQNfLPb4EjMqtI/28pihon+vRduZpglxs4kGo7QlnsgzbeVep
         MUefXrtmBIPAEKph1/xE0Hixz+XFSj9eLb4OXqcCPGwVWZta2b+6OV8DcUNUc3MYWho8
         foQqBfLzT6QF4GBhL/zISw/ZQfIxqSnZu2sd2q6CE2U54ygVclXX08i47edCNHvoHxB+
         sBBNY+ovhIlsXyYoYKNVSm2boGQ3Di1szM5293gnTSGOnWYTxtAAUVimXGr6dZV0Zyrz
         TtkMrcCltGZOVK2SbO9vEj4TQWwRgKIU6/H0ozoMQVL6Kfmq0ZrnJgq0p7Ga0/De5Qi0
         sDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764807; x=1684356807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIsUNYOwSPNxjYFxvF4LgB4Ah8JH2T7Nmtlw8Cz+gsw=;
        b=X+dKtr3i+9ru0YPT86uu/dTFW8aoSATMbfcUPE1a6tYtHB0c87LBYvB2o1OlqOPDSz
         RrNauRVAiOvwBZlSwU+RrlLbcM8+Lv3eCc9H2XGlfz8GZPGMamYUBqvrQM5vtt44DXTB
         /KSaZ/sG8HNaDUQH/eWynA+a6200dv9NDeBPqiutHxi/+HSik1Wum5P2Gv/f/YpeN6Hc
         Q9HA3GugCpjYCuYlvQhPmKcM7coGprb/CeqYrs6ufMV1xJ2QYJlKxgMlRZV/KCC4Xz0X
         tTCTVgSmgrGqi4gIynEHa436Lvc5vOwLyIH4x+sbDZOPUom2cgQA7y6+heP07n5fr90W
         kibw==
X-Gm-Message-State: AAQBX9cprxw4//Sw2VEWnLTlPwIT3haCPrpX4ARYlTuTwdy3RuqeJgAR
	OSr55XTaXFUhT5wiPtiKMFzroBbx3AOW2Q==
X-Google-Smtp-Source: AKy350YfnaT8KE6LOLQ9wRoeSIO99cnRXYKnv4nnzRXnI3u1QAONlMDFC8rrZFtHP4TZD3hWsCKEag==
X-Received: by 2002:a17:90a:fa3:b0:237:3dfb:9095 with SMTP id 32-20020a17090a0fa300b002373dfb9095mr16284735pjz.6.1681764806946;
        Mon, 17 Apr 2023 13:53:26 -0700 (PDT)
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
Subject: [PATCH 30/33] sparc64: Convert various functions to use ptdescs
Date: Mon, 17 Apr 2023 13:50:45 -0700
Message-Id: <20230417205048.15870-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/init_64.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 04f9db0c3111..eedb3e03b1fe 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2893,14 +2893,15 @@ pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
-	struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	if (!page)
+	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL | __GFP_ZERO, 0);
+
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
+	if (!ptdesc_pte_ctor(ptdesc)) {
+		ptdesc_free(ptdesc);
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
+	ptdesc_pte_dtor(ptdesc);
+	ptdesc_free(ptdesc);
 }
 
 void pte_free(struct mm_struct *mm, pgtable_t pte)
-- 
2.39.2


