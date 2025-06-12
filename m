Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C440AD6EC4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 13:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012880.1391416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfvE-00043y-T4; Thu, 12 Jun 2025 11:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012880.1391416; Thu, 12 Jun 2025 11:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfvE-000414-OA; Thu, 12 Jun 2025 11:16:40 +0000
Received: by outflank-mailman (input) for mailman id 1012880;
 Thu, 12 Jun 2025 11:16:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGhi=Y3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uPfvD-0003Ie-5G
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 11:16:39 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4a650c9-477e-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 13:16:37 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10784.eurprd03.prod.outlook.com
 (2603:10a6:800:262::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Thu, 12 Jun
 2025 11:16:21 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%6]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 11:16:21 +0000
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
X-Inumbo-ID: b4a650c9-477e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5eKVB6cMa0yiwizwtlxyXYfrsqJNfU9KFTz9hNduuD7obh9kXu1rZfG4yke2jbOEcvRmSuBtCe3BSRg//9IUSD3ljfMx3+26LDBubBpEWG/Gl648hBtmJMWms/wG/ZSyTLgN9dCXaSf5t1Fz7wdXEoVLIZl0kIgcmzaV/QF7OTfojICbYX6nqwrBAgeEZotYwpeV1ZwzshKZXsfGw2GPuAKvLKn+OmnwEOIL+xTgWlTNesWNnlgt41Lj9Dx8lP1iCllG/gw1rX9BLyis9bPRU0ISGK3uZ7DrMASDSzCsWMKyE85nYtqK8w4hRIYwguvYsQJut6e8UeJVXCszIYltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGxZrYExnUTLUTU0BX+8dVladrci2YqFWzX3+Z3Tp0k=;
 b=tQns+Aqkwk50MFxTgrJ5gOQ7gOBMFTE+o8d7nSo4qMetty4droW3AUMJVSYBcU99FPSAiLKfzMn87fOONkNTg4EJ8TbR4MMiP9nNb/r7uV5ct+/z09L5LU6u+1UOWd6VloY9fkaBcJyvkhI5ITUMuTlQYSQfBIlzI0CmNySxOJ9qSkJ7OTzeybonFrkLtBp/AIQ+DN8VjORWLt3EXJkR05F5pgcU/CcMLqXE7SW/hfXKcZyebvSdv0LRmQ9RBaGQVU5nUZT6aDYy11L+ymGemErHPX1cMZuQPQnrqrwXB+jv2nOAHP/laSSEwz04Vn2ny0CI/wjAspIkv057Loi1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGxZrYExnUTLUTU0BX+8dVladrci2YqFWzX3+Z3Tp0k=;
 b=k1i56hM4WV+ctx04RKOZaRPHHS/AGqzEWWcTlDyjUSnfVLqcldkg0Qtyh/pHoDB4cY9J400dXOVfbE4Q5kYGplvF+TzYx/xIh+FgysAjIVTVIYcVfm5wiu6OE4cfzyBKunnv/QUy7HOnNAOa1HVym2iAy+x9XD7LZq252O1ArKXvsg8isv1SLq2TPbZjsSu4cBX0VsC9uiJDSuwmehFU3waDMDfxyPMk+hClEZvx3N7u8IADaaP+KZXtcIFc6ykTzddAgYqtBoSKYOoC5BTbC0lTTNhT4x1qcBeqlPn648Q4xVDDsiF5YgB943iwiIUJSoy5JKu9NcbEQN/JPKOrNA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v6 3/4] xen/arm: add support for PCI child bus
Thread-Topic: [PATCH v6 3/4] xen/arm: add support for PCI child bus
Thread-Index: AQHb24ttVkZxL8stp0eAfUdym5ZRRg==
Date: Thu, 12 Jun 2025 11:16:21 +0000
Message-ID:
 <a5c394242c8d3d717cefa37324f14ac688f50ca7.1749720912.git.mykyta_poturai@epam.com>
