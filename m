Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6E9B092D0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 19:11:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047164.1417607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucS7m-00030P-PT; Thu, 17 Jul 2025 17:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047164.1417607; Thu, 17 Jul 2025 17:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucS7m-0002y2-MX; Thu, 17 Jul 2025 17:10:26 +0000
Received: by outflank-mailman (input) for mailman id 1047164;
 Thu, 17 Jul 2025 17:10:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s8Qr=Z6=dornerworks.com=Nathan.Studer@srs-se1.protection.inumbo.net>)
 id 1ucS7l-0002xw-Nc
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 17:10:25 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on062d.outbound.protection.office365.us
 [2001:489a:2202:c::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e694e771-6330-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 19:10:14 +0200 (CEST)
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:195::20)
 by SA1P110MB1832.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 17:10:09 +0000
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea]) by SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 17:10:09 +0000
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
X-Inumbo-ID: e694e771-6330-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=fByhARbGX7wllFqgzqERxdiamLca6Hx/a6Y/EjhQZpgY7kYKBWqPUI+Nd/ahfASFrP7icB06jJZUv5nUQ0GQpjnnT7pYg5Fy0NHeq+jdxTe1Q3JAIkGrIYCoJxvxn8SryHZ60XfkKPVYQu8grxGw33XCmFn0IAxwVgbL0QQuwK+CGovd8sELvEadk+M8pG0r1HAYlBUodoPuuCqmoaMGJSnr4Z89Njmy166Jk51k7uMx0oV7Ln4MM5FCQS7y4X4L2IRR2frW9/kupgWl3R5WX9EMspstDDHcWzzm8N4c9UNAFcxFEqcbKYtXv2VcuM0kQJdh4lDqtoRuHzvIrcSurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPG2S0Hoclplsu7PzCi/sIGf5U2h9w5CVEjvEgXu1aQ=;
 b=S2IlT3H5Emf2oaWTVr0caTzmth7M47a+owP7yJ4i1mKoDv7SsXXjIOLz/hHLqM8XQgvJ4gfubBBRncXyuhoCZaKClIZMEmC+48CbXWODO3L6RKH43vSMGzZprEqpZR3xRScjVifjLDQvj60LZ33iuEmigh6CKAoKMjsFxZYkJ1nS5ORL/eRQtsfW0R91WQJJvQlD3hNzqlRE7aWzOpk829oiI8Zo0h+UQnl65mGII4BcMxaxx+/PUpWdgqXhx85wVYxC7yivXazrKDQmmhwUmzuxvIEFlQPmtwVSAQ/2AkJevOYdaeIYC4wFe57BCXj8qvTPrCRG+VDReXzPGVUf3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPG2S0Hoclplsu7PzCi/sIGf5U2h9w5CVEjvEgXu1aQ=;
 b=W+di1+hHc7PKbjJmuDo7SPRFbWDYZmKnIjBYNAM2SEHNRQYJkBolodcCo2M4BgY0DSvV1cKUTv0ROj0muyPyniTF3u+Ah0Ml3GK0gntKuYFt/Yewrsxhw/1lw42LDD3FaLyZ4K3P2GGihTJQytdiYwrAbFX/Ooh1r7nfzxvgsMREyAOL69mxwG+MRs6rD6JrNdQLvNmmi6VZGsg4X+SbSU64/6P3tREISKLoUyyyxpgJnSxsh9ZQKGQ+aZJ5uNMUDCX6B2BJ5lqqojJr+RKf3b26X2G50Y27yflDuDGVNf3dlpVOXefxZQgNeKFcqNPCeQnGCQrvN3ykQxt24P1CUA==
From: Nathan Studer <Nathan.Studer@dornerworks.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>, Anderson Choi
	<anderson.choi@boeing.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>,
	"joshua.c.whitehead@boeing.com" <joshua.c.whitehead@boeing.com>, Stewart
 Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, xen-devel
	<xen-devel@dornerworks.com>
