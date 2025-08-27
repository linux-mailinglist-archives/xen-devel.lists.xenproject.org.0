Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17357B38F52
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 01:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097135.1451591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urPlS-0001O0-SB; Wed, 27 Aug 2025 23:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097135.1451591; Wed, 27 Aug 2025 23:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urPlS-0001Kq-P7; Wed, 27 Aug 2025 23:41:14 +0000
Received: by outflank-mailman (input) for mailman id 1097135;
 Wed, 27 Aug 2025 23:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSw+=3H=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1urPlQ-0001KK-9m
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 23:41:12 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f4a7e77-839f-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 01:41:10 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB3PR0302MB8918.eurprd03.prod.outlook.com
 (2603:10a6:10:43b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Wed, 27 Aug
 2025 23:41:07 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.016; Wed, 27 Aug 2025
 23:41:07 +0000
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
X-Inumbo-ID: 4f4a7e77-839f-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqEWEEP49BXn7pY4e7PVBn72Ng9O/9e7ccMuz2iKP8zNqs2McW3ySFajuhW8wUjQgolNNIG96Wt/K3Bi1LVlsYwPQQTk4fAGBwKKjxHA/gB5n1OimgdT/jabYW48/ld0+BYu6Q74juYRG8BggUHVRd5+FDdLrNlIKt2H8WDBd+mnaRdaRugkJq14ESc3oUdQhe6JaWyCVKL7DaBZxz6rN31+/AhMRp5Lan0bEOd9n0zghrWlRawipdQKbf3WZsFZAUy8/s9qEjF7jj/e4SMbRzb6He+KfKebW8sA07kCM4/cNcckJhydh4wf5NEP41pJWTnAdywlj+tRlzgQSL0G6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gBEZnD5C1vByDiypE+sd+GvYpRu4dkH6i00ftdkXMM=;
 b=Ph4N8fbm1RxF66P1Y+h6U7NcbcFCgwgH0m1bz3YOETv9TK9D5jKZxBBF2FbumvApBsUVx5JjozTKIXnpMr87r98t4r8kek09ndR4k+nNhsew3bxeZU8cCTpDaRVCaXHxGMWDUobYwxWCTcJHJ5LXDOYhmTiGgTR/3z5anl61X3m+Ouh5laVLVHXuYisvM/emk1hKv+0GPYJ+U0XVPl266jCO5SCrDjBY3NVgBPdRgELnXs1+gkEe3mlqdzef7+QObG1x9Q/RfgfBMuZXIC/+xTWcLclzCYtHPtgYwfcji2avO37qnAqktfA/4eVzOU1u+4pAO3V2A6XtU0KgCkPLSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gBEZnD5C1vByDiypE+sd+GvYpRu4dkH6i00ftdkXMM=;
 b=a3+ce9jggRcMfRhZKmLLYwnVkmfc6BxkEUb8CZJHLysZW9iOVD3W1+Kza90JWyoJy4KOyktK+HdK1IbuQtNcqCF1CrnQCORg0HibRq5sPNdKzH9ISmcaX9Jusj9zL7YTLeugX30qN1BM5fvSGvmAl8bu8dE+NOGeOb1W/x2yCQbBm+2Ckf8e5i+7hzKIkdK/kVThDixOyYOIojOR5nrbiTYG5gv0CxmILv7NY5Tg8uzWXp9ssWFQe9EJoIqrgi+JwYHRGfj99blWaj7IQl9Qqhm+euXu/1Sggx5pOc2Vrthqa98mLbYgyANvpAeJEHorXnWrYDRlmKEGuMl8c4WIJw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v10 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Thread-Topic: [PATCH v10 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Thread-Index: AQHcF5jU8coYEy0ljUKI31cktWj1qA==
Date: Wed, 27 Aug 2025 23:41:07 +0000
Message-ID: <87ms7kz625.fsf@epam.com>
References: <cover.1756329091.git.mykola_kvach@epam.com>
	<55ff99acd69f9eaf20f077e6b453b54931b541d4.1756329091.git.mykola_kvach@epam.com>
In-Reply-To:
 <55ff99acd69f9eaf20f077e6b453b54931b541d4.1756329091.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Thu, 28 Aug 2025 00:21:33 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB3PR0302MB8918:EE_
x-ms-office365-filtering-correlation-id: 1a01d9f8-2070-491f-e276-08dde5c33211
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NFkuDJAIG8AxF1RiSTVIxw4mRyU1zNkdqnojs16EtfA9qfC1dq+P2caapQ?=
 =?iso-8859-1?Q?ZD6SD4V+FgbekH51gDd8Q6y3uBTLBlYz1zi5F6YBo02t/C/DatVmqR8PJc?=
 =?iso-8859-1?Q?Wx1HKGrrKaAW09FfgiISD0Fim1dDNy5mWyYvvAr347XGkA0TiNTnwXlMT2?=
 =?iso-8859-1?Q?GhBAdVFUiK+i5foc45CzYWv0EBonaTvux9S811545nQ0DfH95cEkx4Wpzl?=
 =?iso-8859-1?Q?d8vkmYR4DKaHq62QrfpVxnxCE1+p7Wg8vzzhP1BAOW2MKrG7E7FgTFBAl+?=
 =?iso-8859-1?Q?6Rgp4CTK0XDc4ESw1fD4Q9EOu4xxJgfs0O79V3XX1oXzqc46wlHRgiXv5k?=
 =?iso-8859-1?Q?AfZ1jnTfWnSyR59d21fpD7k25YDBYv0dKmI8om3skKOBHC9hYLicQus7aE?=
 =?iso-8859-1?Q?F4lhQsEwy0xSUlVRqnVNp/AOf5WK7QHQwIfyZDtDsplt/rPSGm+kqJsXHs?=
 =?iso-8859-1?Q?PZ2u+xQfxxuGYH8M1stKsfgndlpZpX9dL1kV8ww9RTiWnlorl0zYL/8BTS?=
 =?iso-8859-1?Q?j2yhW0sRv/IYqpYD2V8LLOAdlO/ndqIrO9lyNiv3UHVMaHIKKvuM1YLvPY?=
 =?iso-8859-1?Q?H7o4yNEphjn298CQxBn3ZpKkZI2VBcL3pkmDwTaJUNl22c2/T5KibWwnHW?=
 =?iso-8859-1?Q?BjrFZySIa5F7izmlOod8CSeMxGrsZW3NsDMqktuV6j5+D4mv5Q6NMLR98P?=
 =?iso-8859-1?Q?Z+Xoel145Z473I0rfSI39zBZhu7epv/bB+fU2hjEtxXS5Kn47f+uY+srCI?=
 =?iso-8859-1?Q?bwEgfZcJlzyofgEMBx8hRmSVKKrDJrb2xdQhNklLzX4dc7EGCvdNycgf4I?=
 =?iso-8859-1?Q?/pWOAKN5/A1uSGxbTR8qdd0wfiJG16jICGMstv0FIfXZlYjwlY02xh/rGy?=
 =?iso-8859-1?Q?veya2eVKfLpkyroDAQRJsWXpEYA+F3zrfXRh0PBunsQ8hzAYw9+cxf2+9e?=
 =?iso-8859-1?Q?RS0z9jlJsmyocBpdv/EovXi9Jw6OJjSDid3SMWrmyPopBpuh+vUxNFhCtb?=
 =?iso-8859-1?Q?OKfDDmqGFbJJYXCIBX9Xt54frymK1ninj+EY9SJ2/J2cLmD5QJsgfz+Bs8?=
 =?iso-8859-1?Q?E7n29kuAm8UnQGkOj8SixUbftR7yPAvDSuKQVLk34gABy3sKvm5N0Bepvl?=
 =?iso-8859-1?Q?a7DBRQLWnXNRxQrcLKe2oyTRXanqkNwErnxCDTIzfkKrpnJQEulZNofg8K?=
 =?iso-8859-1?Q?cgD0EWSUDGmj2cdN3qcMEh06/tIe6C6j8g1bdnIoq4ab+kuoETayx3SdEx?=
 =?iso-8859-1?Q?45TrbcuxuTMhEv2lKYd0FF7T9hYwTsHJleKOMX8XSh29/HfBFe1hXFR/j4?=
 =?iso-8859-1?Q?OFtkwsAYeHq6s1wAFNLI/Iz3JPLFmgJdfM0N3BcqsoW8sIgpWcCoP0xzQg?=
 =?iso-8859-1?Q?E8AFmwGjenZXNOV6a879ZKleDF3zP/4nCHMK/LKflphrhVMTSA5bYqYH5A?=
 =?iso-8859-1?Q?XuidBhdGJ5B2mhY0c5Weq9+ZgomnAZcg2BD5OqwHYHfdzbGG5ZveAJ0A1D?=
 =?iso-8859-1?Q?LagRAfUBiYxDp0XCl9VOo6TA29shCbbfYPrrB4yHKZYA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vvXZqnUuU8Ded0RygvFs4ddXqGxbEmzUNacr7TrDSY+X0hDQYbv27wP0oM?=
 =?iso-8859-1?Q?ee7hZ98Oln2C9qzs7EXljDXpe2nlTY0oEf8EbPVkNlUy9BgUuTSR6YWnnU?=
 =?iso-8859-1?Q?iajTDczBawR6P2rwq02Y6qm7UlH1FwpHZSUovT3eQEXRjW+WbcTK9K/tig?=
 =?iso-8859-1?Q?A6OJA7sfLI/GxIGPtwddWE5dMABVxXGjMO7j51Hpgo1dk4jebhfwec7F4o?=
 =?iso-8859-1?Q?POOH3aRJBF428RTSFnPRejlgU33hVuoWJSYPTPoWTvBYW04vTfSsaMrNHd?=
 =?iso-8859-1?Q?BA/4H6XnM8VCTDzR5Ime0qkX4YPUtl/wA28PcZDeTgKX7fBDU2en4BSpYT?=
 =?iso-8859-1?Q?EtVVFrGZQ6mzgwd6Xd2lcb6zXGuIa9Y3+c5vJwm0xKy2Fdwb/OtYF1gMzd?=
 =?iso-8859-1?Q?RSUcq72Uc7P3qpFH7bdlvxbpuAVo2MdbR8R3e0Jt4KtgLFZPPrPkceP1Mz?=
 =?iso-8859-1?Q?tEbMLJsHQ7opCgV6IIIr6zz/71c5Fc5+CvkSwlu1K+MrY91tEbSecMWJ7m?=
 =?iso-8859-1?Q?z47b+vmtNo8K33uDzEGyM7N0LSthBFu3j/XcG67i6TZgfuD+OmkvX8sEDq?=
 =?iso-8859-1?Q?8rPliIhS05g8lo1q61OleHrqZTrsnauE/LzkBQx4RdPq2RFf0HPzu0k2KG?=
 =?iso-8859-1?Q?cQSdzP88ar369e2dDmowars2iXArx3K1nTupRDTkRrEO/LsQCLPGyNb4V7?=
 =?iso-8859-1?Q?EmLlEhxszg11ZHw0HZPb8Kcflq4rZ3r5GgD62gB+WvUZsQvXw3/8Mxxuph?=
 =?iso-8859-1?Q?FeGTDtGLwvhvDefNqxRW9rzJYlGdo7HKEiaCvZ0NQfdxYXeHndZBNmtFu7?=
 =?iso-8859-1?Q?VhJ4AGtrGH53JbCvMa4imZj5xkea13d4fAXN+9GyeSMadEHvOryd+mzuHB?=
 =?iso-8859-1?Q?h5KFqkK+Pr/JB6m92QHOYbS8gDCqtYjCmAkuxjZ8AKR3Pe5vwVz2FJu0n4?=
 =?iso-8859-1?Q?grYnO2zfPpWR0sSbdWWIR6rJPFGld5pcaZXpF7XXljJIjQlWlwQ4E7s5ui?=
 =?iso-8859-1?Q?Dw3ThPL3f+7UAMhqcd5LKYVNJuxQkIXZVc7Pz/gvwfsaSRXfRaxMiDdFZ1?=
 =?iso-8859-1?Q?PdY/yV/H207gYuIp2LnQqKjdf/Nrs9p45GqUJatougigss2Kx+7uLQZpqR?=
 =?iso-8859-1?Q?DRYvCAENWI5fnASLv1Myaznr+5/gxPm766O6ZN8+vpQL7jjP5z2AYw6eUm?=
 =?iso-8859-1?Q?6Q9bdR9rQzFMslzQrdoIw1XsysZSJNuaf/Ed8AvnXlRCJYQKwwqPEjd1Js?=
 =?iso-8859-1?Q?H4+blJgJJSqR5U2d2MQ3zUmTh1DdtWp7EKW6fVfS3Ysm3I2LfjWd6aooUE?=
 =?iso-8859-1?Q?SvjABlEpU82KKB0c4Hm/vbHmTAiHfJP0EATh8WdDfUQ+DbhdvcOCEjIxpE?=
 =?iso-8859-1?Q?m1TObdwKqfDqiiRUFZLhZBt5ec+C5GqxDrFwp4R1K1riMxJh+pGLs8ufkL?=
 =?iso-8859-1?Q?S5AKI1ryG3My9vVwtRUNGf25Q0hbPcU3MeC/d5kH4vNREjmhoH01pqnM2S?=
 =?iso-8859-1?Q?0793NAVsXaVGfatvpWcL+CAgKqV6JxPdkDTxKmE4MHHUVEK525qwhUvdt1?=
 =?iso-8859-1?Q?44NBtvvPTaNFfFdBikvLE5bkuwAEfZ1yzdADewoRHuwMoc7QeVJQCWiWin?=
 =?iso-8859-1?Q?iDNES+oty9zlKVUB/y1vingLbVadpKKtnciJ0SWhvJUDH36nSCDeHcng?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a01d9f8-2070-491f-e276-08dde5c33211
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 23:41:07.7792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p/QbAmP5MVZnZPBTKnQ65Pxvkechypb7R7/vuvNxEpJ9aY+svaPuWfIto8WdU20B3oGMUfPjWCtIZslAKF+LzGh5sc7cDF3q0yBTm7pi8O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB8918

Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
> allowing guests to request suspend via the PSCI v1.0 SYSTEM_SUSPEND call
> (both 32-bit and 64-bit variants).
>
> Implementation details:
> - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> - Trap and handle SYSTEM_SUSPEND in vPSCI
> - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
>   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the system
>   in hwdom_shutdown() via domain_shutdown
> - Require all secondary VCPUs of the calling domain to be offline before
>   suspend, as mandated by the PSCI specification
>
> Additionally, GIC context must be saved when a domain suspends.
> LRs are not architecturally preserved across suspend/resume or context
> switches, so Xen must explicitly save and restore them. This requirement
> is specified in the PSCI specification (DEN0022F.b, section 6.8 "Preservi=
ng
> the execution context"). The fix is implemented by moving the respective
> code in ctxt_switch_from() before the return path taken when the domain
> suspends.
>
> Introduce domain_resume_nopause/_helper() to allow resuming a domain from
> SYSTEM_SUSPEND without pausing it first. This avoids problematic
> domain_pause() calls when resuming from suspend on Arm, particularly in e=
rror
> paths. The helper is Arm-specific; other architectures continue to use th=
e
> original domain_resume().
>
> Usage:
>
> For Linux-based guests, suspend can be initiated with:
>     echo mem > /sys/power/state
> or via:
>     systemctl suspend
>
> Resuming the guest is performed from control domain using:
>       xl resume <domain>
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V10:
> - small changes to the commit message reflect updates introduced in this
>   version of the patch.
> - Comments are improved, clarified, and expanded, especially regarding PS=
CI
>   requirements and context handling.
> - An ARM-specific helper (domain_resume_nopause_helper)
> - gprintk() and PRIregister are used for logging in vPSCI code.
> - An isb() is added before p2m_save_state
> - The is_64bit_domain check is dropped when masking the upper part of ent=
ry
>   point and cid for SMC32 SYSTEM_SUSPEND PSCI calls
>
> Changes in V9:
> - no functional changes
> - cosmetic chnages after review
> - enhance commit message and add extra comment to the code after review
>
> Changes in V8:
> - GIC and virtual timer context must be saved when the domain suspends
> - rework locking
> - minor changes after code review
>
> Changes in V7:
> - add proper locking
> - minor changes after code review
>
> Changes in V6:
> - skip execution of ctxt_switch_from for vcpu that is in paused domain
> - add implementation of domain_resume without domain_pause
> - add helper function to determine if vcpu is suspended or not
> - ignore upper 32 bits of argument values when the domain is 64-bit
>   and calls the SMC32 SYSTEM_SUSPEND function
> - cosmetic changes after review
>
> Changes in V5:
> - don't use standby mode, restore execution in a provided by guest point
> - move checking that all CPUs, except current one, are offline to after
>   pausing the vCPUs
> - provide ret status from arch_domain_shutdown and handle it in
>   domain_shutdown
> - adjust VPSCI_NR_FUNCS to reflect the number of newly added PSCI functio=
ns
>
> Changes in V4:
> Dropped all changes related to watchdog, domain is marked as shutting
> down in domain_shutdown and watchdog timeout handler won't trigger
> because of it.
>
> Previous versions included code to manage Xen watchdog timers during susp=
end,
> but this was removed. When a guest OS starts the Xen watchdog (either via=
 the
> kernel driver or xenwatchdogd), it is responsible for managing that state
> across suspend/resume. On Linux, the Xen kernel driver properly stops the
> watchdog during suspend. However, when xenwatchdogd is used instead, susp=
end
> handling is incomplete, potentially leading to watchdog-triggered resets =
on
> resume. Xen leaves watchdog handling to the guest OS and its services.
>
> Dropped all changes related to VCPU context, because instead domain_shutd=
own
> is used, so we don't need any extra changes for suspending domain.
>
> Changes in V3:
> Dropped all domain flags and related code (which touched common functions=
 like
> vcpu_unblock), keeping only the necessary changes for Xen suspend/resume,=
 i.e.
> suspend/resume is now fully supported only for the hardware domain.
> Proper support for domU suspend/resume will be added in a future patch.
> This patch does not yet include VCPU context reset or domain context
> restoration in VCPU.
> ---
>  xen/arch/arm/domain.c                 |  21 +++++-
>  xen/arch/arm/include/asm/domain.h     |   2 +
>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>  xen/arch/arm/include/asm/psci.h       |   2 +
>  xen/arch/arm/include/asm/vpsci.h      |   2 +-
>  xen/arch/arm/vpsci.c                  | 100 ++++++++++++++++++++++----
>  xen/common/domain.c                   |  35 +++++++--
>  xen/include/xen/sched.h               |   3 +
>  8 files changed, 141 insertions(+), 25 deletions(-)
>
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 863ae18157..401106fd67 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -90,6 +90,24 @@ static void ctxt_switch_from(struct vcpu *p)
>      if ( is_idle_vcpu(p) )
>          return;
> =20
> +    /*
> +     * Even if the guest saves and restores its own context, Xen must sa=
ve
> +     * the transient state (such as List Registers) that is not preserve=
d
> +     * by hardware across suspend. See PSCI DEN0022F.b, section 6.8
> +     * "Preserving the execution context".
> +     */
> +    gic_save_state(p);
> +
> +    /*
> +     * Skip saving the rest of the context if the VCPU is suspended,
> +     * to avoid modifying SCTLR_EL1. This is required by the PSCI
> +     * specification, which manages SCTLR_EL1 during SYSTEM_SUSPEND flow=
.
> +     */
> +    if ( test_bit(_VPF_suspended, &p->pause_flags) )
> +        return;
> +
> +    isb();
> +
>      p2m_save_state(p);

I am pretty sure that Julien told you that you can't skip p2m due to
to some workarounds regarding CPU speculation.

> =20
>      /* CP 15 */
> @@ -158,9 +176,6 @@ static void ctxt_switch_from(struct vcpu *p)
> =20
>      /* XXX MPU */
> =20
> -    /* VGIC */
> -    gic_save_state(p);
> -
>      isb();
>  }
> =20
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index a3487ca713..f9577bc9ae 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -312,6 +312,8 @@ static inline void update_guest_memory_policy(struct =
vcpu *v,
>                                                struct guest_memory_policy=
 *gmp)
>  {}
> =20
> +void domain_resume_nopause_helper(struct domain *d);

If I am not mistaken, function declarations for xen/common/domain.c
should go into include/xen/domain.h, not arch/arm/include/asm/domain.h

Also, I am honestly don't know is it a good way to expose internal
function from xen/common/domain.c. I do understand why do you need this,
but function naming becomes more and more confusing. I had my
considerations against domain_resume_nopause(), but
domain_resume_nopause_helper() is even worse, because it sounds to
generic.

Lastly, I checked docs/misra/rules.rst. There is no mention of Rule
8.7. So why you can't just make domain_resume_nopause() externally
available?

> +
>  #endif /* __ASM_DOMAIN_H__ */
> =20
>  /*
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include=
/asm/perfc_defn.h
> index effd25b69e..8dfcac7e3b 100644
> --- a/xen/arch/arm/include/asm/perfc_defn.h
> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_r=
eset")
>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>  PERFCOUNTER(vpsci_features,            "vpsci: features")
> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
> =20
>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
> =20
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index 4780972621..48a93e6b79 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
> =20
>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
> =20
>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/=
vpsci.h
> index 0cca5e6830..69d40f9d7f 100644
> --- a/xen/arch/arm/include/asm/vpsci.h
> +++ b/xen/arch/arm/include/asm/vpsci.h
> @@ -23,7 +23,7 @@
>  #include <asm/psci.h>
> =20
>  /* Number of function implemented by virtual PSCI (only 0.2 or later) */
> -#define VPSCI_NR_FUNCS  12
> +#define VPSCI_NR_FUNCS  14
> =20
>  /* Functions handle PSCI calls from the guests */
>  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 7ba9ccd94b..3371f33b81 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -10,28 +10,18 @@
> =20
>  #include <public/sched.h>
> =20
> -static int do_common_cpu_on(register_t target_cpu, register_t entry_poin=
t,
> -                            register_t context_id)
> +static int do_setup_vcpu_ctx(struct vcpu *v, register_t entry_point,
> +                      register_t context_id)
>  {
> -    struct vcpu *v;
>      struct domain *d =3D current->domain;
>      struct vcpu_guest_context *ctxt;
>      int rc;
>      bool is_thumb =3D entry_point & 1;
> -    register_t vcpuid;
> -
> -    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> -
> -    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> -        return PSCI_INVALID_PARAMETERS;
> =20
>      /* THUMB set is not allowed with 64-bit domain */
>      if ( is_64bit_domain(d) && is_thumb )
>          return PSCI_INVALID_ADDRESS;
> =20
> -    if ( !test_bit(_VPF_down, &v->pause_flags) )
> -        return PSCI_ALREADY_ON;
> -
>      if ( (ctxt =3D alloc_vcpu_guest_context()) =3D=3D NULL )
>          return PSCI_DENIED;
> =20
> @@ -78,11 +68,32 @@ static int do_common_cpu_on(register_t target_cpu, re=
gister_t entry_point,
>      if ( rc < 0 )
>          return PSCI_DENIED;
> =20
> -    vcpu_wake(v);
> -
>      return PSCI_SUCCESS;
>  }
> =20
> +static int do_common_cpu_on(register_t target_cpu, register_t entry_poin=
t,
> +                            register_t context_id)
> +{
> +    int rc;
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +    register_t vcpuid;
> +
> +    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> +
> +    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> +        return PSCI_INVALID_PARAMETERS;
> +
> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> +        return PSCI_ALREADY_ON;
> +
> +    rc =3D do_setup_vcpu_ctx(v, entry_point, context_id);
> +    if ( rc =3D=3D PSCI_SUCCESS )
> +        vcpu_wake(v);
> +
> +    return rc;
> +}
> +
>  static int32_t do_psci_cpu_on(uint32_t vcpuid, register_t entry_point)
>  {
>      int32_t ret;
> @@ -197,6 +208,48 @@ static void do_psci_0_2_system_reset(void)
>      domain_shutdown(d,SHUTDOWN_reboot);
>  }
> =20
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t =
cid)
> +{
> +    int32_t rc;
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +
> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> +    if ( is_hardware_domain(d) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    domain_lock(d);
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v !=3D current && is_vcpu_online(v) )
> +        {
> +            domain_unlock(d);
> +            return PSCI_DENIED;
> +        }
> +    }
> +    domain_unlock(d);
> +
> +    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> +    if ( rc )
> +        return PSCI_DENIED;
> +
> +    rc =3D do_setup_vcpu_ctx(current, epoint, cid);
> +    if ( rc !=3D PSCI_SUCCESS )
> +    {
> +        domain_resume_nopause_helper(d);
> +        return rc;
> +    }
> +
> +    set_bit(_VPF_suspended, &current->pause_flags);
> +
> +    gprintk(XENLOG_DEBUG,
> +            "SYSTEM_SUSPEND requested, epoint=3D0x%"PRIregister", cid=3D=
0x%"PRIregister,
> +            epoint, cid);
> +
> +    return rc;
> +}
> +
>  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>  {
>      /* /!\ Ordered by function ID and not name */
> @@ -214,6 +267,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_fun=
c_id)
>      case PSCI_0_2_FN32_SYSTEM_OFF:
>      case PSCI_0_2_FN32_SYSTEM_RESET:
>      case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>      case ARM_SMCCC_VERSION_FID:
>          return 0;
>      default:
> @@ -344,6 +399,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, u=
int32_t fid)
>          return true;
>      }
> =20
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> +    {
> +        register_t epoint =3D PSCI_ARG(regs, 1);
> +        register_t cid =3D PSCI_ARG(regs, 2);
> +
> +        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> +        {
> +            epoint &=3D GENMASK(31, 0);
> +            cid &=3D GENMASK(31, 0);
> +        }
> +
> +        perfc_incr(vpsci_system_suspend);
> +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
> +        return true;
> +    }
> +
>      default:
>          return false;
>      }
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 104e917f07..e2371549a0 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1349,16 +1349,10 @@ int domain_shutdown(struct domain *d, u8 reason)
>      return 0;
>  }
> =20
> -void domain_resume(struct domain *d)
> +static void domain_resume_nopause(struct domain *d)
>  {
>      struct vcpu *v;
> =20
> -    /*
> -     * Some code paths assume that shutdown status does not get reset un=
der
> -     * their feet (e.g., some assertions make this assumption).
> -     */
> -    domain_pause(d);
> -
>      spin_lock(&d->shutdown_lock);
> =20
>      d->is_shutting_down =3D d->is_shut_down =3D 0;
> @@ -1366,13 +1360,40 @@ void domain_resume(struct domain *d)
> =20
>      for_each_vcpu ( d, v )
>      {
> +        /*
> +         * No need to conditionally clear _VPF_suspended here:
> +         * - This bit is only set on Arm, and only after a successful su=
spend.
> +         * - domain_resume_nopause() may also be called from paths other=
 than
> +         *   the suspend/resume flow, such as "soft-reset" actions (e.g.=
,
> +         *   on_poweroff), as part of the Xenstore control/shutdown prot=
ocol.
> +         *   These require guest acknowledgement to complete the operati=
on.
> +         * So clearing the bit unconditionally is safe.
> +         */
> +        clear_bit(_VPF_suspended, &v->pause_flags);
> +
>          if ( v->paused_for_shutdown )
>              vcpu_unpause(v);
>          v->paused_for_shutdown =3D 0;
>      }
> =20
>      spin_unlock(&d->shutdown_lock);
> +}
> =20
> +#ifdef CONFIG_ARM
> +void domain_resume_nopause_helper(struct domain *d)
> +{
> +    domain_resume_nopause(d);
> +}
> +#endif
> +
> +void domain_resume(struct domain *d)
> +{
> +    /*
> +     * Some code paths assume that shutdown status does not get reset un=
der
> +     * their feet (e.g., some assertions make this assumption).
> +     */
> +    domain_pause(d);
> +    domain_resume_nopause(d);
>      domain_unpause(d);
>  }
> =20
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 02bdc256ce..12429d16b9 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1014,6 +1014,9 @@ static inline struct domain *next_domain_in_cpupool=
(
>  /* VCPU is parked. */
>  #define _VPF_parked          8
>  #define VPF_parked           (1UL<<_VPF_parked)
> +/* VCPU is suspended. */
> +#define _VPF_suspended       9
> +#define VPF_suspended        (1UL << _VPF_suspended)
> =20
>  static inline bool vcpu_runnable(const struct vcpu *v)
>  {

--=20
WBR, Volodymyr=

