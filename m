Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A518172D234
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:09:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547544.855119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onF-0001UH-5q; Mon, 12 Jun 2023 21:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547544.855119; Mon, 12 Jun 2023 21:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8onE-0001DC-8M; Mon, 12 Jun 2023 21:09:40 +0000
Received: by outflank-mailman (input) for mailman id 547544;
 Mon, 12 Jun 2023 21:09:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqzT=CA=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q8ojQ-0007V0-Ew
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:05:44 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4bd90bf-0964-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 23:05:44 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-56d549284bbso2191237b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 14:05:44 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 14:05:42 -0700 (PDT)
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
X-Inumbo-ID: e4bd90bf-0964-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603943; x=1689195943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1x1J4vur13K6ienQiLVxExje9aLbKUsjVFvIhcqO10=;
        b=iC1t7ghfm9ecJs1x+mmEzeWS2SIjJKEgK7bxy4oucR/f+MfVZU1qsYKmxWlYK3St5v
         mfNdwnEbyVpOCAZkZBQocohQ9uTAKfouC9/50tiV+ofF8yr/r0xQFvh1fNWAqMX4eSyF
         ymqrJp033zjJJcGcMzZXmmZ/yN236luhBhvJ80nOlgUY6UjLfyMIfHGDH4uYCDgG1Yuw
         Qj+o3ciesPmzibkl2iqbskrx7aUBCJV6cn/sc9mp4OIhLm5DRTHYxNGTzKEY2jXsQ3j0
         sN44pjWt5AeKRt8Gf4eHzyt1HMP4kxf4IL2Kuq0LJJYg24qsvy+zvN4scp5/4UYjNDhu
         bvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603943; x=1689195943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1x1J4vur13K6ienQiLVxExje9aLbKUsjVFvIhcqO10=;
        b=BMcfmk6zeA0i9h+Mh/NpdQIAyrqo8rAVYlvbtcLiFaUOMO1xCXyS+Yh8GVeC4l1yRM
         aLG814unfHNppPj4jo/uysW+ZLpBZuSIhD9z71zFytHeOTFxD1sjluiN2FQ1z3ikbeW5
         eOPefJY1OCPU+x8/jdbzRE+K8/xsqUvst+P+GZHT4t+xxlKlcsvgM7PApOt2oqv0GA/2
         f3Vv1cWJWL3BUJpKksJ6TunWSrYH4YgGxsmEXLBLDqBvHCcwTZ2ACz4CgvxnYwOHJd/t
         Z5+E3II0uf65NRW6vq4Rx0YsSh5lgri/I3l0Wq9aKUgwKS78r6/ZBqElKaQQW7cni4ut
         xvpg==
X-Gm-Message-State: AC+VfDwQDCVMlZeBtygJOPxRJZhSHPSIIpkydc7ZG/eYl/a9LfZxJEfv
	4f4nHmisHwoVxV/AkoKHOBc=
X-Google-Smtp-Source: ACHHUZ6tVrzAvnvTdjXheXo4jZ8pT12rQpXHIkWfs+xqz819sAsyiOSj5h9nxDMqGOKxFovlbUa4wg==
X-Received: by 2002:a81:7542:0:b0:56c:e706:2e04 with SMTP id q63-20020a817542000000b0056ce7062e04mr7796917ywc.0.1686603942966;
        Mon, 12 Jun 2023 14:05:42 -0700 (PDT)
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
	Jonas Bonn <jonas@southpole.se>
Subject: [PATCH v4 28/34] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:17 -0700
Message-Id: <20230612210423.18611-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
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


