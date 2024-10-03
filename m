Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFA698EF3A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809415.1221754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKwU-0007ep-EL; Thu, 03 Oct 2024 12:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809415.1221754; Thu, 03 Oct 2024 12:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKwU-0007bo-8p; Thu, 03 Oct 2024 12:28:26 +0000
Received: by outflank-mailman (input) for mailman id 809415;
 Thu, 03 Oct 2024 12:28:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKnx-00043u-J4
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:37 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0ae6fc3-8181-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 14:19:35 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c5bca6603aso1096987a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:35 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:34 -0700 (PDT)
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
X-Inumbo-ID: c0ae6fc3-8181-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957975; x=1728562775; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig/jx3h9dHpZQ51svxnNJO+Mhrf0xrweSMpcWRyQH4o=;
        b=ZNZF40x8kjHF5WEII8zJy7W77VbDCR5X0bqzH5V6KQbsbukmbyHAk2mhGkfXZ3eROz
         weHqjja8P7RwfJ/4SRlgL7LduzMYFVOERQ7ftAoFcghLYkAl3cg4Xdg+u1Wby03W8+sh
         3DR5E0FyAS4dD2JdlYwY3+4IGDXKlQqP+t4VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957975; x=1728562775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ig/jx3h9dHpZQ51svxnNJO+Mhrf0xrweSMpcWRyQH4o=;
        b=NCCEngQwQS8wBTqvsiAtIPUdDnDLHFgnTadIdpwzCI/qPb7pQtO6bBBgydI1u3KBzB
         hiNxjOF/UnrmOKuEggICm5d0yEqxGMu8TjrgX0b6Z5Zen9jqHoKtvD8/lGi7e7Iy2YVU
         7ruse5r/BnGccgjqB/8fJtsB7zjjjBlSKL5Ax28PbJ+IbkMtv0fN3/bzwY2a10zwXDyb
         oUfazcmhkD8jWc3IQE6w5KshRHt17HRdmWHTxIPLC6z7qFvMTXaPfWoApFByDQbju3um
         AGHFlybuMU9onlfV7E6OcrLNowPrW8/0Hw/6ASl6SL8dP8eADtf2yMIIiVPBruTY3PKW
         MzdQ==
X-Gm-Message-State: AOJu0YzRbqdeMrjL1MOeJ6f3au8o2GoFBz6iSfnj825mV1mmbe06EixK
	JjquOfOyKA7pVoxifgHt+rvmW9UQAZ5Mwkl0USuGOTLtnZJhyqnEybw3Qu4+kW1ZuKhrv5fKg7s
	N
X-Google-Smtp-Source: AGHT+IFjwicSgQLDsgsPyddEr53ZGW79DGphRXNFKItOqqWwt9mZCaZqp/FrZO2iio0fIcpv3VrPnA==
X-Received: by 2002:a17:907:7f8e:b0:a8a:8c4c:3e2a with SMTP id a640c23a62f3a-a98f823472fmr507530966b.23.1727957974629;
        Thu, 03 Oct 2024 05:19:34 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH 16/20] xen: Update header guards - RISC-V
