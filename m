Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82AEB325F6
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 02:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090799.1447901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upcGU-0000xg-Ie; Sat, 23 Aug 2025 00:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090799.1447901; Sat, 23 Aug 2025 00:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upcGU-0000uQ-Er; Sat, 23 Aug 2025 00:37:50 +0000
Received: by outflank-mailman (input) for mailman id 1090799;
 Sat, 23 Aug 2025 00:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yyzx=3D=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upcGS-0000Oy-Kg
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 00:37:48 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6470c1ff-7fb9-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 02:37:48 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB8011.eurprd03.prod.outlook.com
 (2603:10a6:20b:43e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Sat, 23 Aug
 2025 00:37:46 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.014; Sat, 23 Aug 2025
 00:37:46 +0000
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
X-Inumbo-ID: 6470c1ff-7fb9-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzK0To7kSFpbXj0ywD3WPt/tF1ylWa2Uv7KzHOgjvgZTKZAjHsmCCEoPKaCiKpM2xz2brhviiojCxwE253qpj9x7fyH+YrHabjP0rWipIrfDBclpU8nuE2MJTgQWU9nJGcEBSFWI6b36Sp4sR9b0AxviCfr4LFfpNuHFQ7sYGp8fogqZvTdu5L/QOTxtkGBvQVKWZRDJnA7lGXKv0qdhY7l8xa/SO4q1tr2E/eXIwyc6vXRzpmfLOg/hm7lT6gGtj3bLfdJVfiAy6pOVqyRC9ZqYv2Nhl2LcjBT83bz3BcmcqE87i5U4aRFhlMkMwiZlcmMEv78G3AO3Qup409+Vkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=womvZsi6s+cPhoOGbJBAc28EKuYZM8Qf0KAVc4HOkI4=;
 b=lEKOOM57kE2cxueopiP/FOdXFZ0/Zx2nACEtggLx/999JN7Q2Hkzv2rXYPnNOAdLM0Nc62jUeU5JWVKKMZPfHX78Hy+yanNz5XPj3BSAkTTcGtSS6nUgZOQADqRShNjmdoPsbv0qV10aYBAuh/lHn115Kcz9QWEdQSTlvsEeuBRhPkaYcWMVzy5PtQKAKS0WJUVVq/TBnkGJ6KU2V2c0CGNIA7IAwTjTdaz/VNfTJDlz6n1F+bdmP+5M6Je5YI20qHIjoJwaW160WG2HuiB8eoqrEbcJ4LFtivlmOEbg8Sl67F5eJYUE1cqClT+rpfJE1WL4PIAmYaJi30nE/mHB+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=womvZsi6s+cPhoOGbJBAc28EKuYZM8Qf0KAVc4HOkI4=;
 b=m2yvsPHslItYo31QlE7v9mZylHG9kBHPlSTJPcUn1JUAdSPVTyqh2hNhuzWQBmFyKIgeDfz8RX4ryVrVzlI5iKmgzZPTE2RMjEdNxQWQu77OkIhUTZYxPQRcaF/koUTcqFsZUAOQKL4HYTU7CFbLpCF6DaggvMDfiFct7eFlU5INJHbEuX7dthND6lFByzMBocXc+LG/72G7x0TjM1xEl2KDvVXLnee1lMGyTrHmnupjIT/rs+y4f7r5uhQsLUG3+CflVljJ7PvjVVuBJ3Wccr3xKHBOxuauy3+y9+oBsIl7zsnTYUC6+SoWRpJA7qL87wLxbV4+9vCkdQak94eYLA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 05/12] xen/arm: irq: avoid local IRQ descriptors reinit
 on system resume
Thread-Topic: [PATCH v5 05/12] xen/arm: irq: avoid local IRQ descriptors
 reinit on system resume
