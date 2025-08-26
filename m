Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CB6B3675A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094531.1449825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquIy-0007Bz-LE; Tue, 26 Aug 2025 14:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094531.1449825; Tue, 26 Aug 2025 14:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquIy-00076A-Fz; Tue, 26 Aug 2025 14:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1094531;
 Tue, 26 Aug 2025 14:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqrf=3G=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uquIx-00072q-1h
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:05:43 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c04f14b2-8285-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 16:05:41 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV1PR03MB8590.eurprd03.prod.outlook.com (2603:10a6:150:9a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 14:05:36 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 14:05:36 +0000
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
X-Inumbo-ID: c04f14b2-8285-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3EaZT/jQdTmvlolmEYx/2yyA33Gj191foOE9sEbmnoe+arjolJMwDGblxZbOITjN2+W/wa9tVWWfwMcQZO7a+SZLT7cdgS8zK0vMdpiQUWX2Ewqaz+CFaGk4ry/MKTLHEDSb7+nNnp3/+vmHeKr1LR+673WW53R9na1K0x13XgAaplBu0I8In4R7fcP7mydICRVm8IzoNTUdjgn7zbVi6azPGRw7jX7JXeb+7deQqjwYXLjc/XyKq7PZ+DpkHgHbwJXR8SOP3YW4wjI2XFa4J1KkFqlr5pxEp8raWRX09xktnSutTXcxNXvh0+JrRWAMMLHsJCCyfCRBFBj0RdfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxiR68BT9E9bUNcTc39AlV4WhoNXMfyWIZeI8b9FTbU=;
 b=L/qok1OF5v1sEDOvSRcfZXcXPSd+LgtYvRzRd+bCl7NJJUx1Xz7tqwbtqd9V4hrVGkI9V1FvtVCvHO7IKRoVKZ+nJoO6E9D9B/EsGNAaAaGgRwuSC+mgsCKdsyVExv/LWDV7WT8KbbSMoKDsa5bUvGsT8KOgF+e/tWkxX071eLxpXjxAJdGgtoP0V+ZWzx6G00JO/rX5nvqiaz4oG+plnUiQIPvfhUZDgUgNBIIrnnsahAFBN/Z8cETsgroCoBdWv5gH/IuIKRIx98hRCduCDgYIegBN9FOce2aD78Q0/aax8hV+W9M/coNhXCSVPPR8dakHT/NM++Ux43m8xjAtww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxiR68BT9E9bUNcTc39AlV4WhoNXMfyWIZeI8b9FTbU=;
 b=BwN1S+4tWW5Ph94BBoFobpbyP8rp3MLvaY9YnqBiTyrEEpbqMh4Lbe+/O6dHfyiQ2ZCJDdmPRq0+05RyHIxPvA2JLOLb8WZWkEqoKJyUgXPwhWF5SbQnl2G8NYHud7cJ+HaMyuSR5VTK0ilfLMozuLr335Rd31W3CnmpJkwx47fnUgwYbvq/CTL3lO3JrfnEIwyau+WGoT/BxNMROW7jgYb0+KgfhFp7Rxy6WflGAvhiZiUm849h62u4YlSYM9I0E6/+Aj/sjxLPU05xzR+Qtrk1CG+8/ksAEmX+Z9EwB2coNQ8auzIJaztcbc73/6nhODenrAGSE504zvakksgAMw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v3 00/11] Subject: [PATCH v3 00/11] Introduce eSPI support
Thread-Topic: [PATCH v3 00/11] Subject: [PATCH v3 00/11] Introduce eSPI
 support
