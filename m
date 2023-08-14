Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B8777BA11
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 15:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583669.913938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVXf0-0002xQ-PO; Mon, 14 Aug 2023 13:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583669.913938; Mon, 14 Aug 2023 13:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVXf0-0002vH-Mi; Mon, 14 Aug 2023 13:31:06 +0000
Received: by outflank-mailman (input) for mailman id 583669;
 Mon, 14 Aug 2023 13:31:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVXez-0002vB-TI
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 13:31:05 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe02::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d155fdc9-3aa6-11ee-b289-6b7b168915f2;
 Mon, 14 Aug 2023 15:31:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8229.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 13:31:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 13:31:02 +0000
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
X-Inumbo-ID: d155fdc9-3aa6-11ee-b289-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Spvu4NxQ7BlvFNyNIcdSjVqrtOg0Mq4UZ+h9rkcoGxoDOvNjrBaUNfWFO4sjuO8MzPDwOnM1qvnImh12lypXhUZnOydmAPsK4ykkz5ZBBUwxSdR3EVxdNiZSKcm5rn2vT4ZFn/SVyp2E3L+hg0QMoILzOdrubIaUz9WnUhcxhACO4m6ZZlgbU7pHHcUfpejpy5iQO1fV2WdWzd+lqByuRjZGYgtGMAOqscNf4NfYkGP7ts/ZIvnhRxfXFCKcpNoDdE/8alsufWRB3lSyOyXD3qYYUethzKuDDUdrwtLPHbc4d2aOtNe5NrgYLLYsHRTfxCfAp8UTnOtuuQrYkikoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4N21x2PYQBwplhFwLAZMxdH8I8szlzyEDAroh9bO8M=;
 b=I0zeIp+3YD51ZolndJDXK3j2PgizkSkLjpJisDXVpPd0bRAJXCJsRtyKo2Ttoxl/vXDoYGQWbTzdzHoXZpdNNxusJOvoy98EItUN4WSbuLHF0ma+GaxuaSciwZlqGhvFu8YqPBjKIafRPQKWmVGDua9mYoaeg7TmUuqsNSToF3yPKC6BYTCf0HoDD7CwWxDyRD+8o6vhMH/D+WQFebkyYpYVe762w/dDjAvrJMzsXh2UIILRiqyy1dfXghVYv7dwClKSZDw08f/ZLiuHWR+pgaClhm56+6xZMTFeA4RXIXB0jJv2N89w8vDvoXD8tvDyWcQdZ7B5EZQtwUFtoKe/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4N21x2PYQBwplhFwLAZMxdH8I8szlzyEDAroh9bO8M=;
 b=MAQ93MBjmXA4vTQNtkz7TR3+9GiaoCoTDA7Y+Uguq5IY6KJtwxynjNk5c5x7VCZaMiNGCE6JaINqZ9uFeGj3b9bBctHJbvpIA8AMxk/FixIit0j+5lyqQuilgdThM2dMAjRSeQQeYPxzetwxhW7BDd7bWbFGS6dcR71kn0bTyH/z4ZQ8+/vJrtjILsJ42j8pqEmPaS8Htb1agc6oUhIvn/MnULaKUCm1NORkRjn9T/ShoUyHeLWzXv5RQTFXFeda3tv01NzmY8xH6ycyVmwC49FucnU6VRNiVkpzrDS6oAU9uU2MYn6054C679cXF3z4oxoIDiQwMG3X2kaMjHgTcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ae77fda-379a-09ef-0aa5-83568b9eff6f@suse.com>
