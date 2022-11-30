Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CFD63CFFD
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 08:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449758.706695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Hzz-0003WO-3D; Wed, 30 Nov 2022 07:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449758.706695; Wed, 30 Nov 2022 07:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Hzy-0003TE-W1; Wed, 30 Nov 2022 07:59:18 +0000
Received: by outflank-mailman (input) for mailman id 449758;
 Wed, 30 Nov 2022 07:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0Hzw-0003T8-ND
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 07:59:16 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe16::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e238e27f-7084-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 08:59:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 07:59:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 07:59:13 +0000
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
X-Inumbo-ID: e238e27f-7084-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blgb+1t8CNOJR/POjq6ex61A3Ky1ADYKegOOaGWGQVHIM5c//W85e9+GYELINJ3k0EGxkL7/e7WocEXQB/ko8rZ3gI48m9Ssia3TrfmUJBcwlD96X4j4GO6BjftD2exmU298EHusL2o0yo4+Rj1+NmAAgPJp6eQ4Ss9Ox3hOGYnTkiHu0Y/llo6l619ndVMtjKcEjeAoR78/eSfWN749HhmhkhmRhJ8Ir7ykUmqpBh/3jaU276OhwS1Sdm0z26ehdrHG/UA1ZWw0+fHNLKOcGilagR5pkd05qOZalzYqnbolXmXWK9WXn/05eutrht3Z/FjyBuGjo9veEpEs3skjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgPKsdLcbxqD2OHRzaIQxIQ1pW2Esfntfw9/qZIIVdg=;
 b=dh2Gk9QVkyI/UWbd1S0ip+ScoBOudqAOmK2gLIP7GW2UInsXX/6wCMa03Cb84vk2GZ/sUmVyuInyTeGXsgZ3hG/GfzWGaYZ7GFD+R98h9DZksYr6Z2gAhfYmYyPrB4dil7LeGX2UUZNLQtBjFcPSJZtO8LZKfxGnKtfTDaTS5Qy0zw2AZ7C30gTb5hj+jGQOs8WqOuqlcWp7FvslSOI+dVW3/hz0N5dLIMEgX2zVN9NqKqeDcf4HZuDIcvlT07myCfEMN5+YVRwB/13yJnJyNw6rDqi7R7PbOZ8aaJAjCZ4+gq9j+NpgZPbCRhg5myXsWeEgpNBXIbWCJwggq7+Z/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgPKsdLcbxqD2OHRzaIQxIQ1pW2Esfntfw9/qZIIVdg=;
 b=K4yeoxNPdWmnExIZZ7cgUpgSWusg0qTCpZQqZEwdCfc+hFwb4YeEcRsDhl8k79hQpIYf7E5flMTTx3qV9fUEpfNrtBPoWXvgbavdvCrXgkhibLxqiWUY7RnyBQ6MTmZkMv990dq2VOQKvmeHLs1tD02sta52r7ISytvwnIWdmFJOQJn/q8BeE936/F6Tf63YJGhQVlOI1nkozNRBlDXpb7CS+XYAf0NSKOZwMX/HsFoZrrSMsEAi5NNRil6aCmAbhXVQAnMVUsKYvO+sDe4+yLANJk8c+pRTK7tlZa/+4L91IFizEv5iK+U2ydIdwEccVnbsUr0JosUzYciSvSf5NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe00cc38-f5c5-2570-842f-1f7e2f4285e1@suse.com>
