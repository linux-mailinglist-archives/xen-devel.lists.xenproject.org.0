Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E965D6DE77F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 00:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519977.807189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMma-000763-TX; Tue, 11 Apr 2023 22:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519977.807189; Tue, 11 Apr 2023 22:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMma-0006zX-6z; Tue, 11 Apr 2023 22:48:12 +0000
Received: by outflank-mailman (input) for mailman id 519977;
 Tue, 11 Apr 2023 22:48:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmMmX-0004tk-RE
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 22:48:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec76f6fe-d8ba-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 00:48:07 +0200 (CEST)
Received: from CY5PR22CA0056.namprd22.prod.outlook.com (2603:10b6:930:1d::19)
 by PH0PR12MB5466.namprd12.prod.outlook.com (2603:10b6:510:d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 22:48:03 +0000
Received: from CY4PEPF0000C976.namprd02.prod.outlook.com
 (2603:10b6:930:1d:cafe::27) by CY5PR22CA0056.outlook.office365.com
 (2603:10b6:930:1d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38 via Frontend
 Transport; Tue, 11 Apr 2023 22:48:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C976.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.25 via Frontend Transport; Tue, 11 Apr 2023 22:48:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:48:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:48:02 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 17:48:01 -0500
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
X-Inumbo-ID: ec76f6fe-d8ba-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUrpHrhygylW65EIGNgcYhyexOOetItaPx0tXwn+r1Nhk2FpPQfqu+wT7GLbIDCkLUooB3qcX0M3ECrdMMMOmZ6VIUgKwFjIw41vz0KdtGaEtxG/QyEncf0kPiN72WJ8PsNndKF/zUouoRasRKv94zAE3qCyiD8AldWPBZsHVAfVJ89rgp0WZUDye2T+5ggkZ/AwnvSTOhbPxwSnucIlipvrZmNZDVnvKajmVU/HlRYBPKCXb1JZSKhqDheqslKdPGXT3UMFa2e8KuvDUKdsD+0Rz2xd6uFxyaGWyP8iEnnIt8uqZabmccSZop2pFWWcUVGFWOqJ2vjaiSbJOzUHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceVVG2Mcqf7l56uhkCH1ot2RTwEnUox0BY709RE34rI=;
 b=Qn684BdjEZvJ2qQaif7WhfImqtNfnJV2pjMHN5aYYpd8f3CiJSok4OasgTjuHOx45u4+fZ0+3qmSamnOoW6Cq1lZ3M7CTr7VKkpeEboo8DzN7rKbNIV8tnmb+z+O9/ucZHHmS8/RGu8+mCH8LMrfNy3onLGbn7alWwDPSgoJ8zQ+RNfHLdWIOKoLSYAJUsuakiR22HZJgX/CH36IdFAbErvE/OHkbWmtUwhsP4daIKXqJRJO6dmskfWArK2zQYHRULKSc7eU6mEHK/B2nJJHhw7YfpzcG+HIAfQOtlY+7PT1ILpeymje1IwE85vp361OCsrnmCzKgyesK5oFIm6iZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceVVG2Mcqf7l56uhkCH1ot2RTwEnUox0BY709RE34rI=;
 b=hgJQ6e907CCExPV87MF+D+1190Op0Xb+Q2JFOCxPezvgsR6a1pWlFqpYv9yJxvzwuuHJ5kfQ15QfpkqR0Rw6nCyNn4jHST4+j6HNtkS4MWcVKH5T90nxrK4/rO6Uo1xaXvv2BvALEjdgC0esMBHdaYl0cHudKDsPldu6mbUZEQI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "open list:ARM TCG
 CPUs" <qemu-arm@nongnu.org>
Subject: [QEMU][PATCH v6 09/10] hw/arm: introduce xenpvh machine
Date: Tue, 11 Apr 2023 15:47:45 -0700
Message-ID: <20230411224746.16152-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411224746.16152-1-vikram.garhwal@amd.com>
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C976:EE_|PH0PR12MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: 24af51b0-eff8-4248-c079-08db3adecee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i09bwLH20tj3WrE9gVcw90DTYx5/l0lmcMzwmQpsrfurGGhp+OmvxAqeFWBVHKru5GREPdyinfiS/p1aG0tNvqwD98tPWc3fH9lGAJrxt9QR3WH85jnx8/WWdvHSDGPxY1UviGzQVgnbThKIPefslBeNH2LAFl7rFPQMWblOXb24G1aOiTguVMA+JmOf4AI0YW2lDJq3Cd4W6OoplP5jRZPEqWZc5UFD1bK23+7jWee0rREmxGnXEk+28lL3nYyRBbfR6V6amvcsz9JN/JDeoErpIvB7SDHvEobRNf8g8vpryiEtzI/aZXp9snpSUiSbza37VDL7yc01tW6OMh0c0QZmA82k+8btSWW31XBjDtEke729ZpwmnVL2DhHJtX2niGfGXiqmdq3BXugoREEsbrqBYhBkKRPaSnoDL4VBmu+xQA8dVrfI47zKmfoPg/pi0/oHm1MFsPq0qmqQNsbCbD9+Ks6eXL3u4UmSYdBCNmzrSvCVDfblo7Jqt/lYsFqpmGnytrgQqoPfG2N3ms2I/tz1TwdyDYgk/kEyEmDOdQfgtuWnqkIFn9L/PzNUKIaBcKpXzCw3HCwJ/gVcyjod55jv3A7QUrEbZnKz2toBHAuatC4JMSwQpDJwUEKvjZpXrd8Q3eSbpt56CGEupPSbLEt5HD09vqDnQY8gp1x1psKHuv17qCN3PiGXQ4Nf6YXP0UUSX8Om62ljVl+xcWQ8ZVwXccnpe7rAGs72jZ6pYFw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(6666004)(8936002)(66899021)(40480700001)(44832011)(40460700003)(966005)(5660300002)(86362001)(70206006)(70586007)(8676002)(6916009)(4326008)(478600001)(82310400005)(82740400003)(356005)(54906003)(36860700001)(81166007)(2906002)(83380400001)(1076003)(186003)(2616005)(336012)(47076005)(426003)(316002)(41300700001)(36756003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 22:48:03.0539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24af51b0-eff8-4248-c079-08db3adecee9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C976.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5466

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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 docs/system/arm/xenpvh.rst    |  34 +++++++
 docs/system/target-arm.rst    |   1 +
 hw/arm/meson.build            |   2 +
 hw/arm/xen_arm.c              | 181 ++++++++++++++++++++++++++++++++++
 include/hw/arm/xen_arch_hvm.h |   9 ++
 include/hw/xen/arch_hvm.h     |   2 +
 6 files changed, 229 insertions(+)
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
index b545ba0e4f..1b2a01a005 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -62,6 +62,8 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
+arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
+arm_ss.add_all(xen_ss)
 
 softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
new file mode 100644
index 0000000000..19b1cb81ad
--- /dev/null
+++ b/hw/arm/xen_arm.c
@@ -0,0 +1,181 @@
+/*
+ * QEMU ARM Xen PVH Machine
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


