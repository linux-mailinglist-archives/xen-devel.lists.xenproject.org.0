Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEE6A2E96C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:31:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884559.1294275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR3x-0004RY-1O; Mon, 10 Feb 2025 10:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884559.1294275; Mon, 10 Feb 2025 10:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR3w-0004Pw-Uo; Mon, 10 Feb 2025 10:30:48 +0000
Received: by outflank-mailman (input) for mailman id 884559;
 Mon, 10 Feb 2025 10:30:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzWh=VB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1thR3v-0004Pl-C7
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:30:47 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1689bccc-e79a-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:30:46 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GVXPR03MB8404.eurprd03.prod.outlook.com
 (2603:10a6:150:6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 10:30:43 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 10:30:43 +0000
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
X-Inumbo-ID: 1689bccc-e79a-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfM3ov5M5tJwLatg7w9FApPwc0keQSVvObQj9WengdEuSusNLbPQcXaP2EvhrPQ/k0mI7pFa1C41Vq02LOVz/os3cTzxSZ41cxvjFtOMDsfEWOeL+wxmWk4MMwyQbpdzAai8gA1XMxVCONGsR3vqUXD32g5HvMdNyWBMb/PBfTCz3zrlysSXD/MYfd6l6InAKLdmTPkk6MlwTp6wASP03LTrAFvNZjzh0zW9Lvkt+iwEBZhwoEjCcPf9PzgHSsEuNGzlAcj6xOOvu1tdKInJ5lZ5BoMR2S7nHpTZPIullpXachyl01rZVxmi8hDhhyoIH9k0eCCvFAe1hWmhAlW6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lg3VdTMOgEkRuPK6nGhV2pqWsLBTMLVfT/8HXH50j1g=;
 b=PhjG8nPPauT66BY7/6IaI19/FckberO8+lutwy61wQG7utYBSPag9Xi0BVLKoWt0zLctFKh+cuHI/g21ndY9RpoOz4YcvILsoI/oGdmXP2HXCPJkoy0kZzdS2VMOdw5MYgFbV+XF1rLlUWe3o3I7w72HNTB15O7Fw3QnuR1BGTy5xlbKIdFcXAYdUog+3atIuqtBxDqTsWFIkoMUr+cy1gDhI/CokGXaYYJF0kuDJtBySEQRtu8prF84kPAIKM2ZD354eRSW/rmrZwoyic1uMCX/EKas/X4h41AFBiAiJzG6o7LMEVKx27J7jB55jlsrd4V1TThyW9ZCPc6LVAkzkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lg3VdTMOgEkRuPK6nGhV2pqWsLBTMLVfT/8HXH50j1g=;
 b=fBawI03xsXdoeGalz0a9Bp0i6Z9ZZ3XSQXobloo76zSSaDKfOVssWiV2YEC9FWeO8xxS4tUdMiKA7pz2CrfBEK99EbAiEUGOPeWZUuA68BpebkdHP7GwxDI1UhBcF6KckSA+tHaiTDF8sHWSvoC/Ya2nWSw5JnzUmxByWueFzKIqL0XuVRGb2oWhztN/bdRKk4bberP2FuknoRpNBrooLEIrsXJ717iuuJKlXJaFierSYehHqjJZmf1b+XT08BszQhE101V3jfeOAcqHToeqghv5deyZfPn0j/gsD+8n7qQU3LUSSREofEU6WicCDBAExUTDN0JbXSCp8EV4BnL/ww==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v8 0/8] SMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v8 0/8] SMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHbe6bWSthIneLqiEGoGplsvQOTyw==