Date: Wed, 30 Nov 2022 08:59:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/APIC: make a few interrupt handler functions static
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <54ee1bd7-9b6a-efc7-8bad-50aa7d6d955b@suse.com>
 <Y4Yt400C4cHxMAal@Air-de-Roger>
 <b4e8cfc9-7a1d-dac4-4258-ddb7d2c06075@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b4e8cfc9-7a1d-dac4-4258-ddb7d2c06075@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 65034982-5d3e-4404-595b-08dad2a8c544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yw5VrPbVkaQN//hv29VShCM+gvqmw5XY8jaWSIaMLwAzz9cDU8eFGV3P1OZUWU9NGlw2Hp09/V5o4bZl4kUBqhDBkz6byfI2kpS4Brl5RO+eKsSiBDDY5qEYbMkl6eqSyq8LErf8N4rhyYgNpnvMUCoeL28YTeAXtpwSoOVx49v7j/H818yhjOXFH6UlT4m9ylX0yIyT+t8ifd4owRTTTBWN3cTvTkpmm64HLC+GwhYz4rkCcyEcMBDT+BLbvU4CNhEJRho1Wzghhp4Rzg3vscMA5tEuyWwWyAbmkbj+/vEKdLhki/abnl3+LBbYICKFwZlHuczLRC27V5b45ONfiwm6URSgjov0Q7uC65Hwzw9cKrP6o4gdnu3z0ho94lZchWbfHfVl9OqPA9CcjmS3GCNntu39ez46sGjzwCntHodyyEJib4DPI5OBEf3/GNRWAvViY/OHu1GpuuQOgJWDn6lApmOME1KvHu7itgbykLnZqno+hmhehLXRFbyCyTexsNmUwOgaGjLApR3ggyhBnpH7sZQyXQfsqdNE72NwfX3Xy5E0XL8E37XJAcUf2Fh/c8UhHWAMQg6QJMvB/vVZQnNXIn0RliQbgaZocQO+lAJVulgtJElqGbA5+f6Ebo3b3kWJR+fRkR0m3wh8vThBZqKbegGbfLmr6Es0Vm28A6KDZjG6D3AbMGv1jOnOVNe0J+iimfXghzloXpeuzWK62C3Fy7Mw3uPPbI1Oxq97QKg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199015)(36756003)(38100700002)(31696002)(86362001)(2906002)(66946007)(66476007)(66556008)(4326008)(8676002)(8936002)(110136005)(478600001)(186003)(316002)(2616005)(54906003)(31686004)(6486002)(41300700001)(5660300002)(26005)(6512007)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2tlaXcwSEtZeWZ4YkNPczNENFhvZFZ2TzdsbmoxRFFJTlZNSDFFVTFWNlYr?=
 =?utf-8?B?WFkreWFWOFc4b2g1U2ZmaEFTblcxaTl0cHhmeDAvS3gzRDlkdlRxbTZ6aGRE?=
 =?utf-8?B?cUFxWGZJMzRSTjEyNktJYm9LT0o4bmYralFxblI4b0Qrajg1VTdMbFNSRnpr?=
 =?utf-8?B?aHJKc1B0dHVoQVJJcmsrMjNUSzVIeGlvT1MzbTIyTXRKYlU0ZDJEZE5XUFJr?=
 =?utf-8?B?cHlDeEp4OWcwRjZiclBmQ0IzZndrcDgvdnI2SlRob25KR1BDaE5jMUw5TDI2?=
 =?utf-8?B?amVDSFB0cWJNRHpRNXFLdGc0YllMaHpxbzIvZFlBZlJkTmpjNmVEK1pFaG83?=
 =?utf-8?B?cHI2NXJqN2tZTE14dnRGUUlQYWFxVUxjY0o5R2tNUTlTeWlNZDdaa2w5VUx5?=
 =?utf-8?B?ZGFkTWRwQ3ZHRENrR2lFeTNWUjVjajZZMXNNOVlJNnc5TmJua3NRekF6SHNT?=
 =?utf-8?B?dGFqUHBNT0RrOEd3c3EyelRRdjJqdnlkYWtPWFR0M3ZuR1Uvdk95eWd2ODRi?=
 =?utf-8?B?Vk4wc2V6VkRkalU5MS9CaU1UM0t2VWgxQzdLaDM3L3JmaUlGUVV1eXdnZ0I3?=
 =?utf-8?B?YmxrN01IRXRiSDJyZEg1RzBBMDBKOW9kZ2txdjBXY2JmZEJGZEIrd1pMcFBQ?=
 =?utf-8?B?NzROY2lzZklHemhERHRmUExrWk8wNCs1Y2lySUFNWFJzT2lFNmJnWGVUNG03?=
 =?utf-8?B?Z0dKdytud0h0dHpNMDU5S1d2amh0RGdiUWRKT2x3U1czNmJyeWV6Zmk3YVFn?=
 =?utf-8?B?MEFJeFZzc2M0bFVGNisyVVVMV0owUjI2T2NiRE12RlFsenJHckpsbFVCQnBC?=
 =?utf-8?B?ZTVOdW9CZE1XSWZSUmJpRThlM2JESGlrelZOYWQyQWx2SmZnejd0MThJa1dp?=
 =?utf-8?B?TGc5cVdKS1AxZ0NGZGpDT212MmJhdFJsM2E0cWxrZFQzOWZBNmZJYUUwMzlk?=
 =?utf-8?B?UVFXeGdUb0IzdUxDaWI1QllnU04vU3lFMDd2K2tQT1E5Y011cjVnaHpmdmRC?=
 =?utf-8?B?MDZFUnM5aHJlT3ZYZ0c5NWI4d2locDVoQUkrTzFBNDhSR3FubllMWWdkUkRv?=
 =?utf-8?B?SDNVTit0R1h0SUdxY040ejRyQ25adGgwcjdlenZxTFFPeFkvVXRoTkJaYm5m?=
 =?utf-8?B?a0F3S3NlVDhKejNZdGg0dit0anZobitxK3p6bDR5TjB6RE1iRUhTY0VnbXZD?=
 =?utf-8?B?VXEwL3ZrcXViWXdKVkJPMGVrVlNRTW1Ib0F6ckV2dDJoNmtZMi9weFRtOTd5?=
 =?utf-8?B?YmJJWGxqUlQ1TU43OVErdXRpZW1Mcjk2Mms1dVZ4cVRUdVVqUFpmMzY1K29H?=
 =?utf-8?B?c1FZQlFNODlDV1B3OWpGWTJtejdUcUFsbUtkTXZRZDdXNGFRdFBrWDNDOHh1?=
 =?utf-8?B?R3pySXN0Z1NoYVVZYXl2V2lPVTh2UksxdFo1bVlUNGwxbWFESjY3YVVoTnd4?=
 =?utf-8?B?Zk54RkNQbzFWVHFCWUVleVVMYXhQbmxobXNoZWh0SjhoNzZzekxucERjU2oz?=
 =?utf-8?B?Y05FbnBYV08yVHVDd0pnZDdwR1Evc2MzUlROUXc5YWlFVm1GZ1BRMlhBc1Vl?=
 =?utf-8?B?YlNOekJQclNlZ0ZrWkdUUC9wNTNKYVNaWmQ3elNCSmhlV0dxdlppL0U0Z2hn?=
 =?utf-8?B?R2VmUWc5SWRtcm14N0dEcnlidFZVRlhpSElOeFAvVmlSN0pvTTBqWGZRNlNl?=
 =?utf-8?B?RFBrU0wrV24wM3I4VHJKYkhiRnRRU1NIR2NSaEI5WVpzTE9pNFFzN1VOR3Fi?=
 =?utf-8?B?bWIrM0tnbXBSS3l1eDJ4NWtVd0VDYmdmaEpPcE1jSkM3TXhzTFMzc0EweWVR?=
 =?utf-8?B?NnphVjJjMldSc1kxamFHTWtVcXRJeUJFZzJBNmU0bmoxb2ZjUnlYQmdEdTdQ?=
 =?utf-8?B?dXp3aXpuYkhBOXZMRktETFd3a2Znc2pYSmhRbnZObVdvVFNqUnJuQ1VuZTVC?=
 =?utf-8?B?cjk3bnVhYTJ6YzI1dURrbFdRbm1aUWJrQkNNcEJCdXZYVDgwR3U3dUVKWVlQ?=
 =?utf-8?B?YXVQZ1JhS3NPNEVpemdHU3dvVGh4T3J1SFI2NTBnaWF6Y0dhUTdIdWN3bEFE?=
 =?utf-8?B?WTg3MVhrQjE3UGZ0czJaaVQzWWFVSHBkSjIwNnZIeVVuSE5UcTR2MCtBSURB?=
 =?utf-8?Q?4SJiLlee13mZX+rJV/rTTsQhT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65034982-5d3e-4404-595b-08dad2a8c544
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 07:59:13.3994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXMneCGce+ByNtRIpWnuMcMaiVebgEnxefFKipJdB22ldxxEiByuBs6L6Xr7Lzcymdhaxq6VTYcaLyQrNnCyaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9422

