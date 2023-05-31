Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D29718D4B
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542046.845517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVg-0006JO-Gw; Wed, 31 May 2023 21:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542046.845517; Wed, 31 May 2023 21:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVg-0006Bd-7H; Wed, 31 May 2023 21:37:36 +0000
Received: by outflank-mailman (input) for mailman id 542046;
 Wed, 31 May 2023 21:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQQ-0006zB-L6
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:32:10 +0000
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [2607:f8b0:4864:20::112d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98ff2382-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:32:09 +0200 (CEST)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-565ba53f434so709207b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:32:09 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:32:08 -0700 (PDT)
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
X-Inumbo-ID: 98ff2382-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568729; x=1688160729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viYddHqy4Zdgp0J9O3iaWpIktRFOpc+3TNsEHN2SX9A=;
        b=hVqCB7aFrL5Nthi8pAlbjPvcInjFZt1qHkddABmx8gtVThNjktDfpfcNDFDlw5CG2+
         3xRmURAs/k2Nz9kNjLGLhiem3PMoX9/E6HDghH1XQlgENBdym8j3RSqFBZDSSy/b34yh
         AE2QmRwS6oPUlHWjPpeT/6u7AJu6WV2M048WkEp+vu4WP+h6zxRkbzSalddZaQ9VOuvn
         LGPsCzdTJ+5x5K0wsh8kq5o2Vj7pKu44k/mXiACQfaNUMTBzpYonaoHUeQuALtzvZCNz
         9M8tSd6AM43Q88HJNwRerrYrxc+HBnHCgqChwQ1i4KI3ds/XwizMZlg5u8MI061tV0gV
         yEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568729; x=1688160729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viYddHqy4Zdgp0J9O3iaWpIktRFOpc+3TNsEHN2SX9A=;
        b=lvsCKOhxudiyLMG8ZFYopz6IoqdeddTGhhcJDITvrgl2Q+eisv/zt1AM8Lt/LD347k
         ZpRvn4HkaMic9qnZAcraz2R3l987W8GvhsPI4cux/KZluwSv5JmovDf4KFYzmRafKl+B
         WUqT/EAbaLVyV1Errz8sDQQjPyU/qsDmm4lsG1OU+x79poD0pJwu+LRc5CNsKlUkXhtK
         vdoVjthDZvt58heYWOx/7tpNYXqbN4GB3bztYp4ownvvge8LhM8ZmKzjvCrVNbFARmPW
         YrUNnKrXLWoCKeToULj5oHRFWNvaf1RPhy1xgsEMiek5T7p/78IR2emR3v+A+kWPKvkK
         5XtQ==
X-Gm-Message-State: AC+VfDxxleNsOJeqqpyK3kqBftOFSCOdLyinAErm0JfyYWCkQu0X4O5F
	x9U6Yp+Xn7oxbAEYvyWhul0=
X-Google-Smtp-Source: ACHHUZ7dIRO2Itz1UIyUgFPRBSeGYhHu2aqfX+t+ZClzgP9Es2W2C4cR0F0LltUImCNhGQXKVAT26w==
X-Received: by 2002:a81:48ce:0:b0:565:62eb:db6 with SMTP id v197-20020a8148ce000000b0056562eb0db6mr28101ywa.42.1685568728711;
        Wed, 31 May 2023 14:32:08 -0700 (PDT)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:28 -0700
Message-Id: <20230531213032.25338-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
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


