Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 699588A9D31
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 16:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708427.1107339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxSqC-0003oU-MK; Thu, 18 Apr 2024 14:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708427.1107339; Thu, 18 Apr 2024 14:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxSqC-0003ml-JY; Thu, 18 Apr 2024 14:34:20 +0000
Received: by outflank-mailman (input) for mailman id 708427;
 Thu, 18 Apr 2024 14:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOTl=LX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rxSqB-0003jT-CL
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 14:34:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbb3470c-fd90-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 16:34:17 +0200 (CEST)
Received: from BL1PR13CA0027.namprd13.prod.outlook.com (2603:10b6:208:256::32)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 14:34:12 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:256:cafe::fe) by BL1PR13CA0027.outlook.office365.com
 (2603:10b6:208:256::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12 via Frontend
 Transport; Thu, 18 Apr 2024 14:34:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 18 Apr 2024 14:34:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 09:34:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 09:34:10 -0500
Received: from [172.25.156.126] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 09:34:10 -0500
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
X-Inumbo-ID: bbb3470c-fd90-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZ3e22NxPcIooj0B1t52w6fXE/J64DT4Cl4HZ/tIdzdnSXzKpeQ7q1zbaIHJ84utxwcMSkcAZCvgmU4Db6fulGZ63GtFzEhrGDar2ScI0hT78/00GkjYh+UNzCyGVlxAeDpErg2RsH4mS5iKdwH4H8ZqCqyNuZfPKNVdpohgG1G9s1+7pCROQ/+l9P4AkKro6Ko3Cd6G6PJScCGc46JPzBGlvyPtd8WaYVZ2fBMJXTvmC9yEi3Ern4Eo51rLGp5Yqv86LZhFYxDu+eKVG2a+/73teiGMnkIJVNkBG6Ob0hjKqa4SlzsBIscr/Nl5C/PzHaEDek4pKusv5+xYACoEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoy4dU8NV/J57PhKr72rCjHiZMtO/GRiyuNsZvG+CcA=;
 b=WZkRNTSAxVDER5gYMo04Ui9YVe8MnWIDIH/BKLwSveqsNm7WI2+eJNy0vD+ipAjxRpDMuKZ8AtKyO8m+ywtAVCwM3C2zTrX7j+6haoWr48PYSog4tT2u6tIPD7anO29OodcVNUw7rrcaNJqIqmIHx3Qv1kbM3GMQA5F/UvOcI2nFYIzhkhLTH4t86g8QqCtboNpSmchz2p7z/9+FEHhOeY2UtayNbuUZEalvS/oAaj0Re/lcBwmdHeDZGeQShs4gximyx5M7ZcK5QHRegBf5LT6uFS09O5/vyHl+vx+tlyk4TibXKm03QnNXGU0ILBLUhYLWfmfRBq4v0ZYT/ZMpIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoy4dU8NV/J57PhKr72rCjHiZMtO/GRiyuNsZvG+CcA=;
 b=LO/c30xJ61j2JOVMO20w59TPhs+h4Fs2OHcQNLFXOyqwmGfC333PYTvZDD2hyyQgKEBV2sN7Fg2ih9gxIQE5d1qRWYStqplzrDJFxJvPQ5A9ORovheLO3N4hajPxQY/Rqhtilt6UffuF9eWbeYYn18gtS3Fyq0GbzeW3B/Uqvsw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4ad076f8-7553-4421-8da1-e482927ec1f7@amd.com>
Date: Thu, 18 Apr 2024 10:34:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v7 2/2] x86/PVH: Support relocatable dom0 kernels
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20240404212519.16401-1-jason.andryuk@amd.com>
 <20240404212519.16401-3-jason.andryuk@amd.com>
 <70ab0f9d-a451-44a5-8927-4200dbb96a08@suse.com>
 <13d1943e-6341-46de-a356-dc6b92945f3b@amd.com>
 <f4864450-0cba-4ff8-9a39-aad792aab026@suse.com>
