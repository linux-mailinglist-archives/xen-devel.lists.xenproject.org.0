Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9D9A27374
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881484.1291670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNT-00008h-Tu; Tue, 04 Feb 2025 13:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881484.1291670; Tue, 04 Feb 2025 13:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNT-0008Uq-NT; Tue, 04 Feb 2025 13:54:11 +0000
Received: by outflank-mailman (input) for mailman id 881484;
 Tue, 04 Feb 2025 13:54:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jloo=U3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tfJNS-0007bp-RW
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:54:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f403:260d::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81bd75d7-e2ff-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 14:54:09 +0100 (CET)
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
X-Inumbo-ID: 81bd75d7-e2ff-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sp1p61tVokaBL06B1HQvSy9aVcEX1YZMc2tCv8/DYRzH2pcxp/5gOTVMnCQf/SdiSI5uLKRNptmMj+G8nPwwFyFzqgKVasKUquH9w9hYeMotKdFmGOjgaR4Jj14BC1kaXUxB6hpYlJ/ejMHAACrw6lTYgsi41WUCsdugEezVIHPaNS7Hb7UAt3Kie4Ijxj+Xc4EzZqP8WDrWMg1ZsR8Q6XGL6hlSsulm9u0YTFhTXb9zLZ5mADfn9lCaN78GmSbbbF02ucXzGfWKOCWCw6IokPf9wKY6zn7PGL/z6dwKk5cYDI0TjnW5BLzw9VZs9He0Wfhf1soMhEb4zzuJIfFt/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSwUIuX/M6++bKUnXBVsSIP1yPfNpCUPLwGuNZ2HAX0=;
 b=jMTfQg/RbWyNeIp4aSu0yD3JWS1jlnQmtstTxWrdzA1L2cdRGa7ZcHkdowvS8CkGDAmeigtT9RP4+69YhHMxdzL3hk2BZP/WraNGhAGkF21fKrRjuBsko4fgrKW2q36CC00J1RFuifHXzDCJmLMC2suOmU9mJl77MGFS3twDJu3ijgWv8wj7i+E61maw63/W6RZ9b8oAI/I3lgmIZFe5PyLMY3KfRkfxML/LJ/MGfLOSwriLn/QXpJvRWozlMIod/W8Ppyru5p5nR5yQegD7CP55Wg2HJLu0PfNrxLgoDY0hGca+TGb2TtJu10pfeuSxYQClvpoA8VRBnaNVcGtxvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSwUIuX/M6++bKUnXBVsSIP1yPfNpCUPLwGuNZ2HAX0=;
 b=GSGAgOHj7n+McKeo3o63qiu+oYO2rltkf06PaySXHpA2fJMYHy1d7QWQq044mjh/xSlc75XXp8ij7IOcZI0piJvlkh4dL+TYrfnYOPqhD/Ee9rwpLAmP35rO6rVtDeoq6z2dkfZMRyOFqWXtuSr2pO+bSFBP/4EdGqOF6CxU7+TJ1aDPJpfO+1OJAZuSFX4VUvMg41zsh8OwKLatsOfiHC8mwToSmfU1HQs1RoPyEvDEcbmM6Vhfb1zSPkDbw+I4YyOk45AEj9sKC/lpp1Zm2b4dmyzwh4CFXR5BMJVYwojNvkykT0MLce9m0tvm9Q+R1yRngsmtJ1AhDHXBm/3v6g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v7 5/8] xen/arm: smmuv3: Add PCI devices support for SMMUv3
