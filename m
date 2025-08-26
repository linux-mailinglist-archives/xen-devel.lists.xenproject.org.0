Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9ADB37520
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 01:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095282.1450358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur2ep-00028E-GE; Tue, 26 Aug 2025 23:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095282.1450358; Tue, 26 Aug 2025 23:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur2ep-000256-CS; Tue, 26 Aug 2025 23:00:51 +0000
Received: by outflank-mailman (input) for mailman id 1095282;
 Tue, 26 Aug 2025 23:00:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNE8=3G=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ur2en-000250-EY
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 23:00:49 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e8c8333-82d0-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 01:00:43 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9793.eurprd03.prod.outlook.com
 (2603:10a6:20b:61b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 23:00:41 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 23:00:41 +0000
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
X-Inumbo-ID: 7e8c8333-82d0-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYaxVXxcT6TaKKPspm4okR5Krr0Lej0RQF2uIhrV0WvFv7TwV4K3J5kj5YyEpedzdwm/fV6/fle0WJa0lsvyvdXWQwEQ6KzhnSuTK51/bDZnE6IggLrvwwQ5Dr1rJlIoFVOoYPRnYjYjjM3POvLypu9fCWiRywy5jeqXM2RP7ZYKxrcaQeWMoFhimROiVDxjpIOMhFRxdrkuFuMdjriKqFxmmNy9226uCkydHfMc7F26DV8GfMn/7Rtta41ECaDHhIb3Ym+LFYIOU5PnLm09XZb/bKRwkBtUWx0JYQvn07TeF386FwdUVWwSKqRkrU/Ofop6dRcDYI0pwTLL0dkwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmkSNS9ylKn0b7xKfSxRa/jtz6WLT5bDhEbbJdAP8vY=;
 b=mdYStMN0jmpTRLex7Bh4qHVmsJG8WCIjALVnOwv+kuRgmjT2WWUpufXlxzVypU9fHJkGrcabOpQicn3iSTFzqPAl0nOBGFn3nEdJ/rv9N/n58eK19JDXcsd1JbXiCxsruxaXem3wJ2YqgTzVH0Poy+4Ip0GmgweWAl9LMISL6KoargsAdpeYgNo85yDhrab96AXkr9Qmqaot1t/R+jj33NR2ZF2/GRk4wLxqD3L+x7tfwAgSSb4iN5IM+7eiXg9hXsXeOrR4hMBG5/i7FxP0ZirhVhXcn8qXLihstAWKutzxM1kiX8feiusGKshvyp1bScYw9TvvNCJvr4oKJf1LrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmkSNS9ylKn0b7xKfSxRa/jtz6WLT5bDhEbbJdAP8vY=;
 b=Pff5hhmqTq8ZBFufdVtCErdAPRv2Sk0X0CO82ZEsHjGJ5jH2N+Md2FWjGD8KshvvdXeyDycOgsEBmJuugLGtPxMfliTsQ5lQ+hmq7OWDLvRX2KWzsbdJn8IQWYWCZ9+EkCyjp8DrGb7CV2n9Q0M6i4LL1fYYrhgBN+JzKDZDGRJlp33NuUkvlEBZVNZNvb/wVbU2hd41PUKcl2B1oqZfoRby+2ADVxxerRh2G1f61RJ+fivmSMlRNreSWw6grE93X+RXRoe74vkjImNgmQm7wm3KtnUweIsFfXgDGcdE5USI+9y4xb4+EqDpLbvoB5zksURbEqcL1t+gjllZy4BRNg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 08/11] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Topic: [PATCH v3 08/11] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcFpKACzOaRjOW50q/bIpnflDhkw==
Date: Tue, 26 Aug 2025 23:00:40 +0000
Message-ID: <87a53l4rjb.fsf@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
	<88254ec24a25e3d99950fb5041ac6b050aaa1e4a.1756216943.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <88254ec24a25e3d99950fb5041ac6b050aaa1e4a.1756216943.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Tue, 26 Aug 2025 14:05:38 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9793:EE_
