Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF55D333A72
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 11:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95960.181242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwJj-00036E-QN; Wed, 10 Mar 2021 10:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95960.181242; Wed, 10 Mar 2021 10:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwJj-00035l-Mx; Wed, 10 Mar 2021 10:43:51 +0000
Received: by outflank-mailman (input) for mailman id 95960;
 Wed, 10 Mar 2021 10:43:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iqsa=II=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJwJi-00035F-32
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 10:43:50 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e60485af-fc58-43fc-8838-e3df52d142c5;
 Wed, 10 Mar 2021 10:43:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA04A1FB;
 Wed, 10 Mar 2021 02:43:46 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.15.227])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A30473F85F;
 Wed, 10 Mar 2021 02:43:45 -0800 (PST)
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
X-Inumbo-ID: e60485af-fc58-43fc-8838-e3df52d142c5
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	andrew.cooper3@citrix.com,
	amc96@cam.ac.uk
Subject: [XTF 3/4] arm: Add initial architecture code for arm64 and arm32
Date: Wed, 10 Mar 2021 11:43:34 +0100
Message-Id: <20210310104335.14855-4-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210310104335.14855-1-michal.orzel@arm.com>
References: <20210310104335.14855-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support to XTF for arm64/arm32 without
modifying existing XTF architecture.
Most of the files are just dummy files waiting to be properly
implemented step by step later on.

The purpose of this change is to add the initial code and minimal
set of files to support arm64 without modifying the existing
XTF design. This creates a base for further implementation.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Based-on-the-work-from: Julien Grall <julien@xen.org>
---
 arch/arm/arm32/head.S              |   0
 arch/arm/arm64/cache.S             |  23 +++++++
 arch/arm/arm64/head.S              |  90 ++++++++++++++++++++++++++
 arch/arm/decode.c                  |  25 ++++++++
 arch/arm/include/arch/arm32/regs.h |  73 +++++++++++++++++++++
 arch/arm/include/arch/arm64/regs.h | 100 +++++++++++++++++++++++++++++
 arch/arm/include/arch/asm_macros.h |  21 ++++++
 arch/arm/include/arch/barrier.h    |  41 ++++++++++++
 arch/arm/include/arch/bitops.h     |  45 +++++++++++++
 arch/arm/include/arch/config.h     |  37 +++++++++++
 arch/arm/include/arch/desc.h       |  16 +++++
 arch/arm/include/arch/div.h        |  35 ++++++++++
 arch/arm/include/arch/extable.h    |  19 ++++++
 arch/arm/include/arch/hypercall.h  |  39 +++++++++++
 arch/arm/include/arch/page.h       |  23 +++++++
 arch/arm/include/arch/regs.h       |  25 ++++++++
 arch/arm/include/arch/traps.h      |  22 +++++++
 arch/arm/include/arch/xtf.h        |  17 +++++
 arch/arm/link.lds.S                |  58 +++++++++++++++++
 arch/arm/setup.c                   |  28 ++++++++
 arch/arm/traps.c                   |  22 +++++++
 21 files changed, 759 insertions(+)
 create mode 100644 arch/arm/arm32/head.S
 create mode 100644 arch/arm/arm64/cache.S
 create mode 100644 arch/arm/arm64/head.S
 create mode 100644 arch/arm/decode.c
 create mode 100644 arch/arm/include/arch/arm32/regs.h
 create mode 100644 arch/arm/include/arch/arm64/regs.h
 create mode 100644 arch/arm/include/arch/asm_macros.h
 create mode 100644 arch/arm/include/arch/barrier.h
 create mode 100644 arch/arm/include/arch/bitops.h
 create mode 100644 arch/arm/include/arch/config.h
 create mode 100644 arch/arm/include/arch/desc.h
 create mode 100644 arch/arm/include/arch/div.h
 create mode 100644 arch/arm/include/arch/extable.h
 create mode 100644 arch/arm/include/arch/hypercall.h
 create mode 100644 arch/arm/include/arch/page.h
 create mode 100644 arch/arm/include/arch/regs.h
 create mode 100644 arch/arm/include/arch/traps.h
 create mode 100644 arch/arm/include/arch/xtf.h
 create mode 100644 arch/arm/link.lds.S
 create mode 100644 arch/arm/setup.c
 create mode 100644 arch/arm/traps.c

