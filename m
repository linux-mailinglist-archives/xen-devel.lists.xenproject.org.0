Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8609698F124
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 16:10:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809494.1221847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMVr-000277-Gp; Thu, 03 Oct 2024 14:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809494.1221847; Thu, 03 Oct 2024 14:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMVr-00024l-CQ; Thu, 03 Oct 2024 14:09:03 +0000
Received: by outflank-mailman (input) for mailman id 809494;
 Thu, 03 Oct 2024 14:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCg9=Q7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1swMVq-00024f-03
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 14:09:02 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 094182d0-8191-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 16:08:59 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2fabd2c4ac0so12725891fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 07:08:59 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faecc94f8csm2173631fa.104.2024.10.03.07.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:08:58 -0700 (PDT)
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
X-Inumbo-ID: 094182d0-8191-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727964539; x=1728569339; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mORlLs9dsJ+1bLAjQanFgdeKBkXBmkMOAlkMLwDApX4=;
        b=a0Zs1Wz9fP/Df0dw+HukXQY8CGITi8KTZKHLQA2opWSV8X5KMYk0RzNBdnJ9nEyw2/
         L2B8FNuBubobmSBibAaAFa1PQRgltdZZg1tAf3IauP5m3hEekDhlWKIwQiMEQSAD7i1p
         +AgfMQanBJ9YcoqUnv6hoUrfc6voOM2AucwlpJqTV88Ls1cHNn7vNZ8VNhLsoP8WgN61
         /vXX7VT6UYa4zHcT6+s18eFS4dr1YvefoI96+rsvtU31QyA/fI/0Y87x46/Cpb6YrLtA
         llYOZhOVyff3KfyBsQi/w/2HMEPJXNGGEmFdOq+NVynCR9nEowkZE3mEnFMfcO7fqPso
         BnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727964539; x=1728569339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mORlLs9dsJ+1bLAjQanFgdeKBkXBmkMOAlkMLwDApX4=;
        b=vZQvJDdlAvK4NWtyFMya50XSIZ8wgAr6t2y0g+x0tB1+a7Q+XjtNRQPqG0tQP+7zx7
         lSY33fGrXD5Ba/5ehQCUgn39hxRPhMMK8NdLm9WouwpfkcUvkC4r02mQm+8pP0o2R3Eb
         6fIeTbZ+Nb+9inAlq7Pa+mK1wzgTcjerrkk+JIzsNCpav0eGf+smEhhFPVY1UCP8H8eg
         NhhyDpK9GfW5YzEJTfTuvaykQMRdKvn+TMm4JeQz3yfuT8WB2s/hWdBZdx9F8bOBcHS3
         o3GSKSg0MOCOWqX19+QRi+5NgSEn6YN3cGE94M6890EAlaIhN2R6ohFXbtSE6t+Q/cFA
         niYg==
X-Gm-Message-State: AOJu0YyyioZiMELJ/F38b2sjmCXTXER0QKTcirUR9c1dTXMrEpKfYlfB
	HNWkMEHNQlquUVv7be9O40wDO24bxkjvE5gOBJBQHl0o7JvRUB38QDm4Sw==
X-Google-Smtp-Source: AGHT+IGXq6zM5V5mFzzw9bK3j67DrlFuTY4b9s21t2CFiyuFo4yuK17YgfX6+kWUz0iS6nJhzMGzoQ==
X-Received: by 2002:a05:651c:a0b:b0:2fa:d5b2:e527 with SMTP id 38308e7fff4ca-2fae10a90d1mr46881281fa.35.1727964538533;
        Thu, 03 Oct 2024 07:08:58 -0700 (PDT)
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
Subject: [PATCH v5] xen: move per-cpu area management into common code
Date: Thu,  3 Oct 2024 16:08:55 +0200
Message-ID: <8634958b6a3cd45ba977acba1d8445c1739b6415.1727963609.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Centralize per-cpu area management to reduce code duplication and
enhance maintainability across architectures.

The per-cpu area management code, which is largely common among
architectures, is moved to a shared implementation in
xen/common/percpu.c. This change includes:
 * Remove percpu.c from the X86 and Arm architectures.
 * For x86, define INVALID_PERCPU_AREAS and PARK_OFFLINE_CPUS_VAR.
 * Drop the declaration of __per_cpu_offset[] from stubs.c in
   PPC and RISC-V to facilitate the build of the common per-cpu code.

No functional changes for x86.

For Arm add support of CPU_RESUME_FAILED, CPU_REMOVE and freeing of
percpu in the case when system_state != SYS_STATE_suspend, however,
there is no change in behavior for Arm at this time.

Move the asm-generic/percpu.h definitions to xen/percpu.h, except for
__per_cpu_start[] and __per_cpu_data_end[], which are moved to
common/percpu.c as they are only used in common/percpu.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in V5:
 - Add default case for switch() to deal with
   MISRA C 16.4 in cpu_percpu_callback().
 - Update the commit message.
 - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>.
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
---
Changes in V4:
 - s/GPL-2.0/GPL-2.0-only.
 - add __read_mostly to __percpu_cpu_offset variable definition.
 - s/PARK_OFFLINE_CPUS/PARK_OFFLINE_CPUS_VAR.
 - update the commit message ( s/PARK_OFFLINE_CPUS/PARK_OFFLINE_CPUS_VAR ).
