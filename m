Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B96A27372
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881483.1291663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNT-0008SC-BC; Tue, 04 Feb 2025 13:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881483.1291663; Tue, 04 Feb 2025 13:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNT-0008ON-6F; Tue, 04 Feb 2025 13:54:11 +0000
Received: by outflank-mailman (input) for mailman id 881483;
 Tue, 04 Feb 2025 13:54:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jloo=U3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tfJNR-0007bp-9s
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:54:09 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f403:260d::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80ba3ec8-e2ff-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 14:54:07 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB10120.eurprd03.prod.outlook.com
 (2603:10a6:20b:57f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 13:54:04 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 13:54:04 +0000
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
X-Inumbo-ID: 80ba3ec8-e2ff-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZzjasSgxhDvYo8iZ2WzC3sNfdM7oeHP7CX0B8zBC8Y4KW9y29zCTT4J0igc1ZmXGsHyDsS8dkBi8aXUuwtOiyh+Pw7/WysAogHDU7UQUK9otBZk8pa75UWKGsPiGZ7lkwAkoiUf7FrM+ASo8eCsOzXIZdnsmQHILa7AHB7cGJeXFCSz4oqHA6FJZCyy9741SgmxIL/P4OQxHVCK4NccTpYnmf0hzMqWSsMwhkU09l0K+Z20aBpRFnZUuNdM+vOkWGcGnWoKnoACm4pc0WVyHuZWzQcYpss6Vofxqml0Nf4vB2z27AnGyP9Rqd8wPoYC72cdKF+1YEHDkyhSiKolaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lOCv8zHloXloczKwDCOTV2sKz+Z1GzU7wAw3bdi1Ok=;
 b=XwxR1UP1ILs04TuL4C8K+dgkfyPUz6Es/umZ9YsEUu+hPOIqN4Po36DsTIHg97UtpkDj0F1OH2YjPEb87Qi9Nl+ctw9sc1g5uDUycT+C0Pyd6+tS3E6uz4ZI60B643sfs20hLEsOnb+V3Xl1bDqK0HfJ/k34SmP3lHuPSgFKw3inyYf93aNc4N81Lmu/+wpFodovlUj8ZZKMoHir5n3XnIXyP1bbZQy0yAssgG8yNxvEWdrHsQA0TVtkI2lVQB2pNMGC+/M2pKIiSADHqFPJvueWTz61ijeBHk6DciU0yoOuf6dxTO22DgTgPXdmqgKH4QqZRJAZt5wDVGU03lKXdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lOCv8zHloXloczKwDCOTV2sKz+Z1GzU7wAw3bdi1Ok=;
 b=rjT0x1MHCESZTL7s8GfqpHHsWsLR3st7CXVChevNAr4/gh0urE29EZemPaNzXMxmF2w31/Oe/r0xB8qDFxqGMKCcyzcUTBajUIzRy3nFPsVHuqW8n33tmcQeDo0luaK6M1xMWHyUQzdqBfRjJRUtgX7iCf/ulln355I4CJvrKvzVMaWS72DMLgyg1gqlu+OK/r3cZvojPYD4PX6jDOHAoQDr+vMbRcizyIaeu2rwUKSnctp1buYGdU6i0iqTpXbBste+C+/inmD+b3vcNpGnjPONhbMd3Gj5m3KZX6m+ygzzy8mJo5yK2Pv9Luj0QLglIR4etMLAiVXUKPgUi7iz2w==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Julien Grall <julien@xen.org>, Rahul
 Singh <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v7 4/8] xen/arm: smmuv2: Add PCI devices support for SMMUv2
Thread-Topic: [PATCH v7 4/8] xen/arm: smmuv2: Add PCI devices support for
 SMMUv2
Thread-Index: AQHbdwxAjvatoQuLmUGc7gGfIraVwA==
Date: Tue, 4 Feb 2025 13:54:03 +0000
Message-ID:
 <c877fa4fe38d7a882822db145ac1ccf20d11bfd6.1738665272.git.mykyta_poturai@epam.com>
