Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23835A612C9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 14:35:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914594.1320377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bn-0005Sz-ON; Fri, 14 Mar 2025 13:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914594.1320377; Fri, 14 Mar 2025 13:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bn-0005Os-EE; Fri, 14 Mar 2025 13:35:03 +0000
Received: by outflank-mailman (input) for mailman id 914594;
 Fri, 14 Mar 2025 13:35:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/juS=WB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tt5Bk-0003qF-JB
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 13:35:00 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f323175-00d9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 14:34:58 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7950.eurprd03.prod.outlook.com
 (2603:10a6:102:219::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 13:34:53 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 13:34:53 +0000
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
X-Inumbo-ID: 1f323175-00d9-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pV8imtA6k/AZOeY0L0WgQuMcG65KgUButn6qHWhuN9KsYGWnhjOx6HBP+yVkvEdp8H0H5ffJQig7dS11mz82mcC0uOQbZ+Phigoiz8FPSm5A2ID9goKQV7n9Ag8hXj1WCGwFhkmECI4FROTvzx45G0fPAIMM1NCDrVGVyHBJoREpzFMzBHVT3ymvQnEFyAigZl1b/79ERcoQX5aLBi3tPt8eVYoSv8a34zw3PkbZSUfPulIYkhy7tn0zWinM2PRFv3ozeABNtnnR8VsOImU60opDLuJoPEERF6d9HNZQmmlaaVEGqIN21J/aCvpFAvZTm0PDCbcwBodSIpVFmn9gPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwq8S4cxBLVNYoyVBRxE8Ops330OFUSXGNqsnQp0k5o=;
 b=fzXlLnRmZBT7shROshuJc1YpnwwRrulFUPgkkiNSmR+FhgRznzahNqNP7VbhlsHeLVCUmEIra3eNDg/f8T8cdAWb4yQZmaf4RQfi1YOnTVPzJLNsCjpOov9MDR03/nOc1rgFT+aA3hWQ403Rr8xo1i4FTdjHNzUDYz7b6LbP2Sa9aTmKT58ibVpNeJuZ81yM+nodG5gx7duyDwT1eZG4dW2nu9p7vRCdU4JLLRiScVXuRLgyBpHRXwGF9hNlsOXomHCtTxjVUBYKqetdwYyOLEkI/tspZkcLYzm8G3gwm3HjNThm20Hb6CvjGj2KqjfpLC1dgT+xsuntwB7fgVeP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwq8S4cxBLVNYoyVBRxE8Ops330OFUSXGNqsnQp0k5o=;
 b=SrWew7dk0CkIZwPdeD9bIk1SYZ6a8qaaJr6a95j0qyT68ov8mkncOHytRwsWRbC89o9P4yZ/j1VuBTIta2rAj73UyBM73QckS4UXbCV0L1WFqtg2K1r4aNIE42ozC45XOnQxp1/lbzM9yHcwpXxBFDTyNA48TBLsoszx0mv/e8+c/5upuLOS9sBRxAjKzAmp1MRZB59lqGt7W6R19VHIs1C25JMsG8H5f/Wez/mXtxbRUmRY0m0ceuck0BRDowg5HTaQZ6rLxwo9Wquq44kZCAxtdHl/tUPEw7TFWZYpGBj36A6lqfPLKYF6z+SAKCgPllyrijeW86cXz/swx18MJw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v9 8/8] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Thread-Topic: [PATCH v9 8/8] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Thread-Index: AQHblOXehlQl1S3l2U6Q3DlTtEEfCw==
