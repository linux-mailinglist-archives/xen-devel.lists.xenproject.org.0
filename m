Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE7EB3FB1C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 11:49:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105992.1456795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNdx-0003F2-Qq; Tue, 02 Sep 2025 09:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105992.1456795; Tue, 02 Sep 2025 09:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNdx-0003Cz-O9; Tue, 02 Sep 2025 09:49:37 +0000
Received: by outflank-mailman (input) for mailman id 1105992;
 Tue, 02 Sep 2025 09:49:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Qz2=3N=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1utNdw-0003Ct-FI
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 09:49:36 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 214e7c94-87e2-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 11:49:34 +0200 (CEST)
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::20)
 by AS8PR03MB7524.eurprd03.prod.outlook.com (2603:10a6:20b:347::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 09:49:32 +0000
Received: from AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b]) by AM9PR03MB7025.eurprd03.prod.outlook.com
 ([fe80::bdd:3097:e48c:6c4b%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 09:49:32 +0000
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
X-Inumbo-ID: 214e7c94-87e2-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXXqG/iTYeVFZJBh/hJ1uxxic29K/XhdVBvBCOxxqVaxhOFOXy5gh3TafM/Q3VbQvjRvjJk28IgJWwpFxPZUMM0vVJuX41zQvahJkqbs3hayTKWJosIl3vqfeffjSEZ7QpMeOdCP/DemKWSBTlMXU+UN3v6goIp2FSou4rMZMd7r+FQ4JEuOxvk+LTaUT6IK175bvzfMjjViDHLawOuHjmDCJkBBge5VVVIJP0VrUZKnE/XLyUlCwzPyEKCqZ+OCbgCGzJ+lnJOoyxzwyDKuH90Lg3TuqKDQS0L4J05OHOT60JZTzHVNm3rNHRea/Bot+srrEpEFLcoVTkYho6XiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hugrVlPjd4ZYGk5GZLw7kCjfIEEafvROtFkSpJP/WA=;
 b=DczYT1+kFbmoPjOFkU8OxulGTC45yWtR0QITB7+Nh7XOyBuIdZaJYsiKGEVnlUAiX2GYnnmyMFDt1egwnRDQuUqcDBBR8xj8AaVH2iYbkGJybMVICqtKf2w/DuPpT8KJ7QL08c9zxUb1YPqXnkFplLY2QPoIHNDp8v19c0/bElTID86XIM3qtKmf0OO38m72A5DNV4uwpe3pP/eEKOeGE7QdVlayvmg2rOPrYxID/CX85YvYEwnK7jr3IaAFVML1hqxmOkAtodPYyPZt7burOSNaKYRENfGVEwkRtR3pkOwH/fAr6HHXlIYRE76vbz1Do1r5si0IXI8u2UQncje90w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hugrVlPjd4ZYGk5GZLw7kCjfIEEafvROtFkSpJP/WA=;
 b=PbYO8nynLcuAGeMbldGMuF7SowKsCmENJe2M9LxCKGK5mFV3CPFJKaO8blB+BNHsvupjGX49Ba/SQ3WsoKoiDmbu0Zlk8+5TH/SGnH5lPuVZB0C7tK9BuaUoJI9++uZ4qswIYQoT/D4Bt+StXP01Qh07sUg/ihvk5goUnsIWd5tcHXjXKVjDycbHr/1bPz67h2O6H2/NXuoPB00io4G3Kkl5vrZYQDY3jPmXa/YpwT2FiCdRnwEGkGZC7VzhZADS4RhH3vQTuxpDK8zbr6tGo82MKl9asBQqZTOR0ZUV9Ud4CtxKGJx/G2WLveEzGORIpVGAbDV3vPmttfIb74NBaQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH V2] xen/arm: dm: Drop XEN_DMOP_get_ioreq_server_info from
 supported
Thread-Topic: [PATCH V2] xen/arm: dm: Drop XEN_DMOP_get_ioreq_server_info from
 supported
Thread-Index: AQHcG+7h2TGQQIBGXEebyEy6VBbgNA==
Date: Tue, 2 Sep 2025 09:49:32 +0000
Message-ID: <20250902094931.1733774-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7025:EE_|AS8PR03MB7524:EE_
x-ms-office365-filtering-correlation-id: 11dead38-5939-499f-33c5-08ddea060472
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|42112799006|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fXGxzWW7zLwdIKqS+P1mvX6RslXwr12mjvQ/A8rn1eKrs1XmtCr0Embyc9?=
 =?iso-8859-1?Q?WPjh50RC4rNi2SyCuiWRCHkCdFmDowNxSMUzQmRkvlXtccjd6/znGEdmiN?=
 =?iso-8859-1?Q?bsDJo0kN+Y5vopEH7bwiAluoKo0OeeJY7P0yOLYMvh4Nn40Its3iz8HWHG?=
 =?iso-8859-1?Q?uR/O55PvhpJMRjiS55CY275J260b4//3PonqUG1RPVVn6wv4N3qmhH9eE1?=
 =?iso-8859-1?Q?UitSf5s/XZFX3LcmH2/Vk9VHspQgX7HwQQRJDzc1/Mpp3XG/LvvOdAsnh8?=
 =?iso-8859-1?Q?uEmImIx4yK9K24RSsaFv+xX45zWUUWPrwXTZcWRbTVX+rpDeL3DTbct4o3?=
 =?iso-8859-1?Q?gy28Zx7Ng1sojGHJOi3BObwZ+ArwltH8hvtTL5++W0up5YMhbhOajBMDfa?=
 =?iso-8859-1?Q?+hgazQ3tAbr9XZDj3fpbD2+QiF7PI3Wz2TfjxiutU8OGuSBufPFVEYL1iA?=
 =?iso-8859-1?Q?w2h4hV5Oz1SXGOx228uM7DkQimICE6S6wKLhVCBR4mLFW79Kvc1nzgELpb?=
 =?iso-8859-1?Q?ujo/86ZVPBLBS+iOqX8aR0GXyTE00aflCSrF6UDe5zaqks9a8bXkkh5uaz?=
 =?iso-8859-1?Q?FiXkaX3hgjqYVe+xoPruZGKgXpP3vVCLSeVie7JAnTdxvijey3V2mTDNUe?=
 =?iso-8859-1?Q?z73bX+sXeVDp3xKKKaJ9BldPB5qkIG98wFqCDgubdyOJAmzN9+OG3OrmGi?=
 =?iso-8859-1?Q?rEIRgnWN2vGsUdpVuG89724959/fy5kCK4gaiIduwtXx+XghhRnKSAuJzZ?=
 =?iso-8859-1?Q?Krvgu2WCO9GOIkhE2DbU30RrrrgyKDBoBwNxUqr4hhrpQBhaRp/TzuSIrr?=
 =?iso-8859-1?Q?5A/51S3NhF6ehE9/NLG6TO+y6ClfWDu0jkGbWuUSdjgMOcVagDYgIYU7bo?=
 =?iso-8859-1?Q?UT9Z26ew7pXX8wYa8//jaBJGMFQaoRxB9gL/y42PSyx4ITCaLFdQG6ksr2?=
 =?iso-8859-1?Q?FQDENRj4L3SE8mbygUZ2xia4MHRla+/DIeCr/7UmPOpIRGlY5Ip/FPu/0x?=
 =?iso-8859-1?Q?3xOZErAJvZX9fUDbV6jkeb39Fg9rOQhsE7bmWm58FaWe6KA0g23E56SFCB?=
 =?iso-8859-1?Q?eEqJtqJc62mhdyuTNHy/kyMIBiAP7CyUJfQojYih/fIyObWBfDchn8J1Qj?=
 =?iso-8859-1?Q?8t+gdolb+yQVR92sd0kIDyf6Y0g/uN0uLWTEx69+l3qzFY4ScWzNkl6Fx8?=
 =?iso-8859-1?Q?V9J1DubFmKJmG4KL3V0+YGD0nrhsVrDJeP6GsVn5OzXsP6OpMV7gnuQato?=
 =?iso-8859-1?Q?WggOjUImIix4uCkZP3N6XIbmVJPrQXUI7xQPVi82pgOBqzMLb0h6Eg6WCY?=
 =?iso-8859-1?Q?lAHfsm4S/i4OJQnnfdBBaYANDRDzeDn0Zal7eSaXAaxKMakZ7cs9LZSXPn?=
 =?iso-8859-1?Q?vaFHSiXm5A3Dis1SR7Eg5E9EuZfSp3L3uQ2bkRSaS6HnpcQcSTbxskUSCg?=
 =?iso-8859-1?Q?0OIOVscRM+nwNZtbMniIN3PjRD+M+EK+sOjhKFn/Ul0IjbGPyoG1mVGrXi?=
 =?iso-8859-1?Q?8PFldFsz+M1wXy3VZs3HFOmMtZrMZDzDd6MKRaptzDDg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7025.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NzahQdEEHjKBUuHjNbQltwvhywb1tIOPl1zoO2GSKL4alLRhRp4a7yhp9s?=
 =?iso-8859-1?Q?GDTqQZBvC5sFiJDz47OxlHpMIiyHPm3QRFEBl5m22RULIIO62BQaz9cgg7?=
 =?iso-8859-1?Q?wDlelAUMboLW5JdhzHwuF6FbiDeWRPdgD8OWfild/SKTi5LYNjd5tU4RTj?=
 =?iso-8859-1?Q?JTbDJSUeCuRzWsqrkFf9NBWf46x6c6Q5cQ3yYplh0yJBpoFEsQ1DWQz87E?=
 =?iso-8859-1?Q?DHwWovJSB5WDZ9k1nyCHxhLfTc4KeAlAQIllYY4Wq6SNrL7T1/MxHYxTda?=
 =?iso-8859-1?Q?mqW6q/w0BBZsT5xzgftoxlvWtiewDqTGCjRp5cDy/qBsLnA4u6t7RFDfk7?=
 =?iso-8859-1?Q?TAkjscEV0dCY8TNPG3D3P/Mppbfd8GF2SOg8N4MKHwBDv2VxTFEs5ksjlA?=
 =?iso-8859-1?Q?/ubYJYDlDvWJ037YE2eXg6fx2ZGz0HOJX2947jGWDekjoCIdYS7d53lyBJ?=
 =?iso-8859-1?Q?EDyknTKhglu1lcQPtwaiFh3BtzznV4amxQxL5T7W7FhdJGVhDgvMG+NB49?=
 =?iso-8859-1?Q?hD+r4su85t9zGaQWgUXKGPPy4NZVnIX1St2JCSkBX/Vso4C/7rFqC4OFSf?=
 =?iso-8859-1?Q?VCKHzIU/RpUOB6t8d1TyMYbTxP/JJufa5rTTIDFLoslmJhW1OXvqqGZDaV?=
 =?iso-8859-1?Q?FdGe6mm6528C7NyhWnz+vo0QXgQcgKUuY8tCqmHWbF78DYOzK1uk+nbBWy?=
 =?iso-8859-1?Q?LDiq2b6/+9eK5V7TziAFMUlC0XBQekhEw7c4N8GXdTYSo2mIhxaFOXfegX?=
 =?iso-8859-1?Q?NwxKl4oA7sneTbQHIDiWbZuuU+zF75eKQzDk8cbQKklxHnGLG0zXRqEtg+?=
 =?iso-8859-1?Q?UcXh9rqy9iC/5VeyXzya1eB6L4HQG6do34NVHZ7ktIUnooP8ZptEyGqSP/?=
 =?iso-8859-1?Q?mRd3MgOMRrlC6+SEAFbuHD4zs2laXmNC8gqH+72IBQ3rBHwzW0y2DKyb0Y?=
 =?iso-8859-1?Q?IwN5CP9SvKuBSymzyQuyKYAlIUY5YBbDKfYw/QbUAbhwiV2vaxpFn4WKmb?=
 =?iso-8859-1?Q?j1md0v1YForH9+4EgCWiIQDk20RdIOMkz2yPi35JyEc01/9aYKf246nwza?=
 =?iso-8859-1?Q?aCV05YZ5mGJZwt8gv01GNBulWh2Ka03YFHB1+dJ8/N/EoY5GJds/aYXvKz?=
 =?iso-8859-1?Q?UkFUxGZ9K/Yd5AyXHiftKRx2e+yX6Sa7nq/5OwZrm3KQQQoMNm+7jwpy8n?=
 =?iso-8859-1?Q?ZUJ2zZGg8BzfV75G3ZvONDYnyWqeicINwSbEK1dkIyvKLq6nB4KRbcKu/v?=
 =?iso-8859-1?Q?dj7phc8v5pz4ctb6isd7cnOqk1XdtAywxcXKbRvWiHMvC441ReuhzW2B58?=
 =?iso-8859-1?Q?CcmSGk0QPy2nbN0BKvSnZLJRgnH1grFz4qpOH2eJQwMSdZu27T5nU9iW03?=
 =?iso-8859-1?Q?PspbUVLhcTDkCOFH79ScIoUQ7PMBQXg7iBWoqHEDMSvlPGr2ioTkKza9jM?=
 =?iso-8859-1?Q?BJpBds1H4WHi50Ybm9gkUi8RS6E870aStR59mMDD26ovVJ9t5+PVoqF2o8?=
 =?iso-8859-1?Q?c8MNqsXvC9zXUxary4Y6qdHAU0oemr0b/aqc0exC1RRLeJeLjLE0POQjj3?=
 =?iso-8859-1?Q?dOzGS8/UhbfAB6ITOxT1FjhHz6wKcBO9zESrF4UiQyVTAz0+mCP9057iW4?=
 =?iso-8859-1?Q?32lTXTpRtqXwXyLL1ZtPe9zep8yr+O+AJ5/kox+NRfG592vFttsbBmnNn4?=
 =?iso-8859-1?Q?H2j3Npa0Bvy8czfuYUo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7025.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11dead38-5939-499f-33c5-08ddea060472
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 09:49:32.1419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vh+1bmCHIplIDSwASx7m7grMcOcpW2QsO+1oOZM6kEtmwRAaI5oXVn28QUsHA+/WCfVaqqEoN4Er0MjhxW8PZLWawQJEQWP5577Ja8koaDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7524

The said sub-op is not supported on Arm, since it:
 - does not support the buffered emulation (so bufioreq_port/bufioreq_gfn
   cannot be returned), please refer to ioreq_server_create()
 - does not support "legacy" mechanism of mapping IOREQ Server
   magic pages (so ioreq_gfn/bufioreq_gfn cannot be returned), please
   refer to arch_ioreq_server_map_pages(). On Arm, only the Acquire
   Resource infrastructure is used to query and map the IOREQ Server pages.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
  V2:
   - s/Arm64/Arm
   - drop from dm_op() in xen/arch/arm/dm.c
   - update commit subject
---
---
 xen/arch/arm/dm.c             | 1 -
 xen/include/public/arch-arm.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index fdb3d967ec..67d2c950e5 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -21,7 +21,6 @@ int dm_op(const struct dmop_args *op_args)
=20
     static const uint8_t op_size[] =3D {
         [XEN_DMOP_create_ioreq_server]              =3D sizeof(struct xen_=
dm_op_create_ioreq_server),
-        [XEN_DMOP_get_ioreq_server_info]            =3D sizeof(struct xen_=
dm_op_get_ioreq_server_info),
         [XEN_DMOP_map_io_range_to_ioreq_server]     =3D sizeof(struct xen_=
dm_op_ioreq_server_range),
         [XEN_DMOP_unmap_io_range_from_ioreq_server] =3D sizeof(struct xen_=
dm_op_ioreq_server_range),
         [XEN_DMOP_set_ioreq_server_state]           =3D sizeof(struct xen_=
dm_op_set_ioreq_server_state),
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e2412a1747..023cc2f468 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -130,7 +130,6 @@
  *  HYPERVISOR_dm_op
  *   Exactly these sub-operations are supported:
  *    * XEN_DMOP_create_ioreq_server
- *    * XEN_DMOP_get_ioreq_server_info
  *    * XEN_DMOP_map_io_range_to_ioreq_server
  *    * XEN_DMOP_unmap_io_range_from_ioreq_server
  *    * XEN_DMOP_set_ioreq_server_state
--=20
2.34.1

