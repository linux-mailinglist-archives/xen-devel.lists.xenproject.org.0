Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22092786136
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 22:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589519.921528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYu8m-0006kF-Qu; Wed, 23 Aug 2023 20:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589519.921528; Wed, 23 Aug 2023 20:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYu8m-0006h3-Kk; Wed, 23 Aug 2023 20:07:44 +0000
Received: by outflank-mailman (input) for mailman id 589519;
 Wed, 23 Aug 2023 20:07:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Dg=EI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYu8k-0004Vt-0Q
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 20:07:42 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b513dbc4-41f0-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 22:07:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D1E6682854AE;
 Wed, 23 Aug 2023 15:07:37 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id dcTAXJDuBkyU; Wed, 23 Aug 2023 15:07:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3873982868FA;
 Wed, 23 Aug 2023 15:07:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nF0yzY36hzvc; Wed, 23 Aug 2023 15:07:33 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 7266E82854AE;
 Wed, 23 Aug 2023 15:07:32 -0500 (CDT)
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
X-Inumbo-ID: b513dbc4-41f0-11ee-9b0c-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3873982868FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692821253; bh=HJHTXHhHNpB7M0TwUJHdqIgAN7uZQPOfPJNQwoCc0tY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=EiTUgW7OghMkZKZ7YBos1AkX/sksCRFyKGxBshQUpiV7TrkQJzOZCXliAfBBB61vM
	 lkP5Ib7A6NIlEI+dyV2ucdcLWRDZRzW+1j93UzIYPn0rfaVEER4vNd+RtVMojji8uN
	 2iNtV3P8rpp/BFozx7LkU4uMm5CkQawS/uG6VmsQ=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 5/8] xen/ppc: Define minimal stub headers required for full build
Date: Wed, 23 Aug 2023 15:07:16 -0500
Message-Id: <a92f99e8f697da99d77bfde562a549dbef3760ce.1692816595.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1692816595.git.sanastasio@raptorengineering.com>
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Additionally, change inclusion of asm/ headers to corresponding xen/ ones
throughout arch/ppc now that they work.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v2:
  - Use BUG_ON("unimplemented") instead of BUG() for unimplemented functi=
ons
    to make searching easier.
  - (altp2m.h) Drop Intel license in favor of an SPDX header
  - (altp2m.h) Drop <xen/sched.h> include in favor of <xen/bug.h> and
    forward declarations of struct domain and struct vcpu.
  - (bug.h) Add TODO comments above BUG and BUG_FRAME implementations
  - (desc.h) Drop desc.h
  - (mm.h) Drop <asm/config.h> include
  - (mm.h) Drop PGC_static definition
  - (mm.h) Drop max_page definition
  - (mm.h/mm-radix.c) Drop total_pages definition
  - (monitor.h) Drop <xen/sched.h> and <public/domctl.h> includes in favo=
r
    of just <xen/errno.h>
  - (page.h) Drop PAGE_ALIGN definition
  - (percpu.h) Drop <xen/types.h> include
  - (procarea.h) Drop license text in favor of SPDX header
  - (procarea.h) Drop unnecessary forward declarations and <xen/types.h>
    include
  - (processor.h) Fix macro parameter naming (drop leading underscore)
  - (processor.h) Add explanation comment to cpu_relax()
  - (regs.h) Drop stray hunk adding <xen/types.h> include
  - (system.h) Drop license text in favor of SPDX header
  - (system.h) Drop <xen/config.h> include
  - (opal.c) Drop stray hunk changing opal.c includes

 xen/arch/ppc/Kconfig                     |   1 +
 xen/arch/ppc/include/asm/altp2m.h        |  25 +++
 xen/arch/ppc/include/asm/bug.h           |   9 +
 xen/arch/ppc/include/asm/cache.h         |   2 +
 xen/arch/ppc/include/asm/config.h        |   9 +
 xen/arch/ppc/include/asm/cpufeature.h    |   9 +
 xen/arch/ppc/include/asm/current.h       |  42 ++++
 xen/arch/ppc/include/asm/delay.h         |  11 +
 xen/arch/ppc/include/asm/device.h        |  53 +++++
 xen/arch/ppc/include/asm/div64.h         |  14 ++
 xen/arch/ppc/include/asm/domain.h        |  46 +++++
 xen/arch/ppc/include/asm/event.h         |  35 ++++
 xen/arch/ppc/include/asm/flushtlb.h      |  23 +++
 xen/arch/ppc/include/asm/grant_table.h   |   0
 xen/arch/ppc/include/asm/guest_access.h  |  54 +++++
 xen/arch/ppc/include/asm/guest_atomics.h |  14 ++
 xen/arch/ppc/include/asm/hardirq.h       |  18 ++
 xen/arch/ppc/include/asm/hypercall.h     |   0
 xen/arch/ppc/include/asm/io.h            |  15 ++
 xen/arch/ppc/include/asm/iocap.h         |   7 +
 xen/arch/ppc/include/asm/iommu.h         |   7 +
 xen/arch/ppc/include/asm/irq.h           |  32 +++
 xen/arch/ppc/include/asm/mem_access.h    |   0
 xen/arch/ppc/include/asm/mm.h            | 249 ++++++++++++++++++++++-
 xen/arch/ppc/include/asm/monitor.h       |  46 +++++
 xen/arch/ppc/include/asm/nospec.h        |  18 ++
 xen/arch/ppc/include/asm/numa.h          |  26 +++
 xen/arch/ppc/include/asm/p2m.h           | 105 ++++++++++
 xen/arch/ppc/include/asm/page.h          |  19 ++
 xen/arch/ppc/include/asm/paging.h        |   7 +
 xen/arch/ppc/include/asm/pci.h           |   7 +
 xen/arch/ppc/include/asm/percpu.h        |  24 +++
 xen/arch/ppc/include/asm/procarea.h      |  20 ++
 xen/arch/ppc/include/asm/processor.h     |  10 +
 xen/arch/ppc/include/asm/random.h        |   9 +
 xen/arch/ppc/include/asm/setup.h         |   6 +
 xen/arch/ppc/include/asm/smp.h           |  18 ++
 xen/arch/ppc/include/asm/softirq.h       |   8 +
 xen/arch/ppc/include/asm/spinlock.h      |  15 ++
 xen/arch/ppc/include/asm/system.h        | 229 ++++++++++++++++++++-
 xen/arch/ppc/include/asm/time.h          |  20 ++
 xen/arch/ppc/include/asm/vm_event.h      |  49 +++++
 xen/arch/ppc/include/asm/xenoprof.h      |   0
 xen/arch/ppc/mm-radix.c                  |   2 +-
 xen/arch/ppc/tlb-radix.c                 |   2 +-
 xen/include/public/hvm/save.h            |   2 +
 xen/include/public/pmu.h                 |   2 +
 xen/include/public/xen.h                 |   2 +
 48 files changed, 1317 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/altp2m.h
 create mode 100644 xen/arch/ppc/include/asm/cpufeature.h
 create mode 100644 xen/arch/ppc/include/asm/current.h
 create mode 100644 xen/arch/ppc/include/asm/delay.h
 create mode 100644 xen/arch/ppc/include/asm/device.h
 create mode 100644 xen/arch/ppc/include/asm/div64.h
 create mode 100644 xen/arch/ppc/include/asm/domain.h
 create mode 100644 xen/arch/ppc/include/asm/event.h
 create mode 100644 xen/arch/ppc/include/asm/flushtlb.h
 create mode 100644 xen/arch/ppc/include/asm/grant_table.h
 create mode 100644 xen/arch/ppc/include/asm/guest_access.h
 create mode 100644 xen/arch/ppc/include/asm/guest_atomics.h
 create mode 100644 xen/arch/ppc/include/asm/hardirq.h
 create mode 100644 xen/arch/ppc/include/asm/hypercall.h
 create mode 100644 xen/arch/ppc/include/asm/io.h
 create mode 100644 xen/arch/ppc/include/asm/iocap.h
 create mode 100644 xen/arch/ppc/include/asm/iommu.h
 create mode 100644 xen/arch/ppc/include/asm/irq.h
 create mode 100644 xen/arch/ppc/include/asm/mem_access.h
 create mode 100644 xen/arch/ppc/include/asm/monitor.h
 create mode 100644 xen/arch/ppc/include/asm/nospec.h
 create mode 100644 xen/arch/ppc/include/asm/numa.h
 create mode 100644 xen/arch/ppc/include/asm/p2m.h
 create mode 100644 xen/arch/ppc/include/asm/paging.h
 create mode 100644 xen/arch/ppc/include/asm/pci.h
 create mode 100644 xen/arch/ppc/include/asm/percpu.h
 create mode 100644 xen/arch/ppc/include/asm/procarea.h
 create mode 100644 xen/arch/ppc/include/asm/random.h
 create mode 100644 xen/arch/ppc/include/asm/setup.h
 create mode 100644 xen/arch/ppc/include/asm/smp.h
 create mode 100644 xen/arch/ppc/include/asm/softirq.h
 create mode 100644 xen/arch/ppc/include/asm/spinlock.h
 create mode 100644 xen/arch/ppc/include/asm/time.h
 create mode 100644 xen/arch/ppc/include/asm/vm_event.h
 create mode 100644 xen/arch/ppc/include/asm/xenoprof.h

diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
index ab116ffb2a..a6eae597af 100644
--- a/xen/arch/ppc/Kconfig
+++ b/xen/arch/ppc/Kconfig
@@ -1,6 +1,7 @@
 config PPC
 	def_bool y
 	select HAS_DEVICE_TREE
+	select HAS_PDX

 config PPC64
 	def_bool y
diff --git a/xen/arch/ppc/include/asm/altp2m.h b/xen/arch/ppc/include/asm=
/altp2m.h
new file mode 100644
index 0000000000..6faef7661e
--- /dev/null
+++ b/xen/arch/ppc/include/asm/altp2m.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_PPC_ALTP2M_H__
+#define __ASM_PPC_ALTP2M_H__
+
+#include <xen/bug.h>
+
+struct domain;
+struct vcpu;
+
+/* Alternate p2m on/off per domain */
+static inline bool altp2m_active(const struct domain *d)
+{
+    /* Not implemented on PPC. */
+    return false;
+}
+
+/* Alternate p2m VCPU */
+static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    /* Not implemented on PPC, should not be reached. */
+    BUG_ON("unimplemented");
+    return 0;
+}
+
+#endif /* __ASM_PPC_ALTP2M_H__ */
diff --git a/xen/arch/ppc/include/asm/bug.h b/xen/arch/ppc/include/asm/bu=
g.h
index e5e874b31c..35d4568402 100644
--- a/xen/arch/ppc/include/asm/bug.h
+++ b/xen/arch/ppc/include/asm/bug.h
@@ -4,6 +4,7 @@
 #define _ASM_PPC_BUG_H

 #include <xen/stringify.h>
+#include <asm/processor.h>

 /*
  * Power ISA guarantees that an instruction consisting of all zeroes is
@@ -15,4 +16,12 @@

 #define BUG_FN_REG r0

+/* TODO: implement this properly */
+#define BUG() do { \
+    die(); \
+} while (0)
+
+/* TODO: implement this properly */
+#define BUG_FRAME(type, line, ptr, second_frame, msg) do { } while (0)
+
 #endif /* _ASM_PPC_BUG_H */
diff --git a/xen/arch/ppc/include/asm/cache.h b/xen/arch/ppc/include/asm/=
cache.h
index 8a0a6b7b17..0d7323d789 100644
--- a/xen/arch/ppc/include/asm/cache.h
+++ b/xen/arch/ppc/include/asm/cache.h
@@ -3,4 +3,6 @@
 #ifndef _ASM_PPC_CACHE_H
 #define _ASM_PPC_CACHE_H

+#define __read_mostly __section(".data.read_mostly")
+
 #endif /* _ASM_PPC_CACHE_H */
diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm=
/config.h
index 30438d22d2..91ba0764cb 100644
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -41,6 +41,15 @@

 #define XEN_VIRT_START _AC(0xc000000000000000, UL)

+#define VMAP_VIRT_START (XEN_VIRT_START + GB(1))
+#define VMAP_VIRT_SIZE  GB(1)
+
+#define FRAMETABLE_VIRT_START  (XEN_VIRT_START + GB(32))
+#define FRAMETABLE_SIZE        GB(32)
+#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
+
+#define HYPERVISOR_VIRT_START  XEN_VIRT_START
+
 #define SMP_CACHE_BYTES (1 << 6)

 #define STACK_ORDER 0
diff --git a/xen/arch/ppc/include/asm/cpufeature.h b/xen/arch/ppc/include=
/asm/cpufeature.h
new file mode 100644
index 0000000000..3552b9231d
--- /dev/null
+++ b/xen/arch/ppc/include/asm/cpufeature.h
@@ -0,0 +1,9 @@
+#ifndef __ASM_PPC_CPUFEATURE_H__
+#define __ASM_PPC_CPUFEATURE_H__
+
+static inline int cpu_nr_siblings(unsigned int cpu)
+{
+    return 1;
+}
+
+#endif /* __ASM_PPC_CPUFEATURE_H__ */
diff --git a/xen/arch/ppc/include/asm/current.h b/xen/arch/ppc/include/as=
m/current.h
new file mode 100644
index 0000000000..87a854d6b0
--- /dev/null
+++ b/xen/arch/ppc/include/asm/current.h
@@ -0,0 +1,42 @@
+#ifndef __ASM_PPC_CURRENT_H__
+#define __ASM_PPC_CURRENT_H__
+
+#include <xen/percpu.h>
+
+#ifndef __ASSEMBLY__
+
+struct vcpu;
+
+/* Which VCPU is "current" on this PCPU. */
+DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
+
+#define current            (this_cpu(curr_vcpu))
+#define set_current(vcpu)  do { current =3D (vcpu); } while (0)
+#define get_cpu_current(cpu)  (per_cpu(curr_vcpu, cpu))
+
+/* Per-VCPU state that lives at the top of the stack */
+struct cpu_info {
+    struct cpu_user_regs guest_cpu_user_regs;
+    unsigned long elr;
+    uint32_t flags;
+};
+
+static inline struct cpu_info *get_cpu_info(void)
+{
+#ifdef __clang__
+    unsigned long sp;
+
+    asm ("mr %0, 1" : "=3Dr" (sp));
+#else
+    register unsigned long sp asm ("r1");
+#endif
+
+    return (struct cpu_info *)((sp & ~(STACK_SIZE - 1)) +
+                               STACK_SIZE - sizeof(struct cpu_info));
+}
+
+#define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ASM_PPC_CURRENT_H__ */
diff --git a/xen/arch/ppc/include/asm/delay.h b/xen/arch/ppc/include/asm/=
delay.h
new file mode 100644
index 0000000000..36be1775f8
--- /dev/null
+++ b/xen/arch/ppc/include/asm/delay.h
@@ -0,0 +1,11 @@
+#ifndef __ASM_PPC_DELAY_H__
+#define __ASM_PPC_DELAY_H__
+
+#include <xen/lib.h>
+
+static inline void udelay(unsigned long usecs)
+{
+    BUG_ON("unimplemented");
+}
+
+#endif /* __ASM_PPC_DELAY_H__ */
diff --git a/xen/arch/ppc/include/asm/device.h b/xen/arch/ppc/include/asm=
/device.h
new file mode 100644
index 0000000000..cb8454f605
--- /dev/null
+++ b/xen/arch/ppc/include/asm/device.h
@@ -0,0 +1,53 @@
+#ifndef __ASM_PPC_DEVICE_H__
+#define __ASM_PPC_DEVICE_H__
+
+enum device_type
+{
+    DEV_DT,
+    DEV_PCI,
+};
+
+struct device {
+    enum device_type type;
+#ifdef CONFIG_HAS_DEVICE_TREE
+    struct dt_device_node *of_node; /* Used by drivers imported from Lin=
ux */
+#endif
+};
+
+enum device_class
+{
+    DEVICE_SERIAL,
+    DEVICE_IOMMU,
+    DEVICE_GIC,
+    DEVICE_PCI_HOSTBRIDGE,
+    /* Use for error */
+    DEVICE_UNKNOWN,
+};
+
+struct device_desc {
+    /* Device name */
+    const char *name;
+    /* Device class */
+    enum device_class class;
+    /* List of devices supported by this driver */
+    const struct dt_device_match *dt_match;
+    /*
+     * Device initialization.
+     *
+     * -EAGAIN is used to indicate that device probing is deferred.
+     */
+    int (*init)(struct dt_device_node *dev, const void *data);
+};
+
+typedef struct device device_t;
+
+#define DT_DEVICE_START(_name, _namestr, _class)                    \
+static const struct device_desc __dev_desc_##_name __used           \
+__section(".dev.info") =3D {                                          \
+    .name =3D _namestr,                                               \
+    .class =3D _class,                                                \
+
+#define DT_DEVICE_END                                               \
+};
+
+#endif /* __ASM_PPC_DEVICE_H__ */
diff --git a/xen/arch/ppc/include/asm/div64.h b/xen/arch/ppc/include/asm/=
div64.h
new file mode 100644
index 0000000000..6959c3fb26
--- /dev/null
+++ b/xen/arch/ppc/include/asm/div64.h
@@ -0,0 +1,14 @@
+#ifndef __ASM_PPC_DIV64_H__
+#define __ASM_PPC_DIV64_H__
+
+#include <xen/types.h>
+
+#define do_div(n,base) ({                       \
+    uint32_t __base =3D (base);                   \
+    uint32_t __rem;                             \
+    __rem =3D ((uint64_t)(n)) % __base;           \
+    (n) =3D ((uint64_t)(n)) / __base;             \
+    __rem;                                      \
+})
+
+#endif /* __ASM_PPC_DIV64_H__ */
diff --git a/xen/arch/ppc/include/asm/domain.h b/xen/arch/ppc/include/asm=
/domain.h
new file mode 100644
index 0000000000..4ade3d484e
--- /dev/null
+++ b/xen/arch/ppc/include/asm/domain.h
@@ -0,0 +1,46 @@
+#ifndef __ASM_PPC_DOMAIN_H__
+#define __ASM_PPC_DOMAIN_H__
+
+#include <xen/xmalloc.h>
+#include <public/hvm/params.h>
+
+struct hvm_domain
+{
+    uint64_t              params[HVM_NR_PARAMS];
+};
+
+#define is_domain_direct_mapped(d) ((void)(d), 0)
+
+/* TODO: Implement */
+#define guest_mode(r) ({ (void) (r); BUG_ON("unimplemented"); 0; })
+
+struct arch_vcpu_io {
+};
+
+struct arch_vcpu {
+};
+
+struct arch_domain {
+    struct hvm_domain hvm;
+};
+
+#include <xen/sched.h>
+
+static inline struct vcpu_guest_context *alloc_vcpu_guest_context(void)
+{
+    return xmalloc(struct vcpu_guest_context);
+}
+
+static inline void free_vcpu_guest_context(struct vcpu_guest_context *vg=
c)
+{
+    xfree(vgc);
+}
+
+struct guest_memory_policy {};
+static inline void update_guest_memory_policy(struct vcpu *v,
+                                              struct guest_memory_policy=
 *gmp)
