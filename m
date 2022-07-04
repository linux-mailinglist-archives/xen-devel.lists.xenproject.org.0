Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D76564D98
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 08:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359748.589078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8FMe-0007SX-BI; Mon, 04 Jul 2022 06:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359748.589078; Mon, 04 Jul 2022 06:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8FMe-0007PL-8V; Mon, 04 Jul 2022 06:15:20 +0000
Received: by outflank-mailman (input) for mailman id 359748;
 Mon, 04 Jul 2022 06:15:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8FMd-0007PF-Fj
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 06:15:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac7adf2f-fb60-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 08:15:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6694.eurprd04.prod.outlook.com (2603:10a6:20b:ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 06:15:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 06:15:15 +0000
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
X-Inumbo-ID: ac7adf2f-fb60-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQsTCmDeWck8lD+b0rtFdXfpGNMKZiY3cN915l/BF91PBSnWMuQ4W634Yvkb8G8SHT5iIpevOgbhxEEqn5akrpMKTxVNxhBRBfJd7DB6GUjc0QUSj+TdHT8uk9jVr6t88sg0SXO8jAWY5+HBEqF29TgkxWn8NqJXHVL4/lzzZYkTp2AWzaz9DVxeRvlrJc2+ZOy2K8NVfl470hsid7Hwg7zhKMWzYj+KLd3zaJdQMoYSyyUoNcvK3+TnI0CnDoPfovFdI2gnkrH4Yc0D1gsdTUE1HcLjD3wlG4euVzFdIm6qqTunK/IqTMkpEHskeCAhwQN+TgW79SoPKWKJ7qUIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK4br+Nr/bcZxNQjDktySlxVYRv6TZPLiwPmkS+4WZg=;
 b=bGvgxjR4x+ocK+SEYXxRXkTSQmAp0+ZWu1wzYfWY9BReBuGtEOVDKDO2AgeI+uNjZk69IhbEaN4KbXewBLqLBTu14njQKGC0BlQ+8dTondSTfYvZHlrxny7fPmub299rcW8X0vJVRDMsToAmEWrI8OEN3VVczLZo8hatKwu1hWHdC54IbYKQPGI8R1rWyntY2KUwZCGfldawk97Ps5HdbOjNsKegaIFWIesBkcbpvPHP23shv7Z4PjERFEwJ/C7IWHmxj6cxTa4p6EXWxAtXOgVkrnHNHOWQlMyrU6d2OfMzNO0g782z8HF37nnPUxwgsRXsVIqoPgGfNyb//Ra/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK4br+Nr/bcZxNQjDktySlxVYRv6TZPLiwPmkS+4WZg=;
 b=5p/7JlerZPjXHMAaKbqmfAO2O21IVHXXsitcESuji90NmIxJxni4XvTGI7Od/MV4/UXg+XA0B5bjkI58NslwfoNO9Ms/XjLJCT5CtM87XpwZcwtNq8jKwvmHMay4MtIotMmfWyChHsooAwnqaIalbYTZkx856zs+mLDT8Qy7JB7ayL2cByd5O9zzoz1So1Ark0C19SaUW4CcWbloIYCTaMvdWRBUFKsoZWneA0qS1dF7EBSzdJ4nrYyAIX1ZGirxpJuiRHNcJP0J5Mkzz3y9J1olBCku/X6UocCuceSxeunBJAjg+1WvdTG9OTBvOvFQYCQofm3WluZ+yBf8VdE7sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9db996bc-cdeb-37ce-9e98-ca199d42a494@suse.com>
Date: Mon, 4 Jul 2022 08:15:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] x86/lbr: enable hypervisor LER with arch LBR
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-3-roger.pau@citrix.com>
 <4a193fd4-deb3-12c3-2faf-eed33e7b52af@suse.com>
 <Yr8VH8EUahBV0p7B@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yr8VH8EUahBV0p7B@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0080.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ceff67a-dde2-4fb4-97d9-08da5d848fb6
