Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1E857E855
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 22:34:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373475.605696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEzL7-0007cp-Fj; Fri, 22 Jul 2022 20:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373475.605696; Fri, 22 Jul 2022 20:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEzL7-0007aI-CP; Fri, 22 Jul 2022 20:33:37 +0000
Received: by outflank-mailman (input) for mailman id 373475;
 Fri, 22 Jul 2022 20:33:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DGSx=X3=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1oEzL5-0007aC-Pr
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 20:33:36 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0094.outbound.protection.office365.us [23.103.209.94])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bb51a08-09fd-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 22:33:31 +0200 (CEST)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1433.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:180::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Fri, 22 Jul
 2022 20:33:14 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27%3]) with mapi id 15.20.5438.025; Fri, 22 Jul 2022
 20:33:14 +0000
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
X-Inumbo-ID: 8bb51a08-09fd-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ye4QgLX8yYEVNgqQyIq1QtQJKO8+bfR8nsU/SjP1rxaCCiJ+URyc/Iwk4dqiNPiNnkeB5V7q64CD6p/4IBEVX3/2iHgybzLYD67W+xTDna/bm+IkYHYLwJDLJO5VzsCSd1KmNGufFc9AdpQGAskTfncnDmANvFnot4stn84HWdwRS0ymRBsP2KrAtK4m8Zsd/zz7ijBzkrc0Auwospi2pb6bOruN7MJeduwYOjyX6U0OUbhrxgJSsZFktAtA11/ICMKlHf3yso0A/uisdKMQln88Wz3lbnA8PDuo6kwazyDnpHEHY3fvv5QiTwl+hGoILU+tQnx2F2RwU7vmVoWutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+312G5s2Hko5HdbemCSLwRYiOVwjVoYNR2dui20+Do=;
 b=ahXgVqjA8P/mwdpCDcyC5k+swnVU08aggwjG9k8dKBA0mm//tDSvOA6ur6MiZ3dGWDhqr8dGiAPM1lgD0D/fG5QnBLZQsxbKWqKfghiefEV8jtojvKGdVfGVALq/Bl3Jj0Dg7Fxyn5KK5cUQ9xvPPNLqii58zotGVMECZkp7af1kUORjU5FWtOD3PHXbCF1WGL7L2Lf0kchso+H3k/4uW/zTovhv0SRpEoX6TJAqfoIFpmh9Jvu5/arv04Qb2TOQmTbRXh7ulEmhLXUTzjeNevGAYFLQD1aWAcr1UDiclOxtZKLquxm9kmvV9RNo4X+PgsiDQw9WQ4N79pOXKfjyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+312G5s2Hko5HdbemCSLwRYiOVwjVoYNR2dui20+Do=;
 b=qpVA+ttJFiy2N3qUUK/TAhSKvwwLLRrvlh+X+wCMyGw2xwwyL6cHnVMw5MSfwlpink7pSVhTYFLyV0tYhTvZjPSygxJl7XN2NToeMAyClauGq+9GUm3n05rT7ACx35O2ORnjK3i0G/C/VmV6Fq3gIJLzQ8Fh612NiqRC2LcopmtAJkqIxGJ97VXiKyRMOPMU/uZHhMDLVAb6Wz8uvF/gy2YTFs67RXZ87QWgmXPaISmuI0/wz9DBeYMN2oW1Tod8335uYReMM2LGTFPv1rr8iDkbwknZfeOucZqzpd5xalyIymPXdEY5MVr2yoBmK2AALR15Ky3NIyc5s1m3rQNcTw==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 10/18] x86: introduce the domain builder
Thread-Topic: [PATCH v1 10/18] x86: introduce the domain builder
Thread-Index: AQHDrne88XyYXkgxTAt6TFUls0rRYAIuncUgrZgzpLCACqtagIAAUITg
Date: Fri, 22 Jul 2022 20:33:14 +0000
Message-ID:
 <BN0P110MB1642483783653FB7A1D63547CF909@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-11-dpsmith@apertussolutions.com>
 <BN0P110MB16425760D6D6991942DEE6DCCF8C9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <96cc29cf-5b31-eabd-3cca-eeaa7d7c58db@apertussolutions.com>