+{}
+
+static inline void arch_vcpu_block(struct vcpu *v) {}
+
+#endif /* __ASM_PPC_DOMAIN_H__ */
diff --git a/xen/arch/ppc/include/asm/event.h b/xen/arch/ppc/include/asm/=
event.h
new file mode 100644
index 0000000000..3141127f31
--- /dev/null
+++ b/xen/arch/ppc/include/asm/event.h
@@ -0,0 +1,35 @@
+#ifndef __ASM_PPC_EVENT_H__
+#define __ASM_PPC_EVENT_H__
+
+#include <xen/lib.h>
+
+/* TODO: implement */
+static inline void vcpu_kick(struct vcpu *v) { BUG_ON("unimplemented"); =
}
+static inline void vcpu_mark_events_pending(struct vcpu *v) { BUG_ON("un=
implemented"); }
+static inline void vcpu_update_evtchn_irq(struct vcpu *v) { BUG_ON("unim=
plemented"); }
+static inline void vcpu_block_unless_event_pending(struct vcpu *v) { BUG=
_ON("unimplemented"); }
+
+static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+    return 0;
+}
+
+/* No arch specific virq definition now. Default to global. */
+static inline bool arch_virq_is_global(unsigned int virq)
+{
+    return true;
+}
+
+static inline int local_events_need_delivery(void)
+{
+    BUG_ON("unimplemented");
+    return 0;
+}
+
+static inline void local_event_delivery_enable(void)
+{
+    BUG_ON("unimplemented");
+}
+
+#endif /* __ASM_PPC_EVENT_H__ */
diff --git a/xen/arch/ppc/include/asm/flushtlb.h b/xen/arch/ppc/include/a=
sm/flushtlb.h
new file mode 100644
index 0000000000..1af3bd2301
--- /dev/null
+++ b/xen/arch/ppc/include/asm/flushtlb.h
@@ -0,0 +1,23 @@
+#ifndef __ASM_PPC_FLUSHTLB_H__
+#define __ASM_PPC_FLUSHTLB_H__
+
+#include <xen/cpumask.h>
+
+/*
+ * Filter the given set of CPUs, removing those that definitely flushed =
their
+ * TLB since @page_timestamp.
+ */
+/* XXX lazy implementation just doesn't clear anything.... */
+static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timest=
amp) {}
+
+#define tlbflush_current_time()                 (0)
+
+static inline void page_set_tlbflush_timestamp(struct page_info *page)
+{
+    page->tlbflush_timestamp =3D tlbflush_current_time();
+}
+
+/* Flush specified CPUs' TLBs */
+void arch_flush_tlb_mask(const cpumask_t *mask);
+
+#endif /* __ASM_PPC_FLUSHTLB_H__ */
diff --git a/xen/arch/ppc/include/asm/grant_table.h b/xen/arch/ppc/includ=
e/asm/grant_table.h
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/ppc/include/asm/guest_access.h b/xen/arch/ppc/inclu=
de/asm/guest_access.h
new file mode 100644
index 0000000000..1919e0566f
--- /dev/null
+++ b/xen/arch/ppc/include/asm/guest_access.h
@@ -0,0 +1,54 @@
+#ifndef __ASM_PPC_GUEST_ACCESS_H__
+#define __ASM_PPC_GUEST_ACCESS_H__
+
+#include <xen/mm.h>
+
+/* TODO */
+
+static inline unsigned long raw_copy_to_guest(void *to, const void *from=
, unsigned int len)
+{
+    BUG_ON("unimplemented");
+}
+static inline unsigned long raw_copy_to_guest_flush_dcache(void *to, con=
st void *from,
+                                             unsigned int len)
+{
+    BUG_ON("unimplemented");
+}
+static inline unsigned long raw_copy_from_guest(void *to, const void *fr=
om, unsigned int len)
+{
+    BUG_ON("unimplemented");
+}
+static inline unsigned long raw_clear_guest(void *to, unsigned int len)
+{
+    BUG_ON("unimplemented");
+}
+
+/* Copy data to guest physical address, then clean the region. */
+static inline unsigned long copy_to_guest_phys_flush_dcache(struct domai=
n *d,
+                                              paddr_t gpa,
+                                              void *buf,
+                                              unsigned int len)
+{
+    BUG_ON("unimplemented");
+}
+
+static inline int access_guest_memory_by_gpa(struct domain *d, paddr_t g=
pa, void *buf,
+                               uint32_t size, bool is_write)
+{
+    BUG_ON("unimplemented");
+}
+
+
+#define __raw_copy_to_guest raw_copy_to_guest
+#define __raw_copy_from_guest raw_copy_from_guest
+#define __raw_clear_guest raw_clear_guest
+
+/*
+ * Pre-validate a guest handle.
+ * Allows use of faster __copy_* functions.
+ */
+/* All PPC guests are paging mode external and hence safe */
+#define guest_handle_okay(hnd, nr) (1)
+#define guest_handle_subrange_okay(hnd, first, last) (1)
+
+#endif /* __ASM_PPC_GUEST_ACCESS_H__ */
diff --git a/xen/arch/ppc/include/asm/guest_atomics.h b/xen/arch/ppc/incl=
ude/asm/guest_atomics.h
new file mode 100644
index 0000000000..bf4f802a15
--- /dev/null
+++ b/xen/arch/ppc/include/asm/guest_atomics.h
@@ -0,0 +1,14 @@
+#ifndef __ASM_PPC_GUEST_ATOMICS_H__
+#define __ASM_PPC_GUEST_ATOMICS_H__
+
+#include <xen/lib.h>
+
+/* TODO: implement */
+#define guest_test_bit(d, nr, p)            ({ (void) (d); (void) (nr); =
(void) (p); BUG_ON("unimplemented"); false; })
+#define guest_clear_bit(d, nr, p)           ({ (void) (d); (void) (nr); =
(void) (p); BUG_ON("unimplemented"); false; })
+#define guest_set_bit(d, nr, p)             ({ (void) (d); (void) (nr); =
(void) (p); BUG_ON("unimplemented"); false; })
+#define guest_test_and_set_bit(d, nr, p)    ({ (void) (d); (void) (nr); =
(void) (p); BUG_ON("unimplemented"); false; })
+#define guest_test_and_clear_bit(d, nr, p)  ({ (void) (d); (void) (nr); =
(void) (p); BUG_ON("unimplemented"); false; })
+#define guest_test_and_change_bit(d, nr, p) ({ (void) (d); (void) (nr); =
(void) (p); BUG_ON("unimplemented"); false; })
+
+#endif /* __ASM_PPC_GUEST_ATOMICS_H__ */
diff --git a/xen/arch/ppc/include/asm/hardirq.h b/xen/arch/ppc/include/as=
m/hardirq.h
new file mode 100644
index 0000000000..51ef290961
--- /dev/null
+++ b/xen/arch/ppc/include/asm/hardirq.h
@@ -0,0 +1,18 @@
+#ifndef __ASM_PPC_HARDIRQ_H__
+#define __ASM_PPC_HARDIRQ_H__
+
+#include <xen/cache.h>
+
+typedef struct {
+        unsigned long __softirq_pending;
+        unsigned int __local_irq_count;
+} __cacheline_aligned irq_cpustat_t;
+
+#include <xen/irq_cpustat.h>    /* Standard mappings for irq_cpustat_t a=
bove */
+
+#define in_irq() (local_irq_count(smp_processor_id()) !=3D 0)
+
+#define irq_enter()     (local_irq_count(smp_processor_id())++)
+#define irq_exit()      (local_irq_count(smp_processor_id())--)
+
+#endif /* __ASM_PPC_HARDIRQ_H__ */
diff --git a/xen/arch/ppc/include/asm/hypercall.h b/xen/arch/ppc/include/=
asm/hypercall.h
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/ppc/include/asm/io.h b/xen/arch/ppc/include/asm/io.=
h
new file mode 100644
index 0000000000..f8f3bd6ff7
--- /dev/null
+++ b/xen/arch/ppc/include/asm/io.h
@@ -0,0 +1,15 @@
+#ifndef __ASM_PPC_IO_H__
+#define __ASM_PPC_IO_H__
+
+#include <xen/lib.h>
+
+/* TODO */
+#define readb(c)                ({ (void)(c); BUG_ON("unimplemented"); 0=
; })
+#define readw(c)                ({ (void)(c); BUG_ON("unimplemented"); 0=
; })
+#define readl(c)                ({ (void)(c); BUG_ON("unimplemented"); 0=
; })
+
+#define writeb(v,c)             ({ (void)(v); (void)(c); BUG_ON("unimple=
mented"); })
+#define writew(v,c)             ({ (void)(v); (void)(c); BUG_ON("unimple=
mented"); })
+#define writel(v,c)             ({ (void)(v); (void)(c); BUG_ON("unimple=
mented"); })
+
+#endif /* __ASM_PPC_IO_H__ */
diff --git a/xen/arch/ppc/include/asm/iocap.h b/xen/arch/ppc/include/asm/=
iocap.h
new file mode 100644
index 0000000000..16ae0cf1c8
--- /dev/null
+++ b/xen/arch/ppc/include/asm/iocap.h
@@ -0,0 +1,7 @@
+#ifndef __ASM_PPC_IOCAP_H__
+#define __ASM_PPC_IOCAP_H__
+
+#define cache_flush_permitted(d)                        \
+    (!rangeset_is_empty((d)->iomem_caps))
+
+#endif /* __ASM_PPC_IOCAP_H__ */
diff --git a/xen/arch/ppc/include/asm/iommu.h b/xen/arch/ppc/include/asm/=
iommu.h
new file mode 100644
index 0000000000..fb1a381518
--- /dev/null
+++ b/xen/arch/ppc/include/asm/iommu.h
@@ -0,0 +1,7 @@
+#ifndef __ASM_PPC_IOMMU_H__
+#define __ASM_PPC_IOMMU_H__
+
+struct arch_iommu {
+};
+
+#endif /* __ASM_PPC_IOMMU_H__ */
diff --git a/xen/arch/ppc/include/asm/irq.h b/xen/arch/ppc/include/asm/ir=
q.h
new file mode 100644
index 0000000000..99d30dd2bf
--- /dev/null
+++ b/xen/arch/ppc/include/asm/irq.h
@@ -0,0 +1,32 @@
+#ifndef __ASM_PPC_IRQ_H__
+#define __ASM_PPC_IRQ_H__
+
+#include <xen/lib.h>
+#include <xen/device_tree.h>
+#include <public/device_tree_defs.h>
+
+/* TODO */
+#define nr_irqs 0U
+#define nr_static_irqs 0
+#define arch_hwdom_irqs(domid) 0U
+
+#define domain_pirq_to_irq(d, pirq) (pirq)
+
+struct arch_pirq {
+};
+
+struct arch_irq_desc {
+    unsigned int type;
+};
+
+static inline void arch_move_irqs(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+static inline int platform_get_irq(const struct dt_device_node *device, =
int index)
+{
+    BUG_ON("unimplemented");
+}
+
+#endif /* __ASM_PPC_IRQ_H__ */
diff --git a/xen/arch/ppc/include/asm/mem_access.h b/xen/arch/ppc/include=
/asm/mem_access.h
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.=
h
index c85a7ed686..2303a89e50 100644
--- a/xen/arch/ppc/include/asm/mm.h
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -1,10 +1,23 @@
 #ifndef _ASM_PPC_MM_H
 #define _ASM_PPC_MM_H

+#include <public/xen.h>
+#include <xen/pdx.h>
+#include <xen/types.h>
+#include <asm/config.h>
 #include <asm/page-bits.h>

+void setup_initial_pagetables(void);
+
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
+#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
+#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
+#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
+#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
+#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
+#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)va))
+#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))

 #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
 #define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | XEN_VIRT_START))
@@ -13,6 +26,240 @@
 #define __pa(x)             (virt_to_maddr(x))
 #define __va(x)             (maddr_to_virt(x))

-void setup_initial_pagetables(void);
+/* Convert between Xen-heap virtual addresses and machine frame numbers.=
 */
+#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
+#define __mfn_to_virt(mfn) (maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT))
+
+/* Convert between Xen-heap virtual addresses and page-info structures. =
*/
+static inline struct page_info *virt_to_page(const void *v)
+{
+    BUG_ON("unimplemented");
+    return NULL;
+}
+
+/*
+ * We define non-underscored wrappers for above conversion functions.
+ * These are overriden in various source files while underscored version
+ * remain intact.
+ */
+#define virt_to_mfn(va)     __virt_to_mfn(va)
+#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
+
+#define PG_shift(idx)   (BITS_PER_LONG - (idx))
+#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
+
+#define PGT_none          PG_mask(0, 1)  /* no special uses of this page=
   */
+#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?      =
   */
+#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.              =
   */
+
+ /* 2-bit count of uses of this frame as its current type. */
+#define PGT_count_mask    PG_mask(3, 3)
+
+/* Cleared when the owning guest 'frees' this page. */
+#define _PGC_allocated    PG_shift(1)
+#define PGC_allocated     PG_mask(1, 1)
+/* Page is Xen heap? */
+#define _PGC_xen_heap     PG_shift(2)
+#define PGC_xen_heap      PG_mask(1, 2)
+/* Page is broken? */
+#define _PGC_broken       PG_shift(7)
+#define PGC_broken        PG_mask(1, 7)
+ /* Mutually-exclusive page states: { inuse, offlining, offlined, free }=
. */
+#define PGC_state         PG_mask(3, 9)
+#define PGC_state_inuse   PG_mask(0, 9)
+#define PGC_state_offlining PG_mask(1, 9)
+#define PGC_state_offlined PG_mask(2, 9)
+#define PGC_state_free    PG_mask(3, 9)
+#define page_state_is(pg, st) (((pg)->count_info&PGC_state) =3D=3D PGC_s=
tate_##st)
+/* Page is not reference counted */
+#define _PGC_extra        PG_shift(10)
+#define PGC_extra         PG_mask(1, 10)
+
+/* Count of references to this frame. */
+#define PGC_count_width   PG_shift(10)
+#define PGC_count_mask    ((1UL<<PGC_count_width)-1)
+
+/*
+ * Page needs to be scrubbed. Since this bit can only be set on a page t=
hat is
+ * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
+ */
+#define _PGC_need_scrub   _PGC_allocated
+#define PGC_need_scrub    PGC_allocated
+
+#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
+#define is_xen_heap_mfn(mfn) \
+    (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
+
+#define is_xen_fixed_mfn(mfn)                                   \
+    ((mfn_to_maddr(mfn) >=3D virt_to_maddr(&_start)) &&           \
+     (mfn_to_maddr(mfn) <=3D virt_to_maddr((vaddr_t)_end - 1)))
+
+#define page_get_owner(_p)    (_p)->v.inuse.domain
+#define page_set_owner(_p,_d) ((_p)->v.inuse.domain =3D (_d))
+
+/* TODO: implement */
+#define mfn_valid(mfn) ({ (void) (mfn); 0; })
+
+#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
+
+#define domain_set_alloc_bitsize(d) ((void)0)
+#define domain_clamp_alloc_bitsize(d, b) (b)
+
+#define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
+
+struct page_info
+{
+    /* Each frame can be threaded onto a doubly-linked list. */
+    struct page_list_entry list;
+
+    /* Reference count and various PGC_xxx flags and fields. */
+    unsigned long count_info;
+
+    /* Context-dependent fields follow... */
+    union {
+        /* Page is in use: ((count_info & PGC_count_mask) !=3D 0). */
+        struct {
+            /* Type reference count and various PGT_xxx flags and fields=
. */
+            unsigned long type_info;
+        } inuse;
+        /* Page is on a free list: ((count_info & PGC_count_mask) =3D=3D=
 0). */
+        union {
+            struct {
+                /*
+                 * Index of the first *possibly* unscrubbed page in the =
buddy.
+                 * One more bit than maximum possible order to accommoda=
te
+                 * INVALID_DIRTY_IDX.
+                 */
+#define INVALID_DIRTY_IDX ((1UL << (MAX_ORDER + 1)) - 1)
+                unsigned long first_dirty:MAX_ORDER + 1;
+
+                /* Do TLBs need flushing for safety before next page use=
? */
+                bool need_tlbflush:1;
+
+#define BUDDY_NOT_SCRUBBING    0
+#define BUDDY_SCRUBBING        1
+#define BUDDY_SCRUB_ABORT      2
+                unsigned long scrub_state:2;
+            };
+
+            unsigned long val;
+        } free;
+
+    } u;
+
+    union {
+        /* Page is in use, but not as a shadow. */
+        struct {
+            /* Owner of this page (zero if page is anonymous). */
+            struct domain *domain;
+        } inuse;
+
+        /* Page is on a free list. */
+        struct {
+            /* Order-size of the free chunk this page is the head of. */
+            unsigned int order;
+        } free;
+
+    } v;
+
+    union {
+        /*
+         * Timestamp from 'TLB clock', used to avoid extra safety flushe=
s.
+         * Only valid for: a) free pages, and b) pages with zero type co=
unt
+         */
+        u32 tlbflush_timestamp;
+    };
+    u64 pad;
+};
+
+
+#define FRAMETABLE_VIRT_START  (XEN_VIRT_START + GB(32))
+#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
+
+/* PDX of the first page in the frame table. */
+extern unsigned long frametable_base_pdx;
+
+/* Convert between machine frame numbers and page-info structures. */
+#define mfn_to_page(mfn)                                            \
+    (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
+#define page_to_mfn(pg)                                             \
+    pdx_to_mfn((unsigned long)((pg) - frame_table) + frametable_base_pdx=
)
+
+static inline void *page_to_virt(const struct page_info *pg)
+{
+    return mfn_to_virt(mfn_x(page_to_mfn(pg)));
+}
+
+/*
+ * Common code requires get_page_type and put_page_type.
+ * We don't care about typecounts so we just do the minimum to make it
+ * happy.
+ */
+static inline int get_page_type(struct page_info *page, unsigned long ty=
pe)
+{
+    return 1;
+}
+
+static inline void put_page_type(struct page_info *page)
+{
+    return;
+}
+
+/* TODO */
+static inline bool get_page_nr(struct page_info *page, const struct doma=
in *domain,
+                        unsigned long nr)
+{
+    BUG_ON("unimplemented");
+}
+static inline void put_page_nr(struct page_info *page, unsigned long nr)
+{
+    BUG_ON("unimplemented");
+}
+
+static inline void put_page_and_type(struct page_info *page)
+{
+    put_page_type(page);
+    put_page(page);
+}
+
+/*
+ * PPC does not have an M2P, but common code expects a handful of
+ * M2P-related defines and functions. Provide dummy versions of these.
+ */
+#define INVALID_M2P_ENTRY        (~0UL)
+#define SHARED_M2P_ENTRY         (~0UL - 1UL)
+#define SHARED_M2P(_e)           ((_e) =3D=3D SHARED_M2P_ENTRY)
+
+/* Xen always owns P2M on PPC */
+#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } wh=
ile (0)
+#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
+
+#define PDX_GROUP_SHIFT (16 + 5)
+
+static inline unsigned long domain_get_maximum_gpfn(struct domain *d)
+{
+    BUG_ON("unimplemented");
+    return 0;
+}
+
+static inline long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) a=
rg)
+{
+    BUG_ON("unimplemented");
+    return 0;
+}
+
+static inline unsigned int arch_get_dma_bitsize(void)
+{
+    return 32; /* TODO */
+}
+
+/*
+ * On PPC, all the RAM is currently direct mapped in Xen.
+ * Hence return always true.
+ */
+static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned lo=
ng nr)
+{
+    return true;
+}

 #endif /* _ASM_PPC_MM_H */
