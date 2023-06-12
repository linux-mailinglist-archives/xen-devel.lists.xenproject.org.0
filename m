Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3871F72D22A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547523.855023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8omz-0007Ai-Kr; Mon, 12 Jun 2023 21:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547523.855023; Mon, 12 Jun 2023 21:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8omz-00075O-G6; Mon, 12 Jun 2023 21:09:25 +0000
Received: by outflank-mailman (input) for mailman id 547523;
 Mon, 12 Jun 2023 21:09:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8oj6-0007V0-AT
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:24 +0000
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [2607:f8b0:4864:20::1133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8aee051-0964-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 23:05:23 +0200 (CEST)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-56d2ac0d990so21806777b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:23 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:22 -0700 (PDT)
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
X-Inumbo-ID: d8aee051-0964-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603923; x=1689195923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BBSMNk3/NV9IPbcmTeXVmuDxVjvV9nk5pHOLLkR9Zc=;
        b=B5eteOvH/q+5UxTkqPiKmSRGXAjb4bZMizLs/WNtLaesb1E0HpRn4up+92FQaO/msD
         wl+HgJ9chyyZgdROsDvWF8ST2c98XDyJ6K5mIkqjJX4+EdwGnn3FI4jGMxc7JXWmf967
         aU1KzzzuV6U5c/qEMroqPTw1zV9aDblRqBawPVlpf/Mlyp6BjBb5H05VxOKBrkeVjlqN
         FunX9lODEGlrIj4hvPqV1OUn4lS2vKzFGXO/PdJAy/LDMA65UwEZCw3NLCYo8+J5kL9P
         iG2KwFG+0fA0Z25/Erx4n5fssjHvgoAeU/1R/dnILNKDOgbuGKGvMNK5K7M37Fiw/tnm
         j5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603923; x=1689195923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BBSMNk3/NV9IPbcmTeXVmuDxVjvV9nk5pHOLLkR9Zc=;
        b=NcPiLtmsvfHWI5JLd8dmU/EUVx6SbS9zREL0LP6SENF55FLF9+6QRLf5auDKNmwzmq
         Cf6Sn0yLROeHICT/rwYpe214OwYl481aq4QjzhqjOZ4tNLMo9LsIO4ODnX1ghdpqvnTZ
         dYEf0d+Y6WgrMtl2MF9QZIvYecFh7lfzbLjubfcB99EJqnjAq9jgyB9ROlF1VgBkkApv
         jiVu1u3B45J7V3TvFMFHx/Aj5NdPr2m/yoTqCjLPeEKWgalFebnrXazgFpbCR450hg9X
         dibnKNCT7wZ1s1WcEgZzkyEpycCAO20P5ChXUR8pSYnM1WnXixJtwduRRzh0pZpERwoq
         Dhpw==
X-Gm-Message-State: AC+VfDzEJYSQPaj9EUCZvYFDk2C+7lt1jMcNSKwdeKeYPRtg3MVB3DEU
	5xuK1KVVk4Vav7wInBX+LqQ=
X-Google-Smtp-Source: ACHHUZ6Y5hnmbR0E296qiytbEPqdIHR5totNZCgnfGVo00JLi96ohBBFsqGnqpvBKL1saABj0PHBjA==
X-Received: by 2002:a81:8495:0:b0:56d:c8d:be26 with SMTP id u143-20020a818495000000b0056d0c8dbe26mr5358308ywf.26.1686603922720;
        Mon, 12 Jun 2023 14:05:22 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v4 18/34] mm: Remove page table members from struct page
Date: Mon, 12 Jun 2023 14:04:07 -0700
Message-Id: <20230612210423.18611-19-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
index 6161fe1ae5b8..31ffa1be21d0 100644
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
index c405f74d3875..33cc19d752b3 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1019,10 +1019,7 @@ struct ptdesc {
 TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
-TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
 TABLE_MATCH(mapping, _pt_s390_gaddr);
-TABLE_MATCH(pt_mm, pt_mm);
-TABLE_MATCH(ptl, ptl);
 #undef TABLE_MATCH
 static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
 
-- 
2.40.1


