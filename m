Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12FFB4672F
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112645.1460950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufqD-0004jF-6t; Fri, 05 Sep 2025 23:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112645.1460950; Fri, 05 Sep 2025 23:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufqC-0004br-Nw; Fri, 05 Sep 2025 23:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1112645;
 Fri, 05 Sep 2025 23:27:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufq9-00046l-Ft
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:27:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufq8-008ACh-30;
 Fri, 05 Sep 2025 23:27:33 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufq8-0005Dc-2d;
 Fri, 05 Sep 2025 23:27:33 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=sRCoyJrQXJ7kAPK0GzF+5VS6TdNQm9twBbzHI7FmCnI=; b=GA9Mna5+ZgkBUKCB1+gPFUFdmH
	vynHYi5zImLsAS9xjU9hycKmGDBlMVWNxM6NiBmuxN+LxchDjk+Pz5YE+k79hDvIXezdLXPXg2mWI
	c23bf5LIgukj0oLTdoz8aqxlWgLkEPpKhqX7tp1ogcVD5E/jAmpfPfeqrKVtog9+RpMw=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v6 13/15] x86/domain: enable per-domain I/O port bitmaps
Date: Fri,  5 Sep 2025 16:27:12 -0700
Message-ID: <20250905232715.440758-14-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905232715.440758-1-dmukhin@ford.com>
References: <20250905232715.440758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Current design enables all HVM domains share the same I/O port bitmap.

It is necessary for domains crafting its own I/O port address space depending
on the user configuration.

Ensure NS16550 emulator does not share I/O ports with the physical I/O ports,
which is essential for emulation in PVH hwdom case (dom0).

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- fixed printout formatters in ns16x50_init()
- Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-14-dmukhin@ford.com/
---
 xen/arch/x86/Makefile                    |   1 +
 xen/arch/x86/dom0_build.c                | 111 +--------------
 xen/arch/x86/hvm/hvm.c                   |  35 +----
 xen/arch/x86/hvm/nestedhvm.c             |   8 +-
 xen/arch/x86/hvm/quirks.c                |   3 -
 xen/arch/x86/hvm/svm/nestedsvm.c         |   2 +-
 xen/arch/x86/hvm/vmx/vvmx.c              |   4 +-
 xen/arch/x86/include/asm/hvm/nestedhvm.h |   3 +-
 xen/arch/x86/include/asm/hvm/support.h   |   2 -
 xen/arch/x86/include/asm/iocap.h         |   2 +
 xen/arch/x86/ioport.c                    | 163 +++++++++++++++++++++++
 xen/arch/x86/pv/dom0_build.c             |   4 +
 xen/common/emul/vuart/ns16x50.c          |  11 ++
 13 files changed, 200 insertions(+), 149 deletions(-)
 create mode 100644 xen/arch/x86/ioport.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index d7aed7d92c15..85a8475e126c 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -44,6 +44,7 @@ obj-y += msi.o
 obj-y += msr.o
 obj-$(CONFIG_INDIRECT_THUNK) += indirect-thunk.o
 obj-$(CONFIG_RETURN_THUNK) += indirect-thunk.o
+obj-y += ioport.o
 obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += irq.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4fc..26202b33345c 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -298,9 +298,6 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
     return 0;
 }
 
-static char __initdata opt_dom0_ioports_disable[200] = "";
-string_param("dom0_ioports_disable", opt_dom0_ioports_disable);
-
 static bool __initdata ro_hpet = true;
 boolean_param("ro-hpet", ro_hpet);
 
@@ -433,122 +430,20 @@ unsigned long __init dom0_compute_nr_pages(
     return nr_pages;
 }
 
