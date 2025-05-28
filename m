Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB0AC6556
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:13:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999017.1379709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpn-0005rj-Bd; Wed, 28 May 2025 09:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999017.1379709; Wed, 28 May 2025 09:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpn-0005pQ-3j; Wed, 28 May 2025 09:12:27 +0000
Received: by outflank-mailman (input) for mailman id 999017;
 Wed, 28 May 2025 09:12:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sgde=YM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uKCpk-00059a-R0
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:12:24 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd40b35a-3ba3-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:12:22 +0200 (CEST)
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
X-Inumbo-ID: dd40b35a-3ba3-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnuE9FVI7CzAuo78+eJagKveINYuphJAYBuW9+VTm6F5AIdXH4D1ckC2bKceO+ZOu6xyYVerH+X/cX4oonzEh1zGw1FTwGDB+tfrUb140Y9AEAJUaeZs2aJGf5/ZuAgfkJMjskRLiJmOnHF9Q3zNPywEHdZLZcoIyRBi0oSd0rmhIrrtjt3m1V5TBaJ87gUuOXUGCznvF9Y/NpKyVrtGX99hsniaCLnQE+KBPNQhWQcj/NrrzCsnXEi77sbb5D8zGcZRiTDl84JZKVk2h8+ZBW99gijjXliy6KDV/COMgVnsxRr4Sj2iJIPE6LJD23PAJDO5uSzrSzBTUV9Hpy+B1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzo1xbl87gBEcJrut/a4fYUJmfRPUormJMze4Lg6xzk=;
 b=Gky3hKKG1KW8tYfvJdaxdTgabypV9lbhsLRvAT2ckhhFOz+1Yn1v3erjmJoyKxeiUD/D1lb0kdcvjaAA8d2MwdOch6bt8HKOB7bvoGrfofWMP1/MsqiD5RHCTkvl6rrIij++i6Fm4sZI+qWz13UjeYNjqrSHKlzSLIQnh43OiQRGVZfa4zquoQ/dSkUTxpMt4eWMOKRg48RI7aFevVBtdvOxdWgaOCrQEMt2S12rkbFdG5sLugSKYwu1AtcFYJY91f+Zk5SHW1LScRnCAf5963IiX90o1e8uB22ldU64H8A1/PgQf1lvUCV6UB+y5XK9wGNqDZuuE5N02/b+7uj1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzo1xbl87gBEcJrut/a4fYUJmfRPUormJMze4Lg6xzk=;
 b=dpfwAOSVU7NpJV2jvkYQV6fZZUuQwZHRFA0BY0+ed+276KwsGBLDVL2ZDlgMDJQaMnrk4ecF3BsRaOlrjoGuKFIDLsNY2szbkoDSq/8UgOPUC18HjZI0JOJ5bHUo5Af/EHkhIVgf95RNoTSIVnJgdFY+KqV5wGyoDkNnakL7Hqo2ff3pH0KIkAd4h6Orf+Gr2PmO2Ym3Gcg2cpHhhVg+a4B3Au+dID3H6UUxRN1OmJnC1AYoYAARp0WC/JD9vo/M2Qm8WG+9go7CvqGimvS8E6f5eAYanbrHGflLhSIFSjwvJ4W+y98gK5Ro3pIPMQe0ObvuL8PKX0XVodw9BhMHHw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v11 4/7] xen/arm: smmuv3: Add PCI devices support for SMMUv3
