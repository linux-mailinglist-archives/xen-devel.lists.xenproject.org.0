Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52968420A68
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 13:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201310.355772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMXG-0001nW-Q0; Mon, 04 Oct 2021 11:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201310.355772; Mon, 04 Oct 2021 11:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMXG-0001lh-MV; Mon, 04 Oct 2021 11:53:34 +0000
Received: by outflank-mailman (input) for mailman id 201310;
 Mon, 04 Oct 2021 11:53:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJPG=OY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mXMXE-0001hd-RK
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 11:53:32 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b23755fe-2509-11ec-beab-12813bfff9fa;
 Mon, 04 Oct 2021 11:53:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D27B1FB;
 Mon,  4 Oct 2021 04:53:31 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C8A23F70D;
 Mon,  4 Oct 2021 04:53:29 -0700 (PDT)
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
X-Inumbo-ID: b23755fe-2509-11ec-beab-12813bfff9fa
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
Subject: [PATCH v4 03/14] xen/arm: Add PHYSDEVOP_pci_device_(*add/remove) support for ARM
Date: Mon,  4 Oct 2021 12:51:58 +0100
Message-Id: <99ee039a6cdd9ac7d54f1f01649d1dd3eeea3763.1633340795.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633340795.git.rahul.singh@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hardware domain is in charge of doing the PCI enumeration and will
discover the PCI devices and then will communicate to XEN via hyper
call PHYSDEVOP_pci_device_add(..) to add the PCI devices in XEN.

Also implement PHYSDEVOP_pci_device_remove(..) to remove the PCI device.

As most of the code for PHYSDEVOP_pci_device_* is the same between x86
and ARM, move the code to a common file to avoid duplication.

There are other PHYSDEVOP_pci_device_* operations to add PCI devices.
Currently implemented PHYSDEVOP_pci_device_remove(..) and
PHYSDEVOP_pci_device_add(..) only as those are minimum required to
support PCI passthrough on ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v4:
- Move file commom/physdev.c to drivers/pci/physdev.c
- minor comments.
Change in v3: Fixed minor comment.
Change in v2:
- Add support for PHYSDEVOP_pci_device_remove()
- Move code to common code
---
---
 xen/arch/arm/physdev.c        |  5 +--
 xen/arch/x86/physdev.c        | 52 +----------------------
 xen/arch/x86/x86_64/physdev.c |  2 +-
 xen/drivers/pci/Makefile      |  1 +
 xen/drivers/pci/physdev.c     | 80 +++++++++++++++++++++++++++++++++++
 xen/include/public/arch-arm.h |  4 +-
 xen/include/xen/hypercall.h   | 11 +++++
 7 files changed, 100 insertions(+), 55 deletions(-)
 create mode 100644 xen/drivers/pci/physdev.c

diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
index e91355fe22..d766978629 100644
--- a/xen/arch/arm/physdev.c
+++ b/xen/arch/arm/physdev.c
@@ -8,13 +8,12 @@
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
-#include <asm/hypercall.h>
+#include <xen/hypercall.h>
 
 
 int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
-    return -ENOSYS;
+    return pci_physdev_op(cmd, arg);
 }
 
 /*
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 23465bcd00..ea38be8b79 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -12,7 +12,7 @@
 #include <asm/io_apic.h>
 #include <asm/msi.h>
 #include <asm/hvm/irq.h>
-#include <asm/hypercall.h>
+#include <xen/hypercall.h>
 #include <public/xen.h>
 #include <public/physdev.h>
 #include <xsm/xsm.h>
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
@@ -663,7 +615,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     }
 
     default:
-        ret = -ENOSYS;
+        ret = pci_physdev_op(cmd, arg);
         break;
     }
 
diff --git a/xen/arch/x86/x86_64/physdev.c b/xen/arch/x86/x86_64/physdev.c
index 0a50cbd4d8..e3cbd5ebcb 100644
--- a/xen/arch/x86/x86_64/physdev.c
+++ b/xen/arch/x86/x86_64/physdev.c
@@ -9,7 +9,7 @@ EMIT_FILE;
 #include <compat/xen.h>
 #include <compat/event_channel.h>
 #include <compat/physdev.h>
-#include <asm/hypercall.h>
+#include <xen/hypercall.h>
 
 #define do_physdev_op compat_physdev_op
 
diff --git a/xen/drivers/pci/Makefile b/xen/drivers/pci/Makefile
index a98035df4c..972c923db0 100644
--- a/xen/drivers/pci/Makefile
+++ b/xen/drivers/pci/Makefile
@@ -1 +1,2 @@
 obj-y += pci.o
+obj-y += physdev.o
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
new file mode 100644
index 0000000000..4f3e1a96c0
--- /dev/null
+++ b/xen/drivers/pci/physdev.c
@@ -0,0 +1,80 @@
+
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
+#include <xen/init.h>
+
+#ifndef COMPAT
+typedef long ret_t;
+#endif
+
+ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    ret_t ret;
+
+    switch ( cmd )
+    {
+    case PHYSDEVOP_pci_device_add: {
+        struct physdev_pci_device_add add;
+        struct pci_dev_info pdev_info;
+        nodeid_t node = NUMA_NO_NODE;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&add, arg, 1) != 0 )
+            break;
+
+        pdev_info.is_extfn = (add.flags & XEN_PCI_DEV_EXTFN);
+        if ( add.flags & XEN_PCI_DEV_VIRTFN )
+        {
+            pdev_info.is_virtfn = true;
+            pdev_info.physfn.bus = add.physfn.bus;
+            pdev_info.physfn.devfn = add.physfn.devfn;
+        }
+        else
+            pdev_info.is_virtfn = false;
+
+#ifdef CONFIG_NUMA
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
+#endif
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
+
+    default:
+        ret = -ENOSYS;
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
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 6b5a5f818a..d46c61fca9 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -107,7 +107,9 @@
  *   All generic sub-operations
  *
  *  HYPERVISOR_physdev_op
- *   No sub-operations are currenty supported
+ *   Exactly these sub-operations are supported:
+ *   PHYSDEVOP_pci_device_add
+ *   PHYSDEVOP_pci_device_remove
  *
  *  HYPERVISOR_sysctl
  *   All generic sub-operations, with the exception of:
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 3771487a30..7096cc4fe4 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -45,6 +45,17 @@ extern long
 do_platform_op(
     XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op);
 
+#ifdef CONFIG_HAS_PCI
+extern long
+pci_physdev_op(
+    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
+#else
+static inline long pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
+    return -ENOSYS;
+}
+#endif
 /*
  * To allow safe resume of do_memory_op() after preemption, we need to know
  * at what point in the page list to resume. For this purpose I steal the
-- 
2.25.1