References: <cover.1738665272.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1738665272.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB10120:EE_
x-ms-office365-filtering-correlation-id: 9d83a466-cb4e-41b4-86a9-08dd452362ee
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ovdUm4XUauanYyfEBc+vl6pOuh3RHlU3ym16M4JGSAA6+bgfJskjavtcMl?=
 =?iso-8859-1?Q?thDB7D49cj5bmKA9nVHxsF7VM2dv7WZJDtlD2gimOrixUJjTMICHWDpoy+?=
 =?iso-8859-1?Q?8AuNp7FrlTbw0BxLS+86xn62bZuEHG+Q/iYaa7x1zBH6i8ySBGH8HP6WJW?=
 =?iso-8859-1?Q?7qEI/0+S4KVvR/DIZsgHKTLEh1lMcTGwo/q2WTTwLneeZZWmLTqQKAmch0?=
 =?iso-8859-1?Q?8c3rZQhxmBWatsRaKj/tV2iVhvFfJ2KlLGjYwJx4iGn6gMfYSVetNjh8J3?=
 =?iso-8859-1?Q?lJmB0Eapj7f2iIuVmF6WTeZijg9LpmZSjxQvqUTqV2oyj1SpwaCtD6rKnp?=
 =?iso-8859-1?Q?5M5Q0RhaFlq0uxLLD/Dm3oFfOvWk+HHh0oqQ/+sgPWHsJrpO16EinSBuhe?=
 =?iso-8859-1?Q?OPyT4jIdl2kuVcbsiuIHr1LBIzl8bNnoPzTujr2RPGZe4mu/AavVcasEFx?=
 =?iso-8859-1?Q?VggM9DKIjWifigQX2oeMgT7XT0b3xvB5v+xIjsMOwLjfzl9glb/1GFWy6W?=
 =?iso-8859-1?Q?HTUPPOTCmnG+VXAs6PCs9XjwbAcm+e/RdhIL8nvdZomXLlazWisvAsxmet?=
 =?iso-8859-1?Q?SmR9qdXF17e9T8ioNaYiJ9O9M4dt2wgBRCajFkk8swYi5U49wzR0i3N8RO?=
 =?iso-8859-1?Q?wvBEwrkXJo9J03O5sSrbTbg5tVk4bS0yydP98QSOprBe0VbiXx0HMXkVLG?=
 =?iso-8859-1?Q?L0TaMzepFHZXcbSmDu6+rgXy5VBL3fScoG8ZuhgkS7s2J+l2F5nKzO/kQn?=
 =?iso-8859-1?Q?v7FMux8yGcEfv4xryLiQN3h1m55yA0Z+m6wIGlQoBpkBmia1sJPNN9Bv7n?=
 =?iso-8859-1?Q?UEhiaQMHBKNQTi/7IT/te4ITxrR9HdkgUeKA9oyMNUL4bpQYIoF4PxVJmv?=
 =?iso-8859-1?Q?3yD4Dz6cXyd93aTab2WOSfshB2rolJzx5e5cTXOe5f2LLpgJxujdWxY0p+?=
 =?iso-8859-1?Q?lrqpI9VUBsNTQn+AE442KV27mImBJdExQVEpequKoHpFvbrG09JnqXaPkT?=
 =?iso-8859-1?Q?gxg4P+H+OWo5T7ab+lxx9XglutVFuYvDYgFKVJliXTLCHnvW2TOkD7gc5W?=
 =?iso-8859-1?Q?kOeqDsyD6HeKlpHHlU9FOIGKNgT+8g1NgSiWNtQm1lzi5IrWEreTvO7PTV?=
 =?iso-8859-1?Q?iQMXI/DzSxwl8b4q9an3GDw/xDNRuaW+gUFvxwQuaytfqCVRefZEUuvyXX?=
 =?iso-8859-1?Q?fkqBUXGHy2ShldLpQ2Ge0tYGke1n2Um8z3IhIgE69qZMeDWURqLsUPFLJv?=
 =?iso-8859-1?Q?kfijqxIRBLfAxZonFV1P7I239TgbXjylbNMzFvsXbTLS20dbEeo+k185PB?=
 =?iso-8859-1?Q?E7zhxbPR+0+qgtwnBJM8bcnH+gOYzu4indNoixRu8+GuAC+PJlyKKHQ1KH?=
 =?iso-8859-1?Q?o+lgHNNY4iOY8Gl10NAJ9hf8t88nN/hrzajXAM2BfV80TBJkeIWje53AJA?=
 =?iso-8859-1?Q?Y5QgGAYVv0M76qpL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UTIgingT1mqyiYybcUwVumHQTRaPBdraZulgmNxE8ErJwBfjk+w9L+oE/T?=
 =?iso-8859-1?Q?tUncVn0suin+d4pOsx1rgmagIwhd0xgpEonmuDhJX9aZ+RfZjGwD5Fvedt?=
 =?iso-8859-1?Q?5SJ75ekXKsve1L5VgbVFSa+hKpMRQHGiMCot6MBCrWeLa4g3Wx9zVqRe8f?=
 =?iso-8859-1?Q?wAvoDL6QUwE5SK0TrVHwdAGm+yjq4BKrZePZ1BLsQxT6PUxweTif5BQk+0?=
 =?iso-8859-1?Q?9VP4pHGoeHLS+LCC5gLKgJQPVWe2T/J5MIM+vziqd2mYMIGHeH+lPpFNaT?=
 =?iso-8859-1?Q?7dWZoKQ7HXJZo3czZ7Ch9DHNR/uOB7ikOe7YtCws14WqVpyKqx/A9dzVB+?=
 =?iso-8859-1?Q?upVNIpj0ug4bMJ4hzTHvBKHyck+na1/H3kIALhaqLaKnvabRzaN5gp9+wu?=
 =?iso-8859-1?Q?6OvHPIl+wvb16+hUbCUMUzIpABfT4D1rgW++hy/QLcqHRMPb4wtIiUJyFw?=
 =?iso-8859-1?Q?3oyRRn6JqA/lruEF65E5Jn6H0UknVTBiCgWL9q+4jv12X6rVgVTanMG/65?=
 =?iso-8859-1?Q?8pDnJ4SgQPHV/9dkAaqxYfyGT7aJ3w0Kn4RyBvFsw8C5yuBccP55TteSY+?=
 =?iso-8859-1?Q?f/gf4vrrbH3Wi0U9JGIMFEtdOD4UCr89NAA2YzvXsv15nh/CB/6vQkjfxE?=
 =?iso-8859-1?Q?RjgS7uLHVusH7cnFuVWz8YfAsLo/3MDbhRtUeOUC2G/GDEDao3XyfAoAj8?=
 =?iso-8859-1?Q?cSIpvYk0yDfEZC54QOiukLhEOrhK6L7f28B2lnc5uMVUleakNJicA1pZfY?=
 =?iso-8859-1?Q?z55a3bRkHwKH93KZctTUh6nYQaaecF2qdFUt4B+Wdsd0cZTDFWP0EcLn+n?=
 =?iso-8859-1?Q?LGbztST4o1tEUqOit31caL7VKB4inhUsi4wWQURq6jM1WWCNhGO1PaBnuw?=
 =?iso-8859-1?Q?1ADlD9HSRdwUJ+lQhIf/DaB3IJEupTrK0X3ZGzLZ1UIt6+CyLq7Uqtj8Gn?=
 =?iso-8859-1?Q?nn8Y6NYOSW58udfLfPxw1aAoxwtK4u8KMdnzvMFi5VeGwsPCtDjoc09w03?=
 =?iso-8859-1?Q?HZHxu1GBoUpfufhUD893rdVu7/USp8IChX8CtIgMVp6WBCy5roa0Osiz7o?=
 =?iso-8859-1?Q?pLj3Kv+WwrnZzGF+CjHt0Ke2hSt08/ycVHv1rbOxiqQWCbWeI/umY2JE/9?=
 =?iso-8859-1?Q?4gscvP9yM8zY8CQ7/pkxb0haa/0NTGisUKWavYlLs90RLLfyt9MHbD6amZ?=
 =?iso-8859-1?Q?xYlejEZPeRSpsxVeeL1ICV0y9kkun6YjAvfYxnN2iy70NVj0TExTyPUl4R?=
 =?iso-8859-1?Q?513iwRSvdIaYki9LDjVewuy6j75vIa2kggSnU3LoRzvUBpf6c4XpOCHZYa?=
 =?iso-8859-1?Q?IgcWQVeqF6Y5JTZOSyO71+YVIRHjSBH/7rbbwgWOqLkn+nzpAAQ5setV0F?=
 =?iso-8859-1?Q?2z6htb9K4OVfHbwrhDyK4Egq3Em1OMQmFoFkosO2sRPRRGhM3G5qj43Dm6?=
 =?iso-8859-1?Q?2VKnntkn4dmzNsyH8j2laB/q3vmAAvUm9xFVJ7OVknGF9t5PX1kfcFeeN+?=
 =?iso-8859-1?Q?iSP3ovqHBGf9S7NKPrLM1FyfKZF0BDEBE9xWNMwJEjB/msl8d4J8IHlEbY?=
 =?iso-8859-1?Q?NZSRgv50aUJiDfUNLghF4BmH7BqeBL1QInq+kjMETJeTxQ3tpxJsvtZsGj?=
 =?iso-8859-1?Q?kCxxw2HfaunaCygqVLgMO35T+kA2MJyzf7+jeit5XaV7LBtXrIBBINtw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d83a466-cb4e-41b4-86a9-08dd452362ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 13:54:03.6975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eCb5sUt8Ou8oYBLaJpcQ33TbviOQihttPZ7ULNfKPjfhVZnhQmcoVS8DW7c/FepWsU1HDoBE5I4pqMhDUrpPWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10120

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Implement support for PCI devices in the SMMU driver. Make arm_smmu_master
structure to hold a pointer to the device to allow it to hold PCI devices.
Trigger iommu-map parsing when new PCI device is added. Add checks to
assign/deassign functions to ensure PCI devices are handled correctly.
Implement basic quarantining.

