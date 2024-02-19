Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B085A644
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 15:46:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682948.1062213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4to-0002ud-4Y; Mon, 19 Feb 2024 14:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682948.1062213; Mon, 19 Feb 2024 14:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4to-0002sZ-1q; Mon, 19 Feb 2024 14:45:40 +0000
Received: by outflank-mailman (input) for mailman id 682948;
 Mon, 19 Feb 2024 14:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0k1M=J4=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rc4tm-0002sT-Jc
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 14:45:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 899df9e4-cf35-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 15:45:35 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH2PR12MB4246.namprd12.prod.outlook.com (2603:10b6:610:a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Mon, 19 Feb
 2024 14:45:31 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::22eb:b0b:62c0:f3e5]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::22eb:b0b:62c0:f3e5%6]) with mapi id 15.20.7316.018; Mon, 19 Feb 2024
 14:45:31 +0000
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
X-Inumbo-ID: 899df9e4-cf35-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np9xg1etAXtQUmgx6l6Rooy1KvXqp5XqIog7dxjNuMbqtWrUBqkFGHuf+AGP1h50X1Z9Rmd76lC0pjhALImJXohGKw2FKwFZpeCQedwsbqWV/n6oq993OmJ6anRsywWl6AtdrFfDN1/3iK6qBbIushxRIVlllgpkWMfd8cAzdcgf6uJsGTU6C+WSD9ONlIhXklAbcCs5UcxbdUmDbbC1pkyTkq3K3N6FcK60fg8fMdvbPzWWmizLJJt8uwdDsWhjXlytWKGsdUIJyvbWUgmqp29IZye4SksrfwARnGzHLcA98EAJGhQEJl8o87OlgGLMwOs1tcZ+3wKQ+2S2/aNPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X26PrObdoCuCtb1ntRW8CvZKzJ0J6ddqTeobQR3MGlQ=;
 b=lfE8aMtTyiq2wUb39Sit5NEqJPfvQe0edWHKdFyLo5XZBZagrts5xalkzlYEsyGoixUmpGB4SfKY5L0aIrFsP5zYEU9I2YO2a2FjjAPPStGP86pN/Jm/uRozbbPMVd8nbwO++Vnv3oNOBsXbTzkcTY8taN1ILFN6jcZneqvrb5gKRDV60vcAM2KPIejSg+9WpmxnZHjQIYci5u3EOWIWI+ywXl/pm+ao+YjXEbg5uGnJbcFLPYCeSP/qqxaeSnV0NaYogu8sbvEOJL6ESYrRZrw79ZWtTU+yqzqyh++wUWo45Quk0isGmIqficmcKMiwggMMIdSHjDVZ/lg/2lw7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X26PrObdoCuCtb1ntRW8CvZKzJ0J6ddqTeobQR3MGlQ=;
 b=R1RyEOehy0rZfqwacKvQcuf8H0gJdSfR72VB49mkI5ml5gryw3LmIOUsZPu48nfxZGuPNldAlKheT4QfNCZo3RBWndlS6uHwLpPdav/mWg1TC/0M1s//Qk4AZ0ZB+LDNx/wmil9f3jThswM80ioBC5XGh5+y6lX6k0hV4jwS0Do=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Type: multipart/mixed; boundary="------------j04MiwJlrRLEF3xvh8APOAUO"
Message-ID: <7098c9ab-7008-4a49-92d4-6cd201b1490e@amd.com>
Date: Mon, 19 Feb 2024 14:45:25 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer
 Registers
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 luca.fancellu@arm.com
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
 <20240131121049.225044-3-ayan.kumar.halder@amd.com>
 <0c4e4a40-7327-4377-bfdd-82e69bc838ae@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <0c4e4a40-7327-4377-bfdd-82e69bc838ae@xen.org>
