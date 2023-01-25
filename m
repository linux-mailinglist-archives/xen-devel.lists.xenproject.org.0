Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC41D67ACBA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 09:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483901.750347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbQJ-0002ZB-RK; Wed, 25 Jan 2023 08:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483901.750347; Wed, 25 Jan 2023 08:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbQJ-0002V3-L2; Wed, 25 Jan 2023 08:46:27 +0000
Received: by outflank-mailman (input) for mailman id 483901;
 Wed, 25 Jan 2023 08:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKbQI-0001qZ-FL
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:46:26 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfc1936e-9c8c-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 09:46:25 +0100 (CET)
Received: from DS7PR03CA0175.namprd03.prod.outlook.com (2603:10b6:5:3b2::30)
 by SA3PR12MB7976.namprd12.prod.outlook.com (2603:10b6:806:312::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:45:01 +0000
Received: from DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::f7) by DS7PR03CA0175.outlook.office365.com
 (2603:10b6:5:3b2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 08:45:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT013.mail.protection.outlook.com (10.13.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 08:45:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:45:00 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:44:59 -0600
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
X-Inumbo-ID: bfc1936e-9c8c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMvtlcHaVxs1OkH9HYg0x6WAgGAscarLNNSQ+XJhZ4Yo2cgqiK6N3JHglsp3FV9JR/is43x/mYUb8H3y/0uXOWNO61tfQUatswOkAw2yQ/EMH3kCJ9DzcW+0E7kktkGpCbHyJjdIL+t7dwmfU1ScY5JFWmbm5n7ZE4YtsTjzwnryOgTIYJ/9TeH87lXZryeJiGkUBEsoTr7W8eMloAa7aV2DY88J+JuugAUSLZyQCOLj5WcElVTCQyPc638yuOhDSFiRJg1gZdtVZbeuW7m+ATVuMaP1pTzFLHQQOlnKjB+F30qr+pYibnIdQr13aZ20yqnlzttfhzQdXBu+S6l20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+E4BfA2jNdGJLu/KOY6Tiy/3hPOgzwaMVA9okKy1Xk=;
 b=Vws0NdyaoU4swVXjcXEXBKoqfzhUcIoKqjZLHX05/Wq3uv6bP6NUjCXnUGHgqtNFwOUAbTg1AA41P/TiISP63MdXOg9dpz5W38pxocMGULKZ3KOzF2JptHcHwff+yX8pCIVHmcotR/arA1e2V2KKAPpPmbsrq312mDRNFfLm+g8AIZiiHQ4RaAYKAwU+zW7C4cEW53uKYcv8PBNXrufwkVqJ1urS5tNwxJDyY8PAWNmRHqE6UHR7nuApj+0YrSAjDPuK76nDs4Ev00A2KoFycNLnaDQjFJiP/smc1aSruUCH+t8ylZK8TY8A98GlBQ1+NYThiL6W3JnphMSWXUFycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+E4BfA2jNdGJLu/KOY6Tiy/3hPOgzwaMVA9okKy1Xk=;
 b=XyhZ73Tckdb6Rhe6SP7Sy5L3mG7G0MIaB7mEMdx1Nka03sDkmgEyL5TsLXBhioupwIma5VXN6kTpj4pYOhXAhZWJpAGsq289p6fqHmnrMhw0YMLmqND0huXFhAN61cpTOv6s3O23V1WlbnZyj1Zlu5hSJ6ryHTSfwMmMDnIA+7s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: [QEMU][PATCH v3 09/10] hw/arm: introduce xenpvh machine
Date: Wed, 25 Jan 2023 00:43:55 -0800
Message-ID: <20230125084356.6684-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125084356.6684-1-vikram.garhwal@amd.com>
References: <20230125084356.6684-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT013:EE_|SA3PR12MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f51690-a587-4396-ff9f-08dafeb07252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iukmimeQS2l48JWPADIxQ1FDxcgtBJAgIQfvh96HLpiu4+SXCUIyKZA552IXRFsygOZAqDtUospneXTUDpTz4guTURruQGfsXfGQqP/FTugEB+pC6WR8vDSzUSn+BdVxtMxYUsbDL2uxfX8YJc+VcFaZhXgLuQeth6amTbTIzlDFi2GsPmmKGYuBwJVEjDztA2xW/dZbcK6FqrKCTwHsr/YNmwEq7JczFTL6iTFQIDXhz8EjR4tALTJTyq00R9OCnsCf9EYHS7lZBAWUt3MjDlbHHNCKwCIp66zEtMWpu6PJQkv4kIkqdli7gb21oz4YPJTPBai9IwMhAYvNJdovF38WGPCfBzdU0XcqT7e6Uh2VSV0zWq38iCx1xXq0Dp/FPRkSaWsf+XAnQ/SZnMRLuVFp6c5zxSNcXE9Qm5iQeP+0hm6eeUHQz3mfQ29OY9IR0ke0LycBNeK5zL8XSP0+mqiQPbH3AN3rn7lfgTeyWYbI7/BeSJSru2LTjrAndeiQlbiQ0yQPN1SDjfWH46gd6lhsX9XbSY5gReLwFaEfm9KvTN2YyviGbU6mabnr0AWAFhssOeOZuUjez4f62TvYnZfJzuJVhFO2Tb2DLPrvXc4b/CRPPuroq7OMaaQ8hDdlvfOaHgqMdHJKonHNJdYJr+hkDjatEFUjqNqxmrURtLWhQRI8z/+k3WXg1R1J4N6xy6KlFGxpoftNt0VLp82fBIqoEh/raFZNN5aA+EJcCmZa6Ia56G3FLYSh3PYa2PZ5bzBNllWHU8ELLtCynL4n+w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(83380400001)(36860700001)(426003)(336012)(54906003)(47076005)(6916009)(2616005)(478600001)(8676002)(186003)(36756003)(1076003)(70206006)(70586007)(966005)(356005)(2906002)(86362001)(82740400003)(41300700001)(26005)(81166007)(5660300002)(316002)(40480700001)(40460700003)(6666004)(44832011)(4326008)(82310400005)(8936002)(66899018)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:45:01.1306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f51690-a587-4396-ff9f-08dafeb07252
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7976

Add a new machine xenpvh which creates a IOREQ server to register/connect with
Xen Hypervisor.

Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, adds a
TPM emulator and connects to swtpm running on host machine via chardev socket
and support TPM functionalities for a guest domain.

Extra command line for aarch64 xenpvh QEMU to connect to swtpm:
    -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
    -tpmdev emulator,id=tpm0,chardev=chrtpm \
    -machine tpm-base-addr=0x0c000000 \

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
 docs/system/arm/xenpvh.rst    |  34 +++++++
 docs/system/target-arm.rst    |   1 +
 hw/arm/meson.build            |   2 +
 hw/arm/xen_arm.c              | 184 ++++++++++++++++++++++++++++++++++
 include/hw/arm/xen_arch_hvm.h |   9 ++
 include/hw/xen/arch_hvm.h     |   2 +
 6 files changed, 232 insertions(+)
 create mode 100644 docs/system/arm/xenpvh.rst
 create mode 100644 hw/arm/xen_arm.c
 create mode 100644 include/hw/arm/xen_arch_hvm.h

diff --git a/docs/system/arm/xenpvh.rst b/docs/system/arm/xenpvh.rst
new file mode 100644
index 0000000000..e1655c7ab8
--- /dev/null
+++ b/docs/system/arm/xenpvh.rst
@@ -0,0 +1,34 @@
+XENPVH (``xenpvh``)
+=========================================
+This machine creates a IOREQ server to register/connect with Xen Hypervisor.
+
+When TPM is enabled, this machine also creates a tpm-tis-device at a user input
+tpm base address, adds a TPM emulator and connects to a swtpm application
+running on host machine via chardev socket. This enables xenpvh to support TPM
+functionalities for a guest domain.
+
+More information about TPM use and installing swtpm linux application can be
+found at: docs/specs/tpm.rst.
+
+Example for starting swtpm on host machine:
+.. code-block:: console
+
+    mkdir /tmp/vtpm2
+    swtpm socket --tpmstate dir=/tmp/vtpm2 \
+    --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &
+
+Sample QEMU xenpvh commands for running and connecting with Xen:
+.. code-block:: console
+
+    qemu-system-aarch64 -xen-domid 1 \
+    -chardev socket,id=libxl-cmd,path=qmp-libxl-1,server=on,wait=off \
+    -mon chardev=libxl-cmd,mode=control \
+    -chardev socket,id=libxenstat-cmd,path=qmp-libxenstat-1,server=on,wait=off \
+    -mon chardev=libxenstat-cmd,mode=control \
+    -xen-attach -name guest0 -vnc none -display none -nographic \
+    -machine xenpvh -m 1301 \
+    -chardev socket,id=chrtpm,path=tmp/vtpm2/swtpm-sock \
+    -tpmdev emulator,id=tpm0,chardev=chrtpm -machine tpm-base-addr=0x0C000000
+
+In above QEMU command, last two lines are for connecting xenpvh QEMU to swtpm
+via chardev socket.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 91ebc26c6d..af8d7c77d6 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -106,6 +106,7 @@ undocumented; you can get a complete list by running
    arm/stm32
    arm/virt
    arm/xlnx-versal-virt
+   arm/xenpvh
 
 Emulated CPU architecture support
 =================================
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index b036045603..06bddbfbb8 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -61,6 +61,8 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
+arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
+arm_ss.add_all(xen_ss)
 
 softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
new file mode 100644
index 0000000000..12b19e3609
--- /dev/null
+++ b/hw/arm/xen_arm.c
@@ -0,0 +1,184 @@
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
+#include "qapi/visitor.h"
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
+#define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
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
+
+    struct {
+        uint64_t tpm_base_addr;
+    } cfg;
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
+#ifdef CONFIG_TPM
+static void xen_enable_tpm(XenArmState *xam)
+{
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
+    sysbus_mmio_map(busdev, 0, xam->cfg.tpm_base_addr);
+
+    DPRINTF("Connected tpmdev at address 0x%lx\n", xam->cfg.tpm_base_addr);
+}
+#endif
+
+static void xen_arm_init(MachineState *machine)
+{
+    XenArmState *xam = XEN_ARM(machine);
+
+    xam->state =  g_new0(XenIOState, 1);
+
+    xen_register_ioreq(xam->state, machine->smp.cpus, xen_memory_listener);
+
+#ifdef CONFIG_TPM
+    if (xam->cfg.tpm_base_addr) {
+        xen_enable_tpm(xam);
+    } else {
+        DPRINTF("tpm-base-addr is not provided. TPM will not be enabled\n");
+    }
+#endif
+
+    return;
+}
+
+#ifdef CONFIG_TPM
+static void xen_arm_get_tpm_base_addr(Object *obj, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
+{
+    XenArmState *xam = XEN_ARM(obj);
+    uint64_t value = xam->cfg.tpm_base_addr;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void xen_arm_set_tpm_base_addr(Object *obj, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
+{
+    XenArmState *xam = XEN_ARM(obj);
+    uint64_t value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    xam->cfg.tpm_base_addr = value;
+}
+#endif
+
+static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
+{
+
+    MachineClass *mc = MACHINE_CLASS(oc);
+    mc->desc = "Xen Para-virtualized PC";
+    mc->init = xen_arm_init;
+    mc->max_cpus = 1;
+    mc->default_machine_opts = "accel=xen";
+
+#ifdef CONFIG_TPM
+    object_class_property_add(oc, "tpm-base-addr", "uint64_t",
+                              xen_arm_get_tpm_base_addr,
+                              xen_arm_set_tpm_base_addr,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "tpm-base-addr",
+                                          "Set Base address for TPM device.");
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+#endif
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
index 0000000000..8fd645e723
--- /dev/null
+++ b/include/hw/arm/xen_arch_hvm.h
@@ -0,0 +1,9 @@
+#ifndef HW_XEN_ARCH_ARM_HVM_H
+#define HW_XEN_ARCH_ARM_HVM_H
+
+#include <xen/hvm/ioreq.h>
+void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
+void arch_xen_set_memory(XenIOState *state,
+                         MemoryRegionSection *section,
+                         bool add);
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


