Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1571B446DE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110737.1459814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG9W-00081G-Iq; Thu, 04 Sep 2025 20:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110737.1459814; Thu, 04 Sep 2025 20:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG9W-0007zt-Dj; Thu, 04 Sep 2025 20:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1110737;
 Thu, 04 Sep 2025 20:01:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG9U-00062f-Ka
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:01:48 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb53b42a-89c9-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 22:01:44 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:42 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:42 +0000
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
X-Inumbo-ID: fb53b42a-89c9-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClLDr0qni1HBWAl7djD3UP+zzlHfMooTvx6iJV3g9yoltysC9BQXR2ZuV4DNzTST3ed8Z4U18+CX++nEw34E4JGMyQOR3mgXgxew/FvzDc/W3wL0Ua9qzqfPeHpdDGXI81zz3yQ4rCPtvi4KBOrpJiirvDX1SsefuH9mbKfou0PKV7VMij2H1LFlLy5F2YXFC4o5TDYzcX2NxXM+Zyes169eq/DFm49BMu25O0NSrjAWwDDcYIP7669DR8rw2Aiz1JtatXpOBoRzIJlfwqnEMbcYLYQiszNqtWHUJiNX7D298otmDI1vXV1E6gLTA3ljYZGen33aX+sO25gtXkE4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwEideHyBWH5HBdcPZEG3XzSkmnV4wroH/dA6t1HAZQ=;
 b=jOU4FTSpSOFZ83KYZXVbIvDpdUNxa8hfFAraJHLXXkQGRGglAxqzaQm5qRiJQ4ohY/AQaBQP1DjrwJRh5sOD85Jd4oZSFQDVlR4cwV2xD7JRFPNc5HA4+w3TecYDvHHCSTD0XzrPSeNHPjJrd3T4GvprLeiWBlvdG7aJbnDS5kNpR7WEa6zj/kNzThjhr5jQNF73jBlMRbjuZSveG+s/X8sW99PgB0hEJRu3fOooEo3Wd0wQ5JE0N7/OKCIKzmbmVCg3n9modoihBTlOVKnX4lg+4t/SKrdzSX3Q414xO6Llv7Y6cPFFIbxfIquyeUyUBwRpJqA+fyQha+1zAG6pcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwEideHyBWH5HBdcPZEG3XzSkmnV4wroH/dA6t1HAZQ=;
 b=WfpdAVdW1apVmKrHume4+l5ITi1HTxjjpv6hJcy2wyFKTALCA0Q77KPvmVUGPLZdF9Syv8VMmXz9ZbEMBQY7yCsBomBCw1+EXwO1/yCD67YjuPDbvoRfu9QVJmU1+D8kQE6i1X3m4g6SMXuhsyBVhOMTLWHmWZzktGnlsrtr9TKHMvMawEsYWVud8nQImWGmO/B8XDy4IP52Z/fwcJyR6X+oYzAYElaf/Wjhu8GGIbZCOPx3er+J09oxm8ayI8g5PO1hc62we/KXvLDpPx9DdjAGG/MNa+hFnhOL35OZFv5GMbuJEShOFngEL78AKG50n6F0XD+OvEsH9j4za6plxg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH v7 08/12] xen/arm: vgic: add resource management for extended
 SPIs
