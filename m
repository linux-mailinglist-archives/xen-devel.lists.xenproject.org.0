Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D409A93B623
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 19:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764454.1174903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWg6p-0007Nj-4u; Wed, 24 Jul 2024 17:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764454.1174903; Wed, 24 Jul 2024 17:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWg6p-0007L8-1U; Wed, 24 Jul 2024 17:49:03 +0000
Received: by outflank-mailman (input) for mailman id 764454;
 Wed, 24 Jul 2024 17:49:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a5wr=OY=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sWg6n-0007L2-5F
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 17:49:01 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2407::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fffa2817-49e4-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 19:48:58 +0200 (CEST)
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 by MN2PR12MB4271.namprd12.prod.outlook.com (2603:10b6:208:1d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Wed, 24 Jul
 2024 17:48:54 +0000
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a]) by SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a%5]) with mapi id 15.20.7762.027; Wed, 24 Jul 2024
 17:48:54 +0000
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
X-Inumbo-ID: fffa2817-49e4-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i84to+0kpjgGDRP3EuH3lkGiLvwTAEIo/NI5hGsnI/pZGXsB8Ri3NOFGQGhubykAkhswKuM0NL9bwlFjHUYaVgvHCLhiFhTBA3xnSPRqqZZE05ilD44eCT4Ij0k1GXQe7e9EN/XZfO2fstQJJ3ydZNY+OwjzXhNZOpvtjD6o/dGlGNao8vSsyUuLz+a5v1YNK6U4j2Ps9cNItbONScFx2BbBYknYnLloblLc3rcXj28w8U0mH8UpOVOwlrbyVIYYkzIRvl1UVRrsP7dTNQKC04UTMGXmAfDf1K5Ylh008TjTJ37FuiZO8GmIO1v7NmJvHBEdFLl3WtOoCrj0DO17RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3rQt1eS1aoDIvTnPZegoVA5lc1gfRlK8Zh9V16wvto=;
 b=SznYS2viGtaeTSp2IsMa3lHPCqMDfT+tCCqf6QyTFO3huv9RL867ei/tHV8cZWhm+t9OVfYPyLgcAh2hJHzAxVyEGzIq6ur8dV9P89C5lMGS0IYC7SS7KsDW51HzU7bn7YeQyssQdrltBiQ+omkZT9Bbwxy/8DVLLLv4BgPs9yVTScfOHKxabtrOEpHTExvdMauzxWvH5ToTEw110HfHLTvycMiy62B1fPFcSeIPVF/bYpkAstmPPGTdegDkfi2uQ/8qZi0LEN77CNtYSaJ5dXGNpCYYPsyUaWjwZba5MzI5UwgbURt7BYFjjMJ8ihSzIdy9VmNc+/NNov+C8ZTP6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3rQt1eS1aoDIvTnPZegoVA5lc1gfRlK8Zh9V16wvto=;
 b=BSrYwqjFqushIzTrU3dgqk7NbCOv5BBSJie3JPpw9gt0LGMHLXcJLpbgA6ZVw83MlD99nZ0FrOgnWI0ordM8A+NvwD2fDFOx229hs38SyY4HPzMGJZuWLxFXZV+VkBCThNdkOUoLBAZWzvBLrdFcmJ7QCwXhXUYV5wehOGBYdTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8fa38784-ba85-4675-9fad-39dd97652bb6@amd.com>
Date: Wed, 24 Jul 2024 10:48:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] automation: add linker symbol name script
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com,
 consulting@bugseng.com, simone.ballarin@bugseng.com,
 xen-devel@lists.xenproject.org
References: <06e4ad1126b8e9231bf6dcf88205857081968274.1721779872.git.victorm.lira@amd.com>
 <4468a02f-4d8c-4b94-8af6-cd1751cd0a89@suse.com>