x-ms-office365-filtering-correlation-id: 860d6ab6-7db2-4ba3-eb11-08dde4f46136
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Dv5txMbKaSpnkRnAy6Lt4ht5YTTv/ANixKonWF7+CS7MZTD92fxHARs1Jj?=
 =?iso-8859-1?Q?kIEiXU3CKMdZpXxD017oNwP0YtaZuqVfalB0lSfQC6FYaGOrT7Di+OUQPc?=
 =?iso-8859-1?Q?gWc/EZVeTNWQV1zQ/pa+evm7DN9RNOGCs/QD5M8Z+dqGaQ92fKtZItwk9d?=
 =?iso-8859-1?Q?RS4e51v+BznnzQlrDh7stKRcMpaOPI9N8Ko2NRgUUj2jjgIgM9X2ohymgs?=
 =?iso-8859-1?Q?qQuOqS6eax3Psj1xjd59kUQvFAFlShLPD76Et2WOs3vadBtj/wheoiiXnW?=
 =?iso-8859-1?Q?iLAAYXu45UOOLAWthJxz89LRtg1vgSx1QbR2UCpeYjIeDSJ0yjj3WW+XUo?=
 =?iso-8859-1?Q?Dw5LQ39e8IGJ5rk8vfwjD7FZAuFykgLx0Afdq7TBDYHMT4slB8/l0OTDTq?=
 =?iso-8859-1?Q?DIiWMbFIECaQZcqUXWP4pWQrxy5/NIlSRo1f/9TJvyR2L5a453/RKQJTRq?=
 =?iso-8859-1?Q?rsn8+5B4E+b5XmPFM4zstuYt7uk2JUiaAw7+y6t/7vgpQi4k4ABOkex+Xj?=
 =?iso-8859-1?Q?ijET1GprDWpuf3jjy60/ANFHyTh3hYWOw0033ez8X60Tb5buHNHHEqche4?=
 =?iso-8859-1?Q?snPy4m3UHx34I83rwpcr2IZwQaIWA60v5cUvc4PG16dDKUf8sh3N5MWFVC?=
 =?iso-8859-1?Q?nGYq7EMLoV/T7L+0Lwh6UQvGcvobdLO6tLIo4q/j1SYxXFuD7XnyRD/e1C?=
 =?iso-8859-1?Q?ZW4NzPhEwZN0kfwjuCo8Ry/5tNYHBDzQ7mn81pPwiujoo2t9pp/xB7f03x?=
 =?iso-8859-1?Q?wQl1vmjnyzvuOGNPTbN2ufiyUYW/9yrg4B2esKNi1bgnptVE48gGrYna4m?=
 =?iso-8859-1?Q?SogCJzAVJJQESWVzXTph57RxnAcirXwb6mZti2YkNSu2obwAX8fTrceQd4?=
 =?iso-8859-1?Q?fdD2UyPmjoTPZkJJykxjIRBa8IcMZT6UmTvXxrDnY+e4Z+nioz6p2crLVt?=
 =?iso-8859-1?Q?tqE3G4d8BLYIUCCz7lkwRsVbkrRvLE+4gxiHS7dAzMCi9z+rYBJXBy+2zY?=
 =?iso-8859-1?Q?nlUP15SKpP8mMfT1PFa3JdXyzGm2B3xf5dRjSl5x5wybFniw6wnqs058LR?=
 =?iso-8859-1?Q?ca/91OKlUkPPRs8l2m4OSAKajwoDeKfSaeUtriDSxbVA0P79rTvtCDA8eh?=
 =?iso-8859-1?Q?6jteYjj4bI/Rz5eYQEhTBOyXA0n/oXB37T1Gt6DZsN0njPixdYJBySBG0W?=
 =?iso-8859-1?Q?ZX/5fuUec9ZptlQZhB9qVVpLt/g8toVLQEUCyZCmlXfkkuI3fufSowVODB?=
 =?iso-8859-1?Q?9jYHoCsGBmJZb1GY6uuX8HK3awaKSai9FzTUSczrdG30KgS2H1LbDsrud4?=
 =?iso-8859-1?Q?jLX0tnbJ5eTA4zc+aLDpPkiX5UNv+qBly57GrRA/X0ZHnxDuje5i6XTfKA?=
 =?iso-8859-1?Q?A15X5E7r0+FW6JZmVaCPyB4W8eBBkDrfUCHxZXrlz2rs0TebJJ2KFUAaX4?=
 =?iso-8859-1?Q?63YK2K3RAfo1DAs8Yt6pPfl/h1CxKqfRwR44IwZmUA5XCOfZc5bQquya0G?=
 =?iso-8859-1?Q?rOL6xc2+hPrQliLnK5KFvgTV2P5apg5YAOPnCG2llgzw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wTIhcjaQH9pd/hILANDAFfpXNZHg6z7aKavEVylqRbikNzEFDbQbkoPQlV?=
 =?iso-8859-1?Q?V9OA8cTUJcZxy1y5ANCt38seiRySwVvhcWNBuR0AeB6wuFxHuFb5m2668e?=
 =?iso-8859-1?Q?zjcLjlQZHHROLu0YsY3NjDNTmVkpXxMjU5zpBOVmiQCd/T7enQaoiyvAVq?=
 =?iso-8859-1?Q?iI9fp3jCg/NLMh6Lnm+9qDZZEy3vG4DwG1PIAcQul6JbnnPd6uWB7wlRso?=
 =?iso-8859-1?Q?1xXfKgH6RGFE87fvO9Wesr0ofYxZGfjxVt77y/6XvPuDTOAIIhq9KzK9PU?=
 =?iso-8859-1?Q?g+zacPmijBJKoI2vTPyV8uuSazT+DstnUn9P1fbz7p9ENZ9+GV3xnI6Uox?=
 =?iso-8859-1?Q?zy/UqMUrvlqdfmbX/UaTJXG98y3M+5pS/UpUM+ZHQNWqcaQzTYpqvqqFkd?=
 =?iso-8859-1?Q?ccbodBi3Q2AOi6U5GsHkoQ6owtB5xNDupU4PV6JA1ubLTbWXcM3Ois8SCa?=
 =?iso-8859-1?Q?d6zH49BsKY4LatrgS+IRmgMEltHLJOqpNrvDdvi4TIEdPgxBhfdvasaNI0?=
 =?iso-8859-1?Q?8aW01oA4C1VKdm804SUw6dwJBXYpsgwI1Z5R5T4zx1/puE61YUqYBhfwqA?=
 =?iso-8859-1?Q?/ebaES5HRrV63rjgwr41rk0eNVOJbOWmnqrow2x8u+hhZCALXO5A7UroVn?=
 =?iso-8859-1?Q?llXhq3oJHEzpKO8wLKVknrnswg/vnDGmPZv8i8X13e16rDMSh8M+OUgkK8?=
 =?iso-8859-1?Q?olBlu7uQPhMcHzqJhow/jtgAiu3NVtdGJjuIeh5XiXqDyi0nXJDUcRnK4h?=
 =?iso-8859-1?Q?oAgJLPf1UKpe3eaBn6EBJnI4vIWyq2A0nnwLnI5wXT55Wuxt1N2pw9qh4G?=
 =?iso-8859-1?Q?qZn1Xn1XV0IPGkoDkKGlMsN5cM7PKuT0Cs3s92UbR4IAzVFcbZgY+JKz/M?=
 =?iso-8859-1?Q?+FJx4yHrq/gWYf+zJ5ga774M/Bke8EKKOXsVtJWXPoaG6FKOWWL56jVHmL?=
 =?iso-8859-1?Q?zgfKHqjzGGaBkS3syBjZU9ex9PwLAVr9K56gSW//E94cJukjRsdoEN9NVA?=
 =?iso-8859-1?Q?bImekdPFmUZFKkjkJ4GrMP3DR/Bg3DWt8m3fktYux2bDuQyaKdMV5N+koq?=
 =?iso-8859-1?Q?jY+dCnl+LWt0ElihMK2nD0wtQKO8YBiOwke54uphv3cVUnEhldz2geLnp/?=
 =?iso-8859-1?Q?B3EhU4IQ6g01A5EmElMnd4Ck7bVTbWccmd3dL1PzQYF39t19dpaEKuF7ow?=
 =?iso-8859-1?Q?sUfSW7BfCr96hx6hEFWvUzmYWC5Bivg/HnE14p7H5yAMz77M8otedL1Lmw?=
 =?iso-8859-1?Q?Lqr2yeldWGkny5qhd0c+kObxHskhWnI3mjx1K0BpkH0It2xLELN9D0Pttr?=
 =?iso-8859-1?Q?SQ/A7G1SnZmPk8hhKZAGzNZoQ+AKjjALCwjYqFXVyjhd7yPkkeJaTcV36m?=
 =?iso-8859-1?Q?6mUkgTOCiasLvrUrdXFJ2KNVIfRbneHT6aSq5gfbc7SxdJT2/PERpNygIG?=
 =?iso-8859-1?Q?u2CYbgK2YudxW1cLUP2nBFz4J7aRUvDlUOwz+/vy9wSSMn2rI+WgX2Yy5v?=
 =?iso-8859-1?Q?EU/tp0NYxE7HO+Rd/9T5PlrZROZdGEv6iJGBJtTBIKwFPF0y/1cdQdom4X?=
 =?iso-8859-1?Q?yB5Bi1m5GCMKqXUN9N9V12D0gOhu3Q7MxS9ocurzGe6OCrzFOd7zArmBbd?=
 =?iso-8859-1?Q?86WfuBODS0lK6EPp4H+qFpgibb54r7kBEzwKZLDsKl0phPucf1lfEXGw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860d6ab6-7db2-4ba3-eb11-08dde4f46136
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 23:00:41.0003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GP+ft2TrjRmDC2Judilkr4hBYbYUXQp0pmq9fTXd/ZA8FActryZbLWUe6jaekXvyCZJoL38FFWeAmmw71CVmoOy16g4ZypsK0hJ5z8n1348=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9793


Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> This change introduces resource management in the VGIC to handle
> extended SPIs introduced in GICv3.1. The pending_irqs and
> allocated_irqs arrays are resized to support the required
> number of eSPIs, based on what is supported by the hardware and
> requested by the guest. A new field, ext_shared_irqs, is added
> to the VGIC structure to store information about eSPIs, similar
> to how shared_irqs is used for regular SPIs.
>
> Since the eSPI range starts at INTID 4096 and INTIDs between 1025
> and 4095 are reserved, helper macros are introduced to simplify the
> transformation of indices and to enable easier access to eSPI-specific
> resources. These changes prepare the VGIC for processing eSPIs as
> required by future functionality.
>
> The initialization and deinitialization paths for vgic have been updated
> to allocate and free these resources appropriately. Additionally,
> updated handling of INTIDs greater than 1024, passed from the toolstack
> during domain creation, and verification logic ensures only valid SPI or
> eSPI INTIDs are used.
>
> The existing SPI behavior remains unaffected when guests do not request
> eSPIs, GIC hardware does not support them, or the CONFIG_GICV3_ESPI
> option is disabled.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V2:
> - change is_espi_rank to is_valid_espi_rank to verify whether the array
>   element ext_shared_irqs exists. The previous version, is_espi_rank,
>   only checked if the rank index was less than the maximum possible eSPI
>   rank index, but this could potentially result in accessing a
>   non-existing array element. To address this, is_valid_espi_rank was
>   introduced, which ensures that the required eSPI rank exists
> - move gic_number_espis to
>   xen/arm: gicv3: implement handling of GICv3.1 eSPI
> - update vgic_is_valid_irq checks to allow operating with eSPIs
> - remove redundant newline in vgic_allocate_virq
>
> Changes in V3:
> - fixed formatting for lines with more than 80 symbols
> - introduced helper functions to be able to use stubs in case of
>   CONFIG_GICV3_ESPI disabled, and as a result, reduce the number of
>   #ifdefs
> - fixed checks for nr_spis in domain_vgic_init
> - updated comment about nr_spis adjustments with dom0less mention
> - moved comment with additional explanations before checks
> - used unsigned int for indexes since they cannot be negative
> - removed unnecessary parentheses
> - move vgic_ext_rank_offset to the below ifdef guard, to reduce the
>   number of ifdefs
> ---
>  xen/arch/arm/include/asm/vgic.h |  18 +++
>  xen/arch/arm/vgic.c             | 212 +++++++++++++++++++++++++++++++-
>  2 files changed, 227 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 9f437e9838..248b5869e1 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -146,6 +146,10 @@ struct vgic_dist {
>      int nr_spis; /* Number of SPIs */
>      unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
>      struct vgic_irq_rank *shared_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +    struct vgic_irq_rank *ext_shared_irqs;
> +    int nr_espis; /* Number of extended SPIs */
> +#endif
>      /*
>       * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
>       * struct arch_vcpu.
> @@ -243,6 +247,14 @@ struct vgic_ops {
>  /* Number of ranks of interrupt registers for a domain */
>  #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis+31)/32)
> +#define EXT_RANK_MIN (ESPI_BASE_INTID/32)
> +#define EXT_RANK_MAX ((ESPI_MAX_INTID+31)/32)
> +#define EXT_RANK_NUM2IDX(num) ((num)-EXT_RANK_MIN)
> +#define EXT_RANK_IDX2NUM(idx) ((idx)+EXT_RANK_MIN)
> +#endif
> +
>  #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
>  #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
> =20
> @@ -302,6 +314,12 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct=
 vcpu *v,
>                                                unsigned int b,
>                                                unsigned int n,
>                                                unsigned int s);
> +#ifdef CONFIG_GICV3_ESPI
> +extern struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v,
> +                                                  unsigned int b,
> +                                                  unsigned int n,
> +                                                  unsigned int s);
> +#endif
>  extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int =
irq);
>  extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n=
);
>  extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n)=
;
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 2bbf4d99aa..ae4119316f 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -27,9 +27,82 @@
> =20
>  bool vgic_is_valid_line(struct domain *d, unsigned int virq)
>  {
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( virq >=3D ESPI_BASE_INTID &&
> +         virq < ESPI_IDX2INTID(d->arch.vgic.nr_espis) )
> +        return true;
> +#endif
> +
>      return virq < vgic_num_irqs(d);
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * Since eSPI indexes start from 4096 and numbers from 1024 to
> + * 4095 are forbidden, we need to check both lower and upper
> + * limits for ranks.
> + */
> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int ran=
k)
> +{
> +    return ( rank >=3D EXT_RANK_MIN &&
> +             EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d) );

