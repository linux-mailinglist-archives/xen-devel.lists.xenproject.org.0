Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B17695A266
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 18:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781296.1190871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqt-0004eg-BO; Wed, 21 Aug 2024 16:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781296.1190871; Wed, 21 Aug 2024 16:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqt-0004Vb-53; Wed, 21 Aug 2024 16:06:27 +0000
Received: by outflank-mailman (input) for mailman id 781296;
 Wed, 21 Aug 2024 16:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Njk=PU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sgnqr-0003uu-IN
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 16:06:25 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50147560-5fd7-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 18:06:23 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52efe4c7c16so8788929e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 09:06:23 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334c75a2cbsm18101e87.187.2024.08.21.09.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 09:06:22 -0700 (PDT)
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
X-Inumbo-ID: 50147560-5fd7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724256383; x=1724861183; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIHhs5IXiWMtLXpZ4bVpcdEviO9myYu2vT9d0eE7bZY=;
        b=NrHgAFgaZGQ5NaUhdRTGs9gRRhpUjgWB/MXm2BqgaN9avVgaruc2/2CGnnu520KV8s
         MnnNZNyF/yrZMuDDKqqnzHHqNRknjcIo0Neoy8MFpfIJMenRUFq20K1mAH3M51LJMFjt
         8JkRKcFmZg+x5Q5lviNbMN/uiucBUaFV6m94fj1VoZRXwBXvtiX5trjJJObZNZKRep6h
         6HiJQX7Y9S9PN6OKYTVQNxmwjSHX3Z/dtqgTM8tfW8oMwP9ZqOASX4INI4tZcPPRnPmE
         7HmWELLM0RlHzw51I/ZG61BC6vsyPzKJhZuTAe8Y0S1qIWqk8EcvwVvyy8zepuBk0OSv
         DYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724256383; x=1724861183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIHhs5IXiWMtLXpZ4bVpcdEviO9myYu2vT9d0eE7bZY=;
        b=F+q5Rwl5CnJf2Sd6NRfNDzN7jjFHA5OhMXJ9ExGtJY3izp6AaAPoCme2eMFNfeud/0
         4qwBxq73QPl88yqa8zP9PCYRId185fZuo4GjwFC9K650m5saMIiIkkzRFE+EdxtRkF3H
         w8RtKVL0bgOJKqXn+/JvA9yYfG6L76dyvnHDoJJLEx06ttnEcKgKH/0tD/c/gogU8yg/
         toJjeHhCsZkphjap9GOe93bctoBRt+bOP31L+IuR29ajqOUc5/NArEHWdI/m3URE5lyd
         34RkpzWq9FYCWlf7zsn1W4VYj/iODgz07+ktVsjpgxKBWsV7z1J3XCltvbT21IEjd46w
         Bc5g==
X-Gm-Message-State: AOJu0Yx9SseI4pP5KLbvUCSIK+esaBfmAZfzP4LrwmhUcQ2lbq6QsbEt
	svZDnyEodwDtT9a6Nrgr6HZyAOB3f2zAvaKLVIDD/2OsTz9MD+PSqSR4Qw==
X-Google-Smtp-Source: AGHT+IG6t1lR0jPw4fuojzNy3cEPAh/mC8nhkhX+GydsIroadODO5JHSLlrqrXr7W6b2SoluyjhMnQ==
X-Received: by 2002:a05:6512:b10:b0:52e:fc7b:39cb with SMTP id 2adb3069b0e04-533485599aamr1902798e87.26.1724256382485;
        Wed, 21 Aug 2024 09:06:22 -0700 (PDT)
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
Subject: [PATCH v5 4/7] xen/riscv: introduce functionality to work with CPU info
Date: Wed, 21 Aug 2024 18:06:13 +0200
Message-ID: <03a703996ae7300a9eda54283711b19c42a7d116.1724256027.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1724256026.git.oleksii.kurochko@gmail.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce struct pcpu_info to store pCPU-related information.
Initially, it includes only processor_id and hart id, but it
will be extended to include guest CPU information and
temporary variables for saving/restoring vCPU registers.

Add set_processor_id() and get_processor_id() functions to set
and retrieve the processor_id stored in pcpu_info.

Introduce cpuid_to_hartid_map() to convert Xen logical CPUs to
hart IDs (physical CPU IDs).

Define smp_processor_id() to provide accurate information,
replacing the previous "dummy" value of 0.

