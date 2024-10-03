Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2098F5B6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809696.1222258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7F-0001fA-Vn; Thu, 03 Oct 2024 17:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809696.1222258; Thu, 03 Oct 2024 17:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7F-0001Ti-8P; Thu, 03 Oct 2024 17:59:53 +0000
Received: by outflank-mailman (input) for mailman id 809696;
 Thu, 03 Oct 2024 17:59:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ7A-0006qR-Pe
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:48 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46bfd466-81b1-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 19:59:46 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53997328633so1942285e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:46 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:45 -0700 (PDT)
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
X-Inumbo-ID: 46bfd466-81b1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978386; x=1728583186; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNiKQHMX+Ojk5dsTBVr2+d/BQL/jwshybvgP1Qfqj4w=;
        b=KktSV6NWon1z9/AKeUF2ISfFdZb6asNljcKELPpGfCMQ2wQVipLK2DWD5FRD6ajxyy
         7C7/E0pOJupD4sbLU5sr9qgLV7Uh9i5adWh1ReioC5CxOj1WAToWZzul/Lc5JfX2CTX5
         2h/Lm13O2Jvs5wxEyuM2Ft4H/lq4azBddAXFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978386; x=1728583186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNiKQHMX+Ojk5dsTBVr2+d/BQL/jwshybvgP1Qfqj4w=;
        b=sEXdHequ5F4n5qLoyQoInOmUIPBRHBKjLMhkWJD9m96RocBzWwPUllE7n0pl+DaNmc
         Um0oqUC636wQCSNGzp78bw+l6tK0jZr2IPC9sQWi0BiN3ta1EXxTrfXr0Lfa1GKRny1I
         vbmWlBziQOc9POMuN3NoBe+c8ncm1siIus3I/2w51Nas0y37TWpbQ46mwBiB4RRkMUu1
         WIJswrgLrGio9pmzUmfiMsecJL4zMHfeD4jHqWHKtDf5BH5bIW/t4ERcbIMu5KGHfWs5
         2GZT6fYDJ0RTO0FxAirTHdQxJ5oKCzaMgEaaFlZ8EM/LvebTsPOCfi9yBI9NG4yonVPL
         xMNA==
X-Gm-Message-State: AOJu0YxnaAnJGCYvlR5OdDD1klrmx5Dlun3x5ZC0539K6aGI50UUXNxK
	PprIO2/25IQyrgyZ5KTlpd2Jlbqa7kkCkiGjvuoVPty6k+ZCGwNKP//rMMig3792GNMfSxusB0R
	a
X-Google-Smtp-Source: AGHT+IGsRzfrvGY1zVkVAXyBTKkTNj35x39Ck7XQ/SU8Qk5IMioeSZdlIGXGC+pTTd4BRoyAwEkiiA==
X-Received: by 2002:a05:6512:b29:b0:530:ab68:25c5 with SMTP id 2adb3069b0e04-539ab84e022mr224933e87.2.1727978385819;
        Thu, 03 Oct 2024 10:59:45 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v2 14/19] xen: Update header guards - PPC 64
