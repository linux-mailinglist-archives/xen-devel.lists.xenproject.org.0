Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006D473AA48
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 23:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554082.865147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRPK-0006bt-94; Thu, 22 Jun 2023 20:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554082.865147; Thu, 22 Jun 2023 20:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRPJ-0006NQ-QD; Thu, 22 Jun 2023 20:59:57 +0000
Received: by outflank-mailman (input) for mailman id 554082;
 Thu, 22 Jun 2023 20:59:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTT3=CK=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qCRO7-0006Mr-1J
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:58:43 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90309878-113f-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 22:58:40 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-763a403642cso397121785a.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 13:58:40 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
 by smtp.googlemail.com with ESMTPSA id
 d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:58:39 -0700 (PDT)
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
X-Inumbo-ID: 90309878-113f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467519; x=1690059519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=BLHldLJJqXLpr8GAfoHi79v0sph0w6vN/SuJg9rBXjFWP7vHx2aGmaKx+f9hTGSIek
         StBGUDmlBLLgONen/ouQl25e+2Oh56rCFDCpMgFUEQOkNNTjcxLzf4Qpme/gK6EBGlEV
         uCg8bxuRbLrdLb22VpaeGfLLJwjdPeKaXRkjf+OAYYySwTDsQSI3SAbqeNXGAGljALee
         fcpdhclAhH7b5XES0gNbsvIBabKOZu9Ga/PYBeMD7nv08Dx2WAP2VJoEQ2QraVWTFN45
         Wt/gJDKXfFk6SzeY9rfcZjQwBqyFukcCgFCguNA0XxXJLEGG2f88pPraJdoTC9IQG6ul
         Gb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467519; x=1690059519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=ZBoP34puflJTKEa4nXQzzSruUKjHhloFm9pGnKmL1ey+6nIGiKVmEzClLFRr1szGmb
         QDzaDpSHgubTQLhIOm67QRuRDwIiYEUuRdUb08y0W9Jccx8HSi+taHTx0lwNUv8ZArJ1
         gDnEZyt09oU6tmc7LcYDcJJvl3X5UKqI2rXXY9gWurWUyueZbsAbQiYuKQH5hqvLUtFM
         YQHu32bqQgWowv30qAOG8SL+FBHtWQi4zdBRBcTScHOdYkS56uvPqpHvbjeHoD03P9MO
         orkaoKR//t22+H1GgXKSDxY6/d1x2Pth/UPfReqatXLHmcuT9NBhTWdV+20tg6F2L4FQ
         u+lg==
X-Gm-Message-State: AC+VfDzRh4mqiBDEQLVPzF1A9PT8JL8/V0C9fjUhqFRNO6UslbvsZ5yp
	5NsSfwEfp5+V3LgA70Wtcs0=
X-Google-Smtp-Source: ACHHUZ4KRcOpBQjT0rqr9douhR2m3+ahnRE2h5Kbx3P/xMpW7X3b4hHm7K0gMXBTqIp4OFz3bRB+Jw==
X-Received: by 2002:a05:620a:2cc1:b0:763:d981:d0a0 with SMTP id tc1-20020a05620a2cc100b00763d981d0a0mr4781474qkn.38.1687467519407;
        Thu, 22 Jun 2023 13:58:39 -0700 (PDT)
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
	Arnd Bergmann <arnd@arndb.de>,
	Guo Ren <guoren@kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v5 21/33] csky: Convert __pte_free_tlb() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:33 -0700
Message-Id: <20230622205745.79707-22-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
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


