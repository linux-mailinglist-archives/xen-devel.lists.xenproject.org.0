Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446A5B32B65
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 19:55:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091413.1448046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upsSF-0002B0-Cc; Sat, 23 Aug 2025 17:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091413.1448046; Sat, 23 Aug 2025 17:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upsSF-00028n-9O; Sat, 23 Aug 2025 17:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1091413;
 Sat, 23 Aug 2025 17:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yyzx=3D=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upsSD-00028h-Jf
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 17:55:01 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49bc8abe-804a-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 19:55:00 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU5PR03MB10472.eurprd03.prod.outlook.com
 (2603:10a6:10:526::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sat, 23 Aug
 2025 17:54:57 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Sat, 23 Aug 2025
 17:54:57 +0000
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
X-Inumbo-ID: 49bc8abe-804a-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTMsOC16xWTSYcAxciXZvwX2oQGnsnrXZswe6B6KTdP/7RbN/+XCYF/WZPABlB5hFmEB537orgjhSLBRnnNCdZc9OAJuY1H4Acu0asKEaq/OAaT+nOGiSs1y/NH0UBafPXkq82bOWRPlx58ccspHVtibOE32qGiQbyTw8efSoCTJkJc+/LDFu3BuOkdb9fnk4RF4X8He6y5cQbzLvrXFp4fVWvO8wr5KlK9kA5zrBWk962rcCK49VuZtgYZ1UefoTukEEQW0fMwB3ieRhuFZI6a949h1MQuHDyrlcmv4NG2VvJRK7EgNi8Afu/xbp1BeBuuaCsOaFfiQpHkKzm0Lsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fcxaXrq0SZlNy8eHiChW4oOS6ZDWiGhY9bGKbcpiu4=;
 b=SLv6mg9i41bFL2cIK8wBmenOUAL8enIfunnMsSwPW7Eywkorpk4nGSg/eT41qTPHdh7QNpfVRQEde/Iemo31sqIxbtwDKVaAQwKUImzTisb7jDuu170symdxXSCkk6EJAzUjK0JPrgmsIGYxO+AJMaQKEvyDSSLN1Dfj16Sbid+v4pQ9CFK23nuDIk2uHLRNgxyHkUq7htjVG9XGuny72br9IXHKr9AtO3MLE7/8krJz1wSmOHV9XWDptOPY2GPmwXsbA+lZcW99T0PK9d754klinkW2NkTl1MUbdNFr4eqt30oeqLtSjJYrdW9w4q17ylpcA+HBwo57Ec3CFClv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fcxaXrq0SZlNy8eHiChW4oOS6ZDWiGhY9bGKbcpiu4=;
 b=Fd79Oeu21vuIGiyeLPE9wLBcF7I09ZhONhjkfNnhI8O5phum3zGNAMLaF054zay8/1B62g9AYXhDftzRGoP3ycnz4gTfe+AiCdfEv/JK1SCHVF85/EvjDzlIgWjXeZSg0p9LESHMfOtNqHaJrbuvfp6a9kDUNm2I6+b6LTpV0LuFArmasgTK2BnBEswyUKkMKxWot3Kd+K6AvCNFL+gO++3HQ7Qiu/Z7dnmZPwFIWLdl+1rvh+vPjkS7RQrD8qYy0NXHoFNtG54lHmI5Bpt0rCL2eN9smf5MGKkdtFYkC2laotqMq1SlTdfYP6CF612VVhhly84GIbOkQ8tyPudpSg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Mykola Kvach
	<Mykola_Kvach@epam.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 12/12] xen/arm: Suspend/resume IOMMU on Xen
 suspend/resume
Thread-Topic: [PATCH v5 12/12] xen/arm: Suspend/resume IOMMU on Xen
 suspend/resume
Thread-Index: AQHcCwFkkQdjEXTsbESLorqeX+r1kg==
Date: Sat, 23 Aug 2025 17:54:56 +0000
Message-ID: <87frdh7wk0.fsf@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
	<821e0762f64c8b33260a59c672eabf1da5fb4dd4.1754943875.git.mykola_kvach@epam.com>