X-ClientProxiedBy: LO4P123CA0570.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::14) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH2PR12MB4246:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f5b541-495b-4c48-1729-08dc31596bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uqb+IXQzfwJLa1I9iXVBaP7BvfxnQ0CU8OYKFVuFfeAF3Yx8QGshKM9qQKmezMzUobMXXhTT29PJmaYVG+8zzNNYprj5g1nrSbF5jPcb6L5clNXQzgrJ4jSRcyS8ki/pcOe0USK8Rj39j0AHY4CQzvWpU/uPdRPP0mERzlX9JSju57zwK91FH49QY/8ouJMOGWHdB0B13oJudKkeTWMY300TnsX0dZnofeLhAlN3Ue2sRnes1TeCaCS0iw/S0en9N0/8nGBpTG1dwnNkYOQqSQxLawSqnsII1cwzw+Tm3jgQNrGu7ZZ5vrglrWwnD47el55WWg/F85xOOmLQQiTYoph3V7/HKD0KK4ge2mdEs/CCM+zxdXVtwO4sw7mf9pKi3+g/11PlliJ6d6Zl0miOUky7BdPE19S8frZ19pofiIKLrtZmnI6PX0IkSEyQvbph6DUci5OIM7AzBe/hdhhs2YLcV4NkT5llSJf9Fbd5bFOUmtf9+sxNXZRErqf0WJb5j32ceJlDDeETYyIf7uuAaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym4vblpDdEwxdktmcUQ4aDVrcUZyY2wxSEpDSis0R1dkTEhOUms3bmxya3p1?=
 =?utf-8?B?QXJ3cjJsWGowMzF1TmpVS0pvZWNBRCtTUEdFWFBQK2tsUllQektJRUQ0cmpz?=
 =?utf-8?B?ZVhMYklBRmtOem5TVUpScjFmVDZmeWdJNXV2NytacWhlWndNaGNxdkJna0pQ?=
 =?utf-8?B?TFpia0hIS2s3Nlp1NWxzZFluL056NXlzVUQxOGtHbTdXZThFanEwcXZ6TE9h?=
 =?utf-8?B?RjRtN0lhbUJkTjQ4azVIZ1JpcjJHMDRyKzNaRXhpL3Q3N3FCLzRHMEJlVm82?=
 =?utf-8?B?Q3MvSXYxaTRMRkt3eHNFSGkyNk1GUWpENHplbHZyRHp1aGVGK1dFaC9MY3ZZ?=
 =?utf-8?B?WWk0enIwNGRzT0FTL3BkaVZrdmRtd2l6SHVaU2plRmtkV01zMExZMmI5emlt?=
 =?utf-8?B?YUxKRWwvOExZbXZVQ0lrOEMydWVJdFV4czRabElBaXJxbnA1R3c1dHlXMUFZ?=
 =?utf-8?B?cHVLS1FTNmkvWkMyM1dOVHpMUWN5YWtCdHZ2KzJtS1E0V2dteEoxTm5xUk5I?=
 =?utf-8?B?QWdUam02TnhDcDBlQkhVWmFXcEpEVHg2SFN4cUhIMHdwWks3bkZ0S093SE5x?=
 =?utf-8?B?Ni9BTUpkTjdncURJUGFNcE9BekVpVHJpcVBqVDJjQkF5VmFiY3RZcTNJSm5t?=
 =?utf-8?B?aEVyMVVUZUpzcDRmZ214UWRGU0MvUUl3VTVzL0JmN2Jqa3QzUW5JOW16NW5v?=
 =?utf-8?B?bUNqNGltNHRaQUdHQ2Fsbzd2YmpYNGthMWIzcWNZV3kvWldqeGpnejBvWGJH?=
 =?utf-8?B?b09XV3c5MC9Hekt0cmFmaUVObEVPMks3cUNickkvSzlwTW5GZDltWVZjcG9i?=
 =?utf-8?B?aC8wbnNycmw5K3k3Tk9OM3Z5MDVSZ2psV0pTVEo0VlNzZkdBRE9ORC9ZdVNr?=
 =?utf-8?B?SU84TnVVNjZPT2NBRS9PUUh4L3NZSXhwajRTQnFmbHN3NC9BeWNCMkJzbnlC?=
 =?utf-8?B?VklhMkhuVnc0eHZGMFRkUWc2OWpXWUV0WDVodk85NGZIZXEzVWVLSGJuTkxk?=
 =?utf-8?B?NUxYVldYQXFvcjBCNXh2ckI4QXVSWEF0dE0xUFhEanZubVNHTFoxSENoSURq?=
 =?utf-8?B?TkFTL2N2VEV3U1RBQzJQQ28xTzhDY0NyTStiancycm5tQUNiQ1VLd2djRnlr?=
 =?utf-8?B?U3I2OEs0NU5EZktlditFajZTUHdOZEhFUlAzOXNBbzJyYkNXSSs2bll6THQw?=
 =?utf-8?B?dzBSekg3QmVuOU42Nll4K1FtdTF1L00rZGR5WGJvSGh0UXpNOGpSVVVjOTR2?=
 =?utf-8?B?bEFRSWZSaUNBYjNyYThNRkRiVUptMHZsZUFHcWtubzExWlVDNHR0T2EvNnBk?=
 =?utf-8?B?cXJCTEl2WUQ0Z2pMZ1J0NUJJUU1ZUFVwSk9nUkFYVGcvUGg1NHUwN041TEgy?=
 =?utf-8?B?RnlKbWRiczdmclU5U3NVV1NqVWxEUzlIQi9jSW9rNDRwMjcwTURwaUV2Yk1m?=
 =?utf-8?B?NEJtakhDbnV3Z0VUWWE1WVg3djZ6b3lvdFppbzJxRjIvQ0dmNlVtLzlDYnF0?=
 =?utf-8?B?UmlWSU82R1NkL25hdzJZR1VLWElTVHdmWkQyV3ozTGh2Y0cwUmY1S08xSE5u?=
 =?utf-8?B?NDl4bEh3Y0c1Sk9WQTU3T1dmL0E3ZFFFVU93WXpxV0Z0c0NmdlpzS1FGRnRD?=
 =?utf-8?B?cC9GamRVRnZpbm1jM2xPUnhwZmNLRVNnSHlTUE9OTVpLNmdkbEpaUjlTdWZt?=
 =?utf-8?B?TEFWSUc2MVc0TGVPK0NCZE5iN0ZNcEhLZ1pTMmZWdXFpRGxzUEF6UGJXdzNo?=
 =?utf-8?B?azNQT05jK1JON0h6VGp4cndrcXVPVG04eHFCSjFzQjZSdWZkdU9UYitqSjEr?=
 =?utf-8?B?MVhodU5NeVp3b1dxYXE3cDhSZnRGek1udGUzSURib1QrWHdIMzUxZ3gzVWgw?=
 =?utf-8?B?dERNbFFBQmZXVWsrQm5WVDBDOEJsclJnZW5ZWWNYOWZWZVVyZGRLT0J1ZkRP?=
 =?utf-8?B?ejVQc29GMGs0b1ZqSUFQZVgrQStNQ0FNMkpzLzdXem4zMkx3WTFhOWNTdkFL?=
 =?utf-8?B?T2ZoNVd0S0tEZGhiejlkRWFiTFZZaTRhM2FtU0hueC9ndFowODNHMHBSTEpP?=
 =?utf-8?B?WVlDUDMrZnlXbWJJYmZPb3pjSmI3cUkxWHZHQVplb2FVQkhwdlhJOUVyWTQ0?=
 =?utf-8?Q?t7SZpChwNo4EYZjv8P7H4+6jo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f5b541-495b-4c48-1729-08dc31596bde
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 14:45:31.4163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAJiksa18m0mmhbXFGVFJfBLKbWZkvCLTC+UCKtdAgg3mkiB6AKyzNhGth6RDwo8+Ar/bnSQNt+t85jTMRDVAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4246

