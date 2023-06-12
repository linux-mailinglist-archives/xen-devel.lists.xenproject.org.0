Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9B472D236
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547546.855131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onH-0001yz-D9; Mon, 12 Jun 2023 21:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547546.855131; Mon, 12 Jun 2023 21:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onG-0001bC-Di; Mon, 12 Jun 2023 21:09:42 +0000
Received: by outflank-mailman (input) for mailman id 547546;
 Mon, 12 Jun 2023 21:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8ojc-0007zJ-Hi
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:56 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaf70e05-0964-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 23:05:55 +0200 (CEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-19674cab442so3249654fac.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:54 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:53 -0700 (PDT)
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
X-Inumbo-ID: eaf70e05-0964-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603953; x=1689195953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ/uV998f7GBK3U8fEwXlOSI96PW+5wzkUNMHiphdSU=;
        b=Tn4mHghr2z50QboRcFFwBXnQDC7dmOVTmd7q6odwa9ofCDQNfilhaBNviFDHX8SrYA
         fagx19tWV5xnG2unDu30AzBD8hFIWArocnuzCUa1K7AMS5VYUgKKhDVTLptGD0WPUw8/
         ZX9JliY6gx8+hXM3OztwRe71m1A+kx2eLC7qxtJVOpdoP5HVloTMtr0/abQT4yyYQOzs
         IVhZgoGgAdf28rfS5OorktySibfeqB5FLW0b+HoIsUsy+Q3Hv3TNg2zjbv2EGrbvSAhn
         +UJqDlCblQUHBUCUqLriRDZ3qurN8WXPOHGnwhy4vkGIt3E2YX1KhqR56pPwBtbb673W
         dPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603953; x=1689195953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ/uV998f7GBK3U8fEwXlOSI96PW+5wzkUNMHiphdSU=;
        b=LpyAc9Gzfg9dST032hHW8h+NqweCesYnIffv3CEMlGHYrqGXLnKFV9370BzqkxEnpw
         cMiAmV0WeBk5byTpA2cX9AUAYh4RhpPboIdimPUn8A2rImABgN0sVpcPQwIA/vVD/0Qk
         t+XNJqytzI2zkjrpIMFkFmHUd+S8GEDbAwBR9tItGu2EW9UgQ/lAJMgcuPCHD0d3O6vH
         T3LdzhAC+ySjhYW+4Edg+0Ucp37D9nSGLHXAYseoUg0eQiKizzXdugFPXo09t38iYPDB
         yG7nVLDcNbyI6bFAyrC22Ew8oMg1QSMp3vJvjr0GjxE9aWcqIR3ko18HcOvyUoEfakMW
         W3VQ==
X-Gm-Message-State: AC+VfDw/dfLULt/rmwmXriQPNOACX/xLzEYPmpD7nhlRQ5s4eIHemjdK
	kXpqtXjw5iIzq/9vcSW5sM0=
X-Google-Smtp-Source: ACHHUZ4ThTH5LM1afe2PTTFtQ0ZfGkzFFO1FbLLwGaoZUh9UZKP9YYPXqsENj3drsF2z7+M8WUTgQg==
X-Received: by 2002:a05:6870:2207:b0:19f:5701:8c47 with SMTP id i7-20020a056870220700b0019f57018c47mr6429537oaf.9.1686603953383;
        Mon, 12 Jun 2023 14:05:53 -0700 (PDT)
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
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v4 33/34] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:22 -0700
Message-Id: <20230612210423.18611-34-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..de5e31c64793 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,19 +25,19 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb,pte, address)		\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb),(pte));			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #ifdef CONFIG_3_LEVEL_PGTABLES
 
-#define __pmd_free_tlb(tlb, pmd, address)		\
-do {							\
-	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
-	tlb_remove_page((tlb),virt_to_page(pmd));	\
-} while (0)						\
+#define __pmd_free_tlb(tlb, pmd, address)			\
+do {								\
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.40.1