In-Reply-To: <96cc29cf-5b31-eabd-3cca-eeaa7d7c58db@apertussolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c7e2b41-8b24-4b1d-82da-08da6c216704
x-ms-traffictypediagnostic: BN0P110MB1433:EE_
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2vSnCfchwuxWIvpaThTWa8WP4K2oZ/vifRj+Os5iO4m+qRH/9HLIh6xxGzAJAv2Oa0V+BaNi3Re0J1ijDCg8QGjZtLT4GHzd9LRQoMYbWuYt1ZRYMm5O3UqYbWOcwjsSQ5Rt0EIAGBeS+6sxvBhEsMeiCaytNYmT0a+yYR1DFPaC9663JBXJu+qiGe06yrq/k/yz030gfUvde7eI8208w9hHILx3d4WkzcU7xYrNGMBiaC5yn33vzvXP0u526KkQUomNgD2DL1N+egt68icTrR2kXOBCjmQy/lM8vcrjMi6jJjehwFEMG4+F45oBXrQc4C4g99zMEJi0j73fDdlMC15AYZLU3QmVnkFfw0BzAxKCYW+mHluj2F+OjSh+IcReTWQO1MPa98e4eR3s37VG3Vph8ikxmb1WV7VpNl8qROE21ZkW/IKTxaAhNBARGOtCsI8KItG3+r2pkgb8tuXIzUEAJdJ8lrF5IZBgP4FrnHNkrvR94tQhE4sg7YaIJQDoScoIHzRbeNDsOkpVtoZRaNZRHlxe7LBzLLctWgybu9Ejp4EYqLrhv19H11KHQDgaM4O5T0PnpbEDK0FBR8lWu9FRPLitvFPVzU65XqwNUheyV488oWDqs8G01mTVOY4Lmh25dAM8SKawmz2SgTVJDdKbLdhZ2ZcTSBu6veFiaSBzJm6mdy2GzP+IB/AP7Rf4AXJuCu3cuTU6PLmqdnKcMkUHBCQ0ABJpix6RLOmdB77NrJUGNGcd0fHYxymMCYXA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(55016003)(83380400001)(110136005)(9686003)(38100700002)(33656002)(186003)(2906002)(8676002)(64756008)(66446008)(66476007)(66556008)(6506007)(7696005)(71200400001)(5660300002)(53546011)(66946007)(498600001)(122000001)(86362001)(38070700005)(76116006)(8936002)(52536014)(82960400001)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 a3L6ZUxAunzSgdS8vLvwlhLSzhdknBmldDeOiWFw4DXqTeazlGU+0T8D7d8RADuWAO6xKlEETrupDodopyFSv1GBmVu0WEh8jKafnwR5fWMMWCy0s0eEUSkZo0UNGkpigK42DJ1IuhyLuB/snGTfNp0AMS6c+hNIxEdGNboAqI6/WHZEsvE/TODRgEARB8tekCIR7zWWKC0ziASxzmc/PCRg/Oe/hNisioXRTN4aGR+3ZdAww29k7WYU4KNEoKCfBvTKBaPOdH0ipacJbSa9ECrzJHbOzKxvtAEmKNAEIywCwk3fI0FV4H13EDD/tqt+E9B0OJ5xTPkYbLjQzUSzK912MjTYk+kCThCUH9pd5zb+ayF2q3jg67wrRJSnCkHqTmluYqbsvhwNyDYNwF0iJd/NlYx3xpqVcgb0lqN41WjOtvlIQx9pYX4LBwbxPq49YKcww4KsGhdvokB/P3SSVe1apNPu+JMnwu5A1CM9tow=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7e2b41-8b24-4b1d-82da-08da6c216704
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 20:33:14.4103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1433