Date: Fri, 14 Mar 2025 13:34:53 +0000
Message-ID:
 <e5072a66707b70892f60bb5e0757ae3f74c2d601.1741958647.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 9addef1f-5e06-43d9-3533-08dd62fd009e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EsoA0n8EyWKFTZEsszo661fBZoRETfBYsLQkY7njDeBpyDPx/JxkkHqasH?=
 =?iso-8859-1?Q?yfMxrreeFiJ/WqgwJV2Lhx3nZ3oa86QqRGhRDYordy8chvpDqy6txuRWV2?=
 =?iso-8859-1?Q?q6Nx/rRGytr7nmdMQpFaNGvzdjIHgklQUnD84lY7onq8DSIAVi8PnUs8Nj?=
 =?iso-8859-1?Q?ntlZ17gxuMM4yg3uwe38YmV1RA6Q5BeAsFk8AWm1hGCDppv+NY4lf3oYgU?=
 =?iso-8859-1?Q?3JTNDNBi+Jjkq9Sua8+tZPCfLanFJZoIVOGHG8Rq22BfrzGf/4K7ayKG9/?=
 =?iso-8859-1?Q?pixrvSaozArneuBZbPlZXvbfYhXToJujKjOp6KkmYEmHiGW1q51DkQ0iH2?=
 =?iso-8859-1?Q?5RPyL1ODSHczRcw8kvYi3tdvbblQef83o/SJnb4o9Sn/+F+zM6czOZCc/h?=
 =?iso-8859-1?Q?xzPpeNFVmn7NwfWUEiFlrYXxthz4gu+rAR5PlS4LNQPnyOuFQB/vd3ivOh?=
 =?iso-8859-1?Q?QaTJo2wZ74vAj7mG57DxINvIY3Wc0lPRV3BDy38a6N4EBDGGTqbStMLeJh?=
 =?iso-8859-1?Q?E6kMJwAVEskK0kHWqyGqIWrpyxEBcU+qrI2cAux6p38lOrbc1qU7VuUJYC?=
 =?iso-8859-1?Q?/zJC2mKlf6s9pwhplVSWMhOOkOV8OroRkJG6sCwxGftdAAoJ1uChQzG0YC?=
 =?iso-8859-1?Q?YQIuxbox4w1gk1ZShSR8EbD2yj7BARV5CqE7255+rFg/4hkun9b6il8Ph0?=
 =?iso-8859-1?Q?16NNPks4ROl1OiJAj4reUY+mzO1t38JlXkXQIKcdhIRErUdld6BCTWbOwt?=
 =?iso-8859-1?Q?/mTiY9Nvom/VW1QMJmUo9X+4vB3bMdYyrR9Zn/9jSWsBnXoNmDFu6jeGlt?=
 =?iso-8859-1?Q?6ej8NyIw+GgWZwhXn6tHN6hiuwDA20fH2SmL1tbc2GfOh7Njc8zSEGp+8J?=
 =?iso-8859-1?Q?vm9ywM9J+2DPhGmIvSi0s9+5ZeVUJOPoJLmY3MUd9wTRS03XaLyI595Cwy?=
 =?iso-8859-1?Q?ZBG/7/bwhXhMLUe9zDzPt/p93NqcncxUVcM7uw8Wu1o4EqDFXJtjncEpG3?=
 =?iso-8859-1?Q?qg95ohl+J64cupmyBo8+xmanIedDDpeytI4WSti6Q4irpAx6tGfADutUjt?=
 =?iso-8859-1?Q?Ni95cgDlm6klDd21RKwtv/weXN1vGKlvTQfX9NN7R6jvcI9LA8fDvV6moU?=
 =?iso-8859-1?Q?Ih7TBuys52nw1Z7bl2GyX8eDbvoo5CzKs2o6uNzDSnLGmaHf5i9c2Po4Vt?=
 =?iso-8859-1?Q?uCD69wIsDPzAPouquOt/0xeNCR5HwgFgjHvQ6lYpRtwPBJOdmtts9mOWd9?=
 =?iso-8859-1?Q?JVgOGMvN3cx6ikeJmaGNli5nugFBifbsqn9TK3s3DYQeEqZqDy4WMxD5a9?=
 =?iso-8859-1?Q?qyUMeuxyBdD/wL8TEk9hcNGJ6vjYqWbq1CAxisgarIJQYbO2UGKqHvN8iK?=
 =?iso-8859-1?Q?kT7oqE5IAP84Mvawb1WWY1+33KYx9ZUWYzroi62XZ/OyIfaovInhqkafLw?=
 =?iso-8859-1?Q?gELViVUkelrCjuhUFM/bg2kqi2p5VJoSYyqXXw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VtRxU6DCWAdaIb7q2gFecuOaX6GBmM6F4itwW9Q6KhHACoXCxl8ZP55Bf2?=
 =?iso-8859-1?Q?7JiVKu9D9WHp2gWGs77KZmv/SwM2d9vlA+4XMbk43aYUDvnyhgFn0Z/pAm?=
 =?iso-8859-1?Q?OPgnG7rxlV1lIfzKO2inx8HtnOdBXZjBYHhTTUOEcrhxF+DcEi7ksMdsTh?=
 =?iso-8859-1?Q?K5d/XMngEMA6Kp1UJRDKCT+fnU+cCP1ruB124iSAscfST1zaTNNgM6PFWC?=
 =?iso-8859-1?Q?luG1UNZcqxpzQujJ+6M5t8GQK+4HQWevddFzzT6LtTsLgtzUnIOOThlH/y?=
 =?iso-8859-1?Q?XTNGw7qZL8jb8WsfT3QRfP9fw2xvkhOp7XYcUzzFfOZQYVYyUxWQC9Oho1?=
 =?iso-8859-1?Q?ESm2yk5jB0wUze4Z/HnAJPQcln1pJwAmCXt+5ovjULLgx7bAJae9TmlQGx?=
 =?iso-8859-1?Q?kjCVXDnbzX7I+fiCH1fBXMvGWl4fAO0708oYCNxS2jauBuq5WspSgbrmR6?=
 =?iso-8859-1?Q?gQKPjIkEaMfcQ3d/VoGre9HYXuaz5vCW0EoSdDrS/bFnAMPrKTWXJ5jaP8?=
 =?iso-8859-1?Q?eLHOHK+0VmCySYTLvsBC/okymaBqZ+bO1C67L9cNdjDpb2rYgT1nVrSV2u?=
 =?iso-8859-1?Q?46iQgCKQc/nzAgoWwjS6kZoVD1aZHgjYB/JoA22hUOmLvRpI6ku5MUhR6P?=
 =?iso-8859-1?Q?eiBmLy8AqUqRtNUVnb725G0VET94oa7fm9NfP0c6e0PrJ0NGmADbh5V/1M?=
 =?iso-8859-1?Q?bafDjCTf+lumbtN6Z5+EcayoryTAlO2aVldJnSxBHpWRAhD8R9nue8hnGT?=
 =?iso-8859-1?Q?V7dwQq7PgNyXF9WA3hYS4QOcQkKBoVgPpHXJcEZakQ1ijojoDzDqflPWNT?=
 =?iso-8859-1?Q?R/ys/jfHupjDMRb4hUYQEjgZ1ogRyWXfkIlLaLm/ms5LGlfp/qSQvgB1QK?=
 =?iso-8859-1?Q?5JYyaVyIz97x10ZwnH+CySBj8NUWQQ3dzXJNLnhnfQVPaNW11O8I2NHdi7?=
 =?iso-8859-1?Q?a7tGRKtOUpWVIp8FWM6845iwtJQCU2yuiwCdO/lNuCJvbahzsGxnWtnFLw?=
 =?iso-8859-1?Q?Z57+T2IU74Wwyz5P2h/BrohR8C4qLhFS15JMyBH+DH9qMSsAkTDRctGm0j?=
 =?iso-8859-1?Q?J48UZn1ueadBcQWD99ZJGvrMIhsWW0qYUrdJ0NP3JJHcoQQSOroqRYISxy?=
 =?iso-8859-1?Q?lhRLnth/XpKykjSMjf9KZ1TjyE74rQncWMcemw0JcPKQqcmmXujaSM3NFf?=
 =?iso-8859-1?Q?IBzn2qIHlOnEjYZ+Y+xlZrMzvVZ7vm7poSIixFUSyh3ivYJ4UzgMzCdsuE?=
 =?iso-8859-1?Q?bLFosCH+bMRZBqAOJ19t4gGXbi/wxT+eniozynyNRlrJvBa6iUHLOZ9xYW?=
 =?iso-8859-1?Q?uASdvX2GCurK7C5oz+0Xew+f/0XfFtt3VoZk2wmtqIvEkBclEmdFVPoLaq?=
 =?iso-8859-1?Q?vEfUGacAaZcgnjaic0mYbzhHoJugCxSrR55e7deMr+xN4kx+foMN41U3W3?=
 =?iso-8859-1?Q?4l0nl88fpIDkp24H6AEj/LWd/tp2lIxXXsSh/N9fPj84U2XQHgmiyq6zWa?=
 =?iso-8859-1?Q?AMI7B0BTdKMx1dapPTYQslx86C2OFh8BhZUVOx+9RScdLafqOp9NK0M1hS?=
 =?iso-8859-1?Q?uW9EwoCCg1Ui25qZrFF1AYKCtKKHCLj0IDs69BIttHbgaOEwhxkwVKiPU1?=
 =?iso-8859-1?Q?c3Tr6pEtzQqwwK8CGLuX0cZJNsfkDKX8yxyd8/J74rO3Yx0JvVugkhdg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9addef1f-5e06-43d9-3533-08dd62fd009e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 13:34:53.2724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZj3SN8HbPIre+Em4F++7P+QUhFIlZceqU6rsOS4uniOM+57NNEYLXbrQScGZeXlsFyaSFpbfYXecxyMshsRXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7950

