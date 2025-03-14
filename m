Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C92A612CC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 14:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914591.1320351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bl-0004jH-79; Fri, 14 Mar 2025 13:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914591.1320351; Fri, 14 Mar 2025 13:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bk-0004cY-MJ; Fri, 14 Mar 2025 13:35:00 +0000
Received: by outflank-mailman (input) for mailman id 914591;
 Fri, 14 Mar 2025 13:34:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/juS=WB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tt5Bi-0003Jp-8J
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 13:34:58 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e45e93e-00d9-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 14:34:56 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7950.eurprd03.prod.outlook.com
 (2603:10a6:102:219::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 13:34:51 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 13:34:51 +0000
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
X-Inumbo-ID: 1e45e93e-00d9-11f0-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYH0MHqdIpodfM/Ujls4y3CxU3cM7rK/e547b27S62ELuvOw6JWKalxUrNENnm/GVruNm+gRoI3n/wuXTK+F4/+mUMVIX+c+4tgvvoatz4M8JceVpvYP6RfyGIK5kWVckjJDbInDFqMgv/UOnDuetEeT9S4Z32rfLgeAgMKfcXKKn9G67CyWw9n0U4VBMO6hRZ4aTkFN1xh/LhWv+hZKHKkhhJKhYJ5A7AOPnIZjZzSNWe4QE8B3Zac2ehpAmY80M4vak04OJ5u33Xwf0nwps6pILT6dqan21sWe63uPGa8Jfov7rxLgFGgELaygcHzU+NkRidTl/ZCy5EgfFc/C1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hlh1zQAkMfzGRpHne5rgWyDdp0BZ3vC2SDvajq3D2NQ=;
 b=YdoJ9UAd8u+lMyU7nYPUhSZuOvdzfXCBuVZ2NuNUk7cbhnb1fp37m/K18sxuOdhWr0rYag3JpN1aa1aZgNjsqWzDuA/Ex3t93lUBtYpMzaqTMC62dj+y0+pGBD1cdwkbrLEPQ8Zr8ak20UMDsDaLOJ/hxpJLKN1IROBL28Qc6GK6JB6k/yNhyjOyXmbwE5GcwQp2KrHzdpQ2ALGjxA1UBaYZwGmMWUSWkVg7Gp+nKy1yiyF0XKjkqU5ZWrHPI4HamBgKOVK4mQFrbGHL8qe7MZeg0HzoamNUOje79xIvjMca0zoZCw/pajnkrmsvv4FwFpugoVCaRLWinVy6Jq8PzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hlh1zQAkMfzGRpHne5rgWyDdp0BZ3vC2SDvajq3D2NQ=;
 b=EfT3vowE4udA1AeGMHA0iqipQCpKvNQu24r6B7QZ0489aDZMdKmX6XobH+pfc5DAZdqDgfUGXIdrkAK8XI0tP75/766SIVkdpmOHJjIfF6KqbadAEJZTX0OkcWZeiG6PUz9CD++yySRuRNRb+E260zxb9n69fTizTYz3LVD2z2wCVmaY9b3agndCO8XjDP+F2ciLDY+JtsOhja9htFlWAJlEZ5jBo54qPnHSZDOtHyQy83aFNSSAoOeI00HDmbyrizbcjJqFh+Oe37knAvE68xpJK+THfmp5hbzzZB2Egj/tIxiBrDh43KywbtBXyzaJgbTaRCUtTekMm9oASuqRdQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Julien Grall
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v9 4/8] xen/arm: smmuv2: Add PCI devices support for SMMUv2
Thread-Topic: [PATCH v9 4/8] xen/arm: smmuv2: Add PCI devices support for
 SMMUv2
Thread-Index: AQHblOXddxnGJU9kEEekiYRuY9GmSQ==
Date: Fri, 14 Mar 2025 13:34:51 +0000
Message-ID:
 <fa31ae5fa173348b4c0abf714d3c32f182e8860b.1741958647.git.mykyta_poturai@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1741958647.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7950:EE_