Thread-Topic: [PATCH v7 5/8] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
Thread-Index: AQHbdwxAgXXfAs39tUOCWD0oIla8JQ==
Date: Tue, 4 Feb 2025 13:54:04 +0000
Message-ID:
 <dbbf957ced225e24a1e7c3e68a17201f448e4633.1738665272.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 008fadee-28c0-47d8-916e-08dd4523631e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YufnP8kIm9mQpl9Ocso8U/6yzYCLLk91lgIgWnuwJORFd2EG8yRriRT/X2?=
 =?iso-8859-1?Q?uxbLmgdp94m4pkcNb3VXFPFTHFhx4YtxPvoJocPdd8osIZ09cUCx2GSIvt?=
 =?iso-8859-1?Q?qO7g6Xu/g2j5kYhFs6JGj16/sVVntuF9Qo9n6OV5Zt58ONPMfW+StJ8nT3?=
 =?iso-8859-1?Q?jLuU/pZP4FGQiSjo9xIwFMZLwIZSAxfbmQGw4Rqkve128DGq9ebUXyn+vP?=
 =?iso-8859-1?Q?ebbyavt+vMtjSRlt5MmcYX4JJGn20l6UMEAYwup5EWDT/40BtM1N1oC2/n?=
 =?iso-8859-1?Q?JqmaMr9NGhMIDc5W++MUY7h9aYn1Txp2frXhLn/amkGKcIZZ0J0mLXnguK?=
 =?iso-8859-1?Q?JJOzeZSCi2TXlQdCED2RKTI+7M7Za/7fvMTZIzW6aWzDvwSYPg1O5S7aur?=
 =?iso-8859-1?Q?mQ4Xorwa1yitTQtke7nW/B+UwYkSX8uuI18E5AjSPzvywi4Mhcz5LfsqhU?=
 =?iso-8859-1?Q?N5tkm3kLMqQBQ2s5/o03xPZ9JUODXXFza+Q+hiCzaV4xpX7TfXfCy65CMN?=
 =?iso-8859-1?Q?7Y3fK6hyoEGhRF26kH7wbl5frTQRf41qQJMuHwmp/nO0XVMTJguVJXy5S0?=
 =?iso-8859-1?Q?qWFBQ+tjAWca+bIEdFcQ/DLeEorcM3UJTmv9z6u4/Vp23gEC3nX1WlzFyx?=
 =?iso-8859-1?Q?NYPJlTlGd+GKoZK03Mezrn7OIDV196wYRtgxhB+GCQhFkAxFrZIPYv28h6?=
 =?iso-8859-1?Q?UBsXQLa5A5hZLTNs5RHtSDf47342xFbbQzDki1DwgJMnsCm/40hdhgSOWU?=
 =?iso-8859-1?Q?LUlG121fhbvSBmSFHXQ27KR3GNgpamFK3juZwGyLQnXFa+dFaC2EvT2oZI?=
 =?iso-8859-1?Q?8VVaRzqnW7ojLddoxuM6XtWnmcC11tM/IL8adUB+lWGy1JcLZlTVMV03ET?=
 =?iso-8859-1?Q?UJio/0SOS5Pvegw/zrW1tBZy2NgiSXiilaMxfk2tm534iLwSqyyLXTA1VZ?=
 =?iso-8859-1?Q?pYnNWtHMN7PWgFYhVRnIeVjOvpVKlF61FTF4yA9IHTFTXAHBXeZsqSurFd?=
 =?iso-8859-1?Q?qJbmrVVE6n/MFcjQhAKsVcc2wGKGcCi6sZydiLYlbpt46ZQKm/uQu8SacZ?=
 =?iso-8859-1?Q?ZPcAGbNGjZ7Cl8DTaDVW5kKtmGHbgAX7IrSZPx8d0sLgc5ejhHUVCksjBR?=
 =?iso-8859-1?Q?LLf/FKzPz6dmCaD8YSYQRrAfi2WZUq/Z3X0sfrQoMzT0L+X29nQVuln1X2?=
 =?iso-8859-1?Q?zTqoXyqQ5J/48mAu8CEWp6bq4YdW2oH+n/VYYijOhHby/NDJRLon7VKW1j?=
 =?iso-8859-1?Q?DygNviTMmfrY1ocOISWLl07RGuNtwu1RDBJgp4DWmtkil6cYHR0nfA337C?=
 =?iso-8859-1?Q?KPL/AA/xQz1GT5Hq4sYY0+cEQrs0GGgeNgp9pHF9gVrmb3j/TMC29Mv5n/?=
 =?iso-8859-1?Q?YFD4nN7o3u3Wo95MFQ19Ls90XvUfdpCaCR5nMyhaQcX0pb1/nODgLPi7gh?=
 =?iso-8859-1?Q?Wg4UsWjIgI2KGRm6WPCrcen2xMzUwlKqoG+WjYyqEoo+bh/xrAGquv5P6e?=
 =?iso-8859-1?Q?1yUOiAHPu7MKe/3ME+/E7O?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kJ56hI5vUuFlXndZFRuE4GWduZrmR9MqhBhgUfH63kVKAsHf8bK4GRyjxY?=
 =?iso-8859-1?Q?oExipN/jrjRHYHX/OmTh5igneicNP20l94Z+D3jCueteZNnhbDM59bSHUK?=
 =?iso-8859-1?Q?qm38SDzDfu/wUtsg6vBAIa+eGFCue23zsUX6QEmq25n0rtyH0mGg2rDhrU?=
 =?iso-8859-1?Q?LetzAAVd0BwHNnCYTWfGIty53Pik/xmDlSGtFTnq5DIxqxaDhWVl0KiWi6?=
 =?iso-8859-1?Q?yUNvW3g6jea+gsshDzSHHaF0VApzV08u4ChBpJ48Z/rt7BJS/AQjB8O+3o?=
 =?iso-8859-1?Q?tpKT/5iJBqDxp+FrFOOb54kY2nMIiukcMqFneuKbAEWDsWIezAHIH1siUu?=
 =?iso-8859-1?Q?43s/ys4i4afQUg+cgUxLYUaAP8wDvlbSJR2F06pdzxwV5UmjdmyLU1cl5L?=
 =?iso-8859-1?Q?BNqtt3wbMTTsVXjKDNnHpI4U9hptC/TO7wLFvqXYQss271S4o/VD4aW/Yl?=
 =?iso-8859-1?Q?J+Zk0iVD2kuahZrioTgr0VkRH0I6BXIQPXIg2Ubl8tVATHzsrBLsyHJW0n?=
 =?iso-8859-1?Q?AWXyuR8AW60Ui+ooUPtzOO2dP8GbletaS8sz5lQso9+3r+OkwDJa9+VqLO?=
 =?iso-8859-1?Q?bHT5ySbDMxwIZLS6ZNgLKCJqF4LtF3yvcsptqt3LPArwD6/PREelrB7spe?=
 =?iso-8859-1?Q?We3PEeD9CIiYecdYnMUn1Fg+LoIMH1o0RA/ixyumioy9w7eMRAuuMY/Mpq?=
 =?iso-8859-1?Q?mtoGMchZgGW8syYnM2NsXpXfFBgbbOuewCYUo939qyQovanqKgt/Ggt8mT?=
 =?iso-8859-1?Q?jtwPd9l6Ze+w9EGCZAqmAyO1eS4xynmfuk+3PjGpyzRnL6fhEsyinzZxWc?=
 =?iso-8859-1?Q?fnsYcLxAOyf92mFXrAKjJNsgOZTE8JZH5IovGVqzHeaXAo0cdhYpDHIdi0?=
 =?iso-8859-1?Q?ZNAjaId0UPwrjYya50ZZTXRvi+L1gPpFWG9NdjDJOqnbRePJ6V7uNlJAnb?=
 =?iso-8859-1?Q?bDNYMAdPWYzF1jX9BOi6IEevjRrl4+ifH4UFNFEQANnhfQYTUNQQGIS1MG?=
 =?iso-8859-1?Q?5VFJim9Nf9nN8OpFCwp89VG02ewjdVyJShIBCd8+YRSpJMPXzbo/ihbYQW?=
 =?iso-8859-1?Q?Xmf9mUfctrpFnKCqnFaXGqPWuJd4RQ+LtLmB55WtDSs99H/CtGGPdEGodq?=
 =?iso-8859-1?Q?nskMOTG5iqKm13U3jQtkJwnRNgXJMOmv78MEsIinrQV3es7Ihv/emPy2u7?=
 =?iso-8859-1?Q?EeJZl70CFA+Zp8FdhtEkec+iSvwTgUyHCZxRnXuvntZAKcfZknNvYQwkNU?=
 =?iso-8859-1?Q?46EszTW3RiT1ZeVl0on6FAIorIyhDfCYfNzLs7nYRzN7N/GYODzYipSEud?=
 =?iso-8859-1?Q?+jfFJEzTe1+ycASCkoizZMlrzboACwF43lcjl+KynXU/ZW2CJdeIMjMwkw?=
 =?iso-8859-1?Q?ehmCgqcPo+uA7rdenDpD28KrgwVjJztljX+SaiUIDQ+tV6m505ijGC/oPb?=
 =?iso-8859-1?Q?WSO52DS0HRg0rNZWKoNQxYF+cN5SnvYUlBDcfY7n37J+YyI5Shsb0X3Pj/?=
 =?iso-8859-1?Q?OxK940nTHZ24hpVWYgisaUKInS6Rm0PREeJgi/YFRf4tB9rYwu73KnTLz3?=
 =?iso-8859-1?Q?ZyobnO/YQKwxqnUV2mDVpeO/9Yjkg55904hVgNGjnJtq8IRRexg6o91o9j?=
 =?iso-8859-1?Q?mF79UEErGAT9BLeAv1q0/qqxX82e68MZzzorBhq1xnD1XrBNRyS/52Qw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 008fadee-28c0-47d8-916e-08dd4523631e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 13:54:04.0604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h11mjg/UeGn0vqBjmuOB4Nnt9yWTkKxtQIRGX9l/GAdByIqONwDaDqpUn+YdUGQPuk9jDXPBIFJMScO8QZxCPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10120