In-Reply-To:
 <821e0762f64c8b33260a59c672eabf1da5fb4dd4.1754943875.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Mon, 11 Aug 2025 23:48:08 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU5PR03MB10472:EE_
x-ms-office365-filtering-correlation-id: a3358d29-bb3c-4027-f6d7-08dde26e2c1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tOg6xn1j0XuKtGCxgFs/NJxuggLmjnXJIeqXe27tR5pIz/RvuMT/Qr6988?=
 =?iso-8859-1?Q?lFnSv7s19S17RbV8Pjxhygd+usQs4VJMgk4ZgoeDEOB4fjSCk7kTnRtQmh?=
 =?iso-8859-1?Q?dIoLbjWPVLRv5oRxwfFmUEAFtr9POSaSMm63I0R9zzOf1UchdziKGAxiSD?=
 =?iso-8859-1?Q?1A1lztbbL65ivucfCVeHATYJ0Jh66YzqMH+vqsDQaH0TGS75iMdSGOakTt?=
 =?iso-8859-1?Q?JLEfkX8ddziTmhnVfelj6zgyLwKndgEf39Vi0w15vAzy4Ikyl/Pql+CwjD?=
 =?iso-8859-1?Q?64aZ6j72G+rNTLO8Z+QCvREYphxsY/gSVhWxJSSVzetWSKkHV4P5RVP5Cg?=
 =?iso-8859-1?Q?1B4a6nXrdgz6ANZ4fQAqZZZ/8m8GL0Q/V3M4n0TQd88XAgF1rDfAqxvRvW?=
 =?iso-8859-1?Q?OA3KpBec67l64sbhtT+7p5bRjQXFiQslWliWg/TKc34ENr/gmrdmwhrYy7?=
 =?iso-8859-1?Q?N4PoInDPLXVV3WOFQK2jnin4LOSpWaq/YiYxEMlpTqa0b7jeUqGti3Eob5?=
 =?iso-8859-1?Q?ioTBiv3YAa3PL2s8aZB30KJ29iKDsoYrArIIptZMayHZ7qFXjSdK6GUU3L?=
 =?iso-8859-1?Q?1XMYi6NPwN77uMgXyWsZrx8LUWZKx1emB5UDW4kC/iV6phqhk1Si7uL1UL?=
 =?iso-8859-1?Q?g6OGVCx90InP2VQHabxVnOaa3hTb+KEKv9Mjvn6RrX9yWg19u0rJCCGfOB?=
 =?iso-8859-1?Q?xzp3/vdRw9AWpmRGZZnw/SGtbzZ/WZ/6Qb9okckTlxWjJteeFm47XvFk+Q?=
 =?iso-8859-1?Q?PJsw7ykqWY7u4JXkVPfm8K59kUdstKmcLTiqRy0MXaoB3RtSlkTYjeHccS?=
 =?iso-8859-1?Q?9vViXhHQqEWLa4WH2StyqklVT4wXB8/voJ/k+3FuMxeHlgmMrzYtwSLWHZ?=
 =?iso-8859-1?Q?nHKd3RG2D9aMJN4VMPs+bwKLFKd06kgKFhbRUZiCz1FBcm5G/YeDkgwJHD?=
 =?iso-8859-1?Q?BAyP0B31d0Sgeo61Anz4IqREeAxyfw8b13YOiju2RmgDOoptzMZE3wg/7C?=
 =?iso-8859-1?Q?99B6VbcpH96Eaq3TJKaPGfdIjnh7weZ4nhyA1OMr5edfuqnJ9Ukn6Vr1bB?=
 =?iso-8859-1?Q?BplANcIjTNsGdu7FZIC1O615ajDAlEC19iqSriy0awhxpa8z39v04Wkxil?=
 =?iso-8859-1?Q?KP4K1M74uroVrhuDWtXS1HDs4qF9ibIX/oyb/afQ49Uwqp9t52zaqBfsCx?=
 =?iso-8859-1?Q?5IewGkXvyk/HJ+sjCn53xNj74bJQ1jUEJH/QDQPOfSQtcprvX+ugaTmTT3?=
 =?iso-8859-1?Q?znEh8NXp+K+s+nP+PBvFfV37pTD88u1KLkI3JaUEI4kLUIJ9pBWg8pvGuA?=
 =?iso-8859-1?Q?u9GOOs+5B2+niZkOAh8jGlMsIYbE3PE29HMxDupofBdOL5D8GN/txw6n0H?=
 =?iso-8859-1?Q?ILpRLyaY6LdJQsZnhItSnK07QpQeFIXkvsfOD1KhIfkrJN5l4Yur9ThLA3?=
 =?iso-8859-1?Q?78AqjUXijKGOLIm6h3Qfh2EAGSILlzOK+oMhLYW1e/2+26zhFXlGVSLb1N?=
 =?iso-8859-1?Q?XT07JaYE6nhFoKk7lMa6H6ZoeGMMMPfwgL6Kxw4Wfk+w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XRKRQfyzKsf0llwrLcuTZInL1f6IQjXk40kN7ELqLbZQjdiUc2RVQs/9S9?=
 =?iso-8859-1?Q?RaGN07EcQICXXWXHlQCTqZ+GRPEJ70kjUlpQ+Az0L8YIdcG6M3Uc1LePJA?=
 =?iso-8859-1?Q?sWWwOhVEzOlJtbDpSH18DBwKAc4Cies8sNHgRZ74IPOjyf1QPO/p6/D0rr?=
 =?iso-8859-1?Q?l0In2zeTYvUI9SnnqJ0Fcw1IKN8VITVtwMPaOya1l20qqgom7dYVdbHzC1?=
 =?iso-8859-1?Q?EcxlDlQcpQeYu75GARTr6e7HE0bOM97MF8NSsh6JbbsSYDZBmsZRLfRPRz?=
 =?iso-8859-1?Q?/PRlqTJdU/lSxL5zluaCquKPp4Jhc8X8/VquAofkPbCSE1TWh2NYcKDsON?=
 =?iso-8859-1?Q?s6Vk/dC0h7oLtaizPspJC/tP2ZSN2vSyx2Z0VWuBzI11V7kCWG3bGjZCqC?=
 =?iso-8859-1?Q?ylSqJqWorHXDBxFDJzXjbM/BkJolblPjLhe2Q0B4HOxOUVw/0BcfXeFqzO?=
 =?iso-8859-1?Q?OGYG04g3js9YTGN328tSrLWKoQuNP1sZEY/1VSy60LCGBJ2NAEf6zJaQxS?=
 =?iso-8859-1?Q?49+dUqyweKvImkH5/UrFo8tw7/Q1BqdN08zKEDRNM9s6a+1ighdjSuPMO3?=
 =?iso-8859-1?Q?ty0WExlXkG1rzB9oRH7ecgGD+P3IjXWxWsIPZmHO1EsdF74ygIZcugRwQw?=
 =?iso-8859-1?Q?ipCT8XsYGppq7omlyYim+kdCSEx8CacWIeSHv3Mq9TUt8Xbq55JhSTLVIM?=
 =?iso-8859-1?Q?Am7BJMtA4NoHCRDQKufNHEg234/bT2jWNQmnT9T0RKw7URAtyT3W4gNuQC?=
 =?iso-8859-1?Q?B/x6/fCGmKxYYGRM5+9JUMu41mUGwiX0mTPBoyXOfMdNhtEaN98pDxIKDW?=
 =?iso-8859-1?Q?vaBr0z76giM78/gYaaR6qyQkN2H0PFjQz92c2MY39tv9xcMiHyZd2B7hLY?=
 =?iso-8859-1?Q?vJ0BSoK9TcLcOZ9YnqdCCfF2pmlSus5SULSyT+IEgarEObWIa2zGNVpSIc?=
 =?iso-8859-1?Q?y2+hxmL9NFmVnGv8VmTp3vSS0FAA/Dvgm+AXPOryt5t7P+fFKN2inSz7Nl?=
 =?iso-8859-1?Q?eE0dndrZcSY0vMXxGNB/lHOkghLSO0sQ3cn+NNtFMuibpqkttyXOPHWB6q?=
 =?iso-8859-1?Q?Cqxr6dlta9o3vlqDS55PaYchURSozbF5njKcyN3SLXR3uaeyJOLk6lMCsx?=
 =?iso-8859-1?Q?v1ounNQLe+fhvJod6xG+8Khcx3uYm9BTywJgRdQCi2nkTUKHF6HMHYXMNC?=
 =?iso-8859-1?Q?IdUgTr2VWTwmk8KF7qMtiFKCqFGt1xaZHtwc+CDkPm26Nnjbwa8vXq28sr?=
 =?iso-8859-1?Q?CuEtguzy4TiTubdV6QVsNvSavaA5lHVW83gML+AzSWiA5UvRfxpXo6OACK?=
 =?iso-8859-1?Q?3C/S21bnVIw2oL3ZgCcQ7oLhiwAnljtwL7I4Ip72cdGQ+ubyr4rTIGvTBl?=
 =?iso-8859-1?Q?Wvn6GEKDWxO4d2w5broi2/Xmd3mxhqCY1f5EPQ4/78jkTHeoDus5hAQ68N?=
 =?iso-8859-1?Q?/CNYZMXFmvUJB4FB/diZwGFUelJQ4JJ99rdLUQn5V5C+R7/bLAaLA8eSrU?=
 =?iso-8859-1?Q?v5eWgC3Ee2t2rrOfWeH3n8eLRumaD2eFun6T3XZ+w77n511e4Ao1kXKXLP?=
 =?iso-8859-1?Q?+29podo/u8oIllpaEmq85yuhaHq7mRxfAdPAQGX79sfyRbjcyuxjoblsOx?=
 =?iso-8859-1?Q?aALwsEwWRrjjvVDvlNDMz7Kra91s/BiZ101th13RFnMOMbxAAwbpM5zQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3358d29-bb3c-4027-f6d7-08dde26e2c1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 17:54:57.0457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IgKFyDk1ZdgPCgn4jvYb9iJPq2j6E4/R6yWNRrS2f/cuJmo/s7ZOcSK+cz192R87pkXayocpV3zuwX/KuBsiiIAH2vIqy/96PF5OZXaAZMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10472