diff --git a/xen/arch/ppc/include/asm/monitor.h b/xen/arch/ppc/include/as=
m/monitor.h
new file mode 100644
index 0000000000..f9e7dde08c
--- /dev/null
+++ b/xen/arch/ppc/include/asm/monitor.h
@@ -0,0 +1,46 @@
+/* Derived from xen/arch/arm/include/asm/monitor.h */
+#ifndef __ASM_PPC_MONITOR_H__
+#define __ASM_PPC_MONITOR_H__
+
+#include <public/domctl.h>
+#include <xen/errno.h>
+
+static inline
+void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace=
)
+{
+}
+
+static inline
+int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_o=
p *mop)
+{
+    /* No arch-specific monitor ops on PPC. */
+    return -EOPNOTSUPP;
+}
+
+int arch_monitor_domctl_event(struct domain *d,
+                              struct xen_domctl_monitor_op *mop);
+
+static inline
+int arch_monitor_init_domain(struct domain *d)
+{
+    /* No arch-specific domain initialization on PPC. */
+    return 0;
+}
+
+static inline
+void arch_monitor_cleanup_domain(struct domain *d)
+{
+    /* No arch-specific domain cleanup on PPC. */
+}
+
+static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
+{
+    uint32_t capabilities =3D 0;
+
+    capabilities =3D (1U << XEN_DOMCTL_MONITOR_EVENT_GUEST_REQUEST |
+                    1U << XEN_DOMCTL_MONITOR_EVENT_PRIVILEGED_CALL);
+
+    return capabilities;
+}
+
+#endif /* __ASM_PPC_MONITOR_H__ */
diff --git a/xen/arch/ppc/include/asm/nospec.h b/xen/arch/ppc/include/asm=
/nospec.h
new file mode 100644
index 0000000000..4d8ec923e9
--- /dev/null
+++ b/xen/arch/ppc/include/asm/nospec.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * From arch/arm/include/asm/nospec.h.
+ * Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserve=
d.
+ */
+#ifndef __ASM_PPC_NOSPEC_H__
+#define __ASM_PPC_NOSPEC_H__
+
+static inline bool evaluate_nospec(bool condition)
+{
+    return condition;
+}
+
+static inline void block_speculation(void)
+{
+}
+
+#endif /* __ASM_PPC_NOSPEC_H__ */
diff --git a/xen/arch/ppc/include/asm/numa.h b/xen/arch/ppc/include/asm/n=
uma.h
new file mode 100644
index 0000000000..d857bba2ba
--- /dev/null
+++ b/xen/arch/ppc/include/asm/numa.h
@@ -0,0 +1,26 @@
+#ifndef __ASM_PPC_NUMA_H__
+#define __ASM_PPC_NUMA_H__
+
+#include <xen/types.h>
+#include <xen/mm.h>
+
+typedef uint8_t nodeid_t;
+
+/* Fake one node for now. See also node_online_map. */
+#define cpu_to_node(cpu) 0
+#define node_to_cpumask(node)   (cpu_online_map)
+
+/*
+ * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
+ * is required because the dummy helpers are using it.
+ */
+extern mfn_t first_valid_mfn;
+
+/* XXX: implement NUMA support */
+#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
+#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
+#define __node_distance(a, b) (20)
+
+#define arch_want_default_dmazone() (false)
+
+#endif /* __ASM_PPC_NUMA_H__ */
diff --git a/xen/arch/ppc/include/asm/p2m.h b/xen/arch/ppc/include/asm/p2=
m.h
new file mode 100644
index 0000000000..851e9f011a
--- /dev/null
+++ b/xen/arch/ppc/include/asm/p2m.h
@@ -0,0 +1,105 @@
+#ifndef __ASM_PPC_P2M_H__
+#define __ASM_PPC_P2M_H__
+
+#include <asm/page-bits.h>
+
+#define paddr_bits PADDR_BITS
+
+/*
+ * List of possible type for each page in the p2m entry.
+ * The number of available bit per page in the pte for this purpose is 4=
 bits.
+ * So it's possible to only have 16 fields. If we run out of value in th=
e
+ * future, it's possible to use higher value for pseudo-type and don't s=
tore
+ * them in the p2m entry.
+ */
+typedef enum {
+    p2m_invalid =3D 0,    /* Nothing mapped here */
+    p2m_ram_rw,         /* Normal read/write guest RAM */
+    p2m_ram_ro,         /* Read-only; writes are silently dropped */
+    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO are=
a */
+    p2m_mmio_direct_nc, /* Read/write mapping of genuine MMIO area non-c=
acheable */
+    p2m_mmio_direct_c,  /* Read/write mapping of genuine MMIO area cache=
able */
+    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
+    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
+    p2m_grant_map_rw,   /* Read/write grant mapping */
+    p2m_grant_map_ro,   /* Read-only grant mapping */
+    /* The types below are only used to decide the page attribute in the=
 P2M */
+    p2m_iommu_map_rw,   /* Read/write iommu mapping */
+    p2m_iommu_map_ro,   /* Read-only iommu mapping */
+    p2m_max_real_type,  /* Types after this won't be store in the p2m */
+} p2m_type_t;
+
+#include <xen/p2m-common.h>
+
+static inline int get_page_and_type(struct page_info *page,
+                                    struct domain *domain,
+                                    unsigned long type)
+{
+    BUG_ON("unimplemented");
+    return 1;
+}
+
+/* Look up a GFN and take a reference count on the backing page. */
+typedef unsigned int p2m_query_t;
+#define P2M_ALLOC    (1u<<0)   /* Populate PoD and paged-out entries */
+#define P2M_UNSHARE  (1u<<1)   /* Break CoW sharing */
+
+static inline struct page_info *get_page_from_gfn(
+    struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
+{
+    BUG_ON("unimplemented");
+    return NULL;
+}
+
+static inline void memory_type_changed(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+
+static inline int guest_physmap_mark_populate_on_demand(struct domain *d=
, unsigned long gfn,
+                                                        unsigned int ord=
er)
+{
+    BUG_ON("unimplemented");
+    return 1;
+}
+
+static inline int guest_physmap_add_entry(struct domain *d,
+                            gfn_t gfn,
+                            mfn_t mfn,
+                            unsigned long page_order,
+                            p2m_type_t t)
+{
+    BUG_ON("unimplemented");
+    return 1;
+}
+
+/* Untyped version for RAM only, for compatibility */
+static inline int __must_check
+guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+                       unsigned int page_order)
+{
+    return guest_physmap_add_entry(d, gfn, mfn, page_order, p2m_ram_rw);
+}
+
+static inline mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn)
+{
+    BUG_ON("unimplemented");
+    return _mfn(0);
+}
+
+static inline bool arch_acquire_resource_check(struct domain *d)
+{
+    /*
+     * The reference counting of foreign entries in set_foreign_p2m_entr=
y()
+     * is supported on PPC.
+     */
+    return true;
+}
+
+static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+{
+    /* Not supported on PPC. */
+}
+
+#endif /* __ASM_PPC_P2M_H__ */
diff --git a/xen/arch/ppc/include/asm/page.h b/xen/arch/ppc/include/asm/p=
age.h
index 3c90e8bf19..aef6d237a4 100644
--- a/xen/arch/ppc/include/asm/page.h
+++ b/xen/arch/ppc/include/asm/page.h
@@ -36,6 +36,9 @@
 #define PTE_XEN_RO   (PTE_XEN_BASE | PTE_EAA_READ)
 #define PTE_XEN_RX   (PTE_XEN_BASE | PTE_EAA_READ | PTE_EAA_EXECUTE)

