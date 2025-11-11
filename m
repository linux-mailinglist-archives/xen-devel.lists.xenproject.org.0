Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B86C4F54F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 18:54:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159198.1487583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsZR-0000eR-Sb; Tue, 11 Nov 2025 17:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159198.1487583; Tue, 11 Nov 2025 17:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsZR-0000c9-Pj; Tue, 11 Nov 2025 17:54:21 +0000
Received: by outflank-mailman (input) for mailman id 1159198;
 Tue, 11 Nov 2025 17:54:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIsZQ-0000bw-CB
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 17:54:20 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72416e1f-bf27-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 18:54:19 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by PAXPR03MB8249.eurprd03.prod.outlook.com
 (2603:10a6:102:24f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 17:54:16 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:54:16 +0000
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
X-Inumbo-ID: 72416e1f-bf27-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+7nLabN2fiZ4MYB244mEZoMckMO83NAPHMpWfbW17ztClvcNR67kuudt599TZlbCLuWBlJmHLzLuIyeaDl7LxKugUmjZh5DXfVG826wAnePs40JjVARw+mu5lH5eM7ojbk8J92P5WM/Zt4gCNY4jdTvEakd8Kb0w+5CAhOlF+xktSH+tK1pcYEL4cg/2ymUKR4Ibdxh5fns8IM/lUdDaF344VJ18OQwQLY8VlTFfFZ8FP7NLBzz3z936CHqitcO6r4ETKbSHMlmIdF13sH4zxBD63p+rAxUGBAwGycFOcxt3FNXfrcaMlnpjogim2/vfl8PIQfle1JXek5wJ3bFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WStR14FRN9SDUmcVSXUNThnh8CjpvL+KrKqdZ8Ikji0=;
 b=UPxO0AcGjwUXFxKkGaePJsPNih1QwGwIoWPEfQlisItJELHp6fKKHgu1fwuOy8Fmb6dvriiGmFPrkOeZGtPjWRrqRx+qbpkQS9DKmaLKeCFkCPk24lzAHN3SlKzV30tqVaaqyIHv3/1XeYYQ1YfHBV7UN1x9+lGkRA50Fue6TmchMLQdwtlH9io+FPvu7ZD/2ztx0qVVVgjHNq6bHARPh2YC9VgLRoKCEkh8imzzwbzmg0Gar+7Zp2wyLEBE/UH79DaNaYLqKXgU6S40R8Gsm1rqr9qZafuP6VXKHolVVR/xM9VXIeVvrd02RW9TsiFS65Zt9lOgubqabCDh27pSdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WStR14FRN9SDUmcVSXUNThnh8CjpvL+KrKqdZ8Ikji0=;
 b=KlX2kLDLm5tkcUz43s99T7wwgtOOwbgMvNpZKCoVfTy9X2LFxuMYPksBFsFj4apkP6C/dIjjMDnP+y2fcyAkebp06qNDYrV5olw2jx7XkNUfCRXDtQ9uH8sUpFekmQQ4AOBjHpp5uBHADqCeGT+PevGh2gjTUat83uBz5ZapunwW3IZVa8XDSas6zNaN8oWCkhW7nOC56RDMeK3bWh7YYFvw1VGzhGdXgxiCSgQUKXkWWDZLnEuEN+BnLYB62B9V76rVosju77opWASL4Fd5CHMGpeIRWJ4A/4inRd98rgrRh+3B65SHTfL6HeRdXLg+Cul9eUnmQGNdCbsk/sywbg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [XEN][PATCH 0/5] x86: pvh: allow to disable 32-bit (COMPAT) interface
 support
Thread-Topic: [XEN][PATCH 0/5] x86: pvh: allow to disable 32-bit (COMPAT)
 interface support
Thread-Index: AQHcUzQyJNTOWnI1O026JOH0FraEjA==
Date: Tue, 11 Nov 2025 17:54:16 +0000
Message-ID: <20251111175413.3540690-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|PAXPR03MB8249:EE_
x-ms-office365-filtering-correlation-id: 5b2d6f69-9d40-4c60-345b-08de214b54d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?LeuOb4ruWkWZt289SgXiGIdTFPm48oIVH4nnCCwRqJrQu/GOp8pYs7gkIL?=
 =?iso-8859-1?Q?CiWb/g5Qjhd0qJb9mkTg8XUqzmdEh/HsgXba0UO//yhGlmeDa6zit+HmoB?=
 =?iso-8859-1?Q?JNj+GMfY2Bte8rimEkFya3LcXvEjveZOgsS2J+dMfAgpaG216PnxWbdbz7?=
 =?iso-8859-1?Q?aKOx560PVfqDte0hS+o16/bcXpQX8jfJOd9jpETj2tLpw+TLiPP30UYvSA?=
 =?iso-8859-1?Q?Hb/JhBUJorbn1DJHgve0uDUEMaEQxAhB5bVwJ2AvysPJjmj83KsAhInxTp?=
 =?iso-8859-1?Q?n0GU0H229AVdRQZXeWpV8FsVQaEpY/y50ix3Y2PDvNXx4oOWpU0P39poIG?=
 =?iso-8859-1?Q?JV8dg9qkaxv8QX9FB08UvkDBTO7qdkf6Af2IxuNMEoJBX0NYvQL6e2FBR/?=
 =?iso-8859-1?Q?64Qj8wrdJjCbGXebuRRYyEMPTA74ovmFbvbgguhkCy9drZ/LVXEPv0KHKT?=
 =?iso-8859-1?Q?UR0U46Wg4wPLrXtnGmS/E+eqqC3hj4r3pVsTme/WQf4f3G677PNBa/RM4s?=
 =?iso-8859-1?Q?0EaIxd7hlF+MAT0D8eZkWpDSWZD6cBAAbJEM2vwFw6HbnJXApfoiExmC6c?=
 =?iso-8859-1?Q?2yU20ttvO8u34KQC2ObJmGu6khMNlyKk6zQ4m/Kj21Sw0sTfUa/UWGUCD6?=
 =?iso-8859-1?Q?lgaXMAU5NKdshAbXvRfpGWmhjXPP0s7gBaaY/5h7IDYh4bzHkY31BqyHsx?=
 =?iso-8859-1?Q?b5vchnAG9Hb4PW+AKcjFCuxpQdTryegi6V+o6WeVM3oKBPxOND3g4AVdwx?=
 =?iso-8859-1?Q?zevLmgxWsfmnuW/OGSUdardTlCTHpEcn7iogkA8DRdxTOxf2IZwtOP3VVO?=
 =?iso-8859-1?Q?BFDTI0nc2y1ACEhr6t+09vw9R4yw4MLBSWT/TDzjbCn98ydCMZoi8zECO6?=
 =?iso-8859-1?Q?ca/9xQ2GMPQNBKfbqu+YHEBI9QT7BYQEGsOrihSRcjDE9/UkPF2G67md2H?=
 =?iso-8859-1?Q?9VdnKA9Ukl3wLx95eLCFad9QWt9g4o3wTkPtP17clrQvD/x9U+zTRwc4u7?=
 =?iso-8859-1?Q?Kkcu9ltNSsCO5FJne4mphjYeE1HUGiLZcgqpvNWoNddO1vtidJKQoV+g4c?=
 =?iso-8859-1?Q?YM0IC1iczOjLugmqPXh/Q/GgJZOhR4sq3MbUA1xArhZNDvP/njGQTAKuYM?=
 =?iso-8859-1?Q?qoY3JG0MCRGEj5F5nT5leOnvm1hzs9HVYLG9125utrBPIUAtGwGo1IWc+9?=
 =?iso-8859-1?Q?CnwIUt9NkAkxyJ4s9Df30/5pQcRry6Po4/tqZyBdz5dMNUXil8IX1cMIJB?=
 =?iso-8859-1?Q?2TPkQnnwoDK3vcWK7lItxKLmWoYIuJ7j2vzcEGe7rlMZYQuM3Qo5vsol26?=
 =?iso-8859-1?Q?4CTCDuBhka8CfCwh4LpxkouS/BfXi12LbDN3nsxkGd5t6jYbJWNHPV9xYN?=
 =?iso-8859-1?Q?hIC8kJkPHLtkZAFzlfnGG6j85EKwXk/X7sJXDz5ia8cuWFEEfc5BVx0Wfr?=
 =?iso-8859-1?Q?q9tdgdB2axegwlbjWM6mxpCauezHXvN8r9qxBOQVEOSR9EGHuyqf4pbRY/?=
 =?iso-8859-1?Q?1j0X7uvufDz8F2dIOa+NdsyTTHMbrGue2umdLGbfCW92GhCNekbHR5VtwH?=
 =?iso-8859-1?Q?XtL/hC0Vn/52ooj2h5E7jsddBVGi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MYUZDUqg+8m0OHqwtmsQktGRhaYFXw9DlhCkAynPJMoaRisrbFEzTdzUTd?=
 =?iso-8859-1?Q?1kwHZdvoGUl5MUZlm3PI6v+m7e1HhrehATd91G/IGUDlwJyYHTq3/TNlVk?=
 =?iso-8859-1?Q?kD7VGWxEvoT7Crdb2SEq6xquVePSYZiKeGVCVB+ESh2X56dy4xaGiPvvi7?=
 =?iso-8859-1?Q?cmyXdSmTtWP6lKgiMA5zcwoxVwFZ20YoIAKefOfws9fS7Bg4ANzQYujaes?=
 =?iso-8859-1?Q?ogorM6T18xn4EXQK4YOxEqV3Eo4CXEdeBXS/2LteDGmaUdGFQ1z4Sx4I8P?=
 =?iso-8859-1?Q?ezrjgGF4Zezdf44LIboKeXFaYVilgCBEDlFp9njLYMBKdEyeWhmGxKX5O8?=
 =?iso-8859-1?Q?b8+hafTU7un4ePQOUubvXOcd3mtfgiDoJihWse+9yir8X8F1mtSjeD/BEk?=
 =?iso-8859-1?Q?I+Fou+kqawMxQfF6Jge9usH8VJ/u7hE3Mz6qY8ZLyYoCiUdyD26SJVd49p?=
 =?iso-8859-1?Q?2q8iCH7dJF9Im0O0z7vpTJ/jKidVJfUScE5U1KLKJpS/91eCYD0Z9ZNhY2?=
 =?iso-8859-1?Q?ArZ7dXDpngXUR/YMeEk3ny1+Dmu4JJzO2DB1YH6mqnn6TC+/0rutbuwgaH?=
 =?iso-8859-1?Q?SF7UuwoK0qyJrqbeShchTqR9/V1MbSud+Eu81D3Ipnoo3qr5x1UjzERgoh?=
 =?iso-8859-1?Q?yzFX29XVGGU/FSnSqjXY4aGexyXIDqkByNnVoFwboOitt+ApbvyZr0Fvjx?=
 =?iso-8859-1?Q?wZkPJdUAE2QrjPorhhj97GMi6vpwQIbDTMHAKV0lGw/l3bQxbRRrTybYfE?=
 =?iso-8859-1?Q?PHhHKjaeDQtIxl1FsSnMLkfidg0mkMsGqyChzGA0bQ5hlEvWk2wHq+MEf3?=
 =?iso-8859-1?Q?VIQIFeMn8eag7R59+fxd/xh9gaNuzCe+HjTUuVxDWNQ0vcI4u5SasV7eXw?=
 =?iso-8859-1?Q?GJas+StHHGh3dAnACUmcoEYYq4bw4rSM2a8kc3nWuzs+3VSS2quacguwBy?=
 =?iso-8859-1?Q?cC1/MhxZsOA7+g+E1YT/kuGmzTJRNXCrGyOzvFNzKy/dw/UFZCXPtNjz8d?=
 =?iso-8859-1?Q?Pedt1/V0DSH8MYS4z7FoYWTz0x9AMngYV5CcsQ5c3yfRqufWCjHC1zmfb9?=
 =?iso-8859-1?Q?PZ2dccTFGiEc3GunrBfE007lWUVOyQ7nWlCwu2gszhDGCk9AKKTympVL3z?=
 =?iso-8859-1?Q?lV8SPeUrgJShKucpfBxcc8P0Y4aFc9qsWkBQo89obLtP1xFOyXXYR3CjtQ?=
 =?iso-8859-1?Q?kQbMNaIKPaRXDII9H4ET6k4a7Vzg3ij6OYPWhD6P7JfF9s4fGa4s9y0n74?=
 =?iso-8859-1?Q?+cbnZChWLWeMvnv+IqlerYejoPe3dB3tiRicMN99o2sthgNnEezPpPkVnk?=
 =?iso-8859-1?Q?jFeSwnZPM18ft9zWisd2/ZUONfnFBN0xcs2SDFOFywFi+5cXQw9QmNVZpd?=
 =?iso-8859-1?Q?a1BrmbZMyTECHksV6ImJFBFZtvNvd5qnxpwrhrPaT5eRhHC2k+QlWHeN8u?=
 =?iso-8859-1?Q?79YsyZlcLlpX8B9GGqkEadZ2QPonGTse//ilwWorbHZYEnhuCdXfNBVhhC?=
 =?iso-8859-1?Q?ZQipDVS4oqp2hH4IS+AJz7vBhQFl+8BV5joTSsQ2VcLQXIVKI12//qnEnU?=
 =?iso-8859-1?Q?V0FEAudXrB011GQUY8/1HK2iLIonsgVZHqZyLXZTDLGiUPTqJNmMcOVGG4?=
 =?iso-8859-1?Q?QAWPclACAbYhsOC4OvK0Ai5cVUKUFd9I8FdKFvyc9Pm61daFKQ0Me/kA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2d6f69-9d40-4c60-345b-08de214b54d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 17:54:16.2776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kmFArKMHdPcCIijJDrs3POEUmQeC6mJRbUYHbgJv9XMTc7Fn8qThmiPi+nk8PsqVmXOoakpwes0hIFhRq0GhaqMXlzoUvsu8pqmBnEh/Xf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8249

From: Grygorii Strashko <grygorii_strashko@epam.com>

Hi

This series introduces possibility to disable 32-bit (COMPAT) interface sup=
port
in the following cases:
      - Only PVH domains are used
      - Guests (OS) are started by using direct Direct Kernel Boot
      - Guests (OS) are 64-bit and Guest early boot code, which is running =
not
        in 64-bit mode, does not access Xen interfaces
        (hypercalls, shared_info, ..)

If above criterias are met the COMPAT HVM interface become unreachable and =
can be disabled.
Coverage reports analyze and adding guard (debug) exceptions in hvm_hyperca=
ll/hvm_do_multicall_call
and hvm_latch_shinfo_size() confirm that COMPAT HVM interface is unused for=
 safety use-case.

Grygorii Strashko (5):
  x86: hvm: dm: factor out compat code under ifdefs
  x86: hvm: compat: introduce vcpu_is_hcall_compat() helper
  x86: hvm: factor out compat code under ifdefs
  x86: pvh: allow to disable 32-bit interface support
  x86: constify has_32bit_shinfo() if !CONFIG_COMPAT

 xen/arch/x86/hvm/Kconfig          | 19 +++++++++++++++-
 xen/arch/x86/hvm/dm.c             |  2 ++
 xen/arch/x86/hvm/hvm.c            | 22 +++++++++++++-----
 xen/arch/x86/hvm/hypercall.c      | 37 +++++++++++++++++++++++--------
 xen/arch/x86/hypercall.c          |  6 +----
 xen/arch/x86/include/asm/domain.h |  3 ++-
 xen/common/kernel.c               |  2 +-
 xen/include/xen/sched.h           |  9 ++++++++
 8 files changed, 78 insertions(+), 22 deletions(-)

--=20
2.34.1

