Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8695B4AA79
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116313.1462685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvWU-0003Eh-0D; Tue, 09 Sep 2025 10:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116313.1462685; Tue, 09 Sep 2025 10:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvWT-0003Cm-T3; Tue, 09 Sep 2025 10:24:25 +0000
Received: by outflank-mailman (input) for mailman id 1116313;
 Tue, 09 Sep 2025 10:24:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvIG-0001My-0q
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:44 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a9ebc25-8d65-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 12:09:42 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU4PR03MB10645.eurprd03.prod.outlook.com (2603:10a6:10:58f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:09:36 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:09:35 +0000
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
X-Inumbo-ID: 1a9ebc25-8d65-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MT2QIuY4zkVz+rPLhRq9WWFVBhKzFEUq8oPdcrFO+gnrWBzV6j/u3pnn0RqHg/uoX0ic2pSnRbViB0e3CuKjqmzQV4KWOeG0NEfaXbmX8ipKTJOJlBlIoRX3dKFgA1if5WGpypoQIdDkJhhhf4GFFctr2oAAaf2stpG9X+fa22hpI5qhj41W064DSQMn3gTqeGd/K+Clc4r0ZrslcW5urRT+glFK2wbfCH4mYf0RGmHtxGvFJIkvUepUzQ036JClJwLsCYUxFK2VSwmjIkJj1n5YevEbOtG3iSRQaBCIk7Qx5JeIAihOqeyoxNbjzW2mMe2OYoAKzGVGIro3sK+PHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6bbvzsVUEc+kw99O4LcZ2YuLUneXWZV+PMGOFt5Akg=;
 b=IAFnHISyt+/5FLLj3iNrSsV+198JiIj6D3tFtpOVy1o6hyUo9MFKOycIpR2Z+3UkKhgzHM5zqArSH85Jw8aJkdtzmAsMyt2OqVmXXKew88nm/webnd5gd6PAG1CvgOjlzioCfzdeuEEeGzVRA1fg012ISJ6ypEhhm/RLAcX3QRPFFOyLutr7WfZKI4sRf6Pd5qf6hICdQMDEKPy9P8SRQ/M1h5mp2gHL7/q46N8a7nMRL/FH7R7wJ+SDwhEsOOiDN8drS/yR1JquscDYcCPjn8c8XR6h8VFssvgqgyouLt+I1Hrxb2RSkvXl8sziYA1s2512+NWbUQqkqgSYjFXyGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6bbvzsVUEc+kw99O4LcZ2YuLUneXWZV+PMGOFt5Akg=;
 b=mxNcNuhcKlxKCbgB3urZFZy5SWUhg/c8C2IAK5PcEEXKGaRtPn6/wt1xO+H0JUbwLsqpC1O8PkLiY4xhI9rNCCXhx+dYK/HWmWcSnJisURw5D78nhb8mlFIi2pOmTiQMbApnu5drBTwSTvZhfIG9Eys4EVwAtQMyJ1jcTg7n4xeOXR2YLLplU7rdUVR+H/STZSbatrci/0fyjiwkQFixi6CI+wfSAccpAoBFG6LoBE5LfRDs1+pMx/BztgiTFQsK3lGxBmDxas8TlklCcbtisL6ChUaib0PvjdEVuOK1HnIFQ8YV49qx+x8hWwk7bE1vIkPVwjXk4kF0XU8/B8A/kQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v8 11/12] doc/man: update description for nr_spis with eSPI
Thread-Topic: [PATCH v8 11/12] doc/man: update description for nr_spis with
 eSPI
Thread-Index: AQHcIXHYUoPCk20zLE631w+3FsPjLA==
Date: Tue, 9 Sep 2025 10:09:35 +0000
Message-ID:
 <06fa3e1c3e6cb938df68e1eeda4c20e7cecb2797.1757412099.git.leonid_komarianskyi@epam.com>
