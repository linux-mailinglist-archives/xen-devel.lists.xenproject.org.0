Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E9AD0ABA1
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 15:48:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198917.1515697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veDlU-0006pF-G2; Fri, 09 Jan 2026 14:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198917.1515697; Fri, 09 Jan 2026 14:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veDlU-0006mh-CK; Fri, 09 Jan 2026 14:47:00 +0000
Received: by outflank-mailman (input) for mailman id 1198917;
 Fri, 09 Jan 2026 14:46:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ele=7O=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1veDlS-0006mb-JW
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 14:46:58 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b91d0a1-ed6a-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 15:46:57 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7478.namprd03.prod.outlook.com (2603:10b6:408:197::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 14:46:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 14:46:53 +0000
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
X-Inumbo-ID: 0b91d0a1-ed6a-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsx/s1oSOEfAOCPodMUoS2dwN5pIMY6ji8+ID5L7rNWuId6hVZ2pYsn4e05QySncoODFVyqiQOjj5fPAt+mo4A8Yq7iEy6rIPRpnz2yCF3nFwFGigzmqITaNyZijKXR06ktD+h2W1eCZuWx+jYXhug4iaD9NBqpqwAwr2McGIu1bJc+yRKFOLI8qzyWSiOh2bD32mqzdvHQffrCka0oOHxo3t2Awqa3cQeFLlS+y/a6kcCXKUr5f+mR5pzU6RT6Z7G6EJpoIGwHP29pCfpn1lRKXBgm7Q8FcmdIf51b9Du/Bi7Eadnw4vVS4gCCgL/ae9+Ie4LFHFb8uOLtFnaxfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHm14Zsieid21GtiDfTQPG6U+ZFeb1sFsD9NGsh1ClM=;
 b=X2Zx+mznZMptYZChMmv770Wv0LzHcz1Ko5IuOPM7of0cRau6CuZqg1ZYNWgLOD+X1rThlKz29D4ORf7K536asHqejvz2oNPvcPvIWZcCvexf3leACunaV9AHpnvDOoub9lsSpw0mITFq08gTOZdTTxhkecLdN5hWKgm2oIC4vDf5zASCeeFcujCGsxZhUsFmQIAGRIMQAitNGH7arSj2tsvc4TVw6tKZj5gh49x9chp/6YZOTVLGjavSWia3sk7ar88j2rxxsnFYV6ECGuFA+OxYimfbfydx8B6jPpuD+anV6zaFeCWBPaMlV+NRAQBiBLpnU3/ZWHuNgnlWOjgUUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHm14Zsieid21GtiDfTQPG6U+ZFeb1sFsD9NGsh1ClM=;
 b=EUei4FsvfOrHEkMkqYaWzy4tWM2waP9gehbjo+dOdEzw+nkNQepH0b6ITFW0Fw6so+7hXmgjUf3aDFBTAY/7Oel2/JKfvrKYNKgsEogpgYVGWddEdHn2CTqXsUuU7PxdW9lM+1bA7er+Uecay6YYAsFfw/JteDF63ewrxTcTpCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 9 Jan 2026 15:46:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] xen/mm: add a NUMA node parameter to
 scrub_free_pages()
Message-ID: <aWEU2jKO12e5TYtz@Mac.lan>
References: <20260108175536.82153-1-roger.pau@citrix.com>
 <20260108175536.82153-2-roger.pau@citrix.com>
 <a8d09b82-3013-4476-b358-08b5fdc14cf1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a8d09b82-3013-4476-b358-08b5fdc14cf1@suse.com>
