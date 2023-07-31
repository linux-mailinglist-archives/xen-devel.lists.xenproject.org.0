Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F5E769EBC
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:07:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573303.897934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWMr-0000nF-6k; Mon, 31 Jul 2023 17:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573303.897934; Mon, 31 Jul 2023 17:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWMr-0000lF-2l; Mon, 31 Jul 2023 17:07:37 +0000
Received: by outflank-mailman (input) for mailman id 573303;
 Mon, 31 Jul 2023 17:07:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJu-0000C0-IS
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:04:34 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 521f84c3-2fc4-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 19:04:34 +0200 (CEST)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a426e70575so2742921b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:04:34 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:04:32 -0700 (PDT)
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
X-Inumbo-ID: 521f84c3-2fc4-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823073; x=1691427873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=J5UHMtA0qoYiWw4Ld5R0BKI4Tc5AGDSmTkXJ2I6fYmBwlIVDq2NZ9TijiKx7n7oR9S
         O2+0XndgcZyKpOow8lUaucDbgGPax/K8O+lCXFcyUW1OtbVxoGLUMUxT+xXe1Nbotguq
         wXQV4F4SfOD9dJwiO/iz9SNiN+CqscWBWqXkI0FM0EZ9ZzfP3bhZCq1/PYVKZkiSL88/
         WlbyA+YZDFKl4pgL1EI3/3iabhB8k7YUgWRxCXqfKPLtTRNQuaY8gnPQjbT+Yt9xzJqB
         tpRwv/UorbhC7cKUIm0hPbznR4XxDKlGiKxb+h0cWPY+2avNMZiADFAVxe8ptEu65tNh
         rVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823073; x=1691427873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=Nb/0EJOz91t4Vvvx6fbt2mrSmjw5kQsjPy4/xWSL7ywxfCpH4hVXhxOOdK/7LvPLy0
         bHW6hZpBDbGHq+jKyL02coH64Lghx2RWDPGU5vfPExo3VwoSFtQal4/nWtsgZHWZY665
         FYpKG4/fOUVMtulDoSuKEe4QMC5I1/850XlC3R0qGTuRG10/myQUpyd6wvmYF+gk/kob
         WBCiccYbpXa8Hom5R2gx1Mze0tym5OEQzCVRgtf3yM5Gwahx35kZmAcLfGeGlhbKz9X/
         iG1VS6YhDf9On0wz9oR2a6oLP79vT9k50Qry5HOnps3ssw5LdcF32jDQ85nL3IKGXR9b
         kG8g==
X-Gm-Message-State: ABy/qLbPhkw9y7dPtdUDVKOWjRO+ZPjqu4/00AFlLe7Glqcyzs6FRFIm
	tlswh456SS8Sxuh/qt58TLA=
X-Google-Smtp-Source: APBJJlFtSPsXmTmbaE2JVTTuMieuMfoOw8pkpK4ugTgdmGfxbA+pL1HJ6fgn2J808MNJLpsNTjXtIQ==
X-Received: by 2002:a05:6808:655:b0:396:4bbc:9a36 with SMTP id z21-20020a056808065500b003964bbc9a36mr8685999oih.19.1690823072749;
        Mon, 31 Jul 2023 10:04:32 -0700 (PDT)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 27/31] sh: Convert pte_free_tlb() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:28 -0700
Message-Id: <20230731170332.69404-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sh/include/asm/pgalloc.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index a9e98233c4d4..5d8577ab1591 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_SH_PGALLOC_H
 #define __ASM_SH_PGALLOC_H
 
+#include <linux/mm.h>
 #include <asm/page.h>
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
@@ -31,10 +32,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
-#define __pte_free_tlb(tlb,pte,addr)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
-- 
2.40.1


