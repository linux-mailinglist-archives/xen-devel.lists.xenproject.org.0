Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0822AA5E30F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:47:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910632.1317337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAu-0007db-Ce; Wed, 12 Mar 2025 17:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910632.1317337; Wed, 12 Mar 2025 17:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAu-0007Xi-79; Wed, 12 Mar 2025 17:47:24 +0000
Received: by outflank-mailman (input) for mailman id 910632;
 Wed, 12 Mar 2025 17:47:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o35=V7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsQAs-0006eC-PC
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:47:22 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cf638c6-ff6a-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 18:47:22 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3913cf69784so106475f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 10:47:22 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0b79sm27333805e9.36.2025.03.12.10.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:47:21 -0700 (PDT)
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
X-Inumbo-ID: 0cf638c6-ff6a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741801641; x=1742406441; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38l7+vMOhtA3L47Dw/6UyPgylpeRB4oAz9vh/BWRMnE=;
        b=pA2bxwPdLupGIyG9Lsu+TVxyb9DZrY3+Nic9Lbpn0KqLilcTXVbUUseDzaAasTzR8t
         vyob1zHuXC63sw9fxv97UPsQW72I9dJSZMSHb3fmbaqTgEPiTcnguwlyn8XD1kQjip36
         am6ip4rF50xFStFDmHYeoxdxRIoPeQAfULY0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801641; x=1742406441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38l7+vMOhtA3L47Dw/6UyPgylpeRB4oAz9vh/BWRMnE=;
        b=wqQ88Nsy01RI1r26dphQgb0XhK704LLBiUVXeXJKhOiqKAli5UKrFNF4xM1+H7i+zB
         8wAe27FYAqYHDjbBVDXVnSI41eI3Z8rj9UVlKQqgLXboE0j2dcSQcIEdxaXHa1nh6mG9
         D9C4vYTLzCDfFxi56QMRFqME/11TLEjGbQOghHKXIeASdAZDkCPvkxC8ecqTqA8Q42WG
         Kz2toFI6HIHUmYt5kZk4/A1fCphwj+4Qs4RMTH3rJgC6aT76IY2AsQlAINWcFYkIXe3i
         vSuv6tNkVzbUkGyndRbODd0AhbYRzqw8MSuCVrhPp8vyfBX3nV5nm4pBVnidlp6b/d/3
         gCWQ==
X-Gm-Message-State: AOJu0YyX2JBbyzIzn6txOa4FSr4cQFGBj2TetvwSNmxDPlEXix+hwO+F
	B0FuIn9yKmMcg/Npme72o/+fH6ir429Bh0Skvkn4Y3ErGYxJxrveJ/ic4R6ReK9lRDiptThneMH
	B
X-Gm-Gg: ASbGncuQKcttUX2IhSk3D6aYcMYqHoIoMVFpVAuuvhz1vQE9lL9Bj1fWK8HtaJ/SF2d
	ZRaXYrBTz54mQcFEygedzqJEn35b396YMRsBzamwPsc0fmSNoY6yNutiBZveRgqaZw+NJjRdDMO
	cQ0PBMlgyZvFqyUkJlc+jxcbrJ5dBNuXa66fIAlpis+WlWU+BA9NFXlFdGFLGfuJl1JLkesvnfT
	7LGSV4r0DI9pGmQ4Pp+6RgyAOPdYNSxTi6hiM9/E8AwrBBP+DfFrASB8TW8PniBsoB8+SWVnPhh
	yIcnqou2S1gzz1o0izqVtG0i+Itkvg/4HPKITcBoKStOsZ7hQeKVJ5p1IDYh5KrRxLhjSOeUyuY
	2/ce/ZQTBwPHXzlLgR/tzey/N
X-Google-Smtp-Source: AGHT+IE8yNmj/tKBsKKOuHgS2hQbeGbQSp2UYCGc8g9H/+eTe9f2P5rgV91G3sJSSWVZe/syuzTNPg==
X-Received: by 2002:a05:6000:4102:b0:391:487f:27e7 with SMTP id ffacd0b85a97d-391487f2b5amr12133945f8f.55.1741801641443;
        Wed, 12 Mar 2025 10:47:21 -0700 (PDT)
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
Subject: [PATCH 4/8] xen/common: Split tlk-clock.h out of mm.h
Date: Wed, 12 Mar 2025 17:45:09 +0000
Message-Id: <20250312174513.4075066-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen/mm.h includes asm/tlbflush.h almost at the end, which creates a horrible
tangle.  This is in order to provide two common files with an abstraction over
the x86-specific TLB clock logic.

First, introduce CONFIG_HAS_TLB_CLOCK, selected by x86 only.  Next, introduce
xen/tlb-clock.h, providing empty stubs, and include this into memory.c and
page_alloc.c

No functional change.

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

