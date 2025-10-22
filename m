Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5295CBFC516
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 15:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148083.1480270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKI-00076j-Ep; Wed, 22 Oct 2025 13:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148083.1480270; Wed, 22 Oct 2025 13:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKI-000756-Ao; Wed, 22 Oct 2025 13:56:30 +0000
Received: by outflank-mailman (input) for mailman id 1148083;
 Wed, 22 Oct 2025 13:56:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0J7Y=47=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vBZKG-0006dh-6a
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 13:56:28 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6f080e1-af4e-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 15:56:26 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DB9PR03MB7644.eurprd03.prod.outlook.com
 (2603:10a6:10:2c0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 13:56:19 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:56:19 +0000
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
X-Inumbo-ID: e6f080e1-af4e-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRUEFeb6naTFFF9HKMNWPLAQmh6LMqUwojHCOhqx2zZLWbt+S13kDRMQXyZ+ead9TX2940m0R/VkPHKMz4T9rY3p4RtKjgqAr8s9rOMdfDwTCirZx/IkPYs0LKuqRmZq/NMD00qvbkR1/sNw5XZCWh/SWnhS+MZRW6CRFebw4ombXre4EkpMvg+2NyfnixUUi+Hubqz+6lX8bXOM5teMc0AARpOOBJSKUXZHvyJvgFBNJIKa1Z5h4WOSldE1bmqRRLL7Kbn7/MOxrcR/Xf2uYmCcbwkyDijsfFvKVz2MRQ7z35+tyxkED5wskT8MAuSx7+qsjbeeA+AF085UcbVrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPxTbI3fjhFLgHNJUyp8kzC/zgVZ4dPfVWZM0M7pYVI=;
 b=yRGFb1Ijdo/EVhThhtGDGrbxFHizX3FeNA0K4mz30qLbgUHeh38vt2uy3MiwpAQNml1lSL0sZ8mmR59LGNAFKLHHUg90db4iMfUkqnx8n7K0s43BcHCeQ26pQ9dFKwvkpvhQrV15XewGmVdbUjtj+Z8hzbBZOu48sZ1SyEj/bgHaSY0h/KW7taUrggoDBAeDo9KWzONEdACdw7hh6pZ8zsWH5gZNmhtR19cLRZWXycRAULt0ySvGSjlDaHNQ2/bFFhi4PLRMAniyvntl4u22OHK537SenJ1uQD29ltCkUIHh9B3AR5MyiW75w6M4UxpwL2d7uhQVWtPSpaUpo9dwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPxTbI3fjhFLgHNJUyp8kzC/zgVZ4dPfVWZM0M7pYVI=;
 b=AQ7E6YOqLnb0UtrFtu5Gu6aoPempqtfuVcbru/sSuQaplFBCkpnxv+zaVIjivl6OuZs5zxGGTG9XyYfbsI3Px5ksx1RLBnilTP74D8GVrsF2i7orKAEgLKich0eHLEcMyGgrcEBWtAYedCUH/kQdyi9PLg6d0eM841UI3ntE+13AbL+//2IDbPJ7odd+RAjJhSQCgbNFZfixdsHpOSrFVjc0y8aBkRgwVnVF8GNNrSQ7TYtze73byWN+aBKnGUT2ymFEAIzBhhrqguF0QdeAw5MZcp416/gKQX/Au3ctVLlVscyKRzSBMrloKLyv7fDxvdumSJTLsWnfF+xPoHP5Rg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 2/7] xen/dt: pass flags to callback in dt_for_each_range()
Thread-Topic: [PATCH v2 2/7] xen/dt: pass flags to callback in
 dt_for_each_range()
Thread-Index: AQHcQ1ukOP0xPs6lvU2iptp+1DCmTA==
Date: Wed, 22 Oct 2025 13:56:18 +0000
Message-ID:
 <232319e4112fe7f36ba27f6bf33511f5b2125030.1761134829.git.mykyta_poturai@epam.com>
References: <cover.1761134829.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1761134829.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DB9PR03MB7644:EE_
x-ms-office365-filtering-correlation-id: b1a985c0-0847-4d1c-d60b-08de1172c6a5
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8CbvKnSPQPgA2P8nifJc3QcHqR3IPmaonqGYKU7wUAdtg1wnbwITzVmqT7?=
 =?iso-8859-1?Q?ycCGbHDAqjEKJ8Q/KYAOFSAiubnLY8hQXD46l0QhqvLIXcHyVjiz7oS0BM?=
 =?iso-8859-1?Q?omMBjF2vb46PGVe5cCKX+/f7Ts6m5uuaJg8zlEopnQ3x1zNrqS4cmM6Cdr?=
 =?iso-8859-1?Q?RzkvPVNj9gXUSDXKMKb8DfrvP64VYLHRWeYv1kP6mT1BuN3OrtVpCbKbaz?=
 =?iso-8859-1?Q?UQQaH/m63BMxBMIKYkXr2Qzeg7JNvuxeWXP0avBsuvUJocOLBUgb2FX1BR?=
 =?iso-8859-1?Q?6Y+XDzE/9+4AiYUCm302OpqxJ6/qigUmxHaScfIlj2A03LUBp1hQryKkem?=
 =?iso-8859-1?Q?AJOufZ4y8NfpVySQCjOrEOSY/Qy/b9viL7Tu4x9IA4MhjEdeiFD64gq4aX?=
 =?iso-8859-1?Q?ajr2Yta+GUjQ0+UbFXdCip0xgFJDcR8EoreIEccfHZEGitTSHyry2N+Zms?=
 =?iso-8859-1?Q?8aWSAzEPy4GylE6vzrdFzq+XAoOLk3DJOmTuIkTsEW6g8jshMoWBPCbPHI?=
 =?iso-8859-1?Q?Xa4/5jWJdOtUKhMPnotmbiWH02jgQAhGO1xy6VLFmS/xf8edWLjQ6dDsUV?=
 =?iso-8859-1?Q?OGov2mlqJbqf2814PGVeGoIIZqeAnUpNfap30FEYofWUeUx6hLMGD5FYw/?=
 =?iso-8859-1?Q?grGgeGRVDs49fO9+zeb7masyxQsuoxGD0rbbl0BdsDyBqHBVLypJ+y8/YB?=
 =?iso-8859-1?Q?fnGtW8ATx8z8GW2MHUVj0+lEr0z/pKf5ZZAxDwKfC99/zSJ3J/MPL4uGhc?=
 =?iso-8859-1?Q?L9iAbf0CJs4K4dqP0/DONmQ81ctxSzOwngJn2pxvv8ovvxNblra6xXKCAj?=
 =?iso-8859-1?Q?j9GLbdrvqGOvtEd9VAByOHE/HzT89SyDMnuHBb5JFMo2+2MMYBLlIZCnhg?=
 =?iso-8859-1?Q?r6XqusVE4zmS55Ru1MVJH+mrc/ZU7jzXz2CS4GkdXU1mjTtXP3L9pqOhWx?=
 =?iso-8859-1?Q?HGY+/Y8dBmY2m2M5hFmsAu3H7JRe80Fxk2vvExBGMIxfjT7Y48FtEVB/9o?=
 =?iso-8859-1?Q?YxsI5i9iSN4BJ5EGBWJmq2doT8Kt0Y4MIXcXxAD36edWbBtFxK2Xh/mz4Y?=
 =?iso-8859-1?Q?eNB8GAd1DzTcNQ+eOKV6Q83UvBaO+cUC/8FDLPvmQxndhkE/7M9aSPgBTA?=
 =?iso-8859-1?Q?6NVypX59VrvGqPQ3Q8DsS/Dg5vwmp4ceS24vomDOnKicGLIAmwKPeYRR5d?=
 =?iso-8859-1?Q?JmT9KryJAtoer5h225XlSvofI8bYVpTulMB5b6+dGpI56KzSJJfxHhoZl8?=
 =?iso-8859-1?Q?wZoDJcWmZMVu9daV+u6DFmIJkubpusrwATgelhjuhDOmamr97xx/8btAd1?=
 =?iso-8859-1?Q?elYv98nWTFy2K3Tp6eECt48bXj/WJ97k4Ozc/nHuOa7ouq9kNnkwgKgJBm?=
 =?iso-8859-1?Q?1ewqRG29ELvRh4rkku3g3SlfGrrZV4/RMrpui5keMbXKW5UDt7Y3ScOwC5?=
 =?iso-8859-1?Q?1KB+SDMHUc4OgxLCb52JlYgZkT8ZnXwbNj4rNUIpyJFZBTYVyAgUOSlObl?=
 =?iso-8859-1?Q?lMh6WYlMERkHVSC8qqF1P1/TogAwKgzXAKaZivW3Iqd/ZvdpvFi4QpSCzx?=
 =?iso-8859-1?Q?EBrr1WYb2EgPxKhMMY1/k60i5cu8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kkx/39+NGtbbjp12Dj6SqrqmI9yfUkKlEXYPKsGPJyXTKoS6YLJ+JTGbP2?=
 =?iso-8859-1?Q?VXKUT706fNL1/UFYPpoyObQs/RQljLji+I3VcOi/mjqgf3J1oICTCyjSfc?=
 =?iso-8859-1?Q?YjQzCS0YX4wgNy+EfglhnHrlOaW/tVTaauKBAghz3RX41OkC79KduqFZJC?=
 =?iso-8859-1?Q?UodTjToecpbpw75/mN1lmTfJLd9idroEWyyQz1ZQbxEh7w4jbxNaDXhNPM?=
 =?iso-8859-1?Q?NX+DUW/9KDC/qm0/OPri6yfzW5pLEXKwjXR4nVoeP/+kR7wlVKk9BLgz/x?=
 =?iso-8859-1?Q?AKDmCkvCmLwr+ZB6kkx2k5/XcR3RZ6R5LJ0ZmmUnfjhZ4Chw58ja9OkYOP?=
 =?iso-8859-1?Q?qeyQi+tiiqPomTpAj9NMm7Tvoyz0m6U7JNZKu3B/1DdsuXuoCfopeBsogK?=
 =?iso-8859-1?Q?CTSEBUDREMZK7hCELsobXCKjyS4cDcz23D++K9npxJJKQqQq9sP102EKG2?=
 =?iso-8859-1?Q?pA3oo7a8yY+F3VZaBdTNS46Q73aXxpRw81o07WhwIiO9C+AGoM+DsQRjVV?=
 =?iso-8859-1?Q?XD5H7xpuJtCKSN3jPmT7/lp7Fo6hV369M1cLwu7yv5lQzAsruBnFchZ8nN?=
 =?iso-8859-1?Q?qLVBWmV8XVILi4gcK5IRhy0oLBz/0jnOScQruuU1uR0qUf3eh/b6it3RDe?=
 =?iso-8859-1?Q?nv7PqVzkBBfbLpfJdHi4wqZ7VYjujZHiOY78k7wkyNB7a4NNfU8JJzZKS+?=
 =?iso-8859-1?Q?OKUMxf15oHuIpnC58PfqTLbaswGBtUJqe7lHFCozWXbXiEFqAz5DUGvHHU?=
 =?iso-8859-1?Q?uvcSlT6m9aRLcVOycngPg0lwL7pbf+9zTU148jaEU9t7eu//ff5bVUwGgW?=
 =?iso-8859-1?Q?phrgzzkSdoiiefwugxASD8uqQBB1VY49gU4NG6hHwAABzKiCov1p5GfX/F?=
 =?iso-8859-1?Q?f5DC6InD3jfnapxpXgeQ8Kgky4jRzLgi3j/iuJgZZrnUdVsn5blxd8NBoY?=
 =?iso-8859-1?Q?32ajlKqXaXKQptjk1giET+LMaKD/xWBThXtNIuie5RPkFK1LVKAjb54N4Y?=
 =?iso-8859-1?Q?w5NMNzXE4mvjdSO5NMSpXrZZ8B0M4armQeNl9x4RKABdTOSLH6Wsic7Ua7?=
 =?iso-8859-1?Q?LRr6Q/41NJqgsiGhn1W47xgmtSMH3wgchfIgRvqoYGjZIR/XXe9xHnykkW?=
 =?iso-8859-1?Q?ovb3YeEkr/8PPmmJpgKiAYzC3Tzb4l3OBIOj4iCTbQbiYZs7AKoN8QHwBr?=
 =?iso-8859-1?Q?1tjVvIP+VrCI+BJmfD01DUI3y3UlHiFfbZioN8vGo7YMlkEYRSl+Csl20Y?=
 =?iso-8859-1?Q?nTTeucwL70DdNE1UCU7e0li2gD7C/tpDHuZl8fFfOvm+m9JgmzTbAs0oVZ?=
 =?iso-8859-1?Q?ZCGp7K6iwrmqT0PGE5KF22+JIYRRzPynKcT60f7/64GOzk1CuMj2fQAUdH?=
 =?iso-8859-1?Q?Uulgxa05GQz9eBKinxYO9IUEpNaY2Oif9uQtOn4s8g0jmUFoTd5XX8qQFZ?=
 =?iso-8859-1?Q?FMOt1Q6ZhsP6ind0Jm9mv4+FaVAVXUSwwHnWdV8P10/xzsUx8GEhSLgErT?=
 =?iso-8859-1?Q?kdpJaCStS8Y/+JMGOyC1Ig9GH+xwlfY1m70PZcEx8opIInfMm8P4EanAEH?=
 =?iso-8859-1?Q?3j92Xjo6wEhKFHcMZKQ80MpKeoT1/J14W360uVvKyP06FmwqUudxjGU70i?=
 =?iso-8859-1?Q?EUHCmh/s0YIW2Dq3+p/HlBCyX2boHY9V6OnBZPBWYJE41AQ+JqBoXrKg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a985c0-0847-4d1c-d60b-08de1172c6a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 13:56:18.7433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zSKbUdZ+soXEA0xhsMlWandgN5gpGfCNrZIT2ABRJQH1+byIKpP25xgXih4AhAiB97crEijhhoISnSfFxVsrrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7644

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

PCI ranges have prefetchable / non-prefetchable flags that will be
needed in the callback. Pass the flags to the callback.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* no changes
---
 xen/arch/arm/device.c                | 4 ++--
 xen/arch/arm/domain_build.c          | 3 ++-
 xen/arch/arm/include/asm/setup.h     | 2 +-
 xen/arch/arm/pci/pci-host-common.c   | 4 ++--
 xen/common/device-tree/device-tree.c | 5 +++--
 xen/include/xen/device_tree.h        | 2 +-
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 74b54cad34..cc0759023e 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -50,7 +50,7 @@ int map_irq_to_domain(struct domain *d, unsigned int irq,
 }
=20
 int map_range_to_domain(const struct dt_device_node *dev,
-                        uint64_t addr, uint64_t len, void *data)
+                        uint32_t flags, uint64_t addr, uint64_t len, void =
*data)
 {
     struct map_range_data *mr_data =3D data;
     struct domain *d =3D mr_data->d;
@@ -325,7 +325,7 @@ int handle_device(struct domain *d, struct dt_device_no=
de *dev, p2m_type_t p2mt,
             return res;
         }
=20
-        res =3D map_range_to_domain(dev, addr, size, &mr_data);
+        res =3D map_range_to_domain(dev, 0, addr, size, &mr_data);
         if ( res )
             return res;
     }
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fb8fbb1650..4bbffdf535 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -762,7 +762,8 @@ int __init add_ext_regions(unsigned long s_gfn, unsigne=
d long e_gfn,
 }
