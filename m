Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9BD890539
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699121.1091706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpshi-00058i-9A; Thu, 28 Mar 2024 16:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699121.1091706; Thu, 28 Mar 2024 16:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpshi-000579-5Y; Thu, 28 Mar 2024 16:34:14 +0000
Received: by outflank-mailman (input) for mailman id 699121;
 Thu, 28 Mar 2024 16:34:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XOaz=LC=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1rpshg-0004sj-DL
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 16:34:12 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0067d42d-ed21-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 17:34:09 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 28 Mar
 2024 17:34:08 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.037; Thu, 28 Mar 2024 17:34:08 +0100
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
X-Inumbo-ID: 0067d42d-ed21-11ee-a1ef-f123f15fe8a2
From: John Ernberg <john.ernberg@actia.se>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peng Fan
	<peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>, John Ernberg
	<john.ernberg@actia.se>
Subject: [PATCH v3 1/3] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH v3 1/3] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHagS3BrTI19ck4x0i8vHY8dyeSxw==
Date: Thu, 28 Mar 2024 16:34:08 +0000
Message-ID: <20240328163351.64808-2-john.ernberg@actia.se>
References: <20240328163351.64808-1-john.ernberg@actia.se>
In-Reply-To: <20240328163351.64808-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.44.0
x-originating-ip: [10.12.12.11]
x-esetresult: clean, is OK
x-esetid: 37303A2958D729556C7D66
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

When using Linux for dom0 there are a bunch of drivers that need to do SMC
SIP calls into the firmware to enable certain hardware bits like the
watchdog.

Provide a basic platform glue that implements the needed SMC forwarding.

