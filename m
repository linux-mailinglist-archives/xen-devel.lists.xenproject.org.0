Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1666DB38998
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096792.1451430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKvR-0005Ph-SV; Wed, 27 Aug 2025 18:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096792.1451430; Wed, 27 Aug 2025 18:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKvR-0005NN-PQ; Wed, 27 Aug 2025 18:31:13 +0000
Received: by outflank-mailman (input) for mailman id 1096792;
 Wed, 27 Aug 2025 18:31:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKoz-0006ki-Ax
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:24:33 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11c811e7-8373-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 20:24:29 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:24:26 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:24:26 +0000
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
X-Inumbo-ID: 11c811e7-8373-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zq8I/z3/7Dx1xNkTft5pdwISwjyr6+V4PgueqiAz2hP6g/2JM82Ke6JkgYP9KkDGjsi6m7+9RUpkO2JyhHeTsNwTtWiqK/dyx9qWm5fbdcmg0zHN2XH7n+1bKb53OiAGV7csC8goaMINQgfgNTxJlKoJixNFC5lf4GVpStYF1Nuxw4bhQHer5cOFkXq6BekIiO/qeqJcEnD4nrv0GQu1/12iZb7P1bGkvad329Vs1shKXPyjZHMPQg1WIQa6QU0JW/GQjIgMfH78srYGNDU/dhNq8QX15MN8F+wLz492jCE0J4olhBIj1N+lfavOzxH921Ek9dF23kltlnwQqGgm6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6MIjZW1CBjFKc4mIxF2/dfXj2CJ3BIGOeBCmG7IwAA=;
 b=evwaXSzYY16QWlEIPABZBWaeHi0eCWncUpT+BqcL0Oh/CO+E6RW9pAryGsuf+zG2X3iogShhv/erjsaJrZPrs5Cgym5BNjfLIhXSP2H9FLu2Rp3PD+KrMJzJr4g1OBZ/2BS0JdMr1pAhK8j1WhNSQbUOWaIThXJBP495TUX+m4TZ4u1MKqA7vaOoy4FWGhUgLAHBGqQffV1Ojc5C4VRIwrWw1oTzqPt/Lr7vLCI0B9Tn0FeGB1jwCeBwSHO6wfedSaU1UUBQsyoQ42YSTLOfSiPx/fuTZIACiBkddiAMz5PgHmK8WfmE+MGR9qQ1RFqKCqzFytZY8bC9Hd5xq9hgRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6MIjZW1CBjFKc4mIxF2/dfXj2CJ3BIGOeBCmG7IwAA=;
 b=UwoLXNOrH2PnugzQNcTpMGhkBbNY4EaX+J7qjA3SF5CziNGfoF9F8JTOucKqOxboTlVqjL8LzZSgqdq9muQVdW9Oc91DHIFzbg8cpD92tnjwJO7pZmWk85g5OlPU92l0bdsT0GJZyxc9TkJ0l+/ShedW+gYdh9PLqQU2OgrRQsoyWfIjcDdajkkisH1CiFh8RG7lWL9Z4RxzjsDmr2VKQGokXRVdFQVZmhKCGtJxy/H0vV30iAxTlUh28bM7d/qKy4JR0f0uqqR32MR0G1lgVgEQmU8w5V90lp+TSgCqquSrOXwAbrdlR9G1hdFhE52UH8Ax8+yqgw+uJ9rQRlFvIg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v4 12/12] CHANGELOG.md: add mention of GICv3.1 eSPI support
Thread-Topic: [PATCH v4 12/12] CHANGELOG.md: add mention of GICv3.1 eSPI
 support
