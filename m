Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45232B0EC88
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053422.1422199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUND-000627-LU; Wed, 23 Jul 2025 07:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053422.1422199; Wed, 23 Jul 2025 07:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUND-0005z4-Dt; Wed, 23 Jul 2025 07:58:47 +0000
Received: by outflank-mailman (input) for mailman id 1053422;
 Wed, 23 Jul 2025 07:58:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueUNA-0005W3-VO
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:58:44 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da442aa2-679a-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 09:58:43 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB8082.eurprd03.prod.outlook.com (2603:10a6:102:231::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 07:58:37 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 07:58:37 +0000
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
X-Inumbo-ID: da442aa2-679a-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRWiDO+SywbXPMpGcpETzu/Eh/RobVrI4O7QyWpe+aIAo7F5901pmHPqTzJDVVYzBYIWfrV7vT5GXviGOpWZaWk6IW/Sh17d80/CuzdxxBOnoTNWcpu3apFZbkzYk9tBtlZaIh3pZDA1JcpJGWJEa0EIJGTBDPObgMVokgE2TFpvEiz4jmcv3PxedD98fEaY649/aSDwFyQm+qzr7HR00dD0aC2HEJVl5tgLGk/0bVuj6G8r+RB/OYKONXDeaYTZh3h3Laj0/KFz0TcXHHp4RTeqwWsUXYTplGXVS/ND7nQenooGd6bG30oeXl5idlAENIL+iN3mHjJ0gcycO43mhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92ocE2+ZCS8k7Ho9E1BeWvjPUHOpRsJXnrQryr9sTe0=;
 b=XPjdpRQz8snEWNHPlfD/K56L2w2sjZS3OD2MgpjaFVWBPnivYcGmJbkNe3eMP+Hs716SDqjp/F55+46HPxEsS/Jn/fe4V25j68mRJPPLsfCS/ZaVPmShmgVR1pQp9XzY9fp6AuKBkPq2fdCLJHn9X7vCSzVH/EMU22+PxWK/duzwHMtinuPhnvDOeJ5naWwpxi85cxtJaK0BWCpcbtxS78s95azhcVfTLTAq2sonmRJ9e87P/Xh1uekI6uO/JcN2PWHMxgFJGXiFJQ19sVZV6ENpTqZDourc5mjQi3QRBDjo2T/rSnG7SoifQnITIHO6ldVLnKVPGyQ8+C69GTfBlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92ocE2+ZCS8k7Ho9E1BeWvjPUHOpRsJXnrQryr9sTe0=;
 b=oqvrMoxnicMimPglMBX6AgrRyGd5qEwkv2zTyxxnaoEorR/BIml589Gs53sb6M5zYZapsWGTGz+rHgV3r5OB9pYzrE/fDkAEdVd2YB0TBmsHclb4iwkOZsPeb1VaiU4cwUJ8Y/DnUC96vjZrHGxbut84N9YKawGsMd6vtp26WaOEWxl8ziPkfITDa4q7oj6vfzIHSdlAO7F2yZyqKtJa/MstRVOP9mSTCTBEPnD0CXnfvlUyGnuZYnXubedxSyZYR4whKfwd/IfRyCw80Jc1zD7/Afuba7BJo33CUJaxZba+wND68SZZujXQc0+FPdonAkE5tf35RvoIz/dL3mh7nA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH 1/8] xen/arm: split set_domain_type() between arm64/arm32
Thread-Topic: [XEN][PATCH 1/8] xen/arm: split set_domain_type() between
 arm64/arm32
