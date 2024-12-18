Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C259F6250
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:04:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860071.1272133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNqud-0003dT-3V; Wed, 18 Dec 2024 10:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860071.1272133; Wed, 18 Dec 2024 10:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNqud-0003bz-0Y; Wed, 18 Dec 2024 10:04:15 +0000
Received: by outflank-mailman (input) for mailman id 860071;
 Wed, 18 Dec 2024 10:04:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TrB=TL=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tNqub-0003bt-8i
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:04:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f403:2613::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dfd5456-bd27-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 11:04:12 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DU0PR03MB9174.eurprd03.prod.outlook.com (2603:10a6:10:47a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 10:04:10 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.8251.008; Wed, 18 Dec 2024
 10:04:09 +0000
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
X-Inumbo-ID: 6dfd5456-bd27-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYVmYhkpyp6+2yUM/UGfy2cvyeUIPLxupayKDb6erxwwcyNxPIgthdOxZhm1Noe2ROJhEUnQXTp8o0EGrH4DTVwRHmvjF/4p7p+QlG7tYr0sRRj6hyK5xowmHaMqNDjfQo71XHEUXmTVPuIm1LYqukVllqT6v5bNip2orCrzGY/+n7+xq4zVCa9ZyCG1BWfJYrq5X/3Lkg6X4GuwmKxcpAGQlHpYXSooQErFRHxTNa7KoV+HpbCiR1iSb506kd8Rs5DjNYw2MlmqwcV8Ix1UE8lZuHp+olSSOJ7sHHGpN154Dluh8/XTW2VF6BPyPgppnuto0uCNSFOoTAimV+lj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7gau3jRIy4sC0FretvcCveuZ8q2tedAxLma2rOCacE=;
 b=P1Uoh4V9+3S1eFGPQsNeApxV0aMbKJk6TSLxF7CM/vM6MkRbv4r8SxjmCkpcu4qKfBBVla1dgZx+vO6xXxxvf578uvmJVaFya65kM+5b5qMWJIfpGuJ3/NohORiYAm1zM6OpPpsRWzO73KWypVThEqFnRE76behKmOeJsAmszpDwLLSyrkc5Z6AzeGCM6o1COTSehElgX8w7FyjHep83X6D8543oQ/L+UvjK5SEqRS35Qu8feZSG0EO09418tW/K1+LjWQY8CYnZlqN8MWalP2+guCFs8c4nBccfhQ6A3ZMrxyKPP+yaDGMga0Ypy7VlvVEYb5RiehqP0zrDAyMxlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7gau3jRIy4sC0FretvcCveuZ8q2tedAxLma2rOCacE=;
 b=Im80fvTw3U4DyySbeCI34s0N17D6ByOwqeIhFCDm+KcLIFTAVVjkj8+H7tLmImSUslbmu/nxubyHyKjkmgb1p9XC/EEh8qycWtZUyKCMcZ8SDEFT5a6cVtU2JaXpxRti2kWLn3OeF007kklxy45xV9oAyb6YGYekIfIWSG5Khm/kpV9/D4beResY6vm6LfqsHz2nrvMBQjdkSbn576cOrc+YYERyRfdLRlb+TPTTf6uashBhbLRT0CGTHv//dIa8Qgs4X9CUmthgZ90sRYj0bGBMQmY6z1bNlyRN4pogrx2jK97lU6Unp65f7iAn04YS74ZVuGwXSEsr3ty/JpSr2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <89e09a64-dafb-4665-adb5-be90fcc12646@epam.com>
Date: Wed, 18 Dec 2024 12:04:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <4e437c60-4fee-40ed-9d2a-789bac0b36d9@xen.org>
 <63b21760-7dea-423b-a9d8-64d213c40b2c@apertussolutions.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <63b21760-7dea-423b-a9d8-64d213c40b2c@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DU0PR03MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 74cf0cfd-2566-4af7-530e-08dd1f4b50be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzFwZmtFdGNCZzRqZ1lLWm4vUEMwQ0NzdGdjeXFpc2dkMldHSXByVHBzL0VW?=
 =?utf-8?B?cncwdDdTL1JaZGRLV21heCs0REk3eGp0S1NKeHlrdW10dTZXSEUzODZROVQ0?=
 =?utf-8?B?M2t1ZGpxaSsvc2F3NUpKa1lkNDJqKzEyOWcvTG1HSm9vemZZUHNmS3JyMlIy?=
 =?utf-8?B?M3h5b01LWGMxb3JGNmxIYldqTXZ5bU51WjBGL3RxTmtFTGs4eVBsZjUrV09N?=
 =?utf-8?B?RzExekxJSlhrWnhPWktENVdZcTA4MzNvZ2wxaW1TRVg3UkdoYjd4cWtzQk42?=
 =?utf-8?B?a3JDT1QzSy9MZUpRVm1zVi9mNGwxN3ZYOS85OEI5YzlHeFBXeUxKc0ZJdnhj?=
 =?utf-8?B?c3BNQUZoK1dRdUpBV2ptenpNV2hJK0cyRE5IVTg5dWZGYmpkY3RXQld6SmR4?=
 =?utf-8?B?VFZGOHBnTGxrQ0tuQnlPa0ZRVHNJZW5zRnhJME5JKzUxckZsNnRHRCs5QkFF?=
 =?utf-8?B?cnM5VEVBbGp6THZtdmZoVi9rNjlXbnBpN05WUkl1d0RkZCtEaVU5TUo2VGwx?=
 =?utf-8?B?MWF1dHZ1bWNHbnhabElLcWVudys1aVplMjJ2anJyYk5EQVk0RVl2YlhvV3Zj?=
 =?utf-8?B?YytJUURkZmQxZldKL0wrcGM3TDJqMVRUNUtIY0lOR1crRE9za2lrbHRQMU9R?=
 =?utf-8?B?N3VmaVphOHVCZkFkU3NtVXphN1ZoT0d0clc3aGZtaGxWak81MlJ3ZjMzenBX?=
 =?utf-8?B?ZnlkNC9vR1NrWVprMUZROXlQWWE2VmRmNG4renpPZDhJTXdQTzE5MG9UUXdp?=
 =?utf-8?B?TDNNWmhTOWQ1TU1KWUx2SjV1RjE4MDZZaUJFSUc4NFQ5RUEzbHB1Q0FJRWVh?=
 =?utf-8?B?amtNM0IzNmIzK01iZUpsTVlIZnhiYWFWN01sL1ByUWFhQnNkYjRkZEp0Z0hN?=
 =?utf-8?B?SGdpTWw1d3M1ME52TXIrSmtjeWZmbnVOVDVXdUtVRWUxWllWSGJsVmlXMWEx?=
 =?utf-8?B?RkhGZnp1WWxlczFKQlRRTlR3U09zTUtyN1p3Vm9yYVQzczI1eG5CZHZtdDZB?=
 =?utf-8?B?TG1UZmFVR0ZlZ3JpeVYvQVRpQy8vSnQwWGlqSy9NU0VONHVMcFpSRDBZVUxF?=
 =?utf-8?B?d2dsdVJXL1o3NEoyb0laZEQxUlNSQ041MXhEWEF1ejBYSURRZUVBZ3BLeVFE?=
 =?utf-8?B?cDZwcWc2TEtCUTluRm9CMmxwOTVMZUZTZWxlWm1ZdXFVWlh5UHpjd1pScXh6?=
 =?utf-8?B?dHd1QVE0dnpWUGZQZ3JpVHhIaThSelZIZUw2UnlPZW5zTmxDWDRrRWRHc2hI?=
 =?utf-8?B?dnNSY25VdVlXOGZ6VHNONlhjOStVdzJyR0lFM0FZNEFyTDQ1RUFhdFhkdktG?=
 =?utf-8?B?bmNvOThpWWQxaUs2NUNMbGdiWEp5REpuUEVvdllHZTdITldTM3dlSHBNNHdD?=
 =?utf-8?B?ZGhBNEV0OWlCcC9qeUdaQXowMnJ0RVZWWVdVdWJiSDBOa2hna3N5ZFZITkZm?=
 =?utf-8?B?NGh4VTY2SjEyRGhYMHFKVEVzeitCNXBIUmpzaTZWUzZtVUF0b3RaMTVTSmtr?=
 =?utf-8?B?SHJ0VHAwTFpLNno3cDJzRVFEMTE1V0FDZGsxZW1Mc3RVM1JvOW8wK0VNSEU0?=
 =?utf-8?B?ck1LVUpialgzeXR5aWxqY2ZWNkhkMXdJeTNad0FGL21tdEVhMStWNVhGZWpa?=
 =?utf-8?B?cWRlRWsyT3NNMU5weG1WVU5ETUtEYWpYTkN1MW5nTExxUWZzWUVJZmVoMkdz?=
 =?utf-8?B?bmxtanI5dWpCSFVsU1Q5RkpsWHQ5YjYxc3lrR09yT3pka0ZvMEF3M0xCQmJ0?=
 =?utf-8?B?eWlHMWZ1cHozaUdjTUFoejJlQTZIZHBiWWdTclpXaTRmMEsxdGgxQTZLLzlZ?=
 =?utf-8?B?MXRJakdJSmhFL01pM0RmdkZNdUFuOUJCTjlHQXBmOEVYNG9jNXc4T0lzTktl?=
 =?utf-8?Q?cSD/5kkPdxl6a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUMyQnp4VmRxcllzbFpMWlZHeVlBTTBRejNNY0RxWmI4ODdLVTd2NDA1U1A0?=
 =?utf-8?B?UWpuZFQzSjREYkl2cUg1MERYcFAvOHpGTmpudk0yMmxqNzBmS0YyREwrVXpu?=
 =?utf-8?B?dDZSWE15MmZvaGpuR3RVNUVyd3RYYm5pQ212UFhlMDBVQUZIVGk5YkNSUUM1?=
 =?utf-8?B?OWMwN0t0MExnRWx3VWlxTENBRGhjaTNYOVl5M3YzVzhjdm13Z0tYR2lrZXl3?=
 =?utf-8?B?bVNPNW9ERHhQWkhJTTVWOFJoL2lsbm9kSXFwWDFlTXh4azE5U3o3MFczeDkx?=
 =?utf-8?B?QmtJZ2hXSWlaNzRIbjFGbW5razJGQTBkOTYrd0pIRHlXbHl2N3pBTGh6cDZh?=
 =?utf-8?B?OVFqVzZFL3Q2eTJ2K3pJVFZESDVoK3RyVW4vQkRWTnpuS0pzZnhJQ1Joa2la?=
 =?utf-8?B?OG1TZFVLd2orVXVKUHBRbWJhVGwrejV5QVhNaEVucmFXMHEydDNTTFFQSW9s?=
 =?utf-8?B?NkVJdUtNeUNzY0ZDSmVGQndmQStFS2xuSW5SM3B4R0JqK2FGNldPM2MvUy9y?=
 =?utf-8?B?TUFhc3dCWjhWNk1xTUlIbG4xOEFSYmpRL3JTdjFTWlNmalVrMi95ekV5UVFl?=
 =?utf-8?B?cTJDS1pyZG5RcG1mc2FScS9CRUdlRnhQdWhXdGd1TDgxUFFkRUhxKzY1Vk05?=
 =?utf-8?B?NTFRMkxEaWw1dDBHYTBWNDJYMU5Bck5uUUdBZXZMUEZ1UkVma2d1VnVLVGM4?=
 =?utf-8?B?TnV0ZUtIYVd5dWVkUXlnQmJNcXNXbjlta3JFc1BsNlJxWWtoWTkrL214QmhU?=
 =?utf-8?B?UW5ZbC9QTW12NXo2QjdNVXJ1dE81R1hkK3hHaXJYWEVlVzJjYmZMejRpSitC?=
 =?utf-8?B?dE5YbTR5Sk1SRzQxR01pa2NEMHA3emVlSEVvb09zKzcxNlAxcEhBdjQ0WGlq?=
 =?utf-8?B?UkNuQlhTTVRVaWpRakRVbFhVSkF4YkFXY3RLZ0NheTdTTU1wb01JckdtWVdI?=
 =?utf-8?B?Q0hocEp6Wk1MWXFzNlpuUS9Ja29yWExiU013eEppZFlNRnk0d1J3QU5xajNI?=
 =?utf-8?B?azFLeHQyVFEvTmpFOTNBdjYySVRiZUhOMEk1c3BPQ3l4eW91dFJScDR2cEFq?=
 =?utf-8?B?cGVuWVNqamIrakN1dmlBT2dDNFJBOHMrVDNxM3ZtRmdDbEZpWlIwNU5SUzlK?=
 =?utf-8?B?aThEbEZyWDcwRGFaYWkxRVNLaFJFL0c5TitQOWxIS2ZUdU1xRWcwWUs4aDdo?=
 =?utf-8?B?akNCY0x0Q3A1a3ZobTUxK1c0S2FWSHZRRnJpbnREL3Zta3Vma3d0MGE1Z0lo?=
 =?utf-8?B?TzMrdDJHWnZzL0JnS1EzRjhGQWF4Wmt5ZzIxdGQ0OEJ2K2k2cW9FandZWTdi?=
 =?utf-8?B?aytvMDJRRW9mcy8vMEV3bzZJcktGZ2s2bzJ6Tk45UnAvYm9rREMrSU5yS2Ja?=
 =?utf-8?B?d3RURXh3bmxvajZmb1NRTk84RExtWHFvbHBZNE5MZ0Vrallrd3dEN3REMnFu?=
 =?utf-8?B?T3NnY0JQaHhVR1B3R2dFNmdOWDRNcWJ1TzNJSmZWRktvRHlSRnNmZm9LWkNz?=
 =?utf-8?B?c1l2TjJWUTJEa3E3Y3I4dnYxVFk5TnJRdFZ1bHB5ZFltd3RwZWFSNXcySjhu?=
 =?utf-8?B?a1loaWFqTjlqaGd3bXRIeW1rNk42eWNEdVd0ajJ3SlUyU05KNVordFcwMzQr?=
 =?utf-8?B?aHlQaG9JbEtIR2V0UjFLSDJWakdLb3dxS0pXMDFpUGQ3Q2pqc0NPRjFMWVR4?=
 =?utf-8?B?WGs0aFZrSXNEclNmUVJnV1E3S2lwbGJiU21lTmRQRk1vNUVPNlhlZFoyQVc3?=
 =?utf-8?B?TVV3YWx0V29WQTc0UktSRmF4ZG5HUDBjeTdyUHZCVDJJdDQyZmFtK09ZT3R2?=
 =?utf-8?B?NE93MFliVStjOGYwOWZ3M0daRHh4NHgwcHlxam5QUml2cDVJZVBMaXFUdXdr?=
 =?utf-8?B?RGRBaUlqeThrR3dXK3NXWGVsYlJPTGhndWoxcGRhMHBBSTBvNXk3Q0c1Yks1?=
 =?utf-8?B?akZOdXhoTG1JQll2M1REeGUzUVlsR3FlaEd3RFVRVkhBczB2R3c1YmR3UEZU?=
 =?utf-8?B?NmxnaDkrY2kxUlFVeS9OODZQSERtU1VabUZBK1k4S0E3Wkt5YkVBeFBlYnNo?=
 =?utf-8?B?VjdGbWQwUkFoMlhjWW1xcmU1eW1YMWRSUzdyQjhsNFYzTndvQWY4NnpLWDMx?=
 =?utf-8?B?MHpwUFh1VnlJRkp3Szl1bytKenNvVHlROFZpZDlDa2NsN1J3bytta1JDdUNs?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74cf0cfd-2566-4af7-530e-08dd1f4b50be
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:04:09.9020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6i4mdV/jT6sLpLiyO4GjgwIIFG/7W4DcVnvzSvlD2/hZ+6SDU1ujkzEAi22GaVjkdRcluf9kN+kLTd+Nd8NL7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9174

18.12.24 03:17, Daniel P. Smith:
>> On 17/12/2024 11:47, Sergiy Kibrik wrote:
>>> Allow to build ARM configuration with support for initializing 
>>> hardware domain.
>>> On ARM it is only possible to start hardware domain in multiboot 
>>> mode, so
>>> dom0less support is required. This is reflected by dependency on 
>>> DOM0LESS_BOOT
>>> instead of directly depending on ARM config option.
> 
> 
> Just to make sure my assumption is correct, you are looking to do a 
> multi-domain construction at boot time, with at least two domains. One 
> of those two domains is the "control domain" and one is the "hardware 
> domain", aka late hwdom except it's not constructed "late".

yes, you're correct

> 
> If you want such a configuration, I would highly recommend you first 
> enable setting flask labels via dom0less (assuming it is not there) 
> before lighting this feature up. This is because the dummy/base policy 
> has no support for differentiating between a "control domain" and a 
> "hardware domain". What you really would end up with is two control 
> domains, with one also having control over hardware.
> 

will check this out, thank you for suggestion!

   -Sergiy

