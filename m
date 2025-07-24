Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A8EB106C2
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 11:44:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055559.1423946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesVB-0002Uu-Nz; Thu, 24 Jul 2025 09:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055559.1423946; Thu, 24 Jul 2025 09:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesVB-0002Sy-Jm; Thu, 24 Jul 2025 09:44:37 +0000
Received: by outflank-mailman (input) for mailman id 1055559;
 Thu, 24 Jul 2025 09:44:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4HJ=2F=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uesV9-0002Sr-HN
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 09:44:35 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd967f24-6872-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 11:44:33 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8003.eurprd03.prod.outlook.com
 (2603:10a6:20b:42a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:44:31 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 09:44:31 +0000
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
X-Inumbo-ID: cd967f24-6872-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSM3vzGtg8RWMRugKEpG4bD+2pkegs/JHsUEPYbPLaGJiaBoeQTZyZiFi0CZ41fElh+evEKKBu4McTX/59p6D0Mhe3NCb+UGusPoSKon4j4WhQnlH/OBlRua+e98IMScb1yDX5yVcf5VYlkS+fS6+swZAayXM7XcIuzVNB3wEqcnSqGdOzq2s8yJqEQXTRuEaESrMLMCGBANzDdqRRW43e7c+8wSbbUZIeD9LqdHTNE6Ha9bx7Il5dS+AXtk2XWVJUeWYOedkGGEvdfkbA01r0rjF6yOvJVBsVWrshQG6iu74BjTQSqAajmhk3Yzvyaqjit1VSzQY1yg+58rlKHXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06TVKJA29deHrZItiwYPtg96bxhKJhoRj86B45zRG+o=;
 b=YDC9RmuYs8dRIqmuLFYt1qBYlp9uWHt58WThky6XoT9TnDeFGAgpSShyb8c0FiFZGYo8+9/CsYiNkPJ87R/SdxzXQFx8zpVluLAd6oJCQ3AfR5caUlKKzTQeCfkS6m/ZrNZICzatnnaol++5rjB3xWSG3QJVpt/6ELHaFOjoEcD7OI4ygW2Ip19B0Qo1WZcAKqGjTB3jFliE/7ogyD3bj1J+LBJP3ZsmnzKPBRQII5wEam7BAuiPZZElFUVWVgvJMGzNy6imB1aMwFy28MSvC3bkeQt6SbZk/90p45H5dIrBl5tMPcXeQsWlOmk8U7OV8tIXO+aEA97OERo6N2NibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06TVKJA29deHrZItiwYPtg96bxhKJhoRj86B45zRG+o=;
 b=nGLptFMF7IDor1etlqXmzbv4+UJrrPMbxNQcauyLJ27ZQqeexfCmM5FOhmnTxs+59I8JKTITarHjG2B7C7ydIqXzDxeu3m0ShatM62/njpZH5MqWqhCf9/pF4nMVkarfJHsvXnhWZXC5gEEReBX1AO8dcdI6Z5PjbLE+rCOLHHq+Ix8h/14du9oeZPs5VsLRRkEuKnqFD3ywQaqmtmFhNrxVCdX54D0RsEZt+u0JhwiE7/1KpVtdyqZU2u54Jy2ZK9CWd5sHEV7k8arrJtwFB6uDj4kseND45X8mliEDrhmJ4GVYkP6LVBfryqPk2/TcHxyaexnvL8/COdr2Jj6o9g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v14 0/2] SMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v14 0/2] SMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHb/H+N/mjFmIHwykS1YC8Fx8QA6g==
