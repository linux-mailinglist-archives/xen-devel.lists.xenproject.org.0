Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4756A7A170A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 09:13:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602911.939736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh31F-00020b-9t; Fri, 15 Sep 2023 07:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602911.939736; Fri, 15 Sep 2023 07:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh31F-0001xJ-5m; Fri, 15 Sep 2023 07:13:37 +0000
Received: by outflank-mailman (input) for mailman id 602911;
 Fri, 15 Sep 2023 07:13:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qh31E-0001xD-2V
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 07:13:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 623356be-5397-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 09:13:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8920.eurprd04.prod.outlook.com (2603:10a6:10:2e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 07:13:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 07:13:26 +0000
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
X-Inumbo-ID: 623356be-5397-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILHj1B7yIDSjIlBGS5Iz/T5cI4sU9DsAVEBPnTK0zm1RxCaBztOrJlPVZAN5dJ7jAJ++JwOlEjbaToWj7Ehsg07cSvDmpGEAHVvrYiZS1QqrKFebtfdUydvnKH9sttxk6Qz0kUth855Ijt0UAaFLplUoFtg48ioX91JmymMe/qDPcylCI/eGmd/lLOCidUNmy8g35Heh0nJjHR8LRfO2WrdkPHI5jfRcUF4hD03SdgrLD/mkOEnF99C8tR+4e+TVyX0Cr7hkWgYw+l5qzRlm0opLMViKHsGUW9pCJNWSllWFK95e2gAhWyZdFFbUH7HmMn31bjbJ+UuB9alrbHUYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZnMPeIa3oX/odIyHVKz6hzMpTaz5xZ5EPoaUsHgEAI=;
 b=YRhpmx5uaZFbMyZov1Cc1xX6mwmqmeIIjWoGCE+w3pypeyAtAZ0XnLvpfQqQtyExPAPRG2ytzGRmwlsIqNQNnnpPnFKJ7Jw5QL8/Y0p6QqgIaZvC9bXp/Mk8+lL4tEcXtS/6XB21r3F16IKgT/LNcLHbHSg06G3OK0X5/zCkRpgdYI3fFITd7INo6WcDjOOgkLJQllJz9SxH4cjyqExH2inFP2DRxi7LUWkpG34fLGWIYTpQL95oqIQ+fB5PVvUn6u9kl5/TQ7n+B8SQ2I4mqVSuv5QdiFw9zqkqIqJOJOdEFZh0WG3PRHVJUi84ETJ49vBGIiMu8hKvXLmP+7fgwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZnMPeIa3oX/odIyHVKz6hzMpTaz5xZ5EPoaUsHgEAI=;
 b=TwUejAGPMdxzPxCYCD/iZ41XSfETSMNfxmn1YXQd4VXc79mPVdm6qKup1BbuXmDZddLY/ckuGFstSmiWoT10aeCob/XjVfxSG5ezBqPw6R7iIyRPui3qsdGkX/PjQk12nlQvgGbd1RNj+q7+Rhzvpn7MBClx132R3AKhM3x6lhUXHdWXSyY29kjxT5yoYb8OQU0AoLQ9csMei5BtzbOsfsdtnG9semSk3xNUwTsSTztSQz/9oNkoDYXFQxcIADPLU6B2EsUV1n5yenN3/lAaV1f3+6TBW4iay96oELm5XdmQoVPXi+jrBtR008xpsRax48ADn9TcqI1ZIOANK3X+Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6640dbb-05e5-7114-dc70-012c27dd96e7@suse.com>
Date: Fri, 15 Sep 2023 09:13:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 6/8] x86/entry: Track the IST-ness of an entry for the
 exit paths
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-7-andrew.cooper3@citrix.com>
 <762b58fe-a841-f92c-93a8-77dbb86bf118@suse.com>
 <fb9ec99d-9c76-82ff-9b82-22fff1a62c6c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fb9ec99d-9c76-82ff-9b82-22fff1a62c6c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d885782-ba94-439e-6c7e-08dbb5bb4191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3kFWaBRogcd9IsR5J4tVUn/nfuh14s0irwlFyxEe4smJGS0N+OXwi6r9/QbYwjQeCBpQbPoARBf/zCYhXQFAojZNkn8nLYnTQXVAldbvnK/cG2Ta+x220HYMuQv0aIOAIFbSgE2mPuwUfOHIFUPuRO9TwznuKUrcSqJyqhAgZdJpL7nfwe9v+h6zgA358GOpHsVXeo6qDciERNH9Nm3WedO6JwqXdiOqbyvZamtZ01FPy/poMYXoVvH54MZYHxxxKF/oCxYVScG/FLNX1C8dUpETNLF8RgXTO3CM+qiLgbCXDq/kR3dGYPYEi4ShwvLsANNkGP7FbgKHVos8d0pZQAjYLHdBMZMoO9cqu2gCwDxAlLP0g3asbo0kxskEwi8fpOHnMsSky0JiAyJaNo8E4fjtKtbdXdRoV6gZ7M1znhNBQj2k1bzL/Mg3xg+chwkDff6Ka5ZRq1MqxoZQtywh0JLbC56OCcgBMkirjbhx4snUuwpBaUuzngk0dD/T69ADNz1YqwtWt3Obktu23kGLnjRnGAJHOyHT7AzfG2CKaf4AJgo5bRJsmfkxcSo1DBbVZsI+cSjx3dmUrk1f6Q3rxfMKRs0fIxex3biXOXx26M/lm9PU2lBZe2cwHwwKU3CTjRKvl01DF7iQulP4vd2DFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(366004)(346002)(396003)(1800799009)(451199024)(186009)(6506007)(36756003)(53546011)(26005)(31696002)(86362001)(66946007)(6512007)(66556008)(83380400001)(2906002)(38100700002)(478600001)(6486002)(2616005)(31686004)(5660300002)(54906003)(66476007)(6916009)(316002)(4326008)(8676002)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGpmNVAydUV6TC9BZFZpQmgwSmNyVm1BQzBHbUplNS8yOXZkTDNEZDFiTnYx?=
 =?utf-8?B?WFhtOERmaTNVVXFxTDZpSUo3UzFhSzJETno5T0t4U1BOT0FpVDJsQ1dUU2V3?=
 =?utf-8?B?YUJrRGZWSG5UbGdSK3lmZUY3ZHZGRFp6b3k4YWhNeXdQRVRncDhPWHdmNkNx?=
 =?utf-8?B?YUV3eVBYRCtHaTFYMFhueEllL2RmcTAyUWlkUXlCekVhc2t6RmlVeTlWOFlH?=
 =?utf-8?B?ZnBVdTFCWE1iNmp0bmZjNkRTTnhnQ01qdkYzeGJSMHFONUhXSmRGenpqMnFx?=
 =?utf-8?B?NTRwbjZnVFhjM3NIMGYxWXhJdURXYjFmNEl3QXBZbnRIdzg1K3ZLeHU1OFVI?=
 =?utf-8?B?RVZPMzhRS1laWXVocUY0YTV0WUhqOVB2SlRTb2VkNURNNjhWbEl5UGp0ZFla?=
 =?utf-8?B?ejM3aXVBMEJHenViYWZFd2pBeFdZTVgwOGRLT1VaODRsOFBGY3ZVQ3RGYlpM?=
 =?utf-8?B?R2lVN1A4K0N2L2tHS0l3VFdweUtTbmJRaWkyZElkSDlPZ0RuOUdodlB3eHlU?=
 =?utf-8?B?Qkx3TGZJQkNlTzFZZ3RmN25lZGRxWWxuOFZMUEFPT2FXNVBYb0RPQnZtZHFt?=
 =?utf-8?B?RURKVC9mUGhoclptZGE4ZzNqejlNcnFHOVJ6V2ROOWtLN0lHenk3Z0lQWmll?=
 =?utf-8?B?ZzYwYWFTZ0VHdlFGem5XakVWbWMwaytndW5kbnJ4R0UzN1RrZGFEQThGUEl2?=
 =?utf-8?B?c1pzMEVzekpPYzNLZmsxbkM2d3d1M0ErRzZ5UnNWNjRpSGE1OWlpMjJWTEF3?=
 =?utf-8?B?UEp6YWpERk41aldQaVp0VjhzRjhhNVEwYUlzMjEvc2JyeTk2V2NiMkUzbWY5?=
 =?utf-8?B?WU9Ec1lhWHp3c0JJVG9McVRzeFdhOXgzZVhZME5CNFQzM1p2N3d3UUEreEU4?=
 =?utf-8?B?a2wveFhzRFVPSjc4akZIaWFxRTdBWHVreHZEcUpmRnJ6aktGVnVEWWpKT3k4?=
 =?utf-8?B?bkxjYVhydmlzWWVhNXZ2Q2NmZ3lQL2Nqc2NKMkc3SFFqK2paREtmNTczdDBN?=
 =?utf-8?B?a0FRVGE2UTZ0RkorK2hnNGd2TGlyQTBoNWZEdStJZVpiZmROR1RudHBpbXpB?=
 =?utf-8?B?S0JReGUzUEhPcFFtc0dSTk9YWGdrajFZeXBZcFJWa041VVM5Q2NlMjU1WHpI?=
 =?utf-8?B?T1VuZllYdEx0KzhmM1h4cWpNQTdKNkJ4VEZZeEc0VkxSWG56dzhkZlNwbWhN?=
 =?utf-8?B?ajJFN1U3ZG1vQ1k2d280bExZWnk4bHVKblJTWnpVSG9WU0RGTjZMSURkc3ND?=
 =?utf-8?B?OXBRMkxxT1A2eHV1Y0cvOElwWnlQQmQ0dW9XNEdMa29UTWlVcmo2V1cxem84?=
 =?utf-8?B?UXRNdkl1MEIxczA1bjNlY0FuTnEyTDFtNGJ0ck5vTGZyQ3g4c2pFdHpUNzZz?=
 =?utf-8?B?TjZNWUgzelVhMm53ZU8rT3pBQVRQZU9KaENTcXlDbk0xSWh6eVNWWXB1SlhE?=
 =?utf-8?B?TWw3WDRWb1Zrdy9ySGJtT0VoMDd5V2dLZk5jQ1BWRC8wYTY3ZFU1Vyt2TEJW?=
 =?utf-8?B?SzV1d2wyVzNibnZmVUVITTNNa0FSL2hyVWJRcThzUFA5a3RMWGMzQ1BXTE5K?=
 =?utf-8?B?MFkwcTNlWnZCZ09TS2VTRC9qWVozcnZWc0ZrTkdQdjNBYVE1T0JyY3BIcDdn?=
 =?utf-8?B?Ykw3bHFGUmloTzV3elZlRURjQldEenFDWnY4bWJ6eDk3bW1Ga0FqcjltNm1p?=
 =?utf-8?B?OGI5NjU3d3UrTDhWU0hXNWJoNHR1dis1MEcvbzBMeWFORmY5eEpZRklGbWdQ?=
 =?utf-8?B?MG9YVVY5T3VxaEY1Mmd1OUlzM0RCYTVmQytxeExPT2d0NWxaN3oyS1JOc3J3?=
 =?utf-8?B?OUpFK0ppWVNNd2p0QlBUT1dlcFcxdmtnUU0rUys1LzFJNGxJcWlyd2k0bldv?=
 =?utf-8?B?TDlxV0t4T2Q4T2lGeUlYcEtjR1psKzBxMnJMM29oU3E0clY4UWIvL2NLT1hq?=
 =?utf-8?B?aFJKVjUwV0lERkoyYTdzNE9hZnZEU01leFAvelp4SWVxMHhaVjNlV1FsTkQv?=
 =?utf-8?B?N2RqdHh5TlBTaFRlNDBFeUsvOHY0eDZ0SzE3MkF4ZVBDNDFsRmZ0Z0paZWZ6?=
 =?utf-8?B?b093amtVclFvT3YwZzNQWm96eStRcElwcjB3THBHRUVIL09yRjJRUnhBM2N6?=
 =?utf-8?Q?u0K90lRE9f163svnVe9/CZEUF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d885782-ba94-439e-6c7e-08dbb5bb4191
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 07:13:26.8091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Os3lqvIEqzXhpzfZ6bd7v3cNiIdc4y/MjMnjCXUinYm9t8XoSNl7FYbaHSJGCSveSgvmwTtYJ9qAju7kGR7nYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8920

