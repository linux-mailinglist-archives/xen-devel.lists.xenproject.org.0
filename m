Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C0769EB1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573288.897894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWMn-0008C6-Sg; Mon, 31 Jul 2023 17:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573288.897894; Mon, 31 Jul 2023 17:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWMn-0008A7-PM; Mon, 31 Jul 2023 17:07:33 +0000
Received: by outflank-mailman (input) for mailman id 573288;
 Mon, 31 Jul 2023 17:07:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJh-0008Np-12
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:04:21 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 497bac55-2fc4-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 19:04:19 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-d3522283441so604497276.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:04:19 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:04:17 -0700 (PDT)
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
X-Inumbo-ID: 497bac55-2fc4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823058; x=1691427858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=LZWvv3P5ObD312NoT3HCx6hT2mcipY2zu8mSMdCIx/PBIBw4fnj2ZRkQKvrh+bnMcb
         cAhsWuRoUJhfVjNPelqZekFAhbwYfyzvXSZQKgwb66CUaJSig1RixymjgB6EpjMZeG9i
         TPX/SETFM0d6TUT+vW8F9GlkDQXYjB62fk/7jUTcwacjm8I/TfM4mDRrCt1nWg7/91vP
         laynl0EMAor5eoXfG6EYJS8WyMBq5PEy+tqv6UFYxDYMRASimm9gjZvXzBE5l6AVAiGx
         CLfIZvVLYDlmtO9VH/rc+XPRyyAblWv0VbvnMMW+5OEC9ZkYXTzgntXD+ElukV+Op4w9
         X05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823058; x=1691427858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=CWeCW5w+vKdXj3Odt6xYFH6K42vBMgsjZGIImGPYhS/ipLx89Nd0CY2hPuOtn2WI5p
         eia88g42HRTdevy4vQamn1qr76hDX1V5W68t8cdJ4G3PB6T8KXTBluCx4+P42IsKwlud
         8lAkpUtJjLj/EpRlFfuho0i8qQsIPJfrVerqjbn6m3v/ZIojJfLiiZnAs7Z9I+ZjZ5wV
         h1xVm7CRokWXKJ94vTKp/UzW/equBB7sC/aLGNiNxwrgrx+BWpwqWcfc+N8upDfCSZ4p
         BCoZZcKV2Qy5faKss/HBbPIrrWfM3OAs1lEGN4XOeH5cCir33a1vy63VkggoxnkO+ukM
         jKYw==
X-Gm-Message-State: ABy/qLZwfxfDzoKw4P2P3bAs5fLk0LIzdMMsZjs6mgkyAp56ue4gea+l
	xnZtjV+COjPuJTw8+r5hDLc=
X-Google-Smtp-Source: APBJJlHweyU7H3TneHig7w5n/DLDjL/9e2cIxm5cNvwqW36o28cnjEbZQWmE0nZHXnpgzHbA2ayWvQ==
X-Received: by 2002:a25:acd2:0:b0:c6d:f875:520e with SMTP id x18-20020a25acd2000000b00c6df875520emr7715191ybd.49.1690823058269;
        Mon, 31 Jul 2023 10:04:18 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 20/31] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:21 -0700
Message-Id: <20230731170332.69404-21-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
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