Date: Thu,  3 Oct 2024 13:19:04 +0100
Message-Id: <20241003121908.362888-17-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to RISC-V.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/riscv/include/asm/acpi.h           | 6 +++---
 xen/arch/riscv/include/asm/asm.h            | 6 +++---
 xen/arch/riscv/include/asm/atomic.h         | 6 +++---
 xen/arch/riscv/include/asm/bitops.h         | 6 +++---
 xen/arch/riscv/include/asm/bug.h            | 6 +++---
 xen/arch/riscv/include/asm/byteorder.h      | 6 +++---
 xen/arch/riscv/include/asm/cache.h          | 6 +++---
 xen/arch/riscv/include/asm/cmpxchg.h        | 6 +++---
 xen/arch/riscv/include/asm/config.h         | 6 +++---
 xen/arch/riscv/include/asm/cpufeature.h     | 6 +++---
 xen/arch/riscv/include/asm/csr.h            | 6 +++---
 xen/arch/riscv/include/asm/current.h        | 6 +++---
 xen/arch/riscv/include/asm/domain.h         | 6 +++---
 xen/arch/riscv/include/asm/early_printk.h   | 6 +++---
 xen/arch/riscv/include/asm/event.h          | 6 +++---
 xen/arch/riscv/include/asm/fence.h          | 6 +++---
 xen/arch/riscv/include/asm/fixmap.h         | 6 +++---
 xen/arch/riscv/include/asm/flushtlb.h       | 6 +++---
 xen/arch/riscv/include/asm/guest_access.h   | 6 +++---
 xen/arch/riscv/include/asm/guest_atomics.h  | 6 +++---
 xen/arch/riscv/include/asm/io.h             | 6 +++---
 xen/arch/riscv/include/asm/irq.h            | 6 +++---
 xen/arch/riscv/include/asm/mm.h             | 6 +++---
 xen/arch/riscv/include/asm/monitor.h        | 6 +++---
 xen/arch/riscv/include/asm/nospec.h         | 6 +++---
 xen/arch/riscv/include/asm/p2m.h            | 6 +++---
 xen/arch/riscv/include/asm/page-bits.h      | 6 +++---
 xen/arch/riscv/include/asm/page.h           | 6 +++---
 xen/arch/riscv/include/asm/pmap.h           | 6 +++---
 xen/arch/riscv/include/asm/processor.h      | 6 +++---
 xen/arch/riscv/include/asm/regs.h           | 6 +++---
 xen/arch/riscv/include/asm/riscv_encoding.h | 4 ++--
 xen/arch/riscv/include/asm/sbi.h            | 6 +++---
 xen/arch/riscv/include/asm/setup.h          | 6 +++---
 xen/arch/riscv/include/asm/smp.h            | 4 ++--
 xen/arch/riscv/include/asm/spinlock.h       | 6 +++---
 xen/arch/riscv/include/asm/string.h         | 6 +++---
 xen/arch/riscv/include/asm/system.h         | 6 +++---
 xen/arch/riscv/include/asm/time.h           | 6 +++---
 xen/arch/riscv/include/asm/traps.h          | 6 +++---
 xen/arch/riscv/include/asm/types.h          | 6 +++---
 41 files changed, 121 insertions(+), 121 deletions(-)

diff --git a/xen/arch/riscv/include/asm/acpi.h b/xen/arch/riscv/include/asm/acpi.h
index 3aef993d81..f0b5e90969 100644
--- a/xen/arch/riscv/include/asm/acpi.h
+++ b/xen/arch/riscv/include/asm/acpi.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
-#ifndef __ASM_RISCV_ACPI_H
-#define __ASM_RISCV_ACPI_H
+#ifndef ASM__RISCV__ACPI_H
+#define ASM__RISCV__ACPI_H
 
-#endif /* __ASM_RISCV_ACPI_H */
+#endif /* ASM__RISCV__ACPI_H */
diff --git a/xen/arch/riscv/include/asm/asm.h b/xen/arch/riscv/include/asm/asm.h
index 87a3fd250b..8b0403e2e4 100644
--- a/xen/arch/riscv/include/asm/asm.h
+++ b/xen/arch/riscv/include/asm/asm.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2015 Regents of the University of California
  */
 
-#ifndef _ASM_RISCV_ASM_H
-#define _ASM_RISCV_ASM_H
+#ifndef ASM__RISCV__ASM_H
+#define ASM__RISCV__ASM_H
 
 #ifdef __ASSEMBLY__
 #include <xen/linkage.h>
@@ -52,4 +52,4 @@
 #error "Unexpected __SIZEOF_SHORT__"
 #endif
 
-#endif /* _ASM_RISCV_ASM_H */
+#endif /* ASM__RISCV__ASM_H */
diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
index 9669a3286d..8e0425cea0 100644
--- a/xen/arch/riscv/include/asm/atomic.h
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -19,8 +19,8 @@
  * Copyright (C) 2024 Vates SAS
  */
 
-#ifndef _ASM_RISCV_ATOMIC_H
-#define _ASM_RISCV_ATOMIC_H
+#ifndef ASM__RISCV__ATOMIC_H
+#define ASM__RISCV__ATOMIC_H
 
 #include <xen/atomic.h>
 
