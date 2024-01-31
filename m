Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D1C843ED0
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 12:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673957.1048568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV97Y-0007hZ-TF; Wed, 31 Jan 2024 11:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673957.1048568; Wed, 31 Jan 2024 11:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV97Y-0007cf-Lx; Wed, 31 Jan 2024 11:51:12 +0000
Received: by outflank-mailman (input) for mailman id 673957;
 Wed, 31 Jan 2024 11:50:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+aY=JJ=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rV96l-0007Xr-E3
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 11:50:23 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e968e46c-c02e-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 12:50:21 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 31 Jan
 2024 12:50:20 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Wed, 31 Jan 2024 12:50:20 +0100
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
X-Inumbo-ID: e968e46c-c02e-11ee-98f5-efadbce2ee36
From: John Ernberg <john.ernberg@actia.se>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Peng Fan <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "John
 Ernberg" <john.ernberg@actia.se>
Subject: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5Q==
Date: Wed, 31 Jan 2024 11:50:20 +0000
Message-ID: <20240131114952.305805-2-john.ernberg@actia.se>
References: <20240131114952.305805-1-john.ernberg@actia.se>
In-Reply-To: <20240131114952.305805-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.43.0
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2958D72955667360
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

When using Linux for dom0 there are a bunch of drivers that need to do SMC
SIP calls into the PSCI provider to enable certain hardware bits like the
watchdog.

Provide a basic platform glue that implements the needed SMC forwarding.

Signed-off-by: John Ernberg <john.ernberg@actia.se>
---
NOTE: This is based on code found in NXP Xen tree located here:
https://github.com/nxp-imx/imx-xen/blob/lf-5.10.y_4.13/xen/arch/arm/platfor=
ms/imx8qm.c

 xen/arch/arm/platforms/Makefile |  1 +
 xen/arch/arm/platforms/imx8qm.c | 65 +++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 xen/arch/arm/platforms/imx8qm.c

diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makef=
ile
index 8632f4115f..bec6e55d1f 100644
--- a/xen/arch/arm/platforms/Makefile
+++ b/xen/arch/arm/platforms/Makefile
@@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   +=3D sunxi.o
 obj-$(CONFIG_ALL64_PLAT) +=3D thunderx.o
 obj-$(CONFIG_ALL64_PLAT) +=3D xgene-storm.o
 obj-$(CONFIG_ALL64_PLAT) +=3D brcm-raspberry-pi.o
+obj-$(CONFIG_ALL64_PLAT) +=3D imx8qm.o
 obj-$(CONFIG_MPSOC_PLATFORM)  +=3D xilinx-zynqmp.o
 obj-$(CONFIG_MPSOC_PLATFORM)  +=3D xilinx-zynqmp-eemi.o
diff --git a/xen/arch/arm/platforms/imx8qm.c b/xen/arch/arm/platforms/imx8q=
m.c
new file mode 100644
index 0000000000..a9cd9c3615
--- /dev/null
+++ b/xen/arch/arm/platforms/imx8qm.c
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/platforms/imx8qm.c
+ *
+ * i.MX 8QM setup
+ *
+ * Copyright (c) 2016 Freescale Inc.
+ * Copyright 2018-2019 NXP
+ *
+ *
+ * Peng Fan <peng.fan@nxp.com>
+ */
+
+#include <asm/platform.h>
+#include <asm/smccc.h>
+
+static const char * const imx8qm_dt_compat[] __initconst =3D
+{
+    "fsl,imx8qm",
+    "fsl,imx8qxp",
+    NULL
+};
+
+static bool imx8qm_smc(struct cpu_user_regs *regs)
+{
+    struct arm_smccc_res res;
+
+    if ( !cpus_have_const_cap(ARM_SMCCC_1_1) )
+    {
+        printk_once(XENLOG_WARNING "no SMCCC 1.1 support. Disabling firmwa=
re calls\n");
+
+        return false;
+    }
+
+    arm_smccc_1_1_smc(get_user_reg(regs, 0),
+                      get_user_reg(regs, 1),
+                      get_user_reg(regs, 2),
+                      get_user_reg(regs, 3),
+                      get_user_reg(regs, 4),
+                      get_user_reg(regs, 5),
+                      get_user_reg(regs, 6),
+                      get_user_reg(regs, 7),
+                      &res);
+
+    set_user_reg(regs, 0, res.a0);
+    set_user_reg(regs, 1, res.a1);
+    set_user_reg(regs, 2, res.a2);
+    set_user_reg(regs, 3, res.a3);
+
+    return true;
+}
+
+PLATFORM_START(imx8qm, "i.MX 8")
+    .compatible =3D imx8qm_dt_compat,
+    .smc =3D imx8qm_smc,
+PLATFORM_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.43.0

