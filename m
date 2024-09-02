Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD95968C99
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 19:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788311.1197862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQp-0004DU-Qs; Mon, 02 Sep 2024 17:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788311.1197862; Mon, 02 Sep 2024 17:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQp-0004Ab-Lt; Mon, 02 Sep 2024 17:01:35 +0000
Received: by outflank-mailman (input) for mailman id 788311;
 Mon, 02 Sep 2024 17:01:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uz6k=QA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1slAQo-0002e4-7q
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 17:01:34 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 012c6501-694d-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 19:01:32 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5353cd2fa28so5794278e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 10:01:32 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408410f5sm1677618e87.211.2024.09.02.10.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 10:01:30 -0700 (PDT)
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
X-Inumbo-ID: 012c6501-694d-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725296492; x=1725901292; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wocjzcEW8JnEEzfAHeDQT7LKqe0fSVuG6u/ZFFnI324=;
        b=ON7bv/K8oQ6yrT7gsMdoCkdPB7pAFUrEifaLlsxuLb6/OJcQkBkrlY9BNkAkKzA8LY
         NihjTUKI5rqcYg05Z45SYuob0urv1P9otnIyTAo25VHz52z7V4UjnG6lvrDWeJVhbE+e
         hf1l+ypypU6ugJDG+2615xHgXZ+Yo+4HxNcm0czkIm66hv6MmV9St3k0bPmgw/yvV1Tn
         5DzXy4eyqiiV7MY2VHc+jcy4aVr1C/nv11TYiueWK9oMESYrexXS3bd2wNscZhEuuH9n
         GGLRnb+fDBC8FojyJU3WvCohqDQOdo9Tf6fK3whzHBOJWJGDST47wR8Z6peDSRNF33e4
         rrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296492; x=1725901292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wocjzcEW8JnEEzfAHeDQT7LKqe0fSVuG6u/ZFFnI324=;
        b=aETtZ6gUUMhKSgp60Y6OX55ws8E7oN0TRpAxUr2GV0lzSJO0kFcc90H9CvByEokEd4
         1PEGEc+/phmDaCmOqbkHZIKMGkx05C7JOpbdre5HvXjtZ5ir4KyHiBjguPgHFPZAi4KA
         ReTA4gqiROrIgeO7gOB0iP3KtZ8K9yDvm1w9YnHbiAbofnADQvDWcDhf/IUmnkU0TrFw
         X4XpWv4P+oG7mcbfIGktDf49U3YeqnFj3huZh456AV20XhkK4AnDtI3l/GsKZIj+hcrm
         SrR4WKxbV6cnqEgaXGedlaAwZYLc0KCHuM6pKrai0HH4bG2EJ2xOxZgOxjK1qZtAIiEP
         D/Ug==
X-Gm-Message-State: AOJu0YxCxXa2c9/Q/Emar4Z5XQHm5nD0RpDNpC/KVrP3KsmrVf0PBfhV
	5/pJQ80STj3sIW1LCCGnvyFLKTQrTF21slHnBmnzX2QvDOqyd9L8ZnclNQ==
X-Google-Smtp-Source: AGHT+IFeSb6Sd1OA6pxPnqTh1wCXDec2B2pZDBQgOJp3ENUKk7pYiReHr1TfpiJyLjM2uKbpmdUMWQ==
X-Received: by 2002:a05:6512:3d07:b0:530:e28a:3c17 with SMTP id 2adb3069b0e04-53546b34715mr8040355e87.25.1725296490977;
        Mon, 02 Sep 2024 10:01:30 -0700 (PDT)
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
Subject: [PATCH v6 6/9] xen/riscv: introduce functionality to work with CPU info
Date: Mon,  2 Sep 2024 19:01:19 +0200
Message-ID: <77a00222008f8b41d2454e74d1c9247252d7ccd9.1725295716.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725295716.git.oleksii.kurochko@gmail.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce struct pcpu_info to store pCPU-related information.
Initially, it includes only processor_id and hart id, but it
will be extended to include guest CPU information and
temporary variables for saving/restoring vCPU registers.

Add set_processor_id() and get_processor_id() functions to set
and retrieve the processor_id stored in pcpu_info.

Define smp_processor_id() to provide accurate information,
replacing the previous "dummy" value of 0.

Initialize tp registers to point to pcpu_info[0].
Set processor_id to 0 for logical CPU 0 and store the physical
CPU ID in pcpu_info[0].

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - update the commit message ( drop outdated information ).
 - s/FIXME commit/FIXME comment in "changes in V5".
 - code style fixes.
 - refactoring of smp_processor_id() and fix BUG_ON() condition inside it.
 - change "mv a0,x0" to "li a0, 0".
 - add __cacheline_aligned to the struct pcpu_info.
 - drop smp_set_bootcpu_id() and smpboot.c as it has only smp_set_bootcpu_id()
   defined at the moment.
 - re-write setup_tp() to assembler.
