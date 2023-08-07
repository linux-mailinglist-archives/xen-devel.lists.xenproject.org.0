Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069B277341A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579053.906964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9K5-00041d-DI; Mon, 07 Aug 2023 23:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579053.906964; Mon, 07 Aug 2023 23:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9K4-0003n0-Jr; Mon, 07 Aug 2023 23:07:36 +0000
Received: by outflank-mailman (input) for mailman id 579053;
 Mon, 07 Aug 2023 23:07:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9Im-0001NY-Tc
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:06:16 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff60c49c-3576-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 01:06:10 +0200 (CEST)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5633b7e5f90so3615823eaf.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:06:10 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:06:09 -0700 (PDT)
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
X-Inumbo-ID: ff60c49c-3576-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449570; x=1692054370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XaHpTf3P/utbT17OPG/H5MolPsiYyRMVXSdV5AvoHU=;
        b=GmyaVrawFabDS7oM/FJ2wsqOTnvNiSZkWHllyllBSGtBhNSpEmhqjU2xmr+48gvMwO
         LUXnCk58UhmfTImv2R4R9LNF0+WlzxXIVQ4Y7ZC5fEeHoGrn0o/ogRSADB0Y+NluFrtN
         MrrlZ4Lz/gi5878wRIWP06wgFFKVx+8i+ghKFpBHekPx9T0p+3sqj2xh34rznNB4nw+U
         O7FH+uzt41O2vvO9FAauF/idvM9r4rw7Q35Wwsa8GbYTT2MLxcQcKcfZ8291m/c55wrV
         URc64VPnBpaXKs/Bni+oDqsCjGnYy/ppZbjbVbnispVrc0PlqosfX2g85SuErvT0W1h1
         o3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449570; x=1692054370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XaHpTf3P/utbT17OPG/H5MolPsiYyRMVXSdV5AvoHU=;
        b=JNaCEAh0F9ogZx7p8idPPcrcMKlgg3ESkBb1wJhZ0+/o8C8oLKUQ6xrcVtC3wHyn6a
         25J88keWREsRi4DBoYoqPQkUFDp34Q5TCALJu7yH/RBZntPEOM/q2qo4lSt4HEayK3VI
         gboVMf5cm2ZtepEduq1kQarb7UxsMqjJw0VtlKZ/NIYgq+oHrkwEiYSFvu2+PkH42ZYl
         gqrXSvZu9xtHVyKFzOJ8+mkbKJLSaEe18KWtHOYRusD/g2LV4ZiJMDBGFlDjX6lT+kzw
         cY/i/X6fw3mrj257LJLkyi0TfgeeOPUwsTehHzWW1ibTsiQ1sZ+npLtbIUMsnSywS+ic
         lDRA==
X-Gm-Message-State: AOJu0YxBMoTeYNSrkhWKeof/+5jRjgpsuhqOjGJAnRWSfjyOR5xoGB7N
	sVlSjuD8RlTj07he/jIyTqg=
X-Google-Smtp-Source: AGHT+IFfR71b5uGC/N7nUJvkV7EEf+q4ZrD/2jbgt4p5+XAZUesJuHroaMR2T6Qu+08oLKK4OIq5Tg==
X-Received: by 2002:a05:6808:1997:b0:3a7:5314:e55e with SMTP id bj23-20020a056808199700b003a75314e55emr14747526oib.24.1691449569767;
        Mon, 07 Aug 2023 16:06:09 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 25/31] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  7 Aug 2023 16:05:07 -0700
Message-Id: <20230807230513.102486-26-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
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


