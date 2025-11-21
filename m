Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F5BC7A80A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 16:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1169321.1495080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMSyC-000108-Fz; Fri, 21 Nov 2025 15:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1169321.1495080; Fri, 21 Nov 2025 15:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMSyC-0000xK-Cs; Fri, 21 Nov 2025 15:22:44 +0000
Received: by outflank-mailman (input) for mailman id 1169321;
 Fri, 21 Nov 2025 15:22:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fili=55=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vMSyB-0000xD-6z
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 15:22:43 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8c69bde-c6ed-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 16:22:37 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB8193.namprd03.prod.outlook.com (2603:10b6:8:263::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 15:22:34 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:22:34 +0000
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
X-Inumbo-ID: e8c69bde-c6ed-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+7xVpUpFC5kpv4H8PS5hT+JvqCc9i3pDgxo8JHPWJdbthp45/NkoHmhnzXB44Qvy1iHvgsLWhvWkkBaS8lEPNzSBXiqPbdITCXcEHsRY64gMQYgbWJ5hRQb7nPP8+prbIPIVwBUzS8jIiF3qI+texidGuK6X4N+vKaVI4we8Kv0frbfbPH0Q5oGQhgrm9XRHJTr8fG4xc1tbzA+/vJREwPX+wYyUMnSBomrxf09xpCLw9dI6KexYBO1XAgbps90BtffnIr5bGSFOQLiCYbqHNchSXm5hhqbrhjvLrehVYdec602TsDPKcC4xGYVJ8qcjQGyNkoaDPjCAQpmSzTGhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8hfGA+QCw7Y8Ibbhnp0qO2qGJX94/vS/E8wLkEalwI=;
 b=QsL5EUKcjFl44iEEvK17KiBtmnFI8D1wp5rd72JAeVrzjCXCr20/gDidD3Hna6Obh4CGTt4zp6F7jKbUuO1AohbQ2+ZT0k5Kq4l5b0wkykQSHn9kNW3ltys9/LJo7Xc+TrejAntvhqKkNkRln2W+whXYp4tZG1FgSR/vs+NPLrOxgd9pOQJTFs64kIAHFZYWBXfQnGeKL+A9M35kam45E9zIn3/DPrn+zOuVdNqKOuJlbkV7dLT5f2zKrkpWtLupjGpVx3uZlTsox9A93g6G72XebSUTxvGllazvSjzCSmrSSEz0E2eLS1LD9fuooHmBi+vmDLcHLvjIf1diJZMwRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8hfGA+QCw7Y8Ibbhnp0qO2qGJX94/vS/E8wLkEalwI=;
 b=kvkThLZgK0AXKp5SQy+sqGQwCxw9R5bueBDhGoQkhTZFSG+1XklfrDyPfSsu11Xwr0qFQmZFedS/ys2Nck2qGMgyzA5wwoV6G/9fnYvsSv32c045BqI7ZPQ3no4ye9T6D+Si7n7pQPGRLTRr+AE0goTLC9KfVcRLU2UM0a7uveg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <78da6bbd-5fa9-4bbc-ac22-d52a11527c76@citrix.com>
Date: Fri, 21 Nov 2025 15:22:31 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <4f898adc-323d-4c3a-a780-1acb2c58345d@citrix.com>
 <201bbc2a-310b-4880-8633-485535762258@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <201bbc2a-310b-4880-8633-485535762258@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0306.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8a091f-671c-411a-87d8-08de2911cbe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3VCZlJRWmJHU2pPaEF2b1orZk9wY0Qyd3d3dFhPeUNzeitqajFLaHl1ZTBx?=
 =?utf-8?B?THQzUGZ2YVdpZHVDc2lYME9iTmZhczVEcWd3VHRnK2ZmSmI1SHFFcUNCWUZl?=
 =?utf-8?B?bUZKaFE2YWtjN2xXanBQZnFLaVZpb0QrT05WWlJzQXNXeWZwS1lhdWtodnNn?=
 =?utf-8?B?cDZVa01oL3Y3UTh3QW9sUFpDd1ZjRmxMV1J2SCsrNzRGcldKZ3R4WnllRUJQ?=
 =?utf-8?B?c2pNTURqU09FTmRQMTdXeUJQaWlDUDYrRHU1RjZXOTF4cmFWYmhMMENIc2Vu?=
 =?utf-8?B?L0F1RnltRHE0VzQ4QnYvK21JNHpxSUdBMDFYa3Z1UkszWGt0eFBGVG5QZjAr?=
 =?utf-8?B?Ykd4RjBSUVhqSDNNVkw3TThUSWw5ZFc4dTkvUnhRajhYY3JEZy9LZnpvdjN4?=
 =?utf-8?B?ZnpmRmwxS2NLdFEzMWp4cU9lOU5ReDlKTFdIMEpyNXZRT00rNG9YRWZNMzB4?=
 =?utf-8?B?VWJCWFl2dUJQYmc0Z2tIc2xaY0o3Qy9aWGMyTHlmY1JJMlBCcnVRcVEydHhS?=
 =?utf-8?B?RitNRkZXTEZTRWxWR0hydjZkQ1VLUitZeFd0UzlpaWpwY3J1ODFxSzNrNkhC?=
 =?utf-8?B?bnE0Y2hxbjdwS3NXUGtaMmxzU2Z4WE9nYnlacGFBZlE5bnFtNzZEbmpKOFZ4?=
 =?utf-8?B?eXVpL05mbEl5Qkg3d2xZa3dYb3JSZ1U5eGkxUURWYmxwSHRybk1UNGl6b0NO?=
 =?utf-8?B?Z1VlQ0lhbVNaWFVqZlRZRmZNRHZ5aWRwMTlWanBUU2J1QTJSd2FNV0p2Nnhs?=
 =?utf-8?B?Y1JHSHBIS21xSjl6T3ZZMTlpZE9QTFRWN2Z0OFVCdzl0NGQrYVFlV3FVNGU1?=
 =?utf-8?B?dmhldzR4ZW41M3hFSHM2Zk5SL1RvS215ekc1c1Rtbkk3TnkyOXFVREcxbStF?=
 =?utf-8?B?U1ZGYnpseXZaRUN1NmZONXZCalFzZFlGSlRnRVlQc0N3UU5JUmhnMU9BeGMw?=
 =?utf-8?B?a1NLcjAxTDZDV3o0UVVBM1lDQ05ZNW9xZkxkdTJwZ0wzVmo2a3M4dVRqbVZI?=
 =?utf-8?B?N01Ec3ZlanpUUkE4aXhkYlZJTE93QU9aWlVFU2lJVk9lZ2VqWTRjQkFBYWxU?=
 =?utf-8?B?cUU2Y3Vvc0phNU14Q3BNejdVaG5naUdjcGU0b1ZBc0p6ZW9PdHNFdmlrd3Yx?=
 =?utf-8?B?aXhqV0dLSnhCTEtjRkNxUGFGei81QWI2UnRHbXJKTFpWM2t3UGg0SjNhMHNs?=
 =?utf-8?B?ekJUNTltQlovYWJUZWp4cHBPSFoxc1N1VitFQXA3ekZ1Z2RnRDRqSmJiT1Ro?=
 =?utf-8?B?b091elRvdnA3TEVzdUlGTElNNXM0cHdFRVhQVlNnTzUrRDdsUlhJZ2d1SzVp?=
 =?utf-8?B?RUZkSEZQWkNSNms5YXYrS3lMVVY4TjBrZjEvUEJXalFjTUxGZkJwZTBKdFNi?=
 =?utf-8?B?ZmJtTU1yVjJPRVg4UmlRN1N2Z0xndGdObnhQdXZFYVRHZjd1M0JOdi9xVTJR?=
 =?utf-8?B?RXlTaUVzSkhWdWVZOE5nOXFyVjZiVW5abG8weHhYOGlZc2NKNEIvRWFuU0c0?=
 =?utf-8?B?ZVRkRHA0T1d0L25KUnFZR0cra0c4WGFUUFFnOXhIT0ljNVBxcyswd09IdjNG?=
 =?utf-8?B?M0ZOTER6Q2xWRGhPMy9ZcU8zbDdGZVZpNmNEZ2dmSEhIVm5aUzB6MW1ndFJu?=
 =?utf-8?B?RzhVaUhOWjJqcGF0dDMyY3kzNmZTZjhySzlPSGRReldhV1pic3pVSmthUTB6?=
 =?utf-8?B?ekJxSDZjcVo0T00yNllaUkd0Ukp0dHVCZkpaUXdWMS9BQ3RQWnlnUHFOalgv?=
 =?utf-8?B?NFlLbTFKNHZvTEc1U3IvM0ZmZnpzZjRHSnc4d0NHZmxaeXF4QkpjRW1iWEZZ?=
 =?utf-8?B?bFhueFRxUzFleG11VmhSK0cxaWN3RS9MNCt4eHBjZC9BSWpWZVk2eUphY29Z?=
 =?utf-8?B?bXg5VjF6eCtIb3VaVWZnZk12UFdkU2wxVFpZL1FNbGpIMm4xQyt6aW8ycXFs?=
 =?utf-8?Q?XXavgpeTngV4paSTLoDYJVgf5XzLqeMU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHhhM0JaWWRUNjRZQVNzVFZ0MWE1dmpvd0dJWU5CYWdSY3RnZDJ2L0lWNjJs?=
 =?utf-8?B?N3VJRUpWYjl4cGIwWVpzc3U0d0plSEZsa3pSUXFmbTl1eFJLTmhkVFRtYkJY?=
 =?utf-8?B?bEhFUWVuc0FZc3htZHptVHpubU1zZndLbGZLaXY2aXBMQXVnUHJ1N3o2Z1ho?=
 =?utf-8?B?bFRMdWVYZWRydHcrTmRib216dlo5T3FlaDRXSFpyTUdteHlYVWlYOU9EbnZV?=
 =?utf-8?B?K2dPSzYzb2U2YjBXeGtIdUdhK1MrV083d1h1MzZGQVJFc3dEQnZJRUZkVlp4?=
 =?utf-8?B?SldvbFBrdUlJSExBYXFPQ2VFbUM4cURSeVhLOTNxSGZzcklVNFpURXBSZzQy?=
 =?utf-8?B?VFpuZnJsU05YaFVNWVo2VjB5dVlKYXVzNEE2Vk9XV2RJNjZqS29QWUxLM1N5?=
 =?utf-8?B?clBjTHpiK1BiZnZIanpUNGpPSURxVmtCRUhlWGY0cm5tOGhzSm1HL1oxTnYz?=
 =?utf-8?B?QTFLWGI5RHplS0wxTVd6TnZKYWlKd0M5MWV4V3dOMmtlOFlsREFLTTJLK2pk?=
 =?utf-8?B?aFBDZ0FnbzFQa2wrWUR6dzZLVWJYbzE1WHdYK1lkZ1FONzBza0plUXZBQit4?=
 =?utf-8?B?TGl4YU1lMWdhMWpTam1ObGlYTXp1T1hBTHhpcXNLUTVjSWt1aVg4MVRqQU1D?=
 =?utf-8?B?aUhmeHg5ckloaHVYWGgzc1oxZmw1UnBTTm8xZFZZWk1DT2dBc2s0NVB5TEpC?=
 =?utf-8?B?N1BIYnk1VkVSditKRFJ5eGxEWk9Oc0ZBTmJ5ZDFLMGpWeDJFUHN0cmNFaUtC?=
 =?utf-8?B?bm1ZK0FQSHhLcHFVRTQ3VVpXNExIakcyb0tVbDFUUVlybHI5N0RWcjZXakhy?=
 =?utf-8?B?VHFOL00xdUxiQWwyZGt5TVdVRERiaU1xNGxFN1lqaWJLQ2Q3VlhJWUJNVXQ1?=
 =?utf-8?B?UXlNdkpsUVA1UEIxL2VCOWU1cHZlK2twbmRMRnJJWG5nZmZMTVRJTStsbGlq?=
 =?utf-8?B?Q2pCR0RTcmgvYlFiOHgwQ09qZXVvWXIxMGNpZUx5QS9YRmlXWTUrVklQNXla?=
 =?utf-8?B?Ynh0czZOS3pzcGdESHZaTFVuK040Q0sxTm9rMy9VRDhJQnpxN1R5aWRUL2lz?=
 =?utf-8?B?eXY1Vkx5dktWU0lCaGpRNkw1TFRmVXFROS9BeUtBa0R5cmhPQmlDQkg5MUZG?=
 =?utf-8?B?TFBUNVN0UEtSZ25RaGJkeDhyWk9PM2s1TFpuVEJCZXU5Tk5YZVJIbXZJZ3FU?=
 =?utf-8?B?OG9OVFpTbWUySFFtQXJkeHFHazdBejhJUHV1MlNJVEtxRThUQ3RnUk9BQWNw?=
 =?utf-8?B?SXFIMzA1ZVdtRTZ1TFkrVWVCSnp5R2p1cnZGclRwekVJSnRlNEVWZ0ZZYkNE?=
 =?utf-8?B?VE1XdzNsTStKMXpZVmFxdkhFVkpzSWkvVGN2d1NvZ1hLRHBPTCt0MUFSb1dL?=
 =?utf-8?B?eDIyUGFWcnBUb2JnRmNoMlEyVzR5VzVhMUxGWm1DU2M1V3dyTDA5a1BQVXp6?=
 =?utf-8?B?R2RTeC95R3hXdnFESG50eTNlYzhLRmthQlNRN1pZSjlHMXNXUC9Dako5a2pv?=
 =?utf-8?B?YmYrR2JmMnE0SHYxcnRvbE9LU0hoSFhKdGxCR0dmRDZDSXpyaWVLdzZuY1dU?=
 =?utf-8?B?MklrYTBIelVSM0RsRDJVVWt2TVYzbEJMa1RlUjAreDZUem55TkRKMWdWZzFm?=
 =?utf-8?B?QmdtQkZ5ZlBHZHdJcmZWeklSd0o5dWhnVG56bTB4UGNtYW5IOGZ2N2hDTFpX?=
 =?utf-8?B?eGhBQ1hmdnR5WDZMeFFOeHhneUZJaXlIV0lra2ozSkllSzYycDdwY2pYTnJ6?=
 =?utf-8?B?SnlJcWtsSzdyejBRbEI0aXJDNEUrUnMrSm9wdnN6andpTXIxdURrdmkxazY1?=
 =?utf-8?B?Y2NnWGhwYm43TXV4RzlIMUZWSlJ4Y2dpZEdMSTM3R1BjNXhQdElleUhpaGVr?=
 =?utf-8?B?VGIwRXhuUjRuK1psOU5ZeDBwRTNHV2V3WVdNajlkaWJhQjNRSDhtR3lIQlR5?=
 =?utf-8?B?amF2SDFDZVh4WlQwRE4vMHV6R1RES1A4YlJjL0hOUmhUTmJONmJSbjE0ZER3?=
 =?utf-8?B?STNydnd1U0h6eXIrMWNWUnJMbi9Dc0ZhRk1PM2t0YTZZTHlMWnNLMkVvSitn?=
 =?utf-8?B?cGRIYWZQZXYzTlJ3SEZ6S0Vya2tmM25EaUEvVEUvUzlic1FlMlp4U3hyZEUw?=
 =?utf-8?B?c0pxQTRpZUZDYXZqR3NDWEpYVTljbll4U0hQdXJwYTFnTlNZb2RMdjBzLzNw?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8a091f-671c-411a-87d8-08de2911cbe0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:22:34.6534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ve7cp2RkY11HvDzDKqb8F2wTeEjDZzWI4HBX/ikuPXhiQKukzqUeR8sgaRCW5065CEP5a0rEHUQBFtfaNbAa8UVtZLw/esKUmy6CJ7PcoLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8193

On 21/11/2025 3:10 pm, Jürgen Groß wrote:
> On 21.11.25 16:03, Andrew Cooper wrote:
>> On 21/11/2025 1:23 pm, Juergen Gross wrote:
>>> Add a new make macro for creating <file> from <file>.in at build
>>> time. To be used like this:
>>>
>>> $(foreach file,$(IN_TARGETS),$(eval $(call apply-build-vars,$(file))))
>>>
>>> This can be used instead of the current approach to perform the similar
>>> step for file.in during ./configure.
>>>
>>> This will avoid having to run ./configure just because of modifying a
>>> file depending on a variable set by configure.
>>>
>>> Prepare to have multiple files as source for the replacement patterns.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V2:
>>> - don't use pattern rule, but create explicit dependency in macro,
>>>    don't require to rename source files (Jan Beulich, Andrew Cooper)
>>> V3:
>>> - prepare for $(PATH_FILES) to be extended by other Makefile
>>> - let generated file depend on $(INC_FILES)
>>> ---
>>>   Config.mk | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/Config.mk b/Config.mk
>>> index e1556dfbfa..39e8007b9c 100644
>>> --- a/Config.mk
>>> +++ b/Config.mk
>>> @@ -159,6 +159,19 @@ define move-if-changed
>>>       if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>>>   endef
>>>   +PATH_FILES := Paths
>>> +INC_FILES = $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
>>> +
>>> +include $(INC_FILES)
>>> +
>>> +BUILD_MAKE_VARS = $(foreach f, $(PATH_FILES), $(shell awk '$$2 ==
>>> ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
>>
>> Everything else in the series is looking fine now.  But why is
>> PATH_FILES dropping the .mk extension from the file?
>>
>> It looks weird for both INC_FILES and BUILD_MAKE_VARS to have to
>> re-insert it.
>
> Hmm, right.
>
> Let me change that.

If it's only that, I could fix up on commit to save another posting.

Whole series, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