+/* TODO */
+#define PAGE_HYPERVISOR 0
+
 /*
  * Radix Tree layout for 64KB pages:
  *
@@ -177,4 +180,18 @@ struct prtb_entry {

 void tlbie_all(void);

+static inline void invalidate_icache(void)
+{
+    BUG_ON("unimplemented");
+}
+
+#define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
+#define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
+
+/* TODO: Flush the dcache for an entire page. */
+static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache=
)
+{
+    BUG_ON("unimplemented");
+}
+
 #endif /* _ASM_PPC_PAGE_H */
diff --git a/xen/arch/ppc/include/asm/paging.h b/xen/arch/ppc/include/asm=
/paging.h
new file mode 100644
index 0000000000..eccacece29
--- /dev/null
+++ b/xen/arch/ppc/include/asm/paging.h
@@ -0,0 +1,7 @@
+#ifndef __ASM_PPC_PAGING_H__
+#define __ASM_PPC_PAGING_H__
+
+#define paging_mode_translate(d)              (1)
+#define paging_mode_external(d)               (1)
+
+#endif /* __ASM_PPC_PAGING_H__ */
diff --git a/xen/arch/ppc/include/asm/pci.h b/xen/arch/ppc/include/asm/pc=
i.h
new file mode 100644
index 0000000000..e76c8e5475
--- /dev/null
+++ b/xen/arch/ppc/include/asm/pci.h
@@ -0,0 +1,7 @@
+#ifndef __ASM_PPC_PCI_H__
+#define __ASM_PPC_PCI_H__
+
+struct arch_pci_dev {
+};
+
+#endif /* __ASM_PPC_PCI_H__ */
diff --git a/xen/arch/ppc/include/asm/percpu.h b/xen/arch/ppc/include/asm=
/percpu.h
new file mode 100644
index 0000000000..e7c40c0f03
--- /dev/null
+++ b/xen/arch/ppc/include/asm/percpu.h
@@ -0,0 +1,24 @@
+#ifndef __PPC_PERCPU_H__
+#define __PPC_PERCPU_H__
+
+#ifndef __ASSEMBLY__
+
+extern char __per_cpu_start[], __per_cpu_data_end[];
+extern unsigned long __per_cpu_offset[NR_CPUS];
+void percpu_init_areas(void);
+
+#define smp_processor_id() 0 /* TODO: Fix this */
+
+#define per_cpu(var, cpu)  \
+    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
+#define this_cpu(var) \
+    (*RELOC_HIDE(&per_cpu__##var, smp_processor_id()))
+
+#define per_cpu_ptr(var, cpu)  \
+    (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
+#define this_cpu_ptr(var) \
+    (*RELOC_HIDE(var, smp_processor_id()))
+
+#endif
+
+#endif /* __PPC_PERCPU_H__ */
diff --git a/xen/arch/ppc/include/asm/procarea.h b/xen/arch/ppc/include/a=
sm/procarea.h
new file mode 100644
index 0000000000..97aef26ccb
--- /dev/null
+++ b/xen/arch/ppc/include/asm/procarea.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) IBM Corp. 2005
+ *
+ * Authors: Hollis Blanchard <hollisb@us.ibm.com>
+ */
+
+#ifndef _ASM_PROCAREA_H_
+#define _ASM_PROCAREA_H_
+
+struct processor_area
+{
+    unsigned int whoami;
+    unsigned int hard_id;
+    struct vcpu *cur_vcpu;
+    void *hyp_stack_base;
+    unsigned long saved_regs[2];
+};
+
+#endif
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/=
asm/processor.h
index 6b70569eb8..0e651d0aa9 100644
--- a/xen/arch/ppc/include/asm/processor.h
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -110,6 +110,10 @@
 /* Macro to adjust thread priority for hardware multithreading */
 #define HMT_very_low()  asm volatile ( "or %r31, %r31, %r31" )

+/* TODO: This isn't correct */
+#define cpu_to_core(cpu)   (0)
+#define cpu_to_socket(cpu) (0)
+
 /*
  * User-accessible registers: most of these need to be saved/restored
  * for every nested Xen invocation.
@@ -178,6 +182,12 @@ static inline void noreturn die(void)
         HMT_very_low();
 }

+/*
+ * Implemented on pre-POWER10 by setting HMT to low then to medium using
+ * the special OR forms. See HMT_very_low above.
+ */
+#define cpu_relax() asm volatile ( "or %r1, %r1, %r1; or %r2, %r2, %r2" =
)
+
 #endif /* __ASSEMBLY__ */

 #endif /* _ASM_PPC_PROCESSOR_H */
diff --git a/xen/arch/ppc/include/asm/random.h b/xen/arch/ppc/include/asm=
/random.h
new file mode 100644
index 0000000000..2f9e9bbae4
--- /dev/null
+++ b/xen/arch/ppc/include/asm/random.h
@@ -0,0 +1,9 @@
+#ifndef __ASM_PPC_RANDOM_H__
+#define __ASM_PPC_RANDOM_H__
+
+static inline unsigned int arch_get_random(void)
+{
+    return 0;
+}
+
+#endif /* __ASM_PPC_RANDOM_H__ */
diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/=
setup.h
new file mode 100644
index 0000000000..e4f64879b6
--- /dev/null
+++ b/xen/arch/ppc/include/asm/setup.h
@@ -0,0 +1,6 @@
+#ifndef __ASM_PPC_SETUP_H__
+#define __ASM_PPC_SETUP_H__
+
+#define max_init_domid (0)
+
+#endif /* __ASM_PPC_SETUP_H__ */
diff --git a/xen/arch/ppc/include/asm/smp.h b/xen/arch/ppc/include/asm/sm=
p.h
new file mode 100644
index 0000000000..eca43f0e6c
--- /dev/null
+++ b/xen/arch/ppc/include/asm/smp.h
@@ -0,0 +1,18 @@
+#ifndef __ASM_SMP_H
+#define __ASM_SMP_H
+
+#include <xen/cpumask.h>
+#include <xen/percpu.h>
+
+DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
+DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
+
+#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
+
+/*
+ * Do we, for platform reasons, need to actually keep CPUs online when w=
e
+ * would otherwise prefer them to be off?
+ */
+#define park_offline_cpus false
+
+#endif
diff --git a/xen/arch/ppc/include/asm/softirq.h b/xen/arch/ppc/include/as=
m/softirq.h
new file mode 100644
index 0000000000..a0b28a5e51
--- /dev/null
+++ b/xen/arch/ppc/include/asm/softirq.h
@@ -0,0 +1,8 @@
+#ifndef __ASM_PPC_SOFTIRQ_H__
+#define __ASM_PPC_SOFTIRQ_H__
+
+#define NR_ARCH_SOFTIRQS 0
+
+#define arch_skip_send_event_check(cpu) 0
+
+#endif /* __ASM_PPC_SOFTIRQ_H__ */
diff --git a/xen/arch/ppc/include/asm/spinlock.h b/xen/arch/ppc/include/a=
sm/spinlock.h
new file mode 100644
index 0000000000..4bdb4b1e98
--- /dev/null
+++ b/xen/arch/ppc/include/asm/spinlock.h
@@ -0,0 +1,15 @@
+#ifndef __ASM_SPINLOCK_H
+#define __ASM_SPINLOCK_H
+
+#define arch_lock_acquire_barrier() smp_mb()
+#define arch_lock_release_barrier() smp_mb()
+
+#define arch_lock_relax() cpu_relax()
+#define arch_lock_signal()
+#define arch_lock_signal_wmb()      \
+({                                  \
+    smp_wmb();                      \
+    arch_lock_signal();             \
+})
+
+#endif /* __ASM_SPINLOCK_H */
diff --git a/xen/arch/ppc/include/asm/system.h b/xen/arch/ppc/include/asm=
/system.h
index 94091df644..7cef54e822 100644
--- a/xen/arch/ppc/include/asm/system.h
+++ b/xen/arch/ppc/include/asm/system.h
@@ -1,6 +1,233 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) IBM Corp. 2005
+ * Copyright (C) Raptor Engineering LLC
+ *
+ * Authors: Jimi Xenidis <jimix@watson.ibm.com>
+ *          Shawn Anastasio <sanastasio@raptorengineering.com>
+ */
+
 #ifndef _ASM_SYSTEM_H_
 #define _ASM_SYSTEM_H_

