Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FAF73AA17
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 22:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553998.864973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCROo-00076n-E1; Thu, 22 Jun 2023 20:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553998.864973; Thu, 22 Jun 2023 20:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCROo-00074k-9o; Thu, 22 Jun 2023 20:59:26 +0000
Received: by outflank-mailman (input) for mailman id 553998;
 Thu, 22 Jun 2023 20:59:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTT3=CK=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qCROH-0006Mq-PM
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:58:53 +0000
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [2607:f8b0:4864:20::b2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9817099f-113f-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 22:58:53 +0200 (CEST)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-be49e41a3d6so5949272276.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 13:58:53 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
 by smtp.googlemail.com with ESMTPSA id
 d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:58:51 -0700 (PDT)
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
X-Inumbo-ID: 9817099f-113f-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467532; x=1690059532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=iN2FzqOQCGlMw61BHmPlvHKCi1d4I+83kYFUJ+05be01GNIJnqIJIlehoUIlvwUaVM
         d/OWGkj4lxemSlNpzjA9vagyXYnKzygaSW8qGOFAS4kKsFBEkls14ZpomWkO/T200zVH
         qlBgWwV7Su2BIgoVpSS5ByD582z4lmvR8XQqnfXM/x/kcWnUDA1l8EH7UvhzGe/a36fq
         qzeiYGkPPC0vXVHADUCnvEqnbyiXBVZ5TrMcTAX4hM8+UdpZhrwM5A+KI61Sp+b5buW5
         P1n/PN9/guunik8p7869oduuP/QEBbbnDZw3HC5F5neXLeBMAmnYdB3CF11sup6NCeqV
         0mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467532; x=1690059532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=VMxdwxmQjQ1vkxopEYNL61fs6tfGkODu/z8AoICIGyIQyXS7nycfDZMBYM+ui76M14
         Dv9Aw8I2BDPdwYLnMsdJneLudw6FjsxodMzUby7+sAbtIYtvvMdWz1ZuheGLpETsQfnE
         y1+lkwuHR+y7LwO6DxYT8ulucflquTJyaScIVih8zKLjdv2hJ6vRDDYOAMSyoOKCpgSx
         7OnGHFWUPhU8gaIyuyp3FBcDXlib4ToWB9Efj1A3SI/8nMvJmGRyC5/WmtNj6GMSceOh
         vDHlNjICdq17azZaDCvF7PD77oLVwimh9uV9fOUxGRKo8Q7hqpvRTE5VxRGyIqGr8qNh
         sPwg==
X-Gm-Message-State: AC+VfDxMkVHy/xG7N9FyvVwgQA9EdX2Aztep75rQQkTHNFk0tHyJ2IA0
	ymAihiaFEYfu4JBPYGLvVJc=
X-Google-Smtp-Source: ACHHUZ4L0O/ZcQJNV1a5FO9DGWMsGkRAWmV2oZ5bMU1z3VMLdsFOJ9p+X6w0stYIYuPTzeAJzZnheQ==
X-Received: by 2002:a05:6902:1cf:b0:bff:78f9:ffcd with SMTP id u15-20020a05690201cf00b00bff78f9ffcdmr4883793ybh.38.1687467532210;
        Thu, 22 Jun 2023 13:58:52 -0700 (PDT)
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
Subject: [PATCH v5 27/33] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:39 -0700
Message-Id: <20230622205745.79707-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
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


