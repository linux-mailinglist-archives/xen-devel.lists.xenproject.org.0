Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB209A350D0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 23:00:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888113.1297545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tihGB-0005Mj-BI; Thu, 13 Feb 2025 22:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888113.1297545; Thu, 13 Feb 2025 22:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tihGB-0005JT-7N; Thu, 13 Feb 2025 22:00:39 +0000
Received: by outflank-mailman (input) for mailman id 888113;
 Thu, 13 Feb 2025 22:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bb01=VE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tihGA-0004bW-2w
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 22:00:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f403:2614::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f46b1ad8-ea55-11ef-9896-31a8f345e629;
 Thu, 13 Feb 2025 23:00:36 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB7069.eurprd03.prod.outlook.com
 (2603:10a6:102:e4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 22:00:29 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 22:00:29 +0000
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
X-Inumbo-ID: f46b1ad8-ea55-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OaGQPsvEjHD6WXdgaM5H8PxD+TdKA/720kPYD7vy1cEfa7hNRuzMLQYBtAzu7b3V1R26Ielklk1lWYl9Fh6v2Ik891eMjIjCwDw7NH0xvW5vRDfuJKS/iJ5kOO/9uHzWbSsYU0F4BcXR8l8uVOvW49eM0qFjdNplvkHsJuX9lz7RV6xIK5ydo+94Ap3pVFaX/QrP9ichLhr7yO9UtvC0/sDh9cVt3CXJcSpFVuWG7J7BRrIqoIHdPa8E5tIccwWdg7iHN8Q+POINKoyxH0lUVrl3WIE+iW5u3MMC4smpsuzl9jOuuQYDbNyZCSW3qna23y4XBDOgNkrsl8NHP5JVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rp3sx+Qz/TUPSWt/2rwv/aBkJj8l3/Pj+YsA/GRt+To=;
 b=Sd14zdgRZj8oEB81mgdQmee7uL24y0zg3GfU5R0Yjj7FU9du7uI0o/TPRIL9EeJD1NdVD9Prfs27Ccj3lF3La7YqzQlSYRAg02pJHNeBUbIaDzuNuXSnIzM2G++v9Bqk65u8EsjyJRDoXwv4MfeBFA+fwp7+gPN0u+D20rKekvBNHU91IJd2J81rqRL7jroRGUL2zYWIhHU1D5xnVE/gZvg/QP6WJC/x6VhQF04TlDgFuz6kw0Q9kSjWV1Pvujd5r5PE8q19NzI577CpfFmhq3BypSLkCYnxTVYEtpJrCuWsTCk2+DokEIIczazpiQYRZxJ/3qBppXHL+cmBTZhwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rp3sx+Qz/TUPSWt/2rwv/aBkJj8l3/Pj+YsA/GRt+To=;
 b=Rlq9XKakpDh1BmVI2tyvgOohIArzQrdagWkqBnfRay9rwtRaqaJ5kNGsgSEus5ayVaUrr4aGJRGmqGJdKnwTiZ7+eid6lq6oBw/6F3fU9idkyUJ06cf8Qt/rYsuG8WwFrPg8OPhdnZ5cBo2ElBfVKmRlqD1f0ZuL2SYt8/JkkYjH3Mnforx+zdq/2tCT9nd4f62vBTWp91XsAWXu4maNwxQmD35j5MRAqzdLMN4H00h3KFiUxkR3mr8g6nWM+ise2k82hmLCW+aJR/50HCIVnaDytDchU+BX1OeQ/ftzEbm0EJ8q13+IARp0lnZxxaIohe2nIFD488WCUiQy+nKJww==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 3/4] xen: arm: enable stack protector feature