Thread-Index: AQHcFpJ+lDNT/UIVbEmkb1HdVv/B7Q==
Date: Tue, 26 Aug 2025 14:05:35 +0000
Message-ID: <cover.1756216942.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV1PR03MB8590:EE_
x-ms-office365-filtering-correlation-id: 15e0f3bf-7275-4204-9da3-08dde4a9a127
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WtslI/uW+FPo6BclI7H0lNBiVBLpsD963VkVlUKw6Wrxv8hlLibOO7CLiu?=
 =?iso-8859-1?Q?RveFuIz2EJ/Qkr9OktSHVVarRFFlBsrvf6LnBsOf9rOMQpYxZ81I/rxZeL?=
 =?iso-8859-1?Q?3Cn9TzDX2P7+H0AmLlnYUODD4ShGaiWfOjBsWBri4wjCSa1p4G/JSX2rWP?=
 =?iso-8859-1?Q?0AOmQHceqrz87FaOAAtaZTmja2SQTfxMb3BATsh9l68GQeuc5hFNd/YCnQ?=
 =?iso-8859-1?Q?/V16vrrZNP7U1GRev2w0YRNETdfQXx3PC1d0d3LHa/VY0PbDI1jBcqCN08?=
 =?iso-8859-1?Q?kD3r1WdTMN+92QgA/wuM6TkC9JqQCu7YsfCOTJ59MCu5I/EgL0FzQaLH++?=
 =?iso-8859-1?Q?2aHnTiz/elGiJeQiFcgWFUnAqEaFXXqb4UB91GOFgigB4uW2ReQ6iVfZq0?=
 =?iso-8859-1?Q?HJqWtZBGIyO8JfUHWwlKE+kj2cgdXbLOfGTZ6KyU3YzZpeLgsanZNf+Jdd?=
 =?iso-8859-1?Q?AYyZNhe3lADZ8iAcovtpMlxHyVfUyhUdQA8jI/WJlqrsXX02bbYCF99ocu?=
 =?iso-8859-1?Q?FkXosXku8rHdGsQv6Clj4PrNAM7dxQE/cKk3jO8XZIovJ/hTlt5PSpn7UJ?=
 =?iso-8859-1?Q?tYwK/c+NLX0Px7v7ZN8D9KrWDaGrJY4SUYAhAV3ufUqryfKia85kjuSTDa?=
 =?iso-8859-1?Q?Hn5zltRumqZ47Y9Gc7Ou01rAiKVHUBqs0eDeYj7fhztHwQYBdA4R7dOI+Q?=
 =?iso-8859-1?Q?rdrqgfZ9I1FA1TWXcFiCEhNN0iD/kIVGXpP7Yli137/tx9t5vjav4FyTcm?=
 =?iso-8859-1?Q?9Uj+7M5YcvYFbytiXjZbNEl66njhenzBe38n3cA3/D2v5ZBcBo2Nnwp3RI?=
 =?iso-8859-1?Q?R0yty/9XJfmrJMlHen5cydGcfH/4sFeWtbqT3ZI05dYmRr8FmIKfNAWjdP?=
 =?iso-8859-1?Q?suzFZPWkLhqiFXf0iOUrLux9jCD4xR01ubw/+v34MDLMujas6lYmNquOKD?=
 =?iso-8859-1?Q?gYRx8s8eUKSDoe4eZSpIMvtJ8ptRVz9VBZk2sEkP91qu8ca43m2ztQ6ojs?=
 =?iso-8859-1?Q?Y2uq5fbm8VO04bWEnYMVajIE91sWfgkRH1qnzI7FwJMEG+Z8DBm2vDFJK3?=
 =?iso-8859-1?Q?VPyBtRgrMePN2VtV4UakafYW3lpwtHCjVTIMALd7U9pk4sEOvwGPeMDgTY?=
 =?iso-8859-1?Q?mxlGSUpSVAhCsNctbkZUv4ej49qlUu2NovuJWzu9GrPBbcvsi6aGVEPmkG?=
 =?iso-8859-1?Q?hWE8ed9VKcLskCOw8dNwshi/xZDKKJPqGQc5QfE1ELaManJSAPCg6Di1Dj?=
 =?iso-8859-1?Q?LrMxywyYupTp/RDAs8pkXlq3AGfJjBlPiU/ljG/lLyo6lSZHYhh1Rb9TXb?=
 =?iso-8859-1?Q?bTAm1aNugENgngYyYSz5e6E+P19COSgm/P0w2f2mmSK94ZuC9PsZ4/van9?=
 =?iso-8859-1?Q?wUxXmma+dakFuHFCb/SX3hzFIASgLLe8tmaseCXcJqcOH1RtOvG0p9N/F7?=
 =?iso-8859-1?Q?wjT/C5TI9mOodIinqqbvzu6dr+FI7k/P6ZN7zaT8OhaAEjOWX9HCusiQT4?=
 =?iso-8859-1?Q?8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?I61jysiL1Czz6lCWW6ACk7gTK4bIrSbA8kKh/+u4v0Bdz35i+drp9vqyCl?=
 =?iso-8859-1?Q?BqUCQoaL889wZUfzkcb3dJcBCA+lJtKfUSyVxLVhJqDltsoqlKGiaMCdgx?=
 =?iso-8859-1?Q?618vsoDNPjwcFiBo/2GkAte7xarh6Ztm3hTmv1xaU9U1jcdkJpgSaBpR9c?=
 =?iso-8859-1?Q?AJv0GwavcGW2go0HVb0WdVsEpdspJn9x0svwRaNlt/E3oDQnb9sr/T4W37?=
 =?iso-8859-1?Q?ZFOKpqTho0cXpOG6zhDJXtOWG26x+A/SJxk34/C/XLz219WBl3J3U5TAVZ?=
 =?iso-8859-1?Q?szO8moX+6CKvrtT9sFqbzWFxYmwZd9bKwzAiw8MUSw1EhkVskfcNKzbGNC?=
 =?iso-8859-1?Q?44D210//BlJZSJ+7J9HlTDFK3EBSD+vMs2Thx3T6u4PepX/g18XFzBiWTa?=
 =?iso-8859-1?Q?rIbN865PFrfT05gh85K/7ROLIM8Eqgf3hqTtP1Y5qdhOGEd/qsJMG9vLho?=
 =?iso-8859-1?Q?+ESGfcPKlWfyttA198pjeoNmqTUVMCNrAvdKm32Eww8eFyZX5BIobVbeUq?=
 =?iso-8859-1?Q?XhZ0isnTni9uZnJBDMgEXfLl6lVfJQzQ/0s0cEkH65bSCSUf1b55iM0Gmk?=
 =?iso-8859-1?Q?a4P9iD/pww/EcPvXr/o+jf6gtwbJLL4xwsVhjtH5NcW2lofbE529Kaifm2?=
 =?iso-8859-1?Q?6JNaVQFwZGbBATo0i9FNhoFYbwCpGTPeq6GYSswvv5myQB6zL+ogfKq73T?=
 =?iso-8859-1?Q?RMMTtGQJMV/VtPFO7jw7oNw0iZwJ+kcvmHv3ENmDWs7Q6ZdtjfudYaTpGF?=
 =?iso-8859-1?Q?sbFq6k2zKUa3Vzk5MUHWMJ7qzbJae32R8ngZUkptOZTIs7zS/IKlvDbcw0?=
 =?iso-8859-1?Q?6npAU2j6zEeI/geZ+6avecXyAAW3nQwdLOucy0IRVJbjs3JKYcoxdHloz/?=
 =?iso-8859-1?Q?R6sC1Ls9GoZZEEJGst60bDGym0dXg7BIjU0lRRCe+w0Yio1FHGZqcPakgH?=
 =?iso-8859-1?Q?5ZhYsCZsOMj3+2BTDGS7XLYj6+LufF54d+OPGUGavXbqBuT+7r6Tr7PIF6?=
 =?iso-8859-1?Q?VM/n1t6TdBpHNkjxzI2nCdrCFvi9K3FmS9HtfwR0iDyMW9DDLsJUIO0B45?=
 =?iso-8859-1?Q?A+Ymp5JwU/rGNVJjg3aSLzIYMQd5pb5vkUnGJAD6WEdeBxQsTrmBw7vT0i?=
 =?iso-8859-1?Q?kuca70OqglD0jurtX0umPdQu+a42XdWBFRmNq7Cyr8T4qobpq7ewk1RUpr?=
 =?iso-8859-1?Q?WH42/UM6MxqtbCcybrPM+u6vEo5xFaJtp/+lZOzwRexFp/rTf28vPrPBrV?=
 =?iso-8859-1?Q?coHY3Qy0yohCzn5jvNQK6CVGiPMe6VG3pJWw3escErJazKQlCtLpt1zbql?=
 =?iso-8859-1?Q?VK8pdloZALw3Go5TVL1ajSOfAzbCnJAANQBTgSupx/x9kXkgZ0C667eZML?=
 =?iso-8859-1?Q?4sYLI8GYX2y7J0E8V3mnN3SA7cmZf+foIR8ZtayhlvLlNt9/dOeQLZnoWD?=
 =?iso-8859-1?Q?brPRK9oMN8Fk6y5KYfLqsna94h47CE347/HK2i6rQnjjee7eSW4iZlVIoB?=
 =?iso-8859-1?Q?NX5vVhZ4B4W/bZHHo6XK7G/52a4598j7M93/JAlBeXPKzrHGroSLKutz1D?=
 =?iso-8859-1?Q?i7MQnWUbkGwEgR+IZYMWfXN/pl0E7IOfP04EROaVs7m+5oW4rA9ROtVWn9?=
 =?iso-8859-1?Q?2GKD78/GXC0J/r2BRqRfcdxZslVt1AAfEr5TxNOinz2rW9K6WNOvDNWMsX?=
 =?iso-8859-1?Q?X8QEGzO6YwxoY2RyBy8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e0f3bf-7275-4204-9da3-08dde4a9a127
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 14:05:36.0549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/ykwgYou/GT/wAbfWEMX3zAbGbJZggnaDHA3O/HJg/7IXTaLL0hEVVVaJO/TpvDBPONgnTrm3I1Y45RANYEbzZAq4gVqJaavycRn24Nak4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8590

