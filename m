Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DA03F18BD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168621.307863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgo1-0003yJ-TV; Thu, 19 Aug 2021 12:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168621.307863; Thu, 19 Aug 2021 12:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgo1-0003us-QI; Thu, 19 Aug 2021 12:05:57 +0000
Received: by outflank-mailman (input) for mailman id 168621;
 Thu, 19 Aug 2021 12:05:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKsV=NK=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mGgo0-0003uH-55
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:05:56 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ce6fb9f2-00e5-11ec-a5f6-12813bfff9fa;
 Thu, 19 Aug 2021 12:05:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10B9531B;
 Thu, 19 Aug 2021 05:05:55 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 280E03F70D;
 Thu, 19 Aug 2021 05:05:54 -0700 (PDT)
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
X-Inumbo-ID: ce6fb9f2-00e5-11ec-a5f6-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 04/14] xen/arm: Add support for PCI init to initialize the PCI driver.
Date: Thu, 19 Aug 2021 13:02:44 +0100
Message-Id: <999887f9b4b2ea06ae99e1e003f9e43aa272a19c.1629366665.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>

pci_init(..) will be called during xen startup to initialize and probe
the PCI host-bridge driver.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/pci/pci.c       | 54 ++++++++++++++++++++++++++++++++++++
 xen/include/asm-arm/device.h |  1 +
 2 files changed, 55 insertions(+)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index dc55d23778..d1c9cf997d 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -14,13 +14,67 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/acpi.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/init.h>
 #include <xen/pci.h>
+#include <xen/param.h>
 
 int arch_pci_clean_pirqs(struct domain *d)
 {
     return 0;
 }
 
+static int __init dt_pci_init(void)
+{
+    struct dt_device_node *np;
+    int rc;
+
+    dt_for_each_device_node(dt_host, np)
+    {
+        rc = device_init(np, DEVICE_PCI, NULL);
+        if( !rc )
+            continue;
+        /*
+         * Ignore the following error codes:
+         *   - EBADF: Indicate the current is not an pci
+         *   - ENODEV: The pci device is not present or cannot be used by
+         *     Xen.
+         */
+        else if ( rc != -EBADF && rc != -ENODEV )
+        {
+            printk(XENLOG_ERR "No driver found in XEN or driver init error.\n");
+            return rc;
+        }
+    }
+
+    return 0;
+}
+
+#ifdef CONFIG_ACPI
+static void __init acpi_pci_init(void)
+{
+    printk(XENLOG_ERR "ACPI pci init not supported \n");
+    return;
+}
+#else
+static inline void __init acpi_pci_init(void) { }
+#endif
+
+static int __init pci_init(void)
+{
+    if ( acpi_disabled )
+        dt_pci_init();
+    else
+        acpi_pci_init();
+
+    pci_segments_init();
+
+    return 0;
+}
+__initcall(pci_init);
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
index ee7cff2d44..5ecd5e7bd1 100644
--- a/xen/include/asm-arm/device.h
+++ b/xen/include/asm-arm/device.h
@@ -34,6 +34,7 @@ enum device_class
     DEVICE_SERIAL,
     DEVICE_IOMMU,
     DEVICE_GIC,
+    DEVICE_PCI,
     /* Use for error */
     DEVICE_UNKNOWN,
 };
-- 
2.17.1


