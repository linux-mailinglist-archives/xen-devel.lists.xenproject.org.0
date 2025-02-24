Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BF4A42763
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 17:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895265.1303871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazF-00046W-6b; Mon, 24 Feb 2025 16:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895265.1303871; Mon, 24 Feb 2025 16:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmazF-00044I-29; Mon, 24 Feb 2025 16:07:17 +0000
Received: by outflank-mailman (input) for mailman id 895265;
 Mon, 24 Feb 2025 16:07:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48j1=VP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmazD-0003oc-8G
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 16:07:15 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69429b96-f2c9-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 17:07:14 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43aac0390e8so5807215e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 08:07:14 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02d6837sm109356675e9.13.2025.02.24.08.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 08:07:12 -0800 (PST)
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
X-Inumbo-ID: 69429b96-f2c9-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740413233; x=1741018033; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSib/EZ8nx2SutdLKPSjtycKdGYhGJ9Th7LeAr9+rZg=;
        b=Tzo17SChrOR55/xre0GA5ooioj2s8YPNoINE/8+Na4lO+8GcNnrtZFDJgcYjw2NnDM
         fQMUoQadqxBOyxv7l5aRqrG1wHxIi/bjD5hwDBAYPNp0imcgzN1kj5kN6idl5yCjwXCL
         5JvqXktkA6FqthKSzKi+in2R8IQIA5DB2Y4E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413233; x=1741018033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSib/EZ8nx2SutdLKPSjtycKdGYhGJ9Th7LeAr9+rZg=;
        b=Xz++5rGVR1cuYwyr/MNc6+7ZX20fBnrOyD0Edj4WfcTy/57ufLeSL6/GgeRMozfHvf
         VYs6EKbXJ15rj+0wkzmf9V1uSxf7yMwHoxhSC7G2I04J0Dtqm56Q2VzISTQQCXZpc72L
         zBw6iItLp5gCquBGjuSGmXKmyPUHk4huuMbB2jcCKox3YVELw/LHjUv+cDtqiNYZJDnp
         kJUAjmddbxC2a7m5AU21QPccLqgqBFkP5/Pyx/ReJKwvY/VEBRnIchlTEExeYt2Tkg28
         sqxkPPv0knojp4rN4KRiVVO/QacSOx1aQ3JaEw8LgWvxgXKQWvqqNy+c/k5mki4OuaEQ
         uE+A==
X-Gm-Message-State: AOJu0YxjFUAomSMdWvhKxVqDDYUenPhubnhbhEkzlr7d8e5F4G9hW+w6
	STRTPGwaSc/2GBsrQ4GinibKiopNUpmNURBS6XEG3LRqMXk5RBa7RFf0l7ymhhKi4YUrdQGgENh
	j
X-Gm-Gg: ASbGnctc+BDERw8jyYzECULJQR69s1NX2kKYSsiuxrBXuQHUnpPIgbjjoMA/6l8If3B
	dv9R0wUcG5/YtlAxIrHukveDoEABE8McckfJtO0mVJwe/g5sQJ6FqvR7gFtbnIXtgm2OusmJPc3
	943G6OO7zfx1+bIAWiPxSyyJ6xH61FcqZ4tj5aUNsk6cJ/wftVYSYbyBsNJVefWx7ZQBysiyWHO
	UZDX5Yd8s1ZWCw749AgmFan1v3E5Rp8kHxabma3F4BxHw9XX/18O9A80G7MR1Rt3mA1OdUb5JTZ
	h6PAhsrkFtxDE6aaM8oexmLu2PZTXeiSNTgRStbdqH/lAK7MaliZyKMrlisO09FDlX+c//BCl4O
	UFH+Lug==
X-Google-Smtp-Source: AGHT+IFqiZjcx54aS0d8m6rMm6a0JZlZM8YL4Z03n29WxxFUBcrA3joDJSEXAa/m9b7miLumtpU8Sw==
X-Received: by 2002:a05:600c:1c08:b0:434:f0df:9f6 with SMTP id 5b1f17b1804b1-439ae1d97fbmr116167785e9.3.1740413232912;
        Mon, 24 Feb 2025 08:07:12 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/8] x86/IDT: Collect IDT related content idt.h