Date: Thu,  3 Oct 2024 18:59:14 +0100
Message-Id: <20241003175919.472774-15-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to PPC 64.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/ppc/include/asm/asm-defns.h     | 6 +++---
 xen/arch/ppc/include/asm/atomic.h        | 6 +++---
 xen/arch/ppc/include/asm/bitops.h        | 6 +++---
 xen/arch/ppc/include/asm/boot.h          | 6 +++---
 xen/arch/ppc/include/asm/bug.h           | 6 +++---
 xen/arch/ppc/include/asm/byteorder.h     | 6 +++---
 xen/arch/ppc/include/asm/cache.h         | 6 +++---
 xen/arch/ppc/include/asm/config.h        | 6 +++---
 xen/arch/ppc/include/asm/cpufeature.h    | 6 +++---
 xen/arch/ppc/include/asm/current.h       | 6 +++---
 xen/arch/ppc/include/asm/domain.h        | 6 +++---
 xen/arch/ppc/include/asm/early_printk.h  | 6 +++---
 xen/arch/ppc/include/asm/event.h         | 6 +++---
 xen/arch/ppc/include/asm/flushtlb.h      | 6 +++---
 xen/arch/ppc/include/asm/guest_access.h  | 6 +++---
 xen/arch/ppc/include/asm/guest_atomics.h | 6 +++---
 xen/arch/ppc/include/asm/io.h            | 6 +++---
 xen/arch/ppc/include/asm/iommu.h         | 6 +++---
 xen/arch/ppc/include/asm/irq.h           | 6 +++---
 xen/arch/ppc/include/asm/memory.h        | 4 ++--
 xen/arch/ppc/include/asm/mm.h            | 6 +++---
 xen/arch/ppc/include/asm/monitor.h       | 6 +++---
 xen/arch/ppc/include/asm/msr.h           | 6 +++---
 xen/arch/ppc/include/asm/nospec.h        | 6 +++---
 xen/arch/ppc/include/asm/opal-api.h      | 6 +++---
 xen/arch/ppc/include/asm/p2m.h           | 6 +++---
 xen/arch/ppc/include/asm/page-bits.h     | 6 +++---
 xen/arch/ppc/include/asm/page.h          | 6 +++---
 xen/arch/ppc/include/asm/processor.h     | 6 +++---
 xen/arch/ppc/include/asm/regs.h          | 6 +++---
 xen/arch/ppc/include/asm/setup.h         | 6 +++---
 xen/arch/ppc/include/asm/smp.h           | 4 ++--
 xen/arch/ppc/include/asm/spinlock.h      | 6 +++---
 xen/arch/ppc/include/asm/string.h        | 6 +++---
 xen/arch/ppc/include/asm/system.h        | 4 ++--
 xen/arch/ppc/include/asm/time.h          | 6 +++---
 xen/arch/ppc/include/asm/types.h         | 6 +++---
 37 files changed, 108 insertions(+), 108 deletions(-)

diff --git a/xen/arch/ppc/include/asm/asm-defns.h b/xen/arch/ppc/include/asm/asm-defns.h
index e46f0785ad..aaa6dc6152 100644
--- a/xen/arch/ppc/include/asm/asm-defns.h
+++ b/xen/arch/ppc/include/asm/asm-defns.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef _ASM_PPC_ASM_DEFNS_H
-#define _ASM_PPC_ASM_DEFNS_H
+#ifndef ASM__PPC__ASM_DEFNS_H
+#define ASM__PPC__ASM_DEFNS_H
 
 #include <asm/asm-offsets.h>
 #include <xen/linkage.h>
@@ -75,4 +75,4 @@ name:                                                                       \
 #define SAVE_NVGPRS(base)           SAVE_GPRS(14, 31, base)
 #define REST_NVGPRS(base)           REST_GPRS(14, 31, base)
 
-#endif /* _ASM_PPC_ASM_DEFNS_H */
+#endif /* ASM__PPC__ASM_DEFNS_H */
diff --git a/xen/arch/ppc/include/asm/atomic.h b/xen/arch/ppc/include/asm/atomic.h
index fe778579fb..5fe662ff59 100644
--- a/xen/arch/ppc/include/asm/atomic.h
+++ b/xen/arch/ppc/include/asm/atomic.h
@@ -7,8 +7,8 @@
  * Copyright Raptor Engineering LLC
  */
 
-#ifndef _ASM_PPC64_ATOMIC_H_
-#define _ASM_PPC64_ATOMIC_H_
+#ifndef ASM__PPC__ATOMIC_H
+#define ASM__PPC__ATOMIC_H
 
 #include <xen/atomic.h>
 
@@ -382,4 +382,4 @@ static inline int atomic_add_unless(atomic_t *v, int a, int u)
     return __atomic_add_unless(v, a, u);
 }
 
-#endif /* _ASM_PPC64_ATOMIC_H_ */
+#endif /* ASM__PPC__ATOMIC_H */
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index c942e9432e..2c10a016b7 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -7,8 +7,8 @@
  * Reed, Pat McCarthy, Peter Bergner, Anton Blanchard.  They
  * originally took it from the ppc32 code.
  */
-#ifndef _ASM_PPC_BITOPS_H
-#define _ASM_PPC_BITOPS_H
+#ifndef ASM__PPC__BITOPS_H
+#define ASM__PPC__BITOPS_H
 
 #include <asm/memory.h>
 
@@ -126,4 +126,4 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
 
 #define arch_hweightl(x) __builtin_popcountl(x)
 
