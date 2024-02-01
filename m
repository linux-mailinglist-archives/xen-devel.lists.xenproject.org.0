Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC384500E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 05:11:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674217.1049019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVOPe-00013P-BD; Thu, 01 Feb 2024 04:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674217.1049019; Thu, 01 Feb 2024 04:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVOPe-00010w-6s; Thu, 01 Feb 2024 04:10:54 +0000
Received: by outflank-mailman (input) for mailman id 674217;
 Thu, 01 Feb 2024 04:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RfkL=JK=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rVOPd-00010q-I6
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 04:10:53 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e29dc848-c0b7-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 05:10:50 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM0PR04MB6836.eurprd04.prod.outlook.com (2603:10a6:208:187::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26; Thu, 1 Feb
 2024 04:10:47 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6%3]) with mapi id 15.20.7249.023; Thu, 1 Feb 2024
 04:10:46 +0000
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
X-Inumbo-ID: e29dc848-c0b7-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxuci8oc2L6yTUp7UbN2BLK64Dw/5k1cBW5/hlcVrq0rMwbLBw3diikd+f8N2lTJOHHufMwtOoAcOZkNAxvxvWgNMF2l3mAFE1PvFYNg5Vgnbjv1Up6UCZRw2eQFMoAT4Io/pVgBcEkSa7gpW3/9bfOgTCUposgywM6RslX80CGKWU57VVzN1Ic4YDJ7yuRWNURepnmmF6qKBZKj11kfQrB0gCsleAC5D6rFoT3b6tf6KqOE6LqukgrbFUOT7D2KDI2KW+X7Wd0cRj+nbdt6JXW3pXYse9qf+mhxK2ihX61ow17qsnEqKcwye2WOM5t/JFrc+FhldDWH+enFNAJEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcVXz3h0TliXCAdcDKfzPkeUDq7pj0aXYjzX7MHA3hI=;
 b=Mal0n89NszSIHOutr+Qf+SJJjcwdsYH2H5yHqr5pemTMJrbeEzMnGvrrJE7SVy/VVYH3B9vXnCidOwAwEI/LBBiKG0rD7NKo6Xc5jECQ8p4C8CyKc/aRr7sdy9JChVmanNQB0rWwzKfb8POb6cyf54/V2rAcYzITVdYhd9odfGsGiSMz7mrcl4NEQaa1uzQiDyouvA4OfWMXr7U8QKDzMcy1tLhcPyH+fuiM4kSJ8moQdPREUZ4D3ptPOtWLfK3tP1YJ9KXIk2KDb4FM+/mRupvecoSauTFjFmhttZoCZOIIV2RbHceJ9R28fRznP1upGDnL+utse3vGdX+VXa+JXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcVXz3h0TliXCAdcDKfzPkeUDq7pj0aXYjzX7MHA3hI=;
 b=CCjZnK1v9DKwnqdLy6gng359AVCmmqQBkb5TgUWTBl/YfemDXb0IlAvzxzORpR1B77humRALy+tuaRvO8bYHnzww6bUnWGZrf5fn/p7OUV6dtDbgNqYk3X9Zr1LoD42hnmzMRi2ONZZkU+BEL3klXY5uwU6GgXLNkJv11hEkh4A=
From: Peng Fan <peng.fan@nxp.com>
To: John Ernberg <john.ernberg@actia.se>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
CC: Jonas Blixt <jonas.blixt@actia.se>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDz198AgAA1LICAANMm8A==
Date: Thu, 1 Feb 2024 04:10:46 +0000
Message-ID:
 <DU0PR04MB941760D4A8972440B5312B2088432@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
