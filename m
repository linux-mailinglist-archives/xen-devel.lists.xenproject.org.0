Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EDBB423B3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108406.1458527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoUb-0006Cl-MQ; Wed, 03 Sep 2025 14:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108406.1458527; Wed, 03 Sep 2025 14:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoUb-0006BH-J6; Wed, 03 Sep 2025 14:29:45 +0000
Received: by outflank-mailman (input) for mailman id 1108406;
 Wed, 03 Sep 2025 14:29:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoUZ-0006B7-QB
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:29:43 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dba6b6d-88d2-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 16:29:41 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB8100.eurprd03.prod.outlook.com (2603:10a6:102:223::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 14:29:38 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:29:38 +0000
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
X-Inumbo-ID: 6dba6b6d-88d2-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQNIum35jqqKaQvB6Erm4c4ezgnzF4o948lL5pHLAFy4q1XupOWxM1yh+yjwtYpPT3B7HXy6bait2cnvz2pRlNT80LS0ZBqI2cvfBZgW+bQj+0rO4ilwErvRg8e7t1tojSCWEURGoXdFuV199ew4yumKsFlQxCLxthOG5WUY6qqaC5pM5PjssTAbGVLIBD++wnCEtE0+UDzpWAJ8hM74W3sPyR3Yb/qGPCFHbcvND0buF7HTcSGRD+1UxInZcNO+FEpLtsQUppmg9wkU4NvrgM6eXr5VYT23i7Eqrr1eGhc8epkMIZjQTVJXsF5YeOwqSGd0grGKakcMgXN7n5y/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dq8bN6fyd5wtKxAni2CdiTYqqV4PATP9Xebh3pKhHQ=;
 b=ASpgk1WANwS88x9hlioYH6v6ZLDR8Mugr8AwGvXijf7JczgIkFA7CXK/F9cSip8EtHB6I38ikAz0pcDsw2Mj/YqLr7miETsrLehM7kIcVbQ1rdmLCn/yia+7NLzVAkHmk/EjRilqHJzaS2eSqzYI/0yVWuK3Yi6lz1gC9MN9flUyyEbkR/AEw3GWnTKa3zUyUqcwLdpvU0KAGUNaDshFAmCbsJ62kfwqFEfM6w8rvpeZpGkU/ivi8jqURVbzCajlgzQh6EdPrgS2m+eTvM3VyGr+B8CQ2EfwhgHi/AfKaLOMj1Bb16SLQKqYqmY1VXSrzEm5HZ4uggUHwOYSCXmxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dq8bN6fyd5wtKxAni2CdiTYqqV4PATP9Xebh3pKhHQ=;
 b=n0xE1syITlmOLlKoGEugZKJDV1v1GGWP5DlThZCvV+mxEnWlDN1Y3NzstVlcYL861iNtvp/T9c3DUvenGBqITSGJR+AydDkXKI93uTiAkZlxnlN1ms9gn3tDD/AoDI6Rsc2Cldg9I7IHT+O0skavLNRqhuns1dFmmDHkPKAmrlf0tIz9ohbiKfjkXNqUvS5bwvwkQUt6/oZ2GYswbh9G7BJJ5ySobSamF10GYRz+WdNRYPzWhEQT85cFLpEylGC5qGHGqEKtonnOazbzw1joRNW6c3gSrfO/q21iPvSVxZlD+ojOwjqSvT/IYgoYAMSlQk+e8pGd4MKLeFoL286zwg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v6 00/12] Introduce eSPI support