Content-Language: en-US
From: "Lira, Victor M" <VictorM.Lira@amd.com>
In-Reply-To: <4468a02f-4d8c-4b94-8af6-cd1751cd0a89@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:180::45) To SJ2PR12MB8876.namprd12.prod.outlook.com
 (2603:10b6:a03:539::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8876:EE_|MN2PR12MB4271:EE_
X-MS-Office365-Filtering-Correlation-Id: 21da418c-1295-4be4-5fcc-08dcac08e2a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjZjaHlHcEU3dWY1cnU0YTUwNnl1S3FSNEJQUXZBRmQxei9kbkxCK1NjaDQy?=
 =?utf-8?B?eUVWK3FEWXJZaHFJOVRoNm4rQ3podDZnY2YxbzVHL1ExV0NFc2tqc3hSU3Zp?=
 =?utf-8?B?bGltUlpFeDBmQ3hXYTVlRDJQeXNNZm1ZbEordmJVQnlJZkFHcHFLU2J1Z0Nv?=
 =?utf-8?B?ODlGYVBDMWlKRmk0QUVmMUhTbTJ0YVo0K25mek9GYXU2OWN3WWVVT0RWZzdK?=
 =?utf-8?B?bFZwQllyVCtQczBPemU3a2dwU2UzQTFPWTlJaDJ6WXBqdHcxR3ZSM0xmNG04?=
 =?utf-8?B?cXc1eFBsa09kanFtZDJyaVREZng1UW9reEpzTUtQK2o4VjJza2dRSVRKZlJJ?=
 =?utf-8?B?QXpiUnFTbklLQklZQVZveE1ITHBvZy9VOHFWUUpRcm94ZGZKREhLN2NQMnJj?=
 =?utf-8?B?SEh3OHp4dkxkTUtSaGZKWlBzV3ZaOS9oN2tRcm05TmlYWXNjYlhOeHl1aktW?=
 =?utf-8?B?Q2lvWEJLT1Awa2Mwd2FxNnFiOVJnM05neUV1RTlTem5MbEduWEVrYmoxREsy?=
 =?utf-8?B?dGgyZWZlbjFXVEpVTGNIcnhIcitjb2R3REx0ZUNGNGo1eHEvbm5CdFNLRGR5?=
 =?utf-8?B?UlY2emw4VzBHTTE0QStkUjdURDBxZmpoZ1psNHpIN25YdnhFOUhmVTdmNy91?=
 =?utf-8?B?UjQ5eWQ1QVpQWjI2OUhkVFdJWTJlZnVraktyZ0Q3MFZsTUx3Z25RUjV4L3p5?=
 =?utf-8?B?c3VtNVBSNnpGMHRxZ0d3bWpwWlVoNnZKaHl2Z3hKNnJqOGFrMnF5OGIwWUJP?=
 =?utf-8?B?aHlTZlcrajYrQ05CVEZ2MW44YTJuQjRoMUYzMENJZUR1TTBDME5tVnQxanNr?=
 =?utf-8?B?bEgzSkNEYUxTNE93VDdwcTdaenU1OFV4SjVRY0RVMW5YaXphenU3ZjVZbUhj?=
 =?utf-8?B?T0VnMnAvMkNEQ3JFOVR2NkhjMGt0L3pNdHZPQ3VFdTRSdXVYZGdXZ3Z3b1or?=
 =?utf-8?B?R1QyQkN0TW8reU43VHpIaE8xQnVPSnMrZVcrMG40RXNFdnUvcmxWRU04aGRC?=
 =?utf-8?B?MHRwV1V5aDdRUGZIdzVWU2lJUDhPNEdyR3B1VEh5bEFpbGVQTmQwQnZNbFVu?=
 =?utf-8?B?eEhBWjE5cXVvUTBqMWpwUGxqNHRCemVwRzRFODRnTDlvei9TZEhKK3cvQ0lS?=
 =?utf-8?B?WEhEa2pmSXlPZy9mVFpuRmhxZzMrcmxpVGNQNXlmZndIREdZUU1rcFlUaWor?=
 =?utf-8?B?c2k1MDI0WVBWN2FzTFUvWWh4dlp0Y0VvUTlSUllJZUthQ3BuWFdsWU1JQWhV?=
 =?utf-8?B?b3JiTXBocFNQZUlzREUxVnZNSEMyL0JvbW1wM3NHa1dBbHBWcTA2YkUzdXpq?=
 =?utf-8?B?cldCQ1lkdzhMazF0N20rOEErb3Q3UDhrOHBMaFh3RTcvUmluOTR3QzA2Nlpz?=
 =?utf-8?B?a3U1Ky9yQ3pNbWlkN0tiMU9yWVoySmwxZWVSZzJzcFc0K2wyQUtEcDBDc1R6?=
 =?utf-8?B?YTR4a0w5ejFoaXRjWjltOHdTN0VqTTJRVHBaVldwWlVTR1crVDVuOHQyTVZk?=
 =?utf-8?B?Y1J0SWZ6MUw4SjVKRFBGRy84Q1NUQkxaMElBSlVmRFNXTEV3NDhIRFVQVURK?=
 =?utf-8?B?WG5pMWs4YktLTUxBYzJTR2kxRnFGZ1pWVWlLYW9vcU9GSm9SU2dxbUhMdSsx?=
 =?utf-8?B?RUVPSDNiQmtZY3pERkFmK0dwNUcwVURZcnZ0V1FMMFhQWnYyaitIOW04U3k5?=
 =?utf-8?B?UTkwUkNzWS9lN0pGZ3FnV3JSODdwQzUvUXVvZ0dONGZXUzZDSzg4RENXcjFZ?=
 =?utf-8?B?RmQ2QkNVcGN6MTczalJjRS96T29RWWc4bTdFSGZ4MWFYL1I4NHhpOTJSaFJ0?=
 =?utf-8?B?WkNESFN0N0QvOVIzd3hSUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHc0MXJGcnpHbldRaEVZaHcxVk10SjZDeXhHREZsVjJmeTN4TmhrNFlZcUwv?=
 =?utf-8?B?N0ZtTHVmSE8wb1BSQ3ArRXQzVmNUMnQzeml0dms5NmdpbytIRStEdzRtWEVp?=
 =?utf-8?B?Sk5LWEFFNk9tZkdXZWRRRGVVT04xUGd6UXhMM2g5NXZ2c0gvMHBKVDNwaWY5?=
 =?utf-8?B?aDZUTzYxdEVtOVYvcWJ2MFIzL3pCenREdHhPWUNGRFl5TGQyNFRtRDVkQ2Rw?=
 =?utf-8?B?M1h6Njh4bnlyZTUxVVhuOEdvWlVKU200KyszVW0yd0NzKzExZ3BScTN6Q281?=
 =?utf-8?B?ME1PTFFyT0l3c0tkTnFESTVwZ09qZ25VUEVmcDg3ZUpMSjduTXJlWSt1ZUVi?=
 =?utf-8?B?bFVscDRlbTJqaHhhcmtRUTZ1bHhUN29tNkxrRUlpRi8vYmZVQ01USUdYbUNu?=
 =?utf-8?B?eXQ5R0Z4aVZsaGFhbkhvNnpSOWQwUnpOK2hJSGxuV2RoYnI5QkVDdkVHMG9l?=
 =?utf-8?B?MExJTmlQVVdsbUt2YzdsZno4bVl2U2UwMGFqR2V6UW0vNDNFc3ZEcW9IVzNQ?=
 =?utf-8?B?cTVLRTJUR0ZkR25yVGpyd0Rjb25rYTZQWC9tTWY0M1BDNG05R1ZKVm93YzB5?=
 =?utf-8?B?UU53SnF0S2Y2UnFNeC9qSGo3TTZKMnRzVVZvSmxWK1ZTblV2K1NqY3orR2d1?=
 =?utf-8?B?bTBjUzQ3eFBMYy9wT0hUY0RJV0NHMjdpK1I4YmxsTk1TMzMxTG1kVkhMVkZJ?=
 =?utf-8?B?aXNxZ09OcVhCRFFML1kyc1VnMGpNaDBiTklFdlVXSjhUMXpUUE56OXQ5MmtB?=
 =?utf-8?B?T3c3SWhRc3dTdjlmZ3RudUF2TEdCNCtJU014QUE5OC8yME9CdU1vN2YxemY3?=
 =?utf-8?B?QlJzNmhEWXY2b01uVVNoeURYNURqRnJQY1FicExTTkhKYlJ2c2h4djBOdWxP?=
 =?utf-8?B?WW9yc2ZrVXdBbEZPVVZlcHdCWldXMnBJVDd3R1pKODhhMjBnZ0JudWRiejIx?=
 =?utf-8?B?d2lwaHBGSXdvY0JZRTZzZXVqc2Z4U0FseVJhU0tPamxrZ2dZTFJQbmhKSkIz?=
 =?utf-8?B?V3hvbTFiQVhPWUZpZzhjTmtLK1UwYjluaUs4aXpZZytmcXlkVU1VTS9SdkNl?=
 =?utf-8?B?dC80d1lPcjZCekJjS1kxeFNBcS9xQmVtYXludUt3aUt4T2tGNXZVYWd6cnB6?=
 =?utf-8?B?RlhOYXRVUmd0U0hCYUdUTmlTbDRPUVBBWTBnWlczMGswZWxRY0EyNzVzbzFS?=
 =?utf-8?B?aDN3T1FzU0lBbFpXK3VsKzVTaFVFOWlkY2lOTVBhMlpFelZjbGtlcEZWUTF5?=
 =?utf-8?B?akRiQ0dIek9maDVLd1k1UDhINzEvSVR0ZTBaK2wwbThTSm5aV3ZKUDlnQjdC?=
 =?utf-8?B?SU1aQjBRR0dZV2ErSzFUNkVmazhBVDFKUnJzdmVKN25JczdwZ2FLMDV6Z2pK?=
 =?utf-8?B?SGYwTHJYNkxLa2dHZkw5eFhSdjh4dHYxRmFQUnVOZ2Joc3hMUWozY3dpWlRr?=
 =?utf-8?B?dld2WlhsemVZZU9ISEJkeGI0aGtMcWFwdWJvT3JNRk0ya2ZMZDdWbUJETm42?=
 =?utf-8?B?QThKK0ZZYXZvN2xqOUs1bGt4TWZxR0k5cm5GOU5WaitYWDE4UFJRYWdJUzBk?=
 =?utf-8?B?U1Y0c2JSQldla2VkTXd0RWVpRExRWkhnbGhoUm1UMU0vNHhwQzRRWjhqbWJq?=
 =?utf-8?B?eWtOclZpQ3lxVjhVN29YNlNQSTJsclNaUnM0S2dieEJmYWZjTS9FcDRRSlFR?=
 =?utf-8?B?TEpaK0VTNzdtdnptM0w5YzBwK2tDVXZGOHpqVXNJdEc2eHhhUEVDaDRIU1N0?=
 =?utf-8?B?SUp1TktVYlpGc3AvRmU4ckZRRkJKMW9UcTFWbzcrQXZsdlNsZ0E1eUptcUFt?=
 =?utf-8?B?VkNQRGRqQXpXUzFqOVdlUGV3ZFBGV3BBMjVVRHI0aFYvbkJ3ZWNEdEtoaG9m?=
 =?utf-8?B?SXJVSmJ2RFJydmdTQmREcEJHUS9QOGpYV3V4cVJnZit1V3ZOLzU4czF0UzNB?=
 =?utf-8?B?OTVwZGJNeVNCZVZtQnpiYUVtdGhpTkROc1ppMlNiUGU3NTR2LzRHZlRMRWp2?=
 =?utf-8?B?UUlHazdqbFpGVDVtWHZvUU5RMko0LzFTSmx0dldCOXdPdFNDTDZCcjNEemhn?=
 =?utf-8?B?UjRNRURCNnN2amtlbkdnNVlRUXdzanQvTmh4bkJQSnBkR3o1RkFIT0doakRF?=
 =?utf-8?Q?n5dKuzN/V3iI0qYkLCpb+uP9C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21da418c-1295-4be4-5fcc-08dcac08e2a7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 17:48:54.3078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxIILTi8lpj6p9/y/mpyttQSgNtYm3kP1zY8RYhb1aIrpaW4XQR+6UpvJtGmQoUV0yfxr9NzL5RnD4OvuuSfXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4271


On 7/24/2024 12:44 AM, Jan Beulich wrote:
> Nit: In names of new files we prefer - over _.
> +script_name=`basename "$0"`
I have fixed the above comments in v2.

>> +#!/bin/bash
> Can we rely on bash to be there and at that location? As you using any
> bash-isms in the script which cannot be avoided?

Are the automation scripts required to be portable? Can you please point 
me to a resource where I can learn how to make the script portable?

Victor