Hello everyone!

Dear Julien and Volodymyr,

Thank you for your review and suggestions in V2.

Following our discussion about memory overhead when eSPI support is
enabled by default, I have changed the default value to 'n' in Kconfig.
Since implementing dynamic allocation for the IRQ descriptors array may
require more time, I decided to go with this solution for now and plan
to prepare the next patch series with dynamic allocation later.

Additionally, I have added stubs for non-eSPI builds where possible and
reorganized some code to reduce the number of #ifdefs.

Dear Oleksandr,

First of all, thank you for your review and for verifying the build on
the dom0less setup. I rechecked the dom0less code and added the
necessary changes to support eSPI in these setups as well.

I also want to mention that I verified the build with Dom0 and DomUs and
checked eSPI functionality on real hardware (e.g., passthrough devices,
changing IRQ affinity in DomU, etc.). Everything works as expected for
devices with eSPIs and regular SPIs. Unfortunately, I don't have setup
with Dom0less + eSPI to check it quickly, but Oleksandr has confirmed
that at least regular SPIs work fine with and without eSPI enabled on a
non-eSPI Dom0less setup (with V2):

> I have lightly re-checked the simple Arm64 Xen environment (dom0less=20
> DomU under QEMU) with your series applied. To be clear, I did not really=
=20
> test the eSPI support (the underlying GICv3 HW does support it); I just=20
> wanted to ensure that your series would not break anything. So, in both=20
> cases (CONFIG_GICV3_ESPI=3Dy and CONFIG_GICV3_ESPI=3Dn), I did not notice=
=20
> any issues (at least obvious) related to GICv3 emulation and SPI=20
> injection for the passed-through device.