Thread-Topic: [PATCH v6 00/12] Introduce eSPI support
Thread-Index: AQHcHN8t1cvqj6mC5Uuo6UPszu4Kyg==
Date: Wed, 3 Sep 2025 14:29:37 +0000
Message-ID: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAXPR03MB8100:EE_
x-ms-office365-filtering-correlation-id: 89baac5f-af81-40a6-8bcd-08ddeaf64fe1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?q8i6Mkw7knnlQD3H7LmIjGOLpOs6nwsqcsPmLUJnj656QDL0pio5bQBqrq?=
 =?iso-8859-1?Q?rVs/uEikGAWgDhpG1qmf71L/no7Gt4iGv+3h91FAyXRbXqY3yVYtoYtwjr?=
 =?iso-8859-1?Q?OlzFXbWHLb0Z1YDX6C2Fvlj/HwoTqOavNfLbciTlBMmF810tP/y//UvSq6?=
 =?iso-8859-1?Q?slcDG3eBHrrTpMUir7oSzGJj5uFxNC4lQ+qd7x6mqwsv2Xxdj3iWqcUMBg?=
 =?iso-8859-1?Q?uG3nAyIGh5u8E5RtIwnY4pW/Ne3kMuRAS5H3NCybOzvXmuc79EgKxvm2vX?=
 =?iso-8859-1?Q?tNbaiHFY5q5DYAEzt8F2u4isCXP9SE88djkP5lvQeohqmWrHZ/LShtsQkc?=
 =?iso-8859-1?Q?PCc+wm0qU28jk6ObWE24h0lus6ojiTkWw4R4Qnco7TiU2kgm4VADx/6E9T?=
 =?iso-8859-1?Q?rlnFKfkziz5El9rFwFXwnRNXJFhYp3ckEinrxcNxU1+E4770QRWsH0y/1+?=
 =?iso-8859-1?Q?RxILMMdBXCNCP+JXQRrO5zRY+v3g0a9KOQ+4s3PH2MAp8Hq71TCo7rF5tU?=
 =?iso-8859-1?Q?DRglG/tZTsUSMh1bV97siVLXk8IPXhhU5xWhmZfSIzZVMa0PoVqCHblcKn?=
 =?iso-8859-1?Q?s/zmck5wRWK3ktc7b8bdV3/cbgaMiH6dgS5QKH91Z4TfCzlbw+vQedJqZF?=
 =?iso-8859-1?Q?EFDOtZowQBkPeov5zIMbif0cNSwr+6qhDf+GICuB5Qc4Pg9AZGrgY6qSeP?=
 =?iso-8859-1?Q?WS1xwLOwirgSDTpOamC/m7wpQ7w/WQjFBQWTt8u9hEkpIWrZm13H9v0sU4?=
 =?iso-8859-1?Q?ELZHITKnOgmAXGZ6nYT2gE6OtSfSObJoKXOiPTBfdhCG0Q/aowsjd04gBF?=
 =?iso-8859-1?Q?vemDBCcs/EhUZuJa0tn5CsPoEz2QmJHe5U2PUGW6BrA7rLghZO1Lrm2QPG?=
 =?iso-8859-1?Q?eEt2jlaZFlqPT68gOFbYwyXXcLVoGnvlIVIz0CcYd7zBPlITIk4040LmYk?=
 =?iso-8859-1?Q?zzmTjbyGI7/d+bFC+TNsIF/5xmSE83ejxCIRf4NbYV0B1O80E1HWi5aoZg?=
 =?iso-8859-1?Q?5zU2D/YMBFDXS2VB05oPGEPKUUqq9wA1Be/+IiSq18vTEKvi3skk5mjN1X?=
 =?iso-8859-1?Q?FokQdQG9KWPsxsVFttB3WdfTk0EAEEeokrJ25PPWt/BGqu4fitjRYEuUra?=
 =?iso-8859-1?Q?SiOYMldA8S1CVXlx04RYR8jp7cQtn3XDttk+h6CV4jnddT+POpLDyRjoRC?=
 =?iso-8859-1?Q?9mZVJLhKv2IYWNqs1ph4iB6oC3LfEPDr7/RM507D3zdJa0EOQE8wUCcSed?=
 =?iso-8859-1?Q?TAf3bMbOE3b4lvlk5pDHh0QmnN6miWGzXxMydcMYAyVAHw8MZAAPmc/+K5?=
 =?iso-8859-1?Q?yaMLRwz/caEFHr7vMoRttQTLtiGdpbBWO48PjZjd9+CzZqaXyHW1n5Va+N?=
 =?iso-8859-1?Q?TPBON/1WYU/bzUKsQhw3zHznbIVdLWm+2sPN1KMLXrAh103HqqlG2Uw/ne?=
 =?iso-8859-1?Q?HqNgCnsG7R+/v48yZJnMB1M7tmvOK8HOIUdtCMwwJsGxsBTq5+XwjkKyua?=
 =?iso-8859-1?Q?s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vAHbqHGsihCvc2ceeGKUsfnV0DkXLaSXr/W/4eiafwbrQyXVvQ12i+W+xy?=
 =?iso-8859-1?Q?QDkOFQ0gOIYCLjfp4H3Wktw3WnpFRnPyMuf5w41rDBfdN+f8Ld8BWFrRwt?=
 =?iso-8859-1?Q?AjlFtREMCBEmhQifB3p5twKEyeR12AXgzs5yv+Q8aR+yJ70HMdodkg9lOK?=
 =?iso-8859-1?Q?/q9RoNKy76eKAG6+H2qv8gdU/AsTOtjVK0k2VQHrclcZkH1FZZqfJxt564?=
 =?iso-8859-1?Q?xoigXFcgSpNS8JJItWkYbmslXZslWpbI333XKt/g0DJoWdTo9fOdjOpIJB?=
 =?iso-8859-1?Q?NWcNIt//H33MTzIPuIBipvJ+svTRr/rKLv0N3cW8/bCEUucb/1rgTxN7Uk?=
 =?iso-8859-1?Q?ubKfIxuBOZGO6ndWFXM1qajpoh36NMfM53tr96ZYD4T/bbJ4NNo8o1WoZs?=
 =?iso-8859-1?Q?aZQJtu5dFJlIr14qhWLPctY+Y0bz732zhyDbPY6uBY5gwr2ptuColIh8Bm?=
 =?iso-8859-1?Q?hd16Bngu0EEw5ztf410ARUb61UiirDSTcPiMzYUQOYZcJIrrQm5oppXoMK?=
 =?iso-8859-1?Q?TefaP++2enrUxkGfy3H/BDK/xi5jXl3SA13dV8ADzP8kQpo+Jf3SlR1ZNI?=
 =?iso-8859-1?Q?I2bXM7BBYc8ErTfdx+kg+IOjgMp0oUd/YdQIBXpTSgeuYPwTqH2zlfTDpJ?=
 =?iso-8859-1?Q?IqylpUvKunRF+iiLwiJGpfWwyMOTnRsBOMJ1/1OEMy+yFSfNwfLrTExU4P?=
 =?iso-8859-1?Q?6eN4DR5f8wzG7JB5NCPg1dMpa0o5ZK3XHFN3+ihmRsq8Zbkt379TkAXtJk?=
 =?iso-8859-1?Q?jNTQvpvdpx+30g631VJj8u2US418E1IZ6R4PSzWK14tKNuaFaYuss7Il8v?=
 =?iso-8859-1?Q?Di/djivIb/IVz58BbiS5os3Y3OSjrMUSjPO3z4OWB6ceFo9YAbVGmCumtd?=
 =?iso-8859-1?Q?iD5sn32PDNMR5w95avuKs1cJU1SlxJvWuF7OniVhZUg/vrRxq+huPocOgs?=
 =?iso-8859-1?Q?Vdjj0MFx5KsrImQ1swAi6n6x7T8/NIjTSPB0MCkBRAQU+qS3AX6cybXgfl?=
 =?iso-8859-1?Q?41ih47bwCyzuZ7ao7gR/iKzbPT1yEafxyKBxo9W7WQdiJKuHc+DywuN9c1?=
 =?iso-8859-1?Q?tXjXPR8wgU0KlSHUjOy6X85kEtEhMaH4Q0gVNjKq+Kk3HQI682KOr9rKQO?=
 =?iso-8859-1?Q?qP7NJ+KWUOPq0hGO+PO+W5vpq5K1vDTKpkvK9Ussh4cE7syF4w+6gsk/gt?=
 =?iso-8859-1?Q?NKgLmFOg0hDpE+4wRtr5CZ3iIsv+9sgevAz0n7Tm6NicoILyoLULoYK+d+?=
 =?iso-8859-1?Q?+i016e/XUvr8jFviZZwyis4cd4RC8r53/bDtKfSF5Etx5IcENH4rzIixg7?=
 =?iso-8859-1?Q?mma2u8ou22i2UIlxCTmy9yDhNglWjYEWOSDFnLRvLNUsw0LJPpf2ztdGyX?=
 =?iso-8859-1?Q?IQcSNnARkDW2+qbOMkaRU/IS/F4vsxoeO/849yaEjlNHQIY5J1UPJJWrMJ?=
 =?iso-8859-1?Q?Q1YaO3E8XfSqpmOzssuaXEB2TP52ORVY9ZlSHxdaVNa7kCxP482X4Xy+tv?=
 =?iso-8859-1?Q?8g08zha96si2nACKlIja3wo0V9rKHTL9W5d0MXk5HhhxoW/jMmXirCxKYe?=
 =?iso-8859-1?Q?3Hub2lIUnMxeMuzEwWSrRvYYGwypIdQvUvWnxrvxRg8dph8APdQHIQy5oW?=
 =?iso-8859-1?Q?bPzfMp0F1L7dFKS921iAc3JMbbinsMtLHsCRypNtO0QMANoRBo6TenfPeU?=
 =?iso-8859-1?Q?4UFRBvg9rIaTiHLN8g4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89baac5f-af81-40a6-8bcd-08ddeaf64fe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:29:37.9187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPTJQfVGuqXVF98EBzCvrnCdQyz3ooc1ISxefAa9P7zt+6iR+nduH2shGYiweCsC8mjYgQ4R3BSHK4vc6J3KrXJJuNTvwQquoSfHzoahr+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8100

