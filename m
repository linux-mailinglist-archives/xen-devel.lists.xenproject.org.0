Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBA6B423B2
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108407.1458534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoUc-0006Kd-3u; Wed, 03 Sep 2025 14:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108407.1458534; Wed, 03 Sep 2025 14:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoUc-0006HT-03; Wed, 03 Sep 2025 14:29:46 +0000
Received: by outflank-mailman (input) for mailman id 1108407;
 Wed, 03 Sep 2025 14:29:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoUb-0006B7-65
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:29:45 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ee5d9c0-88d2-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 16:29:43 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB8100.eurprd03.prod.outlook.com (2603:10a6:102:223::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 14:29:41 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:29:41 +0000
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
X-Inumbo-ID: 6ee5d9c0-88d2-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYlW1b1q5FynTX2j9DVRmO8F3XB6vurM5iRhtZ/e9nkRTcVu2TzRSJs2eKwmMEbbvOosBJjfh39I2ZTWiDy2IHl+SkkU5c5pQpqA4smx2KvZQ1dYQLkBskX5d/ZBKNGfXKp7KwlmCOd1qfqqOZl/4wMs5NncvlU5nDeKQX1Xnv55zMEb/zjhou582CeIvYm6fXUHg3EUuFk/z1UnsYUq37F4vnjD41Rzt8Dkvr7fflDFlrOIu908+B299/K2qDilZro69c+h5wZnTRv66Rzx/Fb+CT6K7g+6trEyYcFVOkGQBQzaU+nLYfgzyMLRwfIYauhVF6qKgRByHH/ApWIYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hS4UG6WanopHDmgibA/uVOw02shcO9ZrNjrAVUPDPy8=;
 b=DDIEdfNBooJLM3v8LHBgBqN4gFBPP1aC1sgQlh8K7tjGlNEbQ4cfa/NfDcQ7DfQ7XJvU01ybCard2QRPymvgP95dzrxFVBLSQW+/hRzVtiXosUUfdyqC/GJQ3V0xlAUrnUMtaosXP7mibbRpoCj+yNzuUeAYK8dHXMNZpmxdEYPPs+HUEHXq0MfcZ5OWDln4u/uUFPUqJwCV8+L2YdYvT+9GC6fR7Q1d4QAJDiyWUTI2Kd6L2Ttdex4o+Q/9q0v8dOz+2LeJfgP5iWLe9rPOotb5gzPRy2HyPPj/gyyJMEgoNTuqamVfGH1a9ZoWdsEh/tSPw+5ysQ/fcqE6x64iJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hS4UG6WanopHDmgibA/uVOw02shcO9ZrNjrAVUPDPy8=;
 b=dyAUiNtOKXqyqJLLpWig9g3/MQs8ypn3LLo/QjXbQH+N0UEUR7aCrH6dK65C1km32m1SDtAYmAvfB9LjqH4+9tDfZ7/X0p40qZRdKSeAC7IAtnqtKdFK3EltpcXZwFibOndrgqcweJJI908txPAaUJ3keBuDQW5e64kQydSzoAgWyHwH5QTMXQk5u7td6t1PHD2FAgLfNoD8J3T6Yt74xXSQAHOiVbMS3j75zXDsimttKBuEOt8gTv5oZHCfehGo3v3eEvPINP2KP1oORcsSecvKUwxroQHGddtX8vMKRCOonW88Ts5k+MVnLTUaLFhMHa1LXBnTwvxkdhOCiys3DA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: [PATCH v6 01/12] xen/arm: gicv3: refactor obtaining GIC addresses for
 common operations
Thread-Topic: [PATCH v6 01/12] xen/arm: gicv3: refactor obtaining GIC
 addresses for common operations
Thread-Index: AQHcHN8uHGh8g8YI3EaFdLqSjksbgw==
Date: Wed, 3 Sep 2025 14:29:40 +0000
Message-ID:
 <df5b489ab85ddf1ed043fa55522bea27713613fb.1756908472.git.leonid_komarianskyi@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAXPR03MB8100:EE_
x-ms-office365-filtering-correlation-id: ab2fd45a-77b5-41b4-d465-08ddeaf65144
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?c1rWeDZFevKrSE4MQm8sh9TdTQA29gdFo/YTmLA8PwBguoUS1PkfWQCOFE?=
 =?iso-8859-1?Q?kjfdeeKzRhGEjcH5gPh2Y82EGi4YohlzFUW1vzh9Tl/odFKQ+l34oC1sDo?=
 =?iso-8859-1?Q?ccYGuyNHQOK5OUnxQKNFIbP/iW54SRQFSRGQ2Gh7jbHbbx5poTFclU8Jqe?=
 =?iso-8859-1?Q?eJUD0Tv3gdkJlNUF9UdWqCYNPWLOdyvf61v1BexX5tHEJw6Cc3h9+l0VYK?=
 =?iso-8859-1?Q?Z0WDn6C6m4qopdqes8uQuOrb5lYJoStxyUYW/cN97pUEIxtTawTgGOrZ1o?=
 =?iso-8859-1?Q?n5z3V8dLKB5+5t441wQ53sFDGwOpqUBZBk9qo9ecaEqdoUODTj94S2onsY?=
 =?iso-8859-1?Q?SpoktfQUHWRYYvfK5qp17bpWh3kioKY1QgrQVSvKTnoBCnPO1LA/eNmrlE?=
 =?iso-8859-1?Q?s3Xd93BDOKz9N4kt6sB36nWWFzeQnSe+YCyaa8A8DN1A+0YnyidLEdxviI?=
 =?iso-8859-1?Q?1Me3eyMHRNonYmq5pJqbXEMY1oecnCi73iGd6JNRDK+Va9NQzlqki5Q8gk?=
 =?iso-8859-1?Q?FVETg5NTwReMiPtSFVgxYuk5TMppFVjZltIoTY44JhssChiK8UMNgE0/ns?=
 =?iso-8859-1?Q?rFYlVnSoPcE0eAierP+xKHEi6DErGR0Uef/n6hmiD0b4z8YVnoxZvPspFP?=
 =?iso-8859-1?Q?kcyMPQQHblSQg+oJHUyI5Wyk66XfcNb+8Mw/S0H/wO1WtktkILAzuUlHuG?=
 =?iso-8859-1?Q?NiGzO0lKrOwqkJMNOd2nlwWVD0q68e7Aeteo62TefRyuRIxeDNuZP9pZAd?=
 =?iso-8859-1?Q?bls/Hwm4eTcFA160xRfut/P53wKtS2MSl40xBdgbWaIcknNgvrbHdWd+eW?=
 =?iso-8859-1?Q?l8eCV5WUDz/5AVB+21CgzPMLRX+9zZE9Zb+ntWRC0xDOvPct6dY9wwSouc?=
 =?iso-8859-1?Q?MVWX/if8CWp2jxLH95fU1KI3bEZkprYiR7Lwv2CnAnIt6QUEcY0ET+VVaj?=
 =?iso-8859-1?Q?fqOmviSa9scvq3Ptq0rU8LWiucG12og9peXa7KJ06tX799BKiKfc98jZ1j?=
 =?iso-8859-1?Q?MIXWAkeyDQc0xc7MXSjUFrTB9IbOv5pIE3ysbtfTOO9AOGBmzDu1GpBf6i?=
 =?iso-8859-1?Q?8DDOU5I++mBqHVzCdCXe9b2652XEoHhnWU0pZ4Y06Ebl41cQca83XNfss3?=
 =?iso-8859-1?Q?8X1yfhv4M4UO6KrK3K1xcfVCsuuewzbWyN6v1bRlEQ55vLCGVGIx6ceLgT?=
 =?iso-8859-1?Q?6Nu40Z8GEp2O+mNNVnKNiZiC0EkgVKFLoKXRe8URhwKcnpHLTPpIRq3kmp?=
 =?iso-8859-1?Q?Pq6Hku1wOU/nrt9xv5j9IohEJBFwwPSyQlqPWTcPy5q9DDNhpYhrX2XVqf?=
 =?iso-8859-1?Q?J1un/XkDqdz97xPiEiWYO6p6M2sdIr2L9zKcomDI01SSwVAgSAPEpJ5xDi?=
 =?iso-8859-1?Q?tVBj/biFxfv3FcNsMmyWAh4ui/kc/xgD+qtJIi4iLWmf6mW/2RMfPspohX?=
 =?iso-8859-1?Q?43uvkUwgvY7rvDXuAyUz6UGLSrFMe+bGR+yCGgigKcU0/jEbV+BJ+7IzlO?=
 =?iso-8859-1?Q?9jHhoXtgbKx5osi7PDkI5d/fMwi3ajMxPnbPZd9hMXdQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9ImoXJ2piG7NGAefgWOuQNFoxflMAnp/kLf+iMK1i8UKNLcFGlsU001tlV?=
 =?iso-8859-1?Q?HKsJ2LFiUVmdtxqcPBg6PePG4KTT3yi9lb5Uz3NTudVZxVmx3T0fQaJLN2?=
 =?iso-8859-1?Q?oyQH9EZt0aisACjvAsWZ/Ez8Z+ZvZr1pjDqGiEE09F2Fsn5Uh6GodS4oSL?=
 =?iso-8859-1?Q?Nx7QOIhXl6QNII1fRz8bueUZD/A830juiqawCYBr+gLqhdITpnP0MClb/a?=
 =?iso-8859-1?Q?jIjrWYfm+34oEw1i0/4PI+NCIm61J2VbshC7yqBGbH5bVM1GxUa7bGQgrB?=
 =?iso-8859-1?Q?4uzL8iJVAPFK9/3RxGZGl3LPuUAgCU33RJkjJedNbNM6htPUP+6GQXrB5k?=
 =?iso-8859-1?Q?tNa0jtAzC8L+jBAFRTXNY7EvnHWK90iQEj8exrSW/fhuv9ypIfUM2PqUQI?=
 =?iso-8859-1?Q?gRPW6Te7HlxxLGjEqk6zPYKzW/Gk9mOahJT3oDJSy4IVP33HZj7Ogfnoc8?=
 =?iso-8859-1?Q?RQ8wAWCADA7CR+v2GNpAum8tYKYyOyNNGds3OlAnWw7KHhuuM0nfdV9WiE?=
 =?iso-8859-1?Q?7M1PE4oTGM6jSXnJhwD9JBlp0WGNB23j9iUoTHgR2cEydSXid9Ca9Wihsl?=
 =?iso-8859-1?Q?Q6rqbNq2l/FKFJIbQcDZpLwu4BQh6IjR5B6zZJn2QPLdvShTDDLwSowNcy?=
 =?iso-8859-1?Q?zgYq/Zexvbmy9e1tKcX0LVmvdPpT2uwce3yfIin33wHmqPyYw8I2g9BVHt?=
 =?iso-8859-1?Q?B7Tv9hw2nmFPin14fBOtKUB09IHKCD2y6woSgliYfUEUHPz4ULP3sHbKHx?=
 =?iso-8859-1?Q?XuPSW11pLa/8VcxqVHWoQehJenQlONGEgxx+Y84gXaM2MlZ/+Ly+6Q+RxE?=
 =?iso-8859-1?Q?SSS1XdNLx6T2ua0XjsVFkjnkwrS8+wmxNIx9LgBK2yQAMBRjNKPchxGCX5?=
 =?iso-8859-1?Q?kkKPkGVuMiq/SIjFfLwlJzzIQ8rLIW1k+HhXW2HszeNCXnuJXvctcE3IdE?=
 =?iso-8859-1?Q?0sTAvom8iA6G7PCH3N19p47V866Aqnm1dj6U0Y8ReVR6qPkjj4xD24MB29?=
 =?iso-8859-1?Q?fh9+2Pggm0U+bSuwJFFJ3qD85Ia9X7tTN+qvYMj07kfCT7d3Qgm3KM5fM3?=
 =?iso-8859-1?Q?51K+R8u8630cfc4S7PJ0S2D1v57sE/g0GUfCbSP377y6MELxyCffEOH0sd?=
 =?iso-8859-1?Q?cqxO6VOvJpOI4quMf4Z7kfJBl0ioQSep+OmEoSCKMEwa6xhI1WCJuTu+Cr?=
 =?iso-8859-1?Q?t5V7JsrALhFyTOuz/p74gVyZP2v+6bnAFg7dfll/ZMkwEfN7ySOGvRBq42?=
 =?iso-8859-1?Q?1uzwMxZlBH+mJoqI7ZDrVmY4/hO5SNqcvt5miKZ7vjje8oqoWTh78YRTQp?=
 =?iso-8859-1?Q?ZQY1AgLzMnku8elbRHGcKD3o9tEOfZzGO+FlCFixBTKcQc60ARz76HlMiU?=
 =?iso-8859-1?Q?cJcYgG9mP3B1imspT8OREr2HgdIIHbfd+4RYawhydwqGIE7QliF5c+23zr?=
 =?iso-8859-1?Q?9H5mztQlkRtBDO81WHQrFlGk5UuGJJJ52IoY57uY+9Yp8Agn5CjQWnkrZq?=
 =?iso-8859-1?Q?HSPIbzHLktoyckdqH+LBrpegLxwewkzNGOLo+ZETfZDv7aU66DuSytFdyv?=
 =?iso-8859-1?Q?SCneGCSpz6E571lte4pJeXMJLyIMrkcwOfIfymh9scjhHebCJQyzy4mtNm?=
 =?iso-8859-1?Q?PJZqwJVWIbqKiVKpSnQN15HJjIAuO5CYg2uReGE0H73gJ30wvyW62NaSko?=
 =?iso-8859-1?Q?K7ghHxzbftXYVhFSK2k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2fd45a-77b5-41b4-d465-08ddeaf65144
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:29:40.2731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vrbi2t/psNxFATlPrriVIjXVFb1bV+LDsoRCfsKKXOYvPDIl8x3QWKa7KO+sU69LrfJMArhmQ3KvIVO8OSR3dZ62q4LpC09W4PVhJtgR7Po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8100

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
 xen/arch/arm/gic-v3.c          | 114 +++++++++++++++++++++++----------
 xen/arch/arm/include/asm/irq.h |   1 +
 2 files changed, 81 insertions(+), 34 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cd3e1acf79..a1e302fea2 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -445,17 +445,67 @@ static void gicv3_dump_state(const struct vcpu *v)
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
+            break;
+        }
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
+            break;
+        }
+    default:
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
@@ -463,15 +513,12 @@ static void gicv3_poke_irq(struct irq_desc *irqd, u32=
 offset, bool wait_for_rwp)
