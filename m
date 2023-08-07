Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A9A77335C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578980.906805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9IB-00042W-Cq; Mon, 07 Aug 2023 23:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578980.906805; Mon, 07 Aug 2023 23:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9IB-000401-8D; Mon, 07 Aug 2023 23:05:39 +0000
Received: by outflank-mailman (input) for mailman id 578980;
 Mon, 07 Aug 2023 23:05:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9IA-0001NY-4o
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:05:38 +0000
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb8edc84-3576-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 01:05:37 +0200 (CEST)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d07c535377fso5458594276.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:05:37 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:05:36 -0700 (PDT)
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
X-Inumbo-ID: eb8edc84-3576-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449536; x=1692054336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dL6AQetgHURU9peF5jMm+1QPkGPdtGd2X/zb9xq5Tzw=;
        b=ipvaU8x/4/BvbPbL1JSP5UKyrvOXFJin5b02qnpk0+g2WqZ4eJ+PO+ktIgA+6wNoSm
         aaVqpEKee+fuDlQKCW2FfgF7SgMBsBqJt3e1nMH+AXWpM2n5M5vJ6ySCVS0SQ6gxdoiI
         D+Vz3KZ0hmlesWiSA/IngK6t1yMsQcmq6H5TLlpCkzZtF+sAfosr9KpkynHtpBKwq7VS
         GLoFH093mbAem14YxFU+jWVsiLanVvmYVX25waYX2eZafZZIUXESTosUd2Oq+mhwT6KE
         DFWO6vdcB84fh2CYUtre/BRV5qGnoLxfl2hREphZC8Q8m4iPBusEVSAtzxRpIAKFC+MO
         xrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449536; x=1692054336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dL6AQetgHURU9peF5jMm+1QPkGPdtGd2X/zb9xq5Tzw=;
        b=a9cYjC2WkM1nHf85f0/h5zCuaBv0wOxWmJu3tltiWeDTRbC/9VezRjiWrlJtEGqxt9
         sWmK4PJTnIU9QdDTRkMGMY/uoYIS86rZ1lsnlwsW4lBBQrYHoZ0QoXmN9qZFNOqcCVsl
         vzxUEKC2r9hdDbAmc4mnq8mt4odg+JJWRbWoPIRfk2apxV4snEVA0FoCYnbmeE/pswrJ
         xNkV0XM+dIWSy8+ryz5jELWxvfoDy2KQdtJNJTBgIfJ7qO296Cb8qn2uCDmPGSvyYb+Z
         koz/OZcihSYeMbckLYNBee+9JjJ9z4TQraBMAIRYeWZ2Jmw39mYYRPxV6+BGsZY2fGLX
         sQ1g==
X-Gm-Message-State: AOJu0Yz+41lyz1XUEGTHouCry56ZFWwPCi59CC9iJ0a4mOBf7tHaz8V7
	XMyC1ulMyS041cg8tZ11bIM=
X-Google-Smtp-Source: AGHT+IEvxj9+7jMT4q6zEzLr5Igqcb/a7jma6HML30e7U0QAJ8Bd3AhAgHjN0UpvuwRaK7JUtc9G0w==
X-Received: by 2002:a25:738b:0:b0:d09:7f94:6ea3 with SMTP id o133-20020a25738b000000b00d097f946ea3mr11456718ybc.65.1691449536455;
        Mon, 07 Aug 2023 16:05:36 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 09/31] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon,  7 Aug 2023 16:04:51 -0700
Message-Id: <20230807230513.102486-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 13947b17f25e..aa6f77c71453 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3001,12 +3001,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 	return ptlock_init(ptdesc);
 }
 
-static inline void pmd_ptlock_free(struct page *page)
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
+	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(page);
+	ptlock_free(ptdesc_page(ptdesc));
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
@@ -3019,7 +3019,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -3043,7 +3043,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1


