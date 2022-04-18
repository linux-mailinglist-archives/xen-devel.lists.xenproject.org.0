Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3BD504A35
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 02:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306802.521974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngFPW-0007Ho-39; Mon, 18 Apr 2022 00:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306802.521974; Mon, 18 Apr 2022 00:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngFPV-0007Fp-VK; Mon, 18 Apr 2022 00:38:33 +0000
Received: by outflank-mailman (input) for mailman id 306802;
 Mon, 18 Apr 2022 00:38:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Fiv=U4=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1ngFPU-0007Fb-IQ
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 00:38:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de69d1bd-beaf-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 02:38:30 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8981.eurprd04.prod.outlook.com (2603:10a6:10:2e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 00:38:28 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%8]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 00:38:28 +0000
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
X-Inumbo-ID: de69d1bd-beaf-11ec-8fbe-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQDo5bVRmjzNVc/l/hicRaPdYVZEb+n4kGwd1Kqo1vU4P65S9hmkfmMUYqefnC9fg6g2fVuBorMfyDa2jcqjeBiaCRpwPeEQqYIhAVvu0oUdp7p2PSUEql9JBGDMVydA7wX7MKIn10Lg4InxNor4fkUHGtNP9ORS41vJuQwCGG1HG2cVzVGhrB+JI7f5ZBwbK5NKD4QhgqmfTh/2TsD6FwC0k8TtDCXNeXBJzDFOA0rm/hiPqAas+UtELOktYM0MGYsKmjeK6lj1yVRXOBn1MF5cdk0nIfrE1azsZMFaoNW37gaUrahzdeLLacD5IP54AI3cKRlS2Q+ntjIgcxnvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbwKF2f0yg06bsFysHLKsTYaFaqea66AklRc9H6oONY=;
 b=n1nis8asxa0yhLYRqqw8zIvPCRlk7Skll6pMI/FOSFXHBgdWie764e4FVcPb1EvUr7qccOOvYx0lzExFP/pIRAlnFfyjNmwEV6NJPyKLHryiW/mUQN8omzbZoHI19Gg+0+opu8d3SOF5ttmbC5qhoG8e4Jek3/2izxC9+igSvWDbUEqiXlvY3sn18B7QqOE3BoC/Y+D+0X7EFA8zCWSO/n/MpNM9YbgRmtvGVQAN2CBkC9NUPdgUqxhJfdUbWYof6f6/sHDoxNcNmi0OGjHDTlwI1o0968c9ZjnkO8i5Zw1PDYS94KdckKPiUFLMpKyXVYVznlnrlfSC2l0YVX+Iew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbwKF2f0yg06bsFysHLKsTYaFaqea66AklRc9H6oONY=;
 b=TZiES3b4J0CysS/Pc/ADEXNSZow+GwzC3ci8GxyDIFmoazELkJ6o/yZpB8V1SZ3fgd0u5H0xs0mKFT8MSf6p7ySiPcdO51ecz2Be6vIqrOITGgff9hwuuUW1Kse/kwvBWFUQeaV+2djliYxQYUfvWbVXBOm+KTV3C03/d0D8enk=
From: Peng Fan <peng.fan@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: "julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"wl@xen.org" <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "van.freenix@gmail.com"
	<van.freenix@gmail.com>, "michal.orzel@arm.com" <michal.orzel@arm.com>, Henry
 Wang <Henry.Wang@arm.com>
Subject: RE: [PATCH V5 1/2] xen/arm: Add i.MX lpuart driver
Thread-Topic: [PATCH V5 1/2] xen/arm: Add i.MX lpuart driver
Thread-Index: AQHYT83HqYjaMfsCa0Wqq3F8Df72S6zxkDgAgANItFA=
Date: Mon, 18 Apr 2022 00:38:27 +0000
Message-ID:
 <DU0PR04MB94178AA133761F3908DABE3E88F39@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220414074452.14419-1-peng.fan@oss.nxp.com>
 <20220414074452.14419-2-peng.fan@oss.nxp.com>
 <alpine.DEB.2.22.394.2204151525120.915916@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204151525120.915916@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6204fa9-f4b9-43b7-ef62-08da20d3c177
