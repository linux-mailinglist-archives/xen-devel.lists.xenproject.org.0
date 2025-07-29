Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5F1B1549F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063073.1428876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugro5-00056A-5i; Tue, 29 Jul 2025 21:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063073.1428876; Tue, 29 Jul 2025 21:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugro5-00053k-0m; Tue, 29 Jul 2025 21:24:21 +0000
Received: by outflank-mailman (input) for mailman id 1063073;
 Tue, 29 Jul 2025 21:24:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NAX=2K=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugro2-0004NS-PA
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:24:19 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61c7f202-6cc2-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 23:24:16 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GVXPR03MB8452.eurprd03.prod.outlook.com (2603:10a6:150:2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 21:24:11 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 21:24:11 +0000
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
X-Inumbo-ID: 61c7f202-6cc2-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNLgQXkb0WithagYivW4P2RZwReK90FNmVWV5A20SCIN4ZUCkn3AyrPISmjBruG7M3SSjoPv0vI6p2uc7pyJ0aBd9HFIxJENqFuo7B4IKGLsxIBiIHjr7ekjl5FpAnJRC5k7M/Cbsnry7U62dTuTMyEYzEpxC0mCikXCVQBfTnjCVj2xfTMzHmcf0jkiDRxeikqUdCHn4sWxGxDua8PQOEU23ZcJedWAzOFiJiPlfpMrZCXU+PelsctuIQqkGEUpdQXOtrDWQJ9X3mdw0QWFPSP4kv1b4ameZcOdCcQS17j1BfdrpKlyuaGXrhgiJCTVYVjhPkx7t6uKNRIoHlWWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0MmeQm8KCFxXK+4PkDsw1sU9oXCEEc9hlAU7NmFWdo=;
 b=n2nAwYB3ml5ps28dk2s1qWbamBJNnC4vMhTPZP/4tcAKkGWN1WaOOiObz5PQfIUfXKP2uuu7kVzE1ZyYvrQVIpSvbO+/ugQ+7/Abj8PyUB9uHXtNQIg7pOYwCibs827y5clK+tGZs9oP8KDfj/lww2Yi46K7Da6EO8yW2womV4YDp8p0NEhbEtmXv0e9i6VuYj/vdzJz75UqryGKJXvihR9bXm8J8QC3wBjggfBYg2AcThySrn5VzmUXMGTQviXB+Slep2wiajWYBzo5/SOhP3jyWMtgrlTmGfMwZGAz7fS0bX/9apPbVymcFSu2Y6NiLpK/onVZQM5kDaolDcP/1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0MmeQm8KCFxXK+4PkDsw1sU9oXCEEc9hlAU7NmFWdo=;
 b=QIOq25juQ+BBbHKFbcvYpGuq2SaZlSXGIuKqGhROHcAebHJxvfCDmZ/RPbh3dZPS1oJgGKKFclsE+iPbs2D0MozF5tjrtFJGvV3SIw2lRXfSir4xAl5udylPIyrh9WlD7Zo6hnuoQ7ELFXzKvvqEK18JL4kbnCuvesgDIu416qUBb0rRhhpogGP1qoVS33FjqvCUgEBqjPAnnm6yes+cvfkdUw+eAn2g0TzHFrD9MpmpPoAYd8d/tsqp9ExKkRZmtfoCZuWMCapeato32zzKgsUIGqHMVqZePzWKs3IpVHEu3gHV31zPMe8NVT//kolfEtiZBwDty9ElvuhqiDQ2Fw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Paul Durrant <paul@xen.org>,
	Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Alexandru
 Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, Meng Xu
	<mengxu@cis.upenn.edu>
Subject: [RFC PATCH 3/3] misra: address rule 5.5 bitops
Thread-Topic: [RFC PATCH 3/3] misra: address rule 5.5 bitops
Thread-Index: AQHcAM8gAVfaXkDVkUyP+V9ASIaT5Q==
Date: Tue, 29 Jul 2025 21:24:10 +0000
Message-ID:
 <a9e8d00533d6707a7649a487dc8696c2302634f6.1753822074.git.dmytro_prokopchuk1@epam.com>
References: <cover.1753822074.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1753822074.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GVXPR03MB8452:EE_
x-ms-office365-filtering-correlation-id: 6ed2177d-648d-4492-30f3-08ddcee64288
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+D420ah0UFWNmGi7G08IjdJiC1+WAH/zju7uKqjNeOeVp78qUlOG7VAGYm?=
 =?iso-8859-1?Q?Y+i+1lEPotzK2nR3DTmgw20F8SdjLX6oQ/9r7yz188Cm66cdS1DwK/o3E7?=
 =?iso-8859-1?Q?bT5k7XVxu5jNudNI2f7D4Ox6ny6yYL8+Mj2SV1ghbztv1bBu+cpz+SbGnF?=
 =?iso-8859-1?Q?pQ6HvLfsO4B7rRb1M/Y7IIqy1bK0CsChneW0nEcFgJngodZplPAEPzPk4O?=
 =?iso-8859-1?Q?NVGWTR0ZXptLqxEFi1mKmUzDiM4xc0SLyNbk+7Zo5AryTn/0RfC4GajxS6?=
 =?iso-8859-1?Q?XPKuEpLtOpiR62SlOVo/LwvkpC2fOfaUBDJpDlT6Xw6Z69CI2mmv6nsqaq?=
 =?iso-8859-1?Q?EUj/k5btzUQoC9fZwcdXICvhLALIZI333mf3PzpWyAv65yPiKKoVMiUPIy?=
 =?iso-8859-1?Q?tD2x3hszE8tu2UzgsL8a7XkRSVj+TjcKXMpPf3BCawlzTBAr2j0Bg1I3Nf?=
 =?iso-8859-1?Q?JZmIbvl5/ZEEJhlGSTSwuSsGMRHhk7B0LH3SD8T4PZp6VxYRBECnvTQn5a?=
 =?iso-8859-1?Q?VHrjyNVchcYwzQLNb1HC58ldVuM49Yvd4hk1vh8EVVBFb5m5VuZDhPXN/j?=
 =?iso-8859-1?Q?Za5FSSgBpm7lfqzUMRtHTEBW7pYpzfyqlLPLAqy7vtaEgjpI1m5AxzdLPp?=
 =?iso-8859-1?Q?8Gcgxc97q+jZCAF50kyFwfMrYMrOl1nMJsT756V7SF8GbUtvC0FoMAhzk+?=
 =?iso-8859-1?Q?5NcaqhWeuzr8DmGRFR/PlEo7LTxIB7swAxf6zxvIZbboVeYfHMzh72fsxh?=
 =?iso-8859-1?Q?S51aD576WZlaT9S7nnxBNBtwOUcxjQGdv9l8DZNLV6tfEz9Un3xyMNwI2z?=
 =?iso-8859-1?Q?oRJIa6/zoWwB9Fhyw8n0CUBQ6F855R9VA72yGNqDpd9IBQEoBi2cD/e3ZE?=
 =?iso-8859-1?Q?JWjFm9tY1WqyfxQj8wT0O0+EQEqrnTzKmvyPVM3BhFQDawy0jZYh4tLM1S?=
 =?iso-8859-1?Q?gc8gjPtbLIjrJZF8B8bHjIxQJ7JTWO++SRoXB5dHcoe7SQRAbVLu12WS/r?=
 =?iso-8859-1?Q?Hr2CjnZwFgdqbWvgqC69/ck27mWEh/PcRFiYlieNUzx4L4QEwtmEHLvgo3?=
 =?iso-8859-1?Q?jFUR0F0sK7rew0yWTub1eIp/G1hDHlzbFy50bC1LFC8qk87i68q4yMCyWC?=
 =?iso-8859-1?Q?zCD5pBcp93p5ztxLNcAtlW1Dehgel1SJf5xuCMsSX25QQVbb8bty5w7kVc?=
 =?iso-8859-1?Q?ji5KzSB52QI1Pp5eU6rnn+4ruqHBCu0KVkQUaOymUDYDk6qSeOvzlDbvyE?=
 =?iso-8859-1?Q?t4+m63c0uka+I7VYsaWmlaB02cBRfGjmPMy4gvmmIAXFClcuW0x32Ki19j?=
 =?iso-8859-1?Q?3WnS3Lyhf3yMeA11/0nVGMU43vIkVzj0meGJzI4VgOR7C1d7pFXlRYU5eC?=
 =?iso-8859-1?Q?dLSIh7s0PRdDHOsAniTNfsEbiFXNP5/a9WvCWuX5kPHKEfLEvsGj28U6vn?=
 =?iso-8859-1?Q?5iOGYOCn5EketahbXfYGDSCgXi1dhWQtvflbogLUAfVC/w++SvZiznYsvU?=
 =?iso-8859-1?Q?KyYB0Ux7iJTHjEBwJY5vDNx31FTEFWZD/qK4X6rNf9Aw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CvE2jDBIJLMIITCfWqUMONdDTtd4Rh4WQgInapnJKlrjiCdqqDofUsSNLF?=
 =?iso-8859-1?Q?W3W4+eTTAjhwPrRp2spRgQo55E8kIDC1fLS2eu+BSv2ahqkW2eI3BT7S3Q?=
 =?iso-8859-1?Q?rj+9YlNN9g+il4hpd9aOeN0iQFEI7VR+iZn+mDN8pK8BCs/ppdcg5MdTeY?=
 =?iso-8859-1?Q?Daa3pchLeBYK7FrJzrw2lpyCmK/aBymb/Wk7WgPf9tLDTPxZwHxicKxJRM?=
 =?iso-8859-1?Q?k8yLnMZNAyEoyxScNKtPlVlByB6eSBTWKtUzmCks+mL1xAZgvx+2+gp3Yj?=
 =?iso-8859-1?Q?yWrKGJ0gkerHW+sQ+VAl9O4xZA0hacv46e+E++ZYZF5htRksGvl+uwzugU?=
 =?iso-8859-1?Q?F+pyh/b9qx2aqwDRVoSxyo8FHk1IDXoL4iyFPqGyd7sQv3bpNP+n9iVz69?=
 =?iso-8859-1?Q?agPxFlKpmJC3C9xx13BMW0Qhaq5MesD9oHgFmdhVkwSycOh2PS1nDoptiz?=
 =?iso-8859-1?Q?zDEpVIwnJoUaMQ4IQdwpCpXEfVBy4U8xzb+ni2+v5kvz5G0m2lX9T77JI+?=
 =?iso-8859-1?Q?JVKUmfxmzX1S29DI7tpQNOGRd/cFEhlVvkS6K9tRLP78pxuNTuioiL+H5t?=
 =?iso-8859-1?Q?ImvyDhTvViJI3qaFYkfpvwpmUrmtvYYyD6MbLPSxip56L2gbK2zOMUH1aF?=
 =?iso-8859-1?Q?imotsBtT9WzNQ5w17Ow8KaUIGndzroB4rjV160GcRwvCIDClzkI4S9//F2?=
 =?iso-8859-1?Q?tKEfMM2rz3KQ70Iwz+otKsxnWYTzjP9CSRQ6T/HbxgxeGJcbXkcYl5qBu8?=
 =?iso-8859-1?Q?gh0cLNxCTcDI2Ci5NVuZ+VxOxi9OeHvvGee5xdae48wIT66WF5O9/ryz9X?=
 =?iso-8859-1?Q?FYdeJBVTHZqv0QYAH9WXXvrXtZeJ3w1ij6EfxcAHgtuKuCZzJMOIceuhLd?=
 =?iso-8859-1?Q?dnqQQQmO02WWE1kBHAzafjt+DkQ2JB54ouYqKQUTr9oHcMbVBePu0YX8SD?=
 =?iso-8859-1?Q?awqlqTUAZQskConOmfG1imPxpCBdliJ+lx5uhhRcLxlag8X8FYfq9nlu4o?=
 =?iso-8859-1?Q?1/a3fXNzXKp3BWZdamtZ6O+jVwXaht/T/8gpXRYEb++I7yBO0RIdhp4MWp?=
 =?iso-8859-1?Q?Om9PV0Qbvju4mr7sVDGr/rg58gGheYG6cidc+eou+4vx/U04rn0AgDgnmH?=
 =?iso-8859-1?Q?9hnDJlK3gY3aUNA0jGCWNeD9MH4mnEXJwkpOkKoHQ7oBkLKorUAbg5uOPt?=
 =?iso-8859-1?Q?UKZruiDvc/GwL6343gVbhFv9DR8HQ7DI9NsCxiX0Pm5/ngWt39fgVw3PDJ?=
 =?iso-8859-1?Q?NcEEAgDNAQcEUvNN2O6vKI6wEV5CQiPqA3uF58XDOrlWMySTg89fOknY4L?=
 =?iso-8859-1?Q?8cFLbXasBxWYOFHdZEDWNnZ6+BrsMV1zfIOR2+3IaH6v7cXL5gNrRu77Wq?=
 =?iso-8859-1?Q?WjwSg+oBvImE7w1QLk6zDmqg4AfVfe9lkTo13st2qDJRSIwL4haFyKzi4F?=
 =?iso-8859-1?Q?rnU3wmj7PtyjNsnsORvTiaKCR0oXrsD1YxJALdRekXN+SCgeRlb91+ePPQ?=
 =?iso-8859-1?Q?oMWCo0vKmcdABUXbiuNRiNUhVer72na8ctqmS0xP7pVuAfPsDR0sluLrP/?=
 =?iso-8859-1?Q?UwvpLcQp5gpwf5kWgFOEjn4k8Zn8U7TzzMG4kZZ2rO9waNzFRutdy7mxXS?=
 =?iso-8859-1?Q?7jo5h1by5zRDGTEumDvAlpocVIy5IDlHslkFngJxnwbBqO62R0Sbbpxw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed2177d-648d-4492-30f3-08ddcee64288
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 21:24:11.0048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKHCDRt9grHu39aVhyIajhb2cNqdeLiCvLM3ZC4+COe0VmukL5V3mR+DMeA8s+xTjaa7fKZq5UmB6heRkx4YE0yLekJDQUW8QQ+Nu+ma7rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8452

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/arch/arm/dm.c                          |  2 +-
 xen/arch/arm/domctl.c                      |  2 +-
 xen/arch/arm/gic-vgic.c                    | 26 +++++++++++-----------
 xen/arch/arm/gic.c                         |  8 +++----
 xen/arch/arm/include/asm/cpufeature.h      |  2 +-
 xen/arch/arm/include/asm/gic.h             |  2 +-
 xen/arch/arm/include/asm/guest_atomics.h   |  4 ++--
 xen/arch/arm/irq.c                         | 16 ++++++-------
 xen/arch/arm/tee/ffa_partinfo.c            |  2 +-
 xen/arch/arm/tee/ffa_private.h             |  2 +-
 xen/arch/arm/traps.c                       |  2 +-
 xen/arch/arm/vgic-v3-its.c                 |  6 ++---
 xen/arch/arm/vgic.c                        | 10 ++++-----
 xen/arch/arm/vgic/vgic-mmio.c              |  2 +-
 xen/arch/arm/vgic/vgic.c                   |  2 +-
 xen/arch/arm/vpsci.c                       |  4 ++--
 xen/arch/riscv/cpufeature.c                |  2 +-
 xen/arch/riscv/include/asm/guest_atomics.h |  2 +-
 xen/arch/x86/cpu-policy.c                  | 14 ++++++------
 xen/arch/x86/cpu/amd.c                     |  2 +-
 xen/arch/x86/cpu/common.c                  | 14 ++++++------
 xen/arch/x86/cpu/mcheck/x86_mca.h          |  2 +-
 xen/arch/x86/domain.c                      |  2 +-
 xen/arch/x86/e820.c                        |  4 ++--
 xen/arch/x86/guest/xen/xen.c               |  2 +-
 xen/arch/x86/hvm/emulate.c                 |  2 +-
 xen/arch/x86/hvm/hpet.c                    |  6 ++---
 xen/arch/x86/hvm/irq.c                     | 12 +++++-----
 xen/arch/x86/hvm/svm/nestedsvm.c           | 10 ++++-----
 xen/arch/x86/hvm/svm/svm.c                 |  2 +-
 xen/arch/x86/hvm/viridian/time.c           |  4 ++--
 xen/arch/x86/hvm/vlapic.c                  |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c                |  8 +++----
 xen/arch/x86/hvm/vmx/vmx.c                 |  4 ++--
 xen/arch/x86/include/asm/guest_atomics.h   |  2 +-
 xen/arch/x86/include/asm/hvm/vlapic.h      |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h     |  2 +-
 xen/arch/x86/include/asm/mpspec.h          |  2 +-
 xen/arch/x86/irq.c                         | 26 +++++++++++-----------
 xen/arch/x86/mm.c                          |  8 +++----
 xen/arch/x86/mm/hap/hap.c                  |  2 +-
 xen/arch/x86/mm/paging.c                   |  4 ++--
 xen/arch/x86/mm/shadow/common.c            |  2 +-
 xen/arch/x86/mm/shadow/hvm.c               |  4 ++--
 xen/arch/x86/monitor.c                     |  4 ++--
 xen/arch/x86/msi.c                         |  2 +-
 xen/arch/x86/psr.c                         |  2 +-
 xen/arch/x86/pv/dom0_build.c               |  4 ++--
 xen/arch/x86/pv/emul-priv-op.c             |  2 +-
 xen/arch/x86/pv/shim.c                     |  2 +-
 xen/arch/x86/traps.c                       |  2 +-
 xen/arch/x86/x86_64/mm.c                   |  2 +-
 xen/arch/x86/x86_64/mmconfig_64.c          |  2 +-
 xen/arch/x86/xstate.c                      |  4 ++--
 xen/common/domain.c                        |  4 ++--
 xen/common/efi/runtime.c                   |  2 +-
 xen/common/event_2l.c                      |  2 +-
 xen/common/kexec.c                         | 16 ++++++-------
 xen/common/keyhandler.c                    |  2 +-
 xen/common/multicall.c                     |  2 +-
 xen/common/numa.c                          |  4 ++--
 xen/common/page_alloc.c                    |  4 ++--
 xen/common/pdx.c                           |  2 +-
 xen/common/sched/core.c                    | 12 +++++-----
 xen/common/sched/credit.c                  | 12 +++++-----
 xen/common/sched/credit2.c                 |  6 ++---
 xen/common/sched/rt.c                      |  4 ++--
 xen/common/vmap.c                          | 12 +++++-----
 xen/drivers/passthrough/iommu.c            |  2 +-
 xen/drivers/passthrough/vtd/dmar.c         |  4 ++--
 xen/drivers/passthrough/vtd/iommu.c        |  4 ++--
 xen/drivers/passthrough/x86/hvm.c          |  2 +-
 xen/drivers/passthrough/x86/iommu.c        |  2 +-
 xen/drivers/vpci/vpci.c                    |  4 ++--
 xen/include/xen/bitops.h                   |  8 +++----
 xen/include/xen/cpumask.h                  |  6 ++---
 xen/include/xen/nodemask.h                 |  2 +-
 xen/include/xen/sched.h                    |  4 ++--
 78 files changed, 194 insertions(+), 194 deletions(-)

diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index fdb3d967ec..928a51aac2 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -101,7 +101,7 @@ int dm_op(const struct dmop_args *op_args)
          * Allow to set the logical level of a line for non-allocated
          * interrupts only.
          */
-        if ( test_bit(data->irq, d->arch.vgic.allocated_irqs) )
+        if ( TEST_BIT(data->irq, d->arch.vgic.allocated_irqs) )
         {
             rc =3D -EINVAL;
             break;
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad914c915f..8cb0e41483 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -196,7 +196,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_con=
text_u c)
     ctxt->ttbr1 =3D v->arch.ttbr1;
     ctxt->ttbcr =3D v->arch.ttbcr;
=20
-    if ( !test_bit(_VPF_down, &v->pause_flags) )
+    if ( !TEST_BIT(_VPF_down, &v->pause_flags) )
         ctxt->flags |=3D VGCF_online;
 }
