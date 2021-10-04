Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69BE420A6A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 13:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201323.355795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMXr-00034A-C5; Mon, 04 Oct 2021 11:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201323.355795; Mon, 04 Oct 2021 11:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMXr-00031B-7P; Mon, 04 Oct 2021 11:54:11 +0000
Received: by outflank-mailman (input) for mailman id 201323;
 Mon, 04 Oct 2021 11:54:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJPG=OY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mXMXp-0002zQ-VJ
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 11:54:09 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c877973e-2509-11ec-beab-12813bfff9fa;
 Mon, 04 Oct 2021 11:54:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C24AC1FB;
 Mon,  4 Oct 2021 04:54:08 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1CFB3F70D;
 Mon,  4 Oct 2021 04:54:07 -0700 (PDT)
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
X-Inumbo-ID: c877973e-2509-11ec-beab-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 05/14] xen/arm: Add support for PCI init to initialize the PCI driver.
Date: Mon,  4 Oct 2021 12:52:00 +0100
Message-Id: <ad94a4a8ed1cf313a97baecd2bfad108821416bf.1633340795.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633340795.git.rahul.singh@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_init(..) will be called during xen startup to initialize and probe
the PCI host-bridge driver.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Change in v4:
- Added Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
- Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Change in v3:
- Some nit for device_init(..) return logic
- Remove inline from acpi_pci_init(..)
- Modify return value for apci_pci_init(..) to return -EOPNOTSUPP
Change in v2:
- ACPI init function to return int
- pci_segments_init() called before dt/acpi init
---
---
 xen/arch/arm/pci/pci.c       | 51 ++++++++++++++++++++++++++++++++++++
 xen/include/asm-arm/device.h |  1 +
 2 files changed, 52 insertions(+)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index a7a7bc3213..e359bab9ea 100644
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
@@ -22,6 +26,53 @@ int arch_pci_clean_pirqs(struct domain *d)
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
+        /*
+         * Ignore the following error codes:
+         *   - EBADF: Indicate the current device is not a pci device.
+         *   - ENODEV: The pci device is not present or cannot be used by
+         *     Xen.
+         */
+        if( !rc || rc == -EBADF || rc == -ENODEV )
+            continue;
+
+        return rc;
+    }
+
+    return 0;
+}
+
+#ifdef CONFIG_ACPI
+static int __init acpi_pci_init(void)
+{
+    printk(XENLOG_ERR "ACPI pci init not supported \n");
+    return -EOPNOTSUPP;
+}
+#else
+static int __init acpi_pci_init(void)
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
2.25.1


