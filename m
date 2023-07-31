Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A49769EB0
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573298.897907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWMo-0008LD-Fj; Mon, 31 Jul 2023 17:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573298.897907; Mon, 31 Jul 2023 17:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWMo-0008F6-82; Mon, 31 Jul 2023 17:07:34 +0000
Received: by outflank-mailman (input) for mailman id 573298;
 Mon, 31 Jul 2023 17:07:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJV-0000C0-Pf
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:04:09 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 436d25c3-2fc4-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 19:04:09 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-c5ffb6cda23so4928539276.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:04:09 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:04:07 -0700 (PDT)
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
X-Inumbo-ID: 436d25c3-2fc4-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823048; x=1691427848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoPDwBR7UkDBRqaPTC6ObTEe9OrRslO4Jma44jkeaBI=;
        b=OAbNNQBEQXMPsZxDdWqbwpvcbcC9brAkDdGEYZZSxmgS9fU/KaG8Vdw1eojjPxifHR
         dAgpTgfKnNikXik7mZu8QxravKkUxiIYGVER2PrkOqRriotSLF3T4LElpBmapph98PeJ
         CgANJas/sYwEcas//U7Qxkrb0B57mEkHjJFVkSuOLhuhDwIKccn09v9YrEs6kDdqLy4T
         Ieqhh+PAHMUzo7yeR/3qM+URoXymEQxqZDFSNR+LNsEWiMnR0aGkUyMFjyNfNubh1n44
         qou+GBpn9D5SWlHqMqT15mOyIOurWshKH34ovdJcmzrKIbB8XOImOByAI5BjQB0TmzE9
         Sl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823048; x=1691427848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoPDwBR7UkDBRqaPTC6ObTEe9OrRslO4Jma44jkeaBI=;
        b=Bg3KXyhgVoVkH2J9yDBQaayr7yxCzAexB+J+gkGyg7SqBdHAURDQvFUnSxVBsKYrof
         2dLDIam00+j1CKbfKE6j9sUHpFL59GOaX4AusVHkZk1TpGSu7bhvSbd880KGWciVO08k
         oLGEQY4EztQ++Fu/nFvmBnnWBG8AdEClZPmHTzj0R8OHUynmOmd+Hr7+KkZmQ5iFGFnW
         T1k+hQ9GppN4zAQdkr+0fMOTHbU52PGX5m4Wsku+uD74dnWUXO/B4VS2DkWkwQvk+B/H
         cso1nt0iy5Hu3tly6QzBCz1svQDHK0bV6Vq6fmhSY6BHqu6ZYCZsGATqIYPDjqMrQ6Av
         6Jng==
X-Gm-Message-State: ABy/qLZ+c5pQ8i0nF9Y7XL66RJKUlFh+bMfqc1sKkJQ269QM3oTaIg+j
	9Q2Fd3GBVkXWjoNO4DVnR3A=
X-Google-Smtp-Source: APBJJlFKcIKM/utvbiiE7uhCLg+4EyOcJ7OdfVdmr1i+MWfEQcViSbVO+c8ELmOI+htD8mvz1eRjLA==
X-Received: by 2002:a25:f626:0:b0:d10:d237:b03d with SMTP id t38-20020a25f626000000b00d10d237b03dmr9909607ybd.53.1690823048043;
        Mon, 31 Jul 2023 10:04:08 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 15/31] mm: Remove page table members from struct page
Date: Mon, 31 Jul 2023 10:03:16 -0700
Message-Id: <20230731170332.69404-16-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The page table members are now split out into their own ptdesc struct.
Remove them from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm_types.h | 18 ------------------
 include/linux/pgtable.h  |  3 ---
 2 files changed, 21 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index da538ff68953..aae6af098031 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -141,24 +141,6 @@ struct page {
 		struct {	/* Tail pages of compound page */
 			unsigned long compound_head;	/* Bit zero is set */
 		};
-		struct {	/* Page table pages */
-			unsigned long _pt_pad_1;	/* compound_head */
-			pgtable_t pmd_huge_pte; /* protected by page->ptl */
-			/*
-			 * A PTE page table page might be freed by use of
-			 * rcu_head: which overlays those two fields above.
-			 */
-			unsigned long _pt_pad_2;	/* mapping */
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
index 250fdeba68f3..1a984c300d45 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1051,10 +1051,7 @@ struct ptdesc {
 TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
-TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
 TABLE_MATCH(mapping, __page_mapping);
-TABLE_MATCH(pt_mm, pt_mm);
-TABLE_MATCH(ptl, ptl);
 TABLE_MATCH(rcu_head, pt_rcu_head);
 TABLE_MATCH(page_type, __page_type);
 TABLE_MATCH(_refcount, _refcount);
-- 
2.40.1


