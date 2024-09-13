Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D20B978547
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 17:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798300.1208505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8gb-00010K-BM; Fri, 13 Sep 2024 15:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798300.1208505; Fri, 13 Sep 2024 15:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8gb-0000wl-3q; Fri, 13 Sep 2024 15:58:17 +0000
Received: by outflank-mailman (input) for mailman id 798300;
 Fri, 13 Sep 2024 15:58:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSyI=QL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sp8gY-0000A5-Tb
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 15:58:14 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb8afc8a-71e8-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 17:58:13 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5365d3f9d34so1344503e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 08:58:13 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f9038e3sm2348008e87.187.2024.09.13.08.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:58:12 -0700 (PDT)
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
X-Inumbo-ID: fb8afc8a-71e8-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726243093; x=1726847893; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXFJidxQDiGaEfKB7fqlEAp0impdm4D9++KlmnlKdiI=;
        b=KAqP3CDjW0YEJLNJPAiuUtjekAKPVp3IMjmo7xw5Ln2iV6YeFXWR+FrxHYtQWNb2Bd
         67NxcuYSV5yiAsS3DOERDukFE6EOZixRIFamh4NdFND22213zCGNoGPz0sEp9bd7ZUOu
         DALyvadaTM401GoFn6DnABie1HZ/50SnjMd/4/hFc2WAQwVQFHUpnfV1SJmhpE1gdI1S
         4H3iG506lpmlM30kBl3B7o2lIgRvjHRFcqHLKtJVKxHgq/fB2WPEtKUMYP7SjeIkXsOS
         9NDI/knN+KeSq1QMrnjsUL8rQ44GniyxoEx4Pb3WEVIFBA4RWWzGOz4pTG3Kg0hWK3so
         jCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726243093; x=1726847893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXFJidxQDiGaEfKB7fqlEAp0impdm4D9++KlmnlKdiI=;
        b=qeeOlQP8auj5j0+mMPCS2Yik6DOrhksWkb7ulfyNfmsPPYGVmp+ff7tyfADeEgsI+g
         nwoMjf4bR2xExdBHzqHfJCifL3XclZJvjyHmg+P/lxiBKTLtEdEdRGq3GzvvRs2wEHa8
         0kvjAybNfXmQB6YZa4V7rSAZJW3oqsu+U5XnJD0n9EBc9zjo5RRiIPf+ErZABv36fKA3
         AzJauU0ThWedBgQEqAEo/d9Gjh7rcCUshO5aWb1Qmhz3fNaxUX2Z7xEHZq6ITJwukBYX
         vJJzxPD5v1cUhKmgQHZncH3dH+voOjcMozIHNGaaybcmMlNK1qAv09sW7/Uah9TGaDaB
         BBjw==
X-Gm-Message-State: AOJu0YxIrBDyMLA/01lAH92J43zNC0qBeln9FQVS2OjhO8FiDt+H49nv
	paV2uno4Qzux3n/VB13ei/1LRbboXeeOfxNrKTm0ak3Exg+ZEBqSsiXY7w==
X-Google-Smtp-Source: AGHT+IFazuaiIX8u+eHhhOpdKaEbYkWsDZN2m8MKCjF1Ya3Gth7BeSKFeVKKQs4tc86qJUAs5gmXPQ==
X-Received: by 2002:a05:6512:2309:b0:535:6965:be19 with SMTP id 2adb3069b0e04-5367ff32b8emr2258851e87.56.1726243092956;
        Fri, 13 Sep 2024 08:58:12 -0700 (PDT)
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
Subject: [PATCH v7 5/8] xen/riscv: introduce functionality to work with CPU info
Date: Fri, 13 Sep 2024 17:57:43 +0200
Message-ID: <461a246e3a54345578556821f2c7dbf01e348a05.1726242605.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726242605.git.oleksii.kurochko@gmail.com>
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
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

Introduce helpers for getting hart_id ( physical CPU id in RISC-V
terms ) from Xen CPU id.

Removing of <asm/processor.h> inclusion leads to the following
compilation error:
  common/keyhandler.c: In function 'dump_registers':
  common/keyhandler.c:200:13: error: implicit declaration of function
     'cpu_relax' [-Werror=implicit-function-declaration]
  200 |             cpu_relax();

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - remove get_processor_id().
 - move definition of tp variable, struct pcpu_info, pcpu_info[], set_processor_id()
   and smp_processor_id() from asm/processor.h to asm/current.h. (1)
 - change xen/lib.h to xen/bug.h in current.h, for BUG_ON() it is enough xen/bug.h
 - update BUG_ON() from BUG_ON(id > (NR_CPUS-1)) to BUG_ON(id >= NR_CPUS) in
   smp_processor_id().
 - update the comment above cpuid_to_hartid().
 - refactor setup_tp() to the way suggested by Jan B.
 - add helpers to get and set cpuid to hartid.
 - update the commit message: add information that removing of <asm/processor.h> from
   <asm/current.h> leads to compilation error.
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
index b1ea91b1eb..7cb8b86144 100644
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
+static inline void map_cpuid_to_hartid(unsigned long cpuid,
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
index 82c5752da1..0fd6c37b61 100644
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
+    map_cpuid_to_hartid(0, bootcpu_id);
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


