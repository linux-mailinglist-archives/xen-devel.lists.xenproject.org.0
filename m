Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD087733FF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579044.906927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Jz-0002x2-P7; Mon, 07 Aug 2023 23:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579044.906927; Mon, 07 Aug 2023 23:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Jz-0002oF-I3; Mon, 07 Aug 2023 23:07:31 +0000
Received: by outflank-mailman (input) for mailman id 579044;
 Mon, 07 Aug 2023 23:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9It-0001NS-77
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:06:23 +0000
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [2607:f8b0:4864:20::b30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05dc7ba9-3577-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:06:21 +0200 (CEST)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-d299ed34bacso8703918276.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:06:21 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:06:20 -0700 (PDT)
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
X-Inumbo-ID: 05dc7ba9-3577-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449580; x=1692054380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9QlLO1dPeyZnWI5hHw1TuJlTK1nfQVgIvIYX0JocUU=;
        b=ZmZBlK2BE47dPXTqc8IQ1uTKCUobrHijjQnotS76WbJUUgCGVOPFVEmsLAOFQve7Mq
         8k04A5/AuFSS607BBJG/Nd5XpAmnH5zPypJPEnlo7r978iqN52fpsMDyDxOev3Z41hLb
         CpvzpxqdWGHuM0xgZvYoYbOi2GTwb0pfPUe0oyJziB36Q6lozhNOIAq2JTvWjnhFdQ2U
         4BFxzsH5/HG/XXl5/YPVavhDi3L4gvkLB1NxxGw9654yYac9diJlEe3+5Z8y0K4G8C7u
         mJwXJ96QObfNW/oMJd7PgnIP4//NNbVjGeiAj0SJF/1wFKYAbBETcCfRmwi4qkbVDTFa
         RY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449580; x=1692054380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9QlLO1dPeyZnWI5hHw1TuJlTK1nfQVgIvIYX0JocUU=;
        b=QG3GsaFOlqX/hDzKUYg3wAc8G+wZVdcn6+iitxkAeFnwrdsa3EPfzYdHMpl7Ubvfw2
         A5hWWOYpPJNjAQ2eAW/dfEpFprr9jN+rBVvSdoD0AXylRDWYq6lwuJww0bfdXw45PYAP
         i+0C153C2IccOPyGlOA4R/kHvTOId0PAW3HBFO5T6Sygu3HzQ6Vmn3oqSkTiW68H/sOd
         84a9oUhIc2MzUL7n9BgaQRm8qGNm1tkTIV/Szpx73mZNUO/5qSx+S+y2KYh36eXViJ29
         8nHRRtYji9sMq+C4dkVWcELFi1vB2o03td0odrY6wtekn4XcLI9gRuWCqqEEfRZsAInV
         dHag==
X-Gm-Message-State: AOJu0YwgEQMtpV3OPsTjGZUMvjpUhw5j4V3Ku5rCIyIXDbDMNvIJVKPo
	5kFNVyOiZqV947qJJnsk2dI=
X-Google-Smtp-Source: AGHT+IFhMlpHJ+7onf6BYxf2ZEVLLZTaCynnVlAbd/4Vka+RTYiQ5OXzXPwOq0O9emhI9trC6wG3Sw==
X-Received: by 2002:a5b:f8c:0:b0:d0b:7e30:6d17 with SMTP id q12-20020a5b0f8c000000b00d0b7e306d17mr8498276ybh.14.1691449580620;
        Mon, 07 Aug 2023 16:06:20 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 30/31] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Mon,  7 Aug 2023 16:05:12 -0700
Message-Id: <20230807230513.102486-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
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


