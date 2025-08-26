Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE89B3736F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 21:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095031.1450177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqzk6-0003SM-LC; Tue, 26 Aug 2025 19:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095031.1450177; Tue, 26 Aug 2025 19:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqzk6-0003Ph-IG; Tue, 26 Aug 2025 19:54:06 +0000
Received: by outflank-mailman (input) for mailman id 1095031;
 Tue, 26 Aug 2025 19:54:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNE8=3G=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uqzk5-0003Pb-Vr
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 19:54:05 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 660c3ff6-82b6-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 21:53:55 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB9PR03MB9783.eurprd03.prod.outlook.com
 (2603:10a6:10:451::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 19:53:53 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 19:53:53 +0000
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
X-Inumbo-ID: 660c3ff6-82b6-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2gxb6LCt0lsrlntZHubN3MEpW16QfIavU2BvEjqw9/C0McHvYwMSBmTd5vn5x+NIg0+/KWfbr15ViCZXi9JsdxDHhqwnqCPVWWNlam6wN/t4kROJEV2QN820p0AVFliYFyaHlmNrjin/dMZtgkmR6NV4A65C7AlDbCIqhZAgSpIrLKEaXUqgMnBG8P0zKdDDvVV1WmjpnuZkt9BqqKolScNnssY0qq727lMfwfrg1aW3/OjPZC07cSxl8JiS+k4ncDsOFPAJlsHThu4pCln2/I3QV4E5oXTFBZpiVn2YU8EGU4LWQAp4xbALRbXYo38gt+rbproHglwYq5OZU/KsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HakcH58Gz11T5wR/4QItu2zU7mjVIdJG/mBvwCrDTZA=;
 b=cMF9nUlAPZpCqH0bUYoHqsgQuQI72yVkTYqIhJ4mlh86bAQUCgrU/ZwJc41AgaWzRebTzxMinVm8xVssk3pgpVcVzGZumPeFtrlXmxZVt+ffHW2gcmYU5vVW5/XC+E5z4hcZ82d6CIP94K6/bGZgzWPCeTfUdrY6mucTMGxpL1uzbfVZ6szd73YsXxgZHcpNEu2jfsvKkIZT2y2PzVwfA6vGr+mmC9heMak0y9mzNWMbuuG90so3JYBFzlHWp3gpABOzsysTnQg3dhWtaMJr5XuJI8wPIH00Ifu3shFURY362Qx0Ki0auzX8jlccGIbajcoEq/41o/IpPDOSDmCOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HakcH58Gz11T5wR/4QItu2zU7mjVIdJG/mBvwCrDTZA=;
 b=Yt+P9bu1mN6hhL5KqQUR8HAtbBfvDGHTqQJmsFmAlN8MMvSvitoSGM3HObHfDbRjwjPll+G9OfU3pMGHO581kfpgV3P9sAA5M194hV0YyWfpxdBMCiWrq2Kc8ipREMhePy3DwkUAAVPrI3VCHQ8VllfpLT5VR77dE6VMXSB/VypxVth0DLEz1hBjgz30Nws7AxuDWOmtFdLOMILSHVOYqc9AFDp+eOw3i34bkitocu6w6HhwBNiOXj+vzoOCgPbchRHzo1gmP2kqrhN3V3PRlyM+ZTJwBweJ7Zk9YPSgsV+6vw0HyRrwj0O+J/gk1cc95YQ4hll4farp4ggKPB/Ijw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 02/11] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Topic: [PATCH v3 02/11] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Index: AQHcFpJ/l4cyfmMsSUSuASmV+4e1mw==
Date: Tue, 26 Aug 2025 19:53:53 +0000
Message-ID: <87h5xt6er3.fsf@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
	<4a865061abcfe626ffb8c134fe2353fb5675dc86.1756216943.git.leonid_komarianskyi@epam.com>
	<87ms7l6eyt.fsf@epam.com>
