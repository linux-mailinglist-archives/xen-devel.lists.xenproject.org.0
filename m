Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAFDB3C041
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101651.1454645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cO-0007B7-Ri; Fri, 29 Aug 2025 16:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101651.1454645; Fri, 29 Aug 2025 16:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cO-00078Z-Oe; Fri, 29 Aug 2025 16:06:24 +0000
Received: by outflank-mailman (input) for mailman id 1101651;
 Fri, 29 Aug 2025 16:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1cN-0006O9-On
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:23 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b089fde-84f2-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 18:06:22 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by VI1PR03MB6317.eurprd03.prod.outlook.com (2603:10a6:800:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.26; Fri, 29 Aug
 2025 16:06:19 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:19 +0000
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
X-Inumbo-ID: 1b089fde-84f2-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpH5yI9NoQgrXGiqMqAy5N5RRvj7ZYOZIFpvL7pB223JqT2SDgeQNusei/jBSIYFgQc+Hpz108y/bHX9QaZELi8yYAqyz9O/cIwoUZ0bH4yt23wqImeSm8P3wa9H876B3jg4B5Y2OcclMx5CN0QRRL8FnC4+FXfYqDNEYg4GUrBX7VXIWDvV2RXKF971dLGwALNwVZFeYSYHGUluv5lUiEQ3jgv46CLkrKoLOXBOew5Y9+VtgxggpDC5bgdCkdIXGzyuiEu/ZFnCmcUQlYnui9xmJoFzNl98bNLBSqCZ926WiOKrkTKHbeJp+C1z2y91bEBVDg9WAnlGtgzPyl+d0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBNwg+KGru3hWYAd6jh+irYJNu9K0e+2+vVOy3gd/B4=;
 b=DB9DoNVUGH5Tb5UOZQkoym16e1cxdUbrU3LCe1d0gcz3NQq1Pd83fT5QKIteiQlP9fqRqdBbzNeVLNkPhE5VmRFegI2Z99eOYBTcqmQJGT9hV9yu+kjUQYeNSVLCO7GeRp3oHXiWvlyhYVCwHqJ5yQL3kkxzVJ4n2G3PIHUlTxLtHBX/BBOon2171LsS6APDIrKT5y2369osnOqQkmtzebkmo2DaErpurSbe9ZMmjxRL7sQSBlupso94PPW2kU/zCcKyEBagiOcEppuPGzkeeyuiz2DkbYs0lmDOgg/dusoOCcSQm1/R/0ya57tzuH573khWaWAAjkIghxZBi24AmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBNwg+KGru3hWYAd6jh+irYJNu9K0e+2+vVOy3gd/B4=;
 b=rteZTAyev6oP08x7xjdAxKtHLkubnaTsN/MshPMe0MRSlYNnut8GEGCWtZs6/gCz2Y0pQSGKlJFZzrPSMly17d1zm6fyJetz0T3ue/qfSBXXiesP/24pbjSij+QS4y1G1Drs2gZxt7tWG4R9KKH8xkuFh3TqZsFAODq/VuBZMlqWSL9OkdyMJtbX1czRGwWqltM0C8x6W8SP/X1ZgcSxolyZuLpjyRacFYrjomnshxFAHv1Lr/g6/Yvh+utK/n/35poFgo9qiDqpIyULhebQG1Gw+FNMSCruXe1yVBYQc8C6vvjNzEQpYuhySy0SnkElaImxIVhMdKNZJ31MEuN2nw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 04/12] xen/arm/irq: add handling for IRQs in the eSPI range
