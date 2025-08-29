Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BECCB3C044
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:06:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101664.1454695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cf-0000lF-Ol; Fri, 29 Aug 2025 16:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101664.1454695; Fri, 29 Aug 2025 16:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cf-0000hQ-Ia; Fri, 29 Aug 2025 16:06:41 +0000
Received: by outflank-mailman (input) for mailman id 1101664;
 Fri, 29 Aug 2025 16:06:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1cd-0006AC-IK
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:39 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 247dd5d5-84f2-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 18:06:38 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by VI1PR03MB6317.eurprd03.prod.outlook.com (2603:10a6:800:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.26; Fri, 29 Aug
 2025 16:06:35 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:33 +0000
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
X-Inumbo-ID: 247dd5d5-84f2-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrVmbo0R6uihDUoHCUFwE8/JqQgG0m+bsou6YbicHCbTW8FUbckNDlSjFPKEyI6vBnjsvKPI2xECkPNz62UcTzH6GVyRaD/mUF/uPZHzgZb8yjcOcBG3bN7GAXrcQt622umtNmry4xqFVTKSqe/HcKUS12i++7enPLQ8LhNSe9p4X3J0BPFEDyMFvm5PcZU9ppDSPJ2gH3TIEbd+2bSjzXhbVzWLTkxoFFX31s51bndv5FWRxVcf5yXtM46ocQWwWWvJx0MY9YKcUew1hvR60xAe5M7q9tVQezxyNvl96UcmTV4DA2hQeQAJEwxfhDTaRj/JL+K/tBwnvKJW+8vlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcLamhaMGRuLic7G2+8q7rQFj8uWCO1JFGbxrmGBljk=;
 b=oVgYZtMNJITWKOdu5QjEbWyEZXnicgKdE5V22A5q4hhsRcROTC6/mftxAa3tB9WmWX7bjSBCSRUEANQ7B9GpgyWNzBq8Hgy0Kg8+E53cSmzInhezReeoDXcIN8pC6E30tdaHIl2+DteqFNYpQGZsRFyOdO1RWy4iiR/v/O8lIk1cpJeVx+KitYjhy0Mwg1fRdWw9DTcpMNRi15/epo4IV5ojjvYTBCrkjYGQsuzsMRK6BXLkfAoZ1wLKwstPEx3QkFwt20bgHMtoCVKqmGbZl7nqaUWQQ8t1tqJjAS/SbRoEhlb6afnYtaKzBAhXReP2vXIl0hWes2qlkE/MCS7hqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcLamhaMGRuLic7G2+8q7rQFj8uWCO1JFGbxrmGBljk=;
 b=dGtiqmdNry0O3s6iB6L/K4JJR0fLQDgwa4vfmudjiOXczWN+DMSg82haCmtXcEDDobbL0wpZx5Ia5rx0541uRvYYNRP8peIrjeLT3Fj5oWHKEZXE3BMY25FdRdiivISUWDsxFuyRB/r5EbLwr7VGRzgxg+XYkumcGf7WkQB5IoCLtHrim3bjmRScKDPGidyt2wHlorcOpIYqoYopkBfdYGRMxSW5E/6Ukg1LvBH2lFDAQ9YU2yi6d7bB8Yjf4MaZhPlHMycejWR0IIxLTa8z32vO0DxssEVXt/yN7sGqUgaKzupqjOCGfu3xh+Npq5sc7q37fekop2DOu94lYALojQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH v5 09/12] xen/arm: domain_build/dom0less-build: adjust domains
 config to support eSPIs
