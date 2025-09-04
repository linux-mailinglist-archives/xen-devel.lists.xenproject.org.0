Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A25AB446DA
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110713.1459744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG92-0005Oo-BI; Thu, 04 Sep 2025 20:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110713.1459744; Thu, 04 Sep 2025 20:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG92-0005Mp-6w; Thu, 04 Sep 2025 20:01:20 +0000
Received: by outflank-mailman (input) for mailman id 1110713;
 Thu, 04 Sep 2025 20:01:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG91-0005Me-1e
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:01:19 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4489068-89c9-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 22:01:06 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:00 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:00 +0000
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
X-Inumbo-ID: e4489068-89c9-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxcRTPh4NcfH5j4Pv9Oz3mVcgyoYgcm4/clJkvctYdzkPUdbABhn7vsLlRfpS9SbqjwBhKfChvQSRRXH7cOp55vYIBKS+aYVg3gsSvT9v7ulPaCvhL230+lX0/3A7iIQpdzK54WeuTo0yQpUxPfDVvcgTe9qny7Ug2Hhm5xSLzRjBtEuXL//ySJJsgZcn0Imn6wYTiY/cO9SD+i4N4BHhP+5n7Yuz39aXMINgVVqtq0fhT7s4PLnu5RYkenPNhK7N8mQpdBQYCcALqBDq4cWFqfmZpwpgG+RuOi5dkLnBrkc5RyW0kZrTPDml+ZAvXXJUAbd2kCAE7WqY4hO1WYGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks6Jq/KdQ5OiANovjTsiVIvn5MnPmzaxPuXYEs8DDK8=;
 b=S5uPz9sjLzYgPIoUsH9oMxhmJ+DGAw7iBlP46AaFWJy1h7+hkyIV5EdkDlVhy/n4jCQfaSFzZlMaI7Yf70fQdYnfOP8F/0qdCL+d8+HrPlmfl5K26uD/idOuirMbD2xMqWjsiTwfpG7Rwu47SLsZ553wzak0jW5xy9+qv3FTwm4vHKOJfPhzbdoe1+p+hNwB9WeXN9cwNhngBFOPJJ0rPLXE58wTiQlXrEOZwrsY3a5hdZDOcVhDQ3Wq6XjP4fG9jsKl4k4LionpOJsRhLoH1MOhJl0dHn6VoiCjCuiSwt4zwGuoA2iJIS98NVU27ul9umR/DExxWUco4c42B1m12w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ks6Jq/KdQ5OiANovjTsiVIvn5MnPmzaxPuXYEs8DDK8=;
 b=B7lUDFE9SvwrPL92x1aDo+6pZiftueYBnH0nQ7cDV36R0jaVLeWXT3kx3mqTXks7DNVOnGR38cZT7kmF2UFYGQNWVpqT11nOOCQr9NziqNlLdKLo3BmVC6Jr7ejAgflo+RspylAUSgZ4HEj480+bqQoUN5Hxd/HYxIwXQCYqYrsDz+QHSDGdEtp+RkXi9F73HmlH/R//G20biwFc2jdvraHgVJTRht7Cym++fFSh4dNLMtFmtjzvTS9i8w3spcbRewh+atjVsFAToZPCj6aHM936MxGqZOXMUxgVK4dM90rQ9/f4O69iAvqhEL2PM4Xbfr9adKvUnLsVBcpyGRZ8UA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v7 00/12] Introduce eSPI support