X-ClientProxiedBy: MA4P292CA0007.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 311c70fd-4949-4696-8d93-08de4f8dedf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHdYclgzQVZJN1piRXdhNVkxQU56OFZReHdKdi81eU9BUFNEWUFrMVVJb3ZZ?=
 =?utf-8?B?WVRVYyttWFViKzZoQWp2cnNMdnBZYWdKbjRQbGQyajlmMXJzci8vUDdiaVc5?=
 =?utf-8?B?Z1RtanJxSUhTaytiVU91MlBjaXJDOHFST0VEUW12L1lMWGlLWm03NWUzd0JT?=
 =?utf-8?B?WDVpeVZPUy9ORXdLNThSR1hWZ1R1RkZROUIvb0dpdi9Dd0RTODFZdWFadEFs?=
 =?utf-8?B?Nlh1ZXdUV1RaWkNZd2lCU2ozQkI2MDNxQWdQdWpjVjZWRWxRSDVYR1BjTmpr?=
 =?utf-8?B?NWpzd0tQcDdmeTJPNXN2K0JtR3RYL0hrUnkwbWY4RVovQWNVeWRzNEVtSHhK?=
 =?utf-8?B?d3c2SkRMaWJzOHkrS0lrZ0x6amRmNmtHTzB0T2svQ0hycTFNZEhFU21vcW9Z?=
 =?utf-8?B?N3hOZWFmUGs5NWIzOFpqZEllOUJUL3ljeWJYZXVUZW10dlNXRXQ4TUVJeVVD?=
 =?utf-8?B?clUweGozZzdWSWxxeG5jT2hOc0hSQTJWZXNRMjlhaVQveENKYVpwWXVXQ0Vn?=
 =?utf-8?B?OG94OTBEWElOU2FDNW1QbEVpc29pWTJXN0Y0RFlWRVVmbmtScjBUcDl1Zlk2?=
 =?utf-8?B?bXZ6NUVzT2YzdzNvUXg5clVMVXZKeTVKeFd6ZWxWdTZ0Z0NKOTdGUDFnb3JE?=
 =?utf-8?B?RTZaWFgraHB1RGxTbUZzbzJtMDF3RW1ta1gyYXQ3Q3VvNmp4TjJRS2s0MktD?=
 =?utf-8?B?RFliYmpYR2cyNjE2aHBnTEhuRGQwMU84bFhmQ0J6T2tHNkV3ZnYyZnN3K1F6?=
 =?utf-8?B?eW5Pb0lrM3BNa2J4K2lqdWZTSithOU9kenVNVlJnMnEwamczbnJ2ZzBBQmQz?=
 =?utf-8?B?eWYxVkt0dUt6MmpTSk9LN1JBMndXeHJmTzcrSGlGbFEzRm41VWdudTlzTllL?=
 =?utf-8?B?TDJHL1pVQ2lxUWU4V0tRMURGWTRxYzlibG9ncVZMeklSWFlYNDF4OW02NDEy?=
 =?utf-8?B?Ym5KOUdISUFKaTZBZ3RUTVMzdEZFNEpBbUNydm1wNU10cGFqcFI1ZUFBK3gw?=
 =?utf-8?B?YXNzdWFYVnlROXkrRDBqd3NENFZKVHZkdVlhSCtZYXlWSW83WHlKU3FtVjBQ?=
 =?utf-8?B?RkFaTVlYd08xWGdrQ3FxOVY3S0RwUEtxdzBvS0VSbDlFaGxQRzlJUndlNER5?=
 =?utf-8?B?cEE5cXFqdzcvQUkrajR3VytTQVZFcSsramRmTldTc3BqUFV5cmpBTDAyTi9k?=
 =?utf-8?B?RDZ1OGw4cFlONTdWUUN1NEEzZlRJcGdPZGVtb0VpTFZQcndrL002dUhsOXZO?=
 =?utf-8?B?b0trb2dpV09wdlJDR1NmdXdvcFZkQXpQSG1ta3RkWHhuMk90K29VYjFaZ1hN?=
 =?utf-8?B?SklSSTNVS3J5SWFhZ2lWL2x2SmV5alNMN3lSb3ZDOGFpZ0QvU1puaENFRmxZ?=
 =?utf-8?B?ajM2eTVUL2wyNnR4ZG04ZEhhVDRNVzk0QzZRMXVvRENONllUaG9ITlpIeDFE?=
 =?utf-8?B?eGxoQzA3Vmc0V1JRT0ZVYWNmOC96NTdlUDc4a2gyeCtEUVhJYURTdXExaFpw?=
 =?utf-8?B?Y0ZxWXdKVVRkbEh3RFlLSTFrOENXaDZpNEhXSUx0SzJQUVFKZXpUN0FTenJQ?=
 =?utf-8?B?OGtGcng2a3VCamVZMGdyV1lCd2I2c2hHaWIxajNYbGZ4V3I4am5TTHViRG1Z?=
 =?utf-8?B?SkdVTTVFQXRnWHAraWg0RC9yd2w4djdhRHh6WE9aMjh4dUNudnhzSUx0RUNR?=
 =?utf-8?B?RDZFc1JCWVJMcTZvMVhXUDRGNEhnSnBZZ0w5WTRuNXRkK3FFTjdTQkxHMCtH?=
 =?utf-8?B?eXhncGpFeGFDdDZBaUlqdjBBeFhCNi9EOGFxQXp5VmJSdU5xbk5icCtWSlM1?=
 =?utf-8?B?dnU5Mm9BUmZrS3pRdFRKZXN0L2hTZ3ZjaEdleEhMQ1NhY21FT1V5eEM3THNq?=
 =?utf-8?B?Y01BdDQ5Vmh1SjAvWEFYUThUTmNBSktvT3lhbUhEYnZEalZtR2k2VWhXZWVk?=
 =?utf-8?Q?n5JRe+f2YxjBAXeoGvNrjYugGx6AXFym?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTNDMU1qdFBqZkdXb2kzdy82MHVhRG00Z1IrNUg4OXBsekx1dFd6bE5Fd3A2?=
 =?utf-8?B?b1FyakVEaERKdGxjWUZwTDI4Uk84MENjbU5sN0ZEcmczRDEzbG5PSVoyWTMy?=
 =?utf-8?B?bytpdlFZUno2cW9uejdKZ1ozaE1OWUpiQTNCWU41eWsyTjRzVDFuQm1ZOUlh?=
 =?utf-8?B?QTBadkU1NnU2ZmdhLy9ESDNhUUJOYnVUZ1RTNDlpdTlhZXkwSlEwZ1VtS1hK?=
 =?utf-8?B?UTVFNEpFcnUzQXVlTFhpd2lJTGQra29kaG1zckRPTkpjSzJ6T2JicmcyS2xH?=
 =?utf-8?B?UXk4VzJJNmlScGQwc2MyaHBPNjBYdjFsS0E1eGxCRHc4TkJpS3JYa2N6bk1n?=
 =?utf-8?B?YUJJZUIxTUVPNGpLK3YwRjlBYVJtdC9YN3JtYXEySVIzczFmM3dFVy9Wa3FH?=
 =?utf-8?B?a1J2T1Z3K0wwclN4bjhCNE1qUkplMFJtc3FpNXBzMFNQaEdGendHcVZtTWsw?=
 =?utf-8?B?SkJjdGY2aUR0QlVJalJlNkY4elF6aUlaRVZwVjZ3SjFqMHpVRE1ySzJnNVc0?=
 =?utf-8?B?am02QjlaU3JWSWxDenhTOG50blVjUEN5T1ZJa2V3T1BJS1J3ZjNBMGdheWUx?=
 =?utf-8?B?SjQvcWxkQ1ArVjVHNFp1VGx0RUd1dnp2ajgyT2dFYndmZGxDRVRJcWYzeW92?=
 =?utf-8?B?L1lnamFRWmJpMFdsSEFFelZSZXl2T0Q2L2xVNndGdG8rVHlCMjZJakJhWVV4?=
 =?utf-8?B?VkRzaThiV1RTRTEvL09BZG1YajBHM3VFVmxwUFJPTGtzaERIRnBFclVka1lK?=
 =?utf-8?B?YWVTVERJMXVwYjNHNlRoa2pIeWFXTWNMbm5qeEtTU1lyS3FRaEFMVjJFd1RM?=
 =?utf-8?B?SnhVZFBWOGtnRDF0djZiMWRjWTJOTGQ1UDk2dVZseW9PaFk4YXpaZmVldWhW?=
 =?utf-8?B?bmZ4SW1hRFFtd0sxUHZIMTVleGJaVTBJU0R0VExOSW1vVGhDblJXb0pFMit4?=
 =?utf-8?B?WE5rTjhCd3oyNE9BNFVWM3hWU1pQNnFleWVoS3BCcGcwL1Y1Rjljc1hOTmZ6?=
 =?utf-8?B?eGdMK3dUK0h6WUVIa3Q1VmpYeE5tSytiUlRCc21xOXhVNEcvazlTYnI0dFpW?=
 =?utf-8?B?V0YrOXJOSFZHOVFobEI3Mi9ad2Z4Mm5iOVFIMjAvTXpLb1pwSzFKRTlyLzUy?=
 =?utf-8?B?azJ4cWNzNzhHSDBpSEhISlVjR1NnUUk0enVjcUZlMWFDMThLcnUxczZmYVpI?=
 =?utf-8?B?NkprbWp2UTVLZXgxNjRwOHVIcGh2MGNpQ0RuVThZZi85bVVjY0hWaFhrU1J0?=
 =?utf-8?B?eU95OCtnWHE1MVVPOElDZFNYMlo0QzlZcHQveDdyY1JiMDdlNUREazl1ekZH?=
 =?utf-8?B?UG0vV3VXS2dROXNaUzU0UWhlYTVZTjdTMm1ML2U1bEFJVnlWa3Jvd0VHZE1L?=
 =?utf-8?B?ZHBsTjdMeHhDeTZtLzJMc3hPRE50Q1dFR1lGdTRxY0I2YTNGWE1xdm1qK2li?=
 =?utf-8?B?RGxsaFljdTlQZjFQU2c5dzZ6N2xOQUxLWkpvUW9jZEZ0dk9pRXBtTGVmaW5I?=
 =?utf-8?B?V0ZqWjFyUXRvZjhveWE2dTBZVTJBN3hwU3RPNmZRczBLTko5NU9DcGx1RDJZ?=
 =?utf-8?B?NStHa2xTVFg1dkNrVkJOem9BS3NiWXR2aTV4UXJoVkRIZXE2YTBCRTdHcFZN?=
 =?utf-8?B?Tnhwdys5VVFqMGl5VXNOeFlOUTVic1o5Z1Nza0t1RHR5ZU5KczRHNUMxaGxY?=
 =?utf-8?B?bDFIeFNMbEJ5SVZjVjJ6Y3dlblZTb09BbXhucGd2UGNQU3J1d25KQ2hkSHlT?=
 =?utf-8?B?eDBUQXFxWVBQYk9NVndzR1krRWUvd1hKZ2QwTjhIUGdnVmFNVVFnR25MWmJS?=
 =?utf-8?B?Mk5rbmFBZ0lZZ3RldjM1RHhTTWJ2NkRNdld3b01xVitXeEFIQ1k5NDNRZnV2?=
 =?utf-8?B?bVhlUmFCOFAvaHEvVndxbHgrRHY1bUxkdXFyRndBUHVnOWszcU9OcUpNTERt?=
 =?utf-8?B?MUlwL0pYaVhNbUNPUTg0MlNpWTZWd0lIcmZGVGt0bTZ5NEVud3lkWEwydkdk?=
 =?utf-8?B?bjFqM3dKV1V3UW5QM1l0NlhWZy9QY2V6NFN1dWZOTTlWTmNrSk4yc1pycG0r?=
 =?utf-8?B?WVhFNDJGcnJLU0NlRXIrZ0YrQkE4cUZuSE9zMXNDNGNMdVNwb08vZWw2dlNY?=
 =?utf-8?B?cEorRkxxekxMTDZpVkZYakgxWWVySWtOUUpnY2dEZWVmYlVYdEp6Qk10Y0kw?=
 =?utf-8?B?S3M5MzFpZm1ONldUcXNoMVBNS3ZhMk9BSXFPcFhTUUZ1Q2R4WVE4TnhvYThP?=
 =?utf-8?B?ZGxia0hFRUEvWHJkcVlabUczWmRHZDZ0VHliclJlR0tnQlZrbkhOL2dNQXkr?=
 =?utf-8?B?bXNKdDd4YXJMQzVwd3UybUZQZTc1MWhpMFRVVUN6VER2TWFnVW0rQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311c70fd-4949-4696-8d93-08de4f8dedf6
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 14:46:53.6567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /R33oR7yDAYR0Fw5sUdDAqHUXM5FECdxjC2J84JZ8g6UCyNKHf7hMk7I/1ve4lLF8rftYEMCvLrc/2DLwlUOHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7478

