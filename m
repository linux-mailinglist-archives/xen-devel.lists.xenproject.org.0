Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E772D23E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:10:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547587.855201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onY-0006EW-AU; Mon, 12 Jun 2023 21:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547587.855201; Mon, 12 Jun 2023 21:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onX-00060S-Pn; Mon, 12 Jun 2023 21:09:59 +0000
Received: by outflank-mailman (input) for mailman id 547587;
 Mon, 12 Jun 2023 21:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8ojI-0007zJ-DO
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:36 +0000
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [2607:f8b0:4864:20::112c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dead4ceb-0964-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 23:05:33 +0200 (CEST)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-56d3d7a5b84so10006237b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:33 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:32 -0700 (PDT)
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
X-Inumbo-ID: dead4ceb-0964-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603933; x=1689195933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELrYSGf3rZcM0SKncNLanyoUH1rFlxcI1YjdtaAHWOM=;
        b=LyMVzyXqiqaKfQOftnbB5qB90EtUnrbgPE+tRRy8u809McOQMdRt58iULBOhR8JFtH
         hhRJmphgmRUDnbyyXP2Q9YxbwzAkn3ThfcILkwgMQG3ISbn98a07kPZmsAVC8Vehd4Mo
         1biR1LFmmxLwxk8sGkOJv0esnaOWjdr489RSbTn71+xsATggGjgO9UBlAUeAeLB5A5f/
         kGoRSfqAHa+jn1LV08UE8edOQfnKwbxOGGV8ICxkOoxOLTvOaFWF2RtvL1e5xr2jqLU0
         QA04uFGbeM6zqpolABbfncapro6b5DTja8wzwTkJfjoIbnkhTJwsqQTX3z92z2Org5Ii
         BY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603933; x=1689195933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELrYSGf3rZcM0SKncNLanyoUH1rFlxcI1YjdtaAHWOM=;
        b=NkRaCaTf79II8p1EKLRKktfB1+9ETYmsmDyPKrMqx8SU9swQYPuSbdKc9lvY/QcnbT
         CKA9TwXQvz7Z50pRqU9HMibgww4Hkf+YozS+fFyWPRck3N7Fy44wHzRVbbFb1MMeV5ng
         dhbr6I6uVwgZC7lW3yKGhl/MkMt9/SPEW73+4QViyAMYpX2GYlqMTa5tcDZZFHDvW7cK
         j4AKbjK7jKLrjunQ00qa+ZKp9YcyUlUhKlMdnkT6bZlDyCsdhcwcK7qk8I+JRTa6XEBh
         4rYAPmaMeCfMhmW39X8uiOVrFlLd4vcPyz3vRd+9fyvpWI00Hv4CDWLjOTylJlcZFHsq
         HSPg==
X-Gm-Message-State: AC+VfDyAxmJmsIeyXrDhqvOh7oaEXgDsKBHpjof7MqxxdJUf11l4140O
	zKEBPqwa/0bzOP9+i9S81jI=
X-Google-Smtp-Source: ACHHUZ7fItlbNlNZv8dpxyHqv1w2q3utm4HiSoRDwiOPIqWB+aVpZeSy3j3Rf4mLiiGsI+aWaI88yQ==
X-Received: by 2002:a81:8942:0:b0:56d:1f8d:b480 with SMTP id z63-20020a818942000000b0056d1f8db480mr4434878ywf.25.1686603932812;
        Mon, 12 Jun 2023 14:05:32 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v4 23/34] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:12 -0700
Message-Id: <20230612210423.18611-24-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/hexagon/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index f0c47e6a7427..55988625e6fb 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -87,10 +87,10 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 		max_kernel_seg = pmdindex;
 }
 
-#define __pte_free_tlb(tlb, pte, addr)		\
-do {						\
-	pgtable_pte_page_dtor((pte));		\
-	tlb_remove_page((tlb), (pte));		\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor((page_ptdesc(pte)));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1


