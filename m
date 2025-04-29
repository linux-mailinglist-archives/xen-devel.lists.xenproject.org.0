Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E3AAA0AC1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972138.1360564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVY-0008SW-Ek; Tue, 29 Apr 2025 11:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972138.1360564; Tue, 29 Apr 2025 11:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVY-0008Qu-8v; Tue, 29 Apr 2025 11:52:16 +0000
Received: by outflank-mailman (input) for mailman id 972138;
 Tue, 29 Apr 2025 11:52:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zRN=XP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9jVW-0008Cw-Ma
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:52:14 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63573085-24f0-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 13:52:12 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DU0PR03MB8809.eurprd03.prod.outlook.com
 (2603:10a6:10:412::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 11:52:09 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 11:52:09 +0000
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
X-Inumbo-ID: 63573085-24f0-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YaWoh7ehH5XWvxkDybaCsuuGLMB6k0r6kxUk8GzDdqQuRK4GOWGsX5+AXXsmC2J/tl3dbKzA9637ndMs4Zb+1G6XmhNulVnYc3O55sWSgub9v7FCuQtC23gM/aZxoEV/xjf1rhfqHrKJkqNtb0cGWe0M8btD/qmtviFzRrdICd8amItMB6xumFHjmwgLZlJ7uWy1rIuXNyvk4UzXXhOofnuyx7rRzInNR0qEer7Wnrw0iW/pARGIMZWivy0cJg4m1pnz/AMqwsGVV+FsdEKQ7ui7iTCypQsX5u2KgfGk6+bwHP9nc/DqZ15evsI8bJ/Jd1rvAGb7K07uxfJ0J9ELpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrO4OIfRnVJFdWhv9XYhfSEcjG/O9DDjqyM9atO2eXk=;
 b=IXMXMdEN4cZwjPNuHtxJWv4qHArQfbjlDYM9lPMfl/D7SoS1WPv/XVbvd8fN+lcich27L1nDuINy2wVfraQow7BinDxfOaxCsksAWAn/i/ESpCwqJEIR3YGq5DTpVF/wrlotZ56qv1n6ZVE91EmNKKqFJnizP/l4CHFcYH/0+wdtfHnCEB8+ddLGeC6Gj6CVeyTHLHbMNkUySWtfc+AsKO2EL1Cg3xG8HtfMi4gD5vbzVimcH8che2CbHTdYjzwjtxYVsM8rmV0/WkZ9qIiWygZyPR7h0CBCCfRFwTU+HhtY1lz67tUrMpMzSWFo9Llgpw6naOttq8wnXtzkt9NQxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrO4OIfRnVJFdWhv9XYhfSEcjG/O9DDjqyM9atO2eXk=;
 b=tEEpxooqtBuOPCnMWze4eCP2TkyRZnWUPVeRJcHs1EnRjqEvoWCrGREsFME9h4DqhEd7cPkQVUzJ9OQ7bBfwc4YrRoIJe1ogdNoXpzoxmWbURCZrw4w8WlXtrlMwlC02HxJEX6vvUXyXZJFJgvmou6BOfxXxiHIVahqfrv1+Tm338oBqqlKD5ff4EeMh3bpVzHYuJglge365CtsLqohLavuduABJbE8iXsqrFjzZXV6v21afHfuvb3Te01ZND5SJsalrym8BtAMCbwchkNTKZmnzsm9982XQ44MLnYxskyAqTH1YCTzqXvH6fBGGP/egCDGeyQM4WzSfjfkDQgRfcg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v10 1/7] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Thread-Topic: [PATCH v10 1/7] iommu/arm: Introduce
 iommu_add_dt_pci_sideband_ids API
Thread-Index: AQHbuP0idLqgFikNiEOYLl4hPTxlpQ==
Date: Tue, 29 Apr 2025 11:52:09 +0000
Message-ID:
 <8110a8fd8648b1e40a47c51d68bf5cab5a46468d.1745918678.git.mykyta_poturai@epam.com>
