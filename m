Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969514244F3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 19:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202989.358033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAvN-0004zh-0i; Wed, 06 Oct 2021 17:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202989.358033; Wed, 06 Oct 2021 17:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAvM-0004wh-TF; Wed, 06 Oct 2021 17:41:48 +0000
Received: by outflank-mailman (input) for mailman id 202989;
 Wed, 06 Oct 2021 17:41:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mYAvL-0004w1-R7
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 17:41:47 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ad59c5ca-26cc-11ec-bf8b-12813bfff9fa;
 Wed, 06 Oct 2021 17:41:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30DD1113E;
 Wed,  6 Oct 2021 10:41:46 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81D523F70D;
 Wed,  6 Oct 2021 10:41:44 -0700 (PDT)
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
X-Inumbo-ID: ad59c5ca-26cc-11ec-bf8b-12813bfff9fa
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
Subject: [PATCH v5 03/11] xen/arm: Add cmdline boot option "pci-passthrough = <boolean>"
Date: Wed,  6 Oct 2021 18:40:29 +0100
Message-Id: <e7d91ded71816d07f559b98027e5be1ff172dcab.1633540842.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633540842.git.rahul.singh@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add cmdline boot option "pci-passthrough = = <boolean>" to enable or
disable the PCI passthrough support on ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Change in v5: none
Change in v4:
- Fixe minor comments
- Added Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
- Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Change in v3:
- Remove "define pci_passthrough_enabled (false)"
- Fixed coding style and minor comment
Change in v2:
- Add option in xen-command-line.pandoc
- Change pci option to pci-passthrough
- modify option from custom_param to boolean param
---
---
 docs/misc/xen-command-line.pandoc |  7 +++++++
 xen/arch/arm/pci/pci.c            | 12 ++++++++++++
 xen/drivers/pci/physdev.c         |  6 ++++++
 xen/include/asm-arm/pci.h         | 11 +++++++++++
 xen/include/asm-x86/pci.h         |  6 ++++++
 5 files changed, 42 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 5cae4adc58..b1f7978aa4 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1819,6 +1819,13 @@ All numbers specified must be hexadecimal ones.
 
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
index e359bab9ea..73540045d1 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -16,6 +16,7 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/param.h>
 #include <xen/pci.h>
 
 /*
@@ -62,8 +63,19 @@ static int __init acpi_pci_init(void)
 }
 #endif
 
+/* By default pci passthrough is disabled. */
+bool __read_mostly pci_passthrough_enabled;
+boolean_param("pci-passthrough", pci_passthrough_enabled);
+
 static int __init pci_init(void)
 {
+    /*
+     * Enable PCI passthrough when has been enabled explicitly
+     * (pci-passthrough=on).
+     */
+    if ( !pci_passthrough_enabled )
+        return 0;
+
     pci_segments_init();
 
     if ( acpi_disabled )
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 4f3e1a96c0..42db3e6d13 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -18,6 +18,9 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct pci_dev_info pdev_info;
         nodeid_t node = NUMA_NO_NODE;
 
+        if ( !is_pci_passthrough_enabled() )
+            return -EOPNOTSUPP;
+
         ret = -EFAULT;
         if ( copy_from_guest(&add, arg, 1) != 0 )
             break;
@@ -53,6 +56,9 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_device_remove: {
         struct physdev_pci_device dev;
 
+        if ( !is_pci_passthrough_enabled() )
+            return -EOPNOTSUPP;
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
index cc05045e9c..e076951032 100644
--- a/xen/include/asm-x86/pci.h
+++ b/xen/include/asm-x86/pci.h
@@ -32,4 +32,10 @@ bool_t pci_ro_mmcfg_decode(unsigned long mfn, unsigned int *seg,
 extern int pci_mmcfg_config_num;
 extern struct acpi_mcfg_allocation *pci_mmcfg_config;
 
+/* Unlike ARM, PCI passthrough is always enabled for x86. */
+static always_inline bool is_pci_passthrough_enabled(void)
+{
+    return true;
+}
+
 #endif /* __X86_PCI_H__ */
-- 
2.25.1


