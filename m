Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937FDACFE70
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:40:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008178.1387403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNScP-0004Ev-Rm; Fri, 06 Jun 2025 08:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008178.1387403; Fri, 06 Jun 2025 08:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNScP-0004CN-Ne; Fri, 06 Jun 2025 08:40:05 +0000
Received: by outflank-mailman (input) for mailman id 1008178;
 Fri, 06 Jun 2025 08:40:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uNScO-00040Y-SW
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:40:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNScO-005B20-0I;
 Fri, 06 Jun 2025 08:40:04 +0000
Received: from [2a02:8012:3a1:0:14ae:50d0:36ad:cee3]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNScO-005ZX9-0q;
 Fri, 06 Jun 2025 08:40:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=YhE94qPD8J4izqCm+ASbSBQeFXzwAy4B0QbwiIbPLwE=; b=hU0dDL2VKret2LqiaMO0gy90KG
	H8QPShijby2RhcMEDc/Lfq/bpFGzLhvUN6sou0q+3WLXC/vqXVp/4HhQl4yR/2pgIYOz4zz0m00Yg
	6uKhzW3sND3adbe3HB80Hy/oD2tklTHnsqvLZ5swXVqpubJXixvXyguLTN3aMgDsOHzs=;
Message-ID: <aaf8c96f-a862-438b-9e16-a38d9f245bf4@xen.org>
Date: Fri, 6 Jun 2025 09:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4][PART 1 2/4] xen/arm: Implement PSCI SYSTEM_SUSPEND
 call for guests
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1748337249.git.mykola_kvach@epam.com>
 <1a8313537603bee36636b0fcd2fdc2f76a2374fb.1748337249.git.mykola_kvach@epam.com>
 <abf5da3e-8e5b-4159-98d4-60bf90672c2c@xen.org>
 <CAGeoDV-gZQ5QzP-5gFmFpNy5B=vUhdaeAbkN1LPFtSXBdGwepg@mail.gmail.com>
 <CAGeoDV9VTj4e0zKnYGJGrHe797oQrbRifbi7qiz-Uc9zFMgrTw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAGeoDV9VTj4e0zKnYGJGrHe797oQrbRifbi7qiz-Uc9zFMgrTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mykola,

On 06/06/2025 09:26, Mykola Kvach wrote:
> On Fri, Jun 6, 2025 at 6:52 AM Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>
>> Hi, @Julien Grall
>>
>> On Wed, Jun 4, 2025 at 2:00 AM Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi Mykola,
>>>
>>> On 27/05/2025 10:18, Mykola Kvach wrote:
>>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>>
>>>> This patch adds support for the PSCI SYSTEM_SUSPEND function in the vPSCI
>>>> (virtual PSCI) interface, allowing guests to request suspend via the PSCI
>>>> v1.0 SYSTEM_SUSPEND call (both 32-bit and 64-bit variants).
>>>>
>>>> The implementation:
>>>> - Adds SYSTEM_SUSPEND function IDs to PSCI definitions
>>>> - Implements trapping and handling of SYSTEM_SUSPEND in vPSCI
>>>> - Allows only non-hardware domains to invoke SYSTEM_SUSPEND; for the
>>>>     hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting the
>>>>     system in hwdom_shutdown() called from domain_shutdown
>>>> - Ensures all secondary VCPUs of the calling domain are offline before
>>>>     allowing suspend due to PSCI spec
>>>> - Treats suspend as a "standby" operation: the domain is shut down with
>>>>     SHUTDOWN_suspend, and resumes execution at the instruction following
>>>>     the call
>>>
>>> Looking at the specification, I am still not convinced you can implement
>>> PSCI SUSPEND as a NOP. For instance, in the section "5.1.19
>>> SYSTEM_SUSPEND", the wording implies the call cannot return when it is
>>> successul.
>>>
>>> I understand that 5.20.2 ("Caller reponsabilities" for SYSTEM_SUSPEND)
>>> suggests the caller should apply all the rules from 5.4 ("Caller
>>> responsabilties" for CPU_SUSPEND), but it is also mentioned that
>>> SYSTEM_SUSPEND behave as the deepest power down state.
>>>
>>> So I don't think standby is an option. I would like an opinion from the
>>> other maintainers.
>>
>> Sure, let's discuss this with the others.
>>
>>>
>>>> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>>>   > +{> +    struct vcpu *v;
>>>> +    struct domain *d = current->domain;
>>>> +
>>>> +    /* Drop this check once SYSTEM_SUSPEND is supported in hardware domain */
>>>> +    if ( is_hardware_domain(d) )
>>>> +        return PSCI_NOT_SUPPORTED;
>>>> +
>>>> +    /* Ensure that all CPUs other than the calling one are offline */
>>>> +    for_each_vcpu ( d, v )
>>>> +    {
>>>> +        if ( v != current && is_vcpu_online(v) )
>>>
>>> I think this is racy because you can still turn on a vCPU afterwards
>>> from a vCPU you haven't checked.
>>>
>>
>> I'll think about how to protect against such cases.
>> Thank you for pointing that out.
> 
> Is that actually possible in this context? If suspend is successful, we pause
> all present vCPUs (including the current one), and control is not returned to
> the guest until either resume or an error occurs in this function. Since this
> runs as part of a trap, the current function can't be preempted.

AFAIU, this code is called before suspend is completed. At that point 
you don't know yet the state of the vCPUs. They may be scheduled on a 
different pCPU. At which point, they can issue PSCI_CPU_ON.

> 
> Also, from the use of _VPF_down (via is_vcpu_online) on Arm, it looks like
> guest requests are what manipulate this bit, which further limits what can
> happen concurrently.

I don't see how this help. See why above. So you will want to at least 
pause the domain before checking if all the vCPUs are offline.

 > Note: It looks like the same behavior is present for VCPUOP_down as well.

 From a brief look, I agree the same behavior is present there.

Cheers,

-- 
Julien Grall