Thread-Topic: [PATCH v11 4/7] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
Thread-Index: AQHbz7Cb+Z/yNKbLOEOjir1VN7bH5A==
Date: Wed, 28 May 2025 09:12:17 +0000
Message-ID:
 <71741747bdc0cfcacbe86e66ddd6239ea2f5a3af.1748422217.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: b9ab53d4-a4a6-4f03-1b3b-08dd9dc7bedd
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Icytq4DxlUARu2DpdADweVqcbnotW2wlX4Sd4fYI/ne/g4cImMkxRYDkmv?=
 =?iso-8859-1?Q?Mzyp5k6f25toNe73/WDChHNmT2Ecp93N7WkzbdnprZk5Xacpkd3n3ZHi6V?=
 =?iso-8859-1?Q?CdH8ltMimw1tD6qX5jvzfjo0jXifxyZDhkdvziRojZGDMr6r63bgzJ3oG6?=
 =?iso-8859-1?Q?NA74uauRSDAgqeHImVx3nS8buEi15kvcVALkiMCAH7RZDOP4GCLuaC87NO?=
 =?iso-8859-1?Q?XaZgktNqAownS6Qik090b4+T593Ssg0Ezmwh73fSHzHBFn+trhp1XAsFQV?=
 =?iso-8859-1?Q?xAy2ALBOBqYXnRF52VyA58VBtPUKxAwvAp7ad/HAAr0rR6pPY+aNAUBjAa?=
 =?iso-8859-1?Q?zNfgYdhIFg//2wwExqE7CXNe9RBxjt540QSaYMIlTB2SxcYlC9pwJ5ScN3?=
 =?iso-8859-1?Q?x27sKUKYTD0kpLpbAKwOdGvYKEnX45Y9TsmBGts2cJbCVyHpwzt/6bsLcN?=
 =?iso-8859-1?Q?BdxrJbBzCUQK9KwFOQLyvVPQ16mGAItyUe7imorzILesXZZh2J9fPuUIFq?=
 =?iso-8859-1?Q?xkPm+9sAyRq3Go9JeDpDk5PlIkJ/1EaKibD9FnMAvDohGGSn4+u+nEH5ZL?=
 =?iso-8859-1?Q?DuEJsXhIl3wMyJRHhdE+mFMgL4LTJkgjb/bgN3Oz9DuoiEVE6mFSfL1G5N?=
 =?iso-8859-1?Q?ZzwdCD6BNcRV2v8rG0jqcJhr5ZwY7Fiyc0Amq82mvaKTFGw8jz0oNJBPcs?=
 =?iso-8859-1?Q?d39lQfARfHq7tr5KDbVy8hiFxrsaIEosDE6OsNv+Tp7PQLkFIUv2642zk2?=
 =?iso-8859-1?Q?nsmwt35DkbrGb3TKt9SUFwrUxIU9CMBJlgf9QJtfTIz+pxNGh1k7EFQB9Y?=
 =?iso-8859-1?Q?ip3LEnHWF0rh/s9A4dnu4yftuaVhIqD292AIkRXXswADDs0yWzdHUUZ5MT?=
 =?iso-8859-1?Q?719kcu6gUoPeceMazLfuq8SSwN8nOes0pI0Zil5IdALMp+3zn+fwJ01fdO?=
 =?iso-8859-1?Q?T+OjI+wV6snOPwmX5bzFGyvMshdF1fkHMDPFivc3EnoXQEksX/bEHfjTfv?=
 =?iso-8859-1?Q?kUhAeTa8i0DtYKF3YIsXe38/ZhsiNVXg6mjMWK2xZ77LG60D8A5eKIdta8?=
 =?iso-8859-1?Q?uFa63Hp62E2LUfe7eQb4xhzGlkIrCAEm7KJGOPAHCfN4bauTnAtpZZzi39?=
 =?iso-8859-1?Q?zKMwskB5Di9owiaexvDyQZ+QOprH+ACZYRUHSPCC2ojru4pAfrrp6YHrkM?=
 =?iso-8859-1?Q?b6rHyZHLUUuMfeNepK/QrUpNiFkS0HNFf9BD6LDCdm5nWO4BJZzycsbKme?=
 =?iso-8859-1?Q?WZsOodnea9josITlNCVGXJLR5Znhtx579pBrahhFsN8VqOzwRXvSyxQ+hC?=
 =?iso-8859-1?Q?Wq6KoxYoSNOAXSnIqsl9/kTOSxccI9gPlftE8DHl2qmeVhLkT9IkoIbmMo?=
 =?iso-8859-1?Q?yqYkVdpxXeiX1k5wN27shpnSmQ3rvnsGibLsX6qfTUoCmxuvMJ1VOY3F1D?=
 =?iso-8859-1?Q?+n+XffBsZ8BDRAiURmBHnSO3f0PLtff0/RG558kB8FOTEMoDant3th4jX1?=
 =?iso-8859-1?Q?U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EXJk9V4Aip0f9PXqrtViCSuC0IW0gHUqYbpYX8C8lortREjH5VokBfLQPK?=
 =?iso-8859-1?Q?L9lTurv6nRqgG5dNKZQt+kw+UTIwu/tQ2QRtbfHVjyYDonT8J2h+47zg54?=
 =?iso-8859-1?Q?kBtfYGK5qMwfVcNqE3PJbTedEVFdZ816iJbdQBido3SmO5UcTdJ11Efq12?=
 =?iso-8859-1?Q?QtANphTgVRTifkkvINU0X+DCd8Qhg4XwKt/w3bAGTEPWtl+FZWc3Pp37kV?=
 =?iso-8859-1?Q?s8+cOvsGTxNFZ8+vuaOQFC51Dip5fKOmPKJ+7LJtvydKFHNPJkFhnXVFbp?=
 =?iso-8859-1?Q?I1vhml4aGD1eDvvpcbcS82+nrKw1Qr7eihz8F/USB7XcPpDxBOBXJRuFt6?=
 =?iso-8859-1?Q?8HAS3HXGBcBB2dkZEJgNB7r62pXaA6de3jyi4KpoRhBny3DSMLBNAPFj5o?=
 =?iso-8859-1?Q?7aCuYxPmX2v8mZc6JdjTOIH2zJlMsT4FTOCG0ZMxK0Opvr80Pj+ZrbUA3T?=
 =?iso-8859-1?Q?oLJznU5TUSelmpl6JUmeoIqMk29N3YmginujpVbWQl/wzi1udznY0BxmXr?=
 =?iso-8859-1?Q?EurX5QWMg5OeiCDMTjfFvMJh9OBPJEjWxTA3Qi3l0ZOE/3vP268WLNERPJ?=
 =?iso-8859-1?Q?s/1ZKQKqWTPWCkOfBJTFrTcevw7nz8GxewRCTOlUG51qrwkB/ubEjmBU/P?=
 =?iso-8859-1?Q?I75lKdAOcjQBoHE6cZ4h/5G1jRR/PasroWLyY+B0VwmKWKv5iQjxkCqPGN?=
 =?iso-8859-1?Q?TTSRyMFPaWzOOfSProYZTkQJdqqyqr64nPNfHbXLEg8+Xvuk0lxHAO/XlW?=
 =?iso-8859-1?Q?xTqxs/GhTVvTpbwVeps0mu1nxrjxLzhzCgo84cauRoxRSyBEPR7H5BMnC1?=
 =?iso-8859-1?Q?n4OYAup/E2XP9GBCEOUJmnqbRvbw5OLSb54Uom1/9RWpGa9qXv+3gbebvO?=
 =?iso-8859-1?Q?gfdsgbNDRTTzLheIL+MPS2J/a889MPII+raTxj5WDfk1P5bBl1kpoajSly?=
 =?iso-8859-1?Q?4wIbyHbH56m9G7d3MYeUM9runjUZckIaWbcPvLDBPpWrd/xaPPblxyQiec?=
 =?iso-8859-1?Q?X1BtpmlkuzG9ItmaFUQNQ7JSxPTerHMjSI7m/9AJyLJmr6LapFRC4WMU9y?=
 =?iso-8859-1?Q?JGsDyx6rha7TM0snPAZEy/Wf8XbnkXCPRIeKqNFR7CKS11e7gqpIwFI2eF?=
 =?iso-8859-1?Q?eAihMWvM98Fu/5eenDCdVzYno+ovbLNvwphCVmlYnoITVh+THPSblzrrIy?=
 =?iso-8859-1?Q?uff/IYFfyJx+19jhy1k+omgsGwJENvToAH0bsaqbs0beMW4lhEDZQ+nDwr?=
 =?iso-8859-1?Q?rYh2udy4/ctO6sOPNgzNlzqzSJh92E2MQYA3u8b6Lhj5sUBTis0q1nxQvp?=
 =?iso-8859-1?Q?lmKj/swrB/vJzPABi6T6saxXJ797E5NR5iVuH2OSyv7FtXQAJNrC07c69d?=
 =?iso-8859-1?Q?MByoSdCXvVosDtvTIxLGTtJ5g0gq2o6W1Av3R4BbwThfc77BoNgkZ1EDJd?=
 =?iso-8859-1?Q?OoiDdScJC7C7lucbDlT6CtcQTaGHOhBDBr+KW+FP8t0rzz6UcxNwQQ8YRp?=
 =?iso-8859-1?Q?7tg0duVS1i+fRitn+0OqaXQX0Uo686lSvf5lxGzLBbVLdbxLB8SDXIKt0F?=
 =?iso-8859-1?Q?c4IjbxifhYihTq0R0VQ0G2i94G74jlsmf4ZyHrVDhHKJ7N0RgfyaKderl+?=
 =?iso-8859-1?Q?vfAPqMBUNLGqg+sGniqZxB8l1Qh95LAtK4wv7JXZ6ad8lrGUd+68SY5w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ab53d4-a4a6-4f03-1b3b-08dd9dc7bedd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 09:12:17.5309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jI5T/KtBMw1uwqficforT4JyvLhqGM/bdDXD1GHs4KBMzLHXYZ2mmauZQamFNXaxAxS5kSatLZZT+hwKFnPR0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9709

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
v10->v11:
* no changes