All pci devices are automatically assigned to hardware domain if it exists
to ensure it can probe them.

TODO:
Implement scratch page quarantining support.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v6->v7:
* use d->pci_lock in arm_smmu_assign_dev()
* remove !is_hardware_domain and pdev->domain =3D=3D d checks in assign to
  support future dom0less use case when dom0 is using vPCI
* remove stale todo in dev_get_dev_node
* don't print ""
* remove redundant dt_device_is_protected check
* remove assign/deassing prints
* change assign logic to remove reassign reimplementation
* check if pdev->domain exists before assigning to it
* explain pdev->devfn check
* make reassign check stricter and update comment

v5->v6:
* check for hardware_domain =3D=3D NULL (dom0less test case)
* locking: assign pdev->domain before list_add()

v4->v5:
* assign device to pdev->domain (usually dom0) by default in add_device() h=
ook
* deassign from hwdom
* rebase on top of ("dynamic node programming using overlay dtbo") series
* remove TODO in comment about device prints
* add TODO regarding locking
* fixup after dropping ("xen/arm: Move is_protected flag to struct device")

v3->v4:
* add new device_is_protected check in add_device hook to match SMMUv3 and
  IPMMU-VMSA drivers

v2->v3:
* invoke iommu_add_pci_sideband_ids() from add_device hook