Thread-Topic: [PATCH v7 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcHda7K0pyLOwxO0S0jgjHf9IKGA==
Date: Thu, 4 Sep 2025 20:01:42 +0000
Message-ID:
 <5b34940bbc90c4144f4d91880524f452d974d14a.1757015865.git.leonid_komarianskyi@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10974:EE_
x-ms-office365-filtering-correlation-id: 3c9c3d6c-b2cb-42f3-97f1-08ddebedde09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?IcFXbsq48jlms575+Gsq7/gId1IwOidgJuYlowu8rNksV6whPJfuD8aOfV?=
 =?iso-8859-1?Q?Kva4UVyX4asiHhrii9c5Mlf20OMKFfXQD7f5JUVtwHdoHcmVvL0sbiRdq6?=
 =?iso-8859-1?Q?IkWPyvHAaJC876wLIhdAT3pd+qMW7bWQDQNfugyqvw2XFafE70sAdkhlJ9?=
 =?iso-8859-1?Q?+tVsgN/CkBAic9ywokRaC4oaTJ05RIMbwD+6qInGBp4vhU1VP0yHmlk/N7?=
 =?iso-8859-1?Q?PDfUtb2pwiZYcaPBmGo8OZ/whMvAwMDBckB5qt08YZYbs0Fy8ODpovHhQy?=
 =?iso-8859-1?Q?6RoaJ1JIorhtGqPm00I8TIzKenCUJQnVCQTPqBRRIOuYj8SAqOtwV2xXHB?=
 =?iso-8859-1?Q?vF9C2QeILu0dWsBt0uoVgbxU3Jf9MY6klvn/aOioKV4ghTmU3GIh0tF16D?=
 =?iso-8859-1?Q?4PLUclL1O0ROa/vQSOD99WPMKgsOMqZ3MRULd69BYL/huhc8wzvdRJrBLp?=
 =?iso-8859-1?Q?MPHyJnLU5tzA9+ODiGolSav9m9ylU3Wue31ZwxYqpWOsibDjFNRdchN4LB?=
 =?iso-8859-1?Q?WGNWT25I/Ssol/mwW2QJaTDCT2NQPm0yhapFpYWHHfBfDiTXbu+pTotQs/?=
 =?iso-8859-1?Q?tgt/rKPecOcmLtDvESIs3i25XvgUlkKcGjfeDvc0VlSGYZikrAuQUMxLlY?=
 =?iso-8859-1?Q?sm6DioAoMIx3tZ3zVUttorl4eTSswiyg1cpBF5tmXSQOGAK1FD/JXDnXnM?=
 =?iso-8859-1?Q?6Mmg6dOHRAbXbTPMG+dIr2acRI/LVGoNWBsPtWGHserHLdeHmTb4Zw4tE0?=
 =?iso-8859-1?Q?1ZChptIUbeLAVRH5IUTxFL0tefw+akccub9ivBkcnx6nHOA1z+ZmbyTLE9?=
 =?iso-8859-1?Q?f8VhIY263DK78LZytzvI3mcNlPavr+ZxqNaLyLwwL1XnyyKb1W8MNfCOSV?=
 =?iso-8859-1?Q?CgZIIeakHmT87wRMwyjHmrkxOqq2+p3iZdW90pwx+EIpiXaQuPDgLDp8cB?=
 =?iso-8859-1?Q?Sa1TEaIp324pZHbgqhgEuUSb9fN+oO5ck1DJbfpRhscyss4aDpNNct48re?=
 =?iso-8859-1?Q?9CtEWoh4Q0AZlY+iz49iZweOtbu9N3AOhVKV8CFESwprGJCxoRkQyiKTzF?=
 =?iso-8859-1?Q?EnTgaYLc8U7wghqcUY00/NnVBjsgWZoV+ipFTxdBe/2FF8WD3OUHsMbH73?=
 =?iso-8859-1?Q?q70ffTOd2Tl1uSYrc6+JjZQfKPaLbvjWiWi4HRYyxtus5zbxVDJFO9LYeg?=
 =?iso-8859-1?Q?zqqNyYh7EWKwK9uAVXEId3uHcFPc7eofLXRyiCuJaHg5zGBjTkxAdD/wf5?=
 =?iso-8859-1?Q?ivnszpWwVuKGJERQUXyqAttVOI6VGy62wLO62X/8dOfSdrmrO1CSsHuLlF?=
 =?iso-8859-1?Q?DYISRz6PHkR4jW7WuufwhDMGNJr3n+H7Y2tiA7FPUdCoILmZgdWLtfnhmt?=
 =?iso-8859-1?Q?buJ/qfOXNjiLhPkgOmNQ0qL35yPf5Wgu+7+cUA/IZcl+WFYysQCrvY7wcT?=
 =?iso-8859-1?Q?YWltKEdlmrPrAMIKHpoMkNhu78gdfT7wk9qcIhhtA4RTRtd3kkxEzdZBsf?=
 =?iso-8859-1?Q?wWqNKJFU0yQwFMnaDe6R3zoGbDWuM4bRPTdKrzKe1McA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1t/HZczFzwNEfu8EaBQIxhfzS1t9XfAZvTie4aa1DZLExP4wcKFPNJ5uoj?=
 =?iso-8859-1?Q?KZJ46RMpEXPjacXXgKoorAIOb9GP42+3BVvW57mQ9ryIf/EbSeDjBb207O?=
 =?iso-8859-1?Q?574VmTN7xYr7XXyY4tWHFwqvLZr4hk8bZqnQXoIC0Pp37OjUao5aKbixdr?=
 =?iso-8859-1?Q?HJ9NpAyHlSqVDdgfPwaSd5cg4SGDtNfCiHrqLFxCr47VS3HKK/Up6R6OmT?=
 =?iso-8859-1?Q?w+eJSgKjY032kRk5xsHVEiP0uTyK8KoKBptlailJCAoGDeZlfWx1amkGax?=
 =?iso-8859-1?Q?1l75RjuKqFSCyNloyaCINCC8L5ukOMQgzQctnYsd4PcEIZpBQrUOd4qAme?=
 =?iso-8859-1?Q?zpD3Q4LieCFjVvlTQfK0QheNRMA04J9rI7m9Y+9UfCa6P1ZWXwOJY/8bxQ?=
 =?iso-8859-1?Q?zR+94kyDSFU1O33Tz5Y8m2wrKj0RZlWxn7pfdOnYePTOFcKtyrup2iN0v8?=
 =?iso-8859-1?Q?6ZpyrvUXoea0dvuci4b27R6wSByqVaZXVGD9qIrKXv702YU61dOB8o0JvZ?=
 =?iso-8859-1?Q?3afLLcNf62mcLiIFerAuakRXWb0B2DT8AFDW3c2AoISDp/LV+E6TkxCjuQ?=
 =?iso-8859-1?Q?D0qnx90F1zMURLuOyIZX6UlvZ/0w7cEN3DpbbRLN1eGrphWLPXM+NOT8fZ?=
 =?iso-8859-1?Q?qw3NjX895e6uqRlxF5CvhL58IkJx3tql/mObQlAc2C4Lw0292kUsxHRpb0?=
 =?iso-8859-1?Q?hJrjmr4xahpScxVYYoBgMcxamkzpSFDYNlxcXwU9LjRYC/klqpG7zab+rj?=
 =?iso-8859-1?Q?gcwqNxA+L16JpUoEPKgSHJP7kR8BxyV8kg76C5nDaG+njeHHfhDSXXMJZc?=
 =?iso-8859-1?Q?s1co984poQ8AGKg4UUmxhiq6MFmWOKFIj9zQOueUZjX/2fqeSTlfbgRviZ?=
 =?iso-8859-1?Q?6bxIBaG9mRJOCvraXIXZiqJbAKhI/u6UPt09uJd52e/N1+YoTOOx5HGVzV?=
 =?iso-8859-1?Q?xGEJzpF9LEGi/27bv+UISJUHggQdvvb4Y+fBdLWhIXoUgVSF+z3aqGxh+g?=
 =?iso-8859-1?Q?pDP1S4z0ASqoHa1ckpTYQdfFrKBPaPwwKfmb7m0bfTkPKMox7iy/8lg1RM?=
 =?iso-8859-1?Q?3bh3v4qgTffUAoygQDbe7hr2xveVbN4QkUqsw6GIvUB++RuFiZdmA+U/++?=
 =?iso-8859-1?Q?qO34Efs9XPy4jHIPPH7yQlyFWLsh4DSxJrY0dmZE9CEyjWOZQn2FrBGJIj?=
 =?iso-8859-1?Q?reNaFRR/aYiNNi1c2LhVHoaNRgQqzj0Qw53bz8EbACfW0UaJSKt02vgJaV?=
 =?iso-8859-1?Q?uWiX+chQcnBeD7BhunOe3mxxjVihii0SuJNXz3407Rj07tbP7/Wy79i6cP?=
 =?iso-8859-1?Q?xhHLYNk/8xBUuM0YjEiMt9G7HV7HSlyiPn6ajqTo6DUi7qRhcmNc4k/kZv?=
 =?iso-8859-1?Q?AJLMPBaZ0FaPExI91FqszJX9GnqXTfw4rpeqkewUV5Zs5YoMr2NuVny6FI?=
 =?iso-8859-1?Q?bq6K2v0ZgjvEGY9UEgzVhDBy8H4rghCTBFLXIM+46jH0YiHVkIyQgSKz2Y?=
 =?iso-8859-1?Q?oFMO1qSIZWHW28vY8B+0ilgMxB3jW66PtlE567es+DvJfA8FSTownZTvqM?=
 =?iso-8859-1?Q?agSBTZuPcRI78F/Pp7RmjprjZAP2ysizudG13PFg3uqyrQ7GjvLm/5nCHS?=
 =?iso-8859-1?Q?A94hiYorhGxs++P3kNdMU3l8DgVCMsU5ZN1RPAAtDFPyKspP/abMqjm3+n?=
 =?iso-8859-1?Q?5zyAIRWk2bYogQByg/I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9c3d6c-b2cb-42f3-97f1-08ddebedde09
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:42.0865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6/MP+NKlmzzt4qMmW4wGLJw+ei+/CUulYuOIqLVb76v5CcBjpkwbWfgm06icjelgwkTXgmC0DssYCz/6McNDHptAlzelSUL6BfUSL9MMsDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

This change introduces resource management in the VGIC to handle
extended SPIs introduced in GICv3.1. The pending_irqs and
allocated_irqs arrays are resized to support the required
number of eSPIs, based on what is supported by the hardware and
requested by the guest. A new field, ext_shared_irqs, is added
to the VGIC structure to store information about eSPIs, similar
to how shared_irqs is used for regular SPIs.

Since the eSPI range starts at INTID 4096 and INTIDs between 1025
and 4095 are reserved, helper macros are introduced to simplify the
transformation of indices and to enable easier access to eSPI-specific
resources. These changes prepare the VGIC for processing eSPIs as
required by future functionality.

The initialization and deinitialization paths for vgic have been updated
to allocate and free these resources appropriately. Additionally,
updated handling of INTIDs greater than 1024, passed from the toolstack
during domain creation, and verification logic ensures only valid SPI or
eSPI INTIDs are used.

The existing SPI behavior remains unaffected when guests do not request
eSPIs, GIC hardware does not support them, or the CONFIG_GICV3_ESPI
option is disabled.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Changes in V7:
- minor: changed hardcoded value of 32 to NR_LOCAL_IRQS
- minor: used local variable idx in spi_to_pending() and vgic_reserve_virq(=
)
- minor: added a comment for allocated_irqs and pending_irqs with index
  mappings
- added reviewed-by from Oleksandr Tyshchenko

Changes for V6:
- introduced a new function for index to virq conversion, idx_to_virq.
  This allows the removal of eSPI-specific functions and enables the
  reuse of existing code for regular SPIs
- fixed the return value of vgic_allocate_virq in the case of eSPI
- updated the error message in route_irq_to_guest(). To simplify it and
  avoid overcomplicating with INTID ranges, propose removing the
  information about the max number of IRQs
- fixed eSPI rank initialization to avoid using EXT_RANK_IDX2NUM for
  converting the eSPI rank to the extended range
- updated the recalculation logic to avoid the nr_spis > 1020 -
  NR_LOCAL_IRQS check when nr_spis is reassigned in the case of eSPI
- fixed formatting issues for macros
- minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
  into appropriate inline functions introduced in the previous patch
- minor change: changed int to unsigned int for nr_espis

Changes in V5:
- removed the has_espi field because it can be determined by checking
  whether domain->arch.vgic.nr_espis is zero or not
- since vgic_ext_rank_offset is not used in this patch, it has been
  moved to the appropriate patch in the patch series, which implements
  vgic eSPI registers emulation and requires this function
- removed ifdefs for eSPI-specific macros to reduce the number of ifdefs
  and code duplication in further changes
- fixed minor nit: used %pd for printing domain with its ID

Changes in V4:
- added has_espi field to simplify determining whether a domain is able
  to operate with eSPI
- fixed formatting issues and misspellings

Changes in V3:
- fixed formatting for lines with more than 80 symbols
- introduced helper functions to be able to use stubs in case of
  CONFIG_GICV3_ESPI disabled, and as a result, reduce the number of
  #ifdefs
- fixed checks for nr_spis in domain_vgic_init
- updated comment about nr_spis adjustments with dom0less mention
- moved comment with additional explanations before checks
- used unsigned int for indexes since they cannot be negative
- removed unnecessary parentheses
- move vgic_ext_rank_offset to the below ifdef guard, to reduce the
  number of ifdefs

Changes in V2:
- change is_espi_rank to is_valid_espi_rank to verify whether the array
  element ext_shared_irqs exists. The previous version, is_espi_rank,
  only checked if the rank index was less than the maximum possible eSPI
  rank index, but this could potentially result in accessing a
  non-existing array element. To address this, is_valid_espi_rank was
  introduced, which ensures that the required eSPI rank exists
- move gic_number_espis to
  xen/arm: gicv3: implement handling of GICv3.1 eSPI
- update vgic_is_valid_irq checks to allow operating with eSPIs
- remove redundant newline in vgic_allocate_virq
---
 xen/arch/arm/include/asm/vgic.h |  26 ++++-
 xen/arch/arm/irq.c              |   3 +-
 xen/arch/arm/vgic.c             | 180 +++++++++++++++++++++++++++++---
 3 files changed, 193 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 3e7cbbb196..caffea092b 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -144,11 +144,25 @@ struct vgic_dist {
     spinlock_t lock;
     uint32_t ctlr;
     int nr_spis; /* Number of SPIs */
-    unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
+    /*
+     * Bitmap of allocated IRQs with the following index mapping:
+     * Local IRQs [0..31]
+     * Regular SPIs [32..nr_spis + 31]
+     * Optional, if supported:
+     * Extended SPIs [nr_spis + 32..nr_spis + nr_espis + 31]
+     */
+    unsigned long *allocated_irqs;
     struct vgic_irq_rank *shared_irqs;
+#ifdef CONFIG_GICV3_ESPI
+    struct vgic_irq_rank *ext_shared_irqs;
+    unsigned int nr_espis; /* Number of extended SPIs */
+#endif
     /*
      * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
-     * struct arch_vcpu.
+     * struct arch_vcpu. The index mapping is as follows:
+     * Regular SPIs [0..nr_spis - 1]
+     * Optional, if supported:
+     * eSPIs [nr_spis..nr_spis + nr_espis - 1]
      */
     struct pending_irq *pending_irqs;
     /* Base address for guest GIC */
@@ -243,6 +257,14 @@ struct vgic_ops {
 /* Number of ranks of interrupt registers for a domain */
 #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
=20
+#ifdef CONFIG_GICV3_ESPI
+#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis + 31) / 32)
+#endif
+#define EXT_RANK_MIN (ESPI_BASE_INTID / 32)
+#define EXT_RANK_MAX ((ESPI_MAX_INTID + 31) / 32)
+#define EXT_RANK_NUM2IDX(num) ((num) - EXT_RANK_MIN)
+#define EXT_RANK_IDX2NUM(idx) ((idx) + EXT_RANK_MIN)
+
 #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
 #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
=20
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index c934d39bf6..c2f1ceb91f 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -494,8 +494,7 @@ int route_irq_to_guest(struct domain *d, unsigned int v=
irq,
     if ( !vgic_is_valid_line(d, virq) )
     {
         printk(XENLOG_G_ERR
-               "the vIRQ number %u is too high for domain %u (max =3D %u)\=
n",
-               irq, d->domain_id, vgic_num_irqs(d));
+               "invalid vIRQ number %u for domain %pd\n", irq, d);
         return -EINVAL;
     }
=20
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 2bbf4d99aa..878daa71d4 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -25,11 +25,61 @@
 #include <asm/vgic.h>
=20
=20
+static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
+{
+    if ( idx >=3D vgic_num_irqs(d) )
+        return espi_idx_to_intid(idx - vgic_num_irqs(d));
+
+    return idx;
+}
+
 bool vgic_is_valid_line(struct domain *d, unsigned int virq)
 {
+#ifdef CONFIG_GICV3_ESPI
+    if ( virq >=3D ESPI_BASE_INTID &&
+         virq < espi_idx_to_intid(d->arch.vgic.nr_espis) )
+        return true;
+#endif
+
     return virq < vgic_num_irqs(d);
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * Since eSPI indexes start from 4096 and numbers from 1024 to
+ * 4095 are forbidden, we need to check both lower and upper
+ * limits for ranks.
+ */
+static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
+{
+    return rank >=3D EXT_RANK_MIN &&
+           EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d);
+}
+
+static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
+                                                       unsigned int rank)
+{
+    return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
+}
+
+#else
+static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
+{
+    return false;
+}
+
+/*
+ * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn,
+ * because in this case, is_valid_espi_rank will always return false.
+ */
+static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
+                                                       unsigned int rank)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+#endif
+
 static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
                                                   unsigned int rank)
 {
@@ -37,6 +87,8 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct =
vcpu *v,
         return v->arch.vgic.private_irqs;
     else if ( rank <=3D DOMAIN_NR_RANKS(v->domain) )
         return &v->domain->arch.vgic.shared_irqs[rank - 1];
+    else if ( is_valid_espi_rank(v->domain, rank) )
+        return vgic_get_espi_rank(v, rank);
     else
         return NULL;
 }