Subject: RE: [XEN PATCH v2] xen/arinc653: fix delay in the start of major
 frame
Thread-Topic: [XEN PATCH v2] xen/arinc653: fix delay in the start of major
 frame
Thread-Index: AQHb9TbxXTsT52waBEmzEYNFgYIkNLQ2UMAAgAA7YGA=
Date: Thu, 17 Jul 2025 17:10:09 +0000
Message-ID:
 <SA1P110MB1629479AEC6F1B8583D7725EF451A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
References:
 <c3234cf8d5fb5da84e10ebdb95250c594f644198.1752197811.git.anderson.choi@boeing.com>
 <2c4837b7-404f-47a5-8c6c-f3a707bb544e@amd.com>
In-Reply-To: <2c4837b7-404f-47a5-8c6c-f3a707bb544e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1629:EE_|SA1P110MB1832:EE_
x-ms-office365-filtering-correlation-id: e49d055e-f5c9-4847-224a-08ddc554c8b5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?uoblDP/J+8IVrn1cwpMtdTnRENe3DKbYjtPqNJM9c9aXvD64m2rG6li4mBZg?=
 =?us-ascii?Q?oSLNZp4J4wQxmhId8o4jGjf5z+SHNceDSflKmKDBBwlX/HBSwRQw2HDw0LJS?=
 =?us-ascii?Q?r/OKvtH3pfd4czYy0QO5A6EtylcQw3ABVNQMnvX2Dry/XK3cdBdzCtAhsX5u?=
 =?us-ascii?Q?9bLxZ0kO2xfltdMEU2Yi+eyaseCgJT/yLmqSNaQmcMgDT9riq9D4POIxL/3h?=
 =?us-ascii?Q?gr8gzzJJic+PHmmT04rxeKOzw1F+1DnPSRS2obxW8zCZRaC11rEuSeMZJxoK?=
 =?us-ascii?Q?8Ajnp1YSxu5Qc+tTwWY1hPH73tR9m9bwaqA/mUKduW3my8uCp/E5Czb1WvKd?=
 =?us-ascii?Q?O0nDktF2EzxBMdLvzF14rR6PNkYE0OGCC6rGC+uw9CmXmBSOKbmxVTR7gTzZ?=
 =?us-ascii?Q?eEndkFiukXNHNJvmbaUoHHDmKyLemo/teA4evNwcFIWO7L949nMH3OYIZZAU?=
 =?us-ascii?Q?IDAXkC2JUPahL44+zL7j/zvbLxZF5VN157O9jPe7uzTM39ICrzmJTfpNo1zN?=
 =?us-ascii?Q?YJ3F6IR4oaNh/84jkk7qR9TgzA3xaVb+9zrO9TSXrkz85RvtE3I2q//bJYRr?=
 =?us-ascii?Q?B8OFTBb6TiBjNdThipatC9TVSfaMrD5i16wrgrA15bsDnK2QDDT2SJorWmex?=
 =?us-ascii?Q?qmArWoJ6tZ//FaHb25RBc5ThCwzMdUGkSzbJvsh8AMoq25gt2O7rvhgkdaAN?=
 =?us-ascii?Q?Wy/YBXQhuZMzFD/GbPe/Nz7HSQXsogDwG3csAPD4yGfAfB4EU3hB0H2hyhaX?=
 =?us-ascii?Q?vOKqJiqNQYSpfaufu6MDZdB+BGBI6RrIxGvHXyhOqsvB+LZfXpuIsECONiPz?=
 =?us-ascii?Q?ghlsUW7HaSpIMxMGWX8mXEh1Uxcn2gMSALMEw7YrKeDOHnhKco9Y9NJzKoUt?=
 =?us-ascii?Q?rVdHyiuepvBiMLkmukEkodmlDQFj1S2DPPh/KnYumVhCx4nPoiJI6Tb8FBL+?=
 =?us-ascii?Q?Bb4Mr0Zm856oGjCtwGk+pFaCUnztxz4lam3EwFRSWFBGjoGDDICP9LnafCQT?=
 =?us-ascii?Q?tOIK0aIm7uNn16I4Dq0CWXKAG9O06QoanCtU3SWzYb4qdDqZATvhb5mMTiVI?=
 =?us-ascii?Q?DhtZsfohwbdXRj4oRz/LY3p4a7vBVU52RpC7DqkAzGgJAjszcDk+LGpY3I4c?=
 =?us-ascii?Q?zjlfGJzWTGGpAssAfLO64KWSo01g4yuxYAKTyhUsZmHYmyheiDGiCTgqWOER?=
 =?us-ascii?Q?qbWun2hBKuHbDyN1SSj3cf06OXqufNTbbcwQzliQDwSMdBhjcipzgxMwyuuu?=
 =?us-ascii?Q?Katd7jmwJprSiulo9R/Pqwblhhr9v4Q2QnJ8QLiP+LcP5qO3NS9nj7PZ1k5u?=
 =?us-ascii?Q?V7O1wo7ixlA+Obx5RbQ3RV/tkUJHY7kd+H5/kDKtwZ4rhzgQQpa12Yt5XOQQ?=
 =?us-ascii?Q?tPb6mg/FJTEIzpGAgEd4npwyRUb0b6tkhmjiWx+OsWNBpYZIfDYoydUmfDP6?=
 =?us-ascii?Q?NNHP4aeKtraZgjUY/X23r6AXEpEwvYMH1DZqnxw12ax8FH4EjELZt+F2Fexy?=
 =?us-ascii?Q?qCHBiWYyZlCYeKw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0kOEN6rHbKPiG7Oax1Cn3CgyJ8TnbMg1wFbZJ9RdxwXof9izQnrx4aSrxCH6?=
 =?us-ascii?Q?KHxiAgL4v6PTvMVAjXvaEvWZyvusIV0kEY1OrcklRG2j4A1OUsAx45T/DAbC?=
 =?us-ascii?Q?6RLLGhrAnhXJjlzOowU9ecNBO9MEO6gtOliB0yfXWh7o2ucA7dLYojh3zWip?=
 =?us-ascii?Q?S8YljeFYRLak57SKEzmCPIkFn4eq/AQ95QShjlBK0jvtmzuRFI+1JHQoBWx2?=
 =?us-ascii?Q?CsshOpq8Ns8O6vo8VBjBVswMhpqId9vcg13ivYFkcReFbxbkOP4HDK/gUch/?=
 =?us-ascii?Q?n6mynSWQ19bbNZzktEcYL/uX+E0+/BvfQ20lANSYizY/eKpVTXCWEJ8Wvt4C?=
 =?us-ascii?Q?GePe1KzPRtlrqsiGSNnAArWEdCPjNGFkp61MPpI+dzs3DaMVCd0eP5bUH0DG?=
 =?us-ascii?Q?oGc+7ck/O5Vd7xGn5DPC/ViBi5oEfQjWs7WB04fIggxPf3aNDJqNivaANuEL?=
 =?us-ascii?Q?5nTi8PgOEpoSBJAJLZCTUToClPHhAIyD655ulpn16pbhTjuDZUN5l5vUQW+i?=
 =?us-ascii?Q?N32LG7N63q5Bigp/ugbLc0A8kzpCNl7SJminN83q+l0vcML7M8048s4QDfz4?=
 =?us-ascii?Q?CJxIQWziItUKrYCmpvLd38LNvA1zgIheDNYt9m8Yc5PSPOLvhwjY6f09AFTQ?=
 =?us-ascii?Q?cUUAAmToF309EaztGiNf2XTzbCRzvxTjOfmCAF1hUP8bJMNCFIwjwJdFXn7S?=
 =?us-ascii?Q?+ZBfDfdpn37x88hum0BIu2MJh5Q3txxdU6DqvLpDeNb7SV33e9VDRlm1OSb9?=
 =?us-ascii?Q?1xKZXUL26DdSNpnC46LyxIIoP76vcyD08albTTLnMBVymSbqn3wZiWIH8AUO?=
 =?us-ascii?Q?NcWS/m1qw248ANUf0MXg9JEgOtgL7skcPNh0Of3i2eCjzWfGV3UEOBibBdHi?=
 =?us-ascii?Q?RRDD8UTJ1uXTm/nxGQ5ixclIbLIq0KKbGGWTbZ7iwzZh6DBZc3cESbPo68EG?=
 =?us-ascii?Q?daynd/PG/24nFAjUdJn6b7vhllbjhOXQ1RVUTpNaY/O1Fv2dUEjO3c+sn+8+?=
 =?us-ascii?Q?r+CkQB2buNi9oclmXFNihBAeVVcAPByyoO11xP4kR/RCbs52QZWSQcuvsk2i?=
 =?us-ascii?Q?V686DpiiNGlsj+gOU4W0B+64A3EK0xRWpjarHlHDMRStYsHgnrHKS+gsNzRJ?=
 =?us-ascii?Q?CKs02Qx/y58wBrwrCYKhFzeM9c/a9b9if+3CQVQJ/c47iwwnJg6gmV4dfzgj?=
 =?us-ascii?Q?ML9d24aaFvgyAJPOU5Q3kzrVc73gQDw6Yi3rrfBOtenSD9mJhuSYydsqjLco?=
 =?us-ascii?Q?nLBdR+ZzeWgcA3VVLV7CkfHYapApb5qxn8yHANDcxFK0kkR+QGV0JcHdfIco?=
 =?us-ascii?Q?/V4hSHyIJ8F5DMskCOJekRpGe4ZDNh60MvOq95Aflhhe24vbO1c8oIzlZC8M?=
 =?us-ascii?Q?xt2au/k6sZLjgofenX5yrKRIUm1t7Sy753acJ2Y8O9mT6K5yN/AEs3/YDFua?=
 =?us-ascii?Q?eg4HoJ+1bQJhmcV01WvYQvZ84y0IqbMX4JKzXiQ/ChzodXguSXypV9F/MO8/?=
 =?us-ascii?Q?Wr4mRSdywwQcV6QuHx1WiSm3plkOMWU7HiXH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e49d055e-f5c9-4847-224a-08ddc554c8b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 17:10:09.1700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1832