x-ms-traffictypediagnostic: DU2PR04MB8981:EE_
x-microsoft-antispam-prvs:
 <DU2PR04MB89816A1407388ED5DEC540AD88F39@DU2PR04MB8981.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pF5oeiXLC8yqsU2+Em72hmKT8KNOsgeCXJd5UKYxhfFzbhyBUllh9e5d59evFhnz8q3wYBKYN/CuNdVtqw1Cq04CfULq8NH27Q6/5XRLe+F4lIlW/oTN3gJEyTv4LZfdKFRiYPWt6Ub9zWDBihzlErk+uSiobRwJIYza+yEerdksGRUzWL2a+WG/FX9tHd6ZPOqrwaP4/7OTwDYskfZON/a2IejhZLHut014vl4nJeTRM89EEwtvkEqkT6Jqli2+h6E5FiaVKSxB/czB9WSM5HU6q1s9iOdz4hlLrzAOgH1uCryLYZgUEp0xGmoWR3OG+QKcSlVZQYDVp9wQuw9QP2RCdo6oT4+ha5PcDBRjxHdOiK0raYAgdsZDo9t+pY2jNaC779eWiRarscRXJGODiLlQbl9UcvosBjdmTU+5ZKsG0W1tFaV893bEJlNqgec3uPxnqE6od3al/J6PcUSZFtpgqEJOYaIpynkZm2aDwzz32LeVF1ruAiL5Pj0cB1jCbf0qvb/WxRJigFr5+p0VIE/ZmM2ATU3rhvuyRPevXPTENonq7fXG6PZIjD4HL9Tf0XN4UFTaCBiSuDteWwwZA4vee9DBaZMaAi7wdDs82uXz0SOceh/66yiPrpnsW9fimWFy/nAB5MVg89sn3el9H9Bfi3FRw5Vl/LU+br0Ao7np90tKxN+/Lo2dh5Qc5rXPDrUnL7DbXadsmTWr3wJcOorFD2d6UGfRSnK6+TDABRgzlwN6XDEgJ2VXYfHK5pemmNRbFk901/1fD6yTtGcTTLWup0EkfCF4FiZszFouyWIyxRW9tjxH3EtOKofSk8BG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(2906002)(83380400001)(966005)(6506007)(9686003)(55016003)(86362001)(122000001)(8936002)(45080400002)(30864003)(52536014)(5660300002)(7416002)(44832011)(508600001)(7696005)(38100700002)(71200400001)(186003)(316002)(38070700005)(76116006)(64756008)(66946007)(66556008)(66476007)(8676002)(4326008)(54906003)(66446008)(26005)(110136005)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2dIvvep0KaThtrHfihC8ixLV4fjLo1NZedpH8YxUhiK7JT49ig7rxybckRsI?=
 =?us-ascii?Q?+rRZQQ412agMW2MXkOirZYMXebPxxUlRsSTVN6+k/Be/AHA5dCQs78tco8Dx?=
 =?us-ascii?Q?o3bYNBmblTVm3S5AC6oKX97HlFzHSgl12G5DNrHvYK5y6NGbawWZ3Tjd5oAc?=
 =?us-ascii?Q?Uu1BwLhyDtyrmp0m/0/9FYcScvfOn0iSCsA6+nB40iZ5j5vkRUpN4Ox1ybsX?=
 =?us-ascii?Q?+lgyj2NG+kx7Y08/sWjgj+nPVOmK5NvrXjhH536KqoWu3tUmALtfOisLtcCm?=
 =?us-ascii?Q?TGc3dFieevYBXiiEjkLSaT2xI0ba4akr672HnyJzq+bHcgiwu/fYUdHa6yX2?=
 =?us-ascii?Q?FTNMyMZ9KkazzaHyY2GEaLdAGMZ1HILkNFgbzICJjYmIyiHU6euvFKS+dh+b?=
 =?us-ascii?Q?k6UNj9/4fGiGOPh8ao/vO1vWCDEUi0zu6BYI6iTR2kYm0GDL/c8EMCuLeyp8?=
 =?us-ascii?Q?1MMcW/aRtRzzyk6g7+WS/sKY6oUkoVp18kf5XxYqBWsb/+WzK45qWQirCpP2?=
 =?us-ascii?Q?W+40BBPCsBHsLh0mM2YFuDwGsaKkSvInABoFYrUvBG8lRrLj/KuhrRlEA3g2?=
 =?us-ascii?Q?DTQUzccyC9hvP4yBd+WEPVxAc0TGpJkkoWX8YW37z+8wXt7kEhdthzBDobSJ?=
 =?us-ascii?Q?GmOooHLJtBvtlEZWg1/yrw6ba+X+HvFDTcLwZ08ohTVH+HZFwOAvo/rvrz6e?=
 =?us-ascii?Q?RmDK4VCLcjEERdh2HAHFvGvBCnLi3G8ylO853zn0iVyfI9D+mN7EK6F3uP1q?=
 =?us-ascii?Q?1A34uY2v2XB2LpB+kAnJv4dGT+Xb1kVHFAO7iz1CCSyCNBRcdScRFQ1HFYWu?=
 =?us-ascii?Q?DAjQd25SGkpkT201YMlbJXH9yzMhvqWCbl5xdvtbUYivt2yJVNskWQmf2XJa?=
 =?us-ascii?Q?Tz8C8fKoUSQdwCvZw3NPksl5B+hVe4EwU5Jaz1pCnnvS3iu9giLl+MB8cAQV?=
 =?us-ascii?Q?MjC29ayoh8IMuKu256jZxz+OVbI3OkJbaRk2uSzLqfCRBYPvn5eZu3NTygVI?=
 =?us-ascii?Q?87beLuWpWFPkNSaH4YDgPWiZzFChFMXun58bDIsmD046PVgrJV2Un1lHqG9R?=
 =?us-ascii?Q?pPiyqaPEq7d54XfvJeanzy2m8NjjAGpBcwig/aGrGYC5B1DVpMp9rMjoMYrf?=
 =?us-ascii?Q?9Q6LoOcgCzA2K42WsALMe1+qenTYz3PN7M34strfBB4dcCFfQMuFTj1UjKu1?=
 =?us-ascii?Q?LdIY0QzIEx1SH9B9Tp+kznUMyWac/9Q3/L09K1Ne1yGBDOcbAhhVorv649Cu?=
 =?us-ascii?Q?G60JOdZYTPgX8Fnj26I1yAncQBY5vU7jjojAKKg3/0/TygK8bn0aNArRkQNo?=
 =?us-ascii?Q?OpVem4IG2FmcXz9/SxTDngqLiEjvqXvG72LlG2BSlHkugGTDaM1H4FUiLyT0?=
 =?us-ascii?Q?I+3JFaskOvTfVnmq7KhcyPcdPKWIGtZ1fnGn1liYsv2z01OlgAfrnalv1qf1?=
 =?us-ascii?Q?FTgd+VsyD0mcGYB/vlYhT60o/SC72PXrYY43t/iWajMlge8PqpPzOdDBbspI?=
 =?us-ascii?Q?EfXXc8lqMYe0R8K/fC+HNh17UQ38TifzAkY23mSFMVcSKPczCRGvvFPSXphw?=
 =?us-ascii?Q?lIU4DSPSrYjwSPXea46XuPJKcYenTmYzfha/5Dywwtm95JDu3kByxwp1mIcZ?=
 =?us-ascii?Q?8Lf/O3GDmGx+aSm6gRMoApi1XIi/xEyx4EccvjGRaPawNfzBpH47orgvf3eH?=
 =?us-ascii?Q?Wi081xUifUPPuq2P3C5FWPvSbGOXPUbVhYqZsQh2+0B/1dp1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6204fa9-f4b9-43b7-ef62-08da20d3c177
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 00:38:28.0054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svfpBOK+WVecOD98c+YpaZPRs1qM7YERAesoexBlDsWINkDAtbYb2ZaBCL0Sp1CRhjqHl/wrilNKF2sEabg3uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8981

