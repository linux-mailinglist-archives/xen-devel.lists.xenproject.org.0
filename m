Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100E076087A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569393.890035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9dv-0004tO-Fe; Tue, 25 Jul 2023 04:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569393.890035; Tue, 25 Jul 2023 04:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9du-0004kT-T6; Tue, 25 Jul 2023 04:27:26 +0000
Received: by outflank-mailman (input) for mailman id 569393;
 Tue, 25 Jul 2023 04:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Yd-0002Iw-Kz
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:59 +0000
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [2607:f8b0:4864:20::b33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbb9ce8c-2aa2-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 06:21:59 +0200 (CEST)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d10354858e8so1903958276.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:59 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:57 -0700 (PDT)
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
X-Inumbo-ID: cbb9ce8c-2aa2-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258918; x=1690863718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOzSOLTncjJXn0AvJQqE6PD7zrtBe8MIuyz5zw7TzDY=;
        b=dhPD8MhdzMmnO7UJpDnYU2UUndnCrctJzCVX4h8RxV/2AqAGAmNSSgBAimCgoOXbFI
         jwqB3InLHcwQnBW7LGy3zNpfxtaFx0sRNMrc2BW/oP9Y9sT30Imc49n106obHaMafKD9
         3iENsXyRilYTy2IVeIDj7UinpA3gJg4m95b/YmknsgUr223VL5cVJ4//6IC3DQ94xugG
         7BqjgjAuhv+rjaUhUgEIiEByqDs5npSuOOnKXGMd/lRwDVio+iIe4ROtQu1UVk7GVi+q
         O8m155eNSAMp9dX3vcmdIfcwnE6nUvi43OowEy4OezSv6ZkWZbIGQtYJYSHuCGDVV+u2
         iZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258918; x=1690863718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOzSOLTncjJXn0AvJQqE6PD7zrtBe8MIuyz5zw7TzDY=;
        b=YoR14sbQSdUHcjpcieUN9/diVoLeqlWiVMdh2YletoyWrKzYzqrjhm+xlmfvenHu5q
         J0JXLA5a0FIFSBYWM3p4zvGrYIvAjthzKfHSa9mSRtg6PBF2mewQJjllEvEo9xcrVWXy
         s/zU8jNL05M/P6bM08CRY1RlUmTCKe/cbp6/LTjDhJ/eu2PZ/4YR6X4ydciLT/JSeMzC
         PeTtyaxL+t1llwUQ5RPmJNwNyle4Xvn7oe/KP89Z7dtrEOmReirPAuWyJ5CEAIVM545h
         WoPyhj5nOLtuVwV/rNTP0vn5hbPEe3LFFGsv6Z2l/eSsPQvfL5bdH1HfHUpJkGMD/dAi
         Vqrw==
X-Gm-Message-State: ABy/qLbr9rA3ET1VRTiYFXxo/LJ+F7IRVKq8gCYYXIsVGgV3395cP/HO
	O6sgLlQwM+XR1yWDHfQ2UaM=
X-Google-Smtp-Source: APBJJlGh3t71iGxZySWvCqAB9/DfGs5U66hmdz8Mr8qCsALi+Mic17AL5W5IK2UTO7itITs/+4o4Zw==
X-Received: by 2002:a25:ced0:0:b0:d13:e334:241b with SMTP id x199-20020a25ced0000000b00d13e334241bmr2805085ybe.21.1690258918114;
        Mon, 24 Jul 2023 21:21:58 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 24/31] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:44 -0700
Message-Id: <20230725042051.36691-25-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
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


