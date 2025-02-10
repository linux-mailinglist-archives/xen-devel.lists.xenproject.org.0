Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7063A2E96F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884562.1294306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR47-0005N1-RY; Mon, 10 Feb 2025 10:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884562.1294306; Mon, 10 Feb 2025 10:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR47-0005Ky-NX; Mon, 10 Feb 2025 10:30:59 +0000
Received: by outflank-mailman (input) for mailman id 884562;
 Mon, 10 Feb 2025 10:30:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzWh=VB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1thR46-0004Pl-4X
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:30:58 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2607::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c99ef22-e79a-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:30:57 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB8977.eurprd03.prod.outlook.com
 (2603:10a6:20b:5f5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 10:30:45 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 10:30:45 +0000
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
X-Inumbo-ID: 1c99ef22-e79a-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWzCPiDaep4Syspbc58sXcxyzp1tlh0+x6jiPoS7zvSs/kVA8I0A71cGwruTdmZrHHGauqaZhZDGHWGJkvwQM9nKZ1yA++5LZg0wOYCocbRmj8a2/HO3h8HUkr/12kF5puZo2h+mWkEh6O7Zpu+1i2XDSYIpRehUCPWQx7BUoTjQFuFnrj3TR1MAUFKHjTviEP1Ma1VGYrsomQ+sos1yx7nCQId7RF0mShCfF01Qe/anXGIqf+3VQMGY7ASISnFaVVPw3ruLwzpIyF6pU9pryame73LTmOM77fIJct4Tcdp8C0UelbY5aZYggOZtOaEO+7d1gGFYCN/8k6h5TvFq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Av74HKfBqg5+egWCxUkM+wRw0sz1J2q2tdVDSuuh3M=;
 b=HwkFBZ0iOINGI4te9EKhSBGQY9LlFLsiImGDVWYecdIAiikYrjefEFyMGNny9lzNjYohkmqpi2pCL295T12zoO02G+FHJHxzS3cSwA3AN/6akfXBSFusVIMTYWqPgm6mHusZQeNCpu93eSZ+Kz4KaU0ZFO1bMpNmzJp/DZfuTAjDg3NtzfQvzA/PAhlMcTSbOWRgaDzRMUfkFZLJ4b9JhG5P84QJnhtEiieBdc9rG0qmTfZ7kYIQ3PU1m5zePCxYWu47DJGYKIOL6bzpZ/qkaqt95aKoII0/dTo7kDbEEPBSeOiD9qdyOBJytSvMUi53kR3tl94Iy6aRbNPET700oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Av74HKfBqg5+egWCxUkM+wRw0sz1J2q2tdVDSuuh3M=;
 b=HFpy6EE9rdeJ4QZDcB9WA/6mSCntAbivi5iSuxO7Ua2IIfQwgcf047eNbrl9qs8Xe0tmUlvkCtDpPbI9ktLtNZi3r15LMmJJc+b4ZfGzzuku4jbHmV6lRgHm/4OZjXnZ/i04eK5xGiPeNSxy+mIoMZzwzDkgzO47MA9wrv1gHNuRVYd9YxcpiQL97EpMBJA/H/kfVZk+aOulzTfS4Eg1Z5qR2HfW+Mac/ibIyKRuJEpTHvnfkdwv421X0gOjc3oqlXUzkB5pUhnv2qx6a9c4EliAUk7Q2wGT57OvF40fFfM/UrpUOjDGQCJV12GfYzvEbAFXJuZxEjUQkkUvLqWhWQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Julien Grall <julien@xen.org>, Rahul
 Singh <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v8 4/8] xen/arm: smmuv2: Add PCI devices support for SMMUv2
Thread-Topic: [PATCH v8 4/8] xen/arm: smmuv2: Add PCI devices support for
 SMMUv2
Thread-Index: AQHbe6bXTreqmDrhNEe4rQJ8qKOtDw==
Date: Mon, 10 Feb 2025 10:30:44 +0000
Message-ID:
 <5b550fd10eeaf879d7af5b4b236fec20af67cca9.1739182214.git.mykyta_poturai@epam.com>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1739182214.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS2PR03MB8977:EE_