Thread-Topic: [PATCH v7 00/12] Introduce eSPI support
Thread-Index: AQHcHdai+Ac/NEuVikikoMKerzFsQg==
Date: Thu, 4 Sep 2025 20:00:59 +0000
Message-ID: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10974:EE_
x-ms-office365-filtering-correlation-id: fe3b533d-3f24-4d36-0576-08ddebedc4f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?dBjiSc3ZXgvpIGwWr1c+simAWHzZJazpE6J49hcLETAWvxbofjtyD6ozER?=
 =?iso-8859-1?Q?mJ7PMxWw2roywT0XZAnPwxfamt3cSwyze9MPrPNe5mt2vXTbVN6tVmJNNZ?=
 =?iso-8859-1?Q?OkKeXYjq3K5SS5rnzQR9wB8lV0dcixR29yp/Lq26Ekpk+rl1O/0qgrLX3O?=
 =?iso-8859-1?Q?vFth9Cm9I9HnekIy511M1CCCcQw1UDuoKy1RYLpOPtEz7P0UehWZkMGeSb?=
 =?iso-8859-1?Q?8FCVoKWWdeC61ZvJydwfVbGO5qe+lwtBpXYfM6vfB6fXgYeCn5Nj7nP3SF?=
 =?iso-8859-1?Q?AfLLdx58Ob4s37ZNoUmVzJFMg2m64h2HAexGdRhqp3FU7BhuLSNXOqA8zE?=
 =?iso-8859-1?Q?peQE1lJvlXUOkT4HTJpOukjLLlV2xanoiorLWcX/Dq3PItPkLPgz3AS38g?=
 =?iso-8859-1?Q?Wro8APcFlkYYDUhWVvigbKxRI5HDoOGdDrkSdEZaL/Dd+UzGEtGRhdM3KT?=
 =?iso-8859-1?Q?wekbmLdVLX5yIWpg8/QMMuAiE6cZnUZH0gmGZYippx/LZdtsVrWxXvGVa7?=
 =?iso-8859-1?Q?2gQUx+lZ96WAav2+BBpE334hK3Xhtmy3Mja3cD6FG2/vzVgXNCePjpvWdx?=
 =?iso-8859-1?Q?m/1BTzNHLItgPsd0YwT7/p9aHf67fIiWx0jxZdyQBqaVhQcQdg/B+8cORb?=
 =?iso-8859-1?Q?4Iyym8FXFM7+KgMpGNFapNJVIXIykOVJJ8cnbxDrrwl1iBjhB7AfZ0cjD4?=
 =?iso-8859-1?Q?2MXaIWkaSpf3vSRP7H/iOCB6GRm1JgktpR7iJmtji9t3li/OPKfbX1bSDO?=
 =?iso-8859-1?Q?3yRrvrecGmQXhywJDcuVZZ9fu/0Ny4RYjNN/pbPx2N7WMdWw9Z9VvkwL10?=
 =?iso-8859-1?Q?gLs4B1EoXo3Jl36LhdAE1joTy2i0UclDpBAxmPx7D7Zt7UhGXdsAiF64KF?=
 =?iso-8859-1?Q?mSv5eUSr7qqOTaAw7qhMGW9hleYe1DA6HeS0udn+VObiGTkoXH7/u55nf3?=
 =?iso-8859-1?Q?sAfpaCwgs+ISfEH5Ch8+rKw/YuSjuWnTa62BGhs/gPeEkrTywwyMCjrsFp?=
 =?iso-8859-1?Q?WshHTjWPTYFzPlAad6gjTemOe6JrACo/KwNisAvASL/J5re276l3Eojz9/?=
 =?iso-8859-1?Q?NInd/qTUMKkc25Mbj4dkEkvkj02GKZg7TvB9d6WRoPyoIeMI4rWx63SjUE?=
 =?iso-8859-1?Q?AkZJvJWlA1maAcGQkharsx6IJK5l2+UZOmjvfSshgh8yG5WdBmtcUds1w+?=
 =?iso-8859-1?Q?Qm2He4pkirWqw7ACkrr12jyRPDK6t5+slPc/o7xnNtHGDSbbs/4u2FGRtB?=
 =?iso-8859-1?Q?1PBGdIThDPtPhGha3JH3J/iEH0Hev6zFezgkiTKZeYl2tMCXXKj7RWkQ6F?=
 =?iso-8859-1?Q?v88hW3Nhkuth/wpR6wuNEhgPO4U106AmNO1myaC3wUYACN5rcZiMF46P6l?=
 =?iso-8859-1?Q?g1ZxdKqugEeEhv8Ii0yjYO6lqut7rtugM7uNOuvoh0p8H7broUpdT/RHtA?=
 =?iso-8859-1?Q?P8Ph0/cql7rfFn0e/pdL+hLZs9W/XlnU5nBJit9lTDh4n9xykkwd6Wu3fI?=
 =?iso-8859-1?Q?s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iejzS9NBNa4YkmD2WcrMDbJEi7Y+C6giWG9l3nQmL5oTDRhlvWB8rigMCq?=
 =?iso-8859-1?Q?YqLwPNduuc28+8d74sOSOXR7plkTjcpVFaOmOTe3wjGIJzEuAKlQ2vRAA0?=
 =?iso-8859-1?Q?gFN+nW1WWm9Exy4n3FLUAYmhvBuV+WO4VwHoMikW9qicTwbbH3SPHaLu8N?=
 =?iso-8859-1?Q?mJJuCOGMznWuKWcY0FR8RUOeGjjQ1rV84vm8rk4RHv56cq/zGJ0kY2R5B8?=
 =?iso-8859-1?Q?3PQJkjWbLx4QqLAFqYn/nhUEZvtCDVWoFWYCj/adw9rP7SroYV36tIhq/u?=
 =?iso-8859-1?Q?DQdTn4Uz5x1kwNE+14cBoY6KelaG8qbiGV1k5XS5BsSdbWFIKWV3TAgH5c?=
 =?iso-8859-1?Q?qO7paEvNujCe5Xyjba+ntgI3vARf/3KLQkCtp2uEDlfNKRoko3fHmLhbO0?=
 =?iso-8859-1?Q?XAA0QeOPdtAXNTkuUjmBePBGPbb6BagDPPOZ4SRevcN9Cqnuuj6W1GNVOT?=
 =?iso-8859-1?Q?jr94E6MsA+SEtqTc+6B9PQGvseHeP8NLHZ3DcTpGbDTFBFHVPxhjGtc/yj?=
 =?iso-8859-1?Q?frQHQJEK/f4pnR28RjVQm3F7TxU+TStKmZc7s2jVzg3gA6nio+b6/VTjDs?=
 =?iso-8859-1?Q?M+A/TSQFr9j76uvN11A8g24hL4sx0FU689s0mKirFMZtmTXgHUcSD89UM3?=
 =?iso-8859-1?Q?JLFKcMqaAQp0FwOc4wprkdIK1pMvp+x2xnkDOlWdUORDg3zJZOuZRiIFmN?=
 =?iso-8859-1?Q?nA8+j/JJInVekkHHXyJTh/K+U0dvGlTU9Dl8fiTXwBKJbxi1smNKUUUjmI?=
 =?iso-8859-1?Q?4654l4XmAAr+t/GYPYJYXKdie5qG0g7x7YGrveeq6kRv39SQGSkjKLPReI?=
 =?iso-8859-1?Q?DsFnOH6KGuhaagF8tOShZSlbtRC+fJ3yqUX7pmllfxjvNGWYMOm+DAGSgc?=
 =?iso-8859-1?Q?xyChOrTdiQrljmC6428iGqsKB704XCQA/P4WBfHAsv52wNTNSdTS4rz/yJ?=
 =?iso-8859-1?Q?IuWM9mufAFx7t17aWyhrqZf2MpsZtW5N5K79Mf9Fx/gpGwaZdGd3P+556M?=
 =?iso-8859-1?Q?e2P5+RSaHcLg2zWvAxHhJF+3vfOR6BOov4LfyHgQWgg2fknE7zAxFZ+zVV?=
 =?iso-8859-1?Q?MWPglFads083f7wFpaOa3rVyl/D6gXBjBvadjg2u3QZ4sh7KjJp8X5+euO?=
 =?iso-8859-1?Q?lsRSQbc58x57LUdtyNYR1Y9ipy3LbhTMHwKlH8lxjdiD7gUlN59grR+Q4n?=
 =?iso-8859-1?Q?HTTMTZjD7skNO2ooKWcoBTk800eYI4VqK4BBx3TqGzupjfzkUZPjBstMNA?=
 =?iso-8859-1?Q?nyEolZeMEGa55yhfLZ3VrZB6rmDMrs+8F1XOW6aWO9yWjgOgaHJWvbVVzA?=
 =?iso-8859-1?Q?JZsyIOlRL398J/SvxTVuFIXxCGDUwTcD6WBZ/utMoCgf520cmeaGnyz59j?=
 =?iso-8859-1?Q?Ms+x4bOxDySc9eMt/kgU7fEAYe+QzZ+xNr6FnJYq1L62X3RXcMk8raIoeE?=
 =?iso-8859-1?Q?GvJFxT7A65a2v8ppSMff8kTOk43qkN7fI6OF5Atoo1b23PmeLC0IATvhcK?=
 =?iso-8859-1?Q?85zFO6pxsiF5WVjBuFfLjecjO70tVDgkJH7qRT9G4YqVQsJDO+3l2IySOA?=
 =?iso-8859-1?Q?U95aVbmvX2Z4/l9CeMm6ozdJ+vWzLggZKZC6Kxi8ZSJ9VUptHmNvDX3ejY?=
 =?iso-8859-1?Q?mHPpbgBYrizmN1QGOEUMxwynFe4VVAXScnF/ycaL929Mv2ZV8kDYoiYfzx?=
 =?iso-8859-1?Q?dzVstEkHj5L+VoF7k0k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3b533d-3f24-4d36-0576-08ddebedc4f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:00.0316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hhfUqBUy7vCTxltbBUte9NcYIIAA0wk2DWMgJQyPcIt+DbGbdZXEt/T/swZdyAOJQSe4xMlDGJ7UzXIPB4/944kMqMnU36YhQ7reZi8KtFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

Hello everyone!

V6 contains an issue for debug builds with CONFIG_GICV3_ESPI=3Dn due to a
mistake in the ASSERT() condition in the is_espi() function. This patch
series fixes the issue and also includes minor fixes according to the
review of V6.

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
are on top of every patch, that is changed in the series, compared to V6:
https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v=
7-unsquashed/

Github branch with patch series:
https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v=
7/

Changes in V7:
- individual changes in patches

Link on V6:
- https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00296.htm=
l

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
 xen/arch/arm/include/asm/vgic.h        |  56 ++++++-
 xen/arch/arm/irq.c                     |  62 +++++++-
 xen/arch/arm/vgic-v3.c                 | 203 ++++++++++++++++++-----
 xen/arch/arm/vgic.c                    | 212 +++++++++++++++++++++++--
 xen/arch/arm/vgic/vgic.c               |   5 +
 15 files changed, 762 insertions(+), 112 deletions(-)

--=20
2.34.1

