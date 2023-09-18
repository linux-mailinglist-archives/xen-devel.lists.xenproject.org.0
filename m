Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F014F7A4766
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 12:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603900.941032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiBiI-0006e8-JN; Mon, 18 Sep 2023 10:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603900.941032; Mon, 18 Sep 2023 10:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiBiI-0006b8-Gb; Mon, 18 Sep 2023 10:42:46 +0000
Received: by outflank-mailman (input) for mailman id 603900;
 Mon, 18 Sep 2023 10:42:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiBiH-0006am-0f
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 10:42:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18946819-5610-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 12:42:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8211.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 10:42:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 10:42:40 +0000
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
X-Inumbo-ID: 18946819-5610-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiydUngQnPXVDpUaXrjPpnPQyJhfxPK8sdY9z9zp0BH3h8JikF31HDw19tKdmXHIkdDk0nJWxdmI3yqc5CIo8C4Gfkf2aUbWRV56Br5PusFQ00+OcI+c5amFYNdwVx+1+1JTFTGoCORvyFilGMsO4t5zZs5Wz6LLX/zINEtWCW+zy/cw+kdWz1T2xtWV919UjqUyjHxZfBIaKzqdYxgJYV5RKEqbS9wjCuiF9EA3uoS4GpcNDsHQgU9pp2GGtNXJfjFwEYAmgZ3c02EXivHgTNiHu5eNxhaLBcPHP7n1iGf4e+uoMugF59HT44aRVTFp1pxNSqSBpycR1JnJ1qUMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrqXt87LSw4yQx5xhc+P6AgBxr9bV2vdxS+w9LMcXRU=;
 b=Cib9ece24VDH1up5GfQ6RC6kxzPWTfTdSrPvUD7pDnLDwSoAH8yLGGjoMc88FL20wn6WIN3LzzdCb8Yh9c3gG3IOaSklyoNkaY8WQp+8mLwUXCqxYZBbGOgLC0shsOzIvCSTAIDPqikAP6FVXJXq+HOnKyq8tlk8hxZ53qGcid75WwNnXmNv/ceUUiG4sv+Ng6hOU+f+BLDC2OLsih3sE4TTK1GOJIv9jfvkhr5PloFAdMbiptnN+dxXck1O5NoDKJ/KEJzB7FWTAMFOrLQ1YLmcGb+Usx1CBn2fEPEC+kI9ePx3ZWIjhB9GNi/PJwaZCX7phKOyFtuAYmA3O6pX3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrqXt87LSw4yQx5xhc+P6AgBxr9bV2vdxS+w9LMcXRU=;
 b=qjye8BaNcqcNgG/ud0n/jOFZ70Rg6RHZj1SiAqmn/57DvJViiq8DeKdryh9ieX86JV92h8n5JKZ4w28o1A0jh1vu/JASKSl9J36EwywLVv+5gN+oiLT8OBnyJXDcs7y/QooB3MhI61+xnSn/0OYAnSb7pDyNUBWh9CRbGqvQI2dXL1ly5rOIK3sy0FxUWRiu88Bmmln/9h4KldQZsfMzfc38cIghzLIwSeWpr61JPpiNO8Fa7hWqdlQe1GQuRwqSUVgjMAwGEmv2fqHgqiwlvDurUy4JdpJL8U9vHpve73Hz3P/7v/xd2cW1NSSbDJ6QfqYMa9eYS8LMUuSdpOlxlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63a472ed-8df1-1d5f-191d-b0e3ca2bfcc5@suse.com>
