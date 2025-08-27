Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A69DB38979
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096715.1451319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKoP-0006n6-NT; Wed, 27 Aug 2025 18:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096715.1451319; Wed, 27 Aug 2025 18:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKoP-0006ko-KY; Wed, 27 Aug 2025 18:23:57 +0000
Received: by outflank-mailman (input) for mailman id 1096715;
 Wed, 27 Aug 2025 18:23:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKoN-0006ki-RO
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:23:56 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc5e4cdf-8372-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 20:23:53 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:23:51 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:23:51 +0000
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
X-Inumbo-ID: fc5e4cdf-8372-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brUxORS08+gMhzzxvJezm9cUNieBFF/mCutzD7+RXCojt2NeYLHb5X5TAbSRVJ+R7I+WiqP3tqN0Tk3f/TVg586IfbjhFxXj2tHF+FzSHa7Kp8ByR2OkKWefo3ijpuevU6ebxK6kNJv8yiBViNzYOjFnGLx2K3NwiTw1k3AcEsDHA6XMx3X8pJQsRdMCebiy885VWL69M6Q54P0+EFxbMl8y9wuXVoGKBIJEDIBgzGw0iPObXULoQRB06RIo5Wpm7H/0DxnEIDo3ejby+BBxbqUT7HlM8Gf+hLwr28wMijF11wZH7z6D1fTurcBUWhEvwQv3qxcd3/womPEgC8+CCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJHxXQylSp2srW7ixi8KXXk/Rk12wV52xtDh50W86BI=;
 b=AdEINIztj4nIqA7+4TpL/OA1eRTBKPn7dMkuP5xWj34tUYwkvm82xd/DqzB5a3oxv9PkU1BK+Rt4d5Ht/cEHp88Q5gCXh/Wn5HyrcQsgQZbrBa3mGcPaHuXKl3Ro9OpplUaVZ3qvXmE634oavG6ir7U49UN0Qz3HPDwOabAvZkdn0UqHp7pffZftHoezAx+Yf+j65iVq7s1+wpTnvnOUVb5tLmMErwPGE0UCSZ+vZ2ViqFwY67RDdMLXcirRvDXuGZ+kcyV2kkNdcPABrvFuv0vYFs9r720oidc9R2KSVSOnn7TDclrZj17gGYhMXIusI9rQiNtIVCVNfRU9oA8nlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJHxXQylSp2srW7ixi8KXXk/Rk12wV52xtDh50W86BI=;
 b=b3qC7gJKTuXjxFU+H1IA/vJt5f4U5pl/vxICFxyQ49/C27NndpecWsItCbUhqedBLYiZBwtwzwzjVfhHSQyclxgrqe3DzQ2NOlcpfqkiRzLLyjdUiBcX6ZaDSXSny9Ne9p5jpdFfkPDFmz1LwsyUa9oLaq5lLpcC/Fi4THgxCAyDqnJv6X7DQRoqeMRRs6kjtaupaBly5V1BUoI0u/M0Oab4k1TlhDu5VrCXHoFabu5WTryAC541+cGAvhiMuw5EvoJFTjnCkahz67eKD8srQpRoOI9IlbzJZndV2jjkRTXHXmCjxlGRUu2cZaYBowX6f9YZ2HcY2C4SHt7v8Xqo8w==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v4 00/12] Introduce eSPI support
