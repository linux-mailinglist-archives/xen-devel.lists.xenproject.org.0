Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5721C881A92
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 02:11:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696164.1086829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn6vh-0001aD-B2; Thu, 21 Mar 2024 01:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696164.1086829; Thu, 21 Mar 2024 01:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn6vh-0001XI-7c; Thu, 21 Mar 2024 01:09:13 +0000
Received: by outflank-mailman (input) for mailman id 696164;
 Thu, 21 Mar 2024 01:09:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U3xC=K3=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rn6vf-0001XC-Gt
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 01:09:11 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2607::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eb84775-e71f-11ee-afde-a90da7624cb6;
 Thu, 21 Mar 2024 02:09:09 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PA4PR04MB7502.eurprd04.prod.outlook.com (2603:10a6:102:ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Thu, 21 Mar
 2024 01:09:07 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7386.017; Thu, 21 Mar 2024
 01:09:07 +0000
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
X-Inumbo-ID: 9eb84775-e71f-11ee-afde-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHHkJoOvp57rpEJ4byRyNUQ/GTrJltGglGzg9w0/pIk5klzZDWMTaEAylP3b+mmndIt0trTp4GZF3DPzGba4bMwQ4uLGMcCUcrpPX5WyLL2nusx3W/iUIHVLSpiT0ehnKvRFRze94KpYbjpw3t/xW9Dg9/ZcmHhMX5CGhPw0Ddov8fA1ZviU809fouZa3jw/L481fOcJUPV7rN0oNnu3ndRIVqzUt6ECSTA3BpZnXU7xhymvcEzvTl6JCBTNPkVSTBx4jskqAwnT0xh3tsJrTP6JHICJ1u0OdOS0NhANX6k0NUR+Dk/GPfEspJG9YYqsG3ggcUFqil16A9DjqgSbDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPC8tcOLLyNldR3cBksJUbnSMAWC+aLJOmfR1iAiBfo=;
 b=I8/h9xJ28+pfvOxyob1jRHWV6QoXlEeFNb9zORhXdkcsOotL+ZYh+Xeyd/jnRPvgMckL6XumFGuL6pLDA8NMYaGH0DZsZFWQrnOKttQjzVBqSA//RrDGALIRB+ERjR/muB9L27Wc+LByd7GJ5WTEYRWeWAcQs49dVhU2lAJK+lEn8TKTSSHLGtFW0gaAqmO1bsEl/Q+965SrVmpAmJCHXi9Qi8VLs//h7r6pATkAkLXQXDXWyueyp7YUtrantiuDigb3Ss0Rqy5HhWN4Qb71TRDPyTz0tPf7VsSsaHQOrH8o4QquijExq/3O8OkAADTLSlG5ozC4rI8bz+IQSe6Nlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPC8tcOLLyNldR3cBksJUbnSMAWC+aLJOmfR1iAiBfo=;
 b=htR3MmoPLgNTNct1AA7Hy3YZ3RR1jbyAyScT9CheTsgjBHlnB9dcs/8ZHM6NQMx7SkpMKikfXb5yxMuJLm4QxGwMu/9NFg/G1Q+rtiYPyQBSqdHCqIZwcQjHaZVbIq4oxcSmKmdgpJH+FDu+sWQ+IhNB4E0XoKTa6Q+Spwlo5Zo=
From: Peng Fan <peng.fan@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: John Ernberg <john.ernberg@actia.se>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jonas Blixt <jonas.blixt@actia.se>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index:
 AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDz198AgAA1LICAAVx4AIAAQjaAgAEdtQCAAynKwIABnCuAgAZ8E4CAKNxCgIAApf0AgAKGQwCAAAbHgIAHmWEAgAtpgACAABVOgIAAaCSAgAAUn7A=
Date: Thu, 21 Mar 2024 01:09:06 +0000
Message-ID:
 <DU0PR04MB941728D08D955BFFA7BAAC5B88322@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
 <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
 <a265ea2d-9b5f-4726-9395-448b1b669839@actia.se>
 <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org>
 <DU0PR04MB94170CB1F77E3D594A6D0E9488402@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <5a0c8f09-4f01-45e9-892c-86342c0d0ec5@xen.org>
 <08ae764c-3490-4dd1-ab70-7a855a98d16d@actia.se>
 <911ec1bb-3733-4f37-839e-673a88e408ff@actia.se>
 <ab61278a-f3f1-41de-a0b2-eca6f19be103@xen.org>
 <848794f3-a337-49d9-84db-a969970f071b@actia.se>
 <48038c7f-d7cd-4100-a41b-8042bcb93208@xen.org>
 <967020E7-3D03-416A-8BFC-6F4E4BD9D7B5@arm.com>
 <c17e0eeb-b679-4685-9ae9-6662c2035500@actia.se>
 <849f3f5a-b960-444a-a10e-1f2df36c22a7@xen.org>
 <alpine.DEB.2.22.394.2403201647030.1569010@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2403201647030.1569010@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PA4PR04MB7502:EE_
x-ms-office365-filtering-correlation-id: 0f432768-4acc-43ff-3d12-08dc494381db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VQaUQ5M9FIFo1DFy9dHg/ZZoGDF4sumapftbiQRlnesxwAIgQG89/KoweJ7zfgzINVfQ6NdpZiSgV1h41Vko7IHlV4NhRZjDDDw94TF+AhgLY2k7y1heXvhAEoz75WnjBSfxIUrxlljrOf7u7tjCqCyC5ZYsDpJFIWpf0fQ99ZBgi+QgDzgEZJR0ewnQGuazgm5iSxPDs6w2GgQdtOHJ0AA+qYkAaN9XXz7Hpf/bbIZKMJqZFgW2sJK5RcDRJM0gu9xPlEnU+Aqw1jhVOrEAB9YmBYvro3dVRq4fTTu7MZLmVc/tO6UJ7gb5XFaQlPwTPcS1888tMJGXTjBdABE+cEg0yv5AuHXxQ7QWCzXkJn25PCxbFNCnkbvFym/e/0H2QIcsprZ7GYN8g4J8olzZ6rEOdGF3rfgszC+MbNIa8R37QlqdkTTnNZCJe8vMLYI/Bwk1zjIb08UexJU1H5Y6tLzI9yjxAia+Z/OQowyxxnLW61H2gXcDdEgFQkiYQyjG8t+KdEnhieII4CxyeFdqRO4wxpQsmsQ826IZQdOr1QyH9wWWedZ3Ib+T6AJZcQ6/Lo1mLXD/sIMr7I7trEVZV7lmoWN4FxZKe9HOvj5smcbwA754by9Didc/t/7waQ71TbWftS7xWCA+cKj3C2oJ2JKWiooFMpleAydX/BhkJAM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?M5dGvSoSa7jzI3R4RLajfWaWd2Jed+TOgZuLy864oNHZoTdr+Vq1NRK15E5y?=
 =?us-ascii?Q?8RxyV70PGLSlKNJhFMX4V7YSvGuCZLubUdpQXc/t/FuGYn/mYN39bKCD4y5G?=
 =?us-ascii?Q?BE6/C6412EUjub+gl33knTrPAdC/5vP8H3uH64UfsoRXB81GuyqfrtnqR76l?=
 =?us-ascii?Q?Pkzu49+KSO4vqI40FzQay3vh2MH5S2QIo0tDbbkAqxU/rriQxNDBhVy7uzyS?=
 =?us-ascii?Q?cyWwPxyNFIo1bOWOjkADZbNmjiRYByblh4QkSi0E44vBuTPwIuBnfTtl/eri?=
 =?us-ascii?Q?fCX0y+27pQ5sn137EybBEos599LQKgQZd8X8Ar+EO5BrUBHU7dJDFbUys5JT?=
 =?us-ascii?Q?huEZVnmvo+LDoignTh3hhZVYOslOa3PKV2uGYH1R3L832Su/Mysd7yV26zgd?=
 =?us-ascii?Q?ca8/FL1pZErAiPYEX4qka5JFmZHDr7krgwz11vdZ9Zvm1EtiF5jiV+J46lIY?=
 =?us-ascii?Q?drcMxWzxDI4y22KDOGaiI5FRZvF6fDPdftVvqEIlg9c6LLNIPtt4xvZzid8Q?=
 =?us-ascii?Q?CiBiOZiM8e4kpBIKE8kifNtUHCK9khMOezNF5LGOd5dPlLj5tJ8BtEWAGwXo?=
 =?us-ascii?Q?1/AFUox8YpGqjh0lUSfYt98i4WtrOlYLgyrT0EpK4542glleDAhDYlUBkR1r?=
 =?us-ascii?Q?7J8gHKhZWeO2f5ocOb1YV7K7LX2DvyVC4PPvAxToPUH15JA4QteBVLc1jwps?=
 =?us-ascii?Q?jtLkfN8bodaLhbT/dIdbNObp5voBzF70ifZPMD37MtDcCc34+jATqtx3237N?=
 =?us-ascii?Q?5ex7OeHhk2jldnKCg6FawRTsSNnp8HVZk+Isgn3isv6hrJYywse5wQ2hQMXy?=
 =?us-ascii?Q?oT8pZKEbyei/IaeOQVL9s77J/clBxZWGfvF1nLjc+K0B3x4GXsSlRP/+PhMv?=
 =?us-ascii?Q?tarD8k69eAdQTAbBaLVywtMLAUci3uc41g7BpXxGi9G1hSueNaSYP76H83Vn?=
 =?us-ascii?Q?x276CfYKXVlVNcYZsZHiJ8QwDyX5mqPaTWYkxPNm4Rs5bRlr3KzrHP+X2lx3?=
 =?us-ascii?Q?Slb/LqkrvNAO9GVPiWf6m3/QX+mhU6ndUjeOY5E+DNGKrHpBwqemBS9yxVq5?=
 =?us-ascii?Q?BhXeJHqfp1x89Uo1cyqgBGqiAe10+ZHqRbkDGXKY5OA5XpPel4k0s/l+Y89k?=
 =?us-ascii?Q?vxcAI6bc8IB6+IH2go2conIxRMjIDCBiAkKWVKQR8D9UrO4juMkZEhxeawPs?=
 =?us-ascii?Q?gvEv1LWycCQUxHgZmXadyT937Ydh6UfIJcC6VS6BTE0zqg7qmlRfk0tAGQkU?=
 =?us-ascii?Q?/9dnvWju2pmwC2MSEWEvO5Yd/pe8C0FDrjUVQ9OH6SKJ7+wPc+j4hRsEPmov?=
 =?us-ascii?Q?yrAaCgbEZ5A2BC8pcHwaIztPBcG2SxSiImUwvXUw9lptMiAEwCaWlOce/7Qq?=
 =?us-ascii?Q?X99QNC+q9A/gvcFkxFqssymxDwTsCzPvf2mjTzKrfdjM5wkZ1cJrViSkQuq1?=
 =?us-ascii?Q?cQ3pQ2Ys8do60xppwlYf4JxZbG3AeqppXWGzCLkiEhmIpkzag9kG7CzvsRq4?=
 =?us-ascii?Q?F9rq5Id4FfyRvsaJEOQ1DSPX8y0u4xLjkJXXnt69MDbbzQDUVUu9wIOcE4EA?=
 =?us-ascii?Q?Y7GV92HjScPDKlZZzM4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f432768-4acc-43ff-3d12-08dc494381db
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 01:09:06.9520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qbei1gHSWS1GDBjLilnj9dsLwQGTuhhufx/kOktgtH8jNlL6JFDxXClTuBl/9QAqMeyieKVP8W8Wkn+DoFDdjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7502

> Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
>=20
> On Wed, 20 Mar 2024, Julien Grall wrote:
> > Hi John,
> >
> > On 20/03/2024 16:24, John Ernberg wrote:
> > > Hi Bertrand,
> > >
> > > On 3/13/24 11:07, Bertrand Marquis wrote:
> > > > Hi,
> > > >
> > > > > On 8 Mar 2024, at 15:04, Julien Grall <julien@xen.org> wrote:
> > > > >
> > > > > Hi John,
> > > > >
> > > > > Thank you for the reply.
> > > > >
> > > > > On 08/03/2024 13:40, John Ernberg wrote:
> > > > > > On 3/7/24 00:07, Julien Grall wrote:
> > > > > > >    > Ping on the watchdog discussion bits.
> > > > > > >
> > > > > > > Sorry for the late reply.
> > > > > > >
> > > > > > > On 06/03/2024 13:13, John Ernberg wrote:
> > > > > > > > On 2/9/24 14:14, John Ernberg wrote:
> > > > > > > > >
> > > > > > > > > >       * IMX_SIP_TIMER_*:  This seems to be related to
> > > > > > > > > > the watchdog.
> > > > > > > > > > Shouldn't dom0 rely on the watchdog provided by Xen
> instead?
> > > > > > > > > > So those
> > > > > > > > > > call will be used by Xen.
> > > > > > > > >
> > > > > > > > > That is indeed a watchdog SIP, and also for setting the
> > > > > > > > > SoC internal RTC if it is being used.
> > > > > > > > >
> > > > > > > > > I looked around if there was previous discussion and
> > > > > > > > > only really found [3].
> > > > > > > > > Is the xen/xen/include/watchdog.h header meant to be for
> > > > > > > > > this kind of watchdog support or is that more for the VM
> > > > > > > > > watchdog? Looking at the x86 ACPI NMI watchdog it seems
> > > > > > > > > like the former, but I have never worked with
> > > > > > > > > x86 nor ACPI.
> > > > > > >
> > > > > > > include/watchdog.h contains helper to configure the watchdog
> > > > > > > for Xen. We also have per-VM watchdog and this is configured
> > > > > > > by the hypercall SCHEDOP_watchdog.
> > > > > > >
> > > > > > > > >
> > > > > > > > > Currently forwarding it to Dom0 has not caused any
> > > > > > > > > watchdog resets with our watchdog timeout settings, our
> > > > > > > > > specific Dom0 setup and VM count.
> > > > > > >
> > > > > > > IIUC, the SMC API for the watchdog would be similar to the
> > > > > > > ACPI NMI watchdog. So I think it would make more sense if
> > > > > > > this is not exposed to
> > > > > > > dom0 (even if Xen is doing nothing with it).
> > > > > > >
> > > > > > > Can you try to hide the SMCs and check if dom0 still behave
> > > > > > > properly?
> > > > > > >
> > > > > > > Cheers,
> > > > > > >
> > > > > > This SMC manages a hardware watchdog, if it's not pinged
> > > > > > within a specific interval the entire board resets.
> > > > >
> > > > > Do you know what's the default interval? Is it large enough so
> > > > > Xen +
> > > > > dom0 can boot (at least up to when the watchdog driver is initial=
ized)?
> > > > >
> > > > > > If I block the SMCs the watchdog driver in Dom0 will fail to
> > > > > > ping the watchdog, triggering a board reset because the system
> > > > > > looks to have become unresponsive. The reason this patch set
> > > > > > started is because we couldn't ping the watchdog when running w=
ith
> Xen.
> > > > > > In our specific system the bootloader enables the watchdog as
> > > > > > early as possible so that we can get watchdog protection for
> > > > > > as much of the boot as we possibly can.
> > > > > > So, if we are to block the SMC from Dom0, then Xen needs to
> > > > > > take over the pinging. It could be implemented similarly to
> > > > > > the NMI watchdog, except that the system will reset if the
> > > > > > ping is missed rather than backtrace.
> > > > > > It would also mean that Xen will get a whole watchdog
> > > > > > driver-category due to the watchdog being vendor and sometimes
> > > > > > even SoC specific when it comes to Arm.
> > > > > > My understanding of the domain watchdog code is that today the
> > > > > > domain needs to call SCHEDOP_watchdog at least once to start
> > > > > > the watchdog timer. Since watchdog protection through the
> > > > > > whole boot process is desirable we'd need some core changes,
> > > > > > such as an option to start the domain watchdog on init. > It's
> > > > > > quite a big change to make
> > > > >
> > > > > For clarification, above you seem to mention two changes:
> > > > >
> > > > > 1) Allow Xen to use the HW watchdog
> > > > > 2) Allow the domain to use the watchdog early
> > > > >
> > > > > I am assuming by big change, you are referring to 2?
> > > > >
> > > > > , while I am not against doing it if it
> > > > > > makes sense, I now wonder if Xen should manage hardware
> watchdogs.
> > > > > > Looking at the domain watchdog code it looks like if a domain
> > > > > > does not get enough execution time, the watchdog will not be
> > > > > > pinged enough and the guest will be reset. So either watchdog
> > > > > > approach requires Dom0 to get execution time. Dom0 also needs
> > > > > > to service all the PV backends it's responsible for. I'm not
> > > > > > sure it's valuable to add another layer of watchdog for this
> > > > > > scenario as the end result (checking that the entire system
> > > > > > works) is achieved without it as well.
> > > > > > So, before I try to find the time to make a proposal for
> > > > > > moving the hardware watchdog bit to Xen, do we really want it?
> > > > >
> > > > > Thanks for the details. Given that the watchdog is enabled by
> > > > > the bootloader, I think we want Xen to drive the watchdog for two
> reasons:
> > > > > 1) In true dom0less environment, dom0 would not exist
> > > > > 2) You are relying on Xen + Dom0 to boot (or at least enough to
> > > > > get the watchdog working) within the watchdog interval.
> > > >
> > > > Definitely we need to consider the case where there is no Dom0.
> > > >
> > > > I think there are in fact 3 different use cases here:
> > > > - watchdog fully driven in a domain (dom0 or another): would work
> > > > if it is expected
> > > >     that Xen + Domain boot time is under the watchdog initial
> > > > refresh rate. I think this
> > > >     could make sense on some applications where your system
> > > > depends on a specific
> > > >     domain to be properly booted to work. This would require an
> > > > initial refresh time
> > > >     configurable in the boot loader probably.
> > >
> > > This is our use-case. ^
> > >
> > > Our dom0 is monitoring and managing the other domains in our system.
> > > Without dom0 working the system isn't really working as a whole.
> > >
> > > @Julien: Would you be ok with the patch set continuing in the
> > > direction of the original proposal, letting another party (or me at
> > > a later time) implement the fully driven by Xen option?
> > I am concerned about this particular point from Bertrand:
> >
> > "would work if it is expected that Xen + Domain boot time is under the
> > watchdog initial refresh rate."
> >
> > How will a user be able to figure out how to initially configure the wa=
tchdog?
> > Is this something you can easily configure in the bootloader at runtime=
?
> >
> >
> > Overall, I am not for this approach at least in the current status. I
> > would be more inclined if there are some documentations explaining how
> > this is supposed to be configured on NXP, so others can use the code.

I will try to push inside NXP to release a documentation on SIP usage.
But not expect it will be released soon.
The SIP number is quite stable, and we not change the meaning.

Regards,
Peng.

> >
> > Anyway, this is why we have multiple Arm maintainers for this kind of
> > situation. If they other agrees with you, then they can ack the patch
> > and this can be merged.
>=20
>=20
> The approach here would not be my choice either. However, I think it woul=
d
> be nice to have better support for NXP imx8 boards in upstream Xen. To th=
at
> end, I would ack these patches but I would ask to add a document under
> xen.git/docs/ explaining the approach, limitations, and requirements, so =
that
> someone else can use the code effectively.