-static void __init process_dom0_ioports_disable(struct domain *dom0)
-{
-    unsigned long io_from, io_to;
-    char *t, *s = opt_dom0_ioports_disable;
-    const char *u;
-
-    if ( *s == '\0' )
-        return;
-
-    while ( (t = strsep(&s, ",")) != NULL )
-    {
-        io_from = simple_strtoul(t, &u, 16);
-        if ( u == t )
-        {
-        parse_error:
-            printk("Invalid ioport range <%s> "
-                   "in dom0_ioports_disable, skipping\n", t);
-            continue;
-        }
-
-        if ( *u == '\0' )
-            io_to = io_from;
-        else if ( *u == '-' )
-            io_to = simple_strtoul(u + 1, &u, 16);
-        else
-            goto parse_error;
-
-        if ( (*u != '\0') || (io_to < io_from) || (io_to >= 65536) )
-            goto parse_error;
-
-        printk("Disabling dom0 access to ioport range %04lx-%04lx\n",
-            io_from, io_to);
-
-        if ( ioports_deny_access(dom0, io_from, io_to) != 0 )
-            BUG();
-    }
-}
-
+/* Modify I/O memory access permissions. */
 int __init dom0_setup_permissions(struct domain *d)
 {
     unsigned long mfn;
-    unsigned int i, offs;
-    int rc;
+    unsigned int i;
+    int rc = 0;
 
     if ( pv_shim )
         return 0;
 
-    /* The hardware domain is initially permitted full I/O capabilities. */
-    rc = ioports_permit_access(d, 0, 0xFFFF);
     rc |= iomem_permit_access(d, 0UL,
                               PFN_DOWN(1UL << domain_max_paddr_bits(d)) - 1);
     rc |= irqs_permit_access(d, 1, nr_irqs_gsi - 1);
 
-    /* Modify I/O port access permissions. */
-
-    for ( offs = 0, i = ISOLATE_LSB(i8259A_alias_mask) ?: 2;
-          offs <= i8259A_alias_mask; offs += i )
-    {
-        if ( offs & ~i8259A_alias_mask )
-            continue;
-        /* Master Interrupt Controller (PIC). */
-        rc |= ioports_deny_access(d, 0x20 + offs, 0x21 + offs);
-        /* Slave Interrupt Controller (PIC). */
-        rc |= ioports_deny_access(d, 0xA0 + offs, 0xA1 + offs);
-    }
-
-    /* ELCR of both PICs. */
-    rc |= ioports_deny_access(d, 0x4D0, 0x4D1);
-
-    /* Interval Timer (PIT). */
-    for ( offs = 0, i = ISOLATE_LSB(pit_alias_mask) ?: 4;
-          offs <= pit_alias_mask; offs += i )
-        if ( !(offs & ~pit_alias_mask) )
-            rc |= ioports_deny_access(d, PIT_CH0 + offs, PIT_MODE + offs);
-
-    /* PIT Channel 2 / PC Speaker Control. */
-    rc |= ioports_deny_access(d, 0x61, 0x61);
-
-    /* INIT# and alternative A20M# control. */
-    rc |= ioports_deny_access(d, 0x92, 0x92);
-
-    /* IGNNE# control. */
-    rc |= ioports_deny_access(d, 0xF0, 0xF0);
-
-    /* ACPI PM Timer. */
-    if ( pmtmr_ioport )
-        rc |= ioports_deny_access(d, pmtmr_ioport, pmtmr_ioport + 3);
-
-    /* Reset control. */
-    rc |= ioports_deny_access(d, 0xCF9, 0xCF9);
-
-    /* PCI configuration space (NB. 0xCF8 has special treatment). */
-    rc |= ioports_deny_access(d, 0xCFC, 0xCFF);
-
-#ifdef CONFIG_HVM
-    if ( is_hvm_domain(d) )
-    {
-        /* ISA DMA controller, channels 0-3 (incl possible aliases). */
-        rc |= ioports_deny_access(d, 0x00, 0x1F);
-        /* ISA DMA controller, page registers (incl various reserved ones). */
-        rc |= ioports_deny_access(d, 0x80 + !!hvm_port80_allowed, 0x8F);
-        /* ISA DMA controller, channels 4-7 (incl usual aliases). */
-        rc |= ioports_deny_access(d, 0xC0, 0xDF);
-
-        /* HVM debug console IO port. */
-        rc |= ioports_deny_access(d, XEN_HVM_DEBUGCONS_IOPORT,
-                                  XEN_HVM_DEBUGCONS_IOPORT);
-        if ( amd_acpi_c1e_quirk )
-            rc |= ioports_deny_access(d, acpi_smi_cmd, acpi_smi_cmd);
-    }
-#endif
-    /* Command-line I/O ranges. */
-    process_dom0_ioports_disable(d);
-
-    /* Modify I/O memory access permissions. */
-
     /* Local APIC. */
     if ( mp_lapic_addr != 0 )
     {
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 91c971f11e14..93109db77283 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -51,6 +51,7 @@
 #include <asm/hvm/vm_event.h>
 #include <asm/hvm/vpt.h>
 #include <asm/i387.h>
+#include <asm/iocap.h>
 #include <asm/mc146818rtc.h>
 #include <asm/mce.h>
 #include <asm/monitor.h>
@@ -81,14 +82,6 @@ integer_param("hvm_debug", opt_hvm_debug_level);
 
 struct hvm_function_table __ro_after_init hvm_funcs;
 
-/*
- * The I/O permission bitmap is globally shared by all HVM guests except
- * the hardware domain which needs a more permissive one.
- */
-#define HVM_IOBITMAP_SIZE (3 * PAGE_SIZE)
-unsigned long __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    hvm_io_bitmap[HVM_IOBITMAP_SIZE / BYTES_PER_LONG];
-
 /* Xen command-line option to enable HAP */
 static bool __initdata opt_hap_enabled = true;
 boolean_param("hap", opt_hap_enabled);
@@ -205,15 +198,6 @@ static int __init cf_check hvm_enable(void)
     if ( opt_hvm_fep )
         warning_add(warning_hvm_fep);
 
-    /*
-     * Allow direct access to the PC debug ports 0x80 and 0xed (they are
-     * often used for I/O delays, but the vmexits simply slow things down).
-     */
-    memset(hvm_io_bitmap, ~0, sizeof(hvm_io_bitmap));
-    if ( hvm_port80_allowed )
-        __clear_bit(0x80, hvm_io_bitmap);
-    __clear_bit(0xed, hvm_io_bitmap);
-
     register_cpu_notifier(&cpu_nfb);
 
     return 0;
@@ -645,19 +629,12 @@ int hvm_domain_initialise(struct domain *d,
 
     rwlock_init(&d->arch.hvm.pl_time->pt_migrate);
 
-    /* Set the default IO Bitmap. */
-    if ( is_hardware_domain(d) )
+    rc = ioports_setup_access(d);
+    if ( rc )
     {
-        d->arch.hvm.io_bitmap = _xmalloc(HVM_IOBITMAP_SIZE, PAGE_SIZE);
-        if ( d->arch.hvm.io_bitmap == NULL )
-        {
-            rc = -ENOMEM;
-            goto fail1;
-        }
-        memset(d->arch.hvm.io_bitmap, ~0, HVM_IOBITMAP_SIZE);
+        printk("%pd failed to setup I/O bitmap: %d\n", d, rc);
+        goto fail1;
     }
-    else
-        d->arch.hvm.io_bitmap = hvm_io_bitmap;
 
     register_g2m_portio_handler(d);
     register_vpci_portio_handler(d);
@@ -684,6 +661,8 @@ int hvm_domain_initialise(struct domain *d,
         break;
     }
 
+    BUG_ON(!d->arch.ioport_caps);
+
     vpic_init(d);
 
     rc = vioapic_init(d);
diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
index bddd77d8109b..d4e03123d910 100644
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -107,7 +107,7 @@ nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m)
  * The users of the bitmap patterns are in SVM/VMX specific code.
  *
  * bitmap        port 0x80  port 0xed
- * hvm_io_bitmap cleared    cleared
+ * hvm.io_bitmap cleared    cleared
  * iomap[0]      cleared    set
  * iomap[1]      set        cleared
  * iomap[2]      set        set
@@ -115,7 +115,7 @@ nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m)
 
 static int __init cf_check nestedhvm_setup(void)
 {
-    /* Same format and size as hvm_io_bitmap (Intel needs only 2 pages). */
+    /* Same format and size as hvm.io_bitmap (Intel needs only 2 pages). */
     unsigned nr = cpu_has_vmx ? 2 : 3;
     unsigned int i, order = get_order_from_pages(nr);
 
@@ -165,7 +165,7 @@ static int __init cf_check nestedhvm_setup(void)
 __initcall(nestedhvm_setup);
 
 unsigned long *
-nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed)
+nestedhvm_vcpu_iomap_get(struct vcpu *v, bool ioport_80, bool ioport_ed)
 {
     int i;
 
@@ -174,7 +174,7 @@ nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed)
 
     if (ioport_80 == 0) {
         if (ioport_ed == 0)
-            return hvm_io_bitmap;
+            return v->domain->arch.hvm.io_bitmap;
         i = 0;
     } else {
         if (ioport_ed == 0)
diff --git a/xen/arch/x86/hvm/quirks.c b/xen/arch/x86/hvm/quirks.c
index 9202f5a47fe9..f4d95441fcff 100644
--- a/xen/arch/x86/hvm/quirks.c
+++ b/xen/arch/x86/hvm/quirks.c
@@ -73,9 +73,6 @@ static int __init cf_check check_port80(void)
 
     dmi_check_system(hvm_no_port80_dmi_table);
 
-    if ( !hvm_port80_allowed )
-        __set_bit(0x80, hvm_io_bitmap);
-
     return 0;
 }
 __initcall(check_port80);
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index dc2b6a42534a..cc8500b61665 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -381,7 +381,7 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
         hvm_unmap_guest_frame(ns_viomap, 0);
     }
 
