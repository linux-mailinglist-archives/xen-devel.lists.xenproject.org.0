Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521F9C27D38
	for <lists+xen-devel@lfdr.de>; Sat, 01 Nov 2025 12:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154893.1484552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAEE-0002eJ-Au; Sat, 01 Nov 2025 11:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154893.1484552; Sat, 01 Nov 2025 11:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAEE-0002cb-75; Sat, 01 Nov 2025 11:57:06 +0000
Received: by outflank-mailman (input) for mailman id 1154893;
 Sat, 01 Nov 2025 11:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLmn=5J=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vFAEC-0002Ar-GQ
 for xen-devel@lists.xenproject.org; Sat, 01 Nov 2025 11:57:04 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0ce5cc6-b719-11f0-980a-7dc792cee155;
 Sat, 01 Nov 2025 12:57:02 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DBBPR03MB7130.eurprd03.prod.outlook.com (2603:10a6:10:20e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Sat, 1 Nov
 2025 11:56:56 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 11:56:56 +0000
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
X-Inumbo-ID: e0ce5cc6-b719-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgmJA3uAa49HE3Ve+scjSFzxgFXDeZboeCHqtZ6My4f91dxWBugrdGNyyoZ2r4B2XLNPiVi2ujbysZ9+YWjP2pZjhZvq0pgygUHV/IEorQTj4evl7OShGK8slnGk5hivZUNytwAX2Bx3yJoocpsp1gn2fWWfukG9VocgnUDxaQBqARH+CXC21rOFMA5iXSkTr3wQ3ypr/+CF74AI/9Fb0EYqHR4aGuQtu3gHvqIlghBCou6tkZHuQe6T2d7akxntdY4iRi2tZwpj6CSCq0COxyYuQlNNUOWYzGVJgVkRw2tuLL5qRUg1nWHcQhGwnTWmyGm9a49Iz2gSU8C4dlJw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap5pNvfbZqnecfxDiQ1kPQR6h+0LuyG2cuRDI9rbD24=;
 b=vGGLGZF+DhHeiFyrH81ZlkDa2y8sOCp+DLr3dImfR9XdaRumdEJ6QsIYY/ip6p9j0XVgPYDN0lj8Wjp90C+2OfNF3CqjksVqm1/6ckGLR/TuNvN3R+vb16BC/s5HqUSnG0BAJOmgyBzSEQK1p5i1+2fKcee/aDskiQ/R1Ui/i0DM+mNVANYtX1R2EhDAWJHlh4Q39TI3RbtKdfSPnwskkGu/fumOrgw0NORJUZhbmtt4YnHgR11IdGDuev2kN9XrCvyigbS37dA14yOBhATfCSsYtvQ8Mc9BK1PyW374csxt0j2+nbxE4dmIP/okNwqCCsTqTLasCxincmQvhzxhcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap5pNvfbZqnecfxDiQ1kPQR6h+0LuyG2cuRDI9rbD24=;
 b=mAjQVZu4447JOHgdq2jMg95X+rnT9e/mGZi0zNXEDYzK0QwxgnZ/yMWtIvKaHPKK4xrvg9VX+tPkeNurSdbJPCFNgLqm4i9QD34UiZTSdg2Tj2pxeCdnMfV9ZXHSKaxJT5hRlw4Huhx06zOx1TYU4d1xlMXbv5mPVyxeY8dp4nr4GdyTbgqjFCnA2pMU3evG68spvechPxZj7JNZozCfDSL+rAohmG7xwXeUOcNUfKaVii50TzrwwxGGtzF9HDAIjeFCfJ2JkqXVO1msL4E5YzMqFSVgnuIMqG4pomMSAdiru97v1336pDIbTOK4uDziw5opiV3CF6fxG9XLNUHFPw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>
Subject: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to handle
 not only iommu
Thread-Topic: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Index: AQHcSyafS16SOr0Uk0OkeRdy8jd8Cg==
Date: Sat, 1 Nov 2025 11:56:56 +0000
Message-ID:
 <b0a72660d58608c80e7408eb8df32ec369d4e45b.1761998077.git.oleksii_moisieiev@epam.com>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1761998077.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DBBPR03MB7130:EE_
x-ms-office365-filtering-correlation-id: ec32d77b-1be7-474f-876b-08de193dc187
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?zDDDDGvDmvRsu8STx5Y5Qc5dr8IWAWgWUw8n+/o2czaDi1VP9Fj1lWivTC?=
 =?iso-8859-1?Q?WjekNoafnE34dzslhqwURmCrryzltIhX1fv3KqPX6wTO2y8Aj5nwZMaiCW?=
 =?iso-8859-1?Q?TOjMt2hzvXhG4woZNC2xsxz/XygjsU+Zh62I0V6aa4Apj3C0/V9jxjPc4k?=
 =?iso-8859-1?Q?Se+3WH7LFKS/h5OYdZPISlcv5t2wqphbe1ggpA9ao0QO6lEtK34rRVF74q?=
 =?iso-8859-1?Q?KzqNdLXFliUr4PeQjUL6BLZj5Oi7m14PXTClpZ7LHMsXm6bjWbInQpvDNL?=
 =?iso-8859-1?Q?e1s2JCTnxPLlivfZVT9XUgFzHBhSSoFFARSbn9FUKc0KAGXtZIAf3eRCCJ?=
 =?iso-8859-1?Q?HN2AdKffGw4dFKoLfp5M2i44FtA2RTwCmw0ec/3NNbavMQM8oEpcfb5G4+?=
 =?iso-8859-1?Q?fYxLvJ8H/yoBFF3tmUjdVVBFOQgPVDWtxxMuRy4ZJq0nl3CzUcRLibf++o?=
 =?iso-8859-1?Q?jcYbjRuIEPXqwZQmRpoQSTXWYI8U8hdSDXZB67t99doZwV8Zp690s9TA/g?=
 =?iso-8859-1?Q?uaJWkd4DU3QrMevErC9wnaUzJfbm01owZkspjHqhXnoqtwh2zdZrIsCqE1?=
 =?iso-8859-1?Q?0uTRlgbauXRFk8gmFSM2Sk2/pGMp1E0pf4vsVq0dDc06E232ehzaunmX0n?=
 =?iso-8859-1?Q?cG1Em1WXM970iOkP4FJF4AkqpR5hKjKjs+AFQhyNsXvyMJbFGY0NfPgRaL?=
 =?iso-8859-1?Q?3WVnEvVaLDN2HtEUD7ZGaSXBtOeKdl+DZc2IKKeV7/n9m84BRP/j6XE4In?=
 =?iso-8859-1?Q?kDuGnm8oN0SX6SHSPJ1heRfEn1M04RtiB+ocLeGyZwPm+jOHaQe5wNnNPa?=
 =?iso-8859-1?Q?QIFoetANqGvJxsN3gqh1/xwxRpQC/rLdW6aNd7HxYlvPaH1fvkMxoPRHS2?=
 =?iso-8859-1?Q?olWTpq6L3cIutNjRvg058TUMY8LGzXs2i9IOYofAol9QmrEa/PCTOuNEDh?=
 =?iso-8859-1?Q?zDE5NLGmnZakmxdu39oVT3unKDqulZiZKkSZOmZxKqOuUn0zzrA2vJ1LQy?=
 =?iso-8859-1?Q?04+RJgZqR6WLA9lKfvivYtkJ+K/uFVUmCSoYsP4Ev9BiLRBZK9Lm27XIRt?=
 =?iso-8859-1?Q?dQi3mhbNvUL8uOJ18waUooB/snYekbAGGrAYr6Bxef7ssUJkwjm5hHaYhn?=
 =?iso-8859-1?Q?rPqUJ5nlncFmtoTxXqEUDDr+0O3ihWeBLu2WmFocDmI9e+5u8o24Zc2pEn?=
 =?iso-8859-1?Q?sGWssNgKpkGtm4q+pLZ7zMjM1w/x8nwipRdzMpulelV+8ORr7AdZaY7WKD?=
 =?iso-8859-1?Q?dQ6pf4SXpDdWjnfyT9nPGOf1uIE7+i6eqZMAWooLQIitg2ZSWgTOAXrHAq?=
 =?iso-8859-1?Q?/sWnNrB5HT8M9eImv+mceHydT41zvNW+cEphXdIjsNOggiAhREuxDGaLZa?=
 =?iso-8859-1?Q?tQn1QXg1j3Zcie6pNVfRO51iJRvkIGJhtfvMKrJpP0z/hCc6ZGkTy9N+xf?=
 =?iso-8859-1?Q?7IITLyeuN4S6K+8ZcqDcslvka3OzE5WVHHofnBQqKaFWxfoTw0FZbNeCXN?=
 =?iso-8859-1?Q?HOSP5Oq0horiBK9AXyRrWL7rtuvUjSkGtZjoPnsitG+7SOoalW1MELNVQd?=
 =?iso-8859-1?Q?4qSJ4pxqm7eHwMMildhbwIRLM+eY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3UM73ozT2ZXxVerZIzbhAYUvgKBvoIKortFJ2cZW5jWOoxGSxk7ny+oaMA?=
 =?iso-8859-1?Q?Kw4xS9LWFq+YUA1glNy1mq+utE1H/1gWwbPJ3MD4K3v8wWtDEsdvhcdi2C?=
 =?iso-8859-1?Q?hJoWKoGY3/o9DDox4EKKJe566RfdHQwA9jbdqS5HYjXgMR4QK0GyeyQQLa?=
 =?iso-8859-1?Q?x43ru1xqCEkEW/Zp1BacnlY4QtppHoTfy+wHvRDQ1qtGzS8u8vYcWGHgaA?=
 =?iso-8859-1?Q?xFLqwlTSJBK0Y0JU4XSD41e5v3OmSVGPiXfkZTeR3IkhF8c4fFVP/WknRO?=
 =?iso-8859-1?Q?jc0QZ3BkxOEcV3rWuWx6F+3n+6gpm0nEKpVRcIAJSd//qMGZ+vhiXqSdVc?=
 =?iso-8859-1?Q?5cgnaJyWO0gvugvky/vFmEm6r6VF7eTi9ejrVRjSz+BUTQ6CN5wAi8u6Be?=
 =?iso-8859-1?Q?Ouaj5uXD4AXGgl3omiC7YLSkVpO7Wij1G1tNc9Gj0f6gYbdv3MkoWxPF2P?=
 =?iso-8859-1?Q?H0p9V/VvChh1zMxo19Xb0bNRFAu+1WsA91PG1OygYtEJ/nTvlQGx2XD/hH?=
 =?iso-8859-1?Q?zDlMa2VzoQvYZP+EhucHka1Sjnu9PioBZjQkJC50C1TSatGOXgev8ELlKX?=
 =?iso-8859-1?Q?VpczCpx0GYWrzYA+HIFtrYusGoeWt3PaPFXYbkoJu4Lr83AwnSjxTOLxsU?=
 =?iso-8859-1?Q?ihJD6LK4iKVeQfBYHQckzSXSPsBLi74pe+2ubFdEi65a1+VPtZux+NNgK6?=
 =?iso-8859-1?Q?XyvpKzZzkFTKb6nygF+ZxDViawC0oiX9fYPwMmaZdpKC7UrKjEeFIwcLai?=
 =?iso-8859-1?Q?8nrwnKGlCvxl7uhKadYLme8rMVZHnEU83CjaSDyBBydqeJGDMnt7yv+e+f?=
 =?iso-8859-1?Q?VzXhJywS9RP1V25YqiFH5WBvlJ8yXOvps+oI8b5+V6lPQMK8E3Ht9FRx6Z?=
 =?iso-8859-1?Q?p/0zQroRJZVbYVr6P/LtXe4WC0jb+AGVZzIeDXwxP71PZMWGsuotg+wYCz?=
 =?iso-8859-1?Q?jAFO4ryPmDDayU+u9TROVr4yg981LsnwJ2KZ9h84Zz5x4ZMYjEkS+KUgU2?=
 =?iso-8859-1?Q?dAVnPonwp+U8mXnvhzMr/2JHYwx2gOWWvJtoxt9zzdWx1pKSSOWBzCNtQ4?=
 =?iso-8859-1?Q?Udj1s4BldjkWZHNo1sEuqaUalWG6UpY0eJsBFUFzGsiEOOASi5/WKk3FvW?=
 =?iso-8859-1?Q?qgWxggwwI2hvO8Mry6aQUoMBxasD5GaR3tljE40pnaTMpNMx3U4ufSvrZJ?=
 =?iso-8859-1?Q?Ul/0xOcg3BHyAUNOXFU9RFMYlybxffbwcc3WG/+qfMwu6JXo3cl8s43kro?=
 =?iso-8859-1?Q?dmCI78V+wf1ZZLx9rS8XIUE4i1vGg++uSjWNpCwimiZXBlMTGY2YPhmyWt?=
 =?iso-8859-1?Q?DTTmjKesEgdMM3DTN0d5GDKtqrBwE5ptUbGma2oXBvuRtl8N4kScYHw7Gr?=
 =?iso-8859-1?Q?kXQoncQueM4j1W5X5B7nIjRElwES68Q83ndaT3uDoYFFh7mYH6TqJNkxrF?=
 =?iso-8859-1?Q?Y/qwOn1O+OklyzEjOg+FFinzCEC1UssK902t3jEv3i3qSLsnnUjJbKMYb4?=
 =?iso-8859-1?Q?/Q2mRiao21FDudlZxc8eHoBMTsFdM85d+muIxY5Lw2dYmCNlK7JadUYUlx?=
 =?iso-8859-1?Q?R3HTLbncg2yDZmgLKk4EjU1YM3KJA9QLDCaD4wu8WTgGVAlxN03sGZemHC?=
 =?iso-8859-1?Q?4CqZqnNy83YSmhyrrD6apK1JdjtUIBa/UUqvS5dK0qTMaBesvF6drUHw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec32d77b-1be7-474f-876b-08de193dc187
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2025 11:56:56.3165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GwtNHkJbb24eWhfnwY1WIt9sUG+cWIhtzCzYig/7QyiEENpiImxaIKCAfWlTcAzUJfhOVXqiULLz3J6hMfCFJZ/ruHnQSYvp82a3R39B/d4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7130

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add chained handling of assigned DT devices to support access-controller
functionality through SCI framework, so DT device assign request can be
passed to FW for processing and enabling VM access to requested device
(for example, device power management through FW interface like SCMI).

The SCI access-controller DT device processing is chained after IOMMU
processing and expected to be executed for any DT device regardless of its
protection by IOMMU (or if IOMMU is disabled).

This allows to pass not only IOMMU protected DT device through
xl.cfg:"dtdev" property for processing:

dtdev =3D [
    "/soc/video@e6ef0000", <- IOMMU protected device
    "/soc/i2c@e6508000", <- not IOMMU protected device
]

The change is done in two parts:
1) update iommu_do_dt_domctl() to check for dt_device_is_protected() and
not fail if DT device is not protected by IOMMU
2) add chained call to sci_do_domctl() in do_domctl()

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v6:
- change iommu_do_domctl and sci_do_domctl command order and
call sci_do_domctl first which will produce cleaner code path.
Also dropped changing return code when iommu was disabled in
iommu_do_domctl.

