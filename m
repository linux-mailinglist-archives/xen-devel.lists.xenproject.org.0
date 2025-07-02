Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D649AF0C40
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030257.1403880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbc-0000Gy-FM; Wed, 02 Jul 2025 07:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030257.1403880; Wed, 02 Jul 2025 07:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbc-0000Eq-CI; Wed, 02 Jul 2025 07:10:08 +0000
Received: by outflank-mailman (input) for mailman id 1030257;
 Wed, 02 Jul 2025 07:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hFQ=ZP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uWrba-0000Dm-9t
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:10:06 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 940b0460-5713-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 09:10:05 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by PAWPR03MB9857.eurprd03.prod.outlook.com
 (2603:10a6:102:2e4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Wed, 2 Jul
 2025 07:10:02 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:10:02 +0000
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
X-Inumbo-ID: 940b0460-5713-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cq/W2UAo8MqCvyDQZPrA5/ufj0m3wGjtvMH9OM8B1p9aIqBxXDeFPYSsJ7knqZlntgo4K1VdYCQtd+dOGP8b9MayTkb9fuzBUW4Wkbbe/htCYkMCijCvzg+MUE9QeYh4TyOIvmZs+Jl9aLeeiIeCozVa7xXxXUBphJzIp1VrWwwkOozSLm6laAbUUiAFDPhg1TXYAm7v+/iKGW+ersdFb425KUB6o3Ll+t1FuG1Wpnz08a3tiyDe7qZnpidxVHh5xhZWn7id1IRC99kMTEyNQfCR0ujAge2UiMfrrDbMaumgAXPwhGiE2khyorn1joy8tQGF1dwVLRmHilXwE0TiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKfUEcwuhAQT+SAyxwUDdS0frIctpZIzRMNa4FsgDw4=;
 b=tUl9A7cvXAMOH0I99Ntk8FW9HdNm/0fwhzFzzancnLMaJ9FRuZfFzSski4CRxiAHm+UJYigmv3rDmpLzUN0BSzrFYwWU7gUVAl96W5pcxv0yliJTbv1P++TH2wVINIKeN0DP5WJqNu/43bAzaBKqlTsB3BfvtDlgTCqL1zHBZsXtlyA/OVzZLgiTIQhiz5B7AogZtI6wgFGcM2CY/DA+aNxc5I3WiGmv2ihGARwfF9ha4T1/iFdWv6XNOkviflGT1CkvZUad2F3U2TcvCidkJW+wLYEgEL+OC1cxa0J3Qm4qk1VXuKGFT9mqVzQ8NxlywQs+6j7+tUfJdAZHX5aKTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKfUEcwuhAQT+SAyxwUDdS0frIctpZIzRMNa4FsgDw4=;
 b=EiqCh5WCLKK4Rylg86eLGH8QITRFudJgXFwS5kOLig1pcS6svVMbM393QFvJqXVLgP1qdyXMETJRbjqwYrQGvFmlwwlslm791f25VZlFteOaqwByfCRtnThPQkixq4z6WaxeEOYBEUZMnt7eWNie/JBquVkHyd7KdY14Ae8KKOk+ruEEjulL4jakGacrtyqGOyboIfgJJA5Q/a1Hrupm0QeBQrcp+Q9ffxlUU97exzlSVa4njp8c4/whIFX6rrGnJqmQ09xbKc7XGlPWc1+/K1FJIcpMV5AM6DZnNq/GKHsQF0k5shl8byBjk027PEBdMEXCw+kXKpj7IDh5PfQJmw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v12 4/7] xen/arm: smmuv3: Add PCI devices support for SMMUv3
Thread-Topic: [PATCH v12 4/7] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
Thread-Index: AQHb6yBUOBn8GtHVrkqYz5a1NMy5XA==
Date: Wed, 2 Jul 2025 07:10:02 +0000
Message-ID:
 <49c9249d3714df03b8f172c297317d53159125d1.1751439885.git.mykyta_poturai@epam.com>
