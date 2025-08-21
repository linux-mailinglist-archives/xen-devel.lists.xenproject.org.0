Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A7B2FEF6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:47:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088945.1446644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7V0-0007NV-PH; Thu, 21 Aug 2025 15:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088945.1446644; Thu, 21 Aug 2025 15:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7V0-0007Kp-M6; Thu, 21 Aug 2025 15:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1088945;
 Thu, 21 Aug 2025 15:46:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kfR=3B=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1up7Uz-0007Kj-Hw
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:46:45 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09beaebc-7ea6-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 17:46:44 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB9PR03MB8797.eurprd03.prod.outlook.com
 (2603:10a6:10:3c6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 15:46:39 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 15:46:39 +0000
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
X-Inumbo-ID: 09beaebc-7ea6-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jH5LTkBJTy1K/y18zCF3culeMq9Oyd9Yidm78AVZf5oN5yHx/XJ0Eg1EThKF5dEfMjZHIxn/GJePtluGk0zm2dykr0hVDZTDTTnEwmtGpc2yA+/ubbC2zMsWGx4N9WAX6VT7+7K2PsbyuhvCJQdebiujMC2F5DybSKeGka1pltgA4xeKJjLeQTQAbjkdDNJdPyuCFpLJ9ELDdz/Mw7OGzipIdV+wEP0nqDv5cSpI1L/+4CbTZT+kXwkb9LA+Hz176BQSi3WoW9/knH59ei3WMkthb6lcXLmfxAr7jBAfagOJfRKFQ8jBCDHauNClioOEtfKGA15dzNaFviUlX0JeiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/fKu14ZcR5d901d4vqrlEbELL+LJ4Mxf8Sn8hDYcTw=;
 b=vyVlIaQiOedYWGf2w7aSSrvXY8qVwnvN5JMC9Kh10eLueaaWrlqLH6BfNqHvSiYcvJiU12b2e/sW22hdqvnXRb15SqpRwXLJlfnSCy8SN3ltElUaSfQ2D+Bb58PRkXIlqBnTPx9PI4H6HXk/O5ifhW8OkMHnEETDq19t9tRV/2EbxL61NRKEjzxf9cSxmb/RJgK7c8P4LQUEeBRrMdzt0uVJ7etKQt8/u6JOkFes3fR5XWhS6yo7orGTa/1WzreP3UJD18HV41btzn7EQKrylJ8AxZbkX1tgKgvdCdw9LqGLyRLqTv4++1AsgJRKk9bLFsYln1hYHtk/4Rmx1nOHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/fKu14ZcR5d901d4vqrlEbELL+LJ4Mxf8Sn8hDYcTw=;
 b=TCns9YbHsb1SUR+XtsvoX99itb41sx6Ty+idX6HHgbN+bgP8kQc0CvTIbLK+g0HBsFlpYm/xte5pN7YyqGlymO/r/he4PGMv+lQTIuVe6fKFz4O1flYM+vLT5coeiyWMZ+CxAhD3A7Dk/Xwtgoe5WUo/RR90zghIdiobnjPL5ftXOrDXm8+0fo5E1/en1p8HSwCSGQ6R7voFm5KVnuJCA+W5rqo7fmta8aLi2TP8MFzkVMtCFvdOBAPLpPA9RVVsqiJVzzh8FMTxIJvrt7jR4AJbllnWnkdEvwlMpL1Ya0HQhleSCuZI02dLrDTxKX7D2c0LwT29v7gEN/kqheRrPg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 03/10] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Topic: [PATCH v2 03/10] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcB5d76MRh/Swq2EGu624C+G/Fbw==