@@ -266,7 +266,7 @@ ATOMIC_OPS()
 #undef ATOMIC_OPS
 #undef ATOMIC_OP
 
-#endif /* _ASM_RISCV_ATOMIC_H */
+#endif /* ASM__RISCV__ATOMIC_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
index 7f7af3fda1..9a6f576187 100644
--- a/xen/arch/riscv/include/asm/bitops.h
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2012 Regents of the University of California */
 
-#ifndef _ASM_RISCV_BITOPS_H
-#define _ASM_RISCV_BITOPS_H
+#ifndef ASM__RISCV__BITOPS_H
+#define ASM__RISCV__BITOPS_H
 
 #include <asm/system.h>
 
@@ -125,7 +125,7 @@ static inline void clear_bit(int nr, volatile void *p)
 #undef NOT
 #undef __AMO
 
-#endif /* _ASM_RISCV_BITOPS_H */
+#endif /* ASM__RISCV__BITOPS_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
index e3d41f411a..fa18dba20e 100644
--- a/xen/arch/riscv/include/asm/bug.h
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -4,8 +4,8 @@
  * Copyright (C) 2021-2023 Vates
  *
  */
-#ifndef _ASM_RISCV_BUG_H
-#define _ASM_RISCV_BUG_H
+#ifndef ASM__RISCV__BUG_H
+#define ASM__RISCV__BUG_H
 
 #ifndef __ASSEMBLY__
 
@@ -32,4 +32,4 @@
 
 #endif /* !__ASSEMBLY__ */
 
-#endif /* _ASM_RISCV_BUG_H */
+#endif /* ASM__RISCV__BUG_H */
diff --git a/xen/arch/riscv/include/asm/byteorder.h b/xen/arch/riscv/include/asm/byteorder.h
index 320a03c88f..8ca65e1b33 100644
--- a/xen/arch/riscv/include/asm/byteorder.h
+++ b/xen/arch/riscv/include/asm/byteorder.h
@@ -1,11 +1,11 @@
-#ifndef __ASM_RISCV_BYTEORDER_H__
-#define __ASM_RISCV_BYTEORDER_H__
+#ifndef ASM__RISCV__BYTEORDER_H
+#define ASM__RISCV__BYTEORDER_H
 
 #define __BYTEORDER_HAS_U64__
 
 #include <xen/byteorder/little_endian.h>
 
-#endif /* __ASM_RISCV_BYTEORDER_H__ */
+#endif /* ASM__RISCV__BYTEORDER_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
index 69573eb051..9a9e5162ab 100644
--- a/xen/arch/riscv/include/asm/cache.h
+++ b/xen/arch/riscv/include/asm/cache.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
-#ifndef _ASM_RISCV_CACHE_H
-#define _ASM_RISCV_CACHE_H
+#ifndef ASM__RISCV__CACHE_H
+#define ASM__RISCV__CACHE_H
 
-#endif /* _ASM_RISCV_CACHE_H */
+#endif /* ASM__RISCV__CACHE_H */
diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
index 47d5299e62..662d3fd5d4 100644
--- a/xen/arch/riscv/include/asm/cmpxchg.h
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright (C) 2014 Regents of the University of California */
 
-#ifndef _ASM_RISCV_CMPXCHG_H
-#define _ASM_RISCV_CMPXCHG_H
+#ifndef ASM__RISCV__CMPXCHG_H
+#define ASM__RISCV__CMPXCHG_H
 
 #include <xen/compiler.h>
 #include <xen/lib.h>
@@ -242,7 +242,7 @@ static always_inline unsigned long __cmpxchg(volatile void *ptr,
               sizeof(*(ptr))); \
 })
 
-#endif /* _ASM_RISCV_CMPXCHG_H */
+#endif /* ASM__RISCV__CMPXCHG_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 7dbb235685..ef68281653 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __RISCV_CONFIG_H__
-#define __RISCV_CONFIG_H__
+#ifndef ASM__RISCV__CONFIG_H
+#define ASM__RISCV__CONFIG_H
 
 #include <xen/const.h>
 #include <xen/page-size.h>
@@ -155,7 +155,7 @@
 
 #define IDENT_AREA_SIZE 64
 
