Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC20B4470C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110842.1459874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGIc-0004mR-0e; Thu, 04 Sep 2025 20:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110842.1459874; Thu, 04 Sep 2025 20:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGIb-0004kP-T0; Thu, 04 Sep 2025 20:11:13 +0000
Received: by outflank-mailman (input) for mailman id 1110842;
 Thu, 04 Sep 2025 20:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG9g-00062f-M5
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:02:00 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff3cc75a-89c9-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 22:01:51 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:49 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:49 +0000
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
X-Inumbo-ID: ff3cc75a-89c9-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQpxAiXhYi0FOL43BE/vyRI5vVaoTe9nD4O6LCqo855OiUoKpG770NozZ/pH7C5f1fHEAy3LnR7jKnmg+TiCgLv30YiFDkKxC/QgxQBlDFUmldgrPcg/UF/uHn6GJxYHWzflmze4lODosRuhCbMQE3sLif2eJLdmKjBbMKG9Nqh8NclHcl0iVkODEnm/yUN7bCJC1KOwF/SNrikOwRBH7AsLu97cbYkYDqGz793SlufxmmXXhUZznl1AQ9sw/FE8Cuump5Wy1tFQpbh0/IUm66jIVjqZItgoWmqL4o6TVn7RAvpF7QrJf/QfqpJED2tfWmoGXidCyDXdybUZyrFehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujJFLWmitcsII9Trys4sWi3B0EXAvym/os6h93KEm9U=;
 b=E1s5EPVmePhHDNAOsL+yIiFO09BrOp1g6q8XNIzBWAm2bkbBBWVbzlwwsoTgxn060Iw3jSbRK2kJ8aoyyTsWpcttvVs1MRvMVgrmwl7QytA6ZJA2D641MMnMDMVU8JVSSL8NM0mvUG7KjicCpZ7DAh4fzm1b3SyR7m9VChDEcQU2NqheyOn3VHM3xB/jFNCKYeLGoPbgXtjTDAwawFhOwIw2ZCWgrPH60hwAvKcC3Xo7sfzLFGyFJAiGcS1Ckpg9+GRXfZ2Bk+QKcPNKTMRHc9c+mb7mR1cpMNckhVsQAsicHo3n5M5qGsOc/bgJs6/KXeIfbX9o7p9TZoWXZnNZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujJFLWmitcsII9Trys4sWi3B0EXAvym/os6h93KEm9U=;
 b=WtRwJb/6CvGNEg8PgUCq1pB7MDyKx6WsOFmWdP0qAbrMG0Q6cDuN/cDAIsFh7MFKf3u1xlYgHSizuU3G1/vGtL3AhZ7Sj8rjMFl3WggM/MYB8rRY6DBtuUq1i8pI4dNpiO5iNG13qx5+yQgAMunDzTuUSj3mA+RDVj6S8ztoI4Zp9mKOE3J1qGH9/6j4k4XrOcsRPYQ3L/vxs46xnhhmy3NVe1bChuQhToQ/yiBAFLArKHvQofEgG4vncKooVwJoNCSmOfmbYq5qwb3m50S3sHY6ePEKdUj7161el/Vb5n/fAwO1j98jPQFuNFhJ+3nUNpYNIqivr1v7OXnLqw4jbA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v7 11/12] doc/man: update description for nr_spis with eSPI
Thread-Topic: [PATCH v7 11/12] doc/man: update description for nr_spis with
 eSPI
Thread-Index: AQHcHda/fAGGraP6Q0Ofqx0FuB+e7w==
Date: Thu, 4 Sep 2025 20:01:49 +0000
Message-ID:
 <9a6568f7f470af79ee324b481983d2353554e9f1.1757015865.git.leonid_komarianskyi@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10974:EE_