-#define smp_wmb() __asm__ __volatile__ ( "lwsync" : : : "memory" )
+#include <xen/lib.h>
+#include <asm/memory.h>
+#include <asm/time.h>
+#include <asm/processor.h>
+#include <asm/msr.h>
+
+#define xchg(ptr,x) 							       \
+({									       \
+	__typeof__(*(ptr)) _x_ =3D (x);					       \
+	(__typeof__(*(ptr))) __xchg((ptr), (unsigned long)_x_, sizeof(*(ptr)));=
 \
+})
+
+#define build_xchg(fn, type, ldinsn, stinsn) \
+static inline unsigned long \
+fn(volatile type *m, unsigned long val) \
+{ \
+    unsigned long dummy; \
+                                                    \
+    __asm__ __volatile__(                           \
+    PPC_ATOMIC_ENTRY_BARRIER                        \
+"1: " ldinsn " %0,0,%3\n"                           \
+    stinsn " %2,0,%3\n"                             \
+"2:  bne- 1b"                                       \
+    PPC_ATOMIC_EXIT_BARRIER                         \
+    : "=3D&r" (dummy), "=3Dm" (*m)                      \
+    : "r" (val), "r" (m)                            \
+    : "cc", "memory");                              \
+    return dummy;                                   \
+}
+
+build_xchg(__xchg_u8, uint8_t, "lbarx", "stbcx.")
+build_xchg(__xchg_u16, uint16_t, "lharx", "sthcx.")
+build_xchg(__xchg_u32, uint32_t, "lwarx", "stwcx.")
+build_xchg(__xchg_u64, uint64_t, "ldarx", "stdcx.")
+
+#undef build_xchg
+
+/*
+ * This function doesn't exist, so you'll get a linker error
+ * if something tries to do an invalid xchg().
+ */
+extern void __xchg_called_with_bad_pointer(void);
+
+static inline unsigned long
+__xchg(volatile void *ptr, unsigned long x, int size)
+{
+    switch (size) {
+    case 1:
+        return __xchg_u8(ptr, x);
+    case 2:
+        return __xchg_u16(ptr, x);
+    case 4:
+        return __xchg_u32(ptr, x);
+    case 8:
+        return __xchg_u64(ptr, x);
+    }
+    __xchg_called_with_bad_pointer();
+    return x;
+}
+
+
+static inline unsigned long
+__cmpxchg_u32(volatile int *p, int old, int new)
+{
+    unsigned int prev;
+
+    __asm__ __volatile__ (
+    PPC_ATOMIC_ENTRY_BARRIER
+"1: lwarx   %0,0,%2     # __cmpxchg_u32\n\
+    cmpw    0,%0,%3\n\
+    bne-    2f\n\
+    stwcx.  %4,0,%2\n\
+    bne-    1b"
+    PPC_ATOMIC_EXIT_BARRIER
+    "\n\
+2:"
+    : "=3D&r" (prev), "=3Dm" (*p)
+    : "r" (p), "r" (old), "r" (new), "m" (*p)
+    : "cc", "memory");
+
+    return prev;
+}
+
+static inline unsigned long
+__cmpxchg_u64(volatile long *p, unsigned long old, unsigned long new)
+{
+    unsigned long prev;
+
+    __asm__ __volatile__ (
+    PPC_ATOMIC_ENTRY_BARRIER
+"1: ldarx   %0,0,%2     # __cmpxchg_u64\n\
+    cmpd    0,%0,%3\n\
+    bne-    2f\n\
+    stdcx.  %4,0,%2\n\
+    bne-    1b"
+    PPC_ATOMIC_EXIT_BARRIER
+    "\n\
+2:"
+    : "=3D&r" (prev), "=3Dm" (*p)
+    : "r" (p), "r" (old), "r" (new), "m" (*p)
+    : "cc", "memory");
+
+    return prev;
+}
+
+/* This function doesn't exist, so you'll get a linker error
+   if something tries to do an invalid cmpxchg().  */
+extern void __cmpxchg_called_with_bad_pointer(void);
+
+static always_inline unsigned long
+__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int =
size)
+{
+    switch (size) {
+    case 2:
+        BUG_ON("unimplemented"); return 0; /* XXX implement __cmpxchg_u1=
6 ? */
+    case 4:
+        return __cmpxchg_u32(ptr, old, new);
+    case 8:
+        return __cmpxchg_u64(ptr, old, new);
+    }
+    __cmpxchg_called_with_bad_pointer();
+    return old;
+}
+
+#define cmpxchg_user(ptr,o,n) cmpxchg(ptr,o,n)
+
+#define cmpxchg(ptr,o,n)                         \
+  ({                                     \
+     __typeof__(*(ptr)) _o_ =3D (o);                   \
+     __typeof__(*(ptr)) _n_ =3D (n);                   \
+     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,       \
+                    (unsigned long)_n_, sizeof(*(ptr))); \
+  })
+
+
+/*
+ * Memory barrier.
+ * The sync instruction guarantees that all memory accesses initiated
+ * by this processor have been performed (with respect to all other
+ * mechanisms that access memory).  The eieio instruction is a barrier
+ * providing an ordering (separately) for (a) cacheable stores and (b)
+ * loads and stores to non-cacheable memory (e.g. I/O devices).
+ *
+ * mb() prevents loads and stores being reordered across this point.
+ * rmb() prevents loads being reordered across this point.
+ * wmb() prevents stores being reordered across this point.
+ * read_barrier_depends() prevents data-dependent loads being reordered
+ *  across this point (nop on PPC).
+ *
+ * We have to use the sync instructions for mb(), since lwsync doesn't
+ * order loads with respect to previous stores.  Lwsync is fine for
+ * rmb(), though.
+ * For wmb(), we use sync since wmb is used in drivers to order
+ * stores to system memory with respect to writes to the device.
+ * However, smp_wmb() can be a lighter-weight eieio barrier on
+ * SMP since it is only used to order updates to system memory.
+ */
+#define mb()   __asm__ __volatile__ ("sync" : : : "memory")
+#define rmb()  __asm__ __volatile__ ("lwsync" : : : "memory")
+#define wmb()  __asm__ __volatile__ ("sync" : : : "memory")
+#define read_barrier_depends()  do { } while(0)
+
+#define set_mb(var, value)  do { var =3D value; smp_mb(); } while (0)
+#define set_wmb(var, value) do { var =3D value; smp_wmb(); } while (0)
+
+#define smp_mb__before_atomic()    smp_mb()
+#define smp_mb__after_atomic()     smp_mb()
+
+#ifdef CONFIG_SMP
+#define smp_mb()    mb()
+#define smp_rmb()   rmb()
+#define smp_wmb()   __asm__ __volatile__ ("lwsync" : : : "memory")
+#define smp_read_barrier_depends()  read_barrier_depends()
+#else
+#define smp_mb()    __asm__ __volatile__("": : :"memory")
+#define smp_rmb()   __asm__ __volatile__("": : :"memory")
+#define smp_wmb()   __asm__ __volatile__("": : :"memory")
+#define smp_read_barrier_depends()  do { } while(0)
+#endif /* CONFIG_SMP */
+
+#define local_save_flags(flags) ((flags) =3D mfmsr())
+#define local_irq_restore(flags) do { \
+        __asm__ __volatile__("": : :"memory"); \
+        mtmsrd((flags)); \
+} while(0)
+
+static inline void local_irq_disable(void)
+{
+        unsigned long msr;
+        msr =3D mfmsr();
+        mtmsrd(msr & ~MSR_EE);
+        __asm__ __volatile__("" : : : "memory");
+}
+
+static inline void local_irq_enable(void)
+{
+        unsigned long msr;
+        __asm__ __volatile__("" : : : "memory");
+        msr =3D mfmsr();
+        mtmsrd(msr | MSR_EE);
+}
+
+static inline void __do_save_and_cli(unsigned long *flags)
+{
+    unsigned long msr;
+    msr =3D mfmsr();
+    *flags =3D msr;
+    mtmsrd(msr & ~MSR_EE);
+    __asm__ __volatile__("" : : : "memory");
+}
+
+#define local_irq_save(flags) __do_save_and_cli(&flags)
+
+static inline int local_irq_is_enabled(void)
+{
+    return !!(mfmsr() & MSR_EE);
+}
+
+#define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)

 #endif /* _ASM_SYSTEM_H */