References: <cover.1745918678.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1745918678.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DU0PR03MB8809:EE_
x-ms-office365-filtering-correlation-id: 3cf3f62c-ddf0-49f7-3523-08dd871445a7
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jw3vkIRINinU/20nmqhknX6MSsvAdrglxJwyCFdzEGLlEpYVlVYrJWfSWM?=
 =?iso-8859-1?Q?6m9epIRz8/IRb7uieerAd47cCnxQug/EpTQbyDUWOHCd1D/WBNH3oKPDNx?=
 =?iso-8859-1?Q?I+mKvCnX3Qmb/172uhhsSKuHqJCr5QfPHAcBd2S0LD7i0LXmYNOuzVyq7y?=
 =?iso-8859-1?Q?+2k3LCKO2ptU8G5kO8ANsoWuHzkXa2nNBIaVHhryg+RM5zzlMoeH8kluiQ?=
 =?iso-8859-1?Q?g+gARddMV6b64PrmX/zmCdpKX86p1ZSpbvNtD78HO/do1ljOp6IWZ70JvM?=
 =?iso-8859-1?Q?HUtfjv6bZsmOj/kOTKYIANK11z1NQjYYAZOr4Zxb/ap/I3itvmjBuVOl7B?=
 =?iso-8859-1?Q?EY1Z0nD9Wsmo72NwrpXM+392Lw3WzsUpF1QUV5MXJzQcTAonw7MDaPNcA8?=
 =?iso-8859-1?Q?xUqNEQetSx0o8LxFLLZ1HKIsubz7GyFpmj0DuojsXK+8hTzq6vWXPa+ay0?=
 =?iso-8859-1?Q?/fbugOzn3uJ5BK3zTlFYv3nff5WrP7LTSXJNZNfL7ePTqqUEFgoWdMEMOX?=
 =?iso-8859-1?Q?bh5dMct4eFChlVThFnLpy0rYXf4HtmedDS4GExR/LqToSK5A/wtGdBi8DK?=
 =?iso-8859-1?Q?5yK28HO39d4X2jgpPi+zmFo7KXrW7s7ZIc7HyGjHx1wioOXxQ3iZ90WZYB?=
 =?iso-8859-1?Q?2dPUg59ViWkxZoj+bbLs7QyMBCbWIS6O7huMohODIV14yPt8HQm5jZBaBJ?=
 =?iso-8859-1?Q?ao6RCBesL6uTONUz2HvSo2KxDg2YLpQa7y1E3tDlcvAqDB7OtH+NHlO/Aa?=
 =?iso-8859-1?Q?TKJZmf1KLTSR0p/+o9OMkYUmfs+ZBWwwK18w/wCYBoK6lau6s87VS5p4ho?=
 =?iso-8859-1?Q?zYMUIEIMvOS3VO15KTl6rJfYY5J5QYKIBLRyI+Sej1r1qI4A6+lz8+WETp?=
 =?iso-8859-1?Q?WqUSbDBS1WKIV4hs9pRdwVuC8eSdNklcuDRFA+XYOGRAcQSZFc5713TAot?=
 =?iso-8859-1?Q?kn2O7NrLUPzLx3Lz0XMgb/YROgwmqNbaw9hkw3R8vTSvlRjB6cfQRkO4oM?=
 =?iso-8859-1?Q?yPtmzTBdflwovFz6NHPbi/IkIVw15o+kyhtH5IzsZ4NbaviLJd6WCOirj/?=
 =?iso-8859-1?Q?E/fV9+Bx0SZUhZHVKRSrfFeneUEb8O+7AoEbVGlr/uEvi/wcwGDr7GMrHS?=
 =?iso-8859-1?Q?iDkrP77TRQo4geWvfrF0yQsfwu80jLf6taDOpMklwc17B8xiwV96XoBZIa?=
 =?iso-8859-1?Q?Uf9HHO/ps1AjUUQjWKs7XIZam3yG5y4fzCDss+YWt2FEyhObBSydwIHKkq?=
 =?iso-8859-1?Q?voqPLdJM2GvklX7NoocxgRwBOBEivmPX+AetEYVD2sIi1mJWV2UGeiCKGM?=
 =?iso-8859-1?Q?/9TzvJCW+gqaJzJ+hHirc4DzMXCDkCQLXcUTrVIy5arWnvgxEXM+xu6Xre?=
 =?iso-8859-1?Q?pBl81YX6b+USWyDnNPvNQVLM5BdE4nzOZSACaPIbRYRDECgeyaf8pv2Qtp?=
 =?iso-8859-1?Q?YMQrUQMIgkkhiE9hfbhVMS8zufdrUs7/UwC3+PdNpEgR/JdlOyN0G9Uy3r?=
 =?iso-8859-1?Q?aJGYUjGY1n6M95HkpyOOdTYvRLOXvAVXuShIAUsdRQXZ2EDaa6Yxd6G9QY?=
 =?iso-8859-1?Q?92bp1+4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?slshPao/Nrxw3bqcYUfX1tai00n027caQKbaYE0AIle9IGldQEzGdnUmWI?=
 =?iso-8859-1?Q?CxykcAf1/O1yc6WiHxgpX40xWEFphs61QGT78NoZsFHGPCCh1rjQKLSuKO?=
 =?iso-8859-1?Q?lhNSbZgY+XB2md2Dw3c0Vf669PK7lbcBntcyqsc3jdMtsQUFdLpNVQTfRH?=
 =?iso-8859-1?Q?GhjgBkNmzULbdrrZKE0DxsRY5JpZYeewFbwbKxI/d6ztyZkBKAdE9hHGdw?=
 =?iso-8859-1?Q?9yLERNme889gtJ6gYgXyfTfsEJ8JQRmrP5HZ2AJUYwGUccQ0YHx+Is553m?=
 =?iso-8859-1?Q?9HA2g6pqbgTJdZcO7xsdz/OtDNiPhHB5kaTwufkK13O6CkXdqZZ9Jk0Snw?=
 =?iso-8859-1?Q?2D19i7fGpwffGwyfIbqwgiSwBupgaziEMtzZMreggBkTwI2yffbQdtMC7V?=
 =?iso-8859-1?Q?78qh0ut89ljWxP4tQ8CUyCtoc/f6pJRB10bdHO+cdy2rADO5Tr7T0e1nd6?=
 =?iso-8859-1?Q?9Xq7NzhyMJSDLQ1Zeu7leb81Qm+K1QrAWwVwjVLFS3cI3ez9wB60Am1CRR?=
 =?iso-8859-1?Q?3Nwf1bLo3jaHk09/2rltaVLJ3amiDFRPIK+855PDXVkWoFB1mIKewVidv6?=
 =?iso-8859-1?Q?+5Z+GWy0eC/y3f/NiYeCZaabqfPc6vopIUDmuzcmiK+rjabLyfpph6cbt8?=
 =?iso-8859-1?Q?2aonuy8D0cmh5as90+MDhH6Dkg06LM4522DksIY9mjGnSwqckIlXAZyGlF?=
 =?iso-8859-1?Q?sR3dLT6lSIYeVUJYrQIWBi/RWZrv8oylUMZjjoQS4vxNCRyJr7YkTCMCdt?=
 =?iso-8859-1?Q?U1g9JEx3vOWXaHbMBgzR78BBmuD3S9nOxW6yjp3cYUd/4lObfBnk26XwRJ?=
 =?iso-8859-1?Q?JI+Sx9BhBn1Yr9sC5hsvYQbPkFWLxwqZ9Hq8yMXf7kGwWbDL/6pgHL4Yc0?=
 =?iso-8859-1?Q?kgLVvzC7r+DqeK4ZgtBtf2crObbCZLJsM6eJGWnHe4TVcnhtWpBgxSyC5I?=
 =?iso-8859-1?Q?+ADpKkdxzoqNsqKQbQ+aAwJQZIFtKAUxqf21rNUQrpdEDcpPeVN5A+RXkG?=
 =?iso-8859-1?Q?oNUAB56b6jqtxNDktGzvUFydQ/U6WUDaKdwsV+SK8Y2/eEDUTj8of4B5L0?=
 =?iso-8859-1?Q?LJ40IOVNGxDJUEjK0I8PULfF4YnLyRd6uqMGimVX746pF8R5M0lHyXUlaB?=
 =?iso-8859-1?Q?LJ00I4HQJwGia7mRtSWHWaptcAnMR6dw+d+YLpoxtPyERzeXX7iTPlLVO9?=
 =?iso-8859-1?Q?WQfV4VNf88bNgOBPu+bAybYKxfDVu0xh2VvwTBsOHJt0FaoaG8J07Oserl?=
 =?iso-8859-1?Q?RvhnHpClUVVL565gaH63/fFXhu5fCbx8b1srQDoDnYWDrWsuDiDV6dNZZY?=
 =?iso-8859-1?Q?voT6R9ha05YXq3AaHKew0FblSm9VbQe2y4Gankte4Ol24JipzUMxHrJfWf?=
 =?iso-8859-1?Q?2GUBhxpPlRXI7X+ogF2NNnUfF46GQIf0KQGp6+5c7gH0dZWTJpDbVoM+Uv?=
 =?iso-8859-1?Q?WjQQMVL3LFGm9RFOeCDXrtv36HyAPdid3hBRj8YVWiaCMJZE7RIdXJl26V?=
 =?iso-8859-1?Q?ubK33KAvdLMOz3VwV56ezPrWqSbeaXwrLo11xjh2DQQt0g0HIJs1O8oPSj?=
 =?iso-8859-1?Q?kOYDJS+Aixi3FmeJEE103iL0fvllN4OkcxM81GeZaDGIW50PBelPGAfGbt?=
 =?iso-8859-1?Q?wN6oAUXAF3tDQ7Ocvjn17MPF5Nj9FeLr24olMDKWsRK9jck4yyBh8pGg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf3f62c-ddf0-49f7-3523-08dd871445a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 11:52:09.0936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BPPuWgBrwShg2hu/QS+bFk75/YFuTc2kKrTXQPtTxe4AthG+uLy1335f+E397iPZ7dJ617BVcta0QAxrx9XJ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8809

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
---
Regarding pci_for_each_dma_alias question: getting host bridge node
directly seems like a simpler solution with the same result. AFAIU
with pci_for_each_dma_alias in linux we would arrive to the host brige
node anyway, but also try to call dt_map_id for each device along the
way. I am not sure why exactly it is done this way in linux, as
according to the pci-iommu.txt, iommu-map node can only be present in
the PCI root.

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
index 90fee2ba03..08f6ce6761 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -10,6 +10,7 @@
  * published by the Free Software Foundation.
  */
=20
+#include <xen/bitops.h>
 #include <xen/types.h>
 #include <xen/init.h>
 #include <xen/guest_access.h>
@@ -2224,6 +2225,96 @@ int dt_get_pci_domain_nr(struct dt_device_node *node=
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

