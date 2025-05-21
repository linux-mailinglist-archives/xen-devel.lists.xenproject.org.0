Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE849ABF441
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 14:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991777.1375625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiS8-0000Vw-BU; Wed, 21 May 2025 12:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991777.1375625; Wed, 21 May 2025 12:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiS8-0000OK-7W; Wed, 21 May 2025 12:21:44 +0000
Received: by outflank-mailman (input) for mailman id 991777;
 Wed, 21 May 2025 12:21:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ic9M=YF=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uHiS7-0008Qd-1n
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 12:21:43 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2606::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26e5ef16-363e-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 14:21:41 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9644.eurprd03.prod.outlook.com
 (2603:10a6:102:2e3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 12:21:31 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:21:31 +0000
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
X-Inumbo-ID: 26e5ef16-363e-11f0-a2fa-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFgDtlU/gmiys/eIUJZVxrQPFzTXEq0nBg30JLgczK1pZ+r7yUVMvog2sQK4TZ/+gLBJ3Bb5KBZ6RYktLEX8MQbTLK3c8L26PEZMhhkp9il2QMe+czYJoUlEYy7sixSdY3bTKcJa+6QacNHQcGOfh7t4lu3nZLUvAXjKSHpcHGYM5LzEu9Ac2vRLskPJgJ3vm9aznpAcey0dXemXpHvwYZlbl/WdpSOTT4O5rjneOz3p3OnvjS6qpSIm44Cwq8gDPvgrnbSk0mBiJvc+1/Y6fqgnRRsu6hYWqBO+OzRbFDlwhpWPtA6PnM1tZ1z2NuB/9+YtCo7M7LPS2sJKNtafAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yIOmdLyF6w2oLxwUbcDWdA2217xBALXqLqQvHNKfxA=;
 b=UnwCxEj6+PIgt9199n+ABLFtk5H5sjYSGzLSBpLaptTMDXJ48R6Pz1FMAvA7dlioNBnix3BbrWQ6H843hETSPKAfTFuwqM1CtLrGh4UqCR/gO9W6IVqH7VGT2Uhf3CX5COVWTd8ICEMTX+DxXOfgirVH0oy1SpKD+/6UggO0Yk9z3bFPAdc6WzEGyL5zWUH7zgR4Bd12yNLIZrEQUhhzDL71Gz8nIqGw1Bn/VTI4bGfLUQM+jkjhhr53U0vmX0729bXx+REwMY1t0Bj+arFp2yNK7FnIJfXry2QSHsKRJrahNoCyD3KA9tNqNznLqvU5UEvKWNNdPO3PqHyMfHve9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yIOmdLyF6w2oLxwUbcDWdA2217xBALXqLqQvHNKfxA=;
 b=CyKzxE45csirnsQIn0tuXSRuoBxohn+c3W8VXZJoU1T+bn1GUUilAsMYtB+dMy1X6MxakrSrwa8wSIc5kcKHFtmA2EVArSp5NQHoWAY/v1AmYoUNMyiV7EXGw9Cq5N6QF7YkJfrASy5T5BGk08VDUyTTOCrf4IUWlrrwX1aw7zTWkJQXsvwEPudShQP4BvFNfhjFZSlG52kuI01tWSRfYLr5/a72Es1OwuQMzluNEocVhZK8cqGMjd6nj5Ei0Cf0L/R4/JDlvcKDyah42WpURnyLEKLVplDQuSg9TXQ3Vygfxn+oUC+R4Ft1fC85LELt/pf/zoNC5RLLhM5dAr/fYw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v5 0/4] Add support for R-Car Gen4 PCI host controller