-#endif /* _ASM_PPC_BITOPS_H */
+#endif /* ASM__PPC__BITOPS_H */
diff --git a/xen/arch/ppc/include/asm/boot.h b/xen/arch/ppc/include/asm/boot.h
index d62c3ff6e0..7618533712 100644
--- a/xen/arch/ppc/include/asm/boot.h
+++ b/xen/arch/ppc/include/asm/boot.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _ASM_PPC_BOOT_H
-#define _ASM_PPC_BOOT_H
+#ifndef ASM__PPC__BOOT_H
+#define ASM__PPC__BOOT_H
 
 #include <xen/types.h>
 
@@ -15,4 +15,4 @@ struct opal {
 
 void boot_opal_init(const void *fdt);
 
-#endif /* _ASM_PPC_BOOT_H */
+#endif /* ASM__PPC__BOOT_H */
diff --git a/xen/arch/ppc/include/asm/bug.h b/xen/arch/ppc/include/asm/bug.h
index 35d4568402..019565b0ed 100644
--- a/xen/arch/ppc/include/asm/bug.h
+++ b/xen/arch/ppc/include/asm/bug.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef _ASM_PPC_BUG_H
-#define _ASM_PPC_BUG_H
+#ifndef ASM__PPC__BUG_H
+#define ASM__PPC__BUG_H
 
 #include <xen/stringify.h>
 #include <asm/processor.h>
@@ -24,4 +24,4 @@
 /* TODO: implement this properly */
 #define BUG_FRAME(type, line, ptr, second_frame, msg) do { } while (0)
 
-#endif /* _ASM_PPC_BUG_H */
+#endif /* ASM__PPC__BUG_H */
diff --git a/xen/arch/ppc/include/asm/byteorder.h b/xen/arch/ppc/include/asm/byteorder.h
index 2b5f6b9f63..7a13366e45 100644
--- a/xen/arch/ppc/include/asm/byteorder.h
+++ b/xen/arch/ppc/include/asm/byteorder.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_PPC_BYTEORDER_H
-#define _ASM_PPC_BYTEORDER_H
+#ifndef ASM__PPC__BYTEORDER_H
+#define ASM__PPC__BYTEORDER_H
 
 #define __arch__swab16 __builtin_bswap16
 #define __arch__swab32 __builtin_bswap32
@@ -9,4 +9,4 @@
 
 #include <xen/byteorder/little_endian.h>
 
-#endif /* _ASM_PPC_BYTEORDER_H */
+#endif /* ASM__PPC__BYTEORDER_H */
diff --git a/xen/arch/ppc/include/asm/cache.h b/xen/arch/ppc/include/asm/cache.h
index 8a0a6b7b17..561d02e232 100644
--- a/xen/arch/ppc/include/asm/cache.h
+++ b/xen/arch/ppc/include/asm/cache.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef _ASM_PPC_CACHE_H
-#define _ASM_PPC_CACHE_H
+#ifndef ASM__PPC__CACHE_H
+#define ASM__PPC__CACHE_H
 
-#endif /* _ASM_PPC_CACHE_H */
+#endif /* ASM__PPC__CACHE_H */
diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm/config.h
index 148fb3074d..e472a54689 100644
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __PPC_CONFIG_H__
-#define __PPC_CONFIG_H__
+#ifndef ASM__PPC__CONFIG_H
+#define ASM__PPC__CONFIG_H
 
 #include <xen/const.h>
 #include <xen/page-size.h>
@@ -58,7 +58,7 @@
 /* ELFv2 ABI mandates 16 byte alignment */
 #define STACK_ALIGN 16
 
-#endif /* __PPC_CONFIG_H__ */
+#endif /* ASM__PPC__CONFIG_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/ppc/include/asm/cpufeature.h b/xen/arch/ppc/include/asm/cpufeature.h
index 1c5946512b..3555a3257f 100644
--- a/xen/arch/ppc/include/asm/cpufeature.h
+++ b/xen/arch/ppc/include/asm/cpufeature.h
@@ -1,10 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_CPUFEATURE_H__
-#define __ASM_PPC_CPUFEATURE_H__
+#ifndef ASM__PPC__CPUFEATURE_H
+#define ASM__PPC__CPUFEATURE_H
 
 static inline int cpu_nr_siblings(unsigned int cpu)
 {
     return 1;
 }
 
-#endif /* __ASM_PPC_CPUFEATURE_H__ */
+#endif /* ASM__PPC__CPUFEATURE_H */
diff --git a/xen/arch/ppc/include/asm/current.h b/xen/arch/ppc/include/asm/current.h
index e329a548e6..9400c62fcc 100644
--- a/xen/arch/ppc/include/asm/current.h
+++ b/xen/arch/ppc/include/asm/current.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_CURRENT_H__
-#define __ASM_PPC_CURRENT_H__
+#ifndef ASM__PPC__CURRENT_H
+#define ASM__PPC__CURRENT_H
 
 #include <xen/percpu.h>
 
@@ -46,4 +46,4 @@ static inline struct cpu_info *get_cpu_info(void)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __ASM_PPC_CURRENT_H__ */
+#endif /* ASM__PPC__CURRENT_H */
diff --git a/xen/arch/ppc/include/asm/domain.h b/xen/arch/ppc/include/asm/domain.h
index 3a447272c6..66261bdf5a 100644
--- a/xen/arch/ppc/include/asm/domain.h
+++ b/xen/arch/ppc/include/asm/domain.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_DOMAIN_H__
-#define __ASM_PPC_DOMAIN_H__
+#ifndef ASM__PPC__DOMAIN_H
+#define ASM__PPC__DOMAIN_H
 
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
@@ -42,4 +42,4 @@ static inline void update_guest_memory_policy(struct vcpu *v,
 
 static inline void arch_vcpu_block(struct vcpu *v) {}
 
-#endif /* __ASM_PPC_DOMAIN_H__ */
+#endif /* ASM__PPC__DOMAIN_H */
diff --git a/xen/arch/ppc/include/asm/early_printk.h b/xen/arch/ppc/include/asm/early_printk.h
index d1d8b416f4..61bc48921a 100644
--- a/xen/arch/ppc/include/asm/early_printk.h
+++ b/xen/arch/ppc/include/asm/early_printk.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _ASM_PPC_EARLY_PRINTK_H
-#define _ASM_PPC_EARLY_PRINTK_H
+#ifndef ASM__PPC__EARLY_PRINTK_H
+#define ASM__PPC__EARLY_PRINTK_H
 
 #include <xen/early_printk.h>
 
@@ -12,4 +12,4 @@ static inline void early_printk_init(void (*putchar)(char)) {}
 static inline void early_printk(const char *s) {}
 #endif
 
-#endif /* _ASM_PPC_EARLY_PRINTK_H */
+#endif /* ASM__PPC__EARLY_PRINTK_H */
diff --git a/xen/arch/ppc/include/asm/event.h b/xen/arch/ppc/include/asm/event.h
index 1b95ee4f61..10f3eaa5fa 100644
--- a/xen/arch/ppc/include/asm/event.h
+++ b/xen/arch/ppc/include/asm/event.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_EVENT_H__
-#define __ASM_PPC_EVENT_H__
+#ifndef ASM__PPC__EVENT_H
+#define ASM__PPC__EVENT_H
 
 #include <xen/lib.h>
 
@@ -33,4 +33,4 @@ static inline void local_event_delivery_enable(void)
     BUG_ON("unimplemented");
 }
 
-#endif /* __ASM_PPC_EVENT_H__ */
+#endif /* ASM__PPC__EVENT_H */
diff --git a/xen/arch/ppc/include/asm/flushtlb.h b/xen/arch/ppc/include/asm/flushtlb.h
index afcb740783..39a8f04695 100644
--- a/xen/arch/ppc/include/asm/flushtlb.h
+++ b/xen/arch/ppc/include/asm/flushtlb.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_FLUSHTLB_H__
-#define __ASM_PPC_FLUSHTLB_H__
+#ifndef ASM__PPC__FLUSHTLB_H
+#define ASM__PPC__FLUSHTLB_H
 
 #include <xen/cpumask.h>
 
@@ -21,4 +21,4 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
 /* Flush specified CPUs' TLBs */
 void arch_flush_tlb_mask(const cpumask_t *mask);
 
-#endif /* __ASM_PPC_FLUSHTLB_H__ */
+#endif /* ASM__PPC__FLUSHTLB_H */
diff --git a/xen/arch/ppc/include/asm/guest_access.h b/xen/arch/ppc/include/asm/guest_access.h
index 6546931911..a4531b0e19 100644
--- a/xen/arch/ppc/include/asm/guest_access.h
+++ b/xen/arch/ppc/include/asm/guest_access.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_GUEST_ACCESS_H__
-#define __ASM_PPC_GUEST_ACCESS_H__
+#ifndef ASM__PPC__GUEST_ACCESS_H
+#define ASM__PPC__GUEST_ACCESS_H
 
 #include <xen/mm.h>
 
@@ -65,4 +65,4 @@ static inline int access_guest_memory_by_gpa(
 #define guest_handle_okay(hnd, nr) (1)
 #define guest_handle_subrange_okay(hnd, first, last) (1)
 
-#endif /* __ASM_PPC_GUEST_ACCESS_H__ */
+#endif /* ASM__PPC__GUEST_ACCESS_H */
diff --git a/xen/arch/ppc/include/asm/guest_atomics.h b/xen/arch/ppc/include/asm/guest_atomics.h
index 1190e10bbb..62b229c2dc 100644
--- a/xen/arch/ppc/include/asm/guest_atomics.h
+++ b/xen/arch/ppc/include/asm/guest_atomics.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_GUEST_ATOMICS_H__
-#define __ASM_PPC_GUEST_ATOMICS_H__
+#ifndef ASM__PPC__GUEST_ATOMICS_H
+#define ASM__PPC__GUEST_ATOMICS_H
 
 #include <xen/lib.h>
 
@@ -20,4 +20,4 @@
 #define guest_test_and_clear_bit(d, nr, p)  unimplemented_guest_bit_op(d, nr, p)
 #define guest_test_and_change_bit(d, nr, p) unimplemented_guest_bit_op(d, nr, p)
 
-#endif /* __ASM_PPC_GUEST_ATOMICS_H__ */
+#endif /* ASM__PPC__GUEST_ATOMICS_H */
diff --git a/xen/arch/ppc/include/asm/io.h b/xen/arch/ppc/include/asm/io.h
index 85b5b27157..5135678f61 100644
--- a/xen/arch/ppc/include/asm/io.h
+++ b/xen/arch/ppc/include/asm/io.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_IO_H__
-#define __ASM_PPC_IO_H__
+#ifndef ASM__PPC__IO_H
+#define ASM__PPC__IO_H
 
 #include <xen/lib.h>
 
@@ -13,4 +13,4 @@
 #define writew(v,c)     ({ (void)(v); (void)(c); BUG_ON("unimplemented"); })
 #define writel(v,c)     ({ (void)(v); (void)(c); BUG_ON("unimplemented"); })
 
-#endif /* __ASM_PPC_IO_H__ */
+#endif /* ASM__PPC__IO_H */
diff --git a/xen/arch/ppc/include/asm/iommu.h b/xen/arch/ppc/include/asm/iommu.h
index 024ead3473..c28c9897f9 100644
--- a/xen/arch/ppc/include/asm/iommu.h
+++ b/xen/arch/ppc/include/asm/iommu.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_IOMMU_H__
-#define __ASM_PPC_IOMMU_H__
+#ifndef ASM__PPC__IOMMU_H
+#define ASM__PPC__IOMMU_H
 
 struct arch_iommu {
 };
 
-#endif /* __ASM_PPC_IOMMU_H__ */
+#endif /* ASM__PPC__IOMMU_H */
diff --git a/xen/arch/ppc/include/asm/irq.h b/xen/arch/ppc/include/asm/irq.h
index 5c37d0cf25..ceddf645ed 100644
--- a/xen/arch/ppc/include/asm/irq.h
+++ b/xen/arch/ppc/include/asm/irq.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_IRQ_H__
-#define __ASM_PPC_IRQ_H__
+#ifndef ASM__PPC__IRQ_H
+#define ASM__PPC__IRQ_H
 
 #include <xen/lib.h>
 #include <xen/device_tree.h>
@@ -30,4 +30,4 @@ static inline int platform_get_irq(const struct dt_device_node *device, int inde
     BUG_ON("unimplemented");
 }
 
-#endif /* __ASM_PPC_IRQ_H__ */
+#endif /* ASM__PPC__IRQ_H */
diff --git a/xen/arch/ppc/include/asm/memory.h b/xen/arch/ppc/include/asm/memory.h
index 57310eb690..9ddf9f8a50 100644
--- a/xen/arch/ppc/include/asm/memory.h
+++ b/xen/arch/ppc/include/asm/memory.h
@@ -5,8 +5,8 @@
  * Authors: Jimi Xenidis <jimix@watson.ibm.com>
  */
 
-#ifndef _ASM_MEMORY_H_
-#define _ASM_MEMORY_H_
+#ifndef ASM__PPC__MEMORY_H
+#define ASM__PPC__MEMORY_H
 
 #define PPC_ATOMIC_ENTRY_BARRIER "sync\n"
 #define PPC_ATOMIC_EXIT_BARRIER  "sync\n"
diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.h
index a433936076..acc2be8eed 100644
--- a/xen/arch/ppc/include/asm/mm.h
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _ASM_PPC_MM_H
-#define _ASM_PPC_MM_H
+#ifndef ASM__PPC__MM_H
+#define ASM__PPC__MM_H
 
 #include <public/xen.h>
 #include <xen/pdx.h>
@@ -256,4 +256,4 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return true;
 }
 
-#endif /* _ASM_PPC_MM_H */
+#endif /* ASM__PPC__MM_H */
diff --git a/xen/arch/ppc/include/asm/monitor.h b/xen/arch/ppc/include/asm/monitor.h
index 89000dacc6..8fe1f081bc 100644
--- a/xen/arch/ppc/include/asm/monitor.h
+++ b/xen/arch/ppc/include/asm/monitor.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Derived from xen/arch/arm/include/asm/monitor.h */
-#ifndef __ASM_PPC_MONITOR_H__
-#define __ASM_PPC_MONITOR_H__
+#ifndef ASM__PPC__MONITOR_H
+#define ASM__PPC__MONITOR_H
 
 #include <public/domctl.h>
 #include <xen/errno.h>
@@ -14,4 +14,4 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
     return 0;
 }
 
