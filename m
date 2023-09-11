Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6488C79AA06
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 18:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599615.935107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfjPY-0008Oa-VS; Mon, 11 Sep 2023 16:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599615.935107; Mon, 11 Sep 2023 16:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfjPY-0008MK-Sm; Mon, 11 Sep 2023 16:05:16 +0000
Received: by outflank-mailman (input) for mailman id 599615;
 Mon, 11 Sep 2023 16:05:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfjPX-0008MC-04
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 16:05:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7d00::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd325d71-50bc-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 18:05:13 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB7541.eurprd04.prod.outlook.com (2603:10a6:20b:29a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 16:05:10 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 16:05:10 +0000
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
X-Inumbo-ID: fd325d71-50bc-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dzuh+4+bmN/+bhTACMuQK0AC43Nm3k6MErb3JBCgifXW6dfVV6sbv3xe8uAgdYrnwyVSyPZMbSis4HfTR32kosvjsubqdhOukRatZHiKtSFpERJV3I42pXB1LlAJ+AItrZ4B6iT1NwpYEeUkKj3KlUYbniJaPZlSswCZnLps7GCQF1VEMOCTsONaS7ExmW442cZErK5/0qTjGrJtCj8zUzLOvwxEhklQVVPO4bzgUm7hxbg/jB+2sdLTnOYsMWDxet8xA67ChTjVmbvyU9dmK2jBiofn4p1Pi42d5zEfdg2e1/HXRT4wqLFoZKO3u/k+5H4u+mWKUg1PprMlHtuRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9wOiOFi3vZgH5u4noA2ptE8EfHKbzucFXRyhHawdrk=;
 b=eIV0yq9p2kroYiSzCnEkWB0JjrMVG/Vcdl/7suT+hUIJ8GUS3cYP8tyg/5N47sx/NhUMOfeYyQGT6KWw8Yy/+3Y3hzR9E+qNb1i5eGQpR0j0Hfb/wn3DR4wnik5En64EjLg8cPh5YiX9lpEl2X80BXJbIPrlzN6to6AzroG6Rit7sKwFkLB2DMZBuigjRHnTxOC6mlH2KowQrv/FclGmYN7nt30kou5cCIjIQ9q382vegi46OJ2aqN3/BwjrOwUdIPGL3ng0Y8scq0mRj6i24WpXpWdYwvQblf0ZXthuCxFgntEbgiWJp508EZ68es7xTz8mEVJRGu+mLLN/tyWbJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9wOiOFi3vZgH5u4noA2ptE8EfHKbzucFXRyhHawdrk=;
 b=vJKzULJiyKWBSyfzQ8wVsiEnkwGHTtB7QFv/NAEPkL7TYwA0JaLSRAgHPH+1MAbstz0dIGYCAP+dHiWKpZo6HER93xa8Ew8FrBXUmZT0MvcBFowK1M+9q6XS1V5eOD4bHaO40Lihm0oiiYqXRfqpikUelHbtLuqHo8sUKOD86Hv8HWcVNld6XXuEV5rkeVbqqaVgfMhyY5fUWWduQT1GE7VGs3vPInwabw1dXVW8xFJC+dIu4fCZK72c1ixu6KRGi4OZpU+bWHZSbnC+WuPwC0/G4zIInMYbpxoDJMXrJg82aD5CuKtBPOEbM0/mKbH9AHODo4RfcxslS8pLDgtb4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7975f360-9608-3495-67ed-1dbfec330668@suse.com>
Date: Mon, 11 Sep 2023 18:05:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] coverage: update gcov info for newer versions of gcc
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Javi Merino <javi.merino@cloud.com>, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230902151351.10325-1-javi.merino@cloud.com>
 <ce6e7abd-40ee-dd9e-b17c-10c39ca0e422@suse.com> <87y1hcogg2.fsf@linaro.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87y1hcogg2.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::7) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: abd88fd7-b835-4a77-fe2a-08dbb2e0e025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ehbusvSJxan89KyasuI5aTzuLAuS3gzt+KXBFv9V0U8KgUhpx55oYpZHsMcHNwfT2Ir3sWwDOGKZS7ODbrNpVbMvJEn+lXtL3TWC8/EAfGMG+aG7/dp2oXKDZwyzbyCZ5Z7Gz0v3alp9HB3jJNKVwR277xXZnkeqVbUy9Y629U8OnuxiQnz9YtRCCbM3yswM+QhUwXok97IObB6jDDdt6+l7r8L/3LfZLfOk7udaB+JMIcLjT8l9zii42M9b2dPcfmwe49jb71s6rBaBfAKNUr8+dwd8R50rueqoh30bZubfSp9/ABcLE1ovhy4j5EOD+dfjrVIzX/ztBv9foS3N9QlZ5Nz1V2FXqbPkRXODtUEzfU7nz/LDJzQleTQr1ol0fPGWnVJEG0YesM2d9gZpQXjkyg3Rm8ZILEGno27+uRo4YOSj4vs1HUX4qPmvcXlj/PJ3U+SGZRozRhqqDIKW2Svb7MpX/WkhQ4jYEP7J8hSb6E0itX6GudRymJ5k//RBQdr6T80m3n253YVO6gv8N85x+ocfOfkK0vQ7OHN7GaF7FUOFbtVtHcbOe9BrAoDXawbc3YLi/DI88qENxHn+UsulJG1x0sDtWxr+tZs1a/ZetAYE9YFUlHhHGKlMyEir9m9pVS+oFcJabz46Rn8UJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(1800799009)(186009)(451199024)(6506007)(6486002)(6512007)(83380400001)(31696002)(86362001)(38100700002)(66574015)(53546011)(36756003)(2616005)(26005)(66946007)(66476007)(66556008)(54906003)(6916009)(316002)(41300700001)(2906002)(4326008)(8936002)(8676002)(31686004)(5660300002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzJQMjExbG9IVkQ5NEhTdkZaekxEaGpnOHdhUzZmbXIxTUxBbjJtNmpyTmxi?=
 =?utf-8?B?MWNqNVBjVE5vTGplbTBVOE1zc3ByYVpzSG5WWWVRZDJkTWRsWkpFaDE1SVdU?=
 =?utf-8?B?SzdVbXNRYTJ2MmlxV0NOWk54RTgwMU9nOTFzQUxKWWVQcnNXcGlSaWI1SVVx?=
 =?utf-8?B?MWtnUjNzWkNsZi9NY2dyL0tEMU9tZmRjci91bEhUN3NlUFVtL01tTWwxeVFa?=
 =?utf-8?B?Y29XWXFHcjVoR1ZwcnN6Y0N3YjlWQjFMTUJmc2gvckJKWlBIT29IS0NrRksr?=
 =?utf-8?B?K1RJMWFoejR0M0FDcHlzRVRSQmVyUzVYVFpOcDh3aE5sVC9PZXM1ZUFWc1RM?=
 =?utf-8?B?WlFKQmhwNFljekJjY09pOXRtQWUwMDBTMzBmQkZtOHpuT0JKSE9kUWxFTnFw?=
 =?utf-8?B?aktFY2ZCUzc5S0trbTZuYW0wVlN2KzdYdlRtTGttZGh2cTkxeDlBVzkzUDQr?=
 =?utf-8?B?a21aQWZOWEZUckJERHFBY2l1OXYwNHErWjJWNnRVdE9UM0Z3c282K21yVWlp?=
 =?utf-8?B?cTdkUWgxMFgzbWVUUVpTc1l2M2p3eGRpSFJGTDd4MkFVcjBmL1FwSHMzMWpJ?=
 =?utf-8?B?cGVGWmJ4MXdBK2RXNmNjb3haOUwyZTVMY0pkcVQ5WGlINithQTFkTWhlLzNO?=
 =?utf-8?B?NGVuZGxqdytaR1NJSWhLWlJsTmNlKy9WUyt5UE8vK0JyRkNrRGhSejB6OTBT?=
 =?utf-8?B?VmoyOWpPMEVycUFOVFZkRldINFBTNmVycGh3QjRSaWprSUN2ZFhpd1dQdE5B?=
 =?utf-8?B?K2hzdS9nNWt4QWVWL3B4T0ZRL3dNT3VUVXBvUGRMVUJUYjU4NXJMTzJKclJB?=
 =?utf-8?B?bGtYWjZ0NTZlL3owVkgydUMyV0YvWVpDTndvcFlXU2pPQlBGQUFCRFVlTSs3?=
 =?utf-8?B?elpLNThBcmhHajRyRHNaQlp4MGZMYkhUcGNzQ1N6MzI2YnN0ejROQ0FGY2o3?=
 =?utf-8?B?MFZMSXNTNUN4S2V6eDQzY3NmTmpVTit3a0RnK296a2RWTkpzT1lGa2ZZY0VH?=
 =?utf-8?B?a1NVVnpzdXNXbkJLUmE4dmNkUUF6RmxGbEcrSEYrYXBWNlc1VmVPOUxkNzg3?=
 =?utf-8?B?dW50SlFDaUxzdjcrNzNOWndsaE5qWER5aEZaY2s3Q3NBNmp1S1NRRlJVaGZQ?=
 =?utf-8?B?MElkRmxrN3pickRvd3FkMjNQNm4wVURjU2pyM3RKU25FOTA1aWorRWRXNnV5?=
 =?utf-8?B?RFJZUElvZ3ZPeVF6VzBsbk5ZenRJZFBhZ0xrRWhUaC83OXc5K1dFcnJmcVRC?=
 =?utf-8?B?TzFXUEp4THlGd0xJY1hyczVIbU55QnR0Q3Q2QkhDUkNQbzlRb1YwR2JjMHEy?=
 =?utf-8?B?V2U0U1NyRzRNeUdOUjBGdDhlVTNiZC9lYTBGWDZmNUdNdjJEck1JMFY3RG5Y?=
 =?utf-8?B?OWoraC9qVHdCY29oSjFLenRGN05FeUpBaG1PRXVIb2YyemdTb0dkblZvNk9L?=
 =?utf-8?B?RkVsRUg1U1pnaWJBUE92OXRIV1hQR09mVjN5Q2tkTzV6MGpoVENEVjhkV3A2?=
 =?utf-8?B?UjlReW9Rd24vMXpXd2Z6Qzg4b2s5bUo0NzFIRVpWNEJ0WG1LYTNCNzF4anVM?=
 =?utf-8?B?NDB6S2RQaHF4K1NVOWc4SFJTRnNXVDNuRVEzU2tIOEMzdXl4Y3VkWnNrNCtR?=
 =?utf-8?B?N0hlZUs2a2ppejRmbFhidmJlZHBWcDZhTmRRTC9STUswdUFKZ3V3eWhjNWRG?=
 =?utf-8?B?OE9hT0pCalI5bzhKZlRjWDh1YVZWSGEvN3VGbFJsa0ZPWXRUcHJHMkp1RjZV?=
 =?utf-8?B?T01oZHNsZkE5aU9icmJLT3lZVG1vYkNoN0RVTUhPUjNPcGpwMnJaa2NQd3h0?=
 =?utf-8?B?N0RZUTA5eXIrNC9meDhIZ1hOcGNLbWthMkJkaGxRTVIyaWN1R1RjVm5tZjR1?=
 =?utf-8?B?d0ZIYUhsOWtJSDNjNE9DUi9mZDlGNlNMRGY2Y2dPNm9rMEtzWEZBdDIwYTdk?=
 =?utf-8?B?M0x4SE9qKzhVWllwYStUclI0cTl0UUdySW5DV291d2t4Z0kyUElsaVIraTI3?=
 =?utf-8?B?RXFzRVAxRmZYbmVNc1pjNkJ2cHRQMTRWdnpwSFJLRXpUcVZXSnhNUVViRFBN?=
 =?utf-8?B?V0VuREVmczY4dDF3Sm1UUzVVRDlKS0Izc0I0MGtOZGNSd1NkRkxsYTdLNmtj?=
 =?utf-8?Q?KA8rXrWQagMR4hpYrdOZfYSmY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd88fd7-b835-4a77-fe2a-08dbb2e0e025
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 16:05:10.7493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EI1fwPDonHgXUtG08kA4z4z6SpIsr+Hx9Tl0s9El3LN9H4YP8DecoPgPrk9Fr2RfjNSG8SdJYVDgLNhUQ79N8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7541