Date: Thu, 24 Jul 2025 09:44:31 +0000
Message-ID: <cover.1753348261.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8003:EE_
x-ms-office365-filtering-correlation-id: dc673cb6-ba46-4111-bbab-08ddca96b084
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?yDRyYXEaiNRfgtt4kcJS5R1qk2F7Llw41mikelvPbmDfQMkL2+0dB915At?=
 =?iso-8859-1?Q?CwuMphQBgjAauvvh7g9puxjNUGH+TxHU9X0V3jtg+w6cRpk+fm99goT90X?=
 =?iso-8859-1?Q?HOCaNzgnDj/4ZoIJlCJDZoPNJpiPtRfXhfaLYeEE5EagjeUHR5DlEVkwjU?=
 =?iso-8859-1?Q?daoJM3K2Ym6FiRkSsNqc+x0mFWNc9bpRys+y9QXbfciFRNgwCsix4ov1nu?=
 =?iso-8859-1?Q?Ad7yHogE+5Pe6aNxJBbHdf9vXMT5+sMnjsvlZNWi7dgxwnJAyWfXefaAWb?=
 =?iso-8859-1?Q?c/3RzoSDDBrzJEokgDJ6d9XIChWZ0msrU304T7VsmCyKLi+qhQdgJamvns?=
 =?iso-8859-1?Q?XkUo9ehZeSZ4ndzc5AOl4TQpnBCa1gJAKLIkG71lVXhZ7kqWbwiD7PUWA5?=
 =?iso-8859-1?Q?nNIvxaowbleCRz89s8aV3St2DFkplqtk00d98OXmtOQbtGw9pRVPh6zb8B?=
 =?iso-8859-1?Q?ObZQpbedfKSQiy1DMI1DpY61vwtbp2IZlSX+i8vbs+WIKo/TqNXC98h4Ym?=
 =?iso-8859-1?Q?R+ts6SP50Bb1Q/uAQgSQVuhjLUHGxhMbgU2fBtXYP5d6krV8JNtxaJy3yA?=
 =?iso-8859-1?Q?Rr5ub1tB3V2rl0T0gXzV5uHENpXqXfYvLJzMfuiWyTrNW3fqb8nxszKWOP?=
 =?iso-8859-1?Q?XWgPkbJnoVWUVmWg8lo7UC4RZsKkOr1U9insN64uyFeOTKLbraCj42cI6Q?=
 =?iso-8859-1?Q?m5GRkUv7MlhhLcYwQFj/BNB6T5OJ15r8lkCPFxYGREUp8ZhDM29Odd8+fY?=
 =?iso-8859-1?Q?jUWS8BqRsmwfn8bc9dP2MDUhefqA7RDQO1RTLdkq2FzPFEDp8Got/h5/I9?=
 =?iso-8859-1?Q?LLf5mYGHtfhN9ozH3VegWlUoAUFd9yXAM84vkx2C0Rv//AR5lbdUU8ykgo?=
 =?iso-8859-1?Q?SnOMWHpad1yYKC+F61PeXiQOTGHEApnB5U7HxM6XeiW+LcHkBNBW/VacSF?=
 =?iso-8859-1?Q?h+HyBygcMmAFPPGlbCW0Tdzkn6eOSQpthbfMpnWo9Gs0pO7n+Tf0NLiwmO?=
 =?iso-8859-1?Q?9DY9p/u7ToZ1Dz5fd93XiifejQl8JQ5JHkKp4Ge598bYYFJJWTp5PmfsRJ?=
 =?iso-8859-1?Q?OOQ69hlM/4IOFVYhiAgKrfo4ysir5KCqwBR4i6GGLN6BMXRBVVhvlTZ27Z?=
 =?iso-8859-1?Q?bPRCwdQx2WJXAsLTQn+IEpO4jwR70Zljv/tSQZOLWQH5IKGP19nPqZqqpi?=
 =?iso-8859-1?Q?bu67KQXfITqtla0M4txr4y9mG8GAcckLUCJVe8tBKeXheqSvxpmcw8PgVS?=
 =?iso-8859-1?Q?3dggIyk0+2k6OpSHBFB5MNnuwtdKGDYzGQoIYXDsj8ZFwwBD5kPi9HiBeS?=
 =?iso-8859-1?Q?pgJ20D71pB4MarmuSiqW+XoN0i8dOs+vnLrg5UCvRtiw6m17gTMi82swa0?=
 =?iso-8859-1?Q?S9p5kYOO6VeB3aslyCAw17GJRl+RLLKqpfklHa4TzJ+FenWVx66Cr9HUC3?=
 =?iso-8859-1?Q?N9WKzOWZuWKFpxsMsC9/Nw2hmsI/Yc+jOwqkn5roloTh4xi8+jmeRYhgy0?=
 =?iso-8859-1?Q?4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oCiPbO2CoxZZcxFgSbseLMIAZJG1ZGcxM0+9k9O8w4TB7flfJ2hS7r83h0?=
 =?iso-8859-1?Q?+N01gpsitTZP54D6fVFwCrdA7C9KcZ0QfbmCBVGPt5gRfWO/Wfq+dKo0q4?=
 =?iso-8859-1?Q?YgXi99TRWpdPn44ivk/Ajv4KZC6mubdBmqwpkDwf37CwEtnwTSobJyndhm?=
 =?iso-8859-1?Q?XIHKulkHUXAOey9WcAhCGC++CtNyYUMvuKLY6+bKhf7Yv/UQ7diDYi49wk?=
 =?iso-8859-1?Q?2NuNiEEfc/ZpSa1B2vPa3HkDvaZD4jbPZrK8tAhZu81EUVa1eh4l6omXyv?=
 =?iso-8859-1?Q?yS1U/MI+jOcamDiDE4EeR2Rs9dCKJaG8DHNzxoAjXX05y7K2brnw8wYhBD?=
 =?iso-8859-1?Q?gReGhCFWRjehbCAFJ+RjIllKsqnz/bV2zYjaDi2Zf8f96FNDQRIaqFGpz8?=
 =?iso-8859-1?Q?9Px9XLxIR+6799tMFf1VIimnAX/YHpayESw3KCkemHfXFYClDtrrGYfTUP?=
 =?iso-8859-1?Q?k91JnLB6oN0+MnWahSCILYFYAOwqOdW1JwmOAS+xwQ/01PjChBwvPSdLyq?=
 =?iso-8859-1?Q?GjYwEy8KUPgZQarWVIGBbOOB1t49JxMKfkKiqQ5xMhk5A+GAZ53v5f8fHM?=
 =?iso-8859-1?Q?NdmtSqjB4swXU/gGNazp0Qr6Hgr7aajYCOVJxDBG0Y+hsF4wVhLOnmWzyg?=
 =?iso-8859-1?Q?kFRgMtcfQc7V08xwJIkfTUn+SNOn1eEMa7F+9V8BAtB8Nfptg5oGsgkTiC?=
 =?iso-8859-1?Q?9VPjH9gD1jY3aIBN2SLXpKz1hkVSr6jCogXKwaan6yFbIgUGVTUpx2/br5?=
 =?iso-8859-1?Q?7j+TDamSbmwdtebdvpFWLxaTOKujbPAUNaFHOzg8wwfUuHoJj34yagcstK?=
 =?iso-8859-1?Q?r2ActIaWKdCkrLIayvteoAlJ9Nlpm5qX0c3/uTvbMyF/jFDIknNFrTM+k2?=
 =?iso-8859-1?Q?Fi7/LNRgPXO02pEqHcJhPMrwELrFGpoqzEYn1lsIH8eE33jpLIS+dyn/Or?=
 =?iso-8859-1?Q?1Kels3G9YzN4YXZ7kQCaMvRIpsBYxBMVkYj4BpVC+7VcV4BwiBBim9IdlX?=
 =?iso-8859-1?Q?+BQd0e7SF/J/dTs2ITHdUN6wLMmAJy2OsUyT597OZPmEc1JJUZHapq5HB6?=
 =?iso-8859-1?Q?Y7MEatGV+RFBem9LEUmxStCn0AbbR5uwqHgfEWNXDTblAa2cwQU2T/0gIm?=
 =?iso-8859-1?Q?KUWb7iFCVyCoQofrj0Ct9SUkNa/Ergwq6doIQYmFhfa8Zq6jZV9kTWR0kz?=
 =?iso-8859-1?Q?m8V6wNyh/nfCsigi9jqbfevdrsiM+bzR8SftmiCBX8Oirl6VRoWUQmtMku?=
 =?iso-8859-1?Q?mRChWWMBjcPPXndIIPXN3nm99sNMXZ1HFx3QwpGRzDnGNnszMC+9H3ts/f?=
 =?iso-8859-1?Q?jLo3XNobku2aPK/EVtm1CnSespq154b5HfVu5+xoGHhaGWWJ1ZRqiyrtQQ?=
 =?iso-8859-1?Q?RCoGTdfhGmGHgFzxm1SsOPvV+6nPPcOYvl5iLtq+jR1Xwz83V7BzjVnPx+?=
 =?iso-8859-1?Q?71yKNKeER2qWl3aUJU1iIJv6P9FcBsx4mZMwmU4pm4muwLgFKreTxRXXU2?=
 =?iso-8859-1?Q?9CWSkL69zQ8iRiHum8AVglW/ifEL1EVDcFFNhK8lH7PmvDQmJVpCIaN41Y?=
 =?iso-8859-1?Q?pICHrOLpcSQBroS3zOin0RZ+Ayq//WFZq6YxnAOkrs9Tr7/+BfFDTqJYoT?=
 =?iso-8859-1?Q?HMeZe47rCbqlpr8IYXGj7O4mNgYhTnaPa8Bj1S972hUrKTXx+20WEBRA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc673cb6-ba46-4111-bbab-08ddca96b084
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 09:44:31.1233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w9ln934AvgAZqwdIkzrIOY764Elv2qkNBFV1O2JK1VTloWReUysUTuDMyIqEN9nRtJK79LNK/Kmurkjv+44GhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8003

This series introduces SMMU handling for PCIe passthrough on ARM. These pat=
ches
should be able to be upstreamed independently from the vPCI series [1]. See=
 [2]
for notes about test cases.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.h=
tml
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.h=
tml

v13->v14:
* see individual patches

v12->v13:
* removed merged patches
* move addition of pci-passthrough enabled check in reset physdev op to a
separate patch

v11->v12:
* see individual patches

v10->v11:
* see individual patches

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

Mykyta Poturai (1):
  arm/pci: add pci_passhtrough_enabled check to pci_device_reset

Stewart Hildebrand (1):
  xen/arm: enable dom0 to use PCI devices with pci-passthrough=3Dno

 xen/arch/arm/include/asm/pci.h |  2 ++
 xen/arch/arm/pci/pci.c         | 14 +++++++++++++-
 xen/arch/x86/include/asm/pci.h | 10 ++++++++++
 xen/drivers/pci/physdev.c      |  7 +++++--
 xen/include/xen/pci.h          |  5 +++++
 5 files changed, 35 insertions(+), 3 deletions(-)

--=20
2.34.1