Thread-Topic: [PATCH v5 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Index: AQHcGP7ji/JPLIO80UCW93TQMdVywQ==
Date: Fri, 29 Aug 2025 16:06:33 +0000
Message-ID:
 <bd60d55fa8ffe081cee50bf8f53343e770863c3e.1756481577.git.leonid_komarianskyi@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756481577.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR03MB8676:EE_|VI1PR03MB6317:EE_
x-ms-office365-filtering-correlation-id: b0a8a0eb-1432-41c0-c828-08dde7160625
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?74/phzvzBspFaqo9vwrJapE1/3a7VjTltBWkK9ZkAUsleLtY67hhXi/wiO?=
 =?iso-8859-1?Q?7C1s1fP5+dKIl4wjw9GPyFMSFhRG0G8A6v48F9BUxvehzC5kSzI/vET8xg?=
 =?iso-8859-1?Q?+Oekfo74eALNiA8zaMmjVmb/0xUKzzXD3vE1e2Q+bKhiNrq+9nieNhVI1A?=
 =?iso-8859-1?Q?zxoNqao/dCuS6PmKUz2xW2Ajfiw849dEThieHN+IGpA85TXIzoEX1laH5r?=
 =?iso-8859-1?Q?rI8bvjpr6cRFJA2JjvefaRny3RgQLQ4bBi24PCvQPv1Kxi+RYmfN+IipGB?=
 =?iso-8859-1?Q?q9CQXdR+GpmULfy1KF3RmlrBV3gUohmPIUC805nxk6OoQ+sM60PK3k9g3K?=
 =?iso-8859-1?Q?9tWWy4VKhbGYjf80uJ57WbtdXlqvmIuFrja10POD1NfY1Jf46orh0Wqfjh?=
 =?iso-8859-1?Q?+SGw1ED5ugqGuPJv4Q8fmaLOf1bgAxIwECCDmvtbPVIiGI7I+kXy5vRtip?=
 =?iso-8859-1?Q?4SpyS+5Eyo0jNqjcPUChJ4k51ZysuIBMMh8ZvieMZGoyNbKMI+UjwR9iLl?=
 =?iso-8859-1?Q?Sas1ysyz22N/DYketaUqq1/UEh0oexyYAbq7IGE9DVup5FskIBQrOUFEPs?=
 =?iso-8859-1?Q?3pZPPubSRt9QnluHRTntIdyQ+r5rcY5iRR4ItZGVs/3s7wZxVAfhoFEu44?=
 =?iso-8859-1?Q?X5+iDiK+/XmRrtbz+tJDXG6zIvlWbqjcdVCQhAOujkvj8UreD1Acw0d7TI?=
 =?iso-8859-1?Q?KvQLdqLX9VsCHeYTja7qs3P/S0axAIAx8m8zyQv886bhOuLCRwI0akPSDK?=
 =?iso-8859-1?Q?eU4VwpjcV7dLqQrDoCHQhr3jAr8aQuw89XvNf497+BzpTc1Jb6K+2nIhO7?=
 =?iso-8859-1?Q?m911tsXoxwrpzD22a+XePLZK4DcqlearVpqv5BSj2VQ4RvItRFAPfwA8lZ?=
 =?iso-8859-1?Q?Tv4usE1IZtBbdTrIqTF2kPVGvIunafdtQ6luRj5l1pTngyMMoHVvS4PlL5?=
 =?iso-8859-1?Q?F9AJpYmb1CX3249ig3nPzR0reBVlGGsiQm3J51CpL0LVrfvQYGYBDRgSHV?=
 =?iso-8859-1?Q?Cu11/ApFmguTuwxsxoKC61ogY67LjqCF25h6g6o7wbzWOajrZqOThvFo+J?=
 =?iso-8859-1?Q?BQuX7vAD4nD5DdvINz7w5PcAc17v+1aMc8aGloO84JVVSfA0y87kl7/2k6?=
 =?iso-8859-1?Q?uP1UOFocgvnOQES7yqSCEMEMNvNxjQwhWw9LU7K9VgranRhY/sUPdny5VV?=
 =?iso-8859-1?Q?ffnZNttpHTRml9v1/+5Dt6w1f7+rPByVUxtlM0pm4KanL5frdM10SXv7R9?=
 =?iso-8859-1?Q?8g7dvepklEe7A5BTG4USjLU48cX0VOwbcCQHYVfZd7r8W73FXiqi8CFNr0?=
 =?iso-8859-1?Q?aT11q8GToxv49mbxM7eIQsLtDt2kg9gQ7qHUNw/wcCBXSMZaBHlJ/8FcZj?=
 =?iso-8859-1?Q?+NpbISGex8ieHJSsuid2twizkWQy48iV7sSxwGznTeBdRcx2r0y/hEWh53?=
 =?iso-8859-1?Q?pEw5CM5N2sE/JdUtotgJkdQcRILNNiOZmfVlXcI1572fDzJdC/r7ZTe1JZ?=
 =?iso-8859-1?Q?dY0daveKNAzU0Vw98glYQzPwOMUjOA2aXQCGfJOIn29A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Oc9GdxJbs6eFC9XLEHQrxuIe7KMuUUCVBDYLp8jadUhWldTgdPTZU+9kAg?=
 =?iso-8859-1?Q?s+unOVDReE3wHa/gUf5sAZUAx81ZiU7mQDXo1ATi4HseTfzP/vVuHTs5rq?=
 =?iso-8859-1?Q?Riw5e+z6LSoCH42LhA67/ouM1t4a2oy/kpd7SfHhCTlfvU6Iaz3DQg0E1W?=
 =?iso-8859-1?Q?JovhcAZd3OUhjq51kXmG4y/4PKQ/EF95CTziePYRL4fn/bCVLv1M0mq39z?=
 =?iso-8859-1?Q?ph2BnN4cvj+xCMCFCgncopr3Je7Czx1fQvTty99f7QhHYCeBp1G09nHdCu?=
 =?iso-8859-1?Q?4EjpHBiO3OUc9/BBtzei8v9YxvChZqGhXgAdc1bHb2ISm/i6nwqKYfNNaH?=
 =?iso-8859-1?Q?E7WJhgLxYYyOnhfPJ2mDS3p7gQi5FR5/wUTPE8SNmoRSnaDtOjUMjo9mhf?=
 =?iso-8859-1?Q?Ek5ASxifDeevM4waESqBczoIa7yEauqp5fHXfLqZRe78PbiCnUVf4FQ8z9?=
 =?iso-8859-1?Q?Iy6SlzLK1nmscCi8R7UTaJXvoQJObVS0BpkTZOhQJwzgnZefP4iUbd5NKO?=
 =?iso-8859-1?Q?MyK0Gz9ZudvXVfATTMlfZUpBHjPFvJiS+4F3fJc07jN/TT3q4jdSy4YqGc?=
 =?iso-8859-1?Q?9yoUyTkygYkAddW4DuHaJtWWjwU1dle4gynen8eyYlxy/iOLx9V3Sefz7U?=
 =?iso-8859-1?Q?nOSBEUPNqj6Z9DNv6ecqEQ6sptpezHph4h/kPtmjTRGtXwPiZJmccTuGjt?=
 =?iso-8859-1?Q?jwCg0NVYv0hLxp+JEbOUusFL8/AorxgLlIZ5lUNvUsm5zur3MrHbu8P9ed?=
 =?iso-8859-1?Q?SmHHqGKRUdwAqs7Mbj4Al5P/mtjXLNhw9MK3vAmQIiY9SzodhjgUM2cxGg?=
 =?iso-8859-1?Q?x5pyQI6moq8mplf/5xV+JH9z9GYHTnXswzgzVzQcT4cZMV0npSoOJOaiwD?=
 =?iso-8859-1?Q?Z71ooLWkFX4r2KlPCDPHN/c6ZAW/wcbqzQiboz9ydggkU5pmsmsWOsHCzG?=
 =?iso-8859-1?Q?b+jFANuJrUe/1vGc53Y0LdNLN2e03VE7Cyhav4t3kPSRPB2QH/gjeL4AK1?=
 =?iso-8859-1?Q?UB6LavSSP8BLC4Qbi/+jM3W+kU7hLRmzSYNjoOzS25x+ONWwU0lMS8UjSL?=
 =?iso-8859-1?Q?6DMsOY46nSMJrNgYiJqJc3kmSvu/0E6tK6HoHoUJ7S3c1q2eDvJQrzzD0R?=
 =?iso-8859-1?Q?0mf0L2Gt4/Srk5dAsAXSVrSzg5iG3DEJqLimC26VOrHJf2MUuptwAUOKfA?=
 =?iso-8859-1?Q?KcGegNTnDYPEeljY+W8V2CNHEG2gOAMV+2+29CaBhO21FqyRSm5/t28qwf?=
 =?iso-8859-1?Q?GI0dpEWupjBJ3jn4M0/q4XX2Q5I7QBdCVtKSSggGIx9PNnHkbqIMI11Uxi?=
 =?iso-8859-1?Q?zIg+VA6/jYcX0tTWHjvkXO3ZqCkKEZtiqSZX8Uk5t7dQrxjYHFAQA50DC9?=
 =?iso-8859-1?Q?De30c9Q219IeE/iBsidD5tnUVRwUZljzCX7hAhc6RbqOh3S56If+6AtXo7?=
 =?iso-8859-1?Q?UNGCG4uBc9zZKjVoaZp4oge6+S1cBB0+ce1ngJXkaSz8sMsnAjxdc5D1x4?=
 =?iso-8859-1?Q?lxfQo7hVdsMH2dw3+SeZCnmhgqX6ZmLDSmRopwww2iwHb9uQQcJSYl+gT6?=
 =?iso-8859-1?Q?judwHxNvLEqsvvPNZGCXXkIBTDIFIlj/m5498P6/wcLKeZ27/kP+hO/CLL?=
 =?iso-8859-1?Q?0X/T6rrMgKLe2JO/1l32H86V5XenigiqTX9XZ1iC0gZrPNkZuZY0fceF74?=
 =?iso-8859-1?Q?o5IOE5sA89hcEHB7GrU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a8a0eb-1432-41c0-c828-08dde7160625
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:33.3752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rW/hjgv+jnFRsi9mOXX8AC/K0acM1B5xVfLvjnLmDxq9F9ZLy4crT9RJx6Fy2xIEqDdlemCmYhLx1XUlG4H4cpzUVuM+s9wqC0vcskB/oM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6317

The Dom0 and DomUs logic for the dom0less configuration in create_dom0() an=
d
arch_create_domUs() has been updated to account for extended SPIs when
supported by the hardware and enabled with CONFIG_GICV3_ESPI. These changes
ensure the proper calculation of the maximum number of SPIs and eSPIs avail=
able
to Dom0 and DomUs in dom0less setups.

When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is enabled, =
the
maximum number of eSPI interrupts is calculated using the ESPI_BASE_INTID
offset (4096) and is limited to 1024, with 32 IRQs subtracted. To ensure
compatibility with non-Dom0 domains, this adjustment is applied by the
toolstack during domain creation, while for Dom0 or DomUs in Dom0, it is
handled directly during VGIC initialization. If eSPIs are not supported, th=
e
calculation defaults to using the standard SPI range, with a maximum value =
of
992 interrupt lines, as it works currently.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Changes in V5:
- fixed minor nits, no functional changes: updated the comment to make
  it clearer and corrected a misspelling
- added reviewed-by from Volodymyr Babchuk and from Oleksandr Tyshchenko

Changes in V4:
- consolidated the eSPI and SPI logic into a new inline function,
  vgic_def_nr_spis. Without eSPI support (either due to config being
  disabled or hardware not supporting it), it will return the regular SPI
  range, as it works currently. There are no functional changes compared
  with the previous patch version
- removed VGIC_DEF_MAX_SPI macro, to reduce the number of ifdefs

Changes in V3:
- renamed macro VGIC_DEF_NR_ESPIS to more appropriate VGIC_DEF_MAX_SPI
- added eSPI initialization for dom0less setups
- fixed comment with mentions about dom0less builds
- fixed formatting for lines with more than 80 symbols
- updated commit message

Changes in V2:
- no changes
---
 xen/arch/arm/dom0less-build.c   |  2 +-
 xen/arch/arm/domain_build.c     |  2 +-
 xen/arch/arm/include/asm/vgic.h | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 69b9ea22ce..02d5559102 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -285,7 +285,7 @@ void __init arch_create_domUs(struct dt_device_node *no=
de,
     {
         int vpl011_virq =3D GUEST_VPL011_SPI;
=20
-        d_cfg->arch.nr_spis =3D VGIC_DEF_NR_SPIS;
+        d_cfg->arch.nr_spis =3D vgic_def_nr_spis();
=20
         /*
          * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d91a71acfd..39eea0be00 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2054,7 +2054,7 @@ void __init create_dom0(void)
=20
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
-    dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
+    dom0_cfg.arch.nr_spis =3D vgic_def_nr_spis();
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
=20
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 912d5b7694..3aa22114ba 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -347,6 +347,25 @@ extern void vgic_check_inflight_irqs_pending(struct vc=
pu *v,
 /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
 #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
=20
+static inline unsigned int vgic_def_nr_spis(void)
+{
+#ifdef CONFIG_GICV3_ESPI
+    /*
+     * Check if the hardware supports extended SPIs (even if the appropria=
te
+     * config is set). If not, the common SPI range will be used. Otherwis=
e
+     * return the maximum eSPI INTID, supported by HW GIC, subtracted by 3=
2.
+     * For Dom0 and started at boot time DomUs we will add back this value
+     * during VGIC initialization. This ensures consistent handling for Do=
m0
+     * and other domains. For the regular SPI range interrupts in this cas=
e,
+     * the maximum value of VGIC_DEF_NR_SPIS will be used.
+     */
+    if ( gic_number_espis() > 0 )
+        return ESPI_BASE_INTID + min(gic_number_espis(), 1024U) - 32;
+#endif
+
+    return VGIC_DEF_NR_SPIS;
+}
+
 extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);
=20
 static inline bool vgic_is_spi(struct domain *d, unsigned int virq)
--=20
2.34.1

