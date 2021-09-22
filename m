Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0238E4147F6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 13:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192589.343106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0ay-0001o8-Kr; Wed, 22 Sep 2021 11:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192589.343106; Wed, 22 Sep 2021 11:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0ay-0001lG-HG; Wed, 22 Sep 2021 11:39:24 +0000
Received: by outflank-mailman (input) for mailman id 192589;
 Wed, 22 Sep 2021 11:39:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzcW=OM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mT0ax-0001l8-DW
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:39:23 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bb17faf8-1b99-11ec-b970-12813bfff9fa;
 Wed, 22 Sep 2021 11:39:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 421DE11B3;
 Wed, 22 Sep 2021 04:39:22 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CE9E3F719;
 Wed, 22 Sep 2021 04:39:20 -0700 (PDT)
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
X-Inumbo-ID: bb17faf8-1b99-11ec-b970-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	andre.przywara@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 10/17] xen/arm: Add cmdline boot option "pci-passthrough = <boolean>"
Date: Wed, 22 Sep 2021 12:34:56 +0100
Message-Id: <9dcb9b3b6b6923db00d6e56da26a8503d5a4855a.1632307952.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>

Add cmdline boot option "pci-passthrough = = <boolean>" to enable
disable the PCI passthrough support on ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v2:
- Add option in xen-command-line.pandoc
- Change pci option to pci-passthrough
- modify option from custom_param to boolean param
---
 docs/misc/xen-command-line.pandoc |  7 +++++++
 xen/arch/arm/pci/pci.c            | 14 ++++++++++++++
 xen/common/physdev.c              |  6 ++++++
 xen/include/asm-arm/pci.h         | 13 +++++++++++++
 xen/include/asm-x86/pci.h         |  8 ++++++++
 5 files changed, 48 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b175645fde..c867f1cf58 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1783,6 +1783,13 @@ All numbers specified must be hexadecimal ones.
 
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
index 71fa532842..fe96a9b135 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -16,6 +16,7 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/param.h>
 #include <xen/pci.h>
 
 /*
@@ -65,8 +66,21 @@ static inline int __init acpi_pci_init(void)
 }
 #endif
 
+/*
+ * By default pci passthrough is disabled
+ */
+bool_t __read_mostly pci_passthrough_enabled = 0;
+boolean_param("pci-passthrough", pci_passthrough_enabled);
+
 static int __init pci_init(void)
 {
+    /*
+     * Enable PCI passthrough when has been enabled explicitly
+     * (pci-passthrough=on)
+     */
+    if ( !pci_passthrough_enabled)
+        return 0;
+
     pci_segments_init();
 
     if ( acpi_disabled )
diff --git a/xen/common/physdev.c b/xen/common/physdev.c
index 8d44b20db8..7390d5d584 100644
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
index 7dd9eb3dba..f2f86be9bc 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -19,14 +19,27 @@
 
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
 
+#define pci_passthrough_enabled (false)
+
 struct arch_pci_dev { };
 
+static always_inline bool is_pci_passthrough_enabled(void)
+{
+    return false;
+}
+
 #endif  /*!CONFIG_HAS_PCI*/
 #endif /* __ARM_PCI_H__ */
diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
index cc05045e9c..0e160c6d01 100644
--- a/xen/include/asm-x86/pci.h
+++ b/xen/include/asm-x86/pci.h
@@ -32,4 +32,12 @@ bool_t pci_ro_mmcfg_decode(unsigned long mfn, unsigned int *seg,
 extern int pci_mmcfg_config_num;
 extern struct acpi_mcfg_allocation *pci_mmcfg_config;
 
+/*
+ * Unlike ARM, PCI passthrough always enabled for x86.
+ */
+static always_inline bool is_pci_passthrough_enabled(void)
+{
+    return true;
+}
+
 #endif /* __X86_PCI_H__ */
-- 
2.17.1


