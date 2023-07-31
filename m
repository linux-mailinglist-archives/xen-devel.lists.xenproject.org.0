Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9DB769DA1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573246.897794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJB-00011q-8j; Mon, 31 Jul 2023 17:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573246.897794; Mon, 31 Jul 2023 17:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJB-0000zp-54; Mon, 31 Jul 2023 17:03:49 +0000
Received: by outflank-mailman (input) for mailman id 573246;
 Mon, 31 Jul 2023 17:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJ9-0000C0-KZ
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:03:47 +0000
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [2607:f8b0:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3630ad8b-2fc4-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 19:03:47 +0200 (CEST)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-348dfefd1a4so25370755ab.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:03:47 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:03:45 -0700 (PDT)
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
X-Inumbo-ID: 3630ad8b-2fc4-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823026; x=1691427826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUMUqbW/uAIHfn0G4toP3JCuPKsaNgXF+JjYaBSaBaw=;
        b=LO7IgtMfV7D/5pieeNhzhX7jbefImFR1TuQgjSMNALZjO7jWhqLJ0NYlGohhp9vNEp
         P7qjRmM9tu3EiZV8IpnwyOsR5oR0G2xN8+6lkb99Xp3Pq2LKGQ1pnDBT3xTub9FDUFeD
         NiuludkMelWGqpPq5Si9scPBohunGQ7wjCbjn1MG6IHkoKqu0G6KIfhUmk1zbCODarzf
         JF+LluYmZmW6+nXXKHPD8kZWEQzzXdWA4gTgt31gpJPirIvHnT+QXlpNT9xuTR/Ob7I2
         6KYVvpK8cyw965ouTwB0qJzxRQ+l2kkvuwks4w7hfsZgPcLfFUXNyqFPQAdsNQn7UH4p
         LAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823026; x=1691427826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUMUqbW/uAIHfn0G4toP3JCuPKsaNgXF+JjYaBSaBaw=;
        b=kcxfZSpmzpywcc33oScL4YfTfXzLAzFGGJbUwsLAnb2SwRY3z/827T5NJCXKewbK+N
         aJ7hpP36yO64Ph8d9LLv/SE7mq7eWjwJPvokfun/JFXGy3bvpl++IXeK4zANp6kQj7hv
         HJmWNNSYOhjM+2wMpw62IvpQVUgKfXbr3E0z5NemMrx0HItyZlGJFhvgLj9U4Rbif7BQ
         brQYHjexNm8bsNZyhxD7QSZT2CXZxAHSbSpWct9cCpGpwSrf0JXOkIeAhAjqr3+5GJds
         YATbzsxpmZqpYVgndbVghJH6InC9jNxZ3CvgjQ6i6C+eb2SG/+KbLZ2Ib3d5vzBSZli6
         8+PA==
X-Gm-Message-State: ABy/qLYdjiqu7GX10EjqmN47zZEy2fhCb0JjqAuvmqLSlV2Dn6rtxwPy
	rl6A7Zg+OLtyqoxZl/SDtd0=
X-Google-Smtp-Source: APBJJlEWqZXE1sICWadhT2wO43hXTa2FHUgzTzYXN3XbSpmzVLjVyMFNIil8bQaSo4X4bLn1gewpKQ==
X-Received: by 2002:a05:6e02:924:b0:349:2498:ed90 with SMTP id o4-20020a056e02092400b003492498ed90mr1956382ilt.30.1690823025849;
        Mon, 31 Jul 2023 10:03:45 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 04/31] mm: Convert pmd_pgtable_page() callers to use pmd_ptdesc()
Date: Mon, 31 Jul 2023 10:03:05 -0700
Message-Id: <20230731170332.69404-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Converts internal pmd_pgtable_page() callers to use pmd_ptdesc(). This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3fda0ad41cf2..bf552a106e4a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2971,7 +2971,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -2990,7 +2990,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1


