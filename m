Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35965B42B71
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 22:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109017.1458893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utuZ2-0004QF-87; Wed, 03 Sep 2025 20:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109017.1458893; Wed, 03 Sep 2025 20:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utuZ2-0004OY-4P; Wed, 03 Sep 2025 20:58:44 +0000
Received: by outflank-mailman (input) for mailman id 1109017;
 Wed, 03 Sep 2025 20:58:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rz8A=3O=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1utuZ0-0004OQ-Ed
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 20:58:42 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c491d829-8908-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 22:58:40 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9607.eurprd03.prod.outlook.com
 (2603:10a6:20b:5aa::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 20:58:37 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 20:58:37 +0000
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
X-Inumbo-ID: c491d829-8908-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crc/DZxct+UWQ90k9Y4XA9sVYKcOqx5GUZ6AmpQJuN3p9UXottYHIupibJ5Z9j/99Bni7QT1Qgi6h5M4I3FIE910oK/BThkZBknvIDu4cFtx0CjoxWK35r26QghOOWxsS24DQKDvVBb8Cx8AmxHZLzr8Nd4bDkLSyMaYWX/OhLGmpJTMwHxc9schrBmbJ/YV6tSAFqVkftut0DKqfKNppuatKLHwLkhZTA+z/UmiP0vWWthy9cKigt00RuBzdDDn6zwbkP14ikgUMi+zm8Kj8Fjy7cTYMDpk6b/nC/5xRDgZl8/yaSFTU2d+3kmqIn1bs7uOtaIC3E6NNWDzeHSHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvgXeD7gSv6SvgyBUH/iIov5VVjjIoJkJRHd8nXgWIk=;
 b=jPHlFaLePg//O7G/g8la32b6NGq44ytiorGhFnfKjIqP6JjwDq5DFILhIOmhRokwhbIYDS/Ptz1dq0Mg7l0b9SQRnfgEoW0YSNcqJMeT4mWlf9qsqaX7VWM8UUGa7YuRFdcppEUr9qXXfz9pndYmMzX2e5rg8DUdsXAuBcv3UL+YbZgeRtrojsuvxTPKMYw5JjqFCHZHdsbeZ4IllxYbkAiSARPry7NbZOpF4tgUfjcUj16AVFDDFICQhC6Yh0hoqz52Ps2Qve0jAgF1sjMzsK1mp3sN9n2DT/1WGU1DMFI6D4ovbrL4rJmgpIZyHp1cZHL50jXcZxib8fVEo3xbgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvgXeD7gSv6SvgyBUH/iIov5VVjjIoJkJRHd8nXgWIk=;
 b=ur/osPkDz3+y1HpU9ZCKFiSRfjUyx1MyVSmMTRnjtPiGhAMj44SXoz260OMKc/fKd7CVJX76Yl+fsZMnJEVhhV3/stB7RvdG1Urzj7MExI7HjhmVEu6/vqjWF9UFvQhxM+3g+NmGMhwu/8RN3+eyM9lIyRtPTc2SR48ZycBKjRJ8wQUFL4T+GTH1MzywZ+WOqlJ7RHc/Jaz2uJgBttPrKCrBPQ5vTSwfbAkndtCNFxiZDlEvjIjJDTWxObomvihXTVmXMYTBDYddfBUwhyk0rXJwVqf2qMCJP1DhotGwfZc8yejTEpYLsGtQHNOOFJ6dfl0xyBPaWITC5aqjKSmvwg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v6 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Topic: [PATCH v6 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHcHN9BaUpUjNGOp0+m0BX8qyVhBg==
Date: Wed, 3 Sep 2025 20:58:37 +0000
Message-ID: <874itjuubn.fsf@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
	<c32133f6b25155a72d8ea91e1183d65d9083c7fb.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <c32133f6b25155a72d8ea91e1183d65d9083c7fb.1756908472.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Wed, 3 Sep 2025 14:30:08 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9607:EE_
x-ms-office365-filtering-correlation-id: 796cf9cb-4bca-42dc-1464-08ddeb2ca763
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7MRlv5bU9pl8gukW3YBpwWowGAO74pD7fUBtbNISsAg6j90viUnag12RpT?=
 =?iso-8859-1?Q?BquyUxZdWbZ9Dt0X7lmLvuWqx9RzEa5ArC2p65SwHqne24YqntAEsHpYe3?=
 =?iso-8859-1?Q?SbiUzPg/XmTwXdjkqF0W5VRC88iBDMkZ/RTF+fn/kj/27+0BG00H7ZbXoK?=
 =?iso-8859-1?Q?Qj8Arf5bkzAjcICvuAKRlL+9Y7XhXJWIaMAZkP7gQX8qewW3J6nj4rR+IY?=
 =?iso-8859-1?Q?/NvUE4BVj4qMGcSjEuFWkJWwCQVRD500H4kU6YbqXXH7+8nD+ZtwYtfonO?=
 =?iso-8859-1?Q?tgrPhRn96yuQQpkcDR+YJvKgI/jWz2+nnWgyrjQrvN9JG8hyO8N5ce7tMk?=
 =?iso-8859-1?Q?m6lFppLuaLmiZBglknBpp9bwG8hbs0WnCl5xnFd8WDPuyc/qO2+Q809qhx?=
 =?iso-8859-1?Q?hO1OXM/dJbmqDJ5erEUssehY6iiW+tX/m7JINgrck453Ul+xBJXqpTsF8y?=
 =?iso-8859-1?Q?n7bYaX49wc/PuHQSUbU6GpeYSNU57i7mhdVgUWTEHIKcOz/zN0oq4YOIFi?=
 =?iso-8859-1?Q?pA/kKlVnI7ScbkHi2AjdOtUI6/MvLqxLkMOOhnraZuYpLf/GO2mDZ8TPZs?=
 =?iso-8859-1?Q?+l2dggxChiJcW5QPGuJ5VlYUC/LhIXZG1pjp/P7STxj1q8dMWpPjB306Dx?=
 =?iso-8859-1?Q?sxitdyBtL8M4LQ2+Kdojogqo+BMY3hqNAoIO+KlAHgZUoiQw91GYQK6GBS?=
 =?iso-8859-1?Q?OgxrHoFjZo6q/UL/F45VK8d4CYQPh5lzX04fyk7PVbBeDml2jYSgEwi8Gl?=
 =?iso-8859-1?Q?PXOdAhiul1CMmRMf8VXDpdECZNSI5MSrr1zr36KA/EdDJF3X/LWS2sEaD5?=
 =?iso-8859-1?Q?WkoNOI0luHQmB17/3Lm0ig5T+71bHy3EU85f22K+U1x1caiYGW9sn8dQCr?=
 =?iso-8859-1?Q?nzOVgHMZa8zFyv1omZo1v4XmgIqUGDdbfa0f2q1vgpzlBq4FGw/nypSkdY?=
 =?iso-8859-1?Q?MN1x4+trBZF3C00SV8KY2hTFVpLwo+nztU3VWgrlxORztZZk14JzSRisNC?=
 =?iso-8859-1?Q?T4oINOoaOWuxtKVpBwvZfNZ180M2mXFiXjeZHm9Xf0bg64+Miya/jk7LVR?=
 =?iso-8859-1?Q?QQwUvFoT2wET+A/MBcGgCNJdGgzUmF0A3wlMnO1Fib+pYmoVdqE7iwjc/m?=
 =?iso-8859-1?Q?50camCQJqMmAWq2z2bQXdEfOXQnCSIocuvQ8mp54tJuXoaYaMlcYfkSa+6?=
 =?iso-8859-1?Q?gHYQ/Ciw721HFyES/au1RUTaFVtsMS6XOPaYxdaMxe7p41gBmj9ew0MFFU?=
 =?iso-8859-1?Q?nKm+7jqZhDp0hsJYTUYF5ljRCvORJ1DMfGqOFkpy11WzfkeZXPkjpkhtvP?=
 =?iso-8859-1?Q?6lu8p4w3TavHwwxBAOMoI4Gqdqua34v0faqiOecTVGOOax44fpm7ZkitfU?=
 =?iso-8859-1?Q?WFt2cSZsbxwCM/mZWlIXPKvpNYJU6due/Ikt4KGPfSWWAnGyn8doalsXRg?=
 =?iso-8859-1?Q?tNNiBXqtmh3pBb2KcOqJ64gTmowD77ma3Fk1mtEvGi/ggbERuXcrwcFWNg?=
 =?iso-8859-1?Q?K581zHvkK6PfAVyx06mDbMqjFQPNESrv0GOzHIfZ+isA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?uDf0s1TDXYirBM8ntpu6x5I9drct5LeJy5Ulu1hr6qkhMblgSFZL977gy2?=
 =?iso-8859-1?Q?BmUQAv/ks9n0j57l5AW7oWhwRkUhYPkTcZI6AQv6+9r9Admx2PrB2QKjiS?=
 =?iso-8859-1?Q?1+aeCgFv4vDECQJoJKcw/JryNpdFsT4cP5M0HPMR0md+rpvW8V0AwsEn8/?=
 =?iso-8859-1?Q?zaXmVKLWCjP+6vyQYo0kzvuaQLbDEJOZmdcviGESHaULUJwKZ7yom7Mkz3?=
 =?iso-8859-1?Q?e+vYfeD5fulyuVtuBfJdVqVenKd0po1Ga9Q247ETF6vL4B944/lce/0jW9?=
 =?iso-8859-1?Q?Uvj3WBTW2vt2f36WZ2ds+LqvTn96cMJUOhm/U+BbnWNRE+Yq1NzNVU6Dm3?=
 =?iso-8859-1?Q?9vGKUXd1gMlU+SCC5/at3agQT5YKbocKkZQL4qvggzh2Bjvbvc/f9Rtjm9?=
 =?iso-8859-1?Q?TctnXgG54zxA/t3W39C7FSmB2naopAqfpvIjwMpKj0rp21W/q7Kuzutij5?=
 =?iso-8859-1?Q?06cy78mH4AWRHP+jf+wpjbpOEWfF/QP2agURgjMOTt9mYG886MbaHmBZ0d?=
 =?iso-8859-1?Q?Y2r6EnYrNdSTOVy6sru3fFrK5ze1OOg7m1p9S+5NViiBfmxDRh7K7JHI6+?=
 =?iso-8859-1?Q?/ttbOzW82sZQlPkJocVKFiKnPG7OKhPctAPbhhWcSMlBB1p9v9aGO3D11g?=
 =?iso-8859-1?Q?mS3cDWs6kxjSaN4Tzsr0RXcSrbr8fwgViZiXgH/B+pnVvd1iBu7bHYhmSq?=
 =?iso-8859-1?Q?PDj2QzwxwLxbiODiRJQ/FTQqaP8KpoP/G+g7JaM11f7zB0cTH9ZS0K9dPT?=
 =?iso-8859-1?Q?6d8Pb+vg9v76XNWpiKDcqfCjQU4z3E9/KTv/nkMCej7vgJN5uUvIT9tmEF?=
 =?iso-8859-1?Q?BWV8zmg4M5p3uirX3OFB9iPt7+wM9JLdY/RXb6lFX0fL64YP+qGxALrC1A?=
 =?iso-8859-1?Q?mtsZXKiN76WOiiwiOL5psUtLswC/T3MG200xy1bNm2fstZMgCQl+XZapPl?=
 =?iso-8859-1?Q?8QkZ/uc14pMc1M64pFmiPbfELw3Dvl3S5/ay0IgnnYd8NkuBdF9eTaTWYW?=
 =?iso-8859-1?Q?izM33a5BRDmW0ruPpAaU4Z0zTm0hQ6eyJxF4R83IkWjY25IUZZYEolXoKB?=
 =?iso-8859-1?Q?kvoevzceil3crYWiXcuwSC90X/zDneM6luOAJQdqdFrY/JdpIUt0olZQJY?=
 =?iso-8859-1?Q?zLwvnNmL/cGfjzI4qkRSqZYcJ881qDqkdUTtoaqixTvj+9uw5+WlHx2Mtt?=
 =?iso-8859-1?Q?1TAvdS7chorw4bKYsezYGScztsiqVg/X7NzD7wWkx91JVhOkv3bVbF/EXh?=
 =?iso-8859-1?Q?6ODQZf/f+0ucTHE+GuRWIeYUfsj5jpINkUn4eu9FRrGEJeFJjH2sFOV/3r?=
 =?iso-8859-1?Q?zt2VG9GCqCz4Feu4JWxF1UPmqTAlhClJ+AZkPEe0d5Lel4btgNcVrC+YX+?=
 =?iso-8859-1?Q?whCZ/7a65asaFd9qgofYj2Y6ohbyzVCvgAcaH06Q/iWXD2QQmNoIO7goOz?=
 =?iso-8859-1?Q?kqoDlnTN/uvpZXT0HK5/1DfJhDmDpGjUE+UtIxp5/jP0snFLyhbcsO2af3?=
 =?iso-8859-1?Q?sgpRnesc2dOXVH0rij+6yErhAvH5jvIMYy12wgbV6EdNnD2SYMyhnz3wg8?=
 =?iso-8859-1?Q?07+wHlFZ5gYWBJwc8T+H3BcYmHDxdScSyJOCd3EvRJPMX2US1iLrmcPVLV?=
 =?iso-8859-1?Q?+sQPyMj/GgQwQrHR1VHkYE26YvThIoS5wFRhaZHTA/d6Iy25USQuQ4ug?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796cf9cb-4bca-42dc-1464-08ddeb2ca763
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 20:58:37.5259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1d+tL62PTk+OI066BV0TN2Kym9yjAiWb+gEQxipTtknVQP9zxgxPjecwK5uyXwtDG71TnmKTU9PNilf9zYUePHyfruELEMARN3d0MbbAwL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9607

Hi,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> To properly deactivate physical eSPI routed to a domain and allow them to
> be retriggered after the initial trigger, the LR needs to be updated. The
> current implementation ignores interrupts outside the range specified by
> the mask 0x3FF, which only covers IRQ numbers up to 1023. To enable
> processing of eSPI interrupts, this patch updates the mask to 0x1FFF.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V6:
> - updated mask to 0x1fff to avoid confusion
> - updated commit message
> - removed reviewed-by as new changes requires additional confirmation
>   from reviewers
>
> Changes in V5:
> - no changes
>
> Changes in V4:
> - added reviewed-by from Volodymyr Babchuk
>
> Changes in V3:
> - no changes
>
> Changes in V2:
> - remove unnecessary CONFIG_GICV3_ESPI ifdef guard
> ---
>  xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/includ=
e/asm/gic_v3_defs.h
> index 3370b4cd52..c373b94d19 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -211,7 +211,7 @@
>  #define ICH_LR_VIRTUAL_SHIFT         0
>  #define ICH_LR_CPUID_MASK            0x7
>  #define ICH_LR_CPUID_SHIFT           10
> -#define ICH_LR_PHYSICAL_MASK         0x3ff
> +#define ICH_LR_PHYSICAL_MASK         0x1fff
>  #define ICH_LR_PHYSICAL_SHIFT        32
>  #define ICH_LR_STATE_MASK            0x3
>  #define ICH_LR_STATE_SHIFT           62

--=20
WBR, Volodymyr=

