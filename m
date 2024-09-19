Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D138497CBEA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 17:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800819.1210841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srJZD-0007ph-3M; Thu, 19 Sep 2024 15:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800819.1210841; Thu, 19 Sep 2024 15:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srJZC-0007mn-VD; Thu, 19 Sep 2024 15:59:38 +0000
Received: by outflank-mailman (input) for mailman id 800819;
 Thu, 19 Sep 2024 15:59:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hDEZ=QR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1srJZB-0007Xh-ID
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 15:59:37 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2aac93ae-76a0-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 17:59:35 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2f758f84dfbso8604041fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 08:59:35 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5369fa5ceb3sm631423e87.32.2024.09.19.08.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 08:59:33 -0700 (PDT)
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
X-Inumbo-ID: 2aac93ae-76a0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726761575; x=1727366375; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4ogMD5qj9Ojvj9pKrV6TEii4f0ruogGxRKW9OTfnRI=;
        b=GES+N8OBTnSGjbgcYLfaNs1le5ICazgucuibDLYQESreTrwwd4q4E6q+q/jeiZ1K9r
         OmS3Bm3lsMdYiIXzzO4ITdoiJ5Vi9dBg8t3CM6ITfuK3FJDkBATe19k3XWklsHT9lIhE
         6zHxhlBA+y10Kre27GfaMyNIWfqgpbhhu0+JvZvFsZOUKtik2S9DqiTF++E2xy9sOxlF
         DmMW1hUFGEWuYrrRNoE5lzWsQ+npF/I0zhLc2uObBXzoczBdA6xKqhxvQ1lVi8dsSQLh
         oQGsizvm6N+n3CQQ5MnX4XmS4g7WcAZmGEVgQ9ItkxOo1UwXSVjLB4eARmau5oZcCu43
         8bRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726761575; x=1727366375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4ogMD5qj9Ojvj9pKrV6TEii4f0ruogGxRKW9OTfnRI=;
        b=NSYv0MVLSZ1aHSC2Pf1CNNPUL61xhn5/YYALUL1hAwL8zQFqanY1dI0ojbrvNk2jaX
         ial8ZD8mkAjgz6nQtM0WRMgogBdMbKZZptwNhdfs2jMKSUY6kMBz/UDduuCbwFe5PhSX
         t212DW98sQwzVP7mlswKt/qYAsPDYnNGYB+UvXQho6aRs8P0vR0iJAeW6PVrtt9nugVf
         nnMLfi5CWxdWJ04AGvzcgvLizoGmBO0gbSm+lVZq8YkehWOsm9ir0LdS90ssnAgqZiIb
         swzaH2HmMcI1UG1AaKT9n8FAr12D2TTjS3MhxsItUf70MhRQ0JeA/slhywLQg/1OjR9l
         jXCg==
X-Gm-Message-State: AOJu0Yw/JOpxi1v3LtXIeUV3pdrwlyUt9aMNY9T59Obb5NTHWQTXnStu
	PAyIk2zBG3cXE4aSowNWZzKScmlkiYdSaBUIIqyULlvlOmovbu8M4K9PNg==
X-Google-Smtp-Source: AGHT+IGFvNFwcfFDW7pOkN1a+WIdpY0cxTj+zhmmZy3bPr6mgnoz8wC7scGaW3nIhqvy4kyhI+3RLQ==
X-Received: by 2002:a05:6512:2395:b0:52c:e012:efad with SMTP id 2adb3069b0e04-53678fb4642mr16445894e87.12.1726761574337;
        Thu, 19 Sep 2024 08:59:34 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 2/2] xen: move per-cpu area management into common code
Date: Thu, 19 Sep 2024 17:59:28 +0200
Message-ID: <15b9b94e1acb70ba713391de5bae42a622c29747.1726746877.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726746877.git.oleksii.kurochko@gmail.com>
References: <cover.1726746877.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Centralize per-cpu area management to reduce code duplication and
enhance maintainability across architectures.

The per-cpu area management code, which is largely common among
architectures, is moved to a shared implementation in
xen/common/percpu.c. This change includes:
 * Add arch_percpu_area_init_status() and arch_cpu_percpu_callback()
   functions to address architecture-specific variations.
 * Remove percpu.c from the Arm architecture.
 * For x86, percpu.c now only defines arch_percpu_area_init_status()
   and arch_cpu_percpu_callback(), and INVALID_PERCPU_AREA.
 * Drop the declaration of __per_cpu_offset[] from stubs.c in
   PPC and RISC-V to facilitate the build of the common per-cpu code.