Date: Mon, 18 Sep 2023 12:42:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] xen/x86: ioapic: Bail out from timer_irq_works() as
 soon as possible
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230818134441.45586-1-julien@xen.org>
 <20230818134441.45586-3-julien@xen.org>
 <a198d472-4b1d-1da5-e336-232af98b87aa@suse.com>
 <28ada8e1-0b24-4632-8bec-4939405f5d00@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <28ada8e1-0b24-4632-8bec-4939405f5d00@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: d3baf81f-eae8-4bfd-e742-08dbb833fb53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FYAc/9Wcr0wmL0Xp0uUY+ly511NRi6LVGBLH2/HT0+/aI76nLMOZ3nGEHOZNLXwC1FldNr0LzQT4brYZk7AcxO2U6nzk73HFg/rO6kV3NRt3rfBkhykrc07xkj8xt9QrM++QXNlQdpYYnSRl48vDkjV7nbqnT8ZMmGYaoNND3EkstUT/ohBflU/Zts5FHk0B7H2pbgA0puEKNY0NbK9mpSPJ5tsWYNqKYA0XNqYsAC/ovw/wk/Ql7Tdgz9FdAwsGeu6fuAhOxH0fKUFlc7EUCp/jPBuEE+NWZ7x0jwnmD3wi+w5FuApYBshNuS9KAlgYUvkyJ2gVCd/vcRDqHjXSnptVinCGAyhowfJa0LbRv5cXnf4plNwloeZQxvhnHCp84cBe0Iu3VS/Q2upXv1WDU3tT+mpqdKMBeEkYFRKkHJShorbB0n5TtTJcfwpmWy08i5xLV6kGWU9sIyff2vu14VO7kOsoBFp1nbu6KrtssYtasiQSx0JFQRd7gPCiIAP4I4OjSeYUCUGZr6JdQkwQm+UPV7l9eoICCK54R+Fcm560Vu6k7jm+47sPV3nd8H8QxG1KfiLPfMTJFA8ug8i8KrEtVtz4rKn+hX5u1vFdNd4G+tzDTGrITVY0jCPacIpuhTl223Oj95skwtQ782pzkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199024)(1800799009)(186009)(2906002)(5660300002)(26005)(66556008)(41300700001)(316002)(6916009)(54906003)(66476007)(66946007)(478600001)(8936002)(4326008)(8676002)(31686004)(66899024)(6486002)(6506007)(53546011)(6512007)(2616005)(36756003)(38100700002)(31696002)(86362001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dExUSGs0cU42NFcwT25OYnoyb2RkWkpXeWI5M2QrQm5xWHJCaWFVRW1Ea0pP?=
 =?utf-8?B?NmJEUTlyNGM3NzlqSGE3WFhaZGdTQzN2Zjk0SExmZmViNnRnZm9vZWVCOGhz?=
 =?utf-8?B?RjZ1S3Q5QThaVy9XQUhqSjZvWTluc3BxaHAvRVMzV2JpZEZiQlBEZTZkSm5I?=
 =?utf-8?B?UGhtbFE4ME5rbWdWWElYUDlEcVlZOHZKTnRaM1dXaGg0Y1lWNGR0dW5pbTRz?=
 =?utf-8?B?L3J1ODJXQWxMZ2RreGVOUDViR0xxK3U4azI1ME1Zc3NmL016Mko3b1hlTWpi?=
 =?utf-8?B?bTd6b0tCZ1d3OE9jZGNGWDVYYktuK2ZneWt1SE94QzgveEZaRmVKREJUdGc2?=
 =?utf-8?B?M21oWjIzRjFheGxOTFFaalpBcm5RUTVYeHlzN05vVXZHZGoveEhhcTV4aVJW?=
 =?utf-8?B?QWVNZ0hNakRJT2piOTVEK0tDMUkwRFZlRVozZS9LdDlWdWl0SFRXRkxLbGF0?=
 =?utf-8?B?ams0Y0Z3NE5menkzUGxZRGdQNFNDUzdzVFA1SU9aTnZyWHJxVmY1aUpLOEFi?=
 =?utf-8?B?a1VUNlloSzNELzVIeVMyODI5ekZwZGxrSm9yMXpJZmVLSi9Lb0ZVSFFSV2Jw?=
 =?utf-8?B?cDl2YUFTbG83cTVpcDdvQkhmRHVBV05HOElKeEE5cFpZbFl1UmZ0M2N0TEJ6?=
 =?utf-8?B?dmluenVpeHIxN01uTDhmNEdwc2w0RDhCV3dPWWIxdEcyNjNjb0I1TWtSZlNo?=
 =?utf-8?B?eTcvWnBQbUQvMTFQTEtqQkJqdWR0RVBQb20zTjBQcTBlbWllQW9RcGsxandC?=
 =?utf-8?B?a1RKQ2JWclpReXQ1dlRqZUtMbi9GYmg4bDVzUnR1R1J0RGlRdWFBVjhnNmNs?=
 =?utf-8?B?UTg2NlhiSzR3RGxYUzlQOWxobUNmOERMeU1ibGJMMTJhUlFGaDBpbjJUNmdl?=
 =?utf-8?B?UGtsMDB4eVNQSWowTlI3NWRWTzBXTVhFNk5XWjU2eFRiZVdSUGlVUmlBemdq?=
 =?utf-8?B?RDFmWnhyRlFMTXlpbnpqUVNJMVIvUjB5ajNLMkF0M1NvU09wVFhQRGdPb3Zk?=
 =?utf-8?B?dllvNERLSTBmZ0NsRDdJdzZHRng0VjZRZ2h5NGVyMzhDYTdHYzdtR1MrZFBC?=
 =?utf-8?B?eGhZdGcrMkxZbmtsUmV4TEMxb0luSVhSV3NVZlZ6OW5kVEZIbmtKMEpOTmd4?=
 =?utf-8?B?WWNQcWZVUTRnWE9XQ1lCa2tMK0thM2JROGROOEJNa3FFUHNmdmV5YjVOUHRj?=
 =?utf-8?B?b2J6WFBzY1B3L3lhNnBJYzJMQitWc2dVTFBkTnpWY2psbzE1cXc0YTdoT2Jk?=
 =?utf-8?B?VXBlTGN0eFl6U0V3TUNUOWlVUXlwbk1pT2xCUUxHeUF2OEU4djlDL0Z3QkVh?=
 =?utf-8?B?cjBBMWdMYzBoRzhaZHlJMk1Eemt2Y0VNR1A4VmRReVNVMnhWQmZxcVl0aWg4?=
 =?utf-8?B?TWhRV2xEd2pQL1BiYWZvaDZVOHNXSUJmKzRRbnRNQzI1dW4wRXBvdzRjc0xt?=
 =?utf-8?B?cEhqMXpYL05PVVllNTdxbnJnakpkUlJ2YmUvUWRTYzdTdGVEV3Z5NmJ1V1Na?=
 =?utf-8?B?NmJTeUpHMXI2RlVrTytZZzM4UWg4Yks0bkxwdEx2YUpDVFFsalpoOE9PM29y?=
 =?utf-8?B?ZUJiRlNVclNFVTdveXlEd01ndzY3alN4UUtTL0RwUTNBajVHNXFoMVU4SVRo?=
 =?utf-8?B?WmVQRVZrVXBRdHZ2N2Y0SWtJclo2dFlvOVRQSzNjNzNRRTA3Qk9JS2NaRlpK?=
 =?utf-8?B?ZVJ3QmNzU09zVWtkaGlneDIvTVJsb1loa1pvaXJCako2cXVkSlFtV1NQZ1FH?=
 =?utf-8?B?NmdYaHBDaVpOWkpHTWZvenVadU5yRkc3Vm45WjNVbW5MeGllRkxYMDVVQjN0?=
 =?utf-8?B?S2FjblRoNDZsVUo4ZXNZN0VaNmhPZm05Q1BIR0syQUNaSG1mSEtYbWtrVk83?=
 =?utf-8?B?d1pCamttK0RacjB5SlZhTytqdFk2MzZ6emZheFQrN3JGdWtSUFd4WGNwbWxt?=
 =?utf-8?B?eFRScmdiV0ZsL2djcUhZMlRDR216TkoyVkUrV3dsME1Lb0hNbTh2WDN1RkY5?=
 =?utf-8?B?NVVNN3RjSEZyTFZMd1l4WktSTG05cG5SYjgrOGprdkJDWFFHMVFDa3NCRWg0?=
 =?utf-8?B?b2JaVTkzNDlhOVl3ajZ0aitCL0l6SU5FMHd3c2V2R2dzbjZzRmRCT0FlNVhw?=
 =?utf-8?Q?Ij02878OsbDi48NSMIobDtBRz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3baf81f-eae8-4bfd-e742-08dbb833fb53
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 10:42:40.3687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGhhPlJUzsW01IrFuuG479GcXI2tDNmohYRVqKpVRSkgvElWLE8QjVeJmuaJaIWU+03Fk8UyjLNgaf/hc/A3EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8211

On 15.09.2023 16:00, Julien Grall wrote:
> Hi Jan,
> 
> On 07/09/2023 15:28, Jan Beulich wrote:
>> On 18.08.2023 15:44, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Currently timer_irq_works() will wait the full 100ms before checking
>>> that pit0_ticks has been incremented at least 4 times.
>>>
>>> However, the bulk of the BIOS/platform should not have a buggy timer.
>>> So waiting for the full 100ms is a bit harsh.
>>>
>>> Rework the logic to only wait until 100ms passed or we saw more than
>>> 4 ticks. So now, in the good case, this will reduce the wait time
>>> to ~50ms.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> In principle this is all fine. There's a secondary aspect though which
>> may call for a slight rework of the patch.
>>
>>> --- a/xen/arch/x86/io_apic.c
>>> +++ b/xen/arch/x86/io_apic.c
>>> @@ -1509,6 +1509,8 @@ static void __init setup_ioapic_ids_from_mpc(void)
>>>   static int __init timer_irq_works(void)
>>>   {
>>>       unsigned long t1, flags;
>>> +    /* Wait for maximum 10 ticks */
>>> +    unsigned long msec = (10 * 1000) / HZ;
>>
>> (Minor remark: I don't think this needs to be unsigned long; unsigned
>> in will suffice.)
> 
> You are right. I can switch to unsigned int.
> 
>>
>>> @@ -1517,19 +1519,25 @@ static int __init timer_irq_works(void)
>>>   
>>>       local_save_flags(flags);
>>>       local_irq_enable();
>>> -    /* Let ten ticks pass... */
>>> -    mdelay((10 * 1000) / HZ);
>>> -    local_irq_restore(flags);
>>>   
>>> -    /*
>>> -     * Expect a few ticks at least, to be sure some possible
>>> -     * glue logic does not lock up after one or two first
>>> -     * ticks in a non-ExtINT mode.  Also the local APIC
>>> -     * might have cached one ExtINT interrupt.  Finally, at
>>> -     * least one tick may be lost due to delays.
>>> -     */
>>> -    if ( (ACCESS_ONCE(pit0_ticks) - t1) > 4 )
>>> +    while ( msec-- )
>>> +    {
>>> +        mdelay(1);
>>> +        /*
>>> +         * Expect a few ticks at least, to be sure some possible
>>> +         * glue logic does not lock up after one or two first
>>> +         * ticks in a non-ExtINT mode.  Also the local APIC
>>> +         * might have cached one ExtINT interrupt.  Finally, at
>>> +         * least one tick may be lost due to delays.
>>> +         */
>>> +        if ( (ACCESS_ONCE(pit0_ticks) - t1) <= 4 )
>>> +            continue;
>>> +
>>> +        local_irq_restore(flags);
>>>           return 1;
>>> +    }
>>> +
>>> +    local_irq_restore(flags);
>>>   
>>>       return 0;
>>>   }
>>
>> While Andrew has a patch pending (not sure why it didn't go in yet)
>> to simplify local_irq_restore(), and while further it shouldn't really
>> need using here (local_irq_disable() ought to be fine)
> 
> Skimming through the code, the last call of timer_irq_works() in 
> check_timer() happens after the interrupts masking state have been restored:
> 
> local_irq_restore(flags);
> 
> if ( timer_irq_works() )
>    ...
> 
> 
> So I think timer_irq_works() can be called with interrupts enabled and 
> therefore we can't use local_irq_disable().

Hmm, yes, you're right. That's inconsistent, but dealing with that is a
separate task.

Jan