Summarized description:
This patch series adds support for the extended shared peripheral
interrupt (eSPI) range (INTIDs 4096-5119 [2](ranges of INTIDs)) for Xen
and guest domains. The implementation uses a generic approach to handle
eSPIs, similar to regular SPIs, while maintaining compatibility with the
existing SPI range. Functionality remains unchanged for setups that do
not require eSPIs.

The series includes:
1) General refactoring of common IRQ operations with GIC registers to
improve code readability, simplify further maintenance and prepare the
key functions for eSPI implementation.
2) Introducing a new Kconfig option (default n) to enable or disable
eSPI support. Disabling this option prevents unnecessary resource
allocation for setups that do not require eSPIs.
3) Adding additional resources to store required information and operate
with up to 1024 interrupts from eSPI range.
4) Adjusting assertions and checks to pass verification for INTIDs in
the eSPI range.
5) Configuration of eSPI-specific registers during GIC initialization
for systems with GICv3.1+ hardware.
6) Enables eSPI MMIO emulation for vGIC, allowing guest domains to
access and operate within the eSPI's INTIDs.


Changes in V2:
- added 2 more patches to implement helper
  functions for gic/vgic:
  xen/arm: gic: implement helper functions for INTID checks
  xen/arm: vgic: implement helper functions for virq checks
- removed 2 patches:
  xen/arm/irq: allow assignment/releasing of eSPI interrupts
  xen/arm: gic/irq: permit routing of eSPI interrupts to Xen and domains
  since their functionality can be moved to appropriate patches after
  introducing patches with helper functions
- individual changes in patches

Link on V1:
- https://lists.xenproject.org/archives/html/xen-devel/2025-07/msg01809.htm=
l


Changes in V3:
- added a patch to update CHANGELOG.md
- individual changes in patches

Link on V2:
- https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg00372.htm=
l

Leonid Komarianskyi (11):
  xen/arm: gicv3: refactor obtaining GIC addresses for common operations
  xen/arm: gic: implement helper functions for INTID checks
  xen/arm: vgic: implement helper functions for virq checks
  xen/arm/irq: add handling for IRQs in the eSPI range
  xen/arm: gicv3: implement handling of GICv3.1 eSPI
  xen/arm/irq: allow eSPI processing in the do_IRQ function
  xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow eSPI processing
  xen/arm: vgic: add resource management for extended SPIs
  xen/arm: domain_build/dom0less-build: adjust domains config to support
    eSPIs
  xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers
  CHANGELOG.md: add mention of GICv3.1 eSPI support

 CHANGELOG.md                           |   1 +
 xen/arch/arm/Kconfig                   |   9 +
 xen/arch/arm/dom0less-build.c          |  12 ++
 xen/arch/arm/domain_build.c            |  11 +
 xen/arch/arm/gic-v3.c                  | 192 ++++++++++++++---
 xen/arch/arm/gic.c                     |   7 +-
 xen/arch/arm/include/asm/gic.h         |  30 +++
 xen/arch/arm/include/asm/gic_v3_defs.h |  36 +++-
 xen/arch/arm/include/asm/irq.h         |  27 +++
 xen/arch/arm/include/asm/vgic.h        |  39 ++++
 xen/arch/arm/irq.c                     |  58 +++++-
 xen/arch/arm/vgic-v3.c                 | 275 ++++++++++++++++++++++++-
 xen/arch/arm/vgic.c                    | 222 +++++++++++++++++++-
 xen/arch/arm/vgic/vgic.c               |   5 +
 14 files changed, 868 insertions(+), 56 deletions(-)

--=20
2.34.1

