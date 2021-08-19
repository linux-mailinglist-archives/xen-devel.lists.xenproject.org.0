Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236163F18C3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168643.307907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgpB-0006Do-6c; Thu, 19 Aug 2021 12:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168643.307907; Thu, 19 Aug 2021 12:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgpB-0006Bu-2v; Thu, 19 Aug 2021 12:07:09 +0000
Received: by outflank-mailman (input) for mailman id 168643;
 Thu, 19 Aug 2021 12:07:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKsV=NK=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mGgp9-0006AQ-IC
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:07:07 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f0161eb3-35f0-4f08-9ae0-feff75077d1e;
 Thu, 19 Aug 2021 12:07:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD04C31B;
 Thu, 19 Aug 2021 05:07:05 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8F533F70D;
 Thu, 19 Aug 2021 05:07:04 -0700 (PDT)
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
X-Inumbo-ID: f0161eb3-35f0-4f08-9ae0-feff75077d1e
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 07/14] xen/arm: Add support for Xilinx ZynqMP PCI host controller
Date: Thu, 19 Aug 2021 13:02:47 +0100
Message-Id: <a3318d9459ace64224a14e4424eef657e2ed5b69.1629366665.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add support for Xilinx ZynqMP PCI host controller to map the PCI config
space to the XEN memory.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/pci/Makefile          |  1 +
 xen/arch/arm/pci/pci-host-zynqmp.c | 59 ++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)
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
index 0000000000..fe103e3855
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -0,0 +1,59 @@
+/*
+ * Copyright (C) 2020-2021 EPAM Systems
+ *
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ * Copyright (C) 2014 ARM Limited Will Deacon <will.deacon@arm.com>
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
+static const struct dt_device_match gen_pci_dt_match[] = {
+    { .compatible = "xlnx,nwl-pcie-2.11",
+      .data =       &pci_generic_ecam_ops },
+    { },
+};
+
+static int gen_pci_dt_init(struct dt_device_node *dev, const void *data)
+{
+    const struct dt_device_match *of_id;
+    const struct pci_ecam_ops *ops;
+
+    of_id = dt_match_node(gen_pci_dt_match, dev->dev.of_node);
+    ops = (struct pci_ecam_ops *) of_id->data;
+
+    printk(XENLOG_INFO "Found PCI host bridge %s compatible:%s \n",
+            dt_node_full_name(dev), of_id->compatible);
+
+    return pci_host_common_probe(dev, ops, 2);
+}
+
+DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
+.dt_match = gen_pci_dt_match,
+.init = gen_pci_dt_init,
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


