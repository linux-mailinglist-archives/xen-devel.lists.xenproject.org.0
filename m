Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37309760884
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569408.890118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9eB-0000QQ-H2; Tue, 25 Jul 2023 04:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569408.890118; Tue, 25 Jul 2023 04:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9eA-0000Ef-Fu; Tue, 25 Jul 2023 04:27:42 +0000
Received: by outflank-mailman (input) for mailman id 569408;
 Tue, 25 Jul 2023 04:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9YK-00023t-Vo
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:40 +0000
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [2607:f8b0:4864:20::b2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfda9d7c-2aa2-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 06:21:39 +0200 (CEST)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-d0a8ae5f8a6so2876729276.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:39 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:37 -0700 (PDT)
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
X-Inumbo-ID: bfda9d7c-2aa2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258898; x=1690863698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoPDwBR7UkDBRqaPTC6ObTEe9OrRslO4Jma44jkeaBI=;
        b=Dgs8EsJAHasnII4rJ0h10Nj9H3O9uzEKXy7LW6sf6S5UPbm7zagckuwMpdCbvZk8cU
         3/jnkSDkvXi64EHRwyjz+CM8p/KmVE/9fnMiDEX0PvmK/w2bAUSZDPt5BzsyT9VmXNoR
         USMHwv5na3aMh8DeZjSQRwfSfPFKG4ZOnIYC2X37iqKJqBwj0eKoY0bqe0NY7N310KPu
         aidhbQQvpt95cN5aH+LGh5XqwJcQ2uC+n4TR20GhHOCZWT8rqRInnhuzQKk9A3ffSHvU
         8/8KhU8ISd3BEz/7bIAWQZEwejG7oku5b5qOTInFSfUdh8Iny4J/y8tSxkhE65C29I99
         J5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258898; x=1690863698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoPDwBR7UkDBRqaPTC6ObTEe9OrRslO4Jma44jkeaBI=;
        b=NG/nib/MQdLQjtpgBS8UtsrytNZaNemSisFaelEVymkoLBwzbLdwAsdG6mhu5LjL1h
         E4FOt+jbhA4y8LNOzX32r0KKQrf3/RBfWm17ccK4NGGyyfC5C1XOOHQIvYNQnTsJdM/F
         8jtv4b+ILpLmDQVw8e734XRK/GeEaUiM/nVjd230/4lFQktr0u9E/3h3RQXbVwsgEKPS
         z8dIWhnsWJ5TrJOjTXa9iiJnMx9KrS4RxGOgox2pryO1CJYJIqzn04IQyObuyPHYiR+Z
         FNKg3ffcMa7e/9fw/yKfCr5G6mGIFjsEtVXU38198IqTWktrSyKrB2dkiimh1I7/5a/X
         XJSQ==
X-Gm-Message-State: ABy/qLbHFhwHgNKa817sCQlGLrU+4L/BOOkguoqW65hl4Zl7s2MzkJWf
	oSee8cMAzE1tjDs9HmCW0Bw=
X-Google-Smtp-Source: APBJJlF5Dk/uQrTXMbCnDdD5/bLVaLQ5W3zqcEOsqm95ohTlFSSUZBYyBU16PWFlX2Ey7GE6JXmN/Q==
X-Received: by 2002:a25:254c:0:b0:d0b:9058:f660 with SMTP id l73-20020a25254c000000b00d0b9058f660mr5944061ybl.44.1690258898065;
        Mon, 24 Jul 2023 21:21:38 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 15/31] mm: Remove page table members from struct page
Date: Mon, 24 Jul 2023 21:20:35 -0700
Message-Id: <20230725042051.36691-16-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
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