--------------j04MiwJlrRLEF3xvh8APOAUO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 06/02/2024 19:05, Julien Grall wrote:
> Hi Ayan,
Hi Julien/Michal,
>
> On 31/01/2024 12:10, Ayan Kumar Halder wrote:
>> From: Michal Orzel <michal.orzel@amd.com>
>>
>> Currently, if user enables HVC_DCC config option in Linux, it invokes 
>> access
>> to debug data transfer registers (i.e. DBGDTRTX_EL0 on arm64, 
>> DBGDTRTXINT on
>> arm32). As these registers are not emulated, Xen injects an undefined
>> exception to the guest and Linux crashes.
>>
>> To prevent this crash, introduce a partial emulation of DBGDTR[TR]X_EL0
>> (these registers share the same encoding) as RAZ/WI and MDCCSR_EL0 as 
>> TXfull.
>>
>> Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
>> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".
>>
>> Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
>> using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() ---> 
>> hvc_dcc_check(),
>> and returns -ENODEV in case TXfull bit is still set after writing a test
>> character. This way we prevent the guest from making use of HVC DCC as a
>> console.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from
>>
>> v1 :- 1. DBGDTR_EL0 does not emulate RXfull. This is to avoid giving 
>> the OS any
>> indication that the RX buffer is full and is waiting to be read.
>>
>> 2. In Arm32, DBGOSLSR is emulated. Also DBGDTRTXINT is emulated at 
>> EL0 only.
>>
>> 3. Fixed the commit message and inline code comments.
>>
>> v2 :- 1. Split the patch into two (separate patches for arm64 and 
>> arm32).
>> 2. Removed the "fail" label.
>> 3. Fixed the commit message.
>>
>> v3 :- 1. "HSR_SYSREG_MDCCSR_EL0" emulation differs based on whether
>> partial_emulation_enabled is true or not.
>>
>> 2. If partial_emulation_enabled is false, then access to 
>> HSR_SYSREG_DBGDTR_EL0,
>> HSR_SYSREG_DBGDTRTX_EL0 would lead to undefined exception.
>>
>>   xen/arch/arm/arm64/vsysreg.c         | 28 ++++++++++++++++++++++++----
>>   xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
>>   2 files changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>> index b5d54c569b..94f0a6c384 100644
>> --- a/xen/arch/arm/arm64/vsysreg.c
>> +++ b/xen/arch/arm/arm64/vsysreg.c
>> @@ -159,9 +159,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>>        *
>>        * Unhandled:
>>        *    MDCCINT_EL1
>> -     *    DBGDTR_EL0
>> -     *    DBGDTRRX_EL0
>> -     *    DBGDTRTX_EL0
>>        *    OSDTRRX_EL1
>>        *    OSDTRTX_EL1
>>        *    OSECCR_EL1
>> @@ -173,10 +170,32 @@ void do_sysreg(struct cpu_user_regs *regs,
>>           return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>       case HSR_SYSREG_MDCCSR_EL0:
>>           /*
>> +         * Xen doesn't expose a real (or emulated) Debug 
>> Communications Channel
>> +         * (DCC) to a domain. Yet the Arm ARM implies this is not an 
>> optional
>> +         * feature. So some domains may start to probe it. For 
>> instance, the
>> +         * HVC_DCC driver in Linux (since f377775dc083 and at least 
>> up to v6.7),
>> +         * will try to write some characters and check if the 
>> transmit buffer
>> +         * has emptied.
>> +         *
>> +         * By setting TX status bit (only if partial emulation is 
>> enabled) to
>> +         * indicate the transmit buffer is full, we would hint the 
>> OS that the
>> +         * DCC is probably not working.
>> +         *
>> +         * Bit 29: TX full
>> +         *
>>            * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We 
>> emulate that
>>            * register as RAZ/WI above. So RO at both EL0 and EL1.
>
> The sentence "we emulate that register as ..." seems to be stale?
>
>>            */
>> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, 
>> hsr, 0,
>> +                                  partial_emulation ? (1U << 29) : 0);
>> +
>> +    case HSR_SYSREG_DBGDTR_EL0:
>> +    /* DBGDTR[TR]X_EL0 share the same encoding */
>> +    case HSR_SYSREG_DBGDTRTX_EL0:
>> +        if ( !partial_emulation )
>> +            goto fail;
>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
>
> AFAICT, all the emulation helpers have an explanation why we are using 
> them. But here this is not the case. Can you add one?
This and..
>
>> +
>>       HSR_SYSREG_DBG_CASES(DBGBVR):
>>       HSR_SYSREG_DBG_CASES(DBGBCR):
>>       HSR_SYSREG_DBG_CASES(DBGWVR):
>> @@ -394,6 +413,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>        * And all other unknown registers.
>>        */
>>       default:
>> + fail:
>
> AFAICT, this would violate MISRA 15.3 [1]. We didn't seem to have yet 
> (?) accepted the rule, but I don't see we would not given I feel this 
> is similar to what Rule 16.2 is trying to prevent and we accepted it.
>
> I think case, I move all the code within default outside. And then 
> call "goto fail" from the default label.

