Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC782AC6554
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999016.1379699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpl-0005dk-Qr; Wed, 28 May 2025 09:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999016.1379699; Wed, 28 May 2025 09:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpl-0005ay-Ml; Wed, 28 May 2025 09:12:25 +0000
Received: by outflank-mailman (input) for mailman id 999016;
 Wed, 28 May 2025 09:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sgde=YM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uKCpj-00059a-Qx
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:12:23 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcb00c9c-3ba3-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:12:21 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB9PR03MB9709.eurprd03.prod.outlook.com
 (2603:10a6:10:459::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 09:12:17 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 09:12:17 +0000
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
X-Inumbo-ID: dcb00c9c-3ba3-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2PAgbAzijzRPJ0abU+W+PNMP2y7Ak2f8+5bfLQEaOBAEEEndUkTFm2Cv2umuhJ21eLJyv0byCCUOceP5Tigzn5QaWQhEN8XegEldpbrHDRNeJfrd1SF+qKCqlb3O/zFd4NSVGCeU+QeK1vYHvj440L7dX2+N7zL2SgAVHAxdw8auZYc0ePbxn3shLOxCuqxALYsnVKyud+pMvfzKA4GzseVFj6lWwtnn9OJQRTng1zysZ9DKos35z5bvSK2IybXdgzf8vZz/aTx+dn272x2K4dpPFLtYImrHzSSNPrqqvsh4X8h3NLUSw3ilZ6G3A9NSjFnJAwbBVNz9FIFH2e4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feQP03lnAwZDb6Fdrdmses8POLR1iULn+/1Zr6zs7Ps=;
 b=jLCkr9GKCIqMqk0u/hLUVsrzBDwV0oWTKkvPou/BtEklGcB8eSYKmrJWai+Zvk3/oMMSwj6BsHxdekeSnit9csMOud63Hx+LfJBof5sPeqFs0Ot+s7ES/xQhz/5Vndl3O5jGZizxhKf8RzuXuCJ+P2nxRw/sqjQCg1rgWZNwN4VIoXV3MOgExTUSVsHt0qG0hda33+ydysM2kNwtigWzMlw9kYKmJ8wKf3LgrYfIpp5SwwgjUStExam12JypUXF1gbRIJqoqX23qLLjhqv+KEQQxyiiEapd2XnX9StdtVmA7Ir9R2n61aHRddfOvEcOpS7TBsXdYmwXXmwO0jPwntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feQP03lnAwZDb6Fdrdmses8POLR1iULn+/1Zr6zs7Ps=;
 b=TxVXcrZXbF9z1PDHnbC3fSNjqczpZbpVoyD88BzQ0YZQcwCCP36pqsxvjfVibrTsskMiaefIwEctmDOFOP6fHVXQwxHyehVW/+ph68fBMF0CKXj33VJUehjO110uDDsIANoyCV3Wx/T0IeQh2WNyO+Ggj/C7uwukS49hzyvY+R3Qxzna67WASeRqtHt2KR+47nc0rpX8iBBOUGPTuFlmqQSt7o/JWc5rb+D4U3wulIWNaJ1HzxhI6+ZLgTUPeIrUDIU9xDjfu62zT11xx7oTi+rxjx81U9LuCsbYN+IrBFWMOFKzmMu4XRf6N6QfhvUkmf2dE23m/hoNMyKPpnelRQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v11 1/7] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Thread-Topic: [PATCH v11 1/7] iommu/arm: Introduce
 iommu_add_dt_pci_sideband_ids API
