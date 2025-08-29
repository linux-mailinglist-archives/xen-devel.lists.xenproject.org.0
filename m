Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1C9B3C05B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101728.1454715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1gf-0004nN-OS; Fri, 29 Aug 2025 16:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101728.1454715; Fri, 29 Aug 2025 16:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1gf-0004l8-LW; Fri, 29 Aug 2025 16:10:49 +0000
Received: by outflank-mailman (input) for mailman id 1101728;
 Fri, 29 Aug 2025 16:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1co-0006AC-Ke
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:50 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b5fad8b-84f2-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 18:06:49 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by DBAPR03MB6486.eurprd03.prod.outlook.com (2603:10a6:10:194::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 16:06:46 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:46 +0000
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
X-Inumbo-ID: 2b5fad8b-84f2-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wF1BsJnGs0sSuxODNg8jNlxqifEEcyF65HiOByI0pvYhs3y0ZAv5nc8reZNm+JvuFPHg1rQ6Tb9nfDLy0KfeJLuADuXDbLDcIzXlVwcDGE7gMH0lY/PNKrt5P+twDrnZQmos8Q8toHtVgEI1UdKZ83aRlePXXEOV3wMnzlN+BqFiURC1679m+q9kdKyjU9cOBRMo5NlUkHZ1JI0pHsCdzqTe9Da20x2Jehc7ameJedTmNncsdcszJm5cHri7GgMlfioJLyG3sWio5xyPpg+5T45FIG+wAybRGoh7wf8Fk+xjSzSc/TrpuSUP5my89/AxFcF3RlaT4TPz7HW6iC8UtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvSfHsHBtRyldG12raaQ+Yq+563Wm7SSCndcxDTlphc=;
 b=IpOYtBOYIZoPJoz80h59r7vwasNFEtgQoR3a12cP1xUayeSd7rQn3V/juKAkPs5EgHGddpNbGUG+9NDGqp8MnXFE7Ae6yY/73iW56XCVWrb2sISSiVzeDM2tORTMVgjhTsXK3plDkkFMKsUpyJSViCvRgNcV6mDk3G+5s0cxp5g+/bn6xqkstJ19BYb1zHGPDBc6S268KlKAgrHjxj6Hi0NXGYGAm+e5eEHaRTxBAVaPUIIGYrWAMJ8MbvGiQkLy0LYLcUESbfffteZ3ySF/nPP9GSTUF8kHpRAf777HFqtMWw8QzH+rht8IVY3HjfWddAiwd1Vf3F0jPVF3Ts705g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvSfHsHBtRyldG12raaQ+Yq+563Wm7SSCndcxDTlphc=;
 b=P9qUHFAoe7XEIHLAxp+uscxk5ZMgMnl6g/BLvcDCTtgSINZQ2ceOHQA3MONykhBbDH0BaFmTmh/v+dNYoN72XHwJU3NKfogO/Q/tjK9g+qGyP9ZNYo4iGXE0E3VOZIlEINmuKploS5JbWRPBvjO8jpVlf7vgEFQ/ys77YmumG8p8Ecajm4C6wtu5NDoj4+30PoMIMasfJ/GIGHJngRjAb64HnvEBJCNpPf+rwzLHIsbrFRt3YlMlxBQc1GJI+bM43H4zVIg9DFZD76gVP+2RzaAinx0fuLV1YABPKUFYmdG2EtF/z79JUUWaVPCNLpJeEF9bjEOt1Etj5smuLnz0Xg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v5 12/12] CHANGELOG.md: add mention of GICv3.1 eSPI support
Thread-Topic: [PATCH v5 12/12] CHANGELOG.md: add mention of GICv3.1 eSPI
 support
Thread-Index: AQHcGP7r92C2xJP99EKb98d4gv1OEw==
Date: Fri, 29 Aug 2025 16:06:46 +0000
Message-ID:
 <aa1691add479af165a6b0f860f48b7ad1b741386.1756481577.git.leonid_komarianskyi@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756481577.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR03MB8676:EE_|DBAPR03MB6486:EE_
