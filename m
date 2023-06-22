Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D26873AA1B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 22:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554002.864991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCROp-0007Qf-L5; Thu, 22 Jun 2023 20:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554002.864991; Thu, 22 Jun 2023 20:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCROp-0007Js-DX; Thu, 22 Jun 2023 20:59:27 +0000
Received: by outflank-mailman (input) for mailman id 554002;
 Thu, 22 Jun 2023 20:59:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTT3=CK=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qCROG-0006Mr-F1
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:58:52 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9665cc9f-113f-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 22:58:50 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7624e8ceef7so636887685a.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 13:58:50 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
 by smtp.googlemail.com with ESMTPSA id
 d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:58:49 -0700 (PDT)
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
X-Inumbo-ID: 9665cc9f-113f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467530; x=1690059530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSsj72OOim1moFehILf4IJ+e4eXIj/xtfG6kDsakLCY=;
        b=F65orfGp6lPWpCrD9sAMHQjbb/7dPkBeEZwnbqaqoaG+jHKHFKOpyv5U+mRswUePBl
         O+w6mgJQE0929R7HfQnempO9NwPEm6qT8tc34OERTuMiOZXiohUbt3LRN+VbVJEKUKkc
         tcmSj8t+FV4PGg1S/0RDnwUBY8C4sUVvlY/c/d4jqvMe/jl29yqPCuiM1limtTye3/Mt
         Xl+0XJrX90O7Fe0pzMoOa3o991eJyDuyXmsTPhqv2ERTFkUraPYZpwk4UgntXrYBzy7x
         tG0gCzAga9PV8hPLOnhqVRtX7sCVqxvHBH7A5BvtHK+faRxZPp8TVFIuHWDaefij0y+Q
         y3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467530; x=1690059530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSsj72OOim1moFehILf4IJ+e4eXIj/xtfG6kDsakLCY=;
        b=d4PHwjP+64hsjnjyqqHn7/l6jr0gfsxIB73eVJ8tUwIwuBHfO2+eRgcI7JHh/4obXa
         5sCCPWjhP8CLYyxErEdingp/v/VvE1u1kNLO/9jI8iZCf7brdBREy0jMP0oVP6qYIEJH
         gEVvNWRnuxl5FEMu4MiEzfvZrup/t0jQlzCIKH8QPj3N5UxpPwgR+ea+VUsCAZVo8qvL
         avnGKkFa3DZeHXhccCG7te0Sz5+SgcD8US816Gt0pqWuV2RLQClmt5gxxI9hR1cME9WF
         CcM1aA0RkaMPy5hwwyC7yj/jn1YdeobuhGA+04Ye5jXKtvPCjNnyOZJPfpkkEx7N4E35
         7h7w==
X-Gm-Message-State: AC+VfDyj6+LiHcexeuNZIxOsuJQhsID9sg2mv/olj/mSLRkgcOuB6yyh
	tuwm0mhH0/Z073g2nEvGP3E=
X-Google-Smtp-Source: ACHHUZ7lI8iuHKQsEsdck4SAEFHmt9QQs6haysqfy7wOJRfjq9Goxv7w27b3gm3WMVCksX2Z3AB04Q==
X-Received: by 2002:a05:620a:84c:b0:762:883a:f5a6 with SMTP id u12-20020a05620a084c00b00762883af5a6mr11201137qku.41.1687467529856;
        Thu, 22 Jun 2023 13:58:49 -0700 (PDT)
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
	Dinh Nguyen <dinguyen@kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:38 -0700
Message-Id: <20230622205745.79707-27-vishal.moola@gmail.com>
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


