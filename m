Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626973F22C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555769.867911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzFA-0001BS-Ay; Tue, 27 Jun 2023 03:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555769.867911; Tue, 27 Jun 2023 03:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzF9-0000ne-9E; Tue, 27 Jun 2023 03:19:51 +0000
Received: by outflank-mailman (input) for mailman id 555769;
 Tue, 27 Jun 2023 03:19:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzBC-0003uL-JJ
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:15:46 +0000
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7378e54-1498-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 05:15:44 +0200 (CEST)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-57015b368c3so30867587b3.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:15:44 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:15:43 -0700 (PDT)
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
X-Inumbo-ID: e7378e54-1498-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835744; x=1690427744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nccUzLka7Xkr4OuMpYk05u/KaIGQrzDFYQttz/vcmHQ=;
        b=HLcNThhCjrF2lW2DbUB2arEo4ko3B6allhXZIcElXjdr6H7L2X1FZfSho548An2x+c
         a+9K7HsBcoezl8dCiHuvfAoLyrYuTYtD9E2TWwaVAxGHkBxxc2/5TZ6nFsMXNvk6remM
         jx+8EfWgo0KYBg7GjeDiKlLbwiB7jM460FpLAi7tKdSlKxxDWqFHsa1UXC/mbPJcCtbU
         yj4Rp4J3hy1xGdNYGZKCLJPZo1cDJDTZZ/8LhFsRol7Jja96ui1kFTq+O1Fx747WJ4sF
         vLKKmUtgz/Vt/5vQzW3HaVNESXDRtjCa2KGe7DVgUo3lXiMXBnrUqjQNRU6qXKgQgpLj
         HQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835744; x=1690427744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nccUzLka7Xkr4OuMpYk05u/KaIGQrzDFYQttz/vcmHQ=;
        b=PQyyEWNzJwpkLeuOaEnnWFeHseNg9p/XN0Jhl4VdH9Vaymd3oti/qmf3FQpyHAJ44t
         XIeRDzUW/Ip8l+vo7TiBaU8tqYi2eIO2vHqES3/Xd2oBIzP0Y9nTHTx0nIIlcMeik8Hg
         uuhDGfqbeQuMOCMQli+j3He4Aq3fa/BkTlkmPC3q6ZrWGRb5tCtofbHNRBbtSff7Gglf
         vtTeWEgSu+rcDK/dwRevvrKjapfl5rEl5F06doqa+UjZ48u1Zt1T/J43V1/hNIDUxK/R
         9XQa2in3vJTQbMW712gquXq+0s+BNvo4+SjzxKM7y3SiMYco5lGuOVqYjJ9xf1CapiLI
         42CA==
X-Gm-Message-State: AC+VfDxb++NdYXwufC8QhY/Zz1Osrf+PTRgG0+BIj/KksH069As7XEwg
	5kmCKyVKw+gYN4m3GFbVLKw=
X-Google-Smtp-Source: ACHHUZ4vo/lElRqyF24hRbACCzJ93507ECpcyy5/0zyyAPcDbkzDTEVAwpHPMKxzXN5UZzQtaYrpVQ==
X-Received: by 2002:a81:6bc5:0:b0:576:8fcd:270f with SMTP id g188-20020a816bc5000000b005768fcd270fmr7059365ywc.19.1687835743726;
        Mon, 26 Jun 2023 20:15:43 -0700 (PDT)
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
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v6 17/33] mm: Remove page table members from struct page
Date: Mon, 26 Jun 2023 20:14:15 -0700
Message-Id: <20230627031431.29653-18-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The page table members are now split out into their own ptdesc struct.
Remove them from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm_types.h | 14 --------------
 include/linux/pgtable.h  |  3 ---
 2 files changed, 17 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index fbbe4e93a9ba..434e54440686 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -141,20 +141,6 @@ struct page {
 		struct {	/* Tail pages of compound page */
 			unsigned long compound_head;	/* Bit zero is set */
 		};
-		struct {	/* Page table pages */
-			unsigned long _pt_pad_1;	/* compound_head */
-			pgtable_t pmd_huge_pte; /* protected by page->ptl */
-			unsigned long _pt_s390_gaddr;	/* mapping */
-			union {
-				struct mm_struct *pt_mm; /* x86 pgds only */
-				atomic_t pt_frag_refcount; /* powerpc */
-			};
-#if ALLOC_SPLIT_PTLOCKS
-			spinlock_t *ptl;
-#else
-			spinlock_t ptl;
-#endif
-		};
 		struct {	/* ZONE_DEVICE pages */
 			/** @pgmap: Points to the hosting device page map. */
 			struct dev_pagemap *pgmap;
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e9bb5f18cade..daeacfe3930d 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1044,10 +1044,7 @@ struct ptdesc {
 TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
-TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
 TABLE_MATCH(mapping, _pt_s390_gaddr);
-TABLE_MATCH(pt_mm, pt_mm);
-TABLE_MATCH(ptl, ptl);
 TABLE_MATCH(rcu_head, pt_rcu_head);
 #ifdef CONFIG_MEMCG
 TABLE_MATCH(memcg_data, pt_memcg_data);
-- 
2.40.1


