Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BEC47730A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 14:23:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247953.427621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxqii-0002Nh-JF; Thu, 16 Dec 2021 13:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247953.427621; Thu, 16 Dec 2021 13:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxqii-0002LS-FS; Thu, 16 Dec 2021 13:22:52 +0000
Received: by outflank-mailman (input) for mailman id 247953;
 Thu, 16 Dec 2021 13:22:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mgi2=RB=renesas.com=yoshihiro.shimoda.uh@srs-se1.protection.inumbo.net>)
 id 1mxqig-0002LK-R8
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 13:22:50 +0000
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070b.outbound.protection.outlook.com
 [2a01:111:f403:700c::70b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42a58ec6-5e73-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 14:22:49 +0100 (CET)
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB5276.jpnprd01.prod.outlook.com (2603:1096:404:d9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 13:22:44 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 13:22:44 +0000
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
X-Inumbo-ID: 42a58ec6-5e73-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKyjFRVKFlXbdEOxl94a5ek2NWadOtp8nv1G3WR1QeJdTgDgevPk2NS98qIACMVNNGqNrilrgFfFoqcjh/ON6aCo963f7tl/XTn9/7nxP7fjzGdqPmt/TH97OA8LVkkreMkdKdQgIxFWWiLcPwoj9TekZFibdf8O7YAx0VLobkOZBR3tugAfebsH0sMYCXVHG3Yf1HpdM+n7+Xey86JXzrHDovbXfiYk0LzqR5TvOvezm/RZbGAVmHpxfmqDh8aEtp6sjDUNlJysu5USpFVe7Wop7uS2Ki4CfqWPNx9gn5jaXi3oHlMzdZCZptjc3BlfX3SJpTgKNES+Z8sv686zhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vqyomesbs3vI62kJf/1Pj5mkg/98gtIPgExvewx5RU0=;
 b=GdNE9rfdpb81f+vSVGTIfnW4+907NAc7VEtl0whKFyD45UcptZyzQPscveh3unbyp+qh+IcqkoYWJ7EDo9IU/G5eRYvHXRFbKHc2M/dH27S3d66Ne6G0elklT6O7vQJCe3IR1KHEY27pRG+myCJvVxvcvUMvh4nUIUpVhWBSGaMS3ctIt/F8FDDBMkCxZDTJ48PQlQ20S22bdu/VUrapz11hUK9HNVJywTzuEZF5I9aXRRBiIzt7jAD8iBbgsf8d5mmFAPqAzoI/EHnXyBC6EwzHWXvw/b0t0WC1rJfxSE1i2yNeNlBp13zERcgs8psuOyaWk0GYlMKo15Wu9tyN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vqyomesbs3vI62kJf/1Pj5mkg/98gtIPgExvewx5RU0=;
 b=pqb8xypAzJNRzhqVBHVW4SuFiE8QrWLiMii9zWj374pJ/9VCE0WsrtzXmxDVzWsks8n2S0qvAn4bjPZ+HQukalWLyk8zly3TheDSSP6mYESBTBcFKTPqZvsMzK+eGddlc8woRpe9ncj05ZwQZbMCEOvAYezxABSNkNszPAJe6Uw=
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: RE: [PATCH 10/10] iommu/arm: Remove code duplication in all IOMMU
 drivers
Thread-Topic: [PATCH 10/10] iommu/arm: Remove code duplication in all IOMMU
 drivers
Thread-Index: AQHX47d7gvrVCe55h0msi5zMEOFD6Kw1OHOQ
Date: Thu, 16 Dec 2021 13:22:43 +0000
Message-ID:
 <TY2PR01MB36927506C2BCE0F0C58C736BD8779@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-11-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638035505-16931-11-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7fbcec8-31d5-4061-8aa3-08d9c09724e9
x-ms-traffictypediagnostic: TY2PR01MB5276:EE_
x-microsoft-antispam-prvs:
 <TY2PR01MB527653FA8DC6F51CA135716CD8779@TY2PR01MB5276.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oxbKaZLZj+yK+5a7hyYGIhDuzCrYKhonbKQjl0lQIoDGQf2MSCQ9qNgdQNV2a1roYPboZHGFw3S+tqJbyDtUJPkmPGirzlO7IqNgoMZ/MfSJX3/BnExF9pd/YIUN2b/h9dpVK6Fafnmtsy24RJntnXASMI/euesCdc2/aE4Vt2JQ6Z4KuDQ1g4UiiI/V98E1BWTJ6Z5jGzmKC70hrlf0hjmcRlC3C7XP1h3YvVDUbIgVKUe+sqJjZHOJrN64m0amI5/daQgc89LeZiZM8xzIktDFFq+frWsZwePGUTo2V+x2gN0TRiJeOx7eS9PhU7E7dnXD+tOlYEJZtocXvOL4Bxd54AtpBjKSktpFCpzM3vaDXjFdymALt/uTUUyhNL67nFOYNnXld9FoTB17sEEaHQdqqDa94UpZd/ZG3sw9Argw6W77wBXAIlMbr+NW0y5dhW1QO+uaLBxuLIZBWRvajsfiZEiJ7+cNmH8sL9hafpJTLIMNZ1f9w1KqQOpMLlOAEWf6SEZZYcU7p3UQvxgaq7lSerVioEEVsmkc0mYOWEFJ+gPa3PUkqBy08o2ZgrV6xabgwyBQUPxkATxR2N/c4Fn9G7fPy5U6dwau+KHztDtLJj9SKg7Pw2esZ79wndCt4Ux+pA+DP5b3r5Uwy9nnFYD5MCO1hE9GzaL4bfocbVvheS9CwvuWu/wBhCJI968ghKyJW5Ud8xEFfLKELY4j/w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(122000001)(66556008)(54906003)(52536014)(7696005)(8936002)(66476007)(8676002)(86362001)(66446008)(55016003)(38100700002)(4744005)(9686003)(4326008)(26005)(76116006)(71200400001)(83380400001)(186003)(66946007)(6506007)(316002)(508600001)(5660300002)(38070700005)(110136005)(33656002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ic+5x4+s3vb4y6YHxtOEx1jPY7rqoQfHxs8JZl0hbMfYcfxyxgcoSInaDvLB?=
 =?us-ascii?Q?mIEi33VvND3sIBoyFHL35CJUsgHIC42IPJBWvV/b+nV7F/fJoV0gpmOery3T?=
 =?us-ascii?Q?uwoUkzPTs0r0vJo1xrfZWFKrCvwLNp/BDZFMYZyqtnBLbi2j/FrxHuvpPEsE?=
 =?us-ascii?Q?+M1qV7dGBDr5RQCAau9jSfrMfQrtq9Or2oMNlJVcyddmspaZChxWyAetpFLF?=
 =?us-ascii?Q?CQRVUk5MLobSx/yMzEaAm7IfA858tu4p/0x2QOYRK1vEGH58+ErHS+bfvQM9?=
 =?us-ascii?Q?zqHzKpK5ixHohRZi9Oz+XhGw8oDpHeHMUKVyLoVJc6GvMAcoVvRy3c0P0i+J?=
 =?us-ascii?Q?GDVir/LGMnHwvdPRaJz2/cnCzm8GEcg6bUQKRdpS+Xs8TiSiW8PNms18B6/2?=
 =?us-ascii?Q?n8vd3GN2YoP3UQPm/4x+hSoxUyLOQAQjB32mdSCccqPGLo0a9Nmm5crV8LnG?=
 =?us-ascii?Q?lRqMnxaCNKBNy2YaYVMeokKEW+p/krrDOEfHBGoNAp1e6VsKsQLHKJErhQxT?=
 =?us-ascii?Q?4y8kYj4YvusuK68VUgwvqjDprzcCPJYC6HYhNH6ef4c/bhS5Akjv17gsLi4Q?=
 =?us-ascii?Q?Mi+iG3HkGA/7/fQn85tIBATW2dlap7qhGNHz9OKyl2nhhk2BIg1f3mSqxB/h?=
 =?us-ascii?Q?xGeTOY3h2B2vCLVe+7suzd6kx2jBmC3NGe/WNdUPY3sDewvcntP34cMs229Z?=
 =?us-ascii?Q?Hb26XhI0/opELUWmIB76O3qnlErIsKU2d0fuK4lCU7jnagrCFwH634OmwU+3?=
 =?us-ascii?Q?rXTbu7QVcniD5UUX+HJM8ElN4cDk0x1p1cYVxVRa7Go0LQexj1jCcrvT4Uoe?=
 =?us-ascii?Q?pozcgefJUU/XxvQ97esmFFYfpCwoMAKiRplJ386zNuVknFDSiNdY3ZBSgGFK?=
 =?us-ascii?Q?etRCRavq6EctUvN9mQh5ORUZwzixJCat2jw6tk/NjvMy+3wvgcT/nU71CnLm?=
 =?us-ascii?Q?439vqy+z6BxlGd8YU829UniV8/8oJIVWJkc1TkSVn8eISCSpiH3UluwsmymI?=
 =?us-ascii?Q?gZVDI6jIdZINmopyy0hyKnVr2BMawBSB0di3tOusx9BOVxkR4cpRPUxYoIfv?=
 =?us-ascii?Q?s1jXhJWQneh6tytRyXQJk00xDmTTZe+Suzj97rXihibslt+Glh2uS0anF5G4?=
 =?us-ascii?Q?iYq15DUR9kQ983US5B/63laecoVG4SCMGmvVjDsJJyxVLTa1tadTGs9ZwIEv?=
 =?us-ascii?Q?txM20afgSsxwVTXj8g0IJ6gsZKierL9WlWW1CkjdqAoy3bm+xq0Fi9fxZ8KB?=
 =?us-ascii?Q?PtJ/Cx/ZMIA3FxBun4KnGqw7VZmBOXRG5aMzPcdBbCrlyvVYVLs2xvnGDAUc?=
 =?us-ascii?Q?YDSlFCO7MURL9lXgU6a0KHH4x+izc+O4clMf7+/UhLMP1/qHH8palitnV/oH?=
 =?us-ascii?Q?VC40JYcuDTONlfC0SuTcwav2WHBcpG65+C/oVMYvoCfOEEcIvPXUwNmZOcr3?=
 =?us-ascii?Q?kM0PVv/lMMA4lwPZkbcovwWVe0dAuIl8AU6kXrAnoQF5QXycZmmaKnZRrvOs?=
 =?us-ascii?Q?w9yG95HLQVr+q1G2X9ExBIe4zmnA0qy/T19AD69kN1FyzXlsp4j68Eqxgpgr?=
 =?us-ascii?Q?Zw/ZY/x50npl/LzBvhrYov0fLHG/6lh6fQ9fkCTxfOTcCmhGyN7nYRZz1z/+?=
 =?us-ascii?Q?JoCJVWTfmdTgIEa2ESFXjob426cDMr6GO4lvQzV/eLHKvzJ8WvzSLFPRnLJU?=
 =?us-ascii?Q?ihCbMpF7ZMSnr845rRpJM+RMyC2eyI6RDoiXfabMPYMuAHJl1BBaJlUrUkk/?=
 =?us-ascii?Q?ZDaH2bDTCw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fbcec8-31d5-4061-8aa3-08d9c09724e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 13:22:44.0126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /IuDmmvht+sgO/WySlwMlBogifWXjKT3cB2kov6Jq3fgZb2k87A9Qv20Lhntyw7e4VVK46hxkwr1ksCRs+de9zC7QmKmmOow4p7HBqBENd+yv+7ebekhVCEyZLjNywas
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5276

Hello Oleksandr-san,

> From: Oleksandr Tyshchenko, Sent: Sunday, November 28, 2021 2:52 AM
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> All IOMMU drivers on Arm perform almost the same generic actions in
> hwdom_init callback. Move this code to common arch_iommu_hwdom_init()
> in order to get rid of code duplication.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


