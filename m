Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A731769EC5
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573355.898045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWNF-0005ab-7n; Mon, 31 Jul 2023 17:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573355.898045; Mon, 31 Jul 2023 17:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWNE-0005TI-L7; Mon, 31 Jul 2023 17:08:00 +0000
Received: by outflank-mailman (input) for mailman id 573355;
 Mon, 31 Jul 2023 17:07:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWK2-0008Np-Jp
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:04:42 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56597512-2fc4-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 19:04:41 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-ccc462deca6so4899886276.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:04:41 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:04:39 -0700 (PDT)
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
X-Inumbo-ID: 56597512-2fc4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823080; x=1691427880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=fypnJ8EOp6389G/yrEsdiBw8+ODFJB18UGVsK1WnMmuuyVJGZEMRFzagFIz/t/iUP/
         2hQUC88xrJTr5zC02f819WJdC4SisRLoHgth8vaUsDxgglJhi6MHYK2vk4aVYQFhtjHu
         EJ82jl2MiLVTmBE59Pwb2ZF5o5qt31wsfoof30f3jCxfq5PoYDaunPmGz2hyM4ah/4KD
         ydzqEb1pNZ1YIAh6SsOFxKI8oa6yw/2SpcLuoX5OxyBAJ0szyfenY4ClRYrgeaYLOg5P
         lgJjKay9Zm3G6SxJT2EV+hC0IYmKARvYedORBaKi0opdpa/X1F5LwQzjJG/maSgO9ToG
         3U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823080; x=1691427880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=VQucrlP7Q4RRp6OsPmArwI47v6xyOXEk61z1hU+Nn9f+Kru3tkhlwAqUaMREpNL6Bt
         EB+1UnUbz/RsM8dIw0I+gGpSJ1Wx7yhua1j/bac2g1wF6QFO6/FFHXzNwj5Q1r5xogn0
         uhiNa7Gxyg/tQtaCzSuZYGEmd9bYCKDdfNUvhRkF1OtAynKlvSKIAHLrfd4FPQBYALgQ
         WrpTJyjry9ghVPuixVX/6guQFObUDsNxTHukohlVMEGrTkqhYRB3J4Xlg9R4rlj9IXNv
         X8jtVncoKtzBqwvjoGapshMXJ2gkBfIFiw7xbFmuh4thnkZoOnHppOoRBf4iWfk6TaVt
         I4ag==
X-Gm-Message-State: ABy/qLbqzTVu6yom4Ng4d/MlhqXeWS8iJC++2JLTVrRwNGqcS44maZ0k
	FZ/qbDReAWos/CtgV2K0n/0=
X-Google-Smtp-Source: APBJJlEdwhqcmTMrEtHQGs0fafmxeVWw9ywX+xXLwsxfbs/EAm9tmHsbV10DQDaT24PRZb9zbh9R9w==
X-Received: by 2002:a25:aca8:0:b0:d0b:2ff2:ff8 with SMTP id x40-20020a25aca8000000b00d0b2ff20ff8mr11589261ybi.21.1690823079964;
        Mon, 31 Jul 2023 10:04:39 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 30/31] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:31 -0700
Message-Id: <20230731170332.69404-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
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


