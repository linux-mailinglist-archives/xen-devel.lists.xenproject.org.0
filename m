Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D177DA5E314
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910637.1317376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAy-0000En-DG; Wed, 12 Mar 2025 17:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910637.1317376; Wed, 12 Mar 2025 17:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAy-00009A-3B; Wed, 12 Mar 2025 17:47:28 +0000
Received: by outflank-mailman (input) for mailman id 910637;
 Wed, 12 Mar 2025 17:47:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o35=V7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsQAw-0006eC-JD
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:47:26 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e90b725-ff6a-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 18:47:25 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3912c09bea5so95411f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 10:47:25 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0b79sm27333805e9.36.2025.03.12.10.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:47:23 -0700 (PDT)
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
X-Inumbo-ID: 0e90b725-ff6a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741801644; x=1742406444; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMLj39aTFhGq6xn1dDjh3SoXXw78RV2nULsjkmPxH8c=;
        b=jMTvDCFvHFJXNOY5FYg8OuGsgFVI/SgaCCYxBJa18W52lCpPzQQ9Und3xlkDt1WnHd
         XzEgbDj/s6aIf41YQrDOBRkykO2v8fZ7HSLvwSde38HpAYF42u2FX6Y/WfxE1K5L9gsV
         xYk5giWENkdO8fLEPY01KmDyWOEvCwRunQQMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801644; x=1742406444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMLj39aTFhGq6xn1dDjh3SoXXw78RV2nULsjkmPxH8c=;
        b=PTt8cqRBg72Vcvla30XHX8PXW49kOe+yXzGF2ocYb01nNVQEG3bZDOkn4vqLYfC33+
         fRdeQRuqAjgjGfthCrmqm+ByqNrMg7e+nwx5K0/OxponnezMnzzRu0fiMGBPRKCdu/Hx
         r47HkVL67u3nhTBeVpHHz5X7D6Qrzzg9dWopBgyntZ61sqxFA8tVQj6JL4PSuEpo7GEQ
         eaEMoAWQS/8G9n5RhrvOqOqv6S/EFgzw8KFrThcBuTBoooCU7ZypzsvEpfgl1u0S9WKC
         mL+p2JrBBsm1M85IPAgV9qu2a9YL3h1jlwDJeoCbck5mrJUaLYQjp+hx3nzCfGCxWsbz
         EZlQ==
X-Gm-Message-State: AOJu0YxHeWKILlkTCegTb1boXs5fDJzZP07nfVWygRjGQseKF/rZek0/
	04laTmbBQ2YByX2nYtbr0kSrgaDSPWnRrBrCdQAJitgpTlFkjlJ1n527ht5+KbQFPfFlaxhGzrP
	4
X-Gm-Gg: ASbGnctaR4DsLLUiDSSRO1xtQFPKniUn8lzaYPTD6AOOeOxlIWnwf5nFATdqQBZDx/A
	uVO8LNDt8CnZ4JzvoPO8Mv10u8TaZ3TDR51lAJd780AGkzO+39UU+ys/7LvUQtjtMLLDVdcMUtB
	DtY8VnHTprci+3j5VEufaOu9//+YCat6WqynqSvKsNupJ3WmYXYJ0H2mRYUWaMjaCOusVyEPlme
	oP7cGmknq/1ZZdp0Os9YIRTvwUAX7KHv4YG42inM/xiltEftoBU2wa2z/RpCkJLbE2YkSQF8f6t
	WWmYgpbbmJXXgwrQK5oeUDtBTvDfoj585bnGiXU+ozK0KdqSXWLbU2tsIsjwsLwersQeenHFJZD
	gX0eT1MCp2QL5BUrRD518D2NL
X-Google-Smtp-Source: AGHT+IG61+gv4GRyGYC0ZSkNJoh2fbS1N8UJczQXoQ9YfaukHazP+50OpE/OkLNZpd99M73Dx+2y+A==
X-Received: by 2002:a05:6000:4023:b0:38f:28dc:ec23 with SMTP id ffacd0b85a97d-392641c033fmr6725775f8f.19.1741801644074;
        Wed, 12 Mar 2025 10:47:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 7/8] xen/mm: Exclude flushtlb.h from mm.h for ARM