-#endif /* __RISCV_CONFIG_H__ */
+#endif /* ASM__RISCV__CONFIG_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index c08b7d67ad..41a792b0b2 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_RISCV_CPUFEATURE_H
-#define __ASM_RISCV_CPUFEATURE_H
+#ifndef ASM__RISCV__CPUFEATURE_H
+#define ASM__RISCV__CPUFEATURE_H
 
 #ifndef __ASSEMBLY__
 
@@ -11,7 +11,7 @@ static inline unsigned int cpu_nr_siblings(unsigned int cpu)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __ASM_RISCV_CPUFEATURE_H */
+#endif /* ASM__RISCV__CPUFEATURE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index be57dcce1c..775f1f170f 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2015 Regents of the University of California
  */
 
-#ifndef _ASM_RISCV_CSR_H
-#define _ASM_RISCV_CSR_H
+#ifndef ASM__RISCV__CSR_H
+#define ASM__RISCV__CSR_H
 
 #include <asm/asm.h>
 #include <xen/const.h>
@@ -80,4 +80,4 @@
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* _ASM_RISCV_CSR_H */
+#endif /* ASM__RISCV__CSR_H */
diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index 6f1ec4e190..1485bceea4 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __ASM_CURRENT_H
-#define __ASM_CURRENT_H
+#ifndef ASM__RISCV__CURRENT_H
+#define ASM__RISCV__CURRENT_H
 
 #include <xen/bug.h>
 #include <xen/cache.h>
@@ -54,4 +54,4 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __ASM_CURRENT_H */
+#endif /* ASM__RISCV__CURRENT_H */
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 027bfa8a93..c3d965a559 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_RISCV_DOMAIN_H__
-#define __ASM_RISCV_DOMAIN_H__
+#ifndef ASM__RISCV__DOMAIN_H
+#define ASM__RISCV__DOMAIN_H
 
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
@@ -39,7 +39,7 @@ static inline void update_guest_memory_policy(struct vcpu *v,
 
 static inline void arch_vcpu_block(struct vcpu *v) {}
 
-#endif /* __ASM_RISCV_DOMAIN_H__ */
+#endif /* ASM__RISCV__DOMAIN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/riscv/include/asm/early_printk.h
index 85e60df33a..2750045bdd 100644
--- a/xen/arch/riscv/include/asm/early_printk.h
+++ b/xen/arch/riscv/include/asm/early_printk.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __EARLY_PRINTK_H__
-#define __EARLY_PRINTK_H__
+#ifndef ASM__RISCV__EARLY_PRINTK_H
+#define ASM__RISCV__EARLY_PRINTK_H
 
 #include <xen/early_printk.h>
 
@@ -11,4 +11,4 @@ void early_printk(const char *str);
 static inline void early_printk(const char *s) {};
 #endif
 
-#endif /* __EARLY_PRINTK_H__ */
+#endif /* ASM__RISCV__EARLY_PRINTK_H */
diff --git a/xen/arch/riscv/include/asm/event.h b/xen/arch/riscv/include/asm/event.h
index fbad8543fa..c7bb8c0fa6 100644
--- a/xen/arch/riscv/include/asm/event.h
+++ b/xen/arch/riscv/include/asm/event.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_RISCV_EVENT_H__
-#define __ASM_RISCV_EVENT_H__
+#ifndef ASM__RISCV__EVENT_H
+#define ASM__RISCV__EVENT_H
 
 #include <xen/lib.h>
 
@@ -29,7 +29,7 @@ static inline bool arch_virq_is_global(unsigned int virq)
     return true;
 }
 
-#endif /* __ASM_RISCV_EVENT_H__ */
+#endif /* ASM__RISCV__EVENT_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/riscv/include/asm/fence.h b/xen/arch/riscv/include/asm/fence.h
index 27f46fa897..edfaac49cd 100644
--- a/xen/arch/riscv/include/asm/fence.h
+++ b/xen/arch/riscv/include/asm/fence.h
@@ -1,9 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef _ASM_RISCV_FENCE_H
-#define _ASM_RISCV_FENCE_H
+#ifndef ASM__RISCV__FENCE_H
+#define ASM__RISCV__FENCE_H
 
 #define RISCV_ACQUIRE_BARRIER   "\tfence r , rw\n"
 #define RISCV_RELEASE_BARRIER   "\tfence rw, w\n"
 #define RISCV_FULL_BARRIER      "\tfence rw, rw\n"
 
