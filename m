Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7257AC6553
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999014.1379679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpj-0005Bk-CQ; Wed, 28 May 2025 09:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999014.1379679; Wed, 28 May 2025 09:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpj-00059l-9Z; Wed, 28 May 2025 09:12:23 +0000
Received: by outflank-mailman (input) for mailman id 999014;
 Wed, 28 May 2025 09:12:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sgde=YM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uKCpi-00059a-E5
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:12:22 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbc35202-3ba3-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:12:20 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB9PR03MB9709.eurprd03.prod.outlook.com
 (2603:10a6:10:459::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 09:12:16 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 09:12:16 +0000
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
X-Inumbo-ID: dbc35202-3ba3-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxP2o/vsJaoXujc6GPjsEzF/pbu3/mE2XMEpKizEAqx1r+7FJVQQh/vLXj5i6LQ9rk8f+kxBgJgDS1ND9gtscazLxS8W7z2zILdgnWlLfWUp8YpjwV+1jF6EE+aemSUsdpQFg5wTYzpvWE6171NbUoc2ppNlpDwCad6kMU9T0zFSjNNSlG3dy8XELWqq4pUBGAR9cB2WB7DYNrv1Ajk174zkudYmVw+5oXxiyMdzp63nldS2Dq4HgtrbZ5s2yfNO1tJElHoqxck4mVyl3EYyNHSDpSWG5vmJXM8tsFueTBhwb7rW3mjejE+IgArq53qPq+uf3i49a6nFNpahG2noQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DIWgfuDUwCcIypaT33MplHEwx28ObYd4+JIfqhYtFs=;
 b=vwKNGRKPiX+r7+vzgZ5JdeWshOeJe549MHc8pQtzX4+LXMtgKZXqUznK3KMkADreiH8cVwoJK4RzDiopa7pKGKVvhbOiHWbLYjUBjP0IQwrC7xyP6LkfoYpHSz5DgWX2BlvWcWUE73c8WbfNJbFOJ1KqbotUqzmPowreWU6y0uB+WVJJtjBxytNKMZEBmy+QU/Sd+oySl5becki1aquPVK6ClVeBlZHOFDZjqyWjXcYg7yoDGtzuAkzpR+d9OuHKjgMpIr2C2+tB546N1eQb8z+EWuXcx6U2hCenBEHBXHshVtXwpeOpLuLcUJj1ZwMIT32Q0EVe7ytokIsiXAd+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DIWgfuDUwCcIypaT33MplHEwx28ObYd4+JIfqhYtFs=;
 b=CXMAJu0IiBXUa3ASk+vuf5l7K6YVUTAYz4FnQhlJwoyWKn3z19UszbuIpFg9ZMPb5VrXQpmpev9NCxMBsLJKCPcw0WPlUwI6VTRkt/yLLyS5xVR+pkretED4ngTK1XIGUKEcUaZ4fRrUg8II8jRaKVHRAvGkakaucF4P17WC7N/Xj48mQUZMfD5ZR1EggflKXDhRD2UF/PLubVgCjsUqbJo3XVHeE3PT2hIABkYUyTw/I2Y8zs6R4DN7qMP9UbXMXhtk3+Y7eGROuUGPJPJX7RAkIdztBx9cmKuH6mLL+YwiT3iXvOZr57/jbe1IYT/yChVUSka9/v+kBeR0wbt0Yg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>
Subject: [PATCH v11 0/7] SMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v11 0/7] SMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHbz7CaDBc5HamPD0y+X5aTYJNRwQ==
Date: Wed, 28 May 2025 09:12:15 +0000
Message-ID: <cover.1748422217.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB9PR03MB9709:EE_
x-ms-office365-filtering-correlation-id: cc817b02-be6e-4908-580d-08dd9dc7bd8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?h9Zd+ajS0t+UZU9p+LtYgpuoL+7AVPNdwTfe3qTszyMtQSsB9Gh0Y99CK4?=
 =?iso-8859-1?Q?pXrsmLOrigBO7yjkq8qM5cBoxe5qYasMMKZOEQiRdJrKLrN0zmr/GX0NbA?=
 =?iso-8859-1?Q?4h8EKxW0n8Sd4f4bboL2MkhZBKePkrb184CHFjWGAvepWurl589DS1613i?=
 =?iso-8859-1?Q?Ev7P7YOu42qCeQMVH/PxtQ/iUiC/XmA1niBKlMhBIHnrpRIr+jG8ExwFNA?=
 =?iso-8859-1?Q?9JV1DcAVVflF6+XFag13DKOYR2iG4ARJ8NsoeRRunOmdhUnbSRyUBxHC01?=
 =?iso-8859-1?Q?b7AsvbHGvsIal0rcn6J57JzyqIysacDWTuwQi3/N35dZxzrboNT2vsuODj?=
 =?iso-8859-1?Q?ZIm5Dp/0AmaK69aO53IYw0VxBfSoa3pFilna4Dq6IvJ6VfPaQoHhAglMdB?=
 =?iso-8859-1?Q?LHyK5lyo8TTuOAa8Y859oLlbmbriqtC8heeMggp/5EpOTHDGlREuCuxz6u?=
 =?iso-8859-1?Q?LxCwQq7c68ZWUyqsCkotDIGlHZMLiRvqFSM4iDmhS1hhplTBjDJhaRAo6L?=
 =?iso-8859-1?Q?LeaTHHS5YH08v/OgfmDsIvp3kumoXkcZcY49ixOCQu/fLIbAUCduUsMjQm?=
 =?iso-8859-1?Q?5GpRKOp2qadgQp6WbSexT9kClT3/7Mp8ETrZXBGW3I6HlUGylZ+w7RTBsC?=
 =?iso-8859-1?Q?Nd+0GJEVYqu2tcsHw7Gav1Iw1JgMDzsui3IHTbew5iMl5VHbaIQb0J87BR?=
 =?iso-8859-1?Q?Tq+ymeh5SvEt94wf/EC3ayc4qBgBpsoMSm9/M104eOpX4Xwku5t7CVZpje?=
 =?iso-8859-1?Q?vHO1LRp3Hicjc7ftZn9lax89vIfXjaSm37hSB1vkUpEywHibF7xE9T8w2O?=
 =?iso-8859-1?Q?W354C32NOUONjhMliAtwweHfGaFbdzzoOIr18+qr1wdvYhx065tBu+UxXf?=
 =?iso-8859-1?Q?cYwHrlsilIUtOmjVgJCsAOtHaOhQwwHLvW1J3gGZ5Ztxfgu8CB+NTANtZv?=
 =?iso-8859-1?Q?aU2+CSid54iiYhURH27qzrx7J6y4166aGbk6rOA8rEDKIebcL+JqIrAepE?=
 =?iso-8859-1?Q?VSJGRjxTbakTBYOscdXGhOTBdBt3RJYRTvwAbIuSZ/RsfRnI9FKm/TwSUl?=
 =?iso-8859-1?Q?OpXiNlIbR3uYE6ydP5bAPy4EcBdsJbxX4lAxH3l3QXFRVuRXRPZVbNJtzg?=
 =?iso-8859-1?Q?TaEaxdeWqP7Bd2AsV/X4xeWi8f1z3fjzw28sis37eoABtxZFH945rD7tm+?=
 =?iso-8859-1?Q?YoXdwjIAnmPrC9oP5IrvdgkVtpSVMugKL5hyyyv78Mw8t3l+/WlB85lbIQ?=
 =?iso-8859-1?Q?myrYZbJSDhW67merWaJSY1WyEer/Mg7tOmIxB43YUK7uB21PvBWotEdA+h?=
 =?iso-8859-1?Q?RxCSh7Y6S1k+dkO3f1hwIOQrBE6c36bvZLK2pWAStTama6fk+IfDtnlApH?=
 =?iso-8859-1?Q?txoc11uFzikiPhWsFNxnI0vwCHkTr7YfC306jPieB9dp7PXCvzgSIGp6a8?=
 =?iso-8859-1?Q?ZOGA1u2BcMJbFQAVN0YZ62z0fYEjGxXnXPCT6yPZ6/PTwwnMUkMjAZ5fij?=
 =?iso-8859-1?Q?0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1hugdUX/cdlftGCpZTTtEh5Q9LBkk9BkqdCUCOqYdlg1IEyjpx6C7/sdR2?=
 =?iso-8859-1?Q?9nLbjb7COQwG8CicUj0ClbTqiM+dkJAuEGsPSgNKbyEWnGUbQXUGpCPCcQ?=
 =?iso-8859-1?Q?YBWGY+jMKMaC1d+PU/meMOcuKavnqKL4K7Ne+psYE+UtgJAOg1Qiyxe0UZ?=
 =?iso-8859-1?Q?EQU+DsKgQYCHA9l3Vu5XX0Agg8d3/mE9SZKyqoVxOZ+aJJ+E0IpuYuv8e8?=
 =?iso-8859-1?Q?i3m+PFXajiMa22q9mtoyJVQWKtrjjtsM8i5YosjVuL/SjOg7GYpF8MxDj3?=
 =?iso-8859-1?Q?QSGz1FkMUDEC3WlAVaLjK8xt019CP+ulmj2T0Rinj/MONHOC7WsIAR11DU?=
 =?iso-8859-1?Q?XjQh+OzKqur5YQU+jvvDcjCXqCtngiKkXd6GjLSQ6KJeVYxdVgqgP3jI1q?=
 =?iso-8859-1?Q?6ei7kuVJjDp0mPsfM7i9WtOfj3qx0iHvSg9XlxhDqOti5UrO6cxT49D9TX?=
 =?iso-8859-1?Q?m26/vpD78vIxDTzW8t4CXoc6l6vRVQSyB81dE3tQSMkwwSkyDuBQJEaPGj?=
 =?iso-8859-1?Q?MjNeXrqIxMcpCqKH/ZljPeIKBpXmhkfjMhLCJ9CENtwEzGjzMXi7jQgupy?=
 =?iso-8859-1?Q?gc0or0Z3yDsAr/yYlTdZCs52okDDbgDnNfe3uLUcFJsJ0CdtpvBcr44ZzX?=
 =?iso-8859-1?Q?PeX6bIxMpDouwNB7r3gcI0mrmABgScFlfZ2S9X5rpEOFStcTruIPvN3IQs?=
 =?iso-8859-1?Q?u8tJuCu7XhDW/iEkqApBRWIBOOZdptwfzqyhfsehqqtDtJE4zIo+EYQKin?=
 =?iso-8859-1?Q?sJDx4fhoVapV+KiBgbcV8ekXw4zLPARZvr9uAJn3WqAd7Ah63s9sfci/na?=
 =?iso-8859-1?Q?Pu2bmwgsdz4tIuHMOrN3r10ZpcUyxsy2Fk3atZMi1n2TuOuf9ergWenYEu?=
 =?iso-8859-1?Q?CwTB47OOXu3NRGldyaaIQuURhV4rUmq0m0qG1gGixhvJJzddaY0ih2HrMI?=
 =?iso-8859-1?Q?g2dnguzL0ewLyIEGAKaDVAAqFmVYC+FUK1HS3mrdaaD710lP5QNqBJlijP?=
 =?iso-8859-1?Q?WCrlxhscsmZArLXLZKdAYB7L5N/F2UnD1etXxWRzT3Ulw7FFDuEeOF2LW2?=
 =?iso-8859-1?Q?eHvGk92Cm2X1FJfx0iA5WZdzGxT3tPH0lfFXPTfpi4GpPwKL0OHrA9yC7x?=
 =?iso-8859-1?Q?tOB7gkqOxGa0sH6RlzZXqa3XwIkZFoqSwTXYyVl7f8eomXLHag+O1CEU9p?=
 =?iso-8859-1?Q?4sNZgHe/b8+8WcFZMqIrkRv6S2GEeO02/MqHQcHj2HA0RYK9HID4dPUNX0?=
 =?iso-8859-1?Q?V2QiYf5swCT5/otmPJ44I1BgiSexR6OLekSwgQV3MDg7HG3vTDhf1qc9Ic?=
 =?iso-8859-1?Q?h+JOSz44Kv0Z6/1oqQAxDUXLpEtavSFxW1s9UiIAem9xNS1SOAZJgjiwXt?=
 =?iso-8859-1?Q?n8KRX0FUX+d5KWtJuciapfFHXpcHY9do8z1c2cmUgqpyHihgNr5QSryLvD?=
 =?iso-8859-1?Q?V82/QfeESvOU5XBvpg9HUCd80gJIIPC/xfXYwyQ07OVyLaEC7a1yOJsYAb?=
 =?iso-8859-1?Q?lg3CcqY8qktYgh19ucS1F1V2MpMFqBqYLPE6Hw2ocNy0Gu2qqRCNBqiilK?=
 =?iso-8859-1?Q?rFgCV4flt/dh4BvO+q/2L3OukpojONl7mezQdx/46Xf2IPmOFvKXltx68y?=
 =?iso-8859-1?Q?oo1XIvjcpRmA6H88juW6MjqjQfOZPgHAMEoAtffjcsV1aqspWHWe42lw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc817b02-be6e-4908-580d-08dd9dc7bd8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 09:12:16.0549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sDgkaZqKVehCuzv5hFVqO6Pn/F5WfYOW5jNGBaZtQ0vLBwyuM2Z6W0ndW9q2rHc8bFeZBKxHmubGAf8hA9i/yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9709

