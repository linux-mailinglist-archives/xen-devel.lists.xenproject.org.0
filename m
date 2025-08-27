Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08517B38981
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096737.1451410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKov-0001Px-KV; Wed, 27 Aug 2025 18:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096737.1451410; Wed, 27 Aug 2025 18:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKov-0001LE-EY; Wed, 27 Aug 2025 18:24:29 +0000
Received: by outflank-mailman (input) for mailman id 1096737;
 Wed, 27 Aug 2025 18:24:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKot-0006ki-AL
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:24:27 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e92b5f7-8373-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 20:24:23 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:24:21 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:24:21 +0000
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
X-Inumbo-ID: 0e92b5f7-8373-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snvsoNxT9MIm7DktgNbN2T7m53F+99+smHpVAx22NRB/eMM5D+OxOeKnu1gIS1D2JcViBOOHhzXn1UFyGYbAT2yZMK4FWcRaO1DI/4ulHXTKSmXK0scIpA5MMliImDb7bo8IMnxWxpiaaxRJEEA7fnJLSs1ilhRyGGikJm+NhnGHK0DWVduACIoQuoTy+vowoli7G7e9BW7Lz2u9SR2riC5RUA3NWRLWzxtONuK03I+nVrhzv6ZFRZ2CgP+uhsGpqrzYf3mrMej9i9xaYix1F8xkKr2WNEgYGxl2FN1xzBMlw4od4v7ZIbWxR0CN01WsJRukvprb6VyV31Ruq+af7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PQ9mtfgp+ElDWfvJmhV5S2DGgOIPnn7uteqiPRvflg=;
 b=WfZxLp+yyNYzk4W9eFjd8fNEKs1bOn/2w/gnI5L01vEIk35AXWUgJWiyP8nTqD1BCYYWfSnZgBsP9SD7SIHifj9uP0uBKbpIpWBQpO+zCiy1lCoADq3b3oQXMsJrOB0l9w4cKaSjo5VhlgCkVEKNHnQTDoQ2lieOIFhXJC7OVOArncc5lI0FOoHoIXq1vmL0ouOilDJr8kbXEJfVCoXg8whAKY90CtuebDkWOpE0OHla0GTp2tZJMD0wMqVjUSjyAMzQfivof8FTvcEG3YCQpzrSq/jTrgK6rOVTI9LO2/kVuxuPjFGKh9CG/jlPW2G1pGjCQHTFaRCgSW9nST609w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PQ9mtfgp+ElDWfvJmhV5S2DGgOIPnn7uteqiPRvflg=;
 b=BqQCLEU9dDROJ+HsOdUH+Wb5Sq8QYTo2ATchpn9pZNvGX4C67PvnYbJqD59eeyZK+Mlu3KNcBKJqXF2qftJKSWpbd4RTSXWfssO6n9sy/dqlw2HTqzNPC0B0VKjuKrg+r/gsZ+mJ3nZWxHkcQh2c/uNs9IRddC5ZLRPaJRLcVMOQhil9QUakDTPaj0CsUgV++ozq47huy23VcOAg+zPD5CGu8xI0t4MTPJGLEFhqczM858R/ceJH3eMIDe85U9jb2+irSDbASG4f1ulS3McwBy+DbrdRWjK6bRaVLjVN6EVP019lcq3R9bYHbYnhAWR74L8F/vc6gDYJ9Jn149KB9Q==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 09/12] xen/arm: domain_build/dom0less-build: adjust domains
 config to support eSPIs