Content-Language: en-US
In-Reply-To: <f4864450-0cba-4ff8-9a39-aad792aab026@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|MW4PR12MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 2047d902-bc44-4aeb-b990-08dc5fb49d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ak4zT3dUZVRiQlBRK0Uwc2NScDZGN1NMRmZoeUwrMlhCSndwWU80T2t3dUxs?=
 =?utf-8?B?czQxN1NwcEM4ZEtPWHFSM1hTVkRTL29RYTBkQ0pSLzRCZ1lhMVJXUjVpZk13?=
 =?utf-8?B?V0taK2YzQmpMcjJxT2hZZ1lROXRheEpNSWdMc0tZNUp5VXJtVE9nRjYwckFL?=
 =?utf-8?B?ZkcyTC9PcU5ZcTBvSnlaY1BDbDBoZDdlSTFOdEEwekFyUmlBUGJSejhZNXlN?=
 =?utf-8?B?Z285WFNyYkg0UEM2STE0b3M1OWZUSEJRSk9tSUFpcWhzaGRFKzVxMkxlZ0NH?=
 =?utf-8?B?NTNzZ3NjOWJxZlJaazVzUDlEWC9IVGIwKzFNcjIvcStPY3hQcmlNSEQvUDRy?=
 =?utf-8?B?a0I3Mkg5Njh4WnZiand0ODZsU1Q4TEwyWW5sM2VwYy9NS28vMzF4TWdEK01F?=
 =?utf-8?B?M296ek9KNGtPbWdYRytYS1BMSk15OGpubEJGc0tkUFM4L0R0U09mdGo0bDUx?=
 =?utf-8?B?UWgzQ3pwanFKWWxxMmYwajBoekQ4eUNETWtqNlJQV2l6S0RBbjhiMG1ab0JB?=
 =?utf-8?B?MGNyZzZDaFhydCtrK2hvYU50VVJsaGgxVnoyNWQvZ0Z0MHQySm81VDVhMkpQ?=
 =?utf-8?B?bFlOeE9BQlhoMmhZNStCYkRPMHA1akR6emxWVFNBS1k1Z1ZobENVWlB5TTg1?=
 =?utf-8?B?alFBbnJzQWFqYk83bHNGN3VrL3R6OVc5MFR5cVVmYmdJVm9lRUZZU0paQmRU?=
 =?utf-8?B?bXVzZUhhSnZYSWJJRTlHRDh6ODljelVTdkx3TmdZeGdLRU1EUzJCb3JGNmZZ?=
 =?utf-8?B?KzRPSmtVeG56TzRCSFdpUFoxaVpoNm5yTkYzeXdQVjVhYWdTSkprT0MxaVhV?=
 =?utf-8?B?RHl6aEVKWTc3WHpBWnVtY05vRnVzRHNWRjJ4NWpDUmY0ZDNqSnp5YUZ4NTZw?=
 =?utf-8?B?QWlFSTZhQ0JGcmljSVVnZ1k1SitCZTJkYkxQellRT2p2akNvb3BoWUg3T09X?=
 =?utf-8?B?TzVxYlNMeXdwM3NieDVxUWZodHhFL0luTmlGUWtrUHU2UlFsdk45clBpOCtt?=
 =?utf-8?B?ZXRjd0crcFg3WklvNzJocS9BSGJtazh3a1lZSk5EMUQvM0M3emNIMFdmRkRo?=
 =?utf-8?B?MnN4L0JKVEhmRGRVQzA2SDNVeTZYeFNUKzFYVEJqZEVqUmhGc3NjK3J2MGNY?=
 =?utf-8?B?Y3g5WUF3Z2Y0RU53OUtqdnBORGJMSkM2eEhnSmFCNEZSb3F0ZG94VnYyaXF2?=
 =?utf-8?B?WVpBQUZsTjduVTVnMG1QQWhHd3ViL2YwRXFGZ0Q4Q1g4YndMcFB1Z1Y3V1Jq?=
 =?utf-8?B?TTRuNUlyRHEvQkptZ3I1cUFQb2F3TnVlRFp5cHd0aXFlVEVwSUwycWtJdXZH?=
 =?utf-8?B?bUU0ZFVzeGF3NDA5KzBvbFVld1gxbytubStGWFRxK0g4d1dzMVA3a01vbFdp?=
 =?utf-8?B?a2d1czN5QWFsRXlMclRHUVRnTndhYWVqT3NPSjc4TFFPcTNXVWpKQ0kxYzJk?=
 =?utf-8?B?TjBzOFBlek1seFJqSmg3UG0rR0pEY3I1eUw3WVhoY1o3WWhyQ0xSNm5MeWNQ?=
 =?utf-8?B?cjlYWDQ3cS82YjBJY05QWGptOFpuN2pSekVYZWpGUXN5dWZCczlSRG56OUFy?=
 =?utf-8?B?dmROY0ovMXdLSmF3OWxjeHBLY1VtNnZ3SENIKzVUbURPdWhTd3F2RWlFWFhD?=
 =?utf-8?B?SVBYeGx6ZmgvNDBHMThkbFVIR1VMdDh0SzE0MnFmNHBJZGxCSnpjWGk5TGZ3?=
 =?utf-8?B?d0hxTDUwSy9NdmIrTHFPaDNzUG95Q25uOXRtbUdFbGUrTFhaZDNvWUZTSEVr?=
 =?utf-8?B?QUlWenhjZlpncFo0NTVIV0F2NlpKN1NoTmtCNTZOTFVoZGNSWnpKR0FVZEp2?=
 =?utf-8?Q?FTHDOiV4S26KEo+f7WIvXPn6A5T+XY/O9hRf8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 14:34:12.0510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2047d902-bc44-4aeb-b990-08dc5fb49d80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777

