Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D89A11D67
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 10:22:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872255.1283213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXzau-0003NS-TC; Wed, 15 Jan 2025 09:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872255.1283213; Wed, 15 Jan 2025 09:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXzau-0003Kx-Ox; Wed, 15 Jan 2025 09:21:48 +0000
Received: by outflank-mailman (input) for mailman id 872255;
 Wed, 15 Jan 2025 09:21:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbvD=UH=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tXzat-0003Ki-Eq
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 09:21:47 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 239256af-d322-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 10:21:45 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBBPR03MB6795.eurprd03.prod.outlook.com
 (2603:10a6:10:208::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Wed, 15 Jan
 2025 09:21:43 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 09:21:43 +0000
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
X-Inumbo-ID: 239256af-d322-11ef-a0e1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGLBaHj/qSdH/A9Evnyc9piWdqjr3roME8y6giycGP4wJ5jozdpUSI7z8BXFtH5grFlLoBkO4gta5e3CcarJrL9/G8yY9Eou8IcurnUrdD6VikFeHhwfItsSo6XPGx/dWYGs/4mif+pSLn177wLnxY65/A6jc/3kUa+PgT6yQdGopEqNNIJSUjCtqxLyrvKVU2TzhVbZrcmW0oOqDYexUAMvuHLc/NCB1zfb0wm2K2DYJ+rdrFkHB4/fT846ic0LbxBgvKGy2W6kgE7tAyKaVMoBk3xNkz3FokeMCeClhQowPaYy0GPp4Mw/wHKgel2IqlmMpcudF096MuEapA5H2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Top9evq/WihGHQvxwO1jBz6G7LcEAMOiyT0Vi4ojDk=;
 b=LgOx8xd38JzrJiarpWuFjF+EcoYunU/x6Dfy6pXVBmbOhA4AjcMfMXUYxIZHTaaBiqCnAaQYlghYFDdkVQWVXQa+CCWIk30vzBOMe6HdrtpJZvyv7JCYgCWPsK8axaadgkvUFKL//P5IMK7a8M01UHBrGahskptCJZwXENg3AaHdb062Hs23SIWVTMYWkGf85lGyErmQ5b+gbgg2B0jB8MkuSHTXVMqaHgcxDTXeUwxcyUb527FJZTg+sfGpIjhOP0cJ9/CbIbfS7oL2mSu8xna6oZvrfms0SJcClILEbemW0+ri3w8m2d+VvEwa2fuUYoiwBiurCsoalrp1q+7Buw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Top9evq/WihGHQvxwO1jBz6G7LcEAMOiyT0Vi4ojDk=;
 b=XGboKKkymnE2Y/pHxwxRLvtjkuIGDMcml4bmRExV9VVFlk3xtNJdOblvb2ypbkfXOtS2M9mDFmui4zAwIackD2mR/dsbgksBM4hfCNpNIGIDxvnGB5WVuUrvbdAQwc5XkSh78caeH87au4+2LGhmC8ru7/98IgeDwRmlFTnwcGlKHMb+RYeRtnWLoZKMjGp+Feba5aA1ceLdAJtNk4oyl4XP8Iu6C0IpsnNt+5AqZsk313TLzOp68o1Jy8XjYok3LkDnM+5+iA69L63CQ7Lh59JZ+YMJPwwsEgcREISf5gbDC9oHz0Aq2XXskJfKBCl64Rt+45QnVShqpNw9uq7qPQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/2] Add support for Renesas R-Car Gen4
