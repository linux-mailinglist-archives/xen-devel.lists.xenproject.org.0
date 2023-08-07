Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56FD7733EE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579028.906880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Ju-0001Zr-GL; Mon, 07 Aug 2023 23:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579028.906880; Mon, 07 Aug 2023 23:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Ju-0001W8-94; Mon, 07 Aug 2023 23:07:26 +0000
Received: by outflank-mailman (input) for mailman id 579028;
 Mon, 07 Aug 2023 23:07:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9IX-0001NY-QJ
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:06:01 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f900bb6b-3576-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 01:06:00 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-ccc462deca6so5489249276.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:06:00 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:05:58 -0700 (PDT)
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
X-Inumbo-ID: f900bb6b-3576-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449559; x=1692054359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5tIdqLMLMEIndKmulGbjbVGcWP2eiFuISuM6iDOZlQ=;
        b=gXJTXcEvyVT7IoetVDXBwB8IPw8UIwzytrLAqRYME0pNQ9C4uggCnI6RPeBYUmiABc
         NGa1RjP9x6Az35hUll5l4sYYgp98uBkULFey+10bJthE9R/J1BfMB4fjSuNmCpJ1YXG1
         ARmLg59bINaXUvevzM80HySnkL9LRFKwNZ83rXMUa4P0U6g1vYwZDB00ToF81qaBEF1+
         SCcl4G/9B02tlTVDHjLxfkMGL5hqppCgW9NlCKGjCO3XjVlW37imlXi2cPPjZHQnQLsK
         WyhHmorW6P7DI7CdyMJrfi88WQs4xcY1ld9fhabvXIyG+tqrpY5PfVFDlBq81eHbR+r8
         HFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449559; x=1692054359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5tIdqLMLMEIndKmulGbjbVGcWP2eiFuISuM6iDOZlQ=;
        b=gkD9ekUaNLWPR3V0R10oJGlEqbMJI2Qe7P8Nhm5QO/v7G615w+e17bvT2yIslJXlKf
         Os1hzWO1hqUW2M9qS/8tBZVoRWh0LHSkgKNEzm7rNTNG9T7IWBIMGzKSPN2rPQ0hIiU/
         Vn0LcQgueRBEfQQ6EPvFJdgISXJ1nR4qsY828pVZKXKXrV4wGpMDxiwQlFn66O+3RGra
         w+v12PzZdPnqsTfF4rFk4VnPxBqZh31GOw7cLIjoGh8t8yL7im0NLpcut+ZaXK09sEnw
         UR34G2qKT2Fvt0L2Zcw158tWGXR/lDNYcw/4Pfdrf6VYZRobo52enAPTwk+yGz2cyipZ
         Z/XQ==
X-Gm-Message-State: AOJu0YwJ/nhdK1OSskJX0PEFNciCEEF5cMlun6yTOvrdAQyLciR8dok5
	lVLc5hHQmgLR8hzzOSmDed4=
X-Google-Smtp-Source: AGHT+IHgbeu9fOmMS+FNlr/kvyOX24cSJUZ4nRlF6aWfNWe7W/NjYriU1Zmx+jVELg0QXXl18qiXKg==
X-Received: by 2002:a25:4b81:0:b0:d4b:ec36:bb85 with SMTP id y123-20020a254b81000000b00d4bec36bb85mr7290071yba.50.1691449559015;
        Mon, 07 Aug 2023 16:05:59 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 20/31] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  7 Aug 2023 16:05:02 -0700
Message-Id: <20230807230513.102486-21-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
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


