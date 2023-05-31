Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91845718D5C
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542102.845700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TW9-0004xr-77; Wed, 31 May 2023 21:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542102.845700; Wed, 31 May 2023 21:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TW8-0004nH-8L; Wed, 31 May 2023 21:38:04 +0000
Received: by outflank-mailman (input) for mailman id 542102;
 Wed, 31 May 2023 21:38:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQ2-0006xu-HD
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:46 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8acfa527-fffa-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 23:31:46 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5659d85876dso735417b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:46 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:44 -0700 (PDT)
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
X-Inumbo-ID: 8acfa527-fffa-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568705; x=1688160705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9eRM/zDkfdSk+8A/Hewm27be7ojppibpTW/4yMTPrs=;
        b=cEdd+3JqSM8NFS7GIxJNDGEwvf5zLrjyKSP/sMa+M4iyqruEv0NeTXFNM3FuEOve0w
         BIidhyYZPlXr46Gag37ah0Z9lK+/zubpEH8qTvbGBEkRrc++Uy/9vmo7kzodV2wrSQQX
         I30LmfVEDViclfTqhhCm9JCK+j60eB88X4OE4kx5hV9tTa2skQgGrRsYDfbJW0ibMSeL
         XGmJa+8fFqRfTTRXmPxLl8Ng1lVV80Cc71vk49EsIYa6/DzcwK4zi4KQyIaDphcDsbUr
         cdzc/H0c6XAN15Wd27KyDlOf+VJeKUYgNs/w5+avyyLu4TkMCo4jGnCkWr4fOUgF3X5G
         tX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568705; x=1688160705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9eRM/zDkfdSk+8A/Hewm27be7ojppibpTW/4yMTPrs=;
        b=do8pG4QuhwYJtztrp83sjKVzaWiS77lrGIsoEUgJVuOC0vMZuxcANiRAMv6HgEqims
         3ywJIccF5ZOWODeXN6VCXvuZDRsrbLbQO9sz8MUBMg/mTLPp7IzoH5Rl8gh6Y/4nyTPL
         Nv/sXq/yWRUP6gj2783JxI87ouP/5tokdMn576/YfoByezQwEe0zG4yjP+SzGJMsttyR
         h9vVvy5414GwXse03Y8ibJyv9s6PmUDfo9BTIz/kaizvDfW5z0szJjaVPs2snvp37QX9
         1q5Dz8eYQXOqeCtuPlgxB1UrqZYoBAcTkKQZKxi4gx8FOvOcPU7ik29YHmcqpfPAKeim
         TSGQ==
X-Gm-Message-State: AC+VfDxj7ur5mqnb5Q4ZRZNbonNvA9F9qrgLpB1tnnb5g7i9RtxGMunO
	XX6I2QtqDiDbDIR3NPswd28=
X-Google-Smtp-Source: ACHHUZ6qsHeUoao2+s8uy7ftoyOjIWcEzXHhSNjnyPVGfYnJHG4o2q2q2wEf6DyMGhXFqCryp1fDIQ==
X-Received: by 2002:a81:778b:0:b0:565:ee47:5844 with SMTP id s133-20020a81778b000000b00565ee475844mr7319022ywc.38.1685568704868;
        Wed, 31 May 2023 14:31:44 -0700 (PDT)
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
Subject: [PATCH v3 18/34] mm: Remove page table members from struct page
Date: Wed, 31 May 2023 14:30:16 -0700
Message-Id: <20230531213032.25338-19-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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
index 5f12622d1521..3b89dd028973 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1020,10 +1020,7 @@ struct ptdesc {
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


