Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2029849DF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803177.1213648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cW-0006yl-V5; Tue, 24 Sep 2024 16:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803177.1213648; Tue, 24 Sep 2024 16:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cW-0006sf-NY; Tue, 24 Sep 2024 16:42:36 +0000
Received: by outflank-mailman (input) for mailman id 803177;
 Tue, 24 Sep 2024 16:42:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi3U=QW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1st8cU-0006ag-UZ
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:42:35 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffb6c025-7a93-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 18:42:34 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso102915a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:42:34 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393134917sm101862166b.203.2024.09.24.09.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:42:32 -0700 (PDT)
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
X-Inumbo-ID: ffb6c025-7a93-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727196153; x=1727800953; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMXSImRDsl0ngqSTSrK1CSW4XaKEG4u0XTGvXo/25TA=;
        b=WfxYT9UTKnCBFsJUFp3gvRRsIpoR3DJP0kd3eioQbZyGXY8/AYjSEhOn5yzxruD/lL
         lQJ9aXo4+st1dH4Ptkc7cQaOyC1iCYl1KKl4rDXyQ5apbhHqfnThfYfTvQa+wxL8tDHY
         WAXBV3gD9E2il2rIEJ2dZXs0Ec/ejkOM96fSFDuQehFOe/mCwRWUwn4S3sIK6x2iQMQ6
         fCazI0pz4F0jhNHjW9788tgIvTkKzUuCEws3XfHxiwNcvum7MYEPuCY4L38+wFuvvYG6
         EE14E78chBKkzfo2oRpMCyIaVL1FpAwxjNsEOP/EVIAjVgDafeLHJpQung9+f8xW/TjZ
         5dQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727196153; x=1727800953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMXSImRDsl0ngqSTSrK1CSW4XaKEG4u0XTGvXo/25TA=;
        b=hfsJ2x+6tF3l9GkZXa5q+uB+awPCiAwRp8Ku+l3pnnAC+cYoi6aHtwFQykw0JNOyAq
         bDORH9aqTzNkNsGp2+xURtrI+O9SFdJuPfORlLHVZT792nfQYeGDbZTtujOJuh9xJYCa
         yytU7OrqAnLsLx6LT9RE8P9bcG7n4+U5hcpdQBQsVH99pMLvsR5ASWpjZKB16aXjEeOD
         W35ICtEjiNF0P+LGPv1wsW9Y752SKX3CkMZEaFOMZLJEjk/GZbnQ5adaVIGV9oFGb9fN
         kHawjVMb3PfoyeAo6uVgWKzDHCAQ3+kAnXM4SuVJLKxUkzwQov5YvnNysGdo5ejpvzit
         M32A==
X-Gm-Message-State: AOJu0YxP2pQ2mP1yGJUrGS8jyFqN36zk7D2DhiiWdx1jv1SxVy7ly2/4
	WkNyTRuUBzGqhG8AjLhq84v3rkmO1qRst9XDWBsssRBT+SR8Zg/ANeh0dg==
X-Google-Smtp-Source: AGHT+IFHfCXN1mLftbRoKdmWDn5LUdcy6tLnqayNqIP1d+ftyOFziSjY1GZQtzHGaVh+vUOMI+gbaA==
X-Received: by 2002:a17:906:6a0c:b0:a8d:59d7:f92b with SMTP id a640c23a62f3a-a92d5611329mr348572966b.30.1727196153275;
        Tue, 24 Sep 2024 09:42:33 -0700 (PDT)
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
Subject: [PATCH v2 2/2] xen: move per-cpu area management into common code
Date: Tue, 24 Sep 2024 18:42:28 +0200
Message-ID: <e573f9d46e7af0806381f6a41af00dc415bf87bb.1727185495.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727185495.git.oleksii.kurochko@gmail.com>
References: <cover.1727185495.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Centralize per-cpu area management to reduce code duplication and
enhance maintainability across architectures.