Thread-Topic: [PATCH v4 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Thread-Index: AQHcF3/Ont2iCNudZU+HGYrvI6u3EQ==
Date: Wed, 27 Aug 2025 18:24:21 +0000
Message-ID:
 <66b39c4ba25e7a19beeca62ab23f5d3ab3cbae52.1756317702.git.leonid_komarianskyi@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756317702.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|MRWPR03MB11023:EE_
x-ms-office365-filtering-correlation-id: 83ebfd62-94de-4179-525c-08dde596f14a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NsOc4OUFHt+hNoHBbci4vygN09oStk8yXzV12UAZ6rco90Gm9X/wmmO9PG?=
 =?iso-8859-1?Q?CJNUnBKE1NP5pQsFFPHSFQY8nxjMw4urc/6tJnK6+gQ9mrqLGzHSIg3/Ss?=
 =?iso-8859-1?Q?/oLSmGLW4NfrnP6gfu/5Bh4RHgVvLNZReyJqJ+1XvDadASuXUtf24MSQiO?=
 =?iso-8859-1?Q?uzlA/7vcg9YQH+g0vMzQSLydvATFPQ0OIdmLLGjW9ujJEHxiNw+B7N+J+5?=
 =?iso-8859-1?Q?DvQcZU/TozkGnCSz+gurRVT08FdFYvPc1xA7LPbbJ1G8P4ML89GS/HYm3f?=
 =?iso-8859-1?Q?GV0jHBPWHBM5iEtxJ615XihrlWAGU9/0oaDCCaBSeIcF1JwzCERlIT55xV?=
 =?iso-8859-1?Q?03d4qWTUlyz6kp8tY1M8XRnS3e8M0xv2Xpf/m8CVBmADRoNEtrknO4HkOp?=
 =?iso-8859-1?Q?4q2OSDDZpCR1m926IMSmmtRpiqev5tSe6o1q62F62MeCb/E4zZV5AA6LpZ?=
 =?iso-8859-1?Q?UI/TV1XeDC830r2JufJ31jEFPcjhAGv7UWALB6zd5X8I12X2MBC19n7vMm?=
 =?iso-8859-1?Q?4weM1vcspiLG4HE44GhatccnoK904OT38/r5TZ8ZTys91i/6IbdlM+s0R4?=
 =?iso-8859-1?Q?wHlqcwddajsHru5KND4j7ml4UG2Lr+NgHgE0qdFFkFuTvcX4E/H8hhFbvc?=
 =?iso-8859-1?Q?zxopdlbvkCqhiVZbCOz+EKRvuVaNdcUq8lFoHDCFJi5/qT7szQkbdIX52l?=
 =?iso-8859-1?Q?d8LnecKfqF+a/vp0LxegS4s7Xv5ijdvzLAG33NZ37qlPa05akWCoZKE829?=
 =?iso-8859-1?Q?o7jGjpjmy4zxMI2vU1u8G+z1GAB79HNjquP08GADnOK+LJbr3V9gRPorNJ?=
 =?iso-8859-1?Q?OR+g/EtLPL6Z31G8QoHaJl5ICqUVOOBCfbZsP+1ONbc08nuheea0kEF6jr?=
 =?iso-8859-1?Q?U476Vy+HZkp3kCGUa/A5AyaOCbRqhswJt8fqAMosJgwbD5jRJvBxy13I/V?=
 =?iso-8859-1?Q?p4aJ6aZewCxk1KKJi6bv5Yr8OXzGIer4dQIz1/AgdNv4ykZBkyW3Hw6jYp?=
 =?iso-8859-1?Q?+MkTiUpt3R6LxdkNeC1fPB5w47oJ9+EIZcxtMHC1sYCSTNGrVrsB9xLgUL?=
 =?iso-8859-1?Q?5zhixB0yXepHbdQqrQh+JQYoCjQRGR/HJd2NujNuTos3+xBHCVO79yBJqM?=
 =?iso-8859-1?Q?ppAGXNr930MPhXaweUGGix4AYGg0alLMWBIX7jdIUYI9gLo9EcBnhSSSLd?=
 =?iso-8859-1?Q?QpB3J5t2fEDZ7dKpq6GwYI8a0yEBnqc9hE9qFFZD//tvjwvLN1men568FS?=
 =?iso-8859-1?Q?hiWwdFXpNRQi45NfvCqypMbZ4koOwG0s13Ii2hNu7RKNFmjADU9ugVr60+?=
 =?iso-8859-1?Q?29kjTac8eqpdG4bN8w14Za5L8eI5hCLik4WFZNQFKvgllkKxkMobqfQZU4?=
 =?iso-8859-1?Q?7VkdmQKDyOYtRdyKzjWJqY+aUpj7eZ6K3WfFBwDdCSfoB+XsIYlcxLvW7/?=
 =?iso-8859-1?Q?W6hkFsPPqVoqUcZK6Y0i2GewK9Q2Rk9l/3XWen0I3ZcdgSzdkqe1qAovQt?=
 =?iso-8859-1?Q?LWrY/2+NZwW9D+3J1jtKlSeePBK1pUl5WLl2HjyYwIsA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bllhr1EbVqTKBG6hHoJ1gch3tvL1ZlpgVqQSqkzc5mKwnGJ2GsWFqWo6FI?=
 =?iso-8859-1?Q?lPqTwPayg2QIV0qrawgarcnLk2OQCSGTPA4HEgSyA4itcaB/qFddon4l6d?=
 =?iso-8859-1?Q?7FTXkfU9/HGWzWIE/Vb76AbX1n7M+jptWe+EzpHmo8c8aY6IcVlDLUBNsL?=
 =?iso-8859-1?Q?GgGIGknIp+WYPL3tw8qH2frfOOvjoiIXQ1H1ND10sGxiohlKOv/zxGLR0t?=
 =?iso-8859-1?Q?JOB/hm6tlVObSzCXJEMakpFCNuYlKLmcwVujiWYdpd2a3zsAU/qDK+E2yc?=
 =?iso-8859-1?Q?6AW0hQ1hOCYK9zq+1XioHoOEImORdKJxIIsjYfsWXJVvVuxz7ICxIq/j2u?=
 =?iso-8859-1?Q?LSPe7H5935L3Atb9LLsVhk+UNzONduLKJsJLXR7wDsl8SzbtvbsEFz+EH9?=
 =?iso-8859-1?Q?PQbJ5S8XH3tpX7IvkDbiiI3JwjFUe0bL+iLNY3hnQJfRVcmgH5eS3nOVz8?=
 =?iso-8859-1?Q?+bmU9oUWlAwLM54ojVLdTQ8P4fuh6drsSjKyOFLDvLGKKZ1Em24ojnERMS?=
 =?iso-8859-1?Q?vGLIMdJQNC4dRQriEo9eRdYHrVwEez74cP6iJR2fD9czbFMM2Vs7RxOfAA?=
 =?iso-8859-1?Q?diaKz3vj4t0k/QblQ1FNB6EoxiNqaDZ2Kp4wZAawjmuz+3HGvKD9RbK+NU?=
 =?iso-8859-1?Q?aqtgNpE1QYKLD4JwNKqkzaM/aTDlX4AIvumi50oJwPYRCU474WhfvUXlLm?=
 =?iso-8859-1?Q?oAUPV2yLbclrnU11ams3eEnGAHelGcoXtFfS+U1i8BWozaCLjZKnYvJ+wV?=
 =?iso-8859-1?Q?TlSJpcpNtseI8wIl9w/WG+SNEifDHhHGcuvUrW28e1c7nSQz2HXczEwxFl?=
 =?iso-8859-1?Q?Dqj0J/c/zvKyqoa6fxTFWRc6xk1oXCRJz0DgpTdQfrpvpcHoS3PihFncxe?=
 =?iso-8859-1?Q?EovmXXTtmh5FMos53QPaf1afpyzo0g/0uGPepTpGq7ksR1Tes9/PRJ8jlQ?=
 =?iso-8859-1?Q?pCmVti9GSS2iPVaj5SO6MJfhcGSz2rl2s+cbpw92WOWHxMq15LP4/Xmfz1?=
 =?iso-8859-1?Q?ee+RbcFQIpQpjaAoLaEl6FrSxlBzTShhTY+jCEa+Sv9uaoc42RNokj7Kan?=
 =?iso-8859-1?Q?rIDwInHcZIb6Z9k6mG45GeDf/gGI3wJIO30LoSKf3JYhmZh88Mp1YLUgY+?=
 =?iso-8859-1?Q?0M5izG6jrobz4vdI6+ThcPBZxUJpldPSpJlvfsPaA83fk8Uj+nvMvcmjhy?=
 =?iso-8859-1?Q?Yvc8eHBNklkpjp38rYGXEUT4t1R9z98+CP0aZ9bh9Y0ve0FfzFFXCNbYPI?=
 =?iso-8859-1?Q?C8BQD/vNAy30MH00CBvsyqYHUKpEiZLyn1jwrm7unmuH2q11NLwginpA8m?=
 =?iso-8859-1?Q?fREsSadhA1/d3fN1W5BG7Gjks8eHbd95t3RA2gMB1cN0rIE8q1MZAE79x6?=
 =?iso-8859-1?Q?o9FH+D7Cb8rDMMI3PssN2kIbMHz8VTM4FNdaiD/MEYUMgmtImbb1BaNrCM?=
 =?iso-8859-1?Q?VuAjjr+zbkNQ2PRRa1wvOfsofVHb4oDLTfRxUXhYJcgbPoUdzVT/1EEQAm?=
 =?iso-8859-1?Q?rxHOUwlXnE3l5a/ybeCqeiPd5sJrCMggB7M86IfnolShuecfrfj8HGPc9T?=
 =?iso-8859-1?Q?UaT7754Gqrs3OoWb0Z0tPdU2D9r3RqHjY35EGUtUASuKpOx8c9GET2feCx?=
 =?iso-8859-1?Q?ah3RQOFAN+Tqzbb/xBqCOt5sxGTtf5lsXQFcxY9fyUyYrSaGm2XG/uQBiU?=
 =?iso-8859-1?Q?HlRsUdb5XLiAewZQnW0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ebfd62-94de-4179-525c-08dde596f14a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:24:21.2003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ayW9qOpsl1JpFhNkLEwSyhBDtDF2gMvfIUM34GCnbghLlPDxcJjAv+hzUuhafYTmA7FiEq376zHBXFRIWby5BmZvB1QJujSPMQUw5gwJPbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

The Dom0 and DomUs logic for the dom0less configuration in create_dom0() an=
d
arch_create_domUs() has been updated to account for extended SPIs when
supported by the hardware and enabled with CONFIG_GICV3_ESPI. These changes
ensure the proper calculation of the maximum number of SPIs and eSPIs avail=
able
to Dom0 and DomUs in dom0less setups.

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

---
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
 xen/arch/arm/include/asm/vgic.h | 21 +++++++++++++++++++++
 3 files changed, 23 insertions(+), 2 deletions(-)

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
index fb4cea73eb..11f9d216eb 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -355,6 +355,27 @@ extern void vgic_check_inflight_irqs_pending(struct vc=
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
+     * returns the maximum eSPI INTID, supported by HW GIC, subtracted by =
32.
+     * For non-Dom0 domains, the toolstack or arch_create_domUs function
+     * applies the same adjustment to cover local IRQs (please, see commen=
t
+     * for macro that is used for regular SPIs - VGIC_DEF_NR_SPIS). We wil=
l
+     * add back this value during VGIC initialization. This ensures consis=
tent
+     * handling for Dom0 and other domains. For the regular SPI range inte=
rrupts
+     * in this case, the maximum value of VGIC_DEF_NR_SPIS will be used.
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