=20
 static bool gicv3_peek_irq(struct irq_desc *irqd, u32 offset)
 {
-    void __iomem *base;
-    unsigned int irq =3D irqd->irq;
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
+    return !!(readl(addr) & (1U << (irqd->irq % 32)));
 }
=20
 static void gicv3_unmask_irq(struct irq_desc *irqd)
@@ -558,30 +605,28 @@ static inline uint64_t gicv3_mpidr_to_affinity(int cp=
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
@@ -600,16 +645,13 @@ static void gicv3_set_irq_type(struct irq_desc *desc,=
 unsigned int type)
 static void gicv3_set_irq_priority(struct irq_desc *desc,
                                    unsigned int priority)
 {
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IPRIORITYR);
=20
-    spin_lock(&gicv3.lock);
-
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
@@ -1273,6 +1315,10 @@ static void gicv3_irq_set_affinity(struct irq_desc *=
desc, const cpumask_t *mask)
 {
     unsigned int cpu;
     uint64_t affinity;
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IROUTER);
+
+    if ( addr =3D=3D NULL )
+        return;
=20
     ASSERT(!cpumask_empty(mask));
=20
@@ -1284,7 +1330,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *d=
esc, const cpumask_t *mask)
     affinity &=3D ~GICD_IROUTER_SPI_MODE_ANY;
=20
     if ( desc->irq >=3D NR_GIC_LOCAL_IRQS )
-        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->i=
rq * 8));
+        writeq_relaxed_non_atomic(affinity, addr);
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