Date: Wed, 12 Mar 2025 17:45:12 +0000
Message-Id: <20250312174513.4075066-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A number of files pick up flushtlb.h transitively through mm.h, while the
flushtlb.h hierachy themselves aren't even self-sufficient.

Address all of these, and exclude flushtlb.h from mm.h

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/arm/include/asm/arm32/flushtlb.h | 2 ++
 xen/arch/arm/include/asm/arm64/flushtlb.h | 2 ++
 xen/arch/arm/include/asm/fixmap.h         | 2 ++
 xen/arch/arm/include/asm/pmap.h           | 1 +
 xen/arch/arm/mmu/domain_page.c            | 2 ++
 xen/arch/arm/mmu/pt.c                     | 1 +
 xen/arch/arm/mmu/setup.c                  | 1 +
 xen/arch/arm/traps.c                      | 1 +
 xen/include/xen/mm.h                      | 2 +-
 9 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 61c25a318998..510eb649a5c6 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_ARM_ARM32_FLUSHTLB_H__
 #define __ASM_ARM_ARM32_FLUSHTLB_H__
 
+#include <asm/arm32/sysregs.h>
+
 /*
  * Every invalidation operation use the following patterns:
  *
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 45642201d147..b98c8d14a78f 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_ARM_ARM64_FLUSHTLB_H__
 #define __ASM_ARM_ARM64_FLUSHTLB_H__
 
+#include <asm/alternative.h>
+
 /*
  * Every invalidation operation use the following patterns:
  *
diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index 0cb5d54d1c74..68d82d3d4ea2 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -22,6 +22,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/lpae.h>
+
 /*
  * Direct access to xen_fixmap[] should only happen when {set,
  * clear}_fixmap() is unusable (e.g. where we would end up to
diff --git a/xen/arch/arm/include/asm/pmap.h b/xen/arch/arm/include/asm/pmap.h
index bca3381796f3..1162e8a6e4d2 100644
--- a/xen/arch/arm/include/asm/pmap.h
+++ b/xen/arch/arm/include/asm/pmap.h
@@ -4,6 +4,7 @@
 #include <xen/mm.h>
 
 #include <asm/fixmap.h>
+#include <asm/flushtlb.h>
 
 static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
 {
diff --git a/xen/arch/arm/mmu/domain_page.c b/xen/arch/arm/mmu/domain_page.c
index 3a43601623f0..850214925a3b 100644
--- a/xen/arch/arm/mmu/domain_page.c
+++ b/xen/arch/arm/mmu/domain_page.c
@@ -3,6 +3,8 @@
 #include <xen/pmap.h>
 #include <xen/vmap.h>
 
+#include <asm/flushtlb.h>
+
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index da28d669e796..16c73da853e6 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -13,6 +13,7 @@
 
 #include <asm/current.h>
 #include <asm/fixmap.h>
+#include <asm/flushtlb.h>
 
 #ifdef NDEBUG
 static inline void
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index f6119ccacf15..64a06e30e8fb 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -13,6 +13,7 @@
 #include <xen/vmap.h>
 
 #include <asm/fixmap.h>
+#include <asm/flushtlb.h>
 #include <asm/setup.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 445e7378dd79..52f267fb11f8 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -34,6 +34,7 @@
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
 #include <asm/event.h>
+#include <asm/flushtlb.h>
 #include <asm/hsr.h>
 #include <asm/mem_access.h>
 #include <asm/mmio.h>
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 154e649db9e4..27e420e302d8 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -587,7 +587,7 @@ void destroy_ring_for_helper(void **_va, struct page_info *page);
 /* Return the upper bound of MFNs, including hotplug memory. */
 unsigned long get_upper_mfn_bound(void);
 
-#if defined(CONFIG_X86) || defined(CONFIG_ARM)
+#if defined(CONFIG_X86)
 #include <asm/flushtlb.h>
 #endif
 
-- 
2.39.5


