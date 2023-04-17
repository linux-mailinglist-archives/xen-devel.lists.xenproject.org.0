Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D9D6E52EF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:54:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522355.811740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrR-0002Ys-3j; Mon, 17 Apr 2023 20:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522355.811740; Mon, 17 Apr 2023 20:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrP-0001yh-GJ; Mon, 17 Apr 2023 20:54:03 +0000
Received: by outflank-mailman (input) for mailman id 522355;
 Mon, 17 Apr 2023 20:53:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqm-0005NG-Hz
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:24 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3bf2385-dd61-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 22:53:23 +0200 (CEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 h24-20020a17090a9c1800b002404be7920aso27918675pjp.5
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:22 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:21 -0700 (PDT)
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
X-Inumbo-ID: e3bf2385-dd61-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764801; x=1684356801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tniPUuVL526Jec1TVIaHRLAUx7OruO8jRIKlA5wqt8Q=;
        b=p/jfRaNPQGaoJd3ujqaeLDuUP7t0WkHa2oZwiGdpehhESyVFAOdOmg0fusWkZ2XuJJ
         Yw6K8nYA6/5N6tLufuYh20gi7M7wxwYV1IodMymMAu3e2vjlzp/s4l9Vf7kZibjxovMR
         cghNEQkYGyGSVWGuIAzI28gyVhrT8GgnWs6YLc4dnuPB71AZU/a5qfpWgaMEJ0Qfl1S+
         OG2NEJp7fE32TkPWsKahDfFv2MiE7qQWnDtWKvNsVMNbEDAHg0y2Zsbd1R1MkIpv2dly
         3HDaLyPuLXfOS4PxJXenmM3XNPnXJ5LYctnHIHC9Ub4peO/zkx0GIKpeh+s1nuyRNP2C
         xoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764801; x=1684356801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tniPUuVL526Jec1TVIaHRLAUx7OruO8jRIKlA5wqt8Q=;
        b=Yy/m++MqbpsiOa7MgHWT05ETqQOV8w8yPsA/0M+encr7Wf7gWIaieehJKviJOW30Vd
         MV2rOOG9xlp4fEfgqCk9CdCHkrgiPLjTfxQ4v0u6D1qKICsIcQijw6W8bwnYQILEk+Fe
         ZgUIdYZ/seFNWG75ygdm2ZtbszZ0vOY51UrDHhjaCSor9Ylp2jX5n2ze2XGINdm7ixqN
         a1Z85FgQW7Tio3KcWm1PeOyXvaoXQg5YOJgpXO4jJ9AQFvb5NdAUQII1iNM5Zmgpvr2z
         wQaWOGYAvlaby41D892rSDq2gEk40lPkUe1JvOGu0A4QuF9sms3FJUge/fXuCawH3zAN
         Xl1A==
X-Gm-Message-State: AAQBX9ckvlENhEBprMCXatJwcUUG2QOwtAVzxeFhTN6ua5qAkwbr5ZzL
	Y4Dn0EmZLJnV6/WvPN0W7dA=
X-Google-Smtp-Source: AKy350YG/84D/pba4O2jep64IWrC+mjA+ueyHqImP8NgwjI0qVBUMRNq8Z2uYJzIP+ywt0PW/sWA2w==
X-Received: by 2002:a17:90a:8048:b0:247:78c0:125e with SMTP id e8-20020a17090a804800b0024778c0125emr8083390pjw.15.1681764801496;
        Mon, 17 Apr 2023 13:53:21 -0700 (PDT)
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
Subject: [PATCH 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:41 -0700
Message-Id: <20230417205048.15870-27-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/nios2/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index ecd1657bb2ce..ed868f4c0ca9 100644
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
+		ptdesc_pte_dtor(page_ptdesc(pte));			\
+		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 	} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
-- 
2.39.2


