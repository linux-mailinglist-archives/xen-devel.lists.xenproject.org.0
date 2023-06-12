Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCB872D237
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:09:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547554.855145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onK-0002xI-Qy; Mon, 12 Jun 2023 21:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547554.855145; Mon, 12 Jun 2023 21:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onK-0002jc-A7; Mon, 12 Jun 2023 21:09:46 +0000
Received: by outflank-mailman (input) for mailman id 547554;
 Mon, 12 Jun 2023 21:09:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8ojZ-0007V0-1L
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:53 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9c9056d-0964-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 23:05:52 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-56cf916aaa2so27693137b3.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:52 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:51 -0700 (PDT)
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
X-Inumbo-ID: e9c9056d-0964-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603951; x=1689195951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxwTfn+1WulDyktO0TSvPUm3DeZmyyKIR9rdY3Tk+MA=;
        b=eOGJOp7jJTQ8Qtwco1FoDid2kdNhU5TzJ+8oTbvEbumqL3nQk9f2JlPpUk6+vVBHXw
         bRV5gt25GkskwnqufNjnti+xZOoYZnavni3acnpZrn1jo+MmuLHwqDsH6AdCefai5bKk
         AAXb7bC/rUfzM5Y5JNC2uvXF2EwFePa6CfTpeOCze3Q765zcxWqm7xds3eAw0lRtuTsf
         BcL57/8mkiS9/4+PfEIujQe3OJ/SAHQmhYjUTcU73/gLJF/ExdRrGcc3uAsWdkuXE+Gy
         4wgk7G2Doap3dB0ilCFuRYDRNdtR39NjevfAI+zLdtvH3iP4AClD5Rnj/kfEF228LJIt
         Sr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603951; x=1689195951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxwTfn+1WulDyktO0TSvPUm3DeZmyyKIR9rdY3Tk+MA=;
        b=XFeLHEMPTXX/NMA/Sodk2ABOV+tiixU3fn4e7D+2Byj9/Wjh/aUWw+QU+aGko+9VBD
         qj3PnUM1YgpoBuw0uQle5K9gLi9wm2yMZ7rnqU+hLv76eE2JEy6SSAugF95+BQkEpaB1
         AfkgvPSD7xpBmvPj+Hq3jikFVQRyI07wOns3uKWQM1FdOqc15FVrn22mMkkriChn8OaP
         YlXxRnKKMRD/uWufFuSHOPeGWyJOgjeipdK6KJ4FRrB3fMJ+iqrdqHYqVRWKLKigMgPc
         +lTm5Mxuw+8/bAzSEpFy1bBPAWMOiRjUDUiH4TkmOqoLW+uqhCMxVmwiylGzN99X2Lw3
         Ca+A==
X-Gm-Message-State: AC+VfDz9hGPxTqMP3/mvDZ7RD0SUAT52wgMEMQZJxsJ81hbeZTlR/uGQ
	62HrDJv042OmDyLuJx+BUSk=
X-Google-Smtp-Source: ACHHUZ46bRW6OF4FDY00X+3CElfC+YpfDtCCDJShqSFxuRDw2O4jHQvSGoeDK27CBT1NdKxGixMjGA==
X-Received: by 2002:a0d:cf86:0:b0:559:ed0a:96c4 with SMTP id r128-20020a0dcf86000000b00559ed0a96c4mr10849624ywd.44.1686603951409;
        Mon, 12 Jun 2023 14:05:51 -0700 (PDT)
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
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v4 32/34] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date: Mon, 12 Jun 2023 14:04:21 -0700
Message-Id: <20230612210423.18611-33-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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