v1->v2:
* ignore add_device/assign_device/reassign_device calls for phantom functio=
ns
  (i.e. devfn !=3D pdev->devfn)

downstream->v1:
* wrap unused function in #ifdef 0
* remove the remove_device() stub since it was submitted separately to the =
list
  [XEN][PATCH v6 12/19] xen/smmu: Add remove_device callback for smmu_iommu=
 ops
  https://lists.xenproject.org/archives/html/xen-devel/2023-05/msg00204.htm=
l
* arm_smmu_(de)assign_dev: return error instead of crashing system
* update condition in arm_smmu_reassign_dev
* style fixup
* add && !is_hardware_domain(d) into condition in arm_smmu_assign_dev()

(cherry picked from commit 0c11a7f65f044c26d87d1e27ac6283ef1f9cfb7a from
 the downstream branch spider-master from
 https://github.com/xen-troops/xen.git)
---
 xen/drivers/passthrough/arm/smmu.c | 190 ++++++++++++++++++++++-------
 1 file changed, 147 insertions(+), 43 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c
index 03d22bce1e..cfddcbb1ad 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -132,11 +132,21 @@ enum irqreturn {
=20
 typedef enum irqreturn irqreturn_t;
=20
-/* Device logger functions
- * TODO: Handle PCI
- */
-#define dev_print(dev, lvl, fmt, ...)						\
-	 printk(lvl "smmu: %s: " fmt, dt_node_full_name(dev_to_dt(dev)), ## __VA_=
ARGS__)
+/* Device logger functions */
+#ifndef CONFIG_HAS_PCI
+#define dev_print(dev, lvl, fmt, ...)    \
+    printk(lvl "smmu: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
+#else
+#define dev_print(dev, lvl, fmt, ...) ({                                \
+    if ( !dev_is_pci((dev)) )                                           \
+        printk(lvl "smmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
+    else                                                                \
+    {                                                                   \
+        struct pci_dev *pdev =3D dev_to_pci((dev));                       =
\
+        printk(lvl "smmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
+    }                                                                   \
+})
+#endif
=20
 #define dev_dbg(dev, fmt, ...) dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_A=
RGS__)
 #define dev_notice(dev, fmt, ...) dev_print(dev, XENLOG_INFO, fmt, ## __VA=
_ARGS__)
@@ -188,6 +198,7 @@ static void __iomem *devm_ioremap_resource(struct devic=
e *dev,
  * Xen: PCI functions
  * TODO: It should be implemented when PCI will be supported
  */
+#if 0 /* unused */
 #define to_pci_dev(dev)	(NULL)
 static inline int pci_for_each_dma_alias(struct pci_dev *pdev,
 					 int (*fn) (struct pci_dev *pdev,
@@ -197,6 +208,7 @@ static inline int pci_for_each_dma_alias(struct pci_dev=
 *pdev,
 	BUG();
 	return 0;
 }
+#endif
=20
 /* Xen: misc */
 #define PHYS_MASK_SHIFT		PADDR_BITS
@@ -631,7 +643,7 @@ struct arm_smmu_master_cfg {
 	for (i =3D 0; idx =3D (cfg)->smendx[i], (i) < (num); ++(i))
=20
 struct arm_smmu_master {
-	struct device_node		*of_node;
+	struct device			*dev;
 	struct rb_node			node;
 	struct arm_smmu_master_cfg	cfg;
 };
@@ -723,7 +735,7 @@ arm_smmu_get_fwspec(struct arm_smmu_master_cfg *cfg)
 {
 	struct arm_smmu_master *master =3D container_of(cfg,
 			                                      struct arm_smmu_master, cfg);
-	return dev_iommu_fwspec_get(&master->of_node->dev);
+	return dev_iommu_fwspec_get(master->dev);
 }
=20
 static void parse_driver_options(struct arm_smmu_device *smmu)
@@ -742,21 +754,11 @@ static void parse_driver_options(struct arm_smmu_devi=
ce *smmu)
=20
 static struct device_node *dev_get_dev_node(struct device *dev)
 {
-#if 0 /* Xen: TODO: Add support for PCI */
-	if (dev_is_pci(dev)) {
-		struct pci_bus *bus =3D to_pci_dev(dev)->bus;
-
-		while (!pci_is_root_bus(bus))
-			bus =3D bus->parent;
-		return bus->bridge->parent->of_node;
-	}
-#endif
-
 	return dev->of_node;
 }
=20
 static struct arm_smmu_master *find_smmu_master(struct arm_smmu_device *sm=
mu,
-						struct device_node *dev_node)
+						struct device *dev)
 {
 	struct rb_node *node =3D smmu->masters.rb_node;
=20
@@ -765,9 +767,9 @@ static struct arm_smmu_master *find_smmu_master(struct =
arm_smmu_device *smmu,
=20
 		master =3D container_of(node, struct arm_smmu_master, node);
=20
-		if (dev_node < master->of_node)
+		if (dev < master->dev)
 			node =3D node->rb_left;
-		else if (dev_node > master->of_node)
+		else if (dev > master->dev)
 			node =3D node->rb_right;
 		else
 			return master;
@@ -802,9 +804,9 @@ static int insert_smmu_master(struct arm_smmu_device *s=
mmu,
 			=3D container_of(*new, struct arm_smmu_master, node);
=20
 		parent =3D *new;
-		if (master->of_node < this->of_node)
+		if (master->dev < this->dev)
 			new =3D &((*new)->rb_left);
-		else if (master->of_node > this->of_node)
+		else if (master->dev > this->dev)
 			new =3D &((*new)->rb_right);
 		else
 			return -EEXIST;
@@ -836,28 +838,30 @@ static int arm_smmu_dt_add_device_legacy(struct arm_s=
mmu_device *smmu,
 	struct arm_smmu_master *master;
 	struct device_node *dev_node =3D dev_get_dev_node(dev);
=20
-	master =3D find_smmu_master(smmu, dev_node);
+	master =3D find_smmu_master(smmu, dev);
 	if (master) {
 		dev_err(dev,
-			"rejecting multiple registrations for master device %s\n",
-			dev_node->name);
+			"rejecting multiple registrations for master device\n");
 		return -EBUSY;
 	}
=20
 	master =3D devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
 		return -ENOMEM;
-	master->of_node =3D dev_node;
+	master->dev =3D dev;
=20
-	/* Xen: Let Xen know that the device is protected by an SMMU */
-	dt_device_set_protected(dev_node);
+	if ( !dev_is_pci(dev) )
+	{
+		/* Xen: Let Xen know that the device is protected by an SMMU */
+		dt_device_set_protected(dev_node);
+	}
=20
 	for (i =3D 0; i < fwspec->num_ids; ++i) {
 		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
 		     (fwspec->ids[i] >=3D smmu->num_mapping_groups)) {
 			dev_err(dev,
-				"stream ID for master device %s greater than maximum allowed (%d)\n",
-				dev_node->name, smmu->num_mapping_groups);
+				"SMMU stream ID %d is greater than maximum allowed (%d)\n",
+				fwspec->ids[i], smmu->num_mapping_groups);
 			return -ERANGE;
 		}
 		master->cfg.smendx[i] =3D INVALID_SMENDX;
@@ -872,7 +876,7 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_=
smmu_device *smmu,
 	struct device_node *dev_node =3D dev_get_dev_node(dev);
 	int ret;
=20
-	master =3D find_smmu_master(smmu, dev_node);
+	master =3D find_smmu_master(smmu, dev);
 	if (master =3D=3D NULL) {
 		dev_err(dev,
 			"No registrations found for master device %s\n",
@@ -884,8 +888,9 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_=
smmu_device *smmu,
 	if (ret)
 		return ret;
=20
-	/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks.=
 */
-	dev_node->is_protected =3D false;
+	if ( !dev_is_pci(dev) )
+		/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks=
. */
+		dev_node->is_protected =3D false;
=20
 	kfree(master);
 	return 0;
@@ -914,6 +919,12 @@ static int register_smmu_master(struct arm_smmu_device=
 *smmu,
 					     fwspec);
 }
=20
+/* Forward declaration */
+static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
+			       struct device *dev, u32 flag);
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
+				 struct device *dev);
+
 /*
  * The driver which supports generic IOMMU DT bindings must have this
  * callback implemented.
@@ -938,6 +949,23 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, st=
ruct device *dev)
 {
 	struct arm_smmu_device *smmu;
 	struct iommu_fwspec *fwspec;
+	int ret;
+
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+		int ret;
+
+		/* Ignore calls for phantom functions */
+		if ( devfn !=3D pdev->devfn )
+			return 0;
+
+		ret =3D iommu_add_pci_sideband_ids(pdev);
+		if ( ret < 0 )
+			iommu_fwspec_free(dev);
+	}
+#endif
=20
 	fwspec =3D dev_iommu_fwspec_get(dev);
 	if (fwspec =3D=3D NULL)
@@ -947,7 +975,25 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, st=
ruct device *dev)
 	if (smmu =3D=3D NULL)
 		return -ENXIO;
=20
-	return arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
+	ret =3D arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
+	if ( ret )
+		return ret;
+
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+
+		/*
+		 * During PHYSDEVOP_pci_device_add, Xen does not assign the
+		 * device, so we must do it here.
+		 */
+		if ( pdev->domain )
+			ret =3D arm_smmu_assign_dev(pdev->domain, devfn, dev, 0);
+	}
+#endif
+
+	return ret;
 }
=20
 static int arm_smmu_dt_xlate_generic(struct device *dev,
@@ -970,11 +1016,10 @@ static struct arm_smmu_device *find_smmu_for_device(=
struct device *dev)
 {
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master =3D NULL;
-	struct device_node *dev_node =3D dev_get_dev_node(dev);
=20
 	spin_lock(&arm_smmu_devices_lock);
 	list_for_each_entry(smmu, &arm_smmu_devices, list) {
-		master =3D find_smmu_master(smmu, dev_node);
+		master =3D find_smmu_master(smmu, dev);
 		if (master)
 			break;
 	}
@@ -2066,6 +2111,7 @@ static bool arm_smmu_capable(enum iommu_cap cap)
 }
 #endif
=20
+#if 0 /* Not used */
 static int __arm_smmu_get_pci_sid(struct pci_dev *pdev, u16 alias, void *d=
ata)
 {
 	*((u16 *)data) =3D alias;
@@ -2076,6 +2122,7 @@ static void __arm_smmu_release_pci_iommudata(void *da=
ta)
 {
 	kfree(data);
 }
+#endif
=20
 static int arm_smmu_add_device(struct device *dev)
 {
@@ -2083,12 +2130,13 @@ static int arm_smmu_add_device(struct device *dev)
 	struct arm_smmu_master_cfg *cfg;
 	struct iommu_group *group;
 	void (*releasefn)(void *data) =3D NULL;
-	int ret;
=20
 	smmu =3D find_smmu_for_device(dev);
 	if (!smmu)
 		return -ENODEV;
=20
+	/* There is no need to distinguish here, thanks to PCI-IOMMU DT bindings =
*/
+#if 0
 	if (dev_is_pci(dev)) {
 		struct pci_dev *pdev =3D to_pci_dev(dev);
 		struct iommu_fwspec *fwspec;
@@ -2113,10 +2161,12 @@ static int arm_smmu_add_device(struct device *dev)
 				       &fwspec->ids[0]);
 		releasefn =3D __arm_smmu_release_pci_iommudata;
 		cfg->smmu =3D smmu;
-	} else {
+	} else
+#endif
+	{
 		struct arm_smmu_master *master;
=20
-		master =3D find_smmu_master(smmu, dev->of_node);
+		master =3D find_smmu_master(smmu, dev);
 		if (!master) {
 			return -ENODEV;
 		}
@@ -2784,6 +2834,42 @@ static int arm_smmu_assign_dev(struct domain *d, u8 =
devfn,
 			return -ENOMEM;
 	}
=20
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+
+		/* Ignore calls for phantom functions */
+		if ( devfn !=3D pdev->devfn )
+			return 0;
+
+		ASSERT(pcidevs_locked());
+
+		write_lock(&pdev->domain->pci_lock);
+		list_del(&pdev->domain_list);
+		write_unlock(&pdev->domain->pci_lock);
+
+		pdev->domain =3D d;
+
+		write_lock(&d->pci_lock);
+		list_add(&pdev->domain_list, &d->pdev_list);
+		write_unlock(&d->pci_lock);
+
+		/* dom_io is used as a sentinel for quarantined devices */
+		if ( d =3D=3D dom_io )
+		{
+			struct iommu_domain *domain =3D dev_iommu_domain(dev);
+			if ( !iommu_quarantine )
+				return 0;
+
+			if ( domain && domain->priv )
+				arm_smmu_deassign_dev(domain->priv->cfg.domain, devfn, dev);
+
+			return 0;
+		}
+	}
+#endif
+
 	if (!dev_iommu_group(dev)) {
 		ret =3D arm_smmu_add_device(dev);
 		if (ret)
@@ -2833,11 +2919,27 @@ out:
 	return ret;
 }
=20
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
+				 struct device *dev)
 {
 	struct iommu_domain *domain =3D dev_iommu_domain(dev);
 	struct arm_smmu_xen_domain *xen_domain;
=20
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+
+		/* Ignore calls for phantom functions */
+		if ( devfn !=3D pdev->devfn )
+			return 0;
+
+		/* dom_io is used as a sentinel for quarantined devices */
+		if ( d =3D=3D dom_io )
+			return 0;
+	}
+#endif
+
 	xen_domain =3D dom_iommu(d)->arch.priv;
=20
 	if (!domain || domain->priv->cfg.domain !=3D d) {
@@ -2864,14 +2966,16 @@ static int arm_smmu_reassign_dev(struct domain *s, =
struct domain *t,
 {
 	int ret =3D 0;
=20
-	/* Don't allow remapping on other domain than hwdom */
-	if ( t && !is_hardware_domain(t) )
+	/* Don't allow remapping on other domain than hwdom
+	 * or dom_io for PCI devices
+	 */
+	if ( t && !is_hardware_domain(t) && (t !=3D dom_io || !dev_is_pci(dev)) )
 		return -EPERM;
=20
 	if (t =3D=3D s)
 		return 0;
=20
-	ret =3D arm_smmu_deassign_dev(s, dev);
+	ret =3D arm_smmu_deassign_dev(s, devfn, dev);
 	if (ret)
 		return ret;
=20
--=20
2.34.1