> -----Original Message-----
> From: Daniel P. Smith <dpsmith@apertussolutions.com>
>
> On 7/18/22 09:59, Smith, Jackson wrote:
> > Hi Daniel,
> >
> >> -----Original Message-----
> >> Subject: [PATCH v1 10/18] x86: introduce the domain builder
> >>
> >> This commit introduces the domain builder configuration FDT parser
> >> along with the domain builder core for domain creation. To enable
> >> domain builder to be a cross architecture internal API, a new arch
> >> domain creation call
> > is
> >> introduced for use by the domain builder.
> >
> >> diff --git a/xen/common/domain-builder/core.c
> >
> >> +void __init builder_init(struct boot_info *info) {
> >> +    struct boot_domain *d =3D NULL;
> >> +
> >> +    info->builder =3D &builder;
> >> +
> >> +    if ( IS_ENABLED(CONFIG_BUILDER_FDT) )
> >> +    {
> >
> >> +    }
> >> +
> >> +    /*
> >> +     * No FDT config support or an FDT wasn't present, do an initial
> >> +     * domain construction
> >> +     */
> >> +    printk("Domain Builder: falling back to initial domain build\n");
> >> +    info->builder->nr_doms =3D 1;
> >> +    d =3D &info->builder->domains[0];
> >> +
> >> +    d->mode =3D opt_dom0_pvh ? 0 : BUILD_MODE_PARAVIRTUALIZED;
> >> +
> >> +    d->kernel =3D &info->mods[0];
> >> +    d->kernel->kind =3D BOOTMOD_KERNEL;
> >> +
> >> +    d->permissions =3D BUILD_PERMISSION_CONTROL |
> >> BUILD_PERMISSION_HARDWARE;
> >> +    d->functions =3D BUILD_FUNCTION_CONSOLE |
> >> BUILD_FUNCTION_XENSTORE |
> >> +                     BUILD_FUNCTION_INITIAL_DOM;
> >> +
> >> +    d->kernel->arch->headroom =3D bzimage_headroom(bootstrap_map(d-
> >>> kernel),
> >> +                                                   d->kernel->size);
> >> +    bootstrap_map(NULL);
> >> +
> >> +    if ( d->kernel->string.len )
> >> +        d->kernel->string.kind =3D BOOTSTR_CMDLINE; }
> >
> > Forgive me if I'm incorrect, but I believe there is an issue with this
> > fallback logic for the case where no FDT was provided.
>
> IIUC, the issue at hand has to deal with patch #15.
>
> > If dom0_mem is not supplied to the xen cmd line, then d->meminfo is
> > never initialized. (See dom0_compute_nr_pages/dom0_build.c:335)
> > This was giving me trouble because bd->meminfo.mem_max.nr_pages was
> > left at 0, effectivity clamping dom0 to 0 pages of ram.
> >

I realize I never shared the exact panic message I was experiencing. Sorry =
about that.
It's "Domain 0 allocation is too small for kernel image" on xen/arch/x86/pv=
/domain_builder.c:534

I think you should be able to consistently reproduce what I'm seeing as lon=
g as these two conditions are met:
- the dom0_mem cmdline option is _not_ set
- no domain builder device tree is passed to xen (the fallback case I ident=
ified above)

> > I'm not sure what the best solution is but one (easy) possibility is
> > just initializing meminfo to the dom0 defaults near the end of this fun=
ction:
> >         d->meminfo.mem_size =3D dom0_size;
> >         d->meminfo.mem_min =3D dom0_min_size;
> >         d->meminfo.mem_max =3D dom0_max_size;
>
> I believe the correct fix is to this hunk,
>
> @@ -416,7 +379,12 @@ unsigned long __init dom0_compute_nr_pages(
>          }
>      }
>
> -    d->max_pages =3D min_t(unsigned long, max_pages, UINT_MAX);
> +    /* Clamp according to min/max limits and available memory (final). *=
/
> +    nr_pages =3D max(nr_pages, min_pages);
> +    nr_pages =3D min(nr_pages, max_pages);
> +    nr_pages =3D min(nr_pages, avail);
> +
> +    bd->domain->max_pages =3D min_t(unsigned long, max_pages, UINT_MAX);
>
> Before that last line, there should be a clamp up of max_pages, e.g.
>
>     nr_pages =3D max(nr_pages, min_pages);
>     nr_pages =3D min(nr_pages, max_pages);
>     nr_pages =3D min(nr_pages, avail);
>
>     max_pages =3D max(nr_pages, max_pages);
>
>     bd->domain->max_pages =3D min_t(unsigned long, max_pages, UINT_MAX);
>
> v/r,
> dps

I don't believe this resolves my issue.

If max_pages is 0 before these 5 lines, then the second line will still cla=
mp nr_pages to 0 and the panic on line 534 will be hit.

Before patch 15, this max limit came directly from dom0_max_size, which has=
 a default value of { .nr_pages =3D LONG_MAX }, so no clamping will occur u=
nless overridden by the cmd line.

After patch 15, bd->meminfo.mem_max is used as the max limit. (unless overr=
idden by the cmdline)
I'm assuming it will eventually be specified in the device tree, but for no=
w, the max limit just set to equal to the size (xen/common/domain-builder/f=
dt.c:155) so no down-clamping will occur.

The only exception is the initial domain construction fallback. In this cas=
e, there is no device tree and bd->meminfo is never initialized.
If bd->meminfo.mem_size is zero, the code will try to compute a reasonable =
default for nr_pages, but there is no such logic max_pages. It remains 0, a=
nd clamps nr_pages to zero.

Does this help clarify?
The core issue is that without a device tree or command line option to spec=
ify the max limit, the max limit is left uninitialized, which clamps dom0's=
 memory to 0. I think it should be initialized to LONG_MAX in that case, li=
ke it was before this patch set.

Thanks,
Jackson

