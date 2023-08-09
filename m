Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11696775942
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 12:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580873.909331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgts-0004Bt-Ns; Wed, 09 Aug 2023 10:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580873.909331; Wed, 09 Aug 2023 10:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgts-00048f-KB; Wed, 09 Aug 2023 10:58:48 +0000
Received: by outflank-mailman (input) for mailman id 580873;
 Wed, 09 Aug 2023 10:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTgtr-00048Z-C8
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 10:58:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe02::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b63b3f72-36a3-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 12:58:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7419.eurprd04.prod.outlook.com (2603:10a6:102:80::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 10:58:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 10:58:44 +0000
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
X-Inumbo-ID: b63b3f72-36a3-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1rQimP/a2kdgqF8JEpSFsu5OQgBHql+zUpHUHPbD/dfzhUgyqgi10u+KtQjDF4gOjgwKoViqPpbLQlHHnTYa1bwW/p8FWoNtl+EiPc/FrrGSy9ZzTJuYdOAkjOmwUkzm8KAus+maB3jp0H7me/JCi0HFcN5SrqxoNlT6/6wF77uDB9u6TgnEHXrQ6x6AXCVCu4IGb2z/w66yuLvj2/NOCmhaJ2luOYQHGZIAiEStAXd07roSKig18MkrwU3q4InwWwomgtgkUXPQ5t5/1rzPsGq5iEhm50xwJJVo07oWnpcEHgw1RHX88owgCGC5iJuK/cPYr0BKOGYKF/C9jf8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJPJp4MZfHRx9lZamo6Lxirl2WEO4pNO4Pg62Jcnd70=;
 b=S82DhUAkug0c6ceHyrm7sMnRASCjlOm4gNq7EH1rM3ViogHuPg6fsYrci6+EFOflpbf5dy1P9kvafkWY3fXk86OEfy0m0/TOytEvrvLSQrnIaKKsDzaEduJiHzMQdl832lz70GJZcsnyqs+RQ9Vcq1BPQD3bBsqmHmjsAP+lgQzC0G/NnxHGZpuCuSwhesSpKa1T2fvsLXm0sBYbrM/Dm9iFhgo454wSqojKqgzgFbcLge46AHNqFrF57QZO43o/tg15MolACQt+FmocgAiDil/2LAgfOm8M2n/d+s90iRbwcmCsVOhYcvD2GfN0jadWiqJBD8mnUGZzTiXyhPDxzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJPJp4MZfHRx9lZamo6Lxirl2WEO4pNO4Pg62Jcnd70=;
 b=hVr/qO9zNFfQ5jokGSAnhKPQVE2NJWoNqCie8E5RFrfnlynXxZ15vv3eMf3isXLi+4DCUQQyAfLWkeuibzkkhBp7JgTYaeCdPgvKAr9R6xdcSGXjnVOBPuz91TEt4ox3V9pxm0GM8w68/3rcqObg1yyfAnh7GGu3J0qw1sykPhZ0UnXIBKzW6yIYGidUmFNa5ubahpS8LyvGW7cbowFcuvRyh08yLkVE3SR0h+8rYlGFnSmsU0Q97rn9Pd5o4eh4tbIT9fjrC12y4z6l40/ruXnWCcb7jR7067igmY9E/HR3bLMDggCLb7O37Y1izzxY3F0yMczxEObo2kE/TG+anA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea592a24-bc29-b1ab-33ca-5ec3d59c050c@suse.com>
Date: Wed, 9 Aug 2023 12:58:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] common: move Linux-inherited fixed width type
 decls to common header
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <652ef09f-3654-548a-37d7-bbc46cbda177@suse.com>
 <c641b981-54b8-d3ca-26a4-28331dc79ca5@suse.com>
 <115e080e-ecba-4117-9d43-9888f82c8d5f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <115e080e-ecba-4117-9d43-9888f82c8d5f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: 869b035d-cc4c-42fe-2257-08db98c79941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CuKVdFywyxVgX6/9aTUdoDH8jm+xOMRZfsEX2b2HPnAaefEDVVkkil06zqPQgMQtfrS1tkfJFweCl1q0z7Lmg0vV1UesEi0/aBzpsu7GMQq7GFRRk8HowrOt6DcJUThkXg8qtVXpC6IPANKg0mCq3HiPShi+dQKrihUVAijHhBq5jFjqcRK9Y0XxKPlOLwgF6mi19soKtXijF3rVzcKNWjdNM1pqxrsZBlJxhMP9OU7qs2cCG/B06Lhzg9OSHjVXjFnxjfEAiyIhgCNZHSCfi+Xese1ZzDl1bmCmKqWPdDeuK/+IGdv48xYH3HO4YVrwHL0Sx7h3gSEwCEhPQE79tuPZo74r9s4zact/5WJBgJBQa4zG7eKQ93uFFYGuFvfmCDkhF9u/Awkh2EVOZFxjqEAShMFBw8JKsR+5uMMtkyNc1I1hpVZL2COjqQSIc5QHSlg3q2apKbigzuuKtgt785aQwgf2dC2HfD2Kqzkqvs0SjspBYfNBP+3Pg9nXE+XvrZzX6RtAvFA2EDXuncNGWEg7ShoFoXk+SN67xYMrAYbBXwFScxz7IEMRuecc8kxD2JMG74i+JMDuzROKtgqoZfg0/9Q6795HJEb4L7RNnqJg3K+AwBNDcu5Dm6aGWmPb4Xuza5K7IA86XhsZj6ajmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39860400002)(346002)(366004)(186006)(451199021)(1800799006)(316002)(7416002)(8936002)(8676002)(5660300002)(2906002)(6506007)(38100700002)(53546011)(26005)(83380400001)(2616005)(41300700001)(36756003)(6512007)(86362001)(31696002)(6486002)(66476007)(66556008)(66946007)(4326008)(478600001)(54906003)(31686004)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akNjdVplNDNLSWdOeW1LVFFYK1RUVFFzTENyOEVmalNMejFuK0RCYnRJVmhw?=
 =?utf-8?B?TlZaZi9qWkJhY2JSZGtDWDl3SUlvTU13dk56V3dad0pkMk5hMVlqTGxpY3ow?=
 =?utf-8?B?TWc1OTJuYVBQR3p0UVZadW50VXVwRHhXQmRBUGJ3Wmw1ZXl6MStkZEdMYnI0?=
 =?utf-8?B?NEtqSGpHUDJ6dlo5YjJVQUJabDVFMkxndy84bXl4UVFCN1BwRU1ZclNmOWpU?=
 =?utf-8?B?WkoyVkZMVmFLK3lDZTJlZzkrMkx6SWg3SWFjNmptaGFJcFhQYmxhcFU1Z3h1?=
 =?utf-8?B?WnZJOU9ESkFramM2MnFLSXNaMTFwOHZOSU9TY2ZaYnl3VndVaFZBekdOUTF4?=
 =?utf-8?B?VkZKZlJPMDJrOW5kK2NFamVMMXJqV0UyL2FYKzBLeUQvYWs4NVBtS3J3dGZW?=
 =?utf-8?B?b0R2aTk0dm9RWGpSYnpZczFGUzRMRTlhYSsveHF4N1Y1UThxenUveElWQ0Qx?=
 =?utf-8?B?NDZZS1dGc2kzekFMbENkRzFYMGpaYXZhemkrb3puWmRqbk1hS3h3QWJmb0hM?=
 =?utf-8?B?bnZvUDMyMFhldGswd3hvQjVVKzdra3dYVGt4WlZLcUx3WHhqRFQ4YjdNaDA1?=
 =?utf-8?B?R1JTNmwwSG0zMlZhdTNJUG10N29SV0s4OUZJeGl1U3d2THpHV29NU0twRHc4?=
 =?utf-8?B?YlNJUjRzT3VvZExSb0c0N05vVHVRYzFjcFJ5cGdIWSsxbmxaNmptZ00yd1ls?=
 =?utf-8?B?bVQzbmlJOExJOU5yakVjN2o2VWtnY3JMeDh2ZDVWWUs0SS9vRTYrYWdDZXla?=
 =?utf-8?B?NWEvV3VxSjA3TUUyK2t0aFF0V3FjMmN0SzdGdWFIV25yVW0yVXpJU2Z1czV1?=
 =?utf-8?B?MHNkZDFtN0tUbElVZmFxbmR4RDNEb3BwOVlkUDU1VHJDNXFtMElLVVdITVZR?=
 =?utf-8?B?RU1TNWZOQ2dCTFhOSVgrYVFBRnY4SHQrR0l0MzlCb09WQWVrWDZaZll6RW04?=
 =?utf-8?B?czRSTHRwOWNoUkRNVnZ0Qy9mWjIrVnUxREhYOFJ1eGdIRWNvMkYrUEYwWUp1?=
 =?utf-8?B?UC96dUlxbjBicVhzK2dWdlV1dWwzUXVDc2JaZmk2RTdqUlJhdUtORXZyZURC?=
 =?utf-8?B?VWc5WGRwdXJCdnlqTDM1dWdYcWhQNTlIaTlSQjR3WE4xNVZFR25ZbkhKQm9L?=
 =?utf-8?B?RGF4aldSSi9kaHBzU2FPZFdqNVlRSGRGMWY5Wk9Mc0JHT2Y2TXp1Z2Vwdmk3?=
 =?utf-8?B?TDQ0TWZaT0VtTDNCYXMyb1pXWVNOT09Gc3NyU0ZuOEsrVnNMVmxwQVFJNnBn?=
 =?utf-8?B?VnY2alBxNUJzT05wam81Wi9DVU1Hdnl4VUpDa3IvTEt6LzVSRGFpelRXUDhs?=
 =?utf-8?B?bCtBOEM2bVM0SGJFd3lQdStKS1M0WlF3akNkNEFJb1RUN0VVRFhyVlYxOTV5?=
 =?utf-8?B?RzBuZURwZkEranJ3YnRsQWxDZFJmSy84S29BS1pnRmhVN2tUS1JaZUlLZmZK?=
 =?utf-8?B?K0lINjBPZ081RjA5L2Z2c1QxUTdEM0xhV0hLM1FCTk9xM1ZOVE11OTFFTHhC?=
 =?utf-8?B?eGNVL3hSVlhQdDNQaCtyb09NM0NDYldXazg3L1ZpWjJXdUxqdG16YXhCd2o3?=
 =?utf-8?B?T29Va2tFWFYzTDBjdUJ2U2M5VnEzd1Q3VXhrTCtEV29VSWRpTnlIUjJQS2Mv?=
 =?utf-8?B?L0F3ZXY0NnZBb3BWNGJ4ODZvbmFoODJSdXZGZ0RwM2RHZzJhS2JMV3QzUllL?=
 =?utf-8?B?MkNJL2ZJM2Y1bkw4cWJmQitpVXlndUhhSDJMUEwrS1NURWRqZDFQWGdJaDhH?=
 =?utf-8?B?QkNKekVjRHpoYkU5ekt4SXRUcncrZ053QW1PRUw5b0oyWVJXc0p2UENtOXdK?=
 =?utf-8?B?REphdTIxbW1NQXV5ZWVKTWFIWmc1NnJTME5EOE52eDNOOFJZWjdkanNFYjNP?=
 =?utf-8?B?WEJhd3BCOGRHMEZWZ0dJWmlNTkV0TERVbm9EalBkdEloSW5ocHpiVC8ycEow?=
 =?utf-8?B?VVBEYlN0YlZUS2NzOUpDcjFIeDcxQm5tSWtrcldQT3VxZElmMkY5aFVFZ0Fw?=
 =?utf-8?B?ZUFHTVMxVEF4TFNQR1pkd2tGcUlvQUdNYU1sZDNwRk45aWdhNVlwVmhNY2Qr?=
 =?utf-8?B?VGhNU1hPL0M0alRCNXRjcVEzVFZMakFBQnREUTJlME5aeUVzdUt2eGwxYTNY?=
 =?utf-8?Q?W79E9euMPeqMerTyX9yQQgISW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869b035d-cc4c-42fe-2257-08db98c79941
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 10:58:44.1486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlnxrZBSXcP0Er4q568zR6BbFlJlqVLrkIqcjGcM7OYC5oXwVuOg6U+HIc7oihJvg465L7Lsakq/T3+fibHgEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7419