References: <cover.1757412099.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757412099.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU4PR03MB10645:EE_
x-ms-office365-filtering-correlation-id: 5218fcfb-53c6-4ca8-c4f9-08ddef88fac8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8jHtXvTPLrAi5yQyx7UQileMi1VyFhAUpoDx/0STJW2q8q70mxeirfW1qu?=
 =?iso-8859-1?Q?6pQYfMp/OFDhFC3FAIC3BfL0k82oRMv4uOfVYt7RIMTiaLrx/N+xgZ3XED?=
 =?iso-8859-1?Q?iQf7ihFWoAFhDqR6Gl2USIlTrLdxUSJ8bZfT4qRc+l+5f5ia/3HhJl+qUH?=
 =?iso-8859-1?Q?WziQPLg8QdtwhbnCK6S/JOEPlUNjNbPQHOIu/M67MXI8R/G1OvTSmD4YoT?=
 =?iso-8859-1?Q?kOsbAcb75nNNQ9lb4Hs626ibELGqLj/zWDhziSex/6sKMltDS0JQdgwYw6?=
 =?iso-8859-1?Q?UAxi4d6bbqPZWGavun951Iz1FLNVssucdDXlYJAufCKwjJYgIG7VgDUljU?=
 =?iso-8859-1?Q?+XoFwIU88pRt2otEpaak+InSorqOJITaj1gseRHKVhUZzA22msmLVFoDwK?=
 =?iso-8859-1?Q?244fdXN8DxtjgtHjJ8Gtr4Tgc2HkWkZmq2B1Q5TCjUg5yMosyNhXtWlsQO?=
 =?iso-8859-1?Q?vRI8ETDTWEot12zJt9bmR3q874y1U2LTz7n3pOA1la+l732EQJFd7Bl9eq?=
 =?iso-8859-1?Q?rzHrqOcBO1FeLFC6ex+u0o5MgPwIyGxo2ZP8fpjvCw7AEiHTc9Ze6OJbgx?=
 =?iso-8859-1?Q?kL3zVOPe58fgqBtFfDpmoBaGPR0c0ar7Y/IC/om1UudH//5cz2rZO3W5EP?=
 =?iso-8859-1?Q?HzILAT0D5R3vWMRvYXq5IY/IVUfsFmUYcOCWeWhU41XuA+TjGxQZBGEv9q?=
 =?iso-8859-1?Q?ISwGOn4blG5jOtY+bjaU1HZaeOLoSBHPYAvNsYmeHcu6Tjm4nXE88nIUtS?=
 =?iso-8859-1?Q?E358Z1OpwOh5v8NxSZP+COY47lITXkCp6Rm8l0keI6nZBcAG5wXTyb719Q?=
 =?iso-8859-1?Q?7y/85GBVI0Y3TV7b0fHmmLNA9V9nq757oXSk60GPVTTt83kMK8MFKJOQcR?=
 =?iso-8859-1?Q?0TKyj8hN31WrpNon+Grw0STXNv59EQO9dXpbanLuLwDzsaFyMf1Fog7XM+?=
 =?iso-8859-1?Q?HeqqHwxohyOFvRRVeH/qg2vjkw2CRfw+Ns7AWbM+27iWnXparqXkfnIUav?=
 =?iso-8859-1?Q?wWQ9BoadWSy90HFIxZvBX0M8aOht5KRnIA5UCdDeHTTkXaca+3qO5ZQxYs?=
 =?iso-8859-1?Q?TkAGDhZWc6G39nMbdeQK06vaKmUWk4BTFch2NKI27HIxdaf3acroJXpRwp?=
 =?iso-8859-1?Q?7O9WjQce5/N2n6Gu/pGO+i/5xG6/6bbcBti4ZjOgDkQu54BNodW6PznrQq?=
 =?iso-8859-1?Q?ek5sFayH+EAtmEZCbP2UniCvk4tuOsiEXHloiMR+FprUQydMazt1dK08Kb?=
 =?iso-8859-1?Q?ho+WEcaoNvfLS3xYDcJKO94UGEF6l5g13aq5moz30I9YTm5fDpmT6U6UFN?=
 =?iso-8859-1?Q?U6ILqcQ2ZeafTP+xWTutMnSHwaR9MsKAIvIVzuaPHEr/YbfTbRkVx1OrvF?=
 =?iso-8859-1?Q?DFtfAV77Qk7x4ktO0AmmHJNMQ79ZEVAg8JTovJimJUwc7zVjo5xLmpCaAd?=
 =?iso-8859-1?Q?P505RCdSVBcAZ6MYoWRPBji3kqIzGSYBUU2X+c4Oo2v1KzsbgV4SPY3v/j?=
 =?iso-8859-1?Q?Bi+E3ZfI4x5q+AIdf80G/Ub7ukQcTp4jfhfxYwNbXcdjpSDLnEmpSDjpW2?=
 =?iso-8859-1?Q?UV9rd8Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?asH6YLO914yDlNBkBFr87NZMo9luCkEVAqOB8CQ+Rz1SkNxUoRWYMXQ4z+?=
 =?iso-8859-1?Q?e0tx1DOFeHfiy7Cl2E5hKIrDGsEeNHMOHFb6xJ2b6jSWbNZG9xW7wp3c5e?=
 =?iso-8859-1?Q?B0dDzG2xb5DBUTy/MiXrV+YpdctDucWDpJWBC1p0JBS0RkrBUKKDTR98hJ?=
 =?iso-8859-1?Q?Jbb2bVIDyDRLKiyjXcQiHMobAX7mxOkIlk/vlTjFtyfjfV4rgm36+MFsBy?=
 =?iso-8859-1?Q?csZleBjPvudOwErYAYao3Eved2P/Qo0F084Wbc7AEY1f/TfCPXF9S2rLdS?=
 =?iso-8859-1?Q?6tfWyEfv6li2Ts+Dy/L6f6chzGkOAM3JloBlXS2w/isJUQOep01hpI8mkI?=
 =?iso-8859-1?Q?LHafd6F3/1NWjk0Kdo8xC3m3RC/ygZFR3QQd/LiT2mHyqRRqx2R0d8YuE0?=
 =?iso-8859-1?Q?LAZHn/kKBdke1ot+ysmnG/C46Z/9NMkIgBJDdKlklWArd9W+BvTE+uqeBj?=
 =?iso-8859-1?Q?1xU1V/HMzv/4vqU31kuAG0UgJ66rgCD3onFcyk5iGNX/mUDJux4NJCVHUC?=
 =?iso-8859-1?Q?hWFZMjwZR1js3Gulpni7Gon9l8OyKPAzPf2Sz9nQ88T1Zt12JtQKlDXA2i?=
 =?iso-8859-1?Q?nv4W4LMSBvPRumwhsByK4zfW9GqT6fAoJ/iTuSDQJTs38Et8bhlPlb6GMO?=
 =?iso-8859-1?Q?FEMrEMGVofBfvpx7DNHfl6dc25C2n8iJIurFdmiNTNTQ/UfoTe251XKAu9?=
 =?iso-8859-1?Q?Vm9kNx2FmL3aatzD67rqO/Tb1O/ZmGt8drBFp5buRaGOeti1MQ+3H4SyvO?=
 =?iso-8859-1?Q?C27yBSyGYCZcvWs+lMilTT9nWcShjo+s1nN0Qd6ACcPg23HhNtZAh5Wb+B?=
 =?iso-8859-1?Q?1B+5t2/ceGfv5xuW6ankZwtDlWiyPAB6tHKseEq2HAbohlHr5GR6Acl70w?=
 =?iso-8859-1?Q?t3IskRdLc9qk68D8FN92g1vVsoa1wxRd6JYlBJgSUfBcplcYnOHdvRUoW0?=
 =?iso-8859-1?Q?B/ieVxzSH1BH/K/7RLlbgXCFpxB/o3xNMhoZBtnXG3zLtEQ06mKLA63rXn?=
 =?iso-8859-1?Q?l0K3un+MAD6T/BDgPZ2EldoL64h7ZTENQ0YLsOxINB0WgxdFM8cmKijANc?=
 =?iso-8859-1?Q?p4myz2hK6DMckGthPDJCkVYYCNJGt3xTWQgWe8JQfidZbtC4nvwfITQjkq?=
 =?iso-8859-1?Q?BOzMRz3QsNYesfEwn554zDFPB+detYqB8u42xma0eRW9V4/5MOy6doHGWN?=
 =?iso-8859-1?Q?X6LOu1LDZlLVq3yFCtd4ub8NlVO4/0p2fHXup1ddQtTr5FCkyIFpbwyz8Z?=
 =?iso-8859-1?Q?57gMjry7sL+p2JBgshiu1r2cvgrkykHXhpBHuK3ut1L6cQskf8J3MWSLmO?=
 =?iso-8859-1?Q?HEd8Ds1ZeiFswH8tCIwtgI+D1f4/pXvMG0c+Z6eAcydorqcQl7THaCAcPn?=
 =?iso-8859-1?Q?aAcoP3T6iB9fdpA9jx6xToGs/c0sWe58chNJ+aQLF5P2+yjHXi5d8B/KId?=
 =?iso-8859-1?Q?xqhUvDknpk+WGn74odqGM7NQmN1ag9rxyLJu0P9cJWfR1nuyhoIU9EvF1d?=
 =?iso-8859-1?Q?IPsiu38OGW1NXZ2Svsnwpp8ciU6dpnE1OWFfWobqf04zJZIHfF5nQlZinH?=
 =?iso-8859-1?Q?eNZR4ZV/klo7tWKmOnDCxhjP21agF4vx9grxtwR+/mK+ntbLaQvnuLS5hy?=
 =?iso-8859-1?Q?pqgMahkjHoclXyjG3yILjXSMThAtBqaLv8+EL870x9PAdIlsT+BntiAzIG?=
 =?iso-8859-1?Q?78hd59+NhAx2yd7wOE0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5218fcfb-53c6-4ca8-c4f9-08ddef88fac8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:09:35.8458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d1Vq5qPbVG7KieHDkr2uEGH5Q6gd4MLUW2ZiQC4qQV0Z0pXZEIctQoViO9Vqm8qDG29rsss8FbtKZt52t+Q5rCAI9Gwgz225amh9J2wQyiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10645

Since eSPI support has been introduced, update the documentation with
the appropriate description.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
The discussion is ongoing and can be addressed in V5.
Clarification is needed from the maintainers.
Link:
- https://lore.kernel.org/xen-devel/87y0r4z717.fsf@epam.com/

Changes in V8:
- no changes

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

