Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803CD72D23D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:10:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547590.855211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ona-0006l2-N6; Mon, 12 Jun 2023 21:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547590.855211; Mon, 12 Jun 2023 21:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onZ-0006To-S7; Mon, 12 Jun 2023 21:10:01 +0000
Received: by outflank-mailman (input) for mailman id 547590;
 Mon, 12 Jun 2023 21:09:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8ojG-0007zJ-GM
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:34 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd9e433f-0964-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 23:05:32 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-55b8f1c930eso841118eaf.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:32 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:30 -0700 (PDT)
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
X-Inumbo-ID: dd9e433f-0964-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603931; x=1689195931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFY2ToTc/KdsqBsJRwbv8KRLKHn/LK4ImlbTce4a9J0=;
        b=Hs3OvBwxjNbzyixj7aSD+NgtYC45wE004i2+DhLM32gwxSgyME8uf0ehUc+DFmEBWc
         xTMw6H3P+HY7Tq7UuCfgFLKB1x+LkNTK02YDaXYWD1PeR9EEokleZ/wyxNBXTFWH/El9
         c1bXL1i+QVcFD32llcBXIuwFJs/8j8fBCHPhcoBGFcfEu/JCwezOfmF0Yorw8OxgwAQW
         Ostw6KM5t1cwURmpaD0hTGMu4TC4wHA6I1gDTQyjBc+K/xsxhtlIAUhVsIG12sG34SnA
         HCLguPK5bJjFlDAoWGoj4Zr1Q8mKdxu4vSYAJa+HTJDnQnTisEOZH/pEJVvGvXlWVYbR
         pDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603931; x=1689195931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFY2ToTc/KdsqBsJRwbv8KRLKHn/LK4ImlbTce4a9J0=;
        b=aubebCD9lqWWIv8All0DmCPPgJnL4tOIrkG+LCtKOZA/H2GgcYGOJaJSwwjansBlqY
         KPynuiz5NuJ855Ht6ZKLSuN9ejMDKJKn9AA+QvtCWagmSo/VB1dTeQoo5godA20Ccule
         L8Iv6lWhOF+BHU/NlLmHy1n5TvXI2vtpYorcxBhDk6/jOunvzKsaikCcFNbmHjqW0F/K
         Re9IjwdurDQqS5nNixHe0qkwvW5frx9YGFCgeoSUFdUQZONGIZQDM1uKYzEGf0lNSN+w
         hVEx/AMTyu0FSEputWkvjO39EOyvQHm29VbYElFYTVpJqIt2UmUlKC/bSqel3afArSJR
         StuA==
X-Gm-Message-State: AC+VfDzAl6jpSNPYk2DVdJIztQVCGFfFKs+O8r2dArweFL0ZOA4Xb597
	DrCpPvpN2Q887ZznXdijPZg=
X-Google-Smtp-Source: ACHHUZ6j3CfgAuZNFN9JISmvDm/MlbHYE4sRUTkol2XKHwfWtbEYLS5pSkDxzuxqJ+njTa+59MBJKg==
X-Received: by 2002:a05:6358:1a8a:b0:129:bddf:7960 with SMTP id gm10-20020a0563581a8a00b00129bddf7960mr4783450rwb.16.1686603930823;
        Mon, 12 Jun 2023 14:05:30 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v4 22/34] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:11 -0700
Message-Id: <20230612210423.18611-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Guo Ren <guoren@kernel.org>
---
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..9c84c9012e53 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	pagetable_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.40.1