The format of these calls are as follows:
 - reg 0: function ID
 - reg 1: subfunction ID (when there's a subfunction)
 remaining regs: args

For now we only allow Dom0 to make these calls as they are all managing
hardware. There is no specification for these SIP calls, the IDs and names
have been extracted from the upstream linux kernel and the vendor kernel.

Most of the SIP calls are only available for the iMX8M series of SoCs, so
they are easy to reject and they need to be revisited when iMX8M series
support is added.

From the other calls we can reject CPUFREQ because Dom0 cannot make an
informed decision regarding CPU frequency scaling, WAKEUP_SRC is to wake
up from suspend, which Xen doesn't support at this time.

This leaves the TIME SIP, OTP SIPs, BUILDINFO SIP and TEMP ALARM SIP, which
for now are allowed to Dom0.

NOTE: This code is based on code found in NXP Xen tree located here:
https://github.com/nxp-imx/imx-xen/blob/lf-5.10.y_4.13/xen/arch/arm/platfor=
ms/imx8qm.c

Signed-off-by: Peng Fan <peng.fan@nxp.com>
[jernberg: Add SIP call filtering]
Signed-off-by: John Ernberg <john.ernberg@actia.se>

---

v3:
 - Adhere to style guidelines for line length and label indentation (Michal=
 Orzel)
 - Use smccc macros to build the SIP function identifier (Michal Orzel)
 - Adjust platform name to be specific to QM and QXP variants (Michal Orzel=
)
 - Pick up additional SIPs which may be used by other Linux versions - for =
review purposes
 - Changes to the commit message due to above

v2:
 - Reword the commit message to be a bit clearer
 - Include the link previously added as a context note to the commit messag=
e (Julien Grall)
 - Add Pengs signed off (Julien Grall, Peng Fan)
 - Add basic SIP call filter (Julien Grall)
 - Expand the commit message a whole bunch because of the changes to the co=
de
---
 xen/arch/arm/platforms/Makefile |   1 +
 xen/arch/arm/platforms/imx8qm.c | 168 ++++++++++++++++++++++++++++++++
 2 files changed, 169 insertions(+)
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
index 0000000000..0992475474
--- /dev/null
+++ b/xen/arch/arm/platforms/imx8qm.c
@@ -0,0 +1,168 @@
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
+#include <xen/sched.h>
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
+#define IMX_SIP_FID(fid) \
+    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, \
+                       ARM_SMCCC_CONV_64, \
+                       ARM_SMCCC_OWNER_SIP, \
+                       fid)
+
+#define IMX_SIP_F_GPC            0x0000
+#define IMX_SIP_F_CPUFREQ        0x0001
+#define IMX_SIP_F_TIME           0x0002
+#define IMX_SIP_F_BUILDINFO      0x0003
+#define IMX_SIP_F_DDR_DVFS       0x0004
+#define IMX_SIP_F_SRC            0x0005
+#define IMX_SIP_F_GET_SOC_INFO   0x0006
+#define IMX_SIP_F_NOC            0x0008
+#define IMX_SIP_F_WAKEUP_SRC     0x0009
+#define IMX_SIP_F_OTP_READ       0x000A
+#define IMX_SIP_F_OTP_WRITE      0x000B
+#define IMX_SIP_F_SET_TEMP_ALARM 0x000C
+
+#define IMX_SIP_TIME_SF_RTC_SET_TIME     0x00
+#define IMX_SIP_TIME_SF_WDOG_START       0x01
+#define IMX_SIP_TIME_SF_WDOG_STOP        0x02
+#define IMX_SIP_TIME_SF_WDOG_SET_ACT     0x03
+#define IMX_SIP_TIME_SF_WDOG_PING        0x04
+#define IMX_SIP_TIME_SF_WDOG_SET_TIMEOUT 0x05
+#define IMX_SIP_TIME_SF_WDOG_GET_STAT    0x06
+#define IMX_SIP_TIME_SF_WDOG_SET_PRETIME 0x07
+
+static bool imx8qm_is_sip_time_call_ok(uint32_t subfunction_id)
+{
+    switch ( subfunction_id )
+    {
+    case IMX_SIP_TIME_SF_RTC_SET_TIME:
+        return true;
+    case IMX_SIP_TIME_SF_WDOG_START:
+    case IMX_SIP_TIME_SF_WDOG_STOP:
+    case IMX_SIP_TIME_SF_WDOG_SET_ACT:
+    case IMX_SIP_TIME_SF_WDOG_PING:
+    case IMX_SIP_TIME_SF_WDOG_SET_TIMEOUT:
+    case IMX_SIP_TIME_SF_WDOG_GET_STAT:
+    case IMX_SIP_TIME_SF_WDOG_SET_PRETIME:
+        return true;
+    default:
+        printk(XENLOG_WARNING "imx8qm: smc: time: Unknown subfunction id %=
x\n",
+               subfunction_id);
+        return false;
+    }
+}
+
+static bool imx8qm_smc(struct cpu_user_regs *regs)
+{
+    uint32_t function_id =3D get_user_reg(regs, 0);
+    uint32_t subfunction_id =3D get_user_reg(regs, 1);
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
+    /* Only hardware domain may use the SIP calls */
+    if ( !is_hardware_domain(current->domain) )
+    {
+        gprintk(XENLOG_WARNING, "imx8qm: smc: No access\n");
+        return false;
+    }
+
+    switch ( function_id )
+    {
+    /* Only available on imx8m series */
+    case IMX_SIP_FID(IMX_SIP_F_GPC):
+        return false;
+    case IMX_SIP_FID(IMX_SIP_F_CPUFREQ):
+        /* Hardware domain can't take any informed decision here */
+        return false;
+    case IMX_SIP_FID(IMX_SIP_F_BUILDINFO):
+        goto allow_call;
+    case IMX_SIP_FID(IMX_SIP_F_TIME):
+        if ( imx8qm_is_sip_time_call_ok(subfunction_id) )
+            goto allow_call;
+        return false;
+    /* Only available on imx8m series */
+    case IMX_SIP_FID(IMX_SIP_F_DDR_DVFS):
+        return false;
+    /* Only available on imx8m series */
+    case IMX_SIP_FID(IMX_SIP_F_SRC):
+        return false;
+    /* Only available on imx8m series */
+    case IMX_SIP_FID(IMX_SIP_F_GET_SOC_INFO):
+        return false;
+    /* Only available on imx8m series */
+    case IMX_SIP_FID(IMX_SIP_F_NOC):
+        return false;
+    /* Xen doesn't have suspend support */
+    case IMX_SIP_FID(IMX_SIP_F_WAKEUP_SRC):
+        return false;
+    case IMX_SIP_FID(IMX_SIP_F_OTP_READ):
+        /* subfunction_id is the fuse number, no sensible check possible *=
/
+        goto allow_call;
+    case IMX_SIP_FID(IMX_SIP_F_OTP_WRITE):
+        /* subfunction_id is the fuse number, no sensible check possible *=
/
+        goto allow_call;
+    case IMX_SIP_FID(IMX_SIP_F_SET_TEMP_ALARM):
+        goto allow_call;
+    default:
+        printk(XENLOG_WARNING "imx8qm: smc: Unknown function id %x\n",
+               function_id);
+        return false;
+    }
+
+ allow_call:
+    arm_smccc_1_1_smc(function_id,
+                      subfunction_id,
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
+PLATFORM_START(imx8qm, "i.MX 8Q{M,XP}")
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
2.44.0

