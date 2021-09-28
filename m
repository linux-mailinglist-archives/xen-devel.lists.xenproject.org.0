Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B568341B5D9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 20:22:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198261.351666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHk6-0003UY-C6; Tue, 28 Sep 2021 18:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198261.351666; Tue, 28 Sep 2021 18:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHk6-0003Rf-6z; Tue, 28 Sep 2021 18:22:14 +0000
Received: by outflank-mailman (input) for mailman id 198261;
 Tue, 28 Sep 2021 18:22:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iZ8=OS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mVHk4-0003C1-W1
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 18:22:13 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fc9694f0-2088-11ec-bcc4-12813bfff9fa;
 Tue, 28 Sep 2021 18:22:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A2D26D;
 Tue, 28 Sep 2021 11:22:06 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB6093F793;
 Tue, 28 Sep 2021 11:22:04 -0700 (PDT)
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
X-Inumbo-ID: fc9694f0-2088-11ec-bcc4-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 10/17] xen/arm: Add cmdline boot option "pci-passthrough = <boolean>"
Date: Tue, 28 Sep 2021 19:18:19 +0100
Message-Id: <edd6689cc977292fa874059861474993e5819c14.1632847120.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>

Add cmdline boot option "pci-passthrough = = <boolean>" to enable or
disable the PCI passthrough support on ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v3:
- Remove "define pci_passthrough_enabled (false)"
- Fixed coding style and minor comment
Change in v2:
- Add option in xen-command-line.pandoc
- Change pci option to pci-passthrough
- modify option from custom_param to boolean param
---
 docs/misc/xen-command-line.pandoc |  7 +++++++
 xen/arch/arm/pci/pci.c            | 14 ++++++++++++++
 xen/common/physdev.c              |  6 ++++++
 xen/include/asm-arm/pci.h         | 11 +++++++++++
 xen/include/asm-x86/pci.h         |  8 ++++++++
 5 files changed, 46 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 177e656f12..c8bf96ccf8 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1808,6 +1808,13 @@ All numbers specified must be hexadecimal ones.
 
 This option can be specified more than once (up to 8 times at present).
 
+### pci-passthrough (arm)
+> `= <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable support for PCI passthrough
+
 ### pcid (x86)
 > `= <boolean> | xpti=<bool>`
 
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index e359bab9ea..84d8f0d634 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -16,6 +16,7 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/param.h>
 #include <xen/pci.h>
 
 /*
@@ -62,8 +63,21 @@ static int __init acpi_pci_init(void)
 }
 #endif
 
+/*
+ * By default pci passthrough is disabled
+ */
+bool __read_mostly pci_passthrough_enabled = false;
+boolean_param("pci-passthrough", pci_passthrough_enabled);
+
 static int __init pci_init(void)
 {
+    /*
+     * Enable PCI passthrough when has been enabled explicitly
+     * (pci-passthrough=on)
+     */
+    if ( !pci_passthrough_enabled )
+        return 0;
+
     pci_segments_init();
 
     if ( acpi_disabled )
diff --git a/xen/common/physdev.c b/xen/common/physdev.c
index 20a5530269..2d5fc886fc 100644
--- a/xen/common/physdev.c
+++ b/xen/common/physdev.c
@@ -19,6 +19,9 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct pci_dev_info pdev_info;
         nodeid_t node;
 
+        if ( !is_pci_passthrough_enabled() )
+            return -ENOSYS;
+
         ret = -EFAULT;
         if ( copy_from_guest(&add, arg, 1) != 0 )
             break;
@@ -54,6 +57,9 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_device_remove: {
         struct physdev_pci_device dev;
 
+        if ( !is_pci_passthrough_enabled() )
+            return -ENOSYS;
+
         ret = -EFAULT;
         if ( copy_from_guest(&dev, arg, 1) != 0 )
             break;
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 7dd9eb3dba..0cf849e26f 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -19,14 +19,25 @@
 
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
 
+extern bool_t pci_passthrough_enabled;
+
 /* Arch pci dev struct */
 struct arch_pci_dev {
     struct device dev;
 };
 
+static always_inline bool is_pci_passthrough_enabled(void)
+{
+    return pci_passthrough_enabled;
+}
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
 
+static always_inline bool is_pci_passthrough_enabled(void)
+{
+    return false;
+}
+
 #endif  /*!CONFIG_HAS_PCI*/
 #endif /* __ARM_PCI_H__ */
diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
index cc05045e9c..3f806ce7a8 100644
--- a/xen/include/asm-x86/pci.h
+++ b/xen/include/asm-x86/pci.h
@@ -32,4 +32,12 @@ bool_t pci_ro_mmcfg_decode(unsigned long mfn, unsigned int *seg,
 extern int pci_mmcfg_config_num;
 extern struct acpi_mcfg_allocation *pci_mmcfg_config;
 
+/*
+ * Unlike ARM, PCI passthrough is always enabled for x86.
+ */
+static always_inline bool is_pci_passthrough_enabled(void)
+{
+    return true;
+}
+
 #endif /* __X86_PCI_H__ */
-- 
2.17.1


