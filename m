Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9772EB300FD
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 19:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089153.1446824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up93b-0008Bz-Uo; Thu, 21 Aug 2025 17:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089153.1446824; Thu, 21 Aug 2025 17:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up93b-00089U-RS; Thu, 21 Aug 2025 17:26:35 +0000
Received: by outflank-mailman (input) for mailman id 1089153;
 Thu, 21 Aug 2025 17:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kfR=3B=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1up93Z-000895-Jd
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 17:26:33 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa19e556-7eb3-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 19:26:31 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI2PR03MB10859.eurprd03.prod.outlook.com
 (2603:10a6:800:270::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 21 Aug
 2025 17:26:26 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 17:26:26 +0000
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
X-Inumbo-ID: fa19e556-7eb3-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlYJtm37QBKt78bKKYqkg4DHccbVEhdPiW0XUYOcRrodG2B+jODNBjE45xXhY+4/W88bez0wGTnaAuiUm+Japfg59zXmmalLqQ9I8HPGiaiwFuWJypfKbwLm0iQNeNUddzs7qe2mH7xhMxHMWYVnYThov6gY+WQ6usdtrYqmNlcLQ17o9h5fRE9P+FJGQNcmcM3uzW518Da5ZkjoiaM5VlFpe650Dd6uur9oIimpYS4tdnQLHhZcU2Cl4j5DnZGsfS2vGaR3Jq0eUd0dXybg8x2gVQKX4srBCp4I+QtHFaQgJtpy3u5O5QORTYEyf0NRlqVlxwDQX0DZehRqqXYVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwT6Or/ZChDDRcLKK/ZsrIZFOMZmKSc31jdaXdvaFa4=;
 b=qgjC5LrAgvv8tAYT8aVTIUMTZumQa9RsyKlePe95xVzUT/zXozpo9DVUOfJvOhKRHxKhEJDupXsYW+plffoevg6lNdg8pqlo1NGMznGDXlzoDfcg3S0vDSvIBtjGs73lchJ5Z5SfGQHHpaxS0SpqoQuQp+WvJ0zwb1w/KTFwXEDT/pWgDTTaqs2L7E6w3tYE3nbaqwS7yM5U8DgwzAlsta948I9u4HRUxAlmMNCL+2KUwKL7T/iGSPAL4HnbO9dayWh01uBSnMegiQAwGrcDuNkRKNlZ/uKZDYLpRG3b47BD6D+dXQbi39EGGqxhAL7DksTpvFaGU7Et7LjOev130Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwT6Or/ZChDDRcLKK/ZsrIZFOMZmKSc31jdaXdvaFa4=;
 b=PvfGuKXqAzT3o4mNI1Lt8IVI5XE+YUdoUX1UHK4O1twTAC1I3up7yBM4s0+WFoio3dlji8nmbewnuVxq5JgB5jHOiEI7KeWxinGEhqh05jJrGN9apxYjzZ6ZlhCJ+PCBptdQ11AwVGfNxDGhMhJ9lvDbNKlg4qoGh320OXAP/t698w0gq7QcKba7w35x+Tzv7xmCGWlXNe7wqNFzfK4U4yb0YFGsws9sHvRb87R/Gv4O3VKGyQ4LmMe8E7P/S7oRiB3Ih5pXVM1+vPYBz9zQmPkyPxh24LHB0HZp5XZqB8KAcaRZzS0pNUf23qMjI05+sotNQ5VIh7DfF4wpblUSEg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 10/10] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v2 10/10] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcB5d/vX6zkEc6YU++KKhW5OV9og==