This series introduces SMMU handling for PCIe passthrough on ARM. These pat=
ches
should be able to be upstreamed independently from the vPCI series [1]. See=
 [2]
for notes about test cases.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.h=
tml
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.h=
tml

v10->v11:
* see individual patches

v9->v10:
* drop iommu/arm: Add iommu_dt_xlate()
* see individual patches

v8->v9:
* see individual patches

v7->v8:
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

Oleksandr Tyshchenko (1):
  iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API

Rahul Singh (3):
  xen/arm: smmuv3: Add PCI devices support for SMMUv3
  xen/arm: Fix mapping for PCI bridge mmio region
  xen/arm: Map ITS doorbell register to IOMMU page tables

Stewart Hildebrand (2):
  iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling
  xen/arm: enable dom0 to use PCI devices with pci-passthrough=3Dno

 xen/arch/arm/device.c                 |   2 +-
 xen/arch/arm/include/asm/iommu.h      |  15 ++
 xen/arch/arm/include/asm/pci.h        |   2 +
 xen/arch/arm/pci/pci.c                |  14 +-
 xen/arch/arm/vgic-v3-its.c            |  24 ++-
 xen/arch/x86/include/asm/pci.h        |   6 +
 xen/common/device-tree/device-tree.c  |  91 ++++++++++
 xen/drivers/passthrough/arm/iommu.c   |  13 ++
 xen/drivers/passthrough/arm/smmu-v3.c | 119 +++++++++++--
 xen/drivers/passthrough/arm/smmu.c    | 246 +++++++++++++++-----------
 xen/drivers/passthrough/device_tree.c |  49 +++++
 xen/drivers/pci/physdev.c             |   4 +-
 xen/include/xen/device_tree.h         |  23 +++
 xen/include/xen/iommu.h               |  21 ++-
 xen/include/xen/pci.h                 |   5 +
 15 files changed, 517 insertions(+), 117 deletions(-)

--=20
2.34.1

