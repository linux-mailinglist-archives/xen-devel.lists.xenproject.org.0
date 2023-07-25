Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DD2760882
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569407.890111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9eA-0000FF-ER; Tue, 25 Jul 2023 04:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569407.890111; Tue, 25 Jul 2023 04:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9e9-00005n-Oc; Tue, 25 Jul 2023 04:27:41 +0000
Received: by outflank-mailman (input) for mailman id 569407;
 Tue, 25 Jul 2023 04:27:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Yo-0002Iw-BZ
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:22:10 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d20aa443-2aa2-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 06:22:09 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d0b597e7ac1so2718248276.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:22:09 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:22:08 -0700 (PDT)
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
X-Inumbo-ID: d20aa443-2aa2-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258929; x=1690863729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES9RfFz84BcV9KH4Nk3AfkjPOEvVVRdPbPMSiTejLcw=;
        b=cSKYfsxsSJS7ffOM4NEt7zqMXRoog1hv17RKdUNV14hwO6VLFQmWr65pOVoZcWEcHO
         ZTxl5sTEIPleNQWx16W6XrYvQNc8QXYYi7iNKk/WLCGUAw+9con++Nm/zKIXiRkvFnF7
         Kmn+uijjQiZlrdtiQKHDxzRwNsdnc8EVkdLLz/rRCQKPLyPDRXi+bbVeFHkpJoJjSqoQ
         LLoMyhXQM5hAlfwlKm9TGFpC4wUaQoFel3CzrwsKFljyIKf+UmRISO6P0XGMas/PtQ7m
         PZz9tli6d2qqtk+AGtTpbrNJSRqge28gNGwJ8TouzN1vk9cQxwcl+kcXzH8Il6o+JKN2
         oqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258929; x=1690863729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ES9RfFz84BcV9KH4Nk3AfkjPOEvVVRdPbPMSiTejLcw=;
        b=K1KvbrPGBn2pDwk7ozf/7vLuyFWSU6qACLs5BC/gUGx43Omn4B3Ra3dnZpjaoWB+mJ
         VzOzxBj38mCNGpceNvTJ8x0cUOFa5tP5LGmWZXPr9o6N7xhwCytuHjbeOUkQbcBoQ+Eb
         RBeF3ai+aTKWdYzOAGXz3mK1hMcOTZlDR/jrc4+7xATBMwycYqg1b39qcUfFBukO3qVT
         u71NzaKWg4WbsgsacANQmowLkVLGNott6oL29uG4hnWs4QtLZss7KneKOCtGIFZlpWDq
         i3pRzjWH30NA2QoleSew87k3GnVZKD3qhrquiq2w7yaWH2iMgX2kwFnNGWUd7WJBgc9H
         R8+A==
X-Gm-Message-State: ABy/qLZZXNBJKqFxg60E1h8KFlEqW+NsiX9OhTWlOqDoH+Jna8dDdu5b
	AC8I9uVgyhCCiBoreo8X79U=
X-Google-Smtp-Source: APBJJlHinG28bY5749COLWHo/TBHjyABo5nSLZGYajOWLjAfKDEgrRU/vgHTv2Ygbb3WniVSdKl5LA==
X-Received: by 2002:a25:700a:0:b0:d16:c58a:e63a with SMTP id l10-20020a25700a000000b00d16c58ae63amr1491610ybc.23.1690258928721;
        Mon, 24 Jul 2023 21:22:08 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 29/31] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date: Mon, 24 Jul 2023 21:20:49 -0700
Message-Id: <20230725042051.36691-30-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable pte constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
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


