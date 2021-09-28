Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EE141B5CE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 20:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198223.351611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHiR-0000GT-Pa; Tue, 28 Sep 2021 18:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198223.351611; Tue, 28 Sep 2021 18:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHiR-0000Di-LT; Tue, 28 Sep 2021 18:20:31 +0000
Received: by outflank-mailman (input) for mailman id 198223;
 Tue, 28 Sep 2021 18:20:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iZ8=OS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mVHiQ-0006l6-Hr
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 18:20:30 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c076fd34-2088-11ec-bcc4-12813bfff9fa;
 Tue, 28 Sep 2021 18:20:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CAAF6D;
 Tue, 28 Sep 2021 11:20:25 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E05A63F793;
 Tue, 28 Sep 2021 11:20:23 -0700 (PDT)
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
X-Inumbo-ID: c076fd34-2088-11ec-bcc4-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 05/17] xen/arm: Add PHYSDEVOP_pci_device_* support for ARM
Date: Tue, 28 Sep 2021 19:18:14 +0100
Message-Id: <f8ac00f7d52f4853d276b4da24294fbeb3602245.1632847120.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>

Hardware domain is in charge of doing the PCI enumeration and will
discover the PCI devices and then will communicate to XEN via hyper
call PHYSDEVOP_pci_device_add(..) to add the PCI devices in XEN.

Also implement PHYSDEVOP_pci_device_remove(..) to remove the PCI device.

As most of the code for PHYSDEVOP_pci_device_* is the same between x86
and ARM, move the code to a common file to avoid duplication.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v3: Fixed minor comment.
Change in v2:
- Add support for PHYSDEVOP_pci_device_remove()
- Move code to common code
---
 xen/arch/arm/physdev.c          |  5 +-
 xen/arch/x86/physdev.c          | 50 +-------------------
 xen/arch/x86/x86_64/physdev.c   |  4 +-
 xen/common/Makefile             |  1 +
 xen/common/physdev.c            | 81 +++++++++++++++++++++++++++++++++
 xen/include/asm-arm/hypercall.h |  2 -
 xen/include/asm-arm/numa.h      |  5 ++
 xen/include/asm-x86/hypercall.h |  9 ++--
 xen/include/xen/hypercall.h     |  8 ++++
 9 files changed, 106 insertions(+), 59 deletions(-)
 create mode 100644 xen/common/physdev.c

diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
index e91355fe22..4e00b03aab 100644
--- a/xen/arch/arm/physdev.c
+++ b/xen/arch/arm/physdev.c
@@ -8,10 +8,9 @@
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
-#include <asm/hypercall.h>
+#include <xen/hypercall.h>
 
-
-int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long arch_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
     return -ENOSYS;
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 23465bcd00..c00cc99404 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -174,7 +174,7 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
 }
 #endif /* COMPAT */
 
-ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+ret_t arch_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int irq;
     ret_t ret;
