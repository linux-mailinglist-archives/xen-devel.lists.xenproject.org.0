Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7279E420A6F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 13:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201349.355828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMZ2-0004pd-Ex; Mon, 04 Oct 2021 11:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201349.355828; Mon, 04 Oct 2021 11:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMZ2-0004nG-B0; Mon, 04 Oct 2021 11:55:24 +0000
Received: by outflank-mailman (input) for mailman id 201349;
 Mon, 04 Oct 2021 11:55:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJPG=OY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mXMZ1-0004iv-4U
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 11:55:23 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f371b6b8-5f2a-431f-b039-ac925266b2ff;
 Mon, 04 Oct 2021 11:55:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66BE3D6E;
 Mon,  4 Oct 2021 04:55:21 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B6F13F70D;
 Mon,  4 Oct 2021 04:55:20 -0700 (PDT)
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
X-Inumbo-ID: f371b6b8-5f2a-431f-b039-ac925266b2ff
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 08/14] xen/arm: Add support for Xilinx ZynqMP PCI host controller
Date: Mon,  4 Oct 2021 12:52:03 +0100
Message-Id: <0d4157f3446a974cc69005b9ea0d5b1716e78f41.1633340795.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633340795.git.rahul.singh@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add support for Xilinx ZynqMP PCI host controller to map the PCI config
space to the XEN memory.

Patch helps to understand how the generic infrastructure for PCI
host-bridge discovery will be used for future references.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Change in v4:
- Add __initconstrel and __init for struct and functions
- Added Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Change in v3:
- nwl_cfg_reg_index(..) as static function
- Add support for pci_host_generic_probe()
Change in v2:
- Add more info in commit msg
---
---
 xen/arch/arm/pci/Makefile          |  1 +
 xen/arch/arm/pci/pci-host-zynqmp.c | 65 ++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)
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
index 0000000000..61a9807d3d
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -0,0 +1,65 @@
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
+#include <xen/init.h>
+#include <xen/pci.h>
+#include <asm/device.h>
+#include <asm/pci.h>
+
+static int __init nwl_cfg_reg_index(struct dt_device_node *np)
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
+static const struct dt_device_match __initconstrel nwl_pcie_dt_match[] =
+{
+    { .compatible = "xlnx,nwl-pcie-2.11" },
+    { },
+};
+
+static int __init pci_host_generic_probe(struct dt_device_node *dev,
+                                         const void *data)
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
2.25.1