Thread-Topic: [PATCH v5 3/4] xen: arm: enable stack protector feature
Thread-Index: AQHbfmKwZ00k4YYKH0WPipI2HVN66Q==
Date: Thu, 13 Feb 2025 22:00:27 +0000
Message-ID: <20250213220021.2897526-4-volodymyr_babchuk@epam.com>
References: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB7069:EE_
x-ms-office365-filtering-correlation-id: 1ef7a720-132a-4e30-c3a1-08dd4c79d497
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AzC8XHGWpTfFAETo0DbfD1KKKsh3Cce8xyyr+GByo9tKPTs8xVAXDayXoo?=
 =?iso-8859-1?Q?j2+GmxybBq3FxxjpYwJc61GfcZk/V36uOQqodnVtml2c/GAfZXctu9t5+J?=
 =?iso-8859-1?Q?14l+fjVS7fOJpS5yKgR6lgiAqdR/WlFLOxrkKNKZ/XKq83byFWqzjtqxHs?=
 =?iso-8859-1?Q?JrOTil49G4rG37zhiUzq00rW3rDm7NsUTtW1pxF2EWs3V1hVLj1W9eIRSM?=
 =?iso-8859-1?Q?aWjTV+rSw8O0F33LzNZ0I0J0QVMZ710IhLu/l7/6ElJ3Rm/Py/GKk/VF5l?=
 =?iso-8859-1?Q?GKdJ5XJsaNTtZI46sT2oVXBubkWIhxaTlS62Dz4KDIJ5BEz5eGhQy48HIn?=
 =?iso-8859-1?Q?XlMddFM2Car8v7ui2iDr6kerD4+5rshBt31l8zky8YmAH1r2QSdKt+Quob?=
 =?iso-8859-1?Q?ikR2hbKapSw7X60p8ulewotzvHKzm4pPwoNFIO1TEFV7kk+0BQ3+0zX/vn?=
 =?iso-8859-1?Q?RBmHdTLvY05INLVXjV1iNm/aoCN2j8zYif1NGj9Wv5oPK+khL0Y7aqE+sV?=
 =?iso-8859-1?Q?37CeY8+THyYKeb1VKlpP9I6p9qaGOrnZ8g5KTYFs2Zy9aaGrDbU16lFeES?=
 =?iso-8859-1?Q?JD4N9/JOoGm5KOvn4vKHNoI3OEtT9TPYI39aps0ifb6a8q1485TvqgWXPb?=
 =?iso-8859-1?Q?NhBgLJt7IgKU6Q5pH6dce8WVm+/6824ki7H1Al2jaqqBXw4fujZ0qNoiCm?=
 =?iso-8859-1?Q?EhDi72HI98HDyjyQDyfzZfLRTM2Zt/cgO2n0t3V4H2xYqomf1eB9BsncU7?=
 =?iso-8859-1?Q?m+o5SSUtQoGBIVEyCG+MWC6HxmLwza3DGlRiB7Sv/KGB4gy7nZ7WMxtOMw?=
 =?iso-8859-1?Q?bEv0yHRck6nsen5sgfBGXgX6q4gxv+LzFIZYOglSSTbNAGPFTtRTY6NEJU?=
 =?iso-8859-1?Q?+0eB5pCMMS5KlkZl4E4udHUhIVLMnDdz2Ve8CeLZZgYUcratOsWZKgsjG/?=
 =?iso-8859-1?Q?eshqlXnQaCSKy9j+UQMLY9dJmYjPRWd5DyywaPJVE44g1klI1AgeliQLBJ?=
 =?iso-8859-1?Q?CRBQWfl+WHYwGOCgYTH7zEhE1bNW3ACEMg66wTILHhJu/pWZIhtQCpTqgl?=
 =?iso-8859-1?Q?uPJ07adXjT9RrHYK9gx0b0SNDvX4+DE+HhCGaFU+bFMFi7E7YdXiPdDOUP?=
 =?iso-8859-1?Q?/C2CXkMJXnmxKyvSKH5nyLG07QOiMams0rDYPUrjSUfu0hlzVmveEw1Zo9?=
 =?iso-8859-1?Q?gfhoV3MqJAYl+W+RVL+gFtDDUUXnCyy3WFIW69Wmi4+4pUR9b8fEEy7ROK?=
 =?iso-8859-1?Q?gWHiFrpHdXRiUfEBe73fBNn3SKDONAP/c5VK9JVJttfnq3oH8u1byQABrY?=
 =?iso-8859-1?Q?1C5mEU5ojbVzMxZfaRKhy1yh7MFIFORr14JGeRT8gK0Q2lhzMykanelkba?=
 =?iso-8859-1?Q?n645gA5xSub7GNFSV2kYKv5RhkdKvBUmTimtKmXa1LIJ8EzAHdhNjy4heV?=
 =?iso-8859-1?Q?OPIOIRykKtZremEI66JEbBdJ8f4GJSAMMPvcq/0GdVrVBvEPs/s0VyroIk?=
 =?iso-8859-1?Q?e0jzmBf0i7wAo4Zz7y+Zz0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?29InrIdOzqkesPSUuxi6cHdXqj6ZWQjPgUVA0PoZELm4eXsWc0PR4LTOoK?=
 =?iso-8859-1?Q?gPDMVJ1zyppYCyiygOEF/oMDIJYgqE0fz8Fk17jZyhLXNC6KHtA3asehe3?=
 =?iso-8859-1?Q?fwq4MQOggDa83CB0SUBS6DeeUH8Ps7Rd+y0M63PLcRknUiSr2P00SMPV+V?=
 =?iso-8859-1?Q?LWamYBfgPjEja9zg+CkBSScJRqKQv+uuycDAIHtAeLxGDT0JCA0aTQRjnq?=
 =?iso-8859-1?Q?BDN0rXZAJZ50bDKi9+dL7xOsdlLhIc8/p7JHc1GQdqv53KBwclpScy1aWK?=
 =?iso-8859-1?Q?8bY4CZsDeT32StGBYOCMKrHWTkcvtL/z3rA5dOjwaFLEg0k5n+o3U4/3WM?=
 =?iso-8859-1?Q?csP38AMgwqQ4cA2jDM1JwpnLPqEYhLiIm/dIhtfBx1Z8ogUvIMxMXNfReg?=
 =?iso-8859-1?Q?DXNdojl7yfOghf9ZpkoGj/JBv4ySkEqOS4IxzHN3+B68qzzrCfGK6x6BhD?=
 =?iso-8859-1?Q?7pzYJHyMZoDH5GaEq4axomALn7IHl8bdQWEXbvA1vToHCo/lTw39CMGAiw?=
 =?iso-8859-1?Q?6GDm3MgOCFTlcG6mu4grdpig7Kp85trqUaUTHsQgyrhuBQHfKI6xudN5Gq?=
 =?iso-8859-1?Q?5TbpNru9+klm7k66vfZoUiVmcN0AscoxTJc8CnX1J+EQ/qE3In4AAxi/IN?=
 =?iso-8859-1?Q?0gYW8x39ddZr8EBIvhRYMrafjR9kjIP1woteLGQ6Aw5Tgl8BSpg4bhPYX9?=
 =?iso-8859-1?Q?A4tNu6mwAfBLW15+hRrxSfyakqLXyIXNIF3dqRIlcWDtSXFcC8aI9aBKiV?=
 =?iso-8859-1?Q?sg0a3eaHJ45SO6G3MkjWgXNMTWJWeH8H32yMCnx28hLeoBxrCq0n7l1f/T?=
 =?iso-8859-1?Q?B+4sAJKwoOLWNJ3TDu+j+QfPT8f6l+K+51K9gMnjK85VgYMnljHMz4bgJT?=
 =?iso-8859-1?Q?ogxYnU+5dHj7ukpxBSV9Gw/6hdfaotUPHNrsAyC9yTIf2Xa+wVi1/lbdBh?=
 =?iso-8859-1?Q?A7Q4ePlHtJ6089fxi06UyxTRF8Ete/wroGurQ9eLZw3CHF09yBXK3qSsAx?=
 =?iso-8859-1?Q?8C18PI6aGVy8BqILMKLWpsFycP7jdxTQWjE6UZfFoYPNmTU+seK+7a6eUA?=
 =?iso-8859-1?Q?g8BXIpVz+hQ1CZafQosm8ZCY7aeImdsNTXXfZjee9EtdWdu1pswP/QeKY0?=
 =?iso-8859-1?Q?0ngNwYDJDAeKWxHkbLEthTnM4XLn9oaUyzje+w2e5Zr7lYRRjJC8h28jBb?=
 =?iso-8859-1?Q?QdHYQ6mIrjj1oGbjrcge1p2jbbyShUoG0K3FnlGdcf7E3g6FTra+JiDHtq?=
 =?iso-8859-1?Q?iFMwdshzoF8d9M59t1Z4A7Lt21FkBNerz6hQiOfj4quIJPPn/FH6536xSR?=
 =?iso-8859-1?Q?36tZ1UwNuNCH7uvR8x30t9MAAe0b80VhOwa1U/UNOu2M/bv19vyLb4RWq2?=
 =?iso-8859-1?Q?oqCvYdavs6pZx0T6OMy9kmJvGxVrYoKteFnQKrma2U42fI3Xz1w1RB6QWs?=
 =?iso-8859-1?Q?f86q8yPVwfOIu9FokhP2oU/aXuOv5gsYlIj0tNuIPSu3sGMbll1vdOBZoS?=
 =?iso-8859-1?Q?up/Pfj52828FAx0q9qFIgxl3oJGYC+ArWVSBW6ymz/16HBPMersfC5XiVC?=
 =?iso-8859-1?Q?LTD5SEsOTy2w/YTAHNNViRqLY9DJ1sCZY6PCPZHAA/tmRv1OGVrAxNdd4L?=
 =?iso-8859-1?Q?qya/c1dA2VCuGeGSMyvr7yRzIV7d7fG4peFjkMtQwEaqeyDWXTIWF5Dg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef7a720-132a-4e30-c3a1-08dd4c79d497
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 22:00:27.3488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FAEY+YnP6ZqFZLxlzvvYnH2BVcMtveejHLgJ0lgPe0YxQrMhgB/l9dCJZc1kzfuoBa62fIWm21QwnC2CCEzNPPhrRHJzit3afbUpG6BW/Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7069

Enable previously added CONFIG_STACK_PROTECTOR feature for ARM
platform. Initialize stack protector very early, at the very beginning
of start_xen() function.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v5:

 - Call boot_stack_chk_guard_setup() from start_xen()
   instead of early ASM
---
 xen/arch/arm/Kconfig | 1 +
 xen/arch/arm/setup.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a26d3e1182..8f1a3c7d74 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -16,6 +16,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
+	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
=20
 config ARCH_DEFCONFIG
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c1f2d1b89d..0dca691207 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -30,6 +30,7 @@
 #include <xen/virtual_region.h>
 #include <xen/version.h>
 #include <xen/vmap.h>
+#include <xen/stack-protector.h>
 #include <xen/trace.h>
 #include <xen/libfdt/libfdt-xen.h>
 #include <xen/acpi.h>
@@ -305,6 +306,8 @@ void asmlinkage __init start_xen(unsigned long fdt_padd=
r)
     struct domain *d;
     int rc, i;
=20
+    boot_stack_chk_guard_setup();
+
     dcache_line_bytes =3D read_dcache_line_bytes();
=20
     percpu_init_areas();
--=20
2.47.1

