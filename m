Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D876F3842
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528136.820980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMZ-0007sT-3v; Mon, 01 May 2023 19:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528136.820980; Mon, 01 May 2023 19:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMZ-0007qX-06; Mon, 01 May 2023 19:39:07 +0000
Received: by outflank-mailman (input) for mailman id 528136;
 Mon, 01 May 2023 19:39:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZDH-0006PY-PU
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:29:31 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7864ac7c-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:29:20 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1aaea3909d1so17755805ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:29:20 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:29:19 -0700 (PDT)
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
X-Inumbo-ID: 7864ac7c-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969359; x=1685561359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIsUNYOwSPNxjYFxvF4LgB4Ah8JH2T7Nmtlw8Cz+gsw=;
        b=JvPLlmC/XzUWqdECLyDwvfeLFLPFT450E92A3QXyvZyOZFiHjs0SqrfxeBMPzeb8LI
         K2VYtEv3r+e+UcHKuqN8TTRgEDMk5QiHg2w8LWe4aiFQNNV8Hh6df9gt7z6D8qxOouWJ
         wLPmS/k/ifaj+fNqHq4KBrLkalomexLgsPcDr4xMzpwyPwPn0hyVLwNcBBGjvlXZkwRl
         lPtqWGJrBs3wn3DJU9zWYI2bb/1KFvoVhNYahmv1oY0+idoipKM5ABGGY8tIdglpIS4E
         WqBtNig6OCJrivJLAJr7mSv5nUheWG1j4pFaa5KN6zFjtfYkKhLunWXNp9G65rPn/E55
         zhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969359; x=1685561359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIsUNYOwSPNxjYFxvF4LgB4Ah8JH2T7Nmtlw8Cz+gsw=;
        b=fuovOtMeRxE3+1W0Hee6wxwIlrpb4uUU5MkUD2lhnrUKD0PpjdPUu6F3gHm5uniYNh
         P6tIc4sy2YLUpH3fD/kRrU2RHfGbfQdxHoxPBgWCLxRd2UR8F70KEfg9j46VvkYQMAHr
         PUIPywKWf6FAWgMtS2dfv9yYhG9b5By1NCfpc1h/GLARy9RnCmPuvb7fKYXsrjnip5sM
         ZPhIWoEh17jTEcV1Ln2DnyvNmwvKcKmgYwY19f8wngEA/J9sHScGE0TWVPeaYi3h9PCd
         ugkqW3DAZZTKJkXmEWKEJD1uxqbhG5uMgO553esVSrSp6bhG763OfnSeupeZXShA1roT
         /mdg==
X-Gm-Message-State: AC+VfDyx5cnbZztC5QeKkjjVJ+9Q/D17zXLudHKXATehKf6JfHTiwLNX
	Kk8kkAHpnoWLyA2rnTQKsJClzwfoMfO8nhMc
X-Google-Smtp-Source: ACHHUZ4XGLMgkIB9Q6wCsJwFAYUMJfuCSptJDhnDjc9kz87hQFDk4CAG77uXolw+VTSUtUndXFrgrA==
X-Received: by 2002:a17:903:120c:b0:1aa:f53a:5e45 with SMTP id l12-20020a170903120c00b001aaf53a5e45mr5020547plh.39.1682969359666;
        Mon, 01 May 2023 12:29:19 -0700 (PDT)
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
Subject: [PATCH v2 31/34] sparc64: Convert various functions to use ptdescs
Date: Mon,  1 May 2023 12:28:26 -0700
Message-Id: <20230501192829.17086-32-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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


