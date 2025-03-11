Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192AA5BDCC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907712.1314939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnO-0004vW-NX; Tue, 11 Mar 2025 10:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907712.1314939; Tue, 11 Mar 2025 10:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnO-0004nf-IN; Tue, 11 Mar 2025 10:25:10 +0000
Received: by outflank-mailman (input) for mailman id 907712;
 Tue, 11 Mar 2025 10:25:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFC1=V6=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1trwnN-0004Ad-0g
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:25:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2613::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aa572ae-fe63-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 11:25:07 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU4PR03MB10646.eurprd03.prod.outlook.com
 (2603:10a6:10:58c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 10:24:55 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 10:24:54 +0000
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
X-Inumbo-ID: 1aa572ae-fe63-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bV1VU5IwbSdHzZVZ/KCFaR7fJwliTUBwx66Uoam/AfGrr3OI9UUKQoCIlu5q252x8vUSM0PVfRn1et6NwcPfsDbgJ3pgu/vWV3sodfS3v+DL71YuipWHRCKL+CKwB6I2JPJmAJF34ar/WXjhgBBzutLJTsqShZAmos/vEbO+hlfV+tuiVQmr9TBDfnFca3jVrh7PbQwA3MEejkvi8n9OsCikkF3tYmcrr3RpsWZZyf2Ez5UkmKAStMMt2XOh5UsOacZ1S8sxRebYA+4joU1XY/hPuGIzBP5HhRgvMpd5aCpBoCWC0lhPIrYqU8lSuJon4Wo0I++G6a/ErJSddD+Rsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhQZ1hinwog35mTTs1CSCcB5FM3Syg9JkGX4kmvajxM=;
 b=T3DmeOZ0TWEQd+TTATCM15Kduntb2g5Es+YIPXkOyiU7TGVqGoBnZzGsS0Y8BXN4euC03hpp9+iXtL0HrLgPhP/muo6p412j05Tvk3U0ekeyZ1OFqdjiH38Tt11HmtVopeMY5In3b1YrWxQIIoclE2Wl+RqJw6YWPha0hMMp1fbC6cp/izSmTRwHbK4gV6IxmdhpxvXyAJ03fknLyNT9drukHvLXfY/rn7FKbjCA8btBW+qvTLjtb0rUSr16MMo//5aT2SL7VB86OYd5gVIWauYVeWuF/kX8dUcwCgEYXhyfpmzraC5fzamziM9WRZK5vR5VYuL+THPF9kT12hxh4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhQZ1hinwog35mTTs1CSCcB5FM3Syg9JkGX4kmvajxM=;
 b=tHCTLtU3IfWXSf/7ar0EUnbsqMXDfKUeR7ludItPtP9+sUEcU+2HBHarxvWo9t3PMvSMSa7fhq5PJ7pqYCRJqzBBiTwLdkx+rm2fP50DxZKnk9qYdzV3uSzr9LxzN0TdbSiGoMX0P8pbGe7xHJgrNW2NwPAzI/kS/OdVhJ25uMMUt41K/Wz77p2LalW3P5cKferjzF3Ym3wRaMReX2DsKqIlmSOAmLIjAopaEgj4/fzZDQsTUkPTcUow6is/85kmbcwAUWNgRvCVWu8F0WK7G+FOHBaWj7yGz/LXHR4dSnf38x2edTzqd7aPyoeZBD2qzQBkyb0FU6LYZxe0wpTvmg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/7] Add support for R-Car Gen4 PCI host controller
