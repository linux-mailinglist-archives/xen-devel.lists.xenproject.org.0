Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC071B317CB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 14:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090085.1447478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upQsS-0003wg-Jt; Fri, 22 Aug 2025 12:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090085.1447478; Fri, 22 Aug 2025 12:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upQsS-0003vE-GI; Fri, 22 Aug 2025 12:28:16 +0000
Received: by outflank-mailman (input) for mailman id 1090085;
 Fri, 22 Aug 2025 12:28:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HljN=3C=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upQsQ-0003v8-Hd
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 12:28:14 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 773231a3-7f53-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 14:28:12 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA6PR03MB10379.eurprd03.prod.outlook.com
 (2603:10a6:102:3cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 12:28:08 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 12:28:08 +0000
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
X-Inumbo-ID: 773231a3-7f53-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMLo619H6ijpew7Y9b7LkpOg8Cltpl6kizSKPP6S3r6B0l0y6m4hLFv3HcjwtfL0/BHXWLNI+oU/HnwGdLywVLGnfbCKMWPQX88nKLRx76qXmpBOrkQ14whEoQlH2xcmOPDYR2BRkGlXiBeE9Sg5gQ+cf29fD1GtStZQJSm/7acerf+StfeMrNpQHjSmv6Z1xy7tfTh49UI8auQ1G3Xpd1fI5rmcx0qRdU2gmUsYicMP9yZ4UnWuftzdDzBMlgWElh1lVfbE++fCTHmBxJm9VuRQvgnqK/0cZHziye4wd5jF9wErs5F5et3T6nUi6EQNm8IwjZIVXUJKzaARJDVCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2wkmUmfW0AfLVRZuI9COp7Uzg+eWyGpSfwnLtnUgEg=;
 b=gU1ku1md5uHjC+vGI50MFy9wmgFO/nX3kj2Uddspn58FD8RY/NEYdaxsK89A1wJIWNlO/r7sxjBYeht2INFv9s15UvzBi6lnVTW+dzKm5YsF8Cjw/MzPapPDI6+kO84PUADBx7UQZVnOjr6Yy8dNtn0cBmYmK6os0CQG3En+Sre5wG2w9m0F6oZGpcI+WD/9Fbk5C+JweJVWc5/b0L5B8okeQ7yy5nKtNlH4JEzJ5vZaYGp9QdMTIM9UMDuDqjyI97RRUr3IyUerpNfhwNyANWvrEgZDygiH8je2Nx/zOQy1KN/YiRluIi/uf16K2VTri3ch8hfQPEuCT7QD8AyFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2wkmUmfW0AfLVRZuI9COp7Uzg+eWyGpSfwnLtnUgEg=;
 b=WSbp9xsnXq4pCxLv1jZd6AqBmTwtFXChHcf43RhvVStbUUpKGuNjolXiNS6YgtGTrmsOHo+fyo9GGY9UG78i+PTSC+l4d3jE0iXUyMhUox9HtOOgr8MnwFa05cKh3U0Cfnny3BE01JqIdie5aFnmEdzWkBixONUYQuT72d7yL8HovXDFPBysOCWLJHqBhRh52ZpUeV2Iu/tGaN+6ecflhoo5/zIeMHpGHsUYp3pTrupkLOITgO15rcI3ODd5xPTbyk/IJHE/R5Bdkx3JQ3gEVPJPHxf3e9KxNXRv445nRlt3cneSF1tJg+I84GODRw4rXGMIPFYKZrcAUx3GXoTtWQ==
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
Date: Fri, 22 Aug 2025 12:28:08 +0000
Message-ID: <87sehjbkx4.fsf@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	<f029f88411e816846d13aaf33d4ef703f95d1bb8.1754568795.git.leonid_komarianskyi@epam.com>
	<87y0rcekyo.fsf@epam.com>	<7360fa14-2c55-4aa8-bbba-e355a47d2928@epam.com>
In-Reply-To: <7360fa14-2c55-4aa8-bbba-e355a47d2928@epam.com> (Leonid
	Komarianskyi's message of "Fri, 22 Aug 2025 07:55:07 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA6PR03MB10379:EE_
x-ms-office365-filtering-correlation-id: d37d5ec7-e18d-42a9-a021-08dde1775a25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?P/pWNSjP0gB4IxeNXgKwimoREHQrbtZ4pLw86fNZeMu5NUcNrCYuEG/6tF?=
 =?iso-8859-1?Q?czDk3dnreetVLc97pZmJRhW88u189TObpDj4wIWwMp6QS/EFR3TtOtPMfK?=
 =?iso-8859-1?Q?NhJdcr+kf7cCs6zaX1LbRHbwNHLeQQCqxu+5Y5qdv0xpg4EILweXNVASRu?=
 =?iso-8859-1?Q?H4X+uRKNmPHhBoufKZK5nTakVsi4O3PhCaviGWXePa7PQty9N9oERgwQ7x?=
 =?iso-8859-1?Q?k2FxLO11OJAcgLQRjkEbxnASECMeLCCzjiq4tXO4BiECzTkmGue8g7z2Y/?=
 =?iso-8859-1?Q?/B/oMBu7oOpghqQD8Xh+9dox4G2Ys15nM/R4jLhb7q9P6FEbMyBgNk5WSR?=
 =?iso-8859-1?Q?TRugqjxH/tzws4pw1XANLwipd5JHI4x3H41TaIXW6qtA/ZX07UXpcRvcss?=
 =?iso-8859-1?Q?J6iFhSQggGxjDPkk8uYo9eBBhodXqm5D8sOpo55zqxx3LOmK6iYslcVd3f?=
 =?iso-8859-1?Q?rqzQWEiAHjakTqPSEDALIvYkMI3N0F7Vr2aUDGs/vk39rpj8QQ65l9Us3c?=
 =?iso-8859-1?Q?H/iL+rVbXljDuBPgdhq/mq/RAhMacDZBfudpMMeG/nbCWac4z4vlaj15lq?=
 =?iso-8859-1?Q?qmkuxPJs3NpXwK4TRDBd+xqqUJs9ZznJkPeysTdRtkWjCiZ5GfyViYMasd?=
 =?iso-8859-1?Q?+u/brjtOP+WGEo3iwasBUH+9TE5OWEXSORZXIs8+ihjTmfPjDvLG/Law7g?=
 =?iso-8859-1?Q?wbvR8YN1WDQo3zNPPEer6lSBX9TJIY8MYwhtWO4iZ0vWoQqXmkTv7Krvx4?=
 =?iso-8859-1?Q?vJdMrg2JV3sL1ttLSBeoXP7bNZqNt7FgCWUfd4UWLx++cj3lC/hf6Lp0b7?=
 =?iso-8859-1?Q?pwz76MDYLB+22m0C84EsEmNSrb5pz7aNmt9UiuxhyfBBRpAUpCaeRJAnZq?=
 =?iso-8859-1?Q?DbmBX6k9HCAC8Eda4oo9EzcVVYleBI9V3x1h7UyaEJygVD/VF9GClgzUpt?=
 =?iso-8859-1?Q?obo8f35+LDGtGP/fdIVb8C6/Y21yIah1kSjYge6csnTbhDm1ZU1QVPX/sr?=
 =?iso-8859-1?Q?biVQGiyLTeOl7s+JxElX3epWZ7srTTnwVxaIxV/7zSxqDkuGSjrsqYCi6p?=
 =?iso-8859-1?Q?zd1FzDggNTFrB7KQulgmpoWq0WsfUaIMDJ/c+EN4VgPRHKYNoto74AKgVL?=
 =?iso-8859-1?Q?KuHTAM8popSnjS5raSJkGpcwkMnUdPHChc110by7W49URA9Cppiquc5jot?=
 =?iso-8859-1?Q?qbY7oWRtsyYRtglnRuniWWCoaR/w8rnr2/XZbafPCsCgCqNM5AoGsGWpBt?=
 =?iso-8859-1?Q?7XFdfrpuJgwY+uPNON2cJId0i9k4aMMVOy8xfMZC5VjOJe6NXsDzqTr6o3?=
 =?iso-8859-1?Q?GUYDFzwc2vbZwXKf5y/YnZdCNLZKQqhPskhw8A7QyiAfrfjFVy03KRZy8h?=
 =?iso-8859-1?Q?XdrAcZyrclEdnyEaCfj3lLFDaRQoWB+nGe94a9DzXp1Iru2GWHDhrHEwhx?=
 =?iso-8859-1?Q?11VfdivTc/YUtZvxguFl9HCBEg5cnFlox3RMFsalQ+sIWVOXRCJC8LbxXs?=
 =?iso-8859-1?Q?3/nFDiOXPHhUKL9AsP/ntXTzzSnhdV+1LyLZ56pOMigA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iYr3yPpXTWDwrBGdbthFE4Q4bGtC2VicmXCagEdvwLITRclP5koFC38W22?=
 =?iso-8859-1?Q?j0Ntlb1PyjVq3xSqNZAWzx32l7zq9WdpwKx/mVvIBe83kgZf1fhHrS5NUO?=
 =?iso-8859-1?Q?rFQxZC/GhlMJ+u+MUOGxKGD2BijaEH1zpIq10AYmcQ0Ti9/HZcxa6ZpozD?=
 =?iso-8859-1?Q?PG9A8q62lROX6S24aNPitT6Qy/BFhZAARvq4P3jDKzsPCiIyRwJdv2hJ8e?=
 =?iso-8859-1?Q?N1JQZyqQSv7FI7BSWvyVl5xGJ+k4X72V2lFc0RZUPwMKX9+kuF/88KB0ml?=
 =?iso-8859-1?Q?lwvoyhkqK4ZMZfFjXFw/AUiwbD0HHEnCwAIAdit462AwOTafCS91YRUveB?=
 =?iso-8859-1?Q?e+1+TeQ7pLCPIuhswKy7tvjty7Vq8LNLZ+mEWjOBFp/qkjBXTzn98ps+T7?=
 =?iso-8859-1?Q?ZZMgYtxMNqWbtp8o1XOvnezzifkl81aN7KRvZY9cfAMsGYOoieCF6LeJ6F?=
 =?iso-8859-1?Q?r9XIHqk/OlOPoeA6D9X6/nMk839sJuLeL83JnQ0uNaiQsmO+0gnI04BpNl?=
 =?iso-8859-1?Q?4plogOndJa6T0Mz1Ewk2Da0vvyYr5WchqXiGvn0qLpeUYhhD46dYa5bWvv?=
 =?iso-8859-1?Q?tI8InzN+do7KsE69ZkfJx3uLLgoLGWjEPDvygQZ+37nQwvVfvRy28WaDAy?=
 =?iso-8859-1?Q?Cp2/tAtfvvNKpstPky0/aVZNw//5DgF9lMMyIMiaj/sfaGNKXMKA/sgobd?=
 =?iso-8859-1?Q?38sNfvQSSUQvhbwKR16XonV6wLg/ft2uEjoPyA5HtRg2w4h9I/nu46DYDI?=
 =?iso-8859-1?Q?AfIX0M3Nefj6afglItIwOHlmLZFAkwtqhc47QNbeC8opsyd5J1OuTrANmO?=
 =?iso-8859-1?Q?dYKOBCKUAtIPJiNjlVd/5kFP0jF+R2MGEEEjoR9KAmxseQDSFdJvHuaqV6?=
 =?iso-8859-1?Q?F5wTpp/HQCNdkyKxDryoO347GYm/sIFoV6A5IAztATJrvhLIe/vb0R+xZ1?=
 =?iso-8859-1?Q?Exdp+Z7XYBTJm28YLz3Hx0eyt/ZmydO85gDuRbtGoq1joKmE3Txg/HLsaG?=
 =?iso-8859-1?Q?TUhSukwsXmSEaToUSMFwxYhBFoAhxrrUzDXr8h/NQBhSUTHg/M6GAvswp5?=
 =?iso-8859-1?Q?TM9npgc4pjIS2rNcGC7s4P7j92bncJqzb3Fpk17l8c/aH93syfE31mdy6w?=
 =?iso-8859-1?Q?cmQj98Irbyqvuzf50riTecvADtxWj++UWTC9yHLt/NNHrRD8TXJ8/w5wJs?=
 =?iso-8859-1?Q?lXF5HpwodpjFc5kVg4LkzvNIel9RRly3BQ7ZgmzjilIXlfpROHwRrEU4lf?=
 =?iso-8859-1?Q?etUn7i9fOBqbxcYYTa6EBfiBeBWYYQOCg8uXP00LO5UpjOTKZukCD+d80o?=
 =?iso-8859-1?Q?L1QnQtyb8jGhipAF9U0Lu4QV67xj1Aq/r6L/zR3GTMkxjSLGFZn9ug7XBm?=
 =?iso-8859-1?Q?VyAt+f7ClZdoXxyVOxq+5bSRQWoRaLgRIJDuuxKshfInoooLEDX50VgMZu?=
 =?iso-8859-1?Q?rU6Rc/6rovdJryCamkdmqG9dA1LBNMwkfKebcWxVuUfjsKskG7xrVGVUmm?=
 =?iso-8859-1?Q?oNQH+i0cLe9m8jxduorw8V/uh+eZ9bT5p1r/Zjao29E/5rK0aWrztnGTDS?=
 =?iso-8859-1?Q?FAbVH3BvNh/VBR1IMnXXPjE0bxdlcIL1LJy/vjpOMUUT/d0QHizyhNGfs6?=
 =?iso-8859-1?Q?A0hABpswxffZemkIM3rk8f4d+AztFD3Lu+c/JLeZ+WWybLaDEmOyk72g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37d5ec7-e18d-42a9-a021-08dde1775a25
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 12:28:08.5714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1rRt9NPj+icGvgvrzx6p82w5VQe8WXXnh47T9yIicBb5VLhg/NtOOB5bRAUu6X/JJM4aYRnrTt8hu/eU0Vr9GeLLkec4i2vbnZ9RFray4p0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10379


Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Hi Volodymyr,
>
> Thank you for you comment.
>
> On 21.08.25 18:46, Volodymyr Babchuk wrote:
>>=20
>> Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:
>>=20
>>> Introduced two new helper functions for vGIC: vgic_is_valid_irq and
>>> vgic_is_shared_irq. The functions are similar to the newly introduced
>>> gic_is_valid_irq and gic_is_shared_irq, but they verify whether a vIRQ
>>> is available for a specific domain, while GIC-specific functions
>>> validate INTIDs for the real GIC hardware. For example, the GIC may
>>> support all 992 SPI lines, but the domain may use only some part of the=
m
>>> (e.g., 640), depending on the highest IRQ number defined in the domain
>>> configuration. Therefore, for vGIC-related code and checks, the
>>> appropriate functions should be used. Also, updated the appropriate
>>> checks to use these new helper functions.
>>>
>>> The purpose of introducing new helper functions for vGIC is essentially
>>> the same as for GIC: to avoid potential confusion with GIC-related
>>> checks and to consolidate similar code into separate functions, which
>>> can be more easily extended by additional conditions, e.g., when
>>> implementing extended SPI interrupts.
>>>
>>> Only the validation change in vgic_inject_irq may affect existing
>>> functionality, as it currently checks whether the vIRQ is less than or
>>> equal to vgic_num_irqs. Since IRQ indexes start from 0 (where 32 is the
>>> first SPI), the check should behave consistently with similar logic in
>>> other places and should check if the vIRQ number is less than
>>> vgic_num_irqs. The remaining changes, which replace open-coded checks
>>> with the use of these new helper functions, do not introduce any
>>> functional changes, as the helper functions follow the current vIRQ
>>> index verification logic.
>>>
>>> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>>>
>>> ---
>>> Changes in V2:
>>> - introduced this patch
>>> ---
>>>   xen/arch/arm/gic.c              |  3 +--
>>>   xen/arch/arm/include/asm/vgic.h |  7 +++++++
>>>   xen/arch/arm/irq.c              |  4 ++--
>>>   xen/arch/arm/vgic.c             | 10 ++++++++--
>>>   4 files changed, 18 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>> index eb0346a898..47fccf21d8 100644
>>> --- a/xen/arch/arm/gic.c
>>> +++ b/xen/arch/arm/gic.c
>>> @@ -133,8 +133,7 @@ int gic_route_irq_to_guest(struct domain *d, unsign=
ed int virq,
>>>  =20
>>>       ASSERT(spin_is_locked(&desc->lock));
>>>       /* Caller has already checked that the IRQ is an SPI */
>>> -    ASSERT(virq >=3D 32);
>>> -    ASSERT(virq < vgic_num_irqs(d));
>>> +    ASSERT(vgic_is_shared_irq(d, virq));
>>>       ASSERT(!is_lpi(virq));
>>>  =20
>>>       ret =3D vgic_connect_hw_irq(d, NULL, virq, desc, true);
>>> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm=
/vgic.h
>>> index 35c0c6a8b0..45201f4ca5 100644
>>> --- a/xen/arch/arm/include/asm/vgic.h
>>> +++ b/xen/arch/arm/include/asm/vgic.h
>>> @@ -335,6 +335,13 @@ extern void vgic_check_inflight_irqs_pending(struc=
t vcpu *v,
>>>   /* Default number of vGIC SPIs. 32 are substracted to cover local IRQ=
s. */
>>>   #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32=
)
>>>  =20
>>> +extern bool vgic_is_valid_irq(struct domain *d, unsigned int virq);
>>> +
>>> +static inline bool vgic_is_shared_irq(struct domain *d, unsigned int v=
irq)
>>> +{
>>> +    return (virq >=3D NR_LOCAL_IRQS && vgic_is_valid_irq(d, virq));
>>> +}
>>> +
>>>   /*
>>>    * Allocate a guest VIRQ
>>>    *  - spi =3D=3D 0 =3D> allocate a PPI. It will be the same on every =
vCPU
>>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>>> index 12c70d02cc..50e57aaea7 100644
>>> --- a/xen/arch/arm/irq.c
>>> +++ b/xen/arch/arm/irq.c
>>> @@ -442,7 +442,7 @@ int route_irq_to_guest(struct domain *d, unsigned i=
nt virq,
>>>       unsigned long flags;
>>>       int retval =3D 0;
>>>  =20
>>> -    if ( virq >=3D vgic_num_irqs(d) )
>>> +    if ( !vgic_is_valid_irq(d, virq) )
>>>       {
>>>           printk(XENLOG_G_ERR
>>>                  "the vIRQ number %u is too high for domain %u (max =3D=
 %u)\n",
>>> @@ -560,7 +560,7 @@ int release_guest_irq(struct domain *d, unsigned in=
t virq)
>>>       int ret;
>>>  =20
>>>       /* Only SPIs are supported */
>>> -    if ( virq < NR_LOCAL_IRQS || virq >=3D vgic_num_irqs(d) )
>>> +    if ( !vgic_is_shared_irq(d, virq) )
>>>           return -EINVAL;
>>>  =20
>>>       desc =3D vgic_get_hw_irq_desc(d, NULL, virq);
>>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>>> index c563ba93af..48fbaf56fb 100644
>>> --- a/xen/arch/arm/vgic.c
>>> +++ b/xen/arch/arm/vgic.c
>>> @@ -24,6 +24,12 @@
>>>   #include <asm/gic.h>
>>>   #include <asm/vgic.h>
>>>  =20
>>> +
>>> +bool vgic_is_valid_irq(struct domain *d, unsigned int virq)
>>=20
>> I have the same comment as for the previous patch. This function
>> completely ignores LPIs presence, while you can't argue that LPIs as
>> valid. Again, function callers are expecting this behavior, so this is
>> fine, but function name should better reflect its behavior.
>>=20
>> [...]
>>=20
>
> Would it be okay to rename these functions as proposed in the previous=20
> patch discussion:
> vgic_is_valid_irq -> vgic_is_valid_line
> vgic_is_shared_irq -> vgic_is_spi?
>
> Or, in the case of vgic, is it not a good idea to use the "line" suffix=20
> because vgic does not have physical interrupt lines? Would it be better=20
> to rename it to vgic_is_valid_non_lpi instead?

I think it is better to follow the pGIC naming convention. While there
is no physical IRQ lines in vGIC, it emulates real GIC anyways.

--=20
WBR, Volodymyr=

