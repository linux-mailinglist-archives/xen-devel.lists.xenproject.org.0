Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7D3579DB6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 14:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370608.602438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDmjF-0003Vc-Di; Tue, 19 Jul 2022 12:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370608.602438; Tue, 19 Jul 2022 12:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDmjF-0003Sh-Ay; Tue, 19 Jul 2022 12:53:33 +0000
Received: by outflank-mailman (input) for mailman id 370608;
 Tue, 19 Jul 2022 12:53:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDmjD-0003Sb-Nm
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 12:53:31 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10057.outbound.protection.outlook.com [40.107.1.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca07b14a-0761-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 14:53:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2616.eurprd04.prod.outlook.com (2603:10a6:4:31::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 12:53:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 12:53:28 +0000
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
X-Inumbo-ID: ca07b14a-0761-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P15dvh59jvluHQxRDI3rjkgvf0EiZ41nIVOPkOcHLkvKpaDhFT1Ue0bLdr9hU+VU5l1PJs39N4NnM9GFkABtmLVj6FKaCh6KchXZue7vWKCe+ZYbLgua4UY4YobXy4JoZQSC61BW5gxUFqd31YZHArbpgVjNz9d3sK4SBQ2RnfwH1i2gEceKSwVR6wPaJ7YiFDC2PlqusVF3416Q+pJkJa7wjdTRDqL2uLXlflg4osjy7K9WDcRUkUoaLBzpjRXJUEv0OsMRubAn1+KVTsvjOGvuNFOl4nykjMlPVnjk+RtilJmgOmWSCcrg7GmqUGyM/lCubJraZ9RWD09SDMDSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OuOtTzcMNnCpavIiNSvQ3Ib7RtgMz/yJh8JQCqFvuE=;
 b=og1P3PtPfs5eTKyKXPAer047NI1QHix/RiB6n5cnhmdEiEH4ejI+4Qv2wEdtIn9PmdL8CtxpmUNsabg4HTrgpyCsAGRNOHkSht9NIOCTyQOqZbSCip4+tb6z4PoPEj/nNgiMHxe5Civ+AnU6o80Be+5gIpnRtRaIJezWQw+EpXz4aeQnnOr4y/I4aA4JLzIWl0jK+XDzAgYFIsLlp8isCretj8tto4y4irTnDrgmjKWIVwhTdhiBRrE/yJpMHhKR6E2C43sVKWOEYo4ivQmRfDSq9fXSxrr26bhK/ofAmJ7lSPi9m3oLph4wBmI1xyTlk5Fr1uBlMW9g59ANiKlZhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OuOtTzcMNnCpavIiNSvQ3Ib7RtgMz/yJh8JQCqFvuE=;
 b=a/QsM2zxGr5XG0kIcRJXu7ajXrDq9+Ho6nKbQy2RlMP2h4Aw3sIeBJgof1sxvWgp6TSRxo/odZRLBn0oV/ptpq7z+436I0DTy95R7712p7xQsYqapLz+f2mVg29I5nX2VNEGNMoRVGm/4x4AzJ4/c7cQzbdD116EbNE68t2rjn++CMgpeCjJf4FHM8KVOMCv7l8kRlKsH2/cLo83q17jMHODVTlTdPFQl+NxDfe9icLPyngIo8oiXCdRG4eJqU9rsqeQejrVUvTomju8VFVen4tWE1H2nipL+4lVCncHhWWzansD1hAEQ1eIkrHg5SLvxml3YqR1rzf9IwATFbz9XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <106dbb1f-1e47-ed64-44ed-94f5fc03290c@suse.com>
Date: Tue, 19 Jul 2022 14:53:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86: enable interrupts around dump_execstate()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <amc96@srcf.net>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
 <ff12f0df-a2c4-ae9b-b956-a602cc0bb844@srcf.net>
 <f0ca952c-1d44-56ab-6b81-6bba3fe1c016@suse.com>
 <70cefb48-ab0f-7a84-ed31-fa44c3135fff@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <70cefb48-ab0f-7a84-ed31-fa44c3135fff@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50c1e85e-7479-4a16-79e4-08da6985ad0e
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2616:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mcopo6zkwDZKlw3/IgPxfNht7cLqwUo7kuHE7EwfDCYCQpUrINxH6Ffh63eEjUG1ZkvWJdX/xOm0NN7boKFS2VyNY42itXIA7VA4Clryy3vQNm8IAeTPEQY4iXrjSk9JMk+AdHwDjrPfxFi9SAxf6T+Y6ED2gGsihFLqN4GjOt2krWytOo2IY9rn/lzUF/mg/0bLbxVpl1Dt4oXTy4gnLdDAh5+ccjx7+Wx62J4zE90pM5gym9BIES4dQwn0SiiOWCT1BYrR4Zos30tFNTncsqyrfhJ821NKNg0mdKf23B3Rp4d+YLG/VmoUSxBjG3m8+xuaFpjV3zEA5YHwByvYSfF7Isq0iTO294gxIJYa1H2XBMk6P1ugQmWRxopPp8jT7oawMJYtSN/J9/ExtdbmLJTN2pdHlsq1YW0iOly0EPDEXKKcsCqhmBVWxIcuLyHJeEQ2PNNXtyMx1cnqLC11LqYVkkDk0l+aGgq0jfoFYCOpvuf6ZGA8owPCAMtGU7dVZvLtJIWADfpPShITrq5A+2Z9djjkQeb4M0rOFUN6nOS2ber2W+Q1Qclx5RkoKkRrj+kjZTEGWZYIEtAY2Z4HLtlR3jHbnGncoa+0UALqw4fgc5lQ8afTvcMPtS4RbVAlS99BmIzO5wAMXM1bJS9Lmgq+ef1trRGLNGrJYxacF/+35V3gL7OUiMrcVajsgb/kVuUOsBLEjoSRRi6eCHkLobKRQp0tqlXGFz8Oz0q/mW8nHptFa+ox/jxnLQLAvde9l/82LTGrm8lLI5Nlse8vQwwSySM5tL7fu/Occavg0HVl5pAC8Cm7f79M9fEFAHaWfQSQYabjWEF3cvFFiq1Hvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(396003)(376002)(136003)(39860400002)(36756003)(6916009)(316002)(38100700002)(66556008)(66946007)(54906003)(4326008)(31686004)(66476007)(8676002)(2906002)(26005)(186003)(6512007)(41300700001)(83380400001)(478600001)(2616005)(5660300002)(31696002)(8936002)(6486002)(6506007)(53546011)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0xFU2JHUFc1eHJXZTc4TVo4SUNpZUg5ZXc4RExHdGduSWgreWRHd0YvR2hH?=
 =?utf-8?B?UHVmWDdjdW1kdmlxZnBqcHlDT2V6amNZcExtQW9EdktxTEpaQXdINFVyU3VY?=
 =?utf-8?B?RnJyUWVBa0ZSejg3b1JwN2RyZUtnV2VyalBueUcrdStneFF4RlRsNXAxSjE1?=
 =?utf-8?B?L1dmWmMwWE93NUxIVDBOKzl3YUVtUjVQcmY3OUhleTNEVnI4WTJ4TzBsZFkv?=
 =?utf-8?B?amlnRGUrVUxwSGhqa1hOUHFUWjVibURpL2d2QkVOeVBwU3lZYk9pN2lXdHYv?=
 =?utf-8?B?d01sU29Oc0hVTENwQnpoQXRYVmpPQkk1K3Q5L1djbWt2dDQ3d0RSWDd0aGE5?=
 =?utf-8?B?aXk4bE9xcVRUUUIwV0lsdUxzNUVXWENJem5yWVN2OXlrRTFnbkpsazgvUldN?=
 =?utf-8?B?ZkxWemhaSm1hQVNYSCtMTzI0OEZac2FoTVdEVnM2bTA4OE42WlJYdzhDdmhZ?=
 =?utf-8?B?MGRxMTZNaDVlamZEVXR1QnBWcFZVYUtjNHZOS1IxYTlhQ2xBU2MwWlpyb0ts?=
 =?utf-8?B?dVZuTnFyY1VhQlJ0NkNxTThxcGlXQ2VkcDZqaXhjYWFwUGhUQ3QreEdXQjZL?=
 =?utf-8?B?S0ZEK1Y2OU15OWxLQ2FLc1NMVUQyMzVOQS9NWHRRRUJtWTVsajJHNldra2Nu?=
 =?utf-8?B?clI1L0hEOEpJYzRZOUNwUm5vQnYvdTAwaGR6VmlxMnlLWFluYnVLYUQvcnBI?=
 =?utf-8?B?YlFqRFVSRnhrejZKWnhwNEpKbWV4NnI3ZDRQNlJYZC9Eb09EVnEzZ0xBY3h5?=
 =?utf-8?B?dGd3RUFBVkx3QmorVTJWMVpSaGdIRko2RHZlSG9oNDZPZVpzaC9ucHNjOWFu?=
 =?utf-8?B?ZE8yM0pleWhaTzlkYVZQVUswZHZ2MGdUQXVvbkZkMVp4QmhpTit5b2tWR25J?=
 =?utf-8?B?KzJXOFdhU2trVkpUNzlja29uajNMZ3Y1a3pXVWlEWmN1MkhKZWZkTmpXN1Jp?=
 =?utf-8?B?R01ocGtPalo4UndpY2FPRTJjMjdNdVlKYnlCZWxhSmJhclIybE9iWEZ2aFE3?=
 =?utf-8?B?V2VwRjk4dkNZWUdSTXlHVXRlRlEvUnVzS0ZjMWt3R28wZ1RUbkVnYVR3a3lY?=
 =?utf-8?B?QnZIN2c2SWJuaXIzZWpIQisxbnExc3pvdnZMWkllWlpnVVltNCs4UTQ4RnNj?=
 =?utf-8?B?RDR2L1BlTzRVRGVmSmZrbGhhQU5tNFB4OGVBd3p4Qjg4Lzh3OHlKbnQ0a2xH?=
 =?utf-8?B?WEdDMk8vcFB2QmJwMjFqbU1RZGpvUm1VTElYelpJbWFSaVhOVFM4dVR6ZnRj?=
 =?utf-8?B?TittSTVEdS9aak5hb3hUSkMzVkthdG0xRnR5NiswcG1abGtGeGhxemhHMGlk?=
 =?utf-8?B?Rkdmd3YrVEI1d3AxOHB4aHNvWm8xM3hocjV6N25yRkY3Skc4K0x5NVVja0I5?=
 =?utf-8?B?TlRMdW9FZUQwMkNCUW4wZ1BIZ2xIZzZRcU9BdVNuc3ZZZWp0THhRQ1pxWDAw?=
 =?utf-8?B?Q0t3OWZuaisvSUdSYzZkQVdQZHh6WUE2UkkyRXNhZFgxdWlnREFBazRCdzQx?=
 =?utf-8?B?aHRpaU5sU3BaNTFzZ0U3cGlKRXl4QkY0RzNseVFaWWZLRktGcGlpUHN0cUwv?=
 =?utf-8?B?bnRMRmNoNkxUdWtHUkxHY05VUGxwZGlwQW1DY2FzSUhIektXMG9LTHJaSk1V?=
 =?utf-8?B?Vll2SHc3OURTcUxuOTEvak9hSjZtL3ZIelhvL201OGpZZFpzWmtCS04zdk1k?=
 =?utf-8?B?TEpHY3R1Q0Zaa3QzenVHTW1YbWd2RVZkZzBwQWs2YlR0dCs3eDhpdHp1Kyts?=
 =?utf-8?B?N0dwQXVoRmZXMWpqVDNZYVJDMUlPRVArOUovc2JHT3ozaHF3TEhLUzBtWmtM?=
 =?utf-8?B?ZEg4T1VuT0ZVQlFMSDV1cmZOaGxjNjJuV09GZ21jaUgzWEhPd2l0bGlHLzV2?=
 =?utf-8?B?MlRIV25pc2E4T3hPTmRCYnQ5a2dRWUlIdnBrMkw4OWNXM081MlllV2ZhcUJ4?=
 =?utf-8?B?eUI3NGFOb2QyLzhISlVEcFVtTTFlZ3BYNWNFazlSa0xTSW9mVHFESWV0UStr?=
 =?utf-8?B?eTdBbkdZakl3UlA4ajhPUno1U3A5ejc1dnFRMWlUVnpvZGFxcmprU3NvZmZL?=
 =?utf-8?B?T2xZUTloUlRsR21KTUJpWWRveVk5RmRlT0duNjNyaGROZ0tuVk40dE9lQkts?=
 =?utf-8?Q?x9R0sSJ5pq9VYpIdWaTbEeqmL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c1e85e-7479-4a16-79e4-08da6985ad0e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 12:53:28.2414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEJce9DUgFCrN5Qqau+1ED5isSfg/vWojLtNC/s+8rJ2s7aAjQ0T3xz4TXQu7uvfp0ESHJ6/ZpNAuutRBcNsxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2616

On 19.07.2022 13:22, Andrew Cooper wrote:
> On 16/12/2021 13:33, Jan Beulich wrote:
>> On 16.12.2021 12:54, Andrew Cooper wrote:
>>> On 13/12/2021 15:12, Jan Beulich wrote:
>>>> show_hvm_stack() requires interrupts to be enabled to avoids triggering
>>>> the consistency check in check_lock() for the p2m lock. To do so in
>>>> spurious_interrupt() requires adding reentrancy protection / handling
>>>> there.
>>>>
>>>> Fixes: adb715db698b ("x86/HVM: also dump stacks from show_execution_state()")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> The obvious (but imo undesirable) alternative is to suppress the call to
>>>> show_hvm_stack() when interrupts are disabled.
>>> show_execution_state() need to work in any context including the #DF
>>> handler,
>> Why? There's no show_execution_state() on that path.
> 
> Yes there is - it's reachable from any BUG().

"That path" was really referring to you mentioning #DF.

> It's also reachable on the NMI path via fatal_trap().
> 
> Talking of, didn't you say you'd found an unexplained deadlock with NMI
> handling... ?

Entirely unrelated to this, but yes.

>>> and
>>>
>>>     /*
>>>      * Stop interleaving prevention: The necessary P2M lookups
>>>      * involve locking, which has to occur with IRQs enabled.
>>>      */
>>>     console_unlock_recursive_irqrestore(flags);
>>>     
>>>     show_hvm_stack(curr, regs);
>>>
>>> is looking distinctly dodgy...
>> Well, yes, it does.
> 
> Because it is.
> 
> You cannot enable interrupts here, because you have no clue if it safe
> to do so.

We're not enabling interrupts here (if "here" is referring to the
quoted piece of code), we're merely restoring them. When they were
off before, they will continue to be off. (In that light calling
show_hvm_stack() is then still wrong in that case.)

If, otoh, you're talking about what the patch is doing, then
we're in an IRQ handler, so context outside of the IRQ must have
had IRQs enabled.

> What you are doing is creating yet another instance of the broken
> pattern we already have with shutdown trying to move itself to CPU0,
> that occasionally explodes in the middle of a context switch.
> 
> Furthermore show_execution_state() it is already broken for any path
> where interrupts are already disabled, including but not limited to the
> one you've found here.
> 
> adb715db698bc8ec3b88c24eb88b21e9da5b6c07 is broken and needs reverting.

Well, okay - but what's the plan then to achieve the intended
functionality?

The suggested alternative with the patch submission (to skip
show_hvm_stack() when IRQs are off) is probably necessary anyway
due to above observation (if we wouldn't outright revert), but
won't get us very far.

Jan

