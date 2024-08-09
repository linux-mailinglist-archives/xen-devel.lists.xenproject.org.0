Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6094D482
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 18:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774850.1185292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLN-0002fd-6e; Fri, 09 Aug 2024 16:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774850.1185292; Fri, 09 Aug 2024 16:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLN-0002dU-2y; Fri, 09 Aug 2024 16:19:57 +0000
Received: by outflank-mailman (input) for mailman id 774850;
 Fri, 09 Aug 2024 16:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3r+=PI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1scSLL-0001id-Re
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 16:19:55 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3612a421-566b-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 18:19:54 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52f025ab3a7so2906312e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 09:19:54 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de481f09sm1028479e87.285.2024.08.09.09.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 09:19:52 -0700 (PDT)
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
X-Inumbo-ID: 3612a421-566b-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723220393; x=1723825193; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqQH7oDoSogjwT+iqJj3r10A5kWJSmwBWLYEG7TX9Q0=;
        b=T+QxAmyMRwwZEEGS5U8rtiyLlZiyusRu+9VeFy0tSASNSGPSFU7FNeb5ASrMKr205A
         87mtgUyaNd3NsbhsZc5XUi1wTuXNWkcdP3TgEQ2jpUi5XzopzdNwRH2JzzHboNUrim3X
         HXtB3zC9MOMd0Z2rxIG2A8PDXdJuIoaWQcjaoP6Ut3g2/GGTB4+k3L/KAKMrhiKn2Rp2
         YV+j/6XrGqBAEIe56KOXLvWGBAlm8uakOF7AUQ7w6FATXbNljQO60+evsXIY0/ASJ7ha
         9kJ7VSyR6rHA46zsQJhIEaMyU0v3a/fEbO6AWhZTcf9bX9tAwQTnfMMg1xrpbQKkl+7k
         Ht1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220393; x=1723825193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqQH7oDoSogjwT+iqJj3r10A5kWJSmwBWLYEG7TX9Q0=;
        b=E2vlPrsvWkAFNUI/zkmxo3RzH27BcA3wh7mhjhjZAt6KoyfL/420Llp+7vwahJza8x
         yUJTMaYA4oaj5HH4qhCArdUcpKVGhYSYtHhiymtfb7Rx6EzfrRRrCYW5zl2kLNZZGeXf
         7AVbIF+VuR7yyUPthgrt+OytDIjjHg7bV/2uGHDIql69C6hemKZ/vTp1JuGeP5OTuVLm
         jw0Abf2bZKiNXuBT2tql57Yw58m4ZxS5iLOFYQV3fRw+KMyM9mT6rBCNJEt2WdOb+1qH
         toK0MuTlufN6aqsxhlzhNdOq23f2txyiRR+Qi6E88qMQscqlsJQkJicx6ZU0uaBkJItW
         w71Q==
X-Gm-Message-State: AOJu0YzaGLQYDx3YXBjHIn0S9eAI14SIbilCv1XbAnEHU9f/wn9o+Sud
	w2Yttf0o5BNlJX3G4mD4CyEMlD06Jkgu95d4v0JKQkWQsdiEOJaKl/X0YQ==
X-Google-Smtp-Source: AGHT+IGPams98PZ3h+60/YlM+HYkwUopLU140INJc/Df18zVWjnLr7hzl+LfTo5ULVe8x0gU1tQtwA==
X-Received: by 2002:a05:6512:ea2:b0:52f:228:cf80 with SMTP id 2adb3069b0e04-530ee9b76c9mr1668389e87.40.1723220393085;
        Fri, 09 Aug 2024 09:19:53 -0700 (PDT)
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
Subject: [PATCH v4 4/7] xen/riscv: introduce functionality to work with CPU info
Date: Fri,  9 Aug 2024 18:19:42 +0200
Message-ID: <452e2960d1f064a2e3abcaae1ac354f48aafd24c.1723214540.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1723214540.git.oleksii.kurochko@gmail.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce struct pcpu_info to store pCPU-related information.
Initially, it includes only processor_id, but it will be extended
to include guest CPU information and temporary variables for
saving/restoring vCPU registers.

Add set_processor_id() and get_processor_id() functions to set
and retrieve the processor_id stored in pcpu_info.

Introduce cpuid_to_hartid_map[NR_CPUS] to map Xen logical CPUs to
hart IDs (physical CPU IDs). Add auxiliary macros cpuid_to_hartid()
for convenient access to this mapping.

Define smp_processor_id() to provide accurate information,
replacing the previous "dummy" value of 0.