-    svm->ns_iomap = nestedhvm_vcpu_iomap_get(ioport_80, ioport_ed);
+    svm->ns_iomap = nestedhvm_vcpu_iomap_get(v, ioport_80, ioport_ed);
 
     nv->nv_ioport80 = ioport_80;
     nv->nv_ioportED = ioport_ed;
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index e4f3a5fe4c71..4da3e6e90e6c 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -554,7 +554,7 @@ unsigned long *_shadow_io_bitmap(struct vcpu *v)
     port80 = bitmap[0x80 >> 3] & (1 << (0x80 & 0x7)) ? 1 : 0;
     portED = bitmap[0xed >> 3] & (1 << (0xed & 0x7)) ? 1 : 0;
 
-    return nestedhvm_vcpu_iomap_get(port80, portED);
+    return nestedhvm_vcpu_iomap_get(v, port80, portED);
 }
 
 static void update_msrbitmap(struct vcpu *v, uint32_t shadow_ctrl)
@@ -622,7 +622,7 @@ void nvmx_update_exec_control(struct vcpu *v, u32 host_cntrl)
              * L1 VMM doesn't intercept IO instruction.
              * Use host configuration and reset IO_BITMAP
              */
-            bitmap = hvm_io_bitmap;
+            bitmap = v->domain->arch.hvm.io_bitmap;
         }
         else {
             /* use IO bitmap */
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index ea2c1bc328c7..d691ccb07dd6 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
@@ -50,7 +50,8 @@ int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
                                     struct npfec npfec);
 
 /* IO permission map */
