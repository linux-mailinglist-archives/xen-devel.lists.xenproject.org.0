Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB20273AA45
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 23:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554048.865113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRPB-0004dK-PS; Thu, 22 Jun 2023 20:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554048.865113; Thu, 22 Jun 2023 20:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRPB-0004ZT-ET; Thu, 22 Jun 2023 20:59:49 +0000
Received: by outflank-mailman (input) for mailman id 554048;
 Thu, 22 Jun 2023 20:59:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTT3=CK=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qCRO8-0006Mr-3s
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:58:44 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 916bef5d-113f-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 22:58:42 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-763bd31d223so257173785a.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 13:58:42 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
 by smtp.googlemail.com with ESMTPSA id
 d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:58:41 -0700 (PDT)
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
X-Inumbo-ID: 916bef5d-113f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467521; x=1690059521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=mxSRrVtskejfc/X16Q74dptO75kex0U1BDLuwz97pVRe94MsJ1tXF/mDBi2+KIRPRR
         7frc0Ipdbv1qDfHMpCRO5VQbJ/DKNN2DmrrOctIElaXq4X1eS2wG1MgKx+EEIDm5IE/n
         dhPljY31cmgrHKk6DhfJfpvGe6V9T4MqXnsXF7ZHxbxJIsBPM+C004kDxiRMae/4a+6A
         l/JL+zpf4vx2gyi8iDyTm65oAYm1ZOIjSFK4K+nSdgPKFtV6K4nHQ1K38iP6GDgp4k/p
         RVulC8Jyfz61VS4MiwEinectlQ9R+QOPA/9MgDEtR4kVqNBk2wlMydoonlFLN2E5gAjW
         A4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467521; x=1690059521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=agzz23EoUK/mJQh33t9BNHgDyWJ+eCTwkM/chWy3WxXt1UMJularHwxvBwVMGJ6mDD
         iyR3hL1rpR1x2ZWdooHUYGsh1+X/+7lcCI5UNIJxbtS8By+uh92/6AD0hJ2qMeP6/Lw/
         Pzl05YNd2jjnErGeP94UkzxYSdgzx4z0wBn3uinZVWIpxbjmj38LukS63roh3NVnJjed
         ZRtERA2X8n+KEbcBydDbVmaaZLFNGSp2pQkJWDYzYcn3lYh36I+OyuWy3ozSgIHiCJ9k
         djnnkKgzfgqaC+j/LUScKmuim2D5ikQvm6zcdHARboYWYyAV5lqr8kWYsFGkxD/eEYe/
         KAfQ==
X-Gm-Message-State: AC+VfDyfmXUIjv9ZAxuJ+dKADW9slBlRW1IcTG1DY50XqeVcrLoCoHxx
	rMyQWMjBQbkt94m2Q6wsjFQ=
X-Google-Smtp-Source: ACHHUZ6uwsaC+f+4ISzpiwzmvKryO8fCbzH23CcTApoIn0lsQ518YuGTPwW7f524cMEve6g2SlrGNw==
X-Received: by 2002:a05:620a:c82:b0:75e:6837:19f8 with SMTP id q2-20020a05620a0c8200b0075e683719f8mr19290818qki.54.1687467521509;
        Thu, 22 Jun 2023 13:58:41 -0700 (PDT)
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
Subject: [PATCH v5 22/33] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:34 -0700
Message-Id: <20230622205745.79707-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
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