The per-cpu area management code, which is largely common among
architectures, is moved to a shared implementation in
xen/common/percpu.c. This change includes:
 * Remove percpu.c from the X86 and Arm architectures.
 * For x86, define INVALID_PERCPU_AREAS and PARK_OFFLINE_CPUS.
 * Drop the declaration of __per_cpu_offset[] from stubs.c in
   PPC and RISC-V to facilitate the build of the common per-cpu code.

No functional changes for x86.

For Arm add support of CPU_RESUME_FAILED, CPU_REMOVE and freeing of
percpu in the case when system_state != SYS_STATE_suspend.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - move definition of park_offline_cpus for Arm, PPC and RISC-V to
   <asm-generic/percpu.h>
 - add to arm/asm/smp.h inclusion of <xen/percpu.h>
   ( at least, it is needed as it uses DECLARE_PER_CPU and also
   to not break the build because of moved definition of 
   park_offline_cpus to asm-generic/percpu.h )
 - remove x86/percpu.c as all the code was moved to common percpu.c.
 - add define PARK_OFFLINE_CPUS to x86/asm/percpu.h as x86 defines it
   in own way.
 - drop ARCH_PERCPU_AREA_CHECK and ARCH_CPU_PERCPU_CALLBACK as the code
   inside this definitions were integrated to common code.
 - use park_offline_cpus ? 0 : -EBUSY;
   instead of arch_percpu_area_init_status() in init_percpu_area().
 - update cpu_percpu_callback() to handle CPU_UP_CANCELED, case CPU_DEAD,
   case CPU_RESUME_FAILED and also CPU parking and SYS_STATE_suspend.
 - move declaration of percpu_init_areas() to xen/percpu.h.
---
 xen/arch/arm/Makefile             |   1 -
 xen/arch/arm/include/asm/smp.h    |   7 +-
 xen/arch/arm/percpu.c             |  85 -----------------------
 xen/arch/ppc/include/asm/smp.h    |   6 --
 xen/arch/ppc/stubs.c              |   1 -
 xen/arch/riscv/include/asm/smp.h  |   6 --
 xen/arch/riscv/stubs.c            |   1 -
 xen/arch/x86/Makefile             |   1 -
 xen/arch/x86/include/asm/Makefile |   1 -
 xen/arch/x86/include/asm/percpu.h |  16 +++++
 xen/arch/x86/percpu.c             | 112 ------------------------------
 xen/common/Makefile               |   1 +
 xen/common/percpu.c               | 110 +++++++++++++++++++++++++++++
 xen/include/asm-generic/percpu.h  |   9 ++-
 xen/include/xen/percpu.h          |   4 ++
 15 files changed, 140 insertions(+), 221 deletions(-)
 delete mode 100644 xen/arch/arm/percpu.c
 create mode 100644 xen/arch/x86/include/asm/percpu.h
 delete mode 100644 xen/arch/x86/percpu.c
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
diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index e99a3a3f53..8f765ed12a 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -2,6 +2,7 @@
 #define __ASM_SMP_H
 
 #ifndef __ASSEMBLY__
+#include <xen/percpu.h>
 #include <xen/cpumask.h>
 #include <asm/current.h>
 #endif
