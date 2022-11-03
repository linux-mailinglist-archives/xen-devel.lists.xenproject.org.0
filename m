Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3169617950
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 10:02:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436167.690259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqW6n-0000Hx-Ig; Thu, 03 Nov 2022 09:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436167.690259; Thu, 03 Nov 2022 09:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqW6n-0000Fe-El; Thu, 03 Nov 2022 09:01:57 +0000
Received: by outflank-mailman (input) for mailman id 436167;
 Thu, 03 Nov 2022 09:01:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XZPm=3D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqW6l-0000FY-Dv
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 09:01:55 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20074.outbound.protection.outlook.com [40.107.2.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29687d57-5b56-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 10:01:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7475.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 09:01:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 09:01:52 +0000
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
X-Inumbo-ID: 29687d57-5b56-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBgiln3amo2L8I8aPZoSG5Xatbxt5VKPqtXOvHi4zuHpm7oU68XioWMWWRYSNYNLYc6uL7vE6A/Xxx1V76Wv29FhyRcucECLcscZ/KRAip2UwUUIcTg7pfSi1iwUAbOvcuaNwXAIrxZm/Rql77WQd2Ni0ywt/OOgow6owGPbowKqRz/5VnyAKbduA28xV/bXN6kfgt86lr3pK1wvyI7BDh/+evDfiE6OSGb/28FRMjrma2ZmRTDgIzGB1vmWqQaW7C3C/rctacn+YbF7Cm4xoRk8DECIjGChlX24RA3xaoYBlojBFxs1aChtuQT8hqtjKWCM/lJKHGod0ruXSsf8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyrQOpxCKpNSbhCdvuOVZUNZOlBP/ux2MXuEEX2JsJU=;
 b=NKU3vXYbWlUvXvIwd3TWpYLd7r2xah03xt5uUqqHqqXq7pq2Iz1ATP1fBo34VO0dddnNlgu9EPgw5dOzu2YCJuVFUQNxHRV2oUnOqqLZYJHogMbrHi8dfH5ws2ESuC0X1X2pb+kVVzvqtf0IxcwcHK2lwui/+yFXOpHLcvBQtTjR26t2B0MhHlaJB+EqRcCPlt4BGAJHS/O45mulGXX85tkSrZhCGV+mdzSzDOKxcExPxb9Xnj4kH9HA+xgUp4rEjM2Rl738JAs7beZUF2h7fL4WJMakl9rjvSrYtA4tEJzY2ji533HrQpYe7JIRdTCo0bdjwDXHRGs1PzXg1uB+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyrQOpxCKpNSbhCdvuOVZUNZOlBP/ux2MXuEEX2JsJU=;
 b=jH8RWQ7jTmwr91dEFh22KczUrOgmcb1ZzYsS8dEKNpodsGE7w160C0w2+XV9sUVCrIU4kQp3WoaPplHC6pW91nNVhABlPN+SP3bIJWiN9LA84nF5aNdTs8GJ6WxWgHr3JptQCce99giAfdDDkF7ZG6cW/DaU5GyhxuVKkR8psNMktaDLOHHYTHo0eXnJS5c4heeMOKrHf+m58pUv6L94/PZm7HMzzCLiUTcxy4NvGfElvoxXBs7EuiWCsSFXPJ7SrUeKxLm863fRkTKKct8eUvSZgwR5G3CZEH/FFjLImZaRC0ZNAcVXP3zK9/+rC88TOXrK5YNEHa9wNKgQK/PLwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <37c145b3-9667-200d-c13b-912f3d9b8a0f@suse.com>
Date: Thu, 3 Nov 2022 10:01:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v2.1 2/3] amd/virt_ssbd: set SSBD at vCPU context
 switch
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221028114913.88921-3-roger.pau@citrix.com>
 <20221029131258.95811-1-roger.pau@citrix.com>
 <198d04be-e7f2-dc11-18b7-ef3352d07b80@suse.com>
 <Y2KrF+0ns174JC7S@Air-de-Roger>
 <20869a2c-224e-698a-b927-96d6ad752b9a@suse.com>
 <Y2OBRg0cpVkgu1iP@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y2OBRg0cpVkgu1iP@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a60dff4-708a-4b6e-6089-08dabd7a0c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GCCqffV3mkEsrGVGN2SUnkQZ0pM7wXX/0SXeNt3eOu3BJocy7S8V21V/F9/Yjf3oGosIzJX327RCAfQt+sl6QpdaW3EZVmZhm1Z/GvqOpxoiZ2LLOwY+m1lIohE/ncNjpIu/WZ34ST/uMHyy76JtnF+8SY0cJVNqor8bm94vmR28oBrl/ARPzwsw7swD0wtIQKuyx9FkTkQeg8yYUL4hVG6XcAMuedusqyOPqXUy4e30pcLlt5iXaD6I0ClFas5qWXyQiAskgQd2PhyAnkEGsnu5Z4iXrBAb/OKE+tNT3I3XPPjQuittPzc2gipTLopQa6XUSii4uMAermkB0i/OkIQaqARmti9vFZAlyvIhGQEPlnn8BT2SJnvVpEdcdSn7X3DhCOZB5WMLYIIPs60qOYjd7kuc8juS44MqDMur8ULxipiZBXwthR3sBNQUvWI156ChpuDmP5us9vV3KgtdSXWhHQDAVLRR9cbzkgnAebsK3EaLJzP9GIJoNybHgi7BPSfc++1rlHN7+uQKcLdpPx6gwic8rk1lvUaBnz7sI7CPqw5yQP6yZDbLWoXiXdTM9UEru44NEo/Mka576I5uXK78rXTPzkwoze0V57XoPuFRrblskUWnvfUxiGf8T1iUsqzrXPDR+HxthLyK0ihgMffKOSfsWfJVCPG/96cG0ef9Z7Wvhw0+qgsbu7kUi/QNk6V1RZDV1uWfeBlcCUjtGnk3CQceAWS6+IFwr2n8S8I2Led82bXwXoqzQgiHA6Tp1YEQ/mT54selG2iC2RZmaaU1XJm8kg9H5QfyA9tQnqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199015)(186003)(6666004)(478600001)(36756003)(26005)(38100700002)(6512007)(6506007)(53546011)(2616005)(41300700001)(5660300002)(2906002)(8936002)(31686004)(31696002)(6486002)(8676002)(316002)(86362001)(66476007)(54906003)(4326008)(66556008)(66946007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3QzVngwSm1GSmVvN0JGOGM0dzV3YnFnd3BHejNPVFpRSnBYS0ZDVjlIRFVn?=
 =?utf-8?B?c1oxSS9DMUJtTFlTdFhFSzZPMFVCYnVzdERjdWloN2h0Z2ExanRJT042Vytl?=
 =?utf-8?B?VW1WS3c5L0J5MS9JR3ZFWjJZSXJTbEduVGl2SVhwSS9yZ1BOUkRZKytYV0E2?=
 =?utf-8?B?dUdFYlU2dG9vSzBaQXpuWGJwN1Y1NWFTWFRCOHg5cGxvMWExSXVkMlNaR2RJ?=
 =?utf-8?B?Q3BtM0xzNFlYNXVldDNoRVQ1dnc1Nkp4eHB2R3ZzQUI1WXpFbnpXbmJoMTU1?=
 =?utf-8?B?VVhmUFRPWTVTU3FLMEx5clZMV2dwNGlrSXVwQU96akVSYWI4SDhsWGNpUDJU?=
 =?utf-8?B?TEtDTDZDTnMrMStIN2piNEk3NFdVd2lvM003SEsweTRNTjdqMU8vTmRHUGR3?=
 =?utf-8?B?VE1sTjhVa2MvOWlGQW9lc1B0SzJ5bG5mTXZJL0o1UE9CMU8rY2gxamZhZElD?=
 =?utf-8?B?QXdzaVhXZWc2RmZ0TFB5S1U0L0x5ZEV2TElwUUl3Z3lodHg3SmJwdHMwVnBJ?=
 =?utf-8?B?Skx5S1hQTUNCeFNHM0EzcVFLV0NnQkFpd3NoZXEzT3JoTVdWVlpsVjVBYWVU?=
 =?utf-8?B?aUNlR0hkdENIWXY4TUxZWURkSGNwZWU3UVZKS3FCdTYvSEt4QVk4SVp3MU5G?=
 =?utf-8?B?QnhvMDcrWXlBbmtvMHpXTmpsN3lrM3ZYeGJTc2VxN3ZjU0JsQnFMQldiSXFx?=
 =?utf-8?B?V3pSZ0sxdGx1STVBRE1OeEtNclpEbEJWc3hFZXNQVlpWbVRuTm0vMnpKRTZI?=
 =?utf-8?B?ekh3QkZzY29CdVBTRFNidVZXcVFLdFJiRmVmbnkvUWRUUnlMUTBjYmt6a2Za?=
 =?utf-8?B?RDZLUkgrRnpQT2tVZ3VuSjZWSHNKTTY4aTVGbnYvKzJxWTVEVVI2QXNKUmJ5?=
 =?utf-8?B?V3hHUXdjSWZmUkp4ZlJuN1B2TGNRWWhrVmcrMHlCQnpKQVlBTzhKMHBja2E0?=
 =?utf-8?B?SFJZcDhvcHQ1SVMzRDhPM2gxQWYrUEFjMnBCbE12QmJ3cUFlNzVyUXRyVlJs?=
 =?utf-8?B?M2o1Y09oRkxSM3gwcjFiVFBuUFVaWWFNM2VMN1lCdk1rUTRPRjhtSENVTHVR?=
 =?utf-8?B?TDgwTHRCWlZ4ZXFXYldpU0ErZktlV3Q0Zy9jVEVmVGFWeWVHM05DWGRrVjMw?=
 =?utf-8?B?VUpzUG9XVHBYYWN0Z2xKZ3VwWHdPS1lISzRZQW5wSXhPeG5pYmE3bkNib01F?=
 =?utf-8?B?cU5iYTRxNmcwb21DRi9LR21QRWF0RU9xRVFjeUhPbS8wMDdGS1VzYWN2NGdV?=
 =?utf-8?B?ejVQblNvYXpoT2R1cUp1RitTZS9tV1ZsODhEV1o4TmJ3dDJuajdPaUtBdm8v?=
 =?utf-8?B?U2FzNnl0K01FdnhLa3FZR0xJeFZ1emY5VEhraU5KYklDdDZleGtQNks5TDc3?=
 =?utf-8?B?UkdQTDIvaEhYbTRqMW45NUpzRGlJVExKM3R5V1NDbW1PNEs2aEY0KysxaG9Y?=
 =?utf-8?B?cXdpZTJSMWNRbG93WXNtNzQ5SGNqYjlyVzFjYm1mS3U2U0tWZEFBOEpha0pW?=
 =?utf-8?B?T2lTUWdsbVYwbGZsYzhNQkhSd1ljVUdEOFlVV2ZkTGt1enJhNUc2RktLd05E?=
 =?utf-8?B?c1FXc3g0cWxIUXd1ejR2eXF6b0o5K2RmUXNJaXFUT0U2Y2hEWGxVbGdWYk9R?=
 =?utf-8?B?RVRjMHNVSjQ0SEdhd2luUmN0NG9mVWloellXdnd4dWt1akp0QkJ6dFVMa2dn?=
 =?utf-8?B?RDFsTy9xc3hPU1hUcHNpY1AxTmgwWjYwbUNjU3NUZXpQTThsSDFPVys2Q2F6?=
 =?utf-8?B?cVZ2T0dIS0ZUelk0ZktXaU5wWm96czI1NHZST0tBZ1Y0RXZJdmxIaEltVlRO?=
 =?utf-8?B?M1h3TUVnSjFSY0xybTkvL1JsZm45T3Z5dk5rcTh3V2EwL0tLVllUbmFHU3ZQ?=
 =?utf-8?B?TlZmTEltaGNvd1dXL2N4aENGK1pPOW93ZUhyUXhKbjU3S1dNUmpHb3RRT211?=
 =?utf-8?B?cEdTMTdEajJtUHliN0x0NmI5d1ZaNmllaWczVy9rTWZaRllISXNJWjVoTU56?=
 =?utf-8?B?MEdGSHNQZVRoMUFHU3FPL1BDaUN4Vmh6eWQyTUdmNVpyWUNEV2NNVHhuQ3dC?=
 =?utf-8?B?SjczTXNVWEdGckNxSzR4anFFc1pqZ1JReU5Tdkc2N21heVJtVlBHdUFIVnRy?=
 =?utf-8?Q?+EuxzHJHMStUj3nZy0JTmRLMe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a60dff4-708a-4b6e-6089-08dabd7a0c44
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 09:01:51.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhGIdAHZlvGygZBR5G+sKUp2L7BQ48A9O23Y79OnD713qOCjgfuK+jnoyZrWw96fZkPbciJHhRoRVpyHFuneow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7475

On 03.11.2022 09:52, Roger Pau Monné wrote:
> On Thu, Nov 03, 2022 at 09:09:41AM +0100, Jan Beulich wrote:
>> On 02.11.2022 18:38, Roger Pau Monné wrote:
>>> On Wed, Nov 02, 2022 at 12:49:17PM +0100, Jan Beulich wrote:
>>>> On 29.10.2022 15:12, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>>>> @@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
>>>>>  
>>>>>      /* Resume use of ISTs now that the host TR is reinstated. */
>>>>>      enable_each_ist(idt_tables[cpu]);
>>>>> +
>>>>> +    /*
>>>>> +     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
>>>>> +     * is already cleared by svm_vmexit_spec_ctrl.
>>>>> +     */
>>>>> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>>>>> +    {
>>>>> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
>>>>> +        amd_set_ssbd(false);
>>>>> +    }
>>>>>  }
>>>>
>>>> Aren't you potentially turning off SSBD here just to ...
>>>>
>>>>> @@ -1000,6 +1010,13 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
>>>>>  
>>>>>      if ( cpu_has_msr_tsc_aux )
>>>>>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
>>>>> +
>>>>> +    /* Load SSBD if set by the guest. */
>>>>> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>>>>> +    {
>>>>> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
>>>>> +        amd_set_ssbd(true);
>>>>> +    }
>>>>>  }
>>>>
>>>> ... turn it on here again? IOW wouldn't switching better be isolated to
>>>> just svm_ctxt_switch_to(), doing nothing if already in the intended mode?
>>>
>>> What if we switch from a HVM vCPU into a PV one?  AFAICT then
>>> svm_ctxt_switch_to() won't get called and we would be running the PV
>>> guest with the previous HVM domain SSBD selection.
>>
>> Would that be a problem? Or in other words: What is the intended behavior
>> for PV? PV domains can control SSBD via SPEC_CTRL (only), so all we need
>> to guarantee is that we respect their choice there.
> 
> If the hardware only supports non-architectural way (LS_CFG) or
> VIRT_SPEC_CTRL to set SSBD then PV guests won't be able to change the
> setting inherited from a previously running HVM guest. IMO it's fine
> to run Xen code with the guest selection of SSBD, but carrying such
> selection (ie: SSBD set) across guest context switches will be a too
> big penalty.

Hmm, perhaps. Question then is whether to better turn it off from
paravirt_ctxt_switch_to() (which would take care of the idle domain as
well, if we want it off there rather than considering the idle domain
as "Xen context"). Or, yet another option, don't use
*_ctxt_switch_{from,to}() at all but invoke it directly from
__context_switch().

Jan