-#endif /* __ASM_PPC_MONITOR_H__ */
+#endif /* ASM__PPC__MONITOR_H */
diff --git a/xen/arch/ppc/include/asm/msr.h b/xen/arch/ppc/include/asm/msr.h
index 144511e5c3..796158c6f9 100644
--- a/xen/arch/ppc/include/asm/msr.h
+++ b/xen/arch/ppc/include/asm/msr.h
@@ -7,8 +7,8 @@
  *          Shawn Anastasio <sanastasio@raptorengineering.com>
  */
 
-#ifndef _ASM_PPC_MSR_H
-#define _ASM_PPC_MSR_H
+#ifndef ASM__PPC__MSR_H
+#define ASM__PPC__MSR_H
 
 #include <xen/const.h>
 
@@ -48,4 +48,4 @@
 #define MSR_TRAP_NEXT   _AC(0x0000000000010000, ULL) /* PC is next instruction */
 #define MSR_TRAP_BITS  (MSR_TRAP_FE|MSR_TRAP_IOP|MSR_TRAP_PRIV|MSR_TRAP)
 
-#endif /* _ASM_PPC_MSR_H */
+#endif /* ASM__PPC__MSR_H */
diff --git a/xen/arch/ppc/include/asm/nospec.h b/xen/arch/ppc/include/asm/nospec.h
index b97322e48d..8f5be95ddd 100644
--- a/xen/arch/ppc/include/asm/nospec.h
+++ b/xen/arch/ppc/include/asm/nospec.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* From arch/arm/include/asm/nospec.h. */
-#ifndef __ASM_PPC_NOSPEC_H__
-#define __ASM_PPC_NOSPEC_H__
+#ifndef ASM__PPC__NOSPEC_H
+#define ASM__PPC__NOSPEC_H
 
 static inline bool evaluate_nospec(bool condition)
 {
@@ -12,4 +12,4 @@ static inline void block_speculation(void)
 {
 }
 
-#endif /* __ASM_PPC_NOSPEC_H__ */
+#endif /* ASM__PPC__NOSPEC_H */
diff --git a/xen/arch/ppc/include/asm/opal-api.h b/xen/arch/ppc/include/asm/opal-api.h
index 8790246f48..2507f6c96a 100644
--- a/xen/arch/ppc/include/asm/opal-api.h
+++ b/xen/arch/ppc/include/asm/opal-api.h
@@ -5,8 +5,8 @@
  * Copyright 2011-2015 IBM Corp.
  */
 
-#ifndef __OPAL_API_H
-#define __OPAL_API_H
+#ifndef ASM__PPC__OPAL_API_H
+#define ASM__PPC__OPAL_API_H
 
 /****** OPAL APIs ******/
 
@@ -1187,4 +1187,4 @@ struct opal_mpipl_fadump {
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __OPAL_API_H */
+#endif /* ASM__PPC__OPAL_API_H */
diff --git a/xen/arch/ppc/include/asm/p2m.h b/xen/arch/ppc/include/asm/p2m.h
index f144ef8e1a..9649d24621 100644
--- a/xen/arch/ppc/include/asm/p2m.h
+++ b/xen/arch/ppc/include/asm/p2m.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_PPC_P2M_H__
-#define __ASM_PPC_P2M_H__
+#ifndef ASM__PPC__P2M_H
+#define ASM__PPC__P2M_H
 
 #include <asm/page-bits.h>
 
@@ -93,4 +93,4 @@ static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
     /* Not supported on PPC. */
 }
 
-#endif /* __ASM_PPC_P2M_H__ */
+#endif /* ASM__PPC__P2M_H */
diff --git a/xen/arch/ppc/include/asm/page-bits.h b/xen/arch/ppc/include/asm/page-bits.h
index 0286177520..07c7314dac 100644
--- a/xen/arch/ppc/include/asm/page-bits.h
+++ b/xen/arch/ppc/include/asm/page-bits.h
@@ -1,8 +1,8 @@
-#ifndef __PPC_PAGE_BITS_H__
-#define __PPC_PAGE_BITS_H__
+#ifndef ASM__PPC__PAGE_BITS_H
+#define ASM__PPC__PAGE_BITS_H
 
 #define PAGE_SHIFT              16 /* 64 KiB Pages */
 #define PADDR_BITS              53
 #define VADDR_BITS              52
 
-#endif /* __PPC_PAGE_BITS_H__ */
+#endif /* ASM__PPC__PAGE_BITS_H */
diff --git a/xen/arch/ppc/include/asm/page.h b/xen/arch/ppc/include/asm/page.h
index 6d4cd2611c..5bca13079e 100644
--- a/xen/arch/ppc/include/asm/page.h
+++ b/xen/arch/ppc/include/asm/page.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _ASM_PPC_PAGE_H
-#define _ASM_PPC_PAGE_H
+#ifndef ASM__PPC__PAGE_H
+#define ASM__PPC__PAGE_H
 
 #include <xen/bitops.h>
 #include <xen/types.h>
@@ -196,4 +196,4 @@ static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
     BUG_ON("unimplemented");
 }
 
