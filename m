Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2579A710
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 11:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599217.934533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdcJ-0004Zw-Qa; Mon, 11 Sep 2023 09:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599217.934533; Mon, 11 Sep 2023 09:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdcJ-0004Xe-N1; Mon, 11 Sep 2023 09:54:03 +0000
Received: by outflank-mailman (input) for mailman id 599217;
 Mon, 11 Sep 2023 09:54:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfdcH-0004XV-M0
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 09:54:01 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe13::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 211780e0-5089-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 11:53:59 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DU2PR04MB8565.eurprd04.prod.outlook.com (2603:10a6:10:2d4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 09:53:57 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 09:53:57 +0000
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
X-Inumbo-ID: 211780e0-5089-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJqpCWnQDXInzmjPMD0a4DL9+cGBRDsxyiPcBnXowzpwh9+JYziSxEqJNm0GUAUnlhUAd46Q1gHIrvGXBuIX+2XfPTbUQJ+9YPLc5fFOGIcuhcxd2LyG3z8jnt52dt8lbVsmmIib4gxa0IL9ekTtXrxC+dWNWxZUMcHdyL8H6MB0O1C0DASU8h53TPwoiYQ3LahjO1Jpn9L6PqSaOzb5CfJGpzpCVGRmrwYWyUgNqspFaQwiaV5WgfFuohoDPYsZYfRQYUY8vI8+TrpZp2hMGXtXHtnBYrgK2AHFpiL3JhfUwXMw2VwT/NQulcXxsPRNMo4aDXIlK4XIkzYiSfJPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnVdRsUsRMeaAXlmN0NZvXA9tc5nTlCc6Ywsc6ysgO4=;
 b=JW964EWTXS4RttgGtyAlK9qTz760of6AW2R05uYFikcaciJ4K87C8/MSYZia2KtdLd/SBfWXMs6WtC1lB74qIagsMOYAqtD8ZmsznUCnKcRFUsBaon2fxpt+xJ0Q0UpVA1TAFgwFn601pVc23Z2xNyQNX65pCnlV/uCymXKZr5MDLDYoMlQmen1KrsCBYYWJH6oqBHOI6h+3G7FVKCDnk+Xh37Cl8gjMoTuMLaYvGbbk6Jc4XgD2a3IHYoTi5qVyJYYF8KekwG8AckfB5N+/JIxZExToW5ylsjSIU9UvqxaCfgkB517veZ3V2jaxnrh+jDJmhkXKxcgZnxNIb/UT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnVdRsUsRMeaAXlmN0NZvXA9tc5nTlCc6Ywsc6ysgO4=;
 b=rAYHEwfTLqh0vxGx9yD+PuDFEjKYpaGc30SzNsW+kpKCAKhBulU/ifdu8pm4zXAq/Ycmfq2EJ5V9ae/sTY28xLINOEHWgVQmFksKOo41P36w62kGsWOWCDU9Sj0GW6/IRORLzXcK96fxr2maSk4XQZhKlub7Su8vB2oysAm9TxDmpCwCdTGneT0u7L/3RGJ7DRFvRMtmNZykux4n57y5ZnRXhOauVFDhiK/tFzms2Jncefs+Kbb35iGDKW7Pzj72UjJomcVoqUMyrp1orZViqviBMzIyP2NDPoygMsTyaOrVhB1mAyGvHG+/kfqxiybqtG8PCr0ht448J4rHHkopFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <37f70cdf-a25f-5315-c005-0811ca801e3a@suse.com>
Date: Mon, 11 Sep 2023 11:53:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 1/2] coverage: simplify the logic of choosing the
 number of gcov counters depending on the gcc version
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Javi Merino <javi.merino@cloud.com>
References: <cover.1694189143.git.javi.merino@cloud.com>
 <f40f16bad7553f63d81574eac39e1fddaeec0be4.1694189143.git.javi.merino@cloud.com>
 <93c7ff14-2aa8-09a6-f04d-9dbb3969f470@suse.com>
 <4073db4a-0ccd-7047-4d34-25ad18100f12@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4073db4a-0ccd-7047-4d34-25ad18100f12@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DU2PR04MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 65aa09c1-8e27-406f-b907-08dbb2ad0434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C9XS0LY6TSCiBMvowGGzwWoncAliHnEeyNsm1Uo2wG4yu39HcvwOdWFfE2659CTPQGpSAzDl7KvmqvgSmnTF8gAapPykcbgFXQ2m3wJ1xv60QFI3Y8BNUQ3uP0pkYpztQqW2BKnAzxIRPSCUgra/AkmEti3wY3J8qu3xl6tDZxwVQokxQ82m/f8gUHuy/g31yyozMvMR3MdKbF5anOtyaqWO534EaTFy7jLpHa1lwJegIyWs6HU3/URTCeZD00+8VQjAZV8a2Y5wMbpvGld4Wygj6RDTbAp+rF6KZy0ZI+oqRaKd3214I40ffpyvu/unUX9j1W3vgQ4lG7Culte+yW9l+vXMzic8Ae2mjeYdTyd60/QFnY91Zmqq+4GOy3c5mz904aT8jpNTu88QGbY/BACRY57opI/rrAhhtpjHMuGb6mpsJ4yGpB7Z4BCUDS8sDQofyI5NPMnnxR1RlnzOLyJT7GM2IWw3w75U4P3GgGRVR+jronK8W3b/Vr95KPEQDpRtmYIrIMnQ5VdUYUgqDlme3W+h9UfDHHGCzFOiMnT/CBRTOG62FmakSx1rni5wGqy7ofCD/P1EK7rtQxaZkT9WG0qqizVn491iYcKjPiv5kIBaByDq/RqdG281onC4wRuIGiGw4tJ43fTBQ7ivBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(366004)(376002)(396003)(136003)(186009)(1800799009)(451199024)(6506007)(53546011)(6486002)(6512007)(478600001)(83380400001)(2616005)(26005)(66476007)(54906003)(66556008)(66946007)(6916009)(4326008)(316002)(41300700001)(2906002)(5660300002)(8676002)(8936002)(31696002)(86362001)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTY3Y01pazU5dHBaSlNVb0IzcXNOYjY2WHBoZWZuaGtxZm8rb0ovQnA5WlpJ?=
 =?utf-8?B?R004bjRzMDM3eHJDd0JiVE1BOEwvQlY0c2hUQ1FpaGVuRjNRWmY3V05BNDBr?=
 =?utf-8?B?MzM1dUdEMUsrWlRZZTNkcTVNMFFwaXFta1dld1ZwdVRZZEdFNWZuSjJ5ZmZs?=
 =?utf-8?B?bHBWWDZPeEcwdG9GZi90ejZPSWxTc2FqTm93RGFITisyMTRYd0lLdlZQMW1M?=
 =?utf-8?B?NCtqR0llWjlGWEc0WWRzODNWK0t5SGt2Y1YzeWhnY3FGenlEa2pDb2s2eTNH?=
 =?utf-8?B?SEZBMzV6S3ppS3FOR2xQNTdvNEFyOWlSU0VyUll6eHQwZVc2OGxvOGZzME5v?=
 =?utf-8?B?SG0zWDViS0JROHZSRXVjYlBZN1hLWmxHZTdVcCsxV2wxOHBYQnFCNmdlNHdy?=
 =?utf-8?B?NS9nYnY3UWpSN0hUU05DYm9KR3VYWXlCdkxBcUpnSUJSSDhHSHFUbzRHWGZ5?=
 =?utf-8?B?d1Bmb3pDc1A3cGYrM2lCSWhQVlFNY09xUUkvZGtSRkVUcTRqUGphOEpiUytE?=
 =?utf-8?B?RXRoNW1ORHF3bHErTmlsRVc3RDJsSWViMHV0dHB3RzFYRml2TmFUR2FMWStV?=
 =?utf-8?B?UGZ6YmVsUk5qRDlPeWNWNVQ5dzR5RUVSUjhpbG5UOHpwdXMwWGM2TlFER1F1?=
 =?utf-8?B?Nng2V1pUY3NxbFdxVnJNTFhHTURWY0NtU05uSVJOK1cvQVRtWW5CNkQrdkhh?=
 =?utf-8?B?ck53QnQ3eXNYRlBhc1VlYjRPL1JnWnh0QlFEdTZOUDcxNmIwVFVjaEs4cE5L?=
 =?utf-8?B?UnlCNU1CdHFrUUtGTlEreEg0akxSRFpmQk0zRXVtWTFad2t5NXRHMmRBUlJ0?=
 =?utf-8?B?UVBaRUdmRVFjbUlTUTRORjZOUG9CQk5iUDlJalNYelg5YmhWSWFMM21SMzZ1?=
 =?utf-8?B?MXk5Nmd3cTVDWDhwWC9USm92cDBuOTgwQWxCQWF3ZUNEZ2U4eDh5RnpLTDh6?=
 =?utf-8?B?VGlIM052SktkTVlSZHljMjdHT2U4TE9pVmlpZmVrVElVQmNRVkxvS0w2QWxW?=
 =?utf-8?B?SEYrTTFXbDFFczlaMU5KR2ZVUmlBTGZWbVU4ODBlTmJOVWpCL3Q3OHdkUmlJ?=
 =?utf-8?B?ZVptU3IrSmhBWGFqNTBwWjhDMi90a0w2K2ozaFY1RkR0RWdsRlV6N2o4b0Rn?=
 =?utf-8?B?TkNjN2JPdFhWRUE3bmdGQ3Z4V1BUblBDT0F0NHF6YU1sMmhaaWJQZHJaR2Jk?=
 =?utf-8?B?Rkx6Ti9ZKzgwN0dlUUloYlQ3WUx5TzlWWUNyNlBsN1IrQlorTkpaT2tvVlNS?=
 =?utf-8?B?NHVmbGp2RnBIS2ZUSEdaYlc2OXoxQk5SZVdidGdoZ2oxVytmRHNDaXdvRXlD?=
 =?utf-8?B?bzRVbEt1bFBNRWRGS0o0dEVwdmNQakZ0Wm1NZ3BGUmhqSGxPclI5dW90dlF4?=
 =?utf-8?B?RmtIRE1lMmVuZHh2MWxOMEZNSWtEMERYOUdzSTNRWk4yS1hzYVhDM0ZFSHdq?=
 =?utf-8?B?dEpSYnJIQjJBTE9WcE1TOVhjYW5vZTlMeE5wbjZhT2Q4RTFCY05xcHp1NWE5?=
 =?utf-8?B?dnRaZU5oQmFYWW8zTXVKRnVFNTVZUkRZSkVXTHIrR2s5QTlKZmpYUmJKak5a?=
 =?utf-8?B?S1UvVHluRE5WVzYwNVNiV2lPRXVvM3p1QVVmSnh2emdud1hld1NjNldBM3Y5?=
 =?utf-8?B?WkJMYWJ3ZnpVeC9qRFd0aUNIUk9sUFRtMWljM1crKzV0SWR2eFgvVVZLOFFU?=
 =?utf-8?B?WUlvM3FiNTc4Zkk5QTN6THIzeUY2a0tQd2RWbUtzQi96OXA3NnYrTHNiSFhx?=
 =?utf-8?B?MmR3Y0lwUS9EWUhqMzlLZEQ1ZDZsVVh0Y2lmYUQ3bzFsTTlMUlJYR0g4VXMy?=
 =?utf-8?B?bFhEdEhtTk5xNlRJSDk3TWJ0MHB6Vk56eFZKU3J1R0lxemlhVzZQNlpXcFJw?=
 =?utf-8?B?bWVMUVhRVDh1cVEwdXJhZU8xQ3pWeU5pWFhKR1N0ajNFclJ5dUhCSkFBdGsz?=
 =?utf-8?B?VlNOT2p1cGdFWVV1VEo5dkxnRnpDWWJVRWY3THBWeWowMzc4eFIwRXdqYVRF?=
 =?utf-8?B?VCtyK0dVbEJ6VkZyN2tGNDN3MmFkMWc0WWQ5UlFyNGgvbllaQ0x1Y29seC9l?=
 =?utf-8?B?djJKN2p6SjVIWndzenhnVUV2NitTc3R1MEtIbFJyeXdhUEZOdVhjR2krQzhs?=
 =?utf-8?Q?TSkkjK175QGdJF3NgeQ3QL1MP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65aa09c1-8e27-406f-b907-08dbb2ad0434
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 09:53:57.3848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufpoVAsZ+FlyZrcoBOhhsCCLzywR/4dFC5qw3F0HWY5whSuObiPxHZtgBWhPogmWp7YeFTfJuI4wES/etb6CqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8565