@@ -12,12 +13,6 @@ extern unsigned long smp_up_cpu;
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
-/*
- * Do we, for platform reasons, need to actually keep CPUs online when we
- * would otherwise prefer them to be off?
- */
-#define park_offline_cpus false
-
 extern void noreturn stop_cpu(void);
 
 extern int arch_smp_init(void);
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
diff --git a/xen/arch/ppc/include/asm/smp.h b/xen/arch/ppc/include/asm/smp.h
index 7b1517ce18..2b872218be 100644
--- a/xen/arch/ppc/include/asm/smp.h
+++ b/xen/arch/ppc/include/asm/smp.h
@@ -7,10 +7,4 @@
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
-/*
- * Do we, for platform reasons, need to actually keep CPUs online when we
- * would otherwise prefer them to be off?
- */
-#define park_offline_cpus false
-
 #endif
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
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index b1ea91b1eb..c63c499d12 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -8,12 +8,6 @@
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
-/*
- * Do we, for platform reasons, need to actually keep CPUs online when we
- * would otherwise prefer them to be off?
- */
-#define park_offline_cpus false
-
 #endif
 
 /*
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
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 00ab091634..bf68f38c0e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -54,7 +54,6 @@ obj-y += mpparse.o
 obj-y += nmi.o
 obj-y += numa.o
 obj-y += pci.o
-obj-y += percpu.o
 obj-y += physdev.o
 obj-$(CONFIG_COMPAT) += x86_64/physdev.o
 obj-y += psr.o
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
index 0000000000..b892dc2f00
--- /dev/null
+++ b/xen/arch/x86/include/asm/percpu.h
@@ -0,0 +1,16 @@
+#ifndef __X86_PERCPU_H__
+#define __X86_PERCPU_H__
+
+#define PARK_OFFLINE_CPUS
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
+#endif /* __X86_PERCPU_H__ */
diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
deleted file mode 100644
index 3205eacea6..0000000000
--- a/xen/arch/x86/percpu.c
+++ /dev/null
@@ -1,112 +0,0 @@
-#include <xen/percpu.h>
-#include <xen/cpu.h>
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
-
-static int init_percpu_area(unsigned int cpu)
-{
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
-    return 0;
-}
-
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
-    case CPU_RESUME_FAILED:
-        if ( !park_offline_cpus && system_state != SYS_STATE_suspend )
-            free_percpu_area(cpu);
-        break;
-    case CPU_REMOVE:
-        if ( park_offline_cpus )
-            free_percpu_area(cpu);
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
-static int __init cf_check percpu_presmp_init(void)
-{
-    register_cpu_notifier(&cpu_percpu_nfb);
-
-    return 0;
-}
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
index 0000000000..58a774154d
--- /dev/null
+++ b/xen/common/percpu.c
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <xen/percpu.h>
+#include <xen/cpu.h>
+#include <xen/init.h>
+#include <xen/mm.h>
+#include <xen/rcupdate.h>
+
+#ifndef INVALID_PERCPU_AREA
+#define INVALID_PERCPU_AREA (-(long)__per_cpu_start)
+#endif
+
+#define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
+
+unsigned long __per_cpu_offset[NR_CPUS];
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
+        return park_offline_cpus ? 0 : -EBUSY;
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
+static void free_percpu_area(unsigned int cpu)
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
+    case CPU_UP_CANCELED:
+    case CPU_DEAD:
+    case CPU_RESUME_FAILED:
+        if ( !park_offline_cpus && system_state != SYS_STATE_suspend )
+            free_percpu_area(cpu);
+        break;
+    case CPU_REMOVE:
+        if ( park_offline_cpus )
+            free_percpu_area(cpu);
+        break;
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
index 60af4f9ff9..d36afda2dd 100644
--- a/xen/include/asm-generic/percpu.h
+++ b/xen/include/asm-generic/percpu.h
@@ -10,7 +10,14 @@
 extern char __per_cpu_start[];
 extern const char __per_cpu_data_end[];
 extern unsigned long __per_cpu_offset[NR_CPUS];
-void percpu_init_areas(void);
+
+#ifndef PARK_OFFLINE_CPUS
+/*
+ * Do we, for platform reasons, need to actually keep CPUs online when we
+ * would otherwise prefer them to be off?
+ */
+#define park_offline_cpus false
+#endif
 
 #define per_cpu(var, cpu)  \
     (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
diff --git a/xen/include/xen/percpu.h b/xen/include/xen/percpu.h
index 57522f346b..90c4e120ec 100644
--- a/xen/include/xen/percpu.h
+++ b/xen/include/xen/percpu.h
@@ -33,4 +33,8 @@
 #define get_cpu_var(var) this_cpu(var)
 #define put_cpu_var(var)
 
+#ifndef __ASSEMBLY__
+void percpu_init_areas(void);
+#endif
+
 #endif /* __XEN_PERCPU_H__ */
-- 
2.46.1


