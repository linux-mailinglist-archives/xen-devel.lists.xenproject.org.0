Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9364AC6557
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:13:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999019.1379729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpp-0006Lu-2I; Wed, 28 May 2025 09:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999019.1379729; Wed, 28 May 2025 09:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpo-0006JI-Tw; Wed, 28 May 2025 09:12:28 +0000
Received: by outflank-mailman (input) for mailman id 999019;
 Wed, 28 May 2025 09:12:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sgde=YM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uKCpm-00059a-Ra
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:12:26 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd7b1e04-3ba3-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:12:23 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB9PR03MB9709.eurprd03.prod.outlook.com
 (2603:10a6:10:459::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 09:12:18 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 09:12:18 +0000
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
X-Inumbo-ID: dd7b1e04-3ba3-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnQSZ2BhXB6sybxX4u+Us22H3i2HXzd3rXhfYqL8guOHu+x00HnFvelLHrImIKyD5xhGWYlsIBqg3QKB+w8gOSVkXyZAsLqeRo7Yn3Id4gfePPgPJAIwo+Wh7iSglqIqMPfy+Lm1g7qJvZMcsjP477XaxzBRBrGfwjPFoCiiAdbDexf6DNSEVAqF+BDIhx6Z8U3ZMBLcJd9O1V0Pa/UQfazxIWTb/jhVqw9wzIx9SOcJuPaJsanmB9TKQCh5tqswkAheaxnCfDU6ba2iWGc7dioiU1ZNhrMDXHXow/KCyAsrMgIijoPiBa1hH1yTBzWsaVJzZpmLOt/+BvwbrfIP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQZycESTBz9C6MbA7B3Hy4Wre4XE9BIA9Vmagsd9l+Y=;
 b=g43WCKwZbt6GPyLTYusOXdRzl055hnTXKYaYIs92mc09OmOCpV5/jPgFlMok7mCcu1LzaONnuaYKXNn4grjkpjXssUwmYbTIgHod07L0l2Za+1pJ5NbqbmhsM1eRoTBDu80eneC5wR9WLl29iErDG1KdMpH0oxg1RiWV9FNKt1dCiUe22GTF+1kJR815v3o9+zKDBfFQQKqCbCEsotDYkJ6uoVDgcMq4WHFirV5+YX62vUtY29Yp/shQPX/Fm25Ms81EXunv4IT/yfTbhcJVLRiSvdOYSoKwsoExF6sixw6amq2vaFANMeZnGICWulzp17MbtzD/y33SjKPibAygcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQZycESTBz9C6MbA7B3Hy4Wre4XE9BIA9Vmagsd9l+Y=;
 b=j8vZBYqgWo3ZWDtxw1DLBgyvtZMpY0Fsxy7w4ivoiEP35HGm0GsgmNFy1OS9Q/wKc0m34BMQR0h/o0O32OsLzKmgD+CRke5D4TK9Bn8HmI8IRD1GcIfY3/OahDzZZqxCDu/0SoJJju5SYZMCWfWo/EQlfmGsO4kStS+6zQ4qdeDDEEBqNBV9QdIz7C3B5DI7F4FXATmk9qnxmLwvd5lEcztIsva0TYoB3K3U1umBq29XneT4c3nJCuo2pwdCSuIO2aBHx9dqR0/vD1Y9HIVGRtsrDakS7kihEEoopMI7rDSLY2VabvI6OLpc+jn1bPtDJnI/4X54fCimN9xkf1dCag==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Julien Grall
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v11 3/7] xen/arm: smmuv2: Add PCI devices support for SMMUv2
Thread-Topic: [PATCH v11 3/7] xen/arm: smmuv2: Add PCI devices support for
 SMMUv2
Thread-Index: AQHbz7Cbv47KYV5h7kao9yNqlRrN2g==
Date: Wed, 28 May 2025 09:12:17 +0000
Message-ID:
 <3e52fa21f988a38e06511b629f54e2f5e7e2a332.1748422217.git.mykyta_poturai@epam.com>
