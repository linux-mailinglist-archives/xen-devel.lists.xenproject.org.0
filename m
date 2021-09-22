Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483334147F4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 13:39:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192581.343094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0aT-0001Br-B4; Wed, 22 Sep 2021 11:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192581.343094; Wed, 22 Sep 2021 11:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0aT-00019R-84; Wed, 22 Sep 2021 11:38:53 +0000
Received: by outflank-mailman (input) for mailman id 192581;
 Wed, 22 Sep 2021 11:38:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzcW=OM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mT0aR-000197-LW
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:38:51 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a836ae52-1b99-11ec-b970-12813bfff9fa;
 Wed, 22 Sep 2021 11:38:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E0A911B3;
 Wed, 22 Sep 2021 04:38:50 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DFC93F719;
 Wed, 22 Sep 2021 04:38:49 -0700 (PDT)
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
X-Inumbo-ID: a836ae52-1b99-11ec-b970-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	andre.przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 09/17] xen/arm: Add support for PCI init to initialize the PCI driver.
Date: Wed, 22 Sep 2021 12:34:55 +0100
Message-Id: <000832623dc7fb429db4b4517583f16affdba35b.1632307952.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>

pci_init(..) will be called during xen startup to initialize and probe
the PCI host-bridge driver.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v2:
- ACPI init function to return int
- pci_segments_init() called before dt/acpi init
---
 xen/arch/arm/pci/pci.c       | 54 ++++++++++++++++++++++++++++++++++++
 xen/include/asm-arm/device.h |  1 +
 2 files changed, 55 insertions(+)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index a7a7bc3213..71fa532842 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -12,6 +12,10 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/acpi.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/init.h>
 #include <xen/pci.h>
 
 /*
@@ -22,6 +26,56 @@ int arch_pci_clean_pirqs(struct domain *d)
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
+static int __init acpi_pci_init(void)
+{
+    printk(XENLOG_ERR "ACPI pci init not supported \n");
+    return 0;
+}
+#else
+static inline int __init acpi_pci_init(void)
+{
+    return -EINVAL;
+}
+#endif
+
+static int __init pci_init(void)
+{
+    pci_segments_init();
+
+    if ( acpi_disabled )
+        return dt_pci_init();
+    else
+        return acpi_pci_init();
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


