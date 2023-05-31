Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B19718D4F
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542069.845608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVp-0000Pm-Gv; Wed, 31 May 2023 21:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542069.845608; Wed, 31 May 2023 21:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVo-0000I2-SD; Wed, 31 May 2023 21:37:44 +0000
Received: by outflank-mailman (input) for mailman id 542069;
 Wed, 31 May 2023 21:37:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQU-0006zB-Ff
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:32:14 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b44bb20-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:32:13 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-561c1436c75so810367b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:32:12 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:32:12 -0700 (PDT)
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
X-Inumbo-ID: 9b44bb20-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568732; x=1688160732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxwTfn+1WulDyktO0TSvPUm3DeZmyyKIR9rdY3Tk+MA=;
        b=L4jsN9kH5t72hj91BgcxrEjxGpFvV+qs5I3bkyZBlk1og0Opgec9qEsIK7FrraEHx2
         1n1HXytspMZRcqAu6IErIg00HRKEQlSU5ge+vaCFc1Gqlt4Qy7JKfOaB6sQJmWGwoAk1
         ee2W8IRVTtbl/idUF0z1LRlcPjUT7a6tY+VOsk0Iu1C+hZh22D5V07hzjpJteBVx3v1W
         ZI/MBAiirrh/1wAfUDPooe/ZARW8FaFD8bCYxc4nZtEdbMeu9sESBKz6utwpFa1EL+di
         5AtPWE2kRx/FV4woLekgALaQYhp02WG5GHPy9VCjhu9orzHIF3v5vTBp+/fCu2h+nW96
         ROmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568732; x=1688160732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxwTfn+1WulDyktO0TSvPUm3DeZmyyKIR9rdY3Tk+MA=;
        b=JXJoLW0OMGFckLzQhnFt1DnH3OCl5n91RKq3l6jfCZHyCgnJQTj7i93ZQOv3OkmNFK
         IE0druhIgGgtj879iP+c6AmEXrSj5c5UljW2pSUmQIWU9ih7sMfrZ2UasXseERcvEVAC
         vppttEC9HvCDrA7TEkVslQg/CLjBFKuwgIf4Aq3JlOZ8F0vmVuwQq3y7N9N9oxRinxwA
         /8ijlw050PZEKG+zlr9T+fyx9jtly7vsAb/QBgUptHxQ9O485L5Ie+gRSMXiYFkHt/2a
         rBAtcAUp/tcOPiv2tefozMmWkLJZ66w/rHR3tOoGPnkFlj5YwNg1lRq6lsfjHGf6cfEU
         mvMQ==
X-Gm-Message-State: AC+VfDxE+FdoYgxqY73vn3OFpOIrRQPboXfE6ywolP/2Bu9So1fyyWkF
	7SAlLIDekWB6v2GPEK6038o=
X-Google-Smtp-Source: ACHHUZ7+/nVY5dy5ww7MvRpp2ZVq2XpqSkLFoFJGuLgsQ62NeKnra3AVED33Ph7R+tcYIq7VRl7QLw==
X-Received: by 2002:a0d:eb83:0:b0:561:3fb7:1333 with SMTP id u125-20020a0deb83000000b005613fb71333mr7209246ywe.43.1685568732564;
        Wed, 31 May 2023 14:32:12 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v3 32/34] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date: Wed, 31 May 2023 14:30:30 -0700
Message-Id: <20230531213032.25338-33-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable pte constructor/destructors with
ptdesc equivalents.

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


