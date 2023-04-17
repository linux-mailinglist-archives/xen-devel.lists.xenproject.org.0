Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFD16E5376
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522413.811849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwK-000243-Jc; Mon, 17 Apr 2023 20:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522413.811849; Mon, 17 Apr 2023 20:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwK-00020l-4J; Mon, 17 Apr 2023 20:59:08 +0000
Received: by outflank-mailman (input) for mailman id 522413;
 Mon, 17 Apr 2023 20:59:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqf-0005M2-45
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:17 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0599bb9-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:53:16 +0200 (CEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 z11-20020a17090abd8b00b0024721c47ceaso14041257pjr.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:16 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:15 -0700 (PDT)
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
X-Inumbo-ID: e0599bb9-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764796; x=1684356796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=;
        b=DU+PC+Lb75+sxyzE8TFBhUq23MhtXNiuA1nw0c/GhsuV5IK3M7l/Hh4azDLq1DRa+j
         fu7HXiEzvV3T+N5Mt1is7DhkrUBl4PJsqFnRPYaX3oFVj8P6Qlk5ZLs6mljyu96mU+sv
         zpquQbUhbrKn4GUU7udC1O03s9ThOPwnMOZQlJkJdwRy8ikjPxI0naLAwtnZbb4WzEoy
         3BNpuQVnvIHEKJKSenAtt9bKOamb6q7fxWlfz+PtLFjOTztncr7nNFnGXeF7WX7UQ2CN
         r/J7luQKDmaqSpU1aG4/YKRgzEf0E8SysEU40ARw1q6PEFiJTtJVgg7dYOEMGKOTGrN2
         xyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764796; x=1684356796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=;
        b=DRWHoCAWuATZ/OU6t6+Hs81ZWw0UC/AuODIxF7BZESaiaGkPLJwZeojQhwYoAjK6oa
         QXz3LKah4Ck1+5kvcC1savi+d7JlBcsYtnuuiMbnKaY56kJSIi0r/Fmu68XqUyhRD1XH
         Izqur0vh4xoUsJFQwNIu5p+8U8kEbL8fdrCCnwqVPrGrIYDo986vN5c1uZNqgHid+TtX
         AtVS4zbhp9uIh0tdEIwtv8t3+LWkHU/apKR2ZBqkf1cFq2D5ZGWMBfgEy72vP8NQpwi3
         LRPJK0ddjj9L0l3H8FbMLgrkn/HOvwZ2fKGrC4tXN3CUo//0o0Mh6hRYDGA/5LSLVUQd
         qvvQ==
X-Gm-Message-State: AAQBX9cLCQh3QHCUxSPrIOIG4Ax7V0GS+pML8V98rrNhc1G7TiCtXKYT
	OhJqok3i4rl2Jnj4AaFXHBg=
X-Google-Smtp-Source: AKy350ZcoHXe5N321oYs87Q7Ayd5DnxwU4W2BhAi27QaGMsyV7i9NrgOQAsujiVTD54cy1B75qhHjg==
X-Received: by 2002:a17:90b:3b8c:b0:23f:9d83:ad76 with SMTP id pc12-20020a17090b3b8c00b0023f9d83ad76mr12727299pjb.23.1681764795745;
        Mon, 17 Apr 2023 13:53:15 -0700 (PDT)
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
Subject: [PATCH 22/33] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:37 -0700
Message-Id: <20230417205048.15870-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/hexagon/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index f0c47e6a7427..0f8432430e68 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -87,10 +87,10 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 		max_kernel_seg = pmdindex;
 }
 
-#define __pte_free_tlb(tlb, pte, addr)		\
-do {						\
-	pgtable_pte_page_dtor((pte));		\
-	tlb_remove_page((tlb), (pte));		\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	ptdesc_pte_dtor((page_ptdesc(pte)));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.39.2