Date: Thu, 21 Aug 2025 17:26:26 +0000
Message-ID: <87a53sd1ry.fsf@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	<3ba2381b4c782a5187161f9418e5a35e7916c752.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <3ba2381b4c782a5187161f9418e5a35e7916c752.1754568795.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Thu, 7 Aug 2025 12:33:34 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI2PR03MB10859:EE_
x-ms-office365-filtering-correlation-id: 265aa165-a7a4-45c7-ab8b-08dde0d7dbd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?RUUqy2sA69jX3Rowtgj5V32LRq/1dNfdb+n8hxCQ2T7TL2Lr10qO6adIWm?=
 =?iso-8859-1?Q?vSFYZjDwwmLwXqEZSHiaFpQNufU3hYJx6fPnWe7cadcsAsHfl1Ra/NYQpk?=
 =?iso-8859-1?Q?wINtLQjZNaa2vCMyPd617WZlR/fg1EGOa2DskV3EqKniitm+dwu9JqCnB8?=
 =?iso-8859-1?Q?QnlHHzJv7qwIk1Ktw6bh9ThExh+zPXpe9yIaLOSUse4qYvMrSWUgm2A1p1?=
 =?iso-8859-1?Q?uv11pS2Khy2JmQ41RwVEW0amXDzKaA2uJWkKfMQ/cYmlYaPtd9mqMbm0Dw?=
 =?iso-8859-1?Q?wL7QZX0ZU3up9bnQK5EWP6P/8z7N5IrlRKO1eKg9MqqWYm4M6dC3wVOTd6?=
 =?iso-8859-1?Q?VLEI3y9vD1rUXDNanjDcCtiIgff4FMvNc20RDy6VyMCvzSpVtfHO83V0F1?=
 =?iso-8859-1?Q?j7H7rP9J2vOnjWWOiqCsf4Wv6oeLvx2iUnemfTHv6vKX74/165GThxE+ww?=
 =?iso-8859-1?Q?iYu8pm3W7ONhRsqkDfVecbhWiomjUMIJh5P/pO30XkqPQwEpSBzTJvhXFc?=
 =?iso-8859-1?Q?ZNASVpBGwjnA0PyQ0BoQj0pZZLYGuVKMRQ0HQoi+SIozpWeN8ySrQEDxhR?=
 =?iso-8859-1?Q?2B9l5NZTL524ST83e24Jc/u+X6lyXKR/te0duGJ0cjHx/2AoGaqUKkzG3p?=
 =?iso-8859-1?Q?xSqdFRocjwUUe7LbRjl1rfF6AD8zjwWRg9/rl472qyl264U5q5HumSXKmT?=
 =?iso-8859-1?Q?60Jissyy5x/zBLqOAI1s5RJcEOr1DY4LRYBOYoh0LiU2ae75msNzZ7L4lK?=
 =?iso-8859-1?Q?nCSg5w77beROg0xp9H5dQk2sIvSsuuLdLA1tfo07EN9cezjcfrbogFyiCO?=
 =?iso-8859-1?Q?Rmo44uWhw7jx7ZNygauMCYK1HHBGyVTQ28loppOykCsjqlAR8zCsNOGHIs?=
 =?iso-8859-1?Q?6jiLhh72qX+5BAZXwLf+gU9lVqH477dMUtdN+Xwo5MIgo780BsbqvmZ7wX?=
 =?iso-8859-1?Q?hyEHhykW9yA2eopv+9AJlBl2SPGjCD2P9CIu2CtuZMg0/MynH6qslyFRSy?=
 =?iso-8859-1?Q?JmT3HVdwORYddb4hUny1d+D/l4tCNsC1CH2CjGMmwV95ProBtCJiKRHegL?=
 =?iso-8859-1?Q?/5z5FTQ35XC8QZL2qbh1L+EuNF6KM5sAiq31v/jrwR+E3H8hX4JUbtBwLc?=
 =?iso-8859-1?Q?AS0AO/JD772hAF29QNiDaX0kN4FL99n9SSqtn7NwDkt4TWoa4RR6ouapmk?=
 =?iso-8859-1?Q?sidVawKTh+E/iR4jrvFexECo8tazuJEYbyQLUrb1gNSYyOktWPfa0lXj9E?=
 =?iso-8859-1?Q?JD4IVdtLyVBW+o+3PpaFWGM3WPYlbHc52Gr99s+reQikP0sCDFM7aOe5b3?=
 =?iso-8859-1?Q?ZOkiFYJJ7ro8MQTdX2nb8s6yUHWb7yuYFNV8fdk8eJMLB0RS3wdyjo0FMz?=
 =?iso-8859-1?Q?fcDC7GPK6+/8AYX526dZtXkz8EyaI2jPJ9n7JPzWIvNGDNx6zGxpNAKJtg?=
 =?iso-8859-1?Q?Fs2dFcZT5N1QOJ0enbm5uoDBYP7YB482BsT9FbVD7vPq66t7s8Y2KBgmec?=
 =?iso-8859-1?Q?VY3GI1fJAe0HlL1LyoefaPFWvc7hZZHMQE7ZihKKHb3w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8uyDrZhj39sVK87V2qIYUuBDMuAFMTjdKbtkrN3ja66KXVfsJX0dgM9tZt?=
 =?iso-8859-1?Q?tFhI4RN1kqShBsXDTbaWwvMolJEL1DXg9AtGwMllxUb+GP1NC2tbvMTq0e?=
 =?iso-8859-1?Q?/A6GeJJXjVfnsxMOTc7OwHiFe8AplLzigEAkuinqi+FqmDqPvDH6cPe2He?=
 =?iso-8859-1?Q?bJZ2EYr3mfCSOwF81qFWPN/7iJFXLK85mzFlwAxSLCUqZoip8ljGzWGy+G?=
 =?iso-8859-1?Q?fqQnfdAj7V/Jw11FQyJXAYWk+LuWlxqChMm2EGgv+BNU7slvzAWfYVnUNK?=
 =?iso-8859-1?Q?JkI+yuw4IufullXXH9uER6nfr0gHjfVrMxjBjNxnHkdQKtw+y9ab6DCGIL?=
 =?iso-8859-1?Q?a05GEp8995PGQmS5LA1PWOaLtzSsCqftO3f6zc1zpSCCzcsCBTjZOeh1yU?=
 =?iso-8859-1?Q?RLTUMziEg02y0sfXrlyW/bgNFDOuN3rsiSBeDLu0+qzf92RTydawwpIX5R?=
 =?iso-8859-1?Q?0zcAoOEHesL86Uun2oVO6vkwM+47wJBFkvyOLjfomwrClDMC/XV2mbAQpc?=
 =?iso-8859-1?Q?JSMGXw8OkeLZXAYYlzpavV+BaqjG7Zs1VR3juMxkSudXWA2/TkX7uEBEWW?=
 =?iso-8859-1?Q?XqunDmtDj2cb37BNrMUh/HCZ4OwG02sFdtZNr3qsSIVSffM1mlK39N+D6U?=
 =?iso-8859-1?Q?/pckUbOcLY2A30A/ssKhEDPDdT0XoDYk0CVoehWoZtGhu6wgoX+jabxeE8?=
 =?iso-8859-1?Q?ytPTG5OwZiMcmLONOYdveCoWJzofIJT4j1hBchnEPs/Kza8aC/KfXOBYsO?=
 =?iso-8859-1?Q?+2gMyTFXaPdVuCW0Q/PuMsZOrrfr9+SvbX8Xzroro3VEt7gVo2t5NEjrD3?=
 =?iso-8859-1?Q?kL7O4+HCu9ulXHE6nsq2tbO8h0m5Gesu5+f/tqe6jw/JrRWeNr6yFAUAiV?=
 =?iso-8859-1?Q?Zr9KkS9D6Y3X8GmR02LBIuivn/e4a0Gsdkszu88g8eJNRdmlLX6IEJG7J7?=
 =?iso-8859-1?Q?npnNUDyjTwogiTj6VHPIesaYNLQttaAW+IuEAm7r6X3kdt2/9IJwJKo2pE?=
 =?iso-8859-1?Q?S+hmJWCicTQFm+HTmR8trXJEJo9kaYnao2vL1noIRsfF48GSkFxYIaTF5q?=
 =?iso-8859-1?Q?p3C/+j0qbv4ijeydwWN2cXh882odZy0OJ4vh1dxjdAbQDs9GU4Q2SKo6Lt?=
 =?iso-8859-1?Q?83+KzKOyq54otOXCpymo0Y2KeJFzqT9qsYyCjTKFgrfRsumE4jch8cXy63?=
 =?iso-8859-1?Q?8S+cR+t+1w9T+Ib4LrBnhk2Wt9Kdc9ZPn9TK/kTMGaPZQXePExWWSuR9E+?=
 =?iso-8859-1?Q?8Sv0JDYbPRQ/7eHTk1HAMPPkmsXvoIW32+f4mPkNyBFpfDDNhSJbX1nXkR?=
 =?iso-8859-1?Q?vDJOfxR8iH1osh35ywIMvO07z6dBFoq5gLuv79wyIFhOVbN8ACrrpuNwuO?=
 =?iso-8859-1?Q?HXLuzfWobvg8OVErsee1UFa95EInioBUx4G7UjuS6Sd8+gDBSaRER4JZDz?=
 =?iso-8859-1?Q?6KFUK0KrH+CHYrgLDwyGSAePbmM00g/Ph7XZX9ad7hDKdokpuSqMd5o+SZ?=
 =?iso-8859-1?Q?+A8hrOPhUPM9Qwe/xDn4devm0Slr02QK3mVomGRHvKfCPAZB37m3gw0VNk?=
 =?iso-8859-1?Q?z0HhAU5LRv7dxC4woJ3ZlW1Dqmyp/Li9Ljcv/Aj3kCBcADnKFyME1O/uMz?=
 =?iso-8859-1?Q?/rNJbbOgpzpUMT/kqCBXwDiWVSLD+j4qfgI/F0MRpzbcbq6xiBO7lkwQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265aa165-a7a4-45c7-ab8b-08dde0d7dbd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 17:26:26.6930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oHK5UrH8lH/Tj+xLfuZpxRqHri/hjJTelu8Uvtp7yCieURO9d6G5Sfxqf+rMLV4nKCL9CMBFlMZbKzP0uhZNxbdnhszIyHjcEg8do+4tw3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10859


Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Implemented support for GICv3.1 extended SPI registers for vGICv3,
> allowing the emulation of eSPI-specific behavior for guest domains.
> The implementation includes read and write emulation for eSPI-related
> registers (e.g., GICD_ISENABLERnE, GICD_IROUTERnE, and others),
> following a similar approach to the handling of regular SPIs.
>
> The eSPI registers, previously located in reserved address ranges,
> are now adjusted to support MMIO read and write operations correctly
> when CONFIG_GICV3_ESPI is enabled.
>
> The availability of eSPIs and the number of emulated extended SPIs
> for guest domains is reported by setting the appropriate bits in the
> GICD_TYPER register, based on the number of eSPIs requested by the
> domain and supported by the hardware. In cases where the configuration
> option is disabled, the hardware does not support eSPIs, or the domain
> does not request such interrupts, the functionality remains unchanged.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V2:
> - add missing rank index conversion for pending and inflight irqs
> ---
>  xen/arch/arm/vgic-v3.c | 248 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 245 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 4369c55177..1cacbb6e43 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -111,7 +111,7 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_ra=
nk *rank,
>   * Note the offset will be aligned to the appropriate boundary.
>   */
>  static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *r=
ank,
> -                               unsigned int offset, uint64_t irouter)
> +                               unsigned int offset, uint64_t irouter, bo=
ol espi)

