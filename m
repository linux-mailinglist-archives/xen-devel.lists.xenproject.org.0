Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4825D773417
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579050.906960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9K4-0003ni-Jf; Mon, 07 Aug 2023 23:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579050.906960; Mon, 07 Aug 2023 23:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9K3-0003cz-F1; Mon, 07 Aug 2023 23:07:35 +0000
Received: by outflank-mailman (input) for mailman id 579050;
 Mon, 07 Aug 2023 23:07:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9Iq-0001NY-UO
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:06:20 +0000
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [2607:f8b0:4864:20::b2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02166de8-3577-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 01:06:15 +0200 (CEST)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d35e565071aso5316994276.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:06:15 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:06:13 -0700 (PDT)
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
X-Inumbo-ID: 02166de8-3577-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449574; x=1692054374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuJFa6mAGFwbCAvFBsdWEeQAHJIQ94yaq1s2El5pO5M=;
        b=sRCgndxFhKIflL3dRUOciVixuY3um2CsOH9mqCT4RfpcBNQLoC/2xIlVP2BC0LrRXg
         d0Mfnrp8G1Gq70+B6oCgBqzc+N7zHH9xY0+av47l7B8CO6Tt+n9pMVSoswf5Jzx8/yzy
         NzCNQAVK/Lkid61qiT1qq4e/dSW3T9N7fVh6BXy/whyNG/50NiRv4160ULtNDt7ZAJ8u
         ZEinV12wAdQdY0FHQSDiTfa7/P6pGvAR+Q1UWR0j31w4+0ktiAC1WT1q41QbYEtl/+hQ
         cKdjsvUfk2w2q52f0mVtR4dPNDq1UHAYwd2r0wZzmsP36I/aPnhCen/ej73PJ82E0WBs
         UQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449574; x=1692054374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuJFa6mAGFwbCAvFBsdWEeQAHJIQ94yaq1s2El5pO5M=;
        b=eP73u68iz/XkUBtQth2GLzzDIlRRYimRvnFL5lIORo+4MPV0MYnel5V1YXQY8lTqXP
         5j6LieBA4LpWsH4U3Xc/QxE6/8NVRFqgmkLmr0THWnb/zlOJxPZEEIC2JINpZgLnna/m
         KUo1vXLG/CSKOCrglxJmTZyyIwGjtBLtJWhhlLp+97rqEK4/8WiR5a/iWloQ8KFHgiC8
         L5CvwlWI7NBOyO6R4mGTSbABmTyhpba4UdGVSx+Xhrk7ho9OJGc4z/DNBtEz2fsUaIUM
         eogrMcR/Lp/0WFmmwIxph02qjtFf8sHwHEo5mbvsgvaxOcEHKqyyk6HLHCFjqtcZVZMG
         bbNQ==
X-Gm-Message-State: AOJu0YyqAGmlSSY2n6O9O+OXfFXEsEgLeo0VtDlY2vcshUr/Mymor726
	72/cqWEVpUZ07nCvBzsaQXM=
X-Google-Smtp-Source: AGHT+IHDPhUgl52q/fREvy7LWtCvyksQLzlkWI4tWrtb//A8NgqAG/s+XL1YOkSBACmJ6FF0msS3mA==
X-Received: by 2002:a25:4081:0:b0:d4c:82ff:7bde with SMTP id n123-20020a254081000000b00d4c82ff7bdemr6684894yba.63.1691449574044;
        Mon, 07 Aug 2023 16:06:14 -0700 (PDT)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v9 27/31] sh: Convert pte_free_tlb() to use ptdescs
Date: Mon,  7 Aug 2023 16:05:09 -0700
Message-Id: <20230807230513.102486-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sh/include/asm/pgalloc.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index a9e98233c4d4..5d8577ab1591 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_SH_PGALLOC_H
 #define __ASM_SH_PGALLOC_H
 
+#include <linux/mm.h>
 #include <asm/page.h>
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
@@ -31,10 +32,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
-#define __pte_free_tlb(tlb,pte,addr)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
-- 
2.40.1


