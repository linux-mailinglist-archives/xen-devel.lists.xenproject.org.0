Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E4873F214
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555725.867771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEk-0003ep-Lp; Tue, 27 Jun 2023 03:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555725.867771; Tue, 27 Jun 2023 03:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzEk-0003ZM-Fp; Tue, 27 Jun 2023 03:19:26 +0000
Received: by outflank-mailman (input) for mailman id 555725;
 Tue, 27 Jun 2023 03:19:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzBW-0003pv-Pk
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:16:06 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3e14531-1498-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 05:16:06 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-573491c4deeso42155297b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:16:06 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:16:04 -0700 (PDT)
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
X-Inumbo-ID: f3e14531-1498-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835765; x=1690427765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=e60Y6sevaT4oQ/L5KuHLcNtraCcaqymJSw0Pta6sshcpf6ZZ6QManSmR0ZQpDOB1TG
         Zv6Fux3N6RAGTYaqlaV6L/vXV7y5TNrp+A8hP8/1TroaBlBjnjU2829v3J+cnc+AhOb5
         JN+Np+61YaCNuusYO6cIWgMGGdhyo7H5wD/egNG2vy+zzD2dD0OPETzsjKXbKfq9Y/2e
         UqWfUGJ07+JZFMPC47CCL6nCuIIVod63+MvhTRgj6G4ml0xqLiHcn4xnMK5EG5kSpCpR
         IaKEXBQ7G4bgWt8P3QrMWU+dPATv19IcGEhHsTfe2EI7sEKEiwRzexwBCQnzrxDWjBM/
         K5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835765; x=1690427765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=ljwqEljY3+C8w7so66jpy+7l9ZZvA5JDSg39WKCDH4y+TsH2wdnYsTddrzn3uNdc7v
         3ISblIMUd76gxcxAmBA4a7ImlkzzUQ/aCeIUzx2ek326wuJYmpgpn+oTCjNTSzdekKb4
         wYRJyonuY+4RValuz2/PXhIQspAxoQOXAlFGIG7ha+ag4/yW+Xu9nnfD0hjzKlc45Hw9
         n4lgdkQNemwv+daLEYYFKAklTa4jEOmtBe1bW21MQF1VzqAStcHBZLklPAEY5zhy6Rhl
         u4AzUKv9rImCHKyCfKHMUgojIRKyNuTt8n8hRdJZr6vsS8DHbXvAwIGQ9Nip8AhiA6ta
         RDiA==
X-Gm-Message-State: AC+VfDxOvL8rom3FzIcPC36LzOmPxV2Z+HZszX9yhde3xTxkYV1hcpia
	MRGBP5eOeLs0JfXUcTjRGEw=
X-Google-Smtp-Source: ACHHUZ5DGQdkUnjmZtvUypsIHEbjelQEN0sIFmuzviWoifvHBxszYaVoeD06anXcP6T6X+bEflb+Ug==
X-Received: by 2002:a0d:fb86:0:b0:573:5071:2a12 with SMTP id l128-20020a0dfb86000000b0057350712a12mr24368068ywf.18.1687835764817;
        Mon, 26 Jun 2023 20:16:04 -0700 (PDT)
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
Subject: [PATCH v6 27/33] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:25 -0700
Message-Id: <20230627031431.29653-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/openrisc/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index b7b2b8d16fad..c6a73772a546 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -66,10 +66,10 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)	\
-do {					\
-	pgtable_pte_page_dtor(pte);	\
-	tlb_remove_page((tlb), (pte));	\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1