References: <cover.1749720912.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1749720912.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI0PR03MB10784:EE_
x-ms-office365-filtering-correlation-id: 3216da05-ff99-40d5-5acd-08dda9a28fbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?S77sEz/cIp/uGOMkwzeMfc0clpjH+nuDCyFabFSmGGzqwg+EF/Jtusg4kx?=
 =?iso-8859-1?Q?XzziZnZmX96siocV1ZI14yPw4LmkPDsOoydpADoML1iOG3tReirrYvWXMS?=
 =?iso-8859-1?Q?phQPZwogNKPQJwBq5Vf+PpJ3W2efniMM14MUjsQ+JuqzE7M7bvuSPTz0Mp?=
 =?iso-8859-1?Q?c23CeU2CpHf6GWgbpBqXufGaZ8ye3KvosaVVmKb/BTPNB7p6BbGvP5AU5n?=
 =?iso-8859-1?Q?vvPojpfXwkw6SLBvtTTAU0cXY9Tmr/hDD/qko9BJbqPYIEFFjxad0NWH16?=
 =?iso-8859-1?Q?93oAF/FPoEo0N+JXvov1xnCGOwHIL4adGgSnsr9ehnh1lwBbAmH3dWrAJK?=
 =?iso-8859-1?Q?eymbVW17uiFxdI7utS79qUZpgHmdGQ2XWMFvOPn9IPMpCYqEaDD/CcIVch?=
 =?iso-8859-1?Q?JF1dDw9UlNxvAwCf/WKaI7A+Hzn2wSthLEkuMVCsf9nK0mlrhEg9NFu8x6?=
 =?iso-8859-1?Q?uKPH1uuNApXExCarYjwt9XG/jXbEWXd1jI8KsHIya1V3b6NzOngyXfdbwO?=
 =?iso-8859-1?Q?7rSuKT1TwtFhzRZLJtMuzoTFKM/rscATwjRJ87XZIe9ATWRmUlYHizDsiH?=
 =?iso-8859-1?Q?Eof6F4z3/MU0MvBNWETA8hoHYiGBY+lcY2ZA4D7vEFzVyo8sDWLTkRPZ5/?=
 =?iso-8859-1?Q?yEq2TyrPjIv4ZwAwoVHMBoLqC1EQpYlVS1l3xPpqOtx7qU4cXHKCs+FXoI?=
 =?iso-8859-1?Q?Hh4yZm1kWTixVkXnubkgkXnZ7I9+LsIIuIZfFmFtGDCb3mhIGpYZ2sP6VY?=
 =?iso-8859-1?Q?IgshzG+eaHgwuYADebGhF/QG9AsLtaZRRXTtR+5j1hyAbt4qUyatsXAP07?=
 =?iso-8859-1?Q?YDxAiwfk6ppJcmJ8wHHSZsiLLjOCMLOK3wQ50DvwEIAdvDMYxlsddb0v8k?=
 =?iso-8859-1?Q?M7JhY/Nfm/hYMyRiQE7BY5tRK+f1rUgauzXYYYitCvj+aK6JxnbSeksP3w?=
 =?iso-8859-1?Q?yUhVixGElN0LJ4bjO7cvS2ihetUI9j0NF1IdezG1rn/Z/3k2adkNxjVaka?=
 =?iso-8859-1?Q?/DeYHI2WtP16f2u4PAp0UKa2NE9jVY+/yCGmBBp64XtP0a6Y/LeOg/B7BO?=
 =?iso-8859-1?Q?nd5Aih4NH21Eyh9bPvQh3/+0sNtqtnwNdQMoww3xXkHuYgprucM4jFQHkR?=
 =?iso-8859-1?Q?lVEVBWz64PHmFLenjABfXf22uV2CqkcmUlrA/Epn/8L1ewDlYbQX933PdU?=
 =?iso-8859-1?Q?LTbNwlM+AuwXl2DLd90AjYpeojtUPtXIA6BQSK9jSBcqasrk5ZRRWdR4/u?=
 =?iso-8859-1?Q?tkw0KFfnrPuD81HrRZoyUqjPNTptPeqsX1nQ43xCUWqjzyevgixSJaA/Zl?=
 =?iso-8859-1?Q?MQ6sLdAfaoAggkMBaleLiNUWdpDEUvy1KR4x1YgQBjvfe6CNMGelpxIDJN?=
 =?iso-8859-1?Q?6egnOhCEkDZLfjbO+OTNLpR7uTdjS3K3CG8x6V1TdqFpijQy3Rw6KuW5x7?=
 =?iso-8859-1?Q?Ufa+vQxCRtVBBWPjXH4i05KjD4hcSVuch47wKkkCMh2IiVM5T0+y0UekMM?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+iLcXJtkHoZWKRSRKx/+XZOQ1hAYat+ETW/0SFqgPGJToM/uPdfaxRewXy?=
 =?iso-8859-1?Q?GqWqSN5saGJfVFDNT/LImlPyyDEYMJAgGmpeG+zRp9OoPuh9CXYNPUxFHi?=
 =?iso-8859-1?Q?YuidmdZ8gcWilYvwIAk+b/a/jCSZUwsrFKrG864cR3NDPUroDakeEu0IYq?=
 =?iso-8859-1?Q?uwcFVpN/AloN6kHpG1CQiWRcqTCOftAXLnuUaxKYUQ8V4uybhCSvzi7K0n?=
 =?iso-8859-1?Q?p6mN9bunj1s4aa+duJ0UoBNVedLO5xzWaLMOGncPPp1gTBgJZVlGqvX3HH?=
 =?iso-8859-1?Q?+EGp6Qs+cGZ8gNGJ4mIGyOOGVy5POC6bj1f0HR/YmK2PujCmAFxwXwZmFm?=
 =?iso-8859-1?Q?iTkzKQbBPjYgLbNjtbZzrR20g/JmanlfSeJCYAYjUjvFwrnW1k5iuNnPVy?=
 =?iso-8859-1?Q?TBwlwJp+IMfE5yo8sc4aW+rOkT5FDdiICJHc+v9H+yrpvD74n1Y9lz3r/8?=
 =?iso-8859-1?Q?/iqRqESjzT+N9Mo9xOZ54mmOmRRWjUruzGMirjo69XY0DlgWstRTO9wbDh?=
 =?iso-8859-1?Q?PTW+1D7lkIkcXWIqiogNA+JcbfDRqrbTK1aIFdr+tG3R6T7i2AYUnG27OM?=
 =?iso-8859-1?Q?/McFyRgjF7bIC6Z2inW8rDx1GE6jSTDV75fbwBFu1u7zvzvbxaHxgo2tf6?=
 =?iso-8859-1?Q?g65OG608FXdT796T0FI16DLSIJH1B0+vwxSSwAXmuJSgmqfyvNPzeNyyga?=
 =?iso-8859-1?Q?I1R7Fkt5a48eKwOvzRPEfogxzJ2uiHSLPsMueFBAN9AIN72Hp6ONSPEw6o?=
 =?iso-8859-1?Q?5Tir8rKhrLorO4yC5BvBjWKHK/wOwVQyGKT+ajY4eYOP5urms3jqfhpR6F?=
 =?iso-8859-1?Q?IarDCmF4YVrCtAO/X9vIUuZBYDk7sI+rJa0Z3z6p8ROTxlB/K6xA0kxhw4?=
 =?iso-8859-1?Q?A5RMOeLtwjSJZ8QDI2pRXsqgqR7kw0Yd2s7ldtpHRrvCECoHanzPBFTwQR?=
 =?iso-8859-1?Q?5dDs6MFtHRnGjDNk8NoOBMAAuA0cNQV/MaanKBrausbsGTNnRJL5nLSGV4?=
 =?iso-8859-1?Q?iMddZ20NMj63PMzv6/1LbJBLNB7vjR+DC8HJ1AKybeFkvbayaZpBBr7h55?=
 =?iso-8859-1?Q?x0wvnIhkge7Cfn2OPCAlcoO/i8RcbKmx1dAqSe0pu9umCc/1hfGdHRddTK?=
 =?iso-8859-1?Q?k8YQUCDzeHrvmEOw2HlROWNIZnzmxj3GmqX4aREAO+R4BnpWCaZpVUI6IW?=
 =?iso-8859-1?Q?5JiZqdaGAlvjCZfbcoNbARyqWMwILudmBX9pXNOG7wTWB19Nme1vjnGcjz?=
 =?iso-8859-1?Q?RypLdUKixjPdQuRfGKrWRYLgT+A54Co2Ci2jzeOnSr6ybbC20wMDRoURZn?=
 =?iso-8859-1?Q?9U0mnLMJeUYIBkVcNTX7rPzSjwE0/BhLBvYq+9GmUO8wjHfmijVfZ6T221?=
 =?iso-8859-1?Q?o82/pFr4zy0AEHV06YuJsj08PFiHAuDHPdCDBPA3OUjuS3sF032dVcm210?=
 =?iso-8859-1?Q?2iLvq74Y+0O/KST7D0abE5OqK/6SaOOaMrwjrohod+DLw5o1LzL9qqA2Gz?=
 =?iso-8859-1?Q?e7HdzQ7jPg+yWywP+vkVeJ7tAbBJ9NKgYnlh+xK8zrRVF9HzXI3T3bwu8x?=
 =?iso-8859-1?Q?6WcgfWSJigmWIXkZaU6gb+gS4txrOyJm2rEGDMegjJBa6Ad13uWo8gsFL1?=
 =?iso-8859-1?Q?YvumlLJKl59aKdSnJChj4kIxfFANqowXc+DKN4NMvcriyOrw/X+tRQhg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3216da05-ff99-40d5-5acd-08dda9a28fbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 11:16:21.5421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pc8RF9CMjxfOq7eS7eZCLTMVO6koDyhji0NkDFXfELDj6LD2PXOHEEPdIv1y6MilARRoVfTXRn0LZ7CLxqPv2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10784

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