Date: Mon, 24 Feb 2025 16:05:03 +0000
Message-Id: <20250224160509.1117847-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Logic concerning the IDT is somewhat different to the other system tables, and
in particular ought not to be in asm/processor.h.  Collect it together a new
header.

While doing so, make a few minor adjustments:

 * Make set_ist() use volatile rather than ACCESS_ONCE(), as
   _write_gate_lower() already does, removing the need for xen/lib.h.

 * Move the BUILD_BUG_ON() from subarch_percpu_traps_init() into mm.c's
   build_assertions(), rather than including idt.h into x86_64/traps.c.

 * Drop UL from IST constants.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/common.c            |   1 +
 xen/arch/x86/crash.c                 |   1 +
 xen/arch/x86/domain.c                |   1 +
 xen/arch/x86/hvm/svm/svm.c           |   1 +
 xen/arch/x86/hvm/vmx/vmcs.c          |   1 +
 xen/arch/x86/include/asm/desc.h      |  76 ----------------
 xen/arch/x86/include/asm/idt.h       | 125 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/processor.h |  37 --------
 xen/arch/x86/machine_kexec.c         |   1 +
 xen/arch/x86/mm.c                    |   4 +
 xen/arch/x86/pv/traps.c              |   1 +
 xen/arch/x86/smpboot.c               |   1 +
 xen/arch/x86/traps.c                 |   1 +
 xen/arch/x86/x86_64/traps.c          |   3 -
 14 files changed, 138 insertions(+), 116 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/idt.h

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 1cc4adccb471..1540ab0007a0 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -9,6 +9,7 @@
 #include <asm/cpu-policy.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
+#include <asm/idt.h>
 #include <asm/io.h>
 #include <asm/mpspec.h>
 #include <asm/msr.h>
diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index 4afe0ad859a7..5f7d7b392a1f 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -26,6 +26,7 @@
 #include <asm/atomic.h>
 #include <asm/elf.h>
 #include <asm/hpet.h>
+#include <asm/idt.h>
 #include <asm/io_apic.h>
 #include <asm/nmi.h>
 #include <asm/shared.h>
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7b2549091fd3..d3db76833f3c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -47,6 +47,7 @@
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/viridian.h>
 #include <asm/i387.h>
+#include <asm/idt.h>
 #include <asm/io.h>
 #include <asm/ldt.h>
 #include <asm/mc146818rtc.h>
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 62905c2c7acd..ea78da4f4210 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -18,6 +18,7 @@
 #include <asm/cpufeature.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
+#include <asm/idt.h>
 #include <asm/gdbsx.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index fa9d8b3267ea..0136830ebcb7 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -25,6 +25,7 @@
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vvmx.h>
+#include <asm/idt.h>
 #include <asm/monitor.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
diff --git a/xen/arch/x86/include/asm/desc.h b/xen/arch/x86/include/asm/desc.h
index a1e0807d97ed..85fae6b2f9ae 100644
--- a/xen/arch/x86/include/asm/desc.h
+++ b/xen/arch/x86/include/asm/desc.h
@@ -115,82 +115,6 @@ typedef union {
     };
 } seg_desc_t;
 
