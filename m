Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE62E63FE72
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 04:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451357.709154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wI7-0001Yq-F6; Fri, 02 Dec 2022 03:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451357.709154; Fri, 02 Dec 2022 03:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wI6-0001Pj-Vs; Fri, 02 Dec 2022 03:00:42 +0000
Received: by outflank-mailman (input) for mailman id 451357;
 Fri, 02 Dec 2022 03:00:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP6A=4A=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p0wI3-0007SV-U6
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 03:00:40 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e89::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f58ad38-71ed-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 04:00:38 +0100 (CET)
Received: from DS7PR03CA0251.namprd03.prod.outlook.com (2603:10b6:5:3b3::16)
 by MW3PR12MB4377.namprd12.prod.outlook.com (2603:10b6:303:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 03:00:33 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::bf) by DS7PR03CA0251.outlook.office365.com
 (2603:10b6:5:3b3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Fri, 2 Dec 2022 03:00:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Fri, 2 Dec 2022 03:00:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:32 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:32 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 21:00:31 -0600
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
X-Inumbo-ID: 7f58ad38-71ed-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGE5MKhSOcoqfcfU15rtX8hDczAxjs+Oul/g0EKsZ9VDZkSnbr6uFuJqoGwa6TwY5n4dmoSA2vi6aSvhmIq1WM8a8Nx8oHx8Javgh5Ie/bt3hjdBAkK+hWW5g9iPadpJhP/CAfo9J3og9sO/Oz2aZGes8qKqqVrF5xdP5UBMW3D0/xEf+46KbRNodhskVFgeH3L9iezUYXSbFqu/g68WxXjMFnl3DcwGvfNlOBexOMc0EvQm9qHkPT+yTWWQfoftVo1Aj/SecSTmPwdUmmZpcni8ALzslk6cWbHqB0yfZzbSBH3u0ZKXeZ8OShnXXX7nZvD/e+ldNzTlql9zP9dCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYzV8ViwY618nmM7RDZwwkUZ/mIE7nSTEcx90v3DbsE=;
 b=dLYqBAGlSQnDdWyAdHTUHasd3jKq0Y/HOtPMYMEuYM9dCbPazQsoimi2ct5gJ5UAE71cGxuqLf7LnO5BDZNScpanCqdLYlKxZorNwqQXqYNbaLXO4lTupwwxB6Ynx5BR+MfiGoxZ2SYBKjlHB3Cnm4AsROj6lZjx98hsf9qfUFe+22+RV7E+wR9iKjoaZ68iE+E9yukzAsg/yWzdyrbKDrLfDMH1z0pD3UeWOG6RM8QsTUj1FLcI8zw8X4eQrNMmzO89yvYiz2ElUH4bhhMZIRH0q/Sx4uOsc5x9iOCUvqBVq2oqY2uDryj9FJBQbeMu7rSD34RYc+4NLew+gZuyig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYzV8ViwY618nmM7RDZwwkUZ/mIE7nSTEcx90v3DbsE=;
 b=iZmebZhSFKyZxtEAwqWrNMh1BbfXyc9FIGpLTMbsw9MbhCb2YyCk3kZqpAbIn+JZhktc0DOcrCcMDlgrijotzngQQN5ud+J8IKewfBVNfr8odlneTY0CMnr0f651pvq8qGOMusfKicbMxzZZXx0yLuFvq7GkTLAu5Kn8uRnl9jI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-dev@xilinx.com>
CC: <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>,
	<xen-devel@lists.xenproject.org>, Vikram Garhwal <vikram.garhwal@amd.com>,
	Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
Date: Thu, 1 Dec 2022 19:00:02 -0800
Message-ID: <20221202030003.11441-11-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221202030003.11441-1-vikram.garhwal@amd.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT064:EE_|MW3PR12MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d048201-19cf-4a9c-09f4-08dad41160cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NqvT/giPwj5JRDeOkBU4yDFEb/IITtDuuYkZwmqx0CQLxYkzKcEPJotDwy2HtQnYK3O5OWRM9+6MJqdqkr2H/b16U4aFYZ7VYsA5oyrNQD72VJMvM97/IrdRgt6xBToxCwc14JqNJqTlBQkANNdH+a09BKn3KG/HjtQTLgPSuhAq/leTiy8xAdqAGiKqzY87t412PB7T/z3IX0NdMj67aAWSTMgb5K4PrsNowF/vhe8TTvAkPU5hl8/OtUEkJ7nmultZ7gkYAfGONcewWtKB57eaHguZUXp2r5U3lIPNNkAsWJqXX0ajNeAe3rLWV+wWr93IS1dqrOOmGjMKjrXy5GD8zBISlync7MV5/CeKsj8RR1TSEljRbguraSg0xcg7FHD9mkIGMmV7fR6GCCUyOP/bEj0bJEQGZfS4RvAGoDhauyENhDBgakI60qFdYHHGKuTSNUFlgBWvuDo7SeISwfsXZ7xRupudLbVi7aNTBGUVRNVkgVvzO2VN5LEGv6aKoZ4jHT2RvD2CBunWrFT3SzjEp9N4eHlbsHUHsCIhsXz4cHD5T4WV8rLgEw269Qk4x61k5IE8UL0iHQfNpe0NzBS3O2CM0KsJlJKqqMhD0jcjXAjljizp7fq1uLpOUZkyd6Krft7oWCiX0GAZajs8+TVD2igqRf9jsCYXSxpTIVPcvpcSRSR8zHwW50Z5TJ6j5Zlx6Q6q6QJadhG5kKj4UP+f4pVPliTEA9/FHUtne23jsm5tu/+55tqClMN2kzx0DklXkdGucF299i8KqluVKw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(6666004)(966005)(186003)(26005)(66899015)(316002)(54906003)(478600001)(4326008)(70206006)(70586007)(8676002)(2616005)(41300700001)(1076003)(8936002)(426003)(5660300002)(47076005)(6862004)(44832011)(83380400001)(2906002)(336012)(36756003)(40480700001)(36860700001)(86362001)(82310400005)(82740400003)(81166007)(40460700003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 03:00:32.9082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d048201-19cf-4a9c-09f4-08dad41160cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4377

Add a new machine xenpv which creates a IOREQ server to register/connect with
Xen Hypervisor.

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

/* Comment about machine name. Will be removed in next version*/
Please reply with the machine name you agree. Below are two possible names:
1. xenpv
2. xenpvh

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 hw/arm/meson.build            |   2 +
 hw/arm/xen_arm.c              | 175 ++++++++++++++++++++++++++++++++++
 include/hw/arm/xen_arch_hvm.h |   9 ++
 include/hw/xen/arch_hvm.h     |   2 +
 4 files changed, 188 insertions(+)
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
index 0000000000..bcb8e95f2c
--- /dev/null
+++ b/hw/arm/xen_arm.c
@@ -0,0 +1,175 @@
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
+    if (xen_dmod == NULL) {
+        perror("xen: can't open xen device model interface\n");
+        return -1;
+    }
+
+    xen_xc = xc_interface_open(0, 0, 0);
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
+    xen_register_backend(state);
+
+    xenstore_record_dm_state(state->xenstore, "running");
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
+    /* For now enable IOREQ only for CONFIG_TPM. */
+#ifdef CONFIG_TPM
+    if (xen_init_ioreq(xam->state, machine->smp.cpus)) {
+        return;
+    }
+#endif
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
+
+#ifdef CONFIG_TPM
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