From: Rahul Singh <rahul.singh@arm.com>

When ITS is enabled and PCI devices that are behind an SMMU generate an
MSI interrupt, SMMU fault will be observed as there is currently no
mapping in p2m table for the ITS translation register (GITS_TRANSLATER).

A mapping is required in the iommu page tables so that the device can
generate the MSI interrupt writing to the GITS_TRANSLATER register.

The GITS_TRANSLATER register is a 32-bit register, and there is nothing
else in a page containing it, so map that page.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
This patch was originally picked up from [1], and commit description
loosely borrowed from [2].

Example SMMUv3 fault (qemu-system-aarch64 virt model), ITS base 0x8080000:

(XEN) SMMUv3: /smmuv3@9050000: event 0x10 received:
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000800000010
(XEN) SMMUv3: /smmuv3@9050000:  0x0000008000000000
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000008090040
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000000000000

Example SMMUv2 fault (AMD/Xilinx Versal), ITS base 0xf9020000:

(XEN) smmu: /axi/smmu@fd800000: Unhandled context fault: fsr=3D0x402, iova=
=3D0xf9030040, fsynr=3D0x12, cb=3D0

v8->v9:
* no changes

v7->v8:
* no changes

v6->v7:
* add tlb flush after mapping
* style: update formatting
* revert back to printk with XENLOG_G_ERR

