Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF14A2E971
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884563.1294315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR49-0005e2-5m; Mon, 10 Feb 2025 10:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884563.1294315; Mon, 10 Feb 2025 10:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR49-0005ax-0Z; Mon, 10 Feb 2025 10:31:01 +0000
Received: by outflank-mailman (input) for mailman id 884563;
 Mon, 10 Feb 2025 10:30:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzWh=VB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1thR47-0004Pl-4o
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:30:59 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2607::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dad964b-e79a-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:30:58 +0100 (CET)
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
X-Inumbo-ID: 1dad964b-e79a-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkztxQrD6uYti12Q6uYgBwUOdLYDzi7d/EeAEaF3eBc1pDMi56Cx4TXlt0EnkIV7nV5J18C+QZooD0jEZ/MN8If/6/1ugeOEDrsXbkWvawkAnYfdM5EWUHVXCz9MamzRJV1MW0RqPE3ftJVTo/ApM8IG5VE4GKy3DyEAzLaUOlnazCxKzMV7Wc5RZLMey5t7dXo1+PTXdU9rtFsUJzopDcr3uTE8cQUO4WB4hPorKNnF7tUN95fB5Miliebv63vliQuw4R1L92GjlUIbtaYsIDXqnSsPfjv4rC6MjxMHwfqjz786ubod/4t/3KMvdBBoW5PJYqRKGUhTpan9kTUDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G32zcckUmnH0Xzbr1J5b4l85HdYZlBGQZUkWBFZ3e/Y=;
 b=qIFPx1ZHYnD/50iGzKSenqFNuOolzzfOpny/Mz9DHEcoYHgCKIkEmojZrppI5G5bCfnP25tpFZM0hPWQyvIN/27TjFRCbYRPjhHUrxa9vNFjYRRsMFwLK/NaC6GwNCIqNfZ89XQsPOIK7vkPydl3qELsCz/CLR1sKaXYMdOcgpv2G9qZD/nXuOjmVEmkOswSOTp+wFY++9S4l40QO+rD6lolwp/GtSKCB4H9P+nHOYks9UG5WpolLJwy9HlC0Rs26/wLsxXjwTUTgP9P/qPjOqbKx0cLkfv/jeEHaZ4IZ9r/S9qPe+KMCyJazp6CzVLTOdkg/nakDO4GSdi6NzD2RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G32zcckUmnH0Xzbr1J5b4l85HdYZlBGQZUkWBFZ3e/Y=;
 b=bp63pmjImE5m0Ak+ytVxDMiFIbcihfTBqzUez8SB8U5CC1tU4fyK1/671fsWWFPy3OdzlI+3DhfllE9XTjBW/dVndDMF+CJjy1iPKCNFCyeRbfAGSfrbVnFJ0hWRGvsHlWRbddS1Z7WRxEIl4VUMTiSjFa6JtkuGwpTGhHchn/MN8b9D1oVtKw3zGYuuMJVZ/ZOtYpbUfEZa8gxOiZydBoP7J0G9d2pojJitPU5ND+dHcJ6fnUTa2e2BdM/u3nesC22+8MFXmkhwQ49Hun8i5lBYYkana+K15M8Cm7ScvUTzN9IeW4+A5GqWbixmnOdO3mYhCdMtwSB79sa1bpkz4w==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v8 5/8] xen/arm: smmuv3: Add PCI devices support for SMMUv3