PCI host bridges often have different ways to access the root and child
bus configuration spaces. One of the examples is Designware's host bridge
and its multiple clones [1].

Linux kernel implements this by instantiating a child bus when device
drivers provide not only the usual pci_ops to access ECAM space (this is
the case for the generic host bridge), but also means to access the child
bus which has a dedicated configuration space and own implementation for
accessing the bus, e.g. child_ops.

For Xen it is not feasible to fully implement PCI bus infrastructure as
Linux kernel does, but still child bus can be supported.

Add support for the PCI child bus which includes the following changes:
- introduce bus mapping functions depending on SBDF
- assign bus start and end for the child bus and re-configure the same for
  the parent (root) bus
- make pci_find_host_bridge be aware of multiple busses behind the same bri=
dge
- update pci_host_bridge_mappings, so it also doesn't map to guest the memo=
ry
  spaces belonging to the child bus
- make pci_host_common_probe accept one more pci_ops structure for the chil=
d bus
- install MMIO handlers for the child bus for hardware domain
- re-work vpci_mmio_{write|read} with parent and child approach in mind

[1] https://elixir.bootlin.com/linux/v5.15/source/drivers/pci/controller/dw=
c

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v5->v6:
* no change

v4->v5:
* fix formatting
* move init_bus_range inside pci_ops
* fix logic error in pci_host_bridge_mappings again