On Fri, Jan 09, 2026 at 11:22:39AM +0100, Jan Beulich wrote:
> On 08.01.2026 18:55, Roger Pau Monne wrote:
> > Such parameter allow requesting to scrub memory only from the specified
> > node.  If there's no memory to scrub from the requested node the function
> > returns false.  If the node is already being scrubbed from a different CPU
> > the function returns true so the caller can differentiate whether there's
> > still pending work to do.
> 
> I'm really trying to understand both patches together, and peeking ahead I
> don't understand the above, which looks to describe ...
> 
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -1339,16 +1339,27 @@ static void cf_check scrub_continue(void *data)
> >      }
> >  }
> >  
> > -bool scrub_free_pages(void)
> > +bool scrub_free_pages(nodeid_t node)
> >  {
> >      struct page_info *pg;
> >      unsigned int zone;
> >      unsigned int cpu = smp_processor_id();
> >      bool preempt = false;
> > -    nodeid_t node;
> >      unsigned int cnt = 0;
> >  
> > -    node = node_to_scrub(true);
> > +    if ( node != NUMA_NO_NODE )
> > +    {
> > +        if ( !node_need_scrub[node] )
> > +            /* Nothing to scrub. */
> > +            return false;
> > +
> > +        if ( node_test_and_set(node, node_scrubbing) )
> > +            /* Another CPU is scrubbing it. */
> > +            return true;
> 
> ... these two return-s. My problem being that patch 2 doesn't use the
> return value (while existing callers don't take this path). Is this then
> "just in case" for now (and making the meaning of the return values
> somewhat inconsistent for the function as a whole)?

I've added those so that the function return values are consistent,
even if not consumed right now, it would make no sense for the return
values to have different meaning when the node parameter is !=
NUMA_NO_NODE.  Or at least that was my impression.

In fact an earlier version of patch 2 did consume those values.  I've
moved to a different approach, but I think it's good to keep the
return values consistent regardless of the input parameters.

Thanks, Roger.