Thread-Topic: [PATCH v4 00/12] Introduce eSPI support
Thread-Index: AQHcF3+8BonB2Qq5TkGkUiLa1lebVQ==
Date: Wed, 27 Aug 2025 18:23:50 +0000
Message-ID: <cover.1756317702.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|MRWPR03MB11023:EE_
x-ms-office365-filtering-correlation-id: 8d19e805-fb9c-4ed8-f2c5-08dde596df38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?IvDQ5FtVWsaFed585fXms2P3Ug+oHxxTQ+WIyhYLh7vKph6gApwvf6BOT5?=
 =?iso-8859-1?Q?y8jopALZh/O9rKJr55ZiPUsoowIxphummTZHPdce/zuwB/5k8TTuS+q58P?=
 =?iso-8859-1?Q?+Qg2NgvvHRx0Z/VRhx52mj2VXV355NSgTDVPLtpxdog+ccDgv1YWkxHvue?=
 =?iso-8859-1?Q?pYLjeO1D3MzDxFWZE97PQ61bncIpUWf4VY9wMMjCpWT1r2SiHCSPNMhqu5?=
 =?iso-8859-1?Q?Xg1xhlvUcJgcAN4xXUGrc3viGunPcC3OzrTlDiXFx1/FMZr9XfWw29iGGt?=
 =?iso-8859-1?Q?jEbgmw/siskpBPsB6ZhxGqGFhqQOQnZzplgKPKOPLUnnjDp2BjVZwMKHcv?=
 =?iso-8859-1?Q?6K7qUocHxsBPmuhawNmLJwVPNdubyBcA/hT85E+ngBbd9X5v/44hqdqprV?=
 =?iso-8859-1?Q?fmKXby13ku6lEjr5weGtbtB2/byisKGYXiG3a86f0TxeZhJzoZnapQaihp?=
 =?iso-8859-1?Q?9sLhpBPrHRQ3O0i7ezJdKHDayfHhX0DHVNyp6O0TCHxOkbKYjiRdM+3w2c?=
 =?iso-8859-1?Q?ANihjq0aegNBdSkhocIP87BO7ZbRdb/hmx431gEK1HB76AkGE+GA2a1GIU?=
 =?iso-8859-1?Q?G/q8HQt+SRqA16e8Qn5zcuxeODVcRrjei+0XE4jI+VvOXnRWDmtdFu1Xvt?=
 =?iso-8859-1?Q?M1mq2VdhHLL8FCYLNObs+vZwUlQyjQnyZ37De5iM7QGfQyfA2fdPCEEmz4?=
 =?iso-8859-1?Q?n4b66413Y1GYEtOJqi478ioszQFI+Cyfso3gTNrtSfFrIE1vEhiE0k/1Uo?=
 =?iso-8859-1?Q?ZvlpmY7fmfUb2ipBH3bufRtblH74XO8CxPrzWLZBVTWiArxEWB3J0O5FqD?=
 =?iso-8859-1?Q?/l/+OyDxbRTBEu0+K8AwtNTe8Sv4dDv0VHks8yMA1An63nbfaA336/JIn4?=
 =?iso-8859-1?Q?nZNGuVAnJoaDA/gCOQYOdenaNzVp3+iZqCnmDyYpgiuQBthg/osuGTujjP?=
 =?iso-8859-1?Q?hudkgWm9ntpAD1AlDnhYQnHu/glWEfcqC5pQfiidz6XoAXylE82BDARowf?=
 =?iso-8859-1?Q?zzWWdy13K9ZP0UyYGryxO08Lmzxtn4Mn/nkHmrQpJ55ntLZsyMpjXMD5Ac?=
 =?iso-8859-1?Q?N1rBk78TveMioV9piNSvhErPiSmfrEgMwvQingsu9AnvP8D3B7VaaHRIAl?=
 =?iso-8859-1?Q?k76HLzgP+MR6iyDXVm/z8ysMQjEnGv237c3s05dzQwxXzPJgKZ/eURbihD?=
 =?iso-8859-1?Q?CtnMErZts8y/3xbYj1b4U5rw0ChMA19/LmHd77j37iw47yogMlYTCDh09W?=
 =?iso-8859-1?Q?GGF4SOOVDWR4Kk2LjjTbdRMZu86pGcMlcO/A9VX1Y+M088ARZ7eQcsIydL?=
 =?iso-8859-1?Q?/mo/dsk5cpAHP4/CDaoEKQja20AoHJHvjNdWQmdP7lnKUrgu16tShli2xL?=
 =?iso-8859-1?Q?Y6IZorROjCgWsiG+osyx+qcokT8BUpQVZHgLmDQTtjbFGiI8CYPzIvuo/k?=
 =?iso-8859-1?Q?e68T6LSHfZT8WnAyYG/WnRjWo1FnDJ4WbYyrtCWYDA+wMxxpQepi1+FT9Z?=
 =?iso-8859-1?Q?c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?i0m6UBjzy/lwW7bKmzmi36MTdA4efMGW0E79bwAMeHzE8MwWKj2lIc7DKE?=
 =?iso-8859-1?Q?2/9JUoyy33PPFEZrk1cMOeXpAgw8Tn3ZrqelpPQWNNUPdjYf9kbOwfojtg?=
 =?iso-8859-1?Q?vMdIowF+c1OxpwFn/kXB88qBQJKKi8c03ZLS2qg2m+rXufn2RDYWwZ4a/1?=
 =?iso-8859-1?Q?FuM/V80tbqs5wxAr4R4I1R5J5kHJ9zjkoy814RaQ/j+IEf6ZO62JTy4TzQ?=
 =?iso-8859-1?Q?O6W+wSt06phTWEuG180Iv6am9jxEL7mI/9eh0ksaGaAkOzJsgzKKKZgIKo?=
 =?iso-8859-1?Q?M9jYT9smPtGhEejOFJXlsNdaJyiKmzysdBfRSDBjZhkWigmL6witLJGQma?=
 =?iso-8859-1?Q?848cAgpqlq1iPN6hl/Ma4zBlR/FU+lrZ2pbItmyxOh5eakW2oxENNIY2Ko?=
 =?iso-8859-1?Q?P3V10Lcb9lXIhvxLhd9GP7QKIcWSh+x8iETyyoLsQlNMGMxQCiPlXAtKOF?=
 =?iso-8859-1?Q?laCLhh9aHe+uemKJmvPX1FkbKQ/LIdZqEm4IJscGivfp6W9ytExVViRxl8?=
 =?iso-8859-1?Q?9o5OQHwdkLxrTOnOoqMhtOo78FcfOr24lgbKhEXLZZrZkH25dR/wKINQZ6?=
 =?iso-8859-1?Q?gzd4VUt4kiizxvgnPR+XZ7sBgBgD2iqmpfRLrk9jxhmUoc2vdFTkST8JKL?=
 =?iso-8859-1?Q?8fgkp59I2Ji9iru1EB78q6Lz5T0dgRTj0qfZzKDCv1hVoXy0zZkzufbaMa?=
 =?iso-8859-1?Q?00CpJj7CVfh4b/43Y057txMT/XWn3h17qfHijiqUza0aujD3IxEgdCzGwp?=
 =?iso-8859-1?Q?4329gk02TIhQpe762h22yMuIkBIvVX9Lx4gI1NzQ3XnMg1srD9ofx4m7uY?=
 =?iso-8859-1?Q?pesYQR1pXRQrP6zTee3s+MVfGHV8cjHFroAOBNsEq6iwNp+MbQLPXc3j57?=
 =?iso-8859-1?Q?Xw8XkpvGlmQf5/rezcH9FrWu60Ui6jtMyr1Ig4WlUW0v0wIFqTfnyWaDdh?=
 =?iso-8859-1?Q?0aqTSuy3yu6K3YdGQK7quumkiHVYANBXT9fuSnFEo9IWubpECfgFymnvLJ?=
 =?iso-8859-1?Q?7zY2r47HFcCBkD+up/qZdkasXwrFARTHIIWUXdJ8i6toxqXYRmtwo5hAtW?=
 =?iso-8859-1?Q?uZdir5Ois4QTgJcX7GrNgdE/d/yi2HUQawGiym3wAadTvPCvgkNiaI28w5?=
 =?iso-8859-1?Q?QaC7MIaID4UfEeSOqzdx2zZMYOV3s6PlAfPssOanR0M3LS27PrN/kqGmPv?=
 =?iso-8859-1?Q?KzDIcQYmgJKNISXqp7s04jAML+N5RvznNTJDGGukGTP1SqmpMYQxQPAEd3?=
 =?iso-8859-1?Q?nsqUp903Duj7PFnFmTfCqkMZUFpvPBhG4i9zrh2jndeAhvF1zDtIYe4DOy?=
 =?iso-8859-1?Q?dMPeONDp+L/s1kbuNPRTR3Xw1flBP5zdwKh4Ph9Q31PeLaQZgR9aAdCneF?=
 =?iso-8859-1?Q?RmgwDZLreLG0AZmRIkbrdLF9vXZsYAbs0EJ2JjAPM68xpVAuUnMIzc2jxb?=
 =?iso-8859-1?Q?OqDSW1oa+b5RZJ3WRkzIOVyNmbFtxXd2CZdfff07t3SQoYo5+xTz5W81QN?=
 =?iso-8859-1?Q?uT8zu20ubCGkd0B2hfmMPRCNE3AskZSMGLYZ9RklU/uXj3YfPXo4xSEct1?=
 =?iso-8859-1?Q?C8d11tYB6ktfA1O0XZenomqbHBLDlTOHPoI58xSYa78bBSnhxBZGqOjxyA?=
 =?iso-8859-1?Q?A7eqntfNDKuoZc5j6K/qmmfqEAalvU/NX10v7/dO0mZxMMBORsu32d9Px7?=
 =?iso-8859-1?Q?dtgVudj+FBs5fZGE3Y8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d19e805-fb9c-4ed8-f2c5-08dde596df38
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:23:50.8931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lptGikKiQKjdgRjfehrTzHSgS67tV43YAh1oc1BROsBrkM9mcO5t+0CL81C7GCHrOqzG06WhMrcT2OF1faBBUj1cPNszMXgkT28G3R2sNSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

