Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7271A7F06C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 00:41:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941217.1340779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1v8y-0007m3-CK; Mon, 07 Apr 2025 22:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941217.1340779; Mon, 07 Apr 2025 22:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1v8y-0007kk-8i; Mon, 07 Apr 2025 22:40:40 +0000
Received: by outflank-mailman (input) for mailman id 941217;
 Mon, 07 Apr 2025 22:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=taXB=WZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1u1v8w-0006OT-EW
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 22:40:38 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20605.outbound.protection.outlook.com
 [2a01:111:f403:2607::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 530163fd-1401-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 00:40:36 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA1PR03MB10914.eurprd03.prod.outlook.com
 (2603:10a6:102:48a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 22:40:30 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 22:40:30 +0000
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
X-Inumbo-ID: 530163fd-1401-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ts+7hrCwA5c8rg/Zgx9flDNHN3dzigNBYFsgy106xd5PBfF52l5gAeZdmv3HUgP6Gv0tf9i46RWLvAqT0e/dHM/cxRRU6Rahvz1aXqFOewn0AsE6DTkAdQjNV2pdK7hIv8mDaIB58zuAK6AdPiNaYfSW9FyGKX8ewz1jYyzD189VZyIFmSAS0VGQpqfyk03a5SdUBG/mMW1JiSl9rtq3rGG4vltUKqqLoQo6eMrgEsGd8TzYrj2UtSiAsw3ZCwgKpCpEQ0RHXmtaMzDfCVsq2FwYFqp3+8pbBwwLTOEyS5GqQlCakvZWp1DPCva4QdWn0ElkezrC008JoaemUq0n8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTaXM1YcpRWAmexAanCUNtB3dc8utxSCTc4qJp2hJ04=;
 b=QN591Pt8xdCRab4iDb47/j/fHE8rxfFIbAks8pq1A1OfVWHl2+xL3uuqVs5U+aJAKBLHM0kKOhwtZw5w/oiicQ4khmczv5w+xFTy8ACnYlRmU5ILimWkhESKGYgJ+/PGTlSpMXZ1+vHdCjciqTYz8gsYIosh2g9fyM6M0JCnPLeUiHnvuaTCX741biUOwXuWSOgH2KVd5O0rMELmVv1x7hqAYWenzOY5LURmYqRCvv3FZkTVTQtLcK++Ipy8Cg9yu+Y42RQ2IMHETFlNZAawcMyQ+zTv+EKM04OjSx/hRqe/txq0ipYal6liRkput12qDdVIUyRvl0562rs0K5VasA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTaXM1YcpRWAmexAanCUNtB3dc8utxSCTc4qJp2hJ04=;
 b=YUZRxHE/OClcSNYW8Mh3U3gpW6HdVIG2SxotLj5lmsBTygJW14wx4c6ZrYJw2lrp9/KQ8vmdh7nOjY+0r3bpcdcQyUv0TzdWkCjFkHgFXyn5rkzWJ4isl7ioQhPNCtILVDqX9NT16ZCrS8Bcc6WlH9I667jLqYBeNFiCvorQHpCFRJqZAc7W4pyXKX3ogeZwvF75B9gtLg4ZazzAXzOg9g+NLKqU610Az29Z9dc2gCisOG0BTFNDbwSSD8KvmAZCNasYEwupmHbLLiqcejolrKQ0K9ykTX4L7J0bzlcWAN+oyQGnTpm4n8nmAs6j49K1Yl5d4enzeF8eSz3Of/I2TA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v8 3/3] CHANGELOG.md: Mention stack-protector feature
Thread-Topic: [PATCH v8 3/3] CHANGELOG.md: Mention stack-protector feature
Thread-Index: AQHbqA4P46MaoNq1rU+9TN2F/tJcNQ==
Date: Mon, 7 Apr 2025 22:40:28 +0000
Message-ID: <20250407224009.2577560-4-volodymyr_babchuk@epam.com>
References: <20250407224009.2577560-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250407224009.2577560-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA1PR03MB10914:EE_
x-ms-office365-filtering-correlation-id: 2ef9572f-cc07-459a-e6d1-08dd76253326
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VvoGeoeRJBMEeEGQOOib5dGlHdgMeDoPtIC9S216aAiOSXufZQey5OzBfQ?=
 =?iso-8859-1?Q?qfrMIsLePMI2XCLCsO17oo73877ADipJ+aN8COWKqf935SOO9/+jYB/5ZZ?=
 =?iso-8859-1?Q?sRbt/prs2B4aruqt0aVHRayKXhWy/e6+ywe3Z0rvwAcXXFrw2x03xAIuKg?=
 =?iso-8859-1?Q?NufxUNp9N8dWOAVSBRsRWT0OFCwfm8WnXYIoW+xniQiVTO0JhsRUXwk2Eo?=
 =?iso-8859-1?Q?iYxzkHDF1c5qOP4YsYPq0lPNqlRCtGgCtJm45/KNn71BDqYhxH9mU6rmPJ?=
 =?iso-8859-1?Q?HAkXfxh3ow00TOG74OFeCJzSp3SQ5GWJ3sm8nU3SH3N+aWFGfQCXPr7ruy?=
 =?iso-8859-1?Q?axIMjCYrgjHrHhtEQtNmRHiTRSuyfmC3fjAD5e5X/GKgRiTC7Jm27wk1Xw?=
 =?iso-8859-1?Q?WhaFFBQBqP8FBTdbbDexafkcE0004R7Ql21wTOBFS1yle01yJxRbSi9Kzf?=
 =?iso-8859-1?Q?TEzPItV+FEbNKDLj+rGMuKl2L8+WERHdBcIMOvvySzA+XSdd28hmpFnQO9?=
 =?iso-8859-1?Q?A69EuE3P9gkojkJqv26oYCvJTtvVT8VrQgIOBeuqHPAnOoab+KEYzLCoZT?=
 =?iso-8859-1?Q?obQqj0fKcGF0Suli5j96M4S/4rzNOgl2vcXPtHp1nxhoPl7Cohe7oyUH5W?=
 =?iso-8859-1?Q?Vc6CQxnbCVdteZbWTHIgWxDSHwkatHE63p7UxDSMgSBki3uHDO4gKmLHl0?=
 =?iso-8859-1?Q?7V4idvY9BFXpCyI/JQlpcMxyqEmL+K9SdWM67iG/rrrl9w3hfN+XtiAHKK?=
 =?iso-8859-1?Q?Oi+Bh0vRTUVBAYFm01u8JTbezHiXXOpv26VheDeEHtujlKsCsPFSn6tzwz?=
 =?iso-8859-1?Q?dE8CNxXkfcjhtplNOlThGjNB8oAg6eBkCX7AmiNjSrGqiCzOmue6v068UV?=
 =?iso-8859-1?Q?y/eHUEN4yniBN7IGviJu0IY9FWk/zQ5tVzkyci3c7VMtARidBtJge54550?=
 =?iso-8859-1?Q?JZaiFE77GipCyBpa7ub/wDUM+5lSMWM/0r3GPU0F9crVIAW+FwfWX+Oe4P?=
 =?iso-8859-1?Q?eO+y0wmGtXjdYLMc4K3l3uKSf2VD37BC+6o76gbk0dOS8CSx80d0nyYq1w?=
 =?iso-8859-1?Q?WkheOXFO7Ja62OWoCRlAzvq+pMi/f8xKPLCMCCVEZpPkfT8W25fc32ZFrF?=
 =?iso-8859-1?Q?PSwK5jG7CIMbQzBX9fWfbh07IWJtgFn+sYg37KzuBgeRzjW30BBX7KoJZ0?=
 =?iso-8859-1?Q?ZAT7MNK5nrx7XIv5GMupiSpky5M3twxENDlnxBP81sKF5tkVYsg2BnuR+9?=
 =?iso-8859-1?Q?9fRI2owgY3oXEp9VmYsIJW8vpuciaf50DYUDTGstnBwT+f1K5+B0IWyn2f?=
 =?iso-8859-1?Q?pHKxFjL3F3WFD0bX6yeqTdRdBEPkLLiJ6mQclNfsel5QEdCjryNchiWtJc?=
 =?iso-8859-1?Q?igBniEWhZFNHvu5WOZcaFhBVqVv0ba+YHox6RXIKdNyAixBecyn/avliF1?=
 =?iso-8859-1?Q?yCv2w43mM0A4Fgta?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EtjadY2Q9Bo8v0yYewuWBB7ni1pBdgH4GQDiZX5V4zRa/2oEHXCsUdE1k4?=
 =?iso-8859-1?Q?5kCFb/Tnx4Wxffh/r6Qj+JJ+BQlAhRreEOgWAy+7/GYEYgizLDkCwu7gkS?=
 =?iso-8859-1?Q?SFoOgoNp2ID0/22iadmVd+1GzUNJcSnj7QdkAHwU3Ec4bvgSuv0vmpU9gS?=
 =?iso-8859-1?Q?bceWzwoY1T0USadooBl5zSot4ZIesYm9loycGcsKCyqNBdQEju3wb95v6C?=
 =?iso-8859-1?Q?XV2yydMi3NptW4CxqVJx7h0aLrhFR2rQLWeK9EGku0SvU7Dya4BPizkPo7?=
 =?iso-8859-1?Q?V9cWjMl/fKhTgXAGtHxFSrQ7qjd2Gu7wQyToso1IbIdM6HHHfc6pZ+WfM6?=
 =?iso-8859-1?Q?qOfcjlZCvHYqKPzp3cykNGKDAe+03WX5wRscv+ETQzL4rcSiJqEG+26OTK?=
 =?iso-8859-1?Q?YmmOIVT8pcC4yhrv6+5YPg5qfnOPkZxpHINelNGbWf0VYuRdhslp0Z6MaC?=
 =?iso-8859-1?Q?86MXucHVgIJTY+1O1fvgYFvVXhwbFZsN+0vGvB5ZpYaPYWADI4L530UnzJ?=
 =?iso-8859-1?Q?6GRYRwub4eIJyMKIxCnWjoX0fYXfant9XZpet1aPrlsQoW9yCWd9KhVOqy?=
 =?iso-8859-1?Q?r1eGAcqiOhRj0BRoygNvGNvhZJwctnQEWFzVFCbuxFIl1KA8VO6bQ9f3L4?=
 =?iso-8859-1?Q?7w1vUjk0dFJ0IRMmjf3VrmS8+Jqog0mOgohAQiHWXFlPQENEfOyVtf9cCx?=
 =?iso-8859-1?Q?d3pHtuq/RXQ0pE2vCwktsRVvDVGzkf4GjAIhQsWENdDciMD8nE6IWJ4OpW?=
 =?iso-8859-1?Q?3tqS7nTGPUmZe/ERHiyIYLeGZfLx76GwMPTyf3clRpdqVpJ4PSdJedzUDp?=
 =?iso-8859-1?Q?ew0TYxguZQC617ywp/5tSd+aoe9JcK9rqcIiJbAhChxy1trsnc4Cm0sSuJ?=
 =?iso-8859-1?Q?YFcRDaUSSIfHP9Wai2MNycmCj/08LH1wOls/+4XGNruJgUUQKfgXACv5pB?=
 =?iso-8859-1?Q?wzO8LHk9lux4PJeYoge/ILL5AyEae1t9AhehYbyKTmhCedOn0WIf+Lt0Sk?=
 =?iso-8859-1?Q?TfiaQVLx7Nhzxy7SkRHdqPNW8R56eTyqHpC0OZWghDcFUqyz2hgSHX/t5E?=
 =?iso-8859-1?Q?lFN8hOWXngGPXPVy/W6Rx+g+txsbuMKKCFfJTzK993vZqbFW/vgazxpPDr?=
 =?iso-8859-1?Q?Q97PniaPCG7E9lYwahrW7eH0cUrzhVZDuIsGjmKjJbSJTY9Yydj4cO1YYf?=
 =?iso-8859-1?Q?+OMsDKH97ZQiEllIp9Fxc3tiNNdfu6HSIg6F7sHG91ca8vdOSN2tzfxntm?=
 =?iso-8859-1?Q?l8+AyFdLV3em+cq7qFa2W7eV/+D5f3e7EKiRUNdV6nz5wgv82zD/ur+JVz?=
 =?iso-8859-1?Q?36xoyXKnQMalJbw49vEQcDJI5v2UlzWScvftZO+kTUowG9Rwz0aBPYwDW7?=
 =?iso-8859-1?Q?wjGnLly7pz1YMt5mzi4DmQj2IEQ0EvWAMsmVMcgQ8qO/CFRNi6rdlrp9ET?=
 =?iso-8859-1?Q?qFgfpNdJ8gvZ7e5nzEibhWTeXgTddBZXdURXWgiejcywkiXTGUoUtde5RB?=
 =?iso-8859-1?Q?xj4jBtEon3xR48QTF+Z0/X/bdkGVUDgbX6W5vLNZINudHX+N1oPbI9KdpQ?=
 =?iso-8859-1?Q?TfCxMUmW0GBqeIrtKLgK4UMdPXFOQDIJGK939zOdDRWx8mYf6ccEfM74Cp?=
 =?iso-8859-1?Q?JQMLnK0rGXrqWPA6+2rTOrZFn8a028S5Ccr403lSh6nM4YhO6yb6FSuA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef9572f-cc07-459a-e6d1-08dd76253326
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 22:40:28.6795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 82YAi6SThVJw8Z/trU7zin760OMLMTMLnr9SuXwAFjAPBWJ1WMzQ0lReCuD/1x2w1RtFqoP6h9en4cMcnhe5BDqitcFmJGAKAgZz7ms8IY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10914

Stack protector is meant to be enabled on all architectures, but
currently it is tested (and enabled) only on ARM, so mention it in ARM
section.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

---

Changes in v7:
 - Moved the change to v4.21
 - Added Oleksii's acked-by tag

Changes in v6:
 - Dropped Andrew's R-b tag because there is little chance that this
 series will be included in 4.20, so this patch should be reworked for
 4.21
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8f6afa5c85..d3dd31dea2 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -19,6 +19,9 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
      capability usage is not yet supported on PVH dom0).
    - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
=20
+ - On Arm:
+    - Ability to enable stack protector
+
 ### Removed
=20
 ## [4.20.0](https://xenbits.xenproject.org/gitweb/?p=3Dxen.git;a=3Dshortlo=
g;h=3DRELEASE-4.20.0) - 2025-03-05
--=20
2.48.1