Changes in v5:
- return -EINVAL if mediator without assign_dt_device was provided
- invert return code check for iommu_do_domctl in
XEN_DOMCTL_assign_device domctl processing to make cleaner code
- change -ENOTSUPP error code to -ENXIO in sci_do_domctl
- handle -ENXIO return comde of iommu_do_domctl
- leave !dt_device_is_protected check in iommu_do_dt_domctl to make
code work the same way it's done in "handle_device" call while
creating hwdom(dom0) and "handle_passthrough_prop" call for dom0less
creation
- drop return check from sci_assign_dt_device call as not needed
- do not return EINVAL when addign_dt_device is not set. That is
because this callback is optional and not implemented in single-agent drive=
r

 xen/arch/arm/firmware/sci.c             | 35 +++++++++++++++++++++++++
 xen/arch/arm/include/asm/firmware/sci.h | 14 ++++++++++
 xen/common/domctl.c                     | 26 ++++++++++++++++++
 xen/drivers/passthrough/device_tree.c   |  6 +++++
 4 files changed, 81 insertions(+)

diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
index aa93cda7f0..31a7e5c28b 100644
--- a/xen/arch/arm/firmware/sci.c
+++ b/xen/arch/arm/firmware/sci.c
@@ -126,6 +126,41 @@ int sci_assign_dt_device(struct domain *d, struct dt_d=
evice_node *dev)
     return 0;
 }
