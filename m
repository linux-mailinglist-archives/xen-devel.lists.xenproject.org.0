Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08E4B17FEE
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 12:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067066.1432033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhmhB-0005au-C8; Fri, 01 Aug 2025 10:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067066.1432033; Fri, 01 Aug 2025 10:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhmhB-0005ZN-3u; Fri, 01 Aug 2025 10:09:01 +0000
Received: by outflank-mailman (input) for mailman id 1067066;
 Fri, 01 Aug 2025 10:09:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZgs=2N=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhmh9-0005WC-Vi
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 10:08:59 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a582ccd-6ebf-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 12:08:58 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PR3PR03MB6604.eurprd03.prod.outlook.com (2603:10a6:102:7e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 10:08:55 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 10:08:55 +0000
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
X-Inumbo-ID: 8a582ccd-6ebf-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9MdfkDwcFcajH7GPqTmJBRXSDtCKrH4Kt9msnhE+DwrPoJ2iVntZfEruBhaBIRQ4ZZAN/fPMQaaC++dScF6ITbUrJTJKizvtW45hhs68JtEAjTPaP4rlCDhNMi30at7BwpHxxG/RwirbK/4YESwOlwyKIvOaMVa3wcGQnHDfPA6i8cP2ACx1aZDKCJ0X52RHfm8LTGK/mlBqdhql0tA3pM00fKVf63YvF5x0SvGF1wmO1u4WH5q9/+XuUjZzXk8z5a324b7qmW7VWOe9qRlr4t2Zzv+CKRn+4EKGS2iKIs79vMk0sr81GEsf8p/3cm3aSOpj1pMm/QYGsOIpWrqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhrW+V/hemzoP+DtXLKMsqG2TgRmcS68TWrkcQYa+0M=;
 b=gxTc8WwJGQCngfsve9GeYvjEaHEk8cj9Fz1T7oiDDI1xba6VJKjSGLiMUOvR8cOPXntyhw+XMDjCNRTJ/2m4b5aDBabOtj/pfsFIJfA+8otnZ4taWAPASDKTrXTjv6Isi7fvZKaWjhVqkneKZ4s/nBoFw6Gex3S7FKyBXQB88zlCL3p8cy6w3Sv6y4G8Diub1bQB0X9J7EZ5GxTE99E09/ZQG8pw78NLFjn7BGwrDS+38UqeFzw+hX5gyuZUyjIT+c8tI+Kk4xugWTDNgi2dLQyxrpoYsaiyJI8ri+rkZjgqXhg3EloEPJQmEgkyhHAu+Zu/yZQzIWUupwdU/4Z2BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhrW+V/hemzoP+DtXLKMsqG2TgRmcS68TWrkcQYa+0M=;
 b=PrlXsv8y4Gu0CDSDkvUj8cSjvC5NwEizF9waqg9K1XCQcAm1nkzFpxIct89fCpBsZnlpONwMNbOQlWHJJ3lrfrCrnyUvTqU3RoKPkJ535Euw5k4C9lUpjgNKSOQDjb7HSwHpD3c0h9k+EQXKJGeWol7IqXNpttZdPgVeg16h+50pRgydIBR9B85Qn3FK6CNgrFub0AkvJFv36CnNKixzaeuvOqRY2pJzoZZ4vwtHs6iJQIEd2A6Dy9CDtPkT4YE4FJs77VB8EwfYkjfk5cjI9QN+Mxh8MYpX2Ptw0RWpP55KZO7W2IuiHkiG6amSRrgf49EBehF1gutwxCl1Q0suFg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH 1/3] xen/arm: irq: drop unreachable pirq callbacks
