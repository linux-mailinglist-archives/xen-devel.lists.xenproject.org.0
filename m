Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD604F56DD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 09:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299671.510729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc0J5-0004tK-OF; Wed, 06 Apr 2022 07:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299671.510729; Wed, 06 Apr 2022 07:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc0J5-0004qS-Ki; Wed, 06 Apr 2022 07:42:23 +0000
Received: by outflank-mailman (input) for mailman id 299671;
 Wed, 06 Apr 2022 07:42:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Pbn=UQ=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1nc0J4-0004qM-1c
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 07:42:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0729272-b57c-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 09:42:07 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PA4PR04MB7728.eurprd04.prod.outlook.com (2603:10a6:102:e8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 07:39:49 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 07:39:49 +0000
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
X-Inumbo-ID: c0729272-b57c-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6yeq0beyr2DV2hkI/w8SghPFm1VV2MBomt1YDiMjZuhC58PvrUabHtLwBaZwBGKPwsYeuDfwnkbD81ucOsygWARgJECVine6RbH8FCC1pUwQwqzhBfORo5Vvm1bfvormaaId+SaNnjmw0FeEnB/dTe4uxAfhGHLAg1b5u6ndNF8wk26qcJsp3LlINDKOsbGAb5I0J1xO9vXAbFVoL1/b5JeK6D9WjdZ2ELQJgVMExZlycIrKLFtnoO3wJAHy3doVl+cMoCsU409yyHuB98P3lIhxdxCR1SOlaNiztwxfADzK8lcuEDCEy5BL98ECorHOhTiD3gbJjGesBbgZM+xBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mp8y2JjWcRMtpciVcOwkpJEfGxfxY04Hzr5uyJp7zl8=;
 b=WcdtHrdjyZr8fwk1g3yH7gsrDTIbBgFSmyITLeNw3oKR8DxhJpPuc+zyXnqlqvHbekv4In57KQbNfvzJRXSEzpoK/R7iDAQNCjXXif4K8v5gkJ7ZWafiEhP6FbV78leKy/SYsUK7WnuzbslOolQZXj5kLbdzTJWnu2xOqTbCEpIu3uDm8x6LfOxyM3UMKSZI2PlRbix2TflMrMuYozUKHNhy15LgOOvvpjJjV78RTtuaBm8eGinv4Xqtw0nS3vmKsdSRlEVdJjrlwaj7zMnT3LESlgy62Bhl56mqE2C6R+lEz5rDQ2wVe/vGNN0mKoVNY9as4/+pSywre/+cLTdFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp8y2JjWcRMtpciVcOwkpJEfGxfxY04Hzr5uyJp7zl8=;
 b=Nf3o0Sxt5Cb80uQOCeS4dC5ng5xjP9vOs6sBsDrS76Wx6gdx22+i/cHs6Y3meRWdzgy1LKOPmXCVF+OC8EXcO4h76JKMz2eeHsPfAGus6c5EjSQL3IES/v42BXFcny46/3hHjUE7i60pC56Ck/fuvkFzpzoky9a5gWLDwPyPbaA=
From: Peng Fan <peng.fan@nxp.com>
To: Michal Orzel <michal.orzel@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"van.freenix@gmail.com" <van.freenix@gmail.com>
Subject: RE: [PATCH V2 1/2] xen/arm: Add i.MX lpuart driver
Thread-Topic: [PATCH V2 1/2] xen/arm: Add i.MX lpuart driver
Thread-Index: AQHYRk65ZgQ/2kC1/US0MsPOiCii5KzigfsAgAADlfA=
Date: Wed, 6 Apr 2022 07:39:49 +0000
Message-ID:
 <DU0PR04MB9417FBA3876918C0FD7F187188E79@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220402054223.10304-1-peng.fan@oss.nxp.com>
 <20220402054223.10304-2-peng.fan@oss.nxp.com>
 <fd4b0cc7-3cb9-3f56-5db7-31d41b24611c@arm.com>
In-Reply-To: <fd4b0cc7-3cb9-3f56-5db7-31d41b24611c@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfdef3f4-9cb8-42f2-b38b-08da17a0a189
x-ms-traffictypediagnostic: PA4PR04MB7728:EE_
x-microsoft-antispam-prvs:
 <PA4PR04MB77289F0A08FDD08A95D4056A88E79@PA4PR04MB7728.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eRFYebFR4YgnPijRmWkoMQX3+ZsQOP9S6KqAF3PQ2U4iS3k0btZ8LkcQfV2WUBYSxaaN19PyVHtGwU4FMoXMHWUJq38XSU7dEOVdiEBa/PBV5GtJf6xYLY9K6Gph92IC98uHkq/Xp1f8oZTDDZG3/zjoVyaGajIkXZRQ+kjxEh89u1PesZH/strtOZPnHGDUxf6ojwfjwJKkwniys9qauFxp7kYgu+9SMst5bjIdQIOYrzPlo1SVKM5Ajyc7BRI2EQMEtzx9pmqr02cxmiX4o6YBs8wFh6N1s3gqxcvHGtOvRWvX035UQ24nRBbrWt6q8epxlRoCdT/1uuTY2E2mXSDzGB+w6+9boUNsYa4Lbw2jzD09BmdmK2RaMos2cdMiYxZhWDK9J0gtm4xeb1i8RYGzHrDKgxXqtoI1VgdUV64RsLfO8IAVhGtchT3cQnFqy0bLKSxmKnc38EQUxLRJs+XpKxdtP52h6H7vedoR7IHHq2DWhImWbWdi/JHc+IJPHaRLFzbV+dbUe5jbGeczk+0sZgBYl3TN1IyiushJUrsDfrAquiVn9UKznJQwRWuJRl4ItLjkP0fnLfaIQE8AlZbHqYdNn0/2MZf/VODbidAmpfV9EruXt7zWWR437MObAZpPFvK67E1McnL6HWlCEI9Iv4W+75XffoRa2m15+gAh3JSqDiOVefoEXN78vO5b/Fu/wN4e6sfOLc60+wbxoALheSVWWp2v7if9fBQbfohUVUTA9ZETd6fH5O4Gthjj18FMF89vaQVD4odXIhS7I6PByNWS9YZwizO0jTK8OxwPzo+JHeQ+kOI8Od01fZcN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(8676002)(966005)(9686003)(66556008)(30864003)(52536014)(66446008)(44832011)(76116006)(4326008)(122000001)(6506007)(55016003)(53546011)(7696005)(66476007)(45080400002)(64756008)(8936002)(66946007)(38100700002)(7416002)(5660300002)(71200400001)(38070700005)(83380400001)(316002)(26005)(54906003)(186003)(2906002)(110136005)(33656002)(508600001)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WTKzj8AJyQto1Zukp7t2G3cv3mTcDPzkvhUYdTJ8S4dvFPCZWKnxbviIQz3p?=
 =?us-ascii?Q?bDt9biDOQhPhHtJOJ9E5lFAFzJYGwZn4e0q7NQu9NxQ3hrF3M9XZR0r1WYLr?=
 =?us-ascii?Q?FexaEYYTA425MtpALtBASaYwzW9gyDipXUGnft4ek5dWEUEasIS0GjaokjYi?=
 =?us-ascii?Q?q1mUFLX4ydM99scjIIhAihmR2GE2fYG4luqNmV63M2HETxhIxfq02n8HmUPc?=
 =?us-ascii?Q?GPL+yMWQfiQt0sPI9x69k+lmXiDfCaUFTUfD0/uZjo7Vpq3uzrxjM5w8YGq3?=
 =?us-ascii?Q?BjHqwR0eDKaHt0J5P9u3eiaJmqT03iTUX/oBHnqQtuO3AmZokqJXI7ZJLrrX?=
 =?us-ascii?Q?DLOIzW+KEeAHls6F5h2cHEYbWHRd/CueeMVHfGEvDT17KUNg8Qc7vZbkeE1j?=
 =?us-ascii?Q?HAra2e5JHmkBLy082D8yz/8JM+yH49SvTFWF7T6YccDuDlJ0IpmkNNxHShQu?=
 =?us-ascii?Q?nviFA+4+26B3/UplUg5wf8NFx8iBjt3YsABypQ7razrW4GF2Md8MbNbRdGx2?=
 =?us-ascii?Q?shqnq8x4FN15TVdelKYkXyX6w6WrkkePjp0MpzduxPTFDOYPOSnNgHHyUcj5?=
 =?us-ascii?Q?9o1dAzWGEyeWy//H1lUgQQVgFmvfg3Rs5AUgFuN7S1wzrUIZTegFswG5Bcsv?=
 =?us-ascii?Q?RUkgXWeyWe+rjxfpoVuDjfrooHiJ9H3GI+RkPaM1dcjCtkzPiDOdsd9kYJCm?=
 =?us-ascii?Q?o9f9I7b4Y+6GYYCK0A+px24jSfTvylhklIrDbUvklOPUILWfzWYFEFsKvRAA?=
 =?us-ascii?Q?/YNaHf9CzsfUSjdTHSgaKTeRdLfw6GW3o1zkmywmUEllD8Ny2sZD1GenmPPK?=
 =?us-ascii?Q?aoSYpiIpGikvn2Un1xUOfQg307DmyM5j5uNxk5yYAL5wwtUZEuxas3h+kQOA?=
 =?us-ascii?Q?r7lTroYYsA4bJmqLntsMJPcuCpXYkwXBNsd2O/pU4cXUjCcjMsGSSttKeAG2?=
 =?us-ascii?Q?eu9t1ldYQoTuBublxod3YNlGLCmwwvvoM39PVHotaaMoWuFcsO3Xs/KIh3tB?=
 =?us-ascii?Q?A9yYy9HptVe802WKu4NKYmF41wsr4T91USZArGXbOJCK7rZwnyio1sn99SZQ?=
 =?us-ascii?Q?BxhHoLIlyjznSV7KdDIlcfeg4uX5zc4NqRRwAXFWy+5ac1n6sjKFitpwQfxH?=
 =?us-ascii?Q?Kf08YuryX5rZxzveC4vWOuHc6jxOVWdGcQi6aP4GnLMlCPW+wJ/AFQKWBBFL?=
 =?us-ascii?Q?nQLsq+MazNlSTczy03gaC7Z1cEnR4gPjy9fjmg3tL6i0sDnQILwPcf5t9S+u?=
 =?us-ascii?Q?cJJy3rGQpmExRUf5dM2UGdaquTCfSdeaD+oxedfRgZyZ28dOiuD8BhWFdJiz?=
 =?us-ascii?Q?ojpG5xgQ2A7yI5Lpy+9a23gBZFsRI9RqACyfyonyuUfXeGT/+rRUxuV271I1?=
 =?us-ascii?Q?91f7wJSZ6pFJU4PU8esoJWlIyU+IT9B+M1Whl2E/cSNxxLVC4foJSh+MlG5J?=
 =?us-ascii?Q?cH7wETfRcW78xalnAfF5sN3LEeVn5iyEoVAgd5IEsUeps8Rn87v1CITEHXMK?=
 =?us-ascii?Q?rXbwyKlNBdp+00p684S3PcgsF7CLCLv5L/JmvRatsJ/qajhCRc9ho2Jp2dBP?=
 =?us-ascii?Q?XQEE3wHmvFlqVHpM1tGKFmYEmXDAsZfsWrf9O1tmX5xDemj1A6Ra8MqUl8G4?=
 =?us-ascii?Q?w7xw4SrFvW8aq29TnsDVo8+JU+UFB9cDtRFhIGEiZkgCJ+4RGpYidnQL3bMz?=
 =?us-ascii?Q?UqksP4nfz/2hg+LcXPS8YQGO1qxs044bPJUpa6F9NwcM9B98/Pe43qsCRilm?=
 =?us-ascii?Q?1c9s/FGP/A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdef3f4-9cb8-42f2-b38b-08da17a0a189
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 07:39:49.7615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qkOY+BrgGSgqFDYPYaAaFQCG9Mwxuzz3Oo55uj2Jy5vpg1ZTHvQewNKfjHGKjVJZGvouymvuWk9Hd2OlnPwB2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7728

> Subject: Re: [PATCH V2 1/2] xen/arm: Add i.MX lpuart driver
>=20
> Hi Peng,
>=20
> On 02.04.2022 07:42, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The i.MX LPUART Documentation:
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.
> >
> nxp.com%2Fwebapp%2FDownload%3FcolCode%3DIMX8QMIEC&amp;data=3D0
> 4%7C01%7Cp
> >
> eng.fan%40nxp.com%7Cc7d221ce800342bbd7c108da179e72ca%7C686ea1d
> 3bc2b4c6
> >
> fa92cd99c5c301635%7C0%7C1%7C637848266543058498%7CUnknown%7C
> TWFpbGZsb3d
> >
> 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
> 3D%7C
> >
> 3000&amp;sdata=3D3CV%2FoJViSFzqRby0h577SiusHRQnC8KiXscntQW%2BZOs
> %3D&amp;
> > reserved=3D0 Chatper 13.6 Low Power Universal Asynchronous Receiver/
> > Transmitter (LPUART)
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  xen/drivers/char/Kconfig      |   8 +
> >  xen/drivers/char/Makefile     |   1 +
> >  xen/drivers/char/imx-lpuart.c | 275
> > ++++++++++++++++++++++++++++++++++
> >  xen/include/xen/imx-lpuart.h  |  64 ++++++++
> >  4 files changed, 348 insertions(+)
> >  create mode 100644 xen/drivers/char/imx-lpuart.c  create mode
> 100644
> > xen/include/xen/imx-lpuart.h
> >
> > diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig index
> > 2ff5b288e2..0efdb2128f 100644
> > --- a/xen/drivers/char/Kconfig
> > +++ b/xen/drivers/char/Kconfig
> > @@ -13,6 +13,14 @@ config HAS_CADENCE_UART
> >  	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zyn=
q
> >  	  based board, say Y.
> >
> > +config HAS_IMX_LPUART
> > +	bool "i.MX LPUART driver"
> > +	default y
> > +	depends on ARM_64
> > +	help
> > +	  This selects the i.MX LPUART. If you have a i.MX8QM based board,
> > +	  say Y.
> Why did you move "say Y" to the next line?

I configured vimrc with " set cc=3D75,100 ", the "." will be at 80, so I
move "say Y." to next line.

>=20
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
> > file mode 100644 index 0000000000..49330fd2f8
> > --- /dev/null
> > +++ b/xen/drivers/char/imx-lpuart.c
> > @@ -0,0 +1,275 @@
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
> > +#include <xen/imx-lpuart.h>
> > +#include <xen/init.h>
> > +#include <xen/irq.h>
> > +#include <xen/mm.h>
> > +#include <xen/serial.h>
> > +#include <asm/device.h>
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
> > +    rxcnt =3D imx_lpuart_read(uart, UARTWATER) >>
> UARTWATER_RXCNT_OFF;
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
> > +    ctrl =3D old_ctrl =3D imx_lpuart_read(uart, UARTCTRL);
> Please remove ctrl assignment here as you are overriding it in the next l=
ine.
>=20
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
> > +
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
> > +    {},
> To be coherent with the rest of Xen code, please use { /* sentinel */ }

Fix in V3.

>=20
> > +};
> > +
> > +DT_DEVICE_START(imx_lpuart, "i.MX LPUART", DEVICE_SERIAL)
> > +    .dt_match =3D imx_lpuart_dt_compat,
> > +    .init =3D imx_lpuart_init,
> > +DT_DEVICE_END
> Please add a newline here.