Hello everyone!

This is the fourth version of the patch series to introduce support, which
contains fixes and improvements based on the feedback received in V3.
Mostly, these are minor changes in individual patches, except for the follo=
wing:
xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers

Now includes additional checks for domains without eSPI support to ensure t=
hey
behave as they currently do when reading or writing eSPI registers - RAZ or=
 WI
as it also described in the GICv3.1 documentation, when GICD_TYPER.ESPI=3D=
=3D0.

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
are on top of every patch, that is changed in the series, compared to V3:
https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v=
4-unsquashed/


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

 CHANGELOG.md                           |   1 +
 docs/man/xl.cfg.5.pod.in               |  13 +-
 xen/arch/arm/Kconfig                   |   8 +
 xen/arch/arm/dom0less-build.c          |   2 +-
 xen/arch/arm/domain_build.c            |   2 +-
 xen/arch/arm/gic-v3.c                  | 194 +++++++++++---
 xen/arch/arm/gic.c                     |   7 +-
 xen/arch/arm/include/asm/gic.h         |  31 +++
 xen/arch/arm/include/asm/gic_v3_defs.h |  40 ++-
 xen/arch/arm/include/asm/irq.h         |  27 ++
 xen/arch/arm/include/asm/vgic.h        |  48 ++++
 xen/arch/arm/irq.c                     |  58 ++++-
 xen/arch/arm/vgic-v3.c                 | 333 +++++++++++++++++++++++--
 xen/arch/arm/vgic.c                    | 223 ++++++++++++++++-
 xen/arch/arm/vgic/vgic.c               |   5 +
 15 files changed, 924 insertions(+), 68 deletions(-)

--=20
2.34.1

