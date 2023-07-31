Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AC3769EBE
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573320.897989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWN6-0003Ny-Pm; Mon, 31 Jul 2023 17:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573320.897989; Mon, 31 Jul 2023 17:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWN6-0003Go-8f; Mon, 31 Jul 2023 17:07:52 +0000
Received: by outflank-mailman (input) for mailman id 573320;
 Mon, 31 Jul 2023 17:07:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJo-0000C0-BL
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:04:28 +0000
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [2607:f8b0:4864:20::b33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e6019b4-2fc4-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 19:04:27 +0200 (CEST)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d16639e16e6so3788726276.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:04:27 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:04:26 -0700 (PDT)
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
X-Inumbo-ID: 4e6019b4-2fc4-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823066; x=1691427866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOzSOLTncjJXn0AvJQqE6PD7zrtBe8MIuyz5zw7TzDY=;
        b=f6adceAKsPvui0l7VSUiRnWj+VnC8V29gRyKPW/KXba4L11duKnXDkkl9h+DOUEe82
         /+uFEmkPUA7pfwVfanOSjRVPX3wfPLVY3FZPvGi3VyyqlsToEnHzzIylic2yHwlsDcH3
         W3JP9R5mJExPbkEH69AGyH0gizw4AowCqMoujs5LGqqMzZnJK/dPFOzk0elvmdxwimx1
         zHO/RBskNqXdsMC9zN3IXGN1/Qatnc3KRzwrgmn/b1CAPxkc6smcQgcPCS+F4TUkpdDt
         7sG/wG+FEbTCZLXxJ46EURhFx988hfZQfl6N1HhCumdsXb4Bqj21mhmFktRwf8yfQcyF
         sVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823066; x=1691427866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOzSOLTncjJXn0AvJQqE6PD7zrtBe8MIuyz5zw7TzDY=;
        b=XRuMWbP4d99OYfo5ZzjXAXeMo1Qc+kTamUOL6YYJ+B1v8kRv/zP5n5EZ/9P8/Hk3NT
         8Qv78NGc4zgQrqJ0aqvzNv/RDw2XcCwZf0VtZZ50yom5N0MMI5hxRLItX8nJSXDIdCDy
         +AfY12nnQRL1YY+VRxilfQmgkFh5DLX3GJ1fFjjlQKf2teTwpSuXEd2pXnYygbj2Pnqr
         SNNUqUDRvubtcdcfGcy/98HbjcOrbryTEuRndonR2Ofrs72emGs69LCqfpo5WbRehL61
         5J3OeOb1zo3w1v2xtg9FPouZsrnaD1HfOJACZyoJgHKee3jNSUqKCUfxoAPc5wlWeY0P
         3mtQ==
X-Gm-Message-State: ABy/qLbVoghxRQ/7buBJTLDIka5myKkdSC+DV1dApWntSSD4UKFm1EWx
	O6W8UjsSVv86gcfs0o57v1Y=
X-Google-Smtp-Source: APBJJlE4T05ogdyrjIbBXTs0RpkDVTPnYG3Ig2UA6lH+KuSSQ9n98n0kBdmmWfFoFgc9s9NgVox+UA==
X-Received: by 2002:a25:ada4:0:b0:d0a:8973:b1c with SMTP id z36-20020a25ada4000000b00d0a89730b1cmr247583ybi.12.1690823066447;
        Mon, 31 Jul 2023 10:04:26 -0700 (PDT)
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
	Mike Rapoport <rppt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH mm-unstable v8 24/31] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:25 -0700
Message-Id: <20230731170332.69404-25-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/nios2/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index ecd1657bb2ce..ce6bb8e74271 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-	do {							\
-		pgtable_pte_page_dtor(pte);			\
-		tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)					\
+	do {								\
+		pagetable_pte_dtor(page_ptdesc(pte));			\
+		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 	} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
-- 
2.40.1


