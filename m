Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B82B39277
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 06:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097420.1451760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urU1h-00015A-RA; Thu, 28 Aug 2025 04:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097420.1451760; Thu, 28 Aug 2025 04:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urU1h-00012r-NJ; Thu, 28 Aug 2025 04:14:17 +0000
Received: by outflank-mailman (input) for mailman id 1097420;
 Thu, 28 Aug 2025 04:14:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urU1g-00012l-FB
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 04:14:16 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2408::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 743ebe50-83c5-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 06:14:14 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB8852.namprd12.prod.outlook.com (2603:10b6:610:17d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 04:14:10 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 04:14:10 +0000
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
X-Inumbo-ID: 743ebe50-83c5-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsqaW92NgQPi3Gn2DAymV+3WrODTtrpZzNW7XCtxPd/GO1dzXDwr/yP1qyR54Tr6PvdwzWn4aEmTP6dgSzd52CZHz03o95xnfPykrJGmIhf+PD+8QC9OM+IP2PWRLShJuCx+waEThOtucpJFiOIIetGO0cTF9cArCsgWo3NF7emNf9vAD53fdsWQBl1sP+uhGnhOFp7lq1onOBRkE+GxK3OHAmevNjuokbAShMIKf5SMDocdieijqU7Pojr8wdvF0km08Cn5AOC5IKQd7xgd/FzA2RtuUrIjWRMBHLnWRqkj6GrJ4oaAKCTsnhKl07P3gXr7NrkpE9jBLYYOKfRBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTV8hKd1XOVU2S4wsTgIXB7xmNSzrtrOxtg4T6Hdxxk=;
 b=wD1CcrJAa2VVVHdM5pB7lnwI+cKDlsRRs9FpBNpJxBgRlxfhxxa5vJ9MvS+unVNXBWuTg9wO5vZa1G0cr4W9tUZxK46pIcB++8TEKNXIoOSkdlRcgE5lHtYOcYEKcNGXGD3y72C6j9Hfnuzkix6vD/mbv1kJNAg/NdRruDTc9dCen8I0UFWmWbQSIvxUUl48BS8fMVsPvU9TM+NArarPwDTR2w3G+BrIXWKwMow+4KhAhlEKxWitxVOLv3jGD+2SHmN+KNyhlR4CFGtJ7cZbO/Dl1IlE7l9CU5X4dxpYi9OlYiPw1lMswbryfgaDfs2mEg22YdvTFQRTI8fU+dCAHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTV8hKd1XOVU2S4wsTgIXB7xmNSzrtrOxtg4T6Hdxxk=;
 b=GBbFvrSujMjH1untLd4sCHtTySwALHWQG18jjgKy6IMUlcYRcT+vn9ryVamYNEKZuJ+3YT1q49nlAbm/VP6WVANtSOWwbKO9yMi3D1LgR+S1On0ELEYQ4Xzmh70oKadhNtLYG3Zz2ZxZD15+XXdTu7AZlSIIvLs/jn385HyBwWc=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Anthony PERARD <anthony@xenproject.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, Juergen
 Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH v7 11/13] tools/cpufreq: extract CPPC para from cpufreq
 para
Thread-Topic: [PATCH v7 11/13] tools/cpufreq: extract CPPC para from cpufreq
 para
Thread-Index: AQHcE1LyQ0lYyaNtv02FRdV+NHpcFrR2pieAgADXRwA=
Date: Thu, 28 Aug 2025 04:14:10 +0000
Message-ID:
 <DM4PR12MB845109C741E3E558EC461943E13BA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-12-Penny.Zheng@amd.com> <aK8itT5YOUkY21n1@l14>