Thread-Topic: [PATCH v8 5/8] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
Thread-Index: AQHbe6bXDB4NWhGJmk+I1Fxr1206xw==
Date: Mon, 10 Feb 2025 10:30:45 +0000
Message-ID:
 <0e72f3f89866db2b6cf5bad62a6669f7a4e47063.1739182214.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 5030d980-6901-42db-8134-08dd49bdfa60
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8aVzU5CKTM6+vpUUVCDPvrvZPcmQx8wWosuBqvy7VfDjOOQJORpCjMjEj9?=
 =?iso-8859-1?Q?RyFChB9WLO9Sf5DYwOQT0gnqA00jCwIv0xc6r/xRUUr9Po4Y8QXWjKazcB?=
 =?iso-8859-1?Q?MBdE2/1BXffJRjen1ZgMnoiCzwtfkS6/nXNe3EWRmaK/47GlGixZxSDkza?=
 =?iso-8859-1?Q?lTI82JKsqlf8dDTnOxCnfobe3OR8prJ/tluM3xXX57JTmBK73uwg8s888t?=
 =?iso-8859-1?Q?GGQ3VEqi91gF58CQRkVYaE3qWqL4vFg6RbCgb+jgGW5nTddEgNau6JrWqi?=
 =?iso-8859-1?Q?Tvr0bJK/auI5Kk0ikH+Vwu3f/MlpB9XlEh3N+QaJA2lGDdkPi5zA91Nedv?=
 =?iso-8859-1?Q?+rKAW5d279jZvPLLqX0j5g0s+LvFc2CEM8c9n0ksW6+UnvosqdFL34TTQX?=
 =?iso-8859-1?Q?B31RTefEScBDe9xIvUBwZXH7qhrWSIsTbMp9/A9cxuMyXNROzVT9ND7rtK?=
 =?iso-8859-1?Q?YSUgD4RVgoqzt6ms9+LusXvYydO+tATWSlo75jxqnOf163Ob0T1GiAd1tH?=
 =?iso-8859-1?Q?EfVZLGcivy9UKQPrvLpux1KL9uYMPmeMKo/Dvj57TfMdZB8cCfPlbrSwhe?=
 =?iso-8859-1?Q?kHaBrny8oixLFcYoMvYcSyIm08BE13eq/UOi6lcqftRO2yPnvTNv0AKGOc?=
 =?iso-8859-1?Q?lB9QU3STbDQpNOKo0DWNabYg3NX5YwJKJYQdItE4M+kwuETBCQ7YrTnLty?=
 =?iso-8859-1?Q?2J/uTKyX7JGWD4qaKeWdimJxx/VaNAHLqmrkDAzPkt5k7YIiyF5BdZ1zZZ?=
 =?iso-8859-1?Q?uJe43rSYR2Y2+JPgNVtu3ky/KiWytZwZxbvwR1hHzXdMgbrPKCAxLhKgzE?=
 =?iso-8859-1?Q?Hum3KdFKXzhlULcG5LPN3zul32cpDcyAbOvo+xXz89zVyDGQetdKnilIvu?=
 =?iso-8859-1?Q?BcWiw4avYEiKddaCJBlblZBbvln+UfJGuSdw/QxTgnd4NGiWqtOlxc5fjE?=
 =?iso-8859-1?Q?izB45L2dlNz/ArnoKKpXdu2PiS53XHP82xA/hfBl/6b2xqCX+SkAZcnk+C?=
 =?iso-8859-1?Q?H0HS0ZTKQLroA9m8P+gPPvwSwkbedEjyAuBkDy1DswzNdkDTxSljFv9w8+?=
 =?iso-8859-1?Q?FmVamvVEiuGchV1JddM0ET40id1h3iWGIm69vjbt9BzMUIESf+/8rAtMft?=
 =?iso-8859-1?Q?q6TB44O0+agAGkMk67OcAuBrs+CYUeoc29HVREiF0FttdoC0UwFpKz+I2S?=
 =?iso-8859-1?Q?QKxuMO/dwDyRRI7Rt0cBWDGZbdkwyw+lOs8lF0z2A3WKRymJgZQEmoZ+8i?=
 =?iso-8859-1?Q?0tnbVvcpR3ePyrLZ1oble+pMzAx4hVutfya6CTkr2/ui2oESbh1iV8zjmr?=
 =?iso-8859-1?Q?3iaN5TGDSXx3gNe3xvT7jatXp9DWCjLpBYGLiCtXPPMkV2tGq1urfBAovi?=
 =?iso-8859-1?Q?a/XWi9AWTtBHPb6Aq4zi1dBUP7WrFPMhkqrt18RCCVaR0cstRHvZXYOUzB?=
 =?iso-8859-1?Q?rChCojMkXDai0tN4owU0K0zCmf4quhCp9W12WE600lA/wgCsgwu5m8Muad?=
 =?iso-8859-1?Q?+hb/EF99wPjUKWEsgqAEln?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0c+6CDI+L5fUMBBzQkjIpG053DdYkeLS+pkDHdmOC3oW/CaaogvCdeskqS?=
 =?iso-8859-1?Q?9FYpbrelGVtTqA1kG+25A5CU0/6OgLO+dcZGevT0WLs4/v8P+yfV11DZ6+?=
 =?iso-8859-1?Q?7JG/A2pJYuUYhKLQQA9k49WaW/At5DV5rVyDJOeN+V3xEzAdOD6gbIiPsj?=
 =?iso-8859-1?Q?jnqZ64TDQDFsd5y3mBQDjxTBi7gLrTlVa4KAbdowTGJXDZBzdpzjkhaj6L?=
 =?iso-8859-1?Q?gOZqro5f8x7A7WXYSsU9zCKBr7ljU/vReudGvACIH1Ld1jci7mqvSKNKe+?=
 =?iso-8859-1?Q?/ZNY1kkcNZXVRW22O0qvrmizF30qZiVdHzhPqxSjuX8qQSqDyrm299V1Fu?=
 =?iso-8859-1?Q?Amvn/P6TncEZ9ZOuvfznRd3mSyXMTGd6Vpr7LFn7gtYZNsB/XanQYCaT6V?=
 =?iso-8859-1?Q?iLFIqtpLkkpzikj8QtFbKTOnlnls0hB8ISKvyhwlyjJy+rC2v+whhldhjU?=
 =?iso-8859-1?Q?UarscnMUo4k+XmNQxyvW3AlvrJ4E4Qbgr7zc5+/ORAOlgB/0xVnroT7paT?=
 =?iso-8859-1?Q?5IOehTzQ5g8WNFMwFb8LcW+Pn77L9nIS8nlcCYH/PV6zCj10j5A7ULgiBu?=
 =?iso-8859-1?Q?BMpcVYeTUwuCRNPVcE+3zuPYVYSWfj+LvBwi+a/hEF6USxtBAYerb9oytT?=
 =?iso-8859-1?Q?LRcfZN/PHeehDUar6Ozv86WX/X20QSSD0ewqrRr+OS+1w9f9EUTBVJTi48?=
 =?iso-8859-1?Q?Vw2huZWmukhuwTOO5ZBRw7bFi5Wh24PN9K6M7Je4ZrmO2srrOZT5F7qGzt?=
 =?iso-8859-1?Q?zeYEHRg2QjthB65i6dt4Jxw/Cc3gERSR/8QvxdbDOPrjSYLhqPKTDTAb8G?=
 =?iso-8859-1?Q?KYF9HLKwW3p7lNYPMobIH+IfaFWXL7bf4W0/W5vp6sIdOR5ng6+tmdEI2j?=
 =?iso-8859-1?Q?bDam25ERasQKxM0Y6B3SBLojPHAG031RYtinRFBNtrH5f+aFS6nPAKDCiQ?=
 =?iso-8859-1?Q?AfF9p+97cc0V4eHkUSuiXsg52OWLj76Q7j5Zri83eYbmGWcibbwRKqLm+w?=
 =?iso-8859-1?Q?ulb7jZn6I2NFwtDjROpErU1SIklCMCSfLsJ0SnKq+Va5fZFGEQHsfSKFXV?=
 =?iso-8859-1?Q?oOJ3dwSNBZmX5yi3Eux+PqtALL3PK5N8a6mbuivp5BBsv70ZVk+xweyQ2r?=
 =?iso-8859-1?Q?Zr8lYQZ37IGfLoleDOn/Ew4jjaT7K2l2/10aC44z8eJ9PLF9+MaUdj6s01?=
 =?iso-8859-1?Q?7fSIYs4E8Umtto7ygeCuOP+2kiIypt1tWfAiWh0OyQKQwYx4o4GPuEY9Xx?=
 =?iso-8859-1?Q?7HnIHwOVqWv1BlE9LTPDcfTmDazj6xryweVxOQUn9Su5FGn6GiH8WEEMax?=
 =?iso-8859-1?Q?5DGnAEeniZAOmdOj3/kRVFhfn/dvVglLIwzTbIFK2aRXTfH27KQ147Pye7?=
 =?iso-8859-1?Q?av77UOvLpZ/OBVv9KlF/Xbqy0ql8mvZCOfVbmYE66RLHWiOh31qPENOlCK?=
 =?iso-8859-1?Q?hiVAMVZYD6OrLSBoBmq/jlrv8sSEDgTEj/Dn6UxotIt0Eq2a3ZpmpUNEm9?=
 =?iso-8859-1?Q?MXl3ojnXe7urq3PiGQ4Mhci4pca8ld8c9VSi8cw8Iu8UpAQ3np8QS4c9eF?=
 =?iso-8859-1?Q?Wr7C6tTyxMpXkIQCmFx4S5gKjLmpTM+Qx2/yo4G4uOQMqk1qW2d2cxAUsy?=
 =?iso-8859-1?Q?AwOqSPUC9g5it+Fi1aT1kSQ2k6ptfI6r+cjxEfgeFtQlI7YB0uPyYp1w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5030d980-6901-42db-8134-08dd49bdfa60
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 10:30:45.4061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L3dBsq2CBgT+nKDmv0eI1QLpeO4uEZMdQ8v6DhPLnkS94tafXdD2MbQUKbVbAUnlFCgajGXXTWSN5jF7KxVN/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8977

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

