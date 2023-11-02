Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6052C7DEE4E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 09:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626778.977328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTKT-0006H1-OI; Thu, 02 Nov 2023 08:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626778.977328; Thu, 02 Nov 2023 08:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTKT-0006FH-Ld; Thu, 02 Nov 2023 08:45:29 +0000
Received: by outflank-mailman (input) for mailman id 626778;
 Thu, 02 Nov 2023 08:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyTKS-0006FB-CJ
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 08:45:28 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe16::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b3d1f75-795c-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 09:45:26 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7380.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10; Thu, 2 Nov
 2023 08:45:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 08:45:23 +0000
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
X-Inumbo-ID: 2b3d1f75-795c-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPge8gEyPnkDmw6vDBYTYspftm+iHXHo3F20AgqCHhVSsQ7LmTYNI76cszJa+I91Zcsb77ZL6jbuBF3LxHZwpm1YOARgP4SpycpLfPJwHTpWP9S3lz71Z4CkcrQnRschdZhCRuUczDamLeab0afPysdzGPXtCJqemzzvMGdRnsDbuEb7m+fWMtD0Cntw0aIKqi3XFXfdRVa33zYlvSin7YEaf7/8JZistxsJiRPIZABTgnE7KLecidDGjgsW9VQXRSlhDAvFG//CQrTTQndZ7wauFJkntRwIDy4yHfkgu0kEUBAL+3wvcEqmqbUmsDFTCAAsUrbi6O7uzwxs4Tkllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1t/gXHc9fedS33dIEQ1GyjVQNmN+UQriLKw6VXywVWE=;
 b=EAHtRLZBiv7wjno03TVJUrLqI+ssmlQ2F8BhVYAXYraF1ZIWeh0WwzRRkaxOuKklRfbP/Sfi1HQn1Nh6yOp9hoINfd4RtkGM2L8EzeUCyUcmCSos6A+S5bkf5DKfVfqIaAuUYRgU0GZNBRy/dOJwsyfRC2ZWZtkmTvQF2ePLJXzC/pVBmsBMVO8TEgaT6XZoxSSisym5VtL6dWRi4Clt6yNjZ3HVh3aOeOwG45sgvMnt4zmRUbn2dgN7YI81A4z4gFDYY5/sNijRd7Zds+uOtn0ekQ9XT6PsbvfNaZTn7ExkjTXl+88+KNvmccAjw9VD4gkD9YkJIDHl22cg4Y0Qwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t/gXHc9fedS33dIEQ1GyjVQNmN+UQriLKw6VXywVWE=;
 b=CIhyCG1m6FRkcLhQBu6ekKJf2HYK171tD4ILKS6FoRef5UidPmMoXQqQqHyGIORz6aM+LTKyvnq2MQ0vHJ3D1NT8l4oIZNvaHyRGaqkBVYg+I/IkXSQjHwjEzXdZoE3H5qTPdN/1hd1ga6mHhA+5fRryDux/Uj65W6Qj3tpwmVWLTd0lOKnf25xNAxUaNEk+CwTFPc4RsVEQr647s+pZEsOIWsq2hN/Ff0A+XJh8kcE0K4yrvsrMxWTxs2plXvYzqjFKb5rCwP5FV2hQAwW+27G6HncCbJyWRewH0YENEfQLWeRKGXqPfKt5WiHMxMu47Z+GEdUEDWCLZw9jVmXnCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c586aa91-c35f-5f0c-7d1e-0df47efe79eb@suse.com>