-typedef union {
-    struct {
-        uint64_t a, b;
-    };
-    struct {
-        uint16_t addr0;
-        uint16_t cs;
-        uint8_t  ist; /* :3, 5 bits rsvd, but this yields far better code. */
-        uint8_t  type:4, s:1, dpl:2, p:1;
-        uint16_t addr1;
-        uint32_t addr2;
-        /* 32 bits rsvd. */
-    };
-} idt_entry_t;
-
-/* Write the lower 64 bits of an IDT Entry. This relies on the upper 32
- * bits of the address not changing, which is a safe assumption as all
- * functions we are likely to load will live inside the 1GB
- * code/data/bss address range.
- *
- * Ideally, we would use cmpxchg16b, but this is not supported on some
- * old AMD 64bit capable processors, and has no safe equivalent.
- */
-static inline void _write_gate_lower(volatile idt_entry_t *gate,
-                                     const idt_entry_t *new)
-{
-    ASSERT(gate->b == new->b);
-    gate->a = new->a;
-}
-
-#define _set_gate(gate_addr,type,dpl,addr)               \
-do {                                                     \
-    (gate_addr)->a = 0;                                  \
-    smp_wmb(); /* disable gate /then/ rewrite */         \
-    (gate_addr)->b =                                     \
-        ((unsigned long)(addr) >> 32);                   \
-    smp_wmb(); /* rewrite /then/ enable gate */          \
-    (gate_addr)->a =                                     \
-        (((unsigned long)(addr) & 0xFFFF0000UL) << 32) | \
-        ((unsigned long)(dpl) << 45) |                   \
-        ((unsigned long)(type) << 40) |                  \
-        ((unsigned long)(addr) & 0xFFFFUL) |             \
-        ((unsigned long)__HYPERVISOR_CS << 16) |         \
-        (1UL << 47);                                     \
-} while (0)
-
-static inline void _set_gate_lower(idt_entry_t *gate, unsigned long type,
-                                   unsigned long dpl, void *addr)
-{
-    idt_entry_t idte;
-    idte.b = gate->b;
-    idte.a =
-        (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
-        ((unsigned long)(dpl) << 45) |
-        ((unsigned long)(type) << 40) |
-        ((unsigned long)(addr) & 0xFFFFUL) |
-        ((unsigned long)__HYPERVISOR_CS << 16) |
-        (1UL << 47);
-    _write_gate_lower(gate, &idte);
-}
-
-/* Update the lower half handler of an IDT Entry, without changing any
- * other configuration. */
-static inline void _update_gate_addr_lower(idt_entry_t *gate, void *addr)
-{
-    idt_entry_t idte;
-    idte.a = gate->a;
-
-    idte.b = ((unsigned long)(addr) >> 32);
-    idte.a &= 0x0000FFFFFFFF0000ULL;
-    idte.a |= (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
-        ((unsigned long)(addr) & 0xFFFFUL);
-
-    _write_gate_lower(gate, &idte);
-}
-
 #define _set_tssldt_desc(desc,addr,limit,type)           \
 do {                                                     \
     (desc)[0].b = (desc)[1].b = 0;                       \
diff --git a/xen/arch/x86/include/asm/idt.h b/xen/arch/x86/include/asm/idt.h
new file mode 100644
index 000000000000..4ef52050a11b
--- /dev/null
+++ b/xen/arch/x86/include/asm/idt.h
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_ASM_IDT_H
+#define X86_ASM_IDT_H
+
+#include <xen/bug.h>
+#include <xen/types.h>
+
+#include <asm/x86-defns.h>
+
+#define IST_NONE 0
+#define IST_MCE  1
+#define IST_NMI  2
+#define IST_DB   3
+#define IST_DF   4
+#define IST_MAX  4
+
+typedef union {
+    struct {
+        uint64_t a, b;
+    };
+    struct {
+        uint16_t addr0;
+        uint16_t cs;
+        uint8_t  ist; /* :3, 5 bits rsvd, but this yields far better code. */
+        uint8_t  type:4, s:1, dpl:2, p:1;
+        uint16_t addr1;
+        uint32_t addr2;
+        /* 32 bits rsvd. */
+    };
+} idt_entry_t;
+
+#define IDT_ENTRIES 256
+extern idt_entry_t idt_table[];
+extern idt_entry_t *idt_tables[];
+
+/*
+ * Set the Interrupt Stack Table used by a particular IDT entry.  Typically
+ * used on a live IDT, so volatile to disuade clever optimisations.
+ */
+static inline void set_ist(volatile idt_entry_t *idt, unsigned int ist)
+{
+    /* IST is a 3 bit field, 32 bits into the IDT entry. */
+    ASSERT(ist <= IST_MAX);
+
+    idt->ist = ist;
+}
+
+static inline void enable_each_ist(idt_entry_t *idt)
+{
+    set_ist(&idt[X86_EXC_DF],  IST_DF);
+    set_ist(&idt[X86_EXC_NMI], IST_NMI);
+    set_ist(&idt[X86_EXC_MC],  IST_MCE);
+    set_ist(&idt[X86_EXC_DB],  IST_DB);
+}
+
+static inline void disable_each_ist(idt_entry_t *idt)
+{
+    set_ist(&idt[X86_EXC_DF],  IST_NONE);
+    set_ist(&idt[X86_EXC_NMI], IST_NONE);
+    set_ist(&idt[X86_EXC_MC],  IST_NONE);
+    set_ist(&idt[X86_EXC_DB],  IST_NONE);
+}
+
+/*
+ * Write the lower 64 bits of an IDT Entry. This relies on the upper 32
+ * bits of the address not changing, which is a safe assumption as all
+ * functions we are likely to load will live inside the 1GB
+ * code/data/bss address range.
+ */
+static inline void _write_gate_lower(volatile idt_entry_t *gate,
+                                     const idt_entry_t *new)
+{
+    ASSERT(gate->b == new->b);
+    gate->a = new->a;
+}
+
+#define _set_gate(gate_addr,type,dpl,addr)               \
+do {                                                     \
+    (gate_addr)->a = 0;                                  \
+    smp_wmb(); /* disable gate /then/ rewrite */         \
+    (gate_addr)->b =                                     \
+        ((unsigned long)(addr) >> 32);                   \
+    smp_wmb(); /* rewrite /then/ enable gate */          \
+    (gate_addr)->a =                                     \
+        (((unsigned long)(addr) & 0xFFFF0000UL) << 32) | \
+        ((unsigned long)(dpl) << 45) |                   \
+        ((unsigned long)(type) << 40) |                  \
+        ((unsigned long)(addr) & 0xFFFFUL) |             \
+        ((unsigned long)__HYPERVISOR_CS << 16) |         \
+        (1UL << 47);                                     \
+} while (0)
+
+static inline void _set_gate_lower(idt_entry_t *gate, unsigned long type,
+                                   unsigned long dpl, void *addr)
+{
+    idt_entry_t idte;
+    idte.b = gate->b;
+    idte.a =
+        (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
+        ((unsigned long)(dpl) << 45) |
+        ((unsigned long)(type) << 40) |
+        ((unsigned long)(addr) & 0xFFFFUL) |
+        ((unsigned long)__HYPERVISOR_CS << 16) |
+        (1UL << 47);
+    _write_gate_lower(gate, &idte);
+}
+
+/*
+ * Update the lower half handler of an IDT entry, without changing any other
+ * configuration.
+ */
+static inline void _update_gate_addr_lower(idt_entry_t *gate, void *addr)
+{
+    idt_entry_t idte;
+    idte.a = gate->a;
+
+    idte.b = ((unsigned long)(addr) >> 32);
+    idte.a &= 0x0000FFFFFFFF0000ULL;
+    idte.a |= (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
+        ((unsigned long)(addr) & 0xFFFFUL);
+
+    _write_gate_lower(gate, &idte);
+}
+
+#endif /* X86_ASM_IDT_H */
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index d247ef8dd226..86174cce5821 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -353,43 +353,6 @@ struct tss_page {
 };
 DECLARE_PER_CPU(struct tss_page, tss_page);
 
-#define IST_NONE 0UL
-#define IST_MCE  1UL
-#define IST_NMI  2UL
-#define IST_DB   3UL
-#define IST_DF   4UL
-#define IST_MAX  4UL
-
-/* Set the Interrupt Stack Table used by a particular IDT entry. */
-static inline void set_ist(idt_entry_t *idt, unsigned int ist)
-{
-    /* IST is a 3 bit field, 32 bits into the IDT entry. */
-    ASSERT(ist <= IST_MAX);
-
-    /* Typically used on a live idt.  Disuade any clever optimisations. */
-    ACCESS_ONCE(idt->ist) = ist;
-}
-
-static inline void enable_each_ist(idt_entry_t *idt)
-{
-    set_ist(&idt[X86_EXC_DF],  IST_DF);
-    set_ist(&idt[X86_EXC_NMI], IST_NMI);
-    set_ist(&idt[X86_EXC_MC],  IST_MCE);
-    set_ist(&idt[X86_EXC_DB],  IST_DB);
-}
-
-static inline void disable_each_ist(idt_entry_t *idt)
-{
-    set_ist(&idt[X86_EXC_DF],  IST_NONE);
-    set_ist(&idt[X86_EXC_NMI], IST_NONE);
-    set_ist(&idt[X86_EXC_MC],  IST_NONE);
-    set_ist(&idt[X86_EXC_DB],  IST_NONE);
-}
-
-#define IDT_ENTRIES 256
-extern idt_entry_t idt_table[];
-extern idt_entry_t *idt_tables[];
-
 DECLARE_PER_CPU(root_pgentry_t *, root_pgt);
 
 extern void write_ptbase(struct vcpu *v);
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index e20e8d0b1563..f775e526d59b 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -22,6 +22,7 @@
 
 #include <asm/fixmap.h>
 #include <asm/hpet.h>
+#include <asm/idt.h>
 #include <asm/machine_kexec.h>
 #include <asm/page.h>
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 6b34b908efcd..bfdc8fb01949 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -115,6 +115,7 @@
 #include <asm/fixmap.h>
 #include <asm/flushtlb.h>
 #include <asm/guest.h>
+#include <asm/idt.h>
 #include <asm/io.h>
 #include <asm/io_apic.h>
 #include <asm/ldt.h>
@@ -6639,6 +6640,9 @@ static void __init __maybe_unused build_assertions(void)
      * using different PATs will not work.
      */
     BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
+
+    /* IST_MAX IST pages + at least 1 guard page + primary stack. */
+    BUILD_BUG_ON((IST_MAX + 1) * PAGE_SIZE + PRIMARY_STACK_SIZE > STACK_SIZE);
 }
 
 /*
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index fd1597d0bdea..77b034e4dc73 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -13,6 +13,7 @@
 #include <xen/softirq.h>
 
 #include <asm/debugreg.h>
+#include <asm/idt.h>
 #include <asm/irq-vectors.h>
 #include <asm/pv/trace.h>
 #include <asm/shared.h>
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index f904d5623272..f3d60d5bae35 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -28,6 +28,7 @@
 #include <asm/div64.h>
 #include <asm/flushtlb.h>
 #include <asm/guest.h>
+#include <asm/idt.h>
 #include <asm/io_apic.h>
 #include <asm/irq-vectors.h>
 #include <asm/mc146818rtc.h>
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e8d5aa9fd46b..1a53bb4aa481 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -52,6 +52,7 @@
 #include <asm/hpet.h>
 #include <asm/hvm/vpt.h>
 #include <asm/i387.h>
+#include <asm/idt.h>
 #include <asm/io.h>
 #include <asm/irq-vectors.h>
 #include <asm/mc146818rtc.h>
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index 93f32ac66c92..8b9f0949d348 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -342,9 +342,6 @@ void subarch_percpu_traps_init(void)
     unsigned char *stub_page;
     unsigned int offset;
 
-    /* IST_MAX IST pages + at least 1 guard page + primary stack. */
-    BUILD_BUG_ON((IST_MAX + 1) * PAGE_SIZE + PRIMARY_STACK_SIZE > STACK_SIZE);
-
     /* No PV guests?  No need to set up SYSCALL/SYSENTER infrastructure. */
     if ( !IS_ENABLED(CONFIG_PV) )
         return;
-- 
2.39.5


