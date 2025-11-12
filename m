Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387FBC546FA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 21:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160475.1488603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJHPL-0004SB-Vf; Wed, 12 Nov 2025 20:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160475.1488603; Wed, 12 Nov 2025 20:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJHPL-0004Ox-SP; Wed, 12 Nov 2025 20:25:35 +0000
Received: by outflank-mailman (input) for mailman id 1160475;
 Wed, 12 Nov 2025 20:25:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiA8=5U=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJHPK-0003si-Lk
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 20:25:34 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdb1d539-c005-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 21:25:34 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS4PR03MB8506.eurprd03.prod.outlook.com (2603:10a6:20b:576::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Wed, 12 Nov
 2025 20:25:32 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 20:25:32 +0000
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
X-Inumbo-ID: bdb1d539-c005-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgLML+ayXDhYMs6c74tVIxzoola2z6s/dmRyZoC5033WvueQQQKEluPX5MA8oaeQFPS+DVPEwm+04ZcuoZBeHv0MDabUyxaA6aK7pPuEs1RwTz1UwouDdNqT+VghLe8CK5MnF9itBaa82ZFf/R7DtGq6mzZ4ehyJuPoGTkbWU9qgL3baAT60NQC32gcEQDLfEGdljY3TTjemVNLe0Owo1eknWEAUdj3oVW27zP/OSiOMtdKOIlQBR2IyUJ7KVV0puvTSs/C/o36u0I/TdlqeGerse8Mp3TeOvfV9iUa0m1ct/bQr7DA7wR4Rjx+HyVi8hf8M/clcW30IZonbT/03Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEc11qj6VNeS+qQGExmT8/5BSuSV1Y4Xhy3y9veJe4s=;
 b=WQUw6HMwezkwmx6N0RicXsvZvNxpgeBVCCA6hYakiNWQLKPwwhKx/rgY3y7pWv2XWJCkI0TbPaDad7VuODux3KqkGCJ8eSs6nPfEJRtEJZeZ6vwTxu1+TvZM+IvkFLvZ07fdpSO4zRr/fukpXGLCJNobYdLZ94aQ8kF8GNOAJSrCpZUTdPIpZJcOx1gypjYlKmGjSGfGTTwqQEwJY9nhfoq3R1UvKWweiaQLlx5Hk3M/Uy+UtOVlrl387jcHQlK2QKV/rK5T7jZngWypBfpt3IgFWQgoVp2CFuEPTfJoHl15cxarejSsxgstcNWxl5Ksj//BnYjzgg/I2gLW6IIi+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEc11qj6VNeS+qQGExmT8/5BSuSV1Y4Xhy3y9veJe4s=;
 b=XCHYTsrZO/LrOMdaKADUU77jxIJvR934fGu25/Srr4b/dmhLtGv6ZCUYE+eKbpbjTPPAiCie4Mr+arYlJuooOzwrNxHue3N0BdEQcG1OZ+XiYzEPsmBxSYyJIMyexBjmwE74b6i9KvLv49IK2gcULR0qwKKuQlWTfWO6slT07MrIJA4nZEcdFrx7nY71B0dLLynObQoXclxrlbGRg4+QQP9H+4fHJJ6+Bwfr05jirW+BN1W7/AIxyieST/a+GHectysoweOzEVl78B/M0BxIFT9HPBSO85aDH6pLdFup4UksL8sMvJ+GC7Dk7vi1nvrLe/Sw+hF4tSeuFokswosbvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <7b2fe09a-02f4-4575-9e42-1328f3a40f1d@epam.com>
Date: Wed, 12 Nov 2025 22:25:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: revise "cpu_has_vmx" usage for
 !CONFIG_INTEL_VMX case
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20250924101417.229108-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20250924101417.229108-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0046.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::15) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS4PR03MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: 8090cf44-484a-46ec-9421-08de2229a10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NU9tMm9wZUJLYVFUbCt2TDJJc0lTMFJyVk03NmhqMlFoT2RyUjVlUWpyYnZG?=
 =?utf-8?B?ZFJtS2p1VTVqaVIyL2xmU1VqcTN0Y1VpVm9sck56aXJrRWlRb3RSNS9zaFZJ?=
 =?utf-8?B?VitWZzlXbjlyMzBxRDRXT25ZaWdTWWQ4aFcwazlqcWNWd29rUnduZDlhWjM4?=
 =?utf-8?B?UmFUV3JiZC9Ob1VpNEtFcitIWkZRQSt4NW1zcGdxQmFvbGVvZm1iclRjOXpL?=
 =?utf-8?B?OGszcVBKRGhrNGJIayt3cE9RQXFBWGZ0RjFETVJLK0tPRU9WZzdoMENRM0xt?=
 =?utf-8?B?UTRqTjZOUTVuU0xCSy9WaTIxbkZrUEtnc05zSFc4K0NKcW43cVI3OXAvNzNU?=
 =?utf-8?B?N2FFeGc4b3pPeG5nS0xpTE96T2I0RUdXT1htaUlITS9NUDNjY0YrT0dBVk0z?=
 =?utf-8?B?WkhPOWN5NUQwZmZHa0x0b0E3KzEvNEI4WElTN2M1eGU0UFFWNXdKQWs2cy9F?=
 =?utf-8?B?WERtYjN1dmI5WXRKKytVTGxMY2xrUGhjVlJHYnJUVlJiSHUzL2JTbkd4TE9Q?=
 =?utf-8?B?cHZwalpVN0FzeUg3bmgvbENhRUxNQURFRjg0ZHpZZnpKTTVjM2dkQ0NjcVNX?=
 =?utf-8?B?UXNEd0pDNXVNUUt3dXVZNjNWMzNsQjY3YitqbmV6QXR3MGZmWmFRSjFlMlIx?=
 =?utf-8?B?N0JwaERLekVOYXhVRzhRdlk1bk1PR0hpS28zZ2ZSRnYvclJZTDNvUFBoaEFJ?=
 =?utf-8?B?UG5wbHh3M3dmTU9KK2hYQThUUS81T3ZyckpkekpaTHlsZVBnSUE0cms0ajNF?=
 =?utf-8?B?NmJGWkMrNkNsdTNMK1BWMjdOblhRdC9USTlkbFRBT3N5WkJmT0pPR1hrMDBm?=
 =?utf-8?B?RWtocGVCRkJvT0RyUjh1VEJFYVV1NHkzdjlWVkZZV3NTU2FmRkZyQlBkMVFO?=
 =?utf-8?B?N0d3eTJyVUw4ZDQvMGJ5RG9tTS9reWVpaXB5ZWtZckR0aE5iNVR3M3ljUFgz?=
 =?utf-8?B?NjBnNDFMLzJ0Y1U2REhHU29aOW8rRnNCOXUrTis1dnlrWEJ4a2NoUXlMeG16?=
 =?utf-8?B?M2RkcXdXUWxwdUpheU9YNTNiUllPR01PR3FncXNYUFgyVG1ETU94aE1vWjE0?=
 =?utf-8?B?Y2VacFN6VnlJZWFNeUovR3JhK1QzZy9pandpcGtFOStsS2ord3ovOG1xMHk5?=
 =?utf-8?B?WktjSk41NmF0TzZFV0lGdSt4TS9ySVhJM1djenE5WXNzME85UUpXYW4wZUtG?=
 =?utf-8?B?UTVSSEFHUFVTYlBsb0dMNUdJRjArZ0E4RW15K21vbGlIVXBXYk9nZm5PN2x3?=
 =?utf-8?B?SERhMHg1WnZ1K2tVN1Y4WWhzeE53SXBPamtPMjdzSkdGMFZnTU5CckJBWmRD?=
 =?utf-8?B?NktpOFlESXl6NGtwRC9ZdndnZkJOZWE3YjhyeWloVnlWdmYybE9YdVErSUlr?=
 =?utf-8?B?Y05yUWN0UFNzTXhlOG0rajVhcUlKcVhGM1l3M0xzdDJ0OFZ0ajBFY1FUZm1j?=
 =?utf-8?B?V3lERGtjaEJycXJaVVhHQ2xIUmVmMkMzNUZxbEgzY2pJRXBiQkdoR0wzZEZz?=
 =?utf-8?B?cWU1MW1nS3ZOc0pLbWlPaytMMDRBT0YzQmxRVk4zdjFXNWw3cUZTZkg3ZEZa?=
 =?utf-8?B?UzV6WGpZb05qZE1YUjR1ZlYrOWJnWHViU0UxU1d5SjFxUGpvOTd1dXJjbGhv?=
 =?utf-8?B?SzdwNUx5MjlhaXhPdWZGY0hWbE5VcDBPYTg3YVIvQ0FYRlBoNFJmYVhUeVA2?=
 =?utf-8?B?bUpkWkpCa0pwcC9JWklXUWpoZXBMUHVXalRVRGUwbGtVRTEyVzQ1M3pvYURK?=
 =?utf-8?B?TU1ocGhLbTlRUVV6Q01yQWdEcEhFYThyc3o2bVBvdlcya01mZzJrMEpDWUdu?=
 =?utf-8?B?UWU1M1piZm9GeStDaTRML0RCZlhDRDBvdDFjL2hWVHB0R2dYU3hVS0tRK0w5?=
 =?utf-8?B?dlVHdm83UVBTQTRoZDV4Tm5mV3ljejNrSng3STNNeFU0STYwWHVLd096SXp6?=
 =?utf-8?Q?0F1t2nU5RM7swvNn7avaUccF9MbjzkKc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2IzSEsvMWVEVzFrZnNpUGlnMTUzMXhiV0VHWmtSblJFSlhvVjFGemRmNk1T?=
 =?utf-8?B?RHhMUVJvQXUyYStmZ2JVa1Bod09Kamp2SnZ6SFcwVUMvMDFNR3ZZYXRCOGQy?=
 =?utf-8?B?ZDZDbG85NGVGZWp1aEhtblhTYmFWVEtXbWRjK0tablF1M2g3VWRMTUFqUWlC?=
 =?utf-8?B?THFoM2xjcXJJZnZudElRV1AxaXc3TTBVa0xza01iS2Znb2xZYVE4OTNackJv?=
 =?utf-8?B?NW44YVBQQWJnT09YNndzMm1MVkZUZlpWaVlIZjMxSVgweEFIc3pVWmYzbi9R?=
 =?utf-8?B?MUloUWJ1Zm5aMUNqK3V1UFJwUVp1TU1WenBqa25BYlE4ZkxCekQ0eVRyTy9u?=
 =?utf-8?B?cDBrdWp4NHgvTFFob2ZTZFB5QW1GYTEwcGxnUEVqc093VHFWdHc0YlczS2hD?=
 =?utf-8?B?SHZ3UFc5aXBvQ09heGdVbUtCMVc2SzJVQmFhVmsvd1Z3WmUxRlhwZm1aOVpD?=
 =?utf-8?B?SnZsS1k5SG1VM0ZBcDc1M3ZzdVUwVjhZcTh3ZTg2OEZTN0wrL0QzczM3RXVt?=
 =?utf-8?B?RUE0bGluK2ZMUFdINWN0d3Z3dmNiSW8rM212b1YzcFFJZFhZQ1paQ011MFlr?=
 =?utf-8?B?TEU5OVNreFFJZWwrZHk4L1A4VVpSM2NqanE1blM1ZVFnK05xbTlhY1VIOS9r?=
 =?utf-8?B?ZHNNYmYwaDlINjBYeGlDQUZZeDVsaE9NNWNQNWxqTEtpcjNtRnlIQjBXbitp?=
 =?utf-8?B?RXVaQnVmZHZaWmRGV2xyZ2ZLbUdQQTRMUjNta0NrTVVueFVpQ2dLd0lxT3BF?=
 =?utf-8?B?ajFFZFYwU1BrVUp0VW9MREJZalpxZnBSSno0MzlzamJPaDAvUDJqa1doeXRo?=
 =?utf-8?B?Y0VPUjVNTGFEcnlLeUs5ekhVY1pSdGhDK1VvQUw0UDAzbElhbHZYMnVYK0JN?=
 =?utf-8?B?bUpyMGZSS0RFUlNNbk9Ib3ptWDYrQ0FUeWdWOEMwUGZabWp4TysyQUJqbk9C?=
 =?utf-8?B?b21QWUxRRWg0dC82c0ljZUMxQUUxK1FWbzhxdDVlbVp0WS9LRkJjYmNVcXFU?=
 =?utf-8?B?MEVST1c2N3pkaVphcXQvQWVJWXh5RytkZGRVUXl0NEJnRU5MWWhiYnpxTHAz?=
 =?utf-8?B?NVdaaFMxVDVxMHVQSUlVWjYwUGV5MHBIcXBuc3dvMjQzWXQycld3M0Noc01m?=
 =?utf-8?B?aHF2am8wUnB3NVBveFZ5UGJMMlRqVk4rNE93Q0ZKamxuYzY2MzY4QUNPekds?=
 =?utf-8?B?ejNUY2VLRkNzYmJIejB5SW9oOXBrQ3dtWEpvcVdGZ3VWTzJ5allJOC9nMEc2?=
 =?utf-8?B?NlJQcm0yUThHZWF6aUMyeG5ic3pGQWlwZXFHb3htYTVjSDFrWG8xWDdhRElt?=
 =?utf-8?B?MXB5MWxCWTVRUURPTFRwa1JSQ3hBWUtKdHpDNW1oeFdmS0hlUTEyR3M4dnYz?=
 =?utf-8?B?R2lwTUVFbm5wK2pQckpYVFpkKy9zSmFLOXRNTVJ4VE9LWDBkRUJjVytObVl3?=
 =?utf-8?B?RTFrejVYS29MVHlCeVdPWUFjRzhhKzJHRXFRS0grREpiY2YxQnJuVlNuaDdt?=
 =?utf-8?B?VDRxQ0lsYVdCS2pUKzZwVXdhU1hyOGZ2bWEzYUh5TFVDNkExcGFaV3k3cGNy?=
 =?utf-8?B?ZWh4bXIzMXRNeEJxYnkzd1E5SFZqTkx0dm50b0Y0Z0ZFNkRJVVJXMWpsRnF2?=
 =?utf-8?B?NzZzMXZ3NUNzc3hOTEx0RFY1Um5zMmJveU1rdjBwZkF4RlZEUm5sMmo2RFJu?=
 =?utf-8?B?ajlUNlVuaHN1cWVwR2xEdzlqcXNDMkpuT2F3TjZSRUxuZUZlRXFjd1Q3emdO?=
 =?utf-8?B?c3JnZnZiRDhCVU1yZkdlV0xlRnNPMkxJRzRyZ2w3ZXAwTXQ4OXV0ei9vYnlV?=
 =?utf-8?B?NXRGNWFCdENCTEVHeE53S1dBN3JtUnhUN3ZVNmV1bkRDcUd2ZTdEbldEU3Yv?=
 =?utf-8?B?VHRTTnRjRVRwSGh3bE04ZWxmc3NKSHhyUkVEQWZONWMvSTIxY25KVkhUQmdl?=
 =?utf-8?B?VjkzUFMxOWJ5WXNYYnh5WGhrTHBoREw1Y0Zza0FnRUJWQ1Y4aTk4SFk2S1RB?=
 =?utf-8?B?NHdZNUtTSmEvMXo2U3h2M0ZHUUc2Y3B6UFpPSlR5ZTRjbEtRbEJ1dVZONlpF?=
 =?utf-8?B?ZGo4aTlNd0hSSDNsWERTVStjN09veHNlZE5RTHJuK0xNZklhM0pOOUxzQ0Z3?=
 =?utf-8?B?b1QyTGJlZDNqOWc5OVFLVDBjSnJTRkNqbjJ6K2E1L0ZqcTcwanAyUEFsU3do?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8090cf44-484a-46ec-9421-08de2229a10d
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 20:25:32.5402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slcQg8rxjiNjnK/+vV9k/Y8lJbKq8rvtqoRfABIw9z2Z5pvJ2fK6qTCZ9oGVFIlkaW/XTVznW2rQPLHq0XfJ5jcTx0H4WWn8Ppqc4MYA3MM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8506

