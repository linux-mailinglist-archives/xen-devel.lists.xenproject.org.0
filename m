Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B590AF0C3B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030259.1403901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbg-0000kn-50; Wed, 02 Jul 2025 07:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030259.1403901; Wed, 02 Jul 2025 07:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbg-0000hl-1a; Wed, 02 Jul 2025 07:10:12 +0000
Received: by outflank-mailman (input) for mailman id 1030259;
 Wed, 02 Jul 2025 07:10:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hFQ=ZP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uWrbe-0000Dm-S1
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:10:10 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 970b893c-5713-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 09:10:10 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by PR3PR03MB6651.eurprd03.prod.outlook.com
 (2603:10a6:102:78::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 07:10:01 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:10:01 +0000
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
X-Inumbo-ID: 970b893c-5713-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZmrshv4m8lkfexXQn7NH8LuHxKVblgTgTpWRj2BNM8hyAlHpvHA6JEWJ26ISL8S1upGSxDo3FHcu7rgy1J9uZM7W1gqAbuodiyBRh1GHJnl22ZbEGB2ynOx5FMEnvcSoor+DrzpUy0gOMuqZkbRXhTlyvAKLbMUOva6eIbgiMnq/tlSr+mqIaYZF8bRC0Mz2TjQ69lLuo/G6noQfC7E2rL8OKLhbe3MOdKDMYn2Bez7F5xsmHbpOu7mRHz3oHEDK7Pt2NMaJjAroAUBGhHp4YssppvWAoC/Rinr9sAqzZXl9zAcs9uheKH89dymYbkNXYaNJPPNSvvAEQodv7QnTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIIcGlVr/BO7F4+hxZXT4qb8KBlRTEjHiqBoLpfbN+M=;
 b=LeSk1SI1zE3gwqHIciCNfDnnVkgxzFU765g7RJFcas6c58ELZYVBpSUA0p2oy5U70S/Mi5ZA8Fl0C0EIFqvMySRTDK5l/k98dC/VQR8UqS1kMNFR7/G3uj8nYXnGqfV0v3o6Kf5yI77OCj+eqQ07Kg+c6L9S6uO+2Ean4Xu6w9IEUZCWRoazqbOgsO08noHcAYmPgqB4c2R+yc0B/lN0B0fTJgZp137fiJA0KJ70/xSgeeFl+YlJxInnewqrTdyV/zlouQ/OFjplmv9vGdWSdRsMOLJ48EecK5p/tdOtkitp7gska6gL+fS4HsNzL/VGA3jEFyYMRz49qemWjdfkzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIIcGlVr/BO7F4+hxZXT4qb8KBlRTEjHiqBoLpfbN+M=;
 b=W50Nyy6ui1eRSwYY2rdoPMx/1r1+TiTlnuB50EIs0phhorY6kwVBWC3F6M6k6nUfFqSUHIcmSfpgfvGmhJuddTP+b8dYWKcOTBmMuIeOPrq6CrLnZa91h5pGkUdK3TVcjLZEez9ykDxeyxs/RsVLOGoz1+xMj3OIrYb6/Gbpe4gEO89y7p9HgrEkbA+C2zgb9DCjxIqOoeuKtrpytkC71JJ9lMI6Crr8upeXzVuAif7ps0n96cUMELjzLRa7eJ1UKsWcz93whMffd/0CB0fHbfDmT8X91CDU4bL/Z1fp5WzZZiyC51rkYv2XqP5xfU+giiqsgVSDJjKa81oIceOoVQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Julien Grall
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v12 3/7] xen/arm: smmuv2: Add PCI devices support for SMMUv2
Thread-Topic: [PATCH v12 3/7] xen/arm: smmuv2: Add PCI devices support for
 SMMUv2
Thread-Index: AQHb6yBTcdAXyDYYaEel1IG+lLmFMg==
Date: Wed, 2 Jul 2025 07:10:01 +0000
Message-ID:
 <68553b4def0e6d343fd02e0c03d5a11351e91582.1751439885.git.mykyta_poturai@epam.com>
