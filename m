Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40BB38F0E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 01:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097125.1451580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urPR7-0006k4-7x; Wed, 27 Aug 2025 23:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097125.1451580; Wed, 27 Aug 2025 23:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urPR7-0006h6-4k; Wed, 27 Aug 2025 23:20:13 +0000
Received: by outflank-mailman (input) for mailman id 1097125;
 Wed, 27 Aug 2025 23:20:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSw+=3H=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1urPR5-0006gh-DG
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 23:20:11 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fd45553-839c-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 01:20:09 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by GV2PR03MB9548.eurprd03.prod.outlook.com
 (2603:10a6:150:da::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 23:20:04 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.016; Wed, 27 Aug 2025
 23:20:04 +0000
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
X-Inumbo-ID: 5fd45553-839c-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fiu6NdorCobLyuWDu7GF0IO0rDCBg6WM1nOsbXrAbrcnar5f6QS0gkR9g5bLCgMoTnnsS3P3gnqIOMaWmMpUTURUtfHER6Ov0TYjPQxaGmRRXICDoR8GxhVWLCGxVfzeJ/8R74X7GpGsaJLJPdu19Rt7uPRl77otBFO76gjQfNG5Ujx1yctIat8AemzyDGKekwybJdfTQp/M2C3g1SFyRLFC3dDf1Bz2c12eN/ue2sG3fqeBy4Y501BMpj5PK9jhXv1cmnIMReTqLE6AmydtmA7XuS7pmLx1hDylXDGlyZ3Rb7m9+29s/KZsZo3859pleB9EXc5GuFATwjfJ3FmUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNUd878vEBAh3MyxstrYrmEdvXxxtBuPcqoIcDkdPOE=;
 b=KFEqQvCtHDcSnABElloIuyefH/KhsUwbbM4jtHrXks+lhdqQrzJzn0SMvhsA6DzSj+je/cn79WnheWIqmyKYuQzCrdhfHwENG0LMuG04nNHjvrRqH4XDjhMvu6jTZmanPnAR9bHC6ghE9205a3sRH6/whtzSpn5jOjZm9p6erfAkoIO79YtQItLMu31C4IGSZ2cKEoBBkMy1Ix5UDDrkJycxzgJBtaFuJ9aueLyuJuS3GjF48WBHq3ShIQYURHA52kQWIIlt09LXXz7lWszBLoXddbhqeE0rpHi0nV4JHlaTx/EGVT9FBURhrh1U8f1wEyJala1FO1Lcffe2q65yhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNUd878vEBAh3MyxstrYrmEdvXxxtBuPcqoIcDkdPOE=;
 b=Wh5J72+LamY3dj/qNIFwMaiQ0hw/deils3jVhGwY4WBrz1HbON2X46+0m8+PQMMcehaIXweEQLyBrpWAPGZ0GPSBcrMwZvl8l0wKZOpeVBe/j8KNTVuuG+cOhi2FQ9ivEr94xOESCd9Lap1LvIXuJ1WdclVPiOKgv9W3eQTk/Cb9Fw7JKv3mory3+0gaFeiGTT/VGWqRFq5jCP7qTbtMlkvVKL//tJKNF6aMUqeoq3RksXtMi8dqnRQ7X9YIfR0rfkslZ2sRf+4qfoX7ovdCwozMZXA1+JaNwVtwO4mAxUThEOl0OE7WAab1LQK4Jh4jbDoNivPPdSxrUjlwPjFJyA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: Re: [PATCH v4 11/12] doc/man: update description for nr_spis with
 eSPI
Thread-Topic: [PATCH v4 11/12] doc/man: update description for nr_spis with
 eSPI
Thread-Index: AQHcF4DXobE1p0eyakyyCN/Uk7KDQg==
Date: Wed, 27 Aug 2025 23:20:04 +0000
Message-ID: <87y0r4z717.fsf@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
	<50cd1899b328e82bd517ae0dd0e400e9cfee0999.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <50cd1899b328e82bd517ae0dd0e400e9cfee0999.1756317702.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Wed, 27 Aug 2025 18:24:24 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|GV2PR03MB9548:EE_
x-ms-office365-filtering-correlation-id: e6a1e2e4-84a8-4af5-e4cd-08dde5c04134
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7LMBHB/xlzgdMvJcnIVyVUNwt64oKhNrUL9PBkeqxTQZc3AoaKKLoljA4u?=
 =?iso-8859-1?Q?CcVggDgprnBIZp8e6GorP5ZMeypI4wCRcEcYpVPFizaluH4BXw6yIvgBm7?=
 =?iso-8859-1?Q?pJcl5btI8YBU/4GNo+ki0cGPZgjy1hlJOYvU/UWw62+P+8dslxEMLq9cHR?=
 =?iso-8859-1?Q?oz4eYj3QjFDB5rHBT/73NU5BWrW9VK7frV0RISaZ+3H3N1W9Rq+YTLDr3a?=
 =?iso-8859-1?Q?zF3mQbmxezb9ba6UMEbh0z7piue2ORBh6UKs37XcvhQ/tPXorauXHDcGlD?=
 =?iso-8859-1?Q?W+9bft2PhddtOeR946IbGKmd03NTqWPQt/7LYe2i4iTBAo97BHXvSqFGqw?=
 =?iso-8859-1?Q?kTvoFl248e9x6DIwqUgFVRiUX7UtwQeU2hL16LFwuvGfnEeMggHv4+3qTP?=
 =?iso-8859-1?Q?bdI9q8u3QmGN9AHrRh3U5ubwrTT10iIwYEgiQCx1xmqcegV4pfj+R0h8xV?=
 =?iso-8859-1?Q?4+1LuqOVvj53P9UWdWqwVvf4H/u/1ICeM1fItHDi8av0HrOzxfGbH6bKS3?=
 =?iso-8859-1?Q?T+jhWiVPWykOQ7tcB1MU2YNA5J8+t8UTX5WjGdTyu1rTrEMnq7iGCIKwe8?=
 =?iso-8859-1?Q?DcF7nVCDpzIVFaTcC0W5QQ8iezSCkFwSQaFsEVTJYYmY88bGJIV2oqZVI6?=
 =?iso-8859-1?Q?O8I1dsxHXTJ5qkPYMxB6HHs5bYHRfEaLqnN+CFlWaNH2gW/gisLPio6emW?=
 =?iso-8859-1?Q?sH4p5Nlp1L+oiEK+y6Pjd2OCj1ilmGu8FnbD6wDginmhjauOuk6/EKK1uB?=
 =?iso-8859-1?Q?zh3BV2tiWmfVh8v/0KD61fbBTwB4WZ7IcaC5pU86xfO3Oj8HarfutOxR1n?=
 =?iso-8859-1?Q?scvePEefHHDmwiB/epL2cZowswR29C3VRNok6LZNcPMGYOyKerM5G+DOfk?=
 =?iso-8859-1?Q?TAZeEe4MJ7ptO3nrP8y+UWrpWLv7jVP4aOAZzPQ0SY5Jlr4oYHPW0PC3FO?=
 =?iso-8859-1?Q?IOxtB6uJl6dKiLex3yKECr6DiNlL0MJbawgFk4kY7P/eX3FBhLRnmSjoGE?=
 =?iso-8859-1?Q?tap5+vbRvIVtcq/5j+Pdl/atdj/5DI4rlCeRoswNim2TiXdr3dn0fuP4xA?=
 =?iso-8859-1?Q?5K1udMTzWynQ4fSeO3m1izmBY4JobNYyv2ObzLcqlp8W8B3FKxojR8HOhP?=
 =?iso-8859-1?Q?prefLT8RPnWTxtQCRS3zscn7A0R3y0se/1l+smV7VYxLhZv12f6FrYhzmN?=
 =?iso-8859-1?Q?w5sBQ1zKBwVki9XRUi9gxInphmgnBCLqYsk/8ISOL11txarwulI2tC03xJ?=
 =?iso-8859-1?Q?mDGA94v+a9sY0IMpuYKoscSg/VJC9O7bp0+uQ15tg8ynXvSJmpIyFgc5qy?=
 =?iso-8859-1?Q?BEX+CXOb7Jr87TAeT1TwUnRUJ6CLUmQAGJoFaome8/ikaNiXzlG9B/qKAc?=
 =?iso-8859-1?Q?3GsqDUPYxG87TKEIEOCgKoEUKKIXwLw4vyjvX4ZMUy6ta9tiHUWyYKnPIu?=
 =?iso-8859-1?Q?SguyEDdbhZnu8fnFMgegeFsO+24bBtkzBOIfIhJJhD7raRgGx5WzM+BtfZ?=
 =?iso-8859-1?Q?GQfCKwIHJyLvLbW99vNQM6fFgHwaCOo8f0UDHIhDQIanD3IsBhUf2PxEm3?=
 =?iso-8859-1?Q?3HjGzDw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4ieA/psapHkmasNBseBKlILUolFT+PzYxWbOEtGpKFyUWPYcrjMdX3Eknr?=
 =?iso-8859-1?Q?3tV+370J8mB5et+xyeoSvLJ3/Lw+4SOmlfqsMWaN9d4ce5xhsyokT5aTMe?=
 =?iso-8859-1?Q?z6BYzcbw25OAvVmacQw76MTodva4piRGsqA0PJQTQ1rrWClD2mC2jzh/1m?=
 =?iso-8859-1?Q?p8Cr3LnHoir/6ORtTuX4bfeH9kZqTDjst2qeQrRO5IsyUJyDa0hZAQ7wKq?=
 =?iso-8859-1?Q?CpEX4bgju7Rc8nzMlugFxSkDxoVcps+BMQfkzX9PucnwJ7q92drutTlMQS?=
 =?iso-8859-1?Q?JWmeF/nF3UL78E2s5B8uSYLeWXSIAgbMJ7iCaBK2QCbAZX0fOPSnOfQNPd?=
 =?iso-8859-1?Q?TbA4hLR6OQWC9KGM3qvMiZzsV2E5BTK9AbIwOxX99mh0OUmHSzM8yiG9nx?=
 =?iso-8859-1?Q?TGylPLAEN6irxhK7kJkR3hLFd3oiVX0k8lQL+630lOeqPmdppjWLSf3f/u?=
 =?iso-8859-1?Q?U14EtxYezrB8czk7/3Pub14+8NxALyp0SEw8bBQ4vK3Xg/OCp1So1Wkbvx?=
 =?iso-8859-1?Q?F0W898ONyFc9swSkCmmNjvDsyPmWgDNX/ftHLw7fHeMh8kz7kCxoyclx45?=
 =?iso-8859-1?Q?dOiCUrOs7xpXn+VsvJzXdwOTi0C6D5hS6qvaLYUDyGVSHLcOFCBeCiEU69?=
 =?iso-8859-1?Q?UowBiSVAAM9UOJmpnEr7qDbPGABSZbJr4slxxf7seFkqzZMf4po4j2b9rx?=
 =?iso-8859-1?Q?CK7wPhupOJY1i1yn82QtlXB5KHk+T82nHjn0ItEpd0f8GQ1rLC8wC3vpwg?=
 =?iso-8859-1?Q?aXzZ4jd4MiZfYniPtKm0VZoXMoLQWaVVVt9Eu6To8oNFlPoqLkcm9GcBQH?=
 =?iso-8859-1?Q?u8j7qRKSAlYsXjkOh7zTjXVHMnkCKlXB0pr9DQMBD5CLU97ssPShk9LqVK?=
 =?iso-8859-1?Q?XXgW5JYJX6naQkcOMsqyDQo5JOtWSenIBlDAZJbDjKS0JmlI2Id2ie+/sI?=
 =?iso-8859-1?Q?TUJs/PPLrBUxkQ+MTDlWRLRHM/4IQlfByQ5vcXh00C5boaD8EYwlCjcMdy?=
 =?iso-8859-1?Q?LDvJlzx7lRaxtHdTk9cadvYIbKhMkQVv/37qhDF4JtrtuSFX0vhlLUetn4?=
 =?iso-8859-1?Q?9D2v46Zn6aSrb47hOkiABTWJwpBJjGbFkcaXpdN4727CGCUzIwPBuPeTaK?=
 =?iso-8859-1?Q?hGX/glR+E7Fb1a3bq86m2AT6Sbmuco0KU63aRC3YmRX+nY54wh2SI7i7Ne?=
 =?iso-8859-1?Q?xwOcHQRs+fYmUYckUOC5iN4eRT6HGg3RHEHBOYdJFwD+1v5Z3caPlVH9/m?=
 =?iso-8859-1?Q?WT11qF02wE89YCiO0lFNB5DwYpMD3pfPvCQAAx8BX5IhdKAuNafk+hfOnB?=
 =?iso-8859-1?Q?kgvs5gvwzLWPLjiDit63gTb/beAZaSaAFcuOE1uxbw1PcFiADcUlewLqQD?=
 =?iso-8859-1?Q?gTX22yUP4n/8f1TrDGDWQFHwFLw3+9ikyY1c9j0Jvuhf3VE3jiD5UJUbj8?=
 =?iso-8859-1?Q?cTbGW1HNpgvwhhSFCfiqb2r3r1tN5tRwFxbvQ931ApjvwbXzll4jYsSTPi?=
 =?iso-8859-1?Q?60NCJpqssxihaU4QSg6Sa4n1IqmWm+z3XQQK89pVsqVLk/WYraQbtreE5s?=
 =?iso-8859-1?Q?eCl4HBT6uRKKnOxe7GdTwHbBIx3rJPS47HoGvcsJILs2tv10SoL+uU8QMx?=
 =?iso-8859-1?Q?dBjsW/7V06JUSgzbaaUm2m3++kA3tUCIZFoVDbtvPqB9/7avXR0IpC7Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a1e2e4-84a8-4af5-e4cd-08dde5c04134
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 23:20:04.6693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JNEkbhi4SdmyDycEvhE6EQ2wc1+ON2wXEazn+mvDKs5jBOFhWVbp+NyfxWdlE3Mjluz5ZZ9ZsJDECuFB0j36il+buxJiXqoB+1Vb4Ja6KY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9548

Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Since eSPI support has been introduced, update the documentation with
> the appropriate description.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V4:
> - introduced this patch
> ---
>  docs/man/xl.cfg.5.pod.in | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 5362fb0e9a..292ab10331 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3072,11 +3072,14 @@ interval of colors (such as "0-4").
>  =3Ditem B<nr_spis=3D"NR_SPIS">
> =20
>  An optional integer parameter specifying the number of SPIs (Shared
> -Peripheral Interrupts) to allocate for the domain. Max is 960 SPIs. If
> -the `nr_spis` parameter is not specified, the value calculated by the to=
olstack
> -will be used for the domain. Otherwise, the value specified by the `nr_s=
pis`
> -parameter will be used. The number of SPIs should match the highest inte=
rrupt
> -ID that will be assigned to the domain.
> +Peripheral Interrupts) to allocate for the domain. Max is 960 for regula=
r SPIs
> +or 5088 for eSPIs (Extended SPIs). The eSPIs includes an additional 1024=
 SPIs

Well, this is awkward and confusing now. You can't allocate 5088 SPIs,
because no GIC does not support this. Number of SPIs is
960 (regular SPIs) + 1024 (eSPIs) =3D 1984.

What you are describing is "max SPI number", but the parameter is called
"nr_spis". If we want to leave things consistent, we either need to
deprecate nr_spis in favor of max_spi_nr, or severely rework nr_spi
logic, so it can have values from 0 to 1984...

Personally, I'd prefer max_spi_nr approach, because it will be less
confusing for a user. I am curios what ARM maintainers think about this.


> +from the eSPI range (4096 to 5119) if the hardware supports extended SPI=
s
> +(GICv3.1+) and CONFIG_GICV3_ESPI is enabled. If the `nr_spis` parameter =
is not
> +specified, the value calculated by the toolstack will be used for the do=
main.
> +Otherwise, the value specified by the `nr_spis` parameter will be used. =
The
> +number of SPIs should match the highest interrupt ID that will be assign=
ed to
> +the domain.
> =20
>  =3Ditem B<trap_unmapped_accesses=3DBOOLEAN>

--=20
WBR, Volodymyr=

