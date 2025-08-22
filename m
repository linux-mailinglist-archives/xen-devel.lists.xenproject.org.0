Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43056B317B8
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 14:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090075.1447468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upQqa-0003Pl-AG; Fri, 22 Aug 2025 12:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090075.1447468; Fri, 22 Aug 2025 12:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upQqa-0003Nq-7O; Fri, 22 Aug 2025 12:26:20 +0000
Received: by outflank-mailman (input) for mailman id 1090075;
 Fri, 22 Aug 2025 12:26:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HljN=3C=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upQqY-0003Ni-Ig
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 12:26:18 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33a5c3fa-7f53-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 14:26:17 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB7165.eurprd03.prod.outlook.com
 (2603:10a6:102:101::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 12:26:15 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 12:26:15 +0000
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
X-Inumbo-ID: 33a5c3fa-7f53-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgEra1dfrSTYaJ7OqnnSBuoMbHZcSZcf3m06fpK9ugTG+zttYvHXgO1YDdzuQAXkt8dGAV7HA5dW2PYx1LkPXIoXZXalkGlhQSSRvzMig4Tjc0+VwWuFYy3mryAxGbai6qbWwrKIvMBJUDsnLG7sQo2kBAqjhaR/bV9DoXZ1BrRjnk8SrG26oYBdAsLClimrYKEwIj/BSOybaJ5z5TAzq2dpRS/5nhg+mokjqfTksLzfyo9lDdKp0XYs1OZcgjA1qHi7fwRxZ4R4iMlzaz0ZdKzK84Lv0xOOmE+ewP49tQyIY7JxjrDdvGQcWSlN99rixeRKXzaBHlWLzdg0kuWDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Z11hu3hGIlIs2PrP9Pi+5fr4zO9riQloNKV1v9b2Aw=;
 b=eVkLdi5cb+8zrwrj9ZjpqzbiErrCAiL3XkNCUIReKs6B7FHFhCByXvI08m5abfTGq0i1k8WcnswZfLkHtBD6deKzLKecYy/rS/l/aoWJ0z0lyYi1oA0va1BiJcB8ZfFif8K6iiL9qszbZ/vRhuz2MXuXzp5HJ17CJjFC/jLYPAbNzmzHAWuQdFDEMj0vIVEZQleUi62FFopgQoZtGkHnIgiX8bWaN9nq9gkxUcUfMXnPKiLtvQJGXC0/Z2mmEQM1B1TX9JTjX1xy02E0i85JElYa8Us9nj1ARQ2KPu/F8txaQx1GJshwFSsJ8kh0axygwBTw0nYQW2b3lDMs1iGqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Z11hu3hGIlIs2PrP9Pi+5fr4zO9riQloNKV1v9b2Aw=;
 b=k/CJzM4ZgzXGuaE6nFQe6a/mLdS579IgA/wJBBPfokfa3sv8d5pP9DOaIpYnbrqTKskzm/E6n9AkBnTHho4cxCZxZksYlUQpRqudGEtlPE+gxftZhrJWuRDqoNCqjmBuciZEhClqbzQ6AEHhwrzoWIoIyablfuLww4zap5mXiKcnWhh8LAIXQ4JHPhdklCom5/V6Qv1ZORyTh/alkDowvaUDkdK36YKH4m504UjRtzsKYccePxnQ/+h7A2ncndCZBal7USjpFWVRN8yB9p+kmgHNDN1lqODPn1zMJ+S6rAukfgCG3hzOADbgdRHfR5NfKdGmgWlKWg07u4AAKSG75g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling
 to support eSPIs
Thread-Topic: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling
 to support eSPIs
Thread-Index: AQHcB5d/fLeRBY0aQE6DC46DWY0Ygw==
Date: Fri, 22 Aug 2025 12:26:15 +0000
Message-ID: <87y0rbbl0a.fsf@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	<abba685916e6637eedbd831352bed2e968eeb7dc.1754568795.git.leonid_komarianskyi@epam.com>
	<87o6s8d3m1.fsf@epam.com>	<93cd9406-030c-4915-b180-1cc90109b7d3@epam.com>
In-Reply-To: <93cd9406-030c-4915-b180-1cc90109b7d3@epam.com> (Leonid
	Komarianskyi's message of "Fri, 22 Aug 2025 07:08:50 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB7165:EE_
x-ms-office365-filtering-correlation-id: 79395254-7794-44da-694a-08dde177168c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?KpHZUVR8mCGBfE3auVyH5A5vmPZlBRwmXKHLs5UOjl31/2a1ddOT5q1OM5?=
 =?iso-8859-1?Q?BQ5d8lFK8vEvUzC4npd6oFDYjZx/deaIXubhp+e25Hn8y4jGT9VRg5l2NG?=
 =?iso-8859-1?Q?h2yR8+DeSBlyNSe/VSS6QlRdicKQU8yB52NXauUq5OLxkM6jMDxOdC6jhC?=
 =?iso-8859-1?Q?KTnu1PnMK2CQDDaEz6BDY9zfJRwifVMxLgFHP2ZggZQDYVEioBhY2V+X99?=
 =?iso-8859-1?Q?1ZQzX+xrI++xlkexL0cfdCOQOq3jrdQf64Cku5oxoMz+IJApIJoIg5Rqep?=
 =?iso-8859-1?Q?yyrPivAFidcL93qhOs6erLHkPfJU5OwK01CDYhtFui4Sm9DBtthsbmzmIQ?=
 =?iso-8859-1?Q?AHP8AQ0UanUr/cPLnrl7RrC/Bzx8awxSn/O6oGF7uCvqLiHEr2ElY9GF9Q?=
 =?iso-8859-1?Q?gZhz7al7Z05uehuTgBVNswXvXo3+Ra7WtkHkxTnoF9rLYzCO8xZvUaJSQe?=
 =?iso-8859-1?Q?rYd/db2VrINGyOWhoE1TGmq1lwIvXwE0kQq9RFhCITF6w1ka7YOzq8xry9?=
 =?iso-8859-1?Q?OsySYVNN3xAKANfd9MEtSnIyBL5KOScHlVl7b/sCncqab55zRZh+CMtTKm?=
 =?iso-8859-1?Q?5T8iswb6M2ScZMFTf4UqG3rl5nHgwqv3dYa2lm3xoN3YuzVxuN9eJOKSjI?=
 =?iso-8859-1?Q?maeWlQFpX0kWRC0GKMiHMA6xyZZrjhx+OSjnF+d0L5xgM2VeyxhhcMRP05?=
 =?iso-8859-1?Q?TAZwca6dDD34I4layeOpmjDWg9vgGxoJS6I4YzmGq8aEcUWvC4GmVN90Ma?=
 =?iso-8859-1?Q?yyjG60GKe7aMeYyU/aFfYo59mOLr9VPvQvS3mMrTlRA+O6mu/ARZ4Z9pNG?=
 =?iso-8859-1?Q?5p6onywocVpH/7P8ydReDj1uE/2f7cg1NSQt8S712Xz+AyBvgUvjWs/R3V?=
 =?iso-8859-1?Q?iP4oJLKPaGixu7hjPMfZHerHC65ZG+oBlvcKSmFSuP2CjQ0e+EruLAi62Y?=
 =?iso-8859-1?Q?U2/IyNzud5Y6O8EsNLYc6SZi8pzD2AucYwyzOaah9UF96gcP5qn3RCCNIG?=
 =?iso-8859-1?Q?B+N/01uU/MzKkwYn2lYUSqPerLYQrVYvHOxvB3a1MsyUbYd+8UzPxvikAq?=
 =?iso-8859-1?Q?ooFkjJhH1FeByu2NMHSFDwQvZwhKZkf1ipgHKxEshGkEpCXgMSSYx1hgaD?=
 =?iso-8859-1?Q?CTNAD/aKet0Ex7L/yMyL6QZ2i7H5OAM8jitspQw1Cj+bEXFVGFDgZqKa+m?=
 =?iso-8859-1?Q?zj6SrrT2zgJijOrW31J0wkUydhJ7f1nDGXhgvvnfL4h2d7wfRBYktstfLN?=
 =?iso-8859-1?Q?ybrnKZubeVfnpgyLyH2SqtpyhkRs+XewsQvWnMGzqa2vbmljbn1D3JkXcA?=
 =?iso-8859-1?Q?SEFK7YcfXoOukYmO1jtPRmnbAOWGKu0VBUuPq6Uk5qTNC04CTWL0mnS0IO?=
 =?iso-8859-1?Q?4+m5ezGlgFKpTdd84u0aoxOBygGSCyp5ExscKBRSE6saDqiA07dVD5eF0a?=
 =?iso-8859-1?Q?F3snf+2qTNtllv0+0sVlKKhdAvOuSnWUvP1p4doZr00sPCEc4FcWNTOmsZ?=
 =?iso-8859-1?Q?tjGiFC9mXt20XN3gJADxHBONlNoT73GMNYruAiKbG0dvOSSqhO/hpCb4I8?=
 =?iso-8859-1?Q?Gg/0VkA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qZtdZoJ07xwcPCXydAS9mme1MHAzshGwB41Q58wbfE9482ydNGjKYoZIe8?=
 =?iso-8859-1?Q?j7pO56z57JnONcpd5KHeKN5UCOJu04eSEehhc7NP4MWsobpYZBchyIlHjX?=
 =?iso-8859-1?Q?cwPJhw9otrG5alCHon09OtPy6daipP+ZGak5gucjJ4qtuXqnV3lTCBz022?=
 =?iso-8859-1?Q?Ngqp7z0xykFckrQjh8iZWyasa10tOCFKSsIrJezh6smVjr+HAqkZCWvwqu?=
 =?iso-8859-1?Q?M+tca66IRn3Y6trlwBBTgUlLPQm2PqF+1vFZlVvYisLDtWfGoIjix5KrcG?=
 =?iso-8859-1?Q?Eral6K5Drmex9fPunj2/Hc+78goBFhONDWb//HpnX8a2h6+BfSd1B37piP?=
 =?iso-8859-1?Q?XzYtt7YzCWqXp1WbatNBcN4VoqtVpDoGpvFArB//b5KObCImgjo7ckLKLq?=
 =?iso-8859-1?Q?zNZ+xe36+eHXNuiO0Yx1/nuKujOz/QZh3HVKHASYyFbbjfiffrvzNLvdOF?=
 =?iso-8859-1?Q?QBkfRtmu4dz+dlERj2AqF2GmPGWpOr983T2BX7urLTVvOlF2n6LtJP7/sx?=
 =?iso-8859-1?Q?tb7qUWTW5rJS1D2h5eF7wQ92FLStGymBoVfw/7ryTBB0Ok9SxguV/zCpry?=
 =?iso-8859-1?Q?9KzcTWBf6iXQ7+/F01oeiJmlXy7qhn/Ebph+XANYek89ub4NOG9Q96S5ig?=
 =?iso-8859-1?Q?ZXz6xbf5DY2GqFk1vXeEOX1cYR4BrIkT9spTp0VLebKnpdf/uoVulH23TX?=
 =?iso-8859-1?Q?Bmv16UTkCv4hTHSwmW2fp1EI/cOqd+Dzv7c+tFnqgg+qaOn2RzFy7Ph6kn?=
 =?iso-8859-1?Q?Lcv3Pjwzk0KAH5+Jwp6/O6Rmbw4XVB9jN0RgmXImm6ENtA8iI2uJOQv0Vc?=
 =?iso-8859-1?Q?ZicieyS6ubQBqqJRaEnHz7DdZfrI2KwMoppN6GaM2MOkWPGx8a14pJE6zy?=
 =?iso-8859-1?Q?qDBbLmLib3QCuA4KUjKTbOfytyUW6/dVJmMWLqkSGR8PBdefTGqrJEpp0A?=
 =?iso-8859-1?Q?nir7+dgwGQyqTAgsZoo38Q5bOivDJh1glP80ucR7Kz9xpfo0ygOUxHRZ4P?=
 =?iso-8859-1?Q?GghBO13FfDLd4U0s37ElARqt3+q7B3O4q5peq55AR63xg/Gz23LwSZpJYw?=
 =?iso-8859-1?Q?ZPHuDy+Sxqwm12Hc5O3HFL7DWcHV/QRBmxTIzzuG6Gbpe2RJXZyghRLXQS?=
 =?iso-8859-1?Q?RNzWnBxE0m8LM9sOSuxhtHYLCVM53/UwLEz3cHVO94jRBF0usHa1DR5a7s?=
 =?iso-8859-1?Q?DZ2rwovKtGtkUOBbU6uTOATqbMZyDugJBdkP00R/GpvJ8bqOLrPZv+CBwS?=
 =?iso-8859-1?Q?VsiGxaBKM4x5MQG3sXhrYI5B1MHsRXpfXKMwYMKDL2qr0VIBWHLO4s9YEm?=
 =?iso-8859-1?Q?QysVkk/rQ6xIUOj8DKAXFGw50hO33QKTyQZmZlRsgqTTpJIYTYnosR1qBA?=
 =?iso-8859-1?Q?RRaChF5feyaML+2ypDYOVNMWgNAIJhLAdSvb0uZRTZDyEhvPDG4b+JtL80?=
 =?iso-8859-1?Q?WFUsPuxG6zur/rlPepBjVlM5CxqQ0KMTn0ezlfbSzAMkUVjK32O6OYmMsQ?=
 =?iso-8859-1?Q?/tOr9jrr5QEyizPBALwvz/EgHbkRFb3r8LEHkuYxVYxyinX8OTSXiSAlne?=
 =?iso-8859-1?Q?u0Slh0uNMxPR0pgXiwHxtRJhD3cE+jecYR3OMUAqk0zt9PW5kc0o58Y/To?=
 =?iso-8859-1?Q?k/SVwHRi7OtCMb7Mc982ggArDRaOrRRrimzxpWGOpF0Yyq1zPRDQmaOA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79395254-7794-44da-694a-08dde177168c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 12:26:15.2101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3e5HjebRLhVj5LsSsPHunZ3DcA48t1GrMRofLMaxkECV0RjPXnaG1+aJlU5DHFhUA1lAyGKc+Mm8/Sd5ucxIKWkWlCrNATAGw9BujWB8B5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7165


Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Hi Volodymyr,
>
> On 21.08.25 19:46, Volodymyr Babchuk wrote:
>>=20
>>=20
>>=20
>> Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:
>>=20
>>> The Dom0 configuration logic in create_dom0() has been updated
>>> to account for extended SPIs when supported by the hardware and
>>> enabled with CONFIG_GICV3_ESPI. These changes ensure the proper
>>> calculation of the maximum number of SPIs and eSPIs available for Dom0.
>>>
>>> When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is
>>> enabled, the maximum number of eSPI interrupts is calculated using
>>> the ESPI_BASE_INTID offset (4096) and limited at 1024, with 32 IRQs
>>> subtracted. To ensure compatibility with non-Dom0 domains, this
>>> adjustment is applied by the toolstack during domain creation, while
>>> for Dom0 it is handled directly during VGIC initialization. If eSPIs
>>> are not supported, the calculation defaults to using the standard SPI
>>> range, with a maximum value of 992 interrupt lines as it works now.
>>>
>>> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>>>
>>> ---
>>> Changes in V2:
>>> - no changes
>>> ---
>>>   xen/arch/arm/domain_build.c     | 10 ++++++++++
>>>   xen/arch/arm/include/asm/vgic.h | 11 +++++++++++
>>>   2 files changed, 21 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index d91a71acfd..fa5abf2dfb 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -2055,6 +2055,16 @@ void __init create_dom0(void)
>>>       /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>>>       dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>>>       dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +    /*
>>> +     * Check if the hardware supports extended SPIs (even if the appro=
priate config is set).
>>> +     * If not, the common SPI range will be used. Otherwise overwrite =
the nr_spis with the
>>> +     * maximum available INTID from eSPI range. In that case, the numb=
er of regular SPIs will
>>> +     * be adjusted to the maximum value during vGIC initialization.
>>> +     */
>>> +    if ( gic_number_espis() > 0 )
>>> +        dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_ESPIS;
>>> +#endif
>>>       dom0_cfg.arch.tee_type =3D tee_get_type();
>>>       dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>>>  =20
>>> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm=
/vgic.h
>>> index 9fa4523018..117b3aa92c 100644
>>> --- a/xen/arch/arm/include/asm/vgic.h
>>> +++ b/xen/arch/arm/include/asm/vgic.h
>>> @@ -353,6 +353,17 @@ extern void vgic_check_inflight_irqs_pending(struc=
t vcpu *v,
>>>   /* Default number of vGIC SPIs. 32 are substracted to cover local IRQ=
s. */
>>>   #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32=
)
>>>  =20
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +/*
>>> + * Returns the maximum eSPI INTID subtracted by 32. For non-Dom0 domai=
ns, the
>>> + * toolstack applies the same adjustment to cover local IRQs. We will =
add back
>>> + * this value during VGIC initialization. This ensures consistent hand=
ling for Dom0
>>> + * and other domains. For the regular SPI range interrupts in this cas=
e, the maximum
>>> + * value of VGIC_DEF_NR_SPIS will be used.
>>> + */
>>> +#define VGIC_DEF_NR_ESPIS (ESPI_BASE_INTID + min(gic_number_espis(), 1=
024U) - 32)
>> Name of the define is wrong, as it is not number of eSPIs. Actually, thi=
s is
>> maximum SPI (including eSPIs) number.
>
>
> Thank you for your review.
> Would it be okay if I rename this macro to VGIC_DEF_MAX_SPI?

Yes, I think this is better name.

--=20
WBR, Volodymyr=

