Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDD56E5372
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522402.811796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwD-0000Ka-Fz; Mon, 17 Apr 2023 20:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522402.811796; Mon, 17 Apr 2023 20:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwD-0000Da-1G; Mon, 17 Apr 2023 20:59:01 +0000
Received: by outflank-mailman (input) for mailman id 522402;
 Mon, 17 Apr 2023 20:58:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqm-0005M2-OE
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:24 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4875a46-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:53:24 +0200 (CEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso256114pjc.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:24 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:22 -0700 (PDT)
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
X-Inumbo-ID: e4875a46-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764803; x=1684356803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2PCFvKq9JWcIC4Exd9oDYO0v0PQOHyXRap+yEgbOb4=;
        b=Sg9gXChNrNLShRRgfwOKl/OTTCvmKSrllpuIiui1MavGQQvyi4/hV9+QaVJ3t9hABY
         7LNyY9zC8MZPe/8uyGF6BwZFFCebqKsRkCF7WD2/MczVElNAeTdXAZoU8m9zjTh6P7Zy
         0Ui6eydpR2I1tZyrhRUO19d2JsU/fHL/oyFe81PNxO86Jxw/ya4bgHlBy023YgAYk0Ea
         ro6AAOx594UY8fA/m7D7bEpjpZMo/caINuRe5NJsUpyuSeut+/oOBeuT5hXbXmkAYI67
         Pav/++zqcV0Pbp5FUcdmVoTNUO7tgK9EwNCc3eK51W0dnm+P+Og2+jgMY/+82hRUmWz8
         imHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764803; x=1684356803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2PCFvKq9JWcIC4Exd9oDYO0v0PQOHyXRap+yEgbOb4=;
        b=OQt8SMvintAfiCdJYwSCvZYc7J/Ev0H/3vmQYqW+BehYmsAcbcSCx7Pa2DvVHXYXpE
         nelAoJ4RsxE1nMyhvlMOrrDemBHgz+DwM4o2eZiDv2DNsjcmVqeOzZNxflhj2677+re5
         ldmq54h2JKxyf4OGOR6yarzcMZtj43Y2rOPfsmoE8dyqUHTlHZECYODx759gTOj7+Gue
         5ybw9o4uY2jU4t9vvLXfV9sqxvxb2MKohkB3FK/BnWC56nEtsJkwt196d8ybpTqDJP20
         Wrfp5gHU2yO98Tgl5lP48q3XtUG1wNLesPc2xOlG1PdgtlM9BCncnYReAedksJ2oZz/4
         fGUg==
X-Gm-Message-State: AAQBX9eVKbKt7TQZ6IvdhhQpo7Zfo24udMZWmegWuwQsKUepvfM/lDha
	nKKcDbec9Dq3h4UNysPHIdM=
X-Google-Smtp-Source: AKy350ZH2s2lfJdxSYj+T2S9Ef0UoYzkgLYY3eeGq1S7Q2hAbd0lFGX52BFTYQkOd2khPVGSck6LXA==
X-Received: by 2002:a17:90a:e28f:b0:247:4200:7432 with SMTP id d15-20020a17090ae28f00b0024742007432mr11696070pjz.40.1681764802858;
        Mon, 17 Apr 2023 13:53:22 -0700 (PDT)
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
Subject: [PATCH 27/33] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:42 -0700
Message-Id: <20230417205048.15870-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/openrisc/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index b7b2b8d16fad..14e641686281 100644
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
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.39.2


