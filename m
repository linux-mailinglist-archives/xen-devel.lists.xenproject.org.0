Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF172A2736A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:55:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881480.1291633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNQ-0007fJ-9j; Tue, 04 Feb 2025 13:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881480.1291633; Tue, 04 Feb 2025 13:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJNQ-0007dl-3W; Tue, 04 Feb 2025 13:54:08 +0000
Received: by outflank-mailman (input) for mailman id 881480;
 Tue, 04 Feb 2025 13:54:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jloo=U3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tfJNO-0007P3-7Q
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:54:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f403:2612::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f3bad7b-e2ff-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 14:54:05 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB7494.eurprd03.prod.outlook.com
 (2603:10a6:20b:2e2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 13:54:02 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 13:54:02 +0000
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
X-Inumbo-ID: 7f3bad7b-e2ff-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AymX+ggbiNeZ73w+5SjryNgUxoSbGQDn2SJdH6E7N4UMHgurWCdKNIt+jWMkC3xWUxLj7iccQQF64Lw9MvLv2GPNoMHBqG58DnD8hrf3UMoPGS4lxBXaL2Bf/epPOh4nvtFLIfIdybOINuogdzevkMbivDRchad/A4Co6AFngPwpxyNo1aPTIOUhoAlqWgHx7bvr18vilFFGO5AIEyPSfOq38blXJA3iSzDvWq93y1M2eCqaLhY+75dtuZuKpEVhoLeh4RtVe4vLvNWwAr/DG6e5pj8Sw5JJFu3D/JRJd3mkrNmfDZIqXrP6m5D3qHLqlChztZgRP0txU5CRSUo5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUftc6DQW48ZCnb//77T/YUouFKMhFwvq7qxyEI+Klc=;
 b=KoSGuLrqflYDnCuOWSZRI+CZFrLFTDgmQEpGw1fvd3Fo2aiucICKcY914W/+/AtFCbKThBRyk0fV0xhgr8+yOh41aFfpIjYUHoKU1eWT8G3addpUyIuELyihx+YkNpPiIjImD8Qlyff7nY0E3kbbElexj44X4Q6xZHzOeFj5saYy8iEORFqcWx0Rhy+r4QKXeuy0DcxjgYrE9Ve81FCA8A/SjTfmY5+cuxGgIaldR8bO0n9MBmnMNssYZz/dV38HxDKG7uVJY1D4S7v74ngo7/XYq449dRTNzEeq/ceRX3YR7CuQjLkZKfH2YfIjLukBsIvys6ls4PfoP861OnsRnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUftc6DQW48ZCnb//77T/YUouFKMhFwvq7qxyEI+Klc=;
 b=M1x+t+MiXmnDqqZMCFE/WXQWKVtgBI+pYfPWV1FCqMThoLIu+/LaZQ34aNYs9lmd5lqkQHIzj2ToTe5v3BfYP28XqydeVHUicJvly8IuWjdFqwQgGqGT7v6KBEhM7GO+3GGQbQa9uh00PpNZWo5Iq4zxtbtaWCmYQWYwdOo4d5hyy4Br9fKDdPqkLOgIf59MyGAB5iE/uBBO3L6qezw6um3S7hxgsNwhlnYnfr6YkfUo2y1/y00lzq2CoFotDINgpUb6nP47O0aVGIfdNGp5FtohZkvwqCghuy7SWekNYF7Lw+D6eNJraIHEwyMgNJX49A5RUPy/rtZWoXVA8MYrkw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v7 0/8] SMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v7 0/8] SMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHbdww/no/XJOGWzEyUftV49gbcNQ==
