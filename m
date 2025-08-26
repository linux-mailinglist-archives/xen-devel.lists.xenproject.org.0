Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5370B37540
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 01:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095296.1450368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur2mb-0002su-DR; Tue, 26 Aug 2025 23:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095296.1450368; Tue, 26 Aug 2025 23:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur2mb-0002pm-9h; Tue, 26 Aug 2025 23:08:53 +0000
Received: by outflank-mailman (input) for mailman id 1095296;
 Tue, 26 Aug 2025 23:08:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNE8=3G=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ur2ma-0002pg-JE
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 23:08:52 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0268195-82d1-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 01:08:49 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM7PR03MB6386.eurprd03.prod.outlook.com
 (2603:10a6:20b:1b5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Tue, 26 Aug
 2025 23:08:46 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 23:08:46 +0000
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
X-Inumbo-ID: a0268195-82d1-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pfo3Ea3CzCpJI5ODSyX8+/JZKxcztnWJBp4Jqzng+G1h1jXsEGm8cG5XN6/l21Mab/fpoj4RhqGPpfMJj6P5h87uQ8SNKOTlZ75HyYyFkRw+Qz/DXjrkx14F5pz0wa8tBNtARS4p0mg7bUGbZkenmywNEP6HNJqWwBkWE72Eirn6xoLr39Tyd6vlAU16iIJgUNNJSCcut+N41Bqn4ezZx9UiEYWuN9VfvVczApox0RJTNepewOlAFj1+cd1NGDLM2mXuGZcx+pdO74v3EMUvdjugbuC2fV7KlhR/QMZ4GEHwj/M5q6ji4MSm3kOKbI4mhUoJH+V16mqxQFjKHdY17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxnEwfZCp72drXIImaE76SUXV74tGOptFun2XF1RWjI=;
 b=dEHdIFCpu4AmfSRYO/8A+SzRNRW1gOEwhmZYw2H86tBLzvDG21PQCjrxQyTiRZevsavBjWB8Qu17r72oIWcId5KPYHMmJErLk2uRBeSgVoslkt6ilLs1o9q9zJPijSK055VVTSxb0Pr3ZfNhf8N+Mo8tg5CquYRzfMHrK/wcL9b+BYGF6qGDOtYr/t9+U8bx64q5kJaS0OjwY/rmvTtQnBJRAzJ0i5Sr0IsbO7R7b2gyEx1vBTNp2pUJwjai75FSv+VTJ6uHbxwhVgcUXPvttBmM95sHLX6Pf/a9S2o2mI2lxCdGVUbw/wOCY6C6HifCx5wFM4ygMbDK6U+xVOfWmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxnEwfZCp72drXIImaE76SUXV74tGOptFun2XF1RWjI=;
 b=i5qb7BE4q2c9I9X706nz3tuIWAYwkDwFT8hk+7RKod4ip3Q+8JBRfKtcQxI8obXE9FCt3DVpxAXnXAzFgcLWoPaFhxDf+wJj03ebTRa9r5Q+vB54DbEnE58swZGTA+Y71LWQ0eYVEZmVz5geoL4q0MvxKlQUENVdZyRxrodd3wEq1ldd8eAmWlGR+0m+1tZDxr/10nlmtPngSnK//HU3OP/rGCBsF04aBpBFfggfs9XxrlndZlEnN8DgN2eu134Fjqj1B/bp9OoG01Gl3BANfIufBnosYCVlTaSxTedPQrdCl1Yg/Vq5LPVzRQE+iPF/6JuYvWK7sUNdWUduxxlRNA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 09/11] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Topic: [PATCH v3 09/11] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Index: AQHcFpKC3tlPpRwHYEC6FSrd1NYk4Q==
Date: Tue, 26 Aug 2025 23:08:46 +0000
Message-ID: <874itt4r5t.fsf@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
	<bff3d1c4302e8780771abed42f624cafe76776cd.1756216943.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <bff3d1c4302e8780771abed42f624cafe76776cd.1756216943.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Tue, 26 Aug 2025 14:05:38 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM7PR03MB6386:EE_
x-ms-office365-filtering-correlation-id: d68af678-8d06-4f37-6dc7-08dde4f582b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?w8lMBX3SVP3CSQNBRwjzemL/aFFBgJxUZPBlF6mPcmJkcm1fKrgAAXta75?=
 =?iso-8859-1?Q?y2LS+gMsT6FRxWu4B2sTEqSPFqliBjHr7xam3z0uwbJHJevexUB8diNiGR?=
 =?iso-8859-1?Q?qeF4WAo9qzSthOczuyCEpKxl6DPzABR/u9kup654Pg3KViodPQsFlTTy04?=
 =?iso-8859-1?Q?r+BMdzKccghiC8hY3nLOn/GXMn50ekos46KAH+N8kOOe3Uk2EyrW2KVM5g?=
 =?iso-8859-1?Q?dlOtRISvGYcV/0SY0ySnNZZmwQuWWCMzR755YXkeg9jjVv/5nYDEukhnwg?=
 =?iso-8859-1?Q?chat/rNbzmhYepvF0Re1AIR5UkHb/ZM+34Yl16l78jhu6enlhtHOmKIDco?=
 =?iso-8859-1?Q?vqZ1BSoGD4+wL1JCa0BNf0fxTNECMGsPkdNy8gqPW3o8J8BGF5yPJ3QsYX?=
 =?iso-8859-1?Q?h90Xuozszy8u+LxJssYKzR/5ktZ1kT7NeeS6NTWjx+J50ugU9IIXkRQ+w3?=
 =?iso-8859-1?Q?STqweaTmZwSNnYKLqdn8DTkO7n9Eu3JtObjbgtOYFzOkPMdBG4rWmiSXsw?=
 =?iso-8859-1?Q?xaFNln5D0RopINi0XlY9tIYq2spIdtjttHolmih6RdhFg1kyVrylHj6KWg?=
 =?iso-8859-1?Q?sHVixKhDqjRZG9UQRjDLUiE3ilqger+FoBUt0wIoQ0UWgUAegsPoiCjWJW?=
 =?iso-8859-1?Q?mZFxzypRWP0Oy6D+A5ZKKsS9YnOam7fjov3PcQFJx1NlI37NfvBBNVcE0g?=
 =?iso-8859-1?Q?GvfH1ljJ4UY/yuDKegxWV1Al5Rt3Q4imRkKvJl7pfurFiRt8myawgbJ104?=
 =?iso-8859-1?Q?N2noy6/WIuch6AKt7GuC1s5KCOjzuiz/pvAOyYN2+4Jg1Dr+A4oko1vD0D?=
 =?iso-8859-1?Q?3Tg592/i0OSvLdOf1wWyA/PKdGYnEYoGkTUf2f3ZNfCDTnND8u/nT0Z+2G?=
 =?iso-8859-1?Q?NTMs60t5ae1P2tysTlpvCPREPw064gpgZXo4qKO3eQHof0NlLePznOB8l2?=
 =?iso-8859-1?Q?KZQqXUpG/Ok95Y33k80xQ9Dpzl7i8QQnsckmOsEWG0/VxCkiqnRJ6ynWxX?=
 =?iso-8859-1?Q?ncouMRb8ZoUtiDP/pCdlb589a3f/fPGeS8p+6TUH8J9FytE3GInlaBpoPI?=
 =?iso-8859-1?Q?PgFHWI8pULfE35si0zoFHyxna1u0sH3qNt+U0UG13uKdb6eB1PQTHA3/RV?=
 =?iso-8859-1?Q?r0yFpTkcJDoeex+sV2J54dJjUWzaVG9SAPn4uikdY2+5WhG6JgjXIx4hNQ?=
 =?iso-8859-1?Q?JooPN9M9GH4BmLksNI215s1ONoRbCgtty7gck7ERvbFNGhz0j7wBwdntpR?=
 =?iso-8859-1?Q?/Rvq9lNQ5zTKVBkd0AXW4wnYzLl8APSi1dL4VUzLS6gWx/3vp/bYZ0mT+H?=
 =?iso-8859-1?Q?sS4xKJMinKfme/OzfbXgYLwKzTU22QHW7df9vTlwClCLHhY5oKOcfSWITC?=
 =?iso-8859-1?Q?D3fnrS+jYN8UgE4qUlgendTmrE2ktW0gmpeAe8NBXnLIz+/+WuI0PzjLy/?=
 =?iso-8859-1?Q?ECDVIHSxJoOvCAgglw3Z8IYYkso4GWXY/e/wGODODcT3++7G5fgLp8tFVS?=
 =?iso-8859-1?Q?85jaZA8WtK4/HxpxurhaFKdvI8pbNVxYjsezPJJXKuAA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?s4vc/mC5VwMv2za+tWjAGxRnE3ojtdMq+M8oLjb/aJjFPFJLgHu1Puh3gZ?=
 =?iso-8859-1?Q?pZP3DvZ2OJUsiArmjed9nAhbePuJqpXYlqUyrwkBdxv4uUPHPxDLyedpot?=
 =?iso-8859-1?Q?n6Gi4H0nOhOJ/BmR67v5bjE1DHmaoHRG9iHfR5VLJBfvjRPsgkgoKKGlF6?=
 =?iso-8859-1?Q?WqMapzZoVwTNGeu8EZYTO+ex20SaeFMp3p8BH7yhD2mCfMB/TY1JHgFHXc?=
 =?iso-8859-1?Q?yr7C3EMtT1KJok0QwvU8EeYn4Uco/ozIn6R2JWqGgsKgU9/tfCSLUVsl1I?=
 =?iso-8859-1?Q?+SnNWP+bzJZEiMmADLXweqC/cuEI24Nf+YSIJgRbKbXyJPV8AvcMYsqZiU?=
 =?iso-8859-1?Q?/RY+OJ/iR6ZwDzeeNBQI36at2SGPubn/2oyjYOiRTBpQjn4380o7uyN+kY?=
 =?iso-8859-1?Q?6Pv5gRZXn2QyndngMgbQTyI6NRYVRgGsMCHjwGD3hY9CNYA3CbaNpjYP9o?=
 =?iso-8859-1?Q?oajIFSOiS5W1XHAncVURopD6Dsdm12Zu+WHXgwLFZxVAmmBcufzhqemkEi?=
 =?iso-8859-1?Q?CGhXXFL+LeDVJ8XPDRCI4SB1kwaNMo5ms9JXH8F79vUyYw9CFfr1CbpDWY?=
 =?iso-8859-1?Q?pWoqWoqN1c4S8Fs39S9PlUOGGlSJWIbmn+oCFuFGzKPMDOw0WgT4RopC+K?=
 =?iso-8859-1?Q?T/5jSZ8rVwr+wqOC7aVOQoEyqBangPpYhKc3uJyUyIpovQTNZi7kBsVIV0?=
 =?iso-8859-1?Q?4so7yUcqdjbqfBkv9n7N7gNFBZ1tb3vz+xYX6vA7bRhePZPDuBBWBA0GZX?=
 =?iso-8859-1?Q?cL7p194JWhevnt3PLbTZkmUlfYIxfF/NTyWMgCHtyPnCrrZQZALv5tRqpY?=
 =?iso-8859-1?Q?KsFt2a9KxAR0wI6P7CV6Wh7HXIiHOzicQqDK17v124HS2K9NY42duYjA3w?=
 =?iso-8859-1?Q?SdYGhPw7usXKtE1r36V4H2Mtt0MXjT/xyVylD725D3Z/ZhQYzNbrh+/Eeo?=
 =?iso-8859-1?Q?AIhNXU3V+OTjnhtWBz79JqVA6uCuEk1j9VkTlSNjAmN09tbNzzbOC+46h5?=
 =?iso-8859-1?Q?xoVE7lYQSIazQAA/+SvWPlkOySRaH3wISiEzWDsasADuwB7c6HYyAtUd8y?=
 =?iso-8859-1?Q?rjvp+LKQG4pEpp5szvTA9qKSdkObW+6799UTnEAA4kNMYN9DWF9Zz7QPL3?=
 =?iso-8859-1?Q?qH2J+tDjwa9/oucRgf2RjVOeubcQoqDiyHJG5D3NVjtVDHwAvMFxZCQTlb?=
 =?iso-8859-1?Q?Tuq8A5ZHYsXd2Zx5/r0jKrvYr1Nf7Ak5bf9aMlQIhQswJENnUj5bvqomi3?=
 =?iso-8859-1?Q?1b24i6XAgyKQwDKi7PjusqHfXtcr3Uph59MLEExM4+gRvn9I5FOWDXsPt6?=
 =?iso-8859-1?Q?0PhDSMh+fNqGx8VQ1/QsvyEsyaBVoPfnQHnKdVrq0iYs0YbmfEApi5pPCj?=
 =?iso-8859-1?Q?R4UZK/5EyNYNHHVt35TJdHCZ8QmfadZ3YZZbDTGAeTU5Vu8m+SFqHI6Kjn?=
 =?iso-8859-1?Q?KNcsCRWRSe7/DW5HZCZD+7KSkKRuJubGKyj5Dh1N51/i4ewNMb6sgZ69fu?=
 =?iso-8859-1?Q?i2Wzavoig7yD1w9MLVs8fNw7RzsigezAtzaYVQ4wS6CjAVs7wt4vUubO8z?=
 =?iso-8859-1?Q?kleKP1ycdChhgCbHld0sjQu6TIyvNTs6/PvXaDDtOS0oCA8REE7VJyyqD/?=
 =?iso-8859-1?Q?oUDBfAbjBDee2yvWIJZUigKxtHh/mTGCpJ2sK1gRgzrpDGB0J12E2y8g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68af678-8d06-4f37-6dc7-08dde4f582b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 23:08:46.7602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bA/fxhUrEpCl1lpn78s9fmNbpMim0v+2rTxPMaEpc3LUbWp7bNARjlmHWOCJQoe7Fy0J3r7a4ISX9DH7EQQ8xNCA07FtzABJR8BMtnB5wlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6386

Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> The Dom0 and DomUs logic for the dom0less configuration in create_dom0()
> and arch_create_domUs() has been updated to account for extended SPIs
> when supported by the hardware and enabled with CONFIG_GICV3_ESPI. These
> changes ensure the proper calculation of the maximum number of SPIs and
> eSPIs available to Dom0 and DomUs in dom0less setups.
>
> When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is
> enabled, the maximum number of eSPI interrupts is calculated using the
> ESPI_BASE_INTID offset (4096) and is limited to 1024, with 32 IRQs
> subtracted. To ensure compatibility with DomUs (Dom0 setups) domains,
> where this adjustment is applied by the toolstack during domain
> creation, while for Dom0 or DomUs in Dom0, it is handled directly during
> VGIC initialization. If eSPIs are not supported, the calculation
> defaults to using the standard SPI range, with a maximum value of
> 960 interrupt lines, as it works currently.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V2:
> - no changes
>
> Changes in V3:
> - renamed macro VGIC_DEF_NR_ESPIS to more appropriate VGIC_DEF_MAX_SPI

Will VGIC_DEF_MAX_ESPI be better? When other code refer to "SPI" it mean
"common SPI" (less than 1022), while ESPI is used for extended SPI. So,
naturally it feels that VGIC_DEF_MAX_SPI should be equal to 1022...

> - added eSPI initialization for dom0less setups
> - fixed comment with mentions about dom0less builds
> - fixed formatting for lines with more than 80 symbols
> - updated commit message
> ---
>  xen/arch/arm/dom0less-build.c   | 12 ++++++++++++
>  xen/arch/arm/domain_build.c     | 11 +++++++++++
>  xen/arch/arm/include/asm/vgic.h | 14 ++++++++++++++
>  3 files changed, 37 insertions(+)
>
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.=
c
> index 69b9ea22ce..f4f9077db5 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -286,6 +286,18 @@ void __init arch_create_domUs(struct dt_device_node =
*node,
>          int vpl011_virq =3D GUEST_VPL011_SPI;
> =20
>          d_cfg->arch.nr_spis =3D VGIC_DEF_NR_SPIS;
> +#ifdef CONFIG_GICV3_ESPI
> +        /*
> +         * Check if the hardware supports extended SPIs (even if the
> +         * appropriate config is set). If not, the common SPI range
> +         * will be used. Otherwise overwrite the nr_spis with the maximu=
m
> +         * available INTID from eSPI range. In that case, the number of
> +         * regular SPIs will be adjusted to the maximum value during vGI=
C
> +         * initialization.
> +         */
> +        if ( gic_number_espis() > 0 )
> +            d_cfg->arch.nr_spis =3D VGIC_DEF_MAX_SPI;
> +#endif
> =20
>          /*
>           * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d91a71acfd..148a8bdb60 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2055,6 +2055,17 @@ void __init create_dom0(void)
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>      dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>      dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
> +#ifdef CONFIG_GICV3_ESPI
> +    /*
> +     * Check if the hardware supports extended SPIs (even if the appropr=
iate
> +     * config is set). If not, the common SPI range will be used. Otherw=
ise
> +     * overwrite the nr_spis with the maximum available INTID from eSPI =
range.
> +     * In that case, the number of regular SPIs will be adjusted to the =
maximum
> +     * value during vGIC initialization.
> +     */
> +    if ( gic_number_espis() > 0 )
> +        dom0_cfg.arch.nr_spis =3D VGIC_DEF_MAX_SPI;
> +#endif
>      dom0_cfg.arch.tee_type =3D tee_get_type();
>      dom0_cfg.max_vcpus =3D dom0_max_vcpus();
> =20
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 248b5869e1..0bb025f5d5 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -353,6 +353,20 @@ extern void vgic_check_inflight_irqs_pending(struct =
vcpu *v,
>  /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. =
*/
>  #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * Returns the maximum eSPI INTID, supported by HW GIC, subtracted by 32=
. For
> + * non-Dom0 domains, the toolstack or arch_create_domUs function applies=
 the
> + * same adjustment to cover local IRQs (please, see comment for macro th=
at is
> + * used for regular SPIs - VGIC_DEF_NR_SPIS). We will add back this valu=
e
> + * during VGIC initialization. This ensures consistent handling for Dom0=
 and
> + * other domains. For the regular SPI range interrupts in this case, the
> + * maximum value of VGIC_DEF_NR_SPIS will be used.
> + */
> +#define VGIC_DEF_MAX_SPI (ESPI_BASE_INTID + \
> +                          min(gic_number_espis(), 1024U) - 32)
> +#endif
> +
>  extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);
> =20
>  static inline bool vgic_is_spi(struct domain *d, unsigned int virq)

--=20
WBR, Volodymyr=