x-ms-office365-filtering-correlation-id: b403bdee-5be6-4d57-46f5-08dd62fcff89
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3OWXJbPuzxvCaQhUW1lO0GXp+94vhIsGuwEXiUw7mJ7PTWRpngmt1BawAt?=
 =?iso-8859-1?Q?X9Yfp/oDVWhdeNNqT6Mc4TWbWb+S41Y/RYCg23HGcU8mgOOuaKtZjvsrYO?=
 =?iso-8859-1?Q?Iq4GfRBfuYKTvWpaCxFPfEbDBYMp8u4rJh/hr09R0k+OVfUJ6ogguWz0Ph?=
 =?iso-8859-1?Q?rZoH6/jaRa84R9wXahI3gJmcDBkeNymwdHiNQfXMycI1zTFCk1t2afm+8p?=
 =?iso-8859-1?Q?5Gg62yQY26jlBf+h6vadtJ+6lrKeISD0pUriRb+wG8ZlCuCGhjVZhudWcI?=
 =?iso-8859-1?Q?IEcwjcza8+/wOg2boiaDDqsLTl19UxC5A4IJBZoh+Apj8ZpohjPs3ZLcFe?=
 =?iso-8859-1?Q?rDw292XiL/8G9qrBTuAZznK+4VZpt2wzViqnRGoXxE9xCPVzQMBK/nyz4K?=
 =?iso-8859-1?Q?WxWUyOb+GG1NyQIlk/wTTBQxsEkWxy7E/oULdlEcuDZxweQaDX2XuC4iq5?=
 =?iso-8859-1?Q?DtJa+/pcgxw7j9bp0roQkcM7NFD16ixmrSpF+xx8mLQK21SXHtvR5JG8cQ?=
 =?iso-8859-1?Q?lMrQj5Jlq91vvGIIHuLeHACvij0wgsSK8Clcw1hnEeDyOD2XYM/F6xC6Yh?=
 =?iso-8859-1?Q?Ka4tQIbj5lhXTNh8cwr6o5IDNd3pX5Zh8+1J2OLxnJuBBRwXQI0ihKtTzS?=
 =?iso-8859-1?Q?dv3vjWRdkLtzL/GIs88TVbJhnb3JNA27BjcZVOWuezzkLha/VFqDG8JUK0?=
 =?iso-8859-1?Q?abxAQPw42kHlmqdLs9suz/SWQYXpfeGPO5vtBZlhW7yoPZSfGvbr4+PPQj?=
 =?iso-8859-1?Q?TbHX1W3KAGuw7x8Y/nrEc0gFZx/aCGh3k0R7qGxoFxTPKLPRSzAjyClqL6?=
 =?iso-8859-1?Q?JgXRCXDsvCQeJuJcA/g1TgG4yMXQvOxKr8t4GZpKlga8KAqtF+EEepT6xZ?=
 =?iso-8859-1?Q?xjGJOH/AmGEgy7va9iYVuErAnLTtH3wsBsUx1iRRZV1ehm/0uoDpRbUjKa?=
 =?iso-8859-1?Q?TCGKZeggU4Uc3H8UUJyhQhzJIX06QBSawbt73rZANq5Gn2P6NsVYYfpFRM?=
 =?iso-8859-1?Q?5NRXbEeShrX/k0meP/6x2BYENwkUy6KYltKFN28tjIMUNRcpbusp/DDTPT?=
 =?iso-8859-1?Q?zLoS+2Qa7UCxRuBcmmBg1JRvVqLBStyCPon4I2F5gltm2V0UjMTybbClhd?=
 =?iso-8859-1?Q?mAbLrFe7pPwvqfZBpxfpM8t5Qxe4UZ0bdorgL/m5GRHwtvgwtaLMXn2ydK?=
 =?iso-8859-1?Q?UZkhF/u4d+j1yHxCGS9E6lZNEuE91d3EAl4kkhq5tN2cXVgMmva07H3o2I?=
 =?iso-8859-1?Q?Ue9OOskwflMosURH8seKjvdWSsuGr+nu/GsVWrGW0FpoMLG4Ig/mQfZnw4?=
 =?iso-8859-1?Q?mWYUx0/LhsrrsdrrwnqlsoPfrqZP3zUJwYhMN81NWDfDVtvTp6oN1k6A0v?=
 =?iso-8859-1?Q?E1+ndm0NX+sCO63/lZ4zZ95WlQtMGtIQhqbiX8IAOWjUou19wS/z6AfHKB?=
 =?iso-8859-1?Q?jp983OIQNvvlEd+xKQRpdXkdi7vafqGWuh6N1uZIsPCbM8gXBNyxjcDkUR?=
 =?iso-8859-1?Q?XOPXrcIL4IiYix+bxPXheO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?N9zQNIcRgFCcPaVWJvh2bi6vtkFPJPS+QFV+QeWDJ7S7Yf+ZEUceFCJln3?=
 =?iso-8859-1?Q?ofYi7HpcjQVjzFcontPnIxk5B3k0odBj8Qzud/PonZG8NdnHOIV+5tr7MC?=
 =?iso-8859-1?Q?CtzcBxyomffQvmIccyr+/3MUQ1ococLCsIoLLOzZiPHC1wqhD7Bra69tJC?=
 =?iso-8859-1?Q?NV3+Ika8DRKT4HTGj1pMJwDVyWqgNnxH9zNHlADLfybViUUEHKKWTRj8Uf?=
 =?iso-8859-1?Q?Yuy1RcBbE10MAZ7RegTGE5m2zpQ/Ig0/MNSlpBxHGzmc60oDFj+cJ2nw/R?=
 =?iso-8859-1?Q?57Gr6+OWYmU3lI/qRfNrAVs6C0dpGt9NQzND07zOs8B1tcS6XfB7UYt/FF?=
 =?iso-8859-1?Q?9J2vwB7ZaNL5FhsNgh3j0LxKFy/8FnbRPAWrFY5gj3KdtRkX9CUBllf2nC?=
 =?iso-8859-1?Q?lC34B8CYbZXw7S11ONcGXLD+Wmy+h+fCF5JP62zAzIXA8C/E7GOlXfVsKw?=
 =?iso-8859-1?Q?ODiUfEOYkQGbBJv7rFrHm0TvksXH6Arepzn72n0c8GdgDi+Rr2um9dl/1Z?=
 =?iso-8859-1?Q?4kwD0M4dW9RxWfkZ2WAjyCXg1wvYMCnx4x12d5TUSYO5B1iIWmG1pYGh5c?=
 =?iso-8859-1?Q?I9AfxihioJSqSFKb4ipgrAo/RkuRls5+184gH6Z2yJ/vSeJe5c7h+8Z0RB?=
 =?iso-8859-1?Q?y2iX/K7EPAUbJDsX2M1hl2xl2eJDoqXZRpQ4xc/K3CJrpeO1pa4l+IC2ee?=
 =?iso-8859-1?Q?GiTF31y5y4nxe90wAZD5RJUp556bqZng0xG/J8TbaAC7MCU3aHPET8y5Ki?=
 =?iso-8859-1?Q?kHET6guqPP95Rvn3TIiXTTDqv5QeSjUD0e92WWpmvOAoJHyq8kJtVGkSIJ?=
 =?iso-8859-1?Q?De5wx4vfLnctu/I9vqDc143feUstXvlzRQ3PboxQrcj6da44ZdBYMzB+W8?=
 =?iso-8859-1?Q?LODyZ6jUOMcAA/OfQ9JlF3zWqS7OcLv0OdpfA4Fa7WDoJTdDbYd/0YU2U9?=
 =?iso-8859-1?Q?VnXnFH5VN6DtbCgIgqVh+QNx1XgtvaOT5WxoR7PQQie5WiwnuF0hURdPc/?=
 =?iso-8859-1?Q?I1/9e94eLU8RK5Euqkx2DSGW90u9PeBDKyoxuNGB4tXruSBuvg3V4jP7jD?=
 =?iso-8859-1?Q?0nsdL5Efy0qGdBjwgT9jPZr/FrZA+CrWurboQwWxsl5un3RkDNiOa27ygy?=
 =?iso-8859-1?Q?VMNStVIE61fjZ41nZLvelJcGfbByZiHunjHq7Qos6NmfDbyAVVS32slPRO?=
 =?iso-8859-1?Q?7mK8kCrXscLgcnw49uk1YNa+5/yAgm2NZ+9oSTjoEl4TPnVMKnbTnXRWHM?=
 =?iso-8859-1?Q?H6XHLdTb+oNpjOFD4BORGSNFKdngTrSyHWupzohlbhfBqpn7+wPYbzMIK4?=
 =?iso-8859-1?Q?nYXlO490eTsdOxqIpL1DClohssPjFWyNCefZ0LRFHcUGXZHSmf1wyqOg87?=
 =?iso-8859-1?Q?tv7Ajt2gGDjeSnbLdXmieauuaaEuMgC0FjejVjIFd7YiKl7yk9PHMk0cH2?=
 =?iso-8859-1?Q?MpAfZ5S6hKx0VeSdAiuJmp6tLttABU5RI7Ben45n3+BCY7ZQWbAN1vbQSl?=
 =?iso-8859-1?Q?qPbqkKZr0sC5cXKKcLorAQojxVFba0RrVfI/E6WYofEJdjmskGs+bK3/sC?=
 =?iso-8859-1?Q?dHXv0MR/yIreHHRQ+iSLLfMSVS6Y1tzKI3GuoHK6i2S4jH555nMFNIJo2L?=
 =?iso-8859-1?Q?cQt6WNuDdevFGzUYhu1APGWBxMAuyLNsGY7fJ1fsBDK2HIBLiIhYe+lA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b403bdee-5be6-4d57-46f5-08dd62fcff89
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 13:34:51.4846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3Ur7ngx001xinORw+D5pr7nXuBUMG8ggTXXaP7XIoD8+8220inLD+3W46Ws8Us+HilNUwZO5w/nGYGlvEvFCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7950

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
v8->v9:
* no change

v7->v8:
* no change

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

