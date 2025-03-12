Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE866A5E312
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:47:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910633.1317343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAv-0007o6-7g; Wed, 12 Mar 2025 17:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910633.1317343; Wed, 12 Mar 2025 17:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAv-0007gn-1h; Wed, 12 Mar 2025 17:47:25 +0000
Received: by outflank-mailman (input) for mailman id 910633;
 Wed, 12 Mar 2025 17:47:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o35=V7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsQAs-0006h8-WF
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:47:23 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c6490b5-ff6a-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 18:47:21 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3f4so71559f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 10:47:21 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0b79sm27333805e9.36.2025.03.12.10.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:47:20 -0700 (PDT)
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
X-Inumbo-ID: 0c6490b5-ff6a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741801640; x=1742406440; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38l7+vMOhtA3L47Dw/6UyPgylpeRB4oAz9vh/BWRMnE=;
        b=WoCvaYlquxmE3dMAb4uqA6//ASZRjwJ+mH0tqn8uXcN+cGAaJGe4Rvm55MdlNRGi2N
         KNFRAP6FutLR8VIA1YxK4QzPqkoJKq5fyANRO3qu5efNc0ltVk1BtnRpCl2EjjDelnGt
         fe8YQWzPyjdaXpZpcW8mcYu2UR9bklUGNJ66g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801640; x=1742406440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38l7+vMOhtA3L47Dw/6UyPgylpeRB4oAz9vh/BWRMnE=;
        b=l0kEmUV02JffAK7mjh0APw3jJiMEbuJHAbgvxfCF3LBkvs6RdPsKFeQ67ZcDK7t1B3
         dZpK224+JIFyY2stD6OYIXScUIcInRh0cyQG4NmXbyloWIifg37+cslessW9e9Ik3nIX
         CykJR44ShXTkiF5vk6QG6z662UKaX+jzURes/xjjDZDoWOUYJ5r5TxtHEybWsMG2ETmm
         yWldZaFIUF6H49MjxgxcUghJt5O+DdSrceQTKb0KSTLWWOP031cE8IbMi/a4Wzk2rtfX
         tDmDUuiRrlmY7mcLr7lqzUJrZssROv9gtPb3+zyuNwysJCpfVhVvVb7Bw3qNW7i8A6vJ
         I4lA==
X-Gm-Message-State: AOJu0Yw5elRFUr5SQ3+iBdS84Zy4PKD3J3sJmlud2AGF7wfjCU8sFiGs
	OV42B0Aw7jPZvvMi1+5/tQ6M+oDsTfaGfsVsdtBq1FLk4OKqA4VgCcmNh+tdeZRf8UZ+i/QnqHu
	8
X-Gm-Gg: ASbGncu3UET5q3m/R7Ke0fCZegC3BzbkYrurQoCzlFpNuWmPRyDWupNwa3a6rwzegYu
	jlUpGVvNpPrcP60Xf/uWdHU8u0hco0nhBPBSGUCi16kdFiFMsmjZQ3XJffgNuQ6Yc8Uda7AUboD
	oL7LbUb+fwPMD9/6WjyIflNypzqIBBMwATG1q7ktLToMuRrv7xfQy48ZkGnGE71BEMh12fiXFZm
	Y1YrBaKi6i97kc+H5keVZRbHqAh2jFNJRY3+Emg9pMeukrHYYDnheousU/L/KINko5p2lyuC8nu
	VeFALk3qEmd0UghUPfY3DWUZJaOTrxYLXcv0Wmy9tlekvPj77YrvksfIYK5mwCfFmzsxVe5PGlT
	gkZnRy3bxIy2Nae/2oQ86zy3+
X-Google-Smtp-Source: AGHT+IEtlqLoneJGokdux8kEu8gc5nusLLv2aIkQKVsicA5515dcUaJf1lQhm6Ccip6SAvsd5Usv/A==
X-Received: by 2002:a5d:47a2:0:b0:391:31c8:ba6b with SMTP id ffacd0b85a97d-39132d77343mr17156933f8f.10.1741801640493;
        Wed, 12 Mar 2025 10:47:20 -0700 (PDT)
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
Subject: [PATCH 4/8] xen/common: Split tlb-clock.h out of mm.h
Date: Wed, 12 Mar 2025 17:45:08 +0000
Message-Id: <20250312174513.4075066-5-andrew.cooper3@citrix.com>
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