On 14.09.2023 21:44, Andrew Cooper wrote:
> On 14/09/2023 10:32 am, Jan Beulich wrote:
>> On 13.09.2023 22:27, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/x86_64/compat/entry.S
>>> +++ b/xen/arch/x86/x86_64/compat/entry.S
>>> @@ -117,8 +117,15 @@ compat_process_trap:
>>>          call  compat_create_bounce_frame
>>>          jmp   compat_test_all_events
>>>  
>>> -/* %rbx: struct vcpu, interrupts disabled */
>>> +/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
>>>  ENTRY(compat_restore_all_guest)
>>> +
>>> +#ifdef CONFIG_DEBUG
>>> +        mov   %rsp, %rdi
>>> +        mov   %r12, %rsi
>>> +        call  check_ist_exit
>>> +#endif
>>> +
>>>          ASSERT_INTERRUPTS_DISABLED
>>>          mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
>>>          and   UREGS_eflags(%rsp),%r11d
>> Without having peeked ahead, is there any use of %r12 going to appear
>> on this path? I thought it's only going to be restore_all_xen?
> 
> For now, we only need to change behaviour based on ist_exit in
> restore_all_xen.
> 
> But, we do get here in IST context, and I'm not interested in having to
> re-do the analysis to determine if this is safe.  ist_exit is a global
> property of exiting Xen, so should be kept correct from the outset.