X-MS-TrafficTypeDiagnostic: AM6PR04MB6694:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0EniuIiOJfJBxOCzLDym4Z+IRn+vtOF2d+onzJQfo2ZTejNcVlZcdSyVS4QpPUDd2zOE/KPCHePoBcEPevvc46sZ7w8za/8HRAsYrJgE8OfciQ2VuOQeO6vYTvDlJkTbTRfGkQC3smyWGuasvDmolfDR+4wKF90+3s01JGlb+77j/GDFJH+ZHDLgQqUWzyqPbbP7UV8J0O7ygPqlbYPpt74NsXYpXGgybsOGJ4xGkPDIwnpjBoAYSN+lBaOam+uJVbKLEM5v4fsEWghf27WBpSoBzXPvA3b2CCSqvwkSTwWVqnBm2kug/7+L/yutsDYrYcRKAYyKWqN10zAJiVVa/Tst3vxy58g8SroSsxrQCO9J220m94H21k+7wZkcj7Hz7DedrqTwr2dyKLWoebqCnIFENTG8cVamDItfCuNQv6su2T5ewq3SigOoCEkD/tPqsDPTeQvb3pwVeLGN7nXJTHTBsdvfGvwRhJqS1g1PFHIR95DFx/zPWUhgXCZSTI2x/33om2r0qrDcaDSkoYc3/GRjyDiUO8R+Qs/mVqDetTGVW12+IcVIVYJQ+SXxpa3F5PwenwxrB1YwdRr6XvHuVe2VregxTEvGfTlLRx4RXr4knV7c6y1HGyKndukahiVehxHKrqvwb0qtWB1NGiq9+A5It4ZIVGvYClAiaw/0+2FKCBc2KUyv2XfepMUzf7t3l8oxXBm/seHqXEbGPGB7dheBqTiiDUWosniweLfcqw/ThzkprhrvLDyt7iT6O7bJs6v8LbQW+2lyob4J7LPEZq3WBMIiXOI5ERirxYosnioCBGA05J0acL4SvEBnfWtY2Ac+PMqSBo/2471U8BUFXlQnQ3WzcHqjHG0QqwnwoNI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(136003)(396003)(39860400002)(6506007)(53546011)(8936002)(5660300002)(6486002)(478600001)(2906002)(83380400001)(316002)(186003)(86362001)(36756003)(31686004)(2616005)(54906003)(41300700001)(6916009)(38100700002)(26005)(6512007)(31696002)(66476007)(66556008)(66946007)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjBTZzZZbW0rRS9HbDgvMGkvMjBqcVdQTUQzUzdKcXRmdG1ScSt5WW9DUmxD?=
 =?utf-8?B?OUpsU3NHQnRhZzJnMEZSWFphODg2MzY5VDdmaUdTRlNLTVNveXlKelFscnIr?=
 =?utf-8?B?NStndnpnS1hUZUhaeWZ0LzhrekRpbjhVTFlrRExRRThsbXhydzk3Q1o3WmE3?=
 =?utf-8?B?eWFJUDFUWDhqZ1lKVTQ5TVVzNHpBUGxieGYzR1JsL1M1WEVEOEN0a1didzYy?=
 =?utf-8?B?UEdMdFhabDg4clRBVVZxczIzSHBnQ0VSRys4MWg0REw4d3NjcGF5U3FFVmFz?=
 =?utf-8?B?R3Vqc3hTOW9MaDhYRnpVT1RxQmdvaGhJb0pyMkZ1TmNnbnNXK1ZoYUtwOGEy?=
 =?utf-8?B?TEJuNnN5cWtrbXJ4UWxPZEhmT201aXZ3MzFJRkJJUlZHNjM3eXNEbW03dXov?=
 =?utf-8?B?MFRzR21uR01zbGFFY0FpOUNlY1ZtYjNoaVdQSWlGZ0ZJSFROZWVING9jVXhC?=
 =?utf-8?B?SUN4bVRMUWdWNktVSGlPUzZENHRsWmZ1UjN3OUhESmVKNS8ydUFFblljdHl6?=
 =?utf-8?B?bDdNV0w1UEczY2ZXMFhnUDFMYzFRS1luZlEzOWxwcWNvL1FkZjFVbjVoS2lv?=
 =?utf-8?B?TUU4dVVyQ2t3SHNPQzY4MDYrNTVKRkQwbGxiQ2xIQUJUdEk0RzdKRUNRemcr?=
 =?utf-8?B?VzZudmJ0ZlpFamM0QlYvSVpGZHhrZ1UyTjRreDl1bVdBZlJhdXRNb2IyTHps?=
 =?utf-8?B?TnJpMEM0aGhxYzhQYTV5VEJBOVV5K0h5T3gwd2VPZmN0Uk1lYUNFTjRYdHE0?=
 =?utf-8?B?eGFOM0dIT1pKcTdHb3FhNkFJL2Y5Q1dmSFlWblRPaUxpeU83c2VndHNIbXpj?=
 =?utf-8?B?dVRkR0dJRlRlWEJCZkxRckRmRm5VOW9aTHlDMWU3WEo5SW1qdnl4NWtNM1R5?=
 =?utf-8?B?Z1hZUEU0U3M5RGdNek91am9RZjcyWjQ0anh1R3lVYTdsRDVscEJGc3NtRFM0?=
 =?utf-8?B?M0M0OFcxRTM1V011ZUs1Yzd1NDVweE5qb0FTak1ra1VLOHQxaFM3UjNxaUYy?=
 =?utf-8?B?NGsyZElkaGZsUzZ6UjFaWE9HLzYvamVxZll0Nlg5Ni9NbkRoeUZyWkdLV1hO?=
 =?utf-8?B?WWtVN3JtbkhuMXhjYTEzMlZJSHFmYVpRZ2w0UEIwNmV3UjdWMnRSYkx0dG1s?=
 =?utf-8?B?TU8yZFdmeXc4OFE4eEpMR1Fsa2d4WlhCYzdrRlhWdlVWMmp4aCtHckhrREV5?=
 =?utf-8?B?QWN2OWpBQVRPbUU4UU9ORERtVkNkbTg4QTQyb1g5WWhPU3REN0NhRC9hYjh2?=
 =?utf-8?B?alpra3RDZVlNUGlzeW4wYXl0M012bmZtc3RmL2l2dlBCYyt2Ulc0Y0tXb1BV?=
 =?utf-8?B?QmFYOUI2WUhYY1ZQTDRpQ1NYUWJPeWZZS1RPOXZSaHQycTVMUkc2TkYzMWZn?=
 =?utf-8?B?ekkvVVRFY2VIb2xPM2NEeFh0ZUl2eUVkdmEveXcrWjNRU3pYSUhkelBTT2s0?=
 =?utf-8?B?akxRRWx4VjZ3bmpobzZRUDJHalJlcjNCUFBWa2MvUHJaRG5CNUVjb3Z3L3BU?=
 =?utf-8?B?UExLSjRtVlQwRW51NEdNMTFDcHNINHViYWdwdnAvenM1YVhJZnRyYlpSOVh0?=
 =?utf-8?B?WDBFN0lRSkwyc2hYamMzTG5MUmRGUE5BcW83RTJsbEwxVUc2TW92eVViRlF1?=
 =?utf-8?B?a1JxdWd2dVM5TWJ0YXJVdyt2TW1GWEV4c3pvdzVWaUxZRi9rLytIdWN4eTRm?=
 =?utf-8?B?dkhDbUJXQkF6SCtmL1MwdFBFUlZSdUlFWjFuRW1IeVY4Q1RPSEFLWmE2L2hZ?=
 =?utf-8?B?cjlNNm9BRW05ZG1iVFR3akdDY3Z3Y1Z1VlRqenVta0M2M3o1T2NLaHN3TUdF?=
 =?utf-8?B?VHdxdWNTZC80aDFmcXlLK01RY3hVdkNpSy9nWmZYQnA5bDQ1L1NEU00zb2R6?=
 =?utf-8?B?Y3BrdnN2MlFPOStmMXRpZ0R1RFJabUtVbFB3eENQRUIyK09uaGJnK0RBOEtr?=
 =?utf-8?B?dUlSYU91RnJMOXdZU1RUM2xmWTdGcW9TMjN4Q2pPbDhHRTR4R1ZGcXNrRXIx?=
 =?utf-8?B?WlRyajRmYk1iUjJEVUtpS2RpWHJxQnhJS0YrK0VmR1VGYVE4Y2JjUUd1R01z?=
 =?utf-8?B?cFVudEdKNWhXZFVSUlJKdFl2ckgrazB2Nk8rRWtjRlgvRUd6aFQrMlFLWDhw?=
 =?utf-8?Q?ZZQqOcjm3kC895M5JWbGuRtqG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ceff67a-dde2-4fb4-97d9-08da5d848fb6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 06:15:15.5927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: au4Xj6v4JZlqrNSWgiXFMdo97c56hFj+ombiW0vqj+k6P1X8am0oA5Y2cn6vF45L2YilnPkr78cjupCDoBErpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6694