Thread-Topic: [PATCH v5 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcGP7bBiDA5fxWR0+DupelLQbe9w==
Date: Fri, 29 Aug 2025 16:06:19 +0000
Message-ID:
 <e0f76a1533332cef68bfaacbdf57fd05f27764a6.1756481577.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: 71c82f8f-b53a-4723-5684-08dde715fdea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?GmMYvs7QBVb2Glhe267+wwDKwbFMpLJXJnBDiX6T/2hcaGogIFYEh3qfRh?=
 =?iso-8859-1?Q?lI/oDuaTnc3Lq3xzvXiJqN9VWTL935Wvl7YpcyHN3k6LMUqlMux/Vk7s1C?=
 =?iso-8859-1?Q?hOnk9pRVrzltHSEnn1ZbEbk4CStx2mub1Bf8IVdaXugwZLnUgPNem1HJJV?=
 =?iso-8859-1?Q?PYvoNHKDkwrIeGcIscdGGSZWq8P6YHX4pqZde8V3IThiPF+TihcNk/y31V?=
 =?iso-8859-1?Q?WZT5WLLpSJNYyAxYJT2bgrXDL5GEJVQjGJ+N2JPQWGnGJofAiqvXrgMQBx?=
 =?iso-8859-1?Q?vc7vwTGPwOjeKcBl0wu0aI4qWNYK0XPk6K9TLsjd1xvndgRHHQZLvMzWx6?=
 =?iso-8859-1?Q?/kFd4VwqVVGsW7PkTqI66IFmp3/end8lC1k9hoZwhycmvUFJOKB5y8dwUm?=
 =?iso-8859-1?Q?A4IxXuh9P2gnYQES+aFgAETjIvDHvIapKuxIdS4dJzZyrYoS5igKzIguqD?=
 =?iso-8859-1?Q?mriIHMll3jnIDZBZTLecTTqf9uDeZxucbqnHpRW0x4j6rIuBWZHolk3o0y?=
 =?iso-8859-1?Q?Sx6jZD/Nd4qLUJQ1edI5AlKQ1elrFr+yIWdN/zhb0mY0QTXojysihcfpyp?=
 =?iso-8859-1?Q?wxa1c/5jBOwTH9hVDgpdTk9AuTpmpx5613afyZgn+lDyjYQytYRgLsivC3?=
 =?iso-8859-1?Q?+VEEcehGPjmhXp7CxFNnQfBTc8Eu+xbIawd6OSTCZ2/xFonkO32KNT/do8?=
 =?iso-8859-1?Q?XRnumFxpggpHwRLReCNJZlzRcUm8uoeHlWxudqwOqBS7LJPJ5lU3xaUN/1?=
 =?iso-8859-1?Q?xDXU0vH0WLJgZbWKvlOG1XMsZ3eTWZKxGrqLtThXfpf0Gd4DV7mtf5emBc?=
 =?iso-8859-1?Q?8bUb0OojoK/ygjUo/dPplUpc3gfMLc9fxZCHWjkrBdc8qlwBSVctPHaNLC?=
 =?iso-8859-1?Q?G8WNTHuAisTOC1ldtfeypw+DFu+IOT+LkdwpDtvI3NfKrAAOIUVMZlznfH?=
 =?iso-8859-1?Q?ZD267PBQ0RonntKXitDyiztcY9ISxNh5KSoAlzJ7W9VSFkQsi9BKwLMsii?=
 =?iso-8859-1?Q?mtiiDEBZFDiNbeUa9rGHrIqoMkmxQ8zJ4+i16vJn5g7eG9Ts8/FIk6dbEQ?=
 =?iso-8859-1?Q?LmZMSJyhvFXSBniNWTVolu+dzgrAp9KyBWb0W2vDxP/VrE3m1LoYKSPcc8?=
 =?iso-8859-1?Q?6RBy6TTVOZziCsC925M7tMaCL3xL9RXwM3O00ssVbiev135dXlZttBR2v6?=
 =?iso-8859-1?Q?jNLWW3hSpyXmIcVgoTLSavbgVfF6skKI5qHM/MZtD/Ee6v6H+8EhCu2dA1?=
 =?iso-8859-1?Q?Zyh+mVQCcG9tNVZ1XQCM8rAjZr3gFY+BA9lWMxkajF9MSU6qB6CP6Fxrqj?=
 =?iso-8859-1?Q?krFwJswzGw201pPq+NcPRbmTqf1m3u4oTtKClyftOpqBXTXN2UQWJtKnD/?=
 =?iso-8859-1?Q?QNZmrEXFoi2RLHVGdR9ujKUSoh1DqyARNqOba8+t3VR0KcqBtg6dm4Ac6+?=
 =?iso-8859-1?Q?s9/OInevYwrHmTu5psJfdc44lw6S3GXPKC3ofwsdx76O5xPwyHGYZa/pAY?=
 =?iso-8859-1?Q?nueiyaBcvcIaCU7q4JYaNxKOqy9JS4QtdlX3FJPg+iQw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yILoahaGn5IjL6PWm+nXsRjpXVmcWiiie5/opnsaGR7NeXZVIeTQkhp48A?=
 =?iso-8859-1?Q?+CaHgEIILNfkYALugGf8aUmHDOzH2+HBxgACHEXD/NVFuABalxjB1DcmDP?=
 =?iso-8859-1?Q?tDQjuBugomS/ltiACrjJbxKbO2+DyoGm6E/j+KqKWwvRPA4UkNGwSqaUIf?=
 =?iso-8859-1?Q?TTcZXNJZpveDbm5vnIsT2zSdYju8v3rSR/UUoJwoV+hZlP2vlQvrB28JZY?=
 =?iso-8859-1?Q?o7EYOfWhos4Sm+yaBFIvh2JXBpJpSPZf0nAblNz49gunFwCmwE2C3/81YI?=
 =?iso-8859-1?Q?AhNjey9zztZ2kZB1B0rzlQ8HU1ZnJ6wf14Xzqi/bIUEgUxHFL82yMDN8gr?=
 =?iso-8859-1?Q?Jk+oKn77oXoXlvtxho3sJ+wQ4VAUTup7iQAEEKlBo1sTAL7ws8hjcUM+iK?=
 =?iso-8859-1?Q?vYVnRotxINT+YcMLPBA7WvAvZVWvgv6zk4i6f8+nHFSrmkD3dZ87OkvNfo?=
 =?iso-8859-1?Q?2y60x6JTfKVNVp2KBGbajTAgxaWTH2LZhYstyqbmgkqxIqf6XUJRoxr7oV?=
 =?iso-8859-1?Q?D5I5WOir1lsGPC+kvAgY4PlPw137TviT0K/HkYiLglNVMXOImJ48L2cMYE?=
 =?iso-8859-1?Q?K6YIIYE7u0u124g1Qyq6dPSymFUQl/YakMbv+veEgAw7L7rVGoZe1Do/hE?=
 =?iso-8859-1?Q?iVDRlaYmW6UKb5o+ovVa/H3Lwy0LxomKoz69Pdm7AXF3jXRymTPR3b9K1F?=
 =?iso-8859-1?Q?ML/LDOQ531kuiOfWZ+6zw/VN5keikOIyY/Dx9ymYtI9JD/x3aU1/Yk9174?=
 =?iso-8859-1?Q?ekUj8lX8/AdWDjLGY+A/r3INlVoqX0ZQCo7ZZ8j6TeR4lcCRYEdZv9w5jk?=
 =?iso-8859-1?Q?NOxKjsKFyYcYa3xtAzBSfZFHO5F9ELFUVyXzIZAUeoVFZLZLdysZQQdet6?=
 =?iso-8859-1?Q?zoBqCCIS9D5jmY7nhniPWjN126r5ktcG0HJQr1y3MLwGEnrURf7dmmFH/c?=
 =?iso-8859-1?Q?BtiBaEbGHb+OArfo9trGcnV/Kn0ofR6HyqceaS43wZT6JadYwlM+hqhp/e?=
 =?iso-8859-1?Q?Zo8e3SxBTgMbv9gwov6wr3YkH1hY+IoQqgQJ+64C5ehlcM8vH2vIFN5fFk?=
 =?iso-8859-1?Q?r4mPiZ52iUY4mOiFI9IvCWezHoblZERG55mZA+RUSR2f5aSiQlphPW6nNG?=
 =?iso-8859-1?Q?VU44t5kugT5Kz1DMWdHgQ5J9QlhVr+fVShfKzVt4aKSluvsyziT6LcPWbf?=
 =?iso-8859-1?Q?HL2jC+8sCT1uvneKBKuwTHsPatoqXfowN6/+0vEKQS/0CJkyKczFQ55EY1?=
 =?iso-8859-1?Q?w/8WpcLCAKH2lwgC/ZJ/fQWzMbi+/AfTLgZtJUyGZ9SkOsn5loXJpDEeuO?=
 =?iso-8859-1?Q?ID4AtZo5nGw9F6Ei2sY5PQiOhCarVFtuFr+TsozHkypHsU+wtjttnyEDuU?=
 =?iso-8859-1?Q?vOvcqPDc6GDnANm8MGj3tt+yKT0R8kyqqkfrOb9IYCgm8ZVaCAVbHP8alA?=
 =?iso-8859-1?Q?IGb4nfM7mODke1NOLgf7m8wQpSYMEsbilkoi0z7K0CpK5xyasiVT11Om71?=
 =?iso-8859-1?Q?HAnfsyBQ4v2fUbGQvN/KBQNj0FT9EFNny01EDOIdNbied8P1KSIDKLtqgD?=
 =?iso-8859-1?Q?V9maaMpayt88ZWF4qFdfA8RMDSsXQ5WXAoB+2xYj18T2KAz4VM5+qztOVa?=
 =?iso-8859-1?Q?Og6oLw36b3PWg7hnnFZloqJxdvqRwc+qiKqgtJy06Rp1f79pXRzNFUFoFX?=
 =?iso-8859-1?Q?docTXj+cuU/G3MpQHn8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c82f8f-b53a-4723-5684-08dde715fdea
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:19.6531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jxqsFicrPQa3DsYA52T3yoWkyuKAQdoXVEPN4YmNSwJU9JqhgY4Wclg0v6dBO8w/VekoRf4G8efE0vwvgG0woZ5nWSy2UsVpivk0+N1+LXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6317

Currently, Xen does not support eSPI interrupts, leading
to a data abort when such interrupts are defined in the DTS.

This patch introduces a separate array to initialize up to
1024 interrupt descriptors in the eSPI range and adds the
necessary defines and helper function. These changes lay the
groundwork for future implementation of full eSPI interrupt
support. As this GICv3.1 feature is not required by all vendors,
all changes are guarded by ifdefs, depending on the corresponding
Kconfig option.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V5:
- no functional changes introduced by this version compared with V4, only
  minor fixes and removal of ifdefs for macroses
- added TODO comment, suggested by Oleksandr Tyshchenko
- changed int to unsigned int for irqs
- removed ifdefs for eSPI-specific defines and macros to reduce the
  number of ifdefs and code duplication in further changes
- removed reviewed-by as moving defines from ifdefs requires additional
  confirmation from reviewers

Changes in V4:
- removed redundant line with 'default n' in Kconfig, as it is disabled
  by default, without explicit specification
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
  case of using NR_IRQS for espi_desc array
- implemented helper functions espi_to_desc and init_espi_data to make
  it possible to add stubs with the same name, and as a result, reduce
  the number of #ifdefs
- disable CONFIG_GICV3_ESPI default value to n

Changes in V2:
- use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
- remove unnecessary comment for nr_irqs initialization
---
 xen/arch/arm/Kconfig           |  8 +++++
 xen/arch/arm/include/asm/irq.h | 24 +++++++++++++++
 xen/arch/arm/irq.c             | 56 +++++++++++++++++++++++++++++++++-
 3 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 17df147b25..43b05533b1 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -135,6 +135,14 @@ config GICV3
 	  Driver for the ARM Generic Interrupt Controller v3.
 	  If unsure, use the default setting.
=20
+config GICV3_ESPI
+	bool "Extended SPI range support"
+	depends on GICV3 && !NEW_VGIC
+	help
+	  Allow Xen and domains to use interrupt numbers from the extended SPI
+	  range, from 4096 to 5119. This feature is introduced in GICv3.1
+	  architecture.
+
 config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORT=
ED
         depends on GICV3 && !NEW_VGIC && !ARM_32
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 5bc6475eb4..4443799648 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -32,6 +32,13 @@ struct arch_irq_desc {
 #define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
+#define ESPI_BASE_INTID 4096
+#define ESPI_MAX_INTID  5119
+#define NR_ESPI_IRQS    1024
+
+#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
+#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)
+
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
 #define INVALID_LPI     0
=20
@@ -39,7 +46,15 @@ struct arch_irq_desc {
 #define INVALID_IRQ     1023
=20
 extern const unsigned int nr_irqs;
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * This will also cover the eSPI range, as some critical devices
+ * for booting Xen (e.g., serial) may use this type of interrupts.
+ */
+#define nr_static_irqs (ESPI_MAX_INTID + 1)
+#else
 #define nr_static_irqs NR_IRQS
+#endif
=20
 struct irq_desc;
 struct irqaction;
@@ -55,6 +70,15 @@ static inline bool is_lpi(unsigned int irq)
     return irq >=3D LPI_OFFSET;
 }
=20
+static inline bool is_espi(unsigned int irq)
+{
+#ifdef CONFIG_GICV3_ESPI
+    return (irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID);
+#else
+    return false;
+#endif
+}
+
 #define domain_pirq_to_irq(d, pirq) (pirq)
=20
 bool is_assignable_irq(unsigned int irq);
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index b8eccfc924..61c915c3f9 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -19,7 +19,11 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
=20
+#ifdef CONFIG_GICV3_ESPI
+const unsigned int nr_irqs =3D ESPI_MAX_INTID + 1;
+#else
 const unsigned int nr_irqs =3D NR_IRQS;
+#endif
=20
 static unsigned int local_irqs_type[NR_LOCAL_IRQS];
 static DEFINE_SPINLOCK(local_irqs_type_lock);
@@ -46,6 +50,53 @@ void irq_end_none(struct irq_desc *irq)
 }
=20
 static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * TODO: Consider allocating an array dynamically if
+ * there is a need to enable GICV3_ESPI by default.
+ */
+static irq_desc_t espi_desc[NR_ESPI_IRQS];
+
+static struct irq_desc *espi_to_desc(unsigned int irq)
+{
+    return &espi_desc[ESPI_INTID2IDX(irq)];
+}
+
+static int __init init_espi_data(void)
+{
+    unsigned int irq;
+
+    for ( irq =3D ESPI_BASE_INTID; irq <=3D ESPI_MAX_INTID; irq++ )
+    {
+        struct irq_desc *desc =3D irq_to_desc(irq);
+        int rc =3D init_one_irq_desc(desc);
+
+        if ( rc )
+            return rc;
+
+        desc->irq =3D irq;
+        desc->action  =3D NULL;
+    }
+
+    return 0;
+}
+#else
+/*
+ * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn,
+ * because in this case, is_espi will always return false.
+ */
+static struct irq_desc *espi_to_desc(unsigned int irq)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+
+static int __init init_espi_data(void)
+{
+    return 0;
+}
+#endif
+
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
=20
 struct irq_desc *__irq_to_desc(unsigned int irq)
@@ -53,6 +104,9 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
     if ( irq < NR_LOCAL_IRQS )
         return &this_cpu(local_irq_desc)[irq];
=20
+    if ( is_espi(irq) )
+        return espi_to_desc(irq);
+
     return &irq_desc[irq-NR_LOCAL_IRQS];
 }
=20
@@ -79,7 +133,7 @@ static int __init init_irq_data(void)
         desc->action  =3D NULL;
     }
=20
-    return 0;
+    return init_espi_data();
 }
=20
 static int init_local_irq_data(unsigned int cpu)
--=20
2.34.1