In-Reply-To: <87ms7l6eyt.fsf@epam.com> (Volodymyr Babchuk's message of "Tue,
	26 Aug 2025 22:49:14 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB9PR03MB9783:EE_
x-ms-office365-filtering-correlation-id: 529716ba-6a11-42bc-ac48-08dde4da4904
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?pov17z7Fw7D4eMpWUEaex/6r4l5hWisNIM7UZQoAjI9ShWWgGXoGL/gjVj?=
 =?iso-8859-1?Q?wkp2HYBjVU/xQxW8CLXvgxDZBinqwIEALEdUhszjC+sSr/rrKjgrtpQKuy?=
 =?iso-8859-1?Q?yWjx17PwzoZhknfqqmQHe/0p0k0GAh8WFvYNEbG1fmOYpuo9+k0AvYbQfB?=
 =?iso-8859-1?Q?bxttKKFoQntNP1nZanIALRhR2245GBABE5t96/Z29SPrUzjgScQ+ES4NNn?=
 =?iso-8859-1?Q?slwdUpFIXc/nqd6GDjgrzyQRPGZ2xq9dkhf7BePJAGTcBf4sZOOMLACpTj?=
 =?iso-8859-1?Q?hAC53wOIGv2UNckFWpyG7e/eYQSLa+KDJ+jOULgcR0z/sFV5Pq+JrNW/uE?=
 =?iso-8859-1?Q?l95wJeA+eqFSFVXxVvjAvvZxbsg3mW4tFQyaXexpqGHnddPV/Jd5RxxfbS?=
 =?iso-8859-1?Q?FToIx9xkD2h2mr9FtcNIy5Ft0788Qp8UsviYmExOf/Z80EmF9XCz84+DTt?=
 =?iso-8859-1?Q?4U1h1n/YgjnMqrOcYALC5q+6S+wMnGkADUXbiKuQudgjoIV5y2kLCOU4LM?=
 =?iso-8859-1?Q?ySbUHnBdnmvhXmuqAzxTgvW95okQF8Dsh+aTfUGmuDnWtSUR9ygaGHYR7/?=
 =?iso-8859-1?Q?CyxZsvtDrXpw5g5kzecoJruDK5488CbVc9d7fP8jHj82frY0ljlJFtOHpt?=
 =?iso-8859-1?Q?qXvin7c/cnQcImnCRA5YHO2un86ckOrZ29NMjXJATB4wkUBgitMiv59/7w?=
 =?iso-8859-1?Q?JqkjOjmTGX6jYuPFWZSeZ/Kaj2/XlNO94bU3oVIwCoSCEg6yjsf0eXeXdJ?=
 =?iso-8859-1?Q?YvF+zVoVv6UoKRY1grqAG7r4xvKvHHP8jeqOmC/nnGzIfT3JgI3TPIYFpc?=
 =?iso-8859-1?Q?wG9/PkpEZ8+3Ufe4/sbcNN8Mkg/Nvz3spca0lEq6GlI+cH3PN+mr9GiPOk?=
 =?iso-8859-1?Q?hhjzTySUoMV0+LoMSIsLHgGLUOwwfqM83bLGE6jvHIXEtlSZMV0Y0dCIzd?=
 =?iso-8859-1?Q?1zh9cuI2wGLDVR63eBEm4VCjnxgk6BwZ5qwtIPTBvPhN0A5ePKZvtjMFPA?=
 =?iso-8859-1?Q?coxz5xIhtkomtFOrWwi9RA0LKniH627kumMdyBu3Kaj8RC4qUNSbRxzlTa?=
 =?iso-8859-1?Q?6jMdRTJNJX+0edk8VBW54hykJSE3aUOL7dci50Y8L4A7vusHhQ1Jz8VJTZ?=
 =?iso-8859-1?Q?B9HIcMo1nsxPwlOzVnixZBHw4Jtlxf1q++2u1VzxkzF6QH3NtYLmH10aFm?=
 =?iso-8859-1?Q?Xt1Ze1dK8CAypQWStNovp+OZyy+zNw9msfujKEpbUxKdbovSAsCl+NYzLd?=
 =?iso-8859-1?Q?Jv+RuE6MZ0hz7N+OOGmJwdlZUTkggimhRmQjDe3LvZ9UgYkST1PNpH22zH?=
 =?iso-8859-1?Q?393POTSDFvjKMrV74HAYKvzstJIyKySLVBHoDgdtSbMAOThBovTS1zkF0u?=
 =?iso-8859-1?Q?+wjYD4j7FNDzdDHVqYf61hkPi3VtEM13hbMdFw1NsfxkeVsgl9z6AqmSuc?=
 =?iso-8859-1?Q?Mgltp/lXITYSxlDP15v9TuCdUhdX2Zj52UbRTcsTUEjoQI9tzjEA9umse0?=
 =?iso-8859-1?Q?HuQwJgifO9XmsX9Monzmig91j7tXDEilbSEv1cgUPeOA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?947BMFHkt6mfR7WogxqCle56UbgSn1HDn1BZZ3zerDH2TlwO9R8CvSVyrv?=
 =?iso-8859-1?Q?bE74uAoJDAzlJi8GX6SaUMz+M8WGqxg6+bvmNm/WdgPdvNcecMTBPIRIW8?=
 =?iso-8859-1?Q?42GOsx9SundC8uUoMeF3VYMOsdzbgqx1KJZl+OUOmQIKHVTBnJz34eaRBo?=
 =?iso-8859-1?Q?uuTSF6e0D5DEeEosuUUnV589k0gWwRCxWZrGW4bM3lYZC3hNHC5Trs8Kn+?=
 =?iso-8859-1?Q?xfaL5Gf/cEA32cFvgMgImFYImmVxAmiLYqlBjDteZHy/qsHOhbNs6I1o1A?=
 =?iso-8859-1?Q?jeSWe3oZ4WIy+sCq5leKqbEV8yQZg7D/JHYE8bWOatoQqwuowdu/tMYL6A?=
 =?iso-8859-1?Q?pCG9m71kps3NDamaw0ehnwva5yMRolKbf9e+74Qy6nBFt2ddGOmjOpYWai?=
 =?iso-8859-1?Q?yHRIQdO6a6n6abqDReg2odAHdbaj/exLMdpOrPv/ma1neoTPYYO0lPkI0M?=
 =?iso-8859-1?Q?7kh+kKdwz69dTwPp5e4Q+7Yv/mhAbVNUihHfKoiZB6qJgx/BgcViW0hNF6?=
 =?iso-8859-1?Q?RN/Wyb23emVNc5SUfAwhYiIu9ELAcGJPRdPdBDSSMJm/ezVCA08Q/elc3q?=
 =?iso-8859-1?Q?s0uufQn14e/q2Xx8yS0snTtiJh992oswyNtuJZDlvLnOw1K41AN/2+0sp8?=
 =?iso-8859-1?Q?W03JKhmTyNrtQnkXWW7X5jbaH6nopffEWm9DdoN0nPVn2A+lOMTPqOz7Xv?=
 =?iso-8859-1?Q?XHm6HP0bteqr+b7ACHreDeyQ0JPs8tsmZc9ZjRKThiJXJZTBobiVo5E1Yi?=
 =?iso-8859-1?Q?oVMn9JoLHTi0/adSevTcPuWw6Z/hVy2JV3zRNnxdjV1/FFNNAs8KZlOlYO?=
 =?iso-8859-1?Q?YaQwjdap2FWQO6antj/JuZYdUeFKVtNhHqIdTYEnM+3S8Ya8HoivsGu6dp?=
 =?iso-8859-1?Q?f0motMtcwshp8VcBWgOIwEuVvb4yAx8yuuRHWHqGRhEZphgWNjp/vLeVx3?=
 =?iso-8859-1?Q?BH2yRDz1ESg9xAOo/pGEHbQKwuifeliUhpIZsS1KQ0UCNRggz72FLgGElW?=
 =?iso-8859-1?Q?4yv5Qt7a8T9gyAre9S3UkBQYQNLDf6sTv+VTQdgNL+nO/zB4k/7FX/z5LU?=
 =?iso-8859-1?Q?11c0OXHFNWDo0ay+ko564wmLRrmbtiPjLDRulU/cwArnr0S/5G6rLI+d5b?=
 =?iso-8859-1?Q?k0ZXCLu0n824AWZPQP4cwDnowGAcCbSAsWPmZplf9+D7efnhkcrA/RL57E?=
 =?iso-8859-1?Q?q7giBUjl4gRzgjuGFGDYbzJ9b6SDm1NWmhn2YVNVIEV2NdRv8RrcIyT0Dw?=
 =?iso-8859-1?Q?ZfG5a3TMpwfd+KkiTBKlXC1n6OnVRU8gFGSmJVGRaKbkacGVNU57Mv6oWp?=
 =?iso-8859-1?Q?bGdK3T6BHHPm8Az8SB5LF6M0jr7NtON9p4Nn5bxLRf/lpbbMgm4ngpEf2s?=
 =?iso-8859-1?Q?3ipBXSZbM2Yf94gWtwZVbfQ3NnYy/cG+Oi/z7VXRYE1YofU93YIgGg6hrt?=
 =?iso-8859-1?Q?wb43BUjkMdtLfkC6L8ZVkIWzY3X1u9zcaHCAc2XUJsWO/7X3gfEjEyt0AQ?=
 =?iso-8859-1?Q?3jJA8C5l8/EmrATm98ds3bBtchxi640RhUUZBJmZxgJMdBhrcYXT3SuJvh?=
 =?iso-8859-1?Q?e6ve8+9gMcC3v+U6iDiB0rI9u0mEcluCaX5NUH3w7DRKnqbFRx90AAq0I+?=
 =?iso-8859-1?Q?kQrS4Q1YZo2/2U4sZKuJRNg9MSwe1xNxB4I99STyJEkrC9JODiSlJ7bA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529716ba-6a11-42bc-ac48-08dde4da4904
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 19:53:53.5317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R1buEYN3pQMLVZkoHXdJAS/kPpFur0OS3aFfHgKbC2coqczWFvXc0I+3pBKDqlDuhJm1iqZGCSuGhX0XIcN9HAlfe2Kva7dnwJDRteyTMow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9783


Hello, sorry for the noise,

But I noticed small nick when reviewing next patch, which is very similar.

Volodymyr Babchuk <volodymyr_babchuk@epam.com> writes:

> Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:
>
>> Introduced two new helper functions: gic_is_valid_line and
>> gic_is_spi. The first function helps determine whether an IRQ
>> number is less than the number of lines supported by hardware. The
>> second function additionally checks if the IRQ number falls within the
>> SPI range. Also, updated the appropriate checks to use these new helper
>> functions.
>>
>> The current checks for the real GIC are very similar to those for the
>> vGIC but serve a different purpose. For GIC-related code, the interrupt
>> numbers should be validated based on whether the hardware can operate
>> with such interrupts. On the other hand, for the vGIC, the indexes must
>> also be verified to ensure they are available for a specific domain. The
>> first reason for introducing these helper functions is to avoid
>> potential confusion with vGIC-related checks. The second reason is to
>> consolidate similar code into separate functions, which can be more
>> easily extended by additional conditions, e.g., when implementing
>> extended SPI interrupts.
>>
>> The changes, which replace open-coded checks with the use of the new
>> helper functions, do not introduce any functional changes, as the helper
>> functions follow the current IRQ index verification logic.
>>
>> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

... but with a small fix, see below

>>
>> ---
>> Changes in V2:
>> - introduced this patch
>>
>> Changes in V3:
>> - renamed gic_is_valid_irq to gic_is_valid_line and gic_is_shared_irq to
>>   gic_is_spi
>> - updated commit message
>> ---
>>  xen/arch/arm/gic.c             | 2 +-
>>  xen/arch/arm/include/asm/gic.h | 9 +++++++++
>>  xen/arch/arm/irq.c             | 2 +-
>>  3 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>> index e80fe0ca24..9220eef6ea 100644
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -111,7 +111,7 @@ static void gic_set_irq_priority(struct irq_desc *de=
sc, unsigned int priority)
>>  void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>>  {
>>      ASSERT(priority <=3D 0xff);     /* Only 8 bits of priority */
>> -    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts th=
at don't exist */
>> +    ASSERT(gic_is_valid_line(desc->irq));/* Can't route interrupts that=
 don't exist */
>>      ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
>>      ASSERT(spin_is_locked(&desc->lock));
>> =20
>> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/g=
ic.h
>> index 541f0eeb80..c7e3b4ff0d 100644
>> --- a/xen/arch/arm/include/asm/gic.h
>> +++ b/xen/arch/arm/include/asm/gic.h
>> @@ -306,6 +306,15 @@ extern void gic_dump_vgic_info(struct vcpu *v);
>> =20
>>  /* Number of interrupt lines */
>>  extern unsigned int gic_number_lines(void);
>> +static inline bool gic_is_valid_line(unsigned int irq)
>> +{
>> +    return irq < gic_number_lines();
>> +}
>> +
>> +static inline bool gic_is_spi(unsigned int irq)
>> +{
>> +    return (irq >=3D NR_LOCAL_IRQS && gic_is_valid_line(irq));

you don't need parentheses here

[...]

--=20
WBR, Volodymyr=