Date: Mon, 10 Feb 2025 10:30:43 +0000
Message-ID: <cover.1739182214.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GVXPR03MB8404:EE_
x-ms-office365-filtering-correlation-id: 18a0195b-3c7c-4c12-026b-08dd49bdf901
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oZrLxdPL0BiXCfDpJnqoLhLdkg8Hc/oXcbJQBFL0DLaw9OermKVJQJKGO1?=
 =?iso-8859-1?Q?gB78ZL+AGwgubS2sLOTstqWybDVyWkTbQT+Schb3nCZq6d+HjnIdr6zoHa?=
 =?iso-8859-1?Q?cw/jYtQ4FLckDyFgWBX2JdMhey8soUmYwfbbKAyLztqZJNI4u7TnQwxrpv?=
 =?iso-8859-1?Q?Cng6brJgjT1XVIjsGnpej6+LaeVNgxPZ4h1O/2eWICo8/rCU55xdvO6+5M?=
 =?iso-8859-1?Q?0Z+QNEQeNkS874jFfw5NOHJwcpFaqFGK+CjouFiViz3Dxj5jjtMl4w1SZ3?=
 =?iso-8859-1?Q?ZRowIBH8b2PfpXVAPnIeURPqPKhgElUsshreK1mOQXW2131ZaC34baT0An?=
 =?iso-8859-1?Q?Yn6N3hgwqWgfQVDMvWvWu39vA4wckzZXrS8lVw7FakFX/YBZ53RYEKSrTD?=
 =?iso-8859-1?Q?ByH/9H5eP7kfZQSYcd5WprxQ1I+p/KzRkZkF3a+uGawrhDOyQu0geSINxE?=
 =?iso-8859-1?Q?jowmqFaDq3e3Mzgfw5Ry9oCzZcCT6LcJSjDLNB7brl5yfdRpRIJ+r1UskO?=
 =?iso-8859-1?Q?N3Mup8EgXf0Y8eBVYe0QC7TnOWNEnD11YOXUAUkcow5i7f6aEU2LiTkZyJ?=
 =?iso-8859-1?Q?r1OPXckqls+lA+ozWb1xh4UkqjTSC/aFNtte5BN2ANTCMgZQmbWIxDkdQW?=
 =?iso-8859-1?Q?dkwWw5ME/tW6D8bvyVjDELx+ZRKhBu3g/SKc+4vABndLN/r+FyA8eQJcTU?=
 =?iso-8859-1?Q?qyz8fSVJXxvJ9Zouo9A1BndiijpowLg2kn1eus365QlqW2kenGbLFX8MIY?=
 =?iso-8859-1?Q?ueioh5zly3dSwjZFyoEuF2HqjdjW9N7MX8Iu9YvbkrAfB8O+cscLIE35Vz?=
 =?iso-8859-1?Q?/GNp9HOooiYNFeY9o7b5zA6+x4Esf2FAObNbV+sm2HLZS9SA6a8cLrKuyh?=
 =?iso-8859-1?Q?WdkGW7iAyVHGvnud+Q951VMLv7L/z2iTA+JGW0UT9GWr7VU0eiWMUPAROD?=
 =?iso-8859-1?Q?YjRu/48svP4qekPVVCu9ZeYD4yVfRJ5uS7mye/9XkMdOECx2YTVpb3ur79?=
 =?iso-8859-1?Q?hL7+Op7gSYCBxKwPFJzbs0x0Ic6uuWUzgNVzvT5U+1S8mc2GbySuAFvTon?=
 =?iso-8859-1?Q?gZfD53FGGRKiHHaKMqMur0Tif1lG2Q4oB+39Nypuc09a1hQqo+GVrF6Ebg?=
 =?iso-8859-1?Q?f/R8vWGV/T+7uqZ0FMmr0scLoWcNR/gbroFfUw3AQrJp9bFCS1adNd2zvw?=
 =?iso-8859-1?Q?oEyBp56cmJsDYAzq9xH2fdOTPnh2DBW+6woE/PPjPmjQNNrBGzyv70skXk?=
 =?iso-8859-1?Q?Eo4jEnlCjUx+x1PbgYqRoWHpeZ5Af/l30Ijk/Ap4gov62lac9fUnBwrkst?=
 =?iso-8859-1?Q?pbWdbxI1lyDbD16Jz2Zn8gsJNYRcEMVomYX9e7mXaVA0ArT12SLMYEH7qO?=
 =?iso-8859-1?Q?x1/gzEPvc2eaUf98pOtQxjZr+UZtpDORFmCwi3eMdu1FjQOdUOpmal4eCf?=
 =?iso-8859-1?Q?yCz/uunrql0mBtBu0m6eTbV3ce0rOGmVXr7z+Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YYCZ3Pi2tWzwrjZUT6uo68WGLYaawX2qbwKk4MPifQ3YKXcStsFynsUZAX?=
 =?iso-8859-1?Q?fFDzHGLu4Q9cRoTCqu4AmUTnPkjq9Jq1VwTXaCWsYQTP9u2jG09lO+3LaZ?=
 =?iso-8859-1?Q?7lWwLDGGNXusg3EDqFISOXq9cI0jbKjgkTt5NAUQv1Qi5s5xZjOLsuenbu?=
 =?iso-8859-1?Q?7xn5cL3UgcI3plFedfiJU7z2rhSWbmBsUyATHgCaMp0IJCU4K24KGltE+K?=
 =?iso-8859-1?Q?5XLCiAkr5Fi5zjQ3bSKmVMztAosnDcofbOxwoZWB0jQnvFsTmBAq6jV879?=
 =?iso-8859-1?Q?Q7IdDJYyjmYlYlSNHrb5QRVYeiCT1PZERMDFN5V/hDkrG/VLntiYOUwuEP?=
 =?iso-8859-1?Q?Yrvs027bONtDEPOCmey4BrQNwQEz6PXOBBhkCLGcs6ALCmehHWrlmvrLbB?=
 =?iso-8859-1?Q?rOsKUNyDXIT2LGGqs7O6RQ0F7AbNkbkUX5MnqaaGZmJs1MfMLAGRuC7bnu?=
 =?iso-8859-1?Q?VlokBtOfVxr4GmyAVg13icdAlw26eUD5w2tnZ9Vu+m5xn8vn//0xjJfyz8?=
 =?iso-8859-1?Q?Ov29y4jh9NYJpwnylmvfeVbnc4zd2byKqospFImk0eSV6kHKsw5fuqTKyL?=
 =?iso-8859-1?Q?Qc6Bg/RvG4jMciVqOMWGDD2sYv0Ozu0kNJexMLVn0PQO5GBfVrBgPdPgmH?=
 =?iso-8859-1?Q?hXykwgY24sZO5UNaZTT/fPyo+w2GV0hua6xoQIxkraWVDRO65Bicp/abC2?=
 =?iso-8859-1?Q?N2j5fR5QdoW68PQ5yuxjWZnj+fFloLIKpR5AG/B1B2GD5DBidEUCcT7TQr?=
 =?iso-8859-1?Q?D69arSZnTUJOtLXdd4DRQpd/DNHHISzD3CVN5kRvBrv9/Je2zxmOHM/1L2?=
 =?iso-8859-1?Q?CwMjyiM12KIMA8k1qwqCyeYhz+U5di9krnYGfjMgvLqBbP79w4CAMQhF1O?=
 =?iso-8859-1?Q?u244PwM7/zHe1QmXtXmc+n/ba8bjfOvKf1kg+euIDEo8XB3WrQxuh5dhG6?=
 =?iso-8859-1?Q?KT8sFa9CvlN/7bVDrR5vOs/Xf73lFAri4G51fEt185R2JON5QrofNlNcmq?=
 =?iso-8859-1?Q?xZ+0tt6qoLpCdgRguB7xEeTRPogwFpV0KkXJ8qmBRCYhgO05sdKz/f+R2M?=
 =?iso-8859-1?Q?vi5NgJ+tgB8uHxk8MOH1LNIx/hEMySrBSF2AmaZzsn/Nu2Hb2fWV267MLV?=
 =?iso-8859-1?Q?rMELhxgQhkD20Dv+e11GlHRDlWGRiFWWXUWw2GmPQAVuE3HEoOvCKz4yxE?=
 =?iso-8859-1?Q?5wlk68tCdqLmdqWbwawjJHsBvIdCh7M9odeKHlICS09UqU9Qty5emHIYtu?=
 =?iso-8859-1?Q?HS8Tkx0Ss0ZdmgtppE7GrIOPo67uKzcPbdN0ORc07BGNTHE468bo8Anjf3?=
 =?iso-8859-1?Q?XXmhl/nqevc2RWuhy0hMbnLlBgCRSygCm4wIxet2u0LruAhWZtO8kXGUz5?=
 =?iso-8859-1?Q?umoi4naXJJ8hMPrMQOPmY7qYr3rX6F4nZD5Bdd8C+g3zH29Fr819nEMC3f?=
 =?iso-8859-1?Q?QudirUMXYN+8q7QU+pWucE58+qnWAJaPGZx9ThGk5AYr4k+SUofT16uVZU?=
 =?iso-8859-1?Q?p5lbZ2wXdDehdiCwIhgrE1d2Ornn81bhZ/qUqTOrYGx5gDHHbmMBNT5+w0?=
 =?iso-8859-1?Q?MD7/u3lxDgaQT+SvF71OSkoR1EV87/wj/2oCwJoqP+VERcYiLAMUQdJdqe?=
 =?iso-8859-1?Q?FOaWis0CNPKwJ8VFeiykyW5LJ5353/QCFh3ef1fdSWSKB5otY6s4tC/Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a0195b-3c7c-4c12-026b-08dd49bdf901
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 10:30:43.1409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CLo7KKmWYQ6xDNcUE0Iq7BA7ktHZGIU/hr6w936nNIdspxbMhp8vEoUqvzoYmO2XnXjWyIpd02K618yhd45cSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8404