Hi

Could it be merged if no other comments, please?

On 24.09.25 13:14, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX dependency") the
> HVM Intel VT-x support can be disabled, but it still keeps VMX
> code partially built-in. Particularly in HVM code there are two places:
> 
> 1) hvm/dom0_build.c
>   dom0_construct_pvh()->pvh_populate_p2m()
>      ...
>      if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
>      {
>          ...
>          [unreachable for !cpu_has_vmx case]
>          rc = pvh_setup_vmx_realmode_helpers(d);
> 
> pvh_setup_vmx_realmode_helpers() allocates memory and configures
>   HVM_PARAM_VM86_TSS_SIZED
>   HVM_PARAM_IDENT_PT
> 
> 2) hvm/hvm.c
>   hvm_set_param()
>      ...
>      case HVM_PARAM_IDENT_PT:
> 
>          if ( !paging_mode_hap(d) || !cpu_has_vmx )
>          {
>              d->arch.hvm.params[index] = value;
>              break;
>          }
>          [unreachable for !cpu_has_vmx case]
>          ...
> 
> Hence HVM_PARAM_IDENT_PT/HVM_PARAM_VM86_TSS_SIZED are used only by VMX code
> above code become unreachable in !cpu_has_vmx case and can be optimazed
> when !CONFIG_INTEL_VMX.
> 
> Replace "cpu_has_vmx" with using_vmx() to account !CONFIG_INTEL_VMX and allow
> compiler DCE to optimize code.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-604 (-604)
> Function                                     old     new   delta
> hvm_set_param                               1602    1473    -129
> dom0_construct_pvh                          4438    3963    -475
> Total: Before=3567191, After=3566587, chg -0.02%
> 
>   xen/arch/x86/hvm/dom0_build.c | 2 +-
>   xen/arch/x86/hvm/hvm.c        | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 5551f9044836..5ac2cf8394d8 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -473,7 +473,7 @@ static int __init pvh_populate_p2m(struct domain *d)
>           }
>       }
>   
> -    if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
> +    if ( using_vmx() && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
>       {
>           /*
>            * Since Dom0 cannot be migrated, we will only setup the
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 95a80369b9b8..70331aeec9a0 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4302,7 +4302,7 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>            * Only actually required for VT-x lacking unrestricted_guest
>            * capabilities.  Short circuit the pause if possible.
>            */
> -        if ( !paging_mode_hap(d) || !cpu_has_vmx )
> +        if ( !paging_mode_hap(d) || !using_vmx() )
>           {
>               d->arch.hvm.params[index] = value;
>               break;

-- 
Best regards,
-grygorii