References: <cover.1748422217.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1748422217.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB9PR03MB9709:EE_
x-ms-office365-filtering-correlation-id: bf2b71f1-b3dd-41d2-a5c8-08dd9dc7beac
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UY2Q0t4Js9DfcdLj+24arf3XEMdkrLeI6ZVAMlrGW9WWPi+FV+OdJpEUje?=
 =?iso-8859-1?Q?YQYwZtVi+ACBB6BVY/0gTj8lyo1QBCZrzFIn4lsvTHXQG8upU2+P/XYwZ5?=
 =?iso-8859-1?Q?UURJNUZugXnFpT3MQ5l3pFg00EPoDN6tgLN40PoVPWfjQAgJhgzGm8Kp1/?=
 =?iso-8859-1?Q?88Ggy3rx6SD39kmIz4Yh9NYczD2xrQRPB53QBNHcJN2eYW/OK4KwQHT82Y?=
 =?iso-8859-1?Q?DzW3bYpx16DEMKOn0tuY1tv4LwNEcEvlIGXWiVuee+APYPckBtXMsCRfXA?=
 =?iso-8859-1?Q?lAl7wo66i/DN9MxA5bSMY2uL0eqUUfE4BVkxc1BbqK6xfg7JZKBjH2AVgf?=
 =?iso-8859-1?Q?NrmAbRfN9gSn3msc/6KRF8Xm+0zIL6tgyf69stkYosjP4sBMXduVx4VIx0?=
 =?iso-8859-1?Q?5BagueotGnhPzEjbMC6iS/148QbWIJM/WEc1SoviX/gxbpDT4HXfpCkpye?=
 =?iso-8859-1?Q?KDJh8XDckFkvXnSUTpKb4kKVNqUvM8ek+6hmlbF5Bd8mbB2dsPCTBNWliF?=
 =?iso-8859-1?Q?c9ye7vPf8BuEb4oxCQ82A1OSNG3n1pl9zHf/BHMTsu/+ns2Hqvl7S0OU9A?=
 =?iso-8859-1?Q?Y/d1nWPPAcOW1K93JyC4GbXAoNGyfRbJY10Hbiq9jCWfbs6gavs/R9J5YS?=
 =?iso-8859-1?Q?0BG82Vf15iJZD+2GSZZU5c3cEJ7cX9wl/XCdpg5TUYSspUhjUdxzSpoiol?=
 =?iso-8859-1?Q?zmOxdVE6Mfc2jdGUJlBDJlB4HqjMbaJ+B8DxvYKJYoCHyRHKP1y/veE4FQ?=
 =?iso-8859-1?Q?O79sbfFEiBLTuyp3Via4OO0pN6dso5/cPMun4B+ehsVijGlkalZesPCaJs?=
 =?iso-8859-1?Q?cZII4Pwz72e8rwHin96mr0UvmtkpOaPcifAbNg8E3awssCX8/kS1rHHH8A?=
 =?iso-8859-1?Q?ZRrUHM+H9hMRuQOuGhi6dv2MbvGrs1uZt9XZRlEhu67zn0yx5rIy06nxvl?=
 =?iso-8859-1?Q?1ChwVfDbbmnJ2UauIU4iZd++QiHnU7RV9j3wLVlNLdZHYVSe/eLZrTbLb4?=
 =?iso-8859-1?Q?Ja8g6gB4dJmuuuuiNBYG4GBXEKe1oie4RJalvEMCXphW0VCPVQXP/72APb?=
 =?iso-8859-1?Q?60masnwhLzGJVcPN3vlkPo8snK1Xe/KzkD6CPS3Z4u7VW9q8vwfJNIvzEx?=
 =?iso-8859-1?Q?uh43th8GcEGwI09rHkOv08wH+FXQM6vG5CWVdZZaBO5+9Gw5b3H1orN/Kh?=
 =?iso-8859-1?Q?d4SXuKMZ/oQpmxxlGujfwM741h07Zy0jPw2TKjnJah3KQVba0EDwK0LK4w?=
 =?iso-8859-1?Q?sXTnIXpzxGH/eAcMV0IF8ekVP0INGnTGzcOQoye1/ec4Qg2Jjp0FWE68f+?=
 =?iso-8859-1?Q?aNNabN4z+4UmZtwQYx7qvCmRLn8PTAk4Pqqo/nyXTANdCaQOTbYtkWrbwh?=
 =?iso-8859-1?Q?CowzvzupWl1tua2AqHdRZy+WcbjXmZ/dssJLF6NEAUNE4liNcO70T9LX0X?=
 =?iso-8859-1?Q?lV9pQ2/3VJO62lQNk5WQckhDzUsKczB9JG6pEevWGzxFV8Td+1PsvfWK7S?=
 =?iso-8859-1?Q?k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pvGuMHazxQH2rMHVrDKrHvII2zCtrkiqthCcDJB6MawuP0A/QRl0Tx1kqa?=
 =?iso-8859-1?Q?62S1dF7TJkutt+R/RmdZfGdBqVfkodD3uUgwgyLtFLbeU7Y8+2g3r7fAt1?=
 =?iso-8859-1?Q?hNE0magTHr6QjcHhQL/D78xXKxFpalXBnyKHXKMANDqnorvQgXXQW8WFj4?=
 =?iso-8859-1?Q?2OF1LulAlX39Ksb8RhrCRHnswbLW5BLhFRrTH/mYpzfDXSszFnTRXj1har?=
 =?iso-8859-1?Q?RBCyEFgRvwHKdFYXAGeGdum319m8Y3Vhen+ECaYUKABdaFgdAWSAEnpKnX?=
 =?iso-8859-1?Q?Xe1fVoq9IENJEetgvzhvWhoVmTssCtL1OTDveJPhzMiM23ZyIG7igSrXLM?=
 =?iso-8859-1?Q?n/KsxQPecmWDuVjnp5eoq13fNzILDvqiat3JdxOpsEPupADQSzvZ9kBuss?=
 =?iso-8859-1?Q?UzRNH1szaD0v5dYDG6YkqUIzQkOM4SHA9EmyZNkM45RFp9xaugOUQK6mBc?=
 =?iso-8859-1?Q?aEkwhgv4eROZTTTBGl+1So5JgUT0Ip7vQSmSvk4o4XteF6zcmTlUBQhgRr?=
 =?iso-8859-1?Q?YkBxo/MRrJ55+ggNL1/K9BhAFanPLALE8Z9HKJEOnV61I3qGjGfWPGmdXn?=
 =?iso-8859-1?Q?VvU8MvDWNFEqNX6P0NEZeAkgOSIHjQemJjGh1gNezKhxiv+QwHAMkUTcRz?=
 =?iso-8859-1?Q?ehM4j6XhW5zrDOGdi5V9Z3zIX6psrc2IvbrcQMSL2zbaZTXwPmQG4G57+9?=
 =?iso-8859-1?Q?h0o5Oz7u+j5aLL6ZFSbH8PPSBSj8G9UmMkqSC9W258rpo+V+is2b8Zvhen?=
 =?iso-8859-1?Q?BCs+JOQF9v0PQ8PARufdr1nYSOotaP0DpkFpsiHd0eNWv8e6MH1wlSsvuj?=
 =?iso-8859-1?Q?rTHNCDPL4C0UqM5lTW6zqmUPPWQu3afxILMXnvMVY+rkTs3WMipXUVnVcU?=
 =?iso-8859-1?Q?32L/cbwUMnVW/Ik83Iixfcj+IIrAqcrQaYJuZAM3UF1LIeSpRBvRWi0c6k?=
 =?iso-8859-1?Q?12yN9xSaCQp5rtKKOfY6y55kcWAyjDOmauawP73SlqMM4Qhe1UeQ4xr1BK?=
 =?iso-8859-1?Q?Lh1Gv5vAzXzmSFd2xa3DEZjKA7yhf/q20oCD0BYyEnDHzUu8HQvZWlctkZ?=
 =?iso-8859-1?Q?bUFxstX6QD4dDPH8aTB6WyjATWY1eiXYh5ESIfOU7ycytgD4gEC8qd/9EU?=
 =?iso-8859-1?Q?s2X3yQjjdyZUGCjOzJR778P5fFp2q+PBUGAlX/NJsPCtQayOBKngCXZT5M?=
 =?iso-8859-1?Q?crGrkgm1o6KUmHpMVlGtjDFNzfq815xe8AXyoNOtgUTDF6L6/IitdAh0HJ?=
 =?iso-8859-1?Q?gtHNQ9IS6FZuC5AVeWbdGGw8s65NP1VDwpyxuyyt2hLSyhVwgf8N7s8276?=
 =?iso-8859-1?Q?tSXI36+R3ODky4mUpc33n9ZvAVGHDOUOEYqeJAbIwnL6zQgKtQQy4LUnhx?=
 =?iso-8859-1?Q?nNi7YVavZutKUvCjfYgomWxCNkukmU5ZjYNfTQLLnMlbYhA5tBCt8rdOP5?=
 =?iso-8859-1?Q?jZZ0pmdUTtjo793z4eclAOqY3Pk3CIjy2Bb7FaUCP5D0NLMhcFbiIy+31v?=
 =?iso-8859-1?Q?Qvb3JFaS/HvxmjiNYVrXy+bpUyVU7+izL+Fg7aHT3DclsM8VnFvUBb4BMU?=
 =?iso-8859-1?Q?mL1S5uNTTpw9VMvvnoqteWyuITvoBWkorIXb/OuanPnnLx7XOTqP5O0K+k?=
 =?iso-8859-1?Q?M3rXLbemosqeyMXoxUdSL1EEeI7f6ZjeeaoLZAU4lNXqESRQSB7ZsbVw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2b71f1-b3dd-41d2-a5c8-08dd9dc7beac
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 09:12:17.2426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iY2pYXdSyfxFZcLoqGs4mc1Pdy+oDA/xGpuCcvWWjAxuR6EImbn1eAgm2IrwIfGAiW4XoNNAyVG16CSvVyuo0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9709

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
v10-v11:
* remove unused code
* remove unnecessary blocks