v3->v4:
* remove changes to pci_ecam_map_bus
* make map_bus inline
* fix logic error in pci_host_bridge_mappings

v2->v3:
* no change

v1->v2:
* fixed compilation issues
---
 xen/arch/arm/include/asm/pci.h      | 20 ++++++-
 xen/arch/arm/pci/ecam.c             |  1 +
 xen/arch/arm/pci/pci-access.c       | 37 ++++++++++--
 xen/arch/arm/pci/pci-host-common.c  | 84 +++++++++++++++++++++-----
 xen/arch/arm/pci/pci-host-generic.c |  2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  |  3 +-
 xen/arch/arm/vpci.c                 | 91 +++++++++++++++++++++++------
 7 files changed, 194 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 061d9810af..3772d7c7d2 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -67,6 +67,9 @@ struct pci_host_bridge {
     uint16_t segment;                /* Segment number */
     struct pci_config_window* cfg;   /* Pointer to the bridge config windo=
w */
     const struct pci_ops *ops;
+    /* Child bus */
+    struct pci_config_window *child_cfg;
+    const struct pci_ops *child_ops;
     void *priv;                      /* Private data of the bridge. */
 };
=20
@@ -80,6 +83,9 @@ struct pci_ops {
     bool (*need_p2m_hwdom_mapping)(struct domain *d,
                                    struct pci_host_bridge *bridge,
                                    uint64_t addr);
+    void (*init_bus_range)(struct dt_device_node *dev,
+                           struct pci_host_bridge *bridge,
+                           struct pci_config_window *cfg);
 };