Hello everyone!

This is V6 of the patch series to introduce eSPI support, which contains
fixes and improvements based on the comments received in V5.

The main changes in this version compared to V5 are related to improving
the reusability of the existing code for regular SPIs. Since some patches
that had already been reviewed were modified, I would ask Volodymyr and
Oleksandr to review the updated versions of:

[4/12]  xen/arm/irq: add handling for IRQs in the eSPI range
[7/12]  xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow eSPI processin=
g
[10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers

Summarized description:
This patch series adds support for the extended shared peripheral
interrupt (eSPI) range (INTIDs 4096-5119 [2](ranges of INTIDs)) for Xen
and guest domains. The implementation uses a generic approach to handle
eSPIs, similar to regular SPIs, while maintaining compatibility with the
existing SPI range. Functionality remains unchanged for setups that do
not require eSPIs.

The series includes:
1) General refactoring of common IRQ operations with GIC registers to
improve code readability, simplify further maintenance and prepare the
key functions for eSPI implementation.
2) Introducing a new Kconfig option (default n) to enable or disable
eSPI support. Disabling this option prevents unnecessary resource
allocation for setups that do not require eSPIs.
3) Adding additional resources to store required information and operate
with up to 1024 interrupts from eSPI range.
4) Adjusting assertions and checks to pass verification for INTIDs in
the eSPI range.
5) Configuration of eSPI-specific registers during GIC initialization
for systems with GICv3.1+ hardware.
6) Enables eSPI MMIO emulation for vGIC, allowing guest domains to
access and operate within the eSPI's INTIDs.
7) Updating documentation and CHANGELOG to reflect the changes made for eSP=
I
support.

