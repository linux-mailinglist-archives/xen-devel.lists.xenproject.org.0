Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A625C73F213
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555719.867751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEj-0003A6-3O; Tue, 27 Jun 2023 03:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555719.867751; Tue, 27 Jun 2023 03:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEi-00037G-VX; Tue, 27 Jun 2023 03:19:24 +0000
Received: by outflank-mailman (input) for mailman id 555719;
 Tue, 27 Jun 2023 03:19:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzBU-0003pv-Al
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:16:04 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2a1f92f-1498-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 05:16:03 +0200 (CEST)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5700401acbeso42707367b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:16:03 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:16:02 -0700 (PDT)
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
X-Inumbo-ID: f2a1f92f-1498-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835763; x=1690427763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOzSOLTncjJXn0AvJQqE6PD7zrtBe8MIuyz5zw7TzDY=;
        b=pYu/np5E02v9D4l9kp2NKvJbLly/W4E/pytzpciEjQbyT6+cb3MtewkIWSZ/wCYqXd
         G1Xr/QkETq+9GbOV2yhW+2wZnwokC/KdlaanhyggpRl1yOJr09K81oiMFpOqkCSKUN1U
         FaF0VsjnMFKldVgjw5dM4Iy6YMJ/sIWl4pMPKU4lAMjDSOWrwT/y3HEK7DZHkwf96llK
         iirmdX85Js3ztXjDiHDLqtShs9EXg3guUWkHRosbVKtQGujpNsiEApphQ37yRcHluKce
         hLpePft/RQblwSLVA6U8/x8zaLVFAB0Ea9ymuNJLOKqGjd9fA49LoIOpslhGIKWxr+Yx
         skeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835763; x=1690427763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOzSOLTncjJXn0AvJQqE6PD7zrtBe8MIuyz5zw7TzDY=;
        b=Z5tX7pVbkc3FpwZC9ahH4jWWUatKqBDKTr+AkWT9CECdGtCGI2h7iel0U4qZInCdv5
         tNjOGoBq77SuibS84xD+RFj5bEVu+8DAhKda4Sv+eZIQAbhMTnxrbVIZF26cpfd4slW9
         +ppsmqJ5N+RrjJ7eUvFZ+tIlPKdFrmEvHSJVoyzw2bu88E1TvN7HFspteRf8Tl5S3FnR
         UXVG69JZHLIzjs7qKSG/EhGXFpagA7ERv0R9VtO72SB77olZqpJ2tJJDzG6qBgqA12VI
         UueK996jqnXXaee8KxSHGBBOPh/h3vrJ6oQBeWfFSmnXy9u3Upq9TCVOg8Rl8c7bxlUb
         p/5w==
X-Gm-Message-State: AC+VfDzrmR0C7pMAOWfHnbqivMTrr8X9uksYZCx9/60pKte6vH+yXZjC
	PGgIe75bZvzaNsI/sjdANZk=
X-Google-Smtp-Source: ACHHUZ4sbsRgQIL7xgoFeCT8hAtH3rltXvvkgvi4T0uDEBiqb265+aHLns97dzgLS2JgA0bF/wvN3w==
X-Received: by 2002:a0d:ddc5:0:b0:576:8a5a:87e5 with SMTP id g188-20020a0dddc5000000b005768a5a87e5mr10382513ywe.26.1687835762791;
        Mon, 26 Jun 2023 20:16:02 -0700 (PDT)
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
Subject: [PATCH v6 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:24 -0700
Message-Id: <20230627031431.29653-27-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
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