-#endif	/* _ASM_RISCV_FENCE_H */
+#endif	/* ASM__RISCV__FENCE_H */
diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
index 63732df36c..818c8ce07b 100644
--- a/xen/arch/riscv/include/asm/fixmap.h
+++ b/xen/arch/riscv/include/asm/fixmap.h
@@ -2,8 +2,8 @@
 /*
  * fixmap.h: compile-time virtual memory allocation
  */
-#ifndef ASM_FIXMAP_H
-#define ASM_FIXMAP_H
+#ifndef ASM__RISCV__FIXMAP_H
+#define ASM__RISCV__FIXMAP_H
 
 #include <xen/bug.h>
 #include <xen/page-size.h>
@@ -43,4 +43,4 @@ static inline unsigned int virt_to_fix(vaddr_t vaddr)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* ASM_FIXMAP_H */
+#endif /* ASM__RISCV__FIXMAP_H */
diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
index 43214f5e95..51c8f753c5 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_RISCV_FLUSHTLB_H__
-#define __ASM_RISCV_FLUSHTLB_H__
+#ifndef ASM__RISCV__FLUSHTLB_H
+#define ASM__RISCV__FLUSHTLB_H
 
 #include <xen/bug.h>
 #include <xen/cpumask.h>
@@ -37,7 +37,7 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
 /* Flush specified CPUs' TLBs */
 void arch_flush_tlb_mask(const cpumask_t *mask);
 
-#endif /* __ASM_RISCV_FLUSHTLB_H__ */
+#endif /* ASM__RISCV__FLUSHTLB_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
index c55951f538..7cd51fbbde 100644
--- a/xen/arch/riscv/include/asm/guest_access.h
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_RISCV_GUEST_ACCESS_H__
-#define __ASM_RISCV_GUEST_ACCESS_H__
+#ifndef ASM__RISCV__GUEST_ACCESS_H
+#define ASM__RISCV__GUEST_ACCESS_H
 
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
 unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
@@ -18,7 +18,7 @@ unsigned long raw_clear_guest(void *to, unsigned int len);
 #define guest_handle_okay(hnd, nr) (1)
 #define guest_handle_subrange_okay(hnd, first, last) (1)
 
-#endif /* __ASM_RISCV_GUEST_ACCESS_H__ */
+#endif /* ASM__RISCV__GUEST_ACCESS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/riscv/include/asm/guest_atomics.h b/xen/arch/riscv/include/asm/guest_atomics.h
index de54914454..22a7551804 100644
--- a/xen/arch/riscv/include/asm/guest_atomics.h
+++ b/xen/arch/riscv/include/asm/guest_atomics.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_RISCV_GUEST_ATOMICS_H
-#define __ASM_RISCV_GUEST_ATOMICS_H
+#ifndef ASM__RISCV__GUEST_ATOMICS_H
+#define ASM__RISCV__GUEST_ATOMICS_H
 
 #include <xen/bug.h>
 
@@ -32,7 +32,7 @@ guest_testop(test_and_change_bit)
 
 #define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
 
-#endif /* __ASM_RISCV_GUEST_ATOMICS_H */
+#endif /* ASM__RISCV__GUEST_ATOMICS_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
index 8d9535e973..55f329dde3 100644
--- a/xen/arch/riscv/include/asm/io.h
+++ b/xen/arch/riscv/include/asm/io.h
@@ -35,8 +35,8 @@
  * Copyright (C) 2024 Vates
  */
 
-#ifndef _ASM_RISCV_IO_H
-#define _ASM_RISCV_IO_H
+#ifndef ASM__RISCV__IO_H
+#define ASM__RISCV__IO_H
 
 #include <asm/byteorder.h>
 
@@ -156,7 +156,7 @@ static inline uint64_t __raw_readq(const volatile void __iomem *addr)
 #define writel(v, c)    ({ __io_bw(); writel_cpu(v, c); __io_aw(); })
 #define writeq(v, c)    ({ __io_bw(); writeq_cpu(v, c); __io_aw(); })
 