@@ -480,54 +480,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
-    case PHYSDEVOP_pci_device_add: {
-        struct physdev_pci_device_add add;
-        struct pci_dev_info pdev_info;
-        nodeid_t node;
-
-        ret = -EFAULT;
-        if ( copy_from_guest(&add, arg, 1) != 0 )
-            break;
-
-        pdev_info.is_extfn = !!(add.flags & XEN_PCI_DEV_EXTFN);
-        if ( add.flags & XEN_PCI_DEV_VIRTFN )
-        {
-            pdev_info.is_virtfn = 1;
-            pdev_info.physfn.bus = add.physfn.bus;
-            pdev_info.physfn.devfn = add.physfn.devfn;
-        }
-        else
-            pdev_info.is_virtfn = 0;
-
-        if ( add.flags & XEN_PCI_DEV_PXM )
-        {
-            uint32_t pxm;
-            size_t optarr_off = offsetof(struct physdev_pci_device_add, optarr) /
-                                sizeof(add.optarr[0]);
-
-            if ( copy_from_guest_offset(&pxm, arg, optarr_off, 1) )
-                break;
-
-            node = pxm_to_node(pxm);
-        }
-        else
-            node = NUMA_NO_NODE;
-
-        ret = pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, node);
-        break;
-    }
-
-    case PHYSDEVOP_pci_device_remove: {
-        struct physdev_pci_device dev;
-
-        ret = -EFAULT;
-        if ( copy_from_guest(&dev, arg, 1) != 0 )
-            break;
-
-        ret = pci_remove_device(dev.seg, dev.bus, dev.devfn);
-        break;
-    }
-
     case PHYSDEVOP_prepare_msix:
     case PHYSDEVOP_release_msix: {
         struct physdev_pci_device dev;
diff --git a/xen/arch/x86/x86_64/physdev.c b/xen/arch/x86/x86_64/physdev.c
index 0a50cbd4d8..5f72652ff7 100644
--- a/xen/arch/x86/x86_64/physdev.c
+++ b/xen/arch/x86/x86_64/physdev.c
@@ -9,9 +9,10 @@ EMIT_FILE;
 #include <compat/xen.h>
 #include <compat/event_channel.h>
 #include <compat/physdev.h>
-#include <asm/hypercall.h>
+#include <xen/hypercall.h>
 
 #define do_physdev_op compat_physdev_op
+#define arch_physdev_op arch_compat_physdev_op
 
 #define physdev_apic               compat_physdev_apic
 #define physdev_apic_t             physdev_apic_compat_t
@@ -82,6 +83,7 @@ CHECK_physdev_pci_device
 typedef int ret_t;
 
 #include "../physdev.c"
+#include "../../../common/physdev.c"
 
 /*
  * Local variables:
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 54de70d422..bcb1c8fb03 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -29,6 +29,7 @@ obj-y += notifier.o
 obj-y += page_alloc.o
 obj-$(CONFIG_HAS_PDX) += pdx.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
+obj-y += physdev.o
 obj-y += preempt.o
 obj-y += random.o
 obj-y += rangeset.o
diff --git a/xen/common/physdev.c b/xen/common/physdev.c
new file mode 100644
index 0000000000..20a5530269
--- /dev/null
+++ b/xen/common/physdev.c
@@ -0,0 +1,81 @@
+
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
+#include <xen/init.h>
+
+#ifndef COMPAT
+typedef long ret_t;
+#endif
+
+ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    ret_t ret;
+
+    switch ( cmd )
+    {
+#ifdef CONFIG_HAS_PCI
+    case PHYSDEVOP_pci_device_add: {
+        struct physdev_pci_device_add add;
+        struct pci_dev_info pdev_info;
+        nodeid_t node;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&add, arg, 1) != 0 )
+            break;
+
+        pdev_info.is_extfn = !!(add.flags & XEN_PCI_DEV_EXTFN);
+        if ( add.flags & XEN_PCI_DEV_VIRTFN )
+        {
+            pdev_info.is_virtfn = 1;
+            pdev_info.physfn.bus = add.physfn.bus;
+            pdev_info.physfn.devfn = add.physfn.devfn;
+        }
+        else
+            pdev_info.is_virtfn = 0;
+
+        if ( add.flags & XEN_PCI_DEV_PXM )
+        {
+            uint32_t pxm;
+            size_t optarr_off = offsetof(struct physdev_pci_device_add, optarr) /
+                                sizeof(add.optarr[0]);
+
+            if ( copy_from_guest_offset(&pxm, arg, optarr_off, 1) )
+                break;
+
+            node = pxm_to_node(pxm);
+        }
+        else
+            node = NUMA_NO_NODE;
+
+        ret = pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, node);
+        break;
+    }
+
+    case PHYSDEVOP_pci_device_remove: {
+        struct physdev_pci_device dev;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&dev, arg, 1) != 0 )
+            break;
+
+        ret = pci_remove_device(dev.seg, dev.bus, dev.devfn);
+        break;
+    }
+#endif
+    default:
+        ret = arch_physdev_op(cmd, arg);
+        break;
+    }
+
+    return ret;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/asm-arm/hypercall.h b/xen/include/asm-arm/hypercall.h
index a0c5a31a2f..c6e4a04fd6 100644
--- a/xen/include/asm-arm/hypercall.h
+++ b/xen/include/asm-arm/hypercall.h
@@ -2,8 +2,6 @@
 #define __ASM_ARM_HYPERCALL_H__
 
 #include <public/domctl.h> /* for arch_do_domctl */
-int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
 long do_arm_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg);
 
 long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 31a6de4e23..dbd1c2467f 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -25,6 +25,11 @@ extern mfn_t first_valid_mfn;
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
 
+static inline nodeid_t pxm_to_node(unsigned pxm)
+{
+    return 0xff;
+}
+
 #endif /* __ARCH_ARM_NUMA_H */
 /*
  * Local variables:
diff --git a/xen/include/asm-x86/hypercall.h b/xen/include/asm-x86/hypercall.h
index 0ae3b8b043..7afba98186 100644
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -105,10 +105,6 @@ do_update_va_mapping(
     u64 val64,
     unsigned long flags);
 
-extern long
-do_physdev_op(
-    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
 extern long
 do_update_va_mapping_otherdomain(
     unsigned long va,
@@ -151,6 +147,11 @@ compat_physdev_op(
     int cmd,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
+extern int
+arch_compat_physdev_op(
+    int cmd,
+    XEN_GUEST_HANDLE_PARAM(void) arg);
+
 extern int
 arch_compat_vcpu_op(
     int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 3771487a30..5cc74f40b7 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -45,6 +45,14 @@ extern long
 do_platform_op(
     XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op);
 
+extern long
+do_physdev_op(
+    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
+
+extern long
+arch_physdev_op(
+    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
+
 /*
  * To allow safe resume of do_memory_op() after preemption, we need to know
  * at what point in the page list to resume. For this purpose I steal the
-- 
2.17.1