-#endif /* _ASM_PPC_PAGE_H */
+#endif /* ASM__PPC__PAGE_H */
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
index a01b62b8a4..e60278d112 100644
--- a/xen/arch/ppc/include/asm/processor.h
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -9,8 +9,8 @@
  *          Shawn Anastasio <sanastasio@raptorengineering.com>
  */
 
-#ifndef _ASM_PPC_PROCESSOR_H
-#define _ASM_PPC_PROCESSOR_H
+#ifndef ASM__PPC__PROCESSOR_H
+#define ASM__PPC__PROCESSOR_H
 
 #define IOBMP_BYTES          8192
 #define IOBMP_INVALID_OFFSET 0x8000
@@ -221,4 +221,4 @@ static inline void noreturn die(void)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* _ASM_PPC_PROCESSOR_H */
+#endif /* ASM__PPC__PROCESSOR_H */
diff --git a/xen/arch/ppc/include/asm/regs.h b/xen/arch/ppc/include/asm/regs.h
index cbf1a9c8e4..827eb48ca1 100644
--- a/xen/arch/ppc/include/asm/regs.h
+++ b/xen/arch/ppc/include/asm/regs.h
@@ -6,8 +6,8 @@
  *          Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
  */
 
-#ifndef _ASM_REG_DEFS_H_
-#define _ASM_REG_DEFS_H_
+#ifndef ASM__PPC__REGS_H
+#define ASM__PPC__REGS_H
 
 /* Special Purpose Registers */
 #define SPRN_VRSAVE 256
