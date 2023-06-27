Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F7173F21F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555731.867791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEn-0004EF-GQ; Tue, 27 Jun 2023 03:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555731.867791; Tue, 27 Jun 2023 03:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEn-0004Bi-9J; Tue, 27 Jun 2023 03:19:29 +0000
Received: by outflank-mailman (input) for mailman id 555731;
 Tue, 27 Jun 2023 03:19:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzBL-0003pv-MZ
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:15:55 +0000
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [2607:f8b0:4864:20::112c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec6adde9-1498-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 05:15:54 +0200 (CEST)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5703d12ab9aso42009247b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:15:53 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:15:52 -0700 (PDT)
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
X-Inumbo-ID: ec6adde9-1498-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835752; x=1690427752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=Z2y492L3/D8WlJ5Hq0dqKp0BKJYUW7Eb9G7qdf3vIGRQ+O8SF6z7cY8de1pnrMmDqQ
         +a96x8kX3opEhwfyHnlNFTWX5OwZauzWBj6C4ouPJiZfrfA0EmnR4gOkOWCXT0Tt5rk7
         XHfLS6CI7/qHcQlfDrYckrQudKqfd53TugdHSOAC54JEXTOgwU9ogsxc/TSIilUUybaL
         /EAuzpcVE6dEZDr0iMV3l0ZL5CrHH5SQ2tSWsVIXTRE6S7JRWuiJGvbxR8kbv1x+D3dj
         SKo4oZP9xKp5iaeAAmMvP/qF+1bKjojF2HvsjQLLw57QGCxHLxvjF/rVFYkYGLWd7pTO
         F1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835752; x=1690427752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=Kt7KlCMTg4yoCDOyYINypC+RMs3PxyIMv/A/+xOemAMTHXfng25xv1OssnyPGS/T3W
         DK1JomRD0qx+TmRTEnqX2emKWX56KNJOiU2rOa5VRiwp7NSj0WX7YjuEf8ptoBSewuUf
         2dv8UAx+9NYj8lknXCWUu+RDdkuXifq2d702C5odifl/M8/UxWR0k9tiy6XMrEn/zXHJ
         SBq8AfIh9WR+IEuAQH2i4SmpAT0J6rPjxAVN1oeyA6PsB0N37S8z21VIZg8vKxu20gPl
         GBCBTLIhOYwYPlKFEVfHqh5eCBHkK5gWE8f/pqLLLjTsnWPkwbLzw54Ia97mQiJ4huNm
         XuVA==
X-Gm-Message-State: AC+VfDw/LJeIo1d6J2pKlXxRTuHgiDFNQxI/XmLuF6EdSW3wmRORhP9f
	gUrnyeK0dVDN23STN4Iiu+c=
X-Google-Smtp-Source: ACHHUZ5CQK8kRHJUPJM2uDCPFRj7p03JLp7keUZBkce6O+8d/iMl0gg4/oyJxvTRdTEHePf390CKKQ==
X-Received: by 2002:a81:4689:0:b0:573:9751:ad15 with SMTP id t131-20020a814689000000b005739751ad15mr18645821ywa.17.1687835752283;
        Mon, 26 Jun 2023 20:15:52 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v6 21/33] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:19 -0700
Message-Id: <20230627031431.29653-22-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..9c84c9012e53 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	pagetable_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.40.1


