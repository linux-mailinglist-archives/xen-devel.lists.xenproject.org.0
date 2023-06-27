Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CC473F223
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555743.867841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEt-0005ba-B1; Tue, 27 Jun 2023 03:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555743.867841; Tue, 27 Jun 2023 03:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEs-0005Hg-Tp; Tue, 27 Jun 2023 03:19:34 +0000
Received: by outflank-mailman (input) for mailman id 555743;
 Tue, 27 Jun 2023 03:19:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzBc-0003uL-1a
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:16:12 +0000
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [2607:f8b0:4864:20::1135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6612b94-1498-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 05:16:10 +0200 (CEST)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5701eaf0d04so39993357b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:16:10 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:16:08 -0700 (PDT)
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
X-Inumbo-ID: f6612b94-1498-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835769; x=1690427769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=eyYuDUlXPMdgLVymoCPm6l0B5AkMkP0MJVgww2Dc7/3sqQmnGU1ku6H9CU98Kx8HDx
         01E8lwPN+qvwNuBvO2TKM7cIgKQ3CJY1x5BttlhhMCAu/eXz9REbxcYgAP/6CQkWy6Cf
         lQ90mc5ZocMFbyDKOmgQ6JtaRafPtmT5vpmCcu1CHVchruI6mMlKmB0nAjhundO2FScF
         dwi9LCyq+7qGXz1usN+jVcsXjJuTQQ04p4sKanEFFQJoYolDJUzZRawaXCZwSYL33znl
         4r4UGf7Bdp39+qapNSstfbw+OcAirA3yy9mzGZ+ruj3Aqj6H943hd4iO/NnOtCq31XtZ
         136A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835769; x=1690427769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=ZuqM4JJOqjQ1K40XPVYQtXb3N3J7KyccxWheoN6swfUeEKx1x/G3RHdUmSz2U0mAsV
         Vc7cRRqVD4rr4VzdgcY9s+Hh3TREGwWJjHIy/4JRJEpk6++45HhNVLxkbW93Q4giBbdN
         7p4iSNUQSPMTk66xt3KX9fx1/nRme7SvJrrgxeV/PZxz0ac0emnRyoLUoE60DvaIfCIW
         /EeFFPKI5cgv8mbuSDEECJ/h/IqU3BOJmlalovX0Pz2edg9msa9YHShoZRhLVwdv3aJ3
         q1fv5Pf576RZQpoRSZHK0IMHww4hpwD/DXwW+YAgJVl8wVUlZvAW228Q6br4Y3Zx2K9x
         zhcA==
X-Gm-Message-State: AC+VfDziQw5C9SMSILJca2kFZDSdWuCKW0OEFPbF/au0b8Qi1Q1DfojG
	DpsfOJ4+3iLmtTWJEWXlpzc=
X-Google-Smtp-Source: ACHHUZ5BRaD177tE1K+/zidTaxecch2WxFQR5MI/tG/yJGMKk055pAnLHtqYXsbXJZWlLLkzghbGoA==
X-Received: by 2002:a81:8684:0:b0:576:e4b6:9272 with SMTP id w126-20020a818684000000b00576e4b69272mr1982237ywf.30.1687835769172;
        Mon, 26 Jun 2023 20:16:09 -0700 (PDT)
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
Subject: [PATCH v6 29/33] sh: Convert pte_free_tlb() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:27 -0700
Message-Id: <20230627031431.29653-30-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
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


