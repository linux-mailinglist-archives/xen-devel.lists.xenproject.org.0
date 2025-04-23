Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8222A98820
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:08:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964353.1355169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Xxb-00022v-Ez; Wed, 23 Apr 2025 11:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964353.1355169; Wed, 23 Apr 2025 11:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Xxb-0001zm-C6; Wed, 23 Apr 2025 11:08:11 +0000
Received: by outflank-mailman (input) for mailman id 964353;
 Wed, 23 Apr 2025 11:08:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hoPD=XJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u7Xxa-0001zZ-9V
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:08:10 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d40be9e-2033-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 13:08:09 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB9841.eurprd03.prod.outlook.com
 (2603:10a6:20b:61a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 11:08:06 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 11:08:06 +0000
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
X-Inumbo-ID: 3d40be9e-2033-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhR0q1EZZ0sZ9PkjFbTS+37eI79uCuklIy+fuAcVEJQq5J27Cu+9mAEoK2cJ2gJ89O6Nleyr9DoiMiqt75z8gprAtBOZpjpl4Zf57uJWXW87PnIh7woYIY1Dxra4SM73I+q+0VZT+eQbzYDMhImenI6xD85AYkbRQ1p/9pnTX0WR1wZczCEzd6KO29Nj3fsyWKZJZntp/JXuroN8hXVKWCUflW69/Z+X89JZHc3YPjML77x+gT472pk7IIzBQeOZ22dEybWHL+5zZAbbhbDfqORqblzwsWKp4jaw6wotyCBE2bjkWjnjKzpFl2xH9DXE/VlRBM2m6VMYLoj5+J1iOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzFvdTrWI9k4XbZXhcy7XpTmfE8YYnmbm/Dv2U2tu7A=;
 b=IF4QG/H1jG2g4jSg0q3c9eq8O+xrL/BaiOsTgFKCWTCOIwH1bRI7j9Webcg+PN19wTaZQtvHEhn0IVkt0Ts1NI4qIviR38+x4sUXuVfnWvYWsCPr84rosyQk3izFyOvkACPKx/TSYMhXrK0RssyHvQyczcDE9DsfNLeURYRbqx0aqNZwLDhdVtyobt+DUBj1re1eoS0/xuZU88uodmhswnio05yUKhCtOAtf0BsNMZ7ZUI3xSQbHNEJjfto3F3ABY6ju6vwYc3wdICnmriebRLcCKda0RK4jpBC+k4tUhqNARlvXkQM2Lh0p+u5+3mH55KnZ1IDja5to7z7v2za+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzFvdTrWI9k4XbZXhcy7XpTmfE8YYnmbm/Dv2U2tu7A=;
 b=d3fgWI5OTryp0cfZwZx4nQheDGrrOZ8RCSbfxHRQCNoEfGzuORo6uNUqZDlSHczB1S3JrCbyIjOI8AaM2hHRKs54YDazJS3Zi1zbwiwd05mOGS87CcwJgmeqrAmsWqz5x7gkiWIEAka6+6MydS3Hu88tnbybSEjEO7Anoq03n9p1TXShdMZJ2Dv6lgXW18ArjYJMhU1JZwmYdKT4vSOMkNH7YJXbtCdcFhv2FeMg5c0EvCcke+YkX20paRhoZcixcMYJ+jGdyOTdBTunMPQyQtiTtjPZ3R72lUWUHWv6icF3VgKMWYYkji/TWPHa6nj5mh6GJFssZ6r/Ytw+7aG3Yg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 0/4] Add support for R-Car Gen4 PCI host controller
