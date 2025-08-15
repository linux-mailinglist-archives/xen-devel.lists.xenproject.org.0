Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A2BB27E1D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 12:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083182.1442819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrXN-0003fw-MV; Fri, 15 Aug 2025 10:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083182.1442819; Fri, 15 Aug 2025 10:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrXN-0003dw-Jv; Fri, 15 Aug 2025 10:19:53 +0000
Received: by outflank-mailman (input) for mailman id 1083182;
 Fri, 15 Aug 2025 10:19:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXkI=23=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1umrXL-0003dq-DI
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 10:19:51 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6048f896-79c1-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 12:19:50 +0200 (CEST)
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::20)
 by DU0PR03MB8622.eurprd03.prod.outlook.com (2603:10a6:10:3e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 10:19:47 +0000
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b]) by AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b%5]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 10:19:47 +0000
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
X-Inumbo-ID: 6048f896-79c1-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2ii5JCgBUw+PIPn7A87xRzgqgAflzzzzxtiko2VZqgI4F1gyIGAzvGLExd/8K+8xIIDDqNs5xYT8iALGHnfQm6Pz0jDIZlAwx0WYe93cslvtHXmpZr9Dv359V77VnbFI9/CSqz/pQD7DREjaWTt+s1B9Spp0Xb2UjOXiL80vNGNr9Hx7/1Cm1riw2W1Q0yZel1AjcpuDl6EHGQsG8Uiuo1pJTBjPI/g4tazfWJT11fEWzYGHj5x6a1XTjAJoVz0fr9lJ3HJcNtB83M2o0409kJ70BguQnbl5ppsWB4JduoluMzPYTf4oCcbxkX9K+TGAaiINbp9qz9Eqh40MCHjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xewDOK4jXNrNHpQ075L7aH9M6LJMV17EtRmkCrE2YA=;
 b=JUtych8JE/iYHI/7n2jIpeuvH3+MbaATfqZluDbjQrPJoFUs7g+KTNuSoFgjlpeqRNs263kf1ACHZfZfdAet1Ewdcw3cnaoxBOhGDz+UfRfMAOWh6Q7iPNTHVJ0nS14+z2b6rZpuZ87hqsDSacpA0d+xhhb6+66Z5YWPAyom1N3y+kCESbL34GP16A/iq/agNfiUIOpUfh66gFn8da/lPVyv8sucVzOzzUp2p07pc6MPqLVCHZyBHWPIdpxsz5vSlCrgtAQKYDsB3O51JqLC8xV5b9NaVIe/rPZOi19ihhrtJ+yFsKatp+6ry+5kNs/nowdz86gNFtEgut7+EFuKlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xewDOK4jXNrNHpQ075L7aH9M6LJMV17EtRmkCrE2YA=;
 b=mrktaaDdQi7PuwjNFCjbjmhFI6VS6CvmVsscIvQMHsiQ8b0ssIh6CxpaFc3vnBuhj8eRU0/NV1NP4mkdhM5Wlbw0YEMpf8rlFfnZfEjaS1/NKs0asmWVhCRbEELcDu376aN49703ZuSeo7q51jb/G9QNUNc36BB5q8uFaXw5NyP0xoRnTUU+7T4ilNgTsmSCPANqucrcrwGHqyahB3J3sjjPe/UZtMrnJ8vKCiKzGxh2Ai5tQbJFqacPVJ37s/yxd/HZaw69NPHLkChBIVMZcShfysrIHy2Kt51uU9eGQty4bxbdhjVwlGMD9bDQcqE3xTHSveyrYZ2moqzG5ZZn9w==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH] x86/hvm/ioreq: Fix condition in hvm_alloc_legacy_ioreq_gfn()
Thread-Topic: [PATCH] x86/hvm/ioreq: Fix condition in
 hvm_alloc_legacy_ioreq_gfn()
