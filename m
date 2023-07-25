Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E1C76076C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569358.889833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Xz-00038c-GK; Tue, 25 Jul 2023 04:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569358.889833; Tue, 25 Jul 2023 04:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Xz-000367-AE; Tue, 25 Jul 2023 04:21:19 +0000
Received: by outflank-mailman (input) for mailman id 569358;
 Tue, 25 Jul 2023 04:21:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Xy-00023t-Ao
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:18 +0000
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b22ac632-2aa2-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 06:21:16 +0200 (CEST)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-c5cf26e9669so4296593276.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:16 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:14 -0700 (PDT)
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
X-Inumbo-ID: b22ac632-2aa2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258875; x=1690863675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUMUqbW/uAIHfn0G4toP3JCuPKsaNgXF+JjYaBSaBaw=;
        b=p9s9prTX9rn/wpC0IRJR9+orYvMKxIQqYiO/2qc1ucIOxNaOErt5vfdpNKxEU6T/vv
         +2unp610u7/KZK91WoTQLcBH/VtkD3XUQxHC44CLkqpLaHmHFzgBPOO6uWyO/3jX9Xgf
         76GcUW4UU7BHeMr+SY/V25wW6PaanozuCo4EhC7wsdhYIlQKIrWatw16Z/wgKznB+Orn
         ruoMSNrGoRWxyM/OJxGteQSORJl7RZHeZVq6QR7pMySplhmG3+tZ02+FH1KXAFJgXdGU
         XCaHvNOv6BykhfTtnLqNaZvGHZmQ1vFu3nRlDk8gtK37Li+LTW7MffEEWNWOsyB37y52
         60nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258875; x=1690863675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUMUqbW/uAIHfn0G4toP3JCuPKsaNgXF+JjYaBSaBaw=;
        b=iO9WDfRD8Q07KOIskDZt8rKlNEWbLK3W/HBVdnoNFwpY9GT+FGlKq7JcPb+MzPLhs3
         2wZcxAa+J1BwAZKk80mgqfYeCwrQTa9XgPYvGHWTYbbCV2rA3jGS3FoW69P/NgX2GUF+
         PzKarrPihy1qaNqBBxA6dtui1zywO2P2geBD2DeMXO0ep8DIbVcVwngUTiNPmAZBWx0V
         57ZWUCUEjqQRgnongZGcZq7Nxcwwd+6KxdS5l+G9Jf2p0xZWKWrB/v+Z5PnngAQ1evzL
         u23M3ETMkUxeHc35XJxBzKD5lASWiSN/dztESkuHxe53Ac2UN+oiS2d5NhH1gKW82ThQ
         Up+g==
X-Gm-Message-State: ABy/qLay5YkkYGmwKe0Af5bG5p5cImoeIT8lfnUfIgr7i9wojgS6lSGx
	6yF6aTdQxJcT/A0qd/9cxSc=
X-Google-Smtp-Source: APBJJlEMSP0J8OF6O819F/tTFVo5KNWedtuWn+u3qsGgdRhWZk0PUYcaZVFlVCsLViSNb2GRnqh20Q==
X-Received: by 2002:a25:6b45:0:b0:d10:68c5:233e with SMTP id o5-20020a256b45000000b00d1068c5233emr4343866ybm.60.1690258875202;
        Mon, 24 Jul 2023 21:21:15 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 04/31] mm: Convert pmd_pgtable_page() callers to use pmd_ptdesc()
Date: Mon, 24 Jul 2023 21:20:24 -0700
Message-Id: <20230725042051.36691-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Converts internal pmd_pgtable_page() callers to use pmd_ptdesc(). This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3fda0ad41cf2..bf552a106e4a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2971,7 +2971,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -2990,7 +2990,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1