On 29.11.2022 17:21, Andrew Cooper wrote:
> On 29/11/2022 16:05, Roger Pau Monné wrote:
>> On Tue, Nov 29, 2022 at 03:46:30PM +0100, Jan Beulich wrote:
>>> Four of them are used in apic.c only and hence better wouldn't be
>>> exposed to other CUs. To avoid the need for forward declarations, move
>>> apic_intr_init() past the four handlers.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> A nit below.
>>
>>> --- a/xen/arch/x86/apic.c
>>> +++ b/xen/arch/x86/apic.c
>>> @@ -127,21 +127,6 @@ void ack_bad_irq(unsigned int irq)
>>>          ack_APIC_irq();
>>>  }
>>>  
>>> -void __init apic_intr_init(void)
>>> -{
>>> -    smp_intr_init();
>>> -
>>> -    /* self generated IPI for local APIC timer */
>>> -    set_direct_apic_vector(LOCAL_TIMER_VECTOR, apic_timer_interrupt);
>>> -
>>> -    /* IPI vectors for APIC spurious and error interrupts */
>>> -    set_direct_apic_vector(SPURIOUS_APIC_VECTOR, spurious_interrupt);
>>> -    set_direct_apic_vector(ERROR_APIC_VECTOR, error_interrupt);
>>> -
>>> -    /* Performance Counters Interrupt */
>>> -    set_direct_apic_vector(PMU_APIC_VECTOR, pmu_apic_interrupt);
>>> -}
>>> -
>>>  /* Using APIC to generate smp_local_timer_interrupt? */
>>>  static bool __read_mostly using_apic_timer;
>>>  
>>> @@ -1363,7 +1348,7 @@ int reprogram_timer(s_time_t timeout)
>>>      return apic_tmict || !timeout;
>>>  }
>>>  
>>> -void cf_check apic_timer_interrupt(struct cpu_user_regs *regs)
>>> +static void cf_check apic_timer_interrupt(struct cpu_user_regs *regs)
>> Given that the function is now not exported out of apic.c, wouldn't it
>> be better to drop the apic_ prefix?
> 
> This is the handler for the apic timer, as opposed to the plethora of
> other timer interrupts we have elsewhere.
> 
> Simply "timer interrupt" is too generic a name.

I agree with Andrew here.

>> The same would likely apply to pmu_apic_interrupt() then.
> 
> This one could lose the infix.  All PMU interrupts are from an LVT
> vector.  It may have made a different back in the days of non-integrated
> APICs, but those days are long gone.

I'm happy to drop the infix. Won't bother sending a v2 just for this,
though - I'll simply put the adjusted patch in soon after the tree
has reopened.

Jan

