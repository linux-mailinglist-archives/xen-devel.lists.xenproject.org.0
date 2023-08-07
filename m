Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB41A77341B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579061.906992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9KC-0005v3-Dp; Mon, 07 Aug 2023 23:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579061.906992; Mon, 07 Aug 2023 23:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9KB-0005bZ-I7; Mon, 07 Aug 2023 23:07:43 +0000
Received: by outflank-mailman (input) for mailman id 579061;
 Mon, 07 Aug 2023 23:07:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9Ir-0001NS-Ae
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:06:21 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04a379a9-3577-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:06:19 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5839f38342fso54971387b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:06:19 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:06:18 -0700 (PDT)
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
X-Inumbo-ID: 04a379a9-3577-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449578; x=1692054378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yb5+fiX/YSPgeVruPImZCslC+7XzLtSDmAZ+KnCCvCw=;
        b=LURal4KqklmU9AiCOifU5Mxc6WM+IybZMw4f+H9b+ehsvWfF2rdEGUCUpHED/xgeP0
         03+is7BherE6vDUPF9cInwhZZ6O6FVEP73Sri7+CBG0/7jN64G4bgtBq56ZrcLUBIxxT
         uSfx8fFqjmiqF0MtkULVgc1gjFJH4lOvkwRfZt9wzMVRnizjKRrxJwuFQ2mIfEo7cHgy
         UR2ZIO+mIWR9RWU4d+HJedZnPKiZaDv8i4STB2D6+pQaLcMt/pvWXKdhAwPxBTPHyGDc
         YUL8XwwyvOUHrQNxNKfZS8WVqZrgPXs80ZLFz3I7kRgWNiGS07HTyMzLuT9V1dLH0d1v
         g2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449578; x=1692054378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yb5+fiX/YSPgeVruPImZCslC+7XzLtSDmAZ+KnCCvCw=;
        b=AslJ7ICD1SFZiw/MaPHqUMQCo/J5NbmNTE/BsLH1ULShe66do6VU2cvAH/YeyOZRI/
         k8E+Hdw+kLRrK65BN+7BrTWKVZOEqBLB8VYxZQUJwq1Qw+QakyS30lJXk8DPp23nDM5/
         BwmDZ1KhES+eJZHidjeaeZHYaD+p9wvWWFF27ZYEoGRjtyxmc/oXoiqeQc6a+baGvSr8
         cj1CQokSax025yF0fyItJGLTZZ2/ZgczQt2Ef2vyWFkVh2OMl3v4P+7mlxboWagf1le6
         g/YbKAXHJaMcb2JwvewC+Hqrg0l37JvTu/b1rNOzcQzlaiwXkqaJAwbhgvMISDBG7b2N
         YaVw==
X-Gm-Message-State: AOJu0YzMDua5m/R9ge30S5Cp155XqewOadT8JEGQtjXoGbxCdeg2Wkj2
	Kz+Fn8fJFT2Kst1W/ZGxuK8=
X-Google-Smtp-Source: AGHT+IHSK0JHQfLZYNqZB3BuP0bNBVURutz2ITpQB4n2EhlNMl4NfRND8wevRJ4hRdMY0+rsbG2z6w==
X-Received: by 2002:a25:ac04:0:b0:d0a:8269:e5d9 with SMTP id w4-20020a25ac04000000b00d0a8269e5d9mr9659872ybi.60.1691449578542;
        Mon, 07 Aug 2023 16:06:18 -0700 (PDT)
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
	"David S. Miller" <davem@davemloft.net>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v9 29/31] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date: Mon,  7 Aug 2023 16:05:11 -0700
Message-Id: <20230807230513.102486-30-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable pte constructor/destructors with
ptdesc equivalents.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/srmmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 13f027afc875..8393faa3e596 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 		return NULL;
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
-	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
+	if (page_ref_inc_return(page) == 2 &&
+			!pagetable_pte_ctor(page_ptdesc(page))) {
 		page_ref_dec(page);
 		ptep = NULL;
 	}
@@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
 	if (page_ref_dec_return(page) == 1)
-		pgtable_pte_page_dtor(page);
+		pagetable_pte_dtor(page_ptdesc(page));
 	spin_unlock(&mm->page_table_lock);
 
 	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
-- 
2.40.1


