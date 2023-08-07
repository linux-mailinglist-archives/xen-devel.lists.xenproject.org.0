Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD54773364
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578975.906756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9I2-0002Sb-Kx; Mon, 07 Aug 2023 23:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578975.906756; Mon, 07 Aug 2023 23:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9I2-0002Qk-FZ; Mon, 07 Aug 2023 23:05:30 +0000
Received: by outflank-mailman (input) for mailman id 578975;
 Mon, 07 Aug 2023 23:05:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9I1-0001NS-5S
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:05:29 +0000
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [2607:f8b0:4864:20::b33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e59917d4-3576-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:05:27 +0200 (CEST)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d465b3d50efso2113965276.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:05:27 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:05:26 -0700 (PDT)
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
X-Inumbo-ID: e59917d4-3576-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449526; x=1692054326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEHGQmND3TVCalts2Xn8ptU7qEA2BpyVbaRRrUVwgj4=;
        b=g0HQFm0Ih+ONj9bbGpN0SAoMFwZH1Hyy1LHhk9Yh2p6W+FyLdnCJ7RPABmEq6UvV+/
         I0mwYg/T2n8LaliwXnPTiC9GBqIvZu49Qi1V/N0MmNRCKbxincxnUS9jodhc4yydOwRP
         aDjCJ2ni1nNWMxe4NQznDsxKIox8DPgLSsmzUNzOiHFpehQua0QatbJlVlVObrSVTwwk
         ZCujc6+dVnog1ei5Zro9QqEP+ju61k33bEcuj8U0Qr32h8YYXwWu+8Jh8gouVCHVOaNS
         iYc6V/t51fkGJ7ybJ/9xFdZCGVtXquz95wk1/VRVK/X9HGuHOqtxoDT8S6kl5FuAfQB5
         VZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449526; x=1692054326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEHGQmND3TVCalts2Xn8ptU7qEA2BpyVbaRRrUVwgj4=;
        b=FgXrCWJp0Y3F9S3eyZ7ljc+3XA1Xu8KkkPqQkw2XF14QoXVHP27U0mlwxBw3ACNY1z
         828TDyxcHPSaLKQh1YTJzlapNENpAK0W4vxJK3aWnykvY+Nc0CKD4kx+La3IdW0YPuI3
         JUg8fiDHeEsF6xDVh9SL2IOrCW+PENvcVjlX12Ea3v/DQy1hR0Ddiqclo32OGpv9BrVV
         +nFwRAbVfUr69BWaWqTDtLTe/pg15+bIN0FlnKEtD9jeXB6C4ZvtPcFKianna5La2xhz
         DxQFno6xdQyBPHPkSXXfsOB602bTRYcgDqel81bbkQ3wQ/h+ClJynxzX4jQm4MSEO/ci
         NwCA==
X-Gm-Message-State: AOJu0YzOkMgZA6bRS0JkxsNq0mKjdXv08OmJgsysiEj8lORN1b11+IAD
	rgqr6CzYNe8apDJ2bOTZST4=
X-Google-Smtp-Source: AGHT+IE5Cb4oRalCjMZQpBv2Qvb3EAIojgwuAgurnfPzGGotvhmzGY7E65P/TqlBpHFwkOco7I+V2Q==
X-Received: by 2002:a25:d56:0:b0:c67:77be:9ad9 with SMTP id 83-20020a250d56000000b00c6777be9ad9mr8584839ybn.30.1691449526389;
        Mon, 07 Aug 2023 16:05:26 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 04/31] mm: Convert pmd_pgtable_page() callers to use pmd_ptdesc()
Date: Mon,  7 Aug 2023 16:04:46 -0700
Message-Id: <20230807230513.102486-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Converts internal pmd_pgtable_page() callers to use pmd_ptdesc(). This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 54dc176b90ea..f6d14a5fe747 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2990,7 +2990,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -3009,7 +3009,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1