Date: Tue, 4 Feb 2025 13:54:02 +0000
Message-ID: <cover.1738665272.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB7494:EE_
x-ms-office365-filtering-correlation-id: 59ee767b-0d1f-4868-0fdc-08dd452361b5
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/7TRdXP3zYGeklAzEyibFBe6Py6hhyxTcO9xpDWiEaqB56Jj/V+uGNrlDx?=
 =?iso-8859-1?Q?fKp3PgXF6UTTUNy5g+5KK8xI3niXGh6GCozPolCj8tSee26sOo7XhTtSq6?=
 =?iso-8859-1?Q?BlNqfnNw3Y1V7B9vGasWVcO1OGpjmN/iuVZ7V5Bluc0sOy2BJ7SHT4EUBv?=
 =?iso-8859-1?Q?FfpCp9bAQhNbiK8KeCgTLQ+UELRjpvWPMZTsrtAfcwmJgRsRjY6WLAthFn?=
 =?iso-8859-1?Q?grhhGbzOXXFWTsJDC1bg6up7EcfEA5qup9vqk0orn6tIKDkztbyifOz++h?=
 =?iso-8859-1?Q?54aBrKu/EyvUkHWozcmZy8UnEIVjKuv5o2kS7RxaV/HlFiiR/01W/jBzUK?=
 =?iso-8859-1?Q?g++vj2FESuBOEWzgEA8ln6rYM8AaoUNyEOL+3l3WWjCfFGF3DGtgtHqEeV?=
 =?iso-8859-1?Q?jlnQf7SG//+YzuN8jFK+DeV59EF4NMS/YisIW03GduGqVP2gZlLVPEVfax?=
 =?iso-8859-1?Q?HiqX6cIFA19z8k8Ttt5SyEM3bawh1EN7ttviRgFa3r2gPeEr7p0kY5nV1e?=
 =?iso-8859-1?Q?bWJ3IyL7NkJu1n0D3/kfcaNqpGtJjcYCUKaL5L15wFSZ8o0MpDafrRZeBj?=
 =?iso-8859-1?Q?FcYwV31ydd/DbxXg0mYHqszAaxoHGTuiQL+6SzlFgvRefmF3UF9xSpOMVg?=
 =?iso-8859-1?Q?WbtXLKWNIUHnROevvyj2/xKmv1LIgyg43T8PvmvYSUCjdOxi9/PlvT4QUv?=
 =?iso-8859-1?Q?i7HQ3y7geo/SGAMeS0D3pttwoD0TokdMSEd8uW63aKrq29Z7bO26YF6XV3?=
 =?iso-8859-1?Q?kY7yelgTRRiL2AsLhauFIWav8TBLu6E8mgXHNyYMbY4nL7XLhw1uCzieIy?=
 =?iso-8859-1?Q?ILdJGoHT3XqUwDQfoR96wIphykmArB6XNiy1ImQC5UNscjKmebdX3LvvX0?=
 =?iso-8859-1?Q?EPp+/wDW80jcUfRpFkayPIWYfAPyDPjpBW64aycs/rNx1wAhS9xVoopqvm?=
 =?iso-8859-1?Q?l1lEZrk5D2bLiMRAGtkc+WSILmZD5XWZUkHCCfXoFSi2FPIQydu6wPO7n4?=
 =?iso-8859-1?Q?vcsKGRgJ2b/rQhgDMIxEAFqu+whFWkvXjp3YAMzqMNt5dPGdK29ajyObwL?=
 =?iso-8859-1?Q?HYUyo2Sex7s1ebA0V89x7gjvODw5+LnlQ1nS1XDJUqk5b3qM9y41/EHTOf?=
 =?iso-8859-1?Q?Zdm2irbJFjHaHZ3C/1Y8STdYFTUJWJhxlk25VEd/yc3YgaiDDmw5B6xeiN?=
 =?iso-8859-1?Q?G8xUAtm9js8RsChjoxfFFSSXMjui93TIOD9hUFCO8JLKwKKCZnWgckDyqi?=
 =?iso-8859-1?Q?+kq8+X7QG2ZYuNEFTdmzbPkCm5uLj7wI1MwgmfWOiMzpxFiwhmKgPswSDk?=
 =?iso-8859-1?Q?Z+aEqwRWYaFhOWYRAT1Od7nGeIAe1Pau8+Zl6QbcfVRmYqWMTVJB1LsaTg?=
 =?iso-8859-1?Q?0xqqrQXtQ1QPtRuQUiWidCyl8XnQdOopSIHBYmtRo4tvlJMX18HEgH3wjd?=
 =?iso-8859-1?Q?8fK8zkSNz1hqdU18qSZSKOi3Le8TD4isDYSsIA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AhCpZa81C7WiulSYWsXb4CKWQ8spf3vK5CGp4JQG9sPjvbDs6ap7eIc3dd?=
 =?iso-8859-1?Q?VqyeWWXILDuzRiB1Cb3ZvtOPL+F/vI47Y7pC+opfO21Jkew6H1L88Gpii6?=
 =?iso-8859-1?Q?KKritVuBeyrWUedUPHwhhfPkQsnukvr0pRbp/r7epPZl4mrDbTtypcvZeC?=
 =?iso-8859-1?Q?TNivms9MUiNijXlf6uD6zawvwlRGAqa2fmN2BHCIibgm+hVIOJMi+6o1b6?=
 =?iso-8859-1?Q?hn0GQ7sLMd0nfh4VuuewlZy5HIxvMH9/LbcFOD4njzcCjYaOfqKemK6vHa?=
 =?iso-8859-1?Q?IQh5WhFzXT7Us2ThvsXWm+CiFqKUD8n2bTMJfSuTaugDKK1typCgTNUM1v?=
 =?iso-8859-1?Q?B0004jb7qHAt82Vb1Y3viquDr5Pzlt/JBH6NWGJ4EqKJutalDNu888z0Ls?=
 =?iso-8859-1?Q?kaUsFzkni1faBk0pW9nQ2NebmYTw02MODGEbEF7YhRQRp0SS03IbnmMgho?=
 =?iso-8859-1?Q?t7JdM0H3JxlEz9/NFMqwS4N+g1MDGHrb8trNkzu7V15ejv0QO1GE3Z6/Qo?=
 =?iso-8859-1?Q?L7NDepGDnYEI8kTbR+QW9BMY9ltBjwb+3nnW+8vZO/aR0gDkt4+4ymYyc8?=
 =?iso-8859-1?Q?8G+6Yn44H7CAYPdOylw2w3FLKDOUGBIddfT0yd/YMIesjS84GuNW4fEHqS?=
 =?iso-8859-1?Q?c8Z04Fx2+fFx8uGcHoVcgKr4ymrkIzhsHXtExHl+u8KT9Dh2Ovb3FN7u8C?=
 =?iso-8859-1?Q?X9B6TcFrwHKTrjaJX9eSDW3ouADXnaERdqDiV2YMs2+VGAtHsIHWZf3cpo?=
 =?iso-8859-1?Q?X7MHXCydrv9qwIFSQm1juXsZbii46geO0ZtslpMgSoDWxRe7eHLVw0y6tO?=
 =?iso-8859-1?Q?wcub2hdFCJQhB0yISfeXBsNQcUQhf1HdMF2Vl4OapKGpmiIpoXAWnYM6nm?=
 =?iso-8859-1?Q?xflxVMCapu1g6HNqB75T/3CfD2qr+RQFaJDi24aKZ2ze2yFZiftaaz3cUe?=
 =?iso-8859-1?Q?YE52fP1tbe81pQx0Dv/dpLlNnbpE71T3MWdYpGNbsGm4T/qJKcu1AfrdG2?=
 =?iso-8859-1?Q?+dzgaJ5pB1Tc6+0fNTHDExYtlp4K+e/Kc2Fw//+rTZXTXf96kp1fWNg5kh?=
 =?iso-8859-1?Q?ihv7kVVJlyVOgNvDJlPFGjVxKIsc7K34XYxrvZgrYIvRjRy1syp1d9QtFy?=
 =?iso-8859-1?Q?35hs1FBwDoPA0pqAHAuzd2szEwt2cB1D7I4KTsWOzFUJbjqaWRJ4jTcBkK?=
 =?iso-8859-1?Q?5qjDLCyE+yB8RLIeS6gxzjzIE/rCU9nS1VoEjZorstPVtZNcSOOoxewMdf?=
 =?iso-8859-1?Q?hM5lwSwBNnshhs3hdnU/P5pvP5jQ4rOTei4MjYvRIWTEYoTt7pInQ6pLj5?=
 =?iso-8859-1?Q?CgAGXKFnFXSwqm+x6++zKJEXjoNSIjkuqebX8osFTgxNwl83A0VRHra6K5?=
 =?iso-8859-1?Q?6pW3xLvjzSNIXIRQ2Ds4Gxk+mm+8sokmaqBDOXJlwDVcUqwQrZAwVGIELd?=
 =?iso-8859-1?Q?3otmikqhZCtkXVVuhi1EVqoLd8JuaI1Sk0hPU3g2GwqWIa9pjhoBwXMDGq?=
 =?iso-8859-1?Q?RUGs66u89FmtDTQ6qSMeUh7rtePr7UYoLwWCnSOoZ9V12gjZULobwD/9p+?=
 =?iso-8859-1?Q?bVOeBg82N5YHDHvxLX0b13jNKK/SeHaJnts/+IpDDMRo/kQw0RKIF8cUrF?=
 =?iso-8859-1?Q?Bo59tTFdSuLh0lyHLzRhHkwZeKsRHYtUutNHOp5tydHxoWp8bDRubuug?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ee767b-0d1f-4868-0fdc-08dd452361b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 13:54:02.1467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0inlrOY+i5eLCFJGBYT9B5aU/yg+BAj9vePw5uoY61zq9nyvw/x0SNPN89KPXaiEIrUx7PE+TvIrsh+TcwgPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7494

This series introduces SMMU handling for PCIe passthrough on ARM. These pat=
ches
should be able to be upstreamed independently from the vPCI series [1]. See=
 [2]
for notes about test cases.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.h=
tml
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.h=
tml

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
 xen/arch/arm/pci/pci.c                |   5 +-
 xen/arch/arm/vgic-v3-its.c            |  20 +++
 xen/arch/x86/include/asm/pci.h        |   6 -
 xen/common/device-tree/device-tree.c  |  91 ++++++++++++
 xen/drivers/passthrough/arm/smmu-v3.c | 117 ++++++++++++++--
 xen/drivers/passthrough/arm/smmu.c    | 190 ++++++++++++++++++++------
 xen/drivers/passthrough/device_tree.c |  97 ++++++++++---
 xen/drivers/pci/physdev.c             |   4 +-
 xen/include/xen/device_tree.h         |  23 ++++
 xen/include/xen/iommu.h               |  31 ++++-
 11 files changed, 502 insertions(+), 84 deletions(-)

--=20
2.34.1