On 09.08.2023 12:49, Julien Grall wrote:
> On 04/08/2023 07:08, Jan Beulich wrote:
>> Have these in one place, for all architectures to use. Also use the C99
>> types as the "original" ones, and derive the Linux compatible ones
>> (which we're trying to phase out). For __s<N>, seeing that no uses exist
>> anymore, move them to a new Linux compatibility header (as an act of
>> precaution - as said, we don't have any uses of these types right now).
>>
>> In some Flask sources inclusion of asm/byteorder.h needs moving later.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> With one remark:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

>> --- a/xen/arch/arm/include/asm/types.h
>> +++ b/xen/arch/arm/include/asm/types.h
>> @@ -1,18 +1,7 @@
>>   #ifndef __ARM_TYPES_H__
>>   #define __ARM_TYPES_H__
>>   
>> -typedef signed char s8;
>> -typedef unsigned char u8;
>> -
>> -typedef signed short s16;
>> -typedef unsigned short u16;
>> -
>> -typedef signed int s32;
>> -typedef unsigned int u32;
>> -
>>   #if defined(CONFIG_ARM_32)
>> -typedef signed long long s64;
>> -typedef unsigned long long u64;
>>   typedef u32 vaddr_t;
>>   #define PRIvaddr PRIx32
>>   #if defined(CONFIG_PHYS_ADDR_T_32)
>> @@ -34,9 +23,9 @@ typedef u64 paddr_t;
>>   #endif
> 
> I find odd that you don't add a newline before/after #endif here but...
> 
>>   typedef u32 register_t;
>>   #define PRIregister "08x"
>> -#elif defined (CONFIG_ARM_64)
>> -typedef signed long s64;
>> -typedef unsigned long u64;
>> +
>> +#elif defined(CONFIG_ARM_64)
>> +
>>   typedef u64 vaddr_t;
>>   #define PRIvaddr PRIx64
>>   typedef u64 paddr_t;
>> @@ -44,6 +33,7 @@ typedef u64 paddr_t;
>>   #define PRIpaddr "016lx"
>>   typedef u64 register_t;
>>   #define PRIregister "016lx"
>> +
> 
> .. you add one here. But this change looks a bit unrelated and IMHO of 
> out context.
> 
>>   #endif
>>   
>>   #endif /* __ARM_TYPES_H__ */

Hmm, I think I was mistaking the blank line after

#if defined(CONFIG_PHYS_ADDR_T_32)

as the matching one. Which way would you prefer me to resolve the
inconsistency: Add the missing blank line, or drop again the three ones
I'm presently adding?

Jan