x-ms-office365-filtering-correlation-id: b162c01c-f86f-4c04-05b3-08ddebede26f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?X+b/vA6jeeNhxPeF6XYjLlTX0nbjLStNYov8L9NxcYoIXlGCt98SAlaSpW?=
 =?iso-8859-1?Q?jQK6dY7K8J23A4nwGIVM7IHaN4OTAvGJKPjSfHAOtnwVZYpm4956tL687Q?=
 =?iso-8859-1?Q?SJO22oUWmUx8zutiIDIgA63OZXL0vyQ95jhEMgnAJ+XCFz7beCQtfWznsI?=
 =?iso-8859-1?Q?Tva4lV1rBKHoHaKYcQIQ+jM/o5cN8ubxCN4/AKoQQHvW377GFPCeP12p4X?=
 =?iso-8859-1?Q?ViHsz3up4YeJmoK7ae70Y+JPSQuOPOif5rFswtS3+If1JuTmoEQRhtRGNh?=
 =?iso-8859-1?Q?/cgwDqM0q2O9cbQL0/ic/P7s14VD0NrFcPL20vqzHiWMIxq31y05pRyqXG?=
 =?iso-8859-1?Q?MBPhzcC7XUZE8cFvLQI/0vGcjfqG0yBqlKFq1j1Sg9NN+h4bz2HaU1vIe2?=
 =?iso-8859-1?Q?1099gniGBGPscnX2ebTWz9I/hQdAo9b2X6tjJxHUsg9eLFcJyza5EM63ui?=
 =?iso-8859-1?Q?I1Jyo0tAaGe3umcDKouu61/yqYQcgjGnNREgxVnZZSSv+kFquXwcBXsokO?=
 =?iso-8859-1?Q?EcywIj5zz9DZpTbJNZD+Z0eMA6aARNPonpQPkWknu0OcsRcJStjICyvew9?=
 =?iso-8859-1?Q?I54zgoxSVQmPTZY6z8Ymv7I148Vde0XvGub0OVS/Rnb8bJJx0Ndncld5OG?=
 =?iso-8859-1?Q?QPDRdRHmwDbeH7vfxSl4gkKrfkZrQ2JYhlI7Thj+YsJoU6AcOYZECYldPe?=
 =?iso-8859-1?Q?wb4Sp8hovysiMeLSXgV8bXmmci1qu0XzGlvjIYRocbky7Z0OkHZ7Os5Gz0?=
 =?iso-8859-1?Q?pxT/b8rdivGRUqtinzqHXrmojsVgupdbB4petHKw3f9Byii6eEbmQF0GlR?=
 =?iso-8859-1?Q?w/aXPLhTYcCh4yCcIH14ncIkfPoVszIhm2zSO4BUGXmnu0Enbn0gF/MItm?=
 =?iso-8859-1?Q?xhlM0Zs11qNGA88Y1MNsqGPWInNaEXMB3qljdhQdkrT8f8Jl36zEkxYX0u?=
 =?iso-8859-1?Q?JDa8K/zqFdBZULZbq0fpcIObBIfO4z9J4kdfcv3ZvVCgnfFg+hj2ABolm6?=
 =?iso-8859-1?Q?kC1oYE3ZIfzKS0q9MV1R2Q/G3ocvrKbPjJgFaLOq9e2JHKHeJiZplAa2dJ?=
 =?iso-8859-1?Q?K+wRPiTqjMsoitEYBZFApdx7pMY2y3hFcTQfOGBRfov/iouwL/gTpmXRPx?=
 =?iso-8859-1?Q?ATUR/lBSOSbU/kwqVFoPKp8Jre+H3XIho2kMt9P2KqE6kArDcvgCv4vK6x?=
 =?iso-8859-1?Q?vRB3i5UYz6dzKX1gtBVamxSUADZcqamc16whLrwkS4HfdSZmZZYauDkOiF?=
 =?iso-8859-1?Q?rTxHhOknKXmvJnp892gsxFNFXoReOez1YxELbz9vO5/SF0ZEC8V+Sff1lk?=
 =?iso-8859-1?Q?Y7Nd3l/SmPaEGQWOmN2yfhKHuQxbrOMx9Yh9B+sMmEAor9aRkG3rd9k14Y?=
 =?iso-8859-1?Q?1dRsSIMtJ3NgL4G6JbIWPjVO0m4M94y9qkZ/cTS/LSXYn1hXPJMun/ItX5?=
 =?iso-8859-1?Q?feVoiGm02OiBvwI96GAWni8M/jhxthPqK7MztKfo/BC6OZWYTxNjpuVBpe?=
 =?iso-8859-1?Q?6Z+VK1QzEgK1RcfN//hD06q9jZferYG10+m9PHW4V80WV2J+rlXY6I2zNd?=
 =?iso-8859-1?Q?/RiE+BU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0arlFU7DnPFZUE0SiClLvMR1tZ62p/ToLLOluCdMyDe/bLAmJY7Wo5JI/h?=
 =?iso-8859-1?Q?0i4/LgGr04VnJDijiNjUPM1I4or6D8IOLaTjavsLNQ5pza45FSy7jsp8hm?=
 =?iso-8859-1?Q?qokZET5xXMhVBtnnF27GfF8J2AaSUfcNy5BjTSF+JcN/S+hH/UGnbhxLDi?=
 =?iso-8859-1?Q?msQ4waUP5/odHn8NXtOQL4GkB+6Ks+lObVIFwvFi0Zzh0LpjgeRUYDhJ6V?=
 =?iso-8859-1?Q?rATe+Y18WFR0s1Q/p+mAUO0D8xGg+cIFy98sfdkXK7LXrA+RfecNkIzkzu?=
 =?iso-8859-1?Q?0RfFNT5Na2Lw4D4uemigoaXIm0sT15s+r6/FXgUK9Eh+7df3N/S0OC6bS/?=
 =?iso-8859-1?Q?48A4G7OCZHCe3C4UiGXyTj29kpqcgIoCRJs0eu6NGOMFp9KDTSQDeLdZX5?=
 =?iso-8859-1?Q?6R2MpyjaazPWjYWJ6S4prmvPCH0Aawzp382RKFHvgYHQaI+uX59lgQMJpW?=
 =?iso-8859-1?Q?TWnWv/Fbb4Tcd4sFDTolYNfq8+lCpzbMLE2zoLwDfJY9BPhUi24m/Q7ZEM?=
 =?iso-8859-1?Q?aksZBerad1uj3KSrIjqn8/duiHZOf5IU7FZGKrYMty5v02qJRiGj9d98PW?=
 =?iso-8859-1?Q?TYVM6z063bVoqiWCLujKOtC0TX6H6tbuHONQwLGWUkElE4JQAxwf74w6Nf?=
 =?iso-8859-1?Q?8/6FQ8zBytId7lhThyHVkBSp+FiSqYFxB83OiloisUcnCSEgIKp9sGG+ag?=
 =?iso-8859-1?Q?BZKYcFe6cZb3l36U29CGTR5SItvHyQARg0Z2XHNfCh+xQ0DrPDLT7ZS3Zs?=
 =?iso-8859-1?Q?gNsGOcdqid30rX0DCS86VSc73jd1S8NLxZJEuDDIrUZYQ+q0HUzMconU/P?=
 =?iso-8859-1?Q?nIG0MENJIfHB8Couy4pziRcGq9eXugnd4nMt0lpf1Sd6m15CwHzVElpaTm?=
 =?iso-8859-1?Q?GP6Gm/qSzIwds2xBrq799o3ggjW/ijzyiPzTeIRkuGuTZAS4o8rkyiSJub?=
 =?iso-8859-1?Q?CaK7FGhYsdXZxC/fFfs6ZCnURgAQPL2kWDInQ9ulNqDK6CI/TPXHAFoFHL?=
 =?iso-8859-1?Q?B+DpNmng7UudhaKr4uWo6TdL5AHnEqmSRsXQEIfWzA22EBdv4VVWnL/r+N?=
 =?iso-8859-1?Q?hbw619QrcqW95XGLksFDeyvbgxrGwZtVjWCNwBcGIYbsmisZnp6U+dTPj5?=
 =?iso-8859-1?Q?NBjMrhkBy+jyLjZQqYiju54+dn7uDMpYpeeth0C/SsC+ZLIX9IUu8Ykt9j?=
 =?iso-8859-1?Q?eFiEaPe3vxAW6CaWS1PwRZty88cboHupJZpTWa4Am9L98bSZQuQCjaybXZ?=
 =?iso-8859-1?Q?qH1wpHXOiLFTiGnFRjwk9jdYRtZv1AvZNQbpkzIH8XdCF9gEvKGGbuZbtL?=
 =?iso-8859-1?Q?8aLOLHA6aWsyODvlBhtltpXrjvCb6+b6aLSQhgym6Ra1ZZZv8rZ1mQFXma?=
 =?iso-8859-1?Q?TcalfmN4dkCVTv0cOIx29eQq/ywYgTZJaaR/50BOdBYzOJM3nmoei1K0KX?=
 =?iso-8859-1?Q?cpBymge9YpaKT9BwYci1DaD/3mSn4sWQ8PAH54CBzp/ENTu2slbjoMk+5j?=
 =?iso-8859-1?Q?qWNXJEb71yd/37Kbbw5oZyH2sAR4tDLZDySFmumzKIT6kv10aKh3DkHZVJ?=
 =?iso-8859-1?Q?NCUsyPtIhicAwWM9THSPihrNv3MAxc0jMYOzzMq3LdMNWipGFB7VBmCiX3?=
 =?iso-8859-1?Q?tdwxBuixfY9GS4EYaEd7Zd+GQzcWEMyJ98wBq1jBa8OryBo2pRPzWnoG/F?=
 =?iso-8859-1?Q?qAMlZhQ5lNXMeyMSVjs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b162c01c-f86f-4c04-05b3-08ddebede26f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:49.5120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GLD4iIN7uzfRC7rQJdlX1lNbhLHjvFKyHt03ro0bE2YI0V9so0VLyu6w1gMDvba33pGXsGfJl/e/id3hPC/thphsN7m5hIdzGOOs+C8HUas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