Thread-Index: AQHcCwFcU6YHlfOU1EaGDcY/uk86oQ==
Date: Sat, 23 Aug 2025 00:37:45 +0000
Message-ID: <87ldnaan52.fsf@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
	<7686bc019f0c0eff94720e4ca16e00f895819087.1754943874.git.mykola_kvach@epam.com>
In-Reply-To:
 <7686bc019f0c0eff94720e4ca16e00f895819087.1754943874.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Mon, 11 Aug 2025 23:48:01 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB8011:EE_
x-ms-office365-filtering-correlation-id: 0f107cee-d007-46bc-b33e-08dde1dd4784
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?GpHfr4Qsme8XcYzheCJpqg+TIxiLHiiOBl38CQ2aYPfdbJfW+Onu9ZNK82?=
 =?iso-8859-1?Q?17+8YIoPuCJOk5Nh1/iOWnrm2cF/ZHLdf1mZ89C7p6AC+E8KVpBeAD5uMY?=
 =?iso-8859-1?Q?ZfeREaUIGZXYcFBqn1xug45qL+DCLcgPIAKmHpAK5dnmNWMz+fBN23a31q?=
 =?iso-8859-1?Q?Oq/YpnZ4SflscaC0e/X2RE5eb0Okfqzv8IXVbtXO3xjTfrayxBX2icGDf1?=
 =?iso-8859-1?Q?FgFVWFXVmcux1vzyU9gkWl0+RoEgOpJtgz0Q+oOdPPj8hBbxEDc9Xoaf5F?=
 =?iso-8859-1?Q?Rij+8LqVbE+Ge2Prciz3ZXw7MWDHNAbep2TMfouAB24phO/kZ2MqHkyYNM?=
 =?iso-8859-1?Q?JLOKKajiOf7dkkIWmSbAPrh2CLqocBRHy6+rvH1XLMfEgIXWRCl6tiHpjA?=
 =?iso-8859-1?Q?DfCw6FynslmTCQJmlLUZ0Xrzr2qeq/FE7DYIuL+JSTnivvS7HhWlx2K6h8?=
 =?iso-8859-1?Q?Lvc4RA6I4ei64fqRax4gYBcXphXa7RVgK5TydpowSHbpZs9FYvDTa9n2MP?=
 =?iso-8859-1?Q?RshidLpSykzNWBs/G1ZBh3O5dpFYWwHfhubhSOlycUPi7BlVB77yWqIfVO?=
 =?iso-8859-1?Q?0LRpheXHKlORWeqVX2mJzA7M/XMtcKarIjNmU/MiZW+uyg6tIUDT+1dgN2?=
 =?iso-8859-1?Q?uVOnJd7cEa/ByruXgfDYFaGCSsJH6aIOmH3g1mUgJbEGUjcY2r27dpnqmz?=
 =?iso-8859-1?Q?1YECDUHuV6ffYHZSVyU+qNAwEPhrzXTGrux2OJ+wg21M2rROgjmR1QsVhq?=
 =?iso-8859-1?Q?KArfJL2OP7APhLsDFqCq9Po1H8P0XoYqcoH4Ekar/ePA8SuA/2XYtMbZzP?=
 =?iso-8859-1?Q?NEUyK42fmjypybZgOibPgxQ2UDoqfq+BN4M/grZ8ma4ApR5GG+63e+vm8K?=
 =?iso-8859-1?Q?vxnbpzZ8peHyjcxPAt/JuY7oCMK5BGyRNDlpYW/LbwNYTRcaJQ2Tyb6Ypa?=
 =?iso-8859-1?Q?pRzX2LBso9rqjlw67kZD6vz+W2UobWIS6wNjggFpQ69P4YnQB+l4t2mpNe?=
 =?iso-8859-1?Q?6sUA57c+Ad8/IhrmuKMEsLJYl6QGfyXPGxROYGgAhKZ7YFNk/VbwFyVjT3?=
 =?iso-8859-1?Q?pWzumORCjoHazvBzjswZ7MWqqGZmArRqFrYe2S9VNd3+09i7qxZTL9JF6M?=
 =?iso-8859-1?Q?9utwVpmuaGLOsaeUTHkieuX8+chM5yxo29tY20rwj/UkzQ2I1pAtr10SzP?=
 =?iso-8859-1?Q?+SxL5lf3RLdewaDyYwOEc5bt7vI6KU8qlZLTYkxlwiT9XYGl00Gn+6GjH2?=
 =?iso-8859-1?Q?oBv6t6KjwUL5geW8TJ63I3ssNPto52c5d0/XYTykQbvVdOOA1MiEotHlBo?=
 =?iso-8859-1?Q?Myc3emFiUBkFDajFfWnk0vSq+777YkiRWskP/jRv1RhyWtQL2g3qVlP9Ts?=
 =?iso-8859-1?Q?rn5p1ALIS/vHSUl0UjsCN1N+8LJD2OcmoJD7/A2RtHLsRikiXYmu5UI8+f?=
 =?iso-8859-1?Q?AiMIyo4KdAt/NSghkaxLfRvNEVP8JJ0tztgx6nWTmLWWnKZ3PaISIM19kh?=
 =?iso-8859-1?Q?fDJD8ZI91hOc7aev7we0R/2n58X8JzrdAQsRtHba28EA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DZxJ9hmGsOi+5OUizlKP6wwuvq1peiymby7wEFa0ik32O+nzh1rCceSiAW?=
 =?iso-8859-1?Q?t711e9DmNf75yV2Y0Ys3oR9NORIRLo4FnxXIxZP6xV1NWUqn13/G/ut4xh?=
 =?iso-8859-1?Q?WGlqON5uklc3scxaxnPMQqv+tCz+Ng1rNb6HBzObNtTGsm5RbDq+Il+C9R?=
 =?iso-8859-1?Q?M/FgkKuop8Vi30S20sPJfbwilyTay1+j7QoYs1Zd7XxPaWCD9WYz4ABMu6?=
 =?iso-8859-1?Q?1zzV6HNidJT1RcwOmRf0bIygQOqWSRc0rx4/irrmWOUIgBWdePbTuNh9TU?=
 =?iso-8859-1?Q?k6oEkJN9BjTOOPSmxsGEkPXIzCCf1rB3XQ8LQBtNlG6W7JsELKLfCPSJUg?=
 =?iso-8859-1?Q?yILEnXaO2uvmw8NL76OA/SgK6M2ORVaXpiEqtKtP7kJXAOyrvWxSK9IYID?=
 =?iso-8859-1?Q?SUX9cI8QU2jLM/pCZxwmD+n3JwfFI9s2xi4Yfz/MeSlKDYofdi2BowABFB?=
 =?iso-8859-1?Q?5G9YauCmMNj6T0OkmlJ5FHwY4TISYPngo4mNsXg7BJNFBhezN1LLxCmPGw?=
 =?iso-8859-1?Q?FMVt8SrzdVAbulK751cwsrT5qQFBsVGpgN2PFYYeoYe0mDjm0akpWnD33a?=
 =?iso-8859-1?Q?qaydCYR6d589PIy70kGUzwH70EGiBy9VaT72ICF7l18vp7qBjr5oF5QWd0?=
 =?iso-8859-1?Q?AlLZzIddqJGHelkQfAeWlenRt8fWiNgoMae8zGqEakKNC5hE22+PjjGdX6?=
 =?iso-8859-1?Q?Y6eD5VOJMQ4As+1VSfY+c1iN9O5M8TeWK3B9m/PRlgTLkCegx7pec5kO4K?=
 =?iso-8859-1?Q?ILvzerTBo/RCzcSP8CeZT/BUNM4JzcH5VPOtw+aBkPsQNggCOdOjNkSpMY?=
 =?iso-8859-1?Q?QGek6jwhTo5QGyXg2HLCrnE0Mo4WqvDPaYVPxijSjdophm+IrsTC3UJZHq?=
 =?iso-8859-1?Q?sQ7uAQTXQmMpGVXWy8DqLZsvnrq0zdh+FRNAV7aHa1BPujx1TrAj4f2c2p?=
 =?iso-8859-1?Q?0cnys1PrmRAdf5wJ5pk3DKuV4NTGFnprsRl00qrVd+/k52/nC6jwlM6A2n?=
 =?iso-8859-1?Q?N19cl3VQpqH3qNfC3xhza/ov6knAnIKib375yOl+iyM8fX0Bxa0HThxJkc?=
 =?iso-8859-1?Q?LYtbW0HDC7b/1xOa28CSaoYtmj0BfSNOGbc4+WW4Jhigk+wUT8EdUdLWQx?=
 =?iso-8859-1?Q?4JFaS8LBsKbB5FIslFyq0/ONgihs2CudPYF7JJg7X5h9bOwv45rDY6PCc7?=
 =?iso-8859-1?Q?mHmGVbbMwgRXsL4IZtlOeuzhrBME05JkH34FFBH/hmX4IG3YEuAMXYqL2G?=
 =?iso-8859-1?Q?zLDcU3Ojwq4xnwmJPwWv4wunC0JyRDET5STXhx+agNfH9ZN8fhVd52mO4O?=
 =?iso-8859-1?Q?SGJsQM5bDE6nFKm++Z7mKvtLXmsIELoLjaD40WnlN6+wY5FLp5BjeAlswp?=
 =?iso-8859-1?Q?k3YpHgITgWepR0UJhy5klawRoHJNNVwDvhyqgxB573bsFSZeyNI8S2gzTr?=
 =?iso-8859-1?Q?cA+6eBtqjmexRAErurPt6Oq5Gcpw/3ysx0d0NjfnsFZvF0Jt9JTHeA6S2F?=
 =?iso-8859-1?Q?FwCTMh+q4LVwjYzz/MxktVFuTUnurO00CPuTj3rSA56ZFjSHhV5MgtOQTh?=
 =?iso-8859-1?Q?eZklQrIvuERgbyqaAI8mbUk3V6Fr0XrbsXhRQAcQfPNlhzeHZJikswd1LV?=
 =?iso-8859-1?Q?MDCmycVNA8YIP1LMi1UrbchMUmh/ccixwpeLIMh0oR/QXtJFCrZ1XPLw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f107cee-d007-46bc-b33e-08dde1dd4784
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 00:37:45.9934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99RbeVG/MrEftXq03UIYrfsBKifFo+lre+JeJVG/b5Yyztd3QAwwK78AfbVrrQ49O8wdE4/xuSOQ5WZJlpzRxlsfwAWn75wg4dS7nHrl46g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8011

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> On ARM, during system resume, CPUs are brought online again. This normall=
y
> triggers init_local_irq_data, which reinitializes IRQ descriptors for
> banked interrupts (SGIs and PPIs).
>
> These descriptors are statically allocated per CPU and retain valid
> state across suspend/resume cycles. Re-initializing them on resume is
> unnecessary and may result in loss of interrupt configuration or
> restored state.
>
> This patch skips init_local_irq_data when system_state is set to
> SYS_STATE_resume to preserve banked IRQ descs state during resume.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
>  xen/arch/arm/irq.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 4bbf0b0664..148f184f8b 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -122,6 +122,10 @@ static int cpu_callback(struct notifier_block *nfb, =
unsigned long action,
>      switch ( action )
>      {
>      case CPU_UP_PREPARE:
> +        /* Skip local IRQ cleanup on resume */
> +        if ( system_state =3D=3D SYS_STATE_resume )
> +            break;
> +
>          rc =3D init_local_irq_data(cpu);
>          if ( rc )
>              printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n"=
,

--=20
WBR, Volodymyr=