=20
 /*
@@ -96,8 +102,10 @@ struct pci_ecam_ops {
 /* Default ECAM ops */
 extern const struct pci_ecam_ops pci_generic_ecam_ops;
=20
-struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
-                                              const struct pci_ecam_ops *o=
ps);
+struct pci_host_bridge *
+pci_host_common_probe(struct dt_device_node *dev,
+                      const struct pci_ecam_ops *ops,
+                      const struct pci_ecam_ops *child_ops);
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value);
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
@@ -133,6 +141,14 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t s=
tart, mfn_t end);
 static inline int pci_sanitize_bar_memory(struct rangeset *r)
 { return 0; }
=20
+void pci_generic_init_bus_range(struct dt_device_node *dev,
+                                struct pci_host_bridge *bridge,
+                                struct pci_config_window *cfg);
+
+void pci_generic_init_bus_range_child(struct dt_device_node *dev,
+                                      struct pci_host_bridge *bridge,
+                                      struct pci_config_window *cfg);
+
 #else   /*!CONFIG_HAS_PCI*/
=20
 struct pci_dev;
diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
index 3987f96b01..c979af7302 100644
--- a/xen/arch/arm/pci/ecam.c
+++ b/xen/arch/arm/pci/ecam.c
@@ -60,6 +60,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops =3D {
         .read                   =3D pci_generic_config_read,
         .write                  =3D pci_generic_config_write,
         .need_p2m_hwdom_mapping =3D pci_ecam_need_p2m_hwdom_mapping,
+        .init_bus_range         =3D pci_generic_init_bus_range,
     }
 };
=20
diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index 9f9aac43d7..4a94867501 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -18,10 +18,31 @@
 #define INVALID_VALUE (~0U)
 #define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
=20
+static const struct pci_ops *get_ops(struct pci_host_bridge *bridge,
+                                     pci_sbdf_t sbdf)
+{
+    if ( bridge->child_ops )
+    {
+        struct pci_config_window *cfg =3D bridge->child_cfg;
+
+        if ( (sbdf.bus >=3D cfg->busn_start) && (sbdf.bus <=3D cfg->busn_e=
nd) )
+            return bridge->child_ops;
+    }
+    return bridge->ops;
+}
+
+static inline void __iomem *map_bus(struct pci_host_bridge *bridge,
+                                    pci_sbdf_t sbdf, uint32_t reg)
+{
+    const struct pci_ops *ops =3D get_ops(bridge, sbdf);
+
+    return ops->map_bus(bridge, sbdf, reg);
+}
+
 int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbd=