Thread-Topic: [PATCH v3 0/2] Add support for Renesas R-Car Gen4
Thread-Index: AQHbZy7kXq2K+/rUoEWFgqp6M1ngYA==
Date: Wed, 15 Jan 2025 09:21:43 +0000
Message-ID: <cover.1736931052.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBBPR03MB6795:EE_
x-ms-office365-filtering-correlation-id: 22c62564-d34e-4326-abd0-08dd354606a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?01dOzkZA/YHEKwhQg7zFSxe9OWnG5craFNXzYz26Noeuq3JqcxdGRv92F2?=
 =?iso-8859-1?Q?ztCUoQKwKZLA/ql6DDI+k9ubT2IQ6Kypqeu2Gjmv0gl1zKrWx8VtDe/3wR?=
 =?iso-8859-1?Q?5aw5sacdOuFbtjMQk5u7y9kNUdA0af4iH8WRxlTo/OtkAZTJhsrGPyinia?=
 =?iso-8859-1?Q?+m49QPX/hmuea2W5vYalg8CKa54DFD9ZVuCDQDSlEJ4cDlAdBQtEiTTZH0?=
 =?iso-8859-1?Q?ZnjbWbQXV5xJu71mpmvPjaSQY1KWL6R971EUwA/bHE5Et+vPqoPkZQwBtS?=
 =?iso-8859-1?Q?iIcKPmwI3dW8GJsfshv1mje57b7AcSVje9yDg/+0m775/kmr8zApgMN0n6?=
 =?iso-8859-1?Q?mxbrDw3uKeKdxPZKhp+QW+VdD7IH/iAeCYl0+AEaKy0f7h09eIAw8QKywV?=
 =?iso-8859-1?Q?d4JzufCUW5AtsksCSMW47SxvT2ZTHt9po9QBVAeXHChUx5imh4W6FVzSxa?=
 =?iso-8859-1?Q?UeyoCXO2kSi3giPtBrsDhPMtx3VdwikFfz35lG7DWv5+SfXSx+8JEsJnDA?=
 =?iso-8859-1?Q?blAPmRferbpwM33JgNybgRSyxAHJm7hiVxMh/p7ApG21iYYJONMD7z2uFV?=
 =?iso-8859-1?Q?OFfhgp/4O7gT/eaZxSmXEHJ54ugyUk9KDBEL4PkOSd1yQiZCrb1cJWi5Xg?=
 =?iso-8859-1?Q?E8MtsADAej+Re3F0gV294Ru8hVFloiy3bR5gKkm2MyDEvDOEMXO/5CZpYD?=
 =?iso-8859-1?Q?Ftj/z737TgyW7HNyxQljAbvB8PfL/tjTb04atZkPgTWjarYbbs+IVkCqJP?=
 =?iso-8859-1?Q?Fnsy1WyZlqEG2Co3s8zwRisIVPDv2FecconbDaw43i2qvzskyFIdqusvhN?=
 =?iso-8859-1?Q?D3rSgC5OCUnqLqdHANgeTHNnNzHU75FMLyYx791kRy6OMpfAPktRniFqRu?=
 =?iso-8859-1?Q?YPzYrWuEMX10u+lCf+4LyW9uiCI+TtyzmwmDhs668gYyNi9eINRqKtnrVi?=
 =?iso-8859-1?Q?WFABQyliNN7v0vSUDUS/IvvweD4XxC+aJVhMmMLMl8IZtLvG1SP0v54PXz?=
 =?iso-8859-1?Q?PFrCfi0BUaOmXgspeRm7Ci6G3Q4trP3X4pr2x56drUZU32OQe32hjG4AMN?=
 =?iso-8859-1?Q?6YMn+JHz/XkCFsY1su9wis4A2GNgFm0M/7xr3Rib12WkfRCZNBhhz00uud?=
 =?iso-8859-1?Q?ni0h0g7m2lqsiKG32+xibcpNoclHBfwrIOlPXzb8/MSExrUSeugDDJtFVM?=
 =?iso-8859-1?Q?5XO0rWxjUgmeqsNiYT4qaBGPnGSdPhXKa5cHnohy+WH9UF0Ip+WEoZdSG9?=
 =?iso-8859-1?Q?6pnhqXun4paxQwLq/Jtst/t22jN7xXZFlqp3gJWl675yjyU0A2bQmrf/JO?=
 =?iso-8859-1?Q?8cBDls8yPtu0w5tIUQ7nq7loonKrqRL3NISV/qAg+qKa//Z6GXdSxdzOKr?=
 =?iso-8859-1?Q?O757MC7uJrm0+GgAoazLFFU6wtfTcTr0fd8xMzMpLs+RQ4OYia9FCYwE85?=
 =?iso-8859-1?Q?0mg+YB+bb7+0q1JtUVn1PWfTVw6Kn3Ed4Uaevw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?u7hM/nKXg8WhGY79fzUwksM/RHDa6HcW2jIGepER29ous1/q1km93GlIJT?=
 =?iso-8859-1?Q?dee8IcXKMH4txc/sRck06CyL9+RApKvbv4CTMu184mLYNVJLhysz6MuxWq?=
 =?iso-8859-1?Q?B22X01WpAyDI7TuKprz+UmNZqkJ1VFb101yEwqKA/XExfcgZizZKoXCugT?=
 =?iso-8859-1?Q?DLO9b8jhUpYBKMkYtsBL1yt8/6su/HcGvVSs8xmk2a6b1DJlvoI/BstTZq?=
 =?iso-8859-1?Q?JjFR4t5x5i7l2omvmVw9B0NxNdawrhOfsuXogwHbXhlOqsRVIp7zLbTNu2?=
 =?iso-8859-1?Q?YpWjwd+6XuOa963qPH0zFaoO8jthGQboWjoKRzSFdrJTNv1w8M/7CG1JrN?=
 =?iso-8859-1?Q?bAOals2F3LKpmnux19mvnHLfq1MdOsCttJwtZ7gCp2Nv1KT/02833yzPIz?=
 =?iso-8859-1?Q?uqqsw1oJyvKoWhh6/XV6L4qkRo8MY/dV2+I6y7VOnVfZRLg++Ct3/gWkLe?=
 =?iso-8859-1?Q?80LFNcEBWJfwf44/1yyXO9GFtQRns8OatA2Tyn6TzEge19xmrOZ6+gzaPm?=
 =?iso-8859-1?Q?hKJNwebk1VQaD+ZMQanK/vNLeg0KpBUUNw2+UuIc0F64qhXt/MW3WEO+wN?=
 =?iso-8859-1?Q?l7u/ISvfSH//PhXYfggCeGaVfzS9679VJGmnwf0xPk6z9ZR1la/X/suBcS?=
 =?iso-8859-1?Q?90cuMw0s1ojKtGyNDJi1nR/P6smJz6rHrQstjiz3I9EMhXL7m21RgSNeqv?=
 =?iso-8859-1?Q?r16rl5vfExF5VWzHU24YmSlLY36yeqeoIt7X/ldt1mjfqenPtyufMkCPYG?=
 =?iso-8859-1?Q?1EO+wfM5ea5iMc3H7zkWyNLa24oJJb3YHJgIHEmnfA9QveWZ4gnFEFmbnH?=
 =?iso-8859-1?Q?HAxzE1LhVchsoKAz1SfeIaLwcJ0DRJk+VmgXNjcxCeB6zxcx6M1lkLX66v?=
 =?iso-8859-1?Q?Lj16zU8q0xRTAn5zZubFpjwS588784X4EBGwoqfPvzWZ/m/cujjv84RE0U?=
 =?iso-8859-1?Q?y2Rq64qRxg7y17HzkNCqFT380Dl8JiG8z565bUGDIuqtGz27mJ4X/ohWs5?=
 =?iso-8859-1?Q?pGrU1zwLdeE9zxkzrNlBSyel9T0umjKFR/ebLVFHeIPhHNVseOVtwj73Gm?=
 =?iso-8859-1?Q?n3sp5DcFjBCHGZH8qvfGhl7Ie6YkQfEM0B/TVNYAAXwoILfNEXjDu7GtY2?=
 =?iso-8859-1?Q?Ykd5rb9cfpaZm9wDqgig9fs0y6xcsB+IiQwbOvXoH4nuIkjBK6xkuyJO2T?=
 =?iso-8859-1?Q?1JQPxzAqvLougmRIVx6mqq9zwmbTK+r6RtlHYiz95WanG/5l5J2lZ3CLFC?=
 =?iso-8859-1?Q?GnQI7+Y+m8oVcxl/yDqMtSguejrGUPNBuq0tBCgjKIw8ckzWIggnpFTdnm?=
 =?iso-8859-1?Q?YAgd8peijg0x7v67SauAiHI40dUEYG8uUFIfjFDmdy0HEUx/KqDnsv17Bv?=
 =?iso-8859-1?Q?fh/O6GqbBaoASyZQyCwH5oZJDhIgzf1kPYu0Uq+OlsKEPGV6t35iBvdoM0?=
 =?iso-8859-1?Q?w0SVTHPTogwDwc3YWALEcFkSa1RjSFUf7efjjtshWduucWBKVWg1bsOvie?=
 =?iso-8859-1?Q?gP5K4AZBmDjRXd2jAPM2X2tcDJfp9LIvSdhwnGSAE2xV8b5Ajz0OliAgM6?=
 =?iso-8859-1?Q?qDkOmiUKVLTl80tkVlbK2Hs7kc0E1q9XUhQLAg3BXjeUe/H0tJR8uuJyEZ?=
 =?iso-8859-1?Q?mVySln4mMrTeW5kiE9MbtA29+E0uDeVHyWC498C1bQNR3s3fRhYvH6wQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c62564-d34e-4326-abd0-08dd354606a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 09:21:43.1709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: owqCvx+UtBcQPTV3LEypmJggwTxvfAteG8KMZPDMDuNBk9ye/rLkmFkbp1/fGxVKlnKP4mwbDFREiA7c01zUTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6795

Add support for Renesas Gen4 boards such as S4[1] and V4H[2] by adding the
appropriate confing option, and support for the Gen4 ITS.
Tested on Renesas R-Car V4H board.

[1]: https://www.renesas.com/en/products/automotive-products/automotive-sys=
tem-chips-socs/r-car-s4-automotive-system-chip-soc-car-servercommunication-=
gateway
[2]: https://www.renesas.com/en/products/automotive-products/automotive-sys=
tem-chips-socs/r-car-v4h-best-class-deep-learning-very-low-power-system-chi=
p-automated-driving-level-2level-3

Oleksandr Andrushchenko (2):
  ARM: ITS: implement quirks and add support for Renesas Gen4 ITS
  xen/arm: platform: Add support for R-Car Gen4

 xen/arch/arm/gic-v3-its.c             | 141 +++++++++++++++++++++++---
 xen/arch/arm/gic-v3-lpi.c             |  23 +++--
 xen/arch/arm/include/asm/gic_v3_its.h |   8 ++
 xen/arch/arm/platforms/Kconfig        |  10 +-
 4 files changed, 161 insertions(+), 21 deletions(-)

--=20
2.34.1

