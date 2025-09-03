Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AFEB423BF
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108452.1458598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoVf-0002Nt-6f; Wed, 03 Sep 2025 14:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108452.1458598; Wed, 03 Sep 2025 14:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoVf-0002Kz-3I; Wed, 03 Sep 2025 14:30:51 +0000
Received: by outflank-mailman (input) for mailman id 1108452;
 Wed, 03 Sep 2025 14:30:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoV8-0006B7-9i
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:30:18 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82a7cf84-88d2-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 16:30:16 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB7844.eurprd03.prod.outlook.com (2603:10a6:20b:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 14:30:14 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:30:14 +0000
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
X-Inumbo-ID: 82a7cf84-88d2-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRdIpArj430yq60+pGINacBxwKTTnbC/MSWb04K1xPDE/xNFrKDSf2coYqYnaUXfEfhgkUtK/KdvzaSI3zcBQ87tNvOcIcSexNgQweU7N/7QMCJz68yDY62Jl8p/O1Rg7cwk8ykJj1a19qZaOV7+eHUYuhdThahbRZK89ZkP7Ji742gwMSzO3vJn4vi+PRHOztnt2sXN/DodGQaWcI1Gi3grTR5P9VsSV7THJ31mX+O3FygaVvSgX8BGt+lHUBvfvdnPI0vLTmk7fKA+/A+i3D01M/7BbhhkPtpbLVPqSPIvkvBT63jy+62Zkw902Y9CkMbFGamxBh3qpi44gwssVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAmPb+B0JvN5LffvQELkgNDtjp5u1iEl1UljJXn5Cug=;
 b=scdkC1ISq+Ye1X5FUstFF+dSh9wdZoP+SvrGnzzqRxral0nKG7hD0dExVQlHWAnqwoKPwKyoFK+/D/GDCuIwzWv4XwjHJp1ga7vRk/36k5TOVmENhJG+mT9S+zrIfcr8sffIPx4WTYmDY2+ptobVOGu2JMy8YdHPDNLSfBLut1i1OD17p+73+Rt1UhKRmBZpQMAjR9TutoC74lR6pHar3Tsx6Xtd9Hr95o8XiqyOXvqnmWmj31w4cjkbAIiycLWrnw6BWz1VCMf+z2OLQ6H7A57yHep8vVNe4ke+GXdm5fVqY9bEurw8FLTCHMZLdADLN70TTWR+/zcIhajJO2QbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAmPb+B0JvN5LffvQELkgNDtjp5u1iEl1UljJXn5Cug=;
 b=OT6bVKjtVQshAeR2edHZi8O1A3ZhL4GpnmC1SvkWZAcevinvenAsyYxhiKp351D5g+MtgVJv58xth7JUo6hA8nehTVOgn5j8wJE9850yb4YH57465ATU0a5/KINcX8QaY34NSWpFiG6X8dAhtscgLGgDEQi8DGjw8q/QkVkm/kDQ7lMoMxfD9ZSIUCcOqM6+y98iwYOtYZJC59LP+ko2m8Xv7iQTAsiHVj53bnGPyd07zobh3FmU0io2li96c0bIiywyaW9jd4wY0mPBHamk8HS2Q5Atny4w4WHSD4dzzWYwVvOGaMu2gPzfx0w9wAFbR7m7N/nHGEPcbIvqSqZJ3A==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH v6 09/12] xen/arm: domain_build/dom0less-build: adjust domains
 config to support eSPIs
