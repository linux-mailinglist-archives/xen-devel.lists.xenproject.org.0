Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91855D195FD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 15:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201780.1517359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffE7-0000ZT-LB; Tue, 13 Jan 2026 14:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201780.1517359; Tue, 13 Jan 2026 14:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffE7-0000X6-IL; Tue, 13 Jan 2026 14:18:31 +0000
Received: by outflank-mailman (input) for mailman id 1201780;
 Tue, 13 Jan 2026 14:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMW5=7S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vffE6-0000T1-0M
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 14:18:30 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb0f409a-f08a-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 15:18:29 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5624.namprd03.prod.outlook.com (2603:10b6:5:2d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:18:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:18:26 +0000
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
X-Inumbo-ID: bb0f409a-f08a-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4aaWnrL5YI4wo++tUSFnXE6OLj1lK8jUkQEMcTOhMZ6rBEjf7IGQ+symKeu1uoHMecmTyb0gtdrla/kgTNH3KEiJODW0FlhKq0XU0aruRkFSe75jd/0oj9WdPD2iexBszyB/p6tuDeOyy7vzAo4KRnFwiheB1AcX2kPD2gtzyEKBYU0zmz5xnZACyc0bhCxoOu4cXpEuB+a6wqttvXD2gvmgLPpB1Tde/Xf1yr5WMMh8I8husDFc1AI1m0ZpseDnJXxjSLH7DooiihsWcHEAuD0l1bq30L517JkDsdwR4UA0CXql8zV81APtbsID3khVYk9dezoEYALOl8O9n+u9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP7E1rSjoVW0LODQUbv7IOGNs39mTUraxKy+L+4uw1E=;
 b=RfvLMNgQ7GXKl/yB40LBuUQm2Nr9eXJ6bQoOoQ2X546IeCN5UUdFa1hjVgn17+wKAB/vCKEVfUH668VKm5hPS2PNrihDqV4Dvsj2Q+qip3WU5kFgMtEwubfGrURjjmpogynxnNp0D95R1e0gwsWr2qpbDZ0TqQ207ucuxY7JFwSW9gZPsXxF+rccvhpiLR+06Tw3UBRZsLxcVaSoLW42giwVqEo70/GGw25kW4cDntT7KeGgDl5yhVvNGO14bJmpl3sSBNjobjpKL+cO0k/G25bFjSBJbcsE42VgAv7FFyz8yRefBY7ooKdGnUgvA469KA+lQTWyiKtomFwkxyZZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP7E1rSjoVW0LODQUbv7IOGNs39mTUraxKy+L+4uw1E=;
 b=mH6gwoNkePlieeB/QXJWRBdemSZLKLkoC+A6Q4f5+WIebhzOZfCdn5WXXoISKxunC1SzvZC8Cu2W/X8bdxFfSXVQr+TLVjbtrnSYzBT4bUSAppB2ko7/6hkXS32V0szdlzqeLs9D+xQ/P8otdKqhXtKkzrG9ipM/2q9VZscAzVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e8760b05-75a9-4697-86d0-3026798e32ed@citrix.com>
Date: Tue, 13 Jan 2026 14:18:22 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] x86: Use 32-bit counter for TLB clock on debug builds
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20260113120959.55156-1-alejandro.garciavallejo@amd.com>
 <aWZT-fGptBd58cAD@Mac.lan>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aWZT-fGptBd58cAD@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0198.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 8120f88e-1b36-4df8-0489-08de52ae9dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vm5LTElsak5hVzRxTm11dENYRlU5UGErcHdHczZ5cndlWkdOU21raTk2cXpx?=
 =?utf-8?B?akxpYnEvam1MMkJsaWJIUkFMTG0xZGZrWkRXVlhGT1F5blNDbHFUYWMvL0JV?=
 =?utf-8?B?YmE4cXcva2dnUnAyVjZpQng3SVBDZXI3a0c2N254TGJCdXlkNEdFd3NBZDVT?=
 =?utf-8?B?dTZ1TlFKQ0huVm0vT29XV3RQUDd3eFMwcndCcGtyTXkwS1FPdVhBRFd2bDBx?=
 =?utf-8?B?Mm83OXhHYTQzZzZ5QzZldnVkeGpaMCtXNi9FM0oxSm1PK1NRd3JVZCthRXdY?=
 =?utf-8?B?RXJCZG9TNlpKWWY1bkRsWG1od2JFeVROaFZQdVovazlMQVFHWXRSeEpnK1pv?=
 =?utf-8?B?RnJucGR6VjJnZkVJTHBaYUJiMzFXWWJ0bzdsTm5tSVZPNCt3cVArNUxvZVVU?=
 =?utf-8?B?WnkrVlVGaFdMVGgzWkxnbFdkM0hPTmV3bFkwV3ozdlpGbEY5ZTVzK2NLUFU3?=
 =?utf-8?B?VDA2U1FzVk5Nc0MxUm1TcHdaQVVENkp0dTFUQXFJcmpJT2V6a2Q1bVRLcENv?=
 =?utf-8?B?d296WklsQi92d21YbmhsWjY0dEgrNDV3NCtjZjJnL3pEWnpqRDU4d1BISURq?=
 =?utf-8?B?Ujl0TUJRam9hUFpYQ1NRdHFLVmJhaGZtT2RjdU0wbUZkYTE3VHRUb05tUXhV?=
 =?utf-8?B?RkpZa2hhakNGTFFkRTBxaWxWUWxtcmlZZXVnR1J1bTR0TGMzUjhVWG51UTNu?=
 =?utf-8?B?b1BlRm1IamJLN0YvSTVSZHdyc0pVNzVhdjlwNWdnUVhicmc2a2ZrZnFjeGRC?=
 =?utf-8?B?bjk5Znh5bFNTYzBxeUVYL0ZLdmdSMWl0YzRmNDZ1M3lIRVJDT290dGh0MHpC?=
 =?utf-8?B?b3hwSmdzT2thOGIyZGg5Qy9MNndqMWxFWUlTcHpkVGN5ZlUydlgrUzMrZTAx?=
 =?utf-8?B?dm8xdWdvaDhST3JVQkpJZGZrMGlZT3NROHFrR1A3OWtzS2Z1UGdDS1hPQ08r?=
 =?utf-8?B?RTFDczJuWlJjZ29iTmRTUTFqRE1EZjB6emFJbTJmUSsrdE9OblhYYlpKV0Z2?=
 =?utf-8?B?cUUyaW9FNW1jMXNmL0x6NFE3OHNrWUw2R0N3OUc3N1NZdXNHRWc5WEhIWXZR?=
 =?utf-8?B?SVpEVlM1MDVXcEhoeisvcW0zNEcvTkxiYU5tQklrdktnaVhpQStzUzFzYzJQ?=
 =?utf-8?B?V3hMTWpCMTVhVDkzZGtKdzFwaXRmZE12YitsWkhMWlUvS0JOOE5NU0VJSnRF?=
 =?utf-8?B?Wk5zZ3NwQUJ3UXRQcVdZRTJVRE5yWGhXaW1XOG1hUUI3dVFPY1QrY0xwZ3c4?=
 =?utf-8?B?UW5TMnY2aWZmWWxlZEpQckEwM2tGYWVOOFVubFY3NERtOXN6c2QybExNUVR0?=
 =?utf-8?B?UWVjOUxyakpXM0U1clpHait6WjVyYjVvTEdobWtYcVg3Q1NLK000VEUzamh0?=
 =?utf-8?B?MU9qM0FaSERFcXVLYWdoTm1sS2JoWmVnbFpoYmJ2ZXUwQW5oU3l5aHdLNXY3?=
 =?utf-8?B?K2tHVVpCRG5vQ2tlcUVwWDREOHZCUTVwVDE4SEhNa1JVb1E1b2taeE9KZ0h4?=
 =?utf-8?B?SUNFM1lvNlpUZngyMTdVb0MzWHVlUUpJMGVtTUlaSHRxZVNrUDZOMWdmNlRs?=
 =?utf-8?B?TFJqTGZUNVR6akdNZjB5cHVkNXB0SW15U2I1cVZoRWNlS29iQTQ4Vk42RGJV?=
 =?utf-8?B?OWpNN0tMa2Z3bDVYY3VFTWFLSDVYNFFVT0JIT0txQUhIYUZrcFBtNGdGN1pI?=
 =?utf-8?B?VThjYWNSekdqY0ZYY0VwbzJLc1gxU25kWWw0WFpSN2FLSEFzNDNVYTVYdVF2?=
 =?utf-8?B?Wk13akhyTFUyK2VtbktmUkE3TGpLekJ5VnkyZGdoNHk1aW82aTFaRnFGbUhz?=
 =?utf-8?B?VGtENXJ2bkpzTVk3Z1QxQlE5OFZIVHB1aG0xRGYxcTh3bnIwTWpZeTJuY3ov?=
 =?utf-8?B?Y1UybW5hMzlYdS95RHA2MkZSaFdmNnYyaUhOUE00RlhDRms5NHlDMnc0QjdC?=
 =?utf-8?Q?fGbbLizosh5/TE/T+7loU89mRn8tq+Nh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVk3b3Z3ZE15V2p3NEptVkdvTEp4U2JJaTFCRXMvZFI5UHprU2R6MnEwT0Fx?=
 =?utf-8?B?dnF0ZytwVHc0dm9xcEtmb1d5allJUUZhNDlLL3BCdEdrRlk1V2tRSHlwYzdB?=
 =?utf-8?B?NWY0SHQ5Rk4wVXRxU0RTbjdJbU4rZlBJVWx0Q2hISDlFcnpiVHkyWVBZSVhV?=
 =?utf-8?B?OTd1QkdIRkdjQXFoMXM2Y1ZiRytQVmVicGcxYUNUeUwrUnRXWHdTcmU2WGNy?=
 =?utf-8?B?V2t1OHBjQWZwenpPZUpNbzFCU0ltSU9UT1l0dTlhSUNCckVQakdDMTRSOGZw?=
 =?utf-8?B?ano3dmF5eDUvOUVsNVdnNlRBaUlkdW1wSzMrb0VNNDh6MTZiYUFIeVVRdUNN?=
 =?utf-8?B?MnJXS01RbTRUMGRGTitBU2drNGZLWGV2Nm1LYWEwSjNCWW41QXE1d1k0WWZX?=
 =?utf-8?B?OTVCb051SldrQkJkeWRReGRKcExnaCtJaWZ6MmgyL1JFelErYmtiT0RlNTIx?=
 =?utf-8?B?UW9US2N1bmlaQWVnL0xENGlJZVQ1bnJxbjY1WEw2eGNnUURuMG5xUW9ORk9x?=
 =?utf-8?B?S2EwQ2FEd0lHZzZVdlptU3NyY25CMTNRZ2tmN2lQY0pHTzJoUWlNREZnWXY2?=
 =?utf-8?B?T21WcUpremNzV0hhKzc3NllvY09iYjZmdUY4ZU54OS82blB3NFVXWjNQT29D?=
 =?utf-8?B?cjhETmRMSkhTTmx4NEFWZElvRStXTldySXVPOWFneEZwM1dycnk0Z3c1T0hN?=
 =?utf-8?B?ejZPSmkrbFZ6UGo1QnZ1b3NPTWtJdGZicXdjY1lNNk0xMU85U1MwU0VEaTJK?=
 =?utf-8?B?VDA4TWpxZkU2L2xJTVBkTkJPMUJuL28yQzJ6ejhDK3YwQy81b0R0aUdqSmNz?=
 =?utf-8?B?c2ViNmUvYnM5azE1SHp2REdsTEpvNE5raE9YOW9ySTZiMG8zTTZaekoxc0Nk?=
 =?utf-8?B?aWx4Y2lyS1g2WkNJQThjTWhLdy9rWTlwQ041MjJWVE00dWRMclQzcUZ4WXBn?=
 =?utf-8?B?Y3BBaVk2ekNKVEpCZnh5Y1ErSUU1d3o3SUlBRWVqRHdEbWtjWUpVTTVhbzVk?=
 =?utf-8?B?QitIK2JQQ1pBNW5ZTWYzZWR6TjErSHhWSkUwTVFvNjlqcEJ1ZWdqN3E2WnFI?=
 =?utf-8?B?Qmo2MkR4VDlBd3JpbGFYUDJlaXJkMmwvSngzQUVTaTFnOWRHZkhwSGVxV3FH?=
 =?utf-8?B?ZWxrMHBzYlo2U1p0OVBXTTJqczNteVlDbXpwaVVXWklMN09pQ1VmdUt0K1FJ?=
 =?utf-8?B?ZVhrZy9QcU1ZcHhKaFpZVUZ5U0svOWc5VXhZK0EvaWM0Nyt6U0pMV1hFa0Rw?=
 =?utf-8?B?RThuYlU3U0EyVnR4WGpMRGdNVlZIRkovZVhMSGUyWTA4RzBPa1hnL1hZVXN3?=
 =?utf-8?B?Sll0MllXZGJSODB6SnVBeHgwMkR1dGNDaXYrTGc0dDNRcXZBT1doK2l0ZUdG?=
 =?utf-8?B?dUhCT3Q1LzIvZk53bkxxRlcwTDhVdjhXUDdKajlYTEJ0ZEEyK2kvcVdPME1j?=
 =?utf-8?B?NGVKQkJNZVkrRHFNMzd1bTlMaDlxM2dvYThieUk3alo1SElsOG4xQVFFWk1v?=
 =?utf-8?B?Y3VyeWVTVTkzUmxwOVgvTld3RzdSeGM1cTArUmJRVTFjWFRWNzE3alJqaXJL?=
 =?utf-8?B?dWVnNjk3YjMrTDlZN014eUxCaXVSdnVqN1NzSmthL01VRTY1azF3SG9wZ01j?=
 =?utf-8?B?b0lYdG5pUm52SlRYWHVuVmJlTjkxekpldHJqa3RPNzJLbDVhaW9kRTl5bE1T?=
 =?utf-8?B?WisyYlBBSUd3WVUzYi9MdDliV21DRmU2aDFBWWlaNnI5dGVOcXoxZ1RFdVpQ?=
 =?utf-8?B?bG11bTBqQlFJWm1Wai9TOFBzV3cwWjRDeTV6NE50YjR4S0JEb2czRFRZOWtX?=
 =?utf-8?B?aHp1c2NLc0RzK0Q3U01VMXFhMnVyaGpiL0E2UTZNTnhWSTdOTWR3QXFCcFJn?=
 =?utf-8?B?c0xsOThuZFJLRE9HYU5VYThTdEFrOFNQNFpKd2RKWE42UWN1OGxNRks1UTNP?=
 =?utf-8?B?WWszaExpN3BvdWRJSDgrZE1oMVBaYm50R2RiM3kzNHhHQWEwcldEc0lobFJK?=
 =?utf-8?B?bS9ib2lDSlBPaGJ5akp2THNSdWw1TXdVZFd4OWs0N0JaTUdOT3lvczRLeVEx?=
 =?utf-8?B?bENLckJ1RWxHRUJzZGc0cWxobG1kWHJkSTRDamE3ZUZQMFNmK05zTlRlcXJz?=
 =?utf-8?B?Ry9qZHQ1cUlxeFVCS1lWWXFmeUx3MTg1SzRIbkZuNGRUbU01bE1PR2ZUSzZB?=
 =?utf-8?B?b05vOERORU1VTGV5cGd6MG5RQStteVdVR2V1cGxqOWR3cGlNY1FmZkZCWUV0?=
 =?utf-8?B?UmJFV2JORzlvSHBGUWQ0TVBaaDJiSUhWZkVZTmozZmZnWm0vWURtODBjTVFm?=
 =?utf-8?B?RFpFd3F0U1JqbUJ1dnVFVUFTWXhPL0ZKYVJMT0FpaE4vSVhmNk5PQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8120f88e-1b36-4df8-0489-08de52ae9dc9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:18:26.0502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gx76e1AUDJvAgUmCwBABYMiC0HcqDA1wzzvzqEiC9qpClugAxPAZuIjG1+j3DmRGgcgr1Vs8qEAhSdwgPrbmLtQgiFli8dlOf5xaUfYoHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5624

On 13/01/2026 2:17 pm, Roger Pau Monné wrote:
> On Tue, Jan 13, 2026 at 01:09:58PM +0100, Alejandro Vallejo wrote:
>> Debug builds traditionally ship with a 10-bit counter for the TLB
>> clock. This forces global TLB shootdowns with high frequency, making
>> debug builds unsuitable for any form of real time testing.
>>
>> Remove this quirk, unifying release and debug under a wide counter.
> I wonder if it makes any sense to provide this as a Kconfig tunable,
> set to 32bit width for both debug and release builds?

That was v1, and both Jan and myself said "prefer not".

~Andrew

