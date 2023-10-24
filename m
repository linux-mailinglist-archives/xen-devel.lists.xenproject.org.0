Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EEB7D4F6E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621871.968730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGB1-0003od-0B; Tue, 24 Oct 2023 12:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621871.968730; Tue, 24 Oct 2023 12:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGB0-0003lp-Tn; Tue, 24 Oct 2023 12:06:26 +0000
Received: by outflank-mailman (input) for mailman id 621871;
 Tue, 24 Oct 2023 12:06:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvGAz-0003lj-0Y
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 12:06:25 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c033874d-7265-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 14:06:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8495.eurprd04.prod.outlook.com (2603:10a6:10:2c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.18; Tue, 24 Oct
 2023 12:06:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 12:06:21 +0000
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
X-Inumbo-ID: c033874d-7265-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/2GuLTv6U6N7u9yJpT0ZPnJ8Oy/ghSf5v4NDei8EDHMdtJy2lvYH5b3V2OX43HMTmJIUx3l0B6khrWoHioM6Mf8PxLZuwuSFRdAeBP3KwIb8ZFffpe6uM7taVahNgXSZC6u4vnl69BVJ+E3IwMyPnSruF2Mr03FXjSfjSCehk1/rLaMi0PWuAdT20Djs6HcxH15KUa2c8jxsMgZj+EAkOCGQM9RLXsqlg6tzRbRP7GG/kUxy3DPIR2qlM+uxgJcwFuK7RGLQcsGJp7QJCCwN6zsPsO/6/VQbWc1L/Cu0U8d23loGw9xKxOvCTNsfdMMd6SMbzEVF8djLO4LEZTOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DDXaMqjlUPXfonVbETQvei9LFFZosBxH82U2W04kuY=;
 b=j431KPMd+pcnIwTmJJs8FG1I3L+n9f5C9MnHgw0AnUpgpqSRabT14+Xn+WKWHFox7qZZvkzst3QHeiAhKmOLYmexUbMkO/RPKqU8ApX3Afj1/eYsX9Qnyu//SFJK0zdkIcYCmdBxzjGRL/qH49EZqvHIxrDVFKX690K/DxtSc3ujjHnu6kZn4lOzeZewzYn9Ga/ORmO/n2keM2D0uKRqKHq0irGNPGmcfQA9umkmnhDI+d3PoD2IZDJ4jBVBSQUkSDn+UHhQl2jLBKgb8AKxdRtQYBNNrGRohzT2MqciaEt9GYXnSXBHd6OoQtHqFH44vZIL66IKxW0d5/sra+C7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DDXaMqjlUPXfonVbETQvei9LFFZosBxH82U2W04kuY=;
 b=peNIx4Ix0NWwPyaqvQJY9oz6XI08O3GvVhhb/4llK7F6jttI8O3xSJL+JB8o5WBaXkDzPQgoFbOMCEZZSVZxD6FDjdsQn4Sv0cQt0ZS8UXkOOzLjd5AV5LipphBQam36Kvbj990YIiDUMBfnXN9V7roPDvICCHtB8RZqTK3aBlqC3Tlj3QU3HF4uxZ6Cj3s0hHFSFTCuS81ZnusXn7AC55t2rX78hXj7IlVwquc+OpM7rtqa0s9IEkbuMxMEzlbkAboGRjFh173eNPkKQk+9qjWTijnsPFuTy9/A9Ft6ae1JLbAdz9yCks2bEsozbJBkWDGfR0prZ6SIMqFMp7Bpyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c11b0ace-f2b7-8d59-0112-fed6a5de0d03@suse.com>
Date: Tue, 24 Oct 2023 14:06:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/i8259: do not assume interrupts always target CPU0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231023124635.44266-1-roger.pau@citrix.com>
 <a525cc49-69e7-c509-61d4-a2456b3fdbcc@suse.com> <ZTeY6JNbNfTVCpib@macbook>
 <2c5a5b6f-5c67-e46c-765c-81999ac1e11b@suse.com> <ZTesLTIulycE1s5d@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTesLTIulycE1s5d@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b4aaa8f-81db-4fa0-48bc-08dbd489a2db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Mc4y7p76CaLRCXLHuS1H03VHnbYsDcuIR7c0k8kdhHH1Nc7xBPjJJsyG2CatdcrpPSpJHrRRjDGROr27BP3/uRHqoxUBD4Oay5FIUzG+1VU68RjOpig53ORkOXaeIcY5zNltc1z8tV+OjIkzqn10qT8zoeeRK5M3YyBHKslsi5z4A7LiZe8OjU406Gh0TI3Qn2WN6CvCPoYSwvB7S6Yq6YFDT3JU047S9I4g3HlQ68i3a+ARdgFELshgLduwF7GjsWz1/OJH36fBNyRx5AKcWcKLp32hO9inQYBw+4Y8G/9wJ/9B3B+5NSbk/5wl7KwRJtzA11K0X41YVue3p8CcGnMpzVjLhYRpeO8dov41VCM6ntd8Hm8V7x0FgY59FQn937tSccSijwJntTDSXqOkmGIfdgOc/rzh3UXytr+NzOXWpO0zm8PlCXIKW1mfn1YZAP+/wjDhR7Whp8gz0SrpsvadJu1CGGKqDAEnjs74fRVZfps+/4M9xgJie4wm2vZTfcVeTxiIIcB8doRjFhrjuaA+GuaYnvceM+WYelW1NRk5z4xTR9s/O8yXPh/lHx7HzQInHHGNCkG40FuO8s91+50mUuw5BO2Yz2e2625mwLoE5zMrRQAxlzRF/CJwoRykGfzsf0k2qMHcm6z5AKGcA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2906002)(8676002)(8936002)(4326008)(83380400001)(6486002)(53546011)(31696002)(31686004)(41300700001)(5660300002)(6512007)(6506007)(86362001)(6916009)(316002)(66899024)(26005)(478600001)(2616005)(36756003)(54906003)(38100700002)(66946007)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlJxMFhwSVcwakg3T0E0TDh4OTREdXU4NzhyeEIwMmVjTXNoWlY5YmxDNTJS?=
 =?utf-8?B?cndkWTRmRTVZL2MyZnAwZnlDQWJNZ3pKQm1MQVMzcUQwQlByK205dGZZd2RW?=
 =?utf-8?B?SGFNMldjdmE3NngyMzdjQ292SmZITGkvUFozOURIeUZ0Z3FUVlRDamhEbmpG?=
 =?utf-8?B?MVhuU2N0aXBmTlJJa0x3dzlJaXpxNmJtb3JjNlhVR2hiU1U2OG5XaXZ4TEx1?=
 =?utf-8?B?dzhPLzJBZlA4Sm5iNStpajBtcDNYajZja2xrZ3J0dHpBalFsNlB3TzhzY2F5?=
 =?utf-8?B?RjdnTzR0anQvSGNqUUROMVVnNUI0VGNYTk1SemRMK3cyUld0ZjMyRDNTTkcy?=
 =?utf-8?B?QjRNcVk5MjFjUGNYbGJqdTBYK1Q1RnhPKzhmQjh2ZVBLV2NwTTAweDc3a21N?=
 =?utf-8?B?ZmprTk5URFFnRG56eFNUYk8yaTdIVDY4eGR0cUEyNngzR25PVS9XU3FYUnlz?=
 =?utf-8?B?VFNKQS9YM0dyS21EemNpOTFuM2hpUGhXc0dCY29NYmsybTlSZHIzMzRrNng5?=
 =?utf-8?B?M3lkdlFsVkpud1pNazd1eEVjSmJyM0lHYmo0aTZuK1pROENqS1dmTm96aWd4?=
 =?utf-8?B?dG9qNDVzd3FWaDcrWXErMWd2STJ1MUgrU1htT1dZZ0tuZXIzRGhTZVhKR2g5?=
 =?utf-8?B?M01ueHBoZUdSdjR2eUpiQ29oL3ExdTIzYkpUM2ZvK0JiQVlCM2liaXlQZGNY?=
 =?utf-8?B?aFZ2bFBKSVE5cWF6Qi9Jbll1d2lNejdTdEE2aW9VMzA4bFpha1RQd2dwclBj?=
 =?utf-8?B?ZlhpSlJxZHRpRzZHZmprYWdSa1FyRjl6RXNJUnI3czZhdjJtaW5QNzlGZkgr?=
 =?utf-8?B?S2crRE5DUHo2eXNubzJMZmxEVDNpU1BqQStGOWNuYkJZTHZRLzJoUlgzQnk4?=
 =?utf-8?B?Y1N1L1hZRkMxeDJmL0NCUGhCTmUrUEU3dkJQSTFkemhFbERwVFI3U24vVmh4?=
 =?utf-8?B?cTdXRzZuTHFma2crZk42MytNUVcrWjU4cU9mTUowaXNNSnNmTVEwYU0zdGdo?=
 =?utf-8?B?OFowSFlrRk1tYnNkMCtHZTNDbFpOV203QWdUakVMRjljbWJ4WVFvV2NqSERX?=
 =?utf-8?B?VTlwWm5zN3NTcTVrWC9ETU5aU29jS3JpQjA2YVZ2bXBVV3BmYm9QZ0E1cFFG?=
 =?utf-8?B?bm1rRGU1NFNncFFRQ216emRKZGJGTG42TFlwWEd1cUF1UExpdFpZL1NhK1pr?=
 =?utf-8?B?eHdzMStBcHVWZ1VUZGw4NTVUWnRHOUxCZXlCZThFNS9lRzhhUG1iZS9ZaWhw?=
 =?utf-8?B?NFZwZUI4T3V6eTY3OTNEZExEaDZSekh1M3VpSVVhUjJDbGliODdhU0ppRHR0?=
 =?utf-8?B?TStQRHEzdXJyZVF2bXRVTlFjYlZBSzlZaGhGeHJXR0NXelJpYnl6alNVNnJ1?=
 =?utf-8?B?MmFHN1h0ZW9CZndMOVUwenUwZXZsTU5BTU8wS1IrQ3VSMGVHaTFMQUVzeUwy?=
 =?utf-8?B?SThSZzBtRDFDaGtRYU1OTjMvck90SUhJQmloUjc1aVp6SWxTb1Z5WG5Zd1Zs?=
 =?utf-8?B?aVFGYkRaMG1WSWpsTnpQZkZ5R1U3c3hsQ1QzTHN4T3hkbS9LamFIUHdtMVlH?=
 =?utf-8?B?OWVkaFM4Y3FBNG1UWC92cjFNdWQ3ejF1UGc2aTY3UlgvSVBPSUM5aE8xcDla?=
 =?utf-8?B?ZHhlV3lrZkpYNTV3VkNtU3lQVTYxK0ZpOTJFNzYyUmN0VXkvckhwUXpXbWs0?=
 =?utf-8?B?cEtYbzNzRFNnajNjOVNGTnFRRUJmZGltMTNSZ1orQjlOQnpWaU1vQzdiR3Bw?=
 =?utf-8?B?TDVBNnRvVE9wU0syRnFpamNiN25BRlR3UFdQQWZZRTNueDJmL1JXZXZURDkz?=
 =?utf-8?B?SFROdnVYTjA4K2tCWWU2ZWdVOHEyUnZycndFNkw3YW90NVVqTDFwN1Y2dk5Z?=
 =?utf-8?B?TnpjbXFtekVqYlFpOG5XN2JvcXBrUXM1T0VmSlFFbHk3cmN1L0VtZHlFaW9Y?=
 =?utf-8?B?bDN4azVhREJmWXFWbmZoYVpoYXJGZU1nR3ZSREV3NHcxZEFoMXVUWTF1Q3dw?=
 =?utf-8?B?M3dxQkM4R3ZMOVd6NkxnczZXTWM1dzlJYmQ2N0d4Q3BFUy9NdGhvTHltdDVt?=
 =?utf-8?B?T0IrbytiL0xITXYrZENKSllZdjdlc0tmWnpib2ZvdGlObjFwV2tOMGxjS2tk?=
 =?utf-8?Q?7kpKTqZ+QZxjAtqcWslmElbcy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4aaa8f-81db-4fa0-48bc-08dbd489a2db
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 12:06:21.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+hszW6rkgW0k7juwkMhon2Abak39XmJZLCdqb9Dd7KdFJQP37giRA19K2hpk6I17fah7i6Sjm1ypuOhPXLqbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8495