---
Changes in V3:
 - move __per_cpu_start[] and __per_cpu_data_end[] to xen/percpu.c.
 - move declaration of __per_cpu_offset[] to xen/percpu.h.
 - move park_offline_cpus, per_cpu{_ptr}, this_cpu{_ptr} to xen/percpu.h.
 - drop inclusion of <asm-generic/percpu.h> in x86/asm/percpu.h.
 - add inclusion of <xen/types.h> ( as in asm/curren.h is used types from
   asm/current.h ) and <asm/current.h> ( get_per_cpu_offset() )
   to xen/percpu.h to deal with compilation errors.
 - xen/types.h and asm/current.h to avoid compilation errors in case when
   xen/percpu.h is included explicitly or implicitly in assembler code.
 - update the commit message.
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
 xen/arch/arm/percpu.c             |  85 ----------------------
 xen/arch/ppc/include/asm/smp.h    |   6 --
 xen/arch/ppc/stubs.c              |   1 -
 xen/arch/riscv/include/asm/smp.h  |   6 --
 xen/arch/riscv/stubs.c            |   1 -
 xen/arch/x86/Makefile             |   1 -
 xen/arch/x86/include/asm/Makefile |   1 -
 xen/arch/x86/include/asm/percpu.h |  14 ++++
 xen/arch/x86/percpu.c             | 112 -----------------------------
 xen/common/Makefile               |   1 +
 xen/common/percpu.c               | 116 ++++++++++++++++++++++++++++++
 xen/include/asm-generic/percpu.h  |  23 ------
 xen/include/xen/percpu.h          |  30 ++++++++
 15 files changed, 162 insertions(+), 243 deletions(-)
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
index a824be8e78..092b101ff4 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -10,12 +10,6 @@
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
-/*
- * Do we, for platform reasons, need to actually keep CPUs online when we
- * would otherwise prefer them to be off?
- */
-#define park_offline_cpus false
-
 /*
  * Mapping between Xen logical cpu index and hartid.
  */
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
index 1fa12ed4aa..b35fd5196c 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -54,7 +54,6 @@ obj-y += mpparse.o
 obj-y += nmi.o
 obj-y += numa.o
 obj-y += pci.o
-obj-y += percpu.o
 obj-y += physdev.o
 obj-$(CONFIG_COMPAT) += x86_64/physdev.o
 obj-$(CONFIG_X86_PSR) += psr.o
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
index 0000000000..34f589f990
--- /dev/null
+++ b/xen/arch/x86/include/asm/percpu.h
@@ -0,0 +1,14 @@
+#ifndef __X86_PERCPU_H__
+#define __X86_PERCPU_H__
+
+#define PARK_OFFLINE_CPUS_VAR
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
index 0000000000..fca73a3e08
--- /dev/null
+++ b/xen/common/percpu.c
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/percpu.h>
+#include <xen/cpu.h>
+#include <xen/init.h>
+#include <xen/mm.h>
+#include <xen/rcupdate.h>
+#include <xen/sections.h>
+
+#ifndef INVALID_PERCPU_AREA
+#define INVALID_PERCPU_AREA (-(long)__per_cpu_start)
+#endif
+
+#define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
+
+extern char __per_cpu_start[];
+extern const char __per_cpu_data_end[];
+
+unsigned long __read_mostly __per_cpu_offset[NR_CPUS];
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
+    default:
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
index 60af4f9ff9..3fdb3a2a02 100644
--- a/xen/include/asm-generic/percpu.h
+++ b/xen/include/asm-generic/percpu.h
@@ -2,29 +2,6 @@
 #ifndef __ASM_GENERIC_PERCPU_H__
 #define __ASM_GENERIC_PERCPU_H__
 
-#ifndef __ASSEMBLY__
-
-#include <xen/types.h>
-#include <asm/current.h>
-
-extern char __per_cpu_start[];
-extern const char __per_cpu_data_end[];
-extern unsigned long __per_cpu_offset[NR_CPUS];
-void percpu_init_areas(void);
-
-#define per_cpu(var, cpu)  \
-    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
-
-#define this_cpu(var) \
-    (*RELOC_HIDE(&per_cpu__##var, get_per_cpu_offset()))
-
-#define per_cpu_ptr(var, cpu)  \
-    (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
-#define this_cpu_ptr(var) \
-    (*RELOC_HIDE(var, get_per_cpu_offset()))
-
-#endif
-
 #endif /* __ASM_GENERIC_PERCPU_H__ */
 
 /*
diff --git a/xen/include/xen/percpu.h b/xen/include/xen/percpu.h
index 57522f346b..e7f585c7ed 100644
--- a/xen/include/xen/percpu.h
+++ b/xen/include/xen/percpu.h
@@ -29,6 +29,36 @@
 
 #include <asm/percpu.h>
 
+#ifndef __ASSEMBLY__
+
+#include <xen/types.h>
+#include <asm/current.h>
+
+#ifndef PARK_OFFLINE_CPUS_VAR
+/*
+ * Do we, for platform reasons, need to actually keep CPUs online when we
+ * would otherwise prefer them to be off?
+ */
+#define park_offline_cpus false
+#endif
+
+extern unsigned long __per_cpu_offset[];
+
+#define per_cpu(var, cpu)  \
+    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
+
+#define this_cpu(var) \
+    (*RELOC_HIDE(&per_cpu__##var, get_per_cpu_offset()))
+
+#define per_cpu_ptr(var, cpu)  \
+    (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
+#define this_cpu_ptr(var) \
+    (*RELOC_HIDE(var, get_per_cpu_offset()))
+
+void percpu_init_areas(void);
+
+#endif /* __ASSEMBLY__ */
+
 /* Linux compatibility. */
 #define get_cpu_var(var) this_cpu(var)
 #define put_cpu_var(var)
-- 
2.46.2


