Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349BECA7927
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 13:32:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178913.1502577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRUzA-0005eH-MQ; Fri, 05 Dec 2025 12:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178913.1502577; Fri, 05 Dec 2025 12:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRUzA-0005cH-J3; Fri, 05 Dec 2025 12:32:32 +0000
Received: by outflank-mailman (input) for mailman id 1178913;
 Fri, 05 Dec 2025 12:32:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRUz9-0005c9-Bf
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 12:32:31 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76a293bc-d1d6-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 13:32:30 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SN7PR03MB7155.namprd03.prod.outlook.com (2603:10b6:806:359::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 12:32:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 12:32:26 +0000
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
X-Inumbo-ID: 76a293bc-d1d6-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAALFsQUM/NV4zx/uG7x4316jKjDREdfRwgB29/nQAm0tMSypX8fVROZ/Skhdn/P1FZEYk/AE1mLYDE0DdxCYt0PKtoDH2ELYRJvS+W9WKYpwSpO4TVJ6AoEHs28LYFKtIvxLr8eIIKJ/htKYvYy16DTUhqu5ZUwLsUwENC+etWGGfB39nrsbFLcR+/0tjOzYI1AN9/9LFLYwOypIUwBgeqz/954Lx7POJN/Lfr1nHdzIdl28Xbq03A2YKYwUmbklxKbk9Kgg3r+PtDgr6DmLj8/EbmiSDws6wlkLByFgd0XMduVkCXxy5bxGJhzsFsHz5PhJeXX63WPQ4DibwGKaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMm/uiaRpu+EkVOfalfXdzrQv9AD35uy8OzroZIKQZc=;
 b=xjYcBLRA8af+6ZYcDXLOnTHj209hheqYGcSxR4GRcxeCrNuUxBwbv8TTDIG9L4rqLrNHXNtGKjnIVS7yzHa4lJ/Ipr0Y+dl3jpFNQ3x0Jl9Fc57wQHtLELPxnNVTxzFd6rTw+7KDFdqzQ6gBbkX341BEa7dRHkyAvVmLUdAl4cspnHxeo4gxC6PPPFa+LHwpnntKvEJ9kGNlZe3a6jxqs/xlFFjRS73k5xpkLzDB6wt/6z09kBi76o7Hc6Rt3xmHfSsJtjMG4Vb0iAvdHvA5moCg00+MzzRhxp9C7Ua8HKI/ymZtTJo+lXP/BWfIhwTm20Mo5h9O6qjmwQCWdCUW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMm/uiaRpu+EkVOfalfXdzrQv9AD35uy8OzroZIKQZc=;
 b=dfu89FmeOiI1oNdA6Y6jAzZgI7QxEtsNM22MJ4/p1GdcpwFKmB8jvINKKewqaOK7YQhIuJJnS4Ef+UbyRmrvfc59+YSg1twNX8SyS6NrrxdHH/pNkDV8HZgwuUwHpKbXquNqfu31c98f8OtgJ1bGwgsxtJJ4T1Q5ZyEZ0U8si0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <24d39f26-3860-4a4f-8e28-ac3a195e5872@citrix.com>
Date: Fri, 5 Dec 2025 12:32:07 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Anthony PERARD <anthony.perard@vates.tech>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/3] common/kernel: Rename hypfs "params" variable
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20251205115000.49568-1-michal.orzel@amd.com>
 <20251205115000.49568-3-michal.orzel@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251205115000.49568-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0283.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::18) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SN7PR03MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: 609818c9-60a6-47bf-89ce-08de33fa5065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnErWGNsYkdzNzY5bFVDQ1BxaWg1cmZkR0NySzdLa0ZobkxsRHVoUmwxVmU5?=
 =?utf-8?B?N3FsalQ2SUZVSllRc2NhOXdXUks2RDE3QlZiR2llWS91RXNpdmFEb1Ezc29k?=
 =?utf-8?B?VlMzYWZjUDIrUnFNeDJUWUZZekxNeWdTakdIM3psbmUxWFl6Y243NkNOYWVm?=
 =?utf-8?B?NW5Ld3JxVUlndVZIbUV6RWFWZzNaUUNYMUtlbm9vRGhGSmhNVXJ5bFowRjVB?=
 =?utf-8?B?K3JEbGg1dzl4UGdCelhpbVRqY0NUK1RoUnhWSnEzcnNvS1N2M2VDYnhyd0VO?=
 =?utf-8?B?MGFQSFFVWlU3cmlaUUFpVExKL3FINzBYbHlkOWhmb3J5TVc0WUxxYkZoTDli?=
 =?utf-8?B?d3I2RUFlWWZvZ1JDVTF1aEcwS3IrK2h6SDI5WUZCWmV3UGpRSFBDZCtjQkVY?=
 =?utf-8?B?K1k0bTVCN0ZiU0l1UTJHcWlhZS91Y2R4RVcxMEdpUk1ydUJaTjBNb1hlNVBa?=
 =?utf-8?B?eXRQNzNURkJjdm9wRzUveWpxR3hVa3oyaW5CNDhCUUtYVHoxcldXcUxDZFVK?=
 =?utf-8?B?RisrVnRUK3d0Z25pVVVwWCtRRDU4cmZPUDRXSGxpWjFrM2F0b2ZNZmNGSmc0?=
 =?utf-8?B?TVJkUCtEaEVRMHJrY2N5ejZTZmtCZ05ydjJwdXRuYTJUOG05QnhRc3poSlFw?=
 =?utf-8?B?aVEzRkl5U2x4UUJqbHM0aFJBdjI0R3Ard1lUYU4zUnhOZW05Tk5QTnRsZlhY?=
 =?utf-8?B?TzB4dU1BSUlwMFovc3N6eWN3bG02M29pbE1wQjNMUVR2V1lHOHl0ZEFIYXNz?=
 =?utf-8?B?UFowZktSeWJBVGJ5RGlqc2hEc2NmNlZNTGE2Nmk1eUwrVUJxWTNieTUyUXJN?=
 =?utf-8?B?b2phMVIvLzB2Z2VRSlN3U1Q0ekNuYnVldzdNOUxQQ3dGOVJmMVBlUXVnSW5I?=
 =?utf-8?B?ZDVjT2ZadU12cm4rVlNhT3RkMnR4Wk9SeGNlblZWTUQxWWsxQkRmdnZKZTQx?=
 =?utf-8?B?K09CRk5DRFdxVXgwTndET0VHVFh1a1lpZmNVNVdHQUxLUlVVdFBtc2FsYUhF?=
 =?utf-8?B?cndKMXJQUEsrNDFBaXUza05XcGdpN1VGbldURUNpaW1pQy9PL0prOXlLM3cy?=
 =?utf-8?B?OFlJUjhuNmFiWlhOR1Y3a29XUHpNdWJLUlFRd25tM1BVa2psSDBOU3F4Tnh0?=
 =?utf-8?B?bCtzVDZZYXc0WWFYeTQ2VWhMU0NiNERXVEtHaENJSEVQQjhyR1RpSDlsakdL?=
 =?utf-8?B?ZGhNekNmZ3lETUdHcFRkd3VNK0ZHMjRzM2hVRGFVZ0ZKc0F3Zk9zT1pxeWND?=
 =?utf-8?B?T2k2ZXhTL2NTRmJhWEUxRUsxbk85ek0ycDhUVGhXUWpGWXoxcFZicVJHd2VC?=
 =?utf-8?B?T0RqR2VKVkZyS1RkaGxjVzdkRHZzUGx0Y3F4cGkxR2MrNno3OXNyWnNDL3Vr?=
 =?utf-8?B?NnVzVlMrMmlhbWZ3RVl6RGVMZDBrNHI4b3FaQmhVVkZ5M2lrcWFGM0l5WnU4?=
 =?utf-8?B?VlZaUnR0eEtYaFdrNmlCTVVHNnNTZnBLcVQrdG5ITTgzU29SeHlUb1hIN1cy?=
 =?utf-8?B?QThsaWN5b0hmalIxczBZVXpXUlNpekJZbSt6d080TVM3L2FDclNsSVZmWEw3?=
 =?utf-8?B?ckUxT3huNVI4ZUh6dGZLaGVscDVmOWZHRGN2UE8yUjYyZjRvbU05K3dnUjI4?=
 =?utf-8?B?RzBibnM2KzV1bEZaekgySE5iOWQyYzRneWpmWGdvUjlkUWNKMHFJc0p3WUQ3?=
 =?utf-8?B?MmNMM2oybGhFTnlWSVpwM0pzU3lNY2V5bkhobk4wY05qMWtUUUtTZkdlNWJt?=
 =?utf-8?B?MHFXUnR6dzdEZGxHb1Nyb0FQcW5lbTU0Z3FObkR1Mzl1aWxrYlRuREp6NDlT?=
 =?utf-8?B?aTlVT2FWcDBGOHZZQ2FacDNFWHovTlJFVmRIMmcyUDNpUTlDZEdpbWM5Zk5q?=
 =?utf-8?B?QnFxRkRMb1hRTGdyRVpoNkN6K3JCcURIOGlqWmtxWERqM1Z6TVNFYlY2ZUIv?=
 =?utf-8?Q?PJmqB6jJtg3LCFPe4VIVu0dJxJvPpmyU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlErTlEwSXZqZjlOTmJIaDMzM2YvNzlyS2lXalhQRFQ1Yis5MXY4bXRGNTdX?=
 =?utf-8?B?eWZHN0k3bW9tYUdOamxPTEpiQjc1SVhDTVhnTFV2Nm0rV0srbTdaeGlWMTRW?=
 =?utf-8?B?ZXIvNW1JY2hOOGE0RGtncGxOYXJvckpPUmZaMjJqV3hJU21ySnQvQzZmcXdn?=
 =?utf-8?B?V1J5cTg3OFRNRGF4YlRZZlU5NkJFVXhSQk9zK1RzbWpVcnptSHUvckYrUHQw?=
 =?utf-8?B?WTB0eVJ6L3dSbHZPcVdseE1jYm1HOWwwOEU2Z2dMY3plSWRsN1I0U0VmdzZ3?=
 =?utf-8?B?V3E1cGd4YktLMzY5bS8zeGorOVJQbXl0ZWttK3BnNHE2bmp3L1Z1RllDS2dP?=
 =?utf-8?B?YklXdVBiMHNSVytXemMwYitGdHJvZGRpbHVDVkZaSzkwQWYvdmQ2ZkY0U3dS?=
 =?utf-8?B?U0VaMGxwRnJFUDFaVjZpL1ZQQXozelVLRk40ang3emtKakphdnJoQ0lTQVRa?=
 =?utf-8?B?WGRtaHpzdHFYaVNCUnUraXp3M1E3YXR4YWs1VEtrcElrd0hmbXd5Vko3bDg4?=
 =?utf-8?B?ckYrZVZkSlpaTHRSeFY4MTNGUXlTRFlWMlBpWCtRM2hXZ3pZb2xNa1dnMFhv?=
 =?utf-8?B?VmZtVUxHdmR5Q0RPMTdnU2oveGt1UzlpUjFOWWtLZ0FSTnBlNjNKL1VrdDRD?=
 =?utf-8?B?bHZGajh1dStid0FueHduM1NjMEhQb3ZsWHhkWWZwZHlTL0Nyd1RzTjhqSWNI?=
 =?utf-8?B?cGFSc1Y4RThQcXQ3MUlUMjFFZm5qY0o3b2p3Q0NoZEhTVlpycXIvYW1vdFE3?=
 =?utf-8?B?NE92UXl6MTU3NEJqSTFHUXRRWUFFV2Rycm1la3MzK2diOFd0K1RmWThhaFRX?=
 =?utf-8?B?cFZvTUJiVHJUbkdEUHpTc21ZTThiemowKys5ZkZkbHF4NVhYR2tnK25hRmF0?=
 =?utf-8?B?RHhwa0habS84eEVjV2FjeGRHRVRFZU8rdEorb2QrYldZLzlONysydGpBOEpD?=
 =?utf-8?B?anZjUFozbEh0WnptQ2lUQWRuNS9xMktHM1gzWDRIRG5md0RZa0plbVNKekFz?=
 =?utf-8?B?NHdvVCs0Nk5NN2pvaVNNNDNDREg1ZlorSXRydzlXdTZWb09XTmxNSFNGaitM?=
 =?utf-8?B?NTgvanNHM3Y1OXNzSXFiN2pOeWgxZ0pHL1NHZEU1bERkOStFVnJ6c2oyWDF4?=
 =?utf-8?B?SWwwbFBKUk4zM0pBc1lsSWRYNUU4ZWo2ZHdIbGp0V0JkWjZBNHZtZGVwcHk0?=
 =?utf-8?B?K0RxSS9lUE02bzd0K1hxM3lOSzlGYytBZHQ5WjNOclZGTUVSa0UzbUtTV0lt?=
 =?utf-8?B?MTU3QTlvWjNMMStYUlcyNXFFU0Z6RW1CbVo2cWlQcmVwNUY5ZkxYTys3cUdm?=
 =?utf-8?B?TFdjanFGemJJSitzRHRZbllmWWJWM3RGM0hRUkNCek9iUjlDTld2cE1iZEIy?=
 =?utf-8?B?dWREZ2FFdTlWaDB4eExwRGsxMncvaFlUdG5jdUdBYTQrZFZhakVMaXNYY0VK?=
 =?utf-8?B?c3hyY2hWVlhsL3JNSWkvYVJjZFlZZHFtelZsRkY4NDRnNC9vN0FHNnE2aW1D?=
 =?utf-8?B?QzQ1M1QyL1RLSFl0MC9QZC9jYVpOUXBWNXUxYzZweEUybi9zZGdWQVJMUDlR?=
 =?utf-8?B?NFY5Y2xhK2JYTG5zWFNzcE9KSGZ4V0NGTUdkVHU1TGJMbERKTnhpTWhIOVoy?=
 =?utf-8?B?OWdIa2x2QkQzdTEwYnRnY2lIY2xsci9LQ1pIOHlpTGJFTjlvdUhnUkVubUJM?=
 =?utf-8?B?YlJQVUFrTWNPdGh1QW81QTZ1R1R0dEpleWFXVHlKbzVaUGZSWHZxeWlSSnk5?=
 =?utf-8?B?UmxLUGJEVGxWalFQVlgvdkpEbDBNOFZZSThuMzNWaG1NeU50Q2loMkc5Um9x?=
 =?utf-8?B?R2dhSlNxeHhhNjhpakxoUmVTRUlKK2tJOWRJTGNNeUwzZWs2blNBdXQxdXpQ?=
 =?utf-8?B?UUVZVDZMNTNldCtwczFZWTBmZmZHalVsc0pTZVUxck9lZU1kSzUrb2k4Sndu?=
 =?utf-8?B?Yzc1TFdaTGlhMmRxcGV2N1hwaktpanlvQkE0M1ZOcjJkbk0rNzVhZEo1ZHFr?=
 =?utf-8?B?Qm1DSmNXUGlFdWNHd0JiSm1iNTZHT29ndVgySUwxTWhlM2JmNFJYZytqN1p2?=
 =?utf-8?B?bDNhb1NicmtpamZuZFptM0FNT1E4WTM0THBobHdOWkwzU2NrR2E0Z3JxYlVt?=
 =?utf-8?B?V3pMOFFuanJlZG1JNFBSeFZBbWJPRzc1OHU3dXhKc2E5NmlMdC9NV3hsV05R?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609818c9-60a6-47bf-89ce-08de33fa5065
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:32:26.5652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PB+uV75SWdZcPQ5AgNVZj0OcjyRAq2E+BS0u40mUIQlHZCnAMr1TblfTXvHIL67tLuwuU72CwWuhVRrKBkvpUTOw3+OmwzwFom188nwWD6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7155

On 05/12/2025 11:49 am, Michal Orzel wrote:
> Inside do_xen_version, there are two other places using local variables
> named "params". Rename hypfs dir "params" to "params_dir". This resolves
> MISRA C R5.3 violation.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Equally, the two things called params could be shorted to p, but
"params" is a common general name so this approach is probably better.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

