Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9107EB2DC69
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 14:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087378.1445437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uohvO-00039e-Bh; Wed, 20 Aug 2025 12:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087378.1445437; Wed, 20 Aug 2025 12:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uohvO-000385-8w; Wed, 20 Aug 2025 12:28:18 +0000
Received: by outflank-mailman (input) for mailman id 1087378;
 Wed, 20 Aug 2025 12:28:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rUzz=3A=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uohvM-00037u-UT
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 12:28:17 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 257d0e09-7dc1-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 14:28:16 +0200 (CEST)
Received: from DU0PR03MB10116.eurprd03.prod.outlook.com (2603:10a6:10:417::7)
 by VI2PR03MB10594.eurprd03.prod.outlook.com (2603:10a6:800:27f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 12:28:13 +0000
Received: from DU0PR03MB10116.eurprd03.prod.outlook.com
 ([fe80::7866:f529:f351:d5db]) by DU0PR03MB10116.eurprd03.prod.outlook.com
 ([fe80::7866:f529:f351:d5db%4]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 12:28:13 +0000
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
X-Inumbo-ID: 257d0e09-7dc1-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjV/4ZOEPv0MS4WOxN/5UpnKeSUCbXIMnrUnp9gDD/UL4/9FVp4a15xbu+ptu7GXdvp9XT65mtVT/8eNJVLebqHnqo+5uTQpzuLqCXWJSQwsOI2bNvENEVuum6etxDgx0j7H1/7o6a8qgOTgnHCs2F6FMMKaB26rVSbDV6e4mSk+wdOGzyBs0YO+aSopOXvIreKAalmOvpnaOrusSJHf7U/7ZJCMl52qsHyNvgr8pgPvT0od3tKjL7AnPj9qeZ3CXzLNTm5E8Lzjy3eQUZHDymhpw+BsdjkeuF2O5jqg3O1hTK9O0VooomWzGz8aazurNhE4AWHcqcQTmFcQ5m5PwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlK9vQ1x9DEPaXsIm+wocJ3MuFEkfXWYqxqii5rJYOE=;
 b=TRZkHsOErBp9I5Nuuw9X4qSUM1A2H5F/EGBaEl/5h65jft1EGXAoLfjKXgjTy0WRQQ8lESuZILwgPHs6Yg3W0EF/13k/7XjTyIEFLel73RF1YWjWf3LJDc3ZY0uohp+BIKItfi3r9SqeMmg71Of9fcdQNx3FD+DrCELCxhZpSCKQP4GaW9OROAaWNe8f0BX7JCs2xhH3abXl5W3IqftYhTKo7uJ5xIEqODWJXYb2sHRQfYBbhDNbsY8fu6HfGhJkQGK68PrQsZLrZKVHnNUmjESHYAX35A/q57nrIGU1uN004+JAEXpUUwwNBTcLTvv9pRVME1DWwsdqoJoz7z8eHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlK9vQ1x9DEPaXsIm+wocJ3MuFEkfXWYqxqii5rJYOE=;
 b=uJRz3IhGrFJE+jcLGKfBFaHjLQfazdcqOYx7B7dyUDxLviIDrScBTcC19ctB7vvB/Pso1UF0fpnF86OZT+rBGfBWVPPgsxgW9+RxtGl8rMsL+il5ZV6z8+BoDCn0C1GUC2Px9TVGeO1Elz9WOlgwld83BeL/jd3N9guYfP2XNkQKD2x8XQ/XOkxmt/slBkHV0PbTS1CPHmqxBEQb5YICb4CH9R2bSMonTVRih1XwPT7qGS5rziMC3DB7hqIiDWlQjy3IVu95PYyyvCgKnLeVnPVJ/Gkt8dJX4FXgvUPHrFseMegX+r9YgM6Bej7drbi91+5DiSIboGKSAqeDuYFftQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 0/3] dom0less pci passthrough support on Arm part 1
Thread-Topic: [PATCH v2 0/3] dom0less pci passthrough support on Arm part 1
Thread-Index: AQHcEc3l0kakLkpnsEOjM6uaMaa5Mw==
Date: Wed, 20 Aug 2025 12:28:13 +0000
Message-ID: <cover.1755683961.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB10116:EE_|VI2PR03MB10594:EE_
x-ms-office365-filtering-correlation-id: 3ee32ffb-faba-4f22-65ad-08dddfe50854
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Gji0xWH9EIHTEsB57A4PN6pBLgGAaAwLY8PNpPrK78f0CdO8tTnM8jpt/W?=
 =?iso-8859-1?Q?+BrcGgHuz7BN07cWvqqTkRI13iCB79h+DZzqAyCd6Gn33KurANDvZgseZt?=
 =?iso-8859-1?Q?1gPQqMVFitJctLzjlnl44LOqAWAyve4nHT4SpIEsAtRVtQhuCwVhMG0u80?=
 =?iso-8859-1?Q?EHp2fU75jbIeoPeb+3FdtFCw7orIMJnDa/4WYvv7nix6MhbiOZAa01Sl6z?=
 =?iso-8859-1?Q?lKoSg9PMzWk0Zx2AlYRcwlUNITAFktiDPqpH1cPjvUuJ7wwk9vDDkWO+/m?=
 =?iso-8859-1?Q?2CgKIW7q9B1NGhtzMYSAwVyoewytWiOuiKbSgmhUQ4cjWBF+0LcHwtGo9I?=
 =?iso-8859-1?Q?udl9BXPpIo8Xph5ZgdSvjaJolzZrJ0rYou2JFwkC2UxBxfbOmAC1P+ZyMm?=
 =?iso-8859-1?Q?8z2HrEBXW2bXw9eT1x7BLQfYiBBmXc6iY7yMz14nwlW3Q2XZDioqw4uMqt?=
 =?iso-8859-1?Q?4s2FJbAsQF7kgPzs7W2cYS25bvKuLsfuOWavs1iKggwL7YIqS+rhQKQizs?=
 =?iso-8859-1?Q?645tckUSzc9FFYdLJ9++XS1T0fcmNfMKO7DnHjhepzqonzemrvHUtNPYff?=
 =?iso-8859-1?Q?iK/vqAuqvDFdsDlad2Y7p8p87Kx+8cZmHxse+7TVQpBmgCgCTp2/iYyPyV?=
 =?iso-8859-1?Q?zKwHcrhxox8r/OPSGeo9PMjzLnrhDQz9pM0uPqAUOt868lCpnqVDWGBW1e?=
 =?iso-8859-1?Q?bEfhx3Itqy7ttfnZ5ph3zGxpunEyff84OlgUCgpWS7usYZWNa8KA4ewyjH?=
 =?iso-8859-1?Q?vk18T4C2tJKR+9R8n5c4nwdFinaDUYrN5iC8sGyfPQwADkMQVX7sx5Y4Jr?=
 =?iso-8859-1?Q?Wz8y7auh/L7Jwhs8w83dtzTdfyFRMxCtrEzrh79MNNd2yWPK2m+4jukPCc?=
 =?iso-8859-1?Q?sEURgPK50M1HK91dF4Z8m6ejRThXGtrikHJPqkZ4qWE7CDT/NXFAq50ddt?=
 =?iso-8859-1?Q?NhPnH/HR63/ottMUHOC7MQ+RWD67hkc+8cTncVs8AXXP09LONDCIT30IVH?=
 =?iso-8859-1?Q?w8hThJtEK/8KD9F7mgdb3TMJOxFsYongmCR0TmyetIRy0k7DuaERjsoUVy?=
 =?iso-8859-1?Q?t33iOa/hN9vxASNR3/NySRxKQhqH1C0h81evClB5ftzDTK8Zn0xYNufLtx?=
 =?iso-8859-1?Q?xrcX7gTiWXsCdUvWXqLbZAHqwOBHwoH7ZCs1LNrRy3dS1EiDc3fQIzfSf3?=
 =?iso-8859-1?Q?6o1jxXDGueAc+vRE/SpoTZFL9Dc3WdYZc7Ufnf6iuFfR9ZR+w2UB0IpKxo?=
 =?iso-8859-1?Q?zJnFEP7q6/Bfhy8l+bJJuf7Nf1o0mHn6ETilAdMrvoGIJoMD8dK6RrREiZ?=
 =?iso-8859-1?Q?4hunp3VDvaFqccNTdPguWg6tr4d+qsudGriDj/Ydg0e7zoQi83vID0VlF4?=
 =?iso-8859-1?Q?vTYLXL+mfhHg+QJmXEEGe5cDBH9wZre7hWIXyhonhdu0q0J/t/MZvXh+nP?=
 =?iso-8859-1?Q?qtWg5IHHUD6nMESGKS0MW0Hz5XY41ShTx6zi43kvi7hz99yxSltJpgStRb?=
 =?iso-8859-1?Q?Fo2oUgots7ZSeJR6n/tJCo2Sa8+JRbYXtqH3f8e52qoQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB10116.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/COEU+Qb3FVarZHM3UagBb2vdUvoEj0/h332hgtmhuI9GkB4J7hIzrVC9d?=
 =?iso-8859-1?Q?I1F5oAL5511sesHp46O7l0KqFENE5tc6VXIBcMj/33VkmSPEuN9sRi/8+U?=
 =?iso-8859-1?Q?xnntv84X7Pc7vDcA+saPKnVq64t4Cj0L3zz9/Js8D5VXZDihSfJfxxKHn/?=
 =?iso-8859-1?Q?KZOSKEOPGm7u1Nb39t+GFAz08jAgTHJ8DitDvrcaupfFctUwpG7S9TZoSb?=
 =?iso-8859-1?Q?MjLbrM0ST8cWt267nkCMaRBAJyunqUQrlLlIqfCdNcp8NaoZZH0jDdV4Qp?=
 =?iso-8859-1?Q?wnwry1hTQJD+stvXze5zUz8Di4gy/lKHKJUADE61yvo3XAEKQDtyU8Fo6i?=
 =?iso-8859-1?Q?NRxFk3Ls1dp3+OJeqSXqO5iZRuU4Z7fRv2nXSnsEbiPeuV4+aVejFWYh7H?=
 =?iso-8859-1?Q?tNE4EP4dmrHqgfAFZzXHk0M1GwFVf9TEnuxGmWq2d6L/5QY/sGAIzvVF3f?=
 =?iso-8859-1?Q?Wncz46tZ9W30l3NKHqBQ+m6fT6PFnsQEnlBGdFF9qGvCQmSGG2U/BMZ2WT?=
 =?iso-8859-1?Q?QqSzvKYO/3cO7LLQNUC4lLZFjddpafbsz5e2P4WCIVitgyCsyiWLcZY8in?=
 =?iso-8859-1?Q?7z03XJvCBD5gqJzihPJX3Zc2/jUrDUfts+/nCGBeG45pvzXyEc7dHR49xs?=
 =?iso-8859-1?Q?IeQKFOjYBf5cAtoAysMfDz++ogDEuW06MXIKwM/u+D31GQCUreT/cCbBDB?=
 =?iso-8859-1?Q?bbCNBDJtx1Q/wwY90SDxwtrH+sm3zopKxDcUhaVOdwL2aInumCl8Qzl1co?=
 =?iso-8859-1?Q?IYtNgbmzBbW9cre2ss4wQ2tW4s8YH9p9VrCCeuQWVnL6L/rS0Ok2d4YwxW?=
 =?iso-8859-1?Q?zX/41PVUfJ010JlcVGaL/THYAuCO2G6VG00MVI3xvzMbUFs5I01scZU4aa?=
 =?iso-8859-1?Q?aOC4dD0WB3pqzyx7N+sp1rZWH/pTLKK7r+vqIsE7MLIoMvlMbNW8nCyf0u?=
 =?iso-8859-1?Q?lBPu8/F0y1AtqHF8BBU2o9rT10SgrbvvV9J9p7i/T58+Ecqea/DTT69YY7?=
 =?iso-8859-1?Q?aimH7j2O+c5Kt87MmqleZefrb8ubqh/VZLhNX32jqwbUnRgf3f0I1Aw+ml?=
 =?iso-8859-1?Q?/jf/8ml85sLKn0tmOHY7JOlcE0oNwRfSXqsMPx1IGYrkKabyNMDBCmpCf6?=
 =?iso-8859-1?Q?hFAaNBfDganpaGVc92Cxz1/E6yi1eAxD3SAvppfDG19PUS2rx5oYGMz33x?=
 =?iso-8859-1?Q?xpLlXcueZSbSElYWHmx4kjxJqg94wUaHfwIB1ppWPGB4VrUXA2pn6Ke2gy?=
 =?iso-8859-1?Q?eR7/BnFmMQgMPnsjt/RvQb/MWClmbRifZtFyJfm3U/jbK/r/rWiAvVmZ0q?=
 =?iso-8859-1?Q?s4f4DqiZIih6XN+EVnW18XrlPynqpMRiOjYpr+nfn0hadPIT0R8QZ8KnDF?=
 =?iso-8859-1?Q?+8kokuuX5qUk4Q0G7+MS5rtdog7Jey//+lofxzuiq8JTMAA+KLWbMSqhBT?=
 =?iso-8859-1?Q?+WhVJql+LPy1FBI2JcfqERPsS79b7rN41dD+C6mcRj6vz7nNLujtHYDMhS?=
 =?iso-8859-1?Q?wj/s+TIOFV0RgknDxgeqOTf7V5IvSoYM8vP+fIriuVVWujXF4ljRlYkZj1?=
 =?iso-8859-1?Q?hzPcBtzQTxv3xQEpMOGxOOXfBRMf7vSIYrtKmb3MOPe1W9XE8qVQRVHm3u?=
 =?iso-8859-1?Q?1pZHZ2aj9vWVArKTU5rsHUr0dyOY9UocgQeqWGS81wgpJp217pF8kMNg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB10116.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee32ffb-faba-4f22-65ad-08dddfe50854
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 12:28:13.6389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J8Hw+/sr8TAWJ1kHwBxP3K+dXb07IelG1jsv+gxgOIsIqkKJV28Vb8JY9rTTlcWkAq46ml+C5NoZdU/zYuQGVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10594

This series adds basic PCI device enumeration in Xen. This will allow us to=
 not
rely on Dom0 enumeration for supported controllers, which will enable PCI
passthrough for dom0less setups.

Enumeration is disabled by default and can be enabled with "pci-scan" cmdli=
ne
option. Discovered devices are added to Xen and assigned to dom_io by defau=
lt.

Edward Pickup (1):
  arm/pci: Add pci-scan boot argument

Luca Fancellu (2):
  xen/pci: modify pci_add_device to handle device add by Xen
  xen/pci: add discovered PCI device at boot

 docs/misc/xen-command-line.pandoc           |  7 ++
 xen/arch/arm/include/asm/pci.h              |  3 +
 xen/arch/arm/pci/pci-host-common.c          |  1 +
 xen/arch/arm/pci/pci.c                      | 25 +++++++-
 xen/arch/x86/physdev.c                      |  9 ++-
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  2 +-
 xen/drivers/passthrough/pci.c               | 71 ++++++++++++++-------
 xen/drivers/passthrough/vtd/iommu.c         |  2 +-
 xen/drivers/pci/physdev.c                   |  3 +-
 xen/include/xen/pci.h                       | 10 +--
 10 files changed, 94 insertions(+), 39 deletions(-)

--=20
2.34.1

