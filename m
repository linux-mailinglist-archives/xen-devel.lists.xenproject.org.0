Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0867A4A0F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 14:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604028.941232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiDf1-0003Jh-9Y; Mon, 18 Sep 2023 12:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604028.941232; Mon, 18 Sep 2023 12:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiDf1-0003Gy-5l; Mon, 18 Sep 2023 12:47:31 +0000
Received: by outflank-mailman (input) for mailman id 604028;
 Mon, 18 Sep 2023 12:47:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiDez-0003Fg-G3
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 12:47:29 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 858d83b9-5621-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 14:47:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6975.eurprd04.prod.outlook.com (2603:10a6:803:138::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 12:47:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 12:47:25 +0000
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
X-Inumbo-ID: 858d83b9-5621-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHf22Sstx54HDzBNtCZSL2bAYhohykbaIB0K9YiB93zXn8WlZxEtFO2yswjOv5AnvEPqp8EZsMIkFxI78nVxiYZDcshLLqUSp+nZ2d1dar0mReq5+6/YXUi1a6f8KjpK8Iw6t+p+ave4JFiziCERchb3HhffIARJKw4lqwAPjDpwGgUWi1/MIvVzZJjP2ORO9XTrMF2ejcp4ur2PX4TS52UdlRzjstPeMj7ev1cDptH96JYWNmSXMbz22Z71JxTgj931FiiMq2V1XdZJAdSutNxElE+7yheHUzZls5O+8bOiMt5R9909OaVXK2q1L10PIdOuzcgnqqyQiPvpD7CsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4oLDHGUZlzoQxIRnoNycqPiSqkuZNuVp7IdQwO2haQ=;
 b=h5SNQqphRZy45CYste7Ukg79L6X53syR3a8sjJrB/dhXCQes4y4Li25+wDG6mr0RcPFmQQsu7wllX5hyOE543D8KSn5PuQGi9r77UYTlvIjdVxdmwQG47Z29knmN6ewFmMrNMLChskI/z6w7AaaDOqweDIEa/B5llb8JYAhDAYMphFqezYDfY/EpYrTE5KkTBL1LmXl6cca5F1xIIj8/ufwMVQ+ze4V4RADMR8eiqCgcS4Zbk16tv1DecABJuoXB8Zl8hJsqI9VLTr89uhvJhxLEUE88oqC3/OHeR7Ka0mJkk56Te15Omaz4j8WaZEoNd2FlIh7zHQZvAne0G0pXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4oLDHGUZlzoQxIRnoNycqPiSqkuZNuVp7IdQwO2haQ=;
 b=4c3icr8PA5/3x7cDiJp+xtKN/dinanf8KGSUrPBsUqIWu2kCz8yntr+oTeIz1m83dzvJF1Iro8x/tf2ZAsr0DkdbLezL35/JDOqh23KPVYtwYf2bnjY/HyelDeq4SZINT//E6KtrqZ8kZQaPint1nt0EE06HTaybArQ8iC+qPZqQZcuDUtBfXPoxq3sL5ggef30ZrEH0qOiUVAzB6VedaNwsphBq/2klG1Qm9vgdPEltm9UKKyFe3BeFY+SA8rLGZplvr9ACtMwSllQmFWd3MvHaa4Yv7p06jPXtfZgEyqIlLBvdI3s3+DTTm5HNB8y/T8J4Q12C57CPWYNTw1lPFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82bc3254-a3eb-30ae-e6ee-71568a686c90@suse.com>
Date: Mon, 18 Sep 2023 14:47:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/7] x86/emul: Fix and extend #DB trap handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-3-andrew.cooper3@citrix.com>
 <334fb537-ef7c-97e1-3274-736c4a2549b6@citrix.com>
 <311e2920-5e91-b9dc-77a7-263272a79a90@suse.com>
 <c119c09f-5f87-fb4d-9e73-968dbb4c0ac3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c119c09f-5f87-fb4d-9e73-968dbb4c0ac3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 786acae1-1e2c-4670-2d82-08dbb84568ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JL6eDQWGwgM3MoHCCTxB8ey1pbIBSAqGLQxZwpD+fEW+ag1nG7aMVFkIS19meLvufEsL0zIR2qUF+PN6tdwlLE3bD4vDUgK7ajaUyDjF11PVzkx8zPGHMqD6bFbUXh7xsJTrCYRmgCkz3GByC0b2weswz7q9kEagkBcKyOucHxnz2qvRSnwU+r4qAZTU1lyxH/CxtPdhk3/NU4opmM91WI1uqzrp8WLK/MQNZq8x9hKdyc4GCfvWsUHxuBG/WM5/L06fMEJ8kYI/tPIZi9zNaYhryx1ovsQGb7rpqq0nFPxTLpG+euHJ2MJHu1To+B6LuliKvr04J3TIgHw+UcYK3AhHJPGC4JRbDcNMhDaBg9TfKUnkv2T3XM0RtSu4l9/gnZNL6uufzdlL7clqxSGPd6i/l3FKTky106v3MWzK+T3/CU0kGyizRpjZH5bD3Vf5QClAzPDwcKkVkUQvdGp/cGUqkAt2MV7ypw1EmNoMlUIi22PR9l1nINS0epJQ4VkQhK96/5FMFhH0YDy0s+pjiV1itkHOgSzuEHpv3CbYBEVpv2IohBNPqobLg49RUi/M7+cFXMfDpBnD606i06t1QyK0XnTTk3TB5Fg4wYCjO8bgiDSnvBpBUUmrXGMxtSbzd0/X3TU8eiS/6+PZ37uDjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39850400004)(366004)(376002)(136003)(186009)(1800799009)(451199024)(53546011)(6486002)(6506007)(6512007)(478600001)(26005)(2616005)(2906002)(5660300002)(66556008)(66476007)(66946007)(54906003)(6916009)(8676002)(4326008)(8936002)(316002)(41300700001)(86362001)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emFKWm1PbThJVnEweWFyTUh4N3dVbDNTOS9wTUdNdVZ3QVJUemRxd0diZUMv?=
 =?utf-8?B?eTNET3Q0RlpMbjFmZWUvTHJNTEM1VXA3Tk5sWi9pZ2hRWXNKNDJQU0lSd2xh?=
 =?utf-8?B?NjIybTVoZVhUTGFvSW5WTStJZStOd0o1ak1BUjlMWGh5eXNlNitGZFVrRkRk?=
 =?utf-8?B?ZVRZNWFXRThPclhITjlPL2U3RS9JTWljR2psOTFhTTNuTDdwT3VJSytIai9o?=
 =?utf-8?B?MzlhSmZJa0ovWjhGckYrVVR2Q2s4TlJhaWJoRGxNZGhjRFB2WVZxempCVTJG?=
 =?utf-8?B?ZHNNUWRVNjJXNTdwRmpVTVpZMllEdnBjOTFsdHQ4ekdaVDVCOGIrRFlWOHZr?=
 =?utf-8?B?OEM3NmxWTnl4ZGQ3Mmxmb2xIdTFIYlZvZ0RUYTk3a3ArTjBXOURzazNDYng2?=
 =?utf-8?B?c3NUSDZVMTlPVmxFV2JkZFJRN0dpSndxcG9URnJZVHU5YlArbmNzbTRUdDh4?=
 =?utf-8?B?YXhhSmhGVElUdGdDT1Y0MzRiUDUwelBrU3ZibWpoYWxMZFMxVEdURWZZcUhJ?=
 =?utf-8?B?V3VhbnJoY0QvdGNaRytaMTlIMEwrbWo0OUJCQjI2OXZrNkF4SGhvNnArUkZz?=
 =?utf-8?B?VThoUTFVTUNxRHliSTNXVmk4eEZXUFVXYnh0Z2ZXZDk4d08wbzlxellqa2p1?=
 =?utf-8?B?L09qakVROWpNVHVCTlFhaDlPelZlWFo2NWdWajFmTjZIZjM2b1R5KzMydEI5?=
 =?utf-8?B?ODB1cXlWODlTVWNyN2ROaGt1UkplQ2l1Z3FSUWdoL2xLUzBDbnlOK2dpVHds?=
 =?utf-8?B?emFya3JvZm9hQjl4d3EvUHRCNC9adWs2RUhUS01KdXhlMUdhcVVjVjJYQUFl?=
 =?utf-8?B?WTkvUTd5VkdMaExiVVJjRUJlWjdGTXVoQnVSWnJhK0NnYTZERWQrNVdzMGVq?=
 =?utf-8?B?dkl0NUQ5K3FoSXhPd29nK1JET24wcEZsZ0x2b2t4SmRnWisvR01tSDd6ZE5V?=
 =?utf-8?B?enRsTnBGQyt5d3BVQnF5RHpXUWxVcHkvZSs1MWtIRjJxUGE1NHg3TlpjS0pn?=
 =?utf-8?B?Z3RLbStnNlhyVmZSUUVHWW9QbDN2dkdWV2VGaWFzY3VKK1Nxc1U4YTAxRXhk?=
 =?utf-8?B?R1pTbGhOR3l1eWkwY3JDNHhNMnZId2JDb3ZiK0hRVklYd3BKbUJST292bWRt?=
 =?utf-8?B?eGdkaDRCNkRCbUNiVGlsRkREbm1hZzR6VnlQZXpKaStsWUpqaGd0ZStQVWZa?=
 =?utf-8?B?TlRiY2NmaTV1ZEZyRFI3dUMwVmFCQmJjcUJTYVNHMlNKMFllMzQvWWRnNXF1?=
 =?utf-8?B?RXpYb1dBWXZvR1lvRFNpakVxL1pWanYwQ0JEOE5zNjZEejVzRWNSM0dYNmVs?=
 =?utf-8?B?TVZHOWFScnNpSDRCeXlISGdaWjJURExkMzdCRjZBekR5TXdDaTdWdHhDUVE4?=
 =?utf-8?B?UUVGd2FRcWxpbGI3M1FNR2JjeHZsUlJRbEVYakFyYjhBT1lUamNBZzhTMzFq?=
 =?utf-8?B?MlgxSXVZZCtFNjU5UGFGbXR1d2hYNmt0WmJLY1QydFMrVFNqdzBmMHE0aTV5?=
 =?utf-8?B?TGtsbVh6VzVzbGZpa1lZK24vVE9wRmlKMzZPUGxkNDZCQkczOGhjNEtZRkR5?=
 =?utf-8?B?bE92WFhzWDQxRHVsQzhSOG9HUldzWEYybi96TmhpSlZHbW9zR2N4TnBkQ3ZP?=
 =?utf-8?B?cXBvVzFIUlkzWHZVNmh0OWVlanVrY29PN3I5VUpyd1BqM25PK3VHRFhNYWNy?=
 =?utf-8?B?VFV1V2FVT3JHMEdCUXFidWpwOS84SFpNdVY1K2c4SjlrdFRSRGdnL1Yxb29x?=
 =?utf-8?B?dFloczFyd0Y3aG9mWThDUEVNT2oxNy9VdlVza3VRVmlNWjlPSUpXbVZWaEJh?=
 =?utf-8?B?NEZzMEEyQkdDczNHQUZlWTJlUEtUdmdGbWx3ZUdUZUJTaEhFUjFha0RyQVZ3?=
 =?utf-8?B?Rno3ZWNBUncrdHFia1pxOHRPak9SUWdINDYybk8xTGc1dTY4UEhPczRqQWty?=
 =?utf-8?B?Smp6Skhjc2NjcFpxWjNmbldVNkNCaXdTV0hTMDRpQlJRcXo2RGpQeFh5Njd6?=
 =?utf-8?B?eEphVWtBZXpNc2pWeVFDUXZZQ083SVdTWFN5eEpyQkE1Y0RhV1F1VEVVME1I?=
 =?utf-8?B?bVVld0dBUWFKZzR3SkphV21TcUl0VkxORnhXN29aZnBVL2lmVVFTOXl2UWtw?=
 =?utf-8?Q?3Za851eJRvDszLqL/epnjjexo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 786acae1-1e2c-4670-2d82-08dbb84568ab
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 12:47:25.2722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJrNFwSBNmk9eEhY4uGefPiDABlaFUxh/CPwAdojUPci1b33G7s0HVrF1tnOT4EY55wB6SGE1RxWSSLQQuevtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6975

