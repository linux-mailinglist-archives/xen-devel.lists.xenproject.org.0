Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB436D2250
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 16:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517002.801965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piFg6-00040a-3a; Fri, 31 Mar 2023 14:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517002.801965; Fri, 31 Mar 2023 14:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piFg5-0003xt-Vw; Fri, 31 Mar 2023 14:24:29 +0000
Received: by outflank-mailman (input) for mailman id 517002;
 Fri, 31 Mar 2023 14:24:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vsh6=7X=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1piFg3-0003sp-DE
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 14:24:27 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc97c264-cfcf-11ed-85db-49a42c6b2330;
 Fri, 31 Mar 2023 16:24:26 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 14:24:22 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242%4]) with mapi id 15.20.6254.024; Fri, 31 Mar 2023
 14:24:22 +0000
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
X-Inumbo-ID: bc97c264-cfcf-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8Lc/baoLl3jEjTmJj4wYbipweqFRmdV3SfUk7Mg7gdQKVDmUM0lFD/2WrqGDhqKCiD5gxYZ0+8RDgeK+XI3HdmWqLr5IiLGfWTkPIh+1uyaHoYBTg4v7P7CpLmIrtrPVthiUr4Sr8dImUgP75fGrJa4v/rlqUboEVkaNWnOhD8oH5Quukmx2H4oQdGRicAi/ktELAwZXEaP/0IcGE7KcMoGQE2m/FSip0mrhwiNzGRfNbPKSVbMoLN3y0Obn+yLOALeV90st72FnoqvD/tf6wBxGMEpWMcZbRFIAQpdqpJmtY1OprsKcSeSn3U2HFdwRo/sNEtNyhw0hEpmCT/oBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNXy4+uNae/wj0KYsQCSgQVNoWDjOYKOm9OrEgS8sro=;
 b=cv0OfzXKkAk9l5BapTp6NcTXrc9YDNQMLsKvrUD4+cbQf+x00ntnuIKMKxxgG+M6ODjdbM4IhOJrSgK0+dTHG8bBrkL6BvU4okcSxtuF479Lpvr94NpYvW7++zzMnjWr+THD+MCLxCtuaTU2IINmpq2HHmi0xPLL9jFMkaPGXC8iSZBld4YDdo98Z7BxaNGlYWFBSClFqTc6mOLIb1hhn8tivoq5tYaya39XR1lnCFiZIgCZWzkzMXEd5QgyotXHjn9LRUckCDDirdo7zoms3e1qO1cA2FcfiZQsueYmeYvn3mCpjDwK7ojQ2hpo1qtLwJFr5r987X7TYVAgxFr62w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNXy4+uNae/wj0KYsQCSgQVNoWDjOYKOm9OrEgS8sro=;
 b=x5hcRKgzTSHlakswKVxmzq0cDnIhG3KCrV7CT80fMIkNi48kimmQbCs02UVLjh0mVVwy1wIBrJjqx5RYURkikF2f6gvRbry388o/Ik5USxVfCR/7VXUT7LrSqR445k21AtHSH2LOUR8o4gBGAoBMdPGw/ilw3QgzrqeCoXWuAtY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <47c54c8b-98bb-5bbb-d5a1-05214e51537b@amd.com>
Date: Fri, 31 Mar 2023 15:24:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: Need help on a issue (Unable to schedule guest for Xen on Arm)
To: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <b4badb12-8887-d8d8-138e-8b4536ad95a4@amd.com>
 <2f7a00eb-50c9-bee7-231e-9285ffa4c9a9@amd.com>
 <e556f895-2b3f-92eb-a6be-e51f04fc869d@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "Garhwal, Vikram" <vikram.garhwal@amd.com>
