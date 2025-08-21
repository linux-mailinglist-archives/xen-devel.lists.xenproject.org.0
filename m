Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB690B2FFC5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089005.1446704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7xu-0007fQ-42; Thu, 21 Aug 2025 16:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089005.1446704; Thu, 21 Aug 2025 16:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7xu-0007dg-0k; Thu, 21 Aug 2025 16:16:38 +0000
Received: by outflank-mailman (input) for mailman id 1089005;
 Thu, 21 Aug 2025 16:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kfR=3B=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1up7xt-0007da-6c
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:16:37 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35addf57-7eaa-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 18:16:36 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB6850.eurprd03.prod.outlook.com
 (2603:10a6:20b:2dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 16:16:34 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 16:16:33 +0000
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
X-Inumbo-ID: 35addf57-7eaa-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0uAgK9pG1SbuErXh6UUpTtDsj+l2AuWmMAmj8geADO8WuwQzI87r+eCxb3nqrPDp+irqFs3nh9giaXtYPGGHQzI8oXskILuVdKVcrb24/BO30dIpLskaDCA1TqiWCx4+jAbTOTAKR8V3FfKBFuQqiOUsELL1tkdK3hnkBdCc3d9wyBedo8VZEJLOcTO3aG3x6SPmBzGAzN7nQDS4mmCaZA8eDPeAQzCLzs7NY0SHc1SJ0PtZnCGtlKRHPYv39NMdyk+lBbd4e6NVcZ3Ce3QRmqHUWTgbwR6Wb46VKh+Gffhn0zjgeep0rmLpQLuNs0dCd8/TKoNL0vfqqtqygGWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvPqzz75D5k/uaF3f/ms0CIp42w16hYgaIseShsd/MU=;
 b=VM7OpNEwfAcZqHYdK+XmH3Eq3gOIsKnt/dQHLNzab7MP+0FTa/Y6c3HUkqpyUMTtU+JCYgjWIagMH7Syegw0dmxDeR5DAAIJz5GVisPvQQi7sKKxqp+27MebdQ2VRRXxbkxWtkE7o6mwIZK8GaPP/At8hUCkb6Y+RwYxnF+S6ZfbzvnywOQHkmHeTa7y8/MjrjBWumxKeokAx1HQSwy/EQwlk4+rDlSa/ssqQeOmY6AHJoYCyWlpqZixmq41pT+SEgV5G1zq5jC68yEuafEfVAwHmGTlmJVtPt2ASzUQaFmBujBX8DT+RiFy4UCtaABxYC3g+OpYEnCy2Kcak7Nwjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvPqzz75D5k/uaF3f/ms0CIp42w16hYgaIseShsd/MU=;
 b=E6EUtrF7lw3HJw21gtl785F1AlkgAALHNhHsFdWeu+9PQqdoqAblch1IYvoN8cN65cVwXjxwksiL5hpukdAkGqffqakExcTQjs0t+uf3aigDoYSY8MaH7LrFTqjTpK1WbAR/gIWx3Ur65QgueJ10elLrz+j+nzDv0MdYcbzrXBxE+Hd/Ff/DBbQ9mmMNAEI9OwNeP7f9c6t/JVf3oYoBT0F4E3yw06d2yn2g147duLqNhuKtyBh1hy/EN0e6qBl3C+BguZw9OBy/7RgAs+yTJaRqAYLFHJwCxb8aT+TPU+L0XUvFOw4NFm4tTQHkkOTHuB4CVkIEXrMXjIg0PsacbQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 05/10] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Topic: [PATCH v2 05/10] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcB5d9H9bLPDmInkebrBgUpOnx8g==
