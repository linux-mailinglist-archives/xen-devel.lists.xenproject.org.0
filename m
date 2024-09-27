Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB27988922
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806420.1217830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDuR-00052m-Dx; Fri, 27 Sep 2024 16:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806420.1217830; Fri, 27 Sep 2024 16:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDuR-00050H-9S; Fri, 27 Sep 2024 16:33:35 +0000
Received: by outflank-mailman (input) for mailman id 806420;
 Fri, 27 Sep 2024 16:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDuP-0001aD-7Z
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:33 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a9b8ed4-7cee-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 18:33:29 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5365cc68efaso2192132e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:29 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27d47a2sm150697966b.89.2024.09.27.09.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:33:28 -0700 (PDT)
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
X-Inumbo-ID: 3a9b8ed4-7cee-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454809; x=1728059609; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lmgDuLjmXqyvP8NcM6DuHkV8rf9NddkBsqcBWqHAn8=;
        b=DcRox8PIEfd5AezHvP9fm8yKCMbBQ3zSwvUbsPaQzsqUBd6RLvqK03qPSQBJzguGuB
         wTqxjI9xmmf0u/traLM2hcH421vo+33J/yy9l2wfbfIRVOHAUDXqoARByfQpoTcHL/Bs
         OcRXHWBgT+bG0nJDFviB0A/5w2981CxW5CALvf9XlydkJ7KzDsmSnRKZmrCgz1hbrvCm
         QVWWZ8aj6Bi/uIphW2qo3Dy6JbztHo107cTu1xnLhptjHVVq3zsMId0LYg+eh+r1IAwq
         w63wWSTZKwYcQtGnyTfaVMb+2ziNDR/5lbOEFxfSReYa+v1dvnRRGSbgyPNDNS4bGVT+
         iGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454809; x=1728059609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lmgDuLjmXqyvP8NcM6DuHkV8rf9NddkBsqcBWqHAn8=;
        b=uJ4RYS/IjIMvguhes3tcosz0a/SVDGkV8pn1nJAetnOJC66mt+2iImWzqGjPgWkBOO
         Vkr3HG/kv/3o3I6JJlVL5OQ3d6pui4rVY2wzfCMXeFlljYJmDH/mNglTgSIP9quGTSiF
         iYt8rEUlH2YtTwrTCROs9h8FIcLRYJXeWOor8ekeQ2un4+vG8GNFL6YL11BPIkiYJk82
         hrXBov23j4R3T8AjfCIhwF/mlEwBTFqaemF5Yq3WKxnLEwIkCxWncsxyHfyxabpNOX2T
         gnweBFFVKdeFTfJVhl22kM4Ev4g3geQhxu9/n1gl0aDZO6uey/4L5FTt7A9TuVH5hSUr
         7z/A==
X-Gm-Message-State: AOJu0Yx0qAlbt/FeV17mmK+EegiHcjpFN3TCrJ/kbLF0VriYIFX9gJGp
	mBFZQinb+jCjeFMB+y5aDrRyTG6i7+I4e+v/AQ2pAnfKz9Ewhry6goB8Eg==
X-Google-Smtp-Source: AGHT+IFTk+0xcVyRNaQOYKV5gdNufK90rKVUmfyHd5wBS6DK1VS2FEAwdUQShzU1AVhotR1bO5Y1eQ==
X-Received: by 2002:a05:6512:3404:b0:533:44e7:1b2a with SMTP id 2adb3069b0e04-5389fc70f6cmr3130607e87.40.1727454808829;
        Fri, 27 Sep 2024 09:33:28 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 4/7] xen/riscv: introduce functionality to work with CPU info
Date: Fri, 27 Sep 2024 18:33:16 +0200
Message-ID: <3ffb3ffd38b2e0d3568bfd3f9ef974d61b0d2508.1727449154.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727449154.git.oleksii.kurochko@gmail.com>
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce struct pcpu_info to store pCPU-related information.
Initially, it includes only processor_id and hart id, but it
will be extended to include guest CPU information and
temporary variables for saving/restoring vCPU registers.

Add set_processor_id() function to set processor_id stored in
pcpu_info.

Define smp_processor_id() to provide accurate information,
replacing the previous "dummy" value of 0.

Initialize tp registers to point to pcpu_info[0].
Set processor_id to 0 for logical CPU 0 and store the physical
CPU ID in pcpu_info[0].

Introduce helpers for getting/setting hart_id ( physical CPU id
in RISC-V terms ) from Xen CPU id.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile                |  1 +
 xen/arch/riscv/include/asm/current.h   | 27 +++++++++++++++++++++++++-
 xen/arch/riscv/include/asm/processor.h |  3 ---
 xen/arch/riscv/include/asm/smp.h       | 18 +++++++++++++++++
 xen/arch/riscv/riscv64/asm-offsets.c   |  3 +++
 xen/arch/riscv/riscv64/head.S          | 14 +++++++++++++
 xen/arch/riscv/setup.c                 |  5 +++++
 xen/arch/riscv/smp.c                   | 15 ++++++++++++++
 8 files changed, 82 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/riscv/smp.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index d192be7b55..6832549133 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
 obj-y += shutdown.o
+obj-y += smp.o
 obj-y += stubs.o
 obj-y += traps.o
 obj-y += vm_event.o
diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index aedb6dc732..6f1ec4e190 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -3,12 +3,37 @@
 #ifndef __ASM_CURRENT_H
 #define __ASM_CURRENT_H
 
-#include <xen/lib.h>
+#include <xen/bug.h>
+#include <xen/cache.h>
 #include <xen/percpu.h>
+
 #include <asm/processor.h>
 
 #ifndef __ASSEMBLY__
 
+register struct pcpu_info *tp asm ( "tp" );
+
+struct pcpu_info {
+    unsigned int processor_id; /* Xen CPU id */
+    unsigned long hart_id; /* physical CPU id */
+} __cacheline_aligned;
+
+/* tp points to one of these */
+extern struct pcpu_info pcpu_info[NR_CPUS];
+
+#define set_processor_id(id)    do { \
+    tp->processor_id = (id);         \
+} while (0)
+
+static inline unsigned int smp_processor_id(void)
+{
+    unsigned int id = tp->processor_id;
+
+    BUG_ON(id >= NR_CPUS);
+
+    return id;
+}
+
 /* Which VCPU is "current" on this PCPU. */
 DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
 
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 3ae164c265..e42b353b4c 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -12,9 +12,6 @@
 
 #ifndef __ASSEMBLY__
 
-/* TODO: need to be implemeted */
-#define smp_processor_id() 0
-
 /* On stack VCPU state */
 struct cpu_user_regs
 {
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index b1ea91b1eb..a824be8e78 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -5,6 +5,8 @@
 #include <xen/cpumask.h>
 #include <xen/percpu.h>
 
+#include <asm/current.h>
+
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
@@ -14,6 +16,22 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
  */
 #define park_offline_cpus false
 
+/*
+ * Mapping between Xen logical cpu index and hartid.
+ */
+static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
+{
+    return pcpu_info[cpuid].hart_id;
+}
+
+static inline void set_cpuid_to_hartid(unsigned long cpuid,
+                                       unsigned long hartid)
+{
+    pcpu_info[cpuid].hart_id = hartid;
+}
+
+void setup_tp(unsigned int cpuid);
+
 #endif
 
 /*
diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
index 9f663b9510..3b5daf3b36 100644
--- a/xen/arch/riscv/riscv64/asm-offsets.c
+++ b/xen/arch/riscv/riscv64/asm-offsets.c
@@ -1,5 +1,6 @@
 #define COMPILE_OFFSETS
 
+#include <asm/current.h>
 #include <asm/processor.h>
 #include <xen/types.h>
 
@@ -50,4 +51,6 @@ void asm_offsets(void)
     OFFSET(CPU_USER_REGS_SSTATUS, struct cpu_user_regs, sstatus);
     OFFSET(CPU_USER_REGS_PREGS, struct cpu_user_regs, pregs);
     BLANK();
+    DEFINE(PCPU_INFO_SIZE, sizeof(struct pcpu_info));
+    BLANK();
 }
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 3261e9fce8..2a1b3dad91 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,4 +1,5 @@
 #include <asm/asm.h>
+#include <asm/asm-offsets.h>
 #include <asm/riscv_encoding.h>
 
         .section .text.header, "ax", %progbits
@@ -55,6 +56,10 @@ FUNC(start)
          */
         jal     reset_stack
 
+        /* Xen's boot cpu id is equal to 0 so setup TP register for it */
+        li      a0, 0
+        jal     setup_tp
+
         /* restore hart_id ( bootcpu_id ) and dtb address */
         mv      a0, s0
         mv      a1, s1
@@ -72,6 +77,15 @@ FUNC(reset_stack)
         ret
 END(reset_stack)
 
+/* void setup_tp(unsigned int xen_cpuid); */
+FUNC(setup_tp)
+        la      t0, pcpu_info
+        li      t1, PCPU_INFO_SIZE
+        mul     t1, a0, t1
+        add     tp, t0, t1
+        ret
+END(setup_tp)
+
         .section .text.ident, "ax", %progbits
 
 FUNC(turn_on_mmu)
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 82c5752da1..6e3a787dbe 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -9,6 +9,7 @@
 #include <public/version.h>
 
 #include <asm/early_printk.h>
+#include <asm/smp.h>
 #include <asm/traps.h>
 
 void arch_get_xen_caps(xen_capabilities_info_t *info)
@@ -41,6 +42,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     remove_identity_mapping();
 
+    set_processor_id(0);
+
+    set_cpuid_to_hartid(0, bootcpu_id);
+
     trap_init();
 
 #ifdef CONFIG_SELF_TESTS
diff --git a/xen/arch/riscv/smp.c b/xen/arch/riscv/smp.c
new file mode 100644
index 0000000000..4ca6a4e892
--- /dev/null
+++ b/xen/arch/riscv/smp.c
@@ -0,0 +1,15 @@
+#include <xen/smp.h>
+
+/*
+ * FIXME: make pcpu_info[] dynamically allocated when necessary
+ *        functionality will be ready
+ */
+/*
+ * tp points to one of these per cpu.
+ *
+ * hart_id would be valid (no matter which value) if its
+ * processor_id field is valid (less than NR_CPUS).
+ */
+struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
+    .processor_id = NR_CPUS,
+}};
-- 
2.46.1