diff --git a/xen/arch/ppc/include/asm/time.h b/xen/arch/ppc/include/asm/t=
ime.h
new file mode 100644
index 0000000000..7872d3c15b
--- /dev/null
+++ b/xen/arch/ppc/include/asm/time.h
@@ -0,0 +1,20 @@
+#ifndef __ASM_PPC_TIME_H__
+#define __ASM_PPC_TIME_H__
+
+#include <xen/lib.h>
+#include <asm/processor.h>
+#include <asm/regs.h>
+
+struct vcpu;
+
+/* TODO: implement */
+static inline void force_update_vcpu_system_time(struct vcpu *v) { BUG_O=
N("unimplemented"); }
+
+typedef unsigned long cycles_t;
+
+static inline cycles_t get_cycles(void)
+{
+	return mfspr(SPRN_TBRL);
+}
+
+#endif /* __ASM_PPC_TIME_H__ */
diff --git a/xen/arch/ppc/include/asm/vm_event.h b/xen/arch/ppc/include/a=
sm/vm_event.h
new file mode 100644
index 0000000000..346653f32a
--- /dev/null
+++ b/xen/arch/ppc/include/asm/vm_event.h
@@ -0,0 +1,49 @@
+#ifndef __ASM_PPC_VM_EVENT_H__
+#define __ASM_PPC_VM_EVENT_H__
+
+#include <xen/sched.h>
+#include <xen/vm_event.h>
+#include <public/domctl.h>
+
+static inline int vm_event_init_domain(struct domain *d)
+{
+    /* Nothing to do. */
+    return 0;
+}
+
+static inline void vm_event_cleanup_domain(struct domain *d)
+{
+    memset(&d->monitor, 0, sizeof(d->monitor));
+}
+
+static inline void vm_event_toggle_singlestep(struct domain *d, struct v=
cpu *v,
+                                              vm_event_response_t *rsp)
+{
+    /* Not supported on PPC. */
+}
+
+static inline
+void vm_event_register_write_resume(struct vcpu *v, vm_event_response_t =
*rsp)
+{
+    /* Not supported on PPC. */
+}
+
+static inline
+void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
+{
+    /* Not supported on PPC. */
+}
+
+static inline
+void vm_event_sync_event(struct vcpu *v, bool value)
+{
+    /* Not supported on PPC. */
+}
+
+static inline
+void vm_event_reset_vmtrace(struct vcpu *v)
+{
+    /* Not supported on PPC. */
+}
+
+#endif /* __ASM_PPC_VM_EVENT_H__ */
diff --git a/xen/arch/ppc/include/asm/xenoprof.h b/xen/arch/ppc/include/a=
sm/xenoprof.h
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index 3feeb90ebc..06129cef9c 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -1,13 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/init.h>
 #include <xen/kernel.h>