References: <cover.1751439885.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1751439885.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|PR3PR03MB6651:EE_
x-ms-office365-filtering-correlation-id: 9143ec4a-f0e0-4644-6ac8-08ddb9377664
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MHDMxsucKhX22jlXAKL163gNP9TD5a/ozE5/c606j6dbRM73pevEqTnYKA?=
 =?iso-8859-1?Q?yd75+08e1g49i5BlhwEDJAEMHF47AqPdYaJ2j+NqybgWQlZ5OMiTiEIySN?=
 =?iso-8859-1?Q?28Jb/VoI1sYLU+jLUSU9A3VAS6j30NFq2CIkLLWRGhdkEqXcXEgUfi08f7?=
 =?iso-8859-1?Q?3f1yIdPjbfDfghCu3QMCLECvvtBlDXQH88gNC8RAbzdCXBBKgIIgmP/5Z9?=
 =?iso-8859-1?Q?TJm1NRU/g44r6FzeXOTTKHF3VPuju5p1r/zSfVMq48XsbnkxLiI9eQXf5b?=
 =?iso-8859-1?Q?j1V7kSssDTJ70pWusXFf8wcbcSQPqT68yWlUcLuNsqQFuGDmbbdQ6m6JeZ?=
 =?iso-8859-1?Q?O30W4bUwnrzEA6Z8if6OLjqmhJTsO9czt1e0tv88aYEZp+epilL9FwRwu6?=
 =?iso-8859-1?Q?WyScQO6XcoYy7JIC82Ev8y4/qlgFJ51uYv+OiJoF0PLOxiuCGsJA+502mO?=
 =?iso-8859-1?Q?YJcRi8tZSkKFprDOHCE0fFVyENJt68net89SARSQ5qmnRG+lfI76JouYz/?=
 =?iso-8859-1?Q?jfkd9pxZMM1V//HmkNDcKTRJ2PmA6N4agagMC6piQI1vn/TPwic/Ijqx8n?=
 =?iso-8859-1?Q?P0qWjGJS6/Czxi97cRwyf1jOu2sJEL481SQS2RxA+ynIhtwbzpXh9zLQnK?=
 =?iso-8859-1?Q?q8r2wOS06kFjODZrotkbICAvxZ8u6vmMiU5LNrkvcCy+JB55/VOSbVklwh?=
 =?iso-8859-1?Q?+Xg1hnuvweQBewrHjdqIPChaajYAdcZ65GyRB14Xy2TnhCrG7zM9fjgqv/?=
 =?iso-8859-1?Q?CfMBNZZxa/txa2GaJwTtymuxdbqTEIXbQBWXPPR5cME7TY9LRNjaofORcy?=
 =?iso-8859-1?Q?G8eOEF3DVaHSM81rglMoLK4eW7bw/FVKvvqYU92AdKQAgiyBiukVxu98e+?=
 =?iso-8859-1?Q?8TFj0bmu6EytJR7T/RMRDsvCf8TtBkH0Md3XHhG+qHP/+sQRHVrLJ5fg/a?=
 =?iso-8859-1?Q?g9QoRh1h862swHX4Vo6hpJQqWM8T0yvE6XKszd2/Al/7/gcgpjyClIF4ck?=
 =?iso-8859-1?Q?pLUZpQmrz2ieVz+rmabsFo2Hi+RaEmQm+eoL0bJbwUdD4bX58rhLY4DGE/?=
 =?iso-8859-1?Q?EXj33IZceBltArEe3+wTNXH+jSmmTnvWLC6sXFqeIdFxIMJUbRZXZmBSaa?=
 =?iso-8859-1?Q?fPDeWjtCpcgXy3bF3tH42gmQgisGaHBtBtJGIDp1paVJuT5AfCfv2DfM7K?=
 =?iso-8859-1?Q?sJpRFv6dJfB4nXSe2Bhbuo4S2BKLYuCkbW9KoBokck0+pMAxuG3BbFpLW4?=
 =?iso-8859-1?Q?aYg0Bcd2JpkEo8EOXa6GxYFCjft2XWBTjGYIpcMYKH5CRhC8fMaNjMN6ej?=
 =?iso-8859-1?Q?iCBrDAzMSch3c4E0K6NR4J9i1fRcyOiJEUVrLZVwLR5VbPuA3+B+wFws96?=
 =?iso-8859-1?Q?ruZohL1VXsWcHg997EPxh4Uj2kCl/I/1U+rnNcx2DqleuoWjSYclPjcJ6u?=
 =?iso-8859-1?Q?MwWslpCtY/PgTqzORzkRlpd0Zq1s3EP5Y2Xl0Vy23HbgKkyE/01QLMsgG4?=
 =?iso-8859-1?Q?8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BNLgKhktfKVncCYs+CX1a+gDYbo2Zk9bWGoTKggNPvGfe1APENuID8HUSs?=
 =?iso-8859-1?Q?ajOGSdQUloAB8G4SFIcGWY7RXUF+PJh/YPZLSWVt2eN287RS6Dt0f7lfyL?=
 =?iso-8859-1?Q?HOXOASAVq/QFQnWq8axlhmvTXp9n8qkfstZqccYfbHhAv03yct2dyqpqyp?=
 =?iso-8859-1?Q?A2DB0ZKfDpUiBv7ApQD1QUURzuiEHe1Tt+7u3yAl1xUjVIZXXncJQYyjko?=
 =?iso-8859-1?Q?oYvWdp1zIGCeUTPBDZgxcmN4iJisdKYnRsZpRxsaNoHYfoXGxcKtZqYZZj?=
 =?iso-8859-1?Q?fZ3Drbp1jNU3h7iKGA1Y2oQf3jwc9KdDgQz/pbo+Y/JJ/azFEMhoyJkRcv?=
 =?iso-8859-1?Q?i2RE0GbwrjbGIlXhdchpp1YKsCdekWnUf/F5Uo98XTz1566NWt6nzfQrzf?=
 =?iso-8859-1?Q?rmmTfc1wDWoc15rXuFqc+ZVRgcRNb0+9MuDajcvJeg1tbAHyPoxpQ6J1Dg?=
 =?iso-8859-1?Q?U9/5tAqa6mMWX7QRBaLrZQRZdNBYfJ1sa2merSlwUzHIsFlnQprYhzvTKM?=
 =?iso-8859-1?Q?tVS9q/WaIxo68Zbx9qcHyteHerwcGsVJhKNzTGTi3TzN62DXVfqt3y2H4O?=
 =?iso-8859-1?Q?aV6tYyQ92/wFKqB6Catq6WEbp5g/HED19P6leFUC42qF4pwFDJPFNhkoHt?=
 =?iso-8859-1?Q?3XqmQBlwMNstveYAJj7UHv++8f2hma5k+Q9TRJCXtE2Lsm5dsB+LBBAaSS?=
 =?iso-8859-1?Q?5N9VqmakCXBAnRpy7Qi8YlOb7r4lVwulHo0Afs3LMmugDVMYtbmR4utIw9?=
 =?iso-8859-1?Q?AJdlwJLXScJ8RSvRmMGRj6xHvR81aaNon4zdjLfWNfmdR/JQxTojJXTb72?=
 =?iso-8859-1?Q?HuPFogUHh/92IRdbYyo+isxYWswf+rPh6J10fLwZXBMwCj+45PUzljlgm4?=
 =?iso-8859-1?Q?qMFFursowBY23sAwTwWNzNDirki8P/o//qwRdReOOxq668fsGZbOruoApR?=
 =?iso-8859-1?Q?n1FGezCYjznD5nAnCYgnVaHS6Wd4Wc4RXYPdUzdO8GfIaI/ixK2vejvb6R?=
 =?iso-8859-1?Q?zReDNnq/39qH/vQ1wZBYWqshbvxUMiM3g5Ir9NmUgSGRAoD5lxzZ2E6STq?=
 =?iso-8859-1?Q?yq6mEf4ngR2aXleY8usF5OpZ90oket+M5kamvhvQeisQUISx59w9165yZG?=
 =?iso-8859-1?Q?Xr5/g6bnpFgAR+oYhSmoTaOgrxpbnpgeVKhvzUkkWsQHbeggu347vVJ4nz?=
 =?iso-8859-1?Q?Sc7Kaxx3+JcMVk8Pz0SdGshXCh07GOSAFhNBlu02NV9cuKoOplwC9izilF?=
 =?iso-8859-1?Q?si5Xnog0UKkd83dH09kUfvk03cZaMfPIlIxo5RQRe+SHUlaW6vZcpTDRLg?=
 =?iso-8859-1?Q?ZBEhYbZSokGtfwCpTb6OeOSs8jwqER+K/nJ37xVBaxoAOLU+Eu5DDuRYRs?=
 =?iso-8859-1?Q?+RGAv9qrxzdZOgjjitKUWUMMU0OyWEj320WVLWSX0ttTH0ornspoqkehNq?=
 =?iso-8859-1?Q?862O+EmeytX3GRMK+wYzBulAVfg9SmQLk1GsFLBPhv/mn2PvJq4nhnPM1q?=
 =?iso-8859-1?Q?5KIqzO8P+yLwQnqwS0DH7pGD3lcZmedOqN0xP5AUmoiKvefpkTmLnvdzCc?=
 =?iso-8859-1?Q?Fo/gUVOiqGu22gIFoRpobr/zSLenG4+uNu3jIq2BGy7BneIREcRIOZARCN?=
 =?iso-8859-1?Q?Jfn7qfTNa7+N2VALJ54jw5tR7LFnEsFD6RYvB0cjB2RnSYsciSt5lQbg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9143ec4a-f0e0-4644-6ac8-08ddb9377664
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 07:10:01.6566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7twZvBInoTztO1h6Ir2XRvzZeZ+K086eYuzFQ3dRtBMmnt/CG+KOod/+O3uZl3re80tJAy/aOGJ0Pg1PiD8/Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6651

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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v11->v12:
* add Stefano's RB
* check arm_smmu_deassign_dev return code

v10->v11:
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
index 0f8d47dc98..22d306d0cb 100644
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
+				ret =3D arm_smmu_deassign_dev(domain->priv->cfg.domain, devfn, dev);
+
+			return ret;
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

