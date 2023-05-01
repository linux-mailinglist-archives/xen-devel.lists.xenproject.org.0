Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8536F3847
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528151.821042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMt-0001qD-AR; Mon, 01 May 2023 19:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528151.821042; Mon, 01 May 2023 19:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMt-0001o9-2m; Mon, 01 May 2023 19:39:27 +0000
Received: by outflank-mailman (input) for mailman id 528151;
 Mon, 01 May 2023 19:39:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZD1-0006FS-LH
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:29:15 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74c83574-e856-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:29:14 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1aaf91ae451so11836335ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:29:14 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:29:13 -0700 (PDT)
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
X-Inumbo-ID: 74c83574-e856-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969354; x=1685561354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tniPUuVL526Jec1TVIaHRLAUx7OruO8jRIKlA5wqt8Q=;
        b=sCYdFD4O8Had2jReQPDULWIb6jXMWTBVOP1xIsSQDJFrjK4Unzq4xPir2vv9xD60ba
         KhnmERHxh4wjne9PTfzHFe7mUKtGQVGSRxsSTI7oGHQc7fKexIRwy4BhAuhQWGLGw+L4
         jhaBOvefDEjvTltxe1zcg9AOJCenWnwtbQvW8h9UKrmrEmLrYzROLydP0XMIyNyplCDF
         ksvZ9Q2L1rfMSznCSwk+WHikKvzxa7zVAjndA+MUieyvTGKh0Hnkx2VWar6ZLI/SEpj3
         zJ2Emm1btVtqn0B7TpGayRWt9h4mLeUHtWruxn5Hxr1lyas/Ibpq/YOzX0vO1bUnoNNT
         ju/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969354; x=1685561354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tniPUuVL526Jec1TVIaHRLAUx7OruO8jRIKlA5wqt8Q=;
        b=YfoqjohuJkwH/jk3dm0c34FzWmudsx602spF/NN/rcr7AS/1vkCitNDdxcpxwGOmJj
         OT9GG5Iip9tk3YfYP2XomWqI//HJTm7LcAxzJcSIOQXEs2h5dXWxh99xSbOr+RFxDmcQ
         6z7EfHpIHbggm2Gcjzpd7LkOWI405GS+1zQ4LdhCV6oRA5fDMczWagnMJQhJRJqT6NlY
         kK47FPt2ayFfQegSXhIr6wU5gNrNIvGtH4uuquQQi4Y/JsV6I5xtKdgbhUZcueXWQ2an
         ygFXii0G3F1QceYVqF5mp+Y/z5TBaA1KTxeGj7SuvfD/eZCv+80BY0YIVHv6pR4Dnu6I
         E4gA==
X-Gm-Message-State: AC+VfDxeLjT15jXz6A42hvx2aLIXyJwcfSG51uPXdCOyug76Tcs7EFh5
	90sMuSqwJGBZt+jf9k/xCbQ=
X-Google-Smtp-Source: ACHHUZ6fkDxKllaaORZgzXEjR5COvh0uqYIPMfHZHm801Tjdn3OT0QOppKb8hXtDeBwjumbd6cc2Pw==
X-Received: by 2002:a17:902:c411:b0:19c:d309:4612 with SMTP id k17-20020a170902c41100b0019cd3094612mr20785827plk.6.1682969353666;
        Mon, 01 May 2023 12:29:13 -0700 (PDT)
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
Subject: [PATCH v2 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  1 May 2023 12:28:22 -0700
Message-Id: <20230501192829.17086-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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