@@ -117,6 +169,54 @@ int domain_vgic_register(struct domain *d, unsigned in=
t *mmio_count)
     return 0;
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+static unsigned int vgic_num_spi_lines(struct domain *d)
+{
+    return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
+}
+
+static int init_vgic_espi(struct domain *d)
+{
+    unsigned int i, idx;
+
+    if ( d->arch.vgic.nr_espis =3D=3D 0 )
+        return 0;
+
+    d->arch.vgic.ext_shared_irqs =3D
+        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
+    if ( d->arch.vgic.ext_shared_irqs =3D=3D NULL )
+        return -ENOMEM;
+
+    for ( i =3D d->arch.vgic.nr_spis, idx =3D 0;
+          i < vgic_num_spi_lines(d); i++, idx++ )
+        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
+                              espi_idx_to_intid(idx));
+
+    for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
+        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i],
+                       EXT_RANK_IDX2NUM(i), 0);
+
+    return 0;
+}
+
+#else
+static int init_vgic_espi(struct domain *d)
+{
+    return 0;
+}
+
+static unsigned int vgic_num_spi_lines(struct domain *d)
+{
+    return d->arch.vgic.nr_spis;
+}
+
+#endif
+
+static unsigned int vgic_num_alloc_irqs(struct domain *d)
+{
+    return vgic_num_spi_lines(d) + NR_LOCAL_IRQS;
+}
+
 int domain_vgic_init(struct domain *d, unsigned int nr_spis)
 {
     int i;
@@ -133,7 +233,39 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
_spis)
=20
     /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988  =