This series introduces SMMU handling for PCIe passthrough on ARM. These pat=
ches
should be able to be upstreamed independently from the vPCI series [1]. See=
 [2]
for notes about test cases.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.h=
tml
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.h=
tml

v7-v8:
* no changes

v6->v7:
* drop ("xen/arm: don't pass iommu properties to hwdom for iommu-map")

v5->v6:
* don't revert ("xen/arm: Add cmdline boot option "pci-passthrough =3D <boo=
lean>"")
* add ("xen/arm: enable dom0 to use PCI devices with pci-passthrough=3Dno")

v4->v5:
* drop ("xen/arm: Improve readability of check for registered devices")
* drop ("xen/arm: Move is_protected flag to struct device")
* add ("xen/arm: don't pass iommu properties to hwdom for iommu-map")
* add ("xen/arm: Fix mapping for PCI bridge mmio region")
* revert ("xen/arm: Add cmdline boot option "pci-passthrough =3D <boolean>"=
")
* add ("xen/arm: Map ITS doorbell register to IOMMU page tables.")
* fix test case #1 with PCI device in dom0

v3->v4:
* split a change from ("xen/arm: Move is_protected flag to struct device") =
into
  a new separate patch
* see individual patches for further details

v2->v3:
* drop "pci/arm: Use iommu_add_dt_pci_device()"
* drop "RFC: pci/arm: don't do iommu call for phantom functions"
* move invocation of sideband ID mapping function to add_device()
  platform_ops/iommu_ops hook


Oleksandr Andrushchenko (1):
  xen/arm: smmuv2: Add PCI devices support for SMMUv2

Oleksandr Tyshchenko (2):
  iommu/arm: Add iommu_dt_xlate()
  iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API

Rahul Singh (3):
  xen/arm: smmuv3: Add PCI devices support for SMMUv3
  xen/arm: Fix mapping for PCI bridge mmio region
  xen/arm: Map ITS doorbell register to IOMMU page tables

Stewart Hildebrand (2):
  iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling
  xen/arm: enable dom0 to use PCI devices with pci-passthrough=3Dno

 xen/arch/arm/device.c                 |   2 +-
 xen/arch/arm/pci/pci.c                |   5 +-
 xen/arch/arm/vgic-v3-its.c            |  20 +++
 xen/common/device-tree/device-tree.c  |  91 ++++++++++++
 xen/drivers/passthrough/arm/smmu-v3.c | 117 ++++++++++++++--
 xen/drivers/passthrough/arm/smmu.c    | 190 ++++++++++++++++++++------
 xen/drivers/passthrough/device_tree.c |  97 ++++++++++---
 xen/drivers/passthrough/iommu.c       |  13 ++
 xen/drivers/pci/physdev.c             |   4 +-
 xen/include/xen/device_tree.h         |  23 ++++
 xen/include/xen/iommu.h               |  40 +++++-
 11 files changed, 524 insertions(+), 78 deletions(-)

--=20
2.34.1

