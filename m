Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B71E718D4D
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542045.845510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVg-0006CB-6I; Wed, 31 May 2023 21:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542045.845510; Wed, 31 May 2023 21:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVf-00069T-UB; Wed, 31 May 2023 21:37:35 +0000
Received: by outflank-mailman (input) for mailman id 542045;
 Wed, 31 May 2023 21:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQL-0006zB-FN
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:32:05 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 957a0a3a-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:32:04 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5689335d2b6so718917b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:32:03 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:32:02 -0700 (PDT)
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
X-Inumbo-ID: 957a0a3a-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568723; x=1688160723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSGr1AIBRcRb+Ur7L3hOWyc2qTqn+mhf5/YLNQmZcmA=;
        b=P+sFLMkiyDDyXlnEG12Vca4wXTlsNP1tjr5mpQ3xYowZkV29Gi4DHzR6qoKyncOySw
         jnRT0Uzpd7rJ5SnFzozOgbTxqzpBvgdV5deGMByJA1EX8U9bDlcdVF5nVlhFFf1pyZ0O
         KrWMXXKGFgo38kAOB8ncfn/SPFyRIIMw4Td8wl18EIsvccYdq2AsnvZ0dkbvnVIaV8oQ
         lw4pGC9Zhdztp77vkJB22l9Fos3IjWhzJKFNlsAyyHAnjGjJYghL1MXToen9jCOsOslF
         dBNcDAuc1Cy34XA+B9s+UNYDNSEGNOwzJVHJrEoMCND5EfDLqD8QbuDF0jEbofHqgPPQ
         P6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568723; x=1688160723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSGr1AIBRcRb+Ur7L3hOWyc2qTqn+mhf5/YLNQmZcmA=;
        b=gpJf43wNV9+m6ftOxcBHrULyODctrSNd3f827AuDw/waUz2ke9FAoDN6AFbjqiAOXR
         6sxJO5EqV3JEXRWYe6e1C3StNoy99OR3yu8MQ91eAa8eHWAVQKbVtZ7dnbfYY1fYkz/9
         zGdF7DLw1xL67BjVTm2Tf6Gm+ak/A8hp8L1oRZvkfDL54ZdrvxMalUqEjhtZO01CssHj
         UXRX0C7kPYcnfJiMUuKtjRfi+RjGE5Mye/EtaFmQhl3rCxB5+5NRtnK74cJAVJseLRSz
         liU5T/rFsIGNjQp/Xi7Ra+EUfqVHaQ5s+Q1h55jDJ4PulTBd8c/6EQQaoMs3bW1QwpLY
         +D2A==
X-Gm-Message-State: AC+VfDz+wT3afHPZADavFVOMaWLQGKWE8zZunE322MQ9ymDnoRQdibB8
	oT6/JzScIagyopI/ptrjc64=
X-Google-Smtp-Source: ACHHUZ6lpvw1UsG9eqv+xSZaIjITC9PhoF1JcriZ34z9zriWEJuaLEkcr/e1lknRm4p3R1WVQNwsxA==
X-Received: by 2002:a81:4ed2:0:b0:561:7ec:cf90 with SMTP id c201-20020a814ed2000000b0056107eccf90mr7025257ywb.42.1685568722698;
        Wed, 31 May 2023 14:32:02 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH v3 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:25 -0700
Message-Id: <20230531213032.25338-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
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