f,
                             uint32_t reg, uint32_t len, uint32_t *value)
 {
-    void __iomem *addr =3D bridge->ops->map_bus(bridge, sbdf, reg);
+    void __iomem *addr =3D map_bus(bridge, sbdf, reg);
=20
     if ( !addr )
     {
@@ -50,7 +71,7 @@ int pci_generic_config_read(struct pci_host_bridge *bridg=
e, pci_sbdf_t sbdf,
 int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
                              uint32_t reg, uint32_t len, uint32_t value)
 {
-    void __iomem *addr =3D bridge->ops->map_bus(bridge, sbdf, reg);
+    void __iomem *addr =3D map_bus(bridge, sbdf, reg);
=20
     if ( !addr )
         return -ENODEV;
@@ -78,14 +99,16 @@ static uint32_t pci_config_read(pci_sbdf_t sbdf, unsign=
ed int reg,
 {
     uint32_t val =3D PCI_ERR_VALUE(len);
     struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, sbdf=
.bus);
+    const struct pci_ops *ops;
=20
     if ( unlikely(!bridge) )
         return val;
=20
-    if ( unlikely(!bridge->ops->read) )
+    ops =3D get_ops(bridge, sbdf);
+    if ( unlikely(!ops->read) )
         return val;
=20
-    bridge->ops->read(bridge, sbdf, reg, len, &val);
+    ops->read(bridge, sbdf, reg, len, &val);
=20
     return val;
 }
@@ -94,14 +117,16 @@ static void pci_config_write(pci_sbdf_t sbdf, unsigned=
 int reg,
                              unsigned int len, uint32_t val)
 {
     struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, sbdf=
.bus);
+    const struct pci_ops *ops;
=20
     if ( unlikely(!bridge) )
         return;
=20
-    if ( unlikely(!bridge->ops->write) )
+    ops =3D get_ops(bridge, sbdf);
+    if ( unlikely(!ops->write) )
         return;
=20
-    bridge->ops->write(bridge, sbdf, reg, len, val);
+    ops->write(bridge, sbdf, reg, len, val);
 }
=20
 /*
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index 53953d4895..487c545f3a 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -57,17 +57,12 @@ static void pci_ecam_free(struct pci_config_window *cfg=
)
     xfree(cfg);
 }
=20
-static struct pci_config_window * __init
-gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
+void __init pci_generic_init_bus_range(struct dt_device_node *dev,
+                                       struct pci_host_bridge *bridge,
+                                       struct pci_config_window *cfg)
 {
-    int err, cfg_reg_idx;
     u32 bus_range[2];
-    paddr_t addr, size;
-    struct pci_config_window *cfg;
-
-    cfg =3D xzalloc(struct pci_config_window);
-    if ( !cfg )
-        return NULL;
+    int err;
=20
     err =3D dt_property_read_u32_array(dev, "bus-range", bus_range,
                                      ARRAY_SIZE(bus_range));
@@ -82,6 +77,35 @@ gen_pci_init(struct dt_device_node *dev, const struct pc=
i_ecam_ops *ops)
         if ( cfg->busn_end > cfg->busn_start + 0xff )
             cfg->busn_end =3D cfg->busn_start + 0xff;
     }
+}
+
+void __init pci_generic_init_bus_range_child(struct dt_device_node *dev,
+                                             struct pci_host_bridge *bridg=
e,
+                                             struct pci_config_window *cfg=
)
+{
+    cfg->busn_start =3D bridge->cfg->busn_start + 1;
+    cfg->busn_end =3D bridge->cfg->busn_end;
+    bridge->cfg->busn_end =3D bridge->cfg->busn_start;
+
+    printk(XENLOG_INFO "Root bus end updated: [bus %x-%x]\n",
+           bridge->cfg->busn_start, bridge->cfg->busn_end);
+}
+
+static struct pci_config_window *__init
+gen_pci_init(struct dt_device_node *dev, struct pci_host_bridge *bridge,
+             const struct pci_ecam_ops *ops)
+{
+    int err, cfg_reg_idx;
+    paddr_t addr, size;
+    struct pci_config_window *cfg;
+
+    cfg =3D xzalloc(struct pci_config_window);
+    if ( !cfg )
+        return NULL;
+    if ( !ops || !ops->pci_ops.init_bus_range )
+        goto err_exit;
+
+    ops->pci_ops.init_bus_range(dev, bridge, cfg);
=20
     if ( ops->cfg_reg_index )
     {
@@ -208,8 +232,10 @@ static int pci_bus_find_domain_nr(struct dt_device_nod=
e *dev)
     return domain;
 }
=20
-struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
-                                              const struct pci_ecam_ops *o=
ps)
+struct pci_host_bridge *
+pci_host_common_probe(struct dt_device_node *dev,
+                      const struct pci_ecam_ops *ops,
+                      const struct pci_ecam_ops *child_ops)
 {
     struct pci_host_bridge *bridge;
     struct pci_config_window *cfg;
@@ -224,7 +250,7 @@ struct pci_host_bridge *pci_host_common_probe(struct dt=
_device_node *dev,
         return ERR_PTR(-ENOMEM);
=20
     /* Parse and map our Configuration Space windows */
-    cfg =3D gen_pci_init(dev, ops);
+    cfg =3D gen_pci_init(dev, bridge, ops);
     if ( !cfg )
     {
         err =3D -ENOMEM;
@@ -242,10 +268,28 @@ struct pci_host_bridge *pci_host_common_probe(struct =
dt_device_node *dev,
         BUG();
     }
     bridge->segment =3D domain;
+
+    if ( child_ops )
+    {
+        /* Parse and map child's Configuration Space windows */
+        cfg =3D gen_pci_init(dev, bridge, child_ops);
+        if ( !cfg )
+        {
+            err =3D -ENOMEM;
+            goto err_child;
+        }
+
+        bridge->child_cfg =3D cfg;
+        bridge->child_ops =3D &child_ops->pci_ops;
+    }
+
     pci_add_host_bridge(bridge);
=20
     return bridge;
=20
+err_child:
+    xfree(bridge->cfg);
+
 err_exit:
     xfree(bridge);
=20
@@ -280,9 +324,12 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t =
segment, uint8_t bus)
     {
         if ( bridge->segment !=3D segment )
             continue;
-        if ( (bus < bridge->cfg->busn_start) || (bus > bridge->cfg->busn_e=
nd) )
-            continue;
-        return bridge;
+        if ( bridge->child_cfg && (bus >=3D bridge->child_cfg->busn_start)=
 &&
+             (bus <=3D bridge->child_cfg->busn_end) )
+            return bridge;
+        if ( (bus >=3D bridge->cfg->busn_start) &&
+             (bus <=3D bridge->cfg->busn_end) )
+            return bridge;
     }
=20
     return NULL;
@@ -348,6 +395,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
     {
         const struct dt_device_node *dev =3D bridge->dt_node;
         unsigned int i;
+        bool need_mapping;
=20
         for ( i =3D 0; i < dt_number_of_address(dev); i++ )
         {
@@ -363,7 +411,11 @@ int __init pci_host_bridge_mappings(struct domain *d)
                 return err;
             }
=20
-            if ( bridge->ops->need_p2m_hwdom_mapping(d, bridge, addr) )
+            need_mapping =3D bridge->ops->need_p2m_hwdom_mapping(d, bridge=
, addr);
+            if ( !need_mapping && bridge->child_ops )
+                need_mapping =3D
+                    bridge->child_ops->need_p2m_hwdom_mapping(d, bridge, a=
ddr);
+            if ( need_mapping )
             {
                 err =3D map_range_to_domain(dev, addr, size, &mr_data);
                 if ( err )
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-hos=
t-generic.c
index a6ffbda174..47cf144831 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pc=
i_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops));
+    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops, NULL)=
);
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host=
-zynqmp.c
index a38f2e019e..2c4afa7a19 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -35,6 +35,7 @@ const struct pci_ecam_ops nwl_pcie_ops =3D {
         .read                   =3D pci_generic_config_read,
         .write                  =3D pci_generic_config_write,
         .need_p2m_hwdom_mapping =3D pci_ecam_need_p2m_hwdom_mapping,
+        .init_bus_range         =3D pci_generic_init_bus_range,
     }
 };
