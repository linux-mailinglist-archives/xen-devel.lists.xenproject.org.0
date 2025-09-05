Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEA5B45759
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 14:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111879.1460447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVHM-0002vF-If; Fri, 05 Sep 2025 12:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111879.1460447; Fri, 05 Sep 2025 12:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVHM-0002tG-FI; Fri, 05 Sep 2025 12:10:56 +0000
Received: by outflank-mailman (input) for mailman id 1111879;
 Fri, 05 Sep 2025 12:10:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEM9=3Q=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uuVHL-0001XF-ON
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 12:10:55 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f51c157-8a51-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 14:10:54 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB7352.eurprd03.prod.outlook.com
 (2603:10a6:20b:2e8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 12:10:52 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 12:10:52 +0000
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
X-Inumbo-ID: 5f51c157-8a51-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sW5Snc4UmwpWJirlP0cuRBw28bi+LqZvfg4RGxBL5hOcFTFz+LhECW0ytZAOE/3qrWezyz8cgsw5RKPVEZAZXq7zvgRoJl0ZYctW+oqy+5/WUziQi2hDdYIGNM1D49cMwgJDiZE0YaIwakKawny09u+wWlJi1pCooUyZKrKI5qUj1up2RzwyxfisFzML+VZka2v+SJ92iFRm7/kdZR+fb3fjDnv1VvB7EdSh3hc3h1BCp7if54LtRxjIVVGGjXrq5NGQapADrvzVNgxQimseJKhXDQPs6Z6qk+epA7y5zhvgL4/NLFoGjZ+02pDKU6vK51ToHn/J5q5+rfLmwLoHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVHrUv1HLYFkWeYJcqq6TRl5KnEXLxpIk0HHERA93jY=;
 b=YwUBKNrCzRpKpApoa46Xh/jKuwkDY0lpQvutpP0aXsMRuHkY676MZXzCEZEyOb3qMHA7z/BWjX0AihItJd+kUfkq561P9Kq4aGgeg/iwECtRniFmsuzKEF7WPGcXK0BLHiP2vCyu4jEyuGGlb5nKF7m5r4NFho2fd9459mSz6YwKiHyjqgf9tY9hR0DlXJ5aiatBkXCEnx3XJaL2qfcbI2TKqiCaRaM6JSCsW7dlS8jr9hXxwDBEynue/pKEeaEAjbvO2WnP/pdNSoHMYy4W4QK7BaIIHLpDzVNJebtDmjO3LQu59Dht14frvrwZGnQ5YgSpEQPeB/FujIFjHjHtEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVHrUv1HLYFkWeYJcqq6TRl5KnEXLxpIk0HHERA93jY=;
 b=Wkztak4dcVR6KrsVa5GVmQGlnPoDmGpYipXFsWY8rfxjdsFH9f15DINhDsEoWEaKTe5uZz3WKjBh3F2lK62cFbF3bJPO50JPQdlIxgZ15fvQnPUG2C9cVAq8qsilG8Ckq8MWaz2W9IMlWzVQDLoC12hP1yt+yZsByD15xR43LoPVqCXjxvH03uP9nKsw2oOnCQoD025fBEtxKlUD0J/vWzkfutmPoF1oWcmf1e5nRXJtSCqqS+YmOsP80zejrgnlL8AOj3tCcaNEt1sZX+8XIP5TKUKIGbRbj8fHC70+m9LrlnpYiPaonOQDWp4k0o29PYD4bZUCFJQEWZ0015/+cw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/4] xen/arm: split set_domain_type() between
 arm64/arm32
Thread-Topic: [PATCH v2 1/4] xen/arm: split set_domain_type() between
 arm64/arm32
Thread-Index: AQHcBrdwRN56SCuvyEipomT5fYlVlA==
Date: Fri, 5 Sep 2025 12:10:52 +0000
Message-ID: <87tt1hqeus.fsf@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
	<20250806094929.293658-2-grygorii_strashko@epam.com>
	<87bjo13976.fsf@epam.com>	<2cdcd8a6-0f14-4a4e-ac56-f0c33763ad53@epam.com>