Date: Mon, 14 Aug 2023 15:31:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 3/6] x86/vm_event: add missing include
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org, tamas@tklengyel.com,
 aisaila@bitdefender.com, ppircalabu@bitdefender.com,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <f303a1782aeb67186c3181e01a51153fdce70cfb.1691676251.git.nicola.vetrini@bugseng.com>
 <30d1ef98-d847-b0ca-6771-4bc0abcdb214@suse.com>
 <808999f0142825bebfdbe16a309d529f@bugseng.com>
 <935367a1-7fc1-4df6-901a-e25e983aeed6@xen.org>
 <87c7a0fa02066c65e5e80830d6868014@bugseng.com>
 <5dda39e3-14f8-487d-a2df-0bf6734bd192@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5dda39e3-14f8-487d-a2df-0bf6734bd192@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d20dc9-c2fb-49be-8742-08db9ccab46b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	by8e+rLTNbd1jKPoAI6H+b8VVx4PNyA1fqqGzN6TcqRRQokieVIyNn1m3sJwzwrBXV4mekUEPQnvX960w+iSLhGuJydEzrnYkyvbwxpa9v5N4maEDi0ynSaDGIm0e/k6/nGa7zINnaTs+kfAWCrgutm1oR06eKSxxGJyYy6/SFHtlRYOP9dPRN6ltqbzIaKReYBysbSWq8Xr7LRHyDJ6sjtW0BsHGBD/SMudc3dPlgyHFkoxDm/1MeXGsQg3zAUSKuDcLTUzBBUgGllrFx+X+RTkQlTBZwSSU3y5QHNJq0uGIDvWi8TIJAZnd1YxzLmzx2k7RNcqTWio3ZZtoz8Fpv3PEaXFYvYgCQdiXMsz6rrNqAYVBVjOWE/FzK52+WoXYWnIK+4yoRUkcuV5RJl2ri/GxSJ76zWdnjrD2aF30iH/kT3MPChdlTIGeRwJekqP4rTvE038fOyfDTRRiOPLmnEUtJpCPhiZrYSpB6yTEwZL8m2azUJ0BVjHBvfSMz9X3FTDwGVtUiAvpbHTqmAHDRAv0wiILoL6EMgIG1YoVIU1eDjsXwYWyvJeXsx/kTGSF5rl9AoF9ZnHRwcYcZz6xy31DIakZ0JdFNdZ44BeE/WrpGTKd+YMl0JaFYkRbrLtWFCe8oFgopRZQ67pT3mnIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(376002)(366004)(39860400002)(1800799006)(186006)(451199021)(53546011)(26005)(6506007)(41300700001)(8936002)(66476007)(66556008)(66946007)(316002)(8676002)(6512007)(31686004)(2616005)(83380400001)(6486002)(478600001)(38100700002)(31696002)(36756003)(86362001)(4326008)(6916009)(5660300002)(2906002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTZKbmxqVDJBWkNiaFpQRGpsTnEwV0xOYTZNTzZ0dlZJeDdsQXFocUlHMmRR?=
 =?utf-8?B?cG1tOXpvMHlmQ3ZHZExaa0IwUjkzRGJvdjhjdmJ0RXYvNlduWXBNMndaWHNW?=
 =?utf-8?B?WlZ2RE9iS3Q0aXpaekNHOWhwcHI2akVyQXFsc3U2UWk0bEp5L05YYld0NlYw?=
 =?utf-8?B?ejRIdWI3TmNJQzdVNkszQ1V5eWtqcHNmNzNEQ0dhdzh6R2ovUTkwdklkTVFP?=
 =?utf-8?B?cTV0SFZDaEdpSVowdW9zYnZuVWwvblhlbnZPVWxuVDJkc0FhOTd2N3RDT0dP?=
 =?utf-8?B?Ymt0TDVOV1hSbTZYeWYrSE4vQ1BCdEJEVkkzazVmbjhKVUNMOUxIbDNXMWM0?=
 =?utf-8?B?Vlhic2Z0b0lHSWMyamdNdm84RjdXUnU5RU5aaEFxU0ZsMXhjK1pveDVzRDZL?=
 =?utf-8?B?WmF0SGN5RTV1aUVLK3dDeElURDVEclNXQ1hsS3dWYjN5cHlLQjhlWGxRYW9P?=
 =?utf-8?B?WEhiR0JDWk9COGNGeVlPYTZMdmhyVzl5SkI3OGZJMkwrR2ZQT1B5by9kWHdo?=
 =?utf-8?B?WTZlMzlXWWUvMEZqMkRnQ1RQd3F2ZEU3UTBDUHNSQ2FZcU1KcDA4OEd0bXI1?=
 =?utf-8?B?Z2ZoTnpvOE92Q0IxWGluWSthM2FHL0VuTnN3YTBIa2RQRkNIQnVKNlVGQkhF?=
 =?utf-8?B?UW9SNDBTMVZ5aDc4RWhXV0ZXL0kyM3hxNWJuL1U5QW0vWnFZMkJlU0hmYmFs?=
 =?utf-8?B?c1JpbG9pSnZTZDhnMEI0Y1BteDlodDJtTmxxRFl0NEZxcldxUUFudll6NVVl?=
 =?utf-8?B?ZktuZjdnMUR6WlRsWFNWZUJQdDFaeFdPcVJxb0FOVzVqSXdtbk9YOFF5SVdE?=
 =?utf-8?B?V01hSUdubHA1VVFZM0hVQ3RrN09KSHZOZmtlWkdUN0ZRc1VtR0Q2NUlPN3lB?=
 =?utf-8?B?L09GeGNCL281M0xvOWFmZXlGWU1vS3FiVkhveUVWbVh5OXh3STM5TDJ6WmVK?=
 =?utf-8?B?R29VSDRiZGZGelFtd2xJam9uV0ZOc204Y2oxRGZ2NUdQZkRvUUdPZVhNWkEv?=
 =?utf-8?B?aHBScGRZTngvbnM0MzM1NXY0YWhmSzlQVG01RzRPK0w1Vk5jR0VtZkZDcmdK?=
 =?utf-8?B?SzBBWHFJVFAxQk42RFY5Y1dHWTlLb0x5c01udHpZVTlYK2JJdThzRi9haEdT?=
 =?utf-8?B?Zk8zSE15QlFURjVJUGtSNTRyVXMya283TnpMWkNEQTFGaXR5aFlBY0RleEs0?=
 =?utf-8?B?Z1U5RHlaeXdleXYrRlVEaEw2Q3BTK2dMYnNTeGdHQ3N3NzRzbVd4dUM0OVNo?=
 =?utf-8?B?d01TTmRya1ZIWU1iWWhvVnhBc002dnF5Slo3Z1BuVEozbmFyUjB1aHNHNW16?=
 =?utf-8?B?UGFGZUJSK2x0VHpEeDN6eUtFWUIwMGtqSkVRbm8xbDh3TEp0dEpmL2N4Wi9m?=
 =?utf-8?B?cEJLdzMzd0gxYWFGVHRZSU5VOUV0ZjVmVy85UnJ0a1gwVHphQVpGQWgyRnVn?=
 =?utf-8?B?YWE5Ri8wZzVKQ2JmNWFLVGNPeTFIdnBHaTlQREtnL0Mrdm91akkvM0RhUy9z?=
 =?utf-8?B?Qk9zOVdDbms5dkZtU1VUUXdOVVV2ZWdGb25HeWVZM1dja0I2RDlVM1ZNVFJZ?=
 =?utf-8?B?bWd1RGFVRUtEb0ErL3J5Qzg1TnJNS3JKMDR2alNlT2xnZzN1K0JxV3ZMVWg4?=
 =?utf-8?B?M0xqSVFkM1drSzExa0pQNWxpVE8yeStEa281OHlMckdtdnlqQzh6bzZuOGg4?=
 =?utf-8?B?Z000WVdPM2t6RzF1LzVxaUczeGR5WXJ4WC9zT05GTE5XTXRlRUh4MFgvU0dK?=
 =?utf-8?B?WktBOGRMUlBSOUdQdnZlL1ppcWJUVitiVzlQSmpiWmdBdVVkQXJGMG9IbFlK?=
 =?utf-8?B?eG9tU0ViekgyNDQ4bFFyNlM2THNlM0ptRHRlcWJjVjJFRGlpS0VIZEhxY05V?=
 =?utf-8?B?clBUaDNYMmM3OHhEWVFOR1dOSDlGcFh5Nklsd0FtUFZwYURad1hHMkhDMzcw?=
 =?utf-8?B?bjlxUWxHSGlxTWtqa0tMbWN6dC9LWE0xL2RsNSthMXppdVBpQm53N1ZjMGJh?=
 =?utf-8?B?L1NLZ2NXZXkwQUN6RzBPL1I4cDBqMWppTnNaaDFwdUx2cVVQOUJoZ0N4Ym9m?=
 =?utf-8?B?ajVPbytHSysyL1k1ZW5ZcHBpdTBiVm1LOVBRZjJmOHNySlNYQk9XSTRZcnRC?=
 =?utf-8?Q?TU9KekqvTdqGj8+6LPRbdOpOy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d20dc9-c2fb-49be-8742-08db9ccab46b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 13:31:02.8221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8u20yvgIisNUbo611aebFMbaJez1xhSQ7QAwQbizQHO9olVBeoBJiw/An0qgiRxvpZj9B4uZkzxPWVXLDxRkDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8229

On 14.08.2023 15:06, Julien Grall wrote:
> Hi Nicola,
> 
> On 14/08/2023 13:53, Nicola Vetrini wrote:
>> On 14/08/2023 13:01, Julien Grall wrote:
>>> Hi,
>>>
>>> On 14/08/2023 11:33, Nicola Vetrini wrote:
>>>> On 14/08/2023 09:39, Jan Beulich wrote:
>>>>> On 11.08.2023 09:19, Nicola Vetrini wrote:
>>>>>> The missing header included by this patch provides declarations for
>>>>>> the functions 
>>>>>> 'vm_event_{fill_regs,set_registers,monitor_next_interrupt}'
>>>>>> that are defined in the source file. This also resolves violations
>>>>>> of MISRA C:2012 Rule 8.4.
>>>>>>
>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>> Fixes: adc75eba8b15 ("x86/vm_event: consolidate hvm_event_fill_regs 
>>>>>> and p2m_vm_event_fill_regs")
>>>>>> Fixes: 975efd3baa8d ("introduce VM_EVENT_FLAG_SET_REGISTERS")
>>>>>> Fixes: 9864841914c2 ("x86/vm_event: add support for 
>>>>>> VM_EVENT_REASON_INTERRUPT")
>>>>>
>>>>> It's hard to see how it can be three commit here. The oldest one is at
>>>>> fault, I would say.
>>>>
>>>> Since the patch is concerned with more than one function then in a 
>>>> sense I agree
>>>> with you (the headers should have been included in the proper way the 
>>>> first time around), but
>>>> then more definitions have been added by adc75eba8b15 and 
>>>> 9864841914c2, and these should have
>>>> triggered a refactoring too. I can leave just 975efd3baa8d in the 
>>>> Fixes if the preferred way is to list just the first problematic 
>>>> commit (perhaps with a little explanation after --- ).
>>>
>>> To be honest, I don't exactly see the value of using Fixes tag for
>>> those patches. I agree they are technically issues, but they are
>>> unlikely going to be backported.
>>>
>>> So if it were me, I would just drop all the Fixes tags for missing
>>> includes unless there is an actual bug associated
>>> with them (e.g. a caller was miscalling the function because the
>>> prototype was incorrect).
>>>
>>> Cheers,
>>
>> Adding those tags for this kind of situation was requested on the 
>> previous discussion [1],
>> so in this series I kept the same strategy (though probably here I put 
>> too many of them).
> 
> I disagree with the suggestion made. They are just noise for this sort 
> of patch and require extra digging (I assume you spent 10-15min to 
> figure out the multiple fixes) for a limited benefits (I don't expect 
> anyone to backport the patches).

While I agree that Fixes: is primarily for marking of backporting
candidates, I don't think this is its exclusive purpose. As far as I'm
concerned, it also aids review in the specific cases here (this isn't
a commonly occurring aspect, though, I agree). Yet the primary reason
I asked for them to be added is because each of the omissions is an
at least latent bug.

Jan