x-ms-office365-filtering-correlation-id: 4a098ad7-4450-4f97-7e3e-08dd49bdfa1b
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?IvYRCgHGW7hXPJtrXvvmlUzSypQrJoHrTpquSzXMnUciJZvqW6eiRecdi4?=
 =?iso-8859-1?Q?oTNhWkLSzjfb3vX5iYjkv1mxJpIgxyugEO7PRMi65WJohcg5GDwtBuEcy9?=
 =?iso-8859-1?Q?M0ka7/pDGK039ImvRjyE97GO+4gw24ada5qmXj4o59PPqMX0JoHavL8ao5?=
 =?iso-8859-1?Q?cOTSHRtizmJleIy6fGySYJ0CtJKU0fLWVPiaksgqMMZUeydEJA6z0/9VZ0?=
 =?iso-8859-1?Q?NEg+pHpmtuAr5AFPK/Hhon3TzvjvLKQOtD2iL5MjB1yprJhDrmn3YLo9WR?=
 =?iso-8859-1?Q?M0c7GnLsx+5/cZkBaUnyuyKnRq/LhzQsoOj5E0SxcClRi3JO+tFkn1unl4?=
 =?iso-8859-1?Q?6H02G2sITqv6dAuNS/2zAquVynCqkbG8ZbKuMoChKBXpxsQ+EufS5JyRwA?=
 =?iso-8859-1?Q?LZtowfY+8WlrwK/P4Vpim6sGiLBGIuDiqYy+kGUJ+RvDTmJsZekINq4sK9?=
 =?iso-8859-1?Q?dzOiBcdTwDKXBzZuTwNNdI+CY87ZVFYBsjMLHkoGY8ez+oKHLOY6Jutaj5?=
 =?iso-8859-1?Q?mzPl6CV2xz+Oy9SgB8bMmcb6MBdLfF2EYslsGgrRunvdoRrAH3fPNUqyVM?=
 =?iso-8859-1?Q?jEQfAyTALAy6FkgZEckYcAEIh2BPYK+sBkjE2c6G0dEs+prEIzri9OHrbI?=
 =?iso-8859-1?Q?y8M9MIa3FxyLhqh6v2zwUJlp669tlC/HzYd5ZWWGf7mN1gyT+s6fDR6m5O?=
 =?iso-8859-1?Q?04m10ryfe7GYC4LkH7DKDJeI/mv+gnQk4uVx52bKdsy/CTW3lOI5aUeQBo?=
 =?iso-8859-1?Q?4raUiCT7MC7KpUkDNSCKZ0Le+cnLBkxMH9LYNB9lQ8dLpsV3ez7IOt833B?=
 =?iso-8859-1?Q?al9dLxhrWR26NteJin4tCCA7Daz/YOzvUy/BeKa5QfoRLLBQ3xbw6QZj+R?=
 =?iso-8859-1?Q?xkPdOUxZfa/L/ik+ARMOtCfHRhRjhYV3RvMxxLvVKvyB1mZaY4RWNjfNru?=
 =?iso-8859-1?Q?CjPRzjQu7EUHRr196xz+PxKwRgmQCiunxP1uXxcVTDWcXxHebmU/l5jTtw?=
 =?iso-8859-1?Q?sWDfDPdttMXaEGWS+d2KTvoNjpqo3WvmgI2f5ZBF8dZ5t/p/co/8Em2kRq?=
 =?iso-8859-1?Q?/Emr9I7Pulrq5pK8Vu+c1zmLELyEVLVYNRkJlGgB6w+zhAW+6sRBI+2yY8?=
 =?iso-8859-1?Q?iRiQbSENzt57+1TsVgVPCeJJidltJ1JqG9+6bedI+BJWGSNscykgPD06nV?=
 =?iso-8859-1?Q?8lsaH9BfnRbsMuAvJoQukY2CF6F/myDJ/6iXFSLjZerfrN8zVZWDfQf/Wi?=
 =?iso-8859-1?Q?Jh+z2s0e43vsbYMjjI+EkYAwO/lR0g+OWaaATXUg0U2uQbLLBlRApkwqE9?=
 =?iso-8859-1?Q?DqTBXnvFabzBDI4hovSmShoSIaBcGq4ID4hkt1KslCe047FIcf2VDSNLFQ?=
 =?iso-8859-1?Q?qZKd8+8Ho9VH21jOQs2G5Eau27jFHRZKDibdVnDo6dPVOumVvt0g1CNs2f?=
 =?iso-8859-1?Q?0sfgR37CKYTbvC2ueL2LhlNaDo0BL5acEwR8NA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0SV35nB+9oCtfqKhOTcvtMT+x7ZbG4VcgiXvvROEmexJH0j5F+fqVl32lc?=
 =?iso-8859-1?Q?01kvGuTZ4mciCC/kc1Va3jN49LMUV+NkBjRLS15JLv6ZzBwp2DD5sER5bp?=
 =?iso-8859-1?Q?7wqsfjBr0yuDiaZMSpQrlg7wdvqDo4f/2dJKB1nU1zv3FAptqtUE8yWiZb?=
 =?iso-8859-1?Q?mT/jVCBGPZRaD3PyYwThUWPYgAvQFKdxn4vryfDML0YUkAWHH8mRCB/Diu?=
 =?iso-8859-1?Q?2wmLJJyjuqxwggysI2iqfg+Vy2WtNX94QX/hgDlcd/Y9/nG8fZDUw77Le3?=
 =?iso-8859-1?Q?hnNf39rwhVnfdDWydWMGHXTMxgS8q+jTmWxGp12JGaQUVEVxXd2HXX9KCb?=
 =?iso-8859-1?Q?p7UcVdG8VtavSkXZY2mlxIJc4XZddPy3GfADjHz3nuM6iBKvEKq9p3f3vh?=
 =?iso-8859-1?Q?R4oOMLxigkRR09y9RVfYU95mmRtHvelcWCezi/zJOTyJVU5YWn2Q8+FPK/?=
 =?iso-8859-1?Q?nT5/ydjT92DlafLJFp1E0RLh1UMdWSfZHsR9qRy+dOW0ih7tv7gxvpusC+?=
 =?iso-8859-1?Q?fFCwkVmfLHQE5EHiBeEiF+cWmiz6t6KgBhpWdERwsLn7KWsVeS0RS5f5fH?=
 =?iso-8859-1?Q?GFIbG+Zi91zitT9TqH/GriUJ9WwpND8Wzj8u2NhQm++fExV4E/47r1apXJ?=
 =?iso-8859-1?Q?uQ599DEySU+7rrllrKqfpBTrjbvEyfXgGXHq98FyI/R/NNw2By8/mFhArk?=
 =?iso-8859-1?Q?GXK2LAD8mBlRk7T9T/E5qZUlD7sasobNxIPoAWLyi7YKiKoGvg9tVZwmb0?=
 =?iso-8859-1?Q?vhJt0wAbmDFknE/fTN7DEvQn1BhAG081kBeknZ8SDaJQ22fMuSqIuy+0QI?=
 =?iso-8859-1?Q?USl/myh8N3lbAMfRVIhl76RBxjRZFTBLF3cbnMrHd4HE1AeLaGpwHsanua?=
 =?iso-8859-1?Q?q+lRtsN/QEXqVed1fQuSeZOmjfJL6zZ0s7Hgje/61xC2+1TnPPLD2Nv+w4?=
 =?iso-8859-1?Q?g3wjkaA+7IncxGQyx2iFDDgdOaiHT+9wlLOmqFlkGmpyKRq7FLsbkO3dhQ?=
 =?iso-8859-1?Q?Ym0Vs/DzX9m3Fd3vI3u9v0c4g3HhC3BVubUL7sdK+WEY+2XPEHU3fQOs/f?=
 =?iso-8859-1?Q?q4q/wBKIwsKjsHNKnqZn15f0tKG5Fz0uNb2vSC7AmWfTi72UDVebLQ+/6q?=
 =?iso-8859-1?Q?5EeOTv8Se9ZK709795e9GjnyQeTGpdDn0UDWyclzsxITVrxisYGfsIa3Jn?=
 =?iso-8859-1?Q?Zt6qyBpXUV8K4k71bEgbEKRi6OHxpYNgkDKDeXJMCPzetZyqT3Pi043n62?=
 =?iso-8859-1?Q?lfeONjQgPQWoBhkyFl3AxKK1liyBUt/tXdf8CDdTt7jmp1RK5ftYOKdxgQ?=
 =?iso-8859-1?Q?vdkGLd+XP8gPbzpdGoOK0+lASrB9Z+Y6+GMQIUYZSKy58tAIgncUdf1Rkc?=
 =?iso-8859-1?Q?wEVnvJ54OrW1MsYBHGbo7fMsE8iY9SKFVnlqGgO3JhooD0fUeAuJA4hUYS?=
 =?iso-8859-1?Q?dn+WJwXjVPnBgUDXLu1kwl7Qwwwq0mLUKKnUQageOlzszKxHp1bHRRpDi2?=
 =?iso-8859-1?Q?QNtDCyqx54kONfcnM7fcjWbH9eIc83nS16bk6/fyS/0jsha/ZHA2KFYl8j?=
 =?iso-8859-1?Q?vAuq+nVXoi/zDzUPKNKkF2VkUsFokGuDXKespzCg0bPS4aSZL0dv0n4dMA?=
 =?iso-8859-1?Q?ZPhYbsoiaDR/dxOU0kVHNaqb7gc9Nvq6pHifkS2YllwNbVA6oMdZ1wjw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a098ad7-4450-4f97-7e3e-08dd49bdfa1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 10:30:45.0114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zrhNfV8rXD6x24WxQ0+Ldwu/fUN0WZmhIMt+sEB6BplzSKfJVcNcAGYnshztDbkV58sqQ06IU2SRfwrDDbjsxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8977

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

