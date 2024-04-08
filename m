Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0B589CF00
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 01:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702070.1096839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtybW-0001pD-Gf; Mon, 08 Apr 2024 23:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702070.1096839; Mon, 08 Apr 2024 23:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtybW-0001mk-DJ; Mon, 08 Apr 2024 23:40:46 +0000
Received: by outflank-mailman (input) for mailman id 702070;
 Mon, 08 Apr 2024 23:40:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bW3C=LN=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rtybU-0001me-HM
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 23:40:44 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20701.outbound.protection.outlook.com
 [2a01:111:f403:2607::701])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69f11989-f601-11ee-914f-f14010f3f246;
 Tue, 09 Apr 2024 01:40:43 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8989.eurprd04.prod.outlook.com (2603:10a6:102:20c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 23:40:40 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7386.037; Mon, 8 Apr 2024
 23:40:40 +0000
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
X-Inumbo-ID: 69f11989-f601-11ee-914f-f14010f3f246
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLdlPUJY1Wc3RDsRkIXnMr6Hry7CWhlB8qRLFLR/Nwb+vidLURWkouBksoeZSUWy9fuDIuF2OHMPVu122/RC7W6yiyWMXiccmONmQButF+oHq3e70xeeueaN78CVTt2kQNHsuDdeSGefnllzE15S7y6wa669JQFAXm07gpDlsoxsYibuGEYwnKdpOqWCvQsMh82n1trPOQV5EqA+KP0dP18Vd8IigfuNn7EMqr8j9GOPwu4efHLBhSeOLWT+0VVFgvA5DFFX+jWObfsDKyLM2x1YpWr+oI2h3V9vOPgoh4PqB484o9wdatJ8CWXWQJJOPQpe6W8wJLxxtL3VJQJWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C59bRSeFCNSZs8+VdasaFgI9GfkNc2/LzwZOKZoFGM8=;
 b=EWSoX6YlZ6L2imLhR1C68qm9AzsObmm0dCkn9xrMrMScezAa5lLYypnZlndkSUR25Y/Dq9+NpzTf/vVofAjoQt/uVxWN3q3W1/5uqjCyC6a3GGvu63TuS1vPLQO7dZogHsjvq8llJl+gam1cA0HkpoHOvgpkx5gSqVh4Iu77oZqoxYVrlCzTiSj/fEloTrWt762h+xTL4DOgh6S9+i2uksXmJpbYzzG7xtQQDK/TIze5VuEbDbg1HAArDexb2FfFNcKs88LAt5BGAkkm7R2W34u/M280OOdiaiHWsRHUNCpSMSzkEQk7Wy0wEPJjO9rPtqel9mq/P5200k0pgANNzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C59bRSeFCNSZs8+VdasaFgI9GfkNc2/LzwZOKZoFGM8=;
 b=smgQm4fbhpP2sr5h5HUGXaV+KBI0ftHILL2nYCKUqAw5WjX2leLkdqSoNnEvqWoWPyL+J4nmHpLIo303+or4rBTW2ajOf2u3wib/IKLMe/dZBWcN72n2VSFjriYvQpKXmQJSJ3ZOCn+yfZ+yNJ0Y8WqqPtrmaJmnQW+cYz6rEPE=
From: Peng Fan <peng.fan@nxp.com>
To: John Ernberg <john.ernberg@actia.se>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jonas
 Blixt <jonas.blixt@actia.se>
Subject: RE: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaic9tXQJwwldfJUm8+1aRDWuvfLFfCI2w
Date: Mon, 8 Apr 2024 23:40:40 +0000
Message-ID:
 <DU0PR04MB94179F0869716F8DF299B0D388002@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240408161129.900347-1-john.ernberg@actia.se>
 <20240408161129.900347-2-john.ernberg@actia.se>
In-Reply-To: <20240408161129.900347-2-john.ernberg@actia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PAXPR04MB8989:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 EJB9qGdTHiodcWalzXXnHS7tpVBFSghlk1ZTxQUULg0YGqiwddPcBEr4ksx/Zxjgq3VZm4KSi/1iiL1ko2er4MQteUZfZzgnzcAzhf+8NmtXOB0FV+qYwwpaVSSjje34+DvLxI+7DzQLduvsZDJLmS/PcsP1zA15XSnf1suK7ZaHTZbdeG7xLeGbS5UkigcLySucluqEmt+prvqxLINem9GULMFI6FK7mF6GMsVxYEQJOdmdViZVAEzprx72IE6lCBpFsIq+0xqj0nZApwgW1hmxuqA+W6BXXduJq9lIBf/hqkH/A/tN2KmA1gP7iO4fIGzEuh/v9iVuSN7wBlDetzHSDm7XvDIyHbe+Cnpdc9wLslsB46AnbuZ7r/glf4SpVBV9zCHUqhorAe+A1rz2QcH7uXY3vS/1nluTJdgVAe2CC0IIzHxfWiz7gtXxAqJMgSO82BQUtZXSc8WKZWTOBNpVqx+qWR9ixCtMLrCod7PrNWqjnvc6yBO0j5jYnxRVxB+ulwDBID2ms+SP+sZEt6Dok7mW2rwdS6qblTVIJr7S6t3Azcc/LloNsxL1svx9z9EyntTrl9CGHhbw3mR2U+Z03IrkVfbSxl4X3x5W8l5XDI/vmf/T24HvgImCgKCO9j4Ly0VTgh2ZLDpI+pLagaXZRGzSQ8tkLO0FZqvEE3A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KVZ6DKB4DVVRXYcwafvm+Wj5x4mUSE8VwghseJpmZal9Tx7KnVJVMTnkFBt4?=
 =?us-ascii?Q?rMrwbHhYFogS+MZ40fnhnDaKbk/dvgD2imH8lZQObEh4bYRnlcI1LsYVuGy2?=
 =?us-ascii?Q?XuA72rRWcLxtTw7ZJhU7+S0jL1iFiyDQagj+O3w4+TuN245aKTz13AwWAopQ?=
 =?us-ascii?Q?qu1amNWG/gPGlRrZ+p3lErv48hVPyYV6/mv/eoBm/BwrsBOEsy6hAnEGB37b?=
 =?us-ascii?Q?3DOKQsA751C3ll00Ws8csM0TKw+Th3HjuC+KyaQwYYT8L+/j8L+uqkqRihGs?=
 =?us-ascii?Q?EXt4R4iMOtaVL9EO1cETYz28PfdvANfsCdWVM18zudL42PDJKuCkvAHngU/p?=
 =?us-ascii?Q?AswO8ICI5UFL+NdaOhgJswYgAQBATHsG8DnY+YNAXAXxoL8Cuxgfxg5hcq+1?=
 =?us-ascii?Q?J43zEEgDczjAORANXuGm68pV6Cp0Yt78jaPJqlNJxRESksvS1AIJNLJt9FVO?=
 =?us-ascii?Q?aUPFZ5gU7wk+1Rg5F8R0wTxxuJVC/ddjaDewvYGclBpAuWz/4viCawz/Am4/?=
 =?us-ascii?Q?/cwBOUt4oFrCUbHjK4M5qGX52rZG3/jiJ6iU9EjiEqqPBS9bFoRsJte9i8vY?=
 =?us-ascii?Q?lDoDW5T6dzGIUoJFJlg1VXLWr/syFIwBXXj/F1b1KE2XBQUnbMyz+CT1WfhX?=
 =?us-ascii?Q?zgim0C+JafJGAZd1WSmuARvieTCpPu8UBHw74eRFJFksoG8+NQ3yKfQoomoU?=
 =?us-ascii?Q?DLFQg0d4F0OFioZ0cBfjfxEUJJpvDiHKfRV1rQbkqXXhw9jgXGRY+OlclMAA?=
 =?us-ascii?Q?GBsCRQAc6AW/6kk01TsUC2lbsuihOBx51yfuL5f2NmuadDm47Kf/4JSwOh5k?=
 =?us-ascii?Q?Wlpug8OBZhOTa0U7UPsd/+pe37TztWyTjQC3Lfp3Rc8ueIuYABl2FMEbRj4n?=
 =?us-ascii?Q?rW3nnJIw8mK5RrV9fHa74aTnpQCdHuGLkMMcEvyMFlnYxvnO5p0cU1sGh8TX?=
 =?us-ascii?Q?K14QHg0Ol1oYbac/pxDV0pXDvLdU+MRHtcN+U4dIrUTFN+qwZ2vBQaRxqP0X?=
 =?us-ascii?Q?Cz9f4nBT20euIJc/MGo9on8migqNkc6XVMywf/Ndox7EfOhnbMbCzmdcQjOW?=
 =?us-ascii?Q?CPaHIcGAX7ha+Ke+9qxysnW5e/cYbe690shSsn4+FBs1iJNuopA8LKwhCGG5?=
 =?us-ascii?Q?ihAD+WSMLayaOf6oChkmd47B/gK03jXQeoLKHPVIeoPQt4LD8K/oC4KGTZR3?=
 =?us-ascii?Q?ZhEs7HLvgarsp8Q64z8UQ8xOfLyozADKVXGRmxMjOhxxTxbykFjzU8VFNkkS?=
 =?us-ascii?Q?B57Z/gYp+/mcY1pTpZawjw2kB+vZK2CApJCUf/BFrcIkrpdxw0KHN3F7L5O/?=
 =?us-ascii?Q?5HcY2hzVubg5OaqhhOyLO7vGjpZu/HzGm37+9GUr2v+iwvjan8g2LmzyJD/t?=
 =?us-ascii?Q?V2skXp0lVolTgpirYrn6zuwFzcTF7eZTnJYCeo+Ux35XaWWn50Zq7P0AT4GN?=
 =?us-ascii?Q?ZS0LEky6EDDvIaq31KN61Kt7LRWomK78RRjsRk+oHXpGLQQEhKnLyOPPFr0o?=
 =?us-ascii?Q?eILDOsVj66R3c33O2uvGlechqX9q9tFubdKlTp2tECpLN0ZUJyjPmdgUdaeP?=
 =?us-ascii?Q?OXj6TYPISqkBOdrDnrE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c8e538-25a2-41aa-fb18-08dc58254cd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 23:40:40.5065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IJCtoQ7HGDLGXA1UuDhOXcc0XSUY2LpQt5mAtoMsfj472oZTQK7XoLLjlxc2XMIEdQYmUm+owwsZKJVwBUCrVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8989

> Subject: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
>=20
> When using Linux for dom0 there are a bunch of drivers that need to do SM=
C
> SIP calls into the firmware to enable certain hardware bits like the watc=
hdog.
>=20
> Provide a basic platform glue that implements the needed SMC forwarding.
>=20
> The format of these calls are as follows:
>  - reg 0: function ID
>  - reg 1: subfunction ID (when there's a subfunction)  remaining regs: ar=
gs
>=20
> For now we only allow Dom0 to make these calls as they are all managing
> hardware. There is no specification for these SIP calls, the IDs and name=
s have
> been extracted from the upstream linux kernel and the vendor kernel.
>=20
> Most of the SIP calls are only available for the iMX8M series of SoCs, so=
 they
> are easy to reject and they need to be revisited when iMX8M series suppor=
t is
> added.
>=20
> From the other calls we can reject CPUFREQ because Dom0 cannot make an
> informed decision regarding CPU frequency scaling, WAKEUP_SRC is to wake
> up from suspend, which Xen doesn't support at this time.
>=20
> This leaves the TIME SIP, OTP SIPs, BUILDINFO SIP and TEMP ALARM SIP,
> which for now are allowed to Dom0.
>=20
> NOTE: This code is based on code found in NXP Xen tree located here:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b
> .com%2Fnxp-imx%2Fimx-xen%2Fblob%2Flf-
> 5.10.y_4.13%2Fxen%2Farch%2Farm%2Fplatforms%2Fimx8qm.c&data=3D05%7
> C02%7Cpeng.fan%40nxp.com%7C5602a2d54f074c7dcd9608dc57e69286%7
> C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6384818950076004
> 32%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz
> IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DqSf9A7yE17P
> 2q2%2FqXINORXh2EfFAS1%2BilhiY%2FexjcbA%3D&reserved=3D0
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> [jernberg: Add SIP call filtering]
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
>=20
> ---
>=20
> v4:
>  - Fix coding style problems added in v3 (Michal Orzel)
>  - Remove all calls not currently used by Linux on imx8q{m,xp} (Michal Or=
zel)
>  - Fix {g,}printk inconsistencies, prefer gprintk (Michal Orzel)
>=20
> v3:
>  - Adhere to style guidelines for line length and label indentation (Mich=
al
> Orzel)
>  - Use smccc macros to build the SIP function identifier (Michal Orzel)
>  - Adjust platform name to be specific to QM and QXP variants (Michal Orz=
el)
>  - Pick up additional SIPs which may be used by other Linux versions (Mic=
hal
> Orzel)
>  - Changes to the commit message due to above
>=20
> v2:
>  - Reword the commit message to be a bit clearer
>  - Include the link previously added as a context note to the commit mess=
age
> (Julien Grall)
>  - Add Pengs signed off (Julien Grall, Peng Fan)
>  - Add basic SIP call filter (Julien Grall)
>  - Expand the commit message a whole bunch because of the changes to the
> code
> ---
>  xen/arch/arm/platforms/Makefile |   1 +
>  xen/arch/arm/platforms/imx8qm.c | 139
> ++++++++++++++++++++++++++++++++
>  2 files changed, 140 insertions(+)
>  create mode 100644 xen/arch/arm/platforms/imx8qm.c
>=20
> diff --git a/xen/arch/arm/platforms/Makefile
> b/xen/arch/arm/platforms/Makefile index 8632f4115f..bec6e55d1f 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   +=3D sunxi.o
>  obj-$(CONFIG_ALL64_PLAT) +=3D thunderx.o
>  obj-$(CONFIG_ALL64_PLAT) +=3D xgene-storm.o
>  obj-$(CONFIG_ALL64_PLAT) +=3D brcm-raspberry-pi.o
> +obj-$(CONFIG_ALL64_PLAT) +=3D imx8qm.o
>  obj-$(CONFIG_MPSOC_PLATFORM)  +=3D xilinx-zynqmp.o
>  obj-$(CONFIG_MPSOC_PLATFORM)  +=3D xilinx-zynqmp-eemi.o diff --git
> a/xen/arch/arm/platforms/imx8qm.c b/xen/arch/arm/platforms/imx8qm.c
> new file mode 100644 index 0000000000..3600a073e8
> --- /dev/null
> +++ b/xen/arch/arm/platforms/imx8qm.c
> @@ -0,0 +1,139 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/arch/arm/platforms/imx8qm.c
> + *
> + * i.MX 8QM setup
> + *
> + * Copyright (c) 2016 Freescale Inc.
> + * Copyright 2018-2019 NXP
> + *
> + *
> + * Peng Fan <peng.fan@nxp.com>
> + */
> +
> +#include <xen/sched.h>
> +#include <asm/platform.h>
> +#include <asm/smccc.h>
> +
> +static const char * const imx8qm_dt_compat[] __initconst =3D {
> +    "fsl,imx8qm",
> +    "fsl,imx8qxp",
> +    NULL
> +};
> +
> +#define IMX_SIP_FID(fid) \
> +    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, \
> +                       ARM_SMCCC_CONV_64, \
> +                       ARM_SMCCC_OWNER_SIP, \
> +                       (fid))
> +
> +#define IMX_SIP_F_CPUFREQ        0x1
> +#define IMX_SIP_F_TIME           0x2
> +#define IMX_SIP_F_WAKEUP_SRC     0x9
> +#define IMX_SIP_F_OTP_WRITE      0xB
> +
> +#define IMX_SIP_TIME_SF_RTC_SET_TIME     0x00
> +#define IMX_SIP_TIME_SF_WDOG_START       0x01
> +#define IMX_SIP_TIME_SF_WDOG_STOP        0x02
> +#define IMX_SIP_TIME_SF_WDOG_SET_ACT     0x03
> +#define IMX_SIP_TIME_SF_WDOG_PING        0x04
> +#define IMX_SIP_TIME_SF_WDOG_SET_TIMEOUT 0x05
> +#define IMX_SIP_TIME_SF_WDOG_GET_STAT    0x06
> +#define IMX_SIP_TIME_SF_WDOG_SET_PRETIME 0x07
> +
> +static bool imx8qm_is_sip_time_call_ok(uint32_t subfunction_id) {
> +    switch ( subfunction_id )
> +    {
> +    case IMX_SIP_TIME_SF_RTC_SET_TIME:
> +        return true;
> +    case IMX_SIP_TIME_SF_WDOG_START:
> +    case IMX_SIP_TIME_SF_WDOG_STOP:
> +    case IMX_SIP_TIME_SF_WDOG_SET_ACT:
> +    case IMX_SIP_TIME_SF_WDOG_PING:
> +    case IMX_SIP_TIME_SF_WDOG_SET_TIMEOUT:
> +    case IMX_SIP_TIME_SF_WDOG_GET_STAT:
> +    case IMX_SIP_TIME_SF_WDOG_SET_PRETIME:
> +        return true;
> +    default:
> +        gprintk(XENLOG_WARNING, "imx8qm: smc: time: Unknown
> subfunction id %x\n",
> +                subfunction_id);
> +        return false;
> +    }
> +}
> +
> +static bool imx8qm_smc(struct cpu_user_regs *regs) {
> +    uint32_t function_id =3D get_user_reg(regs, 0);
> +    uint32_t subfunction_id =3D get_user_reg(regs, 1);
> +    struct arm_smccc_res res;
> +
> +    if ( !cpus_have_const_cap(ARM_SMCCC_1_1) )
> +    {
> +        printk_once(XENLOG_WARNING
> +                    "imx8qm: smc: no SMCCC 1.1 support. Disabling
> + firmware calls\n");
> +
> +        return false;
> +    }
> +
> +    /* Only hardware domain may use the SIP calls */
> +    if ( !is_hardware_domain(current->domain) )
> +    {
> +        gprintk(XENLOG_WARNING, "imx8qm: smc: No access\n");
> +        return false;
> +    }
> +
> +    switch ( function_id )
> +    {
> +    case IMX_SIP_FID(IMX_SIP_F_CPUFREQ):
> +        /* Hardware domain can't take any informed decision here */
> +        return false;
> +    case IMX_SIP_FID(IMX_SIP_F_TIME):
> +        if ( imx8qm_is_sip_time_call_ok(subfunction_id) )
> +            goto allow_call;
> +        return false;
> +    /* Xen doesn't have suspend support */
> +    case IMX_SIP_FID(IMX_SIP_F_WAKEUP_SRC):
> +        return false;
> +    case IMX_SIP_FID(IMX_SIP_F_OTP_WRITE):
> +        /* subfunction_id is the fuse number, no sensible check possible=
 */
> +        goto allow_call;
> +    default:
> +        gprintk(XENLOG_WARNING, "imx8qm: smc: Unknown function
> id %x\n",
> +                function_id);
> +        return false;
> +    }
> +
> + allow_call:
> +    arm_smccc_1_1_smc(function_id,
> +                      subfunction_id,
> +                      get_user_reg(regs, 2),
> +                      get_user_reg(regs, 3),
> +                      get_user_reg(regs, 4),
> +                      get_user_reg(regs, 5),
> +                      get_user_reg(regs, 6),
> +                      get_user_reg(regs, 7),
> +                      &res);
> +
> +    set_user_reg(regs, 0, res.a0);
> +    set_user_reg(regs, 1, res.a1);
> +    set_user_reg(regs, 2, res.a2);
> +    set_user_reg(regs, 3, res.a3);
> +
> +    return true;
> +}
> +
> +PLATFORM_START(imx8qm, "i.MX 8Q{M,XP}")
> +    .compatible =3D imx8qm_dt_compat,
> +    .smc =3D imx8qm_smc,
> +PLATFORM_END
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --

Reviewed-by: Peng Fan <peng.fan@nxp.com>

