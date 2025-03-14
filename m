Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFD2A612C8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 14:35:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914589.1320328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bj-00046c-0a; Fri, 14 Mar 2025 13:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914589.1320328; Fri, 14 Mar 2025 13:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bi-00042z-MT; Fri, 14 Mar 2025 13:34:58 +0000
Received: by outflank-mailman (input) for mailman id 914589;
 Fri, 14 Mar 2025 13:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/juS=WB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tt5Bg-0003qF-T1
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 13:34:57 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d65c6c7-00d9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 14:34:55 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7950.eurprd03.prod.outlook.com
 (2603:10a6:102:219::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 13:34:50 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 13:34:50 +0000
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
X-Inumbo-ID: 1d65c6c7-00d9-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1FSVEcjaVtisi0GGaIOqLmM+KnFLh7DlBWt/TNRjj0DwsDG3L5wDOcrs0wfBY1iftutm/9ZIFVrZmHRJ/fq5/FqAZb4N9cSofAZyCvepUsl2J7S0AWXwcMmxObfE9j7+4qRFzfOUSjsR/UqakoOfX2Q8rXZBVp2bGH1XmQbCYtpgmfcIs4uxt5mTQcRTxuzDvUWFOMlO82M6eZz1Gap1GVZjx4fEeg6EyaZvmAIMeJl4EgmKYrF/pUuyNkTP+euJ+nO5FD2uaBUNIFlzEXs0zvG/780rmJzngzm8/KZcVEwiLg2dxLrDiKChdEAcYT7PIAao1h0XoTYUU6BOzy3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUsxee2lGto+cKUU/E4hlWyJiIj2nzbj+aTUKYVDphk=;
 b=CyhZtb8RHEubR5I76lAApHgOtckl5AEO1q0i33pnQYxu3TCSiAYmJ3ajvqruAc8F5IMjxFGUu8AE9HaTm5bZQluYKygd828rugeNr5TwM0EUBcTwV9WWPN2wrEnt3AsgoBT4dsSwsfk+3eYJ1Dodp0THmwd7iNHR+DkGlpPDCmzU8ukkItd4uYnXanudMKHMGZyjKv0R9tphjoNhQAI54YsF3kMOiSWCGlm1JibcESzTi1E7ssMKdfeskU3B05H39DoT7xYPP+tW2jy10A7hVyW+As2LCoJI71mDTtA1fK6w7exhkGITnKl+WqIgSA7SIdqO+ohE/FgugXRieeYyNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUsxee2lGto+cKUU/E4hlWyJiIj2nzbj+aTUKYVDphk=;
 b=uLUoa+RBL4ujinaNIScyxaVb7OsbTTomr3Gfw8ndm9Pw+Ow6uTNTksU8DX6YjksQl1sOkyZ6P5yY8Fg5I2mqAeYs1JBqBaq2tNrILEr85WCoy8t6PAWGO9rutl9JJT1s64375brhI+8OqzfiCrSZBtQPO647XAiCeWkN/taOIoneEyUnYuxh/D253Lu2GnQuxsfpOhoPKC1+aGaBiRjhqtX0CESNmsQYMipWtkVFJTJMMG0WBCQsnUDQ7S+/1PLliRGCiXeqHAeSPqFuF4rrY1wcCHZv3fgM4ihKRdfaFeV9eCqsfvtnbGNDFh/NAuwfy3daRe1NwR109taXx7UbjQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v9 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API
Thread-Topic: [PATCH v9 2/8] iommu/arm: Introduce
 iommu_add_dt_pci_sideband_ids API
Thread-Index: AQHblOXcI08sNdwZJ0ah+pJJkNPOtA==
Date: Fri, 14 Mar 2025 13:34:50 +0000
Message-ID:
 <95d779f00127defa37f3c5056c762ea0da47fc53.1741958647.git.mykyta_poturai@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1741958647.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7950:EE_
x-ms-office365-filtering-correlation-id: 9959f410-01e1-43d2-7612-08dd62fcff08
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ipgzzjd8il8SYMCvX8cSQiWaizO9PMda5qrn16cCfNKP4wryiCLU7MPItT?=
 =?iso-8859-1?Q?qYuYtr9nH1jAXUxDCp+L/N9Bx4cK0GaPmq3BAWTwxEHyCvKcbAXlNYCfu6?=
 =?iso-8859-1?Q?jKdiBJ1HBLadDn2Q9ibyu2ugyWr0Rr5hTXariHumrjjlNGlQZkkJexkMnX?=
 =?iso-8859-1?Q?eV6Z/izmNkf8WzKUEDBLMkUfzZWNt4RNV1dCDrjH/0FPqNekkCU0alZTR9?=
 =?iso-8859-1?Q?VPkdRhZhrAXJ7ktOAP6MS97vnsSXy8wFf2diTcAyWqQygY5q2ww/yLsrUA?=
 =?iso-8859-1?Q?NrtfR8FvxDomrcBusqrSMz3uDp2pEJxxVM7xFL6xtpV062jeHXhzJYqSGE?=
 =?iso-8859-1?Q?7EtTaq4CmbIPC7wku7FnSgK/nUbzEJpkSUCUDczutppHgNa0eU0M8DF/wY?=
 =?iso-8859-1?Q?in2IyhvEntjIUFozrzrK5vAKbAg1v8E+rHZ1su16FfQv3PV0XM8AMPdkLn?=
 =?iso-8859-1?Q?SS0cIe5bdhiOSNs7LB/wPa3sRRlD3zuWBBFKBdHwN+fLENpprkOY7wdy6H?=
 =?iso-8859-1?Q?SI5SZF78yp9vInrsHPg9s7wwVqZqLJTi5tdSWYE0GyP33BN0qbb0JOfPD1?=
 =?iso-8859-1?Q?aIOKVBWWdoaVoMRR02F0oVRKS81QxM/7S3VpMiBAKQ30eEGzJp1KHKamzC?=
 =?iso-8859-1?Q?uSAd9P3NVmN7za7ijW6pKr1AIa0mR71R/vLDNC+ZqGYHtEaBCPPj6W7XoL?=
 =?iso-8859-1?Q?pVkQzADgquo5HvdX1NggBbNxRugWC2nTAgx7gYfoIKBZq/OpkDgBbHA8V3?=
 =?iso-8859-1?Q?eTlkV9NshufmGhSRQivf0tulmIZV2CBeIq9oMBrvTDVyMbRMeK+CQu36E+?=
 =?iso-8859-1?Q?DlnYa/7AEmabjCzTG7uCGBfXs0GykzCWMKCkHuiZ3rOkNl5cz1/1t+IjMV?=
 =?iso-8859-1?Q?IyB2GXP7+Gk9ZISJStR0xHxiMZFnnOEd/Kt0uXSZ9DqxQPdcz3ShAw7vtb?=
 =?iso-8859-1?Q?EyCT9WaXlwVyKUrUGwBZBs0XnH5vubnpd6b3sJu4y/aqMuOlv0LOpeLVQq?=
 =?iso-8859-1?Q?yEKcc/5gCAvNoCKBe5f7alxGCEMRyJSj/QvnHwDSXntr2xALzw7HgDgcUN?=
 =?iso-8859-1?Q?+Fx/dyzV8d5yZbK9ORK72CXjf798t+8wvLkrm0Gg06mvMqWQNLGvz0qFT7?=
 =?iso-8859-1?Q?CU0ZxqhXiJww/go1fsYqin4l8b+hCISVDRASd28nsCXgj9WYiQkloRtAa1?=
 =?iso-8859-1?Q?hepBFVOENtv+FW79QnMf5JLkIGdHt4h3Kgho9pnbX/1L8sK3V+TTo3lb3f?=
 =?iso-8859-1?Q?1vVWJkfbRXukuqeXAGRkKEe3GCWMpPdGGNzZaUnOrPv1UL3SQlS7Xdiw9O?=
 =?iso-8859-1?Q?5TrHMmf1RbNzrCevf1evSAOUz7F5Ay0+AncpyLe+KRLnmX6d1xqYOPIkPv?=
 =?iso-8859-1?Q?CsSrCaDC/NxMJ1Eq98PMh4TlLp3jIDPAt2VJNIOhCHe/bdQuicLPbV2rBm?=
 =?iso-8859-1?Q?lMQf7hqEnKDHhin9gDqL/jyvvaykUWRYilXgKDDF2mjy8PMlNtxtXRgTyI?=
 =?iso-8859-1?Q?O7DTZnBmbw/1alTLSIk5TZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SngHlYyFkqnZdoqILSU5hWXM1VkF1ysgBL9i+oka1WxH6/Wmox6WL3n69A?=
 =?iso-8859-1?Q?L3yqgKnBIkkqvLGMjxtbRfRbz7bPrUCxo6evK/rFkpPS5ybRmomZ5BrnES?=
 =?iso-8859-1?Q?URx7Vuf1t49+YlbOqm4RdsDAlc7nAZeKeDx6WXrMbw9RgxfNIy/Q/o/KyY?=
 =?iso-8859-1?Q?Q4gDBVAHCANeuyx7psg8GnE1+mJJ6jNjlh4Zlk9goVL77MSeTLbRSLkMM0?=
 =?iso-8859-1?Q?TM13m+JN28xet5C65kQIHzE7d/cSEyxtHdIDig3Ex8RlXyf4s798eZxaOv?=
 =?iso-8859-1?Q?8NbDcrRjZDtQ/pqcb/C1Nh6FRNZn2YduFsbb6RS/NyH/lYMvSOKKAMdPhY?=
 =?iso-8859-1?Q?UfiQDXo9AJnVF4sQYN7pu6BXJFg8eKVA44QM3+i9L4nuuTtbDdLN+/T06k?=
 =?iso-8859-1?Q?CziNo+19jwYDzjBPk8idof6LNNDBLLG7fjzzAenvyOgAx4RfwHkHq1x9i5?=
 =?iso-8859-1?Q?VozTimszI9nLS2HjUJUTPENzTfTmTqxWil3ODZgKEimxNyWLxWkvLxB7OM?=
 =?iso-8859-1?Q?iX8siVBT2hMD8zl3MGu1auNqH28pbT5q3gYOcT00UYagJykzDsxbZ7peti?=
 =?iso-8859-1?Q?wxBdyARYln6QfNDZax477i8fXTxjxlw8tRh5gyf2NV4nnfuo4wqaFl4ZPQ?=
 =?iso-8859-1?Q?suVF+3hMYjP/MwI2pqKcfwrqsAUVOmy/qIg2VKwVBe2a8xpnTiSJpkyy2S?=
 =?iso-8859-1?Q?LIkbFUUgBUav027FsVRcobGa7uHc56LHTrgh05Ht0aWS7jxrrX63HAlcLF?=
 =?iso-8859-1?Q?GuF+xS8bgh4qRdcevINLjAj0qWIV0aAN3pyytsfszoHdM9ndfbWLqTqBPu?=
 =?iso-8859-1?Q?9ELngf45hvI/i2A/Sts7wqeSUDAUVbrLKuQ+K7HJ2Yf/HnBIYIgYc6ZRa4?=
 =?iso-8859-1?Q?mHXpqMnlJ/2jwK9Qqpf7G4o7o0st95AwfV912MIbHsqti55uwrp2OxJO/z?=
 =?iso-8859-1?Q?3pwSrLIxWYQ/GUwA6KdLwS6vp1nPWXLcYMQf6mV9PApeIjaNswAYoHZo9j?=
 =?iso-8859-1?Q?AbcFH6XX+BpaQHdaNuqFI8CuT1j2Yve5WBJiwqMLaSUUY+7HK9H93OdYVW?=
 =?iso-8859-1?Q?YpJOAgDYUh5T57bpwW9YkatCkeefsVD95nKCKdxgOSV16ryMxZSeRS+XR7?=
 =?iso-8859-1?Q?IT/XFNegvOc4l1lsHvArN0dFLqCPBB6NPrUvq/hUyz61TUSWDBaMmdOx4X?=
 =?iso-8859-1?Q?BQMisYy4fLQ9I5AXcB+5qEcF3ArlCux3XnNy1FN0jZSKpBBbzNPjJFN4Ug?=
 =?iso-8859-1?Q?pbGfnb+PomQXHseR81KX0szmLjkuHB7NfHqemSeYsar1AXcdofv3abjFSj?=
 =?iso-8859-1?Q?jmIqoS4+HZlCGGHhMd68DKg9DX+baCccYVrlcRVj/1SC5zAAHXaUhbydbw?=
 =?iso-8859-1?Q?qxa4ELkzznmlNf3GDto8mXQh2hnAg2DChfjxxzkSBeKoIVq1M7M/z8isQC?=
 =?iso-8859-1?Q?HxPecbAH4pW865dauJ8N2F8sjV5OHp22ByO9p5rNRPJpsbIgTvU73HglgM?=
 =?iso-8859-1?Q?GtBw4OhzTPnWHFY9YXTy1SUBu/hxmDWFYdbOf37VKujUWAKVYJetK9XkJE?=
 =?iso-8859-1?Q?hHG4C/lr1PiNNf4RKRSEbURfSa9giXrOP5LEUU+RHGX2Rq6kuqtrUU1giU?=
 =?iso-8859-1?Q?Vn11F47lbXGNrRfAi+/zDqYyHm9lbKcUoIYotWnxDlJST7H7bFZx/Elg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9959f410-01e1-43d2-7612-08dd62fcff08
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 13:34:50.6048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z0LBuDDp2ZQjQD4Vg23xrZ4s5otsDTd78ghvLS7hA/uLI8zuH3UEV0TT6G3qR2239uFn2MjNRwc/M/CKSXkUSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7950

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
 xen/common/device-tree/device-tree.c  | 91 +++++++++++++++++++++++++++
 xen/drivers/passthrough/device_tree.c | 42 +++++++++++++
 xen/drivers/passthrough/iommu.c       | 15 +++++
 xen/include/xen/device_tree.h         | 23 +++++++
 xen/include/xen/iommu.h               | 40 +++++++++++-
 5 files changed, 210 insertions(+), 1 deletion(-)

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
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iomm=
u.c
index 9e74a1fc72..dfaca67302 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -20,6 +20,7 @@
 #include <xen/param.h>
 #include <xen/softirq.h>
 #include <xen/keyhandler.h>
+#include <xen/acpi.h>
 #include <xsm/xsm.h>
=20
 #ifdef CONFIG_X86
@@ -744,6 +745,20 @@ int __init iommu_get_extra_reserved_device_memory(iomm=
u_grdm_t *func,
     return 0;
 }
=20
+#ifdef CONFIG_ARM
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
+#endif
+
 /*
  * Local variables:
  * mode: C
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
index b928c67e19..82319016a1 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -215,7 +215,8 @@ int iommu_dt_domain_init(struct domain *d);
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
@@ -225,6 +226,19 @@ int iommu_release_dt_devices(struct domain *d);
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
@@ -238,8 +252,32 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, stru=
ct domain *d,
  */
 int iommu_remove_dt_device(struct dt_device_node *np);
=20
+#else /* !HAS_DEVICE_TREE */
+static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
+{
+    return -EOPNOTSUPP;
+}
+
 #endif /* HAS_DEVICE_TREE */
=20
+/*
+ * This function is not strictly ARM-specific, but it is only used by ARM
+ * as of now. So wrap it with ifdef to avoid creating dead code on other
+ * architectures. When usage is extended to other architectures, this ifde=
f
+ * should be removed.
+ */
+#ifdef CONFIG_ARM
+/*
+ * Fills out the device's IOMMU fwspec with IOMMU ids.
+ *
+ * Return values:
+ *  0 : iommu_fwspec is filled out successfully.
+ * <0 : error while filling out the iommu_fwspec.
+ * >0 : IOMMU is not enabled/present or device is not connected to it.
+ */
+int iommu_add_pci_sideband_ids(struct pci_dev *pdev);
+#endif
+
 struct page_info;
=20
 /*
--=20
2.34.1

