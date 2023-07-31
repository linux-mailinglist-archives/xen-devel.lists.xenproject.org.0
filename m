Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37BD769EB2
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573299.897912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWMo-0008Sh-OV; Mon, 31 Jul 2023 17:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573299.897912; Mon, 31 Jul 2023 17:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWMo-0008Ka-Ju; Mon, 31 Jul 2023 17:07:34 +0000
Received: by outflank-mailman (input) for mailman id 573299;
 Mon, 31 Jul 2023 17:07:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJr-0000C0-1N
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:04:31 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fa32f65-2fc4-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 19:04:29 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-bcb6dbc477eso3787473276.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:04:29 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:04:28 -0700 (PDT)
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
X-Inumbo-ID: 4fa32f65-2fc4-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823068; x=1691427868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=NCurFfzESiDx9LJv2ZuGZQRVSVONypfRSwp3UCPEimaJ0icLYx3MO5YhqaCkZBIR4Z
         l/oM16YnfTb6kc+h35gY+zFIGDLtxKkoqGrDMVFkoTTTXsh+xxxFI4aLUNlB4KO70CwF
         WRXyA1UJf7HH1gQrjYriX6iIExSZBg+JSpTH9iwwtWaRApzq4XeZb8/+i18fB7X+SbC5
         QNboB3mts09Ey/BGMzFFSqcMjH751GJumhdsMsGsSdMw+HfAwMqxwq/99BYNjLDy4Uwv
         T3I5GqlbCblT84V09f9Mmwx3a1PPDI4Kl+kA59SDykK80t9C+rJKaVJTL/sIPY4ok+Qa
         Stkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823068; x=1691427868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=Yp9iU1OSYyAzZFcACWi3Y+DTgw8Eq2Ul4pRgeZjAJIBP/jk5+YYCee28CFsnzvewuN
         SjqkUWNl9EdbXNE9UHB2DGkQNYl4Lu3FYTXwIF4XW7RIXqfWEKMkr7t552Gm0Vj9GTCO
         TgL55FEJ+7kPYgqCyBeblK7YbrZBCsPkEMWTwpVmFSncNVhfdtW2Q3qMVyp2pBc1iICV
         U0UiraKOM+GHg85QBPob+OGvAxycTJuP2ejiDDSMEQTUmT1xsnrAgqc06sbF3WMO0DKT
         sxsEQULHnErBxBaz48VWVkPey/sJM1W+NY+HOlP/MpBobnnyFFZlxex0nSNKQSdvI1gW
         cFlw==
X-Gm-Message-State: ABy/qLaN8LfaffTJgD9CW7RdVTPKo6Pk0VL/CulOm2V46bygZq5hdUvu
	XHZ2EP89Hsox42OJ8/tWXS4=
X-Google-Smtp-Source: APBJJlH2OMZz7Ho/ZKKTbee+QNJ7Mj2bTW6BCb3XUatLH/MvStrEwd2dCkY4APrPVNcSGvWAfXuhUw==
X-Received: by 2002:a25:acd2:0:b0:c6d:f875:520e with SMTP id x18-20020a25acd2000000b00c6df875520emr7715849ybd.49.1690823068568;
        Mon, 31 Jul 2023 10:04:28 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 25/31] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:26 -0700
Message-Id: <20230731170332.69404-26-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
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