Thread-Topic: [PATCH v5 0/4] Add support for R-Car Gen4 PCI host controller
Thread-Index: AQHbykri8+u9hNG+1kmy/z9Y016O8A==
Date: Wed, 21 May 2025 12:21:31 +0000
Message-ID: <cover.1747820844.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9644:EE_
x-ms-office365-filtering-correlation-id: f88e3e95-eafd-47f6-9543-08dd98620526
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7SytwQKlAhubC9RDREMwfric3YReZ3vzQKP0dD/as3B53XE4Cxv3xw8I6T?=
 =?iso-8859-1?Q?VCvBTkPZSyVJYIGNh2nnL+wW4w8e83zUQh4kOe4qilTgDk4Nyz29mjsTeq?=
 =?iso-8859-1?Q?rYjYdpX1nx7UiQtpb9N6XIf/pFCZ4tjo52HVL5HMH2o5GzktiMDF14lQW4?=
 =?iso-8859-1?Q?BTdCwosjUccj+atLaR5td29HdgZo6DeZS01YmS1bgy9kL1zzRzaKYwJtoc?=
 =?iso-8859-1?Q?g7C4eKHAcWlq2VbJxdaQfQ+FC/AIJNuUHSs2PRGLkOQ6Wg+uYwpU5+Nb9w?=
 =?iso-8859-1?Q?Zk28EHtbUVpdsJh0RqVyubqUvWsrp2Jv0M5yemhToNTjIcoEsbn1EZXdZE?=
 =?iso-8859-1?Q?cWU5WbThAShlkw09/A1V6isj6mXkX3SfBRu0f5J1MRkOd5j3i4edgymHMJ?=
 =?iso-8859-1?Q?misuSEoSWK31RyazxxqJUekq2w4xlufbcNXbmi2Nc+brvM5SEVIOieR5ku?=
 =?iso-8859-1?Q?9WfgbtegYbJn9gS+lvwEULJgJJO3ZwkM6pmuejpad0aZaioQOIdvgC2T5G?=
 =?iso-8859-1?Q?KzhEv5n0BZnnleVgS+WIH8gT0ksVR89tUihE133EUjgZEULVWzE/Vx6R/I?=
 =?iso-8859-1?Q?TwVaBed1RL+LsVyIjsSAS12aIORxy6sZpWR+36GYZCZXg4k4AbBfhFfQTm?=
 =?iso-8859-1?Q?s+EHYy+9qccp6VRnUb3BfConRC89qBkiqxGqzu+3XMd2zUBv/mmKSKR5cB?=
 =?iso-8859-1?Q?tXnrcguIZt2elA3pNAqpSz/pXllvWU4ZTLenBuPSWHyEXY1EVC4ynI2vUR?=
 =?iso-8859-1?Q?gZjCJK75KUZqjckB1bT7ls19wVxJs3bZoavz3TTEWgN3ekv8EAuwjFNQP/?=
 =?iso-8859-1?Q?ZlX5ladbz1OdVMucgsPxQI2aM5uovdp313BTMM5erqUI1WxDiodEp2vh4z?=
 =?iso-8859-1?Q?GetziBl4go6CR7daui9jUO5Zxef3ORks/0T87bwBCXo81DcCAoQ1KtAWJb?=
 =?iso-8859-1?Q?g8IXT2GPAMljuPLwQgocbPDOJP856eIVF80X1jyhOmpphB/gnKakOuN+dL?=
 =?iso-8859-1?Q?QcvynFPCw28a2kV6ukaUs9LKb8PzodGshETpnHXIUHWSN/1VoXG6dm8FhH?=
 =?iso-8859-1?Q?TQukrSErI+BLjWMeFsASuqrEH4hbWol/cJ5m9eV60i+u5cOLeonTkGU2mb?=
 =?iso-8859-1?Q?3wIpdsCN+L9iUClbVgPfk3QmtZDwIzezDTqQs1g60NrmAuozVcWlqjA28k?=
 =?iso-8859-1?Q?cMottq8+oBKP38JJlyR2WxO1pShoQSQTK2b3hoouHxAWf7pnwWB9xctTTy?=
 =?iso-8859-1?Q?KITN8KEUh1U+5WGiWB4BWleuX83e3I2uuHS38D7X4Lb6NF5S3vQjkqFbQi?=
 =?iso-8859-1?Q?lS5JG/dXDwrc+9Yo6p5beE4gforhL1UparP973hznAFRdDj1T7TRItotCt?=
 =?iso-8859-1?Q?xL5CQl5op51wa31EKdWVTsMfyWWcWAOAQTIC0CbCzfvRyvaEESEIlKMuiV?=
 =?iso-8859-1?Q?oOb0p7jxr7P4zIj3Odpmc/kOoTSGR/3kFt3wV/+ghfbX/bW5fHMMEjY3EE?=
 =?iso-8859-1?Q?g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yFgKQuXndxXomhoXpc+QYZS4jurmpIuH6MztRvPG40UALmHkWZrKf5CmFW?=
 =?iso-8859-1?Q?Nfy1P3GHvN48OLzAe5k5Kir5pTw7xJuf7qtRxoyjkJcI8PeN4j5I2lxCmd?=
 =?iso-8859-1?Q?zm+nCnGc8w1Oi8M4+OKHluQOoY142Jg5NbGns781gJ1xr5E39MYMw8HUQd?=
 =?iso-8859-1?Q?Py6WRb/erPEdxxxA1MxmJOP/FCPs5oop0NkIveN4h/c/9xgwhAREARXDG2?=
 =?iso-8859-1?Q?y7MuOPD2Sh7vUglQcORBrb1K8My5T/mhIjjMMF8sxjq/bEDELXKtV3MMmk?=
 =?iso-8859-1?Q?xPSVG+7TuAJMzzrEdpLeD8S8ZF7AjmWd2O8DxXuH1cRYx/hJgTLvGRhYJl?=
 =?iso-8859-1?Q?q0J0HMxBhCsQofjaqyLR7d85N2K9LPQQQblQM8BSxnvs7pwqJZTtPRfqWF?=
 =?iso-8859-1?Q?pNr5U13B8vJQPV6LdZCqq/DDBfvMeeOtCcp4UuoTRsIGv7f1FX80+bKk2S?=
 =?iso-8859-1?Q?B5mebVY9JlFT4tN0ulsCkam0lSCw9nFkNhLbHgWc4c6mim3pkH7DxlaSgL?=
 =?iso-8859-1?Q?6N2yZXVKkQGWpS8IF+rF2ctTpbEUIhQf0RMopqbuVT/e2num9Ksi94sNtn?=
 =?iso-8859-1?Q?g7NNq1hHRShVin0Yb/CapiRW9zoiUnwQi7cq/1Rum5VeXNiBs/gdfitQwF?=
 =?iso-8859-1?Q?QjcqpZ7TUXD63GBASxT/JWuyY/Q1AQo/fgAbEhvet06picJaUs10VhZ9Ub?=
 =?iso-8859-1?Q?10A80koLng9hD6k9e+mFL7T4e0YGQJjm864QGJ/3xXClFftZRSDMJwWQfF?=
 =?iso-8859-1?Q?olrB93wZml3LNR2gqF+rRs3RBUGkAWxA20HZVVbIw9yTJyxPN64gWatTc0?=
 =?iso-8859-1?Q?YoPgb5/j/QsQno2dZ9hO2lvV+I0Ve/oQ/fAdK9aZIyHbDHVca7QyKMVc1Q?=
 =?iso-8859-1?Q?FpZVoXWJ8m86GWcy3vYC4y8yW7uJobnSp9+ISd2dhObfEq5TvYegl13zm1?=
 =?iso-8859-1?Q?3kOC2Ela43Ih7fkXMYd/nf2gKvTj0h4BVfgmznxhDF0pGG6vGl16oKCJ3W?=
 =?iso-8859-1?Q?zAta5wFyi1avRHL7eDB3mryzhrPy4GLAt/0UN2KGu5Vm/nPfUDb9t/PopE?=
 =?iso-8859-1?Q?ChB7lSEoFEa9YfUIz/sh83BzrqPVtsXVev+NFJLMM0RsjkcSZ6uacm+jNd?=
 =?iso-8859-1?Q?geFfbiJBkTjNHUJ+mK+B0Lc6YlcA1bwKzdUKYDuag4ehjQUgf6H1LCGqyp?=
 =?iso-8859-1?Q?wbVyzk/lMDcIj6zrt2WJzKyCf82KDFiH5XnAOI+UNFnoMCIQG4kp+rIlHd?=
 =?iso-8859-1?Q?WEKJ5++iZwDhhjeZtwx2mMpC7haFE0wg0FFDSOmmjdcU8JfNsUg5g1/Pgj?=
 =?iso-8859-1?Q?yLktFZ+rE64hbZvDRr1zbpd/YszX7z/qpmeSLx9FJ2k5htCEflxhjZu/OR?=
 =?iso-8859-1?Q?ylIgaYzBtk8ZpmSSuwBLdB9kWRQNI+XyE+acTffdVJllS2/klxkPAnytsZ?=
 =?iso-8859-1?Q?sZfeCS9IIj/mDs9TnJvwgTAvdr3yROGuKEhRBjDOGCwm/KclLoB9ZowmmV?=
 =?iso-8859-1?Q?0eDnRgEVRi9/5PnUTup56WnIYM3HWFK4TpauwHtFmvCsIB6bqJACtxWwjG?=
 =?iso-8859-1?Q?tYc7xSaNN++U+ORq7RdVW8HtW6Wz9Y3fZzJNCUXbfmHVUA65CoI4Dsd915?=
 =?iso-8859-1?Q?MzvHoRqsfToapsffZLRjbdvfpaUpsP/hvipqfbdyw7/9W+6t0lTBTb7Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f88e3e95-eafd-47f6-9543-08dd98620526
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 12:21:31.6781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qEoycf06iLsj7P6UeMTtv2DoZGwdEvhVHQBOBlei2B/aJQMf3NQEaJ+IGKZ6BNgu+76ddMaT3TNOUMxmIJrHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9644