@@ -121,4 +121,4 @@
 #define   LPCR_UPRT		_AC(0x0000000000400000, UL)      /* Use Process Table (ISA 3) */
 #define   LPCR_HR		_AC(0x0000000000100000, UL)
 
-#endif /* _ASM_REG_DEFS_H_ */
+#endif /* ASM__PPC__REGS_H */
diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
index e4f64879b6..34586d0965 100644
--- a/xen/arch/ppc/include/asm/setup.h
+++ b/xen/arch/ppc/include/asm/setup.h
@@ -1,6 +1,6 @@
-#ifndef __ASM_PPC_SETUP_H__
-#define __ASM_PPC_SETUP_H__
+#ifndef ASM__PPC__SETUP_H
+#define ASM__PPC__SETUP_H
 
 #define max_init_domid (0)
 
-#endif /* __ASM_PPC_SETUP_H__ */
+#endif /* ASM__PPC__SETUP_H */
diff --git a/xen/arch/ppc/include/asm/smp.h b/xen/arch/ppc/include/asm/smp.h
index 7b1517ce18..fb61b8daa4 100644
--- a/xen/arch/ppc/include/asm/smp.h
+++ b/xen/arch/ppc/include/asm/smp.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SMP_H
-#define __ASM_SMP_H
+#ifndef ASM__PPC__SMP_H
+#define ASM__PPC__SMP_H
 
 #include <xen/cpumask.h>
 #include <xen/percpu.h>
