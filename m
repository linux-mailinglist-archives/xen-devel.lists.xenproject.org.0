Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FABB4A99A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116137.1462554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvHf-0001i7-Qt; Tue, 09 Sep 2025 10:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116137.1462554; Tue, 09 Sep 2025 10:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvHf-0001ez-Na; Tue, 09 Sep 2025 10:09:07 +0000
Received: by outflank-mailman (input) for mailman id 1116137;
 Tue, 09 Sep 2025 10:09:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvHd-0000yD-HK
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:05 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0371b46f-8d65-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 12:09:03 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU2PR03MB7893.eurprd03.prod.outlook.com (2603:10a6:10:2d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:08:55 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:08:55 +0000
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
X-Inumbo-ID: 0371b46f-8d65-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCMkPLkiebnoGEUsZdfAIOAnGkswz7aqufMZ4FNsm/X4GjuoCDUD4D+6y1YwadkZc4o9jKs64RAEG+E/4RAzNe/aCtSwyAQqQz5WLV6R/ke4SjdeIyzPofBlDZI2lF2+31Ns5GiqXlRU64ZBcicT2c7t+ZUxGaTzPBDwsV9OKpiTdOh2axQYgryUCj1nRHZq6EUsie01d4EVe9iG6z2PgYTIbEuWLaEmt8qBFu+o7wYXrlBS5Zpcv10BfZk2Of4ZMJkyk68xnQAGlmh6ELu+O0bFJV+hwuh6OlpYkAkY1CsYh7h1UdyHdmc68iJb0I1SiQYVtfiNgSxTdBFQeiIIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwZr1vV1Q96H6HEtTxKLX5tqmoYStsOduUB7RTj1ALk=;
 b=oSOEbeZTNIzj55WWbkKz5swRaamXVAF/WFjQLENGpNjsuNm1UtXYwKA3w9TgznsqYv/7aNXQlbV3tACQrkVAZFR3J0AKVhzVdcKszWxYUwzrcG9Dovg9aa74vdE0vPhYldGFqOn6+WBkSe4PmVT52FJ7GD+kFUJCkLXizwvaeDG+aJQl3wWYGqkRb9StQ1apURDVNfO/MtgmIh5qfKRKcuxIskU8qkbt/n+rcKXkNJ5C0DuTn1v10zbfp3utrEwrjnuxHli2for+qed2cd4Q91PrTZ8Mjkh1SbTUVwFdf5BG3zvCG0AG7BmTxIkM8vcKO4kvXDc6bdOuiWsvcQztkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwZr1vV1Q96H6HEtTxKLX5tqmoYStsOduUB7RTj1ALk=;
 b=mrkTWNmfo9B1JoADNc3gwqELeOtqE+vmy3elF1Notr4/rL7akUh/bTn/SxdFTjFqxzy8e/KJeEZDl0sz1hbLpxIfMhk2ULaOOkxe8JV2KwnrOluRkGexGh4HzNK03k7BERMUtDaWRq4kMYrjbGEi4hCvdrs/elLUV78h93K5BjdzjnXqrovzVAwQ0IaZUNywtxVXJs5pie53iNPbRFMyeanoUfBsY2/5B8gADf7RkQWg5kcoTrgkoZf1Pp8jjIf8wVvgbp0Mq307D38DnR0EgR4CxLNpgw6zwv1LMJ8CjH8KknGl3oXApw8GQrcKVmruIjcLUZC/b/fr2koEyuCz1w==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: [PATCH v8 01/12] xen/arm: gicv3: refactor obtaining GIC addresses for
 common operations
Thread-Topic: [PATCH v8 01/12] xen/arm: gicv3: refactor obtaining GIC
 addresses for common operations
Thread-Index: AQHcIXHA9a7hs9OcpEuwEnF/MObXqg==
Date: Tue, 9 Sep 2025 10:08:55 +0000
Message-ID:
 <8a3d9390b8d4ed9c9af0465f27fe6866e6535162.1757412099.git.leonid_komarianskyi@epam.com>
References: <cover.1757412099.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757412099.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU2PR03MB7893:EE_
x-ms-office365-filtering-correlation-id: c0650e2e-65b4-466b-cf35-08ddef88e2b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?R3WYXPD8xUIg31Btg+/lDq0oWnFVLPLIhRZAQRDm83s/ygmR8SPowuJpgb?=
 =?iso-8859-1?Q?Q+e6KtMQdSFb0wO473WScFb7OOsXe/ZFsDgTqc5Fca5hsGnHkMP7glqH3i?=
 =?iso-8859-1?Q?vRCGF98LXDlqoA4dk92wwVXCI2/Ux7Cy9PnBMc7Aet0tgNMA0srSw30i/I?=
 =?iso-8859-1?Q?lMuDZc9aIyx5O1lbO8AM1N0s7Hw+nyTD0Fot5hXMZXhix+EaXiavgYcDKo?=
 =?iso-8859-1?Q?KzfTgJY3+KRC/8xYN6XJx9noayz1b5FU5T9eRJUgsNqJRTC+Qi1CqA9pBo?=
 =?iso-8859-1?Q?bKV+YLDtfPvybwCbsxIE6t/f8VwhzR2+EtdourWOABNkm3/RrRJj1SVLCG?=
 =?iso-8859-1?Q?Y0bMuqJOmX6d1SCDCosG4gl4vNKMWBkUEkSBHkgbS5O0MEqokdSJmrvuW/?=
 =?iso-8859-1?Q?UODw9so61ZZWfoHwkMHW4pJeTVY6RTNAB5XDq2CTZRi76L3iQr3Lo38y3i?=
 =?iso-8859-1?Q?Fq1tSi4FGEELjylUejKnWBmGlExFevLeZT9SsLEK05PbN1ymynqFl+qJtF?=
 =?iso-8859-1?Q?G9TxiycljC7zc0CusWRgjdwVHtk3XTKlqM6JZuUCOKfeR9qpeSg/z+h4s4?=
 =?iso-8859-1?Q?t298RCQp085akkdvbu4HSG4k8MGD79EFnIt4/n22TDMGR2COvIU+A3rzyl?=
 =?iso-8859-1?Q?lkiDC+8WP48mOzewOpgedyUv5CpOVZisnmUKF/uN86xQYYiDm0f3JTIW1v?=
 =?iso-8859-1?Q?UMIhlLUUBADwtHQvEwscWjET3tob0zK07s50uR6KdzyMoIwQtnf17wB8A1?=
 =?iso-8859-1?Q?1fvBabHUOXkgbiA3PCprme5xpAKfjWtK4yVXqPTVWT6Mo1k6yvG9ODxQUd?=
 =?iso-8859-1?Q?AfwnLF3vWHfZgsFRbMjjaxk6pAf4bVklCkQF9aM7XNReYVGRLNM2anK/1z?=
 =?iso-8859-1?Q?KGEIDKjKyhLku1fSQq0XY6E6rS+RpC+sIkIq+2FIdvWJIZbyCpV1qVB4M7?=
 =?iso-8859-1?Q?Zsd1afsW6DkzoA++wy5J+hG20QA0GPFZ7JD2FX7UjyYzoFfxz9a8j+MrBC?=
 =?iso-8859-1?Q?XyE5q/sqws6SRFzhkIY+7p+TSVcdejC7kPZ1Li2roFGypzrfIWUu7lVeyq?=
 =?iso-8859-1?Q?Ng5CM6fetMLgwGZpO0oNASbdNe+LnBmemiy7lHLO7OrLBkCzNI27E0QdeR?=
 =?iso-8859-1?Q?JT82HgTh+Mezgb9tlS38kpcHRHiMtGW/5xZ7ep70THEfxTc9/LfKdpu+HW?=
 =?iso-8859-1?Q?zow5wx2u0ccAp4ubOW2HN9xOeSKnCoWhlOJgY5z9mCm/57IJSrIDcJAg3U?=
 =?iso-8859-1?Q?8m7ZY7bOPQkQL4HVZJ+Li7dXxRR7K4cFQJpssaZcbWKT3aj4p0QawLwhxh?=
 =?iso-8859-1?Q?Lo/n8X1SeApG+OgHoaNn0W0WWovrkyU/N/qHCGPeC9qIdiykyr8rV7Ox4K?=
 =?iso-8859-1?Q?LZfE3uFHL69keo9JOcjkrwkafzsD5oRl0WQXxKxrjSxWbe3AivGTE0yC0D?=
 =?iso-8859-1?Q?oXJM9K6PqIOt4+pQjUe8/JgqkmKuAlF+PKxW88YJvWBGEwMVcsPTA7zynO?=
 =?iso-8859-1?Q?K9XjcjgQ5Mtz+GkKDskBMLzmWzVtmc6e5uCSlrtIkMDA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XTkEcE2c/HWTI9d062Wyujo3U/txi1DuNXxpiJprrYFdbE9RRinPeJgxW8?=
 =?iso-8859-1?Q?RMv0NHE7hFEbDaSuCyE/V8Fia1BHxKmjzyENSr1UhsfTXEn/pgK+/xZW4q?=
 =?iso-8859-1?Q?XAIxRTcPK7lkg/QCURrxvUedHW9nCuUrpb+yrhHyVH9orvR+NcBK31WOXk?=
 =?iso-8859-1?Q?zAjWXqZfS9vA6DYm3HkUzTkQ4yMiKa+Z6K8kHQHeU7zb/7rVs9uaMAV6Pi?=
 =?iso-8859-1?Q?Xg0/DH79q3H58oY9ahUVT16GV0AxF/57uMkZ9jsA2csSz1XzcHO3p95cY2?=
 =?iso-8859-1?Q?JBf+wu3VFPVJ/ZDVOp95W/qNJwGPDFKS+Tm2u/FkOuXguHnJf/qz2Evk5u?=
 =?iso-8859-1?Q?HVOFusRD2Qz6sL7bHL+crbHl4HU1yRLhb/szPDnui/z8TnaaE5gRW3MpPj?=
 =?iso-8859-1?Q?8+orWF5wdZUO/qZw3M954qjxeczNG0Uj40PBV98Ug1JzMzzyenvc5sPOh8?=
 =?iso-8859-1?Q?x4DxMIIAb/yGYKwOBrt+OtpdwazHhpRM1TNeD9rnVSyNQACexMn4ojeoB8?=
 =?iso-8859-1?Q?Z88i4HesjoVgp5r/k93CfKcYhmJ8AFAuM+ZGvO13S1eBl5YFvSaeTKqJpn?=
 =?iso-8859-1?Q?2/eiW78lNjNSsC3CUzdOf8aNDORJN1Ja82hrmN0oXrk486KL+HvgfCRIlN?=
 =?iso-8859-1?Q?Wc0tg2whNBCTXgTMpdzzgEGTenMtY/31PGn4uinP/ff6B1jqs7729miR3n?=
 =?iso-8859-1?Q?ESr3LXZIUho1nLPX1/V/DCRbdiG75rgKdUZAuNASV/OVkpEzH1tjnGtj2X?=
 =?iso-8859-1?Q?U8/lWeQG6ZF7Mquz4bOPZfgUm/z1o8ul+NYMPmLfdfluDy5e61Q1bJ/hAH?=
 =?iso-8859-1?Q?HvXnsxKDgxroTVNUu1Y3esjFJpvt/mD5KSWPrAM8s4+D5ntOjIkdaxFDet?=
 =?iso-8859-1?Q?xk5PrJOg79xGdiT+5RzSgF4yfcvl3IMuu9tuQWzfFIEsEIQ9FBJGBdsWar?=
 =?iso-8859-1?Q?Mx682O/A245il3TJWxkCLr4Ro7zS17Zqh3iGRNbaMg7dTYpBRT9jBX9CB3?=
 =?iso-8859-1?Q?mYQPFfiVDYh6KOhZwyh9qv2L/9geTTEKS8Mz5Y6ZMoUjEYQOpPK1FSqM1X?=
 =?iso-8859-1?Q?QnAJBJAbreDG0AqPyKnxU8KmOg+d59dNihLx51IYASrQzG6By/qIfjDDSj?=
 =?iso-8859-1?Q?IsbfydgGA0/EvoaadlozbKlWKmAuzzolss0/cluWg8RicTQaBpRux+4ev+?=
 =?iso-8859-1?Q?bsK2rmoYWCPgPKpfp82Rix/kV0CJz8Ocjcma2YDNd8KLSARzzQdudfnsQ5?=
 =?iso-8859-1?Q?EvzCjtrcOP9nimzGuVPQB7kSerVWgg5Rw4+JSDUkaiNsFJZd5nK9wzesyM?=
 =?iso-8859-1?Q?D4mvTAPn3KQXW+Jls8LF0oRxMra6N5zs5dd1Vgjdp8G8KSwPkyBZ+AV9bV?=
 =?iso-8859-1?Q?5c0h6yA5HFftt9cjR2o0gQJcJ1fGUmwf7pGOVn1MJGi3A3iHBjRq8EQ0zJ?=
 =?iso-8859-1?Q?aUGplfvMUc2ZIalGXztROrbS/jOHhIsU+xZCi/T2WHGADdGz8bnvBVy/WY?=
 =?iso-8859-1?Q?rBMiW/4uz8RfST/KaVKZUU1Pi9YhetaoeWmQt8L2u0xJIx7IcIkaoXcdSC?=
 =?iso-8859-1?Q?GKMEJa9j/mCQP6/Ce6Abv+hK6bwuQPTp1E3ErQ6/+7LSZLpUADX0nnLPCg?=
 =?iso-8859-1?Q?+pA/lhycD4D5bnuP/MzLfIfgnQBze3mBqjtlO7t1fioOmiNMHazZ3dSeYQ?=
 =?iso-8859-1?Q?/BXkv00rjtmLYhZlbjI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0650e2e-65b4-466b-cf35-08ddef88e2b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:08:55.4274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4PaAd6W9p0RpU5tQXZb5jFPmV97j+VF3pwYc2Pgm9GWK3T/9zpZLjBaD9nHjCSY3DjvXSvablzRg3P9Po3Tm2wjYBtYFhV8++5kImWIzsjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7893

Currently, many common functions perform the same operations to calculate
GIC register addresses. This patch consolidates the similar code into
a separate helper function to improve maintainability and reduce duplicatio=
n.
This refactoring also simplifies the implementation of eSPI support in futu=
re
changes.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V8:
- add missing breaks in switch-case (fixing 2 violations of
  MC3A2.R16.3)
- no functional changes: moved the get_addr_by_offset() call in
  gicv3_irq_set_affinity() under appropriate check, as it should not be
  called for local IRQs
- minor: add comments for default cases (fixing 3 violations of
  MC3A2.R16.4)
- minor: evaluate mask to variable in gicv3_peek_irq() (fixing 2
  cautions of MC3A2.R13.2)

Changes in V7:
- no changes

Changes in V6:
- no functional changes, just fixing minor nit: changed u32 to uint32_t
  in get_addr_by_offset()
- added reviewed-by from Oleksandr Tyshchenko

Changes in V5:
- fixed a minor nit: changed %d to %u in the warning message because the
  IRQ number cannot be less than zero
- added acked-by from Julien Grall

Changes in V4:
- no changes

Changes in V3:
- changed panic() in get_addr_by_offset() to printing warning and
  ASSERT_UNREACHABLE()
- added verification of return pointer from get_addr_by_offset() in the
  callers
- moved invocation of get_addr_by_offset() from spinlock guards, since
  it is not necessarry
- added RB from Volodymyr Babchuk

Changes in V2:
- no changes
---
 xen/arch/arm/gic-v3.c          | 126 +++++++++++++++++++++++----------
 xen/arch/arm/include/asm/irq.h |   1 +
 2 files changed, 91 insertions(+), 36 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cd3e1acf79..2fdd96dbb1 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -445,17 +445,72 @@ static void gicv3_dump_state(const struct vcpu *v)
     }
 }
