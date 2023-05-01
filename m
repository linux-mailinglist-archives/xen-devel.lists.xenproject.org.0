Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A03D6F36D0
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528085.820730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCY-0007u8-OX; Mon, 01 May 2023 19:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528085.820730; Mon, 01 May 2023 19:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZCY-0007rb-Hf; Mon, 01 May 2023 19:28:46 +0000
Received: by outflank-mailman (input) for mailman id 528085;
 Mon, 01 May 2023 19:28:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCW-0006FS-Qz
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:28:44 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6270271e-e856-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:28:44 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1aaf91ae451so11829955ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:28:44 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:28:42 -0700 (PDT)
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
X-Inumbo-ID: 6270271e-e856-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969323; x=1685561323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ii9PvRdhTMRqBop+JFdKAWa6G/XpZkmB9p8iHmrwUc=;
        b=lFLswDg0HvrPkF+dtbJhg/asaCBgi3e00w4opfv2mri4GHWG5ahGHxm9sLAnqC4qbq
         cQ+9MPTjwHhlk51h4w8lOE5zFHDICMVPmNnmwWW2l0krumAZ2PDeWC1WEjJOX3LShLcV
         g0uvqMJBbig8RslrcZc6EAJCiGxazADIIfKt9bAt8yGDMo+5nIH4mdhXs+LaHQV1OVik
         U1EjmbMLOLA/7Pwt5TKTUK+w95+W73jVDYdL+HuxsLXipLy8KET4HB50FeUWTlZzXbc3
         qFSctTNSvV8Q7v0NapgoBkUZ/cCAkZoFPz8ver9uL6iYj4+bfmoOnnABcA11qHjnQcrq
         /yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969323; x=1685561323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ii9PvRdhTMRqBop+JFdKAWa6G/XpZkmB9p8iHmrwUc=;
        b=SgrQb5ed8EXUqfeBjnrlY8KNetBLwNG92i12AEztZMKx2YEZCFv5+0PdyT+NLFrCUD
         xW7oVXy4J4j67VFoF0RmEL8Gjd/5yLRPoMA1T/R1QkxiAb52V6RZlv2cKE8+dGl1h5bu
         iIJGhrk56PzAI1/hRRiffzQrTdOwY2HSUHsiET2umF9sjxYubGn72NnYky0aMV5fjoNO
         10aZSlcygCQKeFZ4azDhEppGPR3HrhsyKi3i0tVkKx9nmmWyHw45UPOmS5odIxBobA/v
         PDgeevov+JdyNE7Cu46q8gqajcbVux2wWyJUNpzXXQiGGbcSKNjPkIe3Hcs1WwawCJwC
         9sLQ==
X-Gm-Message-State: AC+VfDxtWc5NoG8KDquUEPZWw44CSMjGKqwEIKl7+nOXFxtuPyXlW6tW
	OAetJDRRPYpMw/xnLpqGfhM=
X-Google-Smtp-Source: ACHHUZ4gWlsAH/48zhDdvicQeallszzZORdrHEFL4BiABQ6zj3x4/LHvqIQGrX0uRjqorCk+ulIxBg==
X-Received: by 2002:a17:902:e805:b0:1aa:f6c3:ba24 with SMTP id u5-20020a170902e80500b001aaf6c3ba24mr5259994plg.4.1682969322807;
        Mon, 01 May 2023 12:28:42 -0700 (PDT)
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
Subject: [PATCH v2 06/34] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Date: Mon,  1 May 2023 12:28:01 -0700
Message-Id: <20230501192829.17086-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 258f3b730359..62c1635a9d44 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2892,15 +2892,15 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 
 #if USE_SPLIT_PMD_PTLOCKS
 
-static inline struct page *pmd_pgtable_page(pmd_t *pmd)
+static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 {
 	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
-	return virt_to_page((void *)((unsigned long) pmd & mask));
+	return virt_to_ptdesc((void *)((unsigned long) pmd & mask));
 }
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -2919,7 +2919,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.39.2