=20
@@ -47,7 +48,7 @@ static const struct dt_device_match __initconstrel nwl_pc=
ie_dt_match[] =3D
 static int __init pci_host_generic_probe(struct dt_device_node *dev,
                                          const void *data)
 {
-    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops));
+    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops, NULL));
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 0ce11ffcc5..d41aa383a8 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -8,15 +8,17 @@
 #include <asm/mmio.h>
=20
 static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
-                                     paddr_t gpa)
+                                     paddr_t gpa, bool use_root)
 {
     pci_sbdf_t sbdf;
=20
     if ( bridge )
     {
-        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
+        const struct pci_config_window *cfg =3D use_root ? bridge->cfg
+                                                       : bridge->child_cfg=
;
+        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - cfg->phys_addr);
         sbdf.seg =3D bridge->segment;
-        sbdf.bus +=3D bridge->cfg->busn_start;
+        sbdf.bus +=3D cfg->busn_start;
     }
     else
         sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
@@ -24,18 +26,14 @@ static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_h=
ost_bridge *bridge,
     return sbdf;
 }
=20
-static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
-                          register_t *r, void *p)
+static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info, register_t *r=
,
+                          pci_sbdf_t sbdf)
 {
-    struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
     const unsigned int access_size =3D (1U << info->dabt.size) * 8;
     const register_t invalid =3D GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
=20
-    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
-
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -48,33 +46,86 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *=
info,
     return 0;
 }