This series adds support for R-Car Gen4 PCI host controller.

To fully support the controller, the following changes were made:
- Generic mechanism to support PCI child buses is added.
- Private data for PCI host bridge and means to access it are added.

The series was tested as a part of the pci-passthrough patches[1] and
build-tested standalone with enabled HAS_PCI and HAS_VPCI.
CI pipeline results: [2]

[1]: https://github.com/Deedone/xen/tree/pci_passthrough_wip
[2]: https://gitlab.com/xen-project/people/mpoturai/xen/-/pipelines/1828720=
661

v4->v5:
* see individual patches

v3->v4:
* rebase
* see individual patches

v2->v3:
* dropped patches related to ATU programming delay
* improved formatting

v1->v2:
* see individual patches

Oleksandr Andrushchenko (4):
  xen/arm: allow PCI host bridge to have private data
  xen/arm: make pci_host_common_probe return the bridge
  xen/arm: add support for PCI child bus
  xen/arm: add support for R-Car Gen4 PCI host controller

 MAINTAINERS                         |   6 +
 xen/arch/arm/include/asm/pci.h      |  22 +-
 xen/arch/arm/pci/Makefile           |   2 +
 xen/arch/arm/pci/ecam.c             |   1 +
 xen/arch/arm/pci/pci-access.c       |  37 ++-
 xen/arch/arm/pci/pci-designware.c   | 416 ++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-designware.h   |  90 ++++++
 xen/arch/arm/pci/pci-host-common.c  |  92 ++++--
 xen/arch/arm/pci/pci-host-generic.c |   2 +-
 xen/arch/arm/pci/pci-host-rcar4.c   |  94 +++++++
 xen/arch/arm/pci/pci-host-zynqmp.c  |   3 +-
 xen/arch/arm/vpci.c                 |  91 ++++--
 12 files changed, 808 insertions(+), 48 deletions(-)
 create mode 100644 xen/arch/arm/pci/pci-designware.c
 create mode 100644 xen/arch/arm/pci/pci-designware.h
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

--=20
2.34.1