v5->v6:
* switch to iommu_map() interface
* fix page_count argument
* style fixup
* use gprintk instead of printk
* add my Signed-off-by
* move to vgic_v3_its_init_virtual()

v4->v5:
* new patch

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00483.h=
tml
[2] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/623=
2a0d53377009bb7fbc3c3ab81d0153734be6b
---
 xen/arch/arm/vgic-v3-its.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index c65c1dbf52..376254f206 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1478,6 +1478,26 @@ static int vgic_v3_its_init_virtual(struct domain *d=
, paddr_t guest_addr,
=20
     register_mmio_handler(d, &vgic_its_mmio_handler, guest_addr, SZ_64K, i=
ts);
=20
+    if ( is_iommu_enabled(its->d) )
+    {
+        mfn_t mfn =3D maddr_to_mfn(its->doorbell_address);
+        unsigned int flush_flags =3D 0;
+        int ret =3D iommu_map(its->d, _dfn(mfn_x(mfn)), mfn, 1, IOMMUF_wri=
table,
+                            &flush_flags);
+
+        if ( ret < 0 )
+        {
+            printk(XENLOG_G_ERR
+                    "GICv3: Map ITS translation register for %pd failed.\n=
",
+                    its->d);
+            return ret;
+        }
+
+        ret =3D iommu_iotlb_flush(its->d, _dfn(mfn_x(mfn)), 1, flush_flags=
);
+        if ( ret < 0 )
+            return ret;
+    }
+
     /* Register the virtual ITS to be able to clean it up later. */
     list_add_tail(&its->vits_list, &d->arch.vgic.vits_list);
=20
--=20
2.34.1

