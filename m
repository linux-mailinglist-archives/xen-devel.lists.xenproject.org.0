Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628697CFB3B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 15:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619335.964233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTCO-0005Vk-QE; Thu, 19 Oct 2023 13:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619335.964233; Thu, 19 Oct 2023 13:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTCO-0005TL-NE; Thu, 19 Oct 2023 13:36:28 +0000
Received: by outflank-mailman (input) for mailman id 619335;
 Thu, 19 Oct 2023 13:36:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=in48=GB=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qtTCN-0005TF-IG
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 13:36:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 803275ac-6e84-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 15:36:26 +0200 (CEST)
Received: from [192.168.1.9] (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id B6CD14EE073D;
 Thu, 19 Oct 2023 15:36:25 +0200 (CEST)
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
X-Inumbo-ID: 803275ac-6e84-11ee-98d5-6d05b1d4d9a1
Message-ID: <fe5084f4-e5f3-4778-87c7-faac2076bde7@bugseng.com>
Date: Thu, 19 Oct 2023 15:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/4] xen: address violations of MISRA C:2012 Rule 13.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <1e0f12095bcbc82ae3585c9fcf57bec7e324049c.1697638210.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2310181803351.965337@ubuntu-linux-20-04-desktop>
 <78a7b73a-fefb-6884-90c5-abad2860a521@suse.com>
 <27fcfc87-aa8f-4bfb-863a-91a75c763050@bugseng.com>
 <5c9b851f-6f64-f6bd-970a-63aefdab5b41@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <5c9b851f-6f64-f6bd-970a-63aefdab5b41@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/23 13:19, Jan Beulich wrote:
> On 19.10.2023 13:12, Simone Ballarin wrote:
>> On 19/10/23 11:35, Jan Beulich wrote:
>>> On 19.10.2023 03:06, Stefano Stabellini wrote:
>>>> On Wed, 18 Oct 2023, Simone Ballarin wrote:
>>>>> --- a/xen/common/sched/core.c
>>>>> +++ b/xen/common/sched/core.c
>>>>> @@ -1504,6 +1504,8 @@ long vcpu_yield(void)
>>>>>    {
>>>>>        struct vcpu * v=current;
>>>>>        spinlock_t *lock;
>>>>> +    domid_t domain_id;
>>>>> +    int vcpu_id;
>>>>>    
>>>>>        rcu_read_lock(&sched_res_rculock);
>>>>>    
>>>>> @@ -1515,7 +1517,9 @@ long vcpu_yield(void)
>>>>>    
>>>>>        SCHED_STAT_CRANK(vcpu_yield);
>>>>>    
>>>>> -    TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
>>>>> +    domain_id = current->domain->domain_id;
>>>>> +    vcpu_id = current->vcpu_id;
>>>>> +    TRACE_2D(TRC_SCHED_YIELD, domain_id, vcpu_id);
>>>>
>>>> Also here it looks like accessing the current pointer is considered a
>>>> side effect. Why? This is a just a global variable that is only accessed
>>>> for reading.
>>>
>>> Not exactly. It's a per-CPU variable access on Arm, but involves a
>>> function call on x86. Still that function call has no other side
>>> effects, but I guess Misra wouldn't honor this.
>>>
>>> I'm afraid though that the suggested change violates rule 2.2, as
>>> the two new assignments are dead code when !CONFIG_TRACEBUFFER.
>>
>> I confirm that there is no problem in X86: I will simply propose a patch
>> adding __attribute_pure__ to get_cpu_info.
> 
> I specifically did not suggest that, because I'm afraid the "pure" attribute
> may not be used there. Besides this attribute typically being discarded for
> inline functions in favor of the compiler's own judgement, it would allow
> the compiler to squash multiple invocations. This might even be desirable in
> most cases, but would break across a stack pointer change. (In this context
> you also need to keep in mind late optimizations done by LTO.)
> 
> Jan
> 

Ok, in this case I will just configure ECLAIR to consider it without 
effects.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


