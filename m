Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A46EC51F76
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 12:28:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159874.1488140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ919-0002IW-VE; Wed, 12 Nov 2025 11:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159874.1488140; Wed, 12 Nov 2025 11:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ919-0002G6-S4; Wed, 12 Nov 2025 11:28:03 +0000
Received: by outflank-mailman (input) for mailman id 1159874;
 Wed, 12 Nov 2025 11:28:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiA8=5U=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJ918-0002G0-UC
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 11:28:03 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2a4a73c-bfba-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 12:27:57 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU2PR03MB7861.eurprd03.prod.outlook.com (2603:10a6:10:2d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 11:27:53 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 11:27:53 +0000
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
X-Inumbo-ID: a2a4a73c-bfba-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKWGvRsKvdJVdAX2IcizvNgwhBexT03cAQ5G8wxpTp0N14Him3VxXv/YiQI+x2pg5QpS3ApRxw3i6LlKvWLOinKPrWTp+55CbnXDg65Z1jFPkFQa8vc7/Q+NGf3jZh4rbbvn8AImXVWAqm3X7Vq39PSgjcukry2cqZs+dMBlMibPzdvj3CPQSbX706OUaQTDYkGv3jWxLok01Cj2Ego5m3y0qLhQ0qnoHrzM6uWgbsF9a7njPW0pwKmCS6cfq0tKCZgxSLpNLzFUR1W+f04t9UNSRYTDQAB2B9fYc+IHcmnfaSP9Nz7/qngLziO4akyBlan4tPtX4cZAU7Wx8nUuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1I9TJrjgMudyBKRZmrKvMnKVLHf4X1aEgWQ4H56dCI=;
 b=w3iCs4Cz1TLWCMryLhUBXRjzV8DYnLGVHPOGKIDyUSktbLHBaUyPkSF1O5OXs2iEeBMHNnlX28B0p/Vqp8SIGYR75GIbYnyASjM99jmnmr3mV1imYNaN1jaK1ZtBtnzxPap/jt3gqO8agrkOMVwMIEEotdnvXWta1M9SqHclkErb0nEMGpxLGBJV/wL48kpBX3cexQMTyGNAnubBAQKsdiuiJjraOudQz531gGwY3DrLwuz469366bKyO75T8+DqJmt7KZvGqOJzf1ECxd+KoXjvrLYzrN1AjLjSQE+thgODIxW5OXBL2l+5FEbYIwTkROv6XP6UH9tSTnZnf1ks2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1I9TJrjgMudyBKRZmrKvMnKVLHf4X1aEgWQ4H56dCI=;
 b=VlU3ySTWWKvSaORYnXaUSijoKgv9TlgHZVttsrRaWfgca/ZE6k0MRwp6KeiGgJBTEgaF5BGkjh1czkTh8ty0uC5MoTIKwUdPEKgxDBOB5ijwW3SDi2reovNQ8ChcuuwFAZFZCBeEI/OigPwc0VtTlcXM50vClJf8zyDkXcznrGrsKwzYHcSmTOPQtkV8LXu9SBDs06sGNvahgZmTuD/s/9heNfCe1Fx3oawkC0PivqzH12aSDohP+1ZQs8DfvrSoB9Gp74eAaIBIw6A6XaCxZ4CUFXZSVsAjaZPF1UXomyhKrLWL8IbopG5PPXXVexOdqVcS9BVewBN9isp114L/aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <a858cfd2-c6cc-4ed1-bb12-8cad488f4542@epam.com>
Date: Wed, 12 Nov 2025 13:27:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Lira, Victor M" <victlira@amd.com>
References: <20251107181739.3034098-1-grygorii_strashko@epam.com>
 <47f86a44-007f-4b90-9656-b2440238b2ba@suse.com>
 <f0a5a939-7d66-417d-8a88-34cc172623e6@epam.com>
 <faab050f-677f-469c-8bca-93c55a53165c@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <faab050f-677f-469c-8bca-93c55a53165c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU2PR03MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cef52e1-d34f-4a10-9de0-08de21de84bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUc4M3JGb1p4UTNrSEVoZy9rL1NNbmtBZnkyL054VUkrVklaRnNDZng4NUZO?=
 =?utf-8?B?dWhqK3h0Q1R3aDA4cGY5bVc4VjRtSGxMZlNCK3Z6NFU0YlMzd0VpQjIrMXQx?=
 =?utf-8?B?bUhQVE9weHhZMDA0MFgweG9wTmlIZkRMdFZ0TjZEa3JSelYrQ2FGUkJNMFI1?=
 =?utf-8?B?dm1YS3R0WUg5L2tWcTdKY2VrUVNhQjBrYXhUQ2hvaE1JajRIeUQ3TkNuVTF4?=
 =?utf-8?B?cDNPVXJtV3lhaENLR0xLanJBV0VUMDZyMjlobnoyLzFqdEUyZFUwcFZUbnVP?=
 =?utf-8?B?ZXhwNURFd0lONFpKOHJmT0ZRNFNDZkNlRXNRM2xqQkhFWGFJTG1QU1lEdUFB?=
 =?utf-8?B?Q2duTTRRckxZbTVteVdjQXhxaFNvQ21jRktocXVlM1Q4N2luRVU3L0NLRU5O?=
 =?utf-8?B?N25DUXdmQVhkQkl1dXFQQy9HZ2Y0cU5USzdGbmRRZzlaMm1DN3RrcCtTK0Rk?=
 =?utf-8?B?czZERnFvMTBhWG5KZWU2b2lacXU5N2dyejRZMTNYRnlRVFMvZXAvZTlrcG5o?=
 =?utf-8?B?NzBWbGw5L0txZi9QTVhFLzlLSjBrR2dsK0JOTjlLUWVmSzBuVzcyTWNtN2lW?=
 =?utf-8?B?cEhkSHBwSCtTSENrZUFzUDJ5ejVDNE9aYXY3dmREcm42OThOcktWdkR3azNF?=
 =?utf-8?B?T003bUs1Sjd3eFFCajJYbFB2NC9MRlA5dmUyUnVSMWpLMzFwRFhZZWdvNjYr?=
 =?utf-8?B?QXBVeFJXQTRnR0ZZRmN4eUlkUi9QSW9kOTd2ZnhqZzU1cGNpNjRzd1RnWmw4?=
 =?utf-8?B?RVdwSFZsMi9TRURibU5ta0M2Y0J2MmZOR2lOQlJ4dWJhNVFZdVBOWllsOHhU?=
 =?utf-8?B?ZlZOd3JRSkF5U0QzR2QwYzUrNFpmdjduZ3ZNTlNUdHpBSkdnZmtzODVrN3Nl?=
 =?utf-8?B?V3Nvbm0zTVp1M0RsOHdycjdHdVVOYmFPMkhNZ01uQ1lYWE1oV05IUktZd2tW?=
 =?utf-8?B?M1hNQ3EzTk9ieHNaMkxoUDQ3U3o3UnhVeE5jWUpWNy9va3F5QkxzQVBrc3Ar?=
 =?utf-8?B?Z3pLR1NvREtlN1Y4bWNsMEE5WFB6TzhEbjd2bXFwZUE0VDUzWG5GL1ZiK3Fi?=
 =?utf-8?B?N3ljUkNDdkhiaXF4SjhHckJ6RGZrS1VkMG5rbEdTY0srTmtUS0dzTk40ZENh?=
 =?utf-8?B?NVJWMm1POEEzbG5RMENZc0JyKzRSaEFIWGlOWDd2c3JKN0VXNWF0aGpSUDZ6?=
 =?utf-8?B?WFFjampDVnJtYjdBbURqbzRKak9GNDUzMEFwRE4zQW5CZ01UeDROKzJMN3ZG?=
 =?utf-8?B?VHc4eFFiQVo5ekhwbHg1cWZjWU5kbEx5VnVJVEJkNXI2Nlpmcmw0NHV1ZE9Q?=
 =?utf-8?B?eGRrTHV0TG9DZzdqa1k5OTBvU3BTakRKbHhLRzdSaVdKUm8vYXN0dTZkOU1Z?=
 =?utf-8?B?YUxtbTE4aHNBajliV0Z0a2lNWTRrdTRteWR1OFkxbjFBOGxET3dndFBoenJ0?=
 =?utf-8?B?RUdoMWZlRS96djlYWm9xL0ExcWFWZU9QSm9yUkJibXUwdjRlOEQ3bHpLdStI?=
 =?utf-8?B?RDRpNGlkOVkyQ3E2aVc5bGpJWXZsR1VlOVhKOXBZRFNneWlROVNOUXVTUDcy?=
 =?utf-8?B?UGpwbGhsZEdGR2R2UkorUHJ4dXZVUG5uWEtJYVA4WlMzNUdJWlphV2N5N0k0?=
 =?utf-8?B?KzdXWmJmYTgyV1hsVUV3WmRwTmgrWlV1TGVPZjlUKzhtTDJUaUEreFBIMDUy?=
 =?utf-8?B?U3lJc0ZwQW12NllraTVUS1NwK1pjYnM0OG5aVUxGbnJ3cVFPYmszTldxckJN?=
 =?utf-8?B?eXFKUnM1cmhoUnlXTnBQOGVxcW5zcDZSRDAvbGZ2SlhGUnVZUnJ0dWZhWVVy?=
 =?utf-8?B?emdwcW9kMU9oZDcwRGdIWkEycnNQWkZ6Zm1hQklQL0tBRDFzSVFHdkg2Qzl4?=
 =?utf-8?B?NnVHVFhHR1B1aUJhYW5oVDJrekZrQ24yT1preWN2V0NJUnZ1SHBGMjhibk5S?=
 =?utf-8?Q?xJ0XVE8xqLjdaBvLNnu9uU3f0UyL149p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHhrd2dzdGNFenZNSXFmY1AxY3REK0pveHZNemtoS0FFRTBSY2VzcUdBZU5D?=
 =?utf-8?B?MjBBWkgvSC9keGljSllsQlZkN0FpYXVHeGd0U21KZFR5UmdoUWJHRWxTaU1o?=
 =?utf-8?B?Qk5XcThLbFJSN0ZWelNKVWhsMjZRMXNJRFdCemRpSDU1UEVuRU0zdkhZU3RM?=
 =?utf-8?B?MldFTDdKa0ppVlFXMFhFdXMyYjR0alFYUXBJL3RBTVBSeGZKNTMwOEgvR1pv?=
 =?utf-8?B?bEZpeFJ3YXRRSGZWY2RVb1E4cVVkaDRYK2FtWDJzRHJCU3grWGlpb3QrbEE4?=
 =?utf-8?B?QzVXUWhkN0E4SldVUlpiSldCbHg4RTRxalY2M1Q2N2NNeEVZQy9ISC9IdEZQ?=
 =?utf-8?B?eW94d3VaWGtOMTVYZitRN2QrSlkzMXlVcE9BbUhFc3o1ay9QTDNkQkcvWFhY?=
 =?utf-8?B?UVF5ZEMyTjdtUUhMOUI3M0ZqNG9KNGVnQjdaVnM1ZFU5amhlVVhVVUo3Z0Vs?=
 =?utf-8?B?OVFVNCttUTA3QTFxc3VxYitLNXN1YUdIZ3c3Y3RJcWdkcFdVOWFGRWVuSS9o?=
 =?utf-8?B?eVErRlBZMW9GOHJQcHQ4TVpNSjZ3ZUFSbUhqT3h1TjVSVGxBZ1AxdUNMODJl?=
 =?utf-8?B?cGhoSi9kb3prZ3pEWU1TRXhkZU5rMFZOUWtRTlYwRnI4R0RDT2c4YzRwZEZN?=
 =?utf-8?B?WUVYblV6RUtkaWlRUVZHbFpyR2JVemd0dWdqcDZzeHZJa1BHZkFkODRxKzd0?=
 =?utf-8?B?cWxzTms5UlF5VHFYelFHK3QreU9sUlUybUgreVFkOEc1bHJwWkNtZkFmVEZw?=
 =?utf-8?B?QWFySVpEdWtwQlRnbElGWkhCc2dlcCtualo5OU9XQjE4WjI3SE82elViTDFv?=
 =?utf-8?B?b0FudkFkb1g0ZzFhNjllQ09uZzJDQWhlQTdsQTNoTWNDRUJLbHZGME5YY20v?=
 =?utf-8?B?SlNIZXduaFNIc2JON3NRUEdJN29IMkgweDA0ck5XN3cxUkZrUDlTOXQyTmZt?=
 =?utf-8?B?bHNNd2xMU0ZobXRYaG5iakJvVk54TGpBb2cxYlVmWWwxRHR4QkhZbzVmSm4w?=
 =?utf-8?B?SjhaUlI4VGpMRHVBSEFMUHBRV2FZRGpJMDVEWDdKTWpwdkY3VStxa1JxSS9p?=
 =?utf-8?B?UjI0WWxQOFc4ZVBLbld3VVlqTTR2cnREVllXWE9pZ3VqaUJNblJaUzkxQS9I?=
 =?utf-8?B?SzIwUTdhaXM5MlE5YU1xYmNIQmk5bzZCdjAvSXlVam4zTzQvbmJ6NjRDcjE2?=
 =?utf-8?B?MEhVd0cvYmptY21uQnMvSHFqMVM5bGQ4bkhGejZqNkdXdWZva3dtWEVpa0lx?=
 =?utf-8?B?alhBUXNDNEJxVCtyTkFwRTRubFZLVVBGVWtCRG5yb2UvN2JiRG9YSnFpRytJ?=
 =?utf-8?B?WjlFaVUyRUp0QWV1LzlBQjdoL1NnNDFyTmJVRlNIN1pNMVJPRmpsRjBpRktM?=
 =?utf-8?B?VWhDdkxiVmd5M3c4Tk4vRFh2aWtJM0N1aGgvZzlZZUNYZVlEdmE1ek5sNERh?=
 =?utf-8?B?MUJsWi9EaFBnZnEvK2ttcG8wM213T2NPR0lsYWJxUXNrV2FFN1lZSDQ4NjRQ?=
 =?utf-8?B?UGJ2Q3NQckZJYzlTYkd6NlhRK3kxNVJESCtjbFhXaXgwM3U4L1YxZlkrK3l6?=
 =?utf-8?B?N0dHV3JWTjRxZmR4QWdBQ2lWaVJWWXZzWW4rektyV2ZaTnhmV0RQemd1MGNS?=
 =?utf-8?B?SU5iRmIzSmZjRXY4cmlqWCtMUlc5SDVsZTJpc0VZZEZJOEhpaWdQcjNpZ0V3?=
 =?utf-8?B?WGhaUURjbDcyL05zbDJXM2RKbVhQRm5iMzhDQWlWakU3eVg0cnZOUTVWZVps?=
 =?utf-8?B?Uk01K1JmK3AvbS9POTFlZFhTcTJyYkY0azNIdlIzblczTGZ3OXpFNzR5TjRq?=
 =?utf-8?B?ejdwelFPMHZ6WVVUdXdGbmg3c24rUmZDSTRPTUhJc3ZXSSt2aVlzMFdLUGRr?=
 =?utf-8?B?aHJSc0NDeGV6NGlsZXloR0pFMHcxQ2lUT25nbjZET3hGbWFyRHJqUkNIVUNs?=
 =?utf-8?B?c0hWSkRFRTF1dGZFTDNReWJFMWxod2RNOVFFL3VsMmExblplTE0xdWdrNXVS?=
 =?utf-8?B?ellFTyt2bWpoRkltcVFqTVRHaFFEVnBLSmdUMHdQSXdtQnFBcVE0YVE5djdN?=
 =?utf-8?B?c2VpblFkWk9ydUlFY0k0T21aQzUwdTFLQmlybFJLU3J2aEhNVytYSTZBNXZr?=
 =?utf-8?B?VGFGbG9BbGQwQW1NbkExZHJDU1JJalJIR3pud05oamZOUFEwUlozQ29ma1Vy?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cef52e1-d34f-4a10-9de0-08de21de84bc
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 11:27:52.9637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFj3IoCrtajLl+83yWuGgStPJOQ50S1Q7bo9efV75NYv/76GJfbk5I4Ni58mEbR5Mk60RujE1w6IxF6VvcJIwgng0xIii/HLFJYNSSIrxfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7861



On 12.11.25 08:38, Jan Beulich wrote:
> On 11.11.2025 18:52, Grygorii Strashko wrote:
>> On 10.11.25 09:11, Jan Beulich wrote:
>>> On 07.11.2025 19:17, Grygorii Strashko wrote:
>>>> --- a/xen/arch/x86/include/asm/guest_access.h
>>>> +++ b/xen/arch/x86/include/asm/guest_access.h
>>>> @@ -13,26 +13,64 @@
>>>>    #include <asm/hvm/guest_access.h>
>>>>      /* Raw access functions: no type checking. */
>>>> -#define raw_copy_to_guest(dst, src, len)        \
>>>> -    (is_hvm_vcpu(current) ?                     \
>>>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>>>> -     copy_to_guest_pv(dst, src, len))
>>>> -#define raw_copy_from_guest(dst, src, len)      \
>>>> -    (is_hvm_vcpu(current) ?                     \
>>>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>>>> -     copy_from_guest_pv(dst, src, len))
>>>> -#define raw_clear_guest(dst,  len)              \
>>>> -    (is_hvm_vcpu(current) ?                     \
>>>> -     clear_user_hvm((dst), (len)) :             \
>>>> -     clear_guest_pv(dst, len))
>>>> -#define __raw_copy_to_guest(dst, src, len)      \
>>>> -    (is_hvm_vcpu(current) ?                     \
>>>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>>>> -     __copy_to_guest_pv(dst, src, len))
>>>> -#define __raw_copy_from_guest(dst, src, len)    \
>>>> -    (is_hvm_vcpu(current) ?                     \
>>>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>>>> -     __copy_from_guest_pv(dst, src, len))
>>>> +static inline bool raw_use_hvm_access(const struct vcpu *v)
>>>> +{
>>>> +    return IS_ENABLED(CONFIG_HVM) && (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(v));
>>>> +}
>>>
>>> Without a full audit (likely tedious and error prone) this still is a
>>> behavioral change for some (likely unintended) use against a system domain
>>> (likely the idle one): With HVM=y PV=n we'd suddenly use the HVM accessor
>>> there. IOW imo the "system domains are implicitly PV" aspect wants
>>> retaining, even if only "just in case". It's okay not to invoke the PV
>>> accessor (but return "len" instead), but it's not okay to invoke the HVM
>>> one.
>>
>> This patch is subset of "constify is_hvm_domain() for PV=n case" attempts.
>>
>> It was made under assumption that:
>> "System domains do not have Guests running, so can't initiate hypecalls and
>>   can not be users of copy_to/from_user() routines. There are no Guest and no user memory".
>> [IDLE, COW, IO, XEN]
>>
>> If above assumption is correct - this patch was assumed safe.
>>
>> if not - it all make no sense, probably.
> 
> I wouldn't go as far as saying that. It can be arranged to avid the corner
> case I mentioned, I think.

do you mean adding "&& !is_system_domain(v->domain)" in raw_use_hvm_access()?

Hm, I see that vcpu(s) are not even created for system domains in domain_create().
So seems !is_system_domain(v->domain) == true always here.

Am I missing smth?
Or you meant smth. else?


-- 
Best regards,
-grygorii