Thread-Topic: [XEN][PATCH 1/3] xen/arm: irq: drop unreachable pirq callbacks
Thread-Index: AQHcAsxJ/8w0RwTi1Uey9StkpEJ5yQ==
Date: Fri, 1 Aug 2025 10:08:54 +0000
Message-ID: <20250801100852.1260544-2-grygorii_strashko@epam.com>
References: <20250801100852.1260544-1-grygorii_strashko@epam.com>
In-Reply-To: <20250801100852.1260544-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PR3PR03MB6604:EE_
x-ms-office365-filtering-correlation-id: 577b1e57-9776-4cc6-8942-08ddd0e36cb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VT9R5gy1Wef667O0S+iXWrGM5Dp+ffps1h6NP2WD0qUlihF9wD1SptOlXx?=
 =?iso-8859-1?Q?qz0SNP/bw+PTPlysainnoJZGqZCIljok7yl/UZk55PHeFEoFHk9Dk+lA80?=
 =?iso-8859-1?Q?kEVKh/zrCK7/D28t+BkN6HOMXJ42vi1Q169hr3lFYsuqVs0jCThotscMbw?=
 =?iso-8859-1?Q?aQnHyO2TzNu2NM3AAHIGLUwOV8mWxuUrbSEGcCE1ZvQvMfnqNDip04TYGk?=
 =?iso-8859-1?Q?WWsg3M8x9//e+vMlyDjfIsVJz8gOHNct/T1B/9cSxWhnv7YElTMu5biHgL?=
 =?iso-8859-1?Q?+dx7NxwvyMWf5SVo7J9tNn7z0Q5dmGGeuUorBMWM9UHS5N2tx7x35mRCTo?=
 =?iso-8859-1?Q?AxV6oBiN61NoppWPqQghAXHg9N9XojWvNGqngLnfmGWSK0r1ycEciUQLOm?=
 =?iso-8859-1?Q?KCpxIBtG8B82fcX+BW71G01xzQrJ6WfT1gIf6fWSxANYHYjzfyHKE49o/w?=
 =?iso-8859-1?Q?6vLYmiIY2rzsuWD4dtEho2x3sVVE82YCAaj+42TnhQVM/QUrAM3fuVX9RJ?=
 =?iso-8859-1?Q?ctIm8bINotDD1KNFmNm7EpEH1E+5y0Qx6zoxHQvNftR35O1lgSqNMZ07Y2?=
 =?iso-8859-1?Q?5ycWdcJGeD+ubKp271fL+aFOl0m8WQrpZm4JI8QkhgPthBYQ9lasDleimc?=
 =?iso-8859-1?Q?IvsqKcz+fnMGYXUV5+YV4zzriir+m2V+R4plhXS66ZsOM6SearibWCw1wl?=
 =?iso-8859-1?Q?i2mvpNVPO6u+g65N91/o4akRpa5fURNgWshBRgbZanSnG1xabs21mL+DRn?=
 =?iso-8859-1?Q?lPk457cZuP0zjyKUa0+ur+oEH0cAcjZYF4D10Fcse+pYTf2p0NZa0HJhau?=
 =?iso-8859-1?Q?+8A3XRo47L1qNFfgZbaURXsYiLNEhXiVeoZHE5lTRsj9E9MalMfsrh2npn?=
 =?iso-8859-1?Q?ZzjKf5yvLrTNfDtUZj/5Aip5InD2pcY//gRQ/EiismHJ4fIa/esSlm/d9y?=
 =?iso-8859-1?Q?4EYsuR46Ub3+AFn/yn498YUUSnjZwxYRXcCLcR/CFp44hU5o8hqoo69Jr9?=
 =?iso-8859-1?Q?vqXCUemLZf2cKw42IJD066wxR7Dn/sR2MAryP97ndbbzWOve3onp5jY2mH?=
 =?iso-8859-1?Q?0PSvgbxfx5WY9MuojYRPN852os00PE31meANTsEJb78Rr23pIH2NgBod/B?=
 =?iso-8859-1?Q?aLCBRJCWkTCzIvwAm6DXj9z+odg2EUmYZ0JBBag38fR/vmyH4vxYe+TfL4?=
 =?iso-8859-1?Q?683VWKIHIJsYVWtpdVzvlbc1VUSRg4yGoBklhGEU2N7LHKZVVLQ/+VwI5l?=
 =?iso-8859-1?Q?Wgh1NSykMjoRrvlYx+DvifYnV53AeNJ+ibwTbRy8IMdWoNorXH1xqUXYww?=
 =?iso-8859-1?Q?SAG6DrgR6yNK4BNIisJjo6cTmEe2yAiImGunouN9TdaNkzbXmf82bdIVTC?=
 =?iso-8859-1?Q?dYMPecRBH+AGX+qe+GUj6ZPAqk39VYEGZ5unkd6dPRt7COA+2RL9tfiOqH?=
 =?iso-8859-1?Q?XcbNWKgBwqwpYEQ7z1haxSXznKAzWrn/j6sPjt17anSrXhHm91kdXeTtFe?=
 =?iso-8859-1?Q?cbr3oBzPCgNl5NhpRGhG9/bkpWTRunPWXO9r6MCss3lQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?e5G25lDLfrUO0GOicXRTEpfwURHyctiDipca6LV19dMrneFIZkMJJXM1qx?=
 =?iso-8859-1?Q?CMeb3PhlSsPlJoyDaRGvCNrFgGDTd/X8Ur9FR+K4UUWY9R3sdSzeEUS6dX?=
 =?iso-8859-1?Q?dj5L9tEdV6GZHjMR5bKY4BSuoFjW1jUgACu+rgsGP0upzORPtkHqernTM9?=
 =?iso-8859-1?Q?5KCCE6zgqN9LQAzujJ77kt53sgg+Y2MxNkmTvE9sQ9s2zCao/54F+NfuMj?=
 =?iso-8859-1?Q?3vBk/cQnU7gMfo6l9I4xQcCTZP15e/e3H8icR7gzCco8dtt8JSjZDVkkCz?=
 =?iso-8859-1?Q?U85//M0hGguJyloYQYCDUIyCEgxRZnlVzMbjQMVLiHFWjEO/uelWeSHYAe?=
 =?iso-8859-1?Q?ZjZAiBpmC6uatF11yx97pDciXp1JFWu2azXONsxUmqEDf1zfWA8gCLuFmq?=
 =?iso-8859-1?Q?PBsGLyzWRVatUsGwOLKtQhFgV9RdA0oJTDFJDkFFjMMUyJXDckqpiTm3AP?=
 =?iso-8859-1?Q?Jx7ofrbkXiS6GYMEdN8d8XQqeCuipABQ0LhZKmlcbmqc9pA/6ifED1SrVm?=
 =?iso-8859-1?Q?4rRfuKSqsozyG4nP/ffyVD3Wur3WpEIDi+pq0sjz1L7RRVIgg2+BxKQhVJ?=
 =?iso-8859-1?Q?LDcagYfXk2VuJ2swN6NNwxgzEGf70OBRXwieXX1HQ+bh4mYVjp+rZqzF3x?=
 =?iso-8859-1?Q?5LXRxSHJ+83larjfEFPiReNuv2sflMlSR5TZkok9e7H94oqXebprvG+1Fd?=
 =?iso-8859-1?Q?DjRgao0qPgl7sBx9jiJfUsEkFjjVBVQUw6yupOdkwYeMFVT4CfWfvCE0cc?=
 =?iso-8859-1?Q?180TX37Zop/36mQXV6r4a70W9JfZLRAd8vnfDIi5asdTmCQI/JiPd9jlWa?=
 =?iso-8859-1?Q?X7CsxwJxS8/00t0rbAU26zFce8fZ036T1HAyT/ELJ6e5vpB62bWR3Q0uS+?=
 =?iso-8859-1?Q?Jt0qyk/ixCtRqZ6OCan/+E9JYZflW7Giaj55S24xV46MIzecxu3gtHDOMk?=
 =?iso-8859-1?Q?TtZRoeYF0oiM69HnHlxj2MelY7TWatEAONnpNJJUgwbLpEfX7SUPA55GEM?=
 =?iso-8859-1?Q?I28X6kb7rofJuZbXKu0Ypx2xQ7qcX59YD760P5NdDo74IliV6YELKtTLLJ?=
 =?iso-8859-1?Q?n98mvShlqb/5kISpg+rIU5W+5lmBZ+hjfip6QdpvfdtgKHm7aFOVUR/VGE?=
 =?iso-8859-1?Q?ea1sx8P4QuxlRzdad8qwSXUB4r6X176YT1CzlnIXy/n+Fnm66+zvmPF/v2?=
 =?iso-8859-1?Q?5j+KS9lfQlRL3iE/Ii+nVCO1Y2g4IEmmQ5DUqsrfpEpM9yTrLvkoKkKrXf?=
 =?iso-8859-1?Q?xbdavUHQVBmWVzI10mg/exdkvRe3A8ZYsqIzYHIhr9CCO39bVBIlXZWAY7?=
 =?iso-8859-1?Q?uDgNFv4M1MeMKdY9Oznl/1XfN5izL8CY4uXEnBcuAHwxSlUkFRTw2RCpX6?=
 =?iso-8859-1?Q?0HIOiGmmtCijP/2GDjS5j/cih1GzfarQgxBnvSTm6QES9bk4jCxAtyZJfs?=
 =?iso-8859-1?Q?xMua4HfFkGcF8zKG2HDwU7/sXI1xoeVswUaIj4bhQaW1psZ2aNTcLYN7SX?=
 =?iso-8859-1?Q?6509QjhikZYHmvjduNhlEsPl8XMxyOq+TeL3I8H9qOiHZdtysnXqNKfqpk?=
 =?iso-8859-1?Q?0fx8qriIJn6D9V8/uSpwDtTTeGP612dKTmGom/8y0MQYR3NZ+H1mhXZUmt?=
 =?iso-8859-1?Q?BfdLzH2krbpGk+7vczCuf1sreZUZcC9MmT/+gQgf/25Bfes4W3Vzvp6A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577b1e57-9776-4cc6-8942-08ddd0e36cb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 10:08:54.9786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqG8pTQ4VpenTvCN4bhPlAxicEiqj768lqJeb4MB3FCfevFxEKQmb5TszRrZArAJiaiXkWxops7qAJPTSe8WftnlZCXqupqFrgWDGhdKkoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6604

From: Grygorii Strashko <grygorii_strashko@epam.com>

Hence all common pIRQ code is under CONFIG_HAS_PIRQ idefs corresponding Arm
arch pIRQ callbacks become unreachable, so drop them.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/irq.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c43..4bbf0b0664df 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -595,35 +595,6 @@ unlock:
     return ret;
 }
=20
-/*
- * pirq event channels. We don't use these on ARM, instead we use the
- * features of the GIC to inject virtualised normal interrupts.
- */
-struct pirq *alloc_pirq_struct(struct domain *d)
-{
-    return NULL;
-}
-
-/*
- * These are all unreachable given an alloc_pirq_struct
- * which returns NULL, all callers try to lookup struct pirq first
- * which will fail.
- */
-int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
-{
-    BUG();
-}
-
-void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
-{
-    BUG();
-}
-
-void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
-{
-    BUG();
-}
-
 static bool irq_validate_new_type(unsigned int curr, unsigned int new)
 {
     return (curr =3D=3D IRQ_TYPE_INVALID || curr =3D=3D new );
--=20
2.34.1