Thread-Topic: [PATCH v2 0/7] Add support for R-Car Gen4 PCI host controller
Thread-Index: AQHbkm/U1faza3W2FU6EMBfK4RuJBQ==
Date: Tue, 11 Mar 2025 10:24:54 +0000
Message-ID: <cover.1741596512.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU4PR03MB10646:EE_
x-ms-office365-filtering-correlation-id: 87e3711b-c02a-49bb-fb5a-08dd6086f75b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BhluE1x7PqfeSHFRtJAQdLe9Q5kiv4hOFwc8auc0a3CLJE57bemnbOrpqa?=
 =?iso-8859-1?Q?HHaCj0WnApKo2cTC4RfxIxnxXlSCwvL0iom/pgk1oK6vubRzjV6LI00N7W?=
 =?iso-8859-1?Q?EMfEOvo1w6vy0NkJAWnjg9reQGvOevejfzZf8qjp7qcOSgq4VLzIBISLzW?=
 =?iso-8859-1?Q?b//BOSGz13t900UQSl1gJdUH1T4Q4sVUlzwgwYZLApBNEmuqhxJqfc5RKZ?=
 =?iso-8859-1?Q?jXGoD4R1TnBwQKAHqKe8g94wqZm0JogFBw1VTayPNXA0ORjvbAL5vAOS+7?=
 =?iso-8859-1?Q?vI70/P5jQaMlaWShqG22KabGdlrJY+7klc7OUrPPOaMvFiuFzcnlzGKw2X?=
 =?iso-8859-1?Q?AfF+a1ey3jNS4UAeMGiAhsH+Kv8cT5QJqGvekvKAlbX1RM/UPx9nKqP5HE?=
 =?iso-8859-1?Q?Gpt+Iw9PEhTlEujDSCa6TJSlAdiOQsTX5vZ+D16mszw0kz4uZRnxqMENus?=
 =?iso-8859-1?Q?giQFpSoVhZWl2k6B/clr0B1dgWhO8I127j41VyDJ3fMJW9T8bLfFia09wM?=
 =?iso-8859-1?Q?11ch/+T0m+cCU3UtVmjCsFRxoutFDCE4s9FInvMpoZ5S28b7ESWM2wzvYK?=
 =?iso-8859-1?Q?tMurnXJ9UWMHJVIeQKtPzKrEr/j8VBynn87zs1FyHTQCjv9Q5lo5gyZ+Ro?=
 =?iso-8859-1?Q?AZA80MgiSjVd6tJOE0yJFPyzPMyGzfHQolybzUnlAGSmcVNLozGeG7lB9S?=
 =?iso-8859-1?Q?y246O4k64E6PzF9qjHvpBSPv9NateNPak45AKnpvQc3BGE15YHVVeTaxki?=
 =?iso-8859-1?Q?oIWTrSh8AanmIQ2CAOQGVEqPWWSss1RS79zzr8tkHxcxf3WGVV/WeiHkkt?=
 =?iso-8859-1?Q?F0/nMF03vysmFLGAYrTpEr3BugrREq5vKH8n4i7hThs6fZ7ZxOERXz8AsN?=
 =?iso-8859-1?Q?230yZYbErj1SwqE4Ko332L/VbG/LGdZhJ7j2+5rZGxzlo0FKmxa3LJfTpl?=
 =?iso-8859-1?Q?2Nl/Ne3SCi/xSgY+4+vLUg0mHwVKyeFbAbItRxe1zRjX8zoetKHulU6Au0?=
 =?iso-8859-1?Q?uuz+pAWjeF4GPSevZEAqw/v5UTegTPt2naxpzAosLLgd06HJW0Lh019dh3?=
 =?iso-8859-1?Q?SaqeMc1iyOcekutEDoYLFcwfp4SEE0gD1KiciajPPtHGe33cIqEBhRZlI4?=
 =?iso-8859-1?Q?PEdy04WbromYI5abq901gBWMu1+Y96fACepcn02ABPlNf9HZ1PUUcjEBCW?=
 =?iso-8859-1?Q?FKZGsVpoJVEluIun4OYuVnaumRhImaqQbJhXas2j/Fps0HE0iKhGIMr38P?=
 =?iso-8859-1?Q?3VKk+jUdtIu+oQHxO9lw4SBizzF/aAAaw8MXV9RNz9UfiaAFnDQkQwLPiT?=
 =?iso-8859-1?Q?0H64M9tZWJeRwhrNu+ehXtVqc0AqpCdceheJ8YmEJ30qQ0bkMg0arf4DVN?=
 =?iso-8859-1?Q?vnh2kiTXzLXxzPrT54EJx/bQXnZY8+fhzl2zFdkzorisVj2Zuv7RkerWRP?=
 =?iso-8859-1?Q?YS8x62xInA0FhX+xuvSzth161+eZulYzirZvdcLUrfbWcVuQHiY9AKLyBK?=
 =?iso-8859-1?Q?yz2bWHu5qVGKdjzQntLsnk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pDe+j0DBUhKMDFVgwK6sHsRv3kromsWcPwhJZYvVI+uCS4y1KsGwbzOXf2?=
 =?iso-8859-1?Q?WcK3S5QVJOUUqzkFH0NuW/1c4XTBGAxaFc2KV0AyITnBrg0fmQPAk33KJM?=
 =?iso-8859-1?Q?lS1oLybU6HnAYUwmYkxT1KUqnnhcOSHBCAvTdPMyL+laqwLcjusak31qmL?=
 =?iso-8859-1?Q?x+YMl7NgBu+9b2lpp3eAZGOH/U9Ep231pg6MgbCxT3rermX9jswpRnItjb?=
 =?iso-8859-1?Q?UUoLGn4SQjzDjPveTc1Bsc7vl9bAcnPpMJ3YBzk5PMKXSnxjXNnhzV4EOI?=
 =?iso-8859-1?Q?5M7+dQbSRdxldvCNZowJPIbZqwaKvA5Y8BXhu8h1X0js/laXS02+bOuqKJ?=
 =?iso-8859-1?Q?yvewBmuiUNu89BizHBEftK3amaezTxNtgG9+Je2n4GPZf1idcsaOLEYJWH?=
 =?iso-8859-1?Q?nTBY9wokRRXeKbhV0Y110N2B3htWCHyTyxcYPx76ZRR8kDGU3gsgzlckL6?=
 =?iso-8859-1?Q?pYZ/QXpQz2UVCm6RcA3+maHD614de3FgxUd13zRWrGpMVeBhDA5Yyd5WCS?=
 =?iso-8859-1?Q?QCASUFz1k3ul5iFvqxgnGMbwYLcixKxvNKAoGPSG+tStbSJd4/2J3XsFMZ?=
 =?iso-8859-1?Q?r0XeduSb8bnL6FVvHHqsr7Rcg7xhOXVO3rvrT7mhk/mfgLYuxYZx58zOIV?=
 =?iso-8859-1?Q?chu+rSklz1OyVdCqwhPn/5JMuGQfe0LTZhaO76JETshiXTtc8RmUwBRl1D?=
 =?iso-8859-1?Q?sX08Ij7ssrpRhYH9IImemjE/xpX6kv1fqMby/f2hZDbWKGe5g+7fY969Oc?=
 =?iso-8859-1?Q?CVfvyb1LoNDKT1N7gquTLIijfV7xpv3HTF/1ksP+0TvtkoRN3Uua4e0Ela?=
 =?iso-8859-1?Q?QVro/VoVNYEpWouMkgLQyBsZnRlxw7nm62oQQWavL7nndFIHHOofG/ilf2?=
 =?iso-8859-1?Q?uF1BoZPOvnPrrUae8oiT2xBrnnwsXa+iyBTqEcobO3oNmYsFY6Ti8CRD3z?=
 =?iso-8859-1?Q?2xOsiazMk4JH8s1ljCtKUDCYy9cNIuUKUxcPxCqadM/9L+uhAM3AlPo2FT?=
 =?iso-8859-1?Q?ch5732EtQBjARBDmbUbgJY8n1qsdu3JGfYHhCu3srcGlQeF3zfkb49cw0b?=
 =?iso-8859-1?Q?qaGXvVY4Ou8n/xYCDvbWs2KKCaiVBjIANYB/U+NXBnW4d2MmA3BJbyD38D?=
 =?iso-8859-1?Q?VvF/JFx2SYVyzr9zDb88UA4bbDYbIS050XEoE2+IaA8dPmsDtEMebGo8QN?=
 =?iso-8859-1?Q?XLZJ9Wcy0GD8rWbzuaN4YsK1vL6o0dh5blEWfIJCXP0QQLIytksmgPXcRq?=
 =?iso-8859-1?Q?l6w3LiKzuY5rExk0CG1otVC9GSbnezpqXwCuZgPMcsK/3mjpZR8HfqEL1s?=
 =?iso-8859-1?Q?kvQhIGhgViUmL2owryKij7PcVlW6U2SDP7mdlJRZZt7kTU1FGHeGkuHFQ+?=
 =?iso-8859-1?Q?ks1ChKPS8g4BHvow1MnvyGOQHvCSDdL5NmvylB4MeQJ7XkVZiTZNi3W42n?=
 =?iso-8859-1?Q?Dz3b6vo/elkHoW6taakw3v9H/joIdg3lzBO+ycmzJIKuMxMhh2ogY5fK4A?=
 =?iso-8859-1?Q?6bhxFAI/UDxESUmyCLkDPhX+eqAj2s4fj7w8yg/QdaGSiO1wCjguzF7C9n?=
 =?iso-8859-1?Q?g6Mq3jO7jrR/mouxhzvhfH7gHOC6Y7b0KarxYLA14n4Pd3BfPMMf5diWWg?=
 =?iso-8859-1?Q?q3/oeIDwHYu2Ai2P74SyjmKvECLewsSTZ/oYKhMf/DOWBgUpE0m+xGYw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e3711b-c02a-49bb-fb5a-08dd6086f75b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 10:24:54.8266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 78SrSM05yd3PW3zKnkCqYMkRoZEp0O4y7GIos4u13kjQXS7e7oDZNo+Yr5dh756+gfTgunpZMykVJVJe98Mf0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10646