In-Reply-To: <2cdcd8a6-0f14-4a4e-ac56-f0c33763ad53@epam.com> (Grygorii
	Strashko's message of "Thu, 4 Sep 2025 23:09:35 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB7352:EE_
x-ms-office365-filtering-correlation-id: 14e6f3ae-f329-441a-09f0-08ddec75423c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?pZL8f3rJQxeHFOdjcNst/gX8xNwtLEd8h/w0tiQUDR4N/lcNZfnT0tt6Ga?=
 =?iso-8859-1?Q?MNL+Eajdgf8I0YZJevBFvaPJbijPqEnwdLm7HVnrQkCu/SIgEVM3yhGMDF?=
 =?iso-8859-1?Q?1wApQWG8ZeahI1QWmWFGkP7wTx0iaiHGS8ktamNnHL1lKiY5fW4Luqfni4?=
 =?iso-8859-1?Q?U/9Y0YK9AdgrypjJqoZuc9W5C2KVZQaSEPMqqdgAzQbAZPstehlwEkhWLk?=
 =?iso-8859-1?Q?9vrQS2w/I/TG3CvODsJYDhQJyYvZ1JiPoscG7XCOqze5t1znlCwlE2LI95?=
 =?iso-8859-1?Q?MhSbrMZjdJoG/bAqP7ouji0lCvApzpNaj6+XY/2d5LNo1Cnh7JavnCPWQw?=
 =?iso-8859-1?Q?hOOGlCrhM9BzR36YrMlmK510L4U1TjgksKhJ7fKJLAM+1nq0P9VdT4Wo//?=
 =?iso-8859-1?Q?JIywbeVKgnjWlySXKXzeNBfgGIa7jWQUsY73mRBjJeVj1CEZuF3DIsBUbg?=
 =?iso-8859-1?Q?qGkNkp7R+Mzt+wuOEuHjzt4EFkkr8s0iuhxXBDC9glx/8h7wyu4CjYeHkP?=
 =?iso-8859-1?Q?dXvV0Yf2fhWAQ+NsLuELGefq0kieRO96h7wnHB9i8NmPYoIWAUDnG71lWw?=
 =?iso-8859-1?Q?LMocjgiQV6OlA8bKfdPj9B6I7sW7uPnVNqpKj2MLc8aJB+duzwz0+oIvI0?=
 =?iso-8859-1?Q?Ub/ZfmkfgMoJQrJm0xHCKSB/5x0PofWTuM5qD48D2FoEJdve5n5Pao2ty2?=
 =?iso-8859-1?Q?t5K9abKbAHizovI4/5VODdyWteuig0aqgcjjmLkmERfmOETaS8l0IZyRr7?=
 =?iso-8859-1?Q?E9xzvLxIHgXrDBT0jrtrppvnT5B6uGAQeGENMcWQgalPtFx3YgzlABq7mF?=
 =?iso-8859-1?Q?og97iCglx4Uo2wHjXPY4fIit8Bem3uXMj7+jLT6gtoVuSIwZqfQhC+qzC6?=
 =?iso-8859-1?Q?NccpENFepkT060S4hbTDJGUzsvU9smJkdDwZtM2Zih88OnnMtjPaDIP3Zt?=
 =?iso-8859-1?Q?RGhusDc5SbJM54ZBGY81uxsJRxW5YMJrJaupKcPKFg5ytjfRC2i+sSkE2/?=
 =?iso-8859-1?Q?jmGTWz4aar3cE4Hu1ZKVu6BLyjLxtWcjvRjE9uaVQ85i6VI7vhjMsgFUrZ?=
 =?iso-8859-1?Q?+g6y+Rk9qHyD6QhdOcadHMFLCe0X8PnPw8Sq8enpdNXZelTAuBoLEGYJo5?=
 =?iso-8859-1?Q?ZZFS7rFAbG7OKOTbgP/0wuY5IYMZtyW33Y055fLhtM5cIwJOBmOVt3o9Y/?=
 =?iso-8859-1?Q?G83HViChx+LMaltYoooXRb7ZcVkJs80wQPmMsg3GZl6333UqscFo0/6rjV?=
 =?iso-8859-1?Q?cN/UkzK6MNiT/+hqr9ZFtymINA0ec0k/EknkGiJfNvgNF0tWsaaS1js/lR?=
 =?iso-8859-1?Q?Oll9zgQ3eWLDlIv+I2FeryzTrUv2dOZCQJ/k7c0o2/grxiLVqO9PzUr5QY?=
 =?iso-8859-1?Q?eMjgfVdrGiHWprBAhNgxiiV2Cx5s0kqVwPMVIkPLSmOiMuREWdLztpFHhK?=
 =?iso-8859-1?Q?Y6hryKANDb+8G6OIVrYbhBheag7TqgFoKmljaLFXaG0uXLDtrnLIFie7SQ?=
 =?iso-8859-1?Q?jwk6moRVtIHR4+wrfitLCFuwGJDF2agyvaMMhgaVoZ9g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/KbwqlyLXGpEOmfrGvbqUb6sqLrw7ikNBK9p7KqzQRaTyCg8IjxAWBGmu6?=
 =?iso-8859-1?Q?WQpcks6u9hgdXG1sN/Gds8WDcnq9yU4d6GEisWKkwr9flSllXOYlQ2oeOr?=
 =?iso-8859-1?Q?Ioz19JSBvftd3J3S88tVDrQqUOG3/kbpBY1S5kbAnw/INZhQzzgx+YdDwq?=
 =?iso-8859-1?Q?RBpeRr6bbuIzb1i/JuyhE3a6SFkAbRZfJKcU8i6U2EG3v4PKA5xoplIEb9?=
 =?iso-8859-1?Q?kzX7aVwTWKm10EHyu3A3mwJjI9bGan3LIV9sxQhZ0uoImL3/B3eZGb0awK?=
 =?iso-8859-1?Q?eyZnSpN6bkwDIuUht+ijIU3LvgOmMew2b4rCo4B0BMtyIlyD16YaHxEOk8?=
 =?iso-8859-1?Q?EQnPGHRIfxrkgAzswYORsBGhWhSYkWkJ+r8rIdpURH2mSlSpNNkxNMapwg?=
 =?iso-8859-1?Q?0II6j0GK70ZKWvnjoqd2nGho3bMbgWCfiJPRgOj2+yGXF2i5T/rwdTQmRy?=
 =?iso-8859-1?Q?siuBZiqRyvc2mHJG1AAUdjJX54p/gnV9Cy2mFMiqHoI/FCUY5yfWO2k9LU?=
 =?iso-8859-1?Q?455NsaagOLxSEW16lyMFC28t8X4UaJDsQWyWwb5Xs9LjLOBI4mvfaN5fPr?=
 =?iso-8859-1?Q?zx7ZadDp9SHUOYSKjIEVzIyuovChDLnPpvsNVkO2tRYw5tvpPCLeeZ/ggP?=
 =?iso-8859-1?Q?ZPx1aPpa9aAqpJsPouGi6ayJPE/sQ76wmewFuyWKQY9R3zMByuLUyEnPiv?=
 =?iso-8859-1?Q?lt7HRVtPXFmQTceTpRg8OBJX1y28PUTJQ5GyP4rqBqfuqurpmB3o6ix9wz?=
 =?iso-8859-1?Q?/unZlPa7A0pVjGsQ8m394hMHpj6LXED3WN29J5SbEFe6e913bwOmOJLB4S?=
 =?iso-8859-1?Q?AoB0VkLWLHRmoLm2ZSa0IOATZwS1AN0txLSFF83D4fKkii9CFjomY4zqKO?=
 =?iso-8859-1?Q?yWHZHm1PZjIj8G3gVANI45aDD96TdpjoR4cQ1DZO5raldJixM0Phh+92Th?=
 =?iso-8859-1?Q?3dwiJr1MrJq66/wep4L94Di1/DvfMNJ84um7CD5belZ2/OjDmx/yOtvqfw?=
 =?iso-8859-1?Q?/+bxET+X3pJ/8P8t3qEGt3rG8olmWDvwwHGXdBll2Yu8uS8ZEr9JqDwFNs?=
 =?iso-8859-1?Q?GW0TciUKhrrImUcwYBsZnt+M1NusY+HfTNSEzC4DTzpApWBu2m+ym72tGe?=
 =?iso-8859-1?Q?tD2nTfL+tsizGkS9c/SqKCAM9n7spgoFZ5fTAWb13WGaZbCeu/VD+y1H5K?=
 =?iso-8859-1?Q?efaB/kvSBmmlz0qxlZJg8QHPgZIH11nJtNIwU5i8oB/YDvZOe/3I/Sex1I?=
 =?iso-8859-1?Q?cRFLieh08kf+Fc358vLdaEZ2DtZit1oD8IPttYtzalLadjDNESIxRVUxTt?=
 =?iso-8859-1?Q?wvNXnpBL9BqYt3j3LYt2o5ZnT/RHBd67NK89yW4/ro24xlZ3h3saOZKJlC?=
 =?iso-8859-1?Q?MH+7rVVxczvlLmRbf2WEGfjvLjps9TdJSag0gE1UocwYBYA6emqbKBoX9U?=
 =?iso-8859-1?Q?bXAZaW3ID8p9mW+Aso1omN05HvXAIHpbY7iKW8c7dWGQa5yMyEw1d/H0tn?=
 =?iso-8859-1?Q?cYbKSZ7jQTBbb/m04AMvBHk9nEfhw52QITG4tHOysYNBmGoqVO5h0djyR7?=
 =?iso-8859-1?Q?PsikaFA85yF6eXMEkjnxszviGzpvxbFMXdJuKuKGoB9viHODapN8yQVlCU?=
 =?iso-8859-1?Q?DzGD4pvkmCWzdTVZYNGm26ceTy5PkRCUmi3ERc2ydBO0BArtvJScbKQQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e6f3ae-f329-441a-09f0-08ddec75423c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 12:10:52.2499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYJj1fSM3SjINg/EVhmm9YgKwGnGvq2jYSqtQKqcJYp8952+2LhAeHxFZynUkBaLhyaB8u6l1ommOHUKZdvfoZW79D6eRTI4Md/UM/IuWeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7352


Hi Grygorii,

Grygorii Strashko <grygorii_strashko@epam.com> writes:

> On 27.08.25 03:22, Volodymyr Babchuk wrote:
>> Hi,
>> Grygorii Strashko <grygorii_strashko@epam.com> writes:
>>=20
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Split set_domain_type() between Arm64/Arm32 sub-arches as
>>> set_domain_type() implementation is going to be extended for Arm64.
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>> v2:
>>> - no changes, rebase
>>>
>>>   xen/arch/arm/arm32/Makefile       |  1 +
>>>   xen/arch/arm/arm32/domain-build.c | 22 ++++++++++++++++++++++
>>>   xen/arch/arm/arm64/Makefile       |  1 +
>>>   xen/arch/arm/arm64/domain-build.c | 24 ++++++++++++++++++++++++
>>>   xen/arch/arm/dom0less-build.c     | 14 --------------
>>>   xen/include/xen/dom0less-build.h  |  8 ++++++++
>>>   6 files changed, 56 insertions(+), 14 deletions(-)
>>>   create mode 100644 xen/arch/arm/arm32/domain-build.c
>>>   create mode 100644 xen/arch/arm/arm64/domain-build.c
>> Is it really worth to create two more source files just for one
>> function? Maybe it is better to use already existing
>> xen/arch/arm/arm*/domain.c ?
>
> It seems a common approach used for splitting ARM subarch code.
> code from arch/arm/A.c goes in
>  -> arch/arm/arm32/A.c
>  -> arch/arm/arm64/A.c
> (just "-" is used vs "_")

Yeah, my point was that both arch/arm/arm32/domain.c and
arch/arm/arm64/domain.c already exists, so you don't have to create a
new files. But this is up to you, actually. I'll be fine with either
approach, just wanted to mentioned that there is another way.

[...]

--=20
WBR, Volodymyr=