=20
diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index ea48c5375a..2b9b9b7752 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -76,7 +76,7 @@ void gic_raise_inflight_irq(struct vcpu *v, unsigned int =
virtual_irq)
     ASSERT(spin_is_locked(&v->arch.vgic.lock));
=20
     /* Don't try to update the LR if the interrupt is disabled */
-    if ( !test_bit(GIC_IRQ_GUEST_ENABLED, &n->status) )
+    if ( !TEST_BIT(GIC_IRQ_GUEST_ENABLED, &n->status) )
         return;
=20
     if ( list_empty(&n->lr_queue) )
@@ -106,7 +106,7 @@ static unsigned int gic_find_unused_lr(struct vcpu *v,
=20
     ASSERT(spin_is_locked(&v->arch.vgic.lock));
=20
-    if ( unlikely(test_bit(GIC_IRQ_GUEST_PRISTINE_LPI, &p->status)) )
+    if ( unlikely(TEST_BIT(GIC_IRQ_GUEST_PRISTINE_LPI, &p->status)) )
     {
         for_each_set_bit ( used_lr, *lr_mask )
         {
@@ -182,7 +182,7 @@ static void gic_update_one_lr(struct vcpu *v, int i)
     if ( lr_val.active )
     {
         set_bit(GIC_IRQ_GUEST_ACTIVE, &p->status);
-        if ( test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) &&
+        if ( TEST_BIT(GIC_IRQ_GUEST_ENABLED, &p->status) &&
              test_and_clear_bit(GIC_IRQ_GUEST_QUEUED, &p->status) )
         {
             if ( p->desc =3D=3D NULL )
@@ -216,9 +216,9 @@ static void gic_update_one_lr(struct vcpu *v, int i)
         clear_bit(GIC_IRQ_GUEST_VISIBLE, &p->status);
         clear_bit(GIC_IRQ_GUEST_ACTIVE, &p->status);
         p->lr =3D GIC_INVALID_LR;
-        if ( test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) &&
-             test_bit(GIC_IRQ_GUEST_QUEUED, &p->status) &&
-             !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
+        if ( TEST_BIT(GIC_IRQ_GUEST_ENABLED, &p->status) &&
+             TEST_BIT(GIC_IRQ_GUEST_QUEUED, &p->status) &&
+             !TEST_BIT(GIC_IRQ_GUEST_MIGRATING, &p->status) )
             gic_raise_guest_irq(v, irq, p->priority);
         else {
             list_del_init(&p->inflight);
@@ -229,7 +229,7 @@ static void gic_update_one_lr(struct vcpu *v, int i)
              * accesses to inflight.
              */
             smp_wmb();
-            if ( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
+            if ( TEST_BIT(GIC_IRQ_GUEST_MIGRATING, &p->status) )
             {
                 struct vcpu *v_target =3D vgic_get_target_vcpu(v, irq);
                 irq_set_affinity(p->desc, cpumask_of(v_target->processor))=
;
@@ -290,8 +290,8 @@ static void gic_restore_pending_irqs(struct vcpu *v)
             {
                 if ( p_r->priority =3D=3D p->priority )
                     goto out;
-                if ( test_bit(GIC_IRQ_GUEST_VISIBLE, &p_r->status) &&
-                     !test_bit(GIC_IRQ_GUEST_ACTIVE, &p_r->status) )
+                if ( TEST_BIT(GIC_IRQ_GUEST_VISIBLE, &p_r->status) &&
+                     !TEST_BIT(GIC_IRQ_GUEST_ACTIVE, &p_r->status) )
                     goto found;
             }
             /* We didn't find a victim this time, and we won't next
@@ -370,7 +370,7 @@ int vgic_vcpu_pending_irq(struct vcpu *v)
             goto out;
         if ( GIC_PRI_TO_GUEST(p->priority) >=3D active_priority )
             goto out;
-        if ( test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) )
+        if ( TEST_BIT(GIC_IRQ_GUEST_ENABLED, &p->status) )
         {
             rc =3D 1;
             goto out;
@@ -446,9 +446,9 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *=
v, unsigned int virq,
          * active/pending in the guest.
          */
         if ( !p->desc &&
-             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) &&
-             !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) &&
-             !test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
+             !TEST_BIT(GIC_IRQ_GUEST_ENABLED, &p->status) &&
+             !TEST_BIT(GIC_IRQ_GUEST_VISIBLE, &p->status) &&
+             !TEST_BIT(GIC_IRQ_GUEST_ACTIVE, &p->status) )
             p->desc =3D desc;
         else
             ret =3D -EBUSY;
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index e80fe0ca24..f7e377a79c 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -93,7 +93,7 @@ void gic_set_irq_type(struct irq_desc *desc, unsigned int=
 type)
      * IRQ must be disabled before configuring it (see 4.3.13 in ARM IHI
      * 0048B.b). We rely on the caller to do it.
      */
-    ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
+    ASSERT(TEST_BIT(_IRQ_DISABLED, &desc->status));
     ASSERT(spin_is_locked(&desc->lock));
     ASSERT(type !=3D IRQ_TYPE_INVALID);
=20
@@ -112,7 +112,7 @@ void gic_route_irq_to_xen(struct irq_desc *desc, unsign=
ed int priority)
 {
     ASSERT(priority <=3D 0xff);     /* Only 8 bits of priority */
     ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts that =
don't exist */
-    ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
+    ASSERT(TEST_BIT(_IRQ_DISABLED, &desc->status));
     ASSERT(spin_is_locked(&desc->lock));
=20
     desc->handler =3D gic_hw_ops->gic_host_irq_type;
@@ -158,7 +158,7 @@ int gic_remove_irq_from_guest(struct domain *d, unsigne=
d int virq,
     int ret;
=20
     ASSERT(spin_is_locked(&desc->lock));
-    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
+    ASSERT(TEST_BIT(_IRQ_GUEST, &desc->status));
     ASSERT(!is_lpi(virq));
=20
     /*
@@ -171,7 +171,7 @@ int gic_remove_irq_from_guest(struct domain *d, unsigne=
d int virq,
     desc->handler->shutdown(desc);
=20
     /* EOI the IRQ if it has not been done by the guest */
-    if ( test_bit(_IRQ_INPROGRESS, &desc->status) )
+    if ( TEST_BIT(_IRQ_INPROGRESS, &desc->status) )
         gic_hw_ops->deactivate_irq(desc);
     clear_bit(_IRQ_INPROGRESS, &desc->status);
=20
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/a=
sm/cpufeature.h
index b6df188011..06c3e5bd93 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -95,7 +95,7 @@ static inline bool cpus_have_cap(unsigned int num)
     if ( num >=3D ARM_NCAPS )
         return false;
=20
-    return test_bit(num, cpu_hwcaps);
+    return TEST_BIT(num, cpu_hwcaps);
 }
=20
 /* System capability check for constant cap */
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 541f0eeb80..366c0ebcb4 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -415,7 +415,7 @@ static inline unsigned int gic_get_nr_lrs(void)
  */
 static inline void gic_set_active_state(struct irq_desc *irqd, bool state)
 {
-    ASSERT(test_bit(_IRQ_GUEST, &irqd->status));
+    ASSERT(TEST_BIT(_IRQ_GUEST, &irqd->status));
     gic_hw_ops->set_active_state(irqd, state);
 }
=20
diff --git a/xen/arch/arm/include/asm/guest_atomics.h b/xen/arch/arm/includ=
e/asm/guest_atomics.h
index 8893eb9a55..681f13c336 100644
--- a/xen/arch/arm/include/asm/guest_atomics.h
+++ b/xen/arch/arm/include/asm/guest_atomics.h
@@ -64,8 +64,8 @@ guest_bitop(change_bit)
=20
 #undef guest_bitop
=20
-/* test_bit does not use load-store atomic operations */
-#define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
+/* TEST_BIT does not use load-store atomic operations */
+#define guest_test_bit(d, nr, p) ((void)(d), TEST_BIT(nr, p))
=20
 guest_testop(test_and_set_bit)
 guest_testop(test_and_clear_bit)
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c..177644f936 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -160,7 +160,7 @@ void __init init_IRQ(void)
 static inline struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
 {
     ASSERT(spin_is_locked(&desc->lock));
-    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
+    ASSERT(TEST_BIT(_IRQ_GUEST, &desc->status));
     ASSERT(desc->action !=3D NULL);
=20
     return desc->action->dev_id;
@@ -246,7 +246,7 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int ir=
q, int is_fiq)
     }
 #endif
=20
-    if ( test_bit(_IRQ_GUEST, &desc->status) )
+    if ( TEST_BIT(_IRQ_GUEST, &desc->status) )
     {
         struct irq_guest *info =3D irq_get_guest_info(desc);
=20
@@ -264,7 +264,7 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int ir=
q, int is_fiq)
         goto out_no_end;
     }
=20
-    if ( test_bit(_IRQ_DISABLED, &desc->status) )
+    if ( TEST_BIT(_IRQ_DISABLED, &desc->status) )
         goto out;
=20
     set_bit(_IRQ_INPROGRESS, &desc->status);
@@ -331,7 +331,7 @@ void release_irq(unsigned int irq, const void *dev_id)
     spin_unlock_irqrestore(&desc->lock,flags);
=20
     /* Wait to make sure it's not being used on another CPU */
-    do { smp_mb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );
+    do { smp_mb(); } while ( TEST_BIT(_IRQ_INPROGRESS, &desc->status) );
=20
     if ( action->free_on_release )
         xfree(action);
@@ -348,7 +348,7 @@ static int __setup_irq(struct irq_desc *desc, unsigned =
int irqflags,
      *  - if the IRQ is marked as shared
      *  - dev_id is not NULL when IRQF_SHARED is set
      */
-    if ( desc->action !=3D NULL && (!test_bit(_IRQF_SHARED, &desc->status)=
 || !shared) )
+    if ( desc->action !=3D NULL && (!TEST_BIT(_IRQF_SHARED, &desc->status)=
 || !shared) )
         return -EINVAL;
     if ( shared && new->dev_id =3D=3D NULL )
         return -EINVAL;
@@ -375,7 +375,7 @@ int setup_irq(unsigned int irq, unsigned int irqflags, =
struct irqaction *new)
=20
     spin_lock_irqsave(&desc->lock, flags);
=20
-    if ( test_bit(_IRQ_GUEST, &desc->status) )
+    if ( TEST_BIT(_IRQ_GUEST, &desc->status) )
     {
         struct domain *d =3D irq_get_domain(desc);
=20
@@ -501,7 +501,7 @@ int route_irq_to_guest(struct domain *d, unsigned int v=
irq,
      */
     if ( desc->action !=3D NULL )
     {
-        if ( test_bit(_IRQ_GUEST, &desc->status) )
+        if ( TEST_BIT(_IRQ_GUEST, &desc->status) )
         {
             struct domain *ad =3D irq_get_domain(desc);
=20
@@ -570,7 +570,7 @@ int release_guest_irq(struct domain *d, unsigned int vi=
rq)
     spin_lock_irqsave(&desc->lock, flags);
=20
     ret =3D -EINVAL;
-    if ( !test_bit(_IRQ_GUEST, &desc->status) )
+    if ( !TEST_BIT(_IRQ_GUEST, &desc->status) )
         goto unlock;
=20
     info =3D irq_get_guest_info(desc);
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinf=
o.c
index c0510ceb83..3479d6a7e4 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -445,7 +445,7 @@ bool ffa_partinfo_domain_destroy(struct domain *d)
=20
     for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
     {
-        if ( !test_bit(n, ctx->vm_destroy_bitmap) )
+        if ( !TEST_BIT(n, ctx->vm_destroy_bitmap) )
             continue;
=20
         res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], ffa_get_vm_=
id(d),
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.=
h
index c4cd655389..57efa76b06 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -447,7 +447,7 @@ static inline bool ffa_fw_supports_fid(uint32_t fid)
=20
     if ( FFA_ABI_BITNUM(fid) > FFA_ABI_BITMAP_SIZE)
         return false;
-    return test_bit(FFA_ABI_BITNUM(fid), ffa_fw_abi_supported);
+    return TEST_BIT(FFA_ABI_BITNUM(fid), ffa_fw_abi_supported);
 }
=20
 #endif /*__FFA_PRIVATE_H__*/
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 445e7378dd..bab7c82393 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -998,7 +998,7 @@ static void show_guest_stack(struct vcpu *v, const stru=
ct cpu_user_regs *regs)
     void *mapped;
     unsigned long *stack, addr;
=20
-    if ( test_bit(_VPF_down, &v->pause_flags) )
+    if ( TEST_BIT(_VPF_down, &v->pause_flags) )
     {
         printk("No stack trace, VCPU offline\n");
         return;
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index bc738614bb..284459140b 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -370,7 +370,7 @@ static int its_handle_clear(struct virt_its *its, uint6=
4_t *cmdptr)
      * no effect on that LPI anymore. Since LPIs are edge triggered and
      * have no active state, we don't need to care about this here.
      */
-    if ( !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) )
+    if ( !TEST_BIT(GIC_IRQ_GUEST_VISIBLE, &p->status) )
         vgic_remove_irq_from_queues(vcpu, p);
=20
     spin_unlock_irqrestore(&vcpu->arch.vgic.lock, flags);
@@ -432,10 +432,10 @@ static void update_lpi_vgic_status(struct vcpu *v, st=
ruct pending_irq *p)
 {
     ASSERT(spin_is_locked(&v->arch.vgic.lock));
=20
-    if ( test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) )
+    if ( TEST_BIT(GIC_IRQ_GUEST_ENABLED, &p->status) )
     {
         if ( !list_empty(&p->inflight) &&
-             !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) )
+             !TEST_BIT(GIC_IRQ_GUEST_VISIBLE, &p->status) )
             gic_raise_guest_irq(v, p->irq, p->lpi_priority);
     }
     else
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index c563ba93af..2ed6c6e046 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -265,7 +265,7 @@ bool vgic_migrate_irq(struct vcpu *old, struct vcpu *ne=
w, unsigned int irq)
     }
=20
     /* migration already in progress, no need to do anything */
-    if ( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
+    if ( TEST_BIT(GIC_IRQ_GUEST_MIGRATING, &p->status) )
     {
         gprintk(XENLOG_WARNING, "irq %u migration failed: requested while =
in progress\n", irq);
         spin_unlock_irqrestore(&old->arch.vgic.lock, flags);
@@ -322,7 +322,7 @@ void arch_move_irqs(struct vcpu *v)
         v_target =3D vgic_get_target_vcpu(v, i);
         p =3D irq_to_pending(v_target, i);
=20
-        if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
+        if ( v_target =3D=3D v && !TEST_BIT(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
             irq_set_affinity(p->desc, cpu_mask);
     }
 }
@@ -398,7 +398,7 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsig=
ned int n)
         spin_lock_irqsave(&v_target->arch.vgic.lock, flags);
         p =3D irq_to_pending(v_target, irq);
         set_bit(GIC_IRQ_GUEST_ENABLED, &p->status);
-        if ( !list_empty(&p->inflight) && !test_bit(GIC_IRQ_GUEST_VISIBLE,=
 &p->status) )
+        if ( !list_empty(&p->inflight) && !TEST_BIT(GIC_IRQ_GUEST_VISIBLE,=
 &p->status) )
             gic_raise_guest_irq(v_target, irq, p->priority);
         spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
         if ( p->desc !=3D NULL )
@@ -598,7 +598,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v, =
unsigned int virq,
     }
=20
     /* vcpu offline */
-    if ( test_bit(_VPF_down, &v->pause_flags) )
+    if ( TEST_BIT(_VPF_down, &v->pause_flags) )
     {
         spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
         return;
@@ -616,7 +616,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v, =
unsigned int virq,
     n->priority =3D priority;
=20
     /* the irq is enabled */
-    if ( test_bit(GIC_IRQ_GUEST_ENABLED, &n->status) )
+    if ( TEST_BIT(GIC_IRQ_GUEST_ENABLED, &n->status) )
         gic_raise_guest_irq(v, virq, priority);
=20
     list_for_each_entry ( iter, &v->arch.vgic.inflight_irqs, inflight )
diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
index d2bcb32cd7..a8da401ba3 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -463,7 +463,7 @@ void vgic_mmio_write_config(struct vcpu *vcpu,
         irq =3D vgic_get_irq(vcpu->domain, vcpu, intid + i);
         spin_lock_irqsave(&irq->irq_lock, flags);
=20
-        if ( test_bit(i * 2 + 1, &val) )
+        if ( TEST_BIT(i * 2 + 1, &val) )
             irq->config =3D VGIC_CONFIG_EDGE;
         else
             irq->config =3D VGIC_CONFIG_LEVEL;
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index 6cabd0496d..3bd78223bc 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -933,7 +933,7 @@ void vgic_sync_hardware_irq(struct domain *d,
          * interrrupt is disabled before trying to change the config.
          */
         if ( irq_type_set_by_domain(d) &&
-             test_bit(_IRQ_DISABLED, &desc->status) )
+             TEST_BIT(_IRQ_DISABLED, &desc->status) )
             gic_set_irq_type(desc, translate_irq_type(irq->config));
=20
         if ( irq->target_vcpu )
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 7ba9ccd94b..74a36856ea 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -29,7 +29,7 @@ static int do_common_cpu_on(register_t target_cpu, regist=
er_t entry_point,
     if ( is_64bit_domain(d) && is_thumb )
         return PSCI_INVALID_ADDRESS;
=20
-    if ( !test_bit(_VPF_down, &v->pause_flags) )
+    if ( !TEST_BIT(_VPF_down, &v->pause_flags) )
         return PSCI_ALREADY_ON;
=20
     if ( (ctxt =3D alloc_vcpu_guest_context()) =3D=3D NULL )
@@ -173,7 +173,7 @@ static int32_t do_psci_0_2_affinity_info(register_t tar=
get_affinity,
         v =3D d->vcpu[vcpuid];
=20
         if ( ( ( v->arch.vmpidr & tmask ) =3D=3D target_affinity )
-                && ( !test_bit(_VPF_down, &v->pause_flags) ) )
+                && ( !TEST_BIT(_VPF_down, &v->pause_flags) ) )
             return PSCI_0_2_AFFINITY_LEVEL_ON;
     }
=20
diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index b846a106a3..92d8e8a85e 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -473,7 +473,7 @@ bool riscv_isa_extension_available(const unsigned long =
*isa_bitmap,
     if ( id >=3D RISCV_ISA_EXT_MAX )
         return false;
=20
-    return test_bit(id, isa_bitmap);
+    return TEST_BIT(id, isa_bitmap);
 }
=20
 void __init riscv_fill_hwcap(void)
diff --git a/xen/arch/riscv/include/asm/guest_atomics.h b/xen/arch/riscv/in=
clude/asm/guest_atomics.h
index 22a7551804..c1b605bfc5 100644
--- a/xen/arch/riscv/include/asm/guest_atomics.h
+++ b/xen/arch/riscv/include/asm/guest_atomics.h
@@ -30,7 +30,7 @@ guest_testop(test_and_change_bit)
=20
 #undef guest_testop
=20
-#define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
+#define guest_test_bit(d, nr, p) ((void)(d), TEST_BIT(nr, p))
=20
 #endif /* ASM__RISCV__GUEST_ATOMICS_H */
=20
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 42dccdce52..dc43cdca30 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -476,7 +476,7 @@ static void __init guest_common_max_feature_adjustments=
(uint32_t *fs)
          *
          * If RTM-capable, we can run a VM which has seen RTM_ALWAYS_ABORT=
.
          */
-        if ( test_bit(X86_FEATURE_RTM, fs) )
+        if ( TEST_BIT(X86_FEATURE_RTM, fs) )
             __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
         break;
=20
@@ -613,9 +613,9 @@ static void __init guest_common_feature_adjustments(uin=
t32_t *fs)
      * nop on non-HT hardware, and has this behaviour to make heterogeneou=
s
      * setups easier to manage.
      */
-    if ( test_bit(X86_FEATURE_IBRSB, fs) )
+    if ( TEST_BIT(X86_FEATURE_IBRSB, fs) )
         __set_bit(X86_FEATURE_STIBP, fs);
-    if ( test_bit(X86_FEATURE_IBRS, fs) )
+    if ( TEST_BIT(X86_FEATURE_IBRS, fs) )
         __set_bit(X86_FEATURE_AMD_STIBP, fs);
=20
     /*
@@ -715,10 +715,10 @@ static void __init calculate_pv_def_policy(void)
      * MSR_ARCH_CAPS, reflect the appropriate RSBA/RRSBA property to the g=
uest
      * depending on the visibility of eIBRS.
      */
-    if ( test_bit(X86_FEATURE_ARCH_CAPS, fs) &&
+    if ( TEST_BIT(X86_FEATURE_ARCH_CAPS, fs) &&
          (cpu_has_rsba || cpu_has_rrsba) )
     {
-        bool eibrs =3D test_bit(X86_FEATURE_EIBRS, fs);
+        bool eibrs =3D TEST_BIT(X86_FEATURE_EIBRS, fs);
=20
         __set_bit(eibrs ? X86_FEATURE_RRSBA
                         : X86_FEATURE_RSBA, fs);
@@ -884,10 +884,10 @@ static void __init calculate_hvm_def_policy(void)
      * MSR_ARCH_CAPS, reflect the appropriate RSBA/RRSBA property to the g=
uest
      * depending on the visibility of eIBRS.
      */
-    if ( test_bit(X86_FEATURE_ARCH_CAPS, fs) &&
+    if ( TEST_BIT(X86_FEATURE_ARCH_CAPS, fs) &&
          (cpu_has_rsba || cpu_has_rrsba) )
     {
-        bool eibrs =3D test_bit(X86_FEATURE_EIBRS, fs);
+        bool eibrs =3D TEST_BIT(X86_FEATURE_EIBRS, fs);
=20
         __set_bit(eibrs ? X86_FEATURE_RRSBA
                         : X86_FEATURE_RSBA, fs);
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index eb428f284e..3c3892eff4 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -755,7 +755,7 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
 	 * Some hardware has LFENCE dispatch serialising always enabled,
 	 * nothing to do on that case.
 	 */
-	if (test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability))
+	if (TEST_BIT(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability))
 		return;
=20
 	/*
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index e063fe790a..f96efe2b38 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -68,10 +68,10 @@ void __init setup_clear_cpu_cap(unsigned int cap)
 	const uint32_t *dfs;
 	unsigned int i;
=20
-	if (__test_and_set_bit(cap, cleared_caps))
+	if (TEST_AND_SET_BIT(cap, cleared_caps))
 		return;
=20
-	if (test_bit(cap, forced_caps))
+	if (TEST_BIT(cap, forced_caps))
 		printk("%pS clearing previously forced feature %#x\n",
 		       __builtin_return_address(0), cap);
=20
@@ -94,10 +94,10 @@ void __init setup_clear_cpu_cap(unsigned int cap)
=20
 void __init setup_force_cpu_cap(unsigned int cap)
 {
-	if (__test_and_set_bit(cap, forced_caps))
+	if (TEST_AND_SET_BIT(cap, forced_caps))
 		return;
=20
-	if (test_bit(cap, cleared_caps)) {
+	if (TEST_BIT(cap, cleared_caps)) {
 		printk("%pS tries to force previously cleared feature %#x\n",
 		       __builtin_return_address(0), cap);
 		return;
@@ -108,7 +108,7 @@ void __init setup_force_cpu_cap(unsigned int cap)
=20
 bool __init is_forced_cpu_cap(unsigned int cap)
 {
-	return test_bit(cap, forced_caps);
+	return TEST_BIT(cap, forced_caps);
 }
=20
 static void cf_check default_init(struct cpuinfo_x86 * c)
@@ -411,7 +411,7 @@ void __init early_cpu_init(bool verbose)
 			    &c->x86_capability[FEATURESET_7c0],
 			    &c->x86_capability[FEATURESET_7d0]);
=20
-		if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
+		if (TEST_BIT(X86_FEATURE_ARCH_CAPS, c->x86_capability))
 			rdmsr(MSR_ARCH_CAPABILITIES,
 			      c->x86_capability[FEATURESET_m10Al],
 			      c->x86_capability[FEATURESET_m10Ah]);
@@ -558,7 +558,7 @@ static void generic_identify(struct cpuinfo_x86 *c)
 			    &c->x86_capability[FEATURESET_Da1],
 			    &tmp, &tmp, &tmp);
=20
-	if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
+	if (TEST_BIT(X86_FEATURE_ARCH_CAPS, c->x86_capability))
 		rdmsr(MSR_ARCH_CAPABILITIES,
 		      c->x86_capability[FEATURESET_m10Al],
 		      c->x86_capability[FEATURESET_m10Ah]);
diff --git a/xen/arch/x86/cpu/mcheck/x86_mca.h b/xen/arch/x86/cpu/mcheck/x8=
6_mca.h
index 18116737af..f0d8ff565a 100644
--- a/xen/arch/x86/cpu/mcheck/x86_mca.h
+++ b/xen/arch/x86/cpu/mcheck/x86_mca.h
@@ -110,7 +110,7 @@ static inline int mcabanks_test(int bit, struct mca_ban=
ks* banks)
 {
     if (!banks || !banks->bank_map || bit >=3D banks->num)
         return 0;
-    return test_bit(bit, banks->bank_map);
+    return TEST_BIT(bit, banks->bank_map);
 }
=20
 struct mca_banks *mcabanks_alloc(unsigned int nr);
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 56c3816187..0736229760 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1377,7 +1377,7 @@ int arch_set_info_guest(
          */
         if ( d !=3D current->domain && !VM_ASSIST(d, m2p_strict) &&
              is_pv_64bit_domain(d) &&
-             test_bit(VMASST_TYPE_m2p_strict, &c.nat->vm_assist) &&
+             TEST_BIT(VMASST_TYPE_m2p_strict, &c.nat->vm_assist) &&
              atomic_read(&d->arch.pv.nr_l4_pages) )
         {
             bool done =3D false;
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index ca577c0bde..036b6f10dc 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -449,7 +449,7 @@ static uint64_t __init mtrr_top_of_ram(void)
         printk(" MTRR cap: %"PRIx64" type: %"PRIx64"\n", mtrr_cap, mtrr_de=
f);
=20
     /* MTRRs enabled, and default memory type is not writeback? */
-    if ( !test_bit(11, &mtrr_def) || ((uint8_t)mtrr_def =3D=3D X86_MT_WB) =
)
+    if ( !TEST_BIT(11, &mtrr_def) || ((uint8_t)mtrr_def =3D=3D X86_MT_WB) =
)
         return 0;
=20
     /*
@@ -466,7 +466,7 @@ static uint64_t __init mtrr_top_of_ram(void)
             printk(" MTRR[%d]: base %"PRIx64" mask %"PRIx64"\n",
                    i, base, mask);
=20
-        if ( !test_bit(11, &mask) || ((uint8_t)base !=3D X86_MT_WB) )
+        if ( !TEST_BIT(11, &mask) || ((uint8_t)base !=3D X86_MT_WB) )
             continue;
         base &=3D addr_mask;
         mask &=3D addr_mask;
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 5c9f393c75..44481bb039 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -135,7 +135,7 @@ static int map_vcpuinfo(void)
         return 0;
     }
=20
-    if ( test_bit(vcpu, vcpu_info_mapped) )
+    if ( TEST_BIT(vcpu, vcpu_info_mapped) )
     {
         this_cpu(vcpu_info) =3D &vcpu_info[vcpu];
         return 0;
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 19e809de66..584fcd1405 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -3040,7 +3040,7 @@ struct segment_register *hvmemul_get_seg_reg(
     if ( idx >=3D ARRAY_SIZE(hvmemul_ctxt->seg_reg) )
         return ERR_PTR(-X86EMUL_UNHANDLEABLE);
=20
-    if ( !__test_and_set_bit(idx, &hvmemul_ctxt->seg_reg_accessed) )
+    if ( !TEST_AND_SET_BIT(idx, &hvmemul_ctxt->seg_reg_accessed) )
         hvm_get_segment_register(current, idx, &hvmemul_ctxt->seg_reg[idx]=
);
     return &hvmemul_ctxt->seg_reg[idx];
 }
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index f0e5f877f4..dc0cd33d1e 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -213,7 +213,7 @@ static void cf_check hpet_timer_fired(struct vcpu *v, v=
oid *data)
     HPETState *h =3D vcpu_vhpet(v);
=20
     write_lock(&h->lock);
-    if ( __test_and_set_bit(tn, &h->hpet.isr) )
+    if ( TEST_AND_SET_BIT(tn, &h->hpet.isr) )
         ASSERT_UNREACHABLE();
     write_unlock(&h->lock);
 }
@@ -241,7 +241,7 @@ static void hpet_set_timer(HPETState *h, unsigned int t=
n,
     }
=20
     if ( !timer_enabled(h, tn) ||
-         (timer_level(h, tn) && test_bit(tn, &h->hpet.isr)) )
+         (timer_level(h, tn) && TEST_BIT(tn, &h->hpet.isr)) )
         return;
=20
     if ( !timer_int_route_valid(h, tn) )
@@ -414,7 +414,7 @@ static int cf_check hpet_write(
             if ( i >=3D HPET_TIMER_NUM )
                 break;
             __clear_bit(i, &new_val);
-            active =3D __test_and_clear_bit(i, &h->hpet.isr);
+            active =3D TEST_AND_CLEAR_BIT(i, &h->hpet.isr);
             if ( active )
             {
                 hvm_ioapic_deassert(v->domain, timer_int_route(h, i));
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 5f64361113..4451ec85d4 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -95,7 +95,7 @@ static void __hvm_pci_intx_assert(
=20
     ASSERT((device <=3D 31) && (intx <=3D 3));
=20
-    if ( __test_and_set_bit(device*4 + intx, &hvm_irq->pci_intx.i) )
+    if ( TEST_AND_SET_BIT(device*4 + intx, &hvm_irq->pci_intx.i) )
         return;
=20
     gsi =3D hvm_pci_intx_gsi(device, intx);
@@ -130,7 +130,7 @@ static void __hvm_pci_intx_deassert(
=20
     ASSERT((device <=3D 31) && (intx <=3D 3));
=20
-    if ( !__test_and_clear_bit(device*4 + intx, &hvm_irq->pci_intx.i) )
+    if ( !TEST_AND_CLEAR_BIT(device*4 + intx, &hvm_irq->pci_intx.i) )
         return;
=20
     gsi =3D hvm_pci_intx_gsi(device, intx);
@@ -213,7 +213,7 @@ int hvm_isa_irq_assert(struct domain *d, unsigned int i=
sa_irq,
=20
     spin_lock(&d->arch.hvm.irq_lock);
=20
-    if ( !__test_and_set_bit(isa_irq, &hvm_irq->isa_irq.i) &&
+    if ( !TEST_AND_SET_BIT(isa_irq, &hvm_irq->isa_irq.i) &&
          (hvm_irq->gsi_assert_count[gsi]++ =3D=3D 0) )
         assert_irq(d, gsi, isa_irq);
=20
@@ -235,7 +235,7 @@ void hvm_isa_irq_deassert(
=20
     spin_lock(&d->arch.hvm.irq_lock);
=20
-    if ( __test_and_clear_bit(isa_irq, &hvm_irq->isa_irq.i) &&
+    if ( TEST_AND_CLEAR_BIT(isa_irq, &hvm_irq->isa_irq.i) &&
          (--hvm_irq->gsi_assert_count[gsi] =3D=3D 0) )
         deassert_irq(d, isa_irq);
=20
@@ -720,7 +720,7 @@ static int cf_check irq_load_pci(struct domain *d, hvm_=
domain_context_t *h)
     /* Recalculate the counts from the IRQ line state */
     for ( dev =3D 0; dev < 32; dev++ )
         for ( intx =3D 0; intx < 4; intx++ )
-            if ( test_bit(dev*4 + intx, &hvm_irq->pci_intx.i) )
+            if ( TEST_BIT(dev*4 + intx, &hvm_irq->pci_intx.i) )
             {
                 /* Direct GSI assert */
                 gsi =3D hvm_pci_intx_gsi(dev, intx);
@@ -745,7 +745,7 @@ static int cf_check irq_load_isa(struct domain *d, hvm_=
domain_context_t *h)
     /* Adjust the GSI assert counts for the ISA IRQ line state.
      * This relies on the PCI IRQ state being loaded first. */
     for ( irq =3D 0; platform_legacy_irq(irq); irq++ )
-        if ( test_bit(irq, &hvm_irq->isa_irq.i) )
+        if ( TEST_BIT(irq, &hvm_irq->isa_irq.i) )
             hvm_irq->gsi_assert_count[hvm_isa_irq_to_gsi(irq)]++;
=20
     return 0;
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nested=
svm.c
index dc2b6a4253..e2ca118606 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -376,8 +376,8 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, boo=
l viopm)
     ns_viomap =3D hvm_map_guest_frame_ro(svm->ns_iomap_pa >> PAGE_SHIFT, 0=
);
     if ( ns_viomap )
     {
-        ioport_80 =3D test_bit(0x80, ns_viomap);
-        ioport_ed =3D test_bit(0xed, ns_viomap);
+        ioport_80 =3D TEST_BIT(0x80, ns_viomap);
+        ioport_ed =3D TEST_BIT(0xed, ns_viomap);
         hvm_unmap_guest_frame(ns_viomap, 0);
     }
=20
@@ -866,10 +866,10 @@ nsvm_vmcb_guest_intercepts_msr(unsigned long *msr_bit=
map,
=20
     if ( write )
         /* write access */
-        enabled =3D test_bit(msr * 2 + 1, msr_bit);
+        enabled =3D TEST_BIT(msr * 2 + 1, msr_bit);
     else
         /* read access */
-        enabled =3D test_bit(msr * 2, msr_bit);
+        enabled =3D TEST_BIT(msr * 2, msr_bit);
=20
     if ( !enabled )
         return NESTEDHVM_VMEXIT_HOST;
@@ -906,7 +906,7 @@ nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, uint64=
_t exitinfo1)
=20
     for ( io_bitmap =3D hvm_map_guest_frame_ro(gfn, 0); ; )
     {
-        enabled =3D io_bitmap && test_bit(port, io_bitmap);
+        enabled =3D io_bitmap && TEST_BIT(port, io_bitmap);
         if ( !enabled || !--size )
             break;
         if ( unlikely(++port =3D=3D 8 * PAGE_SIZE) )
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index db1799bb43..14b7785961 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1078,7 +1078,7 @@ static void svm_host_osvw_init(void)
      * choose the worst case (i.e. if erratum is present on one processor =
and
      * not on another assume that the erratum is present everywhere).
      */
-    if ( test_bit(X86_FEATURE_OSVW, &boot_cpu_data.x86_capability) )
+    if ( TEST_BIT(X86_FEATURE_OSVW, &boot_cpu_data.x86_capability) )
     {
         uint64_t len, status;
=20
diff --git a/xen/arch/x86/hvm/viridian/time.c b/xen/arch/x86/hvm/viridian/t=
ime.c
index 137577384f..3cacac5f7b 100644
--- a/xen/arch/x86/hvm/viridian/time.c
+++ b/xen/arch/x86/hvm/viridian/time.c
@@ -225,7 +225,7 @@ static void poll_stimer(struct vcpu *v, unsigned int st=
imerx)
         return;
     }
=20
-    if ( !test_bit(stimerx, &vv->stimer_pending) )
+    if ( !TEST_BIT(stimerx, &vv->stimer_pending) )
         return;
=20
     if ( !viridian_synic_deliver_timer_msg(v, vs->config.sintx,
@@ -462,7 +462,7 @@ int viridian_time_rdmsr(const struct vcpu *v, uint32_t =
idx, uint64_t *val)
          * If the timer is single-shot and it has expired, make sure
          * the enabled flag is clear.
          */
-        if ( !config.periodic && test_bit(stimerx, &vv->stimer_pending) )
+        if ( !config.periodic && TEST_BIT(stimerx, &vv->stimer_pending) )
             config.enable =3D 0;
=20
         *val =3D config.as_uint64;
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 993e972cd7..51b0d7ea94 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -684,7 +684,7 @@ int guest_rdmsr_x2apic(const struct vcpu *v, uint32_t m=
sr, uint64_t *val)
         return X86EMUL_EXCEPTION;
=20
     reg =3D array_index_nospec(reg, sizeof(readable) * 8);
-    if ( !test_bit(reg, readable) )
+    if ( !TEST_BIT(reg, readable) )
         return X86EMUL_EXCEPTION;
=20
     offset =3D reg << 4;
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index ab8b1c87ec..b51d36dca4 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -736,7 +736,7 @@ static int _vmx_cpu_up(bool bsp)
     {
         eax  =3D IA32_FEATURE_CONTROL_LOCK;
         eax |=3D IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
-        if ( test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) )
+        if ( TEST_BIT(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) )
             eax |=3D IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX;
         wrmsr(MSR_IA32_FEATURE_CONTROL, eax, 0);
     }
@@ -774,7 +774,7 @@ static int _vmx_cpu_up(bool bsp)
=20
  vmxon_fault:
     if ( bios_locked &&
-         test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) &&
+         TEST_BIT(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) &&
          (!(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX) ||
           !(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX)) )
     {
@@ -976,10 +976,10 @@ bool vmx_msr_is_intercepted(struct vmx_msr_bitmap *ms=
r_bitmap,
                             unsigned int msr, bool is_write)
 {
     if ( msr <=3D 0x1fff )
-        return test_bit(msr, is_write ? msr_bitmap->write_low
+        return TEST_BIT(msr, is_write ? msr_bitmap->write_low
                                       : msr_bitmap->read_low);
     else if ( (msr >=3D 0xc0000000U) && (msr <=3D 0xc0001fffU) )
-        return test_bit(msr & 0x1fff, is_write ? msr_bitmap->write_high
+        return TEST_BIT(msr & 0x1fff, is_write ? msr_bitmap->write_high
                                                : msr_bitmap->read_high);
     else
         /* MSRs outside the bitmap ranges are always intercepted. */
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ce538668c7..951e28f84a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -132,7 +132,7 @@ static void vmx_pi_switch_from(struct vcpu *v)
 {
     struct pi_desc *pi_desc =3D &v->arch.hvm.vmx.pi_desc;
=20
-    if ( test_bit(_VPF_blocked, &v->pause_flags) )
+    if ( TEST_BIT(_VPF_blocked, &v->pause_flags) )
         return;
=20
     pi_set_sn(pi_desc);
@@ -189,7 +189,7 @@ static void vmx_pi_unblock_vcpu(struct vcpu *v)
=20
 static void vmx_pi_do_resume(struct vcpu *v)
 {
-    ASSERT(!test_bit(_VPF_blocked, &v->pause_flags));
+    ASSERT(!TEST_BIT(_VPF_blocked, &v->pause_flags));
=20
     vmx_pi_unblock_vcpu(v);
 }
diff --git a/xen/arch/x86/include/asm/guest_atomics.h b/xen/arch/x86/includ=
e/asm/guest_atomics.h
index c2dec0d650..f901150204 100644
--- a/xen/arch/x86/include/asm/guest_atomics.h
+++ b/xen/arch/x86/include/asm/guest_atomics.h
@@ -10,7 +10,7 @@
 #define guest_set_bit(d, nr, p)     ((void)(d), set_bit(nr, p))
 #define guest_clear_bit(d, nr, p)   ((void)(d), clear_bit(nr, p))
 #define guest_change_bit(d, nr, p)  ((void)(d), change_bit(nr, p))
-#define guest_test_bit(d, nr, p)    ((void)(d), test_bit(nr, p))
+#define guest_test_bit(d, nr, p)    ((void)(d), TEST_BIT(nr, p))
=20
 #define guest_test_and_set_bit(d, nr, p)    \
     ((void)(d), test_and_set_bit(nr, p))
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/a=
sm/hvm/vlapic.h
index c388551198..1eb777d694 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -52,7 +52,7 @@
 #define VEC_POS(v) ((v) % 32)
 #define REG_POS(v) (((v) / 32) * 0x10)
 #define vlapic_test_vector(vec, bitmap)                                 \
-    test_bit(VEC_POS(vec), (const uint32_t *)((bitmap) + REG_POS(vec)))
+    TEST_BIT(VEC_POS(vec), (const uint32_t *)((bitmap) + REG_POS(vec)))
 #define vlapic_test_and_set_vector(vec, bitmap)                         \
     test_and_set_bit(VEC_POS(vec), (uint32_t *)((bitmap) + REG_POS(vec)))
 #define vlapic_test_and_clear_vector(vec, bitmap)                       \
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/=
asm/hvm/vmx/vmx.h
index da04752e17..0803ef8e06 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -91,7 +91,7 @@ static inline int pi_test_and_set_pir(uint8_t vector, str=
uct pi_desc *pi_desc)
=20
 static inline int pi_test_pir(uint8_t vector, const struct pi_desc *pi_des=
c)
 {
-    return test_bit(vector, pi_desc->pir);
+    return TEST_BIT(vector, pi_desc->pir);
 }
=20
 static inline int pi_test_and_set_on(struct pi_desc *pi_desc)
diff --git a/xen/arch/x86/include/asm/mpspec.h b/xen/arch/x86/include/asm/m=
pspec.h
index 4781c253fa..d45fa1f2a6 100644
--- a/xen/arch/x86/include/asm/mpspec.h
+++ b/xen/arch/x86/include/asm/mpspec.h
@@ -44,7 +44,7 @@ typedef struct physid_mask physid_mask_t;
=20
 #define physid_set(physid, map)			set_bit(physid, (map).mask)
 #define physid_clear(physid, map)		clear_bit(physid, (map).mask)
-#define physid_isset(physid, map)		test_bit(physid, (map).mask)
+#define physid_isset(physid, map)		TEST_BIT(physid, (map).mask)
 #define physid_test_and_set(physid, map)	test_and_set_bit(physid, (map).ma=
sk)
=20
 #define first_physid(map)			find_first_bit((map).mask, \
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index e70c7829b4..9c15846fd5 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -121,7 +121,7 @@ static void release_old_vec(struct irq_desc *desc)
         ASSERT_UNREACHABLE();
     else if ( desc->arch.used_vectors )
     {
-        ASSERT(test_bit(vector, desc->arch.used_vectors));
+        ASSERT(TEST_BIT(vector, desc->arch.used_vectors));
         clear_bit(vector, desc->arch.used_vectors);
     }
 }
@@ -172,7 +172,7 @@ static int __init _bind_irq_vector(struct irq_desc *des=
c, int vector,
     cpumask_copy(desc->arch.cpu_mask, &online_mask);
     if ( desc->arch.used_vectors )
     {
-        ASSERT(!test_bit(vector, desc->arch.used_vectors));
+        ASSERT(!TEST_BIT(vector, desc->arch.used_vectors));
         set_bit(vector, desc->arch.used_vectors);
     }
     desc->arch.used =3D IRQ_USED;
@@ -218,7 +218,7 @@ static void _clear_irq_vector(struct irq_desc *desc)
=20
     if ( desc->arch.used_vectors )
     {
-        ASSERT(test_bit(vector, desc->arch.used_vectors));
+        ASSERT(TEST_BIT(vector, desc->arch.used_vectors));
         clear_bit(vector, desc->arch.used_vectors);
     }
=20
@@ -499,7 +499,7 @@ static vmask_t *irq_get_used_vector_mask(int irq)
                 printk(XENLOG_INFO "IRQ%d already assigned vector %02x\n",
                        irq, vector);
                =20
-                ASSERT(!test_bit(vector, ret));
+                ASSERT(!TEST_BIT(vector, ret));
=20
                 set_bit(vector, ret);
             }
@@ -587,7 +587,7 @@ static int _assign_irq_vector(struct irq_desc *desc, co=
nst cpumask_t *mask)
             desc->arch.move_cleanup_count =3D 0;
             if ( desc->arch.used_vectors )
             {
-                ASSERT(test_bit(old_vector, desc->arch.used_vectors));
+                ASSERT(TEST_BIT(old_vector, desc->arch.used_vectors));
                 clear_bit(old_vector, desc->arch.used_vectors);
             }
=20
@@ -637,11 +637,11 @@ next:
         if (unlikely(current_vector =3D=3D vector))
             continue;
=20
-        if (test_bit(vector, used_vectors))
+        if (TEST_BIT(vector, used_vectors))
             goto next;
=20
         if (irq_used_vectors
-            && test_bit(vector, irq_used_vectors) )
+            && TEST_BIT(vector, irq_used_vectors) )
             goto next;
=20
         if ( cpumask_test_cpu(0, vec_mask) &&
@@ -696,7 +696,7 @@ next:
=20
         if ( desc->arch.used_vectors )
         {
-            ASSERT(!test_bit(vector, desc->arch.used_vectors));
+            ASSERT(!TEST_BIT(vector, desc->arch.used_vectors));
=20
             set_bit(vector, desc->arch.used_vectors);
         }
@@ -2267,7 +2267,7 @@ int map_domain_pirq(
                 {
                     int vector =3D desc->arch.vector;
=20
-                    ASSERT(!test_bit(vector, desc->arch.used_vectors));
+                    ASSERT(!teTEST_BITector, desc->arch.used_vectors));
                     set_bit(vector, desc->arch.used_vectors);
                 }
             }
@@ -2329,12 +2329,12 @@ int map_domain_pirq(
             }
             while ( nr )
             {
-                if ( irq >=3D 0 && test_bit(nr, granted) &&
+                if ( irq >=3D 0 && teTEST_BITr, granted) &&
                      irq_deny_access(d, irq) )
                     printk(XENLOG_G_ERR
                            "dom%d: could not revoke access to IRQ%d (pirq =
%d)\n",
                            d->domain_id, irq, pirq);
-                if ( info && test_bit(nr, prepared) )
+                if ( info && teTEST_BITr, prepared) )
                     cleanup_domain_irq_pirq(d, irq, info);
                 info =3D pirq_info(d, pirq + --nr);
                 irq =3D info->arch.irq;
@@ -2358,10 +2358,10 @@ int map_domain_pirq(
 done:
     if ( ret )
     {
-        if ( test_bit(0, prepared) )
+        if ( teTEST_BIT, prepared) )
             cleanup_domain_irq_pirq(d, irq, info);
  revoke:
-        if ( test_bit(0, granted) && irq_deny_access(d, irq) )
+        if ( teTEST_BIT, granted) && irq_deny_access(d, irq) )
             printk(XENLOG_G_ERR
                    "dom%d: could not revoke access to IRQ%d (pirq %d)\n",
                    d->domain_id, irq, pirq);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e7fd56c7ce..5b37505691 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -935,7 +935,7 @@ get_page_from_l1e(
=20
             if ( !pci_mmcfg_decode(mfn, &seg, &bdf) ||
                  ((ro_map =3D pci_get_ro_map(seg)) !=3D NULL &&
-                  test_bit(bdf, ro_map)) )
+                  TEST_BIT(bdf, ro_map)) )
                 printk(XENLOG_G_WARNING
                        "d%d: Forcing read-only access to MFN %lx\n",
                        l1e_owner->domain_id, mfn);
@@ -2504,7 +2504,7 @@ static int cleanup_page_mappings(struct page_info *pa=
ge)
      * mappings of this page.  This forces the page to be coherent before =
it
      * is freed back to the heap.
      */
-    if ( __test_and_clear_bit(_PGT_non_coherent, &page->u.inuse.type_info)=
 )
+    if ( TEST_AND_CLEAR_BIT(_PGT_non_coherent, &page->u.inuse.type_info) )
     {
         void *addr =3D __map_domain_page(page);
=20
@@ -4960,7 +4960,7 @@ static int __init subpage_mmio_ro_add_page(
=20
     for ( i =3D offset_s; i <=3D offset_e; i +=3D MMIO_RO_SUBPAGE_GRAN )
     {
-        bool oldbit =3D __test_and_set_bit(i / MMIO_RO_SUBPAGE_GRAN,
+        bool oldbit =3D TEST_AND_SET_BIT(i / MMIO_RO_SUBPAGE_GRAN,
                                          entry->ro_elems);
         ASSERT(!oldbit);
     }
@@ -5115,7 +5115,7 @@ void subpage_mmio_write_emulate(
         /* Do not print message for pages without any writable parts. */
         return;
=20
-    if ( test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
+    if ( TEST_BIT(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
     {
  write_ignored:
         gprintk(XENLOG_WARNING,
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index ec5043a8aa..ca9a319bd6 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -717,7 +717,7 @@ static pagetable_t cf_check hap_update_cr3(struct vcpu =
*v, bool noflush)
=20
 static bool flush_vcpu(const struct vcpu *v, const unsigned long *vcpu_bit=
map)
 {
-    return !vcpu_bitmap || test_bit(v->vcpu_id, vcpu_bitmap);
+    return !vcpu_bitmap || TEST_BIT(v->vcpu_id, vcpu_bitmap);
 }
=20
 /* Flush TLB of selected vCPUs.  NULL for all. */
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index c77f4c1dac..73e24148b4 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -311,7 +311,7 @@ void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
         goto out;
=20
     l1 =3D map_domain_page(mfn);
-    changed =3D !__test_and_set_bit(i1, l1);
+    changed =3D !TEST_AND_SET_BIT(i1, l1);
     unmap_domain_page(l1);
     if ( changed )
     {
@@ -383,7 +383,7 @@ bool paging_mfn_is_dirty(const struct domain *d, mfn_t =
gmfn)
         return false;
=20
     l1 =3D map_domain_page(mfn);
-    dirty =3D test_bit(L1_LOGDIRTY_IDX(pfn), l1);
+    dirty =3D TEST_BIT(L1_LOGDIRTY_IDX(pfn), l1);
     unmap_domain_page(l1);
=20
     return dirty;
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/commo=
n.c
index 0176e33bc9..0691ffbca2 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -755,7 +755,7 @@ void shadow_demote(struct domain *d, mfn_t gmfn, u32 ty=
pe)
 {
     struct page_info *page =3D mfn_to_page(gmfn);
=20
-    ASSERT(test_bit(_PGC_shadowed_pt, &page->count_info));
+    ASSERT(TEST_BIT(_PGC_shadowed_pt, &page->count_info));
     ASSERT(page->shadow_flags & (1u << type));
=20
     page->shadow_flags &=3D ~(1u << type);
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 114957a3e1..d8ba46bbfa 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -53,7 +53,7 @@ static struct segment_register *hvm_get_seg_reg(
         return ERR_PTR(-X86EMUL_UNHANDLEABLE);
=20
     seg_reg =3D &sh_ctxt->seg_reg[idx];
-    if ( !__test_and_set_bit(idx, &sh_ctxt->valid_seg_regs) )
+    if ( !TEST_AND_SET_BIT(idx, &sh_ctxt->valid_seg_regs) )
         hvm_get_segment_register(current, idx, seg_reg);
     return seg_reg;
 }
@@ -696,7 +696,7 @@ static void sh_emulate_unmap_dest(struct vcpu *v, void =
*addr,
=20
 static bool flush_vcpu(const struct vcpu *v, const unsigned long *vcpu_bit=
map)
 {
-    return !vcpu_bitmap || test_bit(v->vcpu_id, vcpu_bitmap);
+    return !vcpu_bitmap || TEST_BIT(v->vcpu_id, vcpu_bitmap);
 }
=20
 /* Flush TLB of selected vCPUs.  NULL for all. */
diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
index dc336c239a..26466eced1 100644
--- a/xen/arch/x86/monitor.c
+++ b/xen/arch/x86/monitor.c
@@ -122,7 +122,7 @@ bool monitored_msr(const struct domain *d, u32 msr)
     if ( !bitmap )
         return false;
=20
-    return test_bit(msr, bitmap);
+    return TEST_BIT(msr, bitmap);
 }
=20
 bool monitored_msr_onchangeonly(const struct domain *d, u32 msr)
@@ -137,7 +137,7 @@ bool monitored_msr_onchangeonly(const struct domain *d,=
 u32 msr)
     if ( !bitmap )
         return false;
=20
-    return test_bit(msr + sizeof(struct monitor_msr_bitmap) * 8, bitmap);
+    return TEST_BIT(msr + sizeof(struct monitor_msr_bitmap) * 8, bitmap);
 }
=20
 int arch_monitor_domctl_event(struct domain *d,
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 5389bc0867..2d0ef3fb35 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -53,7 +53,7 @@ static int msix_fixmap_alloc(void)
=20
     spin_lock(&msix_fixmap_lock);
     for ( i =3D 0; i < FIX_MSIX_MAX_PAGES; i++ )
-        if ( !test_bit(i, &msix_fixmap_pages) )
+        if ( !TEST_BIT(i, &msix_fixmap_pages) )
             break;
     if ( i =3D=3D FIX_MSIX_MAX_PAGES )
         goto out;
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 499d320e61..e229e53143 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -796,7 +796,7 @@ void psr_ctxt_switch_to(struct domain *d)
         struct psr_socket_info *info =3D socket_info + socket;
         unsigned int cos =3D 0;
=20
-        if ( likely(test_bit(d->domain_id, info->dom_set)) &&
+        if ( likely(TEST_BIT(d->domain_id, info->dom_set)) &&
              d->arch.psr_cos_ids )
             cos =3D d->arch.psr_cos_ids[socket];
=20
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index c37bea9454..73f4ebc593 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -496,7 +496,7 @@ static int __init dom0_construct(const struct boot_doma=
in *bd)
=20
     if ( parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type !=3D XEN_ENT=
_NONE )
     {
-        if ( !pv_shim && !test_bit(XENFEAT_dom0, parms.f_supported) )
+        if ( !pv_shim && !TEST_BIT(XENFEAT_dom0, parms.f_supported) )
         {
             printk("Kernel does not support Dom0 operation\n");
             return -EINVAL;
@@ -1028,7 +1028,7 @@ static int __init dom0_construct(const struct boot_do=
main *bd)
      */
     pv_destroy_gdt(v);
=20
-    if ( test_bit(XENFEAT_supervisor_mode_kernel, parms.f_required) )
+    if ( TEST_BIT(XENFEAT_supervisor_mode_kernel, parms.f_required) )
         panic("Dom0 requires supervisor-mode execution\n");
=20
     rc =3D dom0_setup_permissions(d);
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.=
c
index f3f012f8fb..c559b25a30 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -237,7 +237,7 @@ static bool pci_cfg_ok(struct domain *currd, unsigned i=
nt start,
     {
         const unsigned long *ro_map =3D pci_get_ro_map(0);
=20
-        if ( ro_map && test_bit(machine_bdf, ro_map) )
+        if ( ro_map && TEST_BIT(machine_bdf, ro_map) )
             return false;
     }
     start |=3D CF8_ADDR_LO(currd->arch.pci_cf8);
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index bc2a7dd5fa..0af34bb07e 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -398,7 +398,7 @@ int pv_shim_shutdown(uint8_t reason)
         /* Stop the singleshot timer. */
         stop_timer(&v->singleshot_timer);
=20
-        if ( test_bit(_VPF_down, &v->pause_flags) )
+        if ( TEST_BIT(_VPF_down, &v->pause_flags) )
             BUG_ON(vcpu_reset(v));
=20
         if ( v !=3D current )
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 34dc077cad..a6060ebe33 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -626,7 +626,7 @@ void vcpu_show_execution_state(struct vcpu *v)
 {
     unsigned long flags =3D 0;
=20
-    if ( test_bit(_VPF_down, &v->pause_flags) )
+    if ( TEST_BIT(_VPF_down, &v->pause_flags) )
     {
         printk("*** %pv is offline ***\n", v);
         return;
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index d4e6a9c0a2..e2c462d11a 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -835,7 +835,7 @@ static int extend_frame_table(struct mem_hotadd_info *i=
nfo)
     ASSERT( mfn_to_pdx(epfn) <=3D (DIRECTMAP_SIZE >> PAGE_SHIFT) &&
             mfn_to_pdx(epfn) <=3D FRAMETABLE_NR );
=20
-    if ( test_bit(cidx, pdx_group_valid) )
+    if ( TEST_BIT(cidx, pdx_group_valid) )
         cidx =3D find_next_zero_bit(pdx_group_valid, eidx, cidx);
=20
     if ( cidx >=3D eidx )
diff --git a/xen/arch/x86/x86_64/mmconfig_64.c b/xen/arch/x86/x86_64/mmconf=
ig_64.c
index ffdc62700d..6bcb00890a 100644
--- a/xen/arch/x86/x86_64/mmconfig_64.c
+++ b/xen/arch/x86/x86_64/mmconfig_64.c
@@ -202,7 +202,7 @@ bool pci_ro_mmcfg_decode(unsigned long mfn, unsigned in=
t *seg, unsigned int *bdf
=20
     return pci_mmcfg_decode(mfn, seg, bdf) &&
            ((ro_map =3D pci_get_ro_map(*seg)) =3D=3D NULL ||
-             !test_bit(*bdf, ro_map));
+             !TEST_BIT(*bdf, ro_map));
 }
=20
 int __init pci_mmcfg_arch_init(void)
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index e8e218caed..433be12e6e 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -128,7 +128,7 @@ static int setup_xstate_features(bool bsp)
                         &ebx, &ecx, &edx);
             BUG_ON(eax !=3D xstate_sizes[leaf]);
             BUG_ON(ebx !=3D xstate_offsets[leaf]);
-            BUG_ON(!(ecx & XSTATE_ALIGN64) !=3D !test_bit(leaf, &xstate_al=
ign));
+            BUG_ON(!(ecx & XSTATE_ALIGN64) !=3D !TEST_BIT(leaf, &xstate_al=
ign));
         }
     }
=20
@@ -156,7 +156,7 @@ static void setup_xstate_comp(uint16_t *comp_offsets,
     {
         if ( (1UL << i) & xcomp_bv )
         {
-            if ( test_bit(i, &xstate_align) )
+            if ( TEST_BIT(i, &xstate_align) )
                 offset =3D ROUNDUP(offset, 64);
             comp_offsets[i] =3D offset;
             offset +=3D xstate_sizes[i];
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 303c338ef2..1821864f91 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2082,7 +2082,7 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUES=
T_HANDLE_PARAM(void) arg)
=20
     case VCPUOP_down:
         for_each_vcpu ( d, v )
-            if ( v->vcpu_id !=3D vcpuid && !test_bit(_VPF_down, &v->pause_=
flags) )
+            if ( v->vcpu_id !=3D vcpuid && !TEST_BIT(_VPF_down, &v->pause_=
flags) )
             {
                rc =3D 1;
                break;
@@ -2272,7 +2272,7 @@ long do_vm_assist(unsigned int cmd, unsigned int type=
)
     struct domain *currd =3D current->domain;
     const unsigned long valid =3D arch_vm_assist_valid_mask(currd);
=20
-    if ( type >=3D BITS_PER_LONG || !test_bit(type, &valid) )
+    if ( type >=3D BITS_PER_LONG || !TEST_BIT(type, &valid) )
         return -EINVAL;
=20
     switch ( cmd )
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 7e1fce291d..bbc599da7f 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -76,7 +76,7 @@ const struct efi_pci_rom *__read_mostly efi_pci_roms;
=20
 bool efi_enabled(unsigned int feature)
 {
-    return test_bit(feature, &efi_flags);
+    return TEST_BIT(feature, &efi_flags);
 }
=20
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */
diff --git a/xen/common/event_2l.c b/xen/common/event_2l.c
index d40dd51ab5..addf39ad3a 100644
--- a/xen/common/event_2l.c
+++ b/xen/common/event_2l.c
@@ -94,7 +94,7 @@ static void cf_check evtchn_2l_print_state(
 {
     struct vcpu *v =3D d->vcpu[evtchn->notify_vcpu_id];
=20
-    printk("%d", !!test_bit(evtchn->port / BITS_PER_EVTCHN_WORD(d),
+    printk("%d", !!TEST_BIT(evtchn->port / BITS_PER_EVTCHN_WORD(d),
                             &vcpu_info(v, evtchn_pending_sel)));
 }
=20
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 84fe8c3597..4044069f10 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -379,8 +379,8 @@ void kexec_crash(enum crash_reason reason)
=20
     keyhandler_crash_action(reason);
=20
-    pos =3D (test_bit(KEXEC_FLAG_CRASH_POS, &kexec_flags) !=3D 0);
-    if ( !test_bit(KEXEC_IMAGE_CRASH_BASE + pos, &kexec_flags) )
+    pos =3D (TEST_BIT(KEXEC_FLAG_CRASH_POS, &kexec_flags) !=3D 0);
+    if ( !TEST_BIT(KEXEC_IMAGE_CRASH_BASE + pos, &kexec_flags) )
         return;
=20
     kexecing =3D true;
@@ -829,10 +829,10 @@ static int kexec_exec(XEN_GUEST_HANDLE_PARAM(void) ua=
rg)
     if ( kexec_load_get_bits(exec.type, &base, &bit) )
         return -EINVAL;
=20
-    pos =3D (test_bit(bit, &kexec_flags) !=3D 0);
+    pos =3D (TEST_BIT(bit, &kexec_flags) !=3D 0);
=20
     /* Only allow kexec/kdump into loaded images */
-    if ( !test_bit(base + pos, &kexec_flags) )
+    if ( !TEST_BIT(base + pos, &kexec_flags) )
         return -ENOENT;
=20
     switch (exec.type)
@@ -857,15 +857,15 @@ static int kexec_swap_images(int type, struct kexec_i=
mage *new,
=20
     *old =3D NULL;
=20
-    if ( test_bit(KEXEC_FLAG_IN_PROGRESS, &kexec_flags) )
+    if ( TEST_BIT(KEXEC_FLAG_IN_PROGRESS, &kexec_flags) )
         return -EBUSY;
=20
     if ( kexec_load_get_bits(type, &base, &bit) )
         return -EINVAL;
=20
-    ASSERT(test_bit(KEXEC_FLAG_IN_HYPERCALL, &kexec_flags));
+    ASSERT(TEST_BIT(KEXEC_FLAG_IN_HYPERCALL, &kexec_flags));
=20
-    pos =3D (test_bit(bit, &kexec_flags) !=3D 0);
+    pos =3D (TEST_BIT(bit, &kexec_flags) !=3D 0);
     old_slot =3D base + pos;
     new_slot =3D base + !pos;
=20
@@ -1210,7 +1210,7 @@ static int kexec_status(XEN_GUEST_HANDLE_PARAM(void) =
uarg)
     if ( kexec_load_get_bits(status.type, &base, &bit) )
         return -EINVAL;
=20
-    return !!test_bit(bit, &kexec_flags);
+    return !!TEST_BIT(bit, &kexec_flags);
 }
=20
 static int do_kexec_op_internal(unsigned long op,
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index b0a2051408..2cd3d37323 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -303,7 +303,7 @@ static void cf_check dump_domains(unsigned char key)
                d->handle[12], d->handle[13], d->handle[14], d->handle[15],
                d->vm_assist);
         for ( i =3D 0 ; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
-            if ( test_bit(i, &d->watchdog_inuse_map) )
+            if ( TEST_BIT(i, &d->watchdog_inuse_map) )
                 printk("    watchdog %d expires in %d seconds\n",
                        i, (u32)((d->watchdog_timer[i].expires - NOW()) >> =
30));
=20
diff --git a/xen/common/multicall.c b/xen/common/multicall.c
index ce394c5efc..4169b513f8 100644
--- a/xen/common/multicall.c
+++ b/xen/common/multicall.c
@@ -42,7 +42,7 @@ ret_t do_multicall(
     int              rc =3D 0;
     enum mc_disposition disp =3D mc_continue;
=20
-    if ( unlikely(__test_and_set_bit(_MCSF_in_multicall, &mcs->flags)) )
+    if ( unlikely(TEST_AND_SET_BIT(_MCSF_in_multicall, &mcs->flags)) )
     {
         gdprintk(XENLOG_INFO, "Multicall reentry is disallowed.\n");
         return -EINVAL;
diff --git a/xen/common/numa.c b/xen/common/numa.c
index ad75955a16..6439820a52 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -184,7 +184,7 @@ bool __init numa_update_node_memblks(nodeid_t node, uns=
igned int arch_nid,
     case OVERLAP:
         if ( memblk_nodeid[i] =3D=3D node )
         {
-            bool mismatch =3D !hotplug !=3D !test_bit(i, memblk_hotplug);
+            bool mismatch =3D !hotplug !=3D !TEST_BIT(i, memblk_hotplug);
=20
             printk("%sNUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with=
 itself [%"PRIpaddr", %"PRIpaddr"]\n",
                    mismatch ? KERN_ERR : KERN_WARNING, numa_fw_nid_name,
@@ -252,7 +252,7 @@ bool __init numa_update_node_memblks(nodeid_t node, uns=
igned int arch_nid,
     {
         bool prev =3D next;
=20
-        next =3D test_bit(i, memblk_hotplug);
+        next =3D TEST_BIT(i, memblk_hotplug);
         if ( prev )
             __set_bit(i, memblk_hotplug);
         else
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index ec9dec365e..36ef07cac4 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1232,7 +1232,7 @@ static int reserve_offlined_page(struct page_info *he=
ad)
         ASSERT(total_avail_pages >=3D 0);
=20
         page_list_add_tail(cur_head,
-                           test_bit(_PGC_broken, &cur_head->count_info) ?
+                           TEST_BIT(_PGC_broken, &cur_head->count_info) ?
                            &page_broken_list : &page_offlined_list);
=20
         count++;
@@ -1377,7 +1377,7 @@ bool scrub_free_pages(void)
=20
                 for ( i =3D pg->u.free.first_dirty; i < (1U << order); i++=
)
                 {
-                    if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
+                    if ( TEST_BIT(_PGC_need_scrub, &pg[i].count_info) )
                     {
                         scrub_one_page(&pg[i], true);
                         /*
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index b8384e6189..7d78abe345 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -41,7 +41,7 @@ bool __mfn_valid(unsigned long mfn)
     if ( unlikely(evaluate_nospec(invalid)) )
         return false;
=20
-    return test_bit(pfn_to_pdx(mfn) / PDX_GROUP_COUNT, pdx_group_valid);
+    return TEST_BIT(pfn_to_pdx(mfn) / PDX_GROUP_COUNT, pdx_group_valid);
 }
=20
 void set_pdx_range(unsigned long smfn, unsigned long emfn)
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index ea95dea65a..32aa7eb4d5 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -243,7 +243,7 @@ static inline void vcpu_urgent_count_update(struct vcpu=
 *v)
     if ( unlikely(v->is_urgent) )
     {
         if ( !(v->pause_flags & VPF_blocked) ||
-             !test_bit(v->vcpu_id, v->domain->poll_mask) )
+             !TEST_BIT(v->vcpu_id, v->domain->poll_mask) )
         {
             v->is_urgent =3D 0;
             atomic_dec(&per_cpu(sched_urgent_count, v->processor));
@@ -252,7 +252,7 @@ static inline void vcpu_urgent_count_update(struct vcpu=
 *v)
     else
     {
         if ( unlikely(v->pause_flags & VPF_blocked) &&
-             unlikely(test_bit(v->vcpu_id, v->domain->poll_mask)) )
+             unlikely(TEST_BIT(v->vcpu_id, v->domain->poll_mask)) )
         {
             v->is_urgent =3D 1;
             atomic_inc(&per_cpu(sched_urgent_count, v->processor));
@@ -1109,7 +1109,7 @@ static void sched_unit_migrate_finish(struct sched_un=
it *unit)
     if ( unit->is_running )
         return;
     for_each_sched_unit_vcpu ( unit, v )
-        if ( !test_bit(_VPF_migrating, &v->pause_flags) )
+        if ( !TEST_BIT(_VPF_migrating, &v->pause_flags) )
             return;
=20
     old_cpu =3D new_cpu =3D unit->res->master_cpu;
@@ -1469,8 +1469,8 @@ static long do_poll(const struct sched_poll *sched_po=
ll)
      */
     rc =3D 0;
     if ( (v->poll_evtchn =3D=3D 0) ||
-         !test_bit(_VPF_blocked, &v->pause_flags) ||
-         !test_bit(v->vcpu_id, d->poll_mask) )
+         !TEST_BIT(_VPF_blocked, &v->pause_flags) ||
+         !TEST_BIT(v->vcpu_id, d->poll_mask) )
         goto out;
 #endif
=20
@@ -1571,7 +1571,7 @@ static long domain_watchdog(struct domain *d, uint32_=
t id, uint32_t timeout)
     }
=20
     id -=3D 1;
-    if ( !test_bit(id, &d->watchdog_inuse_map) )
+    if ( !TEST_BIT(id, &d->watchdog_inuse_map) )
     {
         spin_unlock(&d->watchdog_lock);
         return -EINVAL;
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 6dcf6b2c8b..d24606e0b1 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -298,7 +298,7 @@ __runq_insert(struct csched_unit *svc)
     /* If the unit yielded, try to put it behind one lower-priority
      * runnable unit if we can.  The next runq_sort will bring it forward
      * within 30ms if the queue too long. */
-    if ( test_bit(CSCHED_FLAG_UNIT_YIELD, &svc->flags)
+    if ( TEST_BIT(CSCHED_FLAG_UNIT_YIELD, &svc->flags)
          && __runq_elem(iter)->pri > CSCHED_PRI_IDLE
          && iter->next !=3D runq )
         iter=3Diter->next;
@@ -384,7 +384,7 @@ static inline void __runq_tickle(const struct csched_un=
it *new)
      * Try to identify the vast majority of these situations, and deal
      * with them quickly.
      */
-    if ( unlikely(test_bit(CSCHED_FLAG_UNIT_PINNED, &new->flags) &&
+    if ( unlikely(TEST_BIT(CSCHED_FLAG_UNIT_PINNED, &new->flags) &&
                   cpumask_test_cpu(cpu, &idle_mask)) )
     {
         ASSERT(cpumask_cycle(cpu, unit->cpu_hard_affinity) =3D=3D cpu);
@@ -1162,7 +1162,7 @@ csched_unit_wake(const struct scheduler *ops, struct =
sched_unit *unit)
     migrating =3D test_and_clear_bit(CSCHED_FLAG_UNIT_MIGRATING, &svc->fla=
gs);
=20
     if ( !migrating && svc->pri =3D=3D CSCHED_PRI_TS_UNDER &&
-         !test_bit(CSCHED_FLAG_UNIT_PARKED, &svc->flags) )
+         !TEST_BIT(CSCHED_FLAG_UNIT_PARKED, &svc->flags) )
     {
         TRACE_TIME(TRC_CSCHED_BOOST_START, unit->domain->domain_id, unit->=
unit_id);
         SCHED_STAT_CRANK(unit_boost);
@@ -1542,7 +1542,7 @@ static void cf_check csched_acct(void* dummy)
                 svc->pri =3D CSCHED_PRI_TS_UNDER;
=20
                 /* Unpark any capped domains whose credits go positive */
-                if ( test_bit(CSCHED_FLAG_UNIT_PARKED, &svc->flags) )
+                if ( TEST_BIT(CSCHED_FLAG_UNIT_PARKED, &svc->flags) )
                 {
                     /*
                      * It's important to unset the flag AFTER the unpause(=
)
@@ -1643,7 +1643,7 @@ csched_runq_steal(int peer_cpu, int cpu, int pri, int=
 balance_step)
          * Don't steal a UNIT which has yielded; it's waiting for a
          * reason
          */
-        if ( test_bit(CSCHED_FLAG_UNIT_YIELD, &speer->flags) )
+        if ( TEST_BIT(CSCHED_FLAG_UNIT_YIELD, &speer->flags) )
             continue;
=20
         /* Is this UNIT runnable on our PCPU? */
@@ -1912,7 +1912,7 @@ static void cf_check csched_schedule(
      * In fact, it may be the case that scurr is about to spin, and there'=
s
      * no point forcing it to do so until rate limiting expires.
      */
-    if ( !test_bit(CSCHED_FLAG_UNIT_YIELD, &scurr->flags)
+    if ( !TEST_BIT(CSCHED_FLAG_UNIT_YIELD, &scurr->flags)
          && !tasklet_work_scheduled
          && prv->ratelimit
          && unit_runnable_state(unit)
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 0b3b61df57..3c7849abde 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -2333,7 +2333,7 @@ csched2_context_saved(const struct scheduler *ops, st=
ruct sched_unit *unit)
      * it seems a bit pointless; especially as we have plenty of
      * bits free.
      */
-    if ( __test_and_clear_bit(__CSFLAG_delayed_runq_add, &svc->flags)
+    if ( TEST_AND_CLEAR_BIT(__CSFLAG_delayed_runq_add, &svc->flags)
          && likely(unit_runnable(unit)) )
     {
         ASSERT(!unit_on_runq(svc));
@@ -2399,7 +2399,7 @@ csched2_res_pick(const struct scheduler *ops, const s=
truct sched_unit *unit)
      * First check to see if we're here because someone else suggested a p=
lace
      * for us to move.
      */
-    if ( __test_and_clear_bit(__CSFLAG_runq_migrate_request, &svc->flags) =
)
+    if ( TEST_AND_CLEAR_BIT(__CSFLAG_runq_migrate_request, &svc->flags) )
     {
         if ( unlikely(svc->migrate_rqd->id < 0) )
         {
@@ -3393,7 +3393,7 @@ runq_candidate(struct csched2_runqueue_data *rqd,
         goto check_runq;
     }
=20
-    yield =3D __test_and_clear_bit(__CSFLAG_unit_yield, &scurr->flags);
+    yield =3D TEST_AND_CLEAR_BIT(__CSFLAG_unit_yield, &scurr->flags);
=20
     /*
      * Return the current unit if it has executed for less than ratelimit.
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 7b1f64a779..a2a7de7522 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1349,7 +1349,7 @@ rt_context_saved(const struct scheduler *ops, struct =
sched_unit *unit)
     if ( is_idle_unit(unit) )
         goto out;
=20
-    if ( __test_and_clear_bit(__RTDS_delayed_runq_add, &svc->flags) &&
+    if ( TEST_AND_CLEAR_BIT(__RTDS_delayed_runq_add, &svc->flags) &&
          likely(unit_runnable(unit)) )
     {
         runq_insert(ops, svc);
@@ -1534,7 +1534,7 @@ static void cf_check repl_timer_handler(void *data)
             if ( compare_unit_priority(svc, next_on_runq) < 0 )
                 runq_tickle(ops, next_on_runq);
         }
-        else if ( __test_and_clear_bit(__RTDS_depleted, &svc->flags) &&
+        else if ( TEST_AND_CLEAR_BIT(__RTDS_depleted, &svc->flags) &&
                   unit_on_q(svc) )
             runq_tickle(ops, svc);
=20
diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index d6991421f3..1f87b20c18 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -76,7 +76,7 @@ static void *vm_alloc(unsigned int nr, unsigned int align=
,
     {
         mfn_t mfn;
=20
-        ASSERT(vm_low[t] =3D=3D vm_top[t] || !test_bit(vm_low[t], vm_bitma=
p(t)));
+        ASSERT(vm_low[t] =3D=3D vm_top[t] || !TEST_BIT(vm_low[t], vm_bitma=
p(t)));
         for ( start =3D vm_low[t]; start < vm_top[t]; )
         {
             bit =3D find_next_bit(vm_bitmap(t), vm_top[t], start + 1);
@@ -151,7 +151,7 @@ static void *vm_alloc(unsigned int nr, unsigned int ali=
gn,
     for ( bit =3D start; bit < start + nr; ++bit )
         __set_bit(bit, vm_bitmap(t));
     if ( bit < vm_top[t] )
-        ASSERT(!test_bit(bit, vm_bitmap(t)));
+        ASSERT(!TEST_BIT(bit, vm_bitmap(t)));
     else
         ASSERT(bit =3D=3D vm_top[t]);
     if ( start <=3D vm_low[t] + 2 )
@@ -175,8 +175,8 @@ static unsigned int vm_index(const void *va, enum vmap_=
region type)
         return 0;
=20
     idx =3D PFN_DOWN(va - vm_base[type]);
-    return !test_bit(idx - 1, vm_bitmap(type)) &&
-           test_bit(idx, vm_bitmap(type)) ? idx : 0;
+    return !TEST_BIT(idx - 1, vm_bitmap(type)) &&
+           TEST_BIT(idx, vm_bitmap(type)) ? idx : 0;
 }
=20
 static unsigned int vm_size(const void *va, enum vmap_region type)
@@ -212,10 +212,10 @@ static void vm_free(const void *va)
     if ( bit < vm_low[type] )
     {
         vm_low[type] =3D bit - 1;
-        while ( !test_bit(vm_low[type] - 1, vm_bitmap(type)) )
+        while ( !TEST_BIT(vm_low[type] - 1, vm_bitmap(type)) )
             --vm_low[type];
     }
-    while ( __test_and_clear_bit(bit, vm_bitmap(type)) )
+    while ( TEST_AND_CLEAR_BIT(bit, vm_bitmap(type)) )
         if ( ++bit =3D=3D vm_top[type] )
             break;
     spin_unlock(&vm_lock);
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iomm=
u.c
index c9425d6971..994ce2bcea 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -691,7 +691,7 @@ int iommu_get_reserved_device_memory(iommu_grdm_t *func=
, void *ctxt)
=20
 bool iommu_has_feature(struct domain *d, enum iommu_feature feature)
 {
-    return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features=
);
+    return is_iommu_enabled(d) && TEST_BIT(feature, dom_iommu(d)->features=
);
 }
=20
 #define MAX_EXTRA_RESERVED_RANGES 20
diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/v=
td/dmar.c
index 91c22b8330..be7bbe32bd 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -225,7 +225,7 @@ struct acpi_drhd_unit *acpi_find_matched_drhd_unit(cons=
t struct pci_dev *pdev)
             if ( drhd->scope.devices[i] =3D=3D PCI_BDF(bus, devfn) )
                 return drhd;
=20
-        if ( test_bit(bus, drhd->scope.buses) )
+        if ( TEST_BIT(bus, drhd->scope.buses) )
             return drhd;
=20
         if ( drhd->include_all )
@@ -244,7 +244,7 @@ struct acpi_atsr_unit *acpi_find_matched_atsr_unit(cons=
t struct pci_dev *pdev)
         if ( atsr->segment !=3D pdev->seg )
             continue;
=20
-        if ( test_bit(pdev->bus, atsr->scope.buses) )
+        if ( TEST_BIT(pdev->bus, atsr->scope.buses) )
             return atsr;
=20
         if ( atsr->all_ports )
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/=
vtd/iommu.c
index c55f02c97e..34116ff369 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -240,7 +240,7 @@ domid_t did_to_domain_id(const struct vtd_iommu *iommu,=
 unsigned int did)
     if ( !domid_mapping(iommu) )
         return convert_domid(iommu, did);
=20
-    if ( !test_bit(did, iommu->domid_bitmap) )
+    if ( !TEST_BIT(did, iommu->domid_bitmap) )
         return DOMID_INVALID;
=20
     return iommu->domid_map[did];
@@ -763,7 +763,7 @@ static int __must_check cf_check iommu_flush_iotlb(stru=
ct domain *d, dfn_t dfn,
=20
         iommu =3D drhd->iommu;
=20
-        if ( !test_bit(iommu->index, hd->arch.vtd.iommu_bitmap) )
+        if ( !TEST_BIT(iommu->index, hd->arch.vtd.iommu_bitmap) )
             continue;
=20
         flush_dev_iotlb =3D !!find_ats_dev_drhd(iommu);
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x8=
6/hvm.c
index 1c545ed89d..ab656d6b00 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -967,7 +967,7 @@ static void hvm_dpci_isairq_eoi(struct domain *d, unsig=
ned int isairq)
=20
     dpci =3D domain_get_irq_dpci(d);
=20
-    if ( dpci && test_bit(isairq, dpci->isairq_map) )
+    if ( dpci && TEST_BIT(isairq, dpci->isairq_map) )
     {
         /* Multiple mirq may be mapped to one isa irq */
         pt_pirq_iterate(d, _hvm_dpci_isairq_eoi, (void *)(long)isairq);
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/=
x86/iommu.c
index 0954cc4922..30ad0e74ca 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -578,7 +578,7 @@ void iommu_free_domid(domid_t domid, unsigned long *map=
)
=20
     ASSERT(domid > DOMID_MASK);
=20
-    if ( !__test_and_clear_bit(domid & DOMID_MASK, map) )
+    if ( !TEST_AND_CLEAR_BIT(domid & DOMID_MASK, map) )
         BUG();
 }
=20
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 09988f04c2..6e1de0df23 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -142,7 +142,7 @@ int vpci_assign_device(struct pci_dev *pdev)
=20
     /* No vPCI for r/o devices. */
     ro_map =3D pci_get_ro_map(pdev->sbdf.seg);
-    if ( ro_map && test_bit(pdev->sbdf.bdf, ro_map) )
+    if ( ro_map && TEST_BIT(pdev->sbdf.bdf, ro_map) )
         return 0;
=20
     pdev->vpci =3D xzalloc(struct vpci);
@@ -628,7 +628,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsi=
gned int size,
=20
         write_unlock(&d->pci_lock);
=20
-        if ( !ro_map || !test_bit(sbdf.bdf, ro_map) )
+        if ( !ro_map || !TEST_BIT(sbdf.bdf, ro_map) )
             vpci_write_hw(sbdf, reg, size, data);
         return;
     }
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index a4d31ec02a..11f0fd16fa 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -137,7 +137,7 @@ __test_and_set_bit(int nr, volatile void *addr)
=20
     return arch__test_and_set_bit(nr, addr);
 }
-#define __test_and_set_bit(nr, addr) ({             \
+#define TEST_AND_SET_BIT(nr, addr) ({             \
     if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
     __test_and_set_bit(nr, addr);                   \
 })
@@ -160,7 +160,7 @@ __test_and_clear_bit(int nr, volatile void *addr)
=20
     return arch__test_and_clear_bit(nr, addr);
 }
-#define __test_and_clear_bit(nr, addr) ({           \
+#define TEST_AND_CLEAR_BIT(nr, addr) ({           \
     if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
     __test_and_clear_bit(nr, addr);                 \
 })
@@ -183,7 +183,7 @@ __test_and_change_bit(int nr, volatile void *addr)
=20
     return arch__test_and_change_bit(nr, addr);
 }
-#define __test_and_change_bit(nr, addr) ({              \
+#define TEST_AND_CHANGE_BIT(nr, addr) ({              \
     if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
     __test_and_change_bit(nr, addr);                    \
 })
@@ -205,7 +205,7 @@ static always_inline bool test_bit(int nr, const volati=
le void *addr)
=20
     return arch_test_bit(nr, addr);
 }
-#define test_bit(nr, addr) ({                           \
+#define TEST_BIT(nr, addr) ({                           \
     if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
     test_bit(nr, addr);                                 \
 })
diff --git a/xen/include/xen/cpumask.h b/xen/include/xen/cpumask.h
index b713bb69a9..f4e2981f92 100644
--- a/xen/include/xen/cpumask.h
+++ b/xen/include/xen/cpumask.h
@@ -117,7 +117,7 @@ static inline void cpumask_clear(cpumask_t *dstp)
=20
 static inline bool cpumask_test_cpu(unsigned int cpu, const cpumask_t *src=
)
 {
-    return test_bit(cpumask_check(cpu), src->bits);
+    return TEST_BIT(cpumask_check(cpu), src->bits);
 }
=20
 static inline int cpumask_test_and_set_cpu(int cpu, volatile cpumask_t *ad=
dr)
@@ -127,7 +127,7 @@ static inline int cpumask_test_and_set_cpu(int cpu, vol=
atile cpumask_t *addr)
=20
 static inline int __cpumask_test_and_set_cpu(int cpu, cpumask_t *addr)
 {
-	return __test_and_set_bit(cpumask_check(cpu), addr->bits);
+	return TEST_AND_SET_BIT(cpumask_check(cpu), addr->bits);
 }
=20
 static inline int cpumask_test_and_clear_cpu(int cpu, volatile cpumask_t *=
addr)
@@ -137,7 +137,7 @@ static inline int cpumask_test_and_clear_cpu(int cpu, v=
olatile cpumask_t *addr)
=20
 static inline int __cpumask_test_and_clear_cpu(int cpu, cpumask_t *addr)
 {
-	return __test_and_clear_bit(cpumask_check(cpu), addr->bits);
+	return TEST_AND_CLEAR_BIT(cpumask_check(cpu), addr->bits);
 }
=20
 static inline void cpumask_and(cpumask_t *dstp, const cpumask_t *src1p,
diff --git a/xen/include/xen/nodemask.h b/xen/include/xen/nodemask.h
index 1dd6c7458e..b931382f07 100644
--- a/xen/include/xen/nodemask.h
+++ b/xen/include/xen/nodemask.h
@@ -95,7 +95,7 @@ static inline void __nodes_clear(nodemask_t *dstp, int nb=
its)
=20
 static inline bool nodemask_test(unsigned int node, const nodemask_t *dst)
 {
-    return test_bit(node, dst->bits);
+    return TEST_BIT(node, dst->bits);
 }
=20
 #define node_test_and_set(node, nodemask) \
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fe53d4fab7..d521e3cd86 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1148,7 +1148,7 @@ static always_inline bool is_control_domain(const str=
uct domain *d)
     return evaluate_nospec(d->is_privileged);
 }
=20
-#define VM_ASSIST(d, t) (test_bit(VMASST_TYPE_ ## t, &(d)->vm_assist))
+#define VM_ASSIST(d, t) (TEST_BIT(VMASST_TYPE_ ## t, &(d)->vm_assist))
=20
 static always_inline bool is_pv_domain(const struct domain *d)
 {
@@ -1218,7 +1218,7 @@ static inline bool is_hwdom_pinned_vcpu(const struct =
vcpu *v)
=20
 static inline bool is_vcpu_online(const struct vcpu *v)
 {
-    return !test_bit(_VPF_down, &v->pause_flags);
+    return !TEST_BIT(_VPF_down, &v->pause_flags);
 }
=20
 static inline bool is_xenstore_domain(const struct domain *d)
--=20
2.43.0