diff --git a/arch/arm/arm32/head.S b/arch/arm/arm32/head.S
new file mode 100644
index 0000000..e69de29
diff --git a/arch/arm/arm64/cache.S b/arch/arm/arm64/cache.S
new file mode 100644
index 0000000..31b70ae
--- /dev/null
+++ b/arch/arm/arm64/cache.S
@@ -0,0 +1,23 @@
+#include <xtf/asm_macros.h>
+
+/*
+ * flush_dcache_range(start, end)
+ * - start   - start address of a region
+ * - end     - end address of a region
+ */
+ENTRY(flush_dcache_range)
+    /* Get the minimum D-cache line size */
+    mrs    x3, ctr_el0
+    ubfm   x3, x3, #16, #19
+    mov    x2, #4
+    lsl    x2, x2, x3
+    sub    x3, x2, #1
+    bic    x0, x0, x3
+    /* Clean and invalidate D-cache line */
+1:  dc     civac, x0
+    add    x0, x0, x2
+    cmp    x0, x1
+    b.lo   1b
+    dsb    sy
+    ret
+ENDFUNC(flush_dcache_range)
diff --git a/arch/arm/arm64/head.S b/arch/arm/arm64/head.S
new file mode 100644
index 0000000..bce0968
--- /dev/null
+++ b/arch/arm/arm64/head.S
@@ -0,0 +1,90 @@
+#include <arch/page.h>
+#include <xtf/asm_macros.h>
+#include <xen/xen.h>
+
+/* 1 if BE, 0 if LE */
+#define HEAD_FLAG_ENDIANNESS  0
+#define HEAD_FLAG_PAGE_SIZE   ((PAGE_SHIFT - 10) / 2)
+#define HEAD_FLAG_PHYS_BASE   1
+#define HEAD_FLAGS            ((HEAD_FLAG_ENDIANNESS << 0) | \
+                              (HEAD_FLAG_PAGE_SIZE << 1) |   \
+                              (HEAD_FLAG_PHYS_BASE << 3))
+
+/*
+ * Print a string on the debug console
+ *
+ * Clobbers: x0, x1, x2, x16
+ *
+ * /!\ When MMU is off, this can only be used with embed string in the
+ * kernel.
+ */
+#define PRINT(s)                                    \
+    adr     x2, 97f;                                \
+    adr     x1, 98f;                                \
+    sub     x1, x1, x2;                             \
+    mov     x0, #CONSOLEIO_write;                   \
+    mov     x16, #__HYPERVISOR_console_io;          \
+    hvc     #XEN_HYPERCALL_TAG;                     \
+    b       99f;                                    \
+97: .asciz  s;                                      \
+98:;                                                \
+    .align  2;                                      \
+99:
+
+.section ".bss.page_aligned"
+.p2align PAGE_SHIFT
+
+.text
+    b       _start                  /* branch to kernel start, magic */
+    .long   0                       /* Executable code */
+    .quad   0x0                     /* Image load offset from start of RAM */
+    .quad   _end - _start           /* Effective Image size */
+    .quad   HEAD_FLAGS              /* Informative flags, little-endian */
+    .quad   0                       /* reserved */
+    .quad   0                       /* reserved */
+    .quad   0                       /* reserved */
+    .byte   0x41                    /* Magic number, "ARM\x64" */
+    .byte   0x52
+    .byte   0x4d
+    .byte   0x64
+    .long   0                       /* reserved */
+
+
+/* Load a physical address of \sym to \xb */
+.macro load_paddr xb, sym
+    ldr \xb, =\sym
+    add \xb, \xb, x21
+.endm
+
+/*
+ * Common register usage for assembly boot code
+ *
+ * x20 - DTB physical address (boot CPU only)
+ * x21 - Offset between PA and VA ( PA - VA)
+ * x30 - lr
+ */
+ENTRY(_start)
+    /* Save DTB pointer */
+    mov     x20, x0
+
+    /* Calculate where we are */
+    ldr     x22, =_start        /* x22 := vaddr(_start) */
+    adr     x21, _start         /* x21 := paddr(_start) */
+    sub     x21, x21, x22       /* x21 := phys-offset */
+
+    PRINT("- XTF booting -\n")
+
+    PRINT("- Zero BSS -\n")
+
+    load_paddr  x0, __start_bss
+    load_paddr  x1, __end_bss
+
+    bl      flush_dcache_range
+1:  str     xzr, [x0], #8
+    cmp     x0, x1
+    b.lo    1b
+    bl      flush_dcache_range
+
+    /* Start an infinite loop */
+    PRINT("- Infinite loop -\n")
+1:  b   1b
diff --git a/arch/arm/decode.c b/arch/arm/decode.c
new file mode 100644
index 0000000..97aa576
--- /dev/null
+++ b/arch/arm/decode.c
@@ -0,0 +1,25 @@
+/**
+ * @file arch/arm/decode.c
+ *
+ * Helper routines for decoding arm architectural state.
+ */
+#include <xtf/lib.h>
+#include <xtf/libc.h>
+
+bool arch_fmt_pointer(
+    char **str_ptr, char *end, const char **fmt_ptr, const void *arg,
+    int width, int precision, unsigned int flags)
+{
+    UNIMPLEMENTED();
+    return false;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/arm32/regs.h b/arch/arm/include/arch/arm32/regs.h
new file mode 100644
index 0000000..fe137c4
--- /dev/null
+++ b/arch/arm/include/arch/arm32/regs.h
@@ -0,0 +1,73 @@
+/**
+ * @file arch/arm/include/arch/arm32/regs.h
+ *
+ * arm32 CPU user registers.
+ */
+#ifndef XTF_ARM32_REGS_H
+#define XTF_ARM32_REGS_H
+
+#include <xtf/types.h>
+
+/* On stack VCPU state */
+struct cpu_regs
+{
+    uint32_t r0;
+    uint32_t r1;
+    uint32_t r2;
+    uint32_t r3;
+    uint32_t r4;
+    uint32_t r5;
+    uint32_t r6;
+    uint32_t r7;
+    uint32_t r8;
+    uint32_t r9;
+    uint32_t r10;
+    union {
+        uint32_t r11;
+        uint32_t fp;
+    };
+    uint32_t r12;
+
+    uint32_t sp; /* r13 - SP: Valid for Hyp. frames only, o/w banked (see below) */
+
+    /* r14 - LR: is the same physical register as LR_usr */
+    union {
+        uint32_t lr; /* r14 - LR: Valid for Hyp. Same physical register as lr_usr. */
+
+        uint32_t lr_usr;
+    };
+
+    union {  /* Return IP, pc32 is used to allow code to be common with 64-bit */
+        uint32_t pc, pc32;
+    };
+    uint32_t cpsr; /* Return mode */
+    uint32_t hsr;  /* Exception Syndrome */
+
+    /* Outer guest frame only from here on... */
+
+    uint32_t sp_usr; /* LR_usr is the same register as LR, see above */
+
+    uint32_t sp_irq, lr_irq;
+    uint32_t sp_svc, lr_svc;
+    uint32_t sp_abt, lr_abt;
+    uint32_t sp_und, lr_und;
+
+    uint32_t r8_fiq, r9_fiq, r10_fiq, r11_fiq, r12_fiq;
+    uint32_t sp_fiq, lr_fiq;
+
+    uint32_t spsr_svc, spsr_abt, spsr_und, spsr_irq, spsr_fiq;
+
+    uint32_t pad1; /* Doubleword-align the user half of the frame */
+};
+
+#endif /* XTF_ARM32_REGS_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/arm64/regs.h b/arch/arm/include/arch/arm64/regs.h
new file mode 100644
index 0000000..8e18ae0
--- /dev/null
+++ b/arch/arm/include/arch/arm64/regs.h
@@ -0,0 +1,100 @@
+/**
+ * @file arch/arm/include/arch/arm64/regs.h
+ *
+ * arm64 CPU user registers.
+ */
+#ifndef XTF_ARM64_REGS_H
+#define XTF_ARM64_REGS_H
+
+#include <xtf/types.h>
+
+/* Anonymous union includes both 32- and 64-bit names (e.g., r0/x0). */
+#define __DECL_REG(n64, n32) union {            \
+    uint64_t n64;                               \
+    uint32_t n32;                               \
+}
+
+/* On stack VCPU state */
+struct cpu_regs
+{
+    /*
+     * The mapping AArch64 <-> AArch32 is based on D1.20.1 in ARM DDI
+     * 0487A.d.
+     *
+     *         AArch64       AArch32
+     */
+    __DECL_REG(x0,           r0/*_usr*/);
+    __DECL_REG(x1,           r1/*_usr*/);
+    __DECL_REG(x2,           r2/*_usr*/);
+    __DECL_REG(x3,           r3/*_usr*/);
+    __DECL_REG(x4,           r4/*_usr*/);
+    __DECL_REG(x5,           r5/*_usr*/);
+    __DECL_REG(x6,           r6/*_usr*/);
+    __DECL_REG(x7,           r7/*_usr*/);
+    __DECL_REG(x8,           r8/*_usr*/);
+    __DECL_REG(x9,           r9/*_usr*/);
+    __DECL_REG(x10,          r10/*_usr*/);
+    __DECL_REG(x11 ,         r11/*_usr*/);
+    __DECL_REG(x12,          r12/*_usr*/);
+
+    __DECL_REG(x13,          /* r13_usr */ sp_usr);
+    __DECL_REG(x14,          /* r14_usr */ lr_usr);
+
+    __DECL_REG(x15,          /* r13_hyp */ __unused_sp_hyp);
+
+    __DECL_REG(x16,          /* r14_irq */ lr_irq);
+    __DECL_REG(x17,          /* r13_irq */ sp_irq);
+
+    __DECL_REG(x18,          /* r14_svc */ lr_svc);
+    __DECL_REG(x19,          /* r13_svc */ sp_svc);
+
+    __DECL_REG(x20,          /* r14_abt */ lr_abt);
+    __DECL_REG(x21,          /* r13_abt */ sp_abt);
+
+    __DECL_REG(x22,          /* r14_und */ lr_und);
+    __DECL_REG(x23,          /* r13_und */ sp_und);
+
+    __DECL_REG(x24,          r8_fiq);
+    __DECL_REG(x25,          r9_fiq);
+    __DECL_REG(x26,          r10_fiq);
+    __DECL_REG(x27,          r11_fiq);
+    __DECL_REG(x28,          r12_fiq);
+    __DECL_REG(/* x29 */ fp, /* r13_fiq */ sp_fiq);
+
+    __DECL_REG(/* x30 */ lr, /* r14_fiq */ lr_fiq);
+
+    uint64_t sp; /* Valid for hypervisor frames */
+
+    /* Return address and mode */
+    __DECL_REG(pc,           pc32);             /* ELR_EL2 */
+    uint32_t cpsr;                              /* SPSR_EL2 */
+    uint32_t hsr;                               /* ESR_EL2 */
+
+    /* Outer guest frame only from here on... */
+
+    union {
+        uint32_t spsr_el1;       /* AArch64 */
+        uint32_t spsr_svc;       /* AArch32 */
+    };
+
+    uint32_t pad1; /* Doubleword-align the user half of the frame */
+
+    /* AArch32 guests only */
+    uint32_t spsr_fiq, spsr_irq, spsr_und, spsr_abt;
+
+    /* AArch64 guests only */
+    uint64_t sp_el0;
+    uint64_t sp_el1, elr_el1;
+};
+
+#endif /* XTF_ARM64_REGS_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/asm_macros.h b/arch/arm/include/arch/asm_macros.h
new file mode 100644
index 0000000..39e1d16
--- /dev/null
+++ b/arch/arm/include/arch/asm_macros.h
@@ -0,0 +1,21 @@
+/**
+ * @file arch/arm/include/arch/asm_macros.h
+ *
+ * Macros for use in arm assembly files.
+ */
+#ifndef XTF_ARM_ASM_MACROS_H
+#define XTF_ARM_ASM_MACROS_H
+
+#define ALIGN .align 2
+
+#endif /* XTF_ARM_ASM_MACROS_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/barrier.h b/arch/arm/include/arch/barrier.h
new file mode 100644
index 0000000..b84c922
--- /dev/null
+++ b/arch/arm/include/arch/barrier.h
@@ -0,0 +1,41 @@
+/**
+ * @file arch/arm/include/arch/barrier.h
+ *
+ * arm memory barriers.
+ */
+#ifndef XTF_ARM_BARRIER_H
+#define XTF_ARM_BARRIER_H
+
+#include <xtf/compiler.h>
+
+#define isb()           __asm__ __volatile__ ("isb" : : : "memory")
+#define dsb(scope)      __asm__ __volatile__ ("dsb " #scope : : : "memory")
+#define dmb(scope)      __asm__ __volatile__ ("dmb " #scope : : : "memory")
+
+#define mb()            dsb(sy)
+#ifdef CONFIG_ARM_64
+#define rmb()           dsb(ld)
+#else
+#define rmb()           dsb(sy)
+#endif
+#define wmb()           dsb(st)
+
+#define smp_mb()        dmb(ish)
+#ifdef CONFIG_ARM_64
+#define smp_rmb()       dmb(ishld)
+#else
+#define smp_rmb()       dmb(ish)
+#endif
+#define smp_wmb()       dmb(ishst)
+
+#endif /* XTF_ARM_BARRIER_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/bitops.h b/arch/arm/include/arch/bitops.h
new file mode 100644
index 0000000..524b9f7
--- /dev/null
+++ b/arch/arm/include/arch/bitops.h
@@ -0,0 +1,45 @@
+/**
+ * @file arch/arm/include/arch/bitops.h
+ *
+ * Low level bit operations.
+ */
+#ifndef XTF_ARM_BITOPS_H
+#define XTF_ARM_BITOPS_H
+
+#include <xtf/lib.h>
+
+static inline bool test_bit(unsigned int bit, const void *addr)
+{
+    UNIMPLEMENTED();
+    return false;
+}
+
+static inline bool test_and_set_bit(unsigned int bit, volatile void *addr)
+{
+    UNIMPLEMENTED();
+    return false;
+}
+
+static inline bool test_and_change_bit(unsigned int bit, volatile void *addr)
+{
+    UNIMPLEMENTED();
+    return false;
+}
+
+static inline bool test_and_clear_bit(unsigned int bit, volatile void *addr)
+{
+    UNIMPLEMENTED();
+    return false;
+}
+
+#endif /* XTF_ARM_BITOPS_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/config.h b/arch/arm/include/arch/config.h
new file mode 100644
index 0000000..2ccc71e
--- /dev/null
+++ b/arch/arm/include/arch/config.h
@@ -0,0 +1,37 @@
+/**
+ * @file arch/arm/include/arch/config.h
+ *
+ * A Linux-style configuration list.
+ */
+#ifndef XTF_ARM_CONFIG_H
+#define XTF_ARM_CONFIG_H
+
+#define XTF_VIRT_START 0x40000000
+
+#if defined(CONFIG_ENV_arm64)
+#define CONFIG_ARM              1
+#define CONFIG_ARM_64           1
+#define CONFIG_64BIT            1
+#define ENVIRONMENT_DESCRIPTION "ARM64"
+#undef CONFIG_ENV_arm64
+#elif defined(CONFIG_ENV_arm32)
+#define CONFIG_ARM              1
+#define CONFIG_ARM_32           1
+#define CONFIG_32BIT            1
+#define ENVIRONMENT_DESCRIPTION "ARM32"
+#undef CONFIG_ENV_arm32
+#else
+#error "Bad environment"
+#endif
+
+#endif /* XTF_ARM_CONFIG_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/desc.h b/arch/arm/include/arch/desc.h
new file mode 100644
index 0000000..f4ea8b3
--- /dev/null
+++ b/arch/arm/include/arch/desc.h
@@ -0,0 +1,16 @@
+/**
+ * @file arch/arm/include/arch/desc.h
+ */
+#ifndef XTF_ARM_DESC_H
+#define XTF_ARM_DESC_H
+
+#endif /* XTF_ARM_DESC_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/div.h b/arch/arm/include/arch/div.h
new file mode 100644
index 0000000..3038430
--- /dev/null
+++ b/arch/arm/include/arch/div.h
@@ -0,0 +1,35 @@
+/**
+ * @file arch/arm/include/arch/div.h
+ */
+#ifndef XTF_ARM_DIV_H
+#define XTF_ARM_DIV_H
+
+#include <xtf/lib.h>
+
+/*
+ * Divide a 64bit number by 32bit divisor without software support.
+ *
+ * The dividend is modified in place, and the modulus is returned.
+ */
+static inline uint32_t divmod64(uint64_t *dividend, uint32_t divisor)
+{
+#if defined(CONFIG_ARM_64)
+    uint32_t remainder = *dividend % divisor;
+    *dividend = *dividend / divisor;
+    return remainder;
+#else
+    UNIMPLEMENTED();
+#endif
+}
+
+#endif /* XTF_ARM_DIV_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/extable.h b/arch/arm/include/arch/extable.h
new file mode 100644
index 0000000..9560b96
--- /dev/null
+++ b/arch/arm/include/arch/extable.h
@@ -0,0 +1,19 @@
+/**
+ * @file arch/arm/include/arch/extable.h
+ *
+ * Common arm exception table helper functions.
+ */
+#ifndef XTF_ARM64_EXTABLE_H
+#define XTF_ARM64_EXTABLE_H
+
+#endif /* XTF_ARM_EXTABLE_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/hypercall.h b/arch/arm/include/arch/hypercall.h
new file mode 100644
index 0000000..660b2d6
--- /dev/null
+++ b/arch/arm/include/arch/hypercall.h
@@ -0,0 +1,39 @@
+/**
+ * @file arch/arm/include/arch/hypercall.h
+ *
+ * Hypercall primitives for arm.
+ */
+#ifndef XTF_ARM_HYPERCALL_H
+#define XTF_ARM_HYPERCALL_H
+
+#include <xtf/lib.h>
+
+#define _hypercall_1(type, hcall, a1)           \
+    ({                                          \
+        UNIMPLEMENTED();                        \
+        (type)0;                                \
+    })
+
+#define _hypercall_2(type, hcall, a1, a2)       \
+    ({                                          \
+        UNIMPLEMENTED();                        \
+        (type)0;                                \
+    })
+
+#define _hypercall_3(type, hcall, a1, a2, a3)   \
+    ({                                          \
+        UNIMPLEMENTED();                        \
+        (type)0;                                \
+    })
+
+#endif /* XTF_ARM_HYPERCALL_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/page.h b/arch/arm/include/arch/page.h
new file mode 100644
index 0000000..508b3ef
--- /dev/null
+++ b/arch/arm/include/arch/page.h
@@ -0,0 +1,23 @@
+/**
+ * @file arch/arm/include/arch/page.h
+ */
+#ifndef XTF_ARM_PAGE_H
+#define XTF_ARM_PAGE_H
+
+#include <xtf/numbers.h>
+
+#define PAGE_SHIFT      12
+#define PAGE_SIZE       (_AC(1, L) << PAGE_SHIFT)
+#define PAGE_MASK       (~(PAGE_SIZE - 1))
+
+#endif /* XTF_ARM_PAGE_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/regs.h b/arch/arm/include/arch/regs.h
new file mode 100644
index 0000000..704e8e6
--- /dev/null
+++ b/arch/arm/include/arch/regs.h
@@ -0,0 +1,25 @@
+/**
+ * @file arch/arm/include/arch/regs.h
+ *
+ * arm CPU user registers.
+ */
+#ifndef XTF_ARM_REGS_H
+#define XTF_ARM_REGS_H
+
+#if defined(CONFIG_ARM_64)
+#include <arch/arm64/regs.h>
+#else
+#include <arch/arm32/regs.h>
+#endif
+
+#endif /* XTF_ARM_REGS_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/traps.h b/arch/arm/include/arch/traps.h
new file mode 100644
index 0000000..8c42064
--- /dev/null
+++ b/arch/arm/include/arch/traps.h
@@ -0,0 +1,22 @@
+/**
+ * @file arch/arm/include/arch/traps.h
+ */
+#ifndef XTF_ARM_TRAPS_H
+#define XTF_ARM_TRAPS_H
+
+#include <xtf/compiler.h>
+#include <xen/xen.h>
+
+void __noreturn arch_crash_hard(void);
+
+#endif /* XTF_ARM_TRAPS_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/include/arch/xtf.h b/arch/arm/include/arch/xtf.h
new file mode 100644
index 0000000..7b25617
--- /dev/null
+++ b/arch/arm/include/arch/xtf.h
@@ -0,0 +1,17 @@
+/**
+ * @file arch/arm/include/arch/xtf.h
+ */
+#ifndef XTF_ARM_XTF_H
+#define XTF_ARM_XTF_H
+
+#endif /* XTF_ARM_XTF_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/link.lds.S b/arch/arm/link.lds.S
new file mode 100644
index 0000000..3160cf1
--- /dev/null
+++ b/arch/arm/link.lds.S
@@ -0,0 +1,58 @@
+#include <arch/page.h>
+
+#if defined(__arm__)
+OUTPUT_ARCH(arm)
+OUTPUT_FORMAT("elf32-littlearm")
+#elif defined(__aarch64__)
+OUTPUT_ARCH(aarch64)
+OUTPUT_FORMAT("elf64-littleaarch64")
+#endif
+
+ENTRY(_start)
+
+SECTIONS
+{
+    . = XTF_VIRT_START;
+    _text = .;
+
+    .text : {
+        *(.text)
+    }
+
+    . = ALIGN(PAGE_SIZE);
+
+    .data : {
+        *(.data)
+
+    . = ALIGN(PAGE_SIZE);
+        *(.data.page_aligned)
+    }
+
+    . = ALIGN(PAGE_SIZE);
+
+    .rodata : {
+        *(.rodata)
+        *(.rodata.*)
+    }
+
+    . = ALIGN(PAGE_SIZE);
+
+    .bss : {
+        __start_bss = .;
+        *(.bss)
+
+    . = ALIGN(PAGE_SIZE);
+        *(.bss.page_aligned)
+
+        __end_bss = .;
+    }
+
+    _end = .;
+
+    /*
+     * It is possible for a GNU linker to add a .note.gnu.build-id section
+     * before .text which causes zimage header to be shifted resulting in
+     * a bad magic. Discard this section to prevent errors.
+     */
+    /DISCARD/ : { *(.note.gnu.build-id) }
+}
diff --git a/arch/arm/setup.c b/arch/arm/setup.c
new file mode 100644
index 0000000..bc5669d
--- /dev/null
+++ b/arch/arm/setup.c
@@ -0,0 +1,28 @@
+/**
+ * @file arch/arm/setup.c
+ *
+ * Early bringup code for arm.
+ */
+#include <xtf/lib.h>
+
+const char environment_description[] = ENVIRONMENT_DESCRIPTION;
+
+void arch_setup(void)
+{
+    UNIMPLEMENTED();
+}
+
+void test_setup(void)
+{
+    UNIMPLEMENTED();
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/arch/arm/traps.c b/arch/arm/traps.c
new file mode 100644
index 0000000..f4ad807
--- /dev/null
+++ b/arch/arm/traps.c
@@ -0,0 +1,22 @@
+/**
+ * @file arch/arm/traps.c
+ *
+ * arm trap handlers.
+ */
+#include <xtf/traps.h>
+#include <xtf/lib.h>
+
+void __noreturn arch_crash_hard(void)
+{
+    UNIMPLEMENTED();
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.29.0