On 24.10.2023 13:36, Roger Pau Monné wrote:
> On Tue, Oct 24, 2023 at 12:51:08PM +0200, Jan Beulich wrote:
>> On 24.10.2023 12:14, Roger Pau Monné wrote:
>>> On Tue, Oct 24, 2023 at 11:33:21AM +0200, Jan Beulich wrote:
>>>> On 23.10.2023 14:46, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/i8259.c
>>>>> +++ b/xen/arch/x86/i8259.c
>>>>> @@ -37,6 +37,15 @@ static bool _mask_and_ack_8259A_irq(unsigned int irq);
>>>>>  
>>>>>  bool bogus_8259A_irq(unsigned int irq)
>>>>>  {
>>>>> +    if ( smp_processor_id() &&
>>>>> +         !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>>>>> +        /*
>>>>> +         * For AMD/Hygon do spurious PIC interrupt detection on all CPUs, as it
>>>>> +         * has been observed that during unknown circumstances spurious PIC
>>>>> +         * interrupts have been delivered to CPUs different than the BSP.
>>>>> +         */
>>>>> +        return false;
>>>>> +
>>>>>      return !_mask_and_ack_8259A_irq(irq);
>>>>>  }
>>>>
>>>> I don't think this function should be changed; imo the adjustment belongs
>>>> at the call site.
>>>
>>> It makes the call site much more complex to follow, in fact I was
>>> considering pulling the PIC vector range checks into
>>> bogus_8259A_irq().  Would that convince you into placing the check here
>>> rather than in the caller context?
>>
>> Passing a vector and moving the range check into the function is something
>> that may make sense. But I'm afraid the same does not apply to the
>> smp_processor_id() check, unless the function was also renamed to
>> bogus_8259A_vector(). Which in turn doesn't make much sense, to me at
>> least, as the logic would better be in terms of IRQs (which is what the
>> chip deals with primarily), not vectors (which the chip deals with solely
>> during the INTA cycle with the CPU).
> 
> The alternative is to use:
> 
>             if ( !(vector >= FIRST_LEGACY_VECTOR &&
>                    vector <= LAST_LEGACY_VECTOR &&
>                    (!smp_processor_id() ||
>                     /*
>                      * For AMD/Hygon do spurious PIC interrupt
>                      * detection on all CPUs, as it has been observed
>                      * that during unknown circumstances spurious PIC
>                      * interrupts have been delivered to CPUs
>                      * different than the BSP.
>                      */
>                    (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
>                                                 X86_VENDOR_HYGON))) &&
>                    bogus_8259A_irq(vector - FIRST_LEGACY_VECTOR)) )
>             {
> 
> Which I find too complex to read, and prone to mistakes by future
> modifications.

From my pov the main badness with this is pre-existing: The wrapping of
a complex expression in !(...). The replacement of the prior plain
smp_processor_id() isn't much of a problem imo.

> What is your reasoning for wanting the smp_processor_id() check in
> the caller rather than bogus_8259A_irq()?  It does seem fine to me to
> do such check in bogus_8259A_irq(), as whether the IRQ is bogus also
> depends on whether it fired on the BSP or any of the APs.

bogus_8259A_irq() shouldn't be concerned about the CPU it runs on; it
should solely deal with 8259A aspects.

Jan