Looks like you still have unneeded parentheses :)

> +}
> +
> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
> +                                                       unsigned int rank=
)
> +{
> +    return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)]=
;
> +}
> +
> +static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned int=
 virq)
> +{
> +    return !test_and_set_bit(ESPI_INTID2IDX(virq) + vgic_num_irqs(d),
> +                             d->arch.vgic.allocated_irqs);
> +}
> +
> +static void arch_move_espis(struct vcpu *v)
> +{
> +    const cpumask_t *cpu_mask =3D cpumask_of(v->processor);
> +    struct domain *d =3D v->domain;
> +    struct pending_irq *p;
> +    struct vcpu *v_target;
> +    unsigned int i;
> +
> +    for ( i =3D ESPI_BASE_INTID;
> +          i < EXT_RANK_IDX2NUM(d->arch.vgic.nr_espis); i++ )
> +    {
> +        v_target =3D vgic_get_target_vcpu(v, i);
> +        p =3D irq_to_pending(v_target, i);
> +
> +        if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p-=
>status) )
> +            irq_set_affinity(p->desc, cpu_mask);
> +    }
> +}
> +#else
> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int ran=
k)
> +{
> +    return false;
> +}
> +
> +/*
> + * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn=
,
> + * because in this case, is_valid_espi_rank will always return false.
> + */
> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
> +                                                       unsigned int rank=
)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NULL;
> +}
> +
> +static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned int=
 virq)