x-ms-office365-filtering-correlation-id: 757602f1-7bb5-4262-c334-08dde7160df6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?LIOebLgsoDURL4ahXk9xDO0c2r1a2fWwdHBoNbr/R7ZDeVfROE0piua56y?=
 =?iso-8859-1?Q?Kax2Ecy4dSqDOYF1WKfEbmqrRpcyPbsX7oLXWgDG2ldfkeJ2Y+tgfBGxX6?=
 =?iso-8859-1?Q?+SQZtXBHg+SM5I+W6NdzdaLM7MxRZRGeZQsCj6RfHuYtqUqi0juX/sC7mt?=
 =?iso-8859-1?Q?tHh2gCSktCcigyet4JQyEWUN9at8+s22aH040S7Vm+lLL3SYo5XISP1+FX?=
 =?iso-8859-1?Q?qbPWkUBx0TumZfjKYrmYVGoyyNPP+134RUiksaB+QbXtqbRfFTpVdA1YG3?=
 =?iso-8859-1?Q?845aHYgFFVCO3b8sHYueevkoZn5Qyq84N5HuPMqypEcemlQXZeFnI27xml?=
 =?iso-8859-1?Q?kmaaiqoMRNOAFIZ6wQeYBJ3N0CRkTS0L5Ni08NfoR3MZs7BQefK7WG8mXj?=
 =?iso-8859-1?Q?xEjr+BegITjzTu9xSey8AZZZmbGymfMNRYPMGfb7cMuVJiYyA5VE2+ss6n?=
 =?iso-8859-1?Q?B5UjQ4NRoZms10jJNwzVG0IXE7n42gQ6RhqBgAiRfbva39aG0eCdLZK+hJ?=
 =?iso-8859-1?Q?KEoF8zylWFpz9vhQ/tFLKqLBjHQfud7MMeBqpBpYrwRYN9YKbF6KEbB0CY?=
 =?iso-8859-1?Q?3TLbMC0Y862HlV9Swi+daOOFVubehPvbl9AVus9kOi4b3oFLrbE6MMFW9k?=
 =?iso-8859-1?Q?/h6c4X4je9tKVeCFff8yjFDQ8yI64bvZNKVbEAyRj99fIuuCcJnojnXABD?=
 =?iso-8859-1?Q?Uwlqvjj7rAeMmLD6tv8RY4+QxBCTRpL+kxqxV4nKTma6P8Jg1ZLmrVbIDD?=
 =?iso-8859-1?Q?6nx0NCtbPyFvVvgl4du0xgGeYFpopOz6W3DRXTDq2EOWOiBRHIx7lv0KYv?=
 =?iso-8859-1?Q?4FGIG+uU6WKWz4HwOMWHWByd1fVco1hYLmdIp4nZ8g19c1lXM8sa+ch5CJ?=
 =?iso-8859-1?Q?u61D01f8GdkfcpH5LtjmRcFIJyog1uFirnulw3xSw/PzQjUDqcCH/LurVW?=
 =?iso-8859-1?Q?LW6P42JeXxXlu76P/iOKRU+rrGeP/6zfwokjNIVQEfzpBgxdrrmJye+ZiR?=
 =?iso-8859-1?Q?Nr6VMC7c9mhDU7vWBSGscGHBXAoSVNmR3PrsN+bPb5tuRh6KIxyMv66T05?=
 =?iso-8859-1?Q?yM9vCVrNg/2syPWvKjOhkSuDncLOCpDQzF1wiaqEIVfpf2Xgqx8oHWeAch?=
 =?iso-8859-1?Q?ZsOc+NLhz8Jzj/gWUgJc6E/mo/4pjrSCMkG17TB0q4snw1hxCuv9XMc4IN?=
 =?iso-8859-1?Q?o4qZQ0pWwA41X3AIR4APghtTo629FT2HFHnHvtUbGXyACvrN/KJuD/F6q8?=
 =?iso-8859-1?Q?IjGwqonuT3Ar0bzLe9H1OvHbXPcCgtXBn80yCVwmdPYQHiQzHG+htc+8Ou?=
 =?iso-8859-1?Q?22d6bcZ6OGOygfbIG0CUVuyYtKAHKnpEni6eAbwUHPjjLDc94/SyRFTcgN?=
 =?iso-8859-1?Q?8nOaEKuPxFFidCWGFnF2gosrbLvrsRRgzlYStlndikQAnGyT5uwbTyFStf?=
 =?iso-8859-1?Q?KXRXBWBMAC5PvAjyoges+AyelZymfYDLVPzsoB2vC3nHGta0wMLraQD3kn?=
 =?iso-8859-1?Q?4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9d1Ud6N9Z1Vqbtc0qPUNyzgF5t3KKYmUxQQt04l4WMbKUH/ogCwEYszVEp?=
 =?iso-8859-1?Q?zpmW8kouU5QgEW1d3jZ/mOsdakJLJfq/IhPzYYrzo2mhc+EgHedQacEVg8?=
 =?iso-8859-1?Q?Aa37YK6EViANxZcVacoy8fAfTEnwgNmXQLcdzn9qaFV+QQWWgJ9kBOt2C/?=
 =?iso-8859-1?Q?XZ+K908SLTKqrlLj6+74F7pJZwM658nzVYZonqNw9BGCEomjarS3Xt5OgV?=
 =?iso-8859-1?Q?nOQj+H6DSIOPLXckFVQGtbyoSD+WB40N+dsDK4IoC3RUiwSkXU3A5bT++L?=
 =?iso-8859-1?Q?bnKTKe25VF9xTYarRQhI2b4VU8mArP/tM0a+9haymts/ZVGNXxFe1X5Uo+?=
 =?iso-8859-1?Q?R8zhMTHrjuVweS7QjSh7fDT2JRpSFtKTxcQ38WYJU+RtVp2crSkoKVRIip?=
 =?iso-8859-1?Q?KlDjipAjnEipg768HTurCddg+FTG5j+kq9+KPV3lmdvETCLhPoK5PtGAwe?=
 =?iso-8859-1?Q?J115+L4TjD0s4PEj/DIGRLz8t9hU/glx7GEZJF81hGktLCGLFgX/2sPeeL?=
 =?iso-8859-1?Q?X4rwELsX5rlSYWe5sjDZDL4EdrmA7lYR9s/y/gBctFnIS5xOKKq2jPFpn9?=
 =?iso-8859-1?Q?f3Ihz5ofLW7YFoiywSDNylut8eZJ03HMMEP6GbQB2IMTYtp19TbS6Jm+g9?=
 =?iso-8859-1?Q?hD1Rxdn1aRxD0gcIIps9tCf5N295f+MAhizL2IhyVuSz2ythJFYJcumrdk?=
 =?iso-8859-1?Q?QSSpEZ+IfLt2pYumesKWZmhG973B916zx7Y+ZU+erHSBxjlJBNB7imlli4?=
 =?iso-8859-1?Q?Gz7XDLCuyoHp7iRYG2AGqcNItG8f1Cb+TR/6K8qU60gMCBs1lOODtm0zfH?=
 =?iso-8859-1?Q?+ChbFjKd1x5rqDiOmZwQzPs8vw2XZoboAnJn2PBT4/Avd1ba7MTTadds1O?=
 =?iso-8859-1?Q?Jo4pFsZ0VM6ip/yu4n4yfW+NU0uvEKfvVh3Rdt53Q6nyUnWY7a+m7s3IW0?=
 =?iso-8859-1?Q?kVhOXmmTtEAI5gq/LMCfYk6wvLWu6xeWEf8tg875a011BtdyG3HVL39yE8?=
 =?iso-8859-1?Q?q8Jq5UTNq9hp5fol1mkUDb6XxdcrVwV5YmVKYmFdiTp/1kq9z614cFr/q8?=
 =?iso-8859-1?Q?Wyy6NK0hNN/ffzDkgpj+HX9BQZylK+MkOjXGiKlTY47q5eW2EDQletcqfT?=
 =?iso-8859-1?Q?QKxuu4SzYbpCQuWMMGGcqI51EgceJT8CMcgqF5vFFQ9gVH1HGeEDDk0b0L?=
 =?iso-8859-1?Q?s31yLc68FXQXnuCgH2QfzfPV1kF7xYqdXWztnVkndyyndmZ5771G+LCYnw?=
 =?iso-8859-1?Q?3uOpW6hMWptkzHu5jQPJRE5KeRZKqQTfjdPLMLVKwDYOE3chplmxL0W6MS?=
 =?iso-8859-1?Q?U1OoZbBqK6OONdr+rCh74mHG2dAhHJUrEeD6xnuhr+Ksgwwq8FytPE6Br6?=
 =?iso-8859-1?Q?0SVs1sWeu5PTGYfxBrdNzxvq4zMC1mM4f+GLgl/hxPBA9TsXXlyTQXlinc?=
 =?iso-8859-1?Q?t2/3zenbuug+Lw+PnOW/d02vGxOOzykb5FF8g4YatoAPA17UbTkVmFkdgn?=
 =?iso-8859-1?Q?7OYr8505IeR1woSb7EjKlfIhTte+ifkCCKOJU1CC3Y2Ff/ZlruK4NalXLW?=
 =?iso-8859-1?Q?WlvB0uHb28Q3qqQe0fTMLefsM4RubpXkaP3OCBYEg31t5ANLd1RpKLWJ9y?=
 =?iso-8859-1?Q?9pyo+0lMDuLNjzSPFX5FTY6AZnk8haa7njU7LkwgKMMX7rzzKYg8yQYMF6?=
 =?iso-8859-1?Q?af1aDD6xmOsZRnPXqRM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757602f1-7bb5-4262-c334-08dde7160df6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:46.5767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kewc83s/mRRODuuLFVRIYRrqku/SYegHlQomlrqq/ERSG2nDn+zycY9AYynPdW8V7RFC8jHKpa/vAVJju7q2aZ2ceUBl5J/a3Zqz6lCwpbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6486

The GICv3.1 eSPI (Extended Shared Peripheral Interrupts) range is
already supported with CONFIG_GICV3_ESPI enabled, so this feature should
be mentioned in CHANGELOG.md.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

---
Changes in V5:
- extended changelog update with a brief explanation of what eSPI is
- added acked-by from Oleksii Kurochko, which was received for V3:
  https://lore.kernel.org/xen-devel/bce5e07c-eee7-481b-a833-4d5d8bbce78f@gm=
ail.com/

Changes in V4:
- no changes

Changes in V3:
- introduced this patch
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..31b4ded444 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -29,6 +29,8 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
=20
  - On Arm:
     - Ability to enable stack protector
+    - GICv3.1 eSPI (Extended Shared Peripheral Interrupts) support for Xen
+      and guest domains.
=20
 ### Removed
  - On x86:
--=20
2.34.1