Date: Thu, 21 Aug 2025 15:46:39 +0000
Message-ID: <87y0rcekyo.fsf@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	<f029f88411e816846d13aaf33d4ef703f95d1bb8.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <f029f88411e816846d13aaf33d4ef703f95d1bb8.1754568795.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Thu, 7 Aug 2025 12:33:30 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB9PR03MB8797:EE_
x-ms-office365-filtering-correlation-id: 59f5e9a6-dd39-4d20-d42b-08dde0c9eb5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?GrHtaVFSZuRy/UVOxu5Y5lJ4r06Qcy8JQOGTalDb0n3q09/D2G55JQr/ZX?=
 =?iso-8859-1?Q?T6umrpYIBM6E6ZtmbumbSVDtD+3ECttN5+n7uAKVnU/6abX45zvszX51jU?=
 =?iso-8859-1?Q?PrL7pVB4dZ2Iu7R4ewoiqS1lDh/8190bb9zIBIVdJMfN9kmV3FrjJ69C/M?=
 =?iso-8859-1?Q?QXGSRGVP2zdCuH1NqTxs09KATPSVVA4bNfObRH89MPjshPH6VPf2Kc1yjW?=
 =?iso-8859-1?Q?nfLQF0yWs7l11vxk7Tikz07uyloWJ8WrV0xaUEnTqK240D8B737K1Qz4PM?=
 =?iso-8859-1?Q?WTSm0pEF/2KTK1ZCVQPOyzMrSwCJQKTgzni7n1grRBcvask3tC2sHpo/tq?=
 =?iso-8859-1?Q?u60BvmS5buCWGPRTXqM+f3DK/4jO78FqiUTA4IOBfc2L5wwwWJdg++UeC8?=
 =?iso-8859-1?Q?JtsSDd42MD3/DkExYtT0VOv1iU/WVt9YBwZj/WCGv4HYEgEI6zS/xRZue6?=
 =?iso-8859-1?Q?JP2frlRxzE5oWl+TgIEv5KA7x1n+6qjubDn56+ZQbxQg8Vd4QuO5wnySwI?=
 =?iso-8859-1?Q?UYnV8quR1JuksGHf9zq7TbCBsbnNxd/krVignInVKUe8XnoH4FrP7vDYZ2?=
 =?iso-8859-1?Q?9LE2Oh83Qq7Ntvovb2XdFuw2BCP+XxjYDuOnpRo5XHzRj2MSqtQKwuNbtQ?=
 =?iso-8859-1?Q?ETUme8tIzeODyh14OZBFpvV4mzZWnE9TlqroEfcCzOrfMU6BLWszALgEqy?=
 =?iso-8859-1?Q?Z4Vxbt0P7vldLOCfTFbKrNN1sCPOrSFHJV++b2mSLX4Q6zAreo+H8dFG+3?=
 =?iso-8859-1?Q?nOryspmangPwcEd6Tkg2EAwOWdUMo1BoDrNeafG1U9wW4Z7n0He3tJUSPr?=
 =?iso-8859-1?Q?gKgE6NsgeQwjI9Uq5IyA1ba+UuhRJGgFUohy8GnRXAeoYC7wbZdvBwPoV5?=
 =?iso-8859-1?Q?oKrEYb5ZWZR9R1NRLA357RbpxxwnXiY01kGOVFBbSN5XRUAJmTbP//aIWr?=
 =?iso-8859-1?Q?pRklpXArWZMsXSxOoJK8PMgfJZUVaulfHCWOjw0xf52x5r07yHchX71Tkd?=
 =?iso-8859-1?Q?SOfFYx+n99cRLJ5D29lG3rfKKhNdUGeLCCSptej+MINia4R0iRAfzbovwk?=
 =?iso-8859-1?Q?vxOVUinaoz5tzA+fKvPNh+zWpf1J0ATnKAsbSn7WIcDd1ol15+fpEvAXpk?=
 =?iso-8859-1?Q?l1TGW+epYPGBnLCg7C2czbiqYg5/G1hqCTxFdpvdbyiM9vn7i4utcBzGT1?=
 =?iso-8859-1?Q?Pdt3t6nxemFZigIlVa+gpVZaXjtOtsSBV4MsHOTW3k3oXUU60XS0TsyhnK?=
 =?iso-8859-1?Q?1gJqrki0KOJahyqHGjZfglRX4Pi1rjikSSyMR+3Bd0huFVQbZp0m5Y5Xs2?=
 =?iso-8859-1?Q?wsA8iXfeDL6mOTLMocbKKVS6BvBXZeivgZ3V523Brlwm75iYNIF42R/Ob9?=
 =?iso-8859-1?Q?uJjAzzMPaxfumWEIgtn9enqnUGAv9H4VyqeNdi4JgNEOLwEsBVraiRedV2?=
 =?iso-8859-1?Q?x7wQn3P8Bv73H/PITN/7HSOl4pghwEUIkhB3DiENvaA9B9Tdx6WwblMxcu?=
 =?iso-8859-1?Q?/fC9YSurcZdH1TiaRYisHItiO3vNEp5YVwITMO/RuhlQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ukr1cMRC4Bk9xznVLkkOo03eFo2Fp/pqsL4ndIUL73yZYLHSmmaNVrl13+?=
 =?iso-8859-1?Q?7arlKque6YYkFa6SJl3vx63lsRMdP/drWbBX2w+rGpcZeFfFFh7Ole7WfN?=
 =?iso-8859-1?Q?vSpZCihxoT0TsseNWS/7TGXtc0il3hhqDvR7Wpxr5PkZcs0WSIEotQt8Gw?=
 =?iso-8859-1?Q?BEsra7IQY7pXvyOndZjk/opilRnOhafyuZmY0KNvSteA+W2i3Pl/JFytqS?=
 =?iso-8859-1?Q?/A75Jm2LwekJ54ehgcv7u6mQf0I83GBYMB7Uv5+VCrJqxvHSsr363cIKIw?=
 =?iso-8859-1?Q?uA7tQkiQgwomlhCzYuslmpSjKp9TiPNj3B2fmDHB3TtPczzw0YBXpODOCm?=
 =?iso-8859-1?Q?ytUJNOoyvpZQWJyu2vuWlf9d2QNyCqHjlUP/nj/duJ1K39BjsOa2/vxRmD?=
 =?iso-8859-1?Q?FA55K4vaZhuECSri3RHDlZ8Fj7egwbYCqfJRKgXdobEIC73CbnAka9uIvl?=
 =?iso-8859-1?Q?+ujFUJ6OudrOVDh+36nANyQVqoCe5eqxENvjxJTZ/R7OxfV5t+2qmOVwG0?=
 =?iso-8859-1?Q?PQEBfaaBEo70/gy+sMfrH7X2FYhQMCid93un4TEHqFY4oMntLayxdE09XT?=
 =?iso-8859-1?Q?sGhGfV1gXaeIovy5SnvvNJmApsQY89WrVH7gv4GE9racJVW3CcEy0uFoRa?=
 =?iso-8859-1?Q?NqeVim5q/ooJUcg6TYBkpvVJ8EkxAnpXkpVVp63hEQjyL5HQHXRg88IBOd?=
 =?iso-8859-1?Q?a9Gg38855faqDQrtq+QVfPiUx8yAeeRhtdp66qHh8H/mgrzsWv8Iix+Gcm?=
 =?iso-8859-1?Q?UBnI0b+lgKvcc2VJSQ2Ea25zQV6L7OPCStc+lYHCbV3FAqSXan+DXrvIF8?=
 =?iso-8859-1?Q?WEqlbJr6SpD38OOLSLGB/sCJA9XSqgcYyf9jvBJt3Vz8wzzabcIZcflvXe?=
 =?iso-8859-1?Q?kOm1/BvdVALAF2O8Db6+x7rsH2s6Q2TINS3EyW7J6mfL8GOVsRbPOSIboL?=
 =?iso-8859-1?Q?EjCsH69EWQzdjeao67n54Il/oRYVKze8ivMmSGEefgu/pVAUtOtzE/iKsR?=
 =?iso-8859-1?Q?e6IewOoQBOPr2WR4YdM81m5L4cQTmes9gsBVx+m/uJuoQ72BMtqFWhtLSW?=
 =?iso-8859-1?Q?l7jD8Z2euUcXxAqRPMtcUKppHSXq7az0d2Cxmfx6hu0X3gBixdN/Ls+B9W?=
 =?iso-8859-1?Q?Z0uI/SAciVGsphCqiIqecojc5uXtz+jpchKirZWYixYV6XSWHj1LVS4CMa?=
 =?iso-8859-1?Q?P+FHBKYcqvv1YTiZkhTNHY3RwU0ozVnvArkZZ84PWJ+PfCisyTCn+mItEk?=
 =?iso-8859-1?Q?lWyirT1DqhkXjqs0IWa7U/6dA+Ac+BPcP8+qlmSp+RTa1+Nu5YgHfiH9mv?=
 =?iso-8859-1?Q?v5BpHMbsyUTyVbVCzGFxfk5C7lg8AdUPaf689v8Eko/au+euX0nDzyl+Dw?=
 =?iso-8859-1?Q?GTrwoy1PLtOVKZugt9JWywJiSSOOOl6cYbMehrQob/aDgWhplK2756VMnp?=
 =?iso-8859-1?Q?yhCtcuNgq82uX1i22lplg/FMIAl2jSHk+mMV7ZNXjgxtbR8QPTwgfYAO6z?=
 =?iso-8859-1?Q?AMzSExjXZnXTS47lE6ugpvT/5Ellhi3u+LOzMgDx1IOLB2sjfrdIyykJPy?=
 =?iso-8859-1?Q?2JukLAi6sORCjXVDMMz8bYuNHNdss6ivktLTPfHtzba9JZ+YvKYSQz/Mqd?=
 =?iso-8859-1?Q?HeqpuQWmW6x8N4bRPBaIDLHIztxuIDjvmsMbULvWGPLK/3H0/6zHr5Dg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f5e9a6-dd39-4d20-d42b-08dde0c9eb5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 15:46:39.7774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /x7GYeb1QSKJjoMTP5czr1Zar+aJP5kAaCYEmmEDAmBye+wFnsmXsCP9VLxQAW/SdtnmuJImWH+sDumm+fkedY5ydd13PoJG26mt4F8zKJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8797


Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Introduced two new helper functions for vGIC: vgic_is_valid_irq and
> vgic_is_shared_irq. The functions are similar to the newly introduced
> gic_is_valid_irq and gic_is_shared_irq, but they verify whether a vIRQ
> is available for a specific domain, while GIC-specific functions
> validate INTIDs for the real GIC hardware. For example, the GIC may
> support all 992 SPI lines, but the domain may use only some part of them
> (e.g., 640), depending on the highest IRQ number defined in the domain
> configuration. Therefore, for vGIC-related code and checks, the
> appropriate functions should be used. Also, updated the appropriate
> checks to use these new helper functions.
>
> The purpose of introducing new helper functions for vGIC is essentially
> the same as for GIC: to avoid potential confusion with GIC-related
> checks and to consolidate similar code into separate functions, which
> can be more easily extended by additional conditions, e.g., when
> implementing extended SPI interrupts.
>
> Only the validation change in vgic_inject_irq may affect existing
> functionality, as it currently checks whether the vIRQ is less than or
> equal to vgic_num_irqs. Since IRQ indexes start from 0 (where 32 is the
> first SPI), the check should behave consistently with similar logic in
> other places and should check if the vIRQ number is less than
> vgic_num_irqs. The remaining changes, which replace open-coded checks
> with the use of these new helper functions, do not introduce any
> functional changes, as the helper functions follow the current vIRQ
> index verification logic.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V2:
> - introduced this patch
> ---
>  xen/arch/arm/gic.c              |  3 +--
>  xen/arch/arm/include/asm/vgic.h |  7 +++++++
>  xen/arch/arm/irq.c              |  4 ++--
>  xen/arch/arm/vgic.c             | 10 ++++++++--
>  4 files changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index eb0346a898..47fccf21d8 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -133,8 +133,7 @@ int gic_route_irq_to_guest(struct domain *d, unsigned=
 int virq,
> =20
>      ASSERT(spin_is_locked(&desc->lock));
>      /* Caller has already checked that the IRQ is an SPI */
> -    ASSERT(virq >=3D 32);
> -    ASSERT(virq < vgic_num_irqs(d));
> +    ASSERT(vgic_is_shared_irq(d, virq));
>      ASSERT(!is_lpi(virq));
> =20
>      ret =3D vgic_connect_hw_irq(d, NULL, virq, desc, true);
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 35c0c6a8b0..45201f4ca5 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -335,6 +335,13 @@ extern void vgic_check_inflight_irqs_pending(struct =
vcpu *v,
>  /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. =
*/
>  #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
> =20
> +extern bool vgic_is_valid_irq(struct domain *d, unsigned int virq);
> +
> +static inline bool vgic_is_shared_irq(struct domain *d, unsigned int vir=
q)
> +{
> +    return (virq >=3D NR_LOCAL_IRQS && vgic_is_valid_irq(d, virq));
> +}
> +
>  /*
>   * Allocate a guest VIRQ
>   *  - spi =3D=3D 0 =3D> allocate a PPI. It will be the same on every vCP=
U
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 12c70d02cc..50e57aaea7 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -442,7 +442,7 @@ int route_irq_to_guest(struct domain *d, unsigned int=
 virq,
>      unsigned long flags;
>      int retval =3D 0;
> =20
> -    if ( virq >=3D vgic_num_irqs(d) )
> +    if ( !vgic_is_valid_irq(d, virq) )
>      {
>          printk(XENLOG_G_ERR
>                 "the vIRQ number %u is too high for domain %u (max =3D %u=
)\n",
> @@ -560,7 +560,7 @@ int release_guest_irq(struct domain *d, unsigned int =
virq)
>      int ret;
> =20
>      /* Only SPIs are supported */
> -    if ( virq < NR_LOCAL_IRQS || virq >=3D vgic_num_irqs(d) )
> +    if ( !vgic_is_shared_irq(d, virq) )
>          return -EINVAL;
> =20
>      desc =3D vgic_get_hw_irq_desc(d, NULL, virq);
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index c563ba93af..48fbaf56fb 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -24,6 +24,12 @@
>  #include <asm/gic.h>
>  #include <asm/vgic.h>
> =20
> +
> +bool vgic_is_valid_irq(struct domain *d, unsigned int virq)

I have the same comment as for the previous patch. This function
completely ignores LPIs presence, while you can't argue that LPIs as
valid. Again, function callers are expecting this behavior, so this is
fine, but function name should better reflect its behavior.

[...]

--=20
WBR, Volodymyr=

