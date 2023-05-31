Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 576FC718D48
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:37:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542062.845589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVn-0008Iv-1q; Wed, 31 May 2023 21:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542062.845589; Wed, 31 May 2023 21:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVm-0008Ed-K2; Wed, 31 May 2023 21:37:42 +0000
Received: by outflank-mailman (input) for mailman id 542062;
 Wed, 31 May 2023 21:37:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQF-0006xu-Jx
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:59 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90da08c3-fffa-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 23:31:55 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5659d85876dso736997b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:55 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:54 -0700 (PDT)
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
X-Inumbo-ID: 90da08c3-fffa-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568715; x=1688160715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELrYSGf3rZcM0SKncNLanyoUH1rFlxcI1YjdtaAHWOM=;
        b=HVGvjPguQLfPfWkiro39nbW+VW4H5uAeLDGXOc+QtDych5ss5NctDwcG9I1c/6SDfz
         APKwygjUx+f7skr0RtKISqSCz+AX9pojhDKoYcMCQyYniYHupBRU0wOHCUoFqOcXQqMh
         s5WPVmf9msAVfThs98QJDhYbBO3Us7PGfZ8s6z4W61niHbKtctIY2nt8en5Qr8xNSORH
         CbV2Bk80OmBOMZ+UG2sJggDfKIMsAz+S52UtEmTBG7rQO3TOu+Ov8Sc+TVK0fDYwDx9u
         QGgal0w97o+Ln3oc2qepS23J75YM3y/Dwt4cq4bO+YUzmRNBHe7fo14HmAPdP2J5Q06p
         Rhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568715; x=1688160715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELrYSGf3rZcM0SKncNLanyoUH1rFlxcI1YjdtaAHWOM=;
        b=K6ShitWdQwfsoUTLBBQZ2NoJ3/E/6nuOABSOWNsC8RhUIoQi6gs9HV97Hy9h32CukG
         +Xo3zOlhyHGDkkzv/C6NHpes7KBUvAhBFIszL+mPw+96upbqEyZmsQLX0XMyQo3aY+Kj
         eb+FZ0O77QG+ZTCtKhcLyZS6IMZVdQ9zdzV5Z6Uk48J+2bpk8MCt1xidGixffffE85CZ
         QGx9GvcanqTo+vZKSUuDsnhi63KP/2Gcc+SP0e6JpH40j6+vBrfgE1skOeI0g97YUrot
         1lkYCEpvk66ASyRxFzS7Wj53lMLgcbZgmWEHiHCfvMAP6/v+ibDXDOeTl5//gFvmR0ph
         b4bw==
X-Gm-Message-State: AC+VfDzfFVAIlFiIo+LbJYo9S6JHYTTDpdv6fM+So6Ezlgh73UShxIHv
	NJEbOPTn9bv0r6AoP4PrJYY=
X-Google-Smtp-Source: ACHHUZ7KZYp2khjpsM/eLpOUxorXRdnAb+nMmuGE16o93fcYthDjjOgaXk5MabZ2W/EzUmWY8vgN2A==
X-Received: by 2002:a81:6f06:0:b0:565:cef7:92d2 with SMTP id k6-20020a816f06000000b00565cef792d2mr6456173ywc.21.1685568714840;
        Wed, 31 May 2023 14:31:54 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v3 23/34] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:21 -0700
Message-Id: <20230531213032.25338-24-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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