diff --git a/xen/arch/ppc/include/asm/spinlock.h b/xen/arch/ppc/include/asm/spinlock.h
index 4bdb4b1e98..890e48c6e6 100644
--- a/xen/arch/ppc/include/asm/spinlock.h
+++ b/xen/arch/ppc/include/asm/spinlock.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SPINLOCK_H
-#define __ASM_SPINLOCK_H
+#ifndef ASM__PPC__SPINLOCK_H
+#define ASM__PPC__SPINLOCK_H
 
 #define arch_lock_acquire_barrier() smp_mb()
 #define arch_lock_release_barrier() smp_mb()
@@ -12,4 +12,4 @@
     arch_lock_signal();             \
 })
 
-#endif /* __ASM_SPINLOCK_H */
+#endif /* ASM__PPC__SPINLOCK_H */
diff --git a/xen/arch/ppc/include/asm/string.h b/xen/arch/ppc/include/asm/string.h
index 7a420e05e4..cf65ca1c73 100644
--- a/xen/arch/ppc/include/asm/string.h
+++ b/xen/arch/ppc/include/asm/string.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef _ASM_PPC_STRING_H
-#define _ASM_PPC_STRING_H
+#ifndef ASM__PPC__STRING_H
+#define ASM__PPC__STRING_H
 