There is still a mess here with the common vs x86 split, but it's better
contained than before.
---
 xen/arch/x86/Kconfig        |  1 +
 xen/common/Kconfig          |  3 +++
 xen/common/memory.c         |  1 +
 xen/common/page_alloc.c     |  1 +
 xen/include/xen/mm.h        | 27 --------------------
 xen/include/xen/tlb-clock.h | 49 +++++++++++++++++++++++++++++++++++++
 6 files changed, 55 insertions(+), 27 deletions(-)
 create mode 100644 xen/include/xen/tlb-clock.h

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6e41bc0fb435..e9a166ee3dd0 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -28,6 +28,7 @@ config X86
 	select HAS_PCI_MSI
 	select HAS_PIRQ
 	select HAS_SCHED_GRANULARITY
+	select HAS_TLB_CLOCK
 	select HAS_UBSAN
 	select HAS_VMAP
 	select HAS_VPCI if HVM
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6166327f4d14..dcf7d9d00d0a 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -83,6 +83,9 @@ config HAS_PMAP
 config HAS_SCHED_GRANULARITY
 	bool
 
+config HAS_TLB_CLOCK
+	bool
+
 config HAS_UBSAN
 	bool
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 61a94b23abae..9138fd096696 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -24,6 +24,7 @@
 #include <xen/perfc.h>
 #include <xen/sched.h>
 #include <xen/sections.h>
+#include <xen/tlb-clock.h>
 #include <xen/trace.h>
 
 #include <asm/current.h>
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index bc029ea797a2..b90c3d7988b4 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -137,6 +137,7 @@
 #include <xen/sections.h>
 #include <xen/softirq.h>
 #include <xen/spinlock.h>
+#include <xen/tlb-clock.h>
 #include <xen/vm_event.h>
 #include <xen/xvmalloc.h>
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 45000cc3f64b..fff36ff903d6 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -588,33 +588,6 @@ unsigned long get_upper_mfn_bound(void);
 
 #include <asm/flushtlb.h>
 
-static inline void accumulate_tlbflush(bool *need_tlbflush,
-                                       const struct page_info *page,
-                                       uint32_t *tlbflush_timestamp)
-{
-    if ( page->u.free.need_tlbflush &&
-         page->tlbflush_timestamp <= tlbflush_current_time() &&
-         (!*need_tlbflush ||
-          page->tlbflush_timestamp > *tlbflush_timestamp) )
-    {
-        *need_tlbflush = true;
-        *tlbflush_timestamp = page->tlbflush_timestamp;
-    }
-}
-
-static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
-{
-    cpumask_t mask;
-
-    cpumask_copy(&mask, &cpu_online_map);
-    tlbflush_filter(&mask, tlbflush_timestamp);
-    if ( !cpumask_empty(&mask) )
-    {
-        perfc_incr(need_flush_tlb_flush);
-        arch_flush_tlb_mask(&mask);
-    }
-}
-
 enum XENSHARE_flags {
     SHARE_rw,
     SHARE_ro,
diff --git a/xen/include/xen/tlb-clock.h b/xen/include/xen/tlb-clock.h
new file mode 100644
index 000000000000..796c0be7fbef
--- /dev/null
+++ b/xen/include/xen/tlb-clock.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN_TLB_CLOCK_H
+#define XEN_TLB_CLOCK_H
+
+#include <xen/types.h>
+
+#ifdef CONFIG_HAS_TLB_CLOCK
+
+#include <xen/mm.h>
+
+#include <asm/flushtlb.h>
+
+static inline void accumulate_tlbflush(
+    bool *need_tlbflush, const struct page_info *page,
+    uint32_t *tlbflush_timestamp)
+{
+    if ( page->u.free.need_tlbflush &&
+         page->tlbflush_timestamp <= tlbflush_current_time() &&
+         (!*need_tlbflush ||
+          page->tlbflush_timestamp > *tlbflush_timestamp) )
+    {
+        *need_tlbflush = true;
+        *tlbflush_timestamp = page->tlbflush_timestamp;
+    }
+}
+
+static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
+{
+    cpumask_t mask;
+
+    cpumask_copy(&mask, &cpu_online_map);
+    tlbflush_filter(&mask, tlbflush_timestamp);
+    if ( !cpumask_empty(&mask) )
+    {
+        perfc_incr(need_flush_tlb_flush);
+        arch_flush_tlb_mask(&mask);
+    }
+}
+
+#else /* !CONFIG_HAS_TLB_CLOCK */
+
+struct page_info;
+static inline void accumulate_tlbflush(
+    bool *need_tlbflush, const struct page_info *page,
+    uint32_t *tlbflush_timestamp) {}
+static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp) {}
+
+#endif /* !CONFIG_HAS_TLB_CLOCK*/
+#endif /* XEN_TLB_CLOCK_H */
-- 
2.39.5


