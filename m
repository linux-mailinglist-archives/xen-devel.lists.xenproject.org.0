Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6905EA612D0
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 14:35:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914586.1320301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Be-0003OG-SN; Fri, 14 Mar 2025 13:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914586.1320301; Fri, 14 Mar 2025 13:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Be-0003LU-PB; Fri, 14 Mar 2025 13:34:54 +0000
Received: by outflank-mailman (input) for mailman id 914586;
 Fri, 14 Mar 2025 13:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/juS=WB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tt5Bd-0003Jp-Uc
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 13:34:54 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b86d15a-00d9-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 14:34:52 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7950.eurprd03.prod.outlook.com
 (2603:10a6:102:219::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 13:34:49 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 13:34:49 +0000
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
X-Inumbo-ID: 1b86d15a-00d9-11f0-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wc3HM700v5OBBXALbz0FDgZ1zS5iPxDYMjGTE2Y1W8TQe11GO1m59Yj0AzRq7FlqivZPZNd9SNB4jTcPYySlb9C2y5cfFENbdI825v5BsJOJx5OMM42ISzk20DcZeNoPB2OjEmdBln8h861hruvsPuxcteXvR89lXEjU2AJr2M5Ajw6e7xMcqB4uiFURYTCaXWKoMZ4SsIdNlFj1VoZiv8ssYsqTeNJczQGHizBCRSplLbbgndF02+a4yYU2PJ+gY+kyw77qzx6T8wbryLw+vEO3g3UYiF68Gyiy09RMBix4krLi5vtPn7DPEuZT0X/vyqW+GgBqIrbLYU2nsiXdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDr12ZsXB6LPkmtXOzVU1uDhSozE3eMv0KaDRRgy6Z0=;
 b=Vep6mL8NMIE+Zv+M0npMYGSpD0bqt/EQPIBKHOdM1nwAsh0cQ0o75bhMYYeFzVE9ABFucoHhuE/QbO4JGxFEGGF2ccgl89Z7sgwtpnPg4bA5iDtS3LGf2jAgvVEYa0TsIv6WHo/cicTOwUeByTH2g2P/gOptflDbUwNMR1vbcFYEFYJWaQeem2SrS+jnprg+f0CIwRv/1ChqVM6Q8omK/HTLWIXcRdkPp6oaFc4QYE/ZGQpg+AvUeUzum1j2uC5LRF5ZtrRAhf3zQ7ygaHSvXuWOy9Zst+ktWCYZC4FEYbPYIe4SP1JchdgvhfIkqKptSQgSw9vrAOaWT1Ks0t8J7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDr12ZsXB6LPkmtXOzVU1uDhSozE3eMv0KaDRRgy6Z0=;
 b=A8IpkU0a9GpaJ4sAElJyLgKSk2GkiyRGdN61hPBVJnMq4+T1blbpuL0UZqhExOqXpOk0fVZ99QTecuilcLjJ2ilTBDsm/X7z8jSOaqAHyORCIrnnxllRQaANgzN1HVNTwbMMWwqUzTrI40RaviBe64ZSEBLa267wo10Bv2AeH/PDNqLy52azsZYo4KeRWFztkSCuZmFXf9YjU5hnH1/mnbSEqI7d/xgXl7qwmMdL7aq8cVnQiueUgr8gCuVrw51WygXixp4UkMS+/MWtWA4patNnCarfLEVCWWvsVc+ZPTWUFyT/SjUWaYXEbL9ulj6ZL47qQIlalDyto0Wd/9rv+Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v9 0/8] SMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v9 0/8] SMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHblOXbm923M7lmNkiZwraCcQZgOg==
