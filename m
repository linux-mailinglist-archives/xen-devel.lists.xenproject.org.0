Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C106760874
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569381.889963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9dp-0003EW-JO; Tue, 25 Jul 2023 04:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569381.889963; Tue, 25 Jul 2023 04:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9dp-0003CV-DV; Tue, 25 Jul 2023 04:27:21 +0000
Received: by outflank-mailman (input) for mailman id 569381;
 Tue, 25 Jul 2023 04:27:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9YW-00023t-Gf
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:52 +0000
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [2607:f8b0:4864:20::b2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6c40f70-2aa2-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 06:21:51 +0200 (CEST)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d066d72eb12so4536318276.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:50 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:49 -0700 (PDT)
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
X-Inumbo-ID: c6c40f70-2aa2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258910; x=1690863710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=f6oxEdexqW7t8O18O1zlBzEMy1/ySz1lSWwZIgvC+6ZdC+AQVNOOjrUGsL3n8z9yLs
         jC/oIvWOegKfTXKYCqEjhGYC8DO1R1+qqiiOoaRmFe+GV40qDgP7vCBrkhQ8/QoelGjZ
         6zYUNV4SeVX24QIWi1/OsGEJx1KydkZGoq9ape10nJTNyMWr+pQqOvmxVzCb+3U9sgmC
         ze1LeRMHMeTo2LxUzcGxr55PmnWGKX2eITQpSi6L0WDbS9ycLs9Jos/2PAo+dLuVd9aS
         LiJCpXRUIDud7YKdN1pv+EIwqPuZ42v47LQ3yS2kQDdlx8gJ3/GU5UxByOmc+boocCVB
         ZyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258910; x=1690863710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=jqC6l07dy62O7Jv5s0xZDVJ6TETyoX8RnDVKi2NdlYjPSAb4CATfC/Aqb4ha9woHIg
         pCRjj8GROwJTzmoNYrAWoUytCjdVh5+aQVfWKaxqosHRkjyhPnn0wvu5znToUOPDMIBQ
         b5kPKr1959i17EGUFsJ86yS8Gk7NvKsHpst7w8QigAMyoJkE06+LPdHCsM5ryOiPCvJL
         Ut/LxgYp9RGY1v4dV2teP7CXeDBCUwQQoolHB0hiLNbaQ1sWX9kVW5zuc+DSbKvVaYU4
         rQeGKLGjS+BvtBj9yhAB6m6kmkX86JNeISyO3KysV/IPkhPwj1jn6FCl6o4VDhL2y+tQ
         Fa/g==
X-Gm-Message-State: ABy/qLbV604YmjmLu65zqUmTlCAAW94Y32KZsAb04jpIVeJsSEBz92Ag
	31QQf3xk4uoaiONTls8UozE=
X-Google-Smtp-Source: APBJJlE5+Qlh5eptk2IDiumLzwzdgKuW8E4L+dGkDhCtXpTjXCpZJt13f1YzsO4C3URc73BGKhlHpg==
X-Received: by 2002:a25:6814:0:b0:d0a:3876:a22a with SMTP id d20-20020a256814000000b00d0a3876a22amr1377987ybc.4.1690258909714;
        Mon, 24 Jul 2023 21:21:49 -0700 (PDT)
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
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 20/31] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:40 -0700
Message-Id: <20230725042051.36691-21-vishal.moola@gmail.com>
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
 arch/hexagon/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index f0c47e6a7427..55988625e6fb 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -87,10 +87,10 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 		max_kernel_seg = pmdindex;
 }
 
-#define __pte_free_tlb(tlb, pte, addr)		\
-do {						\
-	pgtable_pte_page_dtor((pte));		\
-	tlb_remove_page((tlb), (pte));		\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor((page_ptdesc(pte)));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1