---
Changes in V5:
 - add hart_id to pcpu_info;
 - add comments to pcpu_info members.
 - define INVALID_HARTID as ULONG_MAX as mhart_id register has MXLEN which is
   equal to 32 for RV-32 and 64 for RV-64.
 - add hart_id to pcpu_info structure.
 - drop cpuid_to_hartid_map[] and use pcpu_info[] for the same purpose.
 - introduce new function setup_tp(cpuid).
 - add the FIXME comment on top of pcpu_info[].
 - setup TP register before start_xen() being called.
 - update the commit message.
 - change "commit message" to "comment" in "Changes in V4" in "update the comment
   above the code of TP..."
---
Changes in V4:
 - wrap id with () inside set_processor_id().
 - code style fixes
 - update BUG_ON(id > NR_CPUS) in smp_processor_id() and drop the comment
   above BUG_ON().
 - s/__cpuid_to_hartid_map/cpuid_to_hartid_map
 - s/cpuid_to_hartid_map/cpuid_to_harti ( here cpuid_to_hartid_map is the name
   of the macros ).
 - update the comment above the code of TP register initialization in
   start_xen().
 - s/smp_setup_processor_id/smp_setup_bootcpu_id
 - update the commit message.
 - cleanup headers which are included in <asm/processor.h>
---
Changes in V3:
 - new patch.
---
 xen/arch/riscv/Makefile                |  1 +
 xen/arch/riscv/include/asm/processor.h | 27 ++++++++++++++++++++++++--
 xen/arch/riscv/include/asm/smp.h       |  9 +++++++++
 xen/arch/riscv/riscv64/asm-offsets.c   |  2 ++
 xen/arch/riscv/riscv64/head.S          | 15 ++++++++++++++
 xen/arch/riscv/setup.c                 |  5 +++++
 xen/arch/riscv/smp.c                   | 15 ++++++++++++++
 7 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/smp.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 81b77b13d6..2f2d6647a2 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -4,6 +4,7 @@ obj-y += mm.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
+obj-y += smp.o
 obj-y += stubs.o
 obj-y += traps.o
 obj-y += vm_event.o
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 3ae164c265..4799243863 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -12,8 +12,31 @@
 
 #ifndef __ASSEMBLY__
 
-/* TODO: need to be implemeted */
-#define smp_processor_id() 0
+#include <xen/bug.h>
+
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
+#define get_processor_id()      (tp->processor_id)
+#define set_processor_id(id)    do { \
+    tp->processor_id = (id);         \
+} while (0)
+
+static inline unsigned int smp_processor_id(void)
+{
+    unsigned int id = get_processor_id();
+
+    BUG_ON(id > (NR_CPUS - 1));
+
+    return id;
+}
 
 /* On stack VCPU state */
 struct cpu_user_regs
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index b1ea91b1eb..11eee67d62 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -5,6 +5,8 @@
 #include <xen/cpumask.h>
 #include <xen/percpu.h>
 
+#include <asm/processor.h>
+
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
@@ -14,6 +16,13 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
  */
 #define park_offline_cpus false
 
+/*
+ * Mapping between linux logical cpu index and hartid.
+ */
+#define cpuid_to_hartid(cpu) (pcpu_info[cpu].hart_id)
+
+void setup_tp(unsigned int cpuid);
+
 #endif
 
 /*
diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
index 9f663b9510..11400c4697 100644
--- a/xen/arch/riscv/riscv64/asm-offsets.c
+++ b/xen/arch/riscv/riscv64/asm-offsets.c
@@ -50,4 +50,6 @@ void asm_offsets(void)
     OFFSET(CPU_USER_REGS_SSTATUS, struct cpu_user_regs, sstatus);
     OFFSET(CPU_USER_REGS_PREGS, struct cpu_user_regs, pregs);
     BLANK();
+    DEFINE(PCPU_INFO_SIZE, sizeof(struct pcpu_info));
+    BLANK();
 }
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 3261e9fce8..c7d8bf18c5 100644
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
@@ -72,6 +77,16 @@ FUNC(reset_stack)
         ret
 END(reset_stack)
 
+/* void setup_tp(unsigned int xen_cpuid); */
+FUNC(setup_tp)
+        la      tp, pcpu_info
+        li      t0, PCPU_INFO_SIZE
+        mul     t1, a0, t0
+        add     tp, tp, t1
+
+        ret
+END(setup_tp)
+
         .section .text.ident, "ax", %progbits
 
 FUNC(turn_on_mmu)
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 13f0e8c77d..540a3a608e 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,6 +8,7 @@
 #include <public/version.h>
 
 #include <asm/early_printk.h>
+#include <asm/smp.h>
 #include <asm/traps.h>
 
 void arch_get_xen_caps(xen_capabilities_info_t *info)
@@ -40,6 +41,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     remove_identity_mapping();
 
+    set_processor_id(0);
+
+    cpuid_to_hartid(0) = bootcpu_id;
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
2.46.0