Also, to simplify reviewing, please find below link to unsquashed patches, =
that
are on top of every patch, that is changed in the series, compared to V5:
https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v=
6-unsquashed/

Github branch with patch series:
https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v=
6/

Changes in V6:
- individual changes in patches

Link on V5:
- https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg02086.htm=
l

Changes in V5:
- individual changes in patches

Link on V4:
- https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01767.htm=
l

Changes in V4:
- added a patch for documentation
- individual changes in patches

Link on V3:
- https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01628.htm=
l

Changes in V3:
- added a patch to update CHANGELOG.md
- individual changes in patches

Link on V2:
- https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg00372.htm=
l

Changes in V2:
- added 2 more patches to implement helper
  functions for gic/vgic:
  xen/arm: gic: implement helper functions for INTID checks
  xen/arm: vgic: implement helper functions for virq checks
- removed 2 patches:
  xen/arm/irq: allow assignment/releasing of eSPI interrupts
  xen/arm: gic/irq: permit routing of eSPI interrupts to Xen and domains
  since their functionality can be moved to appropriate patches after
  introducing patches with helper functions
- individual changes in patches

Link on V1:
- https://lists.xenproject.org/archives/html/xen-devel/2025-07/msg01809.htm=
l

Leonid Komarianskyi (12):
  xen/arm: gicv3: refactor obtaining GIC addresses for common operations
  xen/arm: gic: implement helper functions for INTID checks
  xen/arm: vgic: implement helper functions for virq checks
  xen/arm/irq: add handling for IRQs in the eSPI range
  xen/arm: gicv3: implement handling of GICv3.1 eSPI
  xen/arm/irq: allow eSPI processing in the gic_interrupt function
  xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow eSPI processing
  xen/arm: vgic: add resource management for extended SPIs
  xen/arm: domain_build/dom0less-build: adjust domains config to support
    eSPIs
  xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers
  doc/man: update description for nr_spis with eSPI
  CHANGELOG.md: add mention of GICv3.1 eSPI support

 CHANGELOG.md                           |   2 +
 docs/man/xl.cfg.5.pod.in               |  13 +-
 xen/arch/arm/Kconfig                   |   8 +
 xen/arch/arm/dom0less-build.c          |   2 +-
 xen/arch/arm/domain_build.c            |   2 +-
 xen/arch/arm/gic-v3.c                  | 195 +++++++++++++++++++----
 xen/arch/arm/gic.c                     |   8 +-
 xen/arch/arm/include/asm/gic.h         |  28 ++++
 xen/arch/arm/include/asm/gic_v3_defs.h |  40 ++++-
 xen/arch/arm/include/asm/irq.h         |  38 +++++
 xen/arch/arm/include/asm/vgic.h        |  42 +++++
 xen/arch/arm/irq.c                     |  62 +++++++-
 xen/arch/arm/vgic-v3.c                 | 198 ++++++++++++++++++------
 xen/arch/arm/vgic.c                    | 206 +++++++++++++++++++++++--
 xen/arch/arm/vgic/vgic.c               |   5 +
 15 files changed, 740 insertions(+), 109 deletions(-)

--=20
2.34.1