In-Reply-To: <e556f895-2b3f-92eb-a6be-e51f04fc869d@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0028.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::20) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: e9802754-ca3d-4383-22ec-08db31f39f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UOjXwxMnTQLGsxnS2hfCgR3/7G5VTZiyOGdNs/FGYlN9w28J5/6nNSOCJSqlnsg5uNCNbwt8a1rvbAIVpFWmc00rlFlaxN8vAcjWFhLcakFmn4UPCNl+gXoi7qu+cnfw0ZNv6ouo16A6yapRdJOvhNcVn+qXcTAIsAZMnIu3N/mjQDJBaEcbN8U8Do9mq/FhPjo+IDfCIcK7PE+Xk42AWeF4ExftuMNHOmxtwDGfe2h7fFrdffT98fZzysDlwp/8/0CYdjj699V1fzrhjtpoWHkTrQfuODSPwXPl+FyxsF4WRQJtkHWiXu56lfuAeHkWbZSVqjWoVoAkv6Y/hdgraTS6Xv7KTmx1C4J0zZ31plvaoyZVN7/NeuYYj9ol/KeSKJw+Z07nOhuAIa0+4hA97sUCj4oJnYwQ82nMbOUKuWp8Fhd4p1Vb8iR8cugWFIYbfR7HRpuqC/b6amX7T2JyIfimR7JS400yOHv3dbp3xMkn4vx2u8e2M/oT1hI7zEwrargy+hLg6wEJT3ByAIkNOb14PULY08NcMMijvnDrqruNEyjyoKVidmmseqSMFtqKUZukqsqmQ7q5GjyfQCvn1OQGd9p4Im0pPFVuaG+noFKzAFKfpmXQpAw4Pzyf29hAekcSC/zDlVB4dRSoNcItCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199021)(186003)(316002)(54906003)(478600001)(31696002)(36756003)(6486002)(8936002)(38100700002)(2906002)(5660300002)(4326008)(66946007)(6916009)(66556008)(66476007)(8676002)(41300700001)(6512007)(26005)(53546011)(6666004)(6506007)(83380400001)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1cweDRONUVLd1UyV1ZMZUIwdmQzWi93UDV2R3hGQUc5TXRQSkdvcklxUitF?=
 =?utf-8?B?clJCT2FDVGNaS0VTRC9teVJacU9UVHNWZlYyMTVFUE9NdjdZd2czMTh6bmpC?=
 =?utf-8?B?Uzlsa2UxdlBWOVNtZGtDdFRtQkNoWWZsNlE1RHc1VmZmaENXRGtaTGM3OThJ?=
 =?utf-8?B?RDNXcXZVejdiZVkwMklPN2ZBeDFZN2R4elVWUExpQThxUzl2YWJVYmhWNHhJ?=
 =?utf-8?B?cFpkQVhDNDgyVldCRTFwSFVTei9xbC9DNW1aMmxRY29DN2RzQXJKWGQwNWF5?=
 =?utf-8?B?NngrUERKQzlSTUVVSGdJbXBGdHhnRndXdk4wQWV6Y0NtY1lnTmJjcXUyWXlB?=
 =?utf-8?B?NVY2dEFnenBqWmoxejdRMWJtZS9iUDg0TERoMDJHZmI5cTFNL0lFZGRxL2Nx?=
 =?utf-8?B?cDVKTUhCQnFLTURZSHBhRlBHaEZnMlYxQTB4Z1c5QXFjazF6emtUYVN4NjRm?=
 =?utf-8?B?eXZ0SzF4dEIrR0dVc0xieXRJc3VhSVV1Ly8vRytsbGQzRXM3VEo3M3YyM2xI?=
 =?utf-8?B?NFFnV3Q1VmZEd0NPMDh2T3M4SGNVdW1YTWR5TVRCOVhVV2RnM1ZIck9hSnBH?=
 =?utf-8?B?VllVbUpZRXE0OEFwUko5ZFY4cmV1cWtNNmsyYTB2L3BGOExPV2xBa0dnOEFE?=
 =?utf-8?B?SUswSjZONXZhYnpwZGNCb3Rnb0wzaEJSQkJJcjFQd1VxKzgzREd6d1FnR1dE?=
 =?utf-8?B?bzF0MTZOeTZuM3BYZlZoRzFFTHArbjZxNVlzYi96aTJ5NTlFVmdPZGZ4MHYw?=
 =?utf-8?B?VytDUnZoVHB3NHJGdW5pN3pzTGJnVmVZTXZhMlZWa1F4SEx1M2FNQzZ6eGRJ?=
 =?utf-8?B?VTZDRUc0WGlLT1E1ZFFIM293dWxpdWQ0OUxhQXpSMHhiZmJOcTlxWHc0S3F0?=
 =?utf-8?B?cmtlY2FmRVUyUDJpSElZRzc0aCtBMnZZRlpNUWlvWGZ6a0xDU3c2SlJMRUtZ?=
 =?utf-8?B?WkJiNGcyS1oxeXJHMmd5bmhSRmdPTEdBMlQ2VmZ1WVhreGRuUklLMDRiQkcx?=
 =?utf-8?B?dXRBNUhaWmVDTDJRb3Jsd0ZiTjBkMHQxYlZVbER6NE5BelZlVHU5R2ZqR0da?=
 =?utf-8?B?S0NLUXFVN0V6ZjBqWDBlVCtvZWhHbjZ5aUZpZnJieXJQTFdNOWFNdVRmY1lj?=
 =?utf-8?B?M29yZWtmcExrbmJ4TWZDcUN4dFlSSndSeWJtMGdjT0FMU2ZvRlJXWkZJTkJ1?=
 =?utf-8?B?NEVGcWFER1Brcmg2NUJDRitwQmhmbDRadFhSTy9kNzQwdERSSXdXOW9KOGRi?=
 =?utf-8?B?SkNtRG5teVNOek04UkFHdTV3dW5OTXlGTlphQ1JmVVpTRzNSaDlMYnNHeVZ3?=
 =?utf-8?B?NU1pT2ZWbkF4eHpxZGVJZzZubXQ5anFRbmhDVmplMzdVUk9LaGFsRHJDbzQ2?=
 =?utf-8?B?eFlMNVRkbXNWTElGZzJCUmpBbDdTbEh5Q2djb3lWRlQzNDhmWVlZQjNqVllZ?=
 =?utf-8?B?Q28remUyR1JUa2NIZFEwMkkrbm9iNWVWTHpmQVZiK2NHYVVNTEIra1o4KzRk?=
 =?utf-8?B?RC91QnlrallyTGQzbXZDWTRaN211N201bGpKamo1TEJpdmE3bFIwS1plQmha?=
 =?utf-8?B?eGE2OWQyNnAvRDdFTWZhM0I1MVlSTFEwUHFwV2Uxc2ZIWFI1S3lkcFN1a2J3?=
 =?utf-8?B?eFg3cGFKOFZMYU5RMTFMRzhld2RBdHBBYTBhZ3pBdWwwLzR4OHh0c21uUy80?=
 =?utf-8?B?ZFk1eEtJMDh2QlVHbldHeTZoRjF3OFZCZmJya3NYWHJYSnk3Wm4xeVJUY3hN?=
 =?utf-8?B?YVN3blROcklKMzB5SEd1b3R0R1lvUk52L2YxR2t3cldXLy9aZkQ4YUZNQ05I?=
 =?utf-8?B?UVNCYjZTRmNYK0I1SHVuaTh5VitiZ0U3aHJOdlpNRFVpZmtlRGZSZVhEUU1a?=
 =?utf-8?B?TnBnanFjeFZ5VG5MYjVwUkttM2RPUllKZTRiWWk0UmRHcVI2SzIvNDl0engy?=
 =?utf-8?B?RnAxbTdWdXVpTGVNeUdPa1VlZWROR3ZGaFpqY3VISGhUSUdNRTRRT0lKT0pV?=
 =?utf-8?B?QjZZaEd5NEwvM0ZNUHlJbGtrU09malMrVUYwcDAyNUJmNGtKZDR3RDVIb1ZZ?=
 =?utf-8?B?SmZOMzhRWFVlUjlMdHYrRVhhWjFGbzN1TjVYRU9tT2VRTVZXL2g2cWNVZ0w1?=
 =?utf-8?Q?MMkNVYLvB2MJh/iEJC4+miZM2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9802754-ca3d-4383-22ec-08db31f39f23
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 14:24:22.2681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTx+Mli9jGi/Jk7fxSL4mpKAw3Y77o39nB71AY106vXhwSrZeO0IPfNPyxsi3s6TMcmctJMjGmgtXsNTGcqFKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579