From: Rahul Singh <rahul.singh@arm.com>

Implement support for PCI devices in the SMMU driver. Trigger iommu-map
parsing when new PCI device is added. Add checks to assign/deassign
functions to ensure PCI devices are handled correctly. Implement basic
quarantining.

All pci devices are automatically assigned to hardware domain if it exists
to ensure it can probe them.

TODO:
Implement scratch page quarantining support.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v6->v7:
* address TODO: use d->pci_lock in arm_smmu_assign_dev()
* remove !is_hardware_domain and pdev->domain =3D=3D d checks in assign to
  support future dom0less use case when dom0 is using vPCI
* check if pdev->domain exists before assigning to it
* don't print ""
* change assign logic to remove reassign reimplementation
* explain pdev->devfn check
* make reassign check stricter and update comment

v5->v6:
* check for hardware_domain =3D=3D NULL (dom0less test case)
* locking: assign pdev->domain before list_add()

v4->v5:
* deassign from hwdom
* add TODO regarding locking
* fixup after dropping ("xen/arm: Move is_protected flag to struct device")

v3->v4:
* no change

v2->v3:
* rebase
* invoke iommu_add_pci_sideband_ids() from add_device hook

v1->v2:
* ignore add_device/assign_device/reassign_device calls for phantom functio=
ns
  (i.e. devfn !=3D pdev->devfn)

