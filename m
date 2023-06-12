Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A90F72D23A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547573.855187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onU-0005Bb-P1; Mon, 12 Jun 2023 21:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547573.855187; Mon, 12 Jun 2023 21:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onT-0004xQ-Uf; Mon, 12 Jun 2023 21:09:55 +0000
Received: by outflank-mailman (input) for mailman id 547573;
 Mon, 12 Jun 2023 21:09:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8ojO-0007V0-I1
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:42 +0000
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [2607:f8b0:4864:20::1131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e38c6e56-0964-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 23:05:42 +0200 (CEST)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-56d07c7cf03so24330577b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:42 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:40 -0700 (PDT)
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
X-Inumbo-ID: e38c6e56-0964-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603941; x=1689195941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSGr1AIBRcRb+Ur7L3hOWyc2qTqn+mhf5/YLNQmZcmA=;
        b=qp0OZHJwYJBDFbnZ3ou1P2Ehue21X+g8zcdgyQxIvQy+nDe0qfAi0dHJH17SnCCz1g
         tKKUvfmw/BkCu2VWGVC9FTcKBTfgeit8iCuiiB2iFwBx6PIhFHMGEsTNb4ySvFT/d3ft
         wztSHCS6L0P5NyGlzSq35fcEZtgvv+BauybZ4ibvcrCUVHnGp/kHvLFHDT0vMZoFlpUX
         ovC+Ec8QSOvfx2fBvS9GXwZis3S10LP+c5zNsCcscOq3kZyLxngh/87tdHFT9B3GKdNj
         CWUudKrbpvmp3qcd3NPPZgIOvQGRSzySt8ja54VpNcHj9wUPZRrXlqZutJQePE3+1Opa
         Ut9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603941; x=1689195941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSGr1AIBRcRb+Ur7L3hOWyc2qTqn+mhf5/YLNQmZcmA=;
        b=lRA6B698ukF0zb2OzoFqBHSQygQhViglRM/20vUyKNudaq3V1RTVqE+IJbgdJ6xY2p
         MRw5SeaXwkm4sOP9tZE58OUZf81w6W+aCSqx12HKCnh4iQLrfmzgE7arrRtOyOr0UUOt
         /2eJ8l78KWcGxA92x9prE0ixb/UXJs1FgYYuRCnS/8FB/C5yC1DBUehPdKBDqSvkXvlK
         VhWkvhYxdmBK+jt90VD7HUrz+ym/zlEoiumGDWTloQIxGfDtfbpcGsGOUYR7odOTm1V2
         GNSonc+ltiuxskvLvzBRkncVwPYaS7YmG4H0h+hOPbE4MI+U4T78n+HWO9YShOLnKWog
         eOGA==
X-Gm-Message-State: AC+VfDy92jbjbFBO2j/Ht/XE2UPywmeVyXPbetYqPv+lYD9F766sP6hz
	v20y2lnpjx00y7modlocIyo=
X-Google-Smtp-Source: ACHHUZ6f4dQwcKAKk/nBaLFqSfud3ZdJTCw6E1GbyeLYv9ZLF94Eu4p9/l66ZpbQ0joORm5hDbfhlQ==
X-Received: by 2002:a81:9e53:0:b0:565:a081:a925 with SMTP id n19-20020a819e53000000b00565a081a925mr2763652ywj.29.1686603940939;
        Mon, 12 Jun 2023 14:05:40 -0700 (PDT)
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
	Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH v4 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:16 -0700
Message-Id: <20230612210423.18611-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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