Thread-Index: AQHb+6eYDYn7grVFnUWddZ9yUxWwIw==
Date: Wed, 23 Jul 2025 07:58:37 +0000
Message-ID: <20250723075835.3993182-2-grygorii_strashko@epam.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
In-Reply-To: <20250723075835.3993182-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PAXPR03MB8082:EE_
x-ms-office365-filtering-correlation-id: 2e42cff0-c8aa-48fc-150d-08ddc9bebb04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xRiwzqg2YzDIh/buR2bU9ZS7wMGivSoNKDm3nVtbFCkh49iItshYW694eK?=
 =?iso-8859-1?Q?3qjAAJDRWYGs+0mV16mlmi0CP4juivpXaUJKv+XbtvoZGWdZadHtnuLsNa?=
 =?iso-8859-1?Q?uP86URcLf4dYxN4ncbpHyX1Wqa8bzkB/OoLKFB0R12+hxmW0U+OvJwTnTp?=
 =?iso-8859-1?Q?gHY+wSaN1XBAgIeEribtSBRXg+H6dfPHoJB2yjdJ9U6vBofoPW49S/xLLN?=
 =?iso-8859-1?Q?EpwkVOi4i2Xln5oovhS21nqXS+lFSvH0kNOkGYiU+mVHivhdMJKkQ9adhN?=
 =?iso-8859-1?Q?F2sO5gy8mULLK0DiWF458cfrVXh9kEPavYbY0fSsRQ3atmZy11Ah4AdC1x?=
 =?iso-8859-1?Q?m0RoCyCyyQBPx73SUS1lH5MlOGunNWz4LwkZungdcJPc7xMpCHN/603Ifv?=
 =?iso-8859-1?Q?/BIdA6flHHqlIir2eR4fHavZ3DSXm4FBbiNDiYWHiIAyodyi5VzHWEdmD6?=
 =?iso-8859-1?Q?MpHCYTx48X75a0eVPIyMk1D2bkwGEH+X1O+eqeEdlR84BdjgiTlFycbRGU?=
 =?iso-8859-1?Q?k8XzKFWN5rOzAgw3/SlYYM/gN/zJzvyQqVf1HfXwwp9yo8racReluzuBkq?=
 =?iso-8859-1?Q?/H0RTp2qpq14m8qrPFkPGCTid6t3/yzPTHHX9r9iZH0SMUX7M9/3+SFZYp?=
 =?iso-8859-1?Q?QwnxC3K0Vs2zF/QU9b4quy8j2VVowEfu7X5e3MkANCqanYYgGO9BL3knT0?=
 =?iso-8859-1?Q?s8O5bxk8wrCH1RLL/Mb/UFO+0rGuH54qmnTqn99rsoZ5mA73E8CJKlfdGY?=
 =?iso-8859-1?Q?VGK8JGnDfn52SjW0RGmqygRgVgTde0/WFDsTnzeVyEYgQrz2beEeW5pYMw?=
 =?iso-8859-1?Q?Mvtkzc6Ev+ltKh8gk+57Qnr58UDnoZCGVlWVYuRs7W4+8sL9Yg3zVWse8F?=
 =?iso-8859-1?Q?39W0cz0rCqeQgqLhZ+mkmsZyw7bcMCeLgaK0WCHPCzJ/0tdxNyNikQoCbi?=
 =?iso-8859-1?Q?apPFnet1ggXvJIQKpnVWr75q1Dg+a8tgDsRW1N0JDUZSgwYpuo/bE76Osa?=
 =?iso-8859-1?Q?XkOviQnGKAgA1wdEXb+b3T0CY7oVoxwJJPTmWJ5LW2wiUylBV3bb9BuUXW?=
 =?iso-8859-1?Q?xUPSWmvf06oS6zj28tQeCookZo6sPVZ1hXRY4xFm9/ekP6qHD6XWnbiFPh?=
 =?iso-8859-1?Q?yp5iLJ4gpcbCPhWDI51BDKzKMh84HMb8kqF5+m7HBPqGX8NT7gTjoX0Bqd?=
 =?iso-8859-1?Q?xUFvSR/FmzntnIYYzxZLNzTXGMvFZ+QjNNbwBxpwd2Mba1+zWx/fRw1AiU?=
 =?iso-8859-1?Q?EPMp1binNw8MOjopsRq71zRrYRTfm5VUtByoJALR8MtGxaO7TjBYLDo/Df?=
 =?iso-8859-1?Q?1nDeiJT7ZjUgvnbGqyZ7f8AXJp7rsy+Zpf+6LXwI9I6aZ4wFB1CIimXnsZ?=
 =?iso-8859-1?Q?T/xxpyuxBZ69Tw3Q5NXpYO04/EPp64P6QJXJ7Y5ifGy9+ajechkKwZk4U2?=
 =?iso-8859-1?Q?E8mdHDEW99p1NfRkL64pQ/p134VYQmG8VI3d4V3Cdd/ba2N0FAIe/I2ck+?=
 =?iso-8859-1?Q?AipfnfmuLIcr/125Oic538RWgW2/ENPv/6Btdp3lNDig=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tBYJKUmE/LL7+qiF8UtEmv7IA9bwvE5axyY5dO5IjN+YOZV6xrcFOVWRJp?=
 =?iso-8859-1?Q?rPl5l07lpQnwUumOSwqU1hxRLpUK7ksEA8fb3zAHxCTaDfDe6V8rjh55/m?=
 =?iso-8859-1?Q?Rgu96YtLf4xaV/qFVerxgiMzVyBRXfjDmJbTToKfWqD4jhRKgsFWRLZBGO?=
 =?iso-8859-1?Q?ANxm5lRiUlMxuoM9Y8DYbFL/mATN2+jwndUbjk7cR0b2dQUSCpZGTPLSdm?=
 =?iso-8859-1?Q?CWGarCH30hnzUOOnQ0j3ba0XDQ6khqLyhuYzybTnoeYAIudUIZ9qkO91Zt?=
 =?iso-8859-1?Q?KQOFn0FMDEwdcbHcIKyeL1fmDhxLDPw0e1PVpJBkjZCXu2alZce6vw724T?=
 =?iso-8859-1?Q?eaWZ3Q4eN0SrLRLRQ9GHUy+neXhYs3xLpfBShBiGBH6alvxGHcOT2cREeN?=
 =?iso-8859-1?Q?5BGD7cPu8PLI7J+/XUgS3WtJPRwR28jAiI0j3RHkp61CzeKJ2Umw0Mo7WN?=
 =?iso-8859-1?Q?bwWgig3ipsJxHmCcJRoSJ2SD1UARxf0x5ADXIRJ+DxqT3gIUV7tSsMHA/i?=
 =?iso-8859-1?Q?SznMpTmXEVApsnC+b1h3PitjSoV94FZhnsAk04iREcHSXEAwTf2d6Y7K9k?=
 =?iso-8859-1?Q?HQTVj/veDctGpJ8OtQHAP4AQt04LrHkR9EdO+p3u9YBUQIw+0ltptu/mau?=
 =?iso-8859-1?Q?GNo089TQ/zhHNo4nkd2r9pdN44g6f3BuJZkdSHI3TUDeERQwSAugWvsbkn?=
 =?iso-8859-1?Q?IHrCz7+bZ7TGkCznWyRGun+NpVgBmQ0Mu0/cSQdsdkjjcm9SxOq2Opf94k?=
 =?iso-8859-1?Q?yATKU34D5QMRvn7tZ4t9ndK/asXT0NHuPc7pIIORoC588leM7t5yVM4HMS?=
 =?iso-8859-1?Q?1r6Fx4YU/NPPMlROE5K+zmKHvgaSISWaeOURIlPKjmU8bemJCs4AWtiSxk?=
 =?iso-8859-1?Q?ExjS1pcOzSZGVJTp8EDNOAtGssj/jKuIm4tsGcIYzZ5knykyPqaQKVlACt?=
 =?iso-8859-1?Q?UffPiDyfDS2S9V77eNm+5jvPnqCN2XbCrlUYbMmW3mIJhrokdXwXsC5cMp?=
 =?iso-8859-1?Q?byoRuCDkcCOz/3AU1TEop+QM6CoQGTM5PoOT/t1vEKxLu34WoE97jRpa8F?=
 =?iso-8859-1?Q?ePmqYazvZcFaHaZYtsryLuulspfBCA8stzplIYaniFPs+eYWmJpYxyUwgy?=
 =?iso-8859-1?Q?slVGfFehIUVgt+Qj9jvpOsBhFEMfu2zFfHk1iGJDU/CVr7tpGaSnP8YvvK?=
 =?iso-8859-1?Q?ZZCgcT0WDBQVpGXHUV/Zr4YV2/Ud0yZLhzQpjyE+w0pL+EO0g12godnq9B?=
 =?iso-8859-1?Q?Z1+GjXY2YScxaIUzAVkfwRc27nIDDTbdtiQ4/2oCQrsH5japfHnCXAgBGf?=
 =?iso-8859-1?Q?bpHLwhYE4YjCFmC5kXVG6nomKM/8lzM39DIN7J+mYkBIRvsS9RVRfibvw5?=
 =?iso-8859-1?Q?gY1f3Jcyrtz3S7sj7Sx32MQistSL5G6wcHBzRrlDHDIS8G2an4rHWipoRv?=
 =?iso-8859-1?Q?iAGKmSmlsxhuZK3EIwu1xLlEU9xEH+iv3aW7mpqSsbEtmfBKHjadL6jWJX?=
 =?iso-8859-1?Q?IZLRgwVzatgESxLm8U9PU6OVVlvN7TmqroFFzbbaOBQ2yjOj965m5Fdzgi?=
 =?iso-8859-1?Q?vIc98hce3i2Ikh9AaQrsdFFW+U0Cu89yvSOpPOJQatKG9U443UCUiIdZ0f?=
 =?iso-8859-1?Q?L8ZsC+H8otrRlxK/SvvbumkRQWK1pes5nBwnmYrtUs1nXePSfM8m+ijw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e42cff0-c8aa-48fc-150d-08ddc9bebb04
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 07:58:37.4363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EYMQirqEBtYQ0zTIRjkz5JthPArrgsKlJ55auVblV/HOZlRLFS7pDhCqcoiY10gfBIvei5/wl45T+KGGlcIbp/KmQyGNcoIhSruLvuXuwig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8082