Thread-Topic: [PATCH v4 0/4] Add support for R-Car Gen4 PCI host controller
Thread-Index: AQHbtD/9healTf8EwEODhly5/C64XQ==
Date: Wed, 23 Apr 2025 11:08:06 +0000
Message-ID: <cover.1745402473.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB9841:EE_
x-ms-office365-filtering-correlation-id: 035ed0c0-ed99-4ec0-e151-08dd82571fef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?c6CQBnpSt33zgqSAXyO73dTRoDgCg2M92b9Sj4IKsXM/jlWADashHd1MwW?=
 =?iso-8859-1?Q?/ew/x0AihrenEQTBsxyWoxVrIiyMtma4t/HzuZyejQwp6OSOpFLtyAayes?=
 =?iso-8859-1?Q?vd77zbe+WahsNQ5MxfD7yqn7dQ/NgUKby9e6atE08UiHSW1KiMEZa3uaB/?=
 =?iso-8859-1?Q?f5bfPSQ6L9wfWdEPaMtagLngf2uNQqIpnxm8QRBHQiKa1ItL/5Vn8SbTms?=
 =?iso-8859-1?Q?FfW7yEtHAjYSzICXVAsOAhZMuTr9rT608Fum3wOkuZPPPzLo7IZ6QEWZQw?=
 =?iso-8859-1?Q?1C4DIowGu776Fe+YtGvASBqAs7eRqBm43V89xB65vgXdL+p/2n78TH/8Ni?=
 =?iso-8859-1?Q?A1Vs/AtTNaGXLInJxl1KOYuNKe8mv5/fqjaI89jBjXzui57UTSgLyLS9lf?=
 =?iso-8859-1?Q?fCS7zqoWNWGcbwkJrXZZIATH+kc188n1XrVamwMusvhRquvCHcYj4o6cB4?=
 =?iso-8859-1?Q?IX41cPpy4mgQ0RmZHK+9V8ygQCXoBoHkIO5Wp+U5RQrPzrpbWTUzjI/PPb?=
 =?iso-8859-1?Q?A7WCqNEaCT4eLQKyFBcNVkRK6xYCNNcrrtVj74389t48wSYdcAbWehusnn?=
 =?iso-8859-1?Q?hul16Bs/iRIjVSmQXjfmFquC0sttttKbvXlFTTbTqsteS8QN5Mk950gBAT?=
 =?iso-8859-1?Q?KHiZqS40enSaeWPuG1/mWDN8reU/eCfJvyjWjOrRw2TZadY+9Lqo7bJOmq?=
 =?iso-8859-1?Q?y1qpmQBml8bKfW6YLoZtJAU4A52CRGbO5oCMO59N0rgyhXWShwKS8Cxwrs?=
 =?iso-8859-1?Q?ghr69zDJ3hTIJdLql16p2wNXgOVswzd9W5uQMaY+u+6aWQlalOtjgfzIDg?=
 =?iso-8859-1?Q?F2u0ZV39zbhRY0nJ9KUMI9NVy5YYzTRRFNhNYcMtarfo4LHYtVbldTJdDz?=
 =?iso-8859-1?Q?XdRsYj/x4HjxlRapb4ddl/aNJG1dRWp+90rWs+9WwxpJDISY88ia7l/520?=
 =?iso-8859-1?Q?x8TA6NkkVc/4HiEA5nM8MK0ibAnBLxJSu5mAfFRRwjxvx+KkWDxPrF8MVB?=
 =?iso-8859-1?Q?Fscs4rPSY0uAWb7RhaqKIyzlO9k4xJW8S61ajZtErxui2/0B+Pn1L5KFce?=
 =?iso-8859-1?Q?bUJZ1Mmjo5iLO4wukCErCJ6owvcIPLE8w3+HvXC9kr9KP4PxzrkXyrA7T5?=
 =?iso-8859-1?Q?P0x3H2TuUl+Bcaxv4AQYQnG0eV3Jttw3j1U/nbpWzpEth3TrT59obpc10l?=
 =?iso-8859-1?Q?7nbjRgf1EkYNLJHVUH2lvSOgzZyyVd3eVlrXAp+QfRW1mmY0VBnsFs2SEf?=
 =?iso-8859-1?Q?zJEKCd1ISoUkBIIvtuFTUBWApsLJw678ZlEzftGnSXC7loSg1jY2JImFGh?=
 =?iso-8859-1?Q?nvYp6znOHydY9H25wIpR4BmYr3n36YHDuyEV2oYvJnDO21aW+HFdzCErUR?=
 =?iso-8859-1?Q?iIJ4HT1oV2Mtr/zQ93eaJWUxDQRwmdAVgDPy6xurxaMxUrvtn3ODMvH6ZR?=
 =?iso-8859-1?Q?ZWe5rdRDJpTqNkm6STln7FcRwNy8j7GYWUciu+g2gkslbmwBIhVcq899q2?=
 =?iso-8859-1?Q?pw+GcRtZ1GBPXJBezCROgCrrCNSf0MilC3OwAS2LZHCRa1Li+oxuxX7UfZ?=
 =?iso-8859-1?Q?YA6XYT0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TB57dc8Wbp7cDXA2fNU71gTiR486iLUqQBZbvws/MNehMSwwBnV0SVO3L+?=
 =?iso-8859-1?Q?QKhORAohGcZFKG8h+p/9pfC2R1GdEA7kGUrofFiO7EPAmgb6nQROREnc6e?=
 =?iso-8859-1?Q?KdF+FT8qfgk2I+5MLjzmiezzEUJBQrWv3jFDZ+x8MLVvIg2YXCFFC8De2U?=
 =?iso-8859-1?Q?wqRCslL2JLELaKIc9pxAS+klk7Yw04jSLt53oS1Zr5rZVjNxLa50WHwrL6?=
 =?iso-8859-1?Q?mOJEmnCGUdFK4/CtrDV1oFN/NVJOIbxMKzdvOAtrmSllo7IdhYOcg5rJon?=
 =?iso-8859-1?Q?UypH1opZuLWf4XYos4BaT7Eci4CPsKTJjJeqPgSO9r3pWAOs/BeD3yWqCc?=
 =?iso-8859-1?Q?TNviY41uTZjaix7Ah/XdheoInFEh/gi5xrJ3eVuAAoJKQPcGeqOVSBIxYp?=
 =?iso-8859-1?Q?4CWAMNZVbDCy53Ww/HrxQr36t92FI83VAdZYKMYCj88ZD525Xf3oFQ3PHJ?=
 =?iso-8859-1?Q?w0ewyRz1jasOpdcFDkCyPlicLtDqJLL+jsW38gouMnOqMHI7Eyk+baCCdi?=
 =?iso-8859-1?Q?QiC4Z4v7DRzYFnX/EhiEjxPhFVA/R4w+qHMMq9NoC3bFLKL+yHQ5pFBeGc?=
 =?iso-8859-1?Q?/geXgHco0RYg861Q4jIGVoKnCK68gt02c4MTFV9ZXvAnJ/BYEoeU3+/R/p?=
 =?iso-8859-1?Q?9dpGX52wAtmKg0AM00/mdWtIFYTDZRRGlR7dsYc3HsBF/DR9g6AQyezr2G?=
 =?iso-8859-1?Q?1zXZUJeftwcKvCy9ZSjuNfCD+p21P1S1X9YANYARXj+A80/OdrYU31Apjs?=
 =?iso-8859-1?Q?Vauo1HGrRkpe55Zorhr564/UdD76glkUjjIPeMVL99SZkxc8/sHVW2aPOZ?=
 =?iso-8859-1?Q?3N5m0dEXr8gM6ayz6IY1Vvpki/Tk+iYSkhlu3e2wWBvmIoxKUuUkj0iJfC?=
 =?iso-8859-1?Q?5Vad7+FzUCOBbjoBQusj0/TNx/BAC6toHmraJXmYi1LkHKoJKN8e3CgqHA?=
 =?iso-8859-1?Q?Pduwh84i9+pe+7b/uxy/mVp0qCuneSziMcCFhIsM1EoKR+d03EujnZu/cB?=
 =?iso-8859-1?Q?1MiNu4KY3aqpNY3ADD5IFvglOJXec0CppsTtCwcE1ADlY5iLkgNwEVjPLZ?=
 =?iso-8859-1?Q?4CeeDlPJ0ezKP2HjkRocgvIU9OUzqj4dVnYhxItdkKiyO0ATR8fTrC+ugQ?=
 =?iso-8859-1?Q?tzzSuNFBNCpNaFfcGmUGABNVVCExAMtcxAx9dqytcJsaH6YEaHBOCrBfPr?=
 =?iso-8859-1?Q?qafXHGnN1oRd0zT8/FispGO10SRqQOik5hMd/B8caDielWjmU1MaoHO0yz?=
 =?iso-8859-1?Q?5Gc4go+fV3EVgcTLJTjLwZRXFNTMI0AkyPAmDw6xCn3Jnl8pekxV6yg3vV?=
 =?iso-8859-1?Q?riV7/QpHyncLfqHImhioYGcUs/qTrIhYz2QbdnIZ9ZRhNRAe7dS4darFlG?=
 =?iso-8859-1?Q?bugvj1nSrAs4SyW+uiZhBQvT9SCD5empo+2Exgjp3zYHROG31m7v6BL53n?=
 =?iso-8859-1?Q?DkuQJox3hF2RxX0ZeyytsgGTbSIf54JKquDIH7b5DM9USRhStsfMtlbD17?=
 =?iso-8859-1?Q?yez81jn0b+5d4hd3UnAPood3eVGCfSwJhhfdyVdC1VWVc965ZMZYCYkOQ5?=
 =?iso-8859-1?Q?B9T0tqTmQG1qcGCWPXxr14zZt+ibSEvthQl1oNDOa3xCWGCvuxx8s2xl01?=
 =?iso-8859-1?Q?ZWkVIrYtgXePmzcXXj8DptqhdbOTqNDYnWrRaAsMOYosu6hO6V9wGIPg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 035ed0c0-ed99-4ec0-e151-08dd82571fef
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 11:08:06.5436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QGsyQgAWkSTUpaOX3rIrENU7cfh9ofggcZ1AeczoW/MuOohjdnSFCO6pdxnEG1rctefpZEpTJPA1QkR62W5Fsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9841