Initialize tp registers to point to pcpu_info[0].
Set processor_id to 0 for logical CPU 0 and store the physical CPU ID
for the current logical CPU in cpuid_to_hartid_map[].

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - wrap id with () inside set_processor_id().
 - code style fixes
 - update BUG_ON(id > NR_CPUS) in smp_processor_id() and drop the comment
   above BUG_ON().
 - s/__cpuid_to_hartid_map/cpuid_to_hartid_map
 - s/cpuid_to_hartid_map/cpuid_to_harti ( here cpuid_to_hartid_map is the name
   of the macros ).
 - update the commit message above the code of TP register initialization in
   start_xen().
 - s/smp_setup_processor_id/smp_setup_bootcpu_id
 - update the commit message.
 - cleanup headers which are included in <asm/processor.h>
---
Changes in V3:
 - new patch.
---
 xen/arch/riscv/Makefile                |  2 ++
 xen/arch/riscv/include/asm/processor.h | 28 ++++++++++++++++++++++++--
 xen/arch/riscv/include/asm/smp.h       | 10 +++++++++
 xen/arch/riscv/setup.c                 | 14 +++++++++++++
 xen/arch/riscv/smp.c                   |  4 ++++
 xen/arch/riscv/smpboot.c               | 12 +++++++++++
 6 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/smp.c
 create mode 100644 xen/arch/riscv/smpboot.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 81b77b13d6..334fd24547 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -4,6 +4,8 @@ obj-y += mm.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
+obj-y += smp.o
+obj-y += smpboot.o
 obj-y += stubs.o
 obj-y += traps.o
 obj-y += vm_event.o
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 3ae164c265..fd4e9b4a37 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -12,8 +12,32 @@
 
 #ifndef __ASSEMBLY__
 
-/* TODO: need to be implemeted */
-#define smp_processor_id() 0
+#include <xen/bug.h>
+
+register struct pcpu_info *tp asm ("tp");
+
+struct pcpu_info {
+    unsigned int processor_id;
+};
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
+    unsigned int id;
+
+    id = get_processor_id();
+
+    BUG_ON(id > NR_CPUS);
+
+    return id;
+}
 
 /* On stack VCPU state */
 struct cpu_user_regs
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index b1ea91b1eb..9f49d2bc8b 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -5,6 +5,8 @@
 #include <xen/cpumask.h>
 #include <xen/percpu.h>
 
+#define INVALID_HARTID UINT_MAX
+
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
@@ -14,6 +16,14 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
  */
 #define park_offline_cpus false
 
+void smp_set_bootcpu_id(unsigned long boot_cpu_hartid);
+
+/*
+ * Mapping between linux logical cpu index and hartid.
+ */
+extern unsigned long cpuid_to_hartid_map[NR_CPUS];
+#define cpuid_to_hartid(cpu) cpuid_to_hartid_map[cpu]
+
 #endif
 
 /*
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 13f0e8c77d..c9446e6038 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,6 +8,7 @@
 #include <public/version.h>
 
 #include <asm/early_printk.h>
+#include <asm/smp.h>
 #include <asm/traps.h>
 
 void arch_get_xen_caps(xen_capabilities_info_t *info)
@@ -40,6 +41,19 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     remove_identity_mapping();
 
+    /*
+     * tp register contains an address of physical cpu information.
+     * So write physical CPU info of boot cpu to tp register
+     * It will be used later by get_processor_id() ( look at
+     * <asm/processor.h> ):
+     *   #define get_processor_id()    (tp->processor_id)
+     */
+    asm volatile ( "mv tp, %0" : : "r"((unsigned long)&pcpu_info[0]) );
+
+    set_processor_id(0);
+
+    smp_set_bootcpu_id(bootcpu_id);
+
     trap_init();
 
 #ifdef CONFIG_SELF_TESTS
diff --git a/xen/arch/riscv/smp.c b/xen/arch/riscv/smp.c
new file mode 100644
index 0000000000..779d955e3a
--- /dev/null
+++ b/xen/arch/riscv/smp.c
@@ -0,0 +1,4 @@
+#include <xen/smp.h>
+
+/* tp points to one of these per cpu */
+struct pcpu_info pcpu_info[NR_CPUS];
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
new file mode 100644
index 0000000000..6690522a52
--- /dev/null
+++ b/xen/arch/riscv/smpboot.c
@@ -0,0 +1,12 @@
+#include <xen/init.h>
+#include <xen/sections.h>
+#include <xen/smp.h>
+
+unsigned long cpuid_to_hartid_map[NR_CPUS] __ro_after_init = {
+    [0 ... NR_CPUS - 1] = INVALID_HARTID
+};
+
+void __init smp_set_bootcpu_id(unsigned long boot_cpu_hartid)
+{
+    cpuid_to_hartid(0) = boot_cpu_hartid;
+}
-- 
2.45.2