In-Reply-To: <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AM0PR04MB6836:EE_
x-ms-office365-filtering-correlation-id: 335956e2-f29d-4a32-8aa1-08dc22dbc475
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sqH9RcPapi5UzcfyjoCF0sDBJaS5dHPs9J9oW0RMSLIHLCq8tLW0mMzytOKOhwQ6c3z04RL6gmJM8nV9kaQ2YSCl3XLFQRZ0WtEVsKnz7BZepBp2bk23QB0D1ah6SrzcVrosRZJAjYqPjbJs9fZNbYfI2j9izaysCjhMswVXJoXtpx0JJzzesHrwdZMHvkp8WJYV2Bw0G1112EP7fq81ALiaEIcCLiYl0uY0zpzAzvGMC+eZK+bcr1AegWgUn3T7SL7sb47jCBqAT2ScqsU+TaPvwkQC9yR7FYwQeQyg2lo2ZKXhZtfJPAc1bKYDf/6qg4+cIZ1UsIbq3RMGTl+X0I2dPT7IzaFueftjxF3cHN7vIkxE0SNwN+MxDv53g2uobrK1l6UwOsvFTHtFWqdQJZmrJR3aAFt3SAo2EW0ApGUepW0O2+1s+bRU+qAEmlGzSSOuVl3D3vF9aDfgOFhNk2CyOVRS1SM61zf77plrm9RuUFAQBfsc51smK3YJFs5WFdo6sDodS4umToOKmDKfOeDbVJzJCgzeVSgG1SQmwza+l1XQG8Kz2otHxrQ6WvrzDN8iHowKgLsRE4uBjdGMlhZDCiN4Fl3bzIbgXg7l4WzDEhCGGpYLWtTIPzH6akiXT7b2wngzWODWCqeOzVWirQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(396003)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(71200400001)(6506007)(7696005)(53546011)(9686003)(8676002)(26005)(8936002)(4326008)(52536014)(44832011)(2906002)(64756008)(316002)(5660300002)(33656002)(54906003)(66556008)(66476007)(66446008)(86362001)(110136005)(38070700009)(66946007)(76116006)(41300700001)(966005)(45080400002)(478600001)(122000001)(55016003)(83380400001)(38100700002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?uz/duHf/AIjb52JGboPfCHdKUYcch1AZdVYbf196hs0qUguAfQou5cCLeT?=
 =?iso-8859-1?Q?baHIYTBy6tzDFj5mfyKyWPBDyT20O7XVeKsU/6n4+ZonOjoAXL7orvkkiT?=
 =?iso-8859-1?Q?+N3kpFu1A5rpVIcwB7Ry8+MfF16PIGb9oRpgB3pzrPyjzizAYd+fAqu0Kt?=
 =?iso-8859-1?Q?w4/VyNH29liEz62gjlk5tg3ZnQTTmIUGO22+UEMlgQzJqxwuFDlqpramEu?=
 =?iso-8859-1?Q?eKf5LVpJnyoMnGkAvGvK3rtxzLs76dDGHcOYU4QIl2WZUb/+kTl+YepJ0c?=
 =?iso-8859-1?Q?ZOCihAtfoqS1bWTPoEQE3hTXpBII08YUBQfWCykZilP5B3MXo8NfFAFkjH?=
 =?iso-8859-1?Q?CR3LCZDlJp17+tRsQjxW5mJuyBeSAD3E4VrMgRcuYrrXrzY9tae0PDIHVo?=
 =?iso-8859-1?Q?Zhws0duLG2X2gdLQ1JUyTfN50Tii5HBWYt29flJOlBWinhg4eV7t3616pY?=
 =?iso-8859-1?Q?QgvxL8ZXMhn3k78m7oYQyJXF7bI0s4P50Voemt70evd7Q21+gt7SOg/ktb?=
 =?iso-8859-1?Q?Dth/gh75J+pNN7mJ29VKYBxOpFgzHafWq6JB3kImvLQ5wufW1DZUk6/TFP?=
 =?iso-8859-1?Q?w6FqN4gAePUG8hKx5j7orOuJceHrkSqfHatDn/AIcIQDmDPEKcMdk3uIjW?=
 =?iso-8859-1?Q?6QsL5axxgY5spi+XrRfkE/RCNt8e4xgPyGjaFYluUHT0JVFVn2QGDsvOkP?=
 =?iso-8859-1?Q?PBtAlick8egCt4i2y8DykBHz84tbZxLudfWP8PB8BSEI+Edpx3YNUzFhIp?=
 =?iso-8859-1?Q?xg/fZMuOxY7kcdaJUV3+GmiMZuFD+PSXE715tAtMOvbIF484qPzaudNpLf?=
 =?iso-8859-1?Q?Fs6oOz7F8ghx/CMnjtJVH9bcWVRWdkQmgJg9UqP/q2oI4bJdV7/f2IqSHN?=
 =?iso-8859-1?Q?QedsVGMVpFeRto54c6DCkJhWOe5mHe8CZZ5T8Mv7hxMZhf2gMjPyyEFRS5?=
 =?iso-8859-1?Q?nPFCPrchbTGkJx7rWHPLNczAU1mKPBDM8fC8YiW4J03RYxu9Gega5tKq09?=
 =?iso-8859-1?Q?mCL/zlawo9L6JkcRVwMxzUUZOeZ26cXbHuI9j+NgdiAcO+V4r359GuN0qq?=
 =?iso-8859-1?Q?z8CJPrZyoXR214Mgir81YUEL8oJexk2w3Ov3pLCNRztmZ+3DPvfclN56pQ?=
 =?iso-8859-1?Q?Rl24ZMQy6hQDZ7rdX/+fMPgvsDVj3YAT1m2/cPkeC0CBeqX0moXoHWfGF8?=
 =?iso-8859-1?Q?Bih6P1rdPcp00/Dm0Dwoo5YDjtV8ajumt/RwBRQRJLquKM6aiBRE5OziAe?=
 =?iso-8859-1?Q?8k8Mgpn0uqln47EJtfCmZeaPnx/H6pXzyV4cpNtKeCXwnlnJepC8M2zbW5?=
 =?iso-8859-1?Q?3+KE+KsI+JWeiUFbzNd9uTZpcK210dtDGsktFaO/mRlIkAt1S9e7ozByE0?=
 =?iso-8859-1?Q?lX/Sb37N2UAV+h1+YAD/yb8CKz9mOCJp9kifa0MV6KrLke+VJNNEpkXseH?=
 =?iso-8859-1?Q?pJB1NE8UxW3A7HC0E0bGPvG/MqBA5tmsJG4OIRtPTe8WwzMW0RZAS/sEsg?=
 =?iso-8859-1?Q?u7npJevjaVAfLxd/8dXHf0bOwXJYSF9Hf4bvC2IGuI99OjXyjeofV2gvc+?=
 =?iso-8859-1?Q?Uc+PSvJW/sQxR07kKD0tHvWSOkCYTpp3N5k0IFx7RrEaZ/ZrxlXgeoLdK9?=
 =?iso-8859-1?Q?pWQRyhHPd/4EY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 335956e2-f29d-4a32-8aa1-08dc22dbc475
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 04:10:46.8616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xwvpi/unVz/Zhwr+n4EvBlXIWxxgOfxTqfYpYQzoC/fimMrUkzd3XudHskmIRRmobFhrB+k/acpyiE6381Bvtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6836

> Cc: Jonas Blixt <jonas.blixt@actia.se>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
>=20
> Hi Julien,
>=20
> On 1/31/24 13:22, Julien Grall wrote:
> > Hi,
> >
> > On 31/01/2024 11:50, John Ernberg wrote:
> >> When using Linux for dom0 there are a bunch of drivers that need to
> >> do SMC SIP calls into the PSCI provider to enable certain hardware
> >> bits like the watchdog.
> >
> > Do you know which protocol this is under the hood. Is this SCMI?
>=20
> I think I confused myself here when I wrote the commit log.
>=20
> The EL3 code in our case is ATF, and it does not appear to be SCMI, nor P=
SCI.
> The register usage of these SMC SIP calls are as follows:
> a0 - service
> a1 - function
> a2-a7 - args
>=20
> In ATF the handler is declared as a runtime service.
>=20
> Would the appropriate commmit message here be something along the lines
> of below?
> """
> When using Linux for dom0 there are a bunch of drivers that need to do
> SMC
> SIP calls into the firmware to enable certain hardware bits like the watc=
hdog.
> """
> >
> >>
> >> Provide a basic platform glue that implements the needed SMC forwardin=
g.
> >>
> >> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> >> ---
> >> NOTE: This is based on code found in NXP Xen tree located here:
> >> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t
> >> hub.com%2Fnxp-imx%2Fimx-xen%2Fblob%2Flf-
> 5.10.y_4.13%2Fxen%2Farch%2Far
> >>
> m%2Fplatforms%2Fimx8qm.c&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C
> 573b599a
> >>
> 4b4143ceca1d08dc2271e5be%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C
> 0%7C0%7
> >>
> C638423119777601548%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> wMDAiLCJQI
> >>
> joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DZO
> 0TXjL6
> >> g0W7TIZo8x8lTNBXEZW%2BDNcLPndWlEf5D2A%3D&reserved=3D0
> >
> > Anything after --- will be removed while applied to the three. I think
> > this NOTE should be written down in the commit message.
>=20
> Ack.
> >
> > You also possibly want a signed-off-by from Peng as this is his code.
>=20
> @Peng: May I add a sign-off from you?

Yeah. You could add my sign off.

> >
> >>
> >> =A0 xen/arch/arm/platforms/Makefile |=A0 1 +
> >> =A0 xen/arch/arm/platforms/imx8qm.c | 65
> >> +++++++++++++++++++++++++++++++++
> >> =A0 2 files changed, 66 insertions(+)
> >> =A0 create mode 100644 xen/arch/arm/platforms/imx8qm.c
> >>
> >> diff --git a/xen/arch/arm/platforms/Makefile
> >> b/xen/arch/arm/platforms/Makefile index 8632f4115f..bec6e55d1f
> 100644
> >> --- a/xen/arch/arm/platforms/Makefile
> >> +++ b/xen/arch/arm/platforms/Makefile
> >> @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)=A0=A0 +=3D sunxi.o
> >> =A0 obj-$(CONFIG_ALL64_PLAT) +=3D thunderx.o
> >> =A0 obj-$(CONFIG_ALL64_PLAT) +=3D xgene-storm.o
> >> =A0 obj-$(CONFIG_ALL64_PLAT) +=3D brcm-raspberry-pi.o
> >> +obj-$(CONFIG_ALL64_PLAT) +=3D imx8qm.o
> >> =A0 obj-$(CONFIG_MPSOC_PLATFORM)=A0 +=3D xilinx-zynqmp.o
> >> =A0 obj-$(CONFIG_MPSOC_PLATFORM)=A0 +=3D xilinx-zynqmp-eemi.o diff --g=
it
> >> a/xen/arch/arm/platforms/imx8qm.c
> b/xen/arch/arm/platforms/imx8qm.c
> >> new file mode 100644 index 0000000000..a9cd9c3615
> >> --- /dev/null
> >> +++ b/xen/arch/arm/platforms/imx8qm.c
> >> @@ -0,0 +1,65 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >> +/*
> >> + * xen/arch/arm/platforms/imx8qm.c
> >> + *
> >> + * i.MX 8QM setup
> >> + *
> >> + * Copyright (c) 2016 Freescale Inc.
> >> + * Copyright 2018-2019 NXP
> >> + *
> >> + *
> >> + * Peng Fan <peng.fan@nxp.com>
> >> + */
> >> +
> >> +#include <asm/platform.h>
> >> +#include <asm/smccc.h>
> >> +
> >> +static const char * const imx8qm_dt_compat[] __initconst =3D {
> >> +=A0=A0=A0 "fsl,imx8qm",
> >> +=A0=A0=A0 "fsl,imx8qxp",
> >> +=A0=A0=A0 NULL
> >> +};
> >> +
> >> +static bool imx8qm_smc(struct cpu_user_regs *regs) {
> >
> > Your implementation below will not only forward SMC for dom0 but also
> > for any non-trusted domains. Have you investigated that all the SIP
> > calls are safe to be called by anyone?
>=20
> We use pure virtualized domUs, so we do not expect any calls to this SMC
> interface from the guest. I'll limit it to dom0.

Would you mind to share what features are supported in your DomU?

Pure virtualized, you using xen pv or virtio?

Thanks,
Peng.

> >
> > But even if we restrict to dom0, have you checked that none of the
> > SMCs use buffers?
> I haven't found any such instances in the Linux kernel where a buffer is =
used.
> Adding a call filtering like suggested below additions of such functions =
can be
> discovered and adapted for if they would show up later.
> >
> > Rather than providing a blanket forward, to me it sounds more like you
> > want to provide an allowlist of the SMCs. This is more futureproof and
> > avoid the risk to expose unsafe SMCs to any domain.
> >
> > For an example, you can have a look at the EEMI mediator for Xilinx.
>=20
> Ack. Do you prefer to see only on SMCCC service level or also on function
> level? (a1 register, per description earlier)
> >
> > Cheers,
> >
>=20
> Thanks! // John Ernberg

