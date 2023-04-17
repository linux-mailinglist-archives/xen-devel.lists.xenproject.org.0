Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3676E537A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522419.811864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwN-0002fm-Eg; Mon, 17 Apr 2023 20:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522419.811864; Mon, 17 Apr 2023 20:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwM-0002VR-Vq; Mon, 17 Apr 2023 20:59:10 +0000
Received: by outflank-mailman (input) for mailman id 522419;
 Mon, 17 Apr 2023 20:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqe-0005M2-3p
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:16 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df69ae06-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:53:15 +0200 (CEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 z11-20020a17090abd8b00b0024721c47ceaso14041077pjr.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:15 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:14 -0700 (PDT)
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
X-Inumbo-ID: df69ae06-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764794; x=1684356794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WInZHFLF0E37CPvH/fyQuQmpONrFi7mPGahLu3Z9gNY=;
        b=Xg6P0UpaqLjmTr9GC8q8FEqPaWuvWAOVoK//8dKOM2wu82xE/PCXSYeAATRXUJ/HKh
         6EEKIr46u43LbmKVnfil2W4E6LUnTir89HhCdDllvASzF+yevHo7MjwPE9+XRv+3hhES
         OUUsnstcNrA0rLCFMYj7vWl5ZczSf3KPYpA7wTt20fxP/HKu0nYQRIzVhW6nrnGOA5jn
         ZX8zcSMK8Y+FlG/fX2gye51alnw5R0vQJIqmi3wnRTlMtqWonWHxJepWd7O0uYkErLAf
         nElaONPL6snfMupRjx7SgoPL0fo06TUuoxc3sYPVOppMWFUfAwgvDIOHO8Ugh+LFqXUj
         IYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764794; x=1684356794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WInZHFLF0E37CPvH/fyQuQmpONrFi7mPGahLu3Z9gNY=;
        b=LUFbqHmPvT8DhobpKf2HeN3cWmrz7hYpKKWsq7esnYpnbMsu7Jce4beoMbj+kfJY4s
         /6k972fpyiCW88ivcBdTnBJ8yLBIK/EJaBoDOugqzM0vH24Bq1cQLoUfR7Mycnpoi4Rj
         gX6K2lPWzLd4upUuoFM0CtKKdNQqMgc/KmRxwOV3QBcItyTpaTpAiaQioPiZTI762VQ5
         b9EppEjE1QG/+UU8eBq3h87H6lqIOt5T0+C7oInZjhqvWaPkzqd4KP2a4xjwlx76qMfO
         omzTA08WXLfGoBfzv0EvPAlWeWWL0HJURrYL4cQJHW2joaeu//A39eoB6vIXWfwQQdf7
         NCCQ==
X-Gm-Message-State: AAQBX9eY1IGmTs96kW3vUBMyQGgQfyTXkvoh66YTiaXJm26x4TBAVQYn
	lWgKkZS2I507P5f524U5Y48=
X-Google-Smtp-Source: AKy350Ym3GSROxWd30N3vnOcQ+scJJk4j2bn57g6f2y/wdjBz5ko3J6EyTomKSlBO1Xk2XiBoSAe7w==
X-Received: by 2002:a17:90a:5315:b0:23f:81c0:eadd with SMTP id x21-20020a17090a531500b0023f81c0eaddmr15717621pjh.47.1681764794292;
        Mon, 17 Apr 2023 13:53:14 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 21/33] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:36 -0700
Message-Id: <20230417205048.15870-22-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..af26f1191b43 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	ptdesc_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.39.2