*/
     if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
+#ifndef CONFIG_GICV3_ESPI
         return -EINVAL;
+#else
+    {
+        /*
+         * During domain creation, the dom0less DomUs code or toolstack
+         * specifies the maximum INTID, which is defined in the domain
+         * config subtracted by 32 to cover the local IRQs (please see
+         * the comment to VGIC_DEF_NR_SPIS). To compute the actual number
+         * of eSPI that will be usable for, add back 32 (NR_LOCAL_IRQS).
+         */
+        nr_spis +=3D NR_LOCAL_IRQS;
+        if ( nr_spis > espi_idx_to_intid(NR_ESPI_IRQS) )
+            return -EINVAL;
+
+        if ( nr_spis >=3D ESPI_BASE_INTID )
+        {
+            unsigned int nr_espis =3D min(nr_spis - ESPI_BASE_INTID, 1024U=
);
+
+            /* Verify if GIC HW can handle provided INTID */
+            if ( nr_espis > gic_number_espis() )
+                return -EINVAL;
+
+            d->arch.vgic.nr_espis =3D nr_espis;
+            /* Set the maximum available number for regular SPIs */
+            nr_spis =3D VGIC_DEF_NR_SPIS;
+        }
+        else
+        {
+            return -EINVAL;
+        }
+    }
+#endif
=20
     d->arch.vgic.nr_spis =3D nr_spis;
