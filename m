Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427CD73AA44
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 23:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554037.865099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRP6-0003PN-SB; Thu, 22 Jun 2023 20:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554037.865099; Thu, 22 Jun 2023 20:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRP6-00038G-EN; Thu, 22 Jun 2023 20:59:44 +0000
Received: by outflank-mailman (input) for mailman id 554037;
 Thu, 22 Jun 2023 20:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTT3=CK=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qCROR-0006Mr-Fu
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:59:03 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ce14d6c-113f-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 22:59:01 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-bfee66a5db6so2126730276.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 13:59:01 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
 by smtp.googlemail.com with ESMTPSA id
 d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:59:00 -0700 (PDT)
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
X-Inumbo-ID: 9ce14d6c-113f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467540; x=1690059540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES9RfFz84BcV9KH4Nk3AfkjPOEvVVRdPbPMSiTejLcw=;
        b=oM2eqoarO5mbV/RC9CFfzfiqtalAJnN4v5hz57x8U3YE+/nDsUrmXb6G6NrrfuA0hI
         XHlp77eZ+DzSkin9lWOejdHXde4PpTwM3RiXeCXAduuSgLDQHciXyNj0UWZkZs6yvfTo
         QiJ21UomG7h0wL2TX1WHwgye+s/VKR+Tvt1mxLr3lV1WjwsNROzbcgrXcLO9VnGSpeAH
         7uCU00iH87QJVCo5EKIyfZlW0ogPYyMPi5bY1z7m39x6DegLfFGe3afEY/9WN7xyqGjN
         dkO4NEs5eZtRaUa3RiJYmwztOORKB/ecQ6EJlrLWdOw/VRXBlFmMwGL9APm0v6t4+G2k
         ZQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467540; x=1690059540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ES9RfFz84BcV9KH4Nk3AfkjPOEvVVRdPbPMSiTejLcw=;
        b=Xp4qPukj+65YuNV41hc6CY2uxt7laCeU8hWghuCZ2HGAyLUPadurMDgFkyLiGTngAE
         00J+6t+eN19dsnhE+Zzsaih0cZzxcz8+P2TkQ28lZVp6d32fSUCsf7ikGSmmTaIYUZdV
         9Qks2ImHf0px+2qpxMPlfJPOhRKYr0wJFfkyOtz/FChggtZ6UEl1UCbXYJf6vZf736fg
         tfloIu9bKfYG457eUarWMsReAr9KID5mDo/B9JJ7Y5CvhSn6N9KKG5Aq2rgZoyEPDhq/
         pTveI79wcSTqMcynL0NFK4QdeH5ftxfhSTpHmildV/zJ5CIgbreiTgKcs+7OKAnwZ1vC
         ao4A==
X-Gm-Message-State: AC+VfDzTYYMr0oEpJ3XmPcjucFyx4C3EChC2IeyS1WSRcXu0MRDlMX+G
	LkR+R+kT4erTWKPBwd3FA+U=
X-Google-Smtp-Source: ACHHUZ6Ec2kbAX1UDgGMj9ZCyBvb/VNaStMToJEcOH7SUf7INOW9CMO0HLoZFa/KezNB/PETnccRFQ==
X-Received: by 2002:a25:bc53:0:b0:ba7:db6c:c0eb with SMTP id d19-20020a25bc53000000b00ba7db6cc0ebmr10225049ybk.3.1687467540710;
        Thu, 22 Jun 2023 13:59:00 -0700 (PDT)
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
Subject: [PATCH v5 31/33] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date: Thu, 22 Jun 2023 13:57:43 -0700
Message-Id: <20230622205745.79707-32-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
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