Date: Thu, 2 Nov 2023 09:45:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/irq: do not insert IRQ_MSI_EMU in emuirq mappings
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231031133037.157936-1-xenia.ragiadakou@amd.com>
 <ZUEsabItf_lpvi25@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZUEsabItf_lpvi25@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d3a987e-ceae-4077-7cbc-08dbdb800ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q18YKuS9/ksLqJQKpsRbwRnQx8uM5wXLUm6qbojA3T16pC+VvdAGsRl3Nuqkvf+UKs6ujx62O3GNPviWnfuvXz5FH4r2YVSdFCfvEJFaEh7fLMFPbIM9BSPa2sM2NaLj8PV3M42/VivbEEImh+WjBaibQolpRtyzE3b3NkJLGjc/NscXfUsyJpRir9v8Eo2Q0FpBQlWFwG23Jxk5E05FdlN6zBzOhiBLCRVSJa6xBhahpIa1IxUh+7MloMZZ5Gf22v37BUTUYXcYYHE4dNMiRvcsD6v/dQZ7EzVDor0lptWWg876EjiZkdhkY965XK/KyAANm9h89GjMrpz6VewrvMq4Ww4Pl/eO8h0rjNo/jr3Uc4sXXS/NtVDTsob16yi5QiTSXabQK+pWFjlnRHtivg4u2jfDkO53YScihdx/nZnFE2LrQybtp3RNHPgxG9/Haq8Ow5SSu3OpzMXRAnUvATftPnFPTF+Tj/n0ii563nVNtkSG7gqcoXlF2AEW00bitGx0iubgRY3lWIxiW3jh03oNy8fsy0fdNDtADP9vT2OUeRR07M9a+x8L+DdjXS757q9reMcwJRY+xz+paEmq1GAUfRANDd5qczuLuKV0lawa5z4BtAiyUOURxLAwDw8fGBXSmGLomlU653PCa0YzAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(6512007)(2616005)(26005)(6486002)(5660300002)(36756003)(8676002)(8936002)(31696002)(2906002)(86362001)(41300700001)(54906003)(66946007)(66476007)(66556008)(4326008)(316002)(110136005)(53546011)(6506007)(478600001)(31686004)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzBKQVFacFJJNGNiRHBYaXJPR3c3alZXUWlSaEdvNXVzUWtVL3Q1bStSTmpv?=
 =?utf-8?B?RVpTbGJuaXFIRmpQKytTNnN1Uy8rR3JIaWw3dTI4Nkl5TFFucFVXTzJTY2dU?=
 =?utf-8?B?REVod2VSd2h4Wm9MMjZ0djVhY0IxRWFYVFozY1RMeGR5M2RLK0RmTmtMaXBs?=
 =?utf-8?B?UGdFYnVLU1FCakZmb1hPK3h2VVg2dTRHbVl3L0gvTTR0VVhMR0Rib2pIUXdN?=
 =?utf-8?B?cDRRTFZQSDhXMlRmNXQ5NjF2R2lYS21ISWRkMFY0MTh1cGYyNmFMeTZ6aXY5?=
 =?utf-8?B?d0pxVXVpREFOUzVRaXpGUStDVHBuYzJHb2x3c3hFUk9nWjFGY0xUTE1GVjR6?=
 =?utf-8?B?THl0NHJJaXA4WU4yVTBWRHA3dW0yMW13WE9kY3pwMnRZcWErTjhyeGhPQ01h?=
 =?utf-8?B?RnNwZytaZEIxR0dZSDNrcjVtdnFwZ1QvdWx3dzRwbklRcjFVbG5VdmZSL2xh?=
 =?utf-8?B?SkV2U2ovMUxRaXFRNk9RMnA4aUNaOTZJeWsrUnR5VWYrNU5LbDRHaEpIU20y?=
 =?utf-8?B?Qm92cjF1ZEtqT0wxMjNLR1V0czZjMURid2VqM3lDN0IzRkVUZ1lDNVI4UTRL?=
 =?utf-8?B?eFV3QUpEZXZ2ZVBCcnFjdWxzMWU4MWw1bjIvWmNXSGo1clhwQ2UyVStYenJt?=
 =?utf-8?B?aU1yYkNmZWVEWTZ2NFpqZUdES0JYUXJYdFlOaUxWcitEeTM3S0tRNUVXeURi?=
 =?utf-8?B?WE5jNXNaOXp0azBHWHFRa0E0VFB1ZjZxTUxEUHMraEJQNzd6ZTZjUGRPanZq?=
 =?utf-8?B?ZWJ5aWxqMkcxUW9ycUNHUHo0RmVDcjlpTFZxSmxQdklTc21lRmRBWk5jelQ1?=
 =?utf-8?B?cXVNdnlnTUEzSlg3MzhodXlvUXdlUXpOeHFwR0EvNksyTjQzR3F6RnlDOGxw?=
 =?utf-8?B?ZHFMVVhMWXBHQ29uN0pmUWpRSWQ3bTF1WXgvSlMzenNoZkNrck54R1JCZnlH?=
 =?utf-8?B?K1dqa1FQR0NwZ2NZdTJrdWVHZllhYkcwazVXK2l0a2JZejFDemV0TXpSdnZW?=
 =?utf-8?B?YS9aUE9hUTFwc3luZHl4Q08wQThXdDZpU3d3ZDRoRUhieWNXc2d4WnpRYk40?=
 =?utf-8?B?N1NzVldKUHVVTVo2UXRLTUpWNG4vajJYTCtnUVQwck50bjBvQ3FOejg1Vk1x?=
 =?utf-8?B?cG9jQ2d3SlpqU3NPZ3pjK0Vxb05LVjdad1l2bENSc3hjOFZuYzFXQ2ZVNlNK?=
 =?utf-8?B?QTg2dmRFQ2dtRlhSd1lhQzJxaWtCK293aGh1Y2pvMmVHQTlocnMvd2ZmaVY0?=
 =?utf-8?B?WDhuRnpob25obFB4ZENOcUh5cnBOaFVCejJOK01VcW45ZkFIbkxZbnNwRjdh?=
 =?utf-8?B?TGl4STBteXdkTjRlUHg3QkhleEZiU3VoYTlEajlZZWswUTlNUVNValFxakI4?=
 =?utf-8?B?WDZiNG11SjF3Nm8yeXJKV25vTnI3akZCYXk3SmlteWFLaGt4OGZLYWJMR0Fa?=
 =?utf-8?B?TGtBdXpsRitEeGJiWFJ3Zi9DZk5lS3FSSGUyN1VuSnVxZHJJbEpQMlRJL3Z5?=
 =?utf-8?B?eGE0eTZKalVWSkVjQzJOYUl0TDlvUjAzNWsrRFZaN1UyOTNJQmpyc29tV1kw?=
 =?utf-8?B?NWZ5ZEJrcnlkVE11eFltZzM5WmdsTXIvRnlpRDBmcFBwWk5WVTM3NzVlRGwy?=
 =?utf-8?B?dVlpellXeWx4cHZ4TUF2T3VwVzFXdlhObjI0Zno2MzBkeFRNbmlyQi9nNWJU?=
 =?utf-8?B?ZWVJMDBqOVlUZXNHaFVCSWJGRGhUY3FTQ0lZc01qTXdqVHJuUmk2elZnOFJz?=
 =?utf-8?B?enJrUVlnMW1vN21mTUNzY01KQkVNeDBwNTlDQURsb3JaUVRZZzhEclh0K0NT?=
 =?utf-8?B?YlZjeW0zMmZjbWJsQkVjVmFwdGZIcFdkTWhHaytwWVBjNDByYUF3REVDaVF5?=
 =?utf-8?B?d1BESE8vKy82K2JuQ3JjOU5GU3hTQUh4cm5aNXdqVUZaLy84c0wvYVlWWnlZ?=
 =?utf-8?B?NWQ2N0pONGlaWklEWlZrMmdYK3dUT3h5QmpmaTR5WlVJamhxZldFZ2NjWGRn?=
 =?utf-8?B?QzE4TEJoZVBIN25aS2xXRVVSbDdKQi9KNUh0ck9nM3BsM2lGek0vT1JtOGwx?=
 =?utf-8?B?Vlg2TWNRVFM4a1BuRWtwR1NzSFVMN05jRnhsY1MzTEQ5MER6YmM4ME5wMzh4?=
 =?utf-8?Q?tUaaGczJJMlBb+ScZA/lTaDz0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3a987e-ceae-4077-7cbc-08dbdb800ddc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 08:45:23.9115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtfBGEQ/el8I0RUXM42NQq3tuhTh19M37aDFdOZ9q+VM4SZzq8wAa1qPdP+j9aQgzq4JDmCu7sahtUqSEq8Pjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7380