Fix in V3.

>=20
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/include/xen/imx-lpuart.h
> > b/xen/include/xen/imx-lpuart.h new file mode 100644 index
> > 0000000000..945ab1c4fa
> > --- /dev/null
> > +++ b/xen/include/xen/imx-lpuart.h
> > @@ -0,0 +1,64 @@
> > +/*
> > + * xen/include/asm-arm/imx-lpuart.h
> Wrong path as you put this header in xen/include/xen.

As you suggested below, I need put this header under
xen/arch/arm/include/asm/

>=20
> > + *
> > + * Common constant definition between early printk and the LPUART
> > + driver
> > + *
> > + * Peng Fan <peng.fan@nxp.com>
> > + * Copyright 2022 NXP
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + modify
> > + * it under the terms of the GNU General Public License as published
> > + by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef __ASM_ARM_IMX_LPUART_H
> Wrong macro as you are not in arm/include/asm.
>=20
> > +#define __ASM_ARM_IMX_LPUART_H
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
> > +#define UARTSTAT_TDRE     (1 << 23)
> > +#define UARTSTAT_TC       (1 << 22)
> > +#define UARTSTAT_RDRF     (1 << 21)
> > +#define UARTSTAT_OR       (1 << 19)
> > +
> > +#define UARTBAUD_OSR_SHIFT (24)
> > +#define UARTBAUD_OSR_MASK (0x1f)
> > +#define UARTBAUD_SBR_MASK (0x1fff)
> > +#define UARTBAUD_BOTHEDGE (0x00020000)
> > +#define UARTBAUD_TDMAE    (0x00800000)
> > +#define UARTBAUD_RDMAE    (0x00200000)
> > +
> > +#define UARTCTRL_TIE      (1 << 23)
> > +#define UARTCTRL_TCIE     (1 << 22)
> > +#define UARTCTRL_RIE      (1 << 21)
> > +#define UARTCTRL_ILIE     (1 << 20)
> > +#define UARTCTRL_TE       (1 << 19)
> > +#define UARTCTRL_RE       (1 << 18)
> > +#define UARTCTRL_M        (1 << 4)
> > +
> > +#define UARTWATER_RXCNT_OFF     24
> > +
> > +#endif /* __ASM_ARM_IMX_LPUART_H */
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
>=20
> I think you should put this header in xen/arch/arm/include/asm/ as it is =
arm
> related header.

Yes.

Thanks,
Peng.

>=20
> Cheers,
> Michal

