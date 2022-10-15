Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378BB5FF888
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 07:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423255.669912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPn-0000Mb-AD; Sat, 15 Oct 2022 05:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423255.669912; Sat, 15 Oct 2022 05:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPm-000096-Rf; Sat, 15 Oct 2022 05:08:50 +0000
Received: by outflank-mailman (input) for mailman id 423255;
 Sat, 15 Oct 2022 05:08:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/I2=2Q=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ojZPj-00070V-SY
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 05:08:48 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 709c7ba9-4c47-11ed-91b4-6bf2151ebd3b;
 Sat, 15 Oct 2022 07:08:44 +0200 (CEST)
Received: from DM6PR06CA0102.namprd06.prod.outlook.com (2603:10b6:5:336::35)
 by CY8PR12MB7339.namprd12.prod.outlook.com (2603:10b6:930:51::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Sat, 15 Oct
 2022 05:08:40 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::48) by DM6PR06CA0102.outlook.office365.com
 (2603:10b6:5:336::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Sat, 15 Oct 2022 05:08:39 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 14 Oct
 2022 22:08:37 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:36 -0500
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
X-Inumbo-ID: 709c7ba9-4c47-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COgY6/WsweW7TxMKsZHUiHg1OGNGlRmXQHeJSTYnNbFvok4cpx1WgCOXqV6YqSbOBpGUELAeggzwBEsBcApdU0FO7coInlynqPrUCStNulffkHHWcjWb2ud2sQfaFgQh2k8sX0oqJc/OKcfzbWsgFzAGGxaGzYkAyYhkrvGnwc7ZAobhzlHmC2z131HsVIWSBxTBY0da6m5n+AZv1ZiX+Jpd1cLJIx2A2sDAi3NZortiVihydy9PRDzob0av+brA2NzqJPT0N3I49chaAITUgg8EEPt3yl8a6+xxCQugvHzJSoV5a2kifIroG8I1leAIVDuHSDYS+NtE5ywFsPwbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CEATXZaI6umGGfkvA0WXkPnboEbXOEtyJhSWhppcG4=;
 b=OVsgh8g2q9gPeejRSIUUQHg24dY/zvqXUnyKs0d7Pg3rrTQJydB2Q92cT1JVCvttiBJcu/BoWKPVGMq8VGn/SwOiyMfzEO5JtHEeQ0NWdLB+GObzKtHkOcvn6N9J+KOvy2qe/VR2e2d4D5YLSXm3OsfoEgVwolg/ndHQvU5Y5+Nw0w3ANg+UOeVMqO3GlEpiXnt9p8BHWuBp9rpj2G8+abmkzz3OnNbLKpoMP7Sss+w2pKQsyINuRGvzug48ngrJXvx6qwPG12QYYO072vxxdv7oXvi8c2EAQETcZaZrhaMMJxt8zU7gFYCkD/lx1mYv0ofSjxcYekDpN2BziHqZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CEATXZaI6umGGfkvA0WXkPnboEbXOEtyJhSWhppcG4=;
 b=bCLZFLrKcP3oYsZo2MTCi5uZmCIUe15AaU47ebRt5Fc/ZKuqHf3H6IGjTRHohznUWEl5rgZYXyxnoArsV4P7T/ykXkgP32+OY6aCsLYJDDLnrWlwG0djsJEyTsRnKFWkANqbf6h1+WvurLtnMoqtLHZ3BMBaJXX8qKeTKVoiAuw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <vikram.garhwal@amd.com>, <stefano.stabellini@amd.com>, Peter Maydell
	<peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Date: Fri, 14 Oct 2022 22:07:48 -0700
Message-ID: <20221015050750.4185-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221015050750.4185-1-vikram.garhwal@amd.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT042:EE_|CY8PR12MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: ef28c65d-b6c9-4dd6-c49e-08daae6b5293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cw6BE2WvYbEM/RcM4ry6VYtOSiys0o/6pDPo2n1BD6oOti2BfWPOkmmdBcc+17s08FbWM+gG2BZA7UVLP3eL7pbto5T495FSKUSRmFirh7jD6aZo0oZRZ7Zjv2qtFL9BS49G1VFL1VTPmYTWQEPR4lVNYk6hyGyYWam/epYx24k6jb6q6wK41Am6x7jKgfvenlLa/FRm4xLJUBBWlecg8yvzTY++pygppBCkhH8a8rnAKoi3R1oUYVbMsAJ/FerldKD+UOWFUaMaK2F7O0v2XedBBP0ufU4jZqMoHjSdF5t1tbDlTpYq/jtC88q5xg55U82bLANadtzcEA1wnp3hozDRP3vuBr9digsSgaPC8lXiF1aUyeBVJNV4SHjy+vdAeu3LtoFMOMMNJkYw+m8kyjNYDqJk7C6YdetPAlrxPECJog1Gcfz/DQVSBaFhs41QbWn++fiiVp3KX1x8gOccYRkpFJix/F6lc2LQQuOe5qCPcZiw4Z9U1KEWkI1r5atKJ0lLsKHnRWcDOKcByT84mdek2Xpa0ac0rsaxkDiwuROUth+Eud6co8r8/s7MSC3XXySqAvbziLbQm0yioVO+3y+tP4NvK29fnuOjP/oLQR5lBapFB2AjgrwgCntSYjZWxMk1h7eT39Jxok/xrlfsuS56Z7hItrHEJ09UABzfMt4lYkvp/DkPO21W6kteoo1fugGC0RviFxdJnJEpkEc4ZsnYKfcobYyOb2bdo5+aDpAui7ktLO5Gf3OptPxkr0rWAm5TRR4MExlrO33XVBP3GNT16wfPtpMaI07Yh2GW2kYDhMTWyJutPHA7DHoSjO8ApvrzUxyCEVTPR7Y8X4r1QQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(40460700003)(40480700001)(2616005)(2906002)(4326008)(82740400003)(86362001)(26005)(8936002)(6916009)(70206006)(1076003)(186003)(54906003)(336012)(8676002)(6666004)(5660300002)(82310400005)(478600001)(356005)(81166007)(44832011)(316002)(966005)(70586007)(36860700001)(426003)(66899015)(47076005)(41300700001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:39.5714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef28c65d-b6c9-4dd6-c49e-08daae6b5293
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7339

Add a new machine xenpv which creates a IOREQ server to register/connect with
Xen Hypervisor.

Xen IOREQ connection expect the TARGET_PAGE_SIZE to 4096, and the xenpv machine
on ARM will have no CPU definitions. We need to define TARGET_PAGE_SIZE
appropriately ourselves.

Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, adds a
TPM emulator and connects to swtpm running on host machine via chardev socket
and support TPM functionalities for a guest domain.

Extra command line for aarch64 xenpv QEMU to connect to swtpm:
    -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
    -tpmdev emulator,id=tpm0,chardev=chrtpm \

swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpms and
provides access to TPM functionality over socket, chardev and CUSE interface.
Github repo: https://github.com/stefanberger/swtpm
Example for starting swtpm on host machine:
    mkdir /tmp/vtpm2
    swtpm socket --tpmstate dir=/tmp/vtpm2 \
    --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 hw/arm/meson.build            |   2 +
 hw/arm/xen_arm.c              | 163 ++++++++++++++++++++++++++++++++++
 include/hw/arm/xen_arch_hvm.h |  12 +++
 include/hw/xen/arch_hvm.h     |   2 +
 4 files changed, 179 insertions(+)
 create mode 100644 hw/arm/xen_arm.c
 create mode 100644 include/hw/arm/xen_arch_hvm.h

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 92f9f6e000..0cae024374 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -62,5 +62,7 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c', 'smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
+arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
+arm_ss.add_all(xen_ss)
 
 hw_arch += {'arm': arm_ss}
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
new file mode 100644
index 0000000000..0b900314cc
--- /dev/null
+++ b/hw/arm/xen_arm.c
@@ -0,0 +1,163 @@
+/*
+ * QEMU ARM Xen PV Machine
+ *
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qapi/qapi-commands-migration.h"
+#include "hw/boards.h"
+#include "hw/sysbus.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/tpm_backend.h"
+#include "sysemu/sysemu.h"
+#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen-hvm-common.h"
+#include "sysemu/tpm.h"
+#include "hw/xen/arch_hvm.h"
+
+#define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpv")
+OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
+
+static MemoryListener xen_memory_listener = {
+    .region_add = xen_region_add,
+    .region_del = xen_region_del,
+    .log_start = NULL,
+    .log_stop = NULL,
+    .log_sync = NULL,
+    .log_global_start = NULL,
+    .log_global_stop = NULL,
+    .priority = 10,
+};
+
+struct XenArmState {
+    /*< private >*/
+    MachineState parent;
+
+    XenIOState *state;
+};
+
+void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
+{
+    hw_error("Invalid ioreq type 0x%x\n", req->type);
+
+    return;
+}
+
+void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
+                         bool add)
+{
+}
+
+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
+{
+}
+
+void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
+{
+}
+
+static int xen_init_ioreq(XenIOState *state, unsigned int max_cpus)
+{
+    xen_dmod = xendevicemodel_open(0, 0);
+    xen_xc = xc_interface_open(0, 0, 0);
+
+    if (xen_xc == NULL) {
+        perror("xen: can't open xen interface\n");
+        return -1;
+    }
+
+    xen_fmem = xenforeignmemory_open(0, 0);
+    if (xen_fmem == NULL) {
+        perror("xen: can't open xen fmem interface\n");
+        xc_interface_close(xen_xc);
+        return -1;
+    }
+
+    xen_register_ioreq(state, max_cpus, xen_memory_listener);
+
+    xenstore_record_dm_state(xenstore, "running");
+
+    return 0;
+}
+
+static void xen_enable_tpm(void)
+{
+/* qemu_find_tpm_be is only available when CONFIG_TPM is enabled. */
+#ifdef CONFIG_TPM
+    Error *errp = NULL;
+    DeviceState *dev;
+    SysBusDevice *busdev;
+
+    TPMBackend *be = qemu_find_tpm_be("tpm0");
+    if (be == NULL) {
+        DPRINTF("Couldn't fine the backend for tpm0\n");
+        return;
+    }
+    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
+    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
+    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(busdev, &error_fatal);
+    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
+
+    DPRINTF("Connected tpmdev at address 0x%lx\n", GUEST_TPM_BASE);
+#endif
+}
+
+static void xen_arm_init(MachineState *machine)
+{
+    XenArmState *xam = XEN_ARM(machine);
+
+    xam->state =  g_new0(XenIOState, 1);
+
+    if (xen_init_ioreq(xam->state, machine->smp.cpus)) {
+        return;
+    }
+
+    xen_enable_tpm();
+
+    return;
+}
+
+static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
+{
+
+    MachineClass *mc = MACHINE_CLASS(oc);
+    mc->desc = "Xen Para-virtualized PC";
+    mc->init = xen_arm_init;
+    mc->max_cpus = 1;
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+}
+
+static const TypeInfo xen_arm_machine_type = {
+    .name = TYPE_XEN_ARM,
+    .parent = TYPE_MACHINE,
+    .class_init = xen_arm_machine_class_init,
+    .instance_size = sizeof(XenArmState),
+};
+
+static void xen_arm_machine_register_types(void)
+{
+    type_register_static(&xen_arm_machine_type);
+}
+
+type_init(xen_arm_machine_register_types)
diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
new file mode 100644
index 0000000000..f645dfec28
--- /dev/null
+++ b/include/hw/arm/xen_arch_hvm.h
@@ -0,0 +1,12 @@
+#ifndef HW_XEN_ARCH_ARM_HVM_H
+#define HW_XEN_ARCH_ARM_HVM_H
+
+#include <xen/hvm/ioreq.h>
+void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
+void arch_xen_set_memory(XenIOState *state,
+                         MemoryRegionSection *section,
+                         bool add);
+
+#undef TARGET_PAGE_SIZE
+#define TARGET_PAGE_SIZE 4096
+#endif
diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
index 26674648d8..c7c515220d 100644
--- a/include/hw/xen/arch_hvm.h
+++ b/include/hw/xen/arch_hvm.h
@@ -1,3 +1,5 @@
 #if defined(TARGET_I386) || defined(TARGET_X86_64)
 #include "hw/i386/xen_arch_hvm.h"
+#elif defined(TARGET_ARM) || defined(TARGET_ARM_64)
+#include "hw/arm/xen_arch_hvm.h"
 #endif
-- 
2.17.0


