Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FECCA27366
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881481.1291639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNQ-0007ll-Jq; Tue, 04 Feb 2025 13:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881481.1291639; Tue, 04 Feb 2025 13:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNQ-0007fP-CT; Tue, 04 Feb 2025 13:54:08 +0000
Received: by outflank-mailman (input) for mailman id 881481;
 Tue, 04 Feb 2025 13:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jloo=U3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tfJNP-0007P3-7j
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:54:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f403:2612::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f73919b-e2ff-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 14:54:05 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB7494.eurprd03.prod.outlook.com
 (2603:10a6:20b:2e2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 13:54:03 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 13:54:03 +0000
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
X-Inumbo-ID: 7f73919b-e2ff-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6NAciO1rGWv2E5zOf7+2zB7TvUY3ULPV7GpH6XuJjeZ0raik34O+c3IhBjIAvEgx5SgAeC3gmfz3fKhnr+2N5DQRuIgIX4Cq0OF8Ui/9BRni3BTTMlLM6M6w0BDYTDma+ClCD9mefc/VL1Jz+IaTN0JH+hbh5FxNy8rKqcQQWUojWRCPO+tv9FepI6oU22PXS36EjRjfvE3BbWYh0yRJ4/6eilvq+OsKjBk/WpfJ1N8+Ao4/hoHbWpchrtOJLGFG75wQYsIsGuWqFwTdfJLKy2tjdHcrJs9LINfqJ9m/Nhc91p2FKPe6J8kh4DQsZdBPzwBR/Itro5bjKArH5AgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcDxDDzV0nXc3Oe/VjJpBckwCTeLIyuU4o2H6BVgetE=;
 b=PH7tPutksOc2T46sqJ0cGBOGhr8rKfgL2aiYpbPPP4swKpeURNomQOsWSiohgx8Hq9ThLoZekYWU8Jdjmpa/WY8FQoUSiEbh5lMFBOhFxci0KhCk3RDfzvJVXwNbLxp4If6X96DY9GfN2YJkrlf9uP4kHK6PA25yJBESm5e2I/a1szpuWp/5YeBzAixzOOQE4leOcgXnwy9qnbALq2SNrd3BoscATqUut2q5D+/hnka8s20fDDpmUdQ8DJrMvgSW8bGPwe/yX1e2y2+1/TlGC8BmfwUsLpO5KSQGYDHf4cYC/eXl8zHiVwzZMM9aIYo9JBzatSiTX05yks377PcMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcDxDDzV0nXc3Oe/VjJpBckwCTeLIyuU4o2H6BVgetE=;
 b=L5D1oCMcyCdMU1BLvgC//hSWwp3vE6P+tlRaqCmzxotbNRtl0zSCxb0enIPH4bLQ1ZQT4QWOuG0OopAvuOMDJFH0lJnmXfpQo7p5I1/rcb8GtwuVcaZamT9PBHARxjkAVYtm+t0kHnZJB+3JAyxLpyh02iBYKhNDE2MG1F4P26SlwC0X15giWCMVD8/8G1lyJmv29V7uSwzyD0EXV96djw68pf2U3FVDHOLJcjBgHBpzkvAFz/wrhIBA02tZlVQJJmwf98ViHzppOTThDuB27ecZnanedXNctcuhTC7Cup/XfX/Sa6fIuoxUFvWIajzU2Pfk244oTUhV+WpcYNqKFQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v7 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API
Thread-Topic: [PATCH v7 2/8] iommu/arm: Introduce
 iommu_add_dt_pci_sideband_ids API
Thread-Index: AQHbdww/qCT0TCxV3UKquqIUpSdYjQ==
Date: Tue, 4 Feb 2025 13:54:02 +0000
Message-ID:
 <c75d5f01c38d3b85be86019a4507682c9821b1bf.1738665272.git.mykyta_poturai@epam.com>
References: <cover.1738665272.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1738665272.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB7494:EE_
x-ms-office365-filtering-correlation-id: 1ff38ae0-7632-4e25-0bca-08dd45236231
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tYXa6m0CSuJXAJyea45NstWy/Z4RtypWIDejuZrg99Y195vnTmElD7Xdt9?=
 =?iso-8859-1?Q?7MlO0IoN8bpMWlnfLgUnRPxthco09HXd2UAvHa9yCSTzAJJpGypSSYa962?=
 =?iso-8859-1?Q?Ibt4MztwH91g896O/Gn8yeJxsnz08ycyyeWU84cUv4U1cHOq0OPRLqKmHg?=
 =?iso-8859-1?Q?NVGV10O2fa+zFVLXHGHcQUEn/8hYknMJeziNgGII2nEET5pEBW2/xHTRXN?=
 =?iso-8859-1?Q?oIhm9mRL9L3zazbW7tVhHpE6YyA3FC02fwdICuK198fGuZ3kelwK5FOZlk?=
 =?iso-8859-1?Q?nf0Ss5wyjmBLsqRan3isFgpWyhu18PKl+NQvLjTtZWYbSSd+ne4Vefdry2?=
 =?iso-8859-1?Q?7Kk7YEzG+9DXGr1EvroQ5s9e2PC9u1FKyCvAaexrRX2JxuW/lyHiaKchmq?=
 =?iso-8859-1?Q?+bSYh5A+W3apKlNsOZuEmTq+mSv1hDDMnSLWCGSow4IU/ae0S30yJlrWPE?=
 =?iso-8859-1?Q?MpQsx5Qgs42XWNigNrItNHK/aImed62eCiGXoLKuzLJBMUkWHpuvLr76BW?=
 =?iso-8859-1?Q?MSchGi1HoL8ERHbFtk5jZnyFgG/EuKiBe91S+lMfMnhTYc/vmFHd+Ss8Ia?=
 =?iso-8859-1?Q?FFudEng7IyhQeY//WnY7UVGCz6/JKhyNk/7hJyYVLA77NbXHTvyxQlBrqz?=
 =?iso-8859-1?Q?XEHlZs/78y79mbfNOHU43/iXP0I2MPeiePOjccr6j1I9S4eEs81ycDvMdU?=
 =?iso-8859-1?Q?apEZ9kNY694irEjnbWCQG2U/K0pds7WNaxcLwzPZ+SUVKsUeX/VVzOxYxV?=
 =?iso-8859-1?Q?zKMMlGpSWbMerGvBre3dBCYTw9rdnPZA1wUltxSTaYllN/llbRjRnBGbp0?=
 =?iso-8859-1?Q?zSFPq5ReVYq4G1FbM8xYp/4JZJmxBGOcDl4h0tJPDQl2OtaSljR5FGErEP?=
 =?iso-8859-1?Q?/2QLY4qN3/cZWifJd6PRnVnBMcutqsq/8JPibm71OSszjE0niGlb09JyKF?=
 =?iso-8859-1?Q?BsaexsjbhNV4iTf6d+nrgWHJR3MPQ4Ct/JIxZO77QNi1EqXFm73NJcD/Mw?=
 =?iso-8859-1?Q?wnwcDyzLv3kBw+wX6cy2/bE1PjFTaGKbDYilY4fiO9B4gMZpFrxVLx5WZZ?=
 =?iso-8859-1?Q?m2G4hb7CaBSmDpBeiJzDOVuErijd1MVgiJPZ7rJPVNwCEmTxV1Qa31ISmk?=
 =?iso-8859-1?Q?cbRhiylU+iwvovcYQO+7PRzhcwkUsE36jHkdOFWQ2F+dE/E1C/yuyYu4yo?=
 =?iso-8859-1?Q?NoeEhpZenWN39Xt2V4KWiC2qmZgWzA727N3adD2GAMf+3hyPGlXMlZEdqd?=
 =?iso-8859-1?Q?b+6nlG0fArpVN0wV61phQ6S4dJkTDouAD8QwfNOllLPjyJfuDZ14An6PbM?=
 =?iso-8859-1?Q?6px5dAPaYe3iG2gP574u80m0Kud3Yq7tirgboTK+hBIjbf94o3eGrBC2HR?=
 =?iso-8859-1?Q?ZrVHXmzjGW1b9SSys5AU3Er5rJjo+lKIsEW7Q/FcFBqWjDceMyimg1sSKG?=
 =?iso-8859-1?Q?XyPVK7kk4yYv3ORpmzeJvH0laoA4Xb/1Co6Cu+4qOxvjTk4cpl+uNzWKAw?=
 =?iso-8859-1?Q?kdVkErGEmXawdcS+Z4n68M?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hpV2+EAZUXS1viqgozEW4uZIP7KftYbwdMd4tGRUA1k4xg9bKxd/OfqVUY?=
 =?iso-8859-1?Q?9jIMVeovXMcB7rGZTY4N5h7UbFcTuiH92saBX03EhtuSW3lBo/L0gJJ1a9?=
 =?iso-8859-1?Q?Q1b5Au8o+Asg1o30hGYi6Q/SGLi6OujtF6OXDWrkQkzOmd+Yj4ncrei0jq?=
 =?iso-8859-1?Q?2OA7/K4zokkHa5p89UqzC5p1LrvjGYR6ccbJpL1Ljf9DN5Nn6mjM5Q86Js?=
 =?iso-8859-1?Q?SkxBIj9cywQYUBYXq5Tcw9RX8tirNfWeef+15AsKv5VkryjLrZ053gSPoc?=
 =?iso-8859-1?Q?RbAc7sMLE4IB7rDEogNSEmIR2y7CvqFYbK/oE6o5VjgNYIZfChKBvN++X9?=
 =?iso-8859-1?Q?BGm0zP+ly1FbPqf6p3oPil87znj9IQI36LOK8hk0V11iP/KDQ/1tPjTb9A?=
 =?iso-8859-1?Q?zcLy6I64WgTPZ0016793qv2fzcEl/cZOTgxILnseRMbhLc7TVhmvyXYKvQ?=
 =?iso-8859-1?Q?mylbMsfEy923mqEYiMBK3b4hg19G3+zpleD+g0WXb7SggLIGKD5dKV/rdT?=
 =?iso-8859-1?Q?cyuP9j50kSiRvtxdLUN9X5ZR5a8H+360CxJUB79I58/RnS0vuhwekHkptj?=
 =?iso-8859-1?Q?cFsVnSq7bRNAlUF/qJsTLTWJXaog5jw1yeGkwXJz0NdIKZCpvtZjUBVhPW?=
 =?iso-8859-1?Q?TqdzSAAj7YJEgassvcoEJsvC+bD9OGkXrGW2iLNhS/OU4ubWIqk6tpHLxF?=
 =?iso-8859-1?Q?U7HkjtI/bLraulzZa+v4ig3o7nXFn9QA9XZ9NSJGWWEJoqRp+ymSSYToUD?=
 =?iso-8859-1?Q?w9DqNNyhrOyMQldw9ymeqpGvpmjB8JDOwBfPpO4zAHUSl/u4cDlbIgEaMS?=
 =?iso-8859-1?Q?u+lE6bt4ZlMB9hMPPT4ixaSxPLnpL9pqYZo6a77F0zrOsdq4DMwok0WYQ9?=
 =?iso-8859-1?Q?16vN+g58BP5uZbq7hR+vhsapM8udkF4kgVII4hjElpIsGNIsV2UkPUk99W?=
 =?iso-8859-1?Q?11tQsD3eVgK8C03OKjJXgTTs8HGCQoStPGwZKQkh2GTZYEbUODMjh02h90?=
 =?iso-8859-1?Q?JVcVX4LeElr+45bML2RKC3XlGBn37UO9DRWb3oQqfE8sqhcu4B8OvqGhJP?=
 =?iso-8859-1?Q?Uo/4i6CGPigQilN4/XOWNAhjcNkwSK0j9RTsT0AbvO3fMr1qm8hIr7Eyjk?=
 =?iso-8859-1?Q?J6abmQQ21ZG/NIsIGqExd7tGMl+Co+Hf5hni1u03BqopUgVwTf1J3WE1XN?=
 =?iso-8859-1?Q?Qms+BYlIi+tITS0yLnnFYSkyfLYqAw99zOP5y9A/WtqVkurl8XYH3CtjQq?=
 =?iso-8859-1?Q?TaplymiU4h07HBeld2RQhkPKZ/vxnsTjntYVDxR+8LBfwDMAb+nUWGDlvA?=
 =?iso-8859-1?Q?djY6NJVYXqFRJUUEsadmF96WC23i486BXn7sWTdKwQ2ir7ZDaUdmf7zW1O?=
 =?iso-8859-1?Q?ENomAOG1+OfXx77zcBmdqcLQccOgFCYATWdkG9oyYIHcsolowKGx2bGYDF?=
 =?iso-8859-1?Q?RWOS+M002yysqIxChqu03sFDVaKPhFTu2uAVbrIwBpiplTeqJI3fH59cTB?=
 =?iso-8859-1?Q?0qFwMnk9Ii5JHSieDETtLNmYG+is67vIjEvVLXvw4NSTSwfQnAD964BS+A?=
 =?iso-8859-1?Q?pcJXXsWCQ42jYaOa1a/5gTQu7xiECtYON0SC9ovtpSoqY91NrQMH/4h5EX?=
 =?iso-8859-1?Q?dDNPFxUMP2DzpBa0jxnqqg9KHGB+AhGr4bQFYXCIuAFwvKbE3MW4RP/w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff38ae0-7632-4e25-0bca-08dd45236231
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 13:54:02.9629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S7EyCONp79Y7SmNSgoEIfPKx155Pu8szRrHkpXqjEwwb+D2VBa6LLA2wVJ1kqVUb6sv0J5kfD30xOmTu7cGOww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7494

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
 xen/common/device-tree/device-tree.c  | 91 +++++++++++++++++++++++++++
 xen/drivers/passthrough/device_tree.c | 42 +++++++++++++
 xen/include/xen/device_tree.h         | 23 +++++++
 xen/include/xen/iommu.h               | 28 ++++++++-
 4 files changed, 183 insertions(+), 1 deletion(-)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/=
device-tree.c
index d0528c5825..3de7858df6 100644
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
@@ -2243,6 +2244,96 @@ int dt_get_pci_domain_nr(struct dt_device_node *node=
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
+        uint32_t id_base =3D be32_to_cpup(map + 0);
+        uint32_t phandle =3D be32_to_cpup(map + 1);
+        uint32_t out_base =3D be32_to_cpup(map + 2);
+        uint32_t id_len =3D be32_to_cpup(map + 3);
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
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index 4c35281d98..edbd3f17ad 100644
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
+        return NO_IOMMU;
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
+        return (rc =3D=3D -ENODEV) ? NO_IOMMU : rc;
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
index 5ff763bb80..9254204af6 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -946,6 +946,29 @@ int dt_count_phandle_with_args(const struct dt_device_=
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
index c3b8df9815..d2b9f04f81 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -27,6 +27,7 @@
 #include <xen/errno.h>
 #include <public/domctl.h>
 #include <public/hvm/ioreq.h>
+#include <xen/acpi.h>
 #include <asm/device.h>
=20
 TYPE_SAFE(uint64_t, dfn);
@@ -215,7 +216,8 @@ int iommu_dt_domain_init(struct domain *d);
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
@@ -224,6 +226,7 @@ int iommu_release_dt_devices(struct domain *d);
  *      (IOMMU is not enabled/present or device is not connected to it).
  */
 int iommu_add_dt_device(struct dt_device_node *np);
+int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);
=20
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
@@ -241,8 +244,31 @@ int iommu_remove_dt_device(struct dt_device_node *np);
 /* Error code for reporting no IOMMU is present */
 #define NO_IOMMU    1
=20
+#else /* !HAS_DEVICE_TREE */
+static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
+{
+    return -ENOSYS;
+}
+
 #endif /* HAS_DEVICE_TREE */
=20
+#ifdef CONFIG_HAS_PCI
+static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
+{
+    int ret =3D -ENOSYS;
+
+    if ( acpi_disabled )
+        ret =3D iommu_add_dt_pci_sideband_ids(pdev);
+
+    return ret;
+}
+#else /* !HAS_PCI */
+static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
+{
+    return -ENOSYS;
+}
+#endif
+
 struct page_info;
=20
 /*
--=20
2.34.1