Since eSPI support has been introduced, update the documentation with
the appropriate description.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
The discussion is ongoing and can be addressed in V5.
Clarification is needed from the maintainers.
Link:
- https://lore.kernel.org/xen-devel/87y0r4z717.fsf@epam.com/

Changes in V7:
- no changes

Changes in V6:
- no changes

Changes in V5:
- no changes

Changes in V4:
- introduced this patch
---
 docs/man/xl.cfg.5.pod.in | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 5362fb0e9a..292ab10331 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3072,11 +3072,14 @@ interval of colors (such as "0-4").
 =3Ditem B<nr_spis=3D"NR_SPIS">
=20
 An optional integer parameter specifying the number of SPIs (Shared
-Peripheral Interrupts) to allocate for the domain. Max is 960 SPIs. If
-the `nr_spis` parameter is not specified, the value calculated by the tool=
stack
-will be used for the domain. Otherwise, the value specified by the `nr_spi=
s`
-parameter will be used. The number of SPIs should match the highest interr=
upt
-ID that will be assigned to the domain.
+Peripheral Interrupts) to allocate for the domain. Max is 960 for regular =
SPIs
+or 5088 for eSPIs (Extended SPIs). The eSPIs includes an additional 1024 S=
PIs
+from the eSPI range (4096 to 5119) if the hardware supports extended SPIs
+(GICv3.1+) and CONFIG_GICV3_ESPI is enabled. If the `nr_spis` parameter is=
 not
+specified, the value calculated by the toolstack will be used for the doma=
in.
+Otherwise, the value specified by the `nr_spis` parameter will be used. Th=
e
+number of SPIs should match the highest interrupt ID that will be assigned=
 to
+the domain.
=20
 =3Ditem B<trap_unmapped_accesses=3DBOOLEAN>
=20
--=20
2.34.1