No functional changes.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/Makefile             |   1 -
 xen/arch/arm/percpu.c             |  85 --------------------
 xen/arch/ppc/stubs.c              |   1 -
 xen/arch/riscv/stubs.c            |   1 -
 xen/arch/x86/include/asm/Makefile |   1 -
 xen/arch/x86/include/asm/percpu.h |  18 +++++
 xen/arch/x86/percpu.c             |  92 ++--------------------
 xen/common/Makefile               |   1 +
 xen/common/percpu.c               | 127 ++++++++++++++++++++++++++++++
 xen/include/asm-generic/percpu.h  |   8 ++
 10 files changed, 159 insertions(+), 176 deletions(-)
 delete mode 100644 xen/arch/arm/percpu.c
 create mode 100644 xen/arch/x86/include/asm/percpu.h
 create mode 100644 xen/common/percpu.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7792bff597..e4ad1ce851 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -39,7 +39,6 @@ obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
 obj-y += p2m.o
-obj-y += percpu.o
 obj-y += platform.o
 obj-y += platform_hypercall.o
 obj-y += physdev.o
diff --git a/xen/arch/arm/percpu.c b/xen/arch/arm/percpu.c
deleted file mode 100644
index 87fe960330..0000000000
--- a/xen/arch/arm/percpu.c
+++ /dev/null
@@ -1,85 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <xen/percpu.h>
-#include <xen/cpu.h>
-#include <xen/init.h>
-#include <xen/mm.h>
-#include <xen/rcupdate.h>
-
-unsigned long __per_cpu_offset[NR_CPUS];
-#define INVALID_PERCPU_AREA (-(long)__per_cpu_start)
-#define PERCPU_ORDER (get_order_from_bytes(__per_cpu_data_end-__per_cpu_start))
-
-void __init percpu_init_areas(void)
-{
-    unsigned int cpu;
-    for ( cpu = 1; cpu < NR_CPUS; cpu++ )
-        __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
-}
-
-static int init_percpu_area(unsigned int cpu)
-{
-    char *p;
-    if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
-        return -EBUSY;
-    if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
-        return -ENOMEM;
-    memset(p, 0, __per_cpu_data_end - __per_cpu_start);
-    __per_cpu_offset[cpu] = p - __per_cpu_start;
-    return 0;
-}
-
-struct free_info {
-    unsigned int cpu;
-    struct rcu_head rcu;
-};
-static DEFINE_PER_CPU(struct free_info, free_info);
-
-static void _free_percpu_area(struct rcu_head *head)
-{
-    struct free_info *info = container_of(head, struct free_info, rcu);
-    unsigned int cpu = info->cpu;
-    char *p = __per_cpu_start + __per_cpu_offset[cpu];
-    free_xenheap_pages(p, PERCPU_ORDER);
-    __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
-}
-
-static void free_percpu_area(unsigned int cpu)
-{
-    struct free_info *info = &per_cpu(free_info, cpu);
-    info->cpu = cpu;
-    call_rcu(&info->rcu, _free_percpu_area);
-}
-
-static int cpu_percpu_callback(
-    struct notifier_block *nfb, unsigned long action, void *hcpu)
-{
-    unsigned int cpu = (unsigned long)hcpu;
-    int rc = 0;
-
-    switch ( action )
-    {
-    case CPU_UP_PREPARE:
-        rc = init_percpu_area(cpu);
-        break;
-    case CPU_UP_CANCELED:
-    case CPU_DEAD:
-        free_percpu_area(cpu);
-        break;
-    default:
-        break;
-    }
-
-    return notifier_from_errno(rc);
-}
-
-static struct notifier_block cpu_percpu_nfb = {
-    .notifier_call = cpu_percpu_callback,
-    .priority = 100 /* highest priority */
-};
-
-static int __init percpu_presmp_init(void)
-{
-    register_cpu_notifier(&cpu_percpu_nfb);
-    return 0;
-}
-presmp_initcall(percpu_presmp_init);
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index bdb5f8c66d..fff82f5cf3 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -141,7 +141,6 @@ void smp_send_state_dump(unsigned int cpu)
 /* domain.c */
 
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
-unsigned long __per_cpu_offset[NR_CPUS];
 
 void context_switch(struct vcpu *prev, struct vcpu *next)
 {
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 2aa245f272..5951b0ce91 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -133,7 +133,6 @@ void smp_send_state_dump(unsigned int cpu)
 /* domain.c */
 
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
-unsigned long __per_cpu_offset[NR_CPUS];
 
 void context_switch(struct vcpu *prev, struct vcpu *next)
 {
diff --git a/xen/arch/x86/include/asm/Makefile b/xen/arch/x86/include/asm/Makefile
index daab34ff0a..2c27787d31 100644
--- a/xen/arch/x86/include/asm/Makefile
+++ b/xen/arch/x86/include/asm/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += div64.h
-generic-y += percpu.h
diff --git a/xen/arch/x86/include/asm/percpu.h b/xen/arch/x86/include/asm/percpu.h
new file mode 100644
index 0000000000..0f9efba27a
--- /dev/null
+++ b/xen/arch/x86/include/asm/percpu.h
@@ -0,0 +1,18 @@
+#ifndef __X86_PERCPU_H__
+#define __X86_PERCPU_H__
+
+#include <asm-generic/percpu.h>
+
+/*
+ * Force uses of per_cpu() with an invalid area to attempt to access the
+ * middle of the non-canonical address space resulting in a #GP, rather than a
+ * possible #PF at (NULL + a little) which has security implications in the
+ * context of PV guests.
+ */
+#define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned long)__per_cpu_start)
+
+#define ARCH_PERCPU_AREA_CHECK
+
+#define ARCH_CPU_PERCPU_CALLBACK
+
+#endif /* __X86_PERCPU_H__ */
diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
index 3205eacea6..33bded8cac 100644
--- a/xen/arch/x86/percpu.c
+++ b/xen/arch/x86/percpu.c
@@ -1,79 +1,19 @@
-#include <xen/percpu.h>
 #include <xen/cpu.h>
-#include <xen/init.h>
-#include <xen/mm.h>
-#include <xen/rcupdate.h>
-
-unsigned long __per_cpu_offset[NR_CPUS];
-
-/*
- * Force uses of per_cpu() with an invalid area to attempt to access the
- * middle of the non-canonical address space resulting in a #GP, rather than a
- * possible #PF at (NULL + a little) which has security implications in the
- * context of PV guests.
- */
-#define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned long)__per_cpu_start)
-#define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
-
-void __init percpu_init_areas(void)
-{
-    unsigned int cpu;
-
-    for ( cpu = 1; cpu < NR_CPUS; cpu++ )
-        __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
-}
+#include <xen/percpu.h>
+#include <xen/smp.h>
 
-static int init_percpu_area(unsigned int cpu)
+int arch_percpu_area_init_status(void)
 {
-    char *p;
-
-    if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
-        return 0;
-
-    if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
-        return -ENOMEM;
-
-    memset(p, 0, __per_cpu_data_end - __per_cpu_start);
-    __per_cpu_offset[cpu] = p - __per_cpu_start;
-
     return 0;
 }
 
-struct free_info {
-    unsigned int cpu;
-    struct rcu_head rcu;
-};
-static DEFINE_PER_CPU(struct free_info, free_info);
-
-static void cf_check _free_percpu_area(struct rcu_head *head)
-{
-    struct free_info *info = container_of(head, struct free_info, rcu);
-    unsigned int cpu = info->cpu;
-    char *p = __per_cpu_start + __per_cpu_offset[cpu];
-
-    free_xenheap_pages(p, PERCPU_ORDER);
-    __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
-}
-
-static void free_percpu_area(unsigned int cpu)
-{
-    struct free_info *info = &per_cpu(free_info, cpu);
-
-    info->cpu = cpu;
-    call_rcu(&info->rcu, _free_percpu_area);
-}
-
-static int cf_check cpu_percpu_callback(
-    struct notifier_block *nfb, unsigned long action, void *hcpu)
+int arch_cpu_percpu_callback(struct notifier_block *nfb,
+                             unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
-    int rc = 0;
 
     switch ( action )
     {
-    case CPU_UP_PREPARE:
-        rc = init_percpu_area(cpu);
-        break;
     case CPU_UP_CANCELED:
     case CPU_DEAD:
     case CPU_RESUME_FAILED:
@@ -86,27 +26,5 @@ static int cf_check cpu_percpu_callback(
         break;
     }
 
-    return notifier_from_errno(rc);
-}
-
-static struct notifier_block cpu_percpu_nfb = {
-    .notifier_call = cpu_percpu_callback,
-    .priority = 100 /* highest priority */
-};
-
-static int __init cf_check percpu_presmp_init(void)
-{
-    register_cpu_notifier(&cpu_percpu_nfb);
-
     return 0;
 }
-presmp_initcall(percpu_presmp_init);
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/common/Makefile b/xen/common/Makefile
index fc52e0857d..f90bb00d23 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -31,6 +31,7 @@ obj-y += notifier.o
 obj-$(CONFIG_NUMA) += numa.o
 obj-y += page_alloc.o
 obj-y += pdx.o
+obj-y += percpu.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
 obj-bin-$(CONFIG_HAS_PMAP) += pmap.init.o
 obj-y += preempt.o
diff --git a/xen/common/percpu.c b/xen/common/percpu.c
new file mode 100644
index 0000000000..3837ef5714
--- /dev/null
+++ b/xen/common/percpu.c
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <xen/percpu.h>
+#include <xen/cpu.h>
+#include <xen/init.h>
+#include <xen/mm.h>
+#include <xen/rcupdate.h>
+
+unsigned long __per_cpu_offset[NR_CPUS];
+
+#ifndef INVALID_PERCPU_AREA
+#define INVALID_PERCPU_AREA (-(long)__per_cpu_start)
+#endif
+
+#ifndef ARCH_PERCPU_AREA_CHECK
+inline int arch_percpu_area_init_status(void)
+{
+    return -EBUSY;
+}
+#endif
+
+#ifndef ARCH_CPU_PERCPU_CALLBACK
+inline int arch_cpu_percpu_callback(struct notifier_block *nfb,
+                                    unsigned long action, void *hcpu)
+{
+    unsigned int cpu = (unsigned long)hcpu;
+
+    switch ( action )
+    {
+    case CPU_UP_CANCELED:
+    case CPU_DEAD:
+        free_percpu_area(cpu);
+        break;
+    }
+
+    return 0;
+}
+#endif
+
+#define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
+
+void __init percpu_init_areas(void)
+{
+    unsigned int cpu;
+
+    for ( cpu = 1; cpu < NR_CPUS; cpu++ )
+        __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
+}
+
+static int init_percpu_area(unsigned int cpu)
+{
+    char *p;
+
+    if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
+        return arch_percpu_area_init_status();
+
+    if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
+        return -ENOMEM;
+
+    memset(p, 0, __per_cpu_data_end - __per_cpu_start);
+    __per_cpu_offset[cpu] = p - __per_cpu_start;
+
+    return 0;
+}
+
+struct free_info {
+    unsigned int cpu;
+    struct rcu_head rcu;
+};
+static DEFINE_PER_CPU(struct free_info, free_info);
+
+static void cf_check _free_percpu_area(struct rcu_head *head)
+{
+    struct free_info *info = container_of(head, struct free_info, rcu);
+    unsigned int cpu = info->cpu;
+    char *p = __per_cpu_start + __per_cpu_offset[cpu];
+
+    free_xenheap_pages(p, PERCPU_ORDER);
+    __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
+}
+
+void free_percpu_area(unsigned int cpu)
+{
+    struct free_info *info = &per_cpu(free_info, cpu);
+
+    info->cpu = cpu;
+    call_rcu(&info->rcu, _free_percpu_area);
+}
+
+static int cf_check cpu_percpu_callback(
+    struct notifier_block *nfb, unsigned long action, void *hcpu)
+{
+    unsigned int cpu = (unsigned long)hcpu;
+    int rc = 0;
+
+    switch ( action )
+    {
+    case CPU_UP_PREPARE:
+        rc = init_percpu_area(cpu);
+        break;
+    default:
+        arch_cpu_percpu_callback(nfb, action, hcpu);
+    }
+
+    return notifier_from_errno(rc);
+}
+
+static struct notifier_block cpu_percpu_nfb = {
+    .notifier_call = cpu_percpu_callback,
+    .priority = 100 /* highest priority */
+};
+
+static int __init cf_check percpu_presmp_init(void)
+{
+    register_cpu_notifier(&cpu_percpu_nfb);
+
+    return 0;
+}
+presmp_initcall(percpu_presmp_init);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/asm-generic/percpu.h b/xen/include/asm-generic/percpu.h
index 60af4f9ff9..c0373b1ad9 100644
--- a/xen/include/asm-generic/percpu.h
+++ b/xen/include/asm-generic/percpu.h
@@ -12,6 +12,14 @@ extern const char __per_cpu_data_end[];
 extern unsigned long __per_cpu_offset[NR_CPUS];
 void percpu_init_areas(void);
 
+void free_percpu_area(unsigned int cpu);
+
+int arch_percpu_area_init_status(void);
+
+struct notifier_block;
+int arch_cpu_percpu_callback(struct notifier_block *nfb,
+                             unsigned long action, void *hcpu);
+
 #define per_cpu(var, cpu)  \
     (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
 
-- 
2.46.0


