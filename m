Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D966E5379
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522414.811853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwL-0002Af-9b; Mon, 17 Apr 2023 20:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522414.811853; Mon, 17 Apr 2023 20:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwK-00023D-MZ; Mon, 17 Apr 2023 20:59:08 +0000
Received: by outflank-mailman (input) for mailman id 522414;
 Mon, 17 Apr 2023 20:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqo-0005M2-Op
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:26 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e63ab257-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:53:26 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id kh6so25754738plb.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:26 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:25 -0700 (PDT)
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
X-Inumbo-ID: e63ab257-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764806; x=1684356806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1imWRfaXT28Tln454VWhUpR4BzNKR6UHESFdZqWEUY0=;
        b=bMzg27GqJpInZYbq5g7DlCbGyMQLVTO8/WaIXUjb9+Y1sP2Yg8U4pzTwcvHRDHiFNW
         xnksAVwNdJxrKURy2fgxnULAI227N9ToKvbiocqPRvOKs7RzP8ExmOpSZqrcqZUrdfu0
         Ly3bYv1kY3GNKQVg3ZctvJCnyIezYAOXblSfIzPoK3U4x0lQOFf2Xm+WIvk4tnnJrN+1
         YHPfjXznGMNehBha6m//o8BZSI/Chio1eErrXl3QeUgRmQPwnQk3cvQT2roiB3zkJZil
         tzHED45+1PigKvsFpmle9q7jl79yHSt/NZKlZjrviShfr3b19IL3cewZ6zZfWBjcahF9
         kN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764806; x=1684356806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1imWRfaXT28Tln454VWhUpR4BzNKR6UHESFdZqWEUY0=;
        b=cK8pwtGGiDn3rBDlIpz3mK6e71n6mP98C4TAOEiqHkaeCeqFC4fGwsS2mugfrf73in
         F6CzG9+bWDBcWgKj6hFRCwyplsFnOLVK9tjFcfMG04dNMqM078rGCU7Z5Yx26ReaJJps
         /XzESYN/lsRlPK+0iCgAB6eYpw9gE69HKGBOMAk87x8SBSPta7ZPbx8f8caxyHMQknfR
         wofU2/EBUsMsULgKrgrMRTJXuTMZzFrWsLGrNYIQZpmDFwMHy1emMHXmw1t94DZiAjbv
         ah/nNjmJ3iNkshn1aPh7OlV8YGkPocYW2e16ZRpxLOb+LYttoi04SC4zcycGfIKfQHbv
         LaYw==
X-Gm-Message-State: AAQBX9e/M/WK5doa7tPgYnB0U5oofYFpYrm37Y+Zp7wzdtp3c3g0OszO
	jYQVKzH4E/SQsvFEivbvncE=
X-Google-Smtp-Source: AKy350Z5+qBQNd0Z/JNfcMKaitdnDjfxbnOB0qE080qoviMZywL0T3VtP+5OcGBInDjHaerFJSFHYg==
X-Received: by 2002:a17:90a:d142:b0:246:5fbb:43bf with SMTP id t2-20020a17090ad14200b002465fbb43bfmr15902207pjw.4.1681764805699;
        Mon, 17 Apr 2023 13:53:25 -0700 (PDT)
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
Subject: [PATCH 29/33] sh: Convert pte_free_tlb() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:44 -0700
Message-Id: <20230417205048.15870-30-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sh/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index a9e98233c4d4..30e1823d2347 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -31,10 +31,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
-#define __pte_free_tlb(tlb,pte,addr)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
-- 
2.39.2