On 31.10.2023 17:33, Roger Pau Monné wrote:
> On Tue, Oct 31, 2023 at 03:30:37PM +0200, Xenia Ragiadakou wrote:
>> Do not use emuirq mappings for MSIs injected by emulated devices.
>> This kind of pirq shares the same emuirq value and is not remapped.
> 
> AFAICT adding the extra emuirq mappings is harmless, and just adds
> an extra layer of translation?
> 
> Or is this causing issues, but we haven't realized because we don't
> provide emulated devices that use MSI(-X) by default?

Yeah, whether there's anything wrong with this or whether this change
is merely trying to optimize things wants spelling out.

>> Fixes: 88fccdd11ca0 ('xen: event channel remapping for emulated MSIs')
>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>> ---
>>
>> Question: is there any strong reason why Linux HVM guests still use pirqs?
> 
> Baggage I guess.  I've suggested in the past to switch PIRQs off by
> default for HVM, but I had no figures to show how much of a
> performance penalty that would be for passthrough devices.
> 
> My suggestion would be to introduce an xl.cfg option to select the
> availability of PIRQs for HVM guests, and set it to off by default.
> You would also need to make sure that migration (or save/restore)
> works fine, and that incoming guests from previous Xen versions (that
> won't have the option) will result in PIRQs still being enabled.
> 
> There's already a XEN_X86_EMU_USE_PIRQ flag in xen_arch_domainconfig,
> so you just need to wire the tools side in order to allow selection by
> users.
> 
>>
>>  xen/arch/x86/irq.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
>> index f42ad539dc..cdc8dc5a55 100644
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -2684,7 +2684,7 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq)
>>      }
>>  
>>      old_emuirq = domain_pirq_to_emuirq(d, pirq);
>> -    if ( emuirq != IRQ_PT )
>> +    if ( (emuirq != IRQ_PT) && (emuirq != IRQ_MSI_EMU) )
>>          old_pirq = domain_emuirq_to_pirq(d, emuirq);
> 
> I think you can just use emuirq >= 0, as we then only need the emuirq
> translation for passthrough interrupts, same for the rest of the
> changed conditions.
> 
> Looking further, the function seems to be useless when called with
> emuirq < 0, and hence it might be better to avoid such calls in the
> first place?
> 
> I have to admit I've always been very confused with the PIRQ logic, so
> it's possible I'm missing some relevant stuff here.

For any emuirq questions I'd like to suggest to Cc Stefano, who iirc was
the one introducing this machinery. Like you I've never gained proper
understanding of the concept and implementation, and hence I can always
only refer back to Stefano.

Jan