=20
+static void __iomem *get_addr_by_offset(struct irq_desc *irqd, uint32_t of=
fset)
+{
+    switch ( irqd->irq )
+    {
+    case 0 ... (NR_GIC_LOCAL_IRQS - 1):
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD_RDIST_SGI_BASE + offset);
+        case GICD_ICFGR:
+            return (GICD_RDIST_SGI_BASE + GICR_ICFGR1);
+        case GICD_IPRIORITYR:
+            return (GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irqd->irq);
+        default:
+            /* Invalid register offset for local IRQs */
+            break;
+        }
+        break;
+    case NR_GIC_LOCAL_IRQS ... SPI_MAX_INTID:
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD + offset + (irqd->irq / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGR + (irqd->irq / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTER + irqd->irq * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYR + irqd->irq);
+        default:
+            /* Invalid register offset for SPIs */
+            break;
+        }
+        break;
+    default:
+        /* Invalid INTID */
+        break;
+    }
+
+    /* Something went wrong, we shouldn't be able to reach here */
+    printk(XENLOG_WARNING "GICv3: WARNING: Invalid offset 0x%x for IRQ#%u"=
,
+           offset, irqd->irq);
+    ASSERT_UNREACHABLE();
+
+    return NULL;
+}
+
 static void gicv3_poke_irq(struct irq_desc *irqd, u32 offset, bool wait_fo=
r_rwp)
 {
     u32 mask =3D 1U << (irqd->irq % 32);
-    void __iomem *base;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    if ( irqd->irq < NR_GIC_LOCAL_IRQS )
-        base =3D GICD_RDIST_SGI_BASE;
-    else
-        base =3D GICD;
+    if ( addr =3D=3D NULL )
+        return;
=20
-    writel_relaxed(mask, base + offset + (irqd->irq / 32) * 4);
+    writel_relaxed(mask, addr);
=20
     if ( wait_for_rwp )
         gicv3_wait_for_rwp(irqd->irq);
@@ -463,15 +518,13 @@ static void gicv3_poke_irq(struct irq_desc *irqd, u32=
 offset, bool wait_for_rwp)
=20
 static bool gicv3_peek_irq(struct irq_desc *irqd, u32 offset)
 {
-    void __iomem *base;
-    unsigned int irq =3D irqd->irq;
+    uint32_t mask =3D 1U << (irqd->irq % 32);
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + (irq / 32) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE;
+    if ( addr =3D=3D NULL )
+        return false;
=20
-    return !!(readl(base + offset) & (1U << (irq % 32)));
+    return !!(readl(addr) & mask);
 }
=20
 static void gicv3_unmask_irq(struct irq_desc *irqd)
@@ -558,30 +611,28 @@ static inline uint64_t gicv3_mpidr_to_affinity(int cp=
u)
 static void gicv3_set_irq_type(struct irq_desc *desc, unsigned int type)
 {
     uint32_t cfg, actual, edgebit;
-    void __iomem *base;
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr;
=20
     /* SGI's are always edge-triggered not need to call GICD_ICFGR0 */
-    ASSERT(irq >=3D NR_GIC_SGI);
+    ASSERT(desc->irq >=3D NR_GIC_SGI);
=20
-    spin_lock(&gicv3.lock);
+    addr =3D get_addr_by_offset(desc, GICD_ICFGR);
+    if ( addr =3D=3D NULL )
+        return;
=20
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + GICD_ICFGR + (irq / 16) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE + GICR_ICFGR1;
+    spin_lock(&gicv3.lock);
=20
-    cfg =3D readl_relaxed(base);
+    cfg =3D readl_relaxed(addr);
=20
-    edgebit =3D 2u << (2 * (irq % 16));
+    edgebit =3D 2u << (2 * (desc->irq % 16));
     if ( type & IRQ_TYPE_LEVEL_MASK )
         cfg &=3D ~edgebit;
     else if ( type & IRQ_TYPE_EDGE_BOTH )
         cfg |=3D edgebit;
=20
-    writel_relaxed(cfg, base);
+    writel_relaxed(cfg, addr);
=20
-    actual =3D readl_relaxed(base);
+    actual =3D readl_relaxed(addr);
     if ( ( cfg & edgebit ) ^ ( actual & edgebit ) )
     {
         printk(XENLOG_WARNING "GICv3: WARNING: "
@@ -600,16 +651,13 @@ static void gicv3_set_irq_type(struct irq_desc *desc,=
 unsigned int type)
 static void gicv3_set_irq_priority(struct irq_desc *desc,
                                    unsigned int priority)
 {
-    unsigned int irq =3D desc->irq;
-
-    spin_lock(&gicv3.lock);
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IPRIORITYR);
=20
-    /* Set priority */
-    if ( irq < NR_GIC_LOCAL_IRQS )
-        writeb_relaxed(priority, GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + =
irq);
-    else
-        writeb_relaxed(priority, GICD + GICD_IPRIORITYR + irq);
+    if ( addr =3D=3D NULL )
+        return;
=20
+    spin_lock(&gicv3.lock);
+    writeb_relaxed(priority, addr);
     spin_unlock(&gicv3.lock);
 }
=20
@@ -1273,6 +1321,14 @@ static void gicv3_irq_set_affinity(struct irq_desc *=
desc, const cpumask_t *mask)
 {
     unsigned int cpu;
     uint64_t affinity;
+    void __iomem *addr;
+
+    if ( desc->irq < NR_GIC_LOCAL_IRQS )
+        return;
+
+    addr =3D get_addr_by_offset(desc, GICD_IROUTER);
+    if ( addr =3D=3D NULL )
+        return;
=20
     ASSERT(!cpumask_empty(mask));
=20
@@ -1282,9 +1338,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *d=
esc, const cpumask_t *mask)
     affinity =3D gicv3_mpidr_to_affinity(cpu);
     /* Make sure we don't broadcast the interrupt */
     affinity &=3D ~GICD_IROUTER_SPI_MODE_ANY;
-
-    if ( desc->irq >=3D NR_GIC_LOCAL_IRQS )
-        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->i=
rq * 8));
+    writeq_relaxed_non_atomic(affinity, addr);
=20
     spin_unlock(&gicv3.lock);
 }
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index fce7e42a33..5bc6475eb4 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -29,6 +29,7 @@ struct arch_irq_desc {
  */
 #define NR_IRQS		1024
=20
+#define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
--=20
2.34.1