Date: Thu, 21 Aug 2025 16:16:33 +0000
Message-ID: <878qjcejkv.fsf@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	<2491bee7441f13a3c1a01fd77ece1749e7276352.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <2491bee7441f13a3c1a01fd77ece1749e7276352.1754568795.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Thu, 7 Aug 2025 12:33:31 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB6850:EE_
x-ms-office365-filtering-correlation-id: af411be5-9fbe-48d0-c523-08dde0ce188c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oOdR8LKd0pdTrcRmOrpRCaXSwvJ58+OZ856PPrGW2PufGNAiA41RLFmAZQ?=
 =?iso-8859-1?Q?RXTPAdVeBKYr/FVaev4QSivaeZcRErDTgbh4EUPYucydxsVNNnfqkXX6K5?=
 =?iso-8859-1?Q?FR37nXoB/krZyiGXdsTMAo5BtbrPA7BoZTK6o40m61mPumtCD0J5/40les?=
 =?iso-8859-1?Q?A5yQT3TpwWULJMPpAeMmJslFEPeB4ri4Xkd3SnWhSoRMLSnFWc0b+QHPA5?=
 =?iso-8859-1?Q?fmZCk8I+2dT1RT3qJhJKMHPTUQ7Xmkh9Vr9+Rasx62Hwd0FMcZQw+nqel9?=
 =?iso-8859-1?Q?8RfEPByBtmd/rXEG6NwdgQMWyzEbRsoA7B3rl5EXPZMCAw4mnNDHWu9LDu?=
 =?iso-8859-1?Q?QkRUZCM9Nh589h5lmXeXWKpATAI6h2ptivSRWvwAehbgpLlNL37deHSeNR?=
 =?iso-8859-1?Q?SimABgHjiRVQaAiWpCPePU8cAfAUTYjZVnhUDSvIbwENb52rSpnTeG9uWr?=
 =?iso-8859-1?Q?A2RMosQrQNx0USgYpTedzbJ47E69H9jDcUqQe1b0DohiWfqoehvno6eszC?=
 =?iso-8859-1?Q?TezrTIdenqRg1PhHy1koiB6PHKwXHbH2bRXTzbHK7IneSENeuOtLmfs8p9?=
 =?iso-8859-1?Q?9IDnRhQ/bo0iIYsA35vVIrB7awgZcpB+2rAKbyxQH75n0Qb7YoPeOBhamh?=
 =?iso-8859-1?Q?czuXOjFU6orgHlp8my1KnRg0YU87jbF1jZDakVPbYnS5ogN1ZSwqzh+lKu?=
 =?iso-8859-1?Q?TD2X8mx7gJkCgl6Cb4Lh9UbLG1mCcHXf/jEhtYfWnl5WuCU4PhZuQKJlgZ?=
 =?iso-8859-1?Q?DNTIV9I3AtSPKM26XalQz6ndDVAacLxtzfGxSeNcB3exARQHw/1wQ5HmTP?=
 =?iso-8859-1?Q?O/9DQ8JwZazP6qoQOtARA48mUKVmQnW51CpgxRhQpsBpZvuyP++SbpkJo0?=
 =?iso-8859-1?Q?Sr0KO1XtOOj7wdCdK5Ci/2IQSxtz4I6SNaVYxjWvOziifOTG1FcLZHTrKg?=
 =?iso-8859-1?Q?MllC9szd7Zz1VxwT0Q+leLzHT9WiljvMQ62+7+h33QC2t5/k3UtVqiZHlN?=
 =?iso-8859-1?Q?8wXtWacVXAY0bxJCpPr4tB3Th4CctrqhsybvYTGyMHCQZgkm8tNUdf05qK?=
 =?iso-8859-1?Q?fBYD/JhLHwIZR8X9cJLNxBupXrl45JtG497G8NSKQVj1+Jhd4LAgTO9Uae?=
 =?iso-8859-1?Q?z1RIJGvTp2wlnVNDJ1Du+bBFqySYVI8mY3SJADsexb8ga4/FrGR17us9dr?=
 =?iso-8859-1?Q?+jNUzFSqqGIyICf82RW/JJV3ljd/4urIQ223yKXsNFc2babZFj0Tnrevll?=
 =?iso-8859-1?Q?feo4Ohqt0MiB+UUheHVLi8iUdqZet8XcypuY7xf6bVVbfv8nWIZtvFme1u?=
 =?iso-8859-1?Q?l2ydbwMNB2yvh3szWqiQjii/j/JM6s7QrLIolzac6Eo0lJ7O4uC7gi+cOq?=
 =?iso-8859-1?Q?mZH9v2AVzEUv8mNIFqnZbn22Omjl1sOtYNjqYkGyqHIaLpob4rHSxzPSUy?=
 =?iso-8859-1?Q?gVFn8bxg6mToptPAluFJJdAGPcbQEE9ngZLFSY19FhBPbqJa5o3W0TRFyS?=
 =?iso-8859-1?Q?88g2ddD4v6NIiHwkf4IUh/JTgeiKlTVS7pLUTRH96eTA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+1vT+Hiwe/oB9kHGYKuHHfD4pNtQBLAfuHuo9E7/HkVHl9NySpKS+yBEQr?=
 =?iso-8859-1?Q?8EkSw/HBwT+UpDA9lJkZJtfKU1MnSSn0zsUaZ+S4fXsp7fNtY+vYHTkQbG?=
 =?iso-8859-1?Q?xihTAkhO2h4ZlxJRbmrO8gDZtjG6zEz+EtNn4GJ+T71PPAXxJacKz4EwGN?=
 =?iso-8859-1?Q?tf2TaXrSvDEaLtoaEbpQJ8dJ1lJ2hexkQomoDs0s3sS9A/DQGSl1CdHujQ?=
 =?iso-8859-1?Q?VAZdEEUc9SSVaNlmKaONq3NqrrZah8DgjexkEeKRsxpapxX3olUjY7Su2O?=
 =?iso-8859-1?Q?0LysCyV40UPbHwhjhhTsqb43dgdNWyraoQZ2vL23zXp5USvkcv3B2+uBe7?=
 =?iso-8859-1?Q?vzegfT8sR3SEA5AyOy/90wk0aTEE1Gv2AOiX2RXMsWZHk7b/Au7FHyq9t3?=
 =?iso-8859-1?Q?oTL2swMqqw01jZvKUXp4pe5nhHblH+XEds7PEYgbdzuwf5zTT4DRel576D?=
 =?iso-8859-1?Q?g6sD983c50gGClvETjG94bmJYV4ELajD+lZw47argdI4i2QN4r1/IXu/cF?=
 =?iso-8859-1?Q?aWj1mYD0uBPWz3sfnvWz7rsAxwgzfxQU78FmDW4uRbVxbHriIRYilPHDrD?=
 =?iso-8859-1?Q?xX2Xgo0olpqbDtOeEuZUauyx91kEHAlrmJ+H2Tcr8YemZIX1tPiycWrH2H?=
 =?iso-8859-1?Q?ZS6GgYrQM+m83lFxwvy4Y1DJQSUbRwyhJdxqB7tqZp5+H07QYpTzIseTR7?=
 =?iso-8859-1?Q?ZptOuko6/CC93Zx41UnUfUZhVkAKCUsBM6OWG1B7gCZCFXNdInshNw7SuA?=
 =?iso-8859-1?Q?is83d+tEnbPTy2saebc3Umzx0r+idRiO4vwWLvQRD/sZt7kyEPxqZrZsX8?=
 =?iso-8859-1?Q?PZt76mBv4xZQCpHn6nv9jxzb/xhMZeY3V/573a5QYYyyjAUSWNmN1oDZ+U?=
 =?iso-8859-1?Q?+wuYS+AOVbT2s85+Wh/4GmndkMejMMTRz0W7EdrRSDC5YOlBVr02wBoQrf?=
 =?iso-8859-1?Q?Pz4MQgjAeYOQcyjg62Lb89hPgxKTzNC2BjRoPvUOURS9wAf/kMz/nOCc6X?=
 =?iso-8859-1?Q?CYb/9emVOGB4TcChnwZZhQP5WcqM+qOb9Q9uZz5OLfQYaB2GJt7BxJGzA+?=
 =?iso-8859-1?Q?ZnoziSsU9y966er9Tqpb+JmF3aLR00GHB6o/AbXCC5OoOfcsTq2oJsjQ6g?=
 =?iso-8859-1?Q?0ShjEs7O2/+uowz6i8E3SXLu7+DbENy2BWRaXnXaddEs4wVtj1/gBqWXku?=
 =?iso-8859-1?Q?weVadvX8eVUy/UEj6qtTH3rNqsLXcDgAhf+tcsyxnUSFoOT+whwzH05LVI?=
 =?iso-8859-1?Q?umdZZdqNZoFyxAfj2PY/+2q6ysdY2lBcoYbAUzCD1BqifCK+335nsOOvID?=
 =?iso-8859-1?Q?9n/2WKsHQCm+fYfQMzsHsx56HOazODJR5lrxqLBSeKU7JX6Ra/2+GDGweR?=
 =?iso-8859-1?Q?zyzI0Odv/n+uqs72WSWRhlJimkKjbeor2zIG00fZ89Fkug58I39hzgSmzn?=
 =?iso-8859-1?Q?i0M3GPs9aAEy43Ibm5ev9OkWN7UtM1W0j508S/6uQSb6/wCZ7Z6Jyo+cZe?=
 =?iso-8859-1?Q?aGFdaQmdqFTMnRf+qTCAQIAeg63W3nfJLcUCufxpb9utaT7a7Ze2xNjYxA?=
 =?iso-8859-1?Q?riy6h3P59ragRXXaMrP6lID1vKSW7bLIGLhKMlCYEj7+T+Mh+yGdGh3Yu0?=
 =?iso-8859-1?Q?46SqjiFsCDf79d2LhNMraxdyogh/Po54LNaHqv9xw/5w1cR/miSV9m0A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af411be5-9fbe-48d0-c523-08dde0ce188c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 16:16:33.5884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j/JKzdYr7kXO7dUrEbyd8mSYokY5IY8aQKxXtJc6TnkW+iU8oCO+ey6wbFKQEo2nrhpIaFoF/iZNJjCoYseAxFklRI6MHLoQpsCFtJFOF7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6850


