Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25A6760875
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569384.889979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9dq-0003TZ-KN; Tue, 25 Jul 2023 04:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569384.889979; Tue, 25 Jul 2023 04:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9dq-0003Lj-AQ; Tue, 25 Jul 2023 04:27:22 +0000
Received: by outflank-mailman (input) for mailman id 569384;
 Tue, 25 Jul 2023 04:27:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Yj-0002Iw-Ua
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:22:05 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf77cfc5-2aa2-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 06:22:05 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-c5ffb6cda23so5568569276.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:22:05 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:22:04 -0700 (PDT)
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
X-Inumbo-ID: cf77cfc5-2aa2-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258924; x=1690863724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=GBQqKOXR4MY0Ps6Ytzn9QjLc5kcnNARqYVMOSqCl4nxxP5zueTINjr7iMbjZhk8uU1
         uF+ZNdDLWemlb8QXVTn60jLorPF4KaxuajyPq7XQ8ZCUpgrsfyxcNU4aZsjJHBdfgv4V
         f3SehFOrdMCWYaV3GNfOxXZlwwtfQps2pLwSnw0r1MZbny4VXC0cZl+5ECg/uwswSkJJ
         2spe5/EA1yI0VqTuQ1Drr9GEQcMwkhM/FKbElCEbuZdJkSdi81Zbahgosic5IMYJMWsY
         zz7YF2FVGFBOrfl6ZnWHbV39qhmx668oKEAvnRRKMjMLLqABK50UfsT2Oc13y2cvxYxd
         xuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258924; x=1690863724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=PMRaDkoZNCaRbOaRnbUN1wAVrRs8iX+YHSchPqsiocZvhRdOy8wYtNgevBws4Sbs0H
         7xIzR8EdHmuNk9agLw4vYvRcqbXPECowF34pzupimFPTIVA+V7nB/uIZAixebOIMA49K
         OfN17x2J4oU4r6H/Qn6bJHKJsp1f3LC1ThKDyAGxNN3RF4W9EQ/EkvEpTewbY9H5pgBc
         heMCgrwwGorb5gMWBs9EwBC3kQa9J/zvs006ZIZ5rDSUYjC2YZuduOXMexTLj5j9JQeH
         FvKunre9VgmNp66R3UCq7jODMCaT0gv9FpiUBNJAriq27pRd7I5jkgtoXDXK3c2ut2qk
         yZOQ==
X-Gm-Message-State: ABy/qLYeI5x3v0In8PF+YQxGSwUzdyzXnoglttRqYhgEEXcHdW1CDfK8
	9Wa97c4K7bab9TDLq/jLYiw=
X-Google-Smtp-Source: APBJJlFIEKBO4FnrV/9ajkbTKUo/vEdRCYW7kk6X3z3g19puIv3mx6us1kMtRHRFLnY2I/2ODsKhEw==
X-Received: by 2002:a25:2309:0:b0:d0d:2d82:7a27 with SMTP id j9-20020a252309000000b00d0d2d827a27mr4389099ybj.13.1690258924402;
        Mon, 24 Jul 2023 21:22:04 -0700 (PDT)
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 27/31] sh: Convert pte_free_tlb() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:47 -0700
Message-Id: <20230725042051.36691-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
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


