Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18C5AA0AC0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972137.1360554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVX-0008Ee-65; Tue, 29 Apr 2025 11:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972137.1360554; Tue, 29 Apr 2025 11:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVX-0008D7-1s; Tue, 29 Apr 2025 11:52:15 +0000
Received: by outflank-mailman (input) for mailman id 972137;
 Tue, 29 Apr 2025 11:52:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zRN=XP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9jVV-0008Cw-6M
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:52:13 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62582cdd-24f0-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 13:52:11 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DU0PR03MB8809.eurprd03.prod.outlook.com
 (2603:10a6:10:412::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 11:52:08 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 11:52:08 +0000
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
X-Inumbo-ID: 62582cdd-24f0-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6PAdfWSdMrKPKdtKD72+7Eidx+wYUkVYivWYZpbV1mlVYs89TysLID/xTrBoQcOU4NE2Wb7EWGW4zCHF/3itaIndloCgzUCG5updw0Q1wLR6sS5otbUsOp5a161O+5lpI42o1TknbklTFuIjHAqyKSargNG7Ev78reS1doLzPmY7D4ZOOYzrbUsrPAqCHsJDFAK4LPtOnzO/tXPVt3nnc7ikPMrRVUiiskjERYS6toxDARUA6LMo0Q+tqNX7VQCsW3IReQOPfL48rTJ7QvDmrZfj0ZnPxu2s8frQKmsqUkqKlBm1b+tWMKrY+46zvnHR50+e6zqqZmvSWZ5MdjPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbymJd2v8pKE7Wy+pVe1MuqXU5YBZUw3zuvnql8GLBo=;
 b=s2sKrMQvirdao/qWg6j/5HAWHvRC1vGn/roWCr1c/JdPvgv8jU24G8GvbnfJ14bYdtTgZl+Yo1T/DufT81hiGrqp7GRyoHg0UoQ7ciaM2MIth8NExPUDSql6NOL3U8rQ2yAabeap7D9CbVCFP2dWyqh7DVpf3KX/Bp9KvQyQ3nOKrcAlMlG8S53pY/DunLhodp5SMI/pBZ9a0uxlUX80cDUiuCi2kwofS1HrUd8Cw2vlp6Gx0lbSmtf7fx9cFAC6zybWG++ycqLFLE5aMMZq/ZhkHLTdqyzJIoYRiLgyc8cyGJ80q1AJzXVOsCEmBoi9uS/voTxbR6I00bnhsu0Qyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbymJd2v8pKE7Wy+pVe1MuqXU5YBZUw3zuvnql8GLBo=;
 b=GyJHscwvP4gsTKOhPCrtMiaiZwA5kyuEWPE6ebvQUSwLDS/atm1nBy7hVrm9lUoE7S6ipRSfAOrSgEeUx80soOTN2aK4dFHDR1iiZUHXeEKfQfkbVyzV0rkMNHdrIBLHP1G5UoVzvpgTP9/vCWPzdYJojiEoZLDicBhmXu5s+s9mdnk29FyGNgJmfKgsrD3ZIl1JMJXxsGYlmu0S/kw8BmiLI9Mo1SRqRttDaC6v1X7KjMlV7iKKOIJd9yVT6pbSCgeRgk4jJCsl3HgYdut9pY2gSUOzBDjzJsJ0K6BrXGUJ1CJmQwq09q9R0BYGzRSo3NovhRQLsBFZ1pA7oa4a4g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>
Subject: [PATCH v10 0/7] SMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v10 0/7] SMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHbuP0ibykvWQwu2keuk1l3+BHLgw==
Date: Tue, 29 Apr 2025 11:52:08 +0000
Message-ID: <cover.1745918678.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DU0PR03MB8809:EE_
x-ms-office365-filtering-correlation-id: c75fd7ca-b3ae-4e33-7471-08dd87144537
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Y+nVSp//O5/PbOCsJ5BsqKYSZWxE8LOqCWXRUCcvbFOB+KOlbJXkFkGMNS?=
 =?iso-8859-1?Q?eAUY7mStys1dUTW3LgHFE1HrqK0GbC8X7/f/BT2XUG7bCSEnANXAmKsG4J?=
 =?iso-8859-1?Q?2hZCKAytwZ0iTeEvYHkP9yl8wqidgxFxUAr76xhiY6iVQHkCQGPGWf3cx1?=
 =?iso-8859-1?Q?keMNsGBqjMLiH5CF7c0x/HP7AVbUrLBLYqwSY7MiESCH2ZwBeOzhTPcdm5?=
 =?iso-8859-1?Q?LPUJjVsFr3XUEnidxPOrLbgJeE2/FspgyJ/4tKoXpZyrO1YceZxEc0FDyO?=
 =?iso-8859-1?Q?TuxhXUjZNwiQ4D8SqH969eERv4wKgIR07vFi2XPf9Px8UMN4Xy9hU1S1Sz?=
 =?iso-8859-1?Q?EkmfveJhiUcHtp+HQ5GlJSBAmCWoWwCsUSEf66yLLdRj1CSZQJbIN1z38p?=
 =?iso-8859-1?Q?rL2kCbBKycL3ObqN+PUaQ6WsXTqA4camliDfVcJ0bM4eOGQFzJYcDPFmt3?=
 =?iso-8859-1?Q?4BpnfRuBcvi896ktCmzNkmn9wWl1pVfnGiH7og2VJubbnV/wV5UI1xEsiZ?=
 =?iso-8859-1?Q?86MUW9IMckfNYVOnvDgEFxbIxuMysCK0Gj+w1FXFgIZMxMzJK/ZHZfMByI?=
 =?iso-8859-1?Q?19Os/nzwMTjD6PpmjO2hthQUuHTLlUJXpDC3m3eV8o8brhuf1RRoPkXXP6?=
 =?iso-8859-1?Q?6Mf2FgvY56fjFW77tyDtX8mhZuO9rPhQSsk1GWKcyC/paZa3JnaqLj/lT8?=
 =?iso-8859-1?Q?aVmiX7GxeEn4EDK9XVMMJyF4kyObYWzur2cJrHqGuA3Y/2SYe28WTd0C1B?=
 =?iso-8859-1?Q?BaX68VVlhBuNMknGf7OQ43mWNPCXDaODbUBl8M2uQbX7K4PigbxTCn+VYF?=
 =?iso-8859-1?Q?bfUk6TBDxJUpTfHvbtStr8um/qxOQIPkGFfK9YQcG1XqoZ2jtkED3gjTzq?=
 =?iso-8859-1?Q?6La0fOr8ZmTUcOi08lE9WXAVwrKR5S17WWtMT66iaRfWY0GrdhK4xNpe84?=
 =?iso-8859-1?Q?SouGgJJf19J+79eDH1IAo20Qqp9v46jTaO9b6b8Kau3/aOjduYA97YAJ8L?=
 =?iso-8859-1?Q?Fd6ZD9R7KXth5Bn5i59aDg6h0o4LrWOn+CkNtiSixqOTJukhIKbPtYPzdV?=
 =?iso-8859-1?Q?gcFEMZw8vRJC6zkEGqhDPSFzLbHN3pryr1zNAYAGK9W/t3FHvznbnJF2Hy?=
 =?iso-8859-1?Q?y1HmpKxaMbiATKbi1IR2p7MYwtocmByrjbRpnRXSSXqA59F5os4h8HTjSe?=
 =?iso-8859-1?Q?VbuSbIQY401OFQwf2suea0p0uDpRl4ZViWPDaqsr/PykOYeH/mlT3BCvTx?=
 =?iso-8859-1?Q?b5hiEhafJpRT+X9nsmxHdtGjcZVkgcdWWTkWIC1szNV/DfrgGWbwAXKVFY?=
 =?iso-8859-1?Q?GKSW59+gY/ap/qdpBggYqIgmcDQf911/Ab+2YyaKG1IiPk6Un/9UD35Pa3?=
 =?iso-8859-1?Q?Nyo88yDhaqtuQ2uL5RJQpCyPVyesnVmRk87Osf2MJNP7c/Ewr5qJYU1agR?=
 =?iso-8859-1?Q?hnaR8o9ztdEjWnAn/abHkAWkfiWbzmkULJdMxo7PYBuHlqD3FYeQ3gdz17?=
 =?iso-8859-1?Q?s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2Zm1pI943hTDb1sBlxbw1l2c6Sjp8YEF+DbkrOF99DZh2HLzxI2btYp1Go?=
 =?iso-8859-1?Q?NBIHyaiSDoiXkose8JL0SoP610u9ZZRvjFYYO9lyEl5D7rlwP8VsBBO2qT?=
 =?iso-8859-1?Q?5xw3rLUXFVkkxa7NEM/qfyLDHQ6c+f8xTFbezh/bTixh9cMvy/OiB6JuLR?=
 =?iso-8859-1?Q?onIndL8vKlcy4CjsMNvswNwze80iDvnoKlNwhQEi/muj2iNQ1WGbT35BJF?=
 =?iso-8859-1?Q?a2vjmXOUd9kvyOv6RI+nCgY11AMLzfkdO5sX0nYdnxF1QGKs/xm4tPAZBN?=
 =?iso-8859-1?Q?I6gziQ8Uf7oJvK4g+gegG+0cblVzxWfSlUMO2+1Mmwx8LanCI4IY9vE5Bw?=
 =?iso-8859-1?Q?w4jNqBL3K7ygAGtmv5q0+8uPM7iXitTUNIXYmeIzJL4guCT3O/5F3fNYWq?=
 =?iso-8859-1?Q?6P7bVqY1vaYjVgi+2/37I164E39Ckay4H9PL5VS/hmMFWU8rNduP+24obF?=
 =?iso-8859-1?Q?KvOv0VwGDRlMPjDkT44UXE7CosdBr0gLobuKEuBqiztm2Nu820w/IAzLXN?=
 =?iso-8859-1?Q?gnIYcYttU6618hha9PQvoJguT+EYXuOTIHP5Z51ZAucpn2K6srT05BrawY?=
 =?iso-8859-1?Q?EUr4rp9hcjJojQ/u/7iIEYZb2VQ6r7LaKf2UkgVQdvcpakVVfMCa37ee9e?=
 =?iso-8859-1?Q?I3jY/WHgXZkXhyAu6ML/QIx50onJ9E1ERE0i8vH2874+9+JRNDS4UkqIcr?=
 =?iso-8859-1?Q?Ej+TIQE0sBN6MDfp/SwYG9m84hzLmo3GiYcB7sFJFq+5Lsxyih2TfXTwR6?=
 =?iso-8859-1?Q?X1wf5Rl6I2xoalcCF9CpAxHNjA386gq6zdget/Ngl1YQ00xv+nJnMDPk1m?=
 =?iso-8859-1?Q?mFmCmmDBAXBdPqFNlXmmKeK/ZTNf/Dn8y9MgUN6AMhjxGHNp99Vze+mhQJ?=
 =?iso-8859-1?Q?dr8pdj01RUGGU4SvUh9LK2L0DcFATdYc7XeWw6zTVu9BDP2Kf/D0+/vZxC?=
 =?iso-8859-1?Q?v7QvL+PeiFjrQAC9uEzgK12x9Q4ekpsNFlHlEU/RoaBiEg3OJQeYNajJDL?=
 =?iso-8859-1?Q?bu15pKIoQdxo8MIPqK0zGzWdoBU6Gga+ulGC2aFD3yhUYD7wdlwR4cbmbH?=
 =?iso-8859-1?Q?A1cdHjIwWEQjuYiEAyqnJhRgMEfJZpo1VByRFsEpPaYHli1ONSe0bdZHb1?=
 =?iso-8859-1?Q?UkKuYiBXnAn0QrIwtaUqX3KQ8hLk2jk3uh6qPzelEW348QkwCJxYBERfWf?=
 =?iso-8859-1?Q?sYrsxLu8ImfL5ImnSSic+IEHlh4ONt/ywx7R/KFxOuuRQqpKtZeLHDankp?=
 =?iso-8859-1?Q?pGh4b61A1a9V7gOlNp/U52fzN9ICVvSl2Ny1mb8W5eU/s5lupZbMTxj0Pl?=
 =?iso-8859-1?Q?Q9zDVN+8oMVnWVruvFtOPz34Jd1dsUdHoZcIYLbHOq/HF+INMsC4p7Yx+e?=
 =?iso-8859-1?Q?oC/HoJ/JeTWVhlU3J89hKgDEFONi1Tjb22rOwCMvG7XvmroZnhWIZhoGJ4?=
 =?iso-8859-1?Q?QcbNNSDN6fQUynfjIg0OsFufy5vn1PGIl0ggISe78ikEBU8WwxUTeUNaMv?=
 =?iso-8859-1?Q?1zo4WvJA0+5Lx4soiliHlCW9meOkC15ywyR5Y6l3MjwcykQleNwXLShpCq?=
 =?iso-8859-1?Q?+Xy0V9lfAgGjCyjwOgCWAYCkhWNckFPDM7+VQZlAYBJeL5JhL2L6g+koD1?=
 =?iso-8859-1?Q?6MUjIT607nW7mLXXsXnk9/BdEAgVhFBgdOE/UtaBrZFR9ytCl0ufU0Qw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c75fd7ca-b3ae-4e33-7471-08dd87144537
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 11:52:08.6328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YZzgY7SReckeoWcW4a5eTLFoRFAtIbZ+UdR5cWnrdKMW8XdXzIYRznWs6cUqfKxTJLgrPmkJh96+DpVzECFq+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8809

