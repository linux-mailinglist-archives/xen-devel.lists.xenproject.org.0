Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A21D73F21B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555720.867755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEj-0003D8-9c; Tue, 27 Jun 2023 03:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555720.867755; Tue, 27 Jun 2023 03:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEj-00039o-5t; Tue, 27 Jun 2023 03:19:25 +0000
Received: by outflank-mailman (input) for mailman id 555720;
 Tue, 27 Jun 2023 03:19:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzBh-0003pv-BH
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:16:17 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa37eb58-1498-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 05:16:16 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-57045429f76so40114357b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:16:16 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:16:15 -0700 (PDT)
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
X-Inumbo-ID: fa37eb58-1498-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835775; x=1690427775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=Gr8f3MEz3obvDl9KABhIuO70HTBkoFbuWEeimu9z4yQhoBxpIMzXHt4/zQiD/35FR2
         Rou/oVuLMNuircs5Aw55ugfL83e83sFrRKh4nGjfNUBrs0Ns51CypHUWM+aHwKiIGCB4
         bDbKAJJc6ueglTVv6Zd/8VvPqPuBRwfoUXOaXnwyPF0zCFc73NfT/c9Q8XEzBzPYIVow
         QBI9GU/YA6Md8J3UGn6Xw0CXbMe3aYnpOaLZmcH+kLxI6o4K+ynL8B23lQ0U//mVHlcw
         WbYitL1St1RrPY9jH0d0TpkVmHfz+e14q0Nl7+sag9AUsUOnDCmyHqhFNRZORMjuCsmz
         kdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835775; x=1690427775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=BJ1023+V/bRiMjWAt1t+0kB5CUTzXUin2ga20sZNEM/SjYwNw92Rg370+gumUoLFYa
         Kf73Wq2U9WV3PvXj3qxX4kBNHYKrSURuCv1DH28WIo7wuE8EyL4yVkb+MDg0OyV0xFHT
         ezjDcx2670kD/VlGcOM55cMyP8FQkDDNBauWbOMQdeUAHox81bwePfZtQbgxLnGvCmGr
         sFaB0A/+7wGOprNtTtcIaC7sOmzFmuGlTPdGs0G3M8ZGQyC1UGddxPynArq+4RJASSD5
         MboCv2R2aSaQkyI/J2pYX+n2nQW38ARoJpO3zCAcLGItZa4CG7EOf08pASrosCLkBU1o
         iL8A==
X-Gm-Message-State: AC+VfDzaaQpbBHpPFivQgEp4yGpfgeAQ1tRpsvrAMoheAv/Z/PjXZ/6k
	uLgSoi5pkWoZQZk9vEbr24g=
X-Google-Smtp-Source: ACHHUZ4XU3sOm1xs9Jcr5rbSZbAjZaSOolmfhgi2qcsz6PmREIffAwTevHZjKc/Hdw6V5zHvfavIAw==
X-Received: by 2002:a0d:cd46:0:b0:576:7902:f4dd with SMTP id p67-20020a0dcd46000000b005767902f4ddmr12132465ywd.47.1687835775530;
        Mon, 26 Jun 2023 20:16:15 -0700 (PDT)
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
	Richard Weinberger <richard@nod.at>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v6 32/33] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:30 -0700
Message-Id: <20230627031431.29653-33-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..de5e31c64793 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,19 +25,19 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb,pte, address)		\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb),(pte));			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #ifdef CONFIG_3_LEVEL_PGTABLES
 
-#define __pmd_free_tlb(tlb, pmd, address)		\
-do {							\
-	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
-	tlb_remove_page((tlb),virt_to_page(pmd));	\
-} while (0)						\
+#define __pmd_free_tlb(tlb, pmd, address)			\
+do {								\
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.40.1


