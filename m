Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C34D4A1AFAA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 06:03:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876600.1286967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbBqV-0000eE-9c; Fri, 24 Jan 2025 05:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876600.1286967; Fri, 24 Jan 2025 05:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbBqV-0000ck-6K; Fri, 24 Jan 2025 05:03:07 +0000
Received: by outflank-mailman (input) for mailman id 876600;
 Fri, 24 Jan 2025 05:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AcjC=UQ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tbBqU-0000cc-4y
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 05:03:06 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100000.outbound.protection.outlook.com
 [2a01:111:f403:c201::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c9af1e7-da10-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 06:03:02 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DBBPR03MB7081.eurprd03.prod.outlook.com
 (2603:10a6:10:206::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 05:02:59 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%6]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 05:02:59 +0000
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
X-Inumbo-ID: 7c9af1e7-da10-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ta+3s3m6IPGfmRbQwp/6qDkYc5CKauJWsJ5nPCFAyfv9mJ4VPBoW2MZJgXiss/+Gv1ML9+lqnO2n+xkmZI/dS1KA/vJO70WQYhvhtBpHfgk5sgq6gdN9sXYbYjv/R6LSCbN1OM6/H1cgSRC79qeMIgcb8hGYXcbIeZw4eYCD2WzQK3SjPDxyKvvmTrWrb+P47eoMoYkSdhNl6df3t5DZegkXhLRgEPMRnoM7YtmtPreeLJ1+8ovAf/sCQqk9oUt1Cx6uyXRlNL7gWqXDjWhk8flWi9FuGFQIXdnEnLPC7ukuqYz/fKvwFP7FxZh2LmrwC5hwW0iWgRBiPKo44GbwSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7vMnJKxyP+NIkFBMw6JMn8+cyadBKvjdLtynAkEmzc=;
 b=pxKzkQYn/kPq50bQtOmG69ELOcwAs328u6yCBNy5Ql3fQgU/q9y7QH6TYHu82gZo1idsP9vDUB/2oam+/lqO8KsJos5Y1xO8cz5ppL+/9eLi5X70JSMJtx8ABlTBbGyB6x+RS/5+Ecy8V7YhnZqA/APdm8V4D4Ri9WWtT2brxeQ6hZjYljMpQyh0MNXnBkKYU++ZADKGlYelBFhUPZqDWcjde+SaYkmHmZ2Da1INUg+/6Pbjoj9apzaD8M843TRxuatBUyytCGYhttosNbACD+k9oEXFxmXfGABtNGjRoMdMl0Lrr/W1Gnp5jcFNyHOHdnKsw3rOKQWKvfhHZsbX4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7vMnJKxyP+NIkFBMw6JMn8+cyadBKvjdLtynAkEmzc=;
 b=I5jtrNPVyl1egr+MDNhuFDTAfxwwcxomHn7/RId1vt7DdxGvRywfaLpicm5ElwH9RrBZJZobzdYV595t0NcUFfZchgkxjTVXrfm4DgabvwjJQQ2QB6cSJKC4g8xknrhwfvtbm+SpOxVN8j5SCGJrmcDOsx3WziyPKWEchpnwotVUm8sNCAFzBisR5l3CsA/HBx40tUlC1bpds66dQLKzssYhT56HBE1RHAKWTGM2h666FPlu+7wVEQy1Vq56DI0WdWYeGAWHnbo+bHHR8WV6Wb6R+kY2KHW97cfnDrigssmS41B34Gwn0yx8Y6Ew3jIACXagRicatfCwdyxqQAKYbA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "L, John Preetham (893)" <john_preetham.l@daimlertruck.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ruslan
 Shymkevych <Ruslan_Shymkevych@epam.com>
Subject: Re: Request for Documentation on Bringing Up Xen on R-Car H3e
 (H3ULCB)
Thread-Topic: Request for Documentation on Bringing Up Xen on R-Car H3e
 (H3ULCB)
Thread-Index: AdtsrjaU74AF3fZpR/+NK9h56D1xZg==
Date: Fri, 24 Jan 2025 05:02:58 +0000
Message-ID: <87ldv0248u.fsf@epam.com>
References:
 <FR2PPF86245AF1B81D71CF27EE705ED09B7B8E12@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
	<8734ha2evr.fsf@epam.com>
	<FR2PPF86245AF1B0938F55DAF4FF4E63A31B8E02@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To:
 <FR2PPF86245AF1B0938F55DAF4FF4E63A31B8E02@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
	(John Preetham L.'s message of "Thu, 23 Jan 2025 11:44:31 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DBBPR03MB7081:EE_
x-ms-office365-filtering-correlation-id: 5e6116ab-2d67-4d65-34b9-08dd3c345f40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?KqVgYs/Qi3TQlyluhM2xJ6ZiuVyUcDVjxKnvPxcjiI/GEzvB+e+PfKBQvu?=
 =?iso-8859-1?Q?IwaLFYqa7k28a8zcNL+hOeP8jMkLoMPrBmFrM9lfqUeMkb09RCX+CAA9PF?=
 =?iso-8859-1?Q?X127IuQdRWTDkxwoYVkPB8Km9Lbeja+y0pgs7sFCuCjBh8BQIdYAp6eJx9?=
 =?iso-8859-1?Q?giIGMCf9gk9+01N3S4cpPxvJvkyYWv3gRLVK4hF/2IQ8Rrukejb/E0dx9P?=
 =?iso-8859-1?Q?YO3BSGHVqp00ZTgwXl02fiE1dqsO+hLgAa6F+Xw92mMYCzV55hl00Xyl5q?=
 =?iso-8859-1?Q?XHlm7KqAtu4hI2wiUfzcBrkGABvn7idcOP/adhrl4tExBfNbCvvkSYUGe9?=
 =?iso-8859-1?Q?VB16lktTR061NK50AYT16ffuavJOvR7pjYrplmIxowQb81O/AC2WrO4aKm?=
 =?iso-8859-1?Q?7/2rpgoe66wQFx+HjSYTcdZQvJ0m8bap1xrb7aE5vaWW9OtJZs+iw0fCky?=
 =?iso-8859-1?Q?eJfKJYtvmoBfH76P8v5JB8c60J4OYhNM4TbPr9D8GNO6MhCTPmi1ICAVE9?=
 =?iso-8859-1?Q?ZjMid7/XjNXv3yr1buWCDJxyBbsgaQFh56XG3ZiJLwLCM2nbcCxyyM0WSS?=
 =?iso-8859-1?Q?vn3rZt9AbMU1vbMj1sQ6uAlyEf+FjAxPejOQoxt7dT2IPFMMohErCeXKhI?=
 =?iso-8859-1?Q?cta9CWLrYpdUgKV484puAl/BvmKorW2+1F0d89N/5oyaxXptd5RLhUcr1c?=
 =?iso-8859-1?Q?u0czwGZGAxkM/Kp+KBJxkfSvTm07Suu0o0LW1t5xvv7RTTCiGbPkqt05YM?=
 =?iso-8859-1?Q?eGrd+Xdc6tKgyeIx0Qv/OFUczGK/5uD4CI6SDL61n70HpOwcifKzSUULOB?=
 =?iso-8859-1?Q?MtLhII3iDeW5tskHG6syEE5f7x+0wKLVRFI5AClDGuRDpbqVhlWubTAYAq?=
 =?iso-8859-1?Q?lDOOV84ozKoYOds4F9jn3DocCIHRaFJA9n5Y2svuIxJW1EacjoDkHxYAvI?=
 =?iso-8859-1?Q?wysOZ7EWfRWXEJ0i4bVAlgrRdEmsZk65FFQ/j0RjDJf9vSIyYh66tiQun6?=
 =?iso-8859-1?Q?xwGpq22CEH9e8VftC0RJOsOB7Bjb3l+AKSUkQImyU1cJ3k5zo2Ar9GB5Xi?=
 =?iso-8859-1?Q?7kdJf3v1E0hBEFtQFhdS5skPmClozVElMr/vPHya8sk4UmoQAYohDGS+eA?=
 =?iso-8859-1?Q?UL1TJ0BRgFMX1wU9FE8H007ofeLA9Bzp0SWlJ7AT8sF2j03IjrzHUIOg6x?=
 =?iso-8859-1?Q?Bw2X0tgfyA/CyYcn94xDbjckXLYSeYl9Hv1Arb/c1KA/9qcmC+zyoNnnLh?=
 =?iso-8859-1?Q?aWVsWKmErFWtI30f9i1S8l/+LpCzJSuoSAwAQ6Uc2nLetWkyK7gZvCcjCN?=
 =?iso-8859-1?Q?aFK6OyzYNObqJuIIhYtnaspigzYacR0j7HzJLiQgAibmEgwnuVTJGq3p39?=
 =?iso-8859-1?Q?NzNA2RDuYkvH/tWn30WWbl8i5H80H02yBGnGV1MNyznLsBQf/l86bgAfi5?=
 =?iso-8859-1?Q?50ylH0+9UisQlVazR1Ybbuohj73U6rUnjYzDjNSFU+IrDzj/65kYS89krS?=
 =?iso-8859-1?Q?EPtl4x+hJpikhmEahgtV6B?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5wNjUEQtxFmeakMWNnZRu0PcSruFRJu90sYBILPK75/buC7v5PxSvRx8x9?=
 =?iso-8859-1?Q?bF0BgFzuX6HLktHB3cIJFG9Lgto1zC7L39V7A0a1UnSjwNl4gVq6ZIUZID?=
 =?iso-8859-1?Q?dGUPu4f0q47GWm0nzJdmBVkElvGYNgJRVEec3IBBnUYdozagLbfr5PrqYY?=
 =?iso-8859-1?Q?2A0jCLP83eC78pYPNi2coG3FFKYGfe6hPM9lRek6EC+qxVp5wWYeZZ0yPX?=
 =?iso-8859-1?Q?WflMirZi4Q4uxedgTL2PLBg1TnILFUb8MO0b5OPZu8QdKolcdPYU50C0mC?=
 =?iso-8859-1?Q?JftDw/xO1n/6y+yqhQjNkR11M2z3VrIciz8TsCR8+ceX+tOy4OTWRv9Big?=
 =?iso-8859-1?Q?vT3ii9vcjuQImDvQq7e3Ea1Ma7sU91kQFfYUc2yrReCEuCTLtPGR0jd5WO?=
 =?iso-8859-1?Q?C5IrB4wvsxjC/AQCM/40/p1GzRc78+ry/Na8Rrv4RZlbeBPgHXtm5Z/uVM?=
 =?iso-8859-1?Q?BxDgG5XNALfkbQJWB1K4kI1LH7/6mL7U3xRex6taXXo/zc18oEyV+IPtAW?=
 =?iso-8859-1?Q?9mT188bsWsQleAx1Wz//4YhsI0f3CKrNWoBL4JqcOL6/9mdmx2E2LCqSBg?=
 =?iso-8859-1?Q?3wtEGULJ45zypoZ0L4aXzMZgxEnzcxqF+/OCOsM4HkYWJA9sG735S3j6Nl?=
 =?iso-8859-1?Q?pezQUtzsYJMoNHvqELXG2Umrwk9HoFg2H2c9bcOv2Sqf18WkjyGdc12tJM?=
 =?iso-8859-1?Q?3o7UthdQNJ68NPyJfxL4QHl48j0URMKihc2cSt+PwF3+sDXWrbR43mltG5?=
 =?iso-8859-1?Q?XsHJcCIoUq1gfdp/D3s5Q3fV4Xzx2tm4yvSp8KGi3DlCeQXeDQcqZIquYf?=
 =?iso-8859-1?Q?iK+v1M8mRYNnQblH5aTmDi2wdYcnn03+HMgJ8RqQY6Ai6IIRop7tLKXKUw?=
 =?iso-8859-1?Q?rH6KyL4Vkoy8FeKpIg+ghhj223tnCBIbbxdplrgmPB5lEiz08Bg5Jj24ek?=
 =?iso-8859-1?Q?/zfpo5hBZMnS4wpfSs1GEMCqIAKrDygYXtdqDOB7uTtamJoaEWLdKjnPI2?=
 =?iso-8859-1?Q?NKVauJtgVc84GnWxSQTa1dMPP7p60CyLbcA5rqphfKmaZDANBwGYeWDKSt?=
 =?iso-8859-1?Q?VgoRGr0P8izko2CVyGaFViOp3En91Hnl0Vn6ORCDY/Yh5MTL8Z1fi500Z6?=
 =?iso-8859-1?Q?21I3/STojutsNF0nFf7pv1zVuF0f5JVJyOx6UfyeaOYMdowe0/9mgej+6w?=
 =?iso-8859-1?Q?7DzeWjZULj4GQR1fVijZ7kkvWxaynPYMOCRqj4Gas6I796Zn7yzuhJBQFr?=
 =?iso-8859-1?Q?BC63sbQLpWjm0CMQ0fhKNg/8ZnP3DTFidLCIelKS+6O12BgtV7Ce3+cvrT?=
 =?iso-8859-1?Q?+7G8KXfyYE98fBoAe333FOWZEvJnJXiL6cXTMZ2W7ORIHzEB3mY8pPgrX0?=
 =?iso-8859-1?Q?Uk4Ylli9BXOZ1bPwabeaqoFGmYfHaf11qqmPpbXploL7gcUfYvFmOU44aA?=
 =?iso-8859-1?Q?ApXL9O1FTMC1aVTpu1LPPY5LxHS5tkJenykDgDYpMMfDHp8hr+6hGX7+a5?=
 =?iso-8859-1?Q?lZqxfRY8WjkBaxAPslF041jdyFNFkUAqjvvV85DkOt6+cp3cW14voqimKz?=
 =?iso-8859-1?Q?hauWJz928cWEI93jS6qkTP7P8qwmnUk9RYTNip4ArHuXpFIH+8ePzGDT96?=
 =?iso-8859-1?Q?NBSXAGWKy2ilnDXYX/dq9UzPN4uQk45xEjvBc4AZicbVPm9tBQ4/W/WA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6116ab-2d67-4d65-34b9-08dd3c345f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 05:02:58.9927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QoSN5/AzCK9L5GoQ4sIUdSrZdPCmHevp3L1XQh0vKY2shSMZSLHZB4ptqdDY2iFEX4nxIpMoejsUQFUguuARjX1PnaP5yRsDT8XZNhu4hfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7081

"L, John Preetham (893)" <john_preetham.l@daimlertruck.com> writes:

Hi John,

> Hi Volodymyr,
>
> Thank you for the detailed suggestions.
> Since I'm new to XEN hypervisor.
>
> I will approach the recommended method.

Yeah, I think this is the best approach if you want get something
working ASAP.

> Could you please let me know which Yocto version is stable and tested fro=
m your end?

As of now we are using Kirkstone. I believe, this is the latest Yocto
version supported by Renesas BSP. And we of course can't jump over
their head. Anyways, if you'll follow instruction in README.md, moulin
tool will fetch all required meta-layers and configure Yocto for you.

If you are interested in exact commit ids, you can check the YAML file
used by moulin tool:

https://github.com/xen-troops/meta-xt-prod-devel-rcar/blob/master/prod-deve=
l-rcar.yaml#L32

--=20
WBR, Volodymyr=