On 11.09.2023 11:48, Andrew Cooper wrote:
> On 11/09/2023 8:54 am, Jan Beulich wrote:
>> On 08.09.2023 18:20, Javi Merino wrote:
>>> The current structure of choosing the correct file based on the
>>> compiler version makes us make 33 line files just to define a
>>> constant.  The changes after gcc 4.7 are minimal, just the number of
>>> counters.
>>>
>>> Fold the changes in gcc_4_9.c, gcc_5.c and gcc_7.c into gcc_4_7.c to
>>> remove a lot of the boilerplate and keep the logic of choosing the
>>> GCOV_COUNTER in gcc_4_7.c.
>>>
>>> Signed-off-by: Javi Merino <javi.merino@cloud.com>
>>> ---
>>>  xen/common/coverage/Makefile  |  6 +-----
>>>  xen/common/coverage/gcc_4_7.c | 17 +++++++++--------
>>>  xen/common/coverage/gcc_4_9.c | 33 ---------------------------------
>>>  xen/common/coverage/gcc_5.c   | 33 ---------------------------------
>>>  xen/common/coverage/gcc_7.c   | 30 ------------------------------
>>>  5 files changed, 10 insertions(+), 109 deletions(-)
>>>  delete mode 100644 xen/common/coverage/gcc_4_9.c
>>>  delete mode 100644 xen/common/coverage/gcc_5.c
>>>  delete mode 100644 xen/common/coverage/gcc_7.c
>>>
>>> diff --git a/xen/common/coverage/Makefile b/xen/common/coverage/Makefile
>>> index 63f98c71d6..d729afc9c7 100644
>>> --- a/xen/common/coverage/Makefile
>>> +++ b/xen/common/coverage/Makefile
>>> @@ -1,11 +1,7 @@
>>>  obj-y += coverage.o
>>>  ifneq ($(CONFIG_CC_IS_CLANG),y)
>>>  obj-y += gcov_base.o gcov.o
>>> -obj-y += $(call cc-ifversion,-lt,0407, \
>>> -		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \
>>> -		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
>>> -		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
>>> -		gcc_5.o, gcc_7.o))))
>>> +obj-y += $(call cc-ifversion,-lt,0407, gcc_3_4.o, gcc_4_7.o)
>>>  else
>>>  obj-y += llvm.o
>>>  endif
>>> diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
>>> index 25b4a8bcdc..ddbc9f4bb0 100644
>>> --- a/xen/common/coverage/gcc_4_7.c
>>> +++ b/xen/common/coverage/gcc_4_7.c
>>> @@ -18,15 +18,16 @@
>>>  
>>>  #include "gcov.h"
>>>  
>>> -/*
>>> - * GCOV_COUNTERS will be defined if this file is included by other
>>> - * source files.
>>> - */
>>> -#ifndef GCOV_COUNTERS
>>> -# if !(GCC_VERSION >= 40700 && GCC_VERSION < 40900)
>>> -#  error "Wrong version of GCC used to compile gcov"
>>> -# endif
>>> +#if (GCC_VERSION >= 40700 && GCC_VERSION < 40900)
>>>  #define GCOV_COUNTERS 8
>>> +#elif (GCC_VERSION >= 40900 && GCC_VERSION < 50000)
>>> +#define GCOV_COUNTERS 9
>>> +#elif GCC_VERSION >= 50000 && GCC_VERSION < 70000
>>> +#define GCOV_COUNTERS 10
>>> +#elif GCC_VERSION >= 70000
>>> +#define GCOV_COUNTERS 9
>>> +#else
>>> +#error "Wrong version of GCC used to compile gcov"
>>>  #endif
>> How about inverse order:
>>
>> #if GCC_VERSION >= 70000
>> #define GCOV_COUNTERS 9
>> #elif GCC_VERSION >= 50000
>> #define GCOV_COUNTERS 10
>> #elif GCC_VERSION >= 40900
>> #define GCOV_COUNTERS 9
>> #elif GCC_VERSION >= 40700
>> #define GCOV_COUNTERS 8
>> #else
>> #error "Wrong version of GCC used to compile gcov"
>> #endif
> 
> Forward order is the one that results in a smaller diff when inserting
> new entries.

Hmm, even in forward order one prior #elif will need touching (to amend
the version check), so I'm afraid I don't see such a diff being smaller
(it's uniformly -1/+3 afaict).

> More importantly, it's the more natural way to structure such a list.

I would say multiple views are possible: Naming recent compiler versions
first may also be viewed as beneficial. In the end what counts is how
easy it is to follow the overall construct. And I'm pretty sure less
complex expressions help there.

Jan