On 30/03/2023 17:19, Julien Grall wrote:
> CAUTION: This message has originated from an External Source. Please 
> use proper judgment and caution when opening attachments, clicking 
> links, or responding to this email.
>
>
> On 30/03/2023 16:57, Ayan Kumar Halder wrote:
>> (Apologies, fixed the formatting issue)
>
> Hi,

Hi Julien,

Appreciate your inputs.

>
>>
>> On 30/03/2023 16:50, Ayan Kumar Halder wrote:
>>> Hi Xen experts,
>>>
>>> I need some pointers on an issue I am facing.
>>>
>>> I am running my downstream port of Xen on Cortex-R52 hardware. The
>>> hardware consist of two R52 cores (the second core is in lockstep
>>> mode). So, currently the hardware does not support SMP.
>>>
>>> The issue is that Xen is unable to schedule a guest.
>
> Are you sure about this? Because...
>
>> So
>>> leave_hypervisor_to_guest() ---> check_for_pcpu_work() and this does
>>> not return.
>
> ... leave_hypervisor_to_guest() indicates that a guest vCPU was
> scheduled. Before we return to the guest we always check if there is
> some softirq that need to be handled. So...
>
>>>
>>> Debugging this, I see  check_for_pcpu_work() --> do_softirq() -->
>>> __do_softirq() --> timer_softirq_action().
>
> .. the fact that check_for_pcpu_work() doesn't return seems to indicate
> that there is a softirq that is always pending. Can you look which one
> it is?

Yes, it is the SCHEDULE_SOFTIRQ which is always pending. What happens is 
in timer_softirq_action()

     /* Execute ready list timers. */
     while ( ((t = ts->list) != NULL) && (t->expires < now) )
     {
         ts->list = t->list_next;
         execute_timer(ts, t);  <<<---- This invokes s_timer_fn() 
--->raise_softirq(SCHEDULE_SOFTIRQ)
     }