-unsigned long *nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed);
+unsigned long *nestedhvm_vcpu_iomap_get(struct vcpu *v,
+                                        bool ioport_80, bool ioport_ed);
 
 /* Misc */
 #define nestedhvm_paging_mode_hap(v) (!!nhvm_vmcx_hap_enabled(v))
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/asm/hvm/support.h
index 2a7ba36af06f..7e36d00cc188 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -41,8 +41,6 @@ extern unsigned int opt_hvm_debug_level;
 #define HVM_DBG_LOG(level, _f, _a...) do {} while (0)
 #endif
 
-extern unsigned long hvm_io_bitmap[];
-
 enum hvm_translation_result {
     HVMTRANS_okay,
     HVMTRANS_bad_linear_to_gfn,
diff --git a/xen/arch/x86/include/asm/iocap.h b/xen/arch/x86/include/asm/iocap.h
index f948b7186e95..1083f6171cf7 100644
--- a/xen/arch/x86/include/asm/iocap.h
+++ b/xen/arch/x86/include/asm/iocap.h
@@ -22,6 +22,8 @@
 #define cache_flush_permitted(d) \
     (has_arch_io_resources(d) || has_arch_pdevs(d))
 
+int ioports_setup_access(struct domain *d);
+
 static inline int ioports_permit_access(struct domain *d, unsigned long s,
                                         unsigned long e)
 {
diff --git a/xen/arch/x86/ioport.c b/xen/arch/x86/ioport.c
new file mode 100644
index 000000000000..dbcd52d37a4f
--- /dev/null
+++ b/xen/arch/x86/ioport.c
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Guest I/O port address space configuration.
+ *
+ * Copyright 2025 Ford Motor Company
+ */
+
+#include <xen/domain.h>
+#include <xen/param.h>
+
+#include <asm/amd.h>
+#include <asm/acpi.h>
+#include <asm/io-ports.h>
+#include <asm/iocap.h>
+#include <asm/pv/shim.h>
+#include <asm/setup.h>
+
+static char __initdata opt_dom0_ioports_disable[200] = "";
+string_param("dom0_ioports_disable", opt_dom0_ioports_disable);
+
+/*
+ * The I/O permission bitmap size.
+ * See: comment in nestedhvm_setup()
+ */
+#define HVM_IOBITMAP_SIZE (3 * PAGE_SIZE)
+
+/* Hide user-defined I/O ports from the guest OS. */
+static void process_dom0_ioports_disable(struct domain *dom0)
+{
+    unsigned long io_from, io_to;
+    char *t, *s = opt_dom0_ioports_disable;
+    const char *u;
+
+    if ( *s == '\0' )
+        return;
+
+    while ( (t = strsep(&s, ",")) != NULL )
+    {
+        io_from = simple_strtoul(t, &u, 16);
+        if ( u == t )
+        {
+        parse_error:
+            printk("Invalid ioport range <%s> "
+                   "in dom0_ioports_disable, skipping\n", t);
+            continue;
+        }
+
+        if ( *u == '\0' )
+            io_to = io_from;
+        else if ( *u == '-' )
+            io_to = simple_strtoul(u + 1, &u, 16);
+        else
+            goto parse_error;
+
+        if ( (*u != '\0') || (io_to < io_from) || (io_to >= 65536) )
+            goto parse_error;
+
+        printk("Disabling dom0 access to ioport range %04lx-%04lx\n",
+            io_from, io_to);
+
+        if ( ioports_deny_access(dom0, io_from, io_to) != 0 )
+            BUG();
+    }
+}
+
+/* Set the default IO Bitmap. */
+int ioports_setup_access(struct domain *d)
+{
+    unsigned int i, offs;
+    int rc;
+
+    if ( pv_shim )
+        return 0;
+
+#ifdef CONFIG_HVM
+    d->arch.hvm.io_bitmap = _xmalloc(HVM_IOBITMAP_SIZE, PAGE_SIZE);
+    if ( d->arch.hvm.io_bitmap == NULL )
+        return -ENOMEM;
+
+    memset(d->arch.hvm.io_bitmap, ~0, HVM_IOBITMAP_SIZE);
+
+    if ( !is_hardware_domain(d) )
+    {
+        /*
+         * Allow direct access to the PC debug ports 0x80 and 0xed (they are
+         * often used for I/O delays, but the vmexits simply slow things down).
+         */
+        if ( hvm_port80_allowed )
+            __clear_bit(0x80, d->arch.hvm.io_bitmap);
+
+        __clear_bit(0xed, d->arch.hvm.io_bitmap);
+
+        return 0;
+    }
+#endif
+
+    /* The hardware domain is initially permitted full I/O capabilities. */
+    rc = ioports_permit_access(d, 0, 0xFFFF);
+
+    /* Modify I/O port access permissions. */
+
+    for ( offs = 0, i = ISOLATE_LSB(i8259A_alias_mask) ?: 2;
+          offs <= i8259A_alias_mask; offs += i )
+    {
+        if ( offs & ~i8259A_alias_mask )
+            continue;
+        /* Master Interrupt Controller (PIC). */
+        rc |= ioports_deny_access(d, 0x20 + offs, 0x21 + offs);
+        /* Slave Interrupt Controller (PIC). */
+        rc |= ioports_deny_access(d, 0xA0 + offs, 0xA1 + offs);
+    }
+
+    /* ELCR of both PICs. */
+    rc |= ioports_deny_access(d, 0x4D0, 0x4D1);
+
+    /* Interval Timer (PIT). */
+    for ( offs = 0, i = ISOLATE_LSB(pit_alias_mask) ?: 4;
+          offs <= pit_alias_mask; offs += i )
+        if ( !(offs & ~pit_alias_mask) )
+            rc |= ioports_deny_access(d, PIT_CH0 + offs, PIT_MODE + offs);
+
+    /* PIT Channel 2 / PC Speaker Control. */
+    rc |= ioports_deny_access(d, 0x61, 0x61);
+
+    /* INIT# and alternative A20M# control. */
+    rc |= ioports_deny_access(d, 0x92, 0x92);
+
+    /* IGNNE# control. */
+    rc |= ioports_deny_access(d, 0xF0, 0xF0);
+
+    /* ACPI PM Timer. */
+    if ( pmtmr_ioport )
+        rc |= ioports_deny_access(d, pmtmr_ioport, pmtmr_ioport + 3);
+
+    /* Reset control. */
+    rc |= ioports_deny_access(d, 0xCF9, 0xCF9);
+
+    /* PCI configuration space (NB. 0xCF8 has special treatment). */
+    rc |= ioports_deny_access(d, 0xCFC, 0xCFF);
+
+#ifdef CONFIG_HVM
+    if ( is_hvm_domain(d) )
+    {
+        /* ISA DMA controller, channels 0-3 (incl possible aliases). */
+        rc |= ioports_deny_access(d, 0x00, 0x1F);
+        /* ISA DMA controller, page registers (incl various reserved ones). */
+        rc |= ioports_deny_access(d, 0x80 + !!hvm_port80_allowed, 0x8F);
+        /* ISA DMA controller, channels 4-7 (incl usual aliases). */
+        rc |= ioports_deny_access(d, 0xC0, 0xDF);
+
+        /* HVM debug console IO port. */
+        rc |= ioports_deny_access(d, XEN_HVM_DEBUGCONS_IOPORT,
+                                  XEN_HVM_DEBUGCONS_IOPORT);
+        if ( amd_acpi_c1e_quirk )
+            rc |= ioports_deny_access(d, acpi_smi_cmd, acpi_smi_cmd);
+    }
+#endif
+
+    /* Command-line I/O ranges. */
+    process_dom0_ioports_disable(d);
+
+    return rc;
+}
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 21158ce1812e..2b8b4d869ee7 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -17,6 +17,7 @@
 #include <asm/bootinfo.h>
 #include <asm/bzimage.h>
 #include <asm/dom0_build.h>
+#include <asm/iocap.h>
 #include <asm/guest.h>
 #include <asm/page.h>
 #include <asm/pv/mm.h>
@@ -1033,6 +1034,9 @@ static int __init dom0_construct(const struct boot_domain *bd)
     if ( test_bit(XENFEAT_supervisor_mode_kernel, parms.f_required) )
         panic("Dom0 requires supervisor-mode execution\n");
 
+    rc = ioports_setup_access(d);
+    BUG_ON(rc != 0);
+
     rc = dom0_setup_permissions(d);
     BUG_ON(rc != 0);
 
diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index a4fa3a9be713..7c4affe98533 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -792,9 +792,20 @@ static int ns16x50_init(void *arg)
     struct vuart_ns16x50 *vdev = arg;
     const struct vuart_info *info = vdev->info;
     struct domain *d = vdev->owner;
+    int rc;
 
     ASSERT(vdev);
 
+    /* Disallow sharing physical I/O port */
+    rc = ioports_deny_access(d, info->base_addr,
+                             info->base_addr + info->size - 1);
+    if ( rc )
+    {
+        ns16x50_err(info, " virtual I/O port range [0x%04lx..0x%04lx]: conflict w/ physical range\n",
+                    info->base_addr, info->base_addr + info->size - 1);
+        return rc;
+    }
+
     /* NB: report 115200 baud rate. */
     vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & 0xff;
     vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & 0xff;
-- 
2.51.0


