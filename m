Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E24760880
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569404.890097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9e8-00084r-2u; Tue, 25 Jul 2023 04:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569404.890097; Tue, 25 Jul 2023 04:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9e7-0007ub-EA; Tue, 25 Jul 2023 04:27:39 +0000
Received: by outflank-mailman (input) for mailman id 569404;
 Tue, 25 Jul 2023 04:27:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Yn-00023t-Ff
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:22:09 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0d3524d-2aa2-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 06:22:07 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-ca3cc52ee62so5589361276.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:22:07 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:22:06 -0700 (PDT)
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
X-Inumbo-ID: d0d3524d-2aa2-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258926; x=1690863726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9EaWELDe99nUon5K3Z+iJo2yPeaFSzyCnD+eyoagSI=;
        b=qNSUsqiVKVB0ESH5eMh2318rltbeTzVNrLxONrPQx/nleyciLPoBJAEyvEQiA5s1Tn
         685R6sAh2RRkBOJ+dHhwwHaTsDfn1Dq0fhp7maY379FRtPvlZFAioZBWPPk7fa1Wkq01
         qN75vY9UJqWiLkOixY4L6XdTPAaqKlrcR9SWRLlUZxoXjG975sFhxm21WZutHmQKl3h2
         OQ9WcHoISTJ2OjIGWYQNx9W6xFSNLrPRAFCGXfmCK8TcPNzYvmKngSTkC45cBTIzIEjY
         73sY0YERl7Ohg+xplAh/xTNZowvdAeC+fipfIzPvDIC0nmap4j6fccJNDYEXWoxWM6gV
         WCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258926; x=1690863726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9EaWELDe99nUon5K3Z+iJo2yPeaFSzyCnD+eyoagSI=;
        b=Y9wNrbvL70mI3JZ/FpbnHifSdQG+K3aotMRMI3eZ0vsLZIhdkajifHfyYsD6qxVd4u
         W1depxxsTVEz271DNPXYFqyquxz0deK45vlUCpiKNRo82usQ+2RY3rLnO74hMuq9Uaza
         57vUtYhE5eJtmPL5JcgJSLPb3a9xENCyERoOEiyGuyHQmBhiyu1VwlEvuThr5JlPb1gd
         Fl527tD5+1xwdi6kmzWntIyLJedNVtMVfxr29/LzlUPQab5fByu71JC36AjfFUBK0nU0
         zWclTNs9ASMiGhUpw4kS3gSEZNIzMKmRPs5Zo1WxsKwCy1WisYprCUDRXr43QfS+joZM
         qvVA==
X-Gm-Message-State: ABy/qLZPvwmUhbJP0hqu3kKiUc0+ecV9fI/Ai3zHHeCQOx+swfhls6/6
	QE4KO4+0R2nwOQj1UaZTOdE=
X-Google-Smtp-Source: APBJJlEYsYvwES4yIHo2kt7NPKD5Twgr2oGLJnzn9f7qzh6ZvPXJtQdH1+pOAmNJT4cd1ABpvr+wDQ==
X-Received: by 2002:a5b:88e:0:b0:d0e:3831:fa2b with SMTP id e14-20020a5b088e000000b00d0e3831fa2bmr4772882ybq.62.1690258926669;
        Mon, 24 Jul 2023 21:22:06 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 28/31] sparc64: Convert various functions to use ptdescs
Date: Mon, 24 Jul 2023 21:20:48 -0700
Message-Id: <20230725042051.36691-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sparc/mm/init_64.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 0d7fd793924c..9a63a3e08e40 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2893,14 +2893,15 @@ pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
-	struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	if (!page)
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);
+
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
+	if (!pagetable_pte_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
-	return (pte_t *) page_address(page);
+	return ptdesc_address(ptdesc);
 }
 
 void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
@@ -2910,10 +2911,10 @@ void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 
 static void __pte_free(pgtable_t pte)
 {
-	struct page *page = virt_to_page(pte);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pte);
 
-	pgtable_pte_page_dtor(page);
-	__free_page(page);
+	pagetable_pte_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 void pte_free(struct mm_struct *mm, pgtable_t pte)
-- 
2.40.1


