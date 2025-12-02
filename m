Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584D6C9CC60
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 20:33:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176336.1500837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQW7K-0005Xa-63; Tue, 02 Dec 2025 19:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176336.1500837; Tue, 02 Dec 2025 19:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQW7K-0005UZ-3C; Tue, 02 Dec 2025 19:32:54 +0000
Received: by outflank-mailman (input) for mailman id 1176336;
 Tue, 02 Dec 2025 19:32:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ffo=6I=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vQW7I-0005UT-Fj
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 19:32:52 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0cbe434-cfb5-11f0-9d1a-b5c5bf9af7f9;
 Tue, 02 Dec 2025 20:32:51 +0100 (CET)
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com (2603:10a6:5:3::28) by
 DB9PR03MB9831.eurprd03.prod.outlook.com (2603:10a6:10:461::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Tue, 2 Dec 2025 19:32:48 +0000
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66]) by DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 19:32:48 +0000
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
X-Inumbo-ID: b0cbe434-cfb5-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Srsxj6SpLMwOOqEat/E3e+FKx7rZdH3v8ZY1R7Tnxm61y0X9y4B+7a7lrml5fxFD5N2uPJtBm93CuB4gaB8ySA/FkWj5jx7l2ICS74UaZOQOH79ZxiaIJpq5rZySMC82MqCcgGLvH1sJqSzj4m2DnIUZmzFqDllQYKZ5t8m5FYp4qsDTuDvi8XfgNouz39cQ12pjfJAAaOYQc66Eh8Xen62YBRAFo6pgxwGV4FLo3wE1D3ul+ljrjq5GFkNjcqyXJfgiehBxMqggPv7htksaYcTeM0FE9IKAoNoq2WQm3FO2DtQsItpkrnZ7a81UdqmF9UML0EZU6qo9nseOT0uGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nYNDrNMNzvaEhhLE8PiKcUqoUCJJHNNM4EcfEtokNQ=;
 b=ODEoHNNFzribr3ln7hk6DBS500zaZslDa2tsH17uq4dx6dVWS/pTBQyoe+4b+mOBNBqR0D6SIcRLyyELe2ePkJGspMttPqI3i2p03xh2K9OWQaeu0WBYzsYr80bo2yQvXPI6e5rNNfXrUVatT0FxV9AIOuQ0ZLUInN5RN8dAPrnoSLg91xVkzNYMHkEffuO056jC6edlx6A4Rr/HYnE/dH+5bZhYAhiC9cwTnjYfjM3NWBijkCLVfCl2vqWlPDgZi+73lcvrItcgwcFiNDOYbt+NfHoR9/7ZOIIz6Y+gmhKiFzr31f8qOY5WC4BY+OEdjk2HKwawsAfZXXiM6SHrKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nYNDrNMNzvaEhhLE8PiKcUqoUCJJHNNM4EcfEtokNQ=;
 b=LZo8c1FGQXvvYRw15wnmjYfgkOf4m7NTIb1gY2zoPpLN4p6CfQdq1+23mFp1wD4ytEJMlUtAzrq9MCGBQfEmE4nNpSf3JOU01z6aMvxfZcXeBcaC730xPGjF8pXlDQoD6xUMiCKjwY2Ez7R05nB0+26AZIhW/5vB/jwP7jd+YoGfpMjbBPkNFm68eISQ7ge3pyso6K5v9qi9CcKaxdz+nluQQ1Ck2F62gUVJGnKCUo7QyPQPgh0kkg5pK+teeg+v/a4gbCBEKGq3BzAH/6p/FKoLFY7iWf1xev+PZxhSponAM6o1VjiZiLv9pbXz0SgEEW+JFStn4sTLSeIRx8HRiw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [PATCH] xen/dom0less: Increase guest DTB size for high-vCPU guests
Thread-Topic: [PATCH] xen/dom0less: Increase guest DTB size for high-vCPU
 guests
