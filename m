Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B1F771C6A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 10:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577838.904893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvmL-0002mx-UH; Mon, 07 Aug 2023 08:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577838.904893; Mon, 07 Aug 2023 08:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvmL-0002k6-RZ; Mon, 07 Aug 2023 08:39:53 +0000
Received: by outflank-mailman (input) for mailman id 577838;
 Mon, 07 Aug 2023 08:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSvmJ-0002k0-IS
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 08:39:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8be070c-34fd-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 10:39:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9757.eurprd04.prod.outlook.com (2603:10a6:150:115::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 08:39:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 08:39:47 +0000
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
X-Inumbo-ID: f8be070c-34fd-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8sX5dJS+8hSYFNu+XjJihwHzTwsxP6PX2i9vobsi+3BbWoSbY481VtvEf10SqqlNL5fG4isgzCrTyqfwn+P6wlcFiCsZyYx82Ub4oeQnmt0IBl3Q+VX0V1WR+z371oOd11zY9qjTSEzeLVFD8J+R09N8siYD3iIXFrktynBgPf02LQ8rP6OPC8OhFVxB3E+RA4LOyB4yagpgWvWRS9uWl8G1HlkGW8Xt9LnpAu+4PuRk4OfCDWQyjFvhUd7EKKFRCoDHQNHpbzOO1ppLtlhdndpbhaY+abdrDAxPjbFjydZFy7ZLVIp3LoL9EOETLaB76J4tfPn05UaUGfHrqkDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BetuNzSp2Y+3FGO/V6r0vGB3agsN6xV6iitkX9zLS0=;
 b=SNVjSR2hatfA1shlhFG6Qv4VcRI0ZsVJB+xJkwJE6lWseJpvNAD2WLo30ZMigxZZTvOeG0eW3rfvGPxdEnV0zrqYpIMjzZtkNXRp7z0Ho2+jTmKQyS+5jqHA/1o+GXtgTYig66rfQnWNAq3WxAQaZ7tpBjhcnqJQzpy/2OWgDGBTCP48mUCGkJOg5V/9mUSizZebtGMDH/ITxn3Q5pihUubqyHA0CFjr/x5hpHZQJ2W2uY+iJbAdVjCEoZ6/V8ssacxn492j0IOWITOUVFaPh7UZxzBkUllK2P071nMclbVow2oOq+dTo4cIFLPe20S8Ch5Q1vS14PCYATgodXSM0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BetuNzSp2Y+3FGO/V6r0vGB3agsN6xV6iitkX9zLS0=;
 b=ga8xq67HI6D70+LVvlWze4U4b89lflYnxVN96pNXTJA6vrlSS38d20UIuwGMwrEjmQ+LI7dHh83Xq6cD0Rq6WHeERSXF2Igw+agof0v0zWQSN4v4c50fLO2sppgr8F2Q6wAZHGbO+KXH7ZcaqY1sjKf8XVqcB4MPwd3dNZ5wFUm9eSiioJpDF1+uGWxv0Pk1ETkM1yIQSy/giW58wWdxccHNsBf4/WS4Yybcqn7xXX1exdrm357RBVIVqfKGQYjCjWo8WaWNQd1fiJxTdDzMrggriR3n5IhwaFGovQpOwumRfBUQMZaFuJm6rrFQD2McW41B/qFB/NVs5h9nFawFqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d01574a2-962f-20a5-281f-7672a06b5f10@suse.com>
Date: Mon, 7 Aug 2023 10:39:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [Xen-devel] [PATCH v2 04/23] x86: Don't use potentially incorrect
 CPUID values for topology information
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Jan_H=2e_Sch=c3=b6nherr?= <jschoenh@amazon.de>,
 Matt Wilson <msw@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amzn.com>,
 xen-devel@lists.xenproject.org
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-5-git-send-email-aliguori@amzn.com>
 <df21a319-b8a4-bb14-ac43-20035d04d4a2@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <df21a319-b8a4-bb14-ac43-20035d04d4a2@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9757:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e33042d-3e0a-429b-b8f6-08db9721db65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WFO5m9RLcSkW6jbsucfa0Mia98wWzkz/JR2Q+uPW0wsMWjLVFKF4Dg2THYK641nj7kPvsnL/EDPTo8/knNMI1FZIiAVG9HvGTWQi/9gK4wveTcnpY56bmvpur+gyN4RI78v+UDTkDqDTWHpLJ8IRJR7DS9tddSGb1tmsSA5qmgEjlWln692c1wkRLbn/tQ444VQ+jlM/YD6vXsFgI5UaPwCUiKZEvt953mKsALOKqHdA6fNmSCJnWZusW5rkdS/NF6tg+dF7IpmATISNk59H5O8cNP0VupP2Lj7XR0Mrv8U6vZGcWIgWECyMAr8qhIy5Tdvf47MXVIjJRHH6VouPGFEWmlXlZBo/T/6e3zxjP5CtgOvAX2BAXL4Z+SnRnHvvt5esqlCdgkNu5ffJ4gohWJfYDp/Eweo5OKMsXj6pnq0fpxBYjcQqIN97oObMgsM8lN0vrZe5MPCYZNnAAM1vZhCC2Hyt6/rohwhk6pjKavczIqo+OhGOgut9Ttx5OmWnevFcMxv0lw/3FmYi2WJwwjom2QUomg6oRaW0U238pe8813Qer+r6PfhzMasHKOXcaKJ4atns57HRPqDOkF8V6zzz6XYaQrvc8DWAvouPUmJfab8MQklm4nK4DLTv3ACAxrvTBvenSR/g16Cy7tQ01Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(186006)(1800799003)(86362001)(31696002)(41300700001)(478600001)(53546011)(6506007)(8676002)(8936002)(26005)(7416002)(38100700002)(6486002)(66574015)(2616005)(5660300002)(83380400001)(36756003)(2906002)(54906003)(31686004)(316002)(66556008)(66476007)(66946007)(6916009)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXdjNkVCZDZGOG1rUVJSMHlrYTIrNlA1bzNEMkVQOEZEZGNpMXE4QlFQV3l5?=
 =?utf-8?B?ZThyMjVRd0pvaDNpOWJ0YWl5aDdLYkpNVDJHNG85QTgxNWlnYnFER1N0bDgr?=
 =?utf-8?B?bk1wdmIzTTVVampJUThneU9FcXdtcHd1WC9WeWdSNkV2cTFhUGs5R01hdVVF?=
 =?utf-8?B?NEdvU1pWQ0VzOWFVUUk0dndZSURmaVJlRFhyM3k1ZGdVbFdGdG9zdSs5eEsv?=
 =?utf-8?B?Z2M1WTFiN3FObEhmL0FnUFg3N2xYWkxPbUFmcXl1cE9VOEVSamJiMlJZSDZQ?=
 =?utf-8?B?NmNxaHRvRGltR3E3R0h2M2pLczhVMzczcFB6TUh1SkVTczFwckxKTXpVSFJW?=
 =?utf-8?B?VWtwYzZHeWhCT3BRY0t1Tm1jRDRVSE9WbytVb2E1a2pJRUFTTTJsNjdmUHdk?=
 =?utf-8?B?NnVKRjg2YzE1UkEzQkhEbnoxaVNiMmx1Y3FCMGtSSUh6TDF3RERrZzBCcU1K?=
 =?utf-8?B?R3Y2YmtlQ1lVTHVGN2s5QUllS1ZzS3I4VFdaamF6N1J2UVhZMGZrVG5IUkJl?=
 =?utf-8?B?MnorWCsxai8vUUJEOFZFYzN0SUZCaGtJSGtZdVh0NlNZTzR4UXVzeUJjblAx?=
 =?utf-8?B?T2NRUmhBa012TWFtUXRidkhyRlE1MmpOZjlMdG11MXllSjFnK05iVWR4WTcz?=
 =?utf-8?B?N0xvZC8zWmdNMXNabkN0ODRMbmZhUzBjaGFXeGFSb2xrVnJhMHdIRlA0MllF?=
 =?utf-8?B?MmMwbzkvSnhFbTNzTU5UVzVkNDJwWVMvL3NTN3ZjSTd6SWcyTlVIcUs4bzY1?=
 =?utf-8?B?aTVvWWFRSVBCRldtSFIzbjdWdjhDQ0VJS0k0ZEwyd2ZYSGUvN2t4N1VIRUNq?=
 =?utf-8?B?TjI5NVJ1SkVCazFLTGZPWkR1SE5RNGFPeWMzOGlwK1pYclJTSi9BQ3NMNXND?=
 =?utf-8?B?Vmg1OWUvNkM5SE5xdnFLSVN1WXR4S0JkaUtJa0xsdHZRdWs1S2RXNmxKcXhj?=
 =?utf-8?B?Zk43U1Bva2JBVjI0Vm1hYzlBZDBJUStMUkkzcVpoRHZaYlVxMjdpL0JOUTgv?=
 =?utf-8?B?OVAyUGdNY25YcDRsZ2ZCczFxaXJud3BzRkwyZUliKzQwWGdpdUxIVEVZRkE5?=
 =?utf-8?B?MnVaT1V4ZHQ4MXlEc1g0QXh0Yk9scHBPNVQzcDhHek5hejE3ZEt5ei9VTWVF?=
 =?utf-8?B?OUZsM1RDNzNIVGRwemx1QzR1Smp2d3RYbWJZNTNXR01rY1ZzVEsxelUyMkJQ?=
 =?utf-8?B?VFJhWlQweG1BZlNVZFNEeXQ5ZHMzaGVScnB1Y29TVHdFVjNtdVpQVGZHbjJZ?=
 =?utf-8?B?a0p6ajlUMkVVaDh1M2hiMWJHdWluWHBOTXRCdW5NQ2dvTXhXR0dUVTJXOVpU?=
 =?utf-8?B?d3ZRWFlCckluZGJQeVM1dmxwaUFVcHZQVjEyam50RTluRlpXdzZWM3ZwN0tT?=
 =?utf-8?B?NlZ5QmtCU3hvRDRoN1NKK3NEWFY4bTFISWlvRTllUVQxeVQ3eTNKSit3SXNo?=
 =?utf-8?B?bUlqWkRwOEJVQ0lXL245MENoNzZUSmdYdXBVaDlVaHNCUE53MTVCOUc2L1BG?=
 =?utf-8?B?bzltLzVxZFU0WU8xcGZ2azhrWVhxNk1FU1BxRFVpbk9VRFhOU1FzcVBvVFVY?=
 =?utf-8?B?TVJmRyszSlROZDFsUGJ6c3FWeXZKWGpYa1lPNVFUOWFackJzdE9hYmt0MUFq?=
 =?utf-8?B?amI2aVlIZCtVcGJTaUZibi92a3BBcVo0Wjhta1F3VFdhVzVJOVlrNS9tclMz?=
 =?utf-8?B?dXhqLzZmYVV0VHRPVkJIeUN6ang0a0R1V2JnbkNzYy9vMUdWZk5ibGt5NVE5?=
 =?utf-8?B?UmZzay9LL2gvWkxVTFNZakRNTmZaQnJkaVlrL3VRZ0ZLQjVFanRNQVAyOUhq?=
 =?utf-8?B?K1VqMzFmYkJpODg2Z0M1TGY5Vkk0czZpVDhLck1SVEluL3huYlVJSG9XVGNq?=
 =?utf-8?B?Y3RIVmZvdHJLeVVhT2loWmpmZ2ZWM2Y0VkNWV2JYNnlScGVOSjI1a3IxdDVV?=
 =?utf-8?B?bHNqMGlLc2doSFFVblFQSk9WSGJtbEJCaW1BNG14clFkM0llVTcrSkY3eWZl?=
 =?utf-8?B?SXRKWVhKMEJaVjZRTzZVcGZvbmROR1dWR1M5ZEdtVEY3Ylhub1VPMUZTRGNu?=
 =?utf-8?B?aHB2dEYyeWY1RmROQlpvdUVjMUd6ZzRzL3RUMmxSQkE4a2tZZUw1NTJ1Sjlr?=
 =?utf-8?Q?Z2knaOOvJ8HlSFkguF/SutYUV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e33042d-3e0a-429b-b8f6-08db9721db65
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 08:39:47.4949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8o4X40QGnbdCPORf5HDZ/WhaNxbFXCrO7Wo4nxjNQFtNsaSD6iIf5jY9VDQVrrSjnbHXKcAY4loTcZ/0mmrOzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9757

On 07.08.2023 10:18, Simon Gaiser wrote:
> Anthony Liguori:
>> From: Jan H. Schönherr <jschoenh@amazon.de>
>>
>> Intel says for CPUID leaf 0Bh:
>>
>>   "Software must not use EBX[15:0] to enumerate processor
>>    topology of the system. This value in this field
>>    (EBX[15:0]) is only intended for display/diagnostic
>>    purposes. The actual number of logical processors
>>    available to BIOS/OS/Applications may be different from
>>    the value of EBX[15:0], depending on software and platform
>>    hardware configurations."
>>
>> And yet, we're using them to derive the number cores in a package
>> and the number of siblings in a core.
>>
>> Derive the number of siblings and cores from EAX instead, which is
>> intended for that.
>>
>> Signed-off-by: Jan H. Schönherr <jschoenh@amazon.de>
>> ---
>>  xen/arch/x86/cpu/common.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>> index e9588b3..22f392f 100644
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -479,8 +479,8 @@ void detect_extended_topology(struct cpuinfo_x86 *c)
>>  	initial_apicid = edx;
>>  
>>  	/* Populate HT related information from sub-leaf level 0 */
>> -	core_level_siblings = c->x86_num_siblings = LEVEL_MAX_SIBLINGS(ebx);
>>  	core_plus_mask_width = ht_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
>> +	core_level_siblings = c->x86_num_siblings = 1 << ht_mask_width;
>>  
>>  	sub_index = 1;
>>  	do {
>> @@ -488,8 +488,8 @@ void detect_extended_topology(struct cpuinfo_x86 *c)
>>  
>>  		/* Check for the Core type in the implemented sub leaves */
>>  		if ( LEAFB_SUBTYPE(ecx) == CORE_TYPE ) {
>> -			core_level_siblings = LEVEL_MAX_SIBLINGS(ebx);
>>  			core_plus_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
>> +			core_level_siblings = 1 << core_plus_mask_width;
> 
> 
> On the i5-1135G7 (4 cores with each 2 threads) I'm currently testing on
> I noticed that this changes leads to core_level_siblings == 16 and
> therefore x86_max_cores == 8. If read from ebx like before this change
> and what Linux is still doing [1] it reads core_level_siblings == 8 (as
> expected?).
> 
> What's the expected semantic here? If it's to derive the actual number
> of siblings (and therefore cores) in a package as the commit message
> suggest, the new code can't work even ignoring the example from my test
> system. It will always produce powers of 2, so can't get it right on a
> system with, say, 6 cores.

The only use of the variable in question is in this statement:

	c->x86_max_cores = (core_level_siblings / c->x86_num_siblings);

Note the "max" in the name. This is how many _could_ be there, not how
many _are_ there, aiui.

Jan