v9->v10:
* return if iommu_add_pci_sidband_ids fails

v8->v9:
* no change

v7->v8:
* no change

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
 xen/drivers/passthrough/arm/smmu-v3.c | 119 +++++++++++++++++++++++---
 1 file changed, 108 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index df16235057..a3bbfda993 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1469,14 +1469,37 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_d=
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
+		if ( ret < 0 ) {
+			iommu_fwspec_free(dev);
+			return ret;
+		}
+	}
+#endif
=20
+	fwspec =3D dev_iommu_fwspec_get(dev);
 	if (!fwspec)
 		return -ENODEV;
=20
@@ -1521,17 +1544,38 @@ static int arm_smmu_add_device(u8 devfn, struct dev=
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
@@ -2624,6 +2668,42 @@ static int arm_smmu_assign_dev(struct domain *d, u8 =
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
@@ -2657,7 +2737,7 @@ out:
 	return ret;
 }
=20
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct d=
evice *dev)
 {
 	struct iommu_domain *io_domain =3D arm_smmu_get_domain(d, dev);
 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
@@ -2669,6 +2749,21 @@ static int arm_smmu_deassign_dev(struct domain *d, s=
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
@@ -2687,14 +2782,16 @@ static int arm_smmu_reassign_dev(struct domain *s, =
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