-#endif /* _ASM_PPC_STRING_H */
+#endif /* ASM__PPC__STRING_H */
diff --git a/xen/arch/ppc/include/asm/system.h b/xen/arch/ppc/include/asm/system.h
index a17072bafd..e69a237d5e 100644
--- a/xen/arch/ppc/include/asm/system.h
+++ b/xen/arch/ppc/include/asm/system.h
@@ -7,8 +7,8 @@
  *          Shawn Anastasio <sanastasio@raptorengineering.com>
  */
 
-#ifndef _ASM_SYSTEM_H_
-#define _ASM_SYSTEM_H_
+#ifndef ASM__PPC__SYSTEM_H
+#define ASM__PPC__SYSTEM_H
 
 #include <xen/lib.h>
 #include <asm/memory.h>
diff --git a/xen/arch/ppc/include/asm/time.h b/xen/arch/ppc/include/asm/time.h
index f23eec173e..f0d426a26a 100644
--- a/xen/arch/ppc/include/asm/time.h
+++ b/xen/arch/ppc/include/asm/time.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_TIME_H__
-#define __ASM_PPC_TIME_H__
+#ifndef ASM__PPC__TIME_H
+#define ASM__PPC__TIME_H
 
 #include <xen/bug.h>
 #include <asm/processor.h>
@@ -20,4 +20,4 @@ static inline cycles_t get_cycles(void)
     return mfspr(SPRN_TBRL);
 }
 
-#endif /* __ASM_PPC_TIME_H__ */
+#endif /* ASM__PPC__TIME_H */
diff --git a/xen/arch/ppc/include/asm/types.h b/xen/arch/ppc/include/asm/types.h
index ffaf378a4d..1abd074489 100644
--- a/xen/arch/ppc/include/asm/types.h
+++ b/xen/arch/ppc/include/asm/types.h
@@ -1,11 +1,11 @@
 /* from xen/arch/x86/include/asm/types.h */
 
-#ifndef _ASM_PPC_TYPES_H
-#define _ASM_PPC_TYPES_H
+#ifndef ASM__PPC__TYPES_H
+#define ASM__PPC__TYPES_H
 
 typedef unsigned long paddr_t;
 typedef unsigned long vaddr_t;
 #define INVALID_PADDR (~0UL)
 #define PRIpaddr "016lx"
 
-#endif /* _ASM_PPC_TYPES_H */
+#endif /* ASM__PPC__TYPES_H */
-- 
2.34.1