I am not sure if I have interpreted this correctly.

Is it ok if you can take a look at the attached patch and let me know if 
the explaination and the code change looks sane ?

- Ayan

>
>>           {
>>               const struct hsr_sysreg sysreg = hsr.sysreg;
>>   diff --git a/xen/arch/arm/include/asm/arm64/hsr.h 
>> b/xen/arch/arm/include/asm/arm64/hsr.h
>> index e691d41c17..1495ccddea 100644
>> --- a/xen/arch/arm/include/asm/arm64/hsr.h
>> +++ b/xen/arch/arm/include/asm/arm64/hsr.h
>> @@ -47,6 +47,9 @@
>>   #define HSR_SYSREG_OSDLR_EL1      HSR_SYSREG(2,0,c1,c3,4)
>>   #define HSR_SYSREG_DBGPRCR_EL1    HSR_SYSREG(2,0,c1,c4,4)
>>   #define HSR_SYSREG_MDCCSR_EL0     HSR_SYSREG(2,3,c0,c1,0)
>> +#define HSR_SYSREG_DBGDTR_EL0     HSR_SYSREG(2,3,c0,c4,0)
>> +#define HSR_SYSREG_DBGDTRTX_EL0   HSR_SYSREG(2,3,c0,c5,0)
>> +#define HSR_SYSREG_DBGDTRRX_EL0   HSR_SYSREG(2,3,c0,c5,0)
>>     #define HSR_SYSREG_DBGBVRn_EL1(n) HSR_SYSREG(2,0,c0,c##n,4)
>>   #define HSR_SYSREG_DBGBCRn_EL1(n) HSR_SYSREG(2,0,c0,c##n,5)
>
> Cheers,
>
> [1] 
> https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_15_03.c
> [2] 
> https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_02.c
>
--------------j04MiwJlrRLEF3xvh8APOAUO
Content-Type: text/plain; charset=UTF-8;
 name="v5-0002-xen-arm-arm64-Add-emulation-of-Debug-Data-Transfe.patch"
Content-Disposition: attachment;
 filename*0="v5-0002-xen-arm-arm64-Add-emulation-of-Debug-Data-Transfe.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA3NjllZmM5MDNlZWQxODgzOTY0MWEwMDNhYTYzY2U2NGRlMjdiYjVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPgpE
YXRlOiBXZWQsIDMgSmFuIDIwMjQgMTQ6NDQ6MjIgKzAwMDAKU3ViamVjdDogW1hFTiB2NSAyLzNd
IHhlbi9hcm06IGFybTY0OiBBZGQgZW11bGF0aW9uIG9mIERlYnVnIERhdGEgVHJhbnNmZXIKIFJl
Z2lzdGVycwpUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNjOiBzc3RhYmVsbGlu
aUBrZXJuZWwub3JnLAogICAgc3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20sCiAgICBqdWxpZW5A
eGVuLm9yZywKICAgIFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tLAogICAgYmVydHJhbmQubWFy
cXVpc0Bhcm0uY29tLAogICAgbWljaGFsLm9yemVsQGFtZC5jb20KCkN1cnJlbnRseSwgaWYgdXNl
ciBlbmFibGVzIEhWQ19EQ0MgY29uZmlnIG9wdGlvbiBpbiBMaW51eCwgaXQgaW52b2tlcyBhY2Nl
c3MKdG8gZGVidWcgZGF0YSB0cmFuc2ZlciByZWdpc3RlcnMgKGkuZS4gREJHRFRSVFhfRUwwIG9u
IGFybTY0LCBEQkdEVFJUWElOVCBvbgphcm0zMikuIEFzIHRoZXNlIHJlZ2lzdGVycyBhcmUgbm90
IGVtdWxhdGVkLCBYZW4gaW5qZWN0cyBhbiB1bmRlZmluZWQKZXhjZXB0aW9uIHRvIHRoZSBndWVz
dCBhbmQgTGludXggY3Jhc2hlcy4KClRvIHByZXZlbnQgdGhpcyBjcmFzaCwgaW50cm9kdWNlIGEg
cGFydGlhbCBlbXVsYXRpb24gb2YgREJHRFRSW1RSXVhfRUwwCih0aGVzZSByZWdpc3RlcnMgc2hh
cmUgdGhlIHNhbWUgZW5jb2RpbmcpIGFzIFJBWi9XSSBhbmQgTURDQ1NSX0VMMCBhcyBUWGZ1bGwu
CgpSZWZlciBBUk0gRERJIDA0ODdKLmEgSUQwNDI1MjMsIEQxOS4zLjgsIERCR0RUUlRYX0VMMAoi
SWYgVFhmdWxsIGlzIHNldCB0byAxLCBzZXQgRFRSUlggYW5kIERUUlRYIHRvIFVOS05PV04iLgoK
VGh1cywgYW55IE9TIGlzIGV4cGVjdGVkIHRvIHJlYWQgTURDQ1NSX0VMMCBhbmQgY2hlY2sgZm9y
IFRYZnVsbCBiZWZvcmUKdXNpbmcgREJHRFRSVFhfRUwwLiBMaW51eCBkb2VzIGl0IHZpYSBodmNf
ZGNjX2luaXQoKSAtLS0+IGh2Y19kY2NfY2hlY2soKSwKYW5kIHJldHVybnMgLUVOT0RFViBpbiBj
YXNlIFRYZnVsbCBiaXQgaXMgc3RpbGwgc2V0IGFmdGVyIHdyaXRpbmcgYSB0ZXN0CmNoYXJhY3Rl
ci4gVGhpcyB3YXkgd2UgcHJldmVudCB0aGUgZ3Vlc3QgZnJvbSBtYWtpbmcgdXNlIG9mIEhWQyBE
Q0MgYXMgYQpjb25zb2xlLgoKU2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6
ZWxAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4ua3VtYXIu
aGFsZGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBh
bWQuY29tPgotLS0KIHhlbi9hcmNoL2FybS9hcm02NC92c3lzcmVnLmMgICAgICAgICB8IDY5ICsr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0KIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02
NC9oc3IuaCB8ICAzICsrCiAyIGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDIyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC92c3lzcmVnLmMgYi94
ZW4vYXJjaC9hcm0vYXJtNjQvdnN5c3JlZy5jCmluZGV4IGI1ZDU0YzU2OWIuLjgxM2I0MDQyNWQg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC92c3lzcmVnLmMKKysrIGIveGVuL2FyY2gv
YXJtL2FybTY0L3ZzeXNyZWcuYwpAQCAtMTU5LDkgKzE1OSw2IEBAIHZvaWQgZG9fc3lzcmVnKHN0
cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLAogICAgICAqCiAgICAgICogVW5oYW5kbGVkOgogICAg
ICAqICAgIE1EQ0NJTlRfRUwxCi0gICAgICogICAgREJHRFRSX0VMMAotICAgICAqICAgIERCR0RU
UlJYX0VMMAotICAgICAqICAgIERCR0RUUlRYX0VMMAogICAgICAqICAgIE9TRFRSUlhfRUwxCiAg
ICAgICogICAgT1NEVFJUWF9FTDEKICAgICAgKiAgICBPU0VDQ1JfRUwxCkBAIC0xNzMsMTAgKzE3
MCw0MCBAQCB2b2lkIGRvX3N5c3JlZyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywKICAgICAg
ICAgcmV0dXJuIGhhbmRsZV9yYXpfd2kocmVncywgcmVnaWR4LCBoc3Iuc3lzcmVnLnJlYWQsIGhz
ciwgMSk7CiAgICAgY2FzZSBIU1JfU1lTUkVHX01EQ0NTUl9FTDA6CiAgICAgICAgIC8qCisgICAg
ICAgICAqIFhlbiBkb2Vzbid0IGV4cG9zZSBhIHJlYWwgKG9yIGVtdWxhdGVkKSBEZWJ1ZyBDb21t
dW5pY2F0aW9ucyBDaGFubmVsCisgICAgICAgICAqIChEQ0MpIHRvIGEgZG9tYWluLiBZZXQgdGhl
IEFybSBBUk0gaW1wbGllcyB0aGlzIGlzIG5vdCBhbiBvcHRpb25hbAorICAgICAgICAgKiBmZWF0
dXJlLiBTbyBzb21lIGRvbWFpbnMgbWF5IHN0YXJ0IHRvIHByb2JlIGl0LiBGb3IgaW5zdGFuY2Us
IHRoZQorICAgICAgICAgKiBIVkNfRENDIGRyaXZlciBpbiBMaW51eCAoc2luY2UgZjM3Nzc3NWRj
MDgzIGFuZCBhdCBsZWFzdCB1cCB0byB2Ni43KSwKKyAgICAgICAgICogd2lsbCB0cnkgdG8gd3Jp
dGUgc29tZSBjaGFyYWN0ZXJzIGFuZCBjaGVjayBpZiB0aGUgdHJhbnNtaXQgYnVmZmVyCisgICAg
ICAgICAqIGhhcyBlbXB0aWVkLgorICAgICAgICAgKgorICAgICAgICAgKiBCeSBzZXR0aW5nIFRY
IHN0YXR1cyBiaXQgKG9ubHkgaWYgcGFydGlhbCBlbXVsYXRpb24gaXMgZW5hYmxlZCkgdG8KKyAg
ICAgICAgICogaW5kaWNhdGUgdGhlIHRyYW5zbWl0IGJ1ZmZlciBpcyBmdWxsLCB3ZSB3b3VsZCBo
aW50IHRoZSBPUyB0aGF0IHRoZQorICAgICAgICAgKiBEQ0MgaXMgcHJvYmFibHkgbm90IHdvcmtp
bmcuCisgICAgICAgICAqCisgICAgICAgICAqIEJpdCAyOTogVFggZnVsbAorICAgICAgICAgKgog
ICAgICAgICAgKiBBY2Nlc3NpYmxlIGF0IEVMMCBvbmx5IGlmIE1EU0NSX0VMMS5URENDIGlzIHNl
dCB0byAwLiBXZSBlbXVsYXRlIHRoYXQKLSAgICAgICAgICogcmVnaXN0ZXIgYXMgUkFaL1dJIGFi
b3ZlLiBTbyBSTyBhdCBib3RoIEVMMCBhbmQgRUwxLgorICAgICAgICAgKiByZWdpc3RlciBhcyBS
TyBhdCBFTDAgYW5kIGFib3ZlLgogICAgICAgICAgKi8KLSAgICAgICAgcmV0dXJuIGhhbmRsZV9y
b19yYXoocmVncywgcmVnaWR4LCBoc3Iuc3lzcmVnLnJlYWQsIGhzciwgMCk7CisgICAgICAgIHJl
dHVybiBoYW5kbGVfcm9fcmVhZF92YWwocmVncywgcmVnaWR4LCBoc3Iuc3lzcmVnLnJlYWQsIGhz
ciwgMCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXJ0aWFsX2VtdWxhdGlv
biA/ICgxVSA8PCAyOSkgOiAwKTsKKworICAgIGNhc2UgSFNSX1NZU1JFR19EQkdEVFJfRUwwOgor
ICAgIC8qIERCR0RUUltUUl1YX0VMMCBzaGFyZSB0aGUgc2FtZSBlbmNvZGluZyAqLworICAgIGNh
c2UgSFNSX1NZU1JFR19EQkdEVFJUWF9FTDA6CisgICAgICAgIC8qCisgICAgICAgICAqIEFzIHN0
YXRlZCBiZWZvcmUsIFhlbiBkb2VzIG5vdCBzdXBwb3J0IGZ1bGwgZW11bGF0aW9uIG9mIERlYnVn
CisgICAgICAgICAqIENvbW11bmljYXRpb25zIENoYW5uZWwgKERDQykuIFRodXMsIGlmIFhlbiBk
b2VzIG5vdCBzdXBwb3J0IHBhcnRpYWwKKyAgICAgICAgICogZW11bGF0aW9uIGFuZCBhY2Nlc3Mg
dG8gREJHRFRSVFggaXMgdHJhcHBlZCwgaXQgd2lsbCBpbmplY3QgYW4gdW5kZWYKKyAgICAgICAg
ICogZXhjZXB0aW9uLiBPdGhlcndpc2UsIFhlbiBlbXVsYXRlcyB0aGlzIGFzIFJBWi9XSSBhcyBp
dCBlbXVsYXRlcyB0aGUKKyAgICAgICAgICogVFggc3RhdHVzIGFzIGZ1bGwuIFRodXMsIGd1ZXN0
cyBhcmUgbm90IGV4cGVjdGVkIHRvIHVzZSBEQkdEVFJUWCBmb3IKKyAgICAgICAgICogcmVhZGlu
Zy93cml0aW5nLgorICAgICAgICAgKi8KKyAgICAgICAgaWYgKCAhcGFydGlhbF9lbXVsYXRpb24g
KQorICAgICAgICAgICAgZ290byBmYWlsOworICAgICAgICByZXR1cm4gaGFuZGxlX3Jhel93aShy
ZWdzLCByZWdpZHgsIGhzci5zeXNyZWcucmVhZCwgaHNyLCAwKTsKKwogICAgIEhTUl9TWVNSRUdf
REJHX0NBU0VTKERCR0JWUik6CiAgICAgSFNSX1NZU1JFR19EQkdfQ0FTRVMoREJHQkNSKToKICAg
ICBIU1JfU1lTUkVHX0RCR19DQVNFUyhEQkdXVlIpOgpAQCAtMzk0LDIzICs0MjEsMjEgQEAgdm9p
ZCBkb19zeXNyZWcoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCiAgICAgICogQW5kIGFsbCBv
dGhlciB1bmtub3duIHJlZ2lzdGVycy4KICAgICAgKi8KICAgICBkZWZhdWx0OgotICAgICAgICB7
Ci0gICAgICAgICAgICBjb25zdCBzdHJ1Y3QgaHNyX3N5c3JlZyBzeXNyZWcgPSBoc3Iuc3lzcmVn
OwotCi0gICAgICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLAotICAgICAgICAgICAgICAgICAg
ICAgIiVzICVkLCAlZCwgYyVkLCBjJWQsICVkICVzIHglZCBAIDB4JSJQUklyZWdpc3RlciJcbiIs
Ci0gICAgICAgICAgICAgICAgICAgICBzeXNyZWcucmVhZCA/ICJtcnMiIDogIm1zciIsCi0gICAg
ICAgICAgICAgICAgICAgICBzeXNyZWcub3AwLCBzeXNyZWcub3AxLAotICAgICAgICAgICAgICAg
ICAgICAgc3lzcmVnLmNybiwgc3lzcmVnLmNybSwKLSAgICAgICAgICAgICAgICAgICAgIHN5c3Jl
Zy5vcDIsCi0gICAgICAgICAgICAgICAgICAgICBzeXNyZWcucmVhZCA/ICI9PiIgOiAiPD0iLAot
ICAgICAgICAgICAgICAgICAgICAgc3lzcmVnLnJlZywgcmVncy0+cGMpOwotICAgICAgICAgICAg
Z2RwcmludGsoWEVOTE9HX0VSUiwKLSAgICAgICAgICAgICAgICAgICAgICJ1bmhhbmRsZWQgNjQt
Yml0IHN5c3JlZyBhY2Nlc3MgJSMiUFJJcmVnaXN0ZXIiXG4iLAotICAgICAgICAgICAgICAgICAg
ICAgaHNyLmJpdHMgJiBIU1JfU1lTUkVHX1JFR1NfTUFTSyk7Ci0gICAgICAgICAgICBpbmplY3Rf
dW5kZWZfZXhjZXB0aW9uKHJlZ3MsIGhzcik7Ci0gICAgICAgICAgICByZXR1cm47Ci0gICAgICAg
IH0KKyAgICAgICAgZ290byBmYWlsOworIGZhaWw6CisKKyAgICBjb25zdCBzdHJ1Y3QgaHNyX3N5
c3JlZyBzeXNyZWcgPSBoc3Iuc3lzcmVnOworCisgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwKKyAg
ICAgICAgICAgICAiJXMgJWQsICVkLCBjJWQsIGMlZCwgJWQgJXMgeCVkIEAgMHglIlBSSXJlZ2lz
dGVyIlxuIiwKKyAgICAgICAgICAgICBzeXNyZWcucmVhZCA/ICJtcnMiIDogIm1zciIsIHN5c3Jl
Zy5vcDAsIHN5c3JlZy5vcDEsIHN5c3JlZy5jcm4sCisgICAgICAgICAgICAgc3lzcmVnLmNybSwg
c3lzcmVnLm9wMiwgc3lzcmVnLnJlYWQgPyAiPT4iIDogIjw9Iiwgc3lzcmVnLnJlZywKKyAgICAg
ICAgICAgICByZWdzLT5wYyk7CisgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwKKyAgICAgICAgICAg
ICAidW5oYW5kbGVkIDY0LWJpdCBzeXNyZWcgYWNjZXNzICUjIlBSSXJlZ2lzdGVyIlxuIiwKKyAg
ICAgICAgICAgICBoc3IuYml0cyAmIEhTUl9TWVNSRUdfUkVHU19NQVNLKTsKKyAgICBpbmplY3Rf
dW5kZWZfZXhjZXB0aW9uKHJlZ3MsIGhzcik7CisgICAgcmV0dXJuOwogICAgIH0KIAogICAgIHJl
Z3MtPnBjICs9IDQ7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQv
aHNyLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvaHNyLmgKaW5kZXggZTY5MWQ0
MWMxNy4uMTQ5NWNjZGRlYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Fy
bTY0L2hzci5oCisrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02NC9oc3IuaApAQCAt
NDcsNiArNDcsOSBAQAogI2RlZmluZSBIU1JfU1lTUkVHX09TRExSX0VMMSAgICAgIEhTUl9TWVNS
RUcoMiwwLGMxLGMzLDQpCiAjZGVmaW5lIEhTUl9TWVNSRUdfREJHUFJDUl9FTDEgICAgSFNSX1NZ
U1JFRygyLDAsYzEsYzQsNCkKICNkZWZpbmUgSFNSX1NZU1JFR19NRENDU1JfRUwwICAgICBIU1Jf
U1lTUkVHKDIsMyxjMCxjMSwwKQorI2RlZmluZSBIU1JfU1lTUkVHX0RCR0RUUl9FTDAgICAgIEhT
Ul9TWVNSRUcoMiwzLGMwLGM0LDApCisjZGVmaW5lIEhTUl9TWVNSRUdfREJHRFRSVFhfRUwwICAg
SFNSX1NZU1JFRygyLDMsYzAsYzUsMCkKKyNkZWZpbmUgSFNSX1NZU1JFR19EQkdEVFJSWF9FTDAg
ICBIU1JfU1lTUkVHKDIsMyxjMCxjNSwwKQogCiAjZGVmaW5lIEhTUl9TWVNSRUdfREJHQlZSbl9F
TDEobikgSFNSX1NZU1JFRygyLDAsYzAsYyMjbiw0KQogI2RlZmluZSBIU1JfU1lTUkVHX0RCR0JD
Um5fRUwxKG4pIEhTUl9TWVNSRUcoMiwwLGMwLGMjI24sNSkKLS0gCjIuMjUuMQoK

--------------j04MiwJlrRLEF3xvh8APOAUO--