In-Reply-To: <aK8itT5YOUkY21n1@l14>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-28T04:13:06.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB8852:EE_
x-ms-office365-filtering-correlation-id: d24c4489-fc05-43fd-6793-08dde5e956de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kIhZJJQeLIbboZF49CEVNn+H+bHNouu85wrebGwvxXJDsMWZBrrcwTJRpL?=
 =?iso-8859-1?Q?SxPJwUcnmpzgLk8gNXlM5XFGLfvDIWgkGdTPvz3SOKT6yqJfBcOR68OiF3?=
 =?iso-8859-1?Q?dC0W8rB0b624sICwmB7JzJisMy90Rdpq+xg5+MkDbH6z4cmSJuPpDNGewf?=
 =?iso-8859-1?Q?56N+HQVeXeuM3BxpepwxvkzJtLT37KuEOsyBNHIhXsjka6wO+Vku3e/lWA?=
 =?iso-8859-1?Q?JJvdXeQkUf0w5gibeR8VbYj/rWeyA5HdYO2kGrG11R7GgeG5uz3S3ht8/r?=
 =?iso-8859-1?Q?fd2l1Re+GS/ad5b9JMhbTvHaUsoPc811PoNrlf6V6G/KO4TNECVDmvYxen?=
 =?iso-8859-1?Q?nJXB33n6dNaWceQxReGwCws1lrLuryuytG7CMjfRzgtk84KqwUZu6tLM8n?=
 =?iso-8859-1?Q?wrwN09sL9tvaR0zFNoXCzfsJRuTaeyKPtTkC4IILZte47RY5FcUj6v37oA?=
 =?iso-8859-1?Q?bgU5j/AL8vyRohpGSpP/sEOlqxRw573xr717Rltf+32rTZ8ACqQUXLkDy0?=
 =?iso-8859-1?Q?y+xzs/KzGd+FmAEBjN/IrFH1OhvHpouPuqzSkDx7aaB68WZ4GHZwg13e7Q?=
 =?iso-8859-1?Q?3yln+Xv9MvwUBD/bpXuCKVaGQXHzBBMQRSqKuJ0CbEhoia0o0mgRg+UkVt?=
 =?iso-8859-1?Q?paCjHjxnOBTCs0pKODZuzI6VV7R9sF45o6F/LIePrdsv5KQ4yEIO2SB/L6?=
 =?iso-8859-1?Q?zGqGqcC1JcPRi4v/FQ3dOxm/TuZBxOij2BDjGwhrtu4uupS14G6gVtkyc4?=
 =?iso-8859-1?Q?zIfG64KNDfFtndr35OpZQUgDvgodi/oSDyzfLQMVrltgUcBsdJuIh81zuF?=
 =?iso-8859-1?Q?6HYqB9nkw1W2QUFAQ5LOejoyFMIeE8yj6uPKI8JAW++eDf0UX7mWgIGj67?=
 =?iso-8859-1?Q?4DxODRViUutkAox+xWA+3JQ9b+Gj5p+8b6zWGtKPnDPVHUvoaj7Yqg0+iS?=
 =?iso-8859-1?Q?NHiI3JB3QBSqN2QjAeWIKbWUyzdYXhZhVq6YZIekk9Dhxl/yJoEedP2f+8?=
 =?iso-8859-1?Q?cN3v22AKYPkN+DRD6yr7DYkgsPVwSKdlWjaS/zQMnGerVlf46GpKdVh4D0?=
 =?iso-8859-1?Q?jIn5vNCw6UEXb736nRgE25w8EnayRVpy2gvVyvhj8Tgl/5B/qCr3zlvxm5?=
 =?iso-8859-1?Q?Y2n9BXYEybtMvfpI1wGbS4qS0GTtpAJEb9Qs2ZoDAIfEPkViF7DNX0VAta?=
 =?iso-8859-1?Q?5F8mc1KOo1t8GA9JNBp52YVE2hg9oKr6UPcYe9VxbL0snDZX9E+y+ki0a6?=
 =?iso-8859-1?Q?bJTUsccMV0sh3KNudAIWW3g2qwDHU7VBXV9Lj9XOXPn4U+JuaAmUc1ZmNV?=
 =?iso-8859-1?Q?noB3103LL4fiA+jbuLH+U0qhIytsVfSXgaBWDGv8mh3pcax4FImN6wU5yi?=
 =?iso-8859-1?Q?EqmLh0FK5WDoTFj3toFTF2ohM4qLzF9UggZeBInvyyNXNHe9FbglsBI+Mg?=
 =?iso-8859-1?Q?tQT9DB6vpDck2yKLODE+rg+BUPPDXArkS0jcTM94RA19+rGt/jee6fQWap?=
 =?iso-8859-1?Q?V9C6ABfgWJ+L1FRM//RXo06k7ldDfOdd1K6XHIev1yvg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nmBFD4MTXL8g5UZEYhVDtxzB5I6eCYRus/qgxyMzxbeDV+cbuvP86hmFKn?=
 =?iso-8859-1?Q?sKa6CuW+MVSL9NLgORrxVDtsEK/KAhQbL1bSAwTu5AgfOWqV4Ek977UFPw?=
 =?iso-8859-1?Q?UNLeoiBsGdsJ3tdoD2/Hw196/phOjewXqIScB3zIOm3yjfdsMB5H8UThNb?=
 =?iso-8859-1?Q?DVW20wsWINTr2eKMGpvBPyZxRX12GgUFEeeZM6VHKiNdIPbwiev9UXseuL?=
 =?iso-8859-1?Q?PX+EOQpTQLzOGdkHXQIF/VH45iw+owzZaECOmJxT9rWe147DJlmgvcybvb?=
 =?iso-8859-1?Q?g8zBk3go+ZeIRNYvIAfRYCQqwEJ+EA/7fCgdWR8UcQc9bFkGaBXkOqA8ak?=
 =?iso-8859-1?Q?Iefq+r/+yENfLEWiMWdN6bZo/o4ubAeojyrjC4OsjXYmpDe2JEPx+xGWNa?=
 =?iso-8859-1?Q?HDXSiLS7MEwRgAYRthhdKqpq4isxtvgZtS3f5yWVXYMN7ff3sZ38D7Zzvj?=
 =?iso-8859-1?Q?r8739qMo8pKCJaRpXTyq1z63LViFqLLnrG/nBC3TLXucMLRVWwWd5JHqev?=
 =?iso-8859-1?Q?+IywSA6ssY8JV92pFTT3ygAt0rPiz9KwVH/mnqkJPveJqjD49eiOTuTcQA?=
 =?iso-8859-1?Q?xvUVdFf4r0O2sRSzjS5xINNeerRgXmEwfmiaxLV6xl3GHlh95XccBHoZCh?=
 =?iso-8859-1?Q?7/wIYRs6cVAqTRlSJZ06AAPoidLS9QTL+khT3n8o4qU/yUq7d6/gDl0kmo?=
 =?iso-8859-1?Q?tCBKqQXL98aHUS/QoxfsauuZJjc0SXOl5oUc7YgaP2fYbTlxi2GCSQSyD1?=
 =?iso-8859-1?Q?4VyWn3myvfpk9/w04bneATo2sq3EsfD59w9IvfpgWMzUe6ZVszkC5CHHW2?=
 =?iso-8859-1?Q?ILC39tCka4lVKhxXIHjpRBd3r0LI+9s49Q+TSL5XhVqLNMJmA+Kwj+qpZA?=
 =?iso-8859-1?Q?vBh40/jY3qpit9Gkl5gmeSuuEiI2SOadq8qIGZaCfM+iV9NbhA+TO00yT8?=
 =?iso-8859-1?Q?MpRF6cS4feYpzM2wuaIpt8PvoXM4u2Iu5s+7dFVAaTE+mipC5N+WwGmbhn?=
 =?iso-8859-1?Q?kMsBLoyZxuhBQt7hmsLSl3EHDTD6GPzpvCF7LYWOdRCGsNqY8j+OnfbAYW?=
 =?iso-8859-1?Q?fMewgbOTDOWWUA5W4ppC9nfQ7vz0IWECP7CjU4o6jFszAmo4qWHQs6O80P?=
 =?iso-8859-1?Q?gX0oLdUnPY+8aGkAm4SxSDfXCA5rqAtMBLyqSsSEQZJF787QKEx/oobyR2?=
 =?iso-8859-1?Q?Mcr4YOzEverTn0FX7bpJLS7czZfx4/f2X6qihHkqTTlmvP81OAV3XEEaY4?=
 =?iso-8859-1?Q?n8l/OUv4w7GrQcsgo66G93HbiqbF31fX22WsHdy4jteE1G+uDkcxC/1wZl?=
 =?iso-8859-1?Q?Q4m40oeZsCvQGV+pMBKBT4Fm6ZYA6y1Vj58twpaJTMZWNHJ2ccERUBeGBU?=
 =?iso-8859-1?Q?B8In0zytlh3ExPdtXfj8wlv7N4JQafe3iRpYmRuoguyL1qlVNcqQMvEgtg?=
 =?iso-8859-1?Q?UowfFAeb2N7YvNEDDP2ow9wZMB0vT6IfJs297CLroCUrySqbFIzJvRoSrK?=
 =?iso-8859-1?Q?ug0+85qtVcPEskYlkcOAGS2jUujFlQ10b05kHexgHAHxO5LHMgWQKBMFA3?=
 =?iso-8859-1?Q?RbECcfQFqGb/7aYPqIbcKnQzr9p61jvzPWaD6qpBvVFnWLGlEGG8it3m+2?=
 =?iso-8859-1?Q?x72HapSPOFqBQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24c4489-fc05-43fd-6793-08dde5e956de
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 04:14:10.3958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yiecq1SX+LNFT3TudrElFzRvxl1ZYhhYyfly+tzhSLk+Ev/UZNCbRH3meAwwWAt/BLlMHrCNGzSgqCxZNIFCZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8852

