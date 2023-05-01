Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827236F3854
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528226.821160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZNf-0000jm-EJ; Mon, 01 May 2023 19:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528226.821160; Mon, 01 May 2023 19:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZNf-0000hr-Af; Mon, 01 May 2023 19:40:15 +0000
Received: by outflank-mailman (input) for mailman id 528226;
 Mon, 01 May 2023 19:40:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZDG-0006PY-PR
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:29:30 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 779418c1-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:29:18 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-64115eef620so29041064b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:29:18 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:29:17 -0700 (PDT)
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
X-Inumbo-ID: 779418c1-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969358; x=1685561358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aCjEZJk/he0B507v8WHbAo+ayyw9u0whNe5hSh1Qc0=;
        b=AK+jJQIndwyipvZ3j74RRrDCnGWb55RfRTFZCAj1QjfEP6JtcEnkxab8VHfUxlnJqD
         nzyDIYAX6jvOrQqc9g/TswPCkcqNA0B0b+SVKLMEmNApHkelPozzZarkoTrP2UobldQU
         E6NqDV1CfueV3wQaPICMNftiMflroUHircwtbGv3hyeRwqO/KqZCxi3BNAP0dk8lYID7
         5OwqBACQpi+nvrf0goZMdOfhVuRwRiXsUHvkFH+vRl0eIOaoeix6IqEc2ZJsYZWlONhr
         qoO4S8rXijotpMJHxa1FWYbjKdY7R5WGEGDzLNmBq3rOIwjAHcvHuIBKVpOdfgv+tSJ1
         RDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969358; x=1685561358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aCjEZJk/he0B507v8WHbAo+ayyw9u0whNe5hSh1Qc0=;
        b=Lwm2/iKMyBKzWHFDNT6CQbT9wNIicJcXr9GFV6oipIRBsFPN8R2qwceOk3GDbzvpuQ
         WmvCpykB0c0dgcUhmLcv52tpOH1bUCdbCn53cvy/KZJusFiLvWgpb29VCUukRknAMrFC
         nm5eTm7DtHVWrf2ngjXqqjlNNawv2+HmdplDgDE+iR/TvThw74/rkTOlYmp7BXAo5DU3
         1qxu1ZZkIoJwUfhoJBggXznvm5xkg6pjgSODZUiRUmI0kEF+VnPzTE64vLyKqgGZWHwM
         +Wxci3lrkutYk8P/j5J4NlAYMTaCFnNZu1CBFe8w5lmYdrKRJOAVK9JeIapTftwk9zgX
         IYIQ==
X-Gm-Message-State: AC+VfDz+folEUK9Hc4TJqDjDFc5V9SfY+0DgA2EWzbNc4xwWE+kNeibH
	xjGlR4RNbYlNAh8n7bQc55Q=
X-Google-Smtp-Source: ACHHUZ6t8R71ld5pjw9YJiJ63m1PjvmCLBjw2ONvK02V0vikRtqecj56I+goZm4GypngOeaNmv5J/w==
X-Received: by 2002:a17:903:2307:b0:19a:96ea:3850 with SMTP id d7-20020a170903230700b0019a96ea3850mr18111173plh.17.1682969358236;
        Mon, 01 May 2023 12:29:18 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH v2 30/34] sh: Convert pte_free_tlb() to use ptdescs
Date: Mon,  1 May 2023 12:28:25 -0700
Message-Id: <20230501192829.17086-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sh/include/asm/pgalloc.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index a9e98233c4d4..ce2ba99dbd84 100644
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
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
-- 
2.39.2


