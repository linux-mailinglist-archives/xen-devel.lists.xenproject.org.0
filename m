Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4817341B602
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 20:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198278.351687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHkl-0004lF-0x; Tue, 28 Sep 2021 18:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198278.351687; Tue, 28 Sep 2021 18:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHkk-0004j2-TO; Tue, 28 Sep 2021 18:22:54 +0000
Received: by outflank-mailman (input) for mailman id 198278;
 Tue, 28 Sep 2021 18:22:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iZ8=OS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mVHkj-0004g0-Eq
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 18:22:53 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8c62079f-236d-49c5-9a98-bd6b520a552e;
 Tue, 28 Sep 2021 18:22:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0810B6D;
 Tue, 28 Sep 2021 11:22:52 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1B873F793;
 Tue, 28 Sep 2021 11:22:50 -0700 (PDT)
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
X-Inumbo-ID: 8c62079f-236d-49c5-9a98-bd6b520a552e
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 12/17] xen/arm: Add support for Xilinx ZynqMP PCI host controller
Date: Tue, 28 Sep 2021 19:18:21 +0100
Message-Id: <c40a520d289799e52234fb1865e7f3ef1fd27431.1632847120.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632847120.git.rahul.singh@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add support for Xilinx ZynqMP PCI host controller to map the PCI config
space to the XEN memory.

Patch helps to understand how the generic infrastructure for PCI
host-bridge discovery will be used for future references.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Change in v3:
- nwl_cfg_reg_index(..) as static function
- Add support for pci_host_generic_probe() 
Change in v2:
- Add more info in commit msg
---
 xen/arch/arm/pci/Makefile          |  1 +
 xen/arch/arm/pci/pci-host-zynqmp.c | 63 ++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 xen/arch/arm/pci/pci-host-zynqmp.c

diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
index 6f32fbbe67..1d045ade01 100644
--- a/xen/arch/arm/pci/Makefile
+++ b/xen/arch/arm/pci/Makefile
@@ -3,3 +3,4 @@ obj-y += pci-access.o
 obj-y += pci-host-generic.o
 obj-y += pci-host-common.o
 obj-y += ecam.o
+obj-y += pci-host-zynqmp.o
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
new file mode 100644
index 0000000000..6ccbfd15c9
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -0,0 +1,63 @@
+/*
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <asm/device.h>
+#include <xen/pci.h>
+#include <asm/pci.h>
+
+static int nwl_cfg_reg_index(struct dt_device_node *np)
+{
+    return dt_property_match_string(np, "reg-names", "cfg");
+}
+
+/* ECAM ops */
+const struct pci_ecam_ops nwl_pcie_ops = {
+    .bus_shift  = 20,
+    .cfg_reg_index = nwl_cfg_reg_index,
+    .pci_ops    = {
+        .map_bus                = pci_ecam_map_bus,
+        .read                   = pci_generic_config_read,
+        .write                  = pci_generic_config_write,
+    }
+};
+
+static const struct dt_device_match nwl_pcie_dt_match[] = {
+    { .compatible = "xlnx,nwl-pcie-2.11" },
+    { },
+};
+
+static int pci_host_generic_probe(struct dt_device_node *dev,
+                                  const void *data)
+{
+    return pci_host_common_probe(dev, &nwl_pcie_ops);
+}
+
+DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
+.dt_match = nwl_pcie_dt_match,
+.init = pci_host_generic_probe,
+DT_DEVICE_END
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
-- 
2.17.1