Would be nice to mention this just-in-case aspect in the description.

>>> --- a/xen/arch/x86/x86_64/entry.S
>>> +++ b/xen/arch/x86/x86_64/entry.S
>>> @@ -142,10 +142,16 @@ process_trap:
>>>  
>>>          .section .text.entry, "ax", @progbits
>>>  
>>> -/* %rbx: struct vcpu, interrupts disabled */
>>> +/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
>>>  restore_all_guest:
>>> -        ASSERT_INTERRUPTS_DISABLED
>>>  
>>> +#ifdef CONFIG_DEBUG
>>> +        mov   %rsp, %rdi
>>> +        mov   %r12, %rsi
>>> +        call  check_ist_exit
>>> +#endif
>>> +
>>> +        ASSERT_INTERRUPTS_DISABLED
>>>          /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
>>>          mov VCPU_arch_msrs(%rbx), %rdx
>>>          mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d
>> Even here I don't think I see a need for the addition. Plus if the check
>> is warranted here, is it really necessary for it to live ahead of the
>> interrupts-disabled check?
> 
> What makes you think there is a relevance to the order of two assertions
> in fully irqs-off code?

You explicitly making it more churn than strictly needed. IOW I was
simply wondering whether I was overlooking some aspect.

> The checks are in the same order as the comment stating the invariants.

If that's the only criteria, then okay (but still slightly odd to
see more churn than necessary).

Jan