Initialize tp registers to point to pcpu_info[0].
Set processor_id to 0 for logical CPU 0 and store the physical
CPU ID in pcpu_info[0].

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - add hart_id to pcpu_info;
 - add comments to pcpu_info members.
 - define INVALID_HARTID as ULONG_MAX as mhart_id register has MXLEN which is
   equal to 32 for RV-32 and 64 for RV-64.
 - add hart_id to pcpu_info structure.
 - drop cpuid_to_hartid_map[] and use pcpu_info[] for the same purpose.
 - introduce new function setup_tp(cpuid).
 - add the FIXME commit on top of pcpu_info[].
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
 xen/arch/riscv/Makefile                |  2 ++
 xen/arch/riscv/include/asm/processor.h | 29 ++++++++++++++++++++++++--
 xen/arch/riscv/include/asm/smp.h       | 11 ++++++++++
 xen/arch/riscv/riscv64/head.S          |  4 ++++
 xen/arch/riscv/setup.c                 |  5 +++++
 xen/arch/riscv/smp.c                   | 21 +++++++++++++++++++
 xen/arch/riscv/smpboot.c               |  8 +++++++
 7 files changed, 78 insertions(+), 2 deletions(-)
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
index 3ae164c265..98c45afb6c 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -12,8 +12,33 @@
 
 #ifndef __ASSEMBLY__
 
-/* TODO: need to be implemeted */
-#define smp_processor_id() 0
+#include <xen/bug.h>
+
+register struct pcpu_info *tp asm ("tp");
+
+struct pcpu_info {
+    unsigned int processor_id; /* Xen CPU id */
+    unsigned long hart_id; /* physical CPU id */
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
index b1ea91b1eb..2b719616ee 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -5,6 +5,10 @@
 #include <xen/cpumask.h>
 #include <xen/percpu.h>
 
+#include <asm/processor.h>
+
+#define INVALID_HARTID ULONG_MAX
+
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
@@ -14,6 +18,13 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
  */
 #define park_offline_cpus false
 
+void smp_set_bootcpu_id(unsigned long boot_cpu_hartid);
+
+/*
+ * Mapping between linux logical cpu index and hartid.
+ */
+#define cpuid_to_hartid(cpu) pcpu_info[cpu].hart_id
+
 #endif
 
 /*
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 3261e9fce8..9e5b9a0708 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -55,6 +55,10 @@ FUNC(start)
          */
         jal     reset_stack
 
+        /* Xen's boot cpu id is equal to 0 so setup TP register for it */
+        mv      a0, x0
+        jal     setup_tp
+
         /* restore hart_id ( bootcpu_id ) and dtb address */
         mv      a0, s0
         mv      a1, s1
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 13f0e8c77d..e15f34509c 100644
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
+    smp_set_bootcpu_id(bootcpu_id);
+
     trap_init();
 
 #ifdef CONFIG_SELF_TESTS
diff --git a/xen/arch/riscv/smp.c b/xen/arch/riscv/smp.c
new file mode 100644
index 0000000000..478ea5aeab
--- /dev/null
+++ b/xen/arch/riscv/smp.c
@@ -0,0 +1,21 @@
+#include <xen/smp.h>
+
+/*
+ * FIXME: make pcpu_info[] dynamically allocated when necessary
+ *        functionality will be ready
+ */
+/* tp points to one of these per cpu */
+struct pcpu_info pcpu_info[NR_CPUS] = { { 0, INVALID_HARTID } };
+
+void setup_tp(unsigned int cpuid)
+{
+    /*
+     * tp register contains an address of physical cpu information.
+     * So write physical CPU info of cpuid to tp register.
+     * It will be used later by get_processor_id() ( look at
+     * <asm/processor.h> ):
+     *   #define get_processor_id()    (tp->processor_id)
+     */
+    asm volatile ( "mv tp, %0"
+                   :: "r" ((unsigned long)&pcpu_info[cpuid]) : "memory" );
+}
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
new file mode 100644
index 0000000000..34319f8875
--- /dev/null
+++ b/xen/arch/riscv/smpboot.c
@@ -0,0 +1,8 @@
+#include <xen/init.h>
+#include <xen/sections.h>
+#include <xen/smp.h>
+
+void __init smp_set_bootcpu_id(unsigned long boot_cpu_hartid)
+{
+    cpuid_to_hartid(0) = boot_cpu_hartid;
+}
-- 
2.46.0