Thread-Topic: [PATCH v6 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Index: AQHcHN9D7Q32NTwVrkWcahBgGhYi8w==
Date: Wed, 3 Sep 2025 14:30:14 +0000
Message-ID:
 <8c37ff7960ffb334647a6af07e9c878c1ede3b57.1756908472.git.leonid_komarianskyi@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB7844:EE_
x-ms-office365-filtering-correlation-id: c502f03a-e546-4b6d-588f-08ddeaf665a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/ibMpheYZepxDCH5Zi0nTWqY+SDWz0YUkJgst/diDZv8KyKjhB0/eyIqy7?=
 =?iso-8859-1?Q?pom0roDRVMb4I7ecKlmkKRZmRtDrKg3QvbR5M6Xd1fHid0lYhtLC7tg4lQ?=
 =?iso-8859-1?Q?G2OeaXvWevU/pudewackski8GKTkyzDGEoNhrd/ECe4lBpxMUkhkEgEOy2?=
 =?iso-8859-1?Q?bUCxER98G04jcNEcI/cJtVidYhrJ8AQphNOh+F1ipAFh9oNY8mcyminXA0?=
 =?iso-8859-1?Q?wg1KqaO3vCamQE3SE26WrHECrdBzZknl0x9A7o6UKsVwT+UpVVKM/QZEPG?=
 =?iso-8859-1?Q?hQ62pP9CRBsa0msPoXeXw3+vhHHu63vDdEFtJNiOib58d4QaX7eW4DHdG6?=
 =?iso-8859-1?Q?wIGz9sz0yYVObwjuABq/YzcG5sOmpPKVJQ4StFJjUnHdHZCotp0Tm/V250?=
 =?iso-8859-1?Q?fQM4nrCf9qFK3ODAv8IPyLzoHhaC4XIg/aK30pSOG4TT/O8IIWX+Sb1ReG?=
 =?iso-8859-1?Q?dj4NFkTKOa4QRR7a+x7g8IqH0HkOBfED1W/o1sJq0FTbSnc2nsOE5RNlnL?=
 =?iso-8859-1?Q?mUaO1tkHfwt2KPhLCdYSWaB8kWdjEiFjHp69hYu071BzG60hDQHtOJ2FN2?=
 =?iso-8859-1?Q?+bdtK0yfOrtNxlkcmjepUo+3QBbA8H0vXTkUD7Xsat4PEOUNyoNk5pLSSa?=
 =?iso-8859-1?Q?ZLMu7zA2kW65e37o22z4xDaC0PyYTiwuX35mNgog0hKXihknkPb/i+EqVk?=
 =?iso-8859-1?Q?iXf5a4YE05HeTKA4D98BdjOo88q2VOiMOdjpftdW8NNICI2IFMTFxmgS24?=
 =?iso-8859-1?Q?y+f2Z9p/kgB8QuPcWWpw/MH+8fSsfnY7SvkKFVMd98QdlXwcUiNP023/NU?=
 =?iso-8859-1?Q?riLok+3mfyrvDx1oaIJktdbnWjRQMEk58Lr6zjI+ZT1aElwm2F+sEkGmFr?=
 =?iso-8859-1?Q?XKWYMTQkswPU/1NTRCQ/n13Ji91BsLnCcWnjTMbvCLUEiXxIJMOwWKwAu3?=
 =?iso-8859-1?Q?Fp+l8TmhCaEwaDUU9gCGvVLNNDBN5gaCZ10BYzQ4+S+O/vIh0p0c3PocIV?=
 =?iso-8859-1?Q?djSoAbZrLYltYYgCtI4oBO6rndzXogc5WQrrrEWm8y2NgP6YfI+866Q3um?=
 =?iso-8859-1?Q?HCE4eww9lJNVDwizKiMN1OqgM6KevNAzr/VP/CAG9Gu2RKId2WvoWCdU6A?=
 =?iso-8859-1?Q?cjsJayLLxkMG6IUb6gwa+m1CoCswxghvRkEDhpQ9cwQhk2T4BRwkUaKiah?=
 =?iso-8859-1?Q?klAQ15/FGNsU6jBsGYgbsN5T7B3yq8dmiONDjBFU/OSf7pZjdLQoEgaFUl?=
 =?iso-8859-1?Q?h5ze2Il5hp5DqigMOw8FvcJtvU1FOJzBhOLmFpHe/p9QsrRk+2t8cE3dIc?=
 =?iso-8859-1?Q?Vlvh3z/Lk9Er1Telo4aPWpZDJ6F0ksD7hdmb2cTc84xHAxJ+KYCyjphKjr?=
 =?iso-8859-1?Q?+H1fCZXAFQvfHAdW9Gbv82/I1I44TqcMO7WvA1uhpIPcdcjf2CUweA3DPi?=
 =?iso-8859-1?Q?hmfTX4LFG39tKnc1uk0qw0WPMCR1g5YzyuX81TXH2SBHKjfbMRD6Gz97pP?=
 =?iso-8859-1?Q?233LbABSSioW1MQmJ0zP+0RgzrefBvLyVWbQlYSDfLtg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SJNjHdzAX7/VCA1J95U1OIWF+r1gUtIzMsL3b13XSFtv3qjXn/R+nhnQ7H?=
 =?iso-8859-1?Q?tp2FEEoKfyaoG3ht9lcNToOZPqGVkOOSCTpM72Y2ErjCmQtl/dtWW1swIv?=
 =?iso-8859-1?Q?5by84PFA8zefduG+oJzyTLGrMuV1OF2HlSeIpoBqWXDKH7VIjgTbFG6hY9?=
 =?iso-8859-1?Q?c5eiDj3MCQQyelG1xRsFmhqVwQOV3LzFLjgGeE3HNrcnn3mx7g5S8IJMto?=
 =?iso-8859-1?Q?m1rG9C2W0C4XhRv4F62SUkfUfrzUdoVwFV2Ew8sBwEiPAG9Zj0rZdL004h?=
 =?iso-8859-1?Q?Sdy2LotQkXtKNsysm2y6mQRbF1IdvtG1BsAMbEhf5elQSWYxMhWybvg52Q?=
 =?iso-8859-1?Q?DG66nBhE5Atj55teFieBkYoNRRd7WwTnyNbb3hUuyz+k7JY0OfyWty3vlQ?=
 =?iso-8859-1?Q?I3ygyvkbDJoe+nEEGkJXy/w6feSL4X1Z66aOYUeS0p6MRO0j1NW2kpUTGq?=
 =?iso-8859-1?Q?xXVBxCYE4cU3M3X7mWiXrp93gJEmzc2VEk7Bxpng2Hv1OvsX8uz9zaW6XP?=
 =?iso-8859-1?Q?DzYI7BYiSzn5EorTjEcvYNEm0gPV5Gynpnp0hTKisASgcTOu19Q3/Ktht7?=
 =?iso-8859-1?Q?UxTW6yBFrL8H9f4053t18OLr6SSnRfr5JgkO2tcqYmKUOYRzlBxCUDI0rD?=
 =?iso-8859-1?Q?QZYaldg1beZtTGxHzI8+eh5yImG/KHbyrMk3BVdrLVRfu0vtcMYBX123BC?=
 =?iso-8859-1?Q?3Eq0iaPdLTkkxYy+jjlzky2hUW1d4dNsMCic39jPam12wW6W/DDz7rX2f9?=
 =?iso-8859-1?Q?bxZQd98odYaVn0wxvjykdJNB34bfpjPNnIRsD1kr+oliHTvj2pjzZCINyD?=
 =?iso-8859-1?Q?pWrEOMr01gXPt14Xk4tsmb0KHCAe9LxsR42nZK6xho88lJL/kBtmZzoM20?=
 =?iso-8859-1?Q?HBi802meGjPbrOvIoNO1xsSdUsnEwCRsLS/WN3QNASMiATI0vSEGQsglH+?=
 =?iso-8859-1?Q?CIDjv3JlaO4H8MW6odIKVsfaB56HtHzxVThwddA+6pluRwAbpN/ZQs0Yfh?=
 =?iso-8859-1?Q?0tHtM6bNNLv0tEmjAYtH7Lhi41DIR0m5bBlhzs3rGVcUcSRtZIos7VCoOY?=
 =?iso-8859-1?Q?fgKSv1dVqje9XFmH4Ivi2WJHfmwcrrAmLjdgnfObunbc8fstFMbZdQ+lKL?=
 =?iso-8859-1?Q?htMMiTMwBqlwJIfZMJO/JFCbUIwbhnFG1VmgZjeBNTCxEDSfVv80Q+qHvw?=
 =?iso-8859-1?Q?0nTlBcbV5HRlxbpfh6gqgUDdYIzfJNLk4M3UrzUUPBzC9nbUa5xIZynQ+J?=
 =?iso-8859-1?Q?eVYLpcsLhbfrl7CXfkroandpaYrdKZ/XVeoVdCNetrhkYU3TikK8s41S/6?=
 =?iso-8859-1?Q?1Kw102Lal3QImPK6+79gcIM4euAoUm8VQ6hg5cP5XRlid/fbEsu8RfI/Qh?=
 =?iso-8859-1?Q?EqkkG3bpSAQnnvw8BqgLP5EE5PJgQOx6sgH43GJDwbnn90Qr/erwSUgrpL?=
 =?iso-8859-1?Q?GQTwWu+rof8D82TKmXpulbCvcGUjtNpywQut8ySIvcPXjAenCvN5tF+PJk?=
 =?iso-8859-1?Q?2ERz+HXHZXYztURLQjsuXbtxpk6+0zP0PBAbR9bHGKqt0H87/+OXUpRSEV?=
 =?iso-8859-1?Q?9lePV8j2uurdcqso3XC800UUKfjFbrRibL/bqLN/7HBEkTDBbJrIdPlzD7?=
 =?iso-8859-1?Q?sQqX9ZpcKD7jcRUr3G8s/OFKcEhwa/XZg/1+M6DmJ7I3UlXMdVvL2ZnS8H?=
 =?iso-8859-1?Q?y9NEKO2tc/1e1OzlKaA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c502f03a-e546-4b6d-588f-08ddeaf665a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:30:14.4213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KB23C0eWAbv2VjrrAlvRbjgNbBRDc/Ld2WIBZem6teLYsUark5ZnnSZZE1Nj5iCKu/Mf+Q5bi/7GDgjjVBFAzR6fwPTsXXvvjuUI+VkvLMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7844

The Dom0 and DomUs logic for the dom0less configuration in create_dom0()
and arch_create_domUs() should account for extended SPIs when supported
by the hardware and enabled with CONFIG_GICV3_ESPI. These changes ensure
proper calculation of the maximum number of SPIs and eSPIs available to
Dom0 and DomUs in dom0less setups.

When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is enabled, =
the
maximum number of eSPI interrupts is calculated using the ESPI_BASE_INTID
offset (4096) and is limited to 1024, with 32 IRQs subtracted. To ensure
compatibility with non-Dom0 domains, this adjustment is applied by the
toolstack during domain creation, while for Dom0 or DomUs in Dom0, it is
handled directly during VGIC initialization. If eSPIs are not supported, th=
e
calculation defaults to using the standard SPI range, with a maximum value =
of
992 interrupt lines, as it works currently.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Changes in V6:
- minor: updated the commit message

Changes in V5:
- fixed minor nits, no functional changes: updated the comment to make
  it clearer and corrected a misspelling
- added reviewed-by from Volodymyr Babchuk and from Oleksandr Tyshchenko

Changes in V4:
- consolidated the eSPI and SPI logic into a new inline function,
  vgic_def_nr_spis. Without eSPI support (either due to config being
  disabled or hardware not supporting it), it will return the regular SPI
  range, as it works currently. There are no functional changes compared
  with the previous patch version
- removed VGIC_DEF_MAX_SPI macro, to reduce the number of ifdefs

Changes in V3:
- renamed macro VGIC_DEF_NR_ESPIS to more appropriate VGIC_DEF_MAX_SPI
- added eSPI initialization for dom0less setups
- fixed comment with mentions about dom0less builds
- fixed formatting for lines with more than 80 symbols
- updated commit message

Changes in V2:
- no changes
---
 xen/arch/arm/dom0less-build.c   |  2 +-
 xen/arch/arm/domain_build.c     |  2 +-
 xen/arch/arm/include/asm/vgic.h | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 69b9ea22ce..02d5559102 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -285,7 +285,7 @@ void __init arch_create_domUs(struct dt_device_node *no=
de,
     {
         int vpl011_virq =3D GUEST_VPL011_SPI;
=20
-        d_cfg->arch.nr_spis =3D VGIC_DEF_NR_SPIS;
+        d_cfg->arch.nr_spis =3D vgic_def_nr_spis();
=20
         /*
          * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d91a71acfd..39eea0be00 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2054,7 +2054,7 @@ void __init create_dom0(void)
=20
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
-    dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
+    dom0_cfg.arch.nr_spis =3D vgic_def_nr_spis();
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
=20
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 1cf0a05832..c52bbcb115 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -347,6 +347,25 @@ extern void vgic_check_inflight_irqs_pending(struct vc=
pu *v,
 /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
 #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
=20
+static inline unsigned int vgic_def_nr_spis(void)
+{
+#ifdef CONFIG_GICV3_ESPI
+    /*
+     * Check if the hardware supports extended SPIs (even if the appropria=
te
+     * config is set). If not, the common SPI range will be used. Otherwis=
e
+     * return the maximum eSPI INTID, supported by HW GIC, subtracted by 3=
2.
+     * For Dom0 and started at boot time DomUs we will add back this value
+     * during VGIC initialization. This ensures consistent handling for Do=
m0
+     * and other domains. For the regular SPI range interrupts in this cas=
e,
+     * the maximum value of VGIC_DEF_NR_SPIS will be used.
+     */
+    if ( gic_number_espis() > 0 )
+        return ESPI_BASE_INTID + min(gic_number_espis(), 1024U) - 32;
+#endif
+
+    return VGIC_DEF_NR_SPIS;
+}
+
 extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);
=20
 static inline bool vgic_is_spi(struct domain *d, unsigned int virq)
--=20
2.34.1