From: Grygorii Strashko <grygorii_strashko@epam.com>

Split set_domain_type() between Arm64/Arm32 sub-arches as
set_domain_type() implementation is going to be extended for Arm64.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/arm32/Makefile              |  1 +
 xen/arch/arm/arm32/domain-build.c        | 22 ++++++++++++++++++++++
 xen/arch/arm/arm64/Makefile              |  1 +
 xen/arch/arm/arm64/domain-build.c        | 24 ++++++++++++++++++++++++
 xen/arch/arm/dom0less-build.c            | 14 --------------
 xen/include/asm-generic/dom0less-build.h |  9 +++++++++
 6 files changed, 57 insertions(+), 14 deletions(-)
 create mode 100644 xen/arch/arm/arm32/domain-build.c
 create mode 100644 xen/arch/arm/arm64/domain-build.c

diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 531168f58a0a..0fd3f5272361 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -6,6 +6,7 @@ obj-y +=3D cache.o
 obj-$(CONFIG_EARLY_PRINTK) +=3D debug.o
 obj-y +=3D domctl.o
 obj-y +=3D domain.o
+obj-y +=3D domain-build.o
 obj-y +=3D entry.o
 obj-y +=3D head.o
 obj-y +=3D insn.o
diff --git a/xen/arch/arm/arm32/domain-build.c b/xen/arch/arm/arm32/domain-=
build.c
new file mode 100644
index 000000000000..e34261e4a2ad
--- /dev/null
+++ b/xen/arch/arm/arm32/domain-build.c
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/fdt-kernel.h>
+#include <xen/sched.h>
+
+#include <asm/domain.h>
+
+#ifdef CONFIG_DOM0LESS_BOOT
+void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
+{
+    /* Nothing to do */
+}
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 6491c5350b2e..3272fe7e4ca2 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) +=3D bpi.o
 obj-$(CONFIG_EARLY_PRINTK) +=3D debug.o
 obj-y +=3D domctl.o
 obj-y +=3D domain.o
