Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5329F760881
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569402.890092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9e7-0007vY-7H; Tue, 25 Jul 2023 04:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569402.890092; Tue, 25 Jul 2023 04:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9e6-0007qq-Se; Tue, 25 Jul 2023 04:27:38 +0000
Received: by outflank-mailman (input) for mailman id 569402;
 Tue, 25 Jul 2023 04:27:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Yr-00023t-I2
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:22:13 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3544807-2aa2-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 06:22:12 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-c5f98fc4237so4297284276.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:22:12 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:22:10 -0700 (PDT)
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
X-Inumbo-ID: d3544807-2aa2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258931; x=1690863731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=dIpSbxhiHoEZRybZXN/MVeO3g9uu5Wr3kckw/68K6KR19uhvm31rhYObpAHJDDboRN
         fN++WCiGx69nFrN6B8d/NLOzRwfLSelYXtCG2axa3nxyX1nLiBBRswcz9UUR+gYqr6j2
         ancXFsSIRjlVC+siGAlQPxsDtqvlS6d02kp43kWDLSl5AqbfL3SxRXE8QCvzAnUbAKUU
         YasskwMDZ8VrwnmHFnrCJmWDVf5znjGB85g4q/nAwV8W9HMi2mBDPg8zNmEW2Wmz/ahG
         Gd3GY4JptXSFLWhWmWPz4PD8TWa0sGWxRtah1a9utFkbDSvAH1sC4A2J8wMHczxZTgoj
         5RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258931; x=1690863731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=FPc2ddG3cvXQvJBlXzw6xR+tncgBPlWzW7Ahz/XLioPgdW1Iji2yplIX6W2mvpUDEB
         W0TMTVM8iU9C9CtWSEYd7CHuTNUYBzBVkWVx7NGgXPalelCcXIxmaLvRk/hvrjDBT4z4
         jmZ7Bzj6T0Y4aNFXgy1qwahjM/Xpve8SFvpq3VjIvSsFf4I6uZx3aRk6LlSULoEiKKdK
         wKgCRGqBQ8tENTZ7Bu8hP2Wr4X5hg7Wxa+QT1QuJ71b4Y6J4usV+xyO8v4BGEwJaPnEl
         OkxXHYe6E59mzY8EMkuui106KqASVcTd5wMJZFDFP11AjlrqllBOa06ncRBaofHYgunx
         Iorg==
X-Gm-Message-State: ABy/qLbFfbxnCxz+M+AXXgfAlUwiBzM5yFTJrzEoxRYuTXfVfy80npeS
	jSNWf1px2p4jJ6bLYjOEIag=
X-Google-Smtp-Source: APBJJlFFrRXSNeam/kWey2sQFPpJrG6DmS1yW3xEJWnQmkKSGkoB3AAvrxYF3pVhZLtkZcpr8uNrnQ==
X-Received: by 2002:a25:2517:0:b0:d0a:86fc:6110 with SMTP id l23-20020a252517000000b00d0a86fc6110mr5159740ybl.28.1690258930893;
        Mon, 24 Jul 2023 21:22:10 -0700 (PDT)
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
	Richard Weinberger <richard@nod.at>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 30/31] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:50 -0700
Message-Id: <20230725042051.36691-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..de5e31c64793 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,19 +25,19 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb,pte, address)		\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb),(pte));			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #ifdef CONFIG_3_LEVEL_PGTABLES
 
-#define __pmd_free_tlb(tlb, pmd, address)		\
-do {							\
-	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
-	tlb_remove_page((tlb),virt_to_page(pmd));	\
-} while (0)						\
+#define __pmd_free_tlb(tlb, pmd, address)			\
+do {								\
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.40.1


