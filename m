Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4034854DAC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 17:07:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681055.1059620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHmp-00014P-5U; Wed, 14 Feb 2024 16:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681055.1059620; Wed, 14 Feb 2024 16:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHmp-00012X-0Q; Wed, 14 Feb 2024 16:07:03 +0000
Received: by outflank-mailman (input) for mailman id 681055;
 Wed, 14 Feb 2024 16:07:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xNvu=JX=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1raHmn-0000fn-Uk
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 16:07:01 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15bd22fa-cb53-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 17:07:00 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 17:06:59 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Wed, 14 Feb 2024 17:06:59 +0100
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
X-Inumbo-ID: 15bd22fa-cb53-11ee-8a4d-1f161083a0e0
From: John Ernberg <john.ernberg@actia.se>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Peng
 Fan" <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>, John Ernberg
	<john.ernberg@actia.se>
Subject: [PATCH v2 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH v2 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaX1/Xeq0xXmpbZkiZsYYSHlNyGA==
Date: Wed, 14 Feb 2024 16:06:59 +0000
Message-ID: <20240214160644.3418228-2-john.ernberg@actia.se>
References: <20240214160644.3418228-1-john.ernberg@actia.se>
In-Reply-To: <20240214160644.3418228-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.43.0
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2921D72955607464
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

When using Linux for dom0 there are a bunch of drivers that need to do SMC
SIP calls into the firmware to enable certain hardware bits like the
watchdog.

Provide a basic platform glue that implements the needed SMC forwarding.

The format of these calls are as follows:
 - reg 0: service ID
 - reg 1: function ID
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

This leaves the TIME SIP and the OTP_WRITE SIP, which for now are allowed
to Dom0.

NOTE: This code is based on code found in NXP Xen tree located here:
https://github.com/nxp-imx/imx-xen/blob/lf-5.10.y_4.13/xen/arch/arm/platfor=
ms/imx8qm.c

Signed-off-by: Peng Fan <peng.fan@nxp.com>
[jernberg: Add SIP call filtering]
Signed-off-by: John Ernberg <john.ernberg@actia.se>

---

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
 xen/arch/arm/platforms/imx8qm.c | 143 ++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)
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
index 0000000000..4515c75935
--- /dev/null
+++ b/xen/arch/arm/platforms/imx8qm.c
@@ -0,0 +1,143 @@
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
+#define IMX_SIP_GPC          0xC2000000
+#define IMX_SIP_CPUFREQ      0xC2000001
+#define IMX_SIP_TIME         0xC2000002
+#define IMX_SIP_DDR_DVFS     0xC2000004
+#define IMX_SIP_SRC          0xC2000005
+#define IMX_SIP_GET_SOC_INFO 0xC2000006
+#define IMX_SIP_NOC          0xC2000008
+#define IMX_SIP_WAKEUP_SRC   0xC2000009
+#define IMX_SIP_OTP_WRITE    0xC200000B
+
+#define IMX_SIP_TIME_F_RTC_SET_TIME     0x00
+#define IMX_SIP_TIME_F_WDOG_START       0x01
+#define IMX_SIP_TIME_F_WDOG_STOP        0x02
+#define IMX_SIP_TIME_F_WDOG_SET_ACT     0x03
+#define IMX_SIP_TIME_F_WDOG_PING        0x04
+#define IMX_SIP_TIME_F_WDOG_SET_TIMEOUT 0x05
+#define IMX_SIP_TIME_F_WDOG_GET_STAT    0x06
+#define IMX_SIP_TIME_F_WDOG_SET_PRETIME 0x07
+
+static bool imx8qm_is_sip_time_call_ok(uint32_t function_id)
+{
+    switch ( function_id )
+    {
+    case IMX_SIP_TIME_F_RTC_SET_TIME:
+        return true;
+    case IMX_SIP_TIME_F_WDOG_START:
+    case IMX_SIP_TIME_F_WDOG_STOP:
+    case IMX_SIP_TIME_F_WDOG_SET_ACT:
+    case IMX_SIP_TIME_F_WDOG_PING:
+    case IMX_SIP_TIME_F_WDOG_SET_TIMEOUT:
+    case IMX_SIP_TIME_F_WDOG_GET_STAT:
+    case IMX_SIP_TIME_F_WDOG_SET_PRETIME:
+        return true;
+    default:
+        printk(XENLOG_WARNING "imx8qm: smc: time: Unknown function id %x\n=
", function_id);
+        return false;
+    }
+}
+
+static bool imx8qm_smc(struct cpu_user_regs *regs)
+{
+    uint32_t service_id =3D get_user_reg(regs, 0);
+    uint32_t function_id =3D get_user_reg(regs, 1);
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
+    switch ( service_id )
+    {
+    case IMX_SIP_GPC: /* Only available on imx8m series */
+        return false;
+    case IMX_SIP_CPUFREQ: /* Dom0 can't take any informed descision here *=
/
+        return false;
+    case IMX_SIP_TIME:
+        if ( imx8qm_is_sip_time_call_ok(function_id) )
+            goto allow_call;
+        return false;
+    case IMX_SIP_DDR_DVFS: /* Only available on imx8m series */
+        return false;
+    case IMX_SIP_SRC: /* Only available on imx8m series */
+        return false;
+    case IMX_SIP_GET_SOC_INFO: /* Only available on imx8m series */
+        return false;
+    case IMX_SIP_NOC: /* Only available on imx8m series */
+        return false;
+    case IMX_SIP_WAKEUP_SRC: /* Xen doesn't have suspend support */
+        return false;
+    case IMX_SIP_OTP_WRITE:
+        /* function_id is the fuse number, no sensible check possible */
+        goto allow_call;
+    default:
+        printk(XENLOG_WARNING "imx8qm: smc: Unknown service id %x\n", serv=
ice_id);
+        return false;
+    }
+
+allow_call:
+    arm_smccc_1_1_smc(service_id,
+                      function_id,
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

