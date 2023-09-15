Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5037A1719
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 09:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602918.939744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh33R-0002e7-NV; Fri, 15 Sep 2023 07:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602918.939744; Fri, 15 Sep 2023 07:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh33R-0002bS-Ke; Fri, 15 Sep 2023 07:15:53 +0000
Received: by outflank-mailman (input) for mailman id 602918;
 Fri, 15 Sep 2023 07:15:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qh33Q-0002bI-6U
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 07:15:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b369cd9b-5397-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 09:15:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8920.eurprd04.prod.outlook.com (2603:10a6:10:2e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 07:15:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 07:15:49 +0000
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
X-Inumbo-ID: b369cd9b-5397-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izHCyVxamaxCj6pHD4T1ID5/AvpLESLVRBrWEEisZkwnpmGDFtalOmWm/lJFMwKPos7jIvOFt9AGRoMadZZQ6Io1GmGoPWWwB0zc1lI6KYMnkEgZIspqrdN1EcltmnZZKnALPGTUsnWB/TH1fucReA/Zuvl0jlnrTycDKVVv8Vw1+baD6FznA2bIEyjj8KcwmTOKQN//Vmkw8J0PHXhWejC1Wo2GKJktcuhayIKgvSbNj70FQmkem6xXEusmz7ujXqSrUlv62GO8rRVBo3vA7PROyQsozk4zbQqC4/CFme2nx1/Veqg+uyuLVLxP/B3Ttwts5mddE7JtFoBEbimNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4e5Og+eLrLFQ6KmXFJKqQygHyGRdff0dqPUl4tRZbFc=;
 b=oHpagLHe6vS6/TBFaRHrqZ3wNMTtmlDCkGEyabJAjTC6wdj0jnyg3ILuixXHYPSNYGk32T3mT9InLSBxTHEERYtdX2Essjg5m4TauQBPVi2X/MVWyNQa0UB7j5lESvNlh+cFwNQXloq0yLu8OYtrULkkSdevChmHfT0sKORiVJ1Z9AKY1LAXltZyt1lATJg2Ph2TC+bK1dUoT13JwZpO9THXx/fJKPXKGHZswbvvFMY0biqyvUYXSUsZ3pG+pJTIg0JMFdSZqAzVmDdO9CgUGvxR/yXCzGKbbse0uc0wLne5IC84aDtB6eBHYses02qs2b2o8UCa4YBsXyICFuZUDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4e5Og+eLrLFQ6KmXFJKqQygHyGRdff0dqPUl4tRZbFc=;
 b=QZTifNA33VOsi81fF9d2TCDPsc1+ltGG1wOYsYQsoTMA3sWgRVoi31b9qiQ6kvIUjUN1L1Kgkqbja7JRMUGGH/WWizGnS51wH5pAS0E0sIOSednQHDibb3ETEKMzWaEobLZnsWE1qna/gqJ0eqVeyjiAcjK/xBC78JirvnOCUTD5I9v6n8QtK5wPAInjiPCNKQzNTg6hIFRL8y4WigodvDxtpgtjYMM2Kcv9aPVba7fQPdjaCzitUhUTt8XQVvELskLXl8HGCI+ZOm3sli5B13vxXdueKYMPiW1eoPJNVfyR/IUMWR0PnLvgTXXe6BSA5xR94zXipYvyXONxDLGYDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7b4c0bfd-3eb2-3d0a-859a-b94b12397876@suse.com>
Date: Fri, 15 Sep 2023 09:15:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 7/8] x86/spec-ctrl: Issue VERW during IST exit to Xen
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-8-andrew.cooper3@citrix.com>
 <f771260c-feed-9183-0c0c-308f517e09b4@suse.com>
 <22864483-9cb8-7220-f82e-883fd2ef617a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <22864483-9cb8-7220-f82e-883fd2ef617a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9f3502-a860-45a2-ea51-08dbb5bb968d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F5H7byI/leFfl45Y9MBIfwcvp23be/MJJk6W21i2WTk0d0/wCx3mmEW8QIsM+zTFhINlddfKeQCw3VJfY20vTnabTZQSxDmX8CsOFWzQ7f/nxUmNnmWLoogwBJhGsexgZUWAyUaN3ZEHpHAI3WeW8mc3AgndPVQF5Flt+kK8oJ66WdtQph9hP4CyUDemkdVp1xzp5O1Xt0BIOYnn9ih6m3r0wBfOZ92m8T1sT0+GGwB0fLwDbWNA6UyugFq686YlmPPSYNLKy8txntrEOfWYdrbwTDIhi2nDsPvEVlT9Dccm8Zm1xccky11cqwun1dcYnJ8zTnTgMxK5XNfMlPBN0BSPPfhTZdcYC1nVA3s+yDcbf8OErKB8fHVgtcd5owkUaNzb09LSGIUiYdYn/F2dSzR5qxCEGADGXcsk1X0+tEM7GhBF5tDfEzG47M5bShfbKHr/LkMUVpaFdKCa9JTS/cWm6QJIk2DxPQKL0Sy4IrvpewDGX/elQh7rormXAJVrtpalS4OFr5qevo1jkVysCUeUcTykymXP2ROA7Au7zUOTtAITt4yUuh6n0X2P9eQlnyZV9IDieiR7OwNDZe8RetSsD3xYqHhonKbfYy9hBr2jgJkqUIAn84iuCuR20hdeRFMN4A5fPFjhzRHUYxtayQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(366004)(346002)(396003)(1800799009)(451199024)(186009)(6506007)(36756003)(53546011)(26005)(31696002)(86362001)(66946007)(6512007)(66556008)(83380400001)(2906002)(38100700002)(478600001)(6486002)(2616005)(31686004)(5660300002)(54906003)(66476007)(6916009)(316002)(4326008)(8676002)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGt4bnpxMkhMTEwxbzBkZ09BbGt4cFYyb1J2VDBBUFMvckpMemYxNnN3bG9q?=
 =?utf-8?B?aGE0WERsck5iV3VHVGwxZU1WU1djbzdUQlA0YnZxNkNzNFpGMXFuVnR6UWVT?=
 =?utf-8?B?OEtSZzRxc0VRUHUxVVAzSWpoM2UrTzEzQml5aWYzTm1HRXBOdUQyRjJZNS9G?=
 =?utf-8?B?d2p6OFd1MGVRcTVYOGQ1LzJEdXJ0WGNwY05ZbkNpZXd1ZlBMVFY0bk9pd2lr?=
 =?utf-8?B?bVhEeG9YdUczUG9BUFVTSmZNR2xUK3BveXNmMzFtYldLVTNXeGhaWkc0NGI0?=
 =?utf-8?B?c3BKTUlUSFA2MVNBekJ0YzFsRGpNZzVYSGxvMEpFYko5SVdhZnpFbEp4V1Ur?=
 =?utf-8?B?dnBDbTRtbXo1MWM2TGN5UkZEaTcvY29PWmQvUlNoa1FZZVZHbTFrVzlzZytC?=
 =?utf-8?B?YUl1aGNwUkxtZmFZWXBXcmh6azh5bWVwYnFmUCtqajBlT3FWRFNwUjhRam9t?=
 =?utf-8?B?V1FLSnNyY2VLaTJVMFpqUEt6Rmd0SDY1WkV3STdqbGJMWXRMYUU1SXp2Myt1?=
 =?utf-8?B?M09xY0EvaFM1WWdiYXlabU5sZ1AvcDNFelJ4dnZPOFdGbGZDWU5ZRDhOV25Q?=
 =?utf-8?B?aWF2WVRGdld1U2FvL1ZMOFlHMkpsYU5kQiswdzFEVWtOOFFUUWgvRWlISlhJ?=
 =?utf-8?B?bmRqUXp5ZXZ6cTZIcllxVmVnR1I0SUdDbVZjZEVkUmxNOVo2aTVqcXJ3YVF2?=
 =?utf-8?B?WVZnd2ZsQTIxZXlnNWUzaGlQenZrclk2RGszcEkwV2xQbS9oWWJFNnJlbVZz?=
 =?utf-8?B?UWt2QWlERjZMSThyZVhKbnVqQkFHQndLa3RZK1JsQkhBekVIRUJqTlZyTWJn?=
 =?utf-8?B?SXI4ZnJseUJ4ZjhnRURYR1EyMElsRDdLVllmM3lha1Q4T2VKRDZxU29mRHlU?=
 =?utf-8?B?YmNHa0p0bDhpUGxJODU3ZFFQYnhPWFgwbWZDWHYyaUh0Mys2Mmd2bTg5TUxB?=
 =?utf-8?B?eXpsNW56RnNZV2RPNnp4Z0Y4MUtjL2RuMFM0YlFpMXI4SG1XSDdnZnhxWmtO?=
 =?utf-8?B?bkx6Y3UraFpvVGl2VEo2Z2l4UDlWSWVjVldQRlIwUlN4TTFVU285YVRPQkRk?=
 =?utf-8?B?bi9kdStRWjZrSjUrYzhKNHdNVWZSeWZwOFR3allVRWtaTWJ6dXZBNHhhbkcy?=
 =?utf-8?B?Mkh5b1MxcWZSWmQ0cG9Kd1lpRkZUQ0d2eGRXN09qeWhrVit6VnFHcFFjMW50?=
 =?utf-8?B?dFZET3QrR05ocG9KUEpEYlBIQmROQlEwdjN0SlpFM1JHTEJuZUNXSXFSRnIx?=
 =?utf-8?B?cVN4OUdhWmtEbE9uV3F2N0krTWZWU255dmlObFFEZ2VUc0tkVklXdlNzN0x6?=
 =?utf-8?B?QmdNS1IyenVGS2FYRFlja3BQM2xBTFhFQVpZdzV3cnlUL3pmY1dzbVZqT3Qv?=
 =?utf-8?B?V3F6WHF3Q1dTKy9nV2NIZFAxS1dqRWJ6NU4zN0xHaXA1MW5pRHU1ckdHYzFE?=
 =?utf-8?B?S1QxSndCa1BjOFNYdnB1QVBOU3hBWDl4cmdTbG0zQkFmM2VRYmdnNXdoZXdh?=
 =?utf-8?B?eTdyaVU2RnJqRC8zLzVBVUtzeXYvOGVrVzFwVVpHQ1NWY2c5ZlRqSzcreFdN?=
 =?utf-8?B?Si93eW1ueFVnRFJJd2V5TVdZaytoaHcrMk5pd0xYSVNsZEpReGx2dk0zT1Ft?=
 =?utf-8?B?VzB4OU0rUFg3TDgwUjdvNEVXdERKMjN4MWRsTnFLeWwxaHZESXNQNEZCNVR5?=
 =?utf-8?B?MFpmaWR3Kzd3SXJNYVRweHc5M3JJME5mZ0p0V2ltQ0lFNFZud3hiZ1pqQ05X?=
 =?utf-8?B?L2lONFg5VEUyNklKeDBoODRVd0l6L2NuUkJUR3RzaWJXUzlxRjhLd0NKdXYy?=
 =?utf-8?B?VXVaKy9TNDhHSmxxVnVMeVMyS0dCTXlzUkZzSW5iVzBKRHhJL09iZXZzaDhM?=
 =?utf-8?B?cWpQU1owSDlRN1FBVklnN3UySUxXSUlzZFVBTnUvbzRvVDFmbitRZVh2anJM?=
 =?utf-8?B?Q0RVOEJ6L2dva1BWQUp6M0h1MHRKR2xqWFMvNjlSM0VDeW5LWlRtUTBlbnhE?=
 =?utf-8?B?dnRnNGpWekxOUUNuVm12RGFPTDdTSWY4ejZnOGpFVDZpVUtLWUJoYUY4YWdV?=
 =?utf-8?B?RkNReVRST0xwYzFwcmdGa1lwd29jUzdRK1o3anhUeDFKdmVJUzVTSnJZWU11?=
 =?utf-8?Q?JmKBCY0VfyS9JD4TQE0S7h3hR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9f3502-a860-45a2-ea51-08dbb5bb968d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 07:15:49.3831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBpWmBTewtLJI0miwRwLaAnLkB2DIMn2iQjMNh/1vcZ1ZDiJmbNBBwIlTIXPuTw2sHZ+II9QXaGau5vh5ukF5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8920