-#endif /* _ASM_RISCV_IO_H */
+#endif /* ASM__RISCV__IO_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 0dfd4d6e8a..2a48da2651 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_RISCV_IRQ_H__
-#define __ASM_RISCV_IRQ_H__
+#ifndef ASM__RISCV__IRQ_H
+#define ASM__RISCV__IRQ_H
 
 #include <xen/bug.h>
 
@@ -25,7 +25,7 @@ static inline void arch_move_irqs(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-#endif /* __ASM_RISCV_IRQ_H__ */
+#endif /* ASM__RISCV__IRQ_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 4b7b00b850..5c79f3def3 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef _ASM_RISCV_MM_H
-#define _ASM_RISCV_MM_H
+#ifndef ASM__RISCV__MM_H
+#define ASM__RISCV__MM_H
 
 #include <public/xen.h>
 #include <xen/bug.h>
@@ -261,4 +261,4 @@ void setup_fixmap_mappings(void);
 
 void *early_fdt_map(paddr_t fdt_paddr);
 
-#endif /* _ASM_RISCV_MM_H */
+#endif /* ASM__RISCV__MM_H */
diff --git a/xen/arch/riscv/include/asm/monitor.h b/xen/arch/riscv/include/asm/monitor.h
index f4fe2c0690..fb3d3e8e3a 100644
--- a/xen/arch/riscv/include/asm/monitor.h
+++ b/xen/arch/riscv/include/asm/monitor.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_RISCV_MONITOR_H__
-#define __ASM_RISCV_MONITOR_H__
+#ifndef ASM__RISCV__MONITOR_H
+#define ASM__RISCV__MONITOR_H
 
 #include <xen/bug.h>
 
@@ -14,7 +14,7 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
     return 0;
 }
 
-#endif /* __ASM_RISCV_MONITOR_H__ */
+#endif /* ASM__RISCV__MONITOR_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/nospec.h b/xen/arch/riscv/include/asm/nospec.h
index e30f0a781b..f9b0241c98 100644
--- a/xen/arch/riscv/include/asm/nospec.h
+++ b/xen/arch/riscv/include/asm/nospec.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright (C) 2024 Vates */
 
-#ifndef _ASM_RISCV_NOSPEC_H
-#define _ASM_RISCV_NOSPEC_H
+#ifndef ASM__RISCV__NOSPEC_H
+#define ASM__RISCV__NOSPEC_H
 
 static inline bool evaluate_nospec(bool condition)
 {
@@ -13,7 +13,7 @@ static inline void block_speculation(void)
 {
 }
 
-#endif /* _ASM_RISCV_NOSPEC_H */
+#endif /* ASM__RISCV__NOSPEC_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 26860c0ae7..28f57a74f2 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_RISCV_P2M_H__
-#define __ASM_RISCV_P2M_H__
+#ifndef ASM__RISCV__P2M_H
+#define ASM__RISCV__P2M_H
 
 #include <xen/errno.h>
 
@@ -93,7 +93,7 @@ static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
     /* Not supported on RISCV. */
 }
 
-#endif /* __ASM_RISCV_P2M_H__ */
+#endif /* ASM__RISCV__P2M_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/page-bits.h b/xen/arch/riscv/include/asm/page-bits.h
index 8f1f474371..788c7d9518 100644
--- a/xen/arch/riscv/include/asm/page-bits.h
+++ b/xen/arch/riscv/include/asm/page-bits.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __RISCV_PAGE_BITS_H__
-#define __RISCV_PAGE_BITS_H__
+#ifndef ASM__RISCV__PAGE_BITS_H
+#define ASM__RISCV__PAGE_BITS_H
 
 #define PAGE_SHIFT              12 /* 4 KiB Pages */
 #define PADDR_BITS              56 /* 44-bit PPN */
@@ -16,4 +16,4 @@
 
 #define PTE_PPN_SHIFT           10
 