I am wondering: maybe it is better to pass virq instead of offset into
this function? In that case you can get rid of espi parameter.

>  {
>      struct vcpu *new_vcpu, *old_vcpu;
>      unsigned int virq;
> @@ -123,7 +123,8 @@ static void vgic_store_irouter(struct domain *d, stru=
ct vgic_irq_rank *rank,
>       * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
>       * never call this function.
>       */
> -    ASSERT(virq >=3D 32);
> +    if ( !espi )
> +        ASSERT(virq >=3D 32);

better to write
ASSERT (!espi & (virq>=3D32))

and probably you need symmetrical ASSERT for espi =3D=3D true

>      /* Get the index in the rank */
>      offset =3D virq & INTERRUPT_RANK_MASK;
> @@ -146,6 +147,11 @@ static void vgic_store_irouter(struct domain *d, str=
uct vgic_irq_rank *rank,
>      /* Only migrate the IRQ if the target vCPU has changed */
>      if ( new_vcpu !=3D old_vcpu )
>      {
> +#ifdef CONFIG_GICV3_ESPI
> +        /* Convert virq index to eSPI range */
> +        if ( espi )
> +            virq =3D ESPI_IDX2INTID(virq);
> +#endif

If you define ESPI_IDX2INTID() uncoditionally, you can get rid of #ifdef
CONFIG_GICV3_ESPI here

>          if ( vgic_migrate_irq(old_vcpu, new_vcpu, virq) )
>              write_atomic(&rank->vcpu[offset], new_vcpu->vcpu_id);
>      }
> @@ -685,6 +691,9 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
>      {
>      case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>      case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +#ifdef CONFIG_GICV3_ESPI

Do you really need ifdef here?

> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +#endif


>          /* We do not implement security extensions for guests, read zero=
 */
>          if ( dabt.size !=3D DABT_WORD ) goto bad_width;
>          goto read_as_zero;
> @@ -710,11 +719,19 @@ static int __vgic_v3_distr_common_mmio_read(const c=
har *name, struct vcpu *v,
>      /* Read the pending status of an IRQ via GICD/GICR is not supported =
*/
>      case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
>      case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> +#ifdef CONFIG_GICV3_ESPI

Same as here

> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +#endif
>          goto read_as_zero;
> =20
>      /* Read the active status of an IRQ via GICD/GICR is not supported *=
/
>      case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>      case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
> +#ifdef CONFIG_GICV3_ESPI

... and here and in all other places

> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +#endif
>          goto read_as_zero;
> =20
>      case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
> @@ -752,6 +769,61 @@ static int __vgic_v3_distr_common_mmio_read(const ch=
ar *name, struct vcpu *v,
>          return 1;
>      }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> +        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT=
_WORD);
> +        if ( rank =3D=3D NULL ) goto read_as_zero;
> +        vgic_lock_rank(v, rank, flags);
> +        *r =3D vreg_reg32_extract(rank->ienable, info);
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> +        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT=
_WORD);
> +        if ( rank =3D=3D NULL ) goto read_as_zero;
> +        vgic_lock_rank(v, rank, flags);
> +        *r =3D vreg_reg32_extract(rank->ienable, info);
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
> +    {
> +        uint32_t ipriorityr;
> +        uint8_t rank_index;
> +
> +        if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto=
 bad_width;
> +        rank =3D vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DAB=
T_WORD);
> +        if ( rank =3D=3D NULL ) goto read_as_zero;
> +        rank_index =3D REG_RANK_INDEX(8, reg - GICD_IPRIORITYRnE, DABT_W=
ORD);
> +
> +        vgic_lock_rank(v, rank, flags);
> +        ipriorityr =3D ACCESS_ONCE(rank->ipriorityr[rank_index]);
> +        vgic_unlock_rank(v, rank, flags);
> +
> +        *r =3D vreg_reg32_extract(ipriorityr, info);
> +
> +        return 1;
> +    }
> +
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
> +    {
> +        uint32_t icfgr;
> +
> +        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> +        rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WOR=
D);
> +        if ( rank =3D=3D NULL ) goto read_as_zero;
> +        vgic_lock_rank(v, rank, flags);
> +        icfgr =3D rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGRnE, DABT_=
WORD)];
> +        vgic_unlock_rank(v, rank, flags);
> +
> +        *r =3D vreg_reg32_extract(icfgr, info);
> +
> +        return 1;
> +    }
> +#endif
> +
>      default:
>          printk(XENLOG_G_ERR
>                 "%pv: %s: unhandled read r%d offset %#08x\n",
> @@ -782,6 +854,9 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
ar *name, struct vcpu *v,
>      {
>      case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>      case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +#endif
>          /* We do not implement security extensions for guests, write ign=
ore */
>          goto write_ignore_32;
> =20
> @@ -871,6 +946,87 @@ static int __vgic_v3_distr_common_mmio_write(const c=
har *name, struct vcpu *v,
>          vgic_unlock_rank(v, rank, flags);
>          return 1;
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> +        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE, DABT=
_WORD);
> +        if ( rank =3D=3D NULL ) goto write_ignore;
> +        vgic_lock_rank(v, rank, flags);
> +        tr =3D rank->ienable;
> +        vreg_reg32_setbits(&rank->ienable, r, info);
> +        vgic_enable_irqs(v, (rank->ienable) & (~tr), EXT_RANK_IDX2NUM(ra=
nk->index));
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> +        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE, DABT=
_WORD);
> +        if ( rank =3D=3D NULL ) goto write_ignore;
> +        vgic_lock_rank(v, rank, flags);
> +        tr =3D rank->ienable;
> +        vreg_reg32_clearbits(&rank->ienable, r, info);
> +        vgic_disable_irqs(v, (~rank->ienable) & tr, EXT_RANK_IDX2NUM(ran=
k->index));
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> +        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISPENDRnE, DABT_W=
ORD);
> +        if ( rank =3D=3D NULL ) goto write_ignore;
> +
> +        vgic_set_irqs_pending(v, r, EXT_RANK_IDX2NUM(rank->index));
> +
> +        return 1;
> +
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> +        rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICPENDRnE, DABT_W=
ORD);
> +        if ( rank =3D=3D NULL ) goto write_ignore;
> +
> +        vgic_check_inflight_irqs_pending(v, EXT_RANK_IDX2NUM(rank->index=
), r);
> +
> +        goto write_ignore;
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> +        printk(XENLOG_G_ERR
> +               "%pv: %s: unhandled word write %#"PRIregister" to ISACTIV=
ER%d\n",
> +               v, name, r, reg - GICD_ISACTIVERnE);
> +        return 0;
> +
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +        printk(XENLOG_G_ERR
> +               "%pv: %s: unhandled word write %#"PRIregister" to ICACTIV=
ER%d\n",
> +               v, name, r, reg - GICD_ICACTIVER);
> +        goto write_ignore_32;
> +
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
> +    {
> +        uint32_t *ipriorityr, priority;
> +
> +        if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto=
 bad_width;
> +        rank =3D vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE, DAB=
T_WORD);
> +        if ( rank =3D=3D NULL ) goto write_ignore;
> +        vgic_lock_rank(v, rank, flags);
> +        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, reg - GICD_IP=
RIORITYRnE,
> +                                                      DABT_WORD)];
> +        priority =3D ACCESS_ONCE(*ipriorityr);
> +        vreg_reg32_update(&priority, r, info);
> +        ACCESS_ONCE(*ipriorityr) =3D priority;
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +    }
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
> +        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> +        rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_WOR=
D);
> +        if ( rank =3D=3D NULL ) goto write_ignore;
> +        vgic_lock_rank(v, rank, flags);
> +        vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGR=
nE,
> +                                                     DABT_WORD)],
> +                          r, info);
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +#endif
> +
>      default:
>          printk(XENLOG_G_ERR
>                 "%pv: %s: unhandled write r%d=3D%"PRIregister" offset %#0=
8x\n",
> @@ -1129,6 +1285,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v,=
 mmio_info_t *info,
>              typer |=3D GICD_TYPE_LPIS;
> =20
>          typer |=3D (v->domain->arch.vgic.intid_bits - 1) << GICD_TYPE_ID=
_BITS_SHIFT;
> +#ifdef CONFIG_GICV3_ESPI
> +        if ( v->domain->arch.vgic.nr_espis > 0 )
> +        {
> +            /* Set eSPI support bit for the domain */
> +            typer |=3D GICD_TYPER_ESPI;
> +            /* Set ESPI range bits */
> +            typer |=3D (DIV_ROUND_UP(v->domain->arch.vgic.nr_espis, 32) =
- 1)
> +                       << GICD_TYPER_ESPI_RANGE_SHIFT;
> +        }
> +#endif
> =20
>          *r =3D vreg_reg32_extract(typer, info);
> =20
> @@ -1194,6 +1360,18 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v,=
 mmio_info_t *info,
>      case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>      case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
>      case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
> +#endif
>          /*
>           * Above all register are common with GICR and GICD
>           * Manage in common
> @@ -1216,7 +1394,11 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v,=
 mmio_info_t *info,
>          /* Replaced with GICR_ISPENDR0. So ignore write */
>          goto read_as_zero_32;
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(0x3100, 0x60FC):
> +#else
>      case VRANGE32(0x0F30, 0x60FC):
> +#endif
>          goto read_reserved;
> =20
>      case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
> @@ -1235,8 +1417,30 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v,=
 mmio_info_t *info,
> =20
>          return 1;
>      }
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
> +    {
> +        uint64_t irouter;
> +
> +        if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
> +        rank =3D vgic_ext_rank_offset(v, 64, gicd_reg - GICD_IROUTERnE,
> +                                DABT_DOUBLE_WORD);
> +        if ( rank =3D=3D NULL ) goto read_as_zero;
> +        vgic_lock_rank(v, rank, flags);
> +        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTERnE);
> +        vgic_unlock_rank(v, rank, flags);
> +
> +        *r =3D vreg_reg64_extract(irouter, info);
> +
> +        return 1;
> +    }
> +#endif
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(0xA004, 0xBFFC):
> +#else
>      case VRANGE32(0x7FE0, 0xBFFC):
> +#endif
>          goto read_reserved;
> =20
>      case VRANGE32(0xC000, 0xFFCC):
> @@ -1382,6 +1586,18 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v=
, mmio_info_t *info,
>      case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>      case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
>      case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
> +    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
> +    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
> +    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
> +    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
> +    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
> +    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
> +    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
> +    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
> +#endif
>          /* Above registers are common with GICR and GICD
>           * Manage in common */
>          return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
> @@ -1405,7 +1621,11 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v=
, mmio_info_t *info,
>          if ( dabt.size !=3D DABT_WORD ) goto bad_width;
>          return 0;
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(0x3100, 0x60FC):
> +#else
>      case VRANGE32(0x0F30, 0x60FC):
> +#endif
>          goto write_reserved;
> =20
>      case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
> @@ -1419,12 +1639,34 @@ static int vgic_v3_distr_mmio_write(struct vcpu *=
v, mmio_info_t *info,
>          vgic_lock_rank(v, rank, flags);
>          irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
>          vreg_reg64_update(&irouter, r, info);
> -        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, iro=
uter);
> +        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, iro=
uter, false);
> +        vgic_unlock_rank(v, rank, flags);
> +        return 1;
> +    }
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
> +    {
> +        uint64_t irouter;
> +
> +        if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
> +        rank =3D vgic_ext_rank_offset(v, 64, gicd_reg - GICD_IROUTERnE,
> +                                DABT_DOUBLE_WORD);
> +        if ( rank =3D=3D NULL ) goto write_ignore;
> +        vgic_lock_rank(v, rank, flags);
> +        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTERnE);
> +        vreg_reg64_update(&irouter, r, info);
> +        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTERnE, i=
router, true);
>          vgic_unlock_rank(v, rank, flags);
>          return 1;
>      }
> +#endif
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    case VRANGE32(0xA004, 0xBFFC):
> +#else
>      case VRANGE32(0x7FE0, 0xBFFC):
> +#endif
>          goto write_reserved;
> =20
>      case VRANGE32(0xC000, 0xFFCC):

--=20
WBR, Volodymyr=