=20
 static int __init handle_pci_range(const struct dt_device_node *dev,
-                                   uint64_t addr, uint64_t len, void *data=
)
+                                   uint32_t flags, uint64_t addr, uint64_t=
 len,
+                                   void *data)
 {
     struct rangeset *mem_holes =3D data;
     paddr_t start, end;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/se=
tup.h
index 1eaf13bd66..97bc5f90a1 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -62,7 +62,7 @@ int map_device_irqs_to_domain(struct domain *d, struct dt=
_device_node *dev,
 int map_irq_to_domain(struct domain *d, unsigned int irq,
                       bool need_mapping, const char *devname);
=20
-int map_range_to_domain(const struct dt_device_node *dev,
+int map_range_to_domain(const struct dt_device_node *dev, uint32_t flags,
                         uint64_t addr, uint64_t len, void *data);
=20
 struct init_info
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index d3481b05eb..67447d8696 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -418,7 +418,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
                     bridge->child_ops->need_p2m_hwdom_mapping(d, bridge, a=
ddr);
             if ( need_mapping )
             {
-                err =3D map_range_to_domain(dev, addr, size, &mr_data);
+                err =3D map_range_to_domain(dev, 0, addr, size, &mr_data);
                 if ( err )
                     return err;
             }
@@ -434,7 +434,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
  * right place for alignment check.
  */
 static int is_bar_valid(const struct dt_device_node *dev,
-                        uint64_t addr, uint64_t len, void *data)
+                        uint32_t flags, uint64_t addr, uint64_t len, void =
*data)
 {
     struct pdev_bar_check *bar_data =3D data;
     paddr_t s =3D bar_data->start;
diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/=
device-tree.c
index 0b5375f151..5ee1fa4eb1 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -976,7 +976,7 @@ int dt_device_get_paddr(const struct dt_device_node *de=
v, unsigned int index,
=20
 int dt_for_each_range(const struct dt_device_node *dev,
                       int (*cb)(const struct dt_device_node *dev,
-                                uint64_t addr, uint64_t length,
+                                uint32_t flags, uint64_t addr, uint64_t le=
ngth,
                                 void *data),
                       void *data)
 {
@@ -1041,13 +1041,14 @@ int dt_for_each_range(const struct dt_device_node *=
dev,
     {
         uint64_t a, s;
         int ret;
+        uint32_t flags =3D bus->get_flags(ranges);
=20
         memcpy(addr, ranges + na, 4 * pna);
=20
         a =3D __dt_translate_address(dev, addr, "ranges");
         s =3D dt_read_number(ranges + na + pna, ns);
=20
-        ret =3D cb(dev, a, s, data);
+        ret =3D cb(dev, flags, a, s, data);
         if ( ret )
         {
             dt_dprintk(" -> callback failed=3D%d\n", ret);
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 06d7643622..1091e34a10 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -667,7 +667,7 @@ int dt_for_each_irq_map(const struct dt_device_node *de=
v,
  */
 int dt_for_each_range(const struct dt_device_node *dev,
                       int (*cb)(const struct dt_device_node *dev,
-                                uint64_t addr, uint64_t length,
+                                uint32_t flags, uint64_t addr, uint64_t le=
ngth,
                                 void *data),
                       void *data);
=20
--=20
2.34.1