Thread-Index: AQHbz7CbyxcxAhscKUi8K3dySuLaiA==
Date: Wed, 28 May 2025 09:12:16 +0000
Message-ID:
 <503fe598dd53b4023bc60e621592f4f0a0e0bf6c.1748422217.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: ef271583-c17e-4123-f012-08dd9dc7be54
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?DP7M36L7vn8yaTbPmQH5Zgorm4bfNi5yCrIynIyEw+MVmwYGjHr+G+V5mD?=
 =?iso-8859-1?Q?s/JiGH0/wQ2MdIira2nZiGs/3ItNaPjfxOdjKyOGoYPgid8Y83vIFM+VDX?=
 =?iso-8859-1?Q?HS05WMKXqyerb5dSEJPOZgKKlGluVliKy5kD7ik9cyA/f2YUKWxazg6brp?=
 =?iso-8859-1?Q?wYkDWIU6DWBYWFG74zWC56Ln5CXV6T7iy4XHXYsuWPd2CyP9FmY5tvgJ0/?=
 =?iso-8859-1?Q?L0NOUaq3MebSKq3A3gxbWTb6XO3G2lrA0iiyCxa6BdghZYPdxPWMOKBav7?=
 =?iso-8859-1?Q?QsiHKuERGPKy8d3sTRNZpyyYF12pj6ec7pXt2u8keLuxU00i+TXMdlESor?=
 =?iso-8859-1?Q?pnSP0pZlCOGpCp6mu6IzslWNPD4qpiL3Z79Fn7Dtq1cw71P0OlcgA6zVbR?=
 =?iso-8859-1?Q?wF8W2QOf9Rgb3fTVPaoWna59hBOrRd5rAykaQ/UglfGkKkLqEjtPPF36Mn?=
 =?iso-8859-1?Q?VAVHWaz9y4VaZygyYU5O6Lm0Wlrl5PCFyuwrBROJm8OOqUr7C/WAufvy24?=
 =?iso-8859-1?Q?rH7jeCx2GyUEc4nHGAWvmoLqUbRHMYKzbmXPz00xkBo972EgAdZ/pYBeYx?=
 =?iso-8859-1?Q?VeLanSfJQgxcyIP6ItIxi7C40E1Ke39xJ5ORUuqQxjGBRkYohUoAM5FgOJ?=
 =?iso-8859-1?Q?F1vMEneEY0vconixnMKVvQqSHJfvK3wWAj8g/aqCKgaY5G6uOtiPGY7sy7?=
 =?iso-8859-1?Q?wc5lPkO+LU5+711bbIYo9S24sJyKjfKwDreQgcYbFLHSvSDrObUCQpBL0P?=
 =?iso-8859-1?Q?Gt1UdQJavcR9S7kaa3iHGrr1jzn6kDx/VRNCtW17rC3GR3CcUk3VtBFy0y?=
 =?iso-8859-1?Q?EzNclRfn/IwFgfCS0L0JIjVoL2eFO77IDFCEGwQ5RxiVm9BT2HoAinowh0?=
 =?iso-8859-1?Q?lVBsFPZGjorIkVRAKJEwNMnFytuUJYuiAgodSw2NIaaaK13jcOFfSbAJ9u?=
 =?iso-8859-1?Q?8oJ+eT3tgNCoIjxSwF6iibDPggl07XTlPYUAgMwbHfV1KG2Uf/ncf81Ec5?=
 =?iso-8859-1?Q?DLEwWNhGugS8SzarIsK6kfmWJxHMMgJxAAz+ITCcZsPX6eTT/8VvB9l0mp?=
 =?iso-8859-1?Q?XuBpAsK/z8jkgXyttZlv+1VhHpeJLZLvk2m6K/95F0lmshHdCLFrb6Q0cE?=
 =?iso-8859-1?Q?fNtH/M6cNAz8NTDYRAT2UEBG+ui8VUpx1glQS4NI6EsKlwXbszTlM5tE5q?=
 =?iso-8859-1?Q?qh4RVCOitrMEAtcFujeyC0FVYbgo/FeTBDats7mMp/4kvrncfA4UbZITRX?=
 =?iso-8859-1?Q?leiNu8EftL8KYDW3dqsFrrx04c9FVDPGgte7jKiT+oZHkXdwXt53KAlK8B?=
 =?iso-8859-1?Q?nvaFBkGsJ8szcB2Y4dKdcP8qiFkYn3Xg7tFY9WwAFhqYMPvH/DvjTqlgCi?=
 =?iso-8859-1?Q?4BHCYFT8aU0Ndkujnzv2fijpTRIEPYDJc8T4bmn2P9C7RWBanJDYcEvY4w?=
 =?iso-8859-1?Q?tXlvYojs2muA3SzyzKlzr9+EmCFmtzTxiXXrjPZjr47jn3SFUUYTIlo+U7?=
 =?iso-8859-1?Q?o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?c78s4QGtTZPo1+OoDcKflJXeTPZywsNMB5TW30hh3TOB9UCJ4gGN1162rc?=
 =?iso-8859-1?Q?Dwn8+KaFmbJ/AnweHBWgrwq0zRXo6M/DaWyvpKZ8U5OUHhealhRhlc9Fry?=
 =?iso-8859-1?Q?yVYZVwSBfeZDA43y3Ca6UoPyg/mGxmZK25u7YJ4fl2h90Z89U3n+HeY05M?=
 =?iso-8859-1?Q?4Q19+O8QITBbg8pIUoc0y9dmdlJDhLGN08+e3VxfWw5/r0FNHJBMHjhSH3?=
 =?iso-8859-1?Q?LLpiMBapx5iK3y7OOANKYTNlfVyTn+CUNh2Up8U9R2uT9An3Gxg6bCMxLT?=
 =?iso-8859-1?Q?uI/LUCfLCES6PaJv5d5dg/f3jpQMyGbRI36mvHL5ZubfpOYSzX7v4E4XWl?=
 =?iso-8859-1?Q?G6bZy8wM+AXe76WfCh+cdUwtJRZZpOxHGOwCwTEOj+fp7inMLV3lLB8Joa?=
 =?iso-8859-1?Q?Md9sGN+h2k2O087bVHrSFp4EZOXJVuxNbL1jKK3HnuNzd7DgrjcHlX+BrZ?=
 =?iso-8859-1?Q?jIdXOuJfYZsJzEyyzMCov9EvK8Af1SZn6tk9dMbHzbKlOcgyxiZWQYvZWE?=
 =?iso-8859-1?Q?6udkpLLLfK9c2nVskvpvEKse3tynu8LNYK0qJy613K/r8Btq/5u8DQfck8?=
 =?iso-8859-1?Q?asOyhuFjelCtHYsf16115Riz7mYLTQQQlcHNJ4rpmjTPfdF3/QjlPq+vWi?=
 =?iso-8859-1?Q?Z6b+4cvBmdPN/PcQykeI6zh05BbGOLWReBFHVZFjm0KzrwkFsUGrVqW9Um?=
 =?iso-8859-1?Q?LF3i/OgBPMsuxUIYmClLnnL98OGKghd/E3BICLlryNtXKs3zPcUdDUwh4k?=
 =?iso-8859-1?Q?xAnZ6V1fQMegV9wMoIGczCP4ztCp5fhTHyTZtTjQYHCigvbtaoFMPhpmlJ?=
 =?iso-8859-1?Q?vY65N0xPVx3g+N06Css3UIK++jrx+u8u5fNAjaMSTz8lxsQAq5cAzszKt5?=
 =?iso-8859-1?Q?K5TzW7J64ROVH5OuVth2T6mXS0Qw5shloJ6a5oMtEZ3e2r/15ihl2BpJB8?=
 =?iso-8859-1?Q?iYuNLrfiZ0O+pncCFZILryK6vDa0Sl88WMOtQO3X2YN9jg+g+vNJQKbGbr?=
 =?iso-8859-1?Q?2ymTtZbJtuSv7NQPOGQpHXBUxaPK9v0tLe9q1PLcoscxgXTlqK1T4J8yaf?=
 =?iso-8859-1?Q?K0hIdjiQd32hW/e3q5C/qes6D1YeLZECKHMNgN1k5ytosK5b0djc8hHL8Y?=
 =?iso-8859-1?Q?3SSbhcuq7aqT3asG+4TYUmw4Sy3gbtfsyNZX9heoIyCR66V9x65LDooqaH?=
 =?iso-8859-1?Q?a76BdHU4s30zA4uV16pmvHF+tZkjBEusF26P39GQCJMmz5lRGpG41515zq?=
 =?iso-8859-1?Q?dfHGoQzUefvdnrBubhalJ60qeUNgNf6R1n2/qHBveuUJEiM81AmKNnL9hn?=
 =?iso-8859-1?Q?d0Dzgk9rBw9jHNRCtUJUkiGe7kJqC+A5nUGqfrC8egqPEbNGe8HMfzxni6?=
 =?iso-8859-1?Q?d5H+KFBRoAPJSzIqTlk330qWUBvPgbPXzmcrRG815lQXT3/iuyZX5CH9NB?=
 =?iso-8859-1?Q?3CYNCvRFnEBaYrAARChNCDjxvxgwrrnTFryUlNFg7xdE269UMO/O9wUbIk?=
 =?iso-8859-1?Q?wbj8OQ0ktYpxNAhTjWpswoHJ66AGMjkLNDtsKD/GFRo6ThsDtHPIayRFAn?=
 =?iso-8859-1?Q?3QOdMyOzdSFgZdo1IebH/Y3/jidfPZHdS4C5S2e5ncj4NEjcTtlIIjFfFg?=
 =?iso-8859-1?Q?5CHXGSffP/bJtbOr1RBImP+H2MTMrva7JmaJS8SyJluc2KiYQ8gAiWWQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef271583-c17e-4123-f012-08dd9dc7be54
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 09:12:16.4584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zjMi3UveGAYp08iwVBdRzmbqDn4xrwCbL8d8gOh2vVukXiW+ivMtgLgnAoPe4kGAKF+vz9jMBrAgI+EmjV2S5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9709

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The main purpose of this patch is to add a way to register PCI device
(which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
before assigning that device to a domain.

This behaves similarly to the existing iommu_add_dt_device API, except it
handles PCI devices, and it is to be invoked from the add_device hook in th=
e
SMMU driver.

The function dt_map_id to translate an ID through a downstream mapping
(which is also suitable for mapping Requester ID) was borrowed from Linux
(v5.10-rc6) and updated according to the Xen code base.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-io=
mmu.txt

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Regarding pci_for_each_dma_alias question: getting host bridge node
directly seems like a simpler solution with the same result. AFAIU
with pci_for_each_dma_alias in linux we would arrive to the host brige
node anyway, but also try to call dt_map_id for each device along the
way. I am not sure why exactly it is done this way in linux, as
according to the pci-iommu.txt, iommu-map node can only be present in
the PCI root.

v10-v11:
* add Stefano's RB

v9->v10:
* move iommu_add_pci_sidebands_ids to arm/iommu.c
* replace be32_to_cpup with be32_to_cpu

v8->v9:
* replace DT_NO_IOMMU with 1
* guard iommu_add_pci_sideband_ids with CONFIG_ARM

v7->v8:
* ENOSYS->EOPNOTSUPP
* move iommu_add_pci_sideband_ids to iommu.c to fix x86 build
* simplify iommu_add_pci_sideband_ids
* add docstrings to iommu_add_{dt_}pci_sideband_ids

v6->v7:
* put iommu_add_pci_sideband_ids under ifdef
* remove ifdef CONFIG_APCI
* style: add newline for symmetry

v5->v6:
* pass ops to iommu_dt_xlate()

v4->v5:
* style: add newlines after variable declarations and before return in iomm=
u.h
* drop device_is_protected() check in iommu_add_dt_pci_sideband_ids()
* rebase on top of ("dynamic node programming using overlay dtbo") series
* fix typo in commit message
* remove #ifdef around dt_map_id() prototype
* move dt_map_id() to xen/common/device_tree.c
* add function name in error prints
* use dprintk for debug prints
* use GENMASK and #include <xen/bitops.h>
* fix typo in comment
* remove unnecessary (int) cast in loop condition
* assign *id_out and return success in case of no translation in dt_map_id(=
)
* don't initialize local variable unnecessarily
* return error in case of ACPI/no DT in iommu_add_{dt_}pci_sideband_ids()

v3->v4:
* wrap #include <asm/acpi.h> and if ( acpi_disabled ) in #ifdef CONFIG_ACPI
* fix Michal's remarks about style, parenthesis, and print formats
* remove !ops->dt_xlate check since it is already in iommu_dt_xlate helper
* rename s/iommu_dt_pci_map_id/dt_map_id/ because it is generic, not specif=
ic
  to iommu
* update commit description

v2->v3:
* new patch title (was: iommu/arm: Introduce iommu_add_dt_pci_device API)
* renamed function
  from: iommu_add_dt_pci_device
  to: iommu_add_dt_pci_sideband_ids
* removed stale ops->add_device check
* iommu.h: add empty stub iommu_add_dt_pci_sideband_ids for !HAS_DEVICE_TRE=
E
* iommu.h: add iommu_add_pci_sideband_ids helper
* iommu.h: don't wrap prototype in #ifdef CONFIG_HAS_PCI
* s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/

v1->v2:
* remove extra devfn parameter since pdev fully describes the device
* remove ops->add_device() call from iommu_add_dt_pci_device(). Instead, re=
ly on
  the existing iommu call in iommu_add_device().
* move the ops->add_device and ops->dt_xlate checks earlier

downstream->v1:
* rebase
* add const qualifier to struct dt_device_node *np arg in dt_map_id()
* add const qualifier to struct dt_device_node *np declaration in iommu_add=
_pci_device()
* use stdint.h types instead of u8/u32/etc...
* rename functions:
  s/dt_iommu_xlate/iommu_dt_xlate/
  s/dt_map_id/iommu_dt_pci_map_id/
  s/iommu_add_pci_device/iommu_add_dt_pci_device/
* add device_is_protected check in iommu_add_dt_pci_device
* wrap prototypes in CONFIG_HAS_PCI

(cherry picked from commit 734e3bf6ee77e7947667ab8fa96c25b349c2e1da from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/arch/arm/include/asm/iommu.h      | 15 +++++
 xen/common/device-tree/device-tree.c  | 91 +++++++++++++++++++++++++++
 xen/drivers/passthrough/arm/iommu.c   | 13 ++++
 xen/drivers/passthrough/device_tree.c | 42 +++++++++++++
 xen/include/xen/device_tree.h         | 23 +++++++
 xen/include/xen/iommu.h               | 21 ++++++-
 6 files changed, 204 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/iommu.h b/xen/arch/arm/include/asm/io=
mmu.h
index d57bd8a38c..ad15477e24 100644
--- a/xen/arch/arm/include/asm/iommu.h
+++ b/xen/arch/arm/include/asm/iommu.h
@@ -34,6 +34,21 @@ int __must_check arm_iommu_unmap_page(struct domain *d, =
dfn_t dfn,
                                       unsigned int order,
                                       unsigned int *flush_flags);
=20
+/*
+ * This function is not strictly ARM-specific, but it is only used by ARM
+ * as of now. So put it here to avoid creating dead code on other
+ * architectures. When usage is extended to other architectures, it should
+ * be moved to the generic header.
+ *
+ *
+ * Fills out the device's IOMMU fwspec with IOMMU ids.
+ *
+ * Return values:
+ *  0 : iommu_fwspec is filled out successfully.
+ * <0 : error while filling out the iommu_fwspec.
+ * >0 : IOMMU is not enabled/present or device is not connected to it.
+ */
+int iommu_add_pci_sideband_ids(struct pci_dev *pdev);
 #endif /* __ARCH_ARM_IOMMU_H__ */
=20
 /*
diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/=
device-tree.c
index 886e6c7712..7bede20fa6 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -7,6 +7,7 @@
  * benh@kernel.crashing.org
  */
=20
+#include <xen/bitops.h>
 #include <xen/types.h>
 #include <xen/init.h>
 #include <xen/guest_access.h>
@@ -2221,6 +2222,96 @@ int dt_get_pci_domain_nr(struct dt_device_node *node=
)
     return (u16)domain;
 }
=20
+int dt_map_id(const struct dt_device_node *np, uint32_t id,
+              const char *map_name, const char *map_mask_name,
+              struct dt_device_node **target, uint32_t *id_out)
+{
+    uint32_t map_mask, masked_id, map_len;
+    const __be32 *map =3D NULL;
+
+    if ( !np || !map_name || (!target && !id_out) )
+        return -EINVAL;
+
+    map =3D dt_get_property(np, map_name, &map_len);
+    if ( !map )
+    {
+        if ( target )
+            return -ENODEV;
+
+        /* Otherwise, no map implies no translation */
+        *id_out =3D id;
+        return 0;
+    }
+
+    if ( !map_len || (map_len % (4 * sizeof(*map))) )
+    {
+        printk(XENLOG_ERR "%s(): %s: Error: Bad %s length: %u\n", __func__=
,
+               np->full_name, map_name, map_len);
+        return -EINVAL;
+    }
+
+    /* The default is to select all bits. */
+    map_mask =3D GENMASK(31, 0);
+
+    /*
+     * Can be overridden by "{iommu,msi}-map-mask" property.
+     * If dt_property_read_u32() fails, the default is used.
+     */
+    if ( map_mask_name )
+        dt_property_read_u32(np, map_mask_name, &map_mask);
+
+    masked_id =3D map_mask & id;
+    for ( ; map_len > 0; map_len -=3D 4 * sizeof(*map), map +=3D 4 )
+    {
+        struct dt_device_node *phandle_node;
+        uint32_t id_base =3D be32_to_cpu(*(map + 0));
+        uint32_t phandle =3D be32_to_cpu(*(map + 1));
+        uint32_t out_base =3D be32_to_cpu(*(map + 2));
+        uint32_t id_len =3D be32_to_cpu(*(map + 3));
+
+        if ( id_base & ~map_mask )
+        {
+            printk(XENLOG_ERR "%s(): %s: Invalid %s translation - %s-mask =
(0x%"PRIx32") ignores id-base (0x%"PRIx32")\n",
+                   __func__, np->full_name, map_name, map_name, map_mask,
+                   id_base);
+            return -EFAULT;
+        }
+
+        if ( (masked_id < id_base) || (masked_id >=3D (id_base + id_len)) =
)
+            continue;
+
+        phandle_node =3D dt_find_node_by_phandle(phandle);
+        if ( !phandle_node )
+            return -ENODEV;
+
+        if ( target )
+        {
+            if ( !*target )
+                *target =3D phandle_node;
+
+            if ( *target !=3D phandle_node )
+                continue;
+        }
+
+        if ( id_out )
+            *id_out =3D masked_id - id_base + out_base;
+
+        dprintk(XENLOG_DEBUG, "%s: %s, using mask %08"PRIx32", id-base: %0=
8"PRIx32", out-base: %08"PRIx32", length: %08"PRIx32", id: %08"PRIx32" -> %=
08"PRIx32"\n",
+               np->full_name, map_name, map_mask, id_base, out_base, id_le=
n, id,
+               masked_id - id_base + out_base);
+        return 0;
+    }
+
+    dprintk(XENLOG_DEBUG, "%s: no %s translation for id 0x%"PRIx32" on %s\=
n",
+           np->full_name, map_name, id,
+           (target && *target) ? (*target)->full_name : NULL);
+
+    if ( id_out )
+        *id_out =3D id;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/=
arm/iommu.c
index fc453180f0..100545e23f 100644
--- a/xen/drivers/passthrough/arm/iommu.c
+++ b/xen/drivers/passthrough/arm/iommu.c
@@ -15,6 +15,7 @@
  * GNU General Public License for more details.
  */
=20
+#include <xen/acpi.h>
 #include <xen/device_tree.h>
 #include <xen/iommu.h>
 #include <xen/lib.h>
@@ -151,3 +152,15 @@ bool arch_iommu_use_permitted(const struct domain *d)
 {
     return true;
 }
+
+int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
+{
+    int ret =3D -EOPNOTSUPP;
+
+#ifdef CONFIG_HAS_PCI
+    if ( acpi_disabled )
+        ret =3D iommu_add_dt_pci_sideband_ids(pdev);
+#endif
+
+    return ret;
+}
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index 4a1971c3fc..37e1437b65 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -161,6 +161,48 @@ static int iommu_dt_xlate(struct device *dev,
     return ops->dt_xlate(dev, iommu_spec);
 }
=20
+#ifdef CONFIG_HAS_PCI
+int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
+{
+    const struct iommu_ops *ops =3D iommu_get_ops();
+    struct dt_phandle_args iommu_spec =3D { .args_count =3D 1 };
+    struct device *dev =3D pci_to_dev(pdev);
+    const struct dt_device_node *np;
+    int rc;
+
+    if ( !iommu_enabled )
+        return 1;
+
+    if ( !ops )
+        return -EINVAL;
+
+    if ( dev_iommu_fwspec_get(dev) )
+        return -EEXIST;
+
+    np =3D pci_find_host_bridge_node(pdev);
+    if ( !np )
+        return -ENODEV;
+
+    /*
+     * According to the Documentation/devicetree/bindings/pci/pci-iommu.tx=
t
+     * from Linux.
+     */
+    rc =3D dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
+                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+    if ( rc )
+        return (rc =3D=3D -ENODEV) ? 1 : rc;
+
+    rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
+    if ( rc < 0 )
+    {
+        iommu_fwspec_free(dev);
+        return -EINVAL;
+    }
+
+    return rc;
+}
+#endif /* CONFIG_HAS_PCI */
+
 int iommu_remove_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops =3D iommu_get_ops();
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 6dc1fb5159..3de7ff9085 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -947,6 +947,29 @@ int dt_count_phandle_with_args(const struct dt_device_=
node *np,
  */
 int dt_get_pci_domain_nr(struct dt_device_node *node);
=20
+/**
+ * dt_map_id - Translate an ID through a downstream mapping.
+ * @np: root complex device node.
+ * @id: device ID to map.
+ * @map_name: property name of the map to use.
+ * @map_mask_name: optional property name of the mask to use.
+ * @target: optional pointer to a target device node.
+ * @id_out: optional pointer to receive the translated ID.
+ *
+ * Given a device ID, look up the appropriate implementation-defined
+ * platform ID and/or the target device which receives transactions on tha=
t
+ * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
+ * @id_out may be NULL if only the other is required. If @target points to
+ * a non-NULL device node pointer, only entries targeting that node will b=
e
+ * matched; if it points to a NULL value, it will receive the device node =
of
+ * the first matching target phandle, with a reference held.
+ *
+ * Return: 0 on success or a standard error code on failure.
+ */
+int dt_map_id(const struct dt_device_node *np, uint32_t id,
+              const char *map_name, const char *map_mask_name,
+              struct dt_device_node **target, uint32_t *id_out);
+
 struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
=20
 #ifdef CONFIG_DEVICE_TREE_DEBUG
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 832775754b..ebfada1d88 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -241,7 +241,8 @@ int iommu_dt_domain_init(struct domain *d);
 int iommu_release_dt_devices(struct domain *d);
=20
 /*
- * Helper to add master device to the IOMMU using generic IOMMU DT binding=
s.
+ * Helpers to add master device to the IOMMU using generic (PCI-)IOMMU
+ * DT bindings.
  *
  * Return values:
  *  0 : device is protected by an IOMMU
@@ -251,6 +252,19 @@ int iommu_release_dt_devices(struct domain *d);
  */
 int iommu_add_dt_device(struct dt_device_node *np);
=20
+/*
+ * Fills out the device's IOMMU fwspec with IOMMU ids from the DT.
+ * Ids are specified in the iommu-map property in the host bridge node.
+ * More information on the iommu-map property format can be found in
+ * Documentation/devicetree/bindings/pci/pci-iommu.txt from Linux.
+ *
+ * Return values:
+ *  0 : iommu_fwspec is filled out successfully.
+ * <0 : error while filling out the iommu_fwspec.
+ * >0 : IOMMU is not enabled/present or device is not connected to it.
+ */
+int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);
+
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
=20
@@ -286,6 +300,11 @@ static inline int iommu_release_dt_devices(struct doma=
in *d)
     return 0;
 }
=20
+static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
+{
+    return -EOPNOTSUPP;
+}
+
 #endif /* HAS_PASSTHROUGH */
=20
 #endif /* HAS_DEVICE_TREE */
--=20
2.34.1