Thread-Index: AQHcY8JwgLGK5hUeEUKxVWNaY5XmsA==
Date: Tue, 2 Dec 2025 19:32:47 +0000
Message-ID: <20251202193246.3357821-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB3577:EE_|DB9PR03MB9831:EE_
x-ms-office365-filtering-correlation-id: 579cd643-e80a-44de-83bd-08de31d9932b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6OiLrxn08INF5itUBtbY3slElllv5M23Sd0v6Y+bC2GAW6GPrDdwOiAk9y?=
 =?iso-8859-1?Q?gViwKg2E8OrEqTX0w+bXve84cUZNBFo51++J2qcYAeNdkM/1eiyge4hT5L?=
 =?iso-8859-1?Q?DXzhGTcLe468CgvIkfYaLGXTL22nDkDZzsKTmd1/PaHnQYAjy2QATxh70+?=
 =?iso-8859-1?Q?xvIsyYJpM6mS+68AnSS/93MRCQaWtvgZYHvtKTvdNTCh7715rIsOGzkcS5?=
 =?iso-8859-1?Q?+e6A8zw8QYAtoVlnlkw3tE5IVtjcKM4F5SPfC0pTmly7bozr0B9H1TgpfE?=
 =?iso-8859-1?Q?HIhvP86Uv963EWNPbXQguo68NOj4nx9+vLzfbLOTZl9uBf9wuXsr5M8ay2?=
 =?iso-8859-1?Q?tNRbZa4Bcbd/+3mSIJoP8qaU1gSN6Xuw87ryHd43mv+B0nfVP5gMd1pLwh?=
 =?iso-8859-1?Q?Fl1h2GAuzgLLsmTnE06XWmCFhYispPjL9IrpCOewo78t8MO5eVGPlXCwaP?=
 =?iso-8859-1?Q?osEcyaqvXWpHCJMhs3NULe01lQGlDknTkobgdQU5aNy22HzBLXlbpGOoze?=
 =?iso-8859-1?Q?MXt8hjjKtzFeeWROlFWro+wis7BrwQ2x4Sb1RWQm13bGw61pF/AOcvIMuY?=
 =?iso-8859-1?Q?h2AFWC1b8dPRM1ev0Ojy2i06tMpvJjtz7N+65OeArj3DFfI5le2ZlUmg4F?=
 =?iso-8859-1?Q?gkuVcBLS56581ps9Uy/hNrIPlIPLe6tii8iTOLasXaPtigcc4wnh+JFPjB?=
 =?iso-8859-1?Q?XJuJOgWhzdeT0HdBJQ31cUOlIdGjqcJYbKRqMKsZVqQBig2Ka81mTVt+m5?=
 =?iso-8859-1?Q?UtKUVpTls6M4WVI6rD/GwmpmsA9ZLLsZ/rYj3GfLAa1rCjBVS3q81nOgyp?=
 =?iso-8859-1?Q?bj/3t7BzcNW6iMUFhOKbD1BMRluWOHVyhb32rd0YqlzFWF5y+oeUlznCN3?=
 =?iso-8859-1?Q?I6kl0uVcnRb7vBupGF8SxoP9Ti6kYume5LEHz0eaZ4tAcpxZu3fzoGY0h7?=
 =?iso-8859-1?Q?omavp1KGtTkeR2nmLNczx5Alzw6RV5TfG2TbkL7ZiOe3xw5CKS3g8DHoF9?=
 =?iso-8859-1?Q?77dGfWFwfOU6SkkrPjIFyBmc+zPY3/GnbNCqS6+Bf+DIF01tVYMYGBDY2S?=
 =?iso-8859-1?Q?fqRBEUPHU/nKUIwE2Xocy/6QoSWAd/PoycH48dm5Qwb5jEtumk7NefpGEL?=
 =?iso-8859-1?Q?U2CK47QxzT7BoSvPlwY+v2Rfc99XFBCUI60jgoK76AChEqvgQ12gyvgc7L?=
 =?iso-8859-1?Q?fJEefKeK03HrNzcy0FbUuolGZVN9ZPat5KcHp6ilMEniRO5YG4BJZP7RjJ?=
 =?iso-8859-1?Q?YsZkt6Bl3lnlbodN8PDGeIY/olnPxEwaoi+DGxJpCrOyfyJ+V/F1+dxhPd?=
 =?iso-8859-1?Q?y6ZRDDmgTzKK5fgLHDxV5XlLQXbVsdcKu7ExwxyK1ApK0gGidSlObsVcad?=
 =?iso-8859-1?Q?UMNQvHGL+JlTnTP9UTDZLG/O2fvKoa9h10/7Ue9HToyeNK/lnfl9Fxnwry?=
 =?iso-8859-1?Q?Sxu8SFEEOO3lltrWVZ0iu7nA1Cwwdfp3n1jktZCccskpdzewj6h2aHoFPn?=
 =?iso-8859-1?Q?ccJNWk+PGV+45LJuOF3LkBt3xpIoA1XY5ppvklFn3f2M3A1aSVbClDCHMd?=
 =?iso-8859-1?Q?tO0i49QZLmIHGCIt2iHDjMMSj6xn?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB3577.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?O4+yyX26JfIp0SLYVFHle8rfIsGtQq8TaFr5fVY6rUerNoOoLuC8MRwi4L?=
 =?iso-8859-1?Q?d46O5m6TLJerNeqBuL1tuRulm00iJSZX+QvZg7twkv/N8lunwYTph34H23?=
 =?iso-8859-1?Q?AZtAOcxDJdQFOqNblgR/lCf1PKiYmR9C2pnaqFsV8VaBghnCQV5hB2gU4A?=
 =?iso-8859-1?Q?Qgn8C5lHp9z2LzbaAgZpv/RgBIaWPVVpih5BBuQV6OXnftchKm+lCy17Vt?=
 =?iso-8859-1?Q?bcQqn5KlRBF71e+pb/zI80tUh5u6kaweDCEbAH1zy6yMQYyOGY9zmMKJaz?=
 =?iso-8859-1?Q?BhAF8oYPfgEGoSv9QqTWOIkCMkCUUoMzxwd3yyUVf6mUH6WT/IWVlOjcx1?=
 =?iso-8859-1?Q?r0cG0tDv7RUPRV8KCiqQzJ7rwsNSbF8fpSMJ/puJ/yYB3/FWxVfy4xt4iL?=
 =?iso-8859-1?Q?6PDUoXK2njV4g+Vhi5dSE5Nm+DB+rMq31qR18MYNsGvzQZWjpusjMkBUt6?=
 =?iso-8859-1?Q?QLUMJiEkBkZ9ZrBpsYgC+FHlYF+gzIoKCituH639FZBuP+p/p0w5jFVfSH?=
 =?iso-8859-1?Q?mBmVQB0c+mWk2JcdyTxKGO0PooXqVC/bPS8FHbE40VQw17BQCfuBSJeSPD?=
 =?iso-8859-1?Q?77hph/qYCYPfMTcm98tjpO6R/sf/fQLJy4NRVBNZfJ2o1rT/h3lHx0HEc5?=
 =?iso-8859-1?Q?waQC9o7f9rPtmX0yaJrB2/XBKEo067TrQrVIu+pD7vAx6+oYANyarKL9S/?=
 =?iso-8859-1?Q?TmkQh+32KDLsZSPnXhqsem9bAru39HHg9GLIQImeyVA3WY06epfOQ6tUKv?=
 =?iso-8859-1?Q?hnskNIWOaDz0XOQPGXUFK2Po7TEz/KY6+renHhQcxTi2/9OFePkrO5hHRK?=
 =?iso-8859-1?Q?z072YGaTuiLzfInT60B6tJ47kAFyxVFjHYqDQ9iUlIOxvD8dBvauxZE9Eg?=
 =?iso-8859-1?Q?hMeB0xpcvqQiIszaXbO8hZe3HatmgeBqbTcbfLqF0mE+i9M6klyQ7MLbtB?=
 =?iso-8859-1?Q?BBxntzb7s7bUNKq57TqrN0UEXyDCLfxR5Exp/ZA2PdbJjQSMBMA+W/LX6b?=
 =?iso-8859-1?Q?R9DJ4SXltEA52yuplhRtjybGyxPWJ+L3/Sn5d7iznfPRVAlZt6g9ekeixj?=
 =?iso-8859-1?Q?+ecoDxTssCjjjGebsxcefYSQYqrTkTydh2N28s8ttqv+P4PA4JSVHf6sdl?=
 =?iso-8859-1?Q?6DESNqFzEs01DhyTVReuvlqr5R3G1N2vWmYgQNye9qEuK3Ou0fM9cMCQ1A?=
 =?iso-8859-1?Q?i2Ji5vrTeDjQHs3Ooz4xjAJbuvJWqmvYRnEBk20NWWieTNLMiQU+Of76jt?=
 =?iso-8859-1?Q?8QipOvFaCAkdS1xMKB0esFBVXmUpWXIZpy5IRo7nCl4s0hlb7AHH6VBEfY?=
 =?iso-8859-1?Q?2SpxX70gByM2HH728PhoVOHvTopQ+PwDv0k5ww/3O5SYT/vLPDie7jlXZV?=
 =?iso-8859-1?Q?GifyiXEgRVhCEWwkMUQuE0LJ3d1/fx4+jVnmXpZSSz2yRkPyK4oC2tbCEi?=
 =?iso-8859-1?Q?Sn7ELTMF9Jtvx8K2HW8ucJCIXBiHmAo/j7eDu5tk5hKhQtLWZPPEuF3FdG?=
 =?iso-8859-1?Q?nH9epjuu398q+IVF0rMfGChML3dqhQHiOfJ8feUR6EmtUTe5pSd+Dx5rD9?=
 =?iso-8859-1?Q?eX38b2r6uTMRC/oNY/B54pn4yfl9Ebebo8cZAK6oGhaVM6lj9W12uZmtkZ?=
 =?iso-8859-1?Q?/mKXbg5r5NjZ98SZ2eQIWC+hGVWWRxdADntWfeeavCcxldXpxU4jM/mU24?=
 =?iso-8859-1?Q?ZanhF683D+R+jTWH2ko=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB3577.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579cd643-e80a-44de-83bd-08de31d9932b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 19:32:47.9622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: owTIyGfZJzBsGGK9L+4yW34bzqtJIl0vfb920beb859OYOxNueu3AJm7tpiX8G92xu02kDMPa6r1VDt+tjJzdZf6yScf/6bYuhWiVdE8lwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9831