In the next and all subsequent iterations of timer_softirq_action, the 
following gets executed

     while ( (heap_metadata(heap)->size != 0) &&
             ((t = heap[1])->expires < now) )
     {
         remove_from_heap(heap, t);
         execute_timer(ts, t);  /* again raises SCHEDULE_SOFTIRQ */
     }

Thus, SCHEDULE_SOFTIRQ is always active.

So I tried to debug how "t->expires" is set.

It gets set from set_timer() which is invoked from do_schedule().

"set_timer(&sr->s_timer, now + prev->next_time);"

And "prev->next_time" is set from csched2_schedule()

"currunit->next_time = csched2_runtime(ops, sched_cpu, snext, now);"

So, looking at the timer logs .......

timer_softirq_action; 517: t->expires = 0x1415dc73b8  now = 0x14f3b757e8

timer_softirq_action; 509: expires = 0x169ea47ae0 now = 0x17cfb0ac70

timer_softirq_action; 509: expires = 0x1967f86738 now = 0x1a990325b0

timer_softirq_action; 509: expires = 0x1c3149e290 now = 0x1d6254c818

I tried a hack as follows in credit2.c :-

@@ -3740,7 +3744,9 @@ static void cf_check csched2_schedule(
      /*
       * Return task to run next...
       */
-    currunit->next_time = csched2_runtime(ops, sched_cpu, snext, now);
+    currunit->next_time = (0x200000000 + csched2_runtime(ops, 
sched_cpu, snext, now));

With this, the softirqs get cleared. Also reprogram_timer() get invoked 
with non zero deadline and I get timer interrupts.

So, it seems I need to debug csched2_runtime() and see why 
"currunit->next_time" is not set correctly.

- Ayan

>
>>>
>>> In timer_softirq_action(), the problem I see is that for all the
>>> timers, "((t = heap[1])->expires < now)" is true.
>>>
>>>     while ( (heap_metadata(heap)->size != 0) &&
>>>             ((t = heap[1])->expires < now) )
>>>     {
>>>         remove_from_heap(heap, t); <<<<------ So, this gets invoked
>>> for all the timers.
>>>         execute_timer(ts, t);
>>>     }
>>>
>>> So, further below reprogram_timer() gets invoked with timeout = 0 and
>>> it disables the timer. So, timer_interrupt() is never invoked.
>
> Which is expected because there is no timer armed, so there is no need
> to configure the physical timer.
>
>>>
>>> Can someone give any pointers on what the underlying issue could be
>>> and how to debug further ?
>
> See above. You could also look why there is no softtimer pending and/or
> where Xen is stuck (e.g. the PC).
>
>>>
>>> I do not observe this behavior while running on R52 FVP. The
>>> difference is that for most of the timers "((t = heap[1])->expires <
>>> now)" is false, so reprogram_timer() gets invoked with non zero
>>> timeout and subsequently, the timer_interrupt() get invoked.
> This reads as one of the following:
>   1) There is a missing barrier
>   2) You didn't properly configure some registers
>   3) There is an HW errata (I know that some of the Cortex-A had an
> issue in when reading the Timer counter but seems unlikely here)
>
>>>
>>> Also, looking at the following from xen/arch/arm/time.c.
>>
>> /* Set the timer to wake us up at a particular time.
>>   * Timeout is a Xen system time (nanoseconds since boot); 0 disables
>> the timer.
>>   * Returns 1 on success; 0 if the timeout is too soon or is in the
>> past. */
>> int reprogram_timer(s_time_t timeout)
>> {
>>      uint64_t deadline;
>>
>>      if ( timeout == 0 )
>>      {
>>          WRITE_SYSREG(0, CNTHP_CTL_EL2);
>>          return 1; <<<<<<<<<<<<<<<<<<<<<<-------------- Shouldn't this
>> be 0 as the comment suggets ?
>
> I think 1 is correct because we want to disable the timer so this is a
> success. 0 should be return if this was effectively a timeout.
>
> FWIW, x86 also seems to return 1 when the timeout is 0.
>
>>      }
>>
>>      deadline = ns_to_ticks(timeout) + boot_count;
>>      WRITE_SYSREG64(deadline, CNTHP_CVAL_EL2);
>>      WRITE_SYSREG(CNTx_CTL_ENABLE, CNTHP_CTL_EL2);
>>      isb();
>>
>>      /* No need to check for timers in the past; the Generic Timer fires
>>       * on a signed 63-bit comparison. */
>>      return 1;
>> }
>>
>>> Kind regards,
>>>
>>> Ayan
>>>
>>>
>>>
>>>
>
> -- 
> Julien Grall
>

