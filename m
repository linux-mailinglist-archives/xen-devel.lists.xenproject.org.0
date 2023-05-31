Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9693A718D4E
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542048.845527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVh-0006Yk-82; Wed, 31 May 2023 21:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542048.845527; Wed, 31 May 2023 21:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVg-0006P9-Vk; Wed, 31 May 2023 21:37:36 +0000
Received: by outflank-mailman (input) for mailman id 542048;
 Wed, 31 May 2023 21:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQW-0006zB-Hl
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:32:16 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c7e113a-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:32:15 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-561c1436c75so810627b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:32:15 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:32:14 -0700 (PDT)
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
X-Inumbo-ID: 9c7e113a-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568734; x=1688160734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ/uV998f7GBK3U8fEwXlOSI96PW+5wzkUNMHiphdSU=;
        b=Gco7uaZ8T0f7tmyth6uZeLtIanv6GpulpDiuQwIsnzqnPkjzJkIu0h1PZGQ4iQfI5A
         Wsvmi3eI4+D34lVcMDUsWRCETH5qcZJ6o4mHbMVq/3LTC/HNm7eQ6q2KfFVCA86f3d3I
         LxBFjI2qJ2MPH41lEvrCJnwlKDxe1mBh52b4jr4phbiXUV/rBKhdQfCzS+0QvKIx+CwJ
         I9nD3g0MgWbwsz1cldEhhb6oFNl81Iu/IWeIlG3kHhqR9NOaQpioUXIEm19YojgZVH7b
         YKNDEnmfXzRXtSrjS8AB8ePFyFPpDGIfkcu+Z1fbAVxcvdW9nHAWNVZ44Hj2Se7PAnUx
         U49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568734; x=1688160734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ/uV998f7GBK3U8fEwXlOSI96PW+5wzkUNMHiphdSU=;
        b=HueF+KiXFhMxRS5gTYVvNzu9LlxgYXw7Roe1g/0xYmKJM6kDA6CqBmma8MG2c4/h0k
         HzQDE5KMsooVhzHZsaxOIJa/gk3/fLu/uGZs7mhRAZ/SPxM0yQC2dVJtioED91zgkYup
         qCgkBN/4ePh8I2PDT2zy5QoKGleD9syPbWSoKcOnfr1rko3nOrKFD+o+W0j6WTSu53wH
         AuTdocJ07Ku3Y1bSHISsffQWDeiy3WUVGwLfXuUhRs3GajA7/p7Hz/WCaqXyfWcfeJX1
         Tx8XaCstRrJbVsDmHnPcda4anVna6/MXBgdcR2w10ATQzxAe1noLRDiCK5IM97vxWPR9
         qM5w==
X-Gm-Message-State: AC+VfDxvFaigeimJFc3URKhX4wwNBELZ0FjOdVYkdwiJpMKq9rEOqJxy
	ciLzK5Ba6FUPzweLMvBSCBx1tot5CVR9gQ==
X-Google-Smtp-Source: ACHHUZ5gIOI1fuO3+omWI3ZFi04M+ls0ECM5yJW/hGOTfIhuUEs0QHIWlyyE93+ta0AMRd/Bn9r+fw==
X-Received: by 2002:a0d:db15:0:b0:562:6c0:c4d3 with SMTP id d21-20020a0ddb15000000b0056206c0c4d3mr7636270ywe.13.1685568734582;
        Wed, 31 May 2023 14:32:14 -0700 (PDT)
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
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v3 33/34] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:31 -0700
Message-Id: <20230531213032.25338-34-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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