=20
@@ -145,7 +277,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_=
spis)
         return -ENOMEM;
=20
     d->arch.vgic.pending_irqs =3D
-        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
+        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
     if ( d->arch.vgic.pending_irqs =3D=3D NULL )
         return -ENOMEM;
=20
@@ -156,12 +288,16 @@ int domain_vgic_init(struct domain *d, unsigned int n=
r_spis)
     for ( i =3D 0; i < DOMAIN_NR_RANKS(d); i++ )
         vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
=20
+    ret =3D init_vgic_espi(d);
+    if ( ret )
+        return ret;
+
     ret =3D d->arch.vgic.handler->domain_init(d);
     if ( ret )
         return ret;
=20
     d->arch.vgic.allocated_irqs =3D
-        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
+        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_alloc_irqs(d))=
);
     if ( !d->arch.vgic.allocated_irqs )
         return -ENOMEM;
=20
@@ -182,9 +318,12 @@ void domain_vgic_free(struct domain *d)
     int i;
     int ret;
=20
-    for ( i =3D 0; i < (d->arch.vgic.nr_spis); i++ )
+    for ( i =3D NR_LOCAL_IRQS; i < vgic_num_alloc_irqs(d); i++ )
     {
-        struct pending_irq *p =3D spi_to_pending(d, i + 32);
+        struct pending_irq *p;
+        unsigned int virq =3D idx_to_virq(d, i);
+
+        p =3D spi_to_pending(d, virq);
=20
         if ( p->desc )
         {
@@ -198,6 +337,9 @@ void domain_vgic_free(struct domain *d)
     if ( d->arch.vgic.handler )
         d->arch.vgic.handler->domain_free(d);
     xfree(d->arch.vgic.shared_irqs);
+#ifdef CONFIG_GICV3_ESPI
+    xfree(d->arch.vgic.ext_shared_irqs);
+#endif
     xfree(d->arch.vgic.pending_irqs);
     xfree(d->arch.vgic.allocated_irqs);
 }
@@ -323,10 +465,12 @@ void arch_move_irqs(struct vcpu *v)
      */
     ASSERT(!is_lpi(vgic_num_irqs(d) - 1));
=20
-    for ( i =3D 32; i < vgic_num_irqs(d); i++ )
+    for ( i =3D NR_LOCAL_IRQS; i < vgic_num_alloc_irqs(d); i++ )
     {
-        v_target =3D vgic_get_target_vcpu(v, i);
-        p =3D irq_to_pending(v_target, i);
+        unsigned int virq =3D idx_to_virq(d, i);
+
+        v_target =3D vgic_get_target_vcpu(v, virq);
+        p =3D irq_to_pending(v_target, virq);
=20
         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
             irq_set_affinity(p->desc, cpu_mask);
@@ -539,15 +683,22 @@ struct pending_irq *irq_to_pending(struct vcpu *v, un=
signed int irq)
     else if ( is_lpi(irq) )
         n =3D v->domain->arch.vgic.handler->lpi_to_pending(v->domain, irq)=
;
     else
-        n =3D &v->domain->arch.vgic.pending_irqs[irq - 32];
+        n =3D spi_to_pending(v->domain, irq);
     return n;
 }
=20
 struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
 {
+    unsigned int idx;
+
     ASSERT(irq >=3D NR_LOCAL_IRQS);
=20
-    return &d->arch.vgic.pending_irqs[irq - 32];
+    if ( is_espi(irq) )
+        idx =3D espi_intid_to_idx(irq) + d->arch.vgic.nr_spis;
+    else
+        idx =3D irq - NR_LOCAL_IRQS;
+
+    return &d->arch.vgic.pending_irqs[idx];
 }
=20
 void vgic_clear_pending_irqs(struct vcpu *v)
@@ -665,10 +816,15 @@ bool vgic_emulate(struct cpu_user_regs *regs, union h=
sr hsr)
=20
 bool vgic_reserve_virq(struct domain *d, unsigned int virq)
 {
+    unsigned int idx =3D virq;
+
     if ( !vgic_is_valid_line(d, virq) )
         return false;
=20
-    return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
+    if ( is_espi(virq) )
+        idx =3D espi_intid_to_idx(virq) + vgic_num_irqs(d);
+
+    return !test_and_set_bit(idx, d->arch.vgic.allocated_irqs);
 }
=20
 int vgic_allocate_virq(struct domain *d, bool spi)
@@ -685,7 +841,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
     else
     {
         first =3D 32;
-        end =3D vgic_num_irqs(d);
+        end =3D vgic_num_alloc_irqs(d);
     }
=20
     /*
@@ -700,7 +856,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
     }
     while ( test_and_set_bit(virq, d->arch.vgic.allocated_irqs) );
=20
-    return virq;
+    return idx_to_virq(d, virq);
 }
=20
 void vgic_free_virq(struct domain *d, unsigned int virq)
--=20
2.34.1