Thread-Index: AQHcDc4g80PGAKCUYEOWQIOrbWg9cg==
Date: Fri, 15 Aug 2025 10:19:47 +0000
Message-ID: <20250815101946.2329018-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7025:EE_|DU0PR03MB8622:EE_
x-ms-office365-filtering-correlation-id: 2da364ec-859b-4d85-c661-08dddbe5432a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bM2UEudxJl/HJLmVja824Ka6fLgmfzhCti6jLwrSiLP5P2p8TSc34oJk91?=
 =?iso-8859-1?Q?9ePQ49A0sPXTRyawEAirP8f3HbruDNK70ex319qDZbNAvJ0/ZIitZNVBaG?=
 =?iso-8859-1?Q?X9k1nBGiyPkb7ZTHqkq+p9UgnWwcs7TId14oCsPjKkEI9xSUYT+hLZLEge?=
 =?iso-8859-1?Q?kmOlgD97B/Fwp/liHtBuNjBkKWtFZi+5cRdsup4YKJ5NkRdnzSvVJahPkf?=
 =?iso-8859-1?Q?YbheRpIWAiBB1IQke8vy17/qadpO4vWRYc9/pip4ddn4PdMyFrodrXnT5W?=
 =?iso-8859-1?Q?NPdbl6471bEqLIDg5lBUZ2YdNkw8rBAwT+8upqZC6PxZLcoxa6VGn2/aWL?=
 =?iso-8859-1?Q?BtNRkbHU0tPbQuIRoQlWzed99ekmVsfxdMIFlbZ9PEReFlW5j8uv9f5qDD?=
 =?iso-8859-1?Q?0E9vUQ6W3Xz4efYH008qdYn1XypFNdNHdx37cftqO1cOg5ZDgzrX8wdM6T?=
 =?iso-8859-1?Q?M6MOofFaNc3rZ6Qib0f7Inktlyg/FSno7Ftt0KlcQTlcGkfrta12x1iwkV?=
 =?iso-8859-1?Q?R3LBOC+3O+ZbB+FFETl+/UDLx4J5E2dGH+T588qyenSw20HzX3SICfb7p4?=
 =?iso-8859-1?Q?TnuJ+kOn4rYavTibwGGMDZOsgVC7/WbkU/4PIJ77YeaW2AZl4mG5fUxvxR?=
 =?iso-8859-1?Q?YSj+bv6pR20ghHC1+/yW85VBF0LFpKvmHu8iLUu236+Za6aH/HufUUvwAg?=
 =?iso-8859-1?Q?LczTghkxFNvdBgKB+4+D985I4zVZozexPPLjHOs/JnJdoZibC/gh/FIC8I?=
 =?iso-8859-1?Q?rcjPx93iQ33Oc99Chj9M9RIfzxj1CC67StV35MRgGuZVr916zmVHfg4wP2?=
 =?iso-8859-1?Q?GgWaYhfYbqwM++EmJ+ED5yPa1RnwNfhigFP8PmbHZ+RgSEUyrWGDhZiKi6?=
 =?iso-8859-1?Q?1D2tJsNtwAdUErkfMIFuCLAYktXwMM2p+Tt2m/h2JjcBs1BwzHsdbM1U1N?=
 =?iso-8859-1?Q?+9GXX7mqM/U6Z+f3Ypvdz7z8jB2Hyyt5ttIkixcdsuROl1WiF9hicYPgI/?=
 =?iso-8859-1?Q?0tZWAZGPCvVlvH9bukAs+a7pj1FzXdWb+sHsGQXj4CnkSNH0Gt+bfBmdmm?=
 =?iso-8859-1?Q?5nt9xWImdGYs+7MQ0xiwC03S/8x+Zm+UN8SHoSCtbVhVoN/3Zjp29c8Jbs?=
 =?iso-8859-1?Q?VxjS5Ez320X+gDvWF+Ywdw0Qu3p1b6pzAJ54mgByJryy4J2EAlXqbDEPCE?=
 =?iso-8859-1?Q?j3zyars30PYdQD+LOnINsT33urw19OWbi466YeVezgSyDMQKa2fXN4K1YT?=
 =?iso-8859-1?Q?YvDjBYRKauHl2VQ7knderCvpNdI/YKWcTTFc7rS07Lv8I/mpezGtcWn72M?=
 =?iso-8859-1?Q?yJj/JtTta7cEQ7tCmjN4xjLAoEzFLiDzWsFa4kYApJsfMLrDSdpZlBLmOD?=
 =?iso-8859-1?Q?cJzsQwUFQqKYQXd4Rs9g0GB2mIVDXUFawBb8bTYk65a9HX8IW1iuV66Llq?=
 =?iso-8859-1?Q?LqAF+l4Hk6gbr7TCXISyq/m7hCVdNzb8ie45Y6A5rQ2VpemEmxpFF5OWE7?=
 =?iso-8859-1?Q?25QgKQUqrGnN+ZJIYeyl9IK88mzNpxDAgxuUgcI01y/Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7025.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?r2r3JdWRuRDBmJetIOMuZNk8Oi87ecONtVXuKznoSpz4i9emGRmwYtz5uk?=
 =?iso-8859-1?Q?yCFdWYeYv8aCr/uuDTN9g7itW5wjQuSZAydqUec270QES+TSIelWbjGriH?=
 =?iso-8859-1?Q?m0RXX5p8EZej32rbNMf6dVRs14htSsCthp8qT3iJTz6mTBjOXcald5zYpG?=
 =?iso-8859-1?Q?9YeERqZitaGlmZeMnGtlpxfNAyrGMEpKnxcNbgi1Pewh69uIpV/buGBpKC?=
 =?iso-8859-1?Q?PvP9Jbo7FwZMRNtf2S9NwY/ZkgtpGCo7pb1mkgPKj4hVTQ8DaMQUCbGWsO?=
 =?iso-8859-1?Q?1y/mED5G0bndbf2yrvdJNF4feml5dvyR5+uWmRoOCHEd4/lCdpIwf0thqm?=
 =?iso-8859-1?Q?b+dhBkeIwEukE31HqSAXMnHzHjwV2R0BqYfeG+CrmXoKVZgjPppCPWRmK4?=
 =?iso-8859-1?Q?euO2UbRQQCz366OFKiSxH6rwxlorHm3MWMOpiWCf1y6fD7PNYb2tDeCYu0?=
 =?iso-8859-1?Q?Bz1J3LiNpisqjkTY5Qrusel+RtWJEODr3tZn3lkCxfZit6yRlIkWrZp87y?=
 =?iso-8859-1?Q?sQrvgjJtm7ez9Ie8ecZUk/78HiNt86NRq9Mqr1YaT9Q3zwhi6cx5KjnZx4?=
 =?iso-8859-1?Q?jA8KR/RM/mo8VzN3+upITh3Kp7APqDOcejPTK9y1huFfyS3jLL7RrI53YB?=
 =?iso-8859-1?Q?JMqz/nyOTZkKOg4zUCW0h3JS6wYV0l8c3JpwgKyA9Ov+r0FjobUSupqpT0?=
 =?iso-8859-1?Q?amHRXe3fXA18pR15o+Fr3LZzfGD6tvDOIqAx7FbnJWZmufREiWKNjjr8Z1?=
 =?iso-8859-1?Q?u0RgjDX+UFrD7l768bp6FfNPGJW2FaFc3TjgbVmQANYppqoeYmNRy8ykLL?=
 =?iso-8859-1?Q?d2IZ1odjRy3jpBLlOaCVwKGpjApxX25iY0OwEYsVJaTYna/wRC7AQOvwwj?=
 =?iso-8859-1?Q?FEx03ecVGAxKcIv2/17s++RZETAL1Qc+ur7KCsIoQeGu8OkRWadFEA15Us?=
 =?iso-8859-1?Q?dbdl7ML5WrxOGvLQi3OspsIB1QfPlBsb/Vlp4LZYODricsr96BfitJhRwf?=
 =?iso-8859-1?Q?gxZL70M3Q39TMmUVRZdasqZIHARgE1pv1kDJHVX3iJ//Z3Kda9Vkv4r1dv?=
 =?iso-8859-1?Q?RUVVTOcqeq644kK8HoUSI1OGSH/B0tL/j6VndStpiUxLKkTrYE8B3X2U39?=
 =?iso-8859-1?Q?27TJc7OcjFT0CUCOrwxNMBDJy1oZY3o2eP+kdX32pNnkDsZ2iftmr9gjVj?=
 =?iso-8859-1?Q?Xj98Uf6KC7vFo5azUye7jrsE5JpEH33dd1AVNgH8JGC2hj2J2LMouUXRjE?=
 =?iso-8859-1?Q?RBGe36zJN1PfSQewEmF5C6HfpdZcQGvagB5oL+GHQp9lYul1F+rWuyXfNZ?=
 =?iso-8859-1?Q?WTxjw8dqfCzuk8hdMWe1uoZSVvgrbWru3T75OvH1bvl6p2kOZ4TwDei1ct?=
 =?iso-8859-1?Q?V/EVMxMVWtbAQ9bvP1qZo83u9abtphZ7xdoenJfSASYfL1HEMn1NUykocH?=
 =?iso-8859-1?Q?ccmEAgDKkpmG9wu05Z9szRvX9ONtyZ9O58mjPpk8AdbLJggK8z0Jw6lm82?=
 =?iso-8859-1?Q?DQ1OjPczsKwAepseywzFtUFpGYrcmFoNRVsfNho1TJpT8JQrkCVzg00eFk?=
 =?iso-8859-1?Q?A2GkL+ddCpd5eeXmpZ/Zg2/OBfrvjdDJYtsAYCusdAvt6cb2LXlJ4BqV/e?=
 =?iso-8859-1?Q?wRFVWz4T/EdmPmjGXeXlmJKBbUeKmyNR7b0WVALim5/bCvgx0vItC0RjpP?=
 =?iso-8859-1?Q?W1ffihrZpNVG6TtVnVM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7025.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da364ec-859b-4d85-c661-08dddbe5432a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 10:19:47.7289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KSV9Qc1+rESTIBDe+hYL3Ho9a7KIWziB61K/b8GjEjKCdQdMY8ynWlplQp+EuJ6vF+ml1mRY5a9z7PDzLnXOm0+jA+BFuAveoH+NUhEvUwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8622

Fix the incorrect condition that causes hvm_alloc_legacy_ioreq_gfn()
to return INVALID_GFN even if the HVM param was installed properly by
the toolstack.

Fixes: 3486f398a3dd (' x86/hvm/ioreq: allow ioreq servers to use HVM_PARAM_=
[BUF]IOREQ_PFN')
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
When playing with the XEN_DMOP_get_ioreq_server_info sub-op, I noticed weir=
d
behavior where the hypercall returned success only the second time.
---
---
 xen/arch/x86/hvm/ioreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index ec709e5f47..4d30f2d730 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -63,7 +63,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct ioreq_serv=
er *s)
=20
     for ( i =3D HVM_PARAM_IOREQ_PFN; i <=3D HVM_PARAM_BUFIOREQ_PFN; i++ )
     {
-        if ( !test_and_clear_bit(i, &d->arch.hvm.ioreq_gfn.legacy_mask) )
+        if ( test_and_clear_bit(i, &d->arch.hvm.ioreq_gfn.legacy_mask) )
             return _gfn(d->arch.hvm.params[i]);
     }
=20
--=20
2.34.1