On 14.09.2023 21:49, Andrew Cooper wrote:
> On 14/09/2023 11:01 am, Jan Beulich wrote:
>> On 13.09.2023 22:27, Andrew Cooper wrote:
>>> There is a corner case where e.g. an NMI hitting an exit-to-guest path after
>>> SPEC_CTRL_EXIT_TO_* would have run the entire NMI handler *after* the VERW
>>> flush to scrub potentially sensitive data from uarch buffers.
>>>
>>> In order to compensate, issue VERW when exiting to Xen from an IST entry.
>>>
>>> SPEC_CTRL_EXIT_TO_XEN already has two reads of spec_ctrl_flags off the stack,
>>> and we're about to add a third.  Load the field into %ebx, and list the
>>> register as clobbered.
>>>
>>> %r12 has been arranged to be the ist_exit signal, so add this as an input
>>> dependency and use it to identify when to issue a VERW.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> While looking technically okay, I still have a couple of remarks:
>>
>>> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
>>> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
>>> @@ -344,10 +344,12 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>>>   */
>>>  .macro SPEC_CTRL_EXIT_TO_XEN
>>>  /*
>>> - * Requires %r14=stack_end
>>> - * Clobbers %rax, %rcx, %rdx
>>> + * Requires %r12=ist_exit, %r14=stack_end
>>> + * Clobbers %rax, %rbx, %rcx, %rdx
>> While I'd generally be a little concerned of the growing dependency and
>> clobber lists, there being a single use site makes this pretty okay. The
>> macro invocation being immediately followed by RESTORE_ALL effectively
>> means we can clobber almost everything here.
>>
>> As to register usage and my comment on patch 5: There's no real need
>> to switch %rbx to %r14 there if I'm not mistaken
> 
> As said, it's about consistency of the helpers.

While I'm not entirely happy with this, ...

>>> @@ -367,8 +369,16 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>>>  
>>>  .L\@_skip_sc_msr:
>>>  
>>> -    /* TODO VERW */
>>> +    test %r12, %r12
>>> +    jz .L\@_skip_ist_exit
>>> +
>>> +    /* Logically DO_SPEC_CTRL_COND_VERW but without the %rsp=cpuinfo dependency */
>>> +    testb $SCF_verw, %bl
>>> +    jz .L\@_verw_skip
>>> +    verw STACK_CPUINFO_FIELD(verw_sel)(%r14)
>>> +.L\@_verw_skip:
>> Nit: .L\@_skip_verw would be more consistent with the other label names.
> 
> So it would.  I'll tweak.

... then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

