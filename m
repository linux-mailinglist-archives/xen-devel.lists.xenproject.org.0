Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E2B8A6451
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706671.1103978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcd8-0004RX-Dk; Tue, 16 Apr 2024 06:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706671.1103978; Tue, 16 Apr 2024 06:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcd8-0004Q0-AX; Tue, 16 Apr 2024 06:49:22 +0000
Received: by outflank-mailman (input) for mailman id 706671;
 Tue, 16 Apr 2024 06:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f57D=LV=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rwcd6-0004Pu-ID
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:49:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7256bac4-fbbd-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 08:49:18 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS5PR04MB9770.eurprd04.prod.outlook.com (2603:10a6:20b:654::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 06:48:49 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 06:48:49 +0000
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
X-Inumbo-ID: 7256bac4-fbbd-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZc2XsUTolMeFdm7mJ8Cw2hm4RdFc6E6PYZp9e6DoDrJIg9aXsP8tpVSwucOIqP9Di4s02iYPZd2OxJMJ/Yapw4LT1Ju7myvZZbMAajav15SpwMZ+m7SyPz4GRtDXUtgm4D1NmQmGAzExZlNgLD9uCOyPCS4fR8rB1GBp06+uOzEaAksE+yEokDW6GZDtWeVo13qmVQpd6fxtkMe5HMa/zYFoHdf8pu1OAlo67fAZdTN7x7SG48/p7cluf4uR6n+pvAobtrRCYwGOsR41OzVFUFWUBkcPkQrikuuj1060QWdOb/T8/MP1e4V3+iL1Iouc9mguT3FDlWIP4XwRtpiLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVPmUrErM2O1e52v870PdwafOgkQsL5a1t3vugd1KR8=;
 b=LczDmwWfFgzDge8/yzmp8/8dFwMVY7mv0zSQDsfEbGcvMCIDoGIZs0+pQV4DIq+HK7DEl2OHSiW3ZW9DCM/+a6IeF8GLe8ygiDfYRZlRBatz4MIufTwsRMQ6BO6oQPFOdNz3vUZmrnbDiL+orA1h09fym6EPUJML3hxNbZ1PhQx6lJr4jn4iSFu+YHk9nD3M1rYhJXCSHIgufEF6XA/QtZNv8qPYFS3S3ow6DoNxQ5RxadBABNHLwG4KzbDfPP3pwpxO8DZR5uIc+NTjpKGtT/MBcCN1/K0rCB10JbtnTYgYa9j+welklnd48pkumYBmbvz+z+H4od+cJYYfa8+IYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVPmUrErM2O1e52v870PdwafOgkQsL5a1t3vugd1KR8=;
 b=JPhSA/UkCP9iXPdV1qn5LOyXuIFcJ8A0+2JXd96D6DrtaofADoYdd4BQQ9mfiQCIL3Wxn6FQWkqS4bqkpUBIYf6lLwa8XKTDveYy0aBtgxL8DL4pR9fMiEz2bTHuzm7l786O2WuuUPGV0LgpmWXi3S4BQ/XOZf7WerlSPnAglBg=
From: Peng Fan <peng.fan@nxp.com>
To: Julien Grall <julien@xen.org>, John Ernberg <john.ernberg@actia.se>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"conduct@xenproject.org" <conduct@xenproject.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jonas
 Blixt <jonas.blixt@actia.se>
Subject: RE: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
Thread-Index:
 AQHaic9tXQJwwldfJUm8+1aRDWuvfLFpKuoAgAAGzoCAAAPWgIAAA9MAgAAIzQCAAT4dEA==
Date: Tue, 16 Apr 2024 06:48:49 +0000
Message-ID:
 <DU0PR04MB9417A835B5D04517CC11500788082@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240408161129.900347-1-john.ernberg@actia.se>
 <20240408161129.900347-2-john.ernberg@actia.se>
 <084b9ed5-1585-4802-b504-6ccd2f262542@xen.org>
 <69dcd768-74b8-4033-8ab3-77848d6774dc@citrix.com>
 <4b39f4fa-246d-479e-ab76-ff234b641703@xen.org>
 <e3785d8a-9b16-4b74-9453-b0166bdbb171@actia.se>
 <1272bb77-8a93-4ca2-af0d-4c1c36729307@xen.org>
In-Reply-To: <1272bb77-8a93-4ca2-af0d-4c1c36729307@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AS5PR04MB9770:EE_
x-ms-office365-filtering-correlation-id: 9d093eba-09f7-4265-e570-08dc5de1454b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ckOOM2bwQ8OgzZp4ozMtuPutOQ/8qIeIaoB/IRatVGFPNj2zqTs1uKjtmd0KkCN2POcbH06M6WMErCCxO30onNs2u7fyTrIrgxeqY2VO9rSCO8xHaEfVQYiDe42CyJpOcCcr0r+3PGXJkidg1YUAL6FMJwotlnvCgTRjMUTAtW2RbwgaV6NpuAjoiBTqayTyw49hOOfTmnKCanCMQ5d1sZmWlhl0SejNKZQcBVnt9yCDwlb7eILpTN5kBQ+nJkDHi/guCQpExNYdo347JZyXPVc/tAxviz3JTh36Lg3HZ16A0xBs8lsYGS6Odo2SND63hFAbJFcZyh2oTP+XHGRNHhBudCV+JSn2PRA7YyVDjZRtMk9p99zdTI/+jShJHA/W+Gv9QGRRzcyH+Mh/0YdWU7EtpPp19BKZj1cWN8V4kRcuz5rT4iNVmniwBmgYu+kgOzgVWKUaGaeMs4DkxqhJgtVc5Ek0tB4PeZP7i0hHMFWcNS5AkgYJNZZAg8MaSOV1KgRwLEJ6EtGHDy3QeeqET/ZaGJOK4Jr9i4H/GWhvFaMta/X+qHwQpxzIrRT5cEQ3moGPAnVXkyLo4j6c7gXuahp/fo4KXiZqpnfnNWCs2GJy8xx79KF7QTPXwJ5yZhwInN0ug6RLtAX7IrcL8Fr8UXkOeKtjiDkm32iiYj1+iX0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jblOd0uy257ifqRkvL7uiUH6U89rS68Sp4+evKB3xS5fG6anilWPDtonyu?=
 =?iso-8859-1?Q?as9EBRYqQJdqZg/4ZS8P+AbiLNd96dLgqiFxqYgAWjL6AYXEo7bo3rivd/?=
 =?iso-8859-1?Q?TOJwEV4IRBpJUpw4zX2SbWNl6i4OLd6uTTEUU4COY28lZlmPcJErXynzfY?=
 =?iso-8859-1?Q?WSTYrBi7uVwcjaR6Ognrhg2wCS5r2bARnzZU79ZQH6iJ+toi8/WvWhjp37?=
 =?iso-8859-1?Q?3Euo/702GZAomRRk1Zv/BPI16vu/i5xsqoXhsMAQV/o9oBEo9LZ6P+ZgNA?=
 =?iso-8859-1?Q?kR0HaTKf9gXFreeDeqqRtI9vkuFvkGnhUVHaaAENAmXEoGyKdVrezUiks2?=
 =?iso-8859-1?Q?jcvbMiKQp5kQSFZr28/Hgn/wDfVridCaLWosT+7khEVZBMBloJGngc5yZp?=
 =?iso-8859-1?Q?wViwlfqEcjfN9i9zAqwCdnFRFL+QwPev8XcEVlhop4vHcfT/BSltu2BSqv?=
 =?iso-8859-1?Q?LNsEcQlAI1voGmTP/lF80aqczPo22G035JuQhrhkttuXOMcFe3Fe27VD3/?=
 =?iso-8859-1?Q?1ZwzyXDlMLF4E+797Mw4h89KclKHs0wP/f8B3ZjnZl7gCX4mhIj2+Mb/aC?=
 =?iso-8859-1?Q?kyCV0LkLj0rfscVLD+vgPMF4AbHG0IjA0XONm5vKqz8iYtJB5s6EaYxVRV?=
 =?iso-8859-1?Q?SXzL07ml7132+bUvI1xv6j6+9Z3Ur96CMAlXR5Gp5przGF5ZaCVsaRMlrG?=
 =?iso-8859-1?Q?/xu+LoyUB28RK2gGWmZFI9PP8kCa0ISfpQPu1dzU8zvZUGg6sjO5QJbYRq?=
 =?iso-8859-1?Q?ICuiJcEv/RO+dDOw4FkqlR7IInP5c53tKpbn7Gw2PhYgwd5T1BjVrLtCWX?=
 =?iso-8859-1?Q?3KU4MX74qTJIHenXEPTF/RwLQQn/xCaZmyqW5coh1WLI48ZljxepF9ckDX?=
 =?iso-8859-1?Q?B3ifaA43SiNHDhRhnl2Eqhi0imj03mInYinNgvgtWeTQ6cVBrWxlbSe3qm?=
 =?iso-8859-1?Q?t9jSFtPHd35lZ7ovGq7ruRlA1kC7tMcXjL1ZmWedrNUgMboHeRy6CP/Iy9?=
 =?iso-8859-1?Q?8qOdEyHK7C5SwbelyLgt0H6AZ5qE1EdlGHBrI9274Z5x/XgNHSv5zpR4ho?=
 =?iso-8859-1?Q?if9SNk1CTu2Se2bP/4xTZDXfPHCzTO1Wa21pZTCqjevQVT3nQnZFxToO3m?=
 =?iso-8859-1?Q?XDZhAiZRjRgzuL42S1s09jtGkYpc2j9jAE+c0o67abkolrImZ9Oc7O1EbO?=
 =?iso-8859-1?Q?QbtZ6e27O2ABY1blitw88+AU1U1UsAHg/J6migdlJ1ITv4IblbJhIprSge?=
 =?iso-8859-1?Q?TpNrdLpdLHSv5iQg6ByJO9WKR/whQ9YP+63MiioivaJITkAFWJG2/n6Zfe?=
 =?iso-8859-1?Q?XuIhHaz9JAzKSqc+/JIgEEHSJmnYxwZD9+fVMFXUJ7KHUEvWYclyYVO12J?=
 =?iso-8859-1?Q?1CgsAZumTrJNSW76Pnzv6A/NbRDW2+x3VhJMhRei9UKq0l9ajY9PQ9+M7Z?=
 =?iso-8859-1?Q?2Hzx0NNgjy/BuTmN81Pr3bVPJ3R/nLpk+GTWSUuymal0WFVmBfnddOzfH8?=
 =?iso-8859-1?Q?gtKtZKDQzKCi4q6JOqmwigpph+HVHRfcfUiRmS2pFHr7Zl5StK00sLTSZ6?=
 =?iso-8859-1?Q?exHo4OcOrsLl3J4DYNKabvwH1tvGqSzZFD3EkLf1tgQzE+/zAl2GwNShA0?=
 =?iso-8859-1?Q?9Gjf6qpkTLOmY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d093eba-09f7-4265-e570-08dc5de1454b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 06:48:49.0880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /NBkSL4Kxtxt3CelCM+InDvRHbwgKmntz21SARpqJ5Y+mVwspqmWm2oBm133Ur/NRIs9DkpLwx2joVEsaSr26w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9770

Hi Julien, John,

> Subject: Re: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
>
> Hi John,
>
> On 15/04/2024 12:17, John Ernberg wrote:
> > Hi Julien,
> >
> > On 4/15/24 1:03 PM, Julien Grall wrote:
> >>
> >>
> >> On 15/04/2024 11:50, Andrew Cooper wrote:
> >>> On 15/04/2024 11:25 am, Julien Grall wrote:
> >>>> Hi John,
> >>>>
> >>>> I saw this patch was committed. I have one question this may
> >>>> require some adjustment.
> >>>>
> >>>> On 08/04/2024 17:11, John Ernberg wrote:
> >>>>> ---
> >>>>>     xen/arch/arm/platforms/Makefile |   1 +
> >>>>>     xen/arch/arm/platforms/imx8qm.c | 139
> >>>>> ++++++++++++++++++++++++++++++++
> >>>>>     2 files changed, 140 insertions(+)
> >>>>>     create mode 100644 xen/arch/arm/platforms/imx8qm.c
> >>>>>
> >>>>> diff --git a/xen/arch/arm/platforms/Makefile
> >>>>> b/xen/arch/arm/platforms/Makefile index 8632f4115f..bec6e55d1f
> >>>>> 100644
> >>>>> --- a/xen/arch/arm/platforms/Makefile
> >>>>> +++ b/xen/arch/arm/platforms/Makefile
> >>>>> @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   +=3D sunxi.o
> >>>>>     obj-$(CONFIG_ALL64_PLAT) +=3D thunderx.o
> >>>>>     obj-$(CONFIG_ALL64_PLAT) +=3D xgene-storm.o
> >>>>>     obj-$(CONFIG_ALL64_PLAT) +=3D brcm-raspberry-pi.o
> >>>>> +obj-$(CONFIG_ALL64_PLAT) +=3D imx8qm.o
> >>>>>     obj-$(CONFIG_MPSOC_PLATFORM)  +=3D xilinx-zynqmp.o
> >>>>>     obj-$(CONFIG_MPSOC_PLATFORM)  +=3D xilinx-zynqmp-eemi.o diff
> >>>>> --git a/xen/arch/arm/platforms/imx8qm.c
> >>>>> b/xen/arch/arm/platforms/imx8qm.c new file mode 100644 index
> >>>>> 0000000000..3600a073e8
> >>>>> --- /dev/null
> >>>>> +++ b/xen/arch/arm/platforms/imx8qm.c
> >>>>> @@ -0,0 +1,139 @@
> >>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >>>>
> >>>> The majority of Xen code is using GPL-2.0-only. In the early days
> >>>> for Xen on Arm we started to use GPLv2+ which I consider it was a
> mistake.
> >>>> Unfortunately this started to spread as people copied/pasted the
> >>>> same copyright headers.
> >>>>
> >>>> So can you confirm whether you intended to use GPL-2.0+? If not
> >>>> would you be able to send a patch to adjust it? (Better to it
> >>>> before there are more modifications).
> >>>
> >>> Julien: I've called you out multiple times before.
> >>
> >> And there are multiple thread explaining why I am requesting if we
> >> can use GPLv2-only. In fact from CONTRIBUTING:
> >>
> >> The recommended license of a directory will depend on the COPYING file=
.
> >> If the new file is using a different license, this should be
> >> highlighted and discussed in the commit message or cover letter
> >> introducing the file.
> >>
> >
> > Since part of the code was not written by me, but by Peng, I think
> > both of us need to agree to a license change if one is to be made.
>
> Ah I didn't realize that Peng also contributed. Let's wait if he is happy=
 with the
> change.

I am ok with the change.

Thanks,
Peng.
>
> Also, offline, I was pointed out that I could explain a little bit more w=
hy I
> asked if this could be changed. From [1]:
>
> "IIRC from past discussion there are two broads concern with GPLv2+:
>     - We are leaving the choice of which license applies to the person co=
pying
> the code. So if a new version is released that is less favorable to the i=
nitial
> contributor, then we have no leverage.
>     - Some companies are rather cautious to contribute code that may be
> licensed under GPLv3 (would be allowed with GPLv2+).
>
> The later is particularly a problem because not many people realize that =
a fair
> part of Xen on Arm is GPLv2+. I never really understood why we chose that
> (this was before my time) but this got spread as the existing copyright w=
as
> added to a new file. Admittely, the contributor should be more cautious. =
But I
> would not say this is trivial to spot the difference."
>
> Cheers,
>
> [1]
> https://lore.ke/
> rnel.org%2Fxen-devel%2Ff235f6f8-d585-4e24-7fc8-
> 3f2df9240c9d%40xen.org%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C
> 07ac104b960d476c349f08dc5d420db6%7C686ea1d3bc2b4c6fa92cd99c5c3
> 01635%7C0%7C0%7C638487785488861385%7CUnknown%7CTWFpbGZsb3
> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%7C0%7C%7C%7C&sdata=3Dd5RQJ8nek5a8Xgi%2B%2F9g3GqDL8CZmd3c
> O9EN6w57S9qE%3D&reserved=3D0
>
> --
> Julien Grall