Hi,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Introduced appropriate register definitions, helper macros,
> and initialization of required GICv3.1 distributor registers
> to support eSPI. This type of interrupt is handled in the
> same way as regular SPI interrupts, with the following
> differences:
>
> 1) eSPIs can have up to 1024 interrupts, starting from the
> beginning of the range, whereas regular SPIs use INTIDs from
> 32 to 1019, totaling 988 interrupts;
> 2) eSPIs start at INTID 4096, necessitating additional interrupt
> index conversion during register operations.
>
> In case if appropriate config is disabled, or GIC HW doesn't
> support eSPI, the existing functionality will remain the same.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V2:
> - move gic_number_espis function from
>   [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
>   to use it in the newly introduced gic_is_valid_espi
> - add gic_is_valid_espi which checks if IRQ number is in supported
>   by HW eSPI range
> - update gic_is_valid_irq conditions to allow operations with eSPIs
> ---
>  xen/arch/arm/gic-v3.c                  | 73 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/gic.h         | 17 ++++++
>  xen/arch/arm/include/asm/gic_v3_defs.h | 33 ++++++++++++
>  3 files changed, 123 insertions(+)
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 8fd78aba44..a0e8ee1a1e 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_d=
esc *irqd, u32 offset)
>          default:
>              break;
>          }
> +#ifdef CONFIG_GICV3_ESPI
> +    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
> +    {
> +        u32 irq_index =3D ESPI_INTID2IDX(irqd->irq);
> +
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
> +        case GICD_ICENABLER:
> +            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
> +        case GICD_ISPENDR:
> +            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
> +        case GICD_ICPENDR:
> +            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
> +        case GICD_ISACTIVER:
> +            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
> +        case GICD_ICACTIVER:
> +            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
> +        case GICD_ICFGR:
> +            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
> +        case GICD_IROUTER:
> +            return (GICD + GICD_IROUTERnE + irq_index * 8);
> +        case GICD_IPRIORITYR:
> +            return (GICD + GICD_IPRIORITYRnE + irq_index);
> +        default:
> +            break;
> +        }
> +    }
> +#endif
>      default:
>          break;
>      }
> @@ -645,6 +675,40 @@ static void gicv3_set_irq_priority(struct irq_desc *=
desc,
>      spin_unlock(&gicv3.lock);
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +unsigned int gic_number_espis(void)
> +{
> +    return gic_hw_ops->info->nr_espi;
> +}
> +
> +static void gicv3_dist_espi_common_init(uint32_t type)
> +{
> +    unsigned int espi_nr;
> +    int i;
> +
> +    espi_nr =3D min(1024U, GICD_TYPER_ESPIS_NUM(type));
> +    gicv3_info.nr_espi =3D espi_nr;
> +    /* The GIC HW doesn't support eSPI, so we can leave from here */
> +    if ( gicv3_info.nr_espi =3D=3D 0 )
> +        return;
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 16 )
> +        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 4 )
> +        writel_relaxed(GIC_PRI_IRQ_ALL, GICD + GICD_IPRIORITYRnE + (i / =
4) * 4);
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 32 )
> +    {
> +        writel_relaxed(0xffffffffU, GICD + GICD_ICENABLERnE + (i / 32) *=
 4);

Is there are particular reason why you use GENMASK(31,0) below, but
open-coded 0xffffffff here?

> +        writel_relaxed(0xffffffffU, GICD + GICD_ICACTIVERnE + (i / 32) *=
 4);

... and here?

> +    }
> +
> +    for ( i =3D 0; i < espi_nr; i +=3D 32 )
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) =
* 4);
> +}
> +#endif
> +
>  static void __init gicv3_dist_init(void)
>  {
>      uint32_t type;
> @@ -690,6 +754,10 @@ static void __init gicv3_dist_init(void)
>      for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i +=3D 32 )
>          writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * =
4);
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    gicv3_dist_espi_common_init(type);
> +#endif
> +
>      gicv3_dist_wait_for_rwp();
> =20
>      /* Turn on the distributor */
> @@ -703,6 +771,11 @@ static void __init gicv3_dist_init(void)
> =20
>      for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
>          writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8)=
;
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * =
8);
> +#endif
>  }
> =20
>  static int gicv3_enable_redist(void)
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gi=
c.h
> index ac0b7b783e..2f570abf70 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -306,8 +306,21 @@ extern void gic_dump_vgic_info(struct vcpu *v);
> =20
>  /* Number of interrupt lines */
>  extern unsigned int gic_number_lines(void);
> +#ifdef CONFIG_GICV3_ESPI
> +extern unsigned int gic_number_espis(void);
> +
> +static inline bool gic_is_valid_espi(unsigned int irq)
> +{
> +    return (irq >=3D ESPI_BASE_INTID && irq < ESPI_IDX2INTID(gic_number_=
espis()));
> +}
> +#endif
> +
>  static inline bool gic_is_valid_irq(unsigned int irq)
>  {
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( gic_is_valid_espi(irq) )
> +        return true;
> +#endif
>      return irq < gic_number_lines();
>  }
> =20
> @@ -325,6 +338,10 @@ struct gic_info {
>      enum gic_version hw_version;
>      /* Number of GIC lines supported */
>      unsigned int nr_lines;
> +#ifdef CONFIG_GICV3_ESPI
> +    /* Number of GIC eSPI supported */
> +    unsigned int nr_espi;
> +#endif
>      /* Number of LR registers */
>      uint8_t nr_lrs;
>      /* Maintenance irq number */
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/includ=
e/asm/gic_v3_defs.h
> index 2af093e774..7f769b38e3 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -37,6 +37,39 @@
>  #define GICD_IROUTER1019             (0x7FD8)
>  #define GICD_PIDR2                   (0xFFE8)
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +/* Additional registers for GICv3.1 */
> +#define GICD_IGROUPRnE               (0x1000)
> +#define GICD_IGROUPRnEN              (0x107C)
> +#define GICD_ISENABLERnE             (0x1200)
> +#define GICD_ISENABLERnEN            (0x127C)
> +#define GICD_ICENABLERnE             (0x1400)
> +#define GICD_ICENABLERnEN            (0x147C)
> +#define GICD_ISPENDRnE               (0x1600)
> +#define GICD_ISPENDRnEN              (0x167C)
> +#define GICD_ICPENDRnE               (0x1800)
> +#define GICD_ICPENDRnEN              (0x187C)
> +#define GICD_ISACTIVERnE             (0x1A00)
> +#define GICD_ISACTIVERnEN            (0x1A7C)
> +#define GICD_ICACTIVERnE             (0x1C00)
> +#define GICD_ICACTIVERnEN            (0x1C7C)
> +#define GICD_IPRIORITYRnE            (0x2000)
> +#define GICD_IPRIORITYRnEN           (0x23FC)
> +#define GICD_ICFGRnE                 (0x3000)
> +#define GICD_ICFGRnEN                (0x30FC)
> +#define GICD_IROUTERnE               (0x8000)
> +#define GICD_IROUTERnEN              (0x9FFC)
> +
> +#define GICD_TYPER_ESPI_SHIFT        8
> +#define GICD_TYPER_ESPI_RANGE_SHIFT  27
> +#define GICD_TYPER_ESPI_RANGE_MASK   (0x1F)
> +#define GICD_TYPER_ESPI              (1U << GICD_TYPER_ESPI_SHIFT)
> +#define GICD_TYPER_ESPI_RANGE(typer) ((((typer) & GICD_TYPER_ESPI_RANGE_=
MASK) + 1) * 32)

Isn't this line a bit long?

> +#define GICD_TYPER_ESPIS_NUM(typer)    \
> +        (((typer) & GICD_TYPER_ESPI) ? \
> +        GICD_TYPER_ESPI_RANGE((typer) >> GICD_TYPER_ESPI_RANGE_SHIFT) : =
0)

I am not sure that this is correct.

Probably you wanted to write
+        GICD_TYPER_ESPI_RANGE((typer >> GICD_TYPER_ESPI_RANGE_SHIFT)) : 0)


> +#endif
> +
>  /* Common between GICD_PIDR2 and GICR_PIDR2 */
>  #define GIC_PIDR2_ARCH_MASK         (0xf0)
>  #define GIC_PIDR2_ARCH_GICv3        (0x30)

--=20
WBR, Volodymyr=

