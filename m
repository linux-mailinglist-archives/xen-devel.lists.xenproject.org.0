Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317CD760879
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569382.889970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9dp-0003IJ-Tw; Tue, 25 Jul 2023 04:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569382.889970; Tue, 25 Jul 2023 04:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9dp-0003ET-Mh; Tue, 25 Jul 2023 04:27:21 +0000
Received: by outflank-mailman (input) for mailman id 569382;
 Tue, 25 Jul 2023 04:27:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Yg-00023t-RC
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:22:02 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccea9428-2aa2-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 06:22:01 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-ca3cc52ee62so5589308276.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:22:01 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:59 -0700 (PDT)
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
X-Inumbo-ID: ccea9428-2aa2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258920; x=1690863720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=pF3/aUrb3JX49e0u22fW9ciATl7u+MUedSxMIodJhkvCSur2UbV1ymLo02TZ+J+kPF
         Kx5HeDHnWoCFEiMJQRkEFLmGeKvRgst1SRco5Nf2sutYKL2w+MtMEjm9RYoVaVV/WbaV
         YVQVPd7LOUuBtkmGFl+FmiiuwqN1u54q2lW5pHrezKOb3piONF3+v81Wt/4bQq44saNJ
         XmrP/XQPqOefJAz6PJqT1BLnizFGrc2xSl/LadxebvB7doG0PAx8D01yebNX4JhyxCLk
         tgaBucE6SVITexqLzDjpMrpbMyKpy8WP6lMzfEvzG49OmJW0+1GrWwpk6bQXNmC80wMv
         +HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258920; x=1690863720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=EMYqwr815s01XR4R6LBGG2Pu+6IMyGgqCtN9RWfsA6vsbeLJ0q+1D8h+w1qd8rINx1
         3zIaG7RzEfFMOxHcD2b2pB8gLkv/9YCwv0E/LTyJVaUbbscFHdVHsl2KYJHwriuue/rj
         4qr1L0+G4qGw/5lp2Jkbmg+b7C/8UNASxqkC75noKTJSdda1wk0/T6EsaVTD5DFSe3xY
         58CeGLAZN+LH78mpE3hOPLVnGtus0/jJTfelxQo4RLpLZHgD2S/PGGxrXfs3DPWQgWP2
         ctvWAdQuROaMRVg3v0G/3fv4elHNTE0BRTkc75KfHUlSOZvCqKCaeS3Fw0+/RSIm04U9
         0Hrw==
X-Gm-Message-State: ABy/qLbXJIyde/9CrSXoCi4M6oaaXN4392H8OhqA16h5Wpy7aQ3SxG9x
	KLT4HQ163SCplnlRfuUkxxE=
X-Google-Smtp-Source: APBJJlEdkcahnNVyEvlWTLDmpaRsWSF5WciOnYxL0p0ce55MSQlJt+bgPnW2jeW0QxRihWyF8hwpDQ==
X-Received: by 2002:a25:ac42:0:b0:d0a:da40:638e with SMTP id r2-20020a25ac42000000b00d0ada40638emr6436068ybd.12.1690258920108;
        Mon, 24 Jul 2023 21:22:00 -0700 (PDT)
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
	Jonas Bonn <jonas@southpole.se>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 25/31] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:45 -0700
Message-Id: <20230725042051.36691-26-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/openrisc/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index b7b2b8d16fad..c6a73772a546 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -66,10 +66,10 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)	\
-do {					\
-	pgtable_pte_page_dtor(pte);	\
-	tlb_remove_page((tlb), (pte));	\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1