=20
-static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
-                           register_t r, void *p)
+static int vpci_mmio_read_root(struct vcpu *v, mmio_info_t *info, register=
_t *r,
+                               void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, true);
+
+    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
+
+    return vpci_mmio_read(v, info, r, sbdf);
+}
+
+static int vpci_mmio_read_child(struct vcpu *v, mmio_info_t *info,
+                                register_t *r, void *p)
 {
     struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, false);
=20
     ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
=20
+    return vpci_mmio_read(v, info, r, sbdf);
+}
+
+static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info, register_t r=
,
+                           pci_sbdf_t sbdf)
+{
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
 }
=20
+static int vpci_mmio_write_root(struct vcpu *v, mmio_info_t *info, registe=
r_t r,
+                                void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, true);
+
+    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
+
+    return vpci_mmio_write(v, info, r, sbdf);
+}
+
+static int vpci_mmio_write_child(struct vcpu *v, mmio_info_t *info,
+                                 register_t r, void *p)
+{
+    struct pci_host_bridge *bridge =3D p;
+    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa, false);
+
+    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
+
+    return vpci_mmio_write(v, info, r, sbdf);
+}
+
 static const struct mmio_handler_ops vpci_mmio_handler =3D {
-    .read  =3D vpci_mmio_read,
-    .write =3D vpci_mmio_write,
+    .read =3D vpci_mmio_read_root,
+    .write =3D vpci_mmio_write_root,
+};
+
+static const struct mmio_handler_ops vpci_mmio_handler_child =3D {
+    .read =3D vpci_mmio_read_child,
+    .write =3D vpci_mmio_write_child,
 };
=20
 static int vpci_setup_mmio_handler_cb(struct domain *d,
                                       struct pci_host_bridge *bridge)
 {
     struct pci_config_window *cfg =3D bridge->cfg;
+    int count =3D 1;
=20
     register_mmio_handler(d, &vpci_mmio_handler,
                           cfg->phys_addr, cfg->size, bridge);
=20
-    /* We have registered a single MMIO handler. */
-    return 1;
+    if ( bridge->child_ops )
+    {
+        struct pci_config_window *child_cfg =3D bridge->child_cfg;
+
+        register_mmio_handler(d, &vpci_mmio_handler_child, child_cfg->phys=
_addr,
+                              child_cfg->size, bridge);
+        count++;
+    }
+
+    return count;
 }
=20
 int domain_vpci_init(struct domain *d)
@@ -105,8 +156,12 @@ int domain_vpci_init(struct domain *d)
 static int vpci_get_num_handlers_cb(struct domain *d,
                                     struct pci_host_bridge *bridge)
 {
-    /* Each bridge has a single MMIO handler for the configuration space. =
*/
-    return 1;
+    int count =3D 1;
+
+    if ( bridge->child_cfg )
+        count++;
+
+    return count;
 }
=20
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
--=20
2.34.1