Hi,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> This is done using generic iommu_suspend/resume functions that cause
> IOMMU driver specific suspend/resume handlers to be called for enabled
> IOMMU (if one has suspend/resume driver handlers implemented).
>
> These handlers work only when IPMMU-VMSA is used; otherwise,
> we return an error during system suspend requests.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Tested-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  xen/arch/arm/suspend.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index b5398e5ca6..cb86426ebd 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -4,6 +4,7 @@
>  #include <asm/suspend.h>
>  #include <xen/console.h>
>  #include <xen/cpu.h>
> +#include <xen/iommu.h>
>  #include <xen/llc-coloring.h>
>  #include <xen/sched.h>
> =20
> @@ -49,6 +50,13 @@ static long system_suspend(void *data)
> =20
>      time_suspend();
> =20
> +    status =3D iommu_suspend();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_time;
> +    }
> +
>      local_irq_save(flags);
>      status =3D gic_suspend();
>      if ( status )
> @@ -105,6 +113,10 @@ static long system_suspend(void *data)
> =20
>   resume_irqs:
>      local_irq_restore(flags);
> +
> +    iommu_resume();
> +
> + resume_time:
>      time_resume();
> =20
>   resume_nonboot_cpus:
> @@ -140,6 +152,15 @@ int host_system_suspend(void)
>          return -ENOSYS;
>      }
> =20
> +    /* TODO: drop check once suspend/resume support for SMMU is implemen=
ted */
> +#ifndef CONFIG_IPMMU_VMSA

This check is meaningless, as you can have CONFIG_IPMMU_VMSA enabled
along with CONFIG_ARM_SMMU on a system with SMMU. I think it is enough
that iommu_suspend() will fail during system_suspend(), isn't it?


> +    if ( iommu_enabled )
> +    {
> +        dprintk(XENLOG_ERR, "IOMMU is enabled, suspend not supported yet=
\n");
> +        return -ENOSYS;
> +    }
> +#endif
> +
>      /*
>       * system_suspend should be called when Dom0 finalizes the suspend
>       * procedure from its boot core (VCPU#0). However, Dom0's VCPU#0 cou=
ld

--=20
WBR, Volodymyr=