-#endif /* __RISCV_PAGE_BITS_H__ */
+#endif /* ASM__RISCV__PAGE_BITS_H */
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 89fa290697..91b1194b55 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef _ASM_RISCV_PAGE_H
-#define _ASM_RISCV_PAGE_H
+#ifndef ASM__RISCV__PAGE_H
+#define ASM__RISCV__PAGE_H
 
 #ifndef __ASSEMBLY__
 
@@ -182,4 +182,4 @@ static inline pte_t pte_from_mfn(mfn_t mfn, unsigned int flags)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* _ASM_RISCV_PAGE_H */
+#endif /* ASM__RISCV__PAGE_H */
diff --git a/xen/arch/riscv/include/asm/pmap.h b/xen/arch/riscv/include/asm/pmap.h
index 60065c996f..146dd29f95 100644
--- a/xen/arch/riscv/include/asm/pmap.h
+++ b/xen/arch/riscv/include/asm/pmap.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef ASM_PMAP_H
-#define ASM_PMAP_H
+#ifndef ASM__RISCV__PMAP_H
+#define ASM__RISCV__PMAP_H
 
 #include <xen/bug.h>
 #include <xen/init.h>
@@ -33,4 +33,4 @@ static inline void __init arch_pmap_unmap(unsigned int slot)
     flush_tlb_one_local(FIXMAP_ADDR(slot));
 }
 
-#endif /* ASM_PMAP_H */
+#endif /* ASM__RISCV__PMAP_H */
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index e42b353b4c..90b8009563 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -7,8 +7,8 @@
  *
  */
 
-#ifndef _ASM_RISCV_PROCESSOR_H
-#define _ASM_RISCV_PROCESSOR_H
+#ifndef ASM__RISCV__PROCESSOR_H
+#define ASM__RISCV__PROCESSOR_H
 
 #ifndef __ASSEMBLY__
 
@@ -93,7 +93,7 @@ static inline void sfence_vma(void)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* _ASM_RISCV_PROCESSOR_H */
+#endif /* ASM__RISCV__PROCESSOR_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/regs.h b/xen/arch/riscv/include/asm/regs.h
index c70ea2aa0c..218b9455bd 100644
--- a/xen/arch/riscv/include/asm/regs.h
+++ b/xen/arch/riscv/include/asm/regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ARM_RISCV_REGS_H__
-#define __ARM_RISCV_REGS_H__
+#ifndef ASM__RISCV__REGS_H
+#define ASM__RISCV__REGS_H
 
 #ifndef __ASSEMBLY__
 
@@ -17,7 +17,7 @@ static inline bool guest_mode(const struct cpu_user_regs *r)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __ARM_RISCV_REGS_H__ */
+#endif /* ASM__RISCV__REGS_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index e31e94e77e..6cc8f4eb45 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -6,8 +6,8 @@
  *   Anup Patel <anup.patel@wdc.com>
  */
 
-#ifndef __RISCV_ENCODING_H__
-#define __RISCV_ENCODING_H__
+#ifndef ASM__RISCV__RISCV_ENCODING_H
+#define ASM__RISCV__RISCV_ENCODING_H
 
 #define _UL(X) _AC(X, UL)
 #define _ULL(X) _AC(X, ULL)
diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 5947fed779..527d773277 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -9,8 +9,8 @@
  * Copyright (c) 2019 Western Digital Corporation or its affiliates.
  */
 
-#ifndef __ASM_RISCV_SBI_H__
-#define __ASM_RISCV_SBI_H__
+#ifndef ASM__RISCV__SBI_H
+#define ASM__RISCV__SBI_H
 
 #include <xen/cpumask.h>
 
@@ -96,4 +96,4 @@ int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
  */
 int sbi_init(void);
 
-#endif /* __ASM_RISCV_SBI_H__ */
+#endif /* ASM__RISCV__SBI_H */
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 7613a5dbd0..c0214a9bf2 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -1,11 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __ASM_RISCV_SETUP_H__
-#define __ASM_RISCV_SETUP_H__
+#ifndef ASM__RISCV__SETUP_H
+#define ASM__RISCV__SETUP_H
 
 #define max_init_domid (0)
 
