Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB386718D54
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542077.845639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVw-0001uk-Kx; Wed, 31 May 2023 21:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542077.845639; Wed, 31 May 2023 21:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TVv-0001U9-Na; Wed, 31 May 2023 21:37:51 +0000
Received: by outflank-mailman (input) for mailman id 542077;
 Wed, 31 May 2023 21:37:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQN-0006zB-DH
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:32:07 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 969a615b-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:32:05 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-568a1011488so975227b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:32:05 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:32:04 -0700 (PDT)
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
X-Inumbo-ID: 969a615b-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568725; x=1688160725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1x1J4vur13K6ienQiLVxExje9aLbKUsjVFvIhcqO10=;
        b=R4JOyFF5oGis8NxGU8pSpePc9JPXMsijgUHIihoBFDMX7vxfyfSgK9gS7L9vsvgMnj
         MoFYSUO2hucvt6EXtvpP7cclM0FlcdhnlFMXLdspy+TrRtUW4byNtMBbPaBMOtheTLzo
         JyXpw6dclXVn5TBmIUwO4ll+Dwj2sxioBm1tcLfW7tR6/lFa3tmkjwZ+b2UxBU9kd/xU
         9674/17mKjyw9zKVkY7JTqJdm8j6Ukk6MApKOQVf0MMoClbBMESl6AhiCYUKK1tGclZh
         a/IF0OWr+we0YPVHDLrOdoGrQ5ob2G14WJkmdrRtqm2pP0cB8C0ATsRWLlC+f5L22Z3U
         c7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568725; x=1688160725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1x1J4vur13K6ienQiLVxExje9aLbKUsjVFvIhcqO10=;
        b=FGjWt5b+RoXcyDZ5F2vIItGv2Mt9DWqJyqCCaC148MbmzwFLREZZ4bOMbDUQL8zVpb
         4aY8bt+NmkS/Wg8F0I3dPYxFtANM28SHqK4BsdtNmvw7LaH/ujDwce/C2DHT9kdDF2qp
         Og/v+KHr56ubnuUf76sAis7hZylheu5DrqZ5FNRFlGzw6f1X0csYEVAI34DnQliHEvGc
         g05/hxHFGycJSFt0LJFOqy8fSQ3t5F5FXH5MMkSkyMcU6XAt02t1DFlxqDJUZJHgxRjm
         5sAWIXyEhHryM3MOa9ujmGIv/rjitrLFV+4Bhlq6wRe3TckyObtd2djCaMEDsmqWW4cv
         HgIw==
X-Gm-Message-State: AC+VfDxJ7yGvRo6XzZgfvaz5a7soyluiQ8nJkzIi+KX2RxCTIJZKKoQk
	G3ZuZCWSkua4heSoAMeXzDs=
X-Google-Smtp-Source: ACHHUZ7OmIDubddXjmsfBoe/XagN9Nq+I2v1lq5kjayLp/xLt6wDO/g4P/XIV7x6OHxU5ctdplxcBg==
X-Received: by 2002:a81:d246:0:b0:565:9d27:c5e0 with SMTP id m6-20020a81d246000000b005659d27c5e0mr8010590ywl.2.1685568724694;
        Wed, 31 May 2023 14:32:04 -0700 (PDT)
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
	Jonas Bonn <jonas@southpole.se>
Subject: [PATCH v3 28/34] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:26 -0700
Message-Id: <20230531213032.25338-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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


