Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691226E537E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522431.811903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwV-0004n8-A5; Mon, 17 Apr 2023 20:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522431.811903; Mon, 17 Apr 2023 20:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwU-0004eK-Ts; Mon, 17 Apr 2023 20:59:18 +0000
Received: by outflank-mailman (input) for mailman id 522431;
 Mon, 17 Apr 2023 20:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqZ-0005M2-1y
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:11 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc59bc60-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:53:10 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 x8-20020a17090a6b4800b002474c5d3367so9750208pjl.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:10 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:08 -0700 (PDT)
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
X-Inumbo-ID: dc59bc60-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764789; x=1684356789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySUR2NhNYIi45iieMc0XGAHKG7J++HPTQWlVu2Tasao=;
        b=r15/y1KDif+Drf/4AN1jpq4aAvcL2g0C6yBlVejRZjViwAKdx4tN5lVxRrilW72t8W
         lxYrwwZ1V+6OuCBWGNjnVnFHs9fxA0+y+Hq/T2Xun9HaX6uevRtPhFT+6Fyn6rL6cuxl
         Z3/9OHOOCrjsch5rq9oWYEod7RCMO4fFtyd7gUBrmXZG32pCnlsISiWWId2b7LrGrhST
         kpDrkb186Ifgo7UoD/Ti/tLM6Mv74UfKgE7j3u4BhSVZUj1yrtlCsZDlhuTy+CmGW1TT
         t+a+qaRd0Bf5+Wl/CDmlKFz2wUcV2Pe9TbKsnSy3YV2N+zpAWDFA5l3JzNu+kIHHm1Jf
         2puA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764789; x=1684356789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySUR2NhNYIi45iieMc0XGAHKG7J++HPTQWlVu2Tasao=;
        b=F2egSfN5qpn1v+SZ5/wVTQy6Q5UG9UhzS1ReBGSNNwhMAHdFweZMfCnudW9ncHJU7V
         OG1lahUmwmr6W/E97J96gicZt/VFWuV73bwccqgyL0mRgkiQNkaWlmEDsQVcbBcSUAdc
         v6LiDpu0BsPu4V7CJIAjH8wfRGartUMmkUcLWWZyBlj0/TPzTYZ44QD8nxsPHATUS0Wy
         hCVwmpQpkKE8FrcWY1AJXogb3GitSuy1wRFOz/Y/zgIWamwtvte2K6exTp3MkBtlcSkj
         TfzCzR2COu/U7WBkALHRafJYXJCnB1Lt9NmmYfxu6MS++Ge7PsbgywtTWMn6Sjwr1lOM
         8J2w==
X-Gm-Message-State: AAQBX9fELCm0JdQIp3SyoDNTqJHDxGq9xHsUcfAiHNM8xiSHQBxfJUn4
	M30Rlgo8EnxZwdLx9NDGBrU=
X-Google-Smtp-Source: AKy350ZVl3PNdJ0+nN/Rb9LpMw5+uyjbe8u9t4N4aIteNFpQkEwBCpgg7+YRGDc+SZWH4x4d964lpw==
X-Received: by 2002:a17:90a:d205:b0:234:409:9752 with SMTP id o5-20020a17090ad20500b0023404099752mr15223725pju.25.1681764789129;
        Mon, 17 Apr 2023 13:53:09 -0700 (PDT)
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
Subject: [PATCH 17/33] mm: Remove page table members from struct page
Date: Mon, 17 Apr 2023 13:50:32 -0700
Message-Id: <20230417205048.15870-18-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The page table members are now split out into their own ptdesc struct.
Remove them from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm_types.h | 14 --------------
 include/linux/pgtable.h  |  3 ---
 2 files changed, 17 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 2616d64c0e8c..4355f95abc5a 100644
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
index 7cd803aa38eb..8cacdf1fc411 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -91,9 +91,6 @@ TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
 TABLE_MATCH(mapping, _pt_s390_gaddr);
-TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
-TABLE_MATCH(pt_mm, pt_mm);
-TABLE_MATCH(ptl, ptl);
 #undef TABLE_MATCH
 static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
 
-- 
2.39.2