+#include <xen/mm.h>
 #include <xen/types.h>
 #include <xen/lib.h>

 #include <asm/bitops.h>
 #include <asm/byteorder.h>
 #include <asm/early_printk.h>
-#include <asm/mm.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/regs.h>
diff --git a/xen/arch/ppc/tlb-radix.c b/xen/arch/ppc/tlb-radix.c
index 3dde102c62..74213113e0 100644
--- a/xen/arch/ppc/tlb-radix.c
+++ b/xen/arch/ppc/tlb-radix.c
@@ -5,9 +5,9 @@
  *
  * Copyright 2015-2016, Aneesh Kumar K.V, IBM Corporation.
  */
+#include <xen/bitops.h>
 #include <xen/stringify.h>

-#include <asm/bitops.h>
 #include <asm/msr.h>
 #include <asm/processor.h>

diff --git a/xen/include/public/hvm/save.h b/xen/include/public/hvm/save.=
h
index 464ebdb0da..2cf4238daa 100644
--- a/xen/include/public/hvm/save.h
+++ b/xen/include/public/hvm/save.h
@@ -89,6 +89,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
 #include "../arch-x86/hvm/save.h"
 #elif defined(__arm__) || defined(__aarch64__)
 #include "../arch-arm/hvm/save.h"
+#elif defined(__powerpc64__)
+#include "../arch-ppc.h"
 #else
 #error "unsupported architecture"
 #endif
diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
index eb87a81e7b..5a176b6ac3 100644
--- a/xen/include/public/pmu.h
+++ b/xen/include/public/pmu.h
@@ -11,6 +11,8 @@
 #include "arch-x86/pmu.h"
 #elif defined (__arm__) || defined (__aarch64__)
 #include "arch-arm.h"
+#elif defined (__powerpc64__)
+#include "arch-ppc.h"
 #else
 #error "Unsupported architecture"
 #endif
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 920567e006..b812a0a324 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -16,6 +16,8 @@
 #include "arch-x86/xen.h"
 #elif defined(__arm__) || defined (__aarch64__)
 #include "arch-arm.h"
+#elif defined(__powerpc64__)
+#include "arch-ppc.h"
 #else
 #error "Unsupported architecture"
 #endif
--
2.30.2


