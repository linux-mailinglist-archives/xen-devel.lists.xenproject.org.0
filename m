Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA27FB3C371
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 21:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102070.1454846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5Ch-0007Pp-4N; Fri, 29 Aug 2025 19:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102070.1454846; Fri, 29 Aug 2025 19:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us5Ch-0007OD-0t; Fri, 29 Aug 2025 19:56:07 +0000
Received: by outflank-mailman (input) for mailman id 1102070;
 Fri, 29 Aug 2025 19:56:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sr3h=3J=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1us5Cg-0007O7-AX
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 19:56:06 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30b10dbe-8512-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 21:56:02 +0200 (CEST)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by AS2PR03MB9514.eurprd03.prod.outlook.com (2603:10a6:20b:59a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 19:55:59 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%7]) with mapi id 15.20.9073.021; Fri, 29 Aug 2025
 19:55:59 +0000
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
X-Inumbo-ID: 30b10dbe-8512-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hwy1AjBLlJaSxqEYM3wctQ56w8Ksirj0gZLGFoXBVA+ulWpufjufoEAxKbXh7OEpfaFJokFQ3Q28OFrIW5FiiSRfkkqjUOAASIOZiyP0duOVkFj0XwXTvvlBzquzJhew/lP9NeIzUObBMQX5l8XgTFQMtSGnqWqtJ0jEC16+l0ci15TRttNTJxrN1glWqBvlLqli9IIi1n2H72hekdJzXXQsKrlvsu8UDeTW6Qrfl4MPipY0yueAJpQnrozCu9pefNT9D3cy7GkpNHtnikNj/O33nHa7NX0bOcBuQ5qYaHTa63ywzw+XRNp3QpdweTGMr64GTnoJO1UTlvnjmfOEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+aJkaQtBF7xTHqfbttSOfGCUtd/K6QyOtEeVkBBMMM=;
 b=awpUIdNOAvZ7GAznOwb8YjhipnFKjLA8/3SRRw+RLJagL3+FcpNFsoCVqt4w95jcs7yIrH4GYiTZRJxQzXzd9KLoCh4v+O+Ton5+EEqmvxSCt5yYCWxIzgwx1DM+Z5BKlAbfdj2i9fElDz1Z1OYh9CRf4ee3S95A9QRWDFhA6Yr63xqJYMYS8MNP5AA2LLfx75KmNOsDq+qZEI5jMMsy02B7xfqYVUrvbOJkRKyQkYRddmFGwcThjLR0KcrimjVfTQEUHSr6NfsZhA7JXah+p9sPDhe6z0HJCjxUuKjt+NXIvcSBcPpPSyIeDIhUsFXoNLdXpnVVCKKAQAKv3CA5Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+aJkaQtBF7xTHqfbttSOfGCUtd/K6QyOtEeVkBBMMM=;
 b=Pfk+JE4+ipW0adzt3msAC/Om8wku5XFDkCGB+2QcFJZIA5zFE80ydSrfEMl9jaY11b5gyvt3b6GKxA+vu3YBIi0ZvyBFsWRQjDdgydI63hCZmHiaIiR8QKN5SuScyDSKnQpeBxlQprXzvrIKbI96tyxXRekA8VB2eRPndpE28xCfBAtWLrEY2XyctX2/k8zxsHRG6y/SnU799yuQ2a/eTu/wpegmkN54VHIE/4rWx1vTGbf3GCpEAZrwrTxvlCPvRuICG8eZQuYFGzLz8GuIqeccB6cCVwbRk+1wpeQdWA4Yrx1VLHCbDNQI0Ns5tIyqkrFeIOJUcgjsesWO0liIfw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Topic: [PATCH v5 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcGP7eXuLLXrvHTUaZmxhTVnJkUA==
Date: Fri, 29 Aug 2025 19:55:59 +0000
Message-ID: <87iki5yka9.fsf@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
	<edf50a95d335000cea2748301882f1bbea88d676.1756481577.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <edf50a95d335000cea2748301882f1bbea88d676.1756481577.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Fri, 29 Aug 2025 16:06:22 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|AS2PR03MB9514:EE_
x-ms-office365-filtering-correlation-id: bf10da3f-f797-457e-a07c-08dde736131c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NHGQ243+L4ekm8jLuCSGIuNUrz8um8LtfIJ+R9//uvDVqST56stVpb+kJa?=
 =?iso-8859-1?Q?nVvDRnPdQJ5aHeUbQpi3dbckHdDs8eSti7w6lTTJPMBF0Uh0C95TPXFUIZ?=
 =?iso-8859-1?Q?7Z0hdf+bekRO5JJuTpejjFm9GGettLd2QpNzaUKamlMtS9NEvzqX/gMOmM?=
 =?iso-8859-1?Q?PtbCuKR5vZcpfYpDKO1LoOhf5ncqFPtMun3rFpTquR5CXZJ6AXEKD+FEHQ?=
 =?iso-8859-1?Q?/Y/RzDjUNKL3At0SLG4tq2RuIhA1SKUGhCwsMICz9XPUv9RmaZe06049nI?=
 =?iso-8859-1?Q?UnvaTzDj2sBSGtP49U2J94pySn9VdBGtJVWZulPmYeXZev9LSqLXA1rKR0?=
 =?iso-8859-1?Q?6oGHpjKjjQn0ChtWbGymihc0uF5NlzYhSetQz0RYRy0KlPlnYYPu4KQzU7?=
 =?iso-8859-1?Q?jeJ/OmcyKgUmpr+uDUMaDaeuJ9N1KdvDodJF7rv+wN4p0BUlj2TCJOFYcY?=
 =?iso-8859-1?Q?xOfh8K4l4+00MDCaZOwMkXvIFO+Rx9Vd9q1QYHD/RHm1C9WBDw+LnY782B?=
 =?iso-8859-1?Q?z9TKPjY54H8jMkgzjozd92f6a/qftY04EFQFrPQI2saNVNP0B8zdPECIOX?=
 =?iso-8859-1?Q?kUQkpOS5ppuOVXHAHLRPsVyLVfn66izwGU7iZTohZ+yG0IPYF55/sj8lY8?=
 =?iso-8859-1?Q?AR92ufkA9h0+TOoKneSyaxk0MsxE3VUEnnbrF9YPbMXXyDztDJ/CFw70gY?=
 =?iso-8859-1?Q?zZ8vY2Qv1ADt2MzggNG7NQ0QlWfYyxBwF7G4oSS+bYcYkBUBRzxYHszuAQ?=
 =?iso-8859-1?Q?oVjgZ2QLfyyhsg+b39sBvfnU4wEX2dadpXcJnexEQrrA7+XI+rLgeWuy48?=
 =?iso-8859-1?Q?HBXK2X8BBe6vHiVEYDD8gRRnoPQkWyhf5XoYBjZEMKV0+zP+WV4kO2ux7p?=
 =?iso-8859-1?Q?i/uoUZOKgvnJlEQf8gKorOohOmlANhQ+LuDQOE85Eqt7xo+gEdQALWzrGs?=
 =?iso-8859-1?Q?1EdxH4W41EmtqYhWm8h4leZiDkaG91C1i29rAGVuYl4UpBQHk/zKLm9wVa?=
 =?iso-8859-1?Q?03uDWW5mjKACFoP4glVeSnz/M/chp1+JvFEIqOATJ396XgwCeSD4afdihR?=
 =?iso-8859-1?Q?rQpur+EheKsL69TTqtW7WPnKFZMGyhl1THiCUyB2nZ8MHasSm7SOW/067s?=
 =?iso-8859-1?Q?/g0907AEj6cq+shQuSiIosZi1+4znjR/RaTqYi0fduwCO0qQKezp22LshH?=
 =?iso-8859-1?Q?elarHzhKtvWT8Mgij16iZNW+HCd3ha3ZCf2yfh7n/lHkBrQJiew2KzOMI0?=
 =?iso-8859-1?Q?FMe3lNCEXgUUEbJFQclAVttztCeC1OFIleOMRmRXfnCk53mFqvalUEjGOv?=
 =?iso-8859-1?Q?mElIMyos8BpDzdPaPxy7T6790mOxWl33mG9mPQYETj4xIYSbXbL4W1ntK3?=
 =?iso-8859-1?Q?qC6NYCks6tP8AGln4BEKC6G+1kEC2VEOFmL4EhpOPkWdeX1QY1wExp78wC?=
 =?iso-8859-1?Q?ncPkPt0X0rS3usVVbcsE27Qm8iFrHaOSYcE4mN1JPD8nqFszq5JSDuXGWm?=
 =?iso-8859-1?Q?mj3eONNAUrj5Ty08gEGn1Mh43PkldkG3O6Ecwxo1Jsgg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cR/retlB6qphlwR4mDYWLMsHpIkHpLTIchA39Z+sqvw3vDrI6y/v07qhSi?=
 =?iso-8859-1?Q?2PrCbfN7vYB9jF4PflR5IMPfdJEWHvuScJd4dPwS+Sw70AO7z9i/U4JMSC?=
 =?iso-8859-1?Q?eFRCsDhQ6dGbPjwOiT6gJ3L+weskx/3VVtRm1mcE9Lp1N15KEoCDaOlgpa?=
 =?iso-8859-1?Q?+p/NlW60t5UvaWTO+7hi14ngeYMv+y8vK/i0eVybDukfp5lkqpXnwiEq2K?=
 =?iso-8859-1?Q?BitL1wzZD43TCAApDjX2uK5JCWw5htBNiNcFOKmd1a/LPGvs1t5q2h3trc?=
 =?iso-8859-1?Q?F+nicKOg2NEVHz4Y7MAObv6dnS7+H6lx41U2NeD6L2F8ANRQdg38xMuU9L?=
 =?iso-8859-1?Q?cXL5qwgSMy+Fke+D6ncZpaXrPRF+gxtvFNGf2RRdyaoGy2bmXDYRSgxyUY?=
 =?iso-8859-1?Q?sY5peGeTrqV2Lzf480XejdP3a8V47NZXZOI3OQMEQyd+lEawXU9qMWyRIr?=
 =?iso-8859-1?Q?0tOQgUK9MaDcSbTiSGnZSvZTbnE9VOJvP2A2NXGDAyHbehBISTMW/4CbVC?=
 =?iso-8859-1?Q?bGOqWvxWAeixKVvM4Y7nOPs+q71/E/+OjTVqgtCZjpuCMm0ya4O+DyvwMM?=
 =?iso-8859-1?Q?6+AvxRri5G0uh/F32V1c4Doxo3pgCPtzqlOCdjO3Yt99BWvTl+p9wa4OCQ?=
 =?iso-8859-1?Q?ufEmfOOGfUfQhSV4XD9iDXU+sirvRH/f2HLlId1QG5tr7B5i3KGgHMbXWY?=
 =?iso-8859-1?Q?FmPG9+iG9oh37/3KayOdr/gke489wJ9CePzYal9afHsckrJCPbbK5k4yqB?=
 =?iso-8859-1?Q?W+ZdodAPWRnYOycsMRYyWBxAKfR6GnCMe/TQnAlY4dZS0A3uNAgeU8U/4J?=
 =?iso-8859-1?Q?Hf/JHM7He6JxGCkPMze7Oy8Z+VHVM0GSG5jJ8BlwrZk46X5WVdxSpQIcvx?=
 =?iso-8859-1?Q?3Fz9FrRdZZiMyVecKGcGRp4Z6TLeERGq6XRC5fY+r0ihdupFuJeDc16Lqx?=
 =?iso-8859-1?Q?TJ3Ib8kvyVEu/EWTz8TAq0qBhuhIN5+5nggJNGOYQAEGi7jMCltY+Q6b7i?=
 =?iso-8859-1?Q?dtx4PJivNOfdNVjy7xzNxY+8d1LDFopG+mK+7A8Wa9C+eYJvAXp7Fcr6ZY?=
 =?iso-8859-1?Q?+wGunwcXgzzegKGzYllDWyz4xiEcLdYAo0YEISZBQsAT7IBfK7nEp+ua93?=
 =?iso-8859-1?Q?Oja25jvFqU7ihcN4Fxjr2nJ5W2P4/qEtOMiHYTcwteHUP5nCcOFNzg/y6j?=
 =?iso-8859-1?Q?ibtSFy3Io4Yyd167YMNiTiLdOdcvLvzXMnyWOorC+JeORSaA3UoIBvxDV3?=
 =?iso-8859-1?Q?q74Xqj40iKVQ8aaFS5vofYuZA73jxZp9S4nLwU+EwII6BiyBqWo8/aHpw4?=
 =?iso-8859-1?Q?ps2V+BnzvE2ixS7RGznFAyu9MGqDyZjzYcM/jwGCDsgp6Rk6QK5af0aw6U?=
 =?iso-8859-1?Q?AEAGR5pkK6eacn+xxntFIfBUXVOdJUnpYjpEjp4w51EwrGzEVXCr2FdDua?=
 =?iso-8859-1?Q?WwfunbXkTGxmAmIbp4dVy2IQvjFnOLQn7sGAI941AD4Pq1MF44lDiemnIN?=
 =?iso-8859-1?Q?bt6vlWhuaGiXiyJg0/qB9ekwD7xLRLEp6Ht7nxF68FzppN50lBV/Y2FQqP?=
 =?iso-8859-1?Q?f0hTuQvA8xDXW/tPDdLKUm69j7g1QaUbkg84TrnFX+Tn6pa1rl81nbMOxk?=
 =?iso-8859-1?Q?HmNXywGJPAvjIEolI+DWZgGNwoxIS9a05iX/74Eoix9TGPaXndRVTDbA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf10da3f-f797-457e-a07c-08dde736131c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 19:55:59.1324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9g/UgYPfnfmW2CIcm/sFWBIsQY+tKHnOuPxf1zV53xsYmK0lE7h4yXhvWqmViRcd6ahCgkS5yQoKg21aaO83LVM/nLlcxeSg4JKV2FD3qy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9514


Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Introduced appropriate register definitions, helper macros,
> and initialization of required GICv3.1 distributor registers
> to support eSPI. This type of interrupt is handled in the
> same way as regular SPI interrupts, with the following
> differences:
>
> 1) eSPIs can have up to 1024 interrupts, starting from the
> beginning of the range, whereas regular SPIs use INTIDs from
> 32 to 1019, totaling 988 interrupts;
> 2) eSPIs start at INTID 4096, necessitating additional interrupt
> index conversion during register operations.
>
> In case if appropriate config is disabled, or GIC HW doesn't
> support eSPI, the existing functionality will remain the same.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V5:
> - fixed minor nits, no functional changes: changed u32 to uint32_t and
>   added a comment noting that the configuration for eSPIs is the same as
>   for regular SPIs
> - removed ifdefs for eSPI-specific offsets to reduce the number of
>   ifdefs and code duplication in further changes
> - removed reviewed-by as moving offset from ifdefs requires additional
>   confirmation from reviewers
>
> Changes in V4:
> - added offsets for GICD_IGRPMODRnE and GICD_NSACRnE that are required
>   for vGIC emulation
> - added a log banner with eSPI information, similar to the one for
>   regular SPI
> - added newline after ifdef and before gic_is_valid_line
> - added reviewed-by from Volodymyr Babchuk
>
> Changes in V3:
> - add __init attribute to gicv3_dist_espi_common_init
> - change open-codded eSPI register initialization to the appropriate
>   gen-mask macro
> - fixed formatting for lines with more than 80 symbols
> - introduced gicv3_dist_espi_init_aff to be able to use stubs in case of
>   CONFIG_GICV3_ESPI disabled
> - renamed parameter in the GICD_TYPER_ESPI_RANGE macro to espi_range
>   (name was taken from GIC specification) to avoid confusion
> - changed type for i variable to unsigned int since it cannot be
>   negative
>
> Changes in V2:
> - move gic_number_espis function from
>   [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
>   to use it in the newly introduced gic_is_valid_espi
> - add gic_is_valid_espi which checks if IRQ number is in supported
>   by HW eSPI range
> - update gic_is_valid_irq conditions to allow operations with eSPIs
> ---
>  xen/arch/arm/gic-v3.c                  | 83 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/gic.h         | 22 +++++++
>  xen/arch/arm/include/asm/gic_v3_defs.h | 38 ++++++++++++
>  3 files changed, 143 insertions(+)
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 29b7f68cba..4a7ce12f26 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_d=
esc *irqd, u32 offset)
>          default:
>              break;
>          }
> +#ifdef CONFIG_GICV3_ESPI
> +    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
> +    {
> +        uint32_t irq_index =3D ESPI_INTID2IDX(irqd->irq);
> +
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
> +        case GICD_ICENABLER:
> +            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
> +        case GICD_ISPENDR:
> +            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
> +        case GICD_ICPENDR:
> +            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
> +        case GICD_ISACTIVER:
> +            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
> +        case GICD_ICACTIVER:
> +            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
> +        case GICD_ICFGR:
> +            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
> +        case GICD_IROUTER:
> +            return (GICD + GICD_IROUTERnE + irq_index * 8);
> +        case GICD_IPRIORITYR:
> +            return (GICD + GICD_IPRIORITYRnE + irq_index);
> +        default:
> +            break;
> +        }
> +    }
> +#endif
>      default:
>          break;
>      }
> @@ -655,6 +685,55 @@ static void gicv3_set_irq_priority(struct irq_desc *=
desc,
>      spin_unlock(&gicv3.lock);
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +unsigned int gic_number_espis(void)
> +{
> +    return gic_hw_ops->info->nr_espi;
> +}
> +
> +static void __init gicv3_dist_espi_common_init(uint32_t type)
> +{
> +    unsigned int espi_nr, i;
> +
> +    espi_nr =3D min(1024U, GICD_TYPER_ESPIS_NUM(type));
> +    gicv3_info.nr_espi =3D espi_nr;
> +    /* The GIC HW doesn't support eSPI, so we can leave from here */
> +    if ( gicv3_info.nr_espi =3D=3D 0 )
> +        return;
> +
> +    printk("GICv3: %d eSPI lines\n", gicv3_info.nr_espi);
> +
> +    /* The configuration for eSPIs is similar to that for regular SPIs *=
/
> +    for ( i =3D 0; i < espi_nr; i +=3D 16 )
> +        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 4 )
> +        writel_relaxed(GIC_PRI_IRQ_ALL,
> +                       GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 32 )
> +    {
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLERnE + (i / 32=
) * 4);
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVERnE + (i / 32=
) * 4);
> +    }
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 32 )
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) =
* 4);
> +}
> +
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
> +{
> +    unsigned int i;
> +
> +    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * =
8);
> +}
> +#else
> +static void __init gicv3_dist_espi_common_init(uint32_t type) { }
> +
> +static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
> +#endif
> +
>  static void __init gicv3_dist_init(void)
>  {
>      uint32_t type;
> @@ -700,6 +779,8 @@ static void __init gicv3_dist_init(void)
>      for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i +=3D 32 )
>          writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * =
4);
> =20
> +    gicv3_dist_espi_common_init(type);
> +
>      gicv3_dist_wait_for_rwp();
> =20
>      /* Turn on the distributor */
> @@ -713,6 +794,8 @@ static void __init gicv3_dist_init(void)
> =20
>      for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
>          writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8)=
;
> +
> +    gicv3_dist_espi_init_aff(affinity);
>  }
> =20
>  static int gicv3_enable_redist(void)
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gi=
c.h
> index 3fcee42675..1e747dcd99 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -306,8 +306,26 @@ extern void gic_dump_vgic_info(struct vcpu *v);
> =20
>  /* Number of interrupt lines */
>  extern unsigned int gic_number_lines(void);
> +#ifdef CONFIG_GICV3_ESPI
> +extern unsigned int gic_number_espis(void);
> +
> +static inline bool gic_is_valid_espi(unsigned int irq)
> +{
> +    return (irq >=3D ESPI_BASE_INTID &&
> +            irq < ESPI_IDX2INTID(gic_number_espis()));

You don't need external () here.

> +}
> +#else
> +static inline bool gic_is_valid_espi(unsigned int irq)
> +{
> +    return false;
> +}
> +#endif
> +
>  static inline bool gic_is_valid_line(unsigned int irq)
>  {
> +    if ( gic_is_valid_espi(irq) )
> +        return true;
> +
>      return irq < gic_number_lines();
>  }