-#endif /* __ASM_RISCV_SETUP_H__ */
+#endif /* ASM__RISCV__SETUP_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index a824be8e78..45ee14d535 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_RISCV_SMP_H
-#define __ASM_RISCV_SMP_H
+#ifndef ASM__RISCV__SMP_H
+#define ASM__RISCV__SMP_H
 
 #include <xen/cpumask.h>
 #include <xen/percpu.h>
diff --git a/xen/arch/riscv/include/asm/spinlock.h b/xen/arch/riscv/include/asm/spinlock.h
index bf45a7f005..4a607eba52 100644
--- a/xen/arch/riscv/include/asm/spinlock.h
+++ b/xen/arch/riscv/include/asm/spinlock.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_RISCV_SPINLOCK_H
-#define __ASM_RISCV_SPINLOCK_H
+#ifndef ASM__RISCV__SPINLOCK_H
+#define ASM__RISCV__SPINLOCK_H
 
 #define arch_lock_acquire_barrier() smp_mb()
 #define arch_lock_release_barrier() smp_mb()
@@ -12,4 +12,4 @@
     arch_lock_signal();             \
 })
 
-#endif /* __ASM_RISCV_SPINLOCK_H */
+#endif /* ASM__RISCV__SPINLOCK_H */
diff --git a/xen/arch/riscv/include/asm/string.h b/xen/arch/riscv/include/asm/string.h
index a26ba8f5c6..75a2048fb1 100644
--- a/xen/arch/riscv/include/asm/string.h
+++ b/xen/arch/riscv/include/asm/string.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
-#ifndef _ASM_RISCV_STRING_H
-#define _ASM_RISCV_STRING_H
+#ifndef ASM__RISCV__STRING_H
+#define ASM__RISCV__STRING_H
 
-#endif /* _ASM_RISCV_STRING_H */
+#endif /* ASM__RISCV__STRING_H */
diff --git a/xen/arch/riscv/include/asm/system.h b/xen/arch/riscv/include/asm/system.h
index f76bafd168..7b78d11e04 100644
--- a/xen/arch/riscv/include/asm/system.h
+++ b/xen/arch/riscv/include/asm/system.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef _ASM_RISCV_SYSTEM_H
-#define _ASM_RISCV_SYSTEM_H
+#ifndef ASM__RISCV__SYSTEM_H
+#define ASM__RISCV__SYSTEM_H
 
 #include <xen/stdbool.h>
 
@@ -78,7 +78,7 @@ static inline bool local_irq_is_enabled(void)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* _ASM_RISCV_SYSTEM_H */
+#endif /* ASM__RISCV__SYSTEM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
index affeb0506a..fc1572e9b4 100644
--- a/xen/arch/riscv/include/asm/time.h
+++ b/xen/arch/riscv/include/asm/time.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_RISCV_TIME_H__
-#define __ASM_RISCV_TIME_H__
+#ifndef ASM__RISCV__TIME_H
+#define ASM__RISCV__TIME_H
 
 #include <xen/bug.h>
 #include <asm/csr.h>
@@ -19,7 +19,7 @@ static inline cycles_t get_cycles(void)
     return csr_read(CSR_TIME);
 }
 
-#endif /* __ASM_RISCV_TIME_H__ */
+#endif /* ASM__RISCV__TIME_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index c30118e095..72b8f6c475 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __ASM_TRAPS_H__
-#define __ASM_TRAPS_H__
+#ifndef ASM__RISCV__TRAPS_H
+#define ASM__RISCV__TRAPS_H
 
 #include <asm/processor.h>
 
@@ -13,4 +13,4 @@ void trap_init(void);
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __ASM_TRAPS_H__ */
+#endif /* ASM__RISCV__TRAPS_H */
diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
index 59358fd698..d801596a20 100644
--- a/xen/arch/riscv/include/asm/types.h
+++ b/xen/arch/riscv/include/asm/types.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __RISCV_TYPES_H__
-#define __RISCV_TYPES_H__
+#ifndef ASM__RISCV__TYPES_H
+#define ASM__RISCV__TYPES_H
 
 #if defined(CONFIG_RISCV_32)
 
@@ -25,7 +25,7 @@ typedef u64 register_t;
 
 #endif
 
-#endif /* __RISCV_TYPES_H__ */
+#endif /* ASM__RISCV__TYPES_H */
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