This series adds support for R-Car Gen4 PCI host controller.

To fully support the controller, the following changes were made:
- Generic mechanism to support PCI child buses is added.
- Private data for PCI host bridge and means to access it are added.

The series also includes a workaround for proper ATU propramming and
optimizations to lessen the performance impact of that workaround.

The series was tested as a part of the pci-passthrough patches[1] and
build-tested standalone with enabled HAS_PCI and HAS_VPCI.

[1] https://github.com/Deedone/xen/tree/pci_passthrough_wip

v1->v2:
* see individual patches

Oleksandr Andrushchenko (4):
  xen/arm: allow PCI host bridge to have private data
  xen/arm: make pci_host_common_probe return the bridge
  xen/arm: add support for PCI child bus
  xen/arm: add support for R-Car Gen4 PCI host controller

Volodymyr Babchuk (3):
  xen/arm: rcar4: add delay after programming ATU
  xen/arm: rcar4: add simple optimization to avoid ATU reprogramming
  xen/arm: rcar4: program ATU to accesses to all functions

 xen/arch/arm/include/asm/pci.h      |  16 +-
 xen/arch/arm/pci/Makefile           |   2 +
 xen/arch/arm/pci/ecam.c             |  17 +-
 xen/arch/arm/pci/pci-access.c       |  37 ++-
 xen/arch/arm/pci/pci-designware.c   | 422 ++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-designware.h   | 105 +++++++
 xen/arch/arm/pci/pci-host-common.c  | 106 +++++--
 xen/arch/arm/pci/pci-host-generic.c |   2 +-
 xen/arch/arm/pci/pci-host-rcar4.c   | 104 +++++++
 xen/arch/arm/pci/pci-host-zynqmp.c  |   2 +-
 xen/arch/arm/vpci.c                 |  83 ++++--
 11 files changed, 846 insertions(+), 50 deletions(-)
 create mode 100644 xen/arch/arm/pci/pci-designware.c
 create mode 100644 xen/arch/arm/pci/pci-designware.h
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

--=20
2.34.1

