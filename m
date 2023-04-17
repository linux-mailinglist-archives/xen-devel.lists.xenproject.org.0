Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1BF6E52B9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522338.811660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrC-0007Y0-PV; Mon, 17 Apr 2023 20:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522338.811660; Mon, 17 Apr 2023 20:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrC-0007JY-59; Mon, 17 Apr 2023 20:53:50 +0000
Received: by outflank-mailman (input) for mailman id 522338;
 Mon, 17 Apr 2023 20:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqP-0005M2-6r
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:01 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6820218-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:53:00 +0200 (CEST)
Received: by mail-pj1-x1035.google.com with SMTP id f2so18670089pjs.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:00 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:52:59 -0700 (PDT)
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
X-Inumbo-ID: d6820218-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764779; x=1684356779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3zVXX/N6SOzga9RDJq+tPAqPrrx50X9RMNZ27hRgPo=;
        b=sICUrUNhKpAOA4VRjrqbzI2X/H4tUjO6T2SdOnpuj4Iy+PajhE1DrUSbcJznfffRrX
         L+wg0APu+UnJsiMWo07D8eesoEiJoCPkIf7iFkO3frlAWKtnOneztwNYCGmhOQpiZeuy
         AXohiTFVSZ6j/QYK9dyhVhIaufaLIPexDAAJXmf6qW3dNeCDEUq++V0vxfiKc0g0e7Ab
         Ewxv8L1qYPD4uyzx9cQ6CGY815b+pAM3zpWc0XUF8sLnRhkHRA/O3qjcuWg0cKvRpE4M
         YyoU6OpnuIHEQ4e7n1BxpYaP+3T9kR2hf6Oim0PIubi0gprGsuCOvZCKtVwS9TGYF6kY
         TvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764779; x=1684356779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3zVXX/N6SOzga9RDJq+tPAqPrrx50X9RMNZ27hRgPo=;
        b=RkVH6m2kAqviIsq28acqMDlEPCQh8jnkTb0VxM3wF7Fws6TyfR2LacgN9AR/dqjLrI
         rqebj3iDjfFq/6AoCHctOsH97Oho4CU4h3L3BZHDh37Zw7OeBKnpmszPDs26pZaG2b5L
         6kYf6IynPoSI5UhSguZtv5ZZYPd0LDBX4rx9XE/n51Ao4uj6Ke6Cr++2xsvQcEfBwmk/
         ToiDaHmh4d6pDcWtL8d3+NfhYbmsnPPd4miFg261udKfe3f+LW3Aw+c5xDOf/wfJnnK9
         fJc+hbjtrJGr3QYUIG0ZvaiPpi8WVNNs/QCe7WAUGUEIRhXAUlGhU5rxNZhpoKdWs95S
         QGNQ==
X-Gm-Message-State: AAQBX9d/U+OrlEatZiA0ngFH4u/1RvtRTNplNQLvIhRElBuNPtyBCf3t
	K7ocFJeBhNXt3QD0odUf/4k=
X-Google-Smtp-Source: AKy350aL1Q/BuQU4b/coHWha7jodau934g5ZfPpWwX1i7O384OcXkkUs5sEaNrPzHDYpgrYCEKrWgg==
X-Received: by 2002:a17:90a:cb8c:b0:233:f393:f6cd with SMTP id a12-20020a17090acb8c00b00233f393f6cdmr15121483pju.5.1681764779380;
        Mon, 17 Apr 2023 13:52:59 -0700 (PDT)
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
Subject: [PATCH 10/33] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:25 -0700
Message-Id: <20230417205048.15870-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d2485a110936..2390fc2542aa 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2911,12 +2911,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
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
@@ -2929,7 +2929,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2953,7 +2953,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.39.2