As you are going to rework this patch anyways, my I ask to rewrite this
function in the following way?

static inline bool gic_is_valid_line(unsigned int irq)
{
     return irq < gic_number_lines() || gic_is_valid_espi(irq);
}

My justification is that (irq < gic_number_lines()) case is more likely,
so it is better to evaluate it first, only then check for eSPIs.

I am sorry, I should asked it earlier, but only after removing #ifdef I
saw that this part could be more optimal.

> =20
> @@ -325,6 +343,10 @@ struct gic_info {
>      enum gic_version hw_version;
>      /* Number of GIC lines supported */
>      unsigned int nr_lines;
> +#ifdef CONFIG_GICV3_ESPI
> +    /* Number of GIC eSPI supported */
> +    unsigned int nr_espi;
> +#endif
>      /* Number of LR registers */
>      uint8_t nr_lrs;
>      /* Maintenance irq number */
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/includ=
e/asm/gic_v3_defs.h
> index 2af093e774..3370b4cd52 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -37,6 +37,44 @@
>  #define GICD_IROUTER1019             (0x7FD8)
>  #define GICD_PIDR2                   (0xFFE8)
> =20
> +/* Additional registers for GICv3.1 */
> +#define GICD_IGROUPRnE               (0x1000)
> +#define GICD_IGROUPRnEN              (0x107C)
> +#define GICD_ISENABLERnE             (0x1200)
> +#define GICD_ISENABLERnEN            (0x127C)
> +#define GICD_ICENABLERnE             (0x1400)
> +#define GICD_ICENABLERnEN            (0x147C)
> +#define GICD_ISPENDRnE               (0x1600)
> +#define GICD_ISPENDRnEN              (0x167C)
> +#define GICD_ICPENDRnE               (0x1800)
> +#define GICD_ICPENDRnEN              (0x187C)
> +#define GICD_ISACTIVERnE             (0x1A00)
> +#define GICD_ISACTIVERnEN            (0x1A7C)
> +#define GICD_ICACTIVERnE             (0x1C00)
> +#define GICD_ICACTIVERnEN            (0x1C7C)
> +#define GICD_IPRIORITYRnE            (0x2000)
> +#define GICD_IPRIORITYRnEN           (0x23FC)
> +#define GICD_ICFGRnE                 (0x3000)
> +#define GICD_ICFGRnEN                (0x30FC)
> +#define GICD_IGRPMODRnE              (0x3400)
> +#define GICD_IGRPMODRnEN             (0x347C)
> +#define GICD_NSACRnE                 (0x3600)
> +#define GICD_NSACRnEN                (0x36FC)
> +#define GICD_IROUTERnE               (0x8000)
> +#define GICD_IROUTERnEN              (0x9FFC)
> +
> +#ifdef CONFIG_GICV3_ESPI
> +#define GICD_TYPER_ESPI_SHIFT        8
> +#define GICD_TYPER_ESPI_RANGE_SHIFT  27
> +#define GICD_TYPER_ESPI_RANGE_MASK   (0x1F)
> +#define GICD_TYPER_ESPI              (1U << GICD_TYPER_ESPI_SHIFT)
> +#define GICD_TYPER_ESPI_RANGE(espi_range) ((((espi_range) & \
> +        GICD_TYPER_ESPI_RANGE_MASK) + 1) * 32)
> +#define GICD_TYPER_ESPIS_NUM(typer)    \
> +        (((typer) & GICD_TYPER_ESPI) ? \
> +        GICD_TYPER_ESPI_RANGE((typer) >> GICD_TYPER_ESPI_RANGE_SHIFT) : =
0)
> +#endif
> +
>  /* Common between GICD_PIDR2 and GICR_PIDR2 */
>  #define GIC_PIDR2_ARCH_MASK         (0xf0)
>  #define GIC_PIDR2_ARCH_GICv3        (0x30)

--=20
WBR, Volodymyr=