Date: Fri, 14 Mar 2025 13:34:49 +0000
Message-ID: <cover.1741958647.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7950:EE_
x-ms-office365-filtering-correlation-id: 75ea87b3-7ee9-4bc5-b88c-08dd62fcfe79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?z/OYNNyrExZrur/VDgeNEa3O6bJbT8XIrwx5SHOxN9RtygsRZ/eVr5tHC0?=
 =?iso-8859-1?Q?yLn/MfqRCfPixL384J4kgj3+7AKsggJHzYp4xBB618VxIYOL1ZHfVrISGy?=
 =?iso-8859-1?Q?85AfX9yGgJXsn3ixIq3LBtvilsd0APp59VwS/hFXTkL3MCnhATAPImXi49?=
 =?iso-8859-1?Q?GhiMypVPsocA8LId8h2J1T6HmSbxYaWsAfjRs1SWvd+6YqE1gR4lM0IPJ3?=
 =?iso-8859-1?Q?pQ53xPmwAcQU10VaYK+iT/3N/sBnshQ6PtVGn3FvADAnckVns8u8UjfKGl?=
 =?iso-8859-1?Q?ynenwuv+1tghC/2UOFHuZugcAFJpVveu5L983vAkoW/H/p9UmWgIvUb6Ok?=
 =?iso-8859-1?Q?kBk+cjSjEgjxPAuA2XhItBpkHFNU2FTUxhB5bA3RAiMq4ipzvGRcPhUUQU?=
 =?iso-8859-1?Q?SHXFvBCC6Il5npc8hrJQrLF7tnJRusIGQ8O69wyyy+p0vBuw/Gl+L0tYJS?=
 =?iso-8859-1?Q?gaoT9JuPJV/k9qWwu9c+dHPq0V+Uc2wtz8U1ovXaeQ0fCVpBI3R6Y1+wSM?=
 =?iso-8859-1?Q?1CP8/rXZBPjpeT7CuOkKDz33ccaPPtC4ha597UA8ss/m2JG+0vEF60RTdk?=
 =?iso-8859-1?Q?4yQ02LmwRxkFaNn4vkFrGt74YnJWkYjeiQoz7Viqfljm7d28AHjTCeIEmn?=
 =?iso-8859-1?Q?rwJdaVU+e63mfNzCs/IONVwVsP8MVTc4cPHfVM26KofUmH2UaQ590qbdG9?=
 =?iso-8859-1?Q?iT/KAjpdybWsEpFV9VfwtXmOXTDkybnSk6qGoXkCknyz2WWssKPHtEPgpi?=
 =?iso-8859-1?Q?xmHYZkCCHkd4Pyc7FLmoZQMCyvZAxB2PX2F9XdxYbWbFvNwnRwHbflVl/E?=
 =?iso-8859-1?Q?Hls97RQFs2/eGV/z9PwLfquQbGY5Db5UBs622pS5SFtaYi6efY/7sL7a4g?=
 =?iso-8859-1?Q?OxDmpU1HlB7Zb9eeuRrS2jIvL2iRtb/kr43CmYUkdQzWmwLIO772x/MVn6?=
 =?iso-8859-1?Q?f0yfAO/qdoczpog0Jl2U2X0UZjIEGilxjldrIjU6Q1sZuf2ZH/2VmAa3wd?=
 =?iso-8859-1?Q?nqMP6VIYvaLHoUyUpybIrQ5NlIe2jEWb3724+WQFHUqn7fWCnoRajsqX7+?=
 =?iso-8859-1?Q?SCe8uO/UQLPb/MfJk0dw4QpMgfjCaaSrVMin4zUBjHx0onu4I7B7ghlrMT?=
 =?iso-8859-1?Q?lLuXL5yD5Bj/knA64qoLQ4un/DWXcNjxbMsjBdYLIGYdGq6g1MTnecP7p9?=
 =?iso-8859-1?Q?Oc/fo1xfG91tdcfvgQslHmGzb5Icd8BvKQorTXdw4TErlRoHI7yYSnR+FK?=
 =?iso-8859-1?Q?rxjKrp6KEtm1muBGOhNtd87KO5Tt8cxhkj5NtXrfoBFiDJE2XyUrtf0zT6?=
 =?iso-8859-1?Q?ihRjlXIZq9kQmt7WIwRQ3ggaEt78iYRlIDO/7UTr0b3WCk+r8u7yLdsaPq?=
 =?iso-8859-1?Q?7/z+Iwc84IG7BLAIbhUT72TLs7iFEFNOVfVqwcM/LJNTcymdOOQD3qon/0?=
 =?iso-8859-1?Q?Y5WamVutNRED58yxu7+qerQ82Y416gIEV5KyuB0IZjOqiwn9jAVk1nNWah?=
 =?iso-8859-1?Q?FtZvPC0iognUcVT56TZNE6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yRF9ptXcr+qCEdFK+eP5WyqUqg8z4GnYGmQdB0pgWCqnnmFZtJ6bPzaU9C?=
 =?iso-8859-1?Q?/QKrXJuKlJ8CApmeWNveHh0Dje1PcrgE4chnBlKLVzoMgmDsU1d7c+mWyY?=
 =?iso-8859-1?Q?C5tm0iS2AdF+wu28zzj8wLo4KoGWG5hzsGcaGvkQrZOuPuEdg4UCQkbn3o?=
 =?iso-8859-1?Q?8t2xRZKnRmDbZUvCl+lK97xnarVtyG62XRuavarl4MfSjk+TI32Z+q9L0b?=
 =?iso-8859-1?Q?ZG/etEZYn7kVrlit9KMQb34YSSjim0OyhzTbO4QHJVKoulZ88HHOjBzPOG?=
 =?iso-8859-1?Q?ZwGTFmy8oGcEgtuNp2crWbcD0i34TYtmQxXwHs5Ywxoab8Lve4J44gmbF3?=
 =?iso-8859-1?Q?F+FnUA3+FF5VaGmhWs2NLMJS0+DPAif+m2aiTRVZlnYCIsE1fxY6p0EMxH?=
 =?iso-8859-1?Q?6MHw0bAxdC+RRjIS9G2IiGuMJDlki2hjfQhQihuhDOvxdymW2LMoGdOwoJ?=
 =?iso-8859-1?Q?/sMPa833LTfm7AtcPFSZy2j4UR4e9PG+fQFKelHVHShCVWMJDor2h39xJS?=
 =?iso-8859-1?Q?wpCBFramR5Zjgw/ackh+QvdGvFTgJngFaPchAWY1A0TrtEmcrv39NSqu3+?=
 =?iso-8859-1?Q?qU7uteYu2HeoD989QHFkOH7KLxBNF4mb2tQoRb54erNGgI9tsoeTX7kJNN?=
 =?iso-8859-1?Q?+XqQNFBKN1XPHp06slupeeYRkMBVk061c4KsME21DCNMcqYeYIe+yQZ5GT?=
 =?iso-8859-1?Q?58tfAFUPX6YgkMottj6Ozo7rp0K7bXwEbAYwKKVrt17Gd5RnK5o3up9luU?=
 =?iso-8859-1?Q?pyd5oTxcKZ4YJknP535RVmQoVGiNNLa3YP6iRWcphF0/W/mrJztYp3+kk3?=
 =?iso-8859-1?Q?HFWF+UuZrLqC1+Uu8xuskIte1u2YFQA6GZK6aaml4uSicGr64LcqJRCKku?=
 =?iso-8859-1?Q?QA5TpCrVLa0zculX6pjcpkXhSi3H//R82NSK53gp3JaNNPZaxpoQd/XBDp?=
 =?iso-8859-1?Q?9VzN7hsUAYkZEDR5mwMTu+rzpFCIBLeZA2Mwyqrp1mDGzc2Odc/lWrp5Wh?=
 =?iso-8859-1?Q?jcABuG8/66cvyw/kXRv+nwtahsAFl45kl6y3RFRMe8fXFNd2IK+biOqdfe?=
 =?iso-8859-1?Q?DayxaiE6CWYh+WLW8huRqV6bPZarRYYnyX4i1scOapFL1qdDrwzJeGS0g+?=
 =?iso-8859-1?Q?qtS7EwtWUL3CuRXVCczTJQvwBaTp5oMJSZJFZH/w90y2OKvAj2lp379U6t?=
 =?iso-8859-1?Q?RdS5vCAqfct0bq0ZNRWI0h1jfQPBA7EplBF+IXAxoH6w9gqogaMw7F9QCA?=
 =?iso-8859-1?Q?CuHl2xFmXV9duDeJkp/tjkhuHytXm0QWUicQSzGg9ZICr0GtQyFbBr3+XZ?=
 =?iso-8859-1?Q?WYYqNTzntw29S1sutgFBFlCRKVqC/srXBOveCDVTsNkEO6gWv7urzdzPlM?=
 =?iso-8859-1?Q?TcBKAlq/FssnU/JRk8cdNsLOmv8svz4ytdPC2NGgeDeNsah+44v3/7awmV?=
 =?iso-8859-1?Q?du8gkyYeDgA5/HI/dNNkhqbh6UaRjyY7aCugHCdNOCc/SwvVcRaSN9Qslh?=
 =?iso-8859-1?Q?nTqs0IDIqQ29ZAjgKAW5xnco9tyIuFSolLFF06Ot0vUH95zj3LeMzffZ+i?=
 =?iso-8859-1?Q?nJS9Wk9IZXyx7g2EBSU7mO3mO4evCUkDe/x0zEZXPDK4JYwciRfKeHwUsi?=
 =?iso-8859-1?Q?5r/Ii3kSdfyOOoBY2D+e5M5xhmedqS99AqNekMqzbTlMDl6CBFqD59Kg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ea87b3-7ee9-4bc5-b88c-08dd62fcfe79
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 13:34:49.6790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nsfKFmZ8p5X7S0jNH+axOAgMtNW/NxppDbLNtsuM1oGW4O/522SpkyBlrAOdMHC977Wp+vOf2oyW4pkUHuHVMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7950