> +{
> +    return false;
> +}
> +
> +static void arch_move_espis(struct vcpu *v) { }
> +#endif
> +
>  static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>                                                    unsigned int rank)
>  {
> @@ -37,6 +110,8 @@ static inline struct vgic_irq_rank *vgic_get_rank(stru=
ct vcpu *v,
>          return v->arch.vgic.private_irqs;
>      else if ( rank <=3D DOMAIN_NR_RANKS(v->domain) )
>          return &v->domain->arch.vgic.shared_irqs[rank - 1];
> +    else if ( is_valid_espi_rank(v->domain, rank) )
> +        return vgic_get_espi_rank(v, rank);
>      else
>          return NULL;
>  }
> @@ -117,6 +192,76 @@ int domain_vgic_register(struct domain *d, unsigned =
int *mmio_count)
>      return 0;
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * The function behaviur is the same as for regular SPIs (vgic_rank_offs=
et),

s/behaviur/behavior

> + * but it operates with extended SPI ranks.
> + */
> +struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int =
b,
> +                                           unsigned int n, unsigned int =
s)
> +{
> +    unsigned int rank =3D REG_RANK_NR(b, (n >> s));
> +
> +    return vgic_get_rank(v, rank + EXT_RANK_MIN);
> +}
> +
> +static unsigned int vgic_num_spi_lines(struct domain *d)
> +{
> +    return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
> +}
> +
> +static int init_vgic_espi(struct domain *d)
> +{
> +    unsigned int i, idx;
> +
> +    if ( d->arch.vgic.nr_espis =3D=3D 0 )
> +        return 0;
> +
> +    d->arch.vgic.ext_shared_irqs =3D
> +        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
> +    if ( d->arch.vgic.ext_shared_irqs =3D=3D NULL )
> +        return -ENOMEM;
> +
> +    for ( i =3D d->arch.vgic.nr_spis, idx =3D 0;
> +          i < vgic_num_spi_lines(d); i++, idx++ )
> +    {

CODING_STYLE says that braces should be omitted for single statements

> +        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
> +                              ESPI_IDX2INTID(idx));
> +    }
> +
> +    for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
> +        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], i, 0);
> +
> +    return 0;
> +}
> +
> +struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
> +{
> +    irq =3D ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
> +    return &d->arch.vgic.pending_irqs[irq];
> +}
> +#else
> +static unsigned int init_vgic_espi(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static unsigned int vgic_num_spi_lines(struct domain *d)
> +{
> +    return d->arch.vgic.nr_spis;
> +}
> +
> +struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
> +{
> +    return NULL;
> +}
> +#endif
> +
> +static unsigned int vgic_num_alloc_irqs(struct domain *d)
> +{
> +    return vgic_num_spi_lines(d) + NR_LOCAL_IRQS;
> +}
> +
>  int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>  {
>      int i;
> @@ -131,6 +276,35 @@ int domain_vgic_init(struct domain *d, unsigned int =
nr_spis)
>       */
>      nr_spis =3D ROUNDUP(nr_spis, 32);
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    /*
> +     * During domain creation, the dom0less DomUs code or toolstack spec=
ifies
> +     * the maximum INTID, which is defined in the domain config subtract=
ed by
> +     * 32 to cover the local IRQs (please see the comment to VGIC_DEF_NR=
_SPIS).
> +     * To compute the actual number of eSPI that will be usable for,
> +     * add back 32.
> +     */
> +    if ( (nr_spis + 32) > ESPI_IDX2INTID(NR_ESPI_IRQS) )
> +        return -EINVAL;

Parentheses around nr_spis + 32 are not required

> +
> +    if ( (nr_spis + 32) >=3D ESPI_BASE_INTID )

The same

> +    {
> +        d->arch.vgic.nr_espis =3D min(nr_spis - ESPI_BASE_INTID + 32, 10=
24U);
> +        /* Verify if GIC HW can handle provided INTID */
> +        if ( d->arch.vgic.nr_espis > gic_number_espis() )
> +            return -EINVAL;
> +        /*
> +         * Set the maximum available number for regular
> +         * SPI to pass the next check
> +         */
> +        nr_spis =3D VGIC_DEF_NR_SPIS;
> +    } else

this "else" should be on separate line

> +    {
> +        /* Domain will use the regular SPI range */
> +        d->arch.vgic.nr_espis =3D 0;
> +    }
> +#endif
> +
>      /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988=
  */
>      if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
>          return -EINVAL;
> @@ -145,7 +319,7 @@ int domain_vgic_init(struct domain *d, unsigned int n=
r_spis)
>          return -ENOMEM;
> =20
>      d->arch.vgic.pending_irqs =3D
> -        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
> +        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
>      if ( d->arch.vgic.pending_irqs =3D=3D NULL )
>          return -ENOMEM;
> =20
> @@ -156,12 +330,16 @@ int domain_vgic_init(struct domain *d, unsigned int=
 nr_spis)
>      for ( i =3D 0; i < DOMAIN_NR_RANKS(d); i++ )
>          vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
> =20
> +    ret =3D init_vgic_espi(d);
> +    if ( ret )
> +        return ret;
> +
>      ret =3D d->arch.vgic.handler->domain_init(d);
>      if ( ret )
>          return ret;
> =20
>      d->arch.vgic.allocated_irqs =3D
> -        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
> +        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_alloc_irqs(d=
)));
>      if ( !d->arch.vgic.allocated_irqs )
>          return -ENOMEM;
> =20
> @@ -195,9 +373,27 @@ void domain_vgic_free(struct domain *d)
>          }
>      }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i =3D 0; i < d->arch.vgic.nr_espis; i++ )
> +    {
> +        struct pending_irq *p =3D spi_to_pending(d, ESPI_IDX2INTID(i));
> +
> +        if ( p->desc )
> +        {
> +            ret =3D release_guest_irq(d, p->irq);
> +            if ( ret )
> +                dprintk(XENLOG_G_WARNING, "d%u: Failed to release virq %=
u ret =3D %d\n",
> +                        d->domain_id, p->irq, ret);
> +        }
> +    }
> +#endif
> +
>      if ( d->arch.vgic.handler )
>          d->arch.vgic.handler->domain_free(d);
>      xfree(d->arch.vgic.shared_irqs);
> +#ifdef CONFIG_GICV3_ESPI
> +    xfree(d->arch.vgic.ext_shared_irqs);
> +#endif
>      xfree(d->arch.vgic.pending_irqs);
>      xfree(d->arch.vgic.allocated_irqs);
>  }
> @@ -331,6 +527,8 @@ void arch_move_irqs(struct vcpu *v)
>          if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p-=
>status) )
>              irq_set_affinity(p->desc, cpu_mask);
>      }
> +
> +    arch_move_espis(v);
>  }
> =20
>  void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
> @@ -538,6 +736,8 @@ struct pending_irq *irq_to_pending(struct vcpu *v, un=
signed int irq)
>          n =3D &v->arch.vgic.pending_irqs[irq];
>      else if ( is_lpi(irq) )
>          n =3D v->domain->arch.vgic.handler->lpi_to_pending(v->domain, ir=
q);
> +    else if ( is_espi(irq) )
> +        n =3D espi_to_pending(v->domain, irq);
>      else
>          n =3D &v->domain->arch.vgic.pending_irqs[irq - 32];
>      return n;
> @@ -547,6 +747,9 @@ struct pending_irq *spi_to_pending(struct domain *d, =
unsigned int irq)
>  {
>      ASSERT(irq >=3D NR_LOCAL_IRQS);
> =20
> +    if ( is_espi(irq) )
> +        return espi_to_pending(d, irq);
> +
>      return &d->arch.vgic.pending_irqs[irq - 32];
>  }
> =20
> @@ -668,6 +871,9 @@ bool vgic_reserve_virq(struct domain *d, unsigned int=
 virq)
>      if ( !vgic_is_valid_line(d, virq) )
>          return false;
> =20
> +    if ( is_espi(virq) )
> +        return vgic_reserve_espi_virq(d, virq);
> +
>      return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
>  }
> =20
> @@ -685,7 +891,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>      else
>      {
>          first =3D 32;
> -        end =3D vgic_num_irqs(d);
> +        end =3D vgic_num_alloc_irqs(d);
>      }
> =20
>      /*

--=20
WBR, Volodymyr=