=20
+int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    struct dt_device_node *dev;
+    int ret =3D 0;
+
+    switch ( domctl->cmd )
+    {
+    case XEN_DOMCTL_assign_device:
+        ret =3D -ENXIO;
+        if ( domctl->u.assign_device.dev !=3D XEN_DOMCTL_DEV_DT )
+            break;
+
+        if ( !cur_mediator )
+            break;
+
+        if ( !cur_mediator->assign_dt_device )
+            break;
+
+        ret =3D dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
+                                    domctl->u.assign_device.u.dt.size, &de=
v);
+        if ( ret )
+            return ret;
+
+        ret =3D sci_assign_dt_device(d, dev);
+
+        break;
+    default:
+        /* do not fail here as call is chained with iommu handling */
+        break;
+    }
+
+    return ret;
+}
+
 static int __init sci_init(void)
 {
     struct dt_device_node *np;
diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include=
/asm/firmware/sci.h
index 3500216bc2..a2d314e627 100644
--- a/xen/arch/arm/include/asm/firmware/sci.h
+++ b/xen/arch/arm/include/asm/firmware/sci.h
@@ -146,6 +146,14 @@ int sci_dt_finalize(struct domain *d, void *fdt);
  * control" functionality.
  */
 int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
+
+/*
+ * SCI domctl handler
+ *
+ * Only XEN_DOMCTL_assign_device is handled for now.
+ */
+int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 #else
=20
 static inline bool sci_domain_is_enabled(struct domain *d)
@@ -195,6 +203,12 @@ static inline int sci_assign_dt_device(struct domain *=
d,
     return 0;
 }
=20
+static inline int sci_do_domctl(struct xen_domctl *domctl, struct domain *=
d,
+                                XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_dom=
ctl)
+{
+    return 0;
+}
+
 #endif /* CONFIG_ARM_SCI */
=20
 #endif /* __ASM_ARM_SCI_H */
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 954d790226..b89559ef7b 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -29,6 +29,7 @@
 #include <xen/xvmalloc.h>
=20
 #include <asm/current.h>
+#include <asm/firmware/sci.h>
 #include <asm/irq.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
@@ -827,7 +828,32 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_=
domctl)
     case XEN_DOMCTL_test_assign_device:
     case XEN_DOMCTL_deassign_device:
     case XEN_DOMCTL_get_device_group:
+        int ret1;
+       =20
+        /*
+         * Add chained handling of assigned DT devices to support
+         * access-controller functionality through SCI framework, so
+         * DT device assign request can be passed to FW for processing and
+         * enabling VM access to requested device.
+         * The access-controller DT device processing is chained before IO=
MMU
+         * processing preserving return code and expected to be executed f=
or
+         * any DT device regardless if DT device is protected by IOMMU or
+         * not (or IOMMU is disabled).
+         */
+        ret1 =3D sci_do_domctl(op, d, u_domctl);
+
         ret =3D iommu_do_domctl(op, d, u_domctl);
+        if ( ret < 0 )
+            return ret;
+
+        /*
+         * If IOMMU processing was successful, check for SCI processing re=
turn
+         * code and if it was failed then overwrite the return code to pro=
pagate
+         * SCI failure back to caller.
+         */
+        if ( ret1 !=3D -ENXIO )
+            ret =3D ret1;
+
         break;
=20
     case XEN_DOMCTL_get_paging_mempool_size:
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index f5850a2607..29a44dc773 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -379,6 +379,12 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, stru=
ct domain *d,
             break;
         }
=20
+        if ( !dt_device_is_protected(dev) )
+        {
+            ret =3D 0;
+            break;
+        }
+
         ret =3D iommu_assign_dt_device(d, dev);
=20
         if ( ret )
--=20
2.34.1

