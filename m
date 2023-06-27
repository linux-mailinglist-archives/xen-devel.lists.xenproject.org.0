Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E77073F224
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555740.867829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEr-00056P-MM; Tue, 27 Jun 2023 03:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555740.867829; Tue, 27 Jun 2023 03:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEq-0004u8-MN; Tue, 27 Jun 2023 03:19:32 +0000
Received: by outflank-mailman (input) for mailman id 555740;
 Tue, 27 Jun 2023 03:19:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzBN-0003pv-N4
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:15:57 +0000
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [2607:f8b0:4864:20::1131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eda6bebc-1498-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 05:15:55 +0200 (CEST)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-570284c7e61so43272317b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:15:55 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:15:54 -0700 (PDT)
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
X-Inumbo-ID: eda6bebc-1498-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835754; x=1690427754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=m20u0ufiAKGaCJ1eF+oXsWKBIRL5JTjyvtae8lqFZvtXfIrM7cJtjjAu/m4Uz73Z8l
         2OzyWyLCkpN3ueHXh3OYTXgBp8fMDOqyT852NuEeBcWkgEMJmVKnx3KmXsByRx3AKFHF
         Vg5wuji9LMQRgJRH1HqmX3jxPY497r0xZlE76FEouiAeDZpP9QjhFrAgiTXpIz8r0/Pn
         raAur9OcS2AWjvRxW5kW7BBQEK8M8XOe3JN2fYON+zb1b/iUEGPKmhswAXipr/RMjiJ1
         5Ou/YPdkNRNCdvvgrCiDyHNc6JnGXPl8TTudPcGz7r3XrC0of8M4idYi+6qLUVc137gj
         TxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835754; x=1690427754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=aj9eE6HgaouSdVybo7a5ysz3c0/+UJaGUv6hs/+coQGyN29B97vw/GnKYrHHGb1MQh
         0vN6H89434zv6EwnZl9wOQKkr/qDYmLaq++KPyuUJjkALvsD31PPI7XL0TyZCtuzE2FJ
         x+huNGYe9SM7nvMdp6y4uZAZtqAPA4NkfsKbfKnUAlv9BZO6YSYbxFCY8yTY2V7P5OMq
         P/Q+0xKkRkO02+t5f2zCTNZXZTsvkJ0xJNavxsBtAA1EkWciRVWSz8K0gDR3lMpR+Blk
         u7xwmzJTvyR/OSNbjqS38WX/FM7hSZN2Eazo85lFR90SaEB8zBu1EwS0MlFWD1Wyp8Lt
         hgpQ==
X-Gm-Message-State: AC+VfDxc6iTjuto8kea8a4fcbTrXwcy+nefmbNHuqs+jiOpG2H8oM9lI
	p16oY9mZkCXCBf3V2E/7RSk=
X-Google-Smtp-Source: ACHHUZ5MOzNqvj1LDJTcnkC+L2S0i67qvPaFwWjlYeZ+6A+ljBIE978bk3O2AZxZRJ0D8kmPxN2z/Q==
X-Received: by 2002:a81:7189:0:b0:56f:ecdd:ded7 with SMTP id m131-20020a817189000000b0056fecddded7mr30983642ywc.10.1687835754377;
        Mon, 26 Jun 2023 20:15:54 -0700 (PDT)
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
Subject: [PATCH v6 22/33] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:20 -0700
Message-Id: <20230627031431.29653-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
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


