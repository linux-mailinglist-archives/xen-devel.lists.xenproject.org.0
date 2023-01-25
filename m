Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6D967AD06
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 09:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483973.750468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKba4-0002Ok-7h; Wed, 25 Jan 2023 08:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483973.750468; Wed, 25 Jan 2023 08:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKba4-0002Kl-2E; Wed, 25 Jan 2023 08:56:32 +0000
Received: by outflank-mailman (input) for mailman id 483973;
 Wed, 25 Jan 2023 08:56:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKba3-0000CY-2u
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:56:31 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20602.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b2c09dc-9c8e-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 09:55:45 +0100 (CET)
Received: from DM6PR05CA0060.namprd05.prod.outlook.com (2603:10b6:5:335::29)
 by DM4PR12MB8449.namprd12.prod.outlook.com (2603:10b6:8:17f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Wed, 25 Jan
 2023 08:54:53 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::75) by DM6PR05CA0060.outlook.office365.com
 (2603:10b6:5:335::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 08:54:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 08:54:53 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:54:52 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 00:54:51 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:54:51 -0600
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
X-Inumbo-ID: 0b2c09dc-9c8e-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGopsUYhhHnYRJDCP/FiCXesns1Bq2PZcXNpP/03+CX2sPshXW7cPuFrO6KMy77kLVB+wVYmvM4dA+rCfj5KYw+W0Uj/G8mQ5bvfAGCeSTqxiRg8tlCRSK59DqTcxZ9aRI2wXhAlAXIIWik4J5WZAM52GpyBaWOdmSRzv8lNnnVWv81fAnWhi2BB52B6eFtfXjYEMFqcv+xLn6BBsTPrFh19ZLrSjkAy4IlztevVAl9Kvx2/HccJIfHARAI7ZHFKcih0wOGp5m24dtsbQyyAzOzoUlaXydr+Tuwi5Nlq3tVqVJbYyPmRHTpM+e/5OcYL/cWCGT3j4paleoEQjCxt0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+E4BfA2jNdGJLu/KOY6Tiy/3hPOgzwaMVA9okKy1Xk=;
 b=L/zQzX0TroeeF0E1ELRyHNYPImy8BOPolMX2IUrbbOrMTbR5zQBUz7bXGfQoey8kWqiZuTmuu6xdWXkCfObaUpVd84/raXUs/Y7qZBnsnP4YJIevEOF+xWEcV36Jh4Q1IB8Vh3glflu5Wn364b8z/xzY/O3mjHtnssN2UZgj4zFvd6wQrbd5fC860qJQ5Vn1eY/E93Ei0/w4rZe4TQRqdV44E8dVE7vhGOnUOuLXz56Syg7u6ZxoBa+YoheyS/MirB4H6yTL+F3mfrYCpwA2rExIpwcKE3+Jcla+T0gju/ShMueFZ7APruODEtR83aGWGTqRiW1s94nZGbiSS7wRpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+E4BfA2jNdGJLu/KOY6Tiy/3hPOgzwaMVA9okKy1Xk=;
 b=TtuPwwtLq+2QytKpmlBdCei0wMZTmTBPumausEOJzQDX8flkSQe05cFOVThzVjIC+FwE6ykioijOvyvai1ayAtgGz5/KbXPo06wgmw/5qKdn2Gjrkln/3RqBzmoQn5Q94MpyFORXUpD1nqfkWFTvUrkqOTGfhmDF/yPN3Wek8Mk=
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
Subject: [QEMU][PATCH v4 09/10] hw/arm: introduce xenpvh machine
Date: Wed, 25 Jan 2023 00:54:06 -0800
Message-ID: <20230125085407.7144-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125085407.7144-1-vikram.garhwal@amd.com>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT023:EE_|DM4PR12MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: f8222557-8e9b-4499-8928-08dafeb1d321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UESb5+TkqkWIwH0Fk09Gz/AONNGLrpxZctozO5EQTfFd15E3K/lMrH+akIosfkTfzdCCLiMATGxz30lN2LoSpVbycYIAS8TsoeNUBeXFhHvUGrl1XNOJwA6WArE2KH0W9JMKhiaD00lIH2QFLZuVUJbktGmQgdiBjGfuRkXS2xDsh+iTkwlfG4aYuJ0HYORkpslUNJOR2g17clAKZq7YUr3W1oLQTBh8etkZiimaEYiC6QACGnnMaNk/3RFz9qGASuWTea0X+5AyqwEqr+nT0VQ2JbrnTBOGfAKvfUtNykdsUAsA+YVlKnXypEYCi45Fbccj44aV+gWBa8tqz/PmaYw2thYlNRU5wo97gQeCA+jz2xM1lOFuU+n2NCLuRY0ZX7eBAlKduknkev/PXqUxbH8mxpoI3JQhrM8kCO1ar/jOAUyrJV33yEU18tnm1WdgCo+i15LWEe5wK9Bg8oOtn0SW/qo1Ozl0pPsJHRtsqIH8Z4HIO3Z4aJk5foPlGnhsFs7bbZGFxdSv5reusifeA6kub2NAdpiHosT5LV71G6/Q4/9ygqWjhG5ezR5lhltGt9gsqfvB4RbBGIgkb3ca+3fRP5z/wNfUHxq1bbze9/ozbSMRITX8OMs5O8ZbTFkJUqmQeWPyqYijxjEQNGOUmPWv3y5/FuSa9g3AgWo0vOLbvSmJPBiBx3E3zw5nkmfiEt0TnkQa+oQ+GqAq26TxR7fRX5x6objEQQtA9cjJl6oOksaFaFVh64YX8fD8r3wYHrB3HAuy+5O9rpR5KVQcrQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(82310400005)(966005)(1076003)(86362001)(186003)(26005)(478600001)(70206006)(44832011)(41300700001)(82740400003)(336012)(8676002)(426003)(4326008)(47076005)(70586007)(8936002)(5660300002)(40460700003)(40480700001)(36860700001)(2616005)(83380400001)(6916009)(36756003)(6666004)(356005)(81166007)(54906003)(316002)(2906002)(66899018)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:54:53.0422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8222557-8e9b-4499-8928-08dafeb1d321
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8449

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