This series introduces SMMU handling for PCIe passthrough on ARM. These pat=
ches
should be able to be upstreamed independently from the vPCI series [1]. See=
 [2]
for notes about test cases.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.h=
tml
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.h=
tml

v9->v10:
* drop iommu/arm: Add iommu_dt_xlate()
* see individual patches

v8->v9:
* see individual patches

v7->v8:
* no changes

v6->v7:
* drop ("xen/arm: don't pass iommu properties to hwdom for iommu-map")

v5->v6:
* don't revert ("xen/arm: Add cmdline boot option "pci-passthrough =3D <boo=
lean>"")
* add ("xen/arm: enable dom0 to use PCI devices with pci-passthrough=3Dno")

v4->v5:
* drop ("xen/arm: Improve readability of check for registered devices")
* drop ("xen/arm: Move is_protected flag to struct device")
* add ("xen/arm: don't pass iommu properties to hwdom for iommu-map")
* add ("xen/arm: Fix mapping for PCI bridge mmio region")
* revert ("xen/arm: Add cmdline boot option "pci-passthrough =3D <boolean>"=
")
* add ("xen/arm: Map ITS doorbell register to IOMMU page tables.")
* fix test case #1 with PCI device in dom0

v3->v4:
* split a change from ("xen/arm: Move is_protected flag to struct device") =
into
  a new separate patch
* see individual patches for further details

v2->v3:
* drop "pci/arm: Use iommu_add_dt_pci_device()"
* drop "RFC: pci/arm: don't do iommu call for phantom functions"
* move invocation of sideband ID mapping function to add_device()
  platform_ops/iommu_ops hook
*** BLURB HERE ***

Oleksandr Andrushchenko (1):
  xen/arm: smmuv2: Add PCI devices support for SMMUv2

Oleksandr Tyshchenko (1):
  iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API

Rahul Singh (3):
  xen/arm: smmuv3: Add PCI devices support for SMMUv3
  xen/arm: Fix mapping for PCI bridge mmio region
  xen/arm: Map ITS doorbell register to IOMMU page tables

Stewart Hildebrand (2):
  iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling
  xen/arm: enable dom0 to use PCI devices with pci-passthrough=3Dno

 xen/arch/arm/device.c                 |   2 +-
 xen/arch/arm/include/asm/iommu.h      |  15 ++
 xen/arch/arm/include/asm/pci.h        |   2 +
 xen/arch/arm/pci/pci.c                |   8 +-
 xen/arch/arm/vgic-v3-its.c            |  24 ++-
 xen/arch/x86/include/asm/pci.h        |   5 +
 xen/common/device-tree/device-tree.c  |  91 +++++++++++
 xen/drivers/passthrough/arm/iommu.c   |  13 ++
 xen/drivers/passthrough/arm/smmu-v3.c | 119 ++++++++++++--
 xen/drivers/passthrough/arm/smmu.c    | 224 ++++++++++++++++----------
 xen/drivers/passthrough/device_tree.c |  49 ++++++
 xen/drivers/pci/physdev.c             |   4 +-
 xen/include/xen/device_tree.h         |  23 +++
 xen/include/xen/iommu.h               |  21 ++-
 xen/include/xen/pci.h                 |   5 +
 15 files changed, 507 insertions(+), 98 deletions(-)

--=20
2.34.1