+obj-y +=3D domain-build.o
 obj-y +=3D entry.o
 obj-y +=3D head.o
 obj-y +=3D insn.o
diff --git a/xen/arch/arm/arm64/domain-build.c b/xen/arch/arm/arm64/domain-=
build.c
new file mode 100644
index 000000000000..3a89ee46b8c6
--- /dev/null
+++ b/xen/arch/arm/arm64/domain-build.c
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/fdt-kernel.h>
+#include <xen/sched.h>
+
+#include <asm/domain.h>
+
+#ifdef CONFIG_DOM0LESS_BOOT
+/* TODO: make arch.type generic ? */
+void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
+{
+    /* type must be set before allocate memory */
+    d->arch.type =3D kinfo->arch.type;
+}
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 69b9ea22ce32..c4b1c2915719 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -236,20 +236,6 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
     return 0;
 }
=20
-/* TODO: make arch.type generic ? */
-#ifdef CONFIG_ARM_64
-void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
-{
-    /* type must be set before allocate memory */
-    d->arch.type =3D kinfo->arch.type;
-}
-#else
-void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
-{
-    /* Nothing to do */
-}
-#endif
-
 int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
                       const struct dt_device_node *node)
 {
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-gen=
eric/dom0less-build.h
index e0ad0429ec74..6b80ffbd8679 100644
--- a/xen/include/asm-generic/dom0less-build.h
+++ b/xen/include/asm-generic/dom0less-build.h
@@ -56,6 +56,15 @@ int init_vuart(struct domain *d, struct kernel_info *kin=
fo,
 int make_intc_domU_node(struct kernel_info *kinfo);
 int make_arch_nodes(struct kernel_info *kinfo);
=20
+/*
+ * Set domain type from struct kernel_info which defines guest Execution
+ * State 32-bit/64-bit (for Arm AArch32/AArch64).
+ * The domain type must be set before allocate_memory.
+ *
+ * @d: pointer to the domain structure.
+ * @kinfo: pointer to the kinfo structure.
+ */
+
 void set_domain_type(struct domain *d, struct kernel_info *kinfo);
=20
 int init_intc_phandle(struct kernel_info *kinfo, const char *name,
--=20
2.34.1