Creating a guest with a high vCPU count (e.g., >32) fails because
the guest's device tree buffer (DOMU_DTB_SIZE) overflows during creation.
The FDT nodes for each vCPU quickly exhaust the 4KiB buffer,
causing a guest creation failure.

Increase the buffer size to 16KiB to support guests up to
the MAX_VIRT_CPUS limit (128).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Noticed when testing the boundary conditions for dom0less guest
creation on Arm64.

Domain configuration:
fdt mknod /chosen domU0
fdt set /chosen/domU0 compatible "xen,domain"
fdt set /chosen/domU0 \#address-cells <0x2>
fdt set /chosen/domU0 \#size-cells <0x2>
fdt set /chosen/domU0 memory <0x0 0x10000 >
fdt set /chosen/domU0 cpus <33>
fdt set /chosen/domU0 vpl011
fdt mknod /chosen/domU0 module@40400000
fdt set /chosen/domU0/module@40400000 compatible  "multiboot,kernel" "multi=
boot,module"
fdt set /chosen/domU0/module@40400000 reg <0x0 0x40400000 0x0 0x16000 >
fdt set /chosen/domU0/module@40400000 bootargs "console=3DttyAMA0"

Failure log:
(XEN) Xen dom0less mode detected
(XEN) *** LOADING DOMU cpus=3D33 memory=3D0x10000KB ***
(XEN) Loading d1 kernel from boot module @ 0000000040400000
(XEN) Allocating mappings totalling 64MB for d1:
(XEN) d1 BANK[0] 0x00000040000000-0x00000044000000 (64MB)
(XEN) Device tree generation failed (-22).
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Could not set up domain domU0 (rc =3D -22)
(XEN) ****************************************
---
---
 xen/common/device-tree/dom0less-build.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 3f5b987ed8..d7d0a47b97 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -461,10 +461,12 @@ static int __init domain_handle_dtb_boot_module(struc=
t domain *d,
=20
 /*
  * The max size for DT is 2MB. However, the generated DT is small (not inc=
luding
- * domU passthrough DT nodes whose size we account separately), 4KB are en=
ough
- * for now, but we might have to increase it in the future.
+ * domU passthrough DT nodes whose size we account separately). The size i=
s
+ * primarily driven by the number of vCPU nodes. The previous 4KiB buffer =
was
+ * insufficient for guests with high vCPU counts, so it has been increased
+ * to support up to the MAX_VIRT_CPUS limit (128).
  */
-#define DOMU_DTB_SIZE 4096
+#define DOMU_DTB_SIZE (4096 * 4)
 static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *k=
info)
 {
     int addrcells, sizecells;
--=20
2.34.1