v9->v10:
* remove unused code
* return on error in arm_smmu_dt_add_device_generic

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
 xen/drivers/passthrough/arm/smmu.c | 246 +++++++++++++++++------------
 1 file changed, 146 insertions(+), 100 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c
index 0f8d47dc98..307c2f6837 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -120,11 +120,21 @@ enum irqreturn {
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
@@ -172,20 +182,6 @@ static void __iomem *devm_ioremap_resource(struct devi=
ce *dev,
 #define IOMMU_FAULT_READ	0
 #define IOMMU_FAULT_WRITE	1
=20
-/*
- * Xen: PCI functions
- * TODO: It should be implemented when PCI will be supported
- */
-#define to_pci_dev(dev)	(NULL)
-static inline int pci_for_each_dma_alias(struct pci_dev *pdev,
-					 int (*fn) (struct pci_dev *pdev,
-						    u16 alias, void *data),
-					 void *data)
-{
-	BUG();
-	return 0;
-}
-
 /* Xen: misc */
 #define PHYS_MASK_SHIFT		PADDR_BITS
=20
@@ -619,7 +615,7 @@ struct arm_smmu_master_cfg {
 	for (i =3D 0; idx =3D (cfg)->smendx[i], (i) < (num); ++(i))
=20
 struct arm_smmu_master {
-	struct device_node		*of_node;
+	struct device			*dev;
 	struct rb_node			node;
 	struct arm_smmu_master_cfg	cfg;
 };
@@ -711,7 +707,7 @@ arm_smmu_get_fwspec(struct arm_smmu_master_cfg *cfg)
 {
 	struct arm_smmu_master *master =3D container_of(cfg,
 			                                      struct arm_smmu_master, cfg);
-	return dev_iommu_fwspec_get(&master->of_node->dev);
+	return dev_iommu_fwspec_get(master->dev);
 }
=20
 static void parse_driver_options(struct arm_smmu_device *smmu)
@@ -730,21 +726,11 @@ static void parse_driver_options(struct arm_smmu_devi=
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
@@ -753,9 +739,9 @@ static struct arm_smmu_master *find_smmu_master(struct =
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
@@ -790,9 +776,9 @@ static int insert_smmu_master(struct arm_smmu_device *s=
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
@@ -824,28 +810,30 @@ static int arm_smmu_dt_add_device_legacy(struct arm_s=
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
@@ -860,7 +848,7 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_=
smmu_device *smmu,
 	struct device_node *dev_node =3D dev_get_dev_node(dev);
 	int ret;
=20
-	master =3D find_smmu_master(smmu, dev_node);
+	master =3D find_smmu_master(smmu, dev);
 	if (master =3D=3D NULL) {
 		dev_err(dev,
 			"No registrations found for master device %s\n",
@@ -872,8 +860,9 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_=
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
@@ -902,6 +891,12 @@ static int register_smmu_master(struct arm_smmu_device=
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
@@ -926,6 +921,25 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, st=
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
+		if ( ret < 0 ) {
+			iommu_fwspec_free(dev);
+			return ret;
+		}
+	}
+#endif
=20
 	fwspec =3D dev_iommu_fwspec_get(dev);
 	if (fwspec =3D=3D NULL)
@@ -935,7 +949,25 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, st=
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
@@ -958,11 +990,10 @@ static struct arm_smmu_device *find_smmu_for_device(s=
truct device *dev)
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
@@ -2054,65 +2085,26 @@ static bool arm_smmu_capable(enum iommu_cap cap)
 }
 #endif
=20
-static int __arm_smmu_get_pci_sid(struct pci_dev *pdev, u16 alias, void *d=
ata)
-{
-	*((u16 *)data) =3D alias;
-	return 0; /* Continue walking */
-}
-
-static void __arm_smmu_release_pci_iommudata(void *data)
-{
-	kfree(data);
-}
-
 static int arm_smmu_add_device(struct device *dev)
 {
 	struct arm_smmu_device *smmu;
+	struct arm_smmu_master *master;
 	struct arm_smmu_master_cfg *cfg;
 	struct iommu_group *group;
 	void (*releasefn)(void *data) =3D NULL;
-	int ret;
=20
 	smmu =3D find_smmu_for_device(dev);
 	if (!smmu)
 		return -ENODEV;
=20
-	if (dev_is_pci(dev)) {
-		struct pci_dev *pdev =3D to_pci_dev(dev);
-		struct iommu_fwspec *fwspec;
-
-		cfg =3D kzalloc(sizeof(*cfg), GFP_KERNEL);
-		if (!cfg) {
-			return -ENOMEM;
-		}
-
-		ret =3D iommu_fwspec_init(dev, smmu->dev);
-		if (ret) {
-			kfree(cfg);
-			return ret;
-		}
-		fwspec =3D dev_iommu_fwspec_get(dev);
-
-		/*
-		 * Assume Stream ID =3D=3D Requester ID for now.
-		 * We need a way to describe the ID mappings in FDT.
-		 */
-		pci_for_each_dma_alias(pdev, __arm_smmu_get_pci_sid,
-				       &fwspec->ids[0]);
-		releasefn =3D __arm_smmu_release_pci_iommudata;
-		cfg->smmu =3D smmu;
-	} else {
-		struct arm_smmu_master *master;
-
-		master =3D find_smmu_master(smmu, dev->of_node);
-		if (!master) {
-			return -ENODEV;
-		}
-
-		cfg =3D &master->cfg;
-		cfg->smmu =3D smmu;
+	master =3D find_smmu_master(smmu, dev);
+	if (!master) {
+		return -ENODEV;
 	}
=20
+	cfg =3D &master->cfg;
+	cfg->smmu =3D smmu;
+
 	group =3D iommu_group_alloc();
 	if (IS_ERR(group)) {
 		dev_err(dev, "Failed to allocate IOMMU group\n");
@@ -2772,6 +2764,42 @@ static int arm_smmu_assign_dev(struct domain *d, u8 =
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
@@ -2821,11 +2849,27 @@ out:
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
@@ -2852,14 +2896,16 @@ static int arm_smmu_reassign_dev(struct domain *s, =
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