[Public]

> -----Original Message-----
> From: Anthony PERARD <anthony@xenproject.org>
> Sent: Wednesday, August 27, 2025 11:22 PM
> To: Penny, Zheng <penny.zheng@amd.com>
> Cc: xen-devel@lists.xenproject.org; Huang, Ray <Ray.Huang@amd.com>; Antho=
ny
> PERARD <anthony.perard@vates.tech>; Juergen Gross <jgross@suse.com>;
> Andrew Cooper <andrew.cooper3@citrix.com>; Orzel, Michal
> <Michal.Orzel@amd.com>; Jan Beulich <jbeulich@suse.com>; Julien Grall
> <julien@xen.org>; Roger Pau Monn=E9 <roger.pau@citrix.com>; Stefano Stabe=
llini
> <sstabellini@kernel.org>
> Subject: Re: [PATCH v7 11/13] tools/cpufreq: extract CPPC para from cpufr=
eq para
>
> On Fri, Aug 22, 2025 at 06:52:16PM +0800, Penny Zheng wrote:
> > diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c index
> > 6b054b10a4..8fc1d7cc65 100644
> > --- a/tools/misc/xenpm.c
> > +++ b/tools/misc/xenpm.c
> > @@ -898,6 +900,23 @@ static void print_cpufreq_para(int cpuid, struct
> xc_get_cpufreq_para *p_cpufreq)
> >      printf("\n");
> >  }
> >
> > +/* show cpu cppc parameters information on CPU cpuid */ static int
> > +show_cppc_para_by_cpuid(xc_interface *xc_handle, unsigned int cpuid)
> > +{
> > +    int ret;
> > +    xc_cppc_para_t cppc_para;
> > +
> > +    ret =3D xc_get_cppc_para(xc_handle, cpuid, &cppc_para);
> > +    if ( !ret )
> > +        print_cppc_para(cpuid, &cppc_para);
> > +    else if ( errno =3D=3D ENODEV )
> > +        ret =3D 0; /* Ignore unsupported platform */
> > +    else
> > +        fprintf(stderr, "[CPU%u] failed to get cppc parameter\n",
> > + cpuid);
>
> You might want to add ": %s" strerror(errno) to the error printed, which =
could help
> figure out why we failed to get the parameters.
>

Ack

>
> The rest of the tool side of the patch, with Jan suggestion, looks good t=
o me, so
> Acked-by: Anthony PERARD <anthony.perard@vates.tech> for the next round.
>

Thanks

> Thanks,
>
> --
> Anthony PERARD