On 7/17/25 9:21, Hildebrand, Stewart wrote:
> > -    if ( sched_priv->num_schedule_entries < 1 )
> > -        sched_priv->next_major_frame =3D now + DEFAULT_TIMESLICE;
> > -    else if ( now >=3D sched_priv->next_major_frame )
> > +    /* Switch to next major frame while handling potentially missed fr=
ames */
> > +    while ( now >=3D sched_priv->next_major_frame )
> >      {
> > -        /* time to enter a new major frame
> > -         * the first time this function is called, this will be true *=
/
> > -        /* start with the first domain in the schedule */
> >          sched_priv->sched_index =3D 0;
> > -        sched_priv->next_major_frame =3D now + sched_priv->major_frame=
;
> > -        sched_priv->next_switch_time =3D now + sched_priv->schedule[0]=
.runtime;
> > -    }
> > -    else
> > -    {
> > -        while ( (now >=3D sched_priv->next_switch_time) &&
> > -                (sched_priv->sched_index < sched_priv->num_schedule_en=
tries) )
> > +
> > +        if ( sched_priv->num_schedule_entries < 1 )
> >          {
> > -            /* time to switch to the next domain in this major frame *=
/
> > -            sched_priv->sched_index++;
> > -            sched_priv->next_switch_time +=3D
> > -                sched_priv->schedule[sched_priv->sched_index].runtime;
> > +            sched_priv->next_major_frame +=3D DEFAULT_TIMESLICE;
> > +            sched_priv->next_switch_time =3D
> > + sched_priv->next_major_frame;
> >          }
> > +        else
> > +        {
> > +            sched_priv->next_switch_time =3D sched_priv->next_major_fr=
ame +
> > +                sched_priv->schedule[0].runtime;
> > +            sched_priv->next_major_frame +=3D sched_priv->major_frame;
> > +        }
> > +    }
>=20
> There's no need for the above loop, this can be fixed by subtracting the =
remainder
> (modulus major_frame). E.g.:
>=20
>     if ( now >=3D sched_priv->next_major_frame )
>     {
>         s_time_t major_frame =3D sched_priv->num_schedule_entries < 1
>                                ? DEFAULT_TIMESLICE
>                                : sched_priv->major_frame;
>         s_time_t remainder =3D (now - sched_priv->next_major_frame) %
> major_frame;
>=20
>         sched_priv->sched_index =3D 0;
>         sched_priv->next_major_frame =3D now - remainder + major_frame;
>         sched_priv->next_switch_time =3D now - remainder +
>                                        (sched_priv->num_schedule_entries =
< 1
>                                         ? DEFAULT_TIMESLICE
>                                         : sched_priv->schedule[0].runtime=
);
>     }
>=20

The direct method suggested by Stew is preferable in the unusual case where=
 many major frames are missed.  (We have only seen that happen when using a=
 debugger.)

To help uncover any issues like the one this patch addresses in the future =
we may also want to follow up this commit with a change to make scheduler m=
isses more obvious.  Something like the following:

commit e95cbc9078127c412bd1605d93cb97837751b5b4 (HEAD -> master)
Author: Nathan Studer <nathan.studer@dornerworks.com>
Date:   Thu Jul 17 12:43:39 2025 -0400

    Do not silently skip frame overruns

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 2d0d3bcbb3..a2c1c66c27 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -523,9 +523,17 @@ a653sched_do_schedule(
     a653sched_priv_t *sched_priv =3D SCHED_PRIV(ops);
     const unsigned int cpu =3D sched_get_resource_cpu(smp_processor_id());
     unsigned long flags;
+    unsigned int oindex;
+    unsigned int missed;
=20
     spin_lock_irqsave(&sched_priv->lock, flags);
=20
+    if ( now > (sched_priv->next_major_frame +  sched_priv->major_frame))
+    {
+        missed =3D (now - sched_priv->next_major_frame) / sched_priv->majo=
r_frame;
+        printk(XENLOG_ERR, "Missed %d major frame(s)!\n", missed);
+    }
+
     /* Switch to next major frame while handling potentially missed frames=
 */
@@ -544,6 +552,7 @@ a653sched_do_schedule(
         }
     }
=20
+    oindex =3D sched_priv->sched_index;
     /* Switch minor frame or find correct minor frame after a miss */
     while ( (now >=3D sched_priv->next_switch_time) &&
             (sched_priv->sched_index < sched_priv->num_schedule_entries) )
@@ -553,6 +562,12 @@ a653sched_do_schedule(
             sched_priv->schedule[sched_priv->sched_index].runtime;
     }
=20
+    if ( (oindex - sched_priv->sched_index) > 1)
+    {
+        missed =3D (oindex - sched_priv->sched_index - 1);
+        printk(XENLOG_WARNING, "Missed %d minor frame(s)!\n", missed);
+    }
+
     /*

> The commit description may want some minor updating to reflect this.
>=20
> > +
> > +    /* Switch minor frame or find correct minor frame after a miss */
> > +    while ( (now >=3D sched_priv->next_switch_time) &&
> > +        (sched_priv->sched_index < sched_priv->num_schedule_entries) )
> > +    {
> > +        sched_priv->sched_index++;
> > +        sched_priv->next_switch_time +=3D
> > +            sched_priv->schedule[sched_priv->sched_index].runtime;
> >      }
> >
> >      /*