> Subject: Re: [PATCH V5 1/2] xen/arm: Add i.MX lpuart driver
>=20
> On Thu, 14 Apr 2022, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The i.MX LPUART Documentation:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww=
.
> >
> nxp.com%2Fwebapp%2FDownload%3FcolCode%3DIMX8QMIEC&amp;data=3D04
> %7C01%7Cp
> >
> eng.fan%40nxp.com%7Caf595d02a1dd4ed5825b08da1f2f0e78%7C686ea1d3bc
> 2b4c6
> >
> fa92cd99c5c301635%7C0%7C0%7C637856584221931187%7CUnknown%7CTW
> FpbGZsb3d
> >
> 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C
> >
> 3000&amp;sdata=3D3N2TsMqzhHF5dem1Cyeo2HVdgfTJFnPHSoMW7KrNph8%3D
> &amp;rese
> > rved=3D0 Chatper 13.6 Low Power Universal Asynchronous Receiver/
> > Transmitter (LPUART)
> >
> > Tested-by: Henry Wang <Henry.Wang@arm.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  xen/arch/arm/include/asm/imx-lpuart.h |  64 ++++++
> >  xen/drivers/char/Kconfig              |   7 +
> >  xen/drivers/char/Makefile             |   1 +
> >  xen/drivers/char/imx-lpuart.c         | 276 ++++++++++++++++++++++++++
> >  4 files changed, 348 insertions(+)
> >  create mode 100644 xen/arch/arm/include/asm/imx-lpuart.h
> >  create mode 100644 xen/drivers/char/imx-lpuart.c
> >
> > diff --git a/xen/arch/arm/include/asm/imx-lpuart.h
> > b/xen/arch/arm/include/asm/imx-lpuart.h
> > new file mode 100644
> > index 0000000000..fe859045dc
> > --- /dev/null
> > +++ b/xen/arch/arm/include/asm/imx-lpuart.h
> > @@ -0,0 +1,64 @@
> > +/*
> > + * xen/arch/arm/include/asm/imx-lpuart.h
> > + *
> > + * Common constant definition between early printk and the LPUART
> > +driver
> > + *
> > + * Peng Fan <peng.fan@nxp.com>
> > + * Copyright 2022 NXP
> > + *
> > + * This program is free software; you can redistribute it and/or
> > +modify
> > + * it under the terms of the GNU General Public License as published
> > +by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef __ASM_ARM_IMX_LPUART_H__
> > +#define __ASM_ARM_IMX_LPUART_H__
> > +
> > +/* 32-bit register definition */
> > +#define UARTBAUD          (0x10)
> > +#define UARTSTAT          (0x14)
> > +#define UARTCTRL          (0x18)
> > +#define UARTDATA          (0x1C)
> > +#define UARTMATCH         (0x20)
> > +#define UARTMODIR         (0x24)
> > +#define UARTFIFO          (0x28)
> > +#define UARTWATER         (0x2c)
> > +
> > +#define UARTSTAT_TDRE     BIT(23, UL)
> > +#define UARTSTAT_TC       BIT(22, UL)
> > +#define UARTSTAT_RDRF     BIT(21, UL)
> > +#define UARTSTAT_OR       BIT(19, UL)
> > +
> > +#define UARTBAUD_OSR_SHIFT    (24)
> > +#define UARTBAUD_OSR_MASK     (0x1f)
> > +#define UARTBAUD_SBR_MASK     (0x1fff)
> > +#define UARTBAUD_BOTHEDGE     (0x00020000)
> > +#define UARTBAUD_TDMAE        (0x00800000)
> > +#define UARTBAUD_RDMAE        (0x00200000)
> > +
> > +#define UARTCTRL_TIE      BIT(23, UL)
> > +#define UARTCTRL_TCIE     BIT(22, UL)
> > +#define UARTCTRL_RIE      BIT(21, UL)
> > +#define UARTCTRL_ILIE     BIT(20, UL)
> > +#define UARTCTRL_TE       BIT(19, UL)
> > +#define UARTCTRL_RE       BIT(18, UL)
> > +#define UARTCTRL_M        BIT(4, UL)
> > +
> > +#define UARTWATER_RXCNT_OFF     24
> > +
> > +#endif /* __ASM_ARM_IMX_LPUART_H__ */
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig index
> > 2ff5b288e2..e5f7b1d8eb 100644
> > --- a/xen/drivers/char/Kconfig
> > +++ b/xen/drivers/char/Kconfig
> > @@ -13,6 +13,13 @@ config HAS_CADENCE_UART
> >  	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zyn=
q
> >  	  based board, say Y.
> >
> > +config HAS_IMX_LPUART
> > +	bool "i.MX LPUART driver"
> > +	default y
> > +	depends on ARM_64
> > +	help
> > +	  This selects the i.MX LPUART. If you have i.MX8QM based board, say =
Y.
> > +
> >  config HAS_MVEBU
> >  	bool "Marvell MVEBU UART driver"
> >  	default y
> > diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
> > index 7c646d771c..14e67cf072 100644
> > --- a/xen/drivers/char/Makefile
> > +++ b/xen/drivers/char/Makefile
> > @@ -8,6 +8,7 @@ obj-$(CONFIG_HAS_MVEBU) +=3D mvebu-uart.o
> >  obj-$(CONFIG_HAS_OMAP) +=3D omap-uart.o
> >  obj-$(CONFIG_HAS_SCIF) +=3D scif-uart.o
> >  obj-$(CONFIG_HAS_EHCI) +=3D ehci-dbgp.o
> > +obj-$(CONFIG_HAS_IMX_LPUART) +=3D imx-lpuart.o
> >  obj-$(CONFIG_ARM) +=3D arm-uart.o
> >  obj-y +=3D serial.o
> >  obj-$(CONFIG_XEN_GUEST) +=3D xen_pv_console.o diff --git
> > a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.c new
> > file mode 100644 index 0000000000..df44f91e5d
> > --- /dev/null
> > +++ b/xen/drivers/char/imx-lpuart.c
> > @@ -0,0 +1,276 @@
> > +/*
> > + * xen/drivers/char/imx-lpuart.c
> > + *
> > + * Driver for i.MX LPUART.
> > + *
> > + * Peng Fan <peng.fan@nxp.com>
> > + * Copyright 2022 NXP
> > + *
> > + * This program is free software; you can redistribute it and/or
> > +modify
> > + * it under the terms of the GNU General Public License as published
> > +by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <xen/errno.h>
> > +#include <xen/init.h>
> > +#include <xen/irq.h>
> > +#include <xen/mm.h>
> > +#include <xen/serial.h>
> > +#include <asm/device.h>
> > +#include <asm/imx-lpuart.h>
> > +#include <asm/io.h>
> > +
> > +#define imx_lpuart_read(uart, off)       readl((uart)->regs + off)
> > +#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs +
> > +off)
> > +
> > +static struct imx_lpuart {
> > +    uint32_t baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
> > +    uint32_t irq;
> > +    char __iomem *regs;
> > +    struct irqaction irqaction;
> > +    struct vuart_info vuart;
> > +} imx8_com;
> > +
> > +static void imx_lpuart_interrupt(int irq, void *data,
> > +                                 struct cpu_user_regs *regs) {
> > +    struct serial_port *port =3D data;
> > +    struct imx_lpuart *uart =3D port->uart;
> > +    uint32_t sts, rxcnt;
> > +
> > +    sts =3D imx_lpuart_read(uart, UARTSTAT);
> > +    rxcnt =3D imx_lpuart_read(uart, UARTWATER) >> UARTWATER_RXCNT_OFF;
> > +
> > +    if ( (sts & UARTSTAT_RDRF) || (rxcnt > 0) )
> > +	    serial_rx_interrupt(port, regs);
> > +
> > +    if ( sts & UARTSTAT_TDRE )
> > +	    serial_tx_interrupt(port, regs);
> > +
> > +    imx_lpuart_write(uart, UARTSTAT, sts); }
> > +
> > +static void __init imx_lpuart_init_preirq(struct serial_port *port) {
> > +    struct imx_lpuart *uart =3D port->uart;
> > +    uint32_t ctrl, old_ctrl, bd;
> > +
> > +    old_ctrl =3D imx_lpuart_read(uart, UARTCTRL);
> > +    ctrl =3D (old_ctrl & ~UARTCTRL_M) | UARTCTRL_TE | UARTCTRL_RE;
> > +    bd =3D imx_lpuart_read(uart, UARTBAUD);
> > +
> > +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC) )
> > +	    cpu_relax();
> > +
> > +    /* Disable transmit and receive */
> > +    imx_lpuart_write(uart, UARTCTRL, old_ctrl & ~(UARTCTRL_TE |
> > + UARTCTRL_RE));
> > +
> > +    /* Reuse firmware baudrate settings, only disable DMA here */
> > +    bd &=3D ~(UARTBAUD_TDMAE | UARTBAUD_RDMAE);
> > +
> > +    imx_lpuart_write(uart, UARTMODIR, 0);
> > +    imx_lpuart_write(uart, UARTBAUD, bd);
> > +    imx_lpuart_write(uart, UARTCTRL, ctrl); }
> > +
> > +static void __init imx_lpuart_init_postirq(struct serial_port *port)
> > +{
> > +    struct imx_lpuart *uart =3D port->uart;
> > +    uint32_t temp;
> > +
> > +    uart->irqaction.handler =3D imx_lpuart_interrupt;
> > +    uart->irqaction.name =3D "imx_lpuart";
> > +    uart->irqaction.dev_id =3D port;
> > +
> > +    if ( setup_irq(uart->irq, 0, &uart->irqaction) !=3D 0 )
> > +    {
> > +        dprintk(XENLOG_ERR, "Failed to allocate imx_lpuart IRQ %d\n",
> > +                uart->irq);
> > +        return;
> > +    }
> > +
> > +    /* Enable interrupts */
> > +    temp =3D imx_lpuart_read(uart, UARTCTRL);
> > +    temp |=3D (UARTCTRL_RIE | UARTCTRL_TIE);
> > +    temp |=3D UARTCTRL_ILIE;
> > +    imx_lpuart_write(uart, UARTCTRL, temp); }
> > +
> > +static void imx_lpuart_suspend(struct serial_port *port) {
> > +    BUG();
> > +}
> > +
> > +static void imx_lpuart_resume(struct serial_port *port) {
> > +    BUG();
> > +}
> > +
> > +static int imx_lpuart_tx_ready(struct serial_port *port) {
> > +    struct imx_lpuart *uart =3D port->uart;
> > +
> > +    return imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC; }
> > +
> > +static void imx_lpuart_putc(struct serial_port *port, char c) {
> > +    struct imx_lpuart *uart =3D port->uart;
> > +
> > +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TDRE) )
> > +        cpu_relax();
> > +
> > +    imx_lpuart_write(uart, UARTDATA, c); }
> > +
> > +static int imx_lpuart_getc(struct serial_port *port, char *pc) {
> > +    struct imx_lpuart *uart =3D port->uart;
> > +    int ch;
> > +
> > +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_RDRF) )
> > +	    return 0;
> > +
> > +    ch =3D imx_lpuart_read(uart, UARTDATA);
> > +    *pc =3D ch & 0xff;
> > +
> > +    if ( imx_lpuart_read(uart, UARTSTAT) &  UARTSTAT_OR )
> > +        imx_lpuart_write(uart, UARTSTAT, UARTSTAT_OR);
> > +
> > +    return 1;
> > +}
> > +
> > +static int __init imx_lpuart_irq(struct serial_port *port) {
> > +    struct imx_lpuart *uart =3D port->uart;
> > +
> > +    return ((uart->irq > 0) ? uart->irq : -1); }
> > +
> > +static const struct vuart_info *imx_lpuart_vuart_info(struct
> > +serial_port *port) {
> > +    struct imx_lpuart *uart =3D port->uart;
> > +
> > +    return &uart->vuart;
> > +}
> > +
> > +static void imx_lpuart_start_tx(struct serial_port *port) {
> > +    struct imx_lpuart *uart =3D port->uart;
> > +    uint32_t temp;
> > +
> > +    temp =3D imx_lpuart_read(uart, UARTSTAT);
> > +    /* Wait until empty */
> > +    while ( !(temp & UARTSTAT_TDRE) )
> > +	    cpu_relax();
>=20
> It looks like this is looping over a stale variable?

Oh, yeah, good catch.


Thanks,
Peng.

>=20
>=20
> > +    temp =3D imx_lpuart_read(uart, UARTCTRL);
> > +    imx_lpuart_write(uart, UARTCTRL, (temp | UARTCTRL_TIE)); }
> > +
> > +static void imx_lpuart_stop_tx(struct serial_port *port) {
> > +    struct imx_lpuart *uart =3D port->uart;
> > +    uint32_t temp;
> > +
> > +    temp =3D imx_lpuart_read(uart, UARTCTRL);
> > +    temp &=3D ~(UARTCTRL_TIE | UARTCTRL_TCIE);
> > +    imx_lpuart_write(uart, UARTCTRL, temp); }
> > +
> > +static struct uart_driver __read_mostly imx_lpuart_driver =3D {
> > +    .init_preirq =3D imx_lpuart_init_preirq,
> > +    .init_postirq =3D imx_lpuart_init_postirq,
> > +    .endboot =3D NULL,
> > +    .suspend =3D imx_lpuart_suspend,
> > +    .resume =3D imx_lpuart_resume,
> > +    .tx_ready =3D imx_lpuart_tx_ready,
> > +    .putc =3D imx_lpuart_putc,
> > +    .getc =3D imx_lpuart_getc,
> > +    .irq =3D imx_lpuart_irq,
> > +    .start_tx =3D imx_lpuart_start_tx,
> > +    .stop_tx =3D imx_lpuart_stop_tx,
> > +    .vuart_info =3D imx_lpuart_vuart_info, };
> > +
> > +static int __init imx_lpuart_init(struct dt_device_node *dev,
> > +                                  const void *data) {
> > +    const char *config =3D data;
> > +    struct imx_lpuart *uart;
> > +    int res;
> > +    u64 addr, size;
> > +
> > +    if ( strcmp(config, "") )
> > +        printk("WARNING: UART configuration is not supported\n");
> > +
> > +    uart =3D &imx8_com;
> > +
> > +    uart->baud =3D 115200;
> > +    uart->data_bits =3D 8;
> > +    uart->parity =3D 0;
> > +    uart->stop_bits =3D 1;
> > +
> > +    res =3D dt_device_get_address(dev, 0, &addr, &size);
> > +    if ( res )
> > +    {
> > +        printk("imx8-lpuart: Unable to retrieve the base"
> > +               " address of the UART\n");
> > +        return res;
> > +    }
> > +
> > +    res =3D platform_get_irq(dev, 0);
> > +    if ( res < 0 )
> > +    {
> > +        printk("imx8-lpuart: Unable to retrieve the IRQ\n");
> > +        return -EINVAL;
> > +    }
> > +    uart->irq =3D res;
> > +
> > +    uart->regs =3D ioremap_nocache(addr, size);
> > +    if ( !uart->regs )
> > +    {
> > +        printk("imx8-lpuart: Unable to map the UART memory\n");
> > +        return -ENOMEM;
> > +    }
> > +
> > +    uart->vuart.base_addr =3D addr;
> > +    uart->vuart.size =3D size;
> > +    uart->vuart.data_off =3D UARTDATA;
> > +    /* tmp from uboot */
> > +    uart->vuart.status_off =3D UARTSTAT;
> > +    uart->vuart.status =3D UARTSTAT_TDRE;
> > +
> > +    /* Register with generic serial driver */
> > +    serial_register_uart(SERHND_DTUART, &imx_lpuart_driver, uart);
> > +
> > +    dt_device_set_used_by(dev, DOMID_XEN);
> > +
> > +    return 0;
> > +}
> > +
> > +static const struct dt_device_match imx_lpuart_dt_compat[]
> > +__initconst =3D {
> > +    DT_MATCH_COMPATIBLE("fsl,imx8qm-lpuart"),
> > +    { /* sentinel */ },
> > +};
> > +
> > +DT_DEVICE_START(imx_lpuart, "i.MX LPUART", DEVICE_SERIAL)
> > +    .dt_match =3D imx_lpuart_dt_compat,
> > +    .init =3D imx_lpuart_init,
> > +DT_DEVICE_END
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > --
> > 2.35.1
> >

