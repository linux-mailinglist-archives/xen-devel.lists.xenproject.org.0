Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7371D7DCAA1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 11:21:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625600.975039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlrk-0005Wj-N3; Tue, 31 Oct 2023 10:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625600.975039; Tue, 31 Oct 2023 10:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlrk-0005Ul-KM; Tue, 31 Oct 2023 10:20:56 +0000
Received: by outflank-mailman (input) for mailman id 625600;
 Tue, 31 Oct 2023 10:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxlri-0005Uf-G1
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 10:20:54 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe13::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bbb6869-77d7-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 11:20:53 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9443.eurprd04.prod.outlook.com (2603:10a6:10:35b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.18; Tue, 31 Oct
 2023 10:20:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 10:20:51 +0000
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
X-Inumbo-ID: 2bbb6869-77d7-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdO6c5KmrJsdEyhkKsZJsnUSV/DyhxldzHSdJEoRV6zhRkX/Hk9fFKHyDyBcAFsUgr+ah9zopq2/3mqdc38K4jneF/9xWTqawMmwWR/tt7ERhJKIiCj0iqVJWuFPb/Vs/UcX4Y1Q1vYiqftPN02qcZ7Gz8FtfQky/6jyIZdqGN1X+6kL0q+4zMrqsejjo5fiWTsx64lm0BPNJIf3P1zK5Ln2mWgPMr3TuVOp0RBSP01S6TTnQHcylClFQyN42iPJlhb4Oa1jyP/hisDF/Aec7K79RKik48oSgzHqCZXVUytf29W2jehkfxtnVCbQullDO+YrSJSz0ETWl9NvSlV1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5glKg/6Malbpd9Q1r5x3CQww802ehDsgVCSD+2P/KA=;
 b=eEhf4WLFb9jTGkzbN1kvPfs2jCKamBwWe0GnJxdAyw470NMOBoxOnDRoHM46of5jxqnHRkgfvSF735J3fIkahGwQ+1sZ/fR/A7LK3y8Iun+kgjSydi2LlWQTtWdonkoyhVJAxCqH0i8zZCwmwuIuZPlvmM1MSW8VJaGrLOqjqkgBtDXgzpXdcYC4xEAbg22sL/tMgcaREsfPVsbR5o4EECkeH7KBJ69/yRjMZKFLg8seVG8BHZhZZBUNSTYo/kPtZdgtlfbJiZwpAtocoAlw6lXrPGhJdw9sxLfy/AYgVI2Zzc4ec1gPZP6ZNf2UUeDT0jdBPkjyH4tBCzRBAfNNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5glKg/6Malbpd9Q1r5x3CQww802ehDsgVCSD+2P/KA=;
 b=bktzU6RTISsKFbmIOcMU5hF1IW2EUNhn46tcxospWRqtJ55LlVwryUP/oup06dl+fJoHer3sNL6OwmMpjVLRWRQH+F1vjfQ/UhgmIDe+uXOac1zEJq02/kBtKC8drGd8md8i8CJCjMXFWIXd8MLwpNIeExijrW5snFC3/S9ZU5JhnFvbcbfg88993esZePYiri471X/lX8NGOsfc9JZVzNIUO7oDlN/WpNRTWwGKxhFmQUZNRfJuQKUpA8vBAeXD880iKL1o+THV34uBT40LUo0I8y6WT0TG4cTBTC42l8kwJrAwB2S6sa/c2yykR9QOZlKhGqfHXzr2fV8w/0ZT6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1178b79c-d6a3-a46c-5556-3fb5964dc051@suse.com>
Date: Tue, 31 Oct 2023 11:20:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
 <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
 <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com>
 <alpine.DEB.2.22.394.2310301536390.1625118@ubuntu-linux-20-04-desktop>
 <7c26fb70-6a8c-58a3-6a1d-300dd57b5827@suse.com>
 <817fab34432c854ce585aba80db77f7c@bugseng.com>
 <8b4e0da82930375b2a95387a9031c73f@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8b4e0da82930375b2a95387a9031c73f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0372.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 431376e1-82a7-48b6-c83a-08dbd9fb0ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FPIfuPQzHeS5jl0vcz6BlajHtNEjDT3IvlTLXGLyFEEnqhgReTgzCD+pGUC3nSKB8Xou0BwtPuqpgX04c7f53/pzlBUNx0cPWk9r1JZA1X6UWRUqaCDjvcNadduC/uuwAjxGVieymUPGOx8P6X2hP9F/Wm1K/UVUDlltgCcnPReaVYOkPL8KLIKltKff+tPo11UkObwSQsrD/JkNEIhfg51DJzQMg6usJNrgmfINclwOE80dYmEBXL3bLhfvuUp7hwcuyiG2sBNOcPlxFO/spjYp7fhwxcN/EFTRy8lPv6ihb7hamhrbdPnNyLbGDp4vQrLWRBFdSiH0IvzXEvmCRFxzy/WMCPIsaAWTB6HjhH8AhC1OVDaGIMA9ODAe1gR5ubj2ajAzDI+HFztD/Ivt87fqhFLxMGT9Ma28G5oaVXei5libasUW3ok+17d9WA4V6QD0bln7J5iOu2nmWGsNz8YzeC45YMwrzDAq7EVRri+GPV0gjnpSlc0X+kiDHv+MKKaNdCb8RBxfn+dsJdnZucfjLkhNYvVo1dfGMyLY0/wtiDTNltz/kXfEMLlzrVqbMTq5GAfhQWFhEjj6QV9BcG9+TtOCHhIFN6ZgrQE+Pu7gKkXHsjonEVL1756w0oKjNpXNZs3HAX6+pn2pXnjY9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(31686004)(26005)(6512007)(2616005)(38100700002)(36756003)(86362001)(31696002)(4001150100001)(2906002)(7416002)(83380400001)(478600001)(53546011)(6506007)(6666004)(8936002)(8676002)(6486002)(966005)(66476007)(6916009)(4326008)(316002)(54906003)(66946007)(5660300002)(41300700001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHJwS2Z1TjdpMnNEQ3pYWkN3MjF4RmxDK2NEcjFjNlFnRmxCS0VSY0Z3bGJh?=
 =?utf-8?B?ZWtoQUY1SllQSVh2WFBUaHF4SWltY0FCK1JTWlhhU0Jmek5abWtYMlllV2lQ?=
 =?utf-8?B?VEwvRnRacGE5QTIybjF2ZG1oMS9jVytUa28rTjF0MVhGU1dQT0lSSk9vT1d1?=
 =?utf-8?B?ZVM3WHpPaWFNNmZFS0c2Q0ExbGxXeC9TMFZ2YmFtQnQ0aFFjaE9iUFFrU25z?=
 =?utf-8?B?Vk9ubGx2L01aSUs5NEtocnVIbHhQVExLaHdOUjE3R0RySDJTQTFzcFdkck1Q?=
 =?utf-8?B?RHFFWTNkVjBjYnFrMTZhdFFGQjJLd2kvQnFoSW40Y3VyVm4xZU9VWVVOanZO?=
 =?utf-8?B?R0JCKzlGR0lOdnVhcUJKaVRJY3lLUTd2bHVVb1M0NTdTTEE3eE9ocWc1N2RE?=
 =?utf-8?B?clZ4YlFpcFRHYUx3c3NBelVkRUM4Nldlci82WFh4YnRBQitKRnNsOTJWb3lC?=
 =?utf-8?B?bHgrdTBCRnUwWHE3c1plMHVHa2tjaGtXNTdYUHNGekpZVjZOb2wwdXNTaUg5?=
 =?utf-8?B?emVaU1R4dHhoN1o4Nk1jeHppY2VaaE1yQlNFYzZycVFmOHlHb3IyYTZhdXg2?=
 =?utf-8?B?WWZxQUx1SktPbHRWa1BtRkx6aVZyY2Y3YXZrZC8wNzRTbUUvV1V1QzZGeEpa?=
 =?utf-8?B?V0tRM0RURlVKK0c5cngrdklFTVpoa3cwbUJJVDIxQXcxMWZScXhIYmNIUm9J?=
 =?utf-8?B?OURNUHBUTFY4c3BTWmZGL25qWG5KemVGenIyYmVrU1lmczAyU1liL2J2cVQy?=
 =?utf-8?B?TXh3bkt0ajlwOFBWWlFNVnVac2ZhMWNtVGdSME5XUWhrSVhYNWxVSW8vQ1A2?=
 =?utf-8?B?UUxtdjVnbGZwQ09qUmw3dkJXVFVWV3E3QWJrejJLSzVjMFF0Z2NvaURKbGlT?=
 =?utf-8?B?ZnZjOVE5c001V2ZvbGE4SnFaTjFHSFByemNOb3FkMCtkd1hDby85S0luWHZ3?=
 =?utf-8?B?Q3FnRlhlakF6QzlFTWhBMlgveUYrM2t4em5UK0pYQ0ppOTk4NS9TcmM4alZH?=
 =?utf-8?B?MHZMZy9ROWR6TEh0VmY1ejkySlhZUWhEMnFKNmpKS0E3WU9DV1NVUEtnRWll?=
 =?utf-8?B?UFV3UGtyWjFjVEp6azJnblcyRms5TFZRbm5rUWt4SEZHMHdwZFZwSmJmcTlK?=
 =?utf-8?B?emRxZFhQcS9VemRaWkRJbmdRbm84RGIyZ210aThJbEtpUHNsRy9jUXp2Q3Zl?=
 =?utf-8?B?TmNVV0Q4YTdqeElseHF1TzRHS1NNTUZsa0praXl4OWxMSDF0WXhQS3FiRTY2?=
 =?utf-8?B?TWlXdnNFODdKejFzSWxDd0FPZVpPb3liOUg5LzRjU1ZXNEJLQ0ZzVExUU1NM?=
 =?utf-8?B?OHB6dEFvdjVCb2VyeDJhdzd4bHhNS2lKbVkxM3M0bUxJR25CN3cxTG1MVUhQ?=
 =?utf-8?B?bWtnaUZCZ0NPMkZkWE0zNHJqN1EyNFkyQ3g2aGg2dDEreUVGS1Y1QXNoRWZY?=
 =?utf-8?B?SitwRUZxcytJTVp1MWN4NEU3blMrUWlrU3BvaUpua3pHbDVpRkFUNkZDYllj?=
 =?utf-8?B?K3JSdFBuME01QVlZZkJYd0RBTHF6aXUrdGhROSt3S1pUTmw3S0VKT0lyVEIv?=
 =?utf-8?B?MGplUnZzM2MzTUtQRmZhQWhOb255Wmc4VStna3BWMVJpRHdMNURnZy9VL0dl?=
 =?utf-8?B?Z3V1RllTU29sazBhekFrbngxeFZyOG1QYTlJczZXcTJySWdyVm9OZW1xdUJL?=
 =?utf-8?B?NWc2ZjNVL1MwUHdMbEVOSVpaV0lVNU9XenNoZVFMcDlZQ3AwVzRYVlAvTyt0?=
 =?utf-8?B?SWxTckE4WE1SNzlBYmoyUFBiNXhvYmU1WVk4QkpSM3NnSVAxMU1FQkU1Wlps?=
 =?utf-8?B?b2U3eWF4VWJISDZKdFZ1T3RVWUZRNERFd1paNkZ5SE5IejVIUW52dEdaS01U?=
 =?utf-8?B?SWVkSzhvZHY1VFVjSHk4YVp1VVQzOVRwcEVnSFlxN0Q2cGQ1eUovSDNqUFF4?=
 =?utf-8?B?RUN2QzNxdXhkTCtINTA0dUsrRTc2QkJQVzljeUdjd3Zja3FOcmhMbVFtdUpV?=
 =?utf-8?B?TWVReTd3SGhuVWpFK1lWM2svc3RuMlFJeWhMdG5CZ0ppbjQ4eStneTg1dVg3?=
 =?utf-8?B?TndiUFZneDBSYkZseCtOeXhLTzM4Y2gvK2RsQkhpWm1oYVgyeXIvVE9MUC9x?=
 =?utf-8?Q?cUiAv8tD4XTKZF2Kpeeoq3Crw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431376e1-82a7-48b6-c83a-08dbd9fb0ea2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 10:20:51.0018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlIiNZY6K3gwFp+nROZK6bxigmPJMMY6vABYg0S66C8MkSzZLT0/malwV8jnBujfvaRxcJJhVUbPJol/zlGNHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9443

On 31.10.2023 11:03, Nicola Vetrini wrote:
> On 2023-10-31 09:28, Nicola Vetrini wrote:
>> On 2023-10-31 08:43, Jan Beulich wrote:
>>> On 30.10.2023 23:44, Stefano Stabellini wrote:
>>>> On Mon, 30 Oct 2023, Jan Beulich wrote:
>>>>> On 27.10.2023 15:34, Nicola Vetrini wrote:
>>>>>> --- a/xen/include/xen/macros.h
>>>>>> +++ b/xen/include/xen/macros.h
>>>>>> @@ -8,8 +8,14 @@
>>>>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>>>>
>>>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>>>>> +/*
>>>>>> + * Given an unsigned integer argument, expands to a mask where 
>>>>>> just the least
>>>>>> + * significant nonzero bit of the argument is set, or 0 if no bits 
>>>>>> are set.
>>>>>> + */
>>>>>> +#define ISOLATE_LOW_BIT(x) ((x) & -(x))
>>>>>
>>>>> Not even considering future Misra changes (which aiui may require 
>>>>> that
>>>>> anyway), this generalization of the macro imo demands that its 
>>>>> argument
>>>>> now be evaluated only once.
>>>>
>>>> Fur sure that would be an improvement, but I don't see a trivial way 
>>>> to
>>>> do it and this issue is also present today before the patch.
>>>
>>> This was an issue here for MASK_EXTR() and MASK_INSR(), yes, but the 
>>> new
>>> macro has wider use, and there was no issue elsewhere so far.
>>>
>>>> I think it
>>>> would be better to avoid scope-creeping this patch as we are already 
>>>> at
>>>> v4 for something that was expected to be a trivial mechanical change. 
>>>> I
>>>> would rather review the fix as a separate patch, maybe sent by you as
>>>> you probably have a specific implementation in mind?
>>>
>>> #define ISOLATE_LOW_BIT(x) ({ \
>>>     typeof(x) x_ = (x); \
>>>     x_ & -x_; \
>>> })
>>>
>>> Hard to see the scope creep here. What I would consider scope creep I
>>> specifically didn't even ask for: I'd like this macro to be 
>>> overridable
>>> by an arch. Specifically (see my earlier naming hint) I'd like to use
>>> x86's BMI insn BLSI in the context of "x86: allow Kconfig control over
>>> psABI level", when ABI v2 or higher is in use.
>>
>> I appreciate you suggesting an implementation; I'll send a v5 
>> incorporating it.
> 
> There's an issue with this approach, though: since the macro is used 
> indirectly
> in expressions that are e.g. case labels or array sizes, the build fails 
> (see [1] for instance).
> Perhaps it's best to leave it as is?

Hmm. I'm afraid it's not an option to "leave as is", not the least because
- as said - I'm under the impression that another Misra rule requires
macro arguments to be evaluated exactly once. Best I can think of right
away is to have a macro for limited use (to address such build issues)
plus an inline function (for general use). But yes, maybe that then indeed
needs to be a 2nd step.

Jan

> [1] https://gitlab.com/xen-project/people/bugseng/xen/-/jobs/5423693947
> 