References: <cover.1751439885.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1751439885.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|PAWPR03MB9857:EE_
x-ms-office365-filtering-correlation-id: 41c4e8e5-0616-4744-12eb-08ddb93776b3
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5Ak5I2xTvqrymsHnA8xqeNphAg+281C+ZwPs21SxuupHr/Fvp47n4i9qIa?=
 =?iso-8859-1?Q?10LZbD5rPFmmktWEEzJ69MREyplXN2yXHmqzFUy/rmdHqxpup8p2B7MJrn?=
 =?iso-8859-1?Q?x9D5/nRHLzB2B0inF5trD7wPuK96uQDHUFWgYi/VkNWgKo/wsYlodn9x7E?=
 =?iso-8859-1?Q?qI/hBLJYYDfseiCBjbykvVS0cpXQ3gr9YUNsTx8SLWgVrtmiR5h+AprnZ0?=
 =?iso-8859-1?Q?uhELiYK+QxZ5VOSp1P6IG8nDhKCsWr0NkysgHHWKelfNdXxrXoYX4TyV1E?=
 =?iso-8859-1?Q?QOHdMEy3GHeRbfcu+H3aAT4LzoWqUqLggwb+Nj+SugIq25FiqpikvW/d9I?=
 =?iso-8859-1?Q?f7KFh2HeWQq5BZXVHkT9zW6E8xJCW8oeMkWDKhqtqs5CK3sq28EyXaYtNT?=
 =?iso-8859-1?Q?llM22nBX65FjL17v75oQVAD6PFDqWgbCRiFJ8/l4HPhXWnt+COIhGahSAl?=
 =?iso-8859-1?Q?rtovyKo0PCZIJDr7LP4Ffgzzxoeb8aKiT1zrn4UD9lr7mFD7pPkzRHIQ6K?=
 =?iso-8859-1?Q?FZ6CcNml6cpoPC0aSmUQ0g7lofc9e2T97MOH2b5j6gGU3/ujkXhk/aegD1?=
 =?iso-8859-1?Q?ncIBxzn/u/FW/xkDxFcKaR70ppWzTgoAujo+sbBjTOEqM3TfjK8RVsX+sH?=
 =?iso-8859-1?Q?i5C91NAx0QQZjKgoXK79A1GlrOfZ9M5AUr91aIttcdgHCkuEEArYhnhKeO?=
 =?iso-8859-1?Q?p5yNF71gnualzqFRPLTeUOgpEdb04nNPjNxd1x1a4gnEBVNgYzjwDFR/P3?=
 =?iso-8859-1?Q?nTcveEcSc5WuTn62v19e8+N1WqfVk1MS7y+U/GNIzYJskOAWvEoj9jz+F/?=
 =?iso-8859-1?Q?J0HnTtvyNSShN1XnB0eR6AmV1dNbhgK2xwY55d9SBI0Mku7ezVzFm5hpO2?=
 =?iso-8859-1?Q?afmIHMeEBign/ba3oHoVlhInT2ikM8mAVNX6ScOkAjGg2n/FSK5Q/BhVH2?=
 =?iso-8859-1?Q?GMS3d29H8juXBW9o6EsuSw3VUU8Wuk+v2nWY1ppFLR34DOIUPnJrISG4EX?=
 =?iso-8859-1?Q?/3vRrWWNXDBxwuMlrUtlQMpX45aL5qP48PrOWNMyVUd52UxFw44LhNtVSv?=
 =?iso-8859-1?Q?BkyQWnlvunwXURGEWbopCofpyQ9jMqjyy1VOt0zvjPcu1yCJHMTGk8Zju/?=
 =?iso-8859-1?Q?ypsoe5C9vUCIhdvV/tBF2eX4CuZ8YBEqKcaCwQh4tLkkOxyIsgCyYRbggM?=
 =?iso-8859-1?Q?HDwyl6OMhyoFFAoiMKoTIiHgRfRvb6Eddp88JDfYZnsPxMwZGr536/XUZX?=
 =?iso-8859-1?Q?whmtLz7A5RrdurDEpjeW4ZT1HptybvbwyU5iYnJYb1ud49ENPc3K7baN44?=
 =?iso-8859-1?Q?y3+mP6Lrjuy1n+O6S3xPNPZrE3dk7mpzPNM5kyA1j1+mlKTAvlA5fKZukw?=
 =?iso-8859-1?Q?KMP8QwqavUtzdRZyRF851CV6ljlNngs9f9//f9UbgE9AUGv4fiw0go7g7b?=
 =?iso-8859-1?Q?7Pkq+uqx3mp4xD2h06sblcYTy1mziK4fKZOekJ/5Gi6kax/3hxQeomx1Xd?=
 =?iso-8859-1?Q?gOu69VFX+Jh1gfndT1EqsbSxBaI9i8nBCeWhO0MbAt1xJ0dOAttjLDA6rI?=
 =?iso-8859-1?Q?ZQn+KYc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BGkaRwCu4kmqmN7QRvOvXIOU5iG4zfMoBXU/mc1rWGqaZNnIyCEG5BBHGJ?=
 =?iso-8859-1?Q?wVBSFJ7v8dLAYL+0tgkSwOC9aJrnErbHGIvx368qJaarsog6+T84jhk146?=
 =?iso-8859-1?Q?wjY0LlsWZamhUxwxSoAl0OhwoTsPDKSMbVESKDb9x8ttnd6aGIp0aJrAlT?=
 =?iso-8859-1?Q?aRUtadW6GeKrfWbPGc/P9KgFXDqld1+NOwEwPUX9B2mSc5jqe5LUbUpDbt?=
 =?iso-8859-1?Q?OFGuI1i7ckUqnHudVaFF+cFgXHzhDxgaRcfmKQCGkUYvMi8Jc1WyaLphYC?=
 =?iso-8859-1?Q?kWuNQJBjRZic+tEw6oc39gbNqcpc9XsbTtpSsZFZwSXXCdITI1j3Z/Eszo?=
 =?iso-8859-1?Q?k1nlmCjnbe91vwdU0yqDwX7j4LXGesdlMPpQitS8/1kD2/9cnwVecbPWEq?=
 =?iso-8859-1?Q?zbMdRasKL3KxJ0MggbIqL7V1gOFtSlsJ4utnANoqrF0QAI+DxP8w3w/xP5?=
 =?iso-8859-1?Q?xYL3hIo3lCG7ozaHpPzlmVqn31ya1bbeOlUVeOyNUMMIfQfeDmJi8HB4G5?=
 =?iso-8859-1?Q?aKzdF+54lmuzfY59cPBmcJLbNmHCkm4vamRala412MNKcwbqioNz6KhxoL?=
 =?iso-8859-1?Q?IeCyEi/emsFqO27H60jFEIZWhJA0n/rz1VOddnh3ZOG8hBdMp+p9x6oUr3?=
 =?iso-8859-1?Q?LufoCVNhOllzGK9etYDSPBjmeDY01hDK65o8pcuc7TCJsVXo6jn0p3TZmi?=
 =?iso-8859-1?Q?SahIUsF12xL73b2uHIfI37ewPLolE+GM/XpPmnLlLyvMXZnE9z6a0dkykw?=
 =?iso-8859-1?Q?5lSuBqwyMQZ7K36pYL86sW4L7NuArYCf9FY7KN/4CyfTOfrYnvu+UPJE0O?=
 =?iso-8859-1?Q?orHfcL3XE8sK4+UwROp9CY1WMDFeIx/omk4HtDfUF5WIGeYwxtq+OGp2mP?=
 =?iso-8859-1?Q?tyU5vk09THFF71sNG6VJhQs2cl7qmQ14wcgqkpv+Ys3BxsX8PKZ2ykeQN3?=
 =?iso-8859-1?Q?RaO4w/2Rs6zqgR4VjygD+towJtgZFBOLVEuBxVf1fdQkxYAiAt5GvyLZv6?=
 =?iso-8859-1?Q?hZi+JuYZOoSSthh7hztHfT8/u/vy3/xkcezJft9G9Xwq5mzaALjXZ50s/H?=
 =?iso-8859-1?Q?dedgT9A6Ri0/OVqrZf9nYAW5T/HWCr1pD4Jcod279Pn4pba6w6F7Zpk11d?=
 =?iso-8859-1?Q?zGUFG23A1hJbIqmhs35xzpOtZTqLyOvOfN8rfJTf51owBAwLniv7o6t2a2?=
 =?iso-8859-1?Q?/NIq1vcCs6u35uFhTj0rX/FJ0SDbtQ8zosUHk9MRNmVE4z/hpaQHvyAABC?=
 =?iso-8859-1?Q?XcIs4UIvgLDGQwhGXLBv/Aolzk1afZJIUcmZ1N15mc2gI1QGDpWrY7f6G0?=
 =?iso-8859-1?Q?/SwyWil0XA5KAWNTiitJYyPHKmUNIJyqICqXmVXtmG0/KYuMxkEVJ1No8b?=
 =?iso-8859-1?Q?KyiuqKpcVCxk3r0kPfKdPyKqMMA6w76dGMGBqCki1iB7VvWhxLEdbGcNhY?=
 =?iso-8859-1?Q?n2+V6AjHbh6PY/vQ4IcZ58gJIi5cGmRZtZVNzRjz23Ro6bRjpEIj1uExa0?=
 =?iso-8859-1?Q?NL1scBwyKahUo29QvUNz4hhYiPhv9KNcxFtWFaum91gNVjyU9qnwjc83An?=
 =?iso-8859-1?Q?lJcX6Z+WrLv7xdD0jI8FuxEoyN+2ZIsjWr2Jnz9hgkPpAOMGZixBFG+9HC?=
 =?iso-8859-1?Q?SHqVms46/XQDzzwkJj7a6s2rOHNwMMt4AKDpn1yUNtHgAgftJBwc6tDg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c4e8e5-0616-4744-12eb-08ddb93776b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 07:10:02.1815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0qbkrXV9JZgFX6Ee95+DhQdu0oPCZNTi4gobRs3yslv/SUR/heCBH6ta72hSlqBPwrTs0D4dOjelGzUSkEpGSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9857

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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v11->v12:
* add Stefano's RB
* check arm_smmu_deassign_dev return code

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
index df16235057..9478fcd11c 100644
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
+				ret =3D arm_smmu_deassign_dev(master->domain->d, devfn, dev);
+	=09
+			return ret;
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