This series introduces SMMU handling for PCIe passthrough on ARM. These pat=
ches
should be able to be upstreamed independently from the vPCI series [1]. See=
 [2]
for notes about test cases.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.h=
tml
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.h=
tml

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


Oleksandr Andrushchenko (1):
  xen/arm: smmuv2: Add PCI devices support for SMMUv2

Oleksandr Tyshchenko (2):
  iommu/arm: Add iommu_dt_xlate()
  iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API

Rahul Singh (3):
  xen/arm: smmuv3: Add PCI devices support for SMMUv3
  xen/arm: Fix mapping for PCI bridge mmio region
  xen/arm: Map ITS doorbell register to IOMMU page tables

Stewart Hildebrand (2):
  iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling
  xen/arm: enable dom0 to use PCI devices with pci-passthrough=3Dno

 xen/arch/arm/device.c                 |   2 +-
 xen/arch/arm/domain_build.c           |   2 +-
 xen/arch/arm/include/asm/pci.h        |   5 +-
 xen/arch/arm/pci/pci.c                |  11 +-
 xen/arch/arm/vgic-v3-its.c            |  20 +++
 xen/arch/x86/include/asm/pci.h        |   2 +-
 xen/common/device-tree/device-tree.c  |  91 ++++++++++++
 xen/drivers/passthrough/arm/smmu-v3.c | 117 ++++++++++++++--
 xen/drivers/passthrough/arm/smmu.c    | 190 ++++++++++++++++++++------
 xen/drivers/passthrough/device_tree.c |  91 ++++++++++--
 xen/drivers/passthrough/iommu.c       |  15 ++
 xen/drivers/pci/physdev.c             |   4 +-
 xen/include/xen/device_tree.h         |  23 ++++
 xen/include/xen/iommu.h               |  40 +++++-
 xen/include/xen/pci.h                 |   2 +-
 15 files changed, 534 insertions(+), 81 deletions(-)

--=20
2.34.1