On 01.07.2022 17:39, Roger Pau Monné wrote:
> On Mon, May 30, 2022 at 05:31:18PM +0200, Jan Beulich wrote:
>> On 20.05.2022 15:37, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/include/asm/msr-index.h
>>> +++ b/xen/arch/x86/include/asm/msr-index.h
>>> @@ -139,6 +139,24 @@
>>>  #define  PASID_PASID_MASK                   0x000fffff
>>>  #define  PASID_VALID                        (_AC(1, ULL) << 31)
>>>  
>>> +#define MSR_ARCH_LBR_CTL                    0x000014ce
>>> +#define  ARCH_LBR_CTL_LBREN                 (_AC(1, ULL) <<  0)
>>> +#define  ARCH_LBR_CTL_OS                    (_AC(1, ULL) <<  1)
>>
>> Bits 2 and 3 also have meaning (USR and CALL_STACK) according to
>> ISE version 44. If it was intentional that you omitted those
>> (perhaps you intended to add only the bits you actually use right
>> away), it would have been nice if you said so in the description.
> 
> Yes, I've only added the bits used.  I could add all if that's better.

Personally I'd slightly prefer if you added all. But if you don't, which
is also okay, please make this explicit in the description.

>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -1963,6 +1963,29 @@ void do_device_not_available(struct cpu_user_regs *regs)
>>>  #endif
>>>  }
>>>  
>>> +static bool enable_lbr(void)
>>> +{
>>> +    uint64_t debugctl;
>>> +
>>> +    wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
>>> +    rdmsrl(MSR_IA32_DEBUGCTLMSR, debugctl);
>>> +    if ( !(debugctl & IA32_DEBUGCTLMSR_LBR) )
>>> +    {
>>> +        /*
>>> +         * CPUs with no model-specific LBRs always return DEBUGCTLMSR.LBR
>>> +         * == 0, attempt to set arch LBR if available.
>>> +         */
>>> +        if ( !boot_cpu_has(X86_FEATURE_ARCH_LBR) )
>>> +            return false;
>>> +
>>> +        /* Note that LASTINT{FROMIP,TOIP} matches LER_{FROM_IP,TO_IP} */
>>> +        wrmsrl(MSR_ARCH_LBR_CTL, ARCH_LBR_CTL_LBREN | ARCH_LBR_CTL_OS |
>>> +                                 ARCH_LBR_CTL_RECORD_ALL);
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>
>> Would it make sense to try architectural LBRs first?
> 
> I didn't want to change behavior for existing platforms that have
> both architectural and model specific LBRs.

Are there such platforms? While it may not be said explicitly, so far
I took it that the LBR format indicator being 0x3f was connected to
arch LBR being available.

>> As there's no good place to ask the VMX-related question, it needs to
>> go here: Aiui with this patch in place VMX guests will be run with
>> Xen's choice of LBR_CTL. That's different from DebugCtl, which - being
>> part of the VMCS - would be loaded by the CPU. Such a difference, if
>> intended, would imo again want pointing out in the description.
> 
> LBR_CTL will only be set by Xen when the CPU only supports
> architectural LBRs (no model specific LBR support at all), and in that
> case LBR support won't be exposed to guests, as the ARCH_LBR CPUID is
> not exposed, neither are guests allowed access to ARCH_LBR_CTL.
> 
> Note that in such scenario also setting DebugCtl.LBR has not effect, as
> there's no model specific LBR support, and the hardware will just
> ignore the bit.  Also none of the LBR MSRs are exposed to guests
> either.

My question wasn't about guest support, but about us (perhaps mistakenly)
running guest code with the Xen setting in place. It cannot be excluded
that running with LBR enabled has a performance impact, after all.

> I can try to clarify all the above in the commit message.

Thanks.

Jan