On 18.09.2023 14:19, Andrew Cooper wrote:
> On 18/09/2023 12:30 pm, Jan Beulich wrote:
>> On 18.09.2023 11:24, Andrew Cooper wrote:
>>> On 15/09/2023 9:36 pm, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>>> @@ -8379,13 +8379,6 @@ x86_emulate(
>>>>      if ( !mode_64bit() )
>>>>          _regs.r(ip) = (uint32_t)_regs.r(ip);
>>>>  
>>>> -    /* Should a singlestep #DB be raised? */
>>>> -    if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )
>>>> -    {
>>>> -        ctxt->retire.singlestep = true;
>>>> -        ctxt->retire.sti = false;
>>>> -    }
>>>> -
>>>>      if ( rc != X86EMUL_DONE )
>>>>          *ctxt->regs = _regs;
>>>>      else
>>>> @@ -8394,6 +8387,19 @@ x86_emulate(
>>>>          rc = X86EMUL_OKAY;
>>>>      }
>>>>  
>>>> +    /* Should a singlestep #DB be raised? */
>>>> +    if ( rc == X86EMUL_OKAY && singlestep )
>>>> +    {
>>>> +        ctxt->retire.pending_dbg |= X86_DR6_BS;
>>>> +
>>>> +        /* BROKEN - TODO, merge into pending_dbg. */
>>>> +        if ( !ctxt->retire.mov_ss )
>>>> +        {
>>>> +            ctxt->retire.singlestep = true;
>>>> +            ctxt->retire.sti = false;
>>>> +        }
>>> I occurs to me that setting X86_DR6_BS outside of the !mov_ss case will
>>> break HVM (when HVM swaps from singlestep to pending_dbg) until one of
>>> the further TODOs is addressed.
>>>
>>> This will need bringing back within the conditional to avoid regressions
>>> in the short term.
>> I'm afraid I don't understand this: Isn't the purpose to latch state no
>> matter whether it'll be consumed right away, or only on the next insn?
> 
> Yes, that is the intention in the longterm.
> 
> But in the short term, where I'm doing just enough to fix the %dr6 bits,
> putting this unconditionally in PENDING_DBG will break the emulation of
> mov-to-ss until the bigger todo of "wire INTERRUPTIBILITY/ACTIVITY state
> into the emulation context" is complete.

Since I assume we're talking about the tail of _hvm_emulate_one(), my
problem is that I cannot see how setting X86_DR6_BS would lead to a
problem there. Plus you don't touch x86/hvm/ at all in the series, and
the pending_dbg field gets newly introduced in the patch here. Hence it
looks to me as if for HVM the field could take any value, without
breaking the code. But then, from you explicitly pointing out a problem,
I can only infer that I'm overlooking something.

> The latter is definitely too big to fit into 4.18, and I can't
> intentionally regress mov-to-ss in a series we intend to backport.

Of course.

Jan