This series adds support for R-Car Gen4 PCI host controller.

To fully support the controller, the following changes were made:
- Generic mechanism to support PCI child buses is added.
- Private data for PCI host bridge and means to access it are added.

The series was tested as a part of the pci-passthrough patches[1] and
build-tested standalone with enabled HAS_PCI and HAS_VPCI.

[1] https://github.com/Deedone/xen/tree/pci_passthrough_wip

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

 xen/arch/arm/include/asm/pci.h      |  11 +-
 xen/arch/arm/pci/Makefile           |   2 +
 xen/arch/arm/pci/pci-access.c       |  37 ++-
 xen/arch/arm/pci/pci-designware.c   | 403 ++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-designware.h   | 102 +++++++
 xen/arch/arm/pci/pci-host-common.c  |  94 +++++--
 xen/arch/arm/pci/pci-host-generic.c |   2 +-
 xen/arch/arm/pci/pci-host-rcar4.c   | 103 +++++++
 xen/arch/arm/pci/pci-host-zynqmp.c  |   2 +-
 xen/arch/arm/vpci.c                 |  83 ++++--
 10 files changed, 793 insertions(+), 46 deletions(-)
 create mode 100644 xen/arch/arm/pci/pci-designware.c
 create mode 100644 xen/arch/arm/pci/pci-designware.h
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

--=20
2.34.1