Thread-Index: AQHcF3/RJqCaSCtYv0easljTcStgWQ==
Date: Wed, 27 Aug 2025 18:24:26 +0000
Message-ID:
 <735dc5095eab0511384e6c8c14d789e86d3ce300.1756317702.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: eb214470-6306-4e54-64ef-08dde596f46b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oJ5Q5LrAR/c71k3RkApxm1jIZlpDGVQqqJOQFPE9GafzAoiBmb4i7xMJ9U?=
 =?iso-8859-1?Q?Fvr6uZvQ4Ev4esAJe3y69fAZvVS3CDX41cO89VEBSKg/O4hr4GOE7ts5BX?=
 =?iso-8859-1?Q?fEUr3cOfUm8LZAPu8i3MFb+mi6D6RpByZ1SJWi/gDofVEdXPHvZYs6qvlq?=
 =?iso-8859-1?Q?v2IjKi4Jzu2rJGDl1Sw70Z6oFO/Cn1UfzPAftA7G5fnqgsE/DeDtKIUxYd?=
 =?iso-8859-1?Q?XuWawIbgvIqnq97mYTBfQplS7fRXtYMY1lcBEhJF4G3cmS4scyC8lgepzU?=
 =?iso-8859-1?Q?pnbZhcmNRlbINkDHlUt2CX1Vc9TkcxoYAjgsknGcD6pAa+B/Il8/8HCgDc?=
 =?iso-8859-1?Q?l8axPxJQZj7Ek8dyyfSsKrqhTkyMq7ooku4sbe6RhdRrVZckOS+trHfNRw?=
 =?iso-8859-1?Q?E+/TDgWCd+9dxIJ8dG5HAgQ440ItOy44A26P2o4EaG0sGmV4AlzL0tDqUJ?=
 =?iso-8859-1?Q?soT6OUm5gPKPjJciAI56fQciku7PAQhR1ZSqiKyJQpGcyDMWdT1SJR8W5u?=
 =?iso-8859-1?Q?HzfzPL7BtXCFoHcmy9EUpnuhDE4idpVeeibtaPxJTAtiqo83W7T61VwIVO?=
 =?iso-8859-1?Q?psss0TQFdC/YYjOCHZNoo63lGByrv9EW9os0g8PUxtUl1az9JVmcmkoLdN?=
 =?iso-8859-1?Q?7PIhkyWnhj4AjVeFz5DmC5xtMGK1dbXiOo/Fu+fuQxkG7TMCaZPpFJ+Nk2?=
 =?iso-8859-1?Q?cAOcHv8D8KocpA6l2CmiN0hgq3NynKsgKf1VNBxVd4066qSINitAc3lYq0?=
 =?iso-8859-1?Q?whne1Sb3uIYzOhbwbKV7AV7ZvipuR46sWCrcaXE3c+gRvUYCH6jmHNyWr7?=
 =?iso-8859-1?Q?P8pedJuYrTq3//uaJCSH43CAnMXlkwKRBcGc04TtoUOkeHuPG0Wfyb/cpE?=
 =?iso-8859-1?Q?zIxY/XTOyfl3W2ia4sNuL/jMMu8TLobVGbfVUSjSfqhgznFzdquIkioCai?=
 =?iso-8859-1?Q?g7F+MPj74c1izGAJFdRcwYPNSWEzWXvsvYymXbJipbw3d/yXKcwNQOYSQD?=
 =?iso-8859-1?Q?edvjzmMBdbH7zj3QaonP7AO7SJOe+yhrom37N6+wbACzAmdxVARgYt5zlw?=
 =?iso-8859-1?Q?mLFUEuOsXj99XW/tO/rhkzT6tiBUwxWrIZpNTkuU6vwkQhUIP+G9CWqywn?=
 =?iso-8859-1?Q?IlwoZCpphJ3Z5HtBEHZAhksx1jLTkL3rGvZfzYXezMxy/+P8OO8SrZQeFK?=
 =?iso-8859-1?Q?Vd2ighgm8nK9GzjynGNxU1TxzY9Yw69u6OXKJHRmnY91tzTKSeHuhcfxFN?=
 =?iso-8859-1?Q?L5kQBgnHz9FzKYeEvjL33V/mF40Q2nth4X/n4LEaXI9GxpEu1KM6t1V+2s?=
 =?iso-8859-1?Q?X8hnKOhmrgdAPbhVrh4ZMEcM1HF1C7UgVGKW72KDBbuDxolIT5dqbiHRng?=
 =?iso-8859-1?Q?C4vZ01jJK0pLNfMdT4EK5GdX60PxXDW8fIQk29pLjpBb/TqQobCQHDZJCt?=
 =?iso-8859-1?Q?N0IhQO0t1bdWTLRpWvAVEAFwSlCdm2jsb3dRJnEV6UNsZnskiZgDH3Etzf?=
 =?iso-8859-1?Q?E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4xlDhsmOOGAlnRhW4M4ywd4+A2aYR4oYWCy4mgs2VXArQzTMhOabaUH03k?=
 =?iso-8859-1?Q?Jg6eEVz/YQjP3YuQc/bgrlh9P83JlmVgzwNPb3Zyx5Dqqtn73BoihXRx6f?=
 =?iso-8859-1?Q?e8hc70cIWimji0uCDAJixwQm83GNxDtHTGKU5RQmYFduoB+ExXyzA1Pleu?=
 =?iso-8859-1?Q?WBRH/CXCV8U/1spNI3eQNkheOLnoLglajoLzoT2ONosIVO7Q2zOZ2QALxf?=
 =?iso-8859-1?Q?/vfn3+l6f4hIAcBKmkj6a7g26LUiMVJ1/4EyNvlTp6IUAqJZE7JynNxKlo?=
 =?iso-8859-1?Q?Yb4JmzoH1YdGypKHaEHHRwgFJLZHNOFM5x9G89G6Z5myoUR6SDVA0v369d?=
 =?iso-8859-1?Q?esfq4iKtmO0UnzCY6VFFlMkDBed61kpftzrNmxy2/SvB62A0wMCjNTIOws?=
 =?iso-8859-1?Q?RLonRhUQ2ygi2fMqYsZY1fhn/FpKG+BZfL2acMkOPnQokAWm3u93mFP8m5?=
 =?iso-8859-1?Q?yYnBTwmtbpizVkVmNJNpmFpRMkbGh5u+h+36HCpcLdd1puCthkaLGPLcIC?=
 =?iso-8859-1?Q?ea5rLGL/pBpJCk7j6HYPiAg9+1mniLS+xmzPHu3/oAM88MMBwqFtc878FM?=
 =?iso-8859-1?Q?8hXRznW6NNztipdHoW4OG6BDM1twl10OGNNgBakCCLkj7JDDDG8PrDcc2o?=
 =?iso-8859-1?Q?Fkv7qqqIao3nTDPs1Vgp8So3xNpy9mveJ47vQTORqTpMj0TdlGcanFl08e?=
 =?iso-8859-1?Q?p/Y3uHx4N0t9v/mUHsREsqChVvBMcSv130YNj/ft0tLZCGVur1RXoX3jn/?=
 =?iso-8859-1?Q?PEDMjW5pn/sCXGBlwKabbqhi8aqVUSANA/opQsYyySWDTa58Ne92iTDarT?=
 =?iso-8859-1?Q?C44ECn1dBFuuCm7Nnt3t9ZKOb5Dul35ZM2tO6b22JtDp1A1GtdvsIQYHhc?=
 =?iso-8859-1?Q?pNAeZGzgVLGyAKm7poxtp/vRy6DNV88zNcV2yLBwFewR/lPaMzw8YNJsw9?=
 =?iso-8859-1?Q?vjA5/fT/ySkqVsQFKYy1ApOACbBI4KkYUEAXXLbR3cbeFdcFb0aGm/Wj7Q?=
 =?iso-8859-1?Q?oirTRzjzGPfu/zbKojItoWlmxL7jC+J+U4Fq4NHTHXp02FCDzZoX0MePvO?=
 =?iso-8859-1?Q?p1jx6VCRtU3TZ5+LfyNSTvgf9iNGB93TSZ43ZlYf/irB+xUDj/sk7kCn57?=
 =?iso-8859-1?Q?zffzEARTW54rKSur8KFQIDsCYtID+hsHcrzMXU39plXD5/0aYyG6qtZ9dR?=
 =?iso-8859-1?Q?3hD2gstGkqW0llUaXYRWVUB6DD7xBb0nptYLwwG3ODgmOkTwyRREuoujmK?=
 =?iso-8859-1?Q?cd4JDiGQn5oKjLwZDpPV5zN6Xrzdozx0lR5tMMDaRZERS9rTqnSRdEI0wp?=
 =?iso-8859-1?Q?K1h5Er6qj4cfVKCTirb3Hga/un+GYY50MppS+E4Xty6kjbmlyyMo0KZzdP?=
 =?iso-8859-1?Q?wZag6ipK0sVwUv7H6veUmr+8qpaiBkKwFdFx+6D+8O0drBpsdL1Q9jysHY?=
 =?iso-8859-1?Q?cyzj+F9RDnkiL6wV938jUYFj1xgbBWjya3rKK4vhr6CMWpos/66wux7QVT?=
 =?iso-8859-1?Q?iTYrRPvkMbiy2NliRw/xS3T0iPj3RWYTiRLUTltX+5e+HCnS4p08BlnJ5q?=
 =?iso-8859-1?Q?zMg6ciYhYu/UwdZExzahgMMCLSTFV2WisB4CNxS6T8QeF8DlqGkN9JverL?=
 =?iso-8859-1?Q?5fzGXQIRchF7rJEmh1i1nUrxAcUBnpXYuJtKiItuMTtp9w6eowiCn4H4La?=
 =?iso-8859-1?Q?ji7jHlxwoi6vVzg+c0c=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb214470-6306-4e54-64ef-08dde596f46b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:24:26.4467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+T6t4MSpsmFOgnAqz0VfjK4abphLIblzA2gRq96b3m0e+SaigcV1lkUXwMdc8iI3ew5OWXunKl3Q+2bVEFUyM79COkhJOc33KfUOpvn0kQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

The GICv3.1 eSPI (Extended Shared Peripheral Interrupts) range is
already supported with CONFIG_GICV3_ESPI enabled, so this feature should
be mentioned in CHANGELOG.md.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V3:
- introduced this patch
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..dc34d29d99 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -29,6 +29,7 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
=20
  - On Arm:
     - Ability to enable stack protector
+    - GICv3.1 eSPI support
=20
 ### Removed
  - On x86:
--=20
2.34.1