On 2024-04-17 09:24, Jan Beulich wrote:
> On 08.04.2024 18:56, Jason Andryuk wrote:
>> On 2024-04-08 03:00, Jan Beulich wrote:
>>> On 04.04.2024 23:25, Jason Andryuk wrote:
>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>> @@ -537,6 +537,111 @@ static paddr_t __init find_memory(
>>>>        return INVALID_PADDR;
>>>>    }
>>>>    
>>>> +static bool __init check_load_address(
>>>> +    const struct domain *d, const struct elf_binary *elf)
>>>> +{
>>>> +    paddr_t kernel_start = (uintptr_t)elf->dest_base;
>>>> +    paddr_t kernel_end = kernel_start + elf->dest_size;
>>>> +    unsigned int i;
>>>
>>> While properly typed here, ...
>>>
>>>> +static paddr_t __init find_kernel_memory(
>>>> +    const struct domain *d, struct elf_binary *elf,
>>>> +    const struct elf_dom_parms *parms)
>>>> +{
>>>> +    paddr_t kernel_size = elf->dest_size;
>>>> +    unsigned int align;
>>>> +    int i;
>>>
>>> ... I must have missed when this was changed to plain int. It should have
>>> been unsigned int here, too, ...
>>>
>>>> +    if ( parms->phys_align != UNSET_ADDR32 )
>>>> +        align = parms->phys_align;
>>>> +    else if ( elf->palign >= PAGE_SIZE )
>>>> +        align = elf->palign;
>>>> +    else
>>>> +        align = MB(2);
>>>> +
>>>> +    /* Search backwards to find the highest address. */
>>>> +    for ( i = d->arch.nr_e820 - 1; i >= 0 ; i-- )
>>>
>>> ... with this suitably adjusted. However, I'm not going to change this while
>>> committing, to avoid screwing up.
>>
>> I intentionally changed this.  Looping downwards, a signed int allows
>> writing the check naturally with i >= 0.  I think it's clearer when
>> written this way.
> 
> Just to clarify: Is
> 
>      for ( i = d->arch.nr_e820; i--; )
> 
> any less clear?

It's not something I normally write, so I had to think about it more. If 
you are already familiar with such a construct, then that isn't an issue 
for you.

Your way is more subtle in my opinion because it relies on the post 
decrement to ensure correct bounds within the loop body.  I prefer i >= 
0 because it clearly states the valid index values.

Is your main concern that you only want unsigned values as array indices?

> (While replying I also notice there's a stray blank
> in the for() you have, ahead of the 2nd semicolon.)

Sorry about that.

Regards,
Jason