On 11.09.2023 17:26, Alex Bennée wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 02.09.2023 17:11, Javi Merino wrote:
>>> --- a/xen/common/coverage/Makefile
>>> +++ b/xen/common/coverage/Makefile
>>> @@ -5,7 +5,9 @@ obj-y += $(call cc-ifversion,-lt,0407, \
>>>  		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \
> 
> This isn't even supported, see below:
> 
>>>  		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
>>>  		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
>>> -		gcc_5.o, gcc_7.o))))
>>> +		gcc_5.o, $(call cc-ifversion,-lt,1000, \
>>> +		gcc_7.o,  $(call cc-ifversion,-lt,1200, \
>>> +		gcc_10.o, gcc_12.o))))))
>>
>> This is getting unwieldy, so I think we ought to try to limit the number
>> of different files we have. Already gcc_4_9.c and gcc_7.c specify the
>> same GCOV_COUNTERS and differ only in the version checks (which could be
>> combined). Therefore ...
> 
> You may want to consider your policy on supported GCC versions. I see
> you still support:
> 
>     * C compiler and linker:
>       - For x86:
>         - GCC 4.1.2_20070115 or later
>         - GNU Binutils 2.16.91.0.5 or later
>         or
>         - Clang/LLVM 3.5 or later
>       - For ARM 32-bit:
>         - GCC 4.9 or later
>         - GNU Binutils 2.24 or later
>       - For ARM 64-bit:
>         - GCC 5.1 or later
>         - GNU Binutils 2.24 or later
> 
> While also having some commented out warnings because the base GCC is so old:
> 
>   CFLAGS   += -Wmissing-prototypes
>   # (gcc 4.3x and later)   -Wconversion -Wno-sign-conversion
> 
> For reference QEMU's minimum GCC is 7.4
> 
>   if compiler.get_id() == 'gcc' and compiler.version().version_compare('>=7.4')
> 
> and while our support cycle is based off distro LTS releases I have to
> wonder do you actually need to support users building the
> latest/greatest version of the hypervisor on ancient user-spaces with
> old compilers?
> 
> I think the oldest distro you have in your CI is jessie (still hanging
> on with extended LTS support) and that uses GCC 4.9.
> 
> I see there are various scripts to gather support status into the
> documentation but I couldn't find a general statement on the projects
> overall approach to supported versions of components.

That's the problem - we've been intending to raise the baseline for quite
some time, but figuring at least a rule of thumb by which to go both now
and in the future turns out problematic.

Jan