downstream->v1:
* rebase
* move 2 replacements of s/dt_device_set_protected(dev_to_dt(dev))/device_s=
et_protected(dev)/
  from this commit to ("xen/arm: Move is_protected flag to struct device")
  so as to not break ability to bisect
* adjust patch title (remove stray space)
* arm_smmu_(de)assign_dev: return error instead of crashing system
* remove arm_smmu_remove_device() stub
* update condition in arm_smmu_reassign_dev
* style fixup

(cherry picked from commit 7ed6c3ab250d899fe6e893a514278e406a2893e8 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/arm/smmu-v3.c | 117 +++++++++++++++++++++++---
 1 file changed, 106 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index cee5724022..9c7c13f800 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1467,14 +1467,35 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_d=
evice *smmu, u32 sid)
 }
 /* Forward declaration */
 static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *de=
v);
+static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *=
dev,
+			       u32 flag);
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
+				 struct device *dev);
=20
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
 	int i, ret;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master;
-	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
+	struct iommu_fwspec *fwspec;
+
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+		int ret;
+			=09
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
+	fwspec =3D dev_iommu_fwspec_get(dev);
 	if (!fwspec)
 		return -ENODEV;
=20
@@ -1519,17 +1540,38 @@ static int arm_smmu_add_device(u8 devfn, struct dev=
ice *dev)
 	 */
 	arm_smmu_enable_pasid(master);
=20
-	if (dt_device_is_protected(dev_to_dt(dev))) {
-		dev_err(dev, "Already added to SMMUv3\n");
-		return -EEXIST;
-	}
+	if ( !dev_is_pci(dev) )
+	{
+		if (dt_device_is_protected(dev_to_dt(dev))) {
+			dev_err(dev, "Already added to SMMUv3\n");
+			return -EEXIST;
+		}
=20
-	/* Let Xen know that the master device is protected by an IOMMU. */
-	dt_device_set_protected(dev_to_dt(dev));
+		/* Let Xen know that the master device is protected by an IOMMU. */
+		dt_device_set_protected(dev_to_dt(dev));
+	}
=20
 	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
 			dev_name(fwspec->iommu_dev), fwspec->num_ids);
=20
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
+		{
+			ret =3D arm_smmu_assign_dev(pdev->domain, devfn, dev, 0);
+			if (ret)
+				goto err_free_master;
+		}
+	}
+#endif
+
 	return 0;
=20
 err_free_master:
@@ -2622,6 +2664,42 @@ static int arm_smmu_assign_dev(struct domain *d, u8 =
devfn,
 	struct arm_smmu_domain *smmu_domain;
 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
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
+			struct arm_smmu_master *master =3D dev_iommu_priv_get(dev);
+			if ( !iommu_quarantine )
+				return 0;
+
+			if ( master && master->domain )
+				arm_smmu_deassign_dev(master->domain->d, devfn, dev);
+
+			return 0;
+		}
+	}
+#endif
+
 	spin_lock(&xen_domain->lock);
=20
 	/*
@@ -2655,7 +2733,7 @@ out:
 	return ret;
 }
=20
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct d=
evice *dev)
 {
 	struct iommu_domain *io_domain =3D arm_smmu_get_domain(d, dev);
 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
@@ -2667,6 +2745,21 @@ static int arm_smmu_deassign_dev(struct domain *d, s=
truct device *dev)
 		return -ESRCH;
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
+		/* dom_io is used as a sentinel for quarantined devices */
+		if ( d =3D=3D dom_io )
+			return 0;
+	}
+#endif
+
 	spin_lock(&xen_domain->lock);
=20
 	arm_smmu_detach_dev(master);
@@ -2685,14 +2778,16 @@ static int arm_smmu_reassign_dev(struct domain *s, =
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

