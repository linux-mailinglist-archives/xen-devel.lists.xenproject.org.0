Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD1AF15A5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031049.1404740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwa2-000538-Hd; Wed, 02 Jul 2025 12:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031049.1404740; Wed, 02 Jul 2025 12:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwa2-00051I-Er; Wed, 02 Jul 2025 12:28:50 +0000
Received: by outflank-mailman (input) for mailman id 1031049;
 Wed, 02 Jul 2025 12:28:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uWwa0-00051C-O0
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:28:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uWwa0-00EhZg-0A;
 Wed, 02 Jul 2025 12:28:48 +0000
Received: from [2a02:8012:3a1:0:d050:4cf0:af44:4b0]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uWwZz-0086Bo-2a;
 Wed, 02 Jul 2025 12:28:47 +0000
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
	bh=bmyeUxFnXSaNl4LZ76AEtNSRo9CuRcjFOTgdt9RvJGI=; b=2b8Fpi58s+76Ij5FpeOCohH7GD
	7YKbv4BXhJhPCtw1IoDJBspSw5n8Gd8JxhlZgn8bY8PhbDiRIBxGeUpBpcxp6Fk15iRrmqX4vItGA
	Vj5C8+20Ebprtn8JS0BGNmm0FhG/bAO+8owwnQJCau1w9SYk1Ofae7HgUf07CE/g3ssk=;
Message-ID: <3cf697b8-9c23-4e24-980e-3f9696692bb4@xen.org>
Date: Wed, 2 Jul 2025 13:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1751020456.git.mykola_kvach@epam.com>
 <072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola_kvach@epam.com>
 <066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org>
 <CAGeoDV-Zze2LtAdofS5EENkANH46SGU3+kqHkTB-k33MBmBXLQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAGeoDV-Zze2LtAdofS5EENkANH46SGU3+kqHkTB-k33MBmBXLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/07/2025 11:01, Mykola Kvach wrote:
> On Sat, Jun 28, 2025 at 9:17 PM Julien Grall <julien@xen.org> wrote:
>> It would be better if we stash the value sand then update the registers.
>> Another possibility would be to entirely skip the save path for CPUs
>> that are turned off (after all this is a bit useless work...).
> 
> Do you mean we should avoid calling ctxt_switch_from for a suspended
> domain?

This would be one way to handle it. I haven't looked in details whether 
there are any other implications.

[...]

>>> +{
>>> +    struct vcpu *v;
>>> +
>>> +    spin_lock(&d->shutdown_lock);
>>> +
>>> +    d->is_shutting_down = d->is_shut_down = 0;
>>> +    d->shutdown_code = SHUTDOWN_CODE_INVALID;
>>> +
>>> +    for_each_vcpu ( d, v )
>>> +    {
>>> +        if ( v->paused_for_shutdown )
>>> +            vcpu_unpause(v);
>>> +        v->paused_for_shutdown = 0;
>>> +    }
>>> +
>>> +    spin_unlock(&d->shutdown_lock);
>>> +}
>>> +
>>> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>>> +{
>>> +    int ret;
>>> +    struct vcpu *v;
>>> +    struct domain *d = current->domain;
>>> +
>>> +    /* Drop this check once SYSTEM_SUSPEND is supported in hardware domain */
>>> +    if ( is_hardware_domain(d) )
>>> +        return PSCI_NOT_SUPPORTED;
>>> +
>>> +    domain_shutdown(d, SHUTDOWN_suspend);
>>
>> It would be good to add a comment explaining why you need to call
>> domain_shutdown() first. Otherwise, one could wonder whether we can get
>> rid of the complexity when a vCPU is still online.
> 
> It's done first here because domain_shutdown() handles pausing of the
> vCPUs internally, and this allows us to securely check whether the vCPUs
> are online or not without interference from the guest.
> 
> But you're probably right — a better solution might be to perform proper
> checking of which vCPUs are still online before calling it.

To clarify, I think this is right to call domain_shutdown() first to 
avoid any race when checking which vCPUs are still online (see the 
discussion we had in the previous version). My point is it would be good 
to document it in the code because this is not obvious.


>>
>>> +        if ( v != current && is_vcpu_online(v) )
>>> +        {
>>> +            do_resume_on_error(d);
>>> +            return PSCI_DENIED;
>>> +        }
>>> +
>>> +    ret = do_setup_vcpu_ctx(current, epoint, cid);
>>> +    if ( ret != PSCI_SUCCESS )
>>> +        do_resume_on_error(d);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>    static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>>>    {
>>>        /* /!\ Ordered by function ID and not name */
>>> @@ -214,6 +271,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>>>        case PSCI_0_2_FN32_SYSTEM_OFF:
>>>        case PSCI_0_2_FN32_SYSTEM_RESET:
>>>        case PSCI_1_0_FN32_PSCI_FEATURES:
>>> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>>> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>>>        case ARM_SMCCC_VERSION_FID:
>>>            return 0;
>>>        default:
>>> @@ -344,6 +403,17 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>>>            return true;
>>>        }
>>>
>>> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>>> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>>> +    {
>>> +        register_t epoint = PSCI_ARG(regs,1);
>>> +        register_t cid = PSCI_ARG(regs,2);
>>
>> Coding style: For the two lines above, there is a missing space after ",".
> 
> Sure, will fix — thanks for pointing that out.
> 
>>
>> Also, if a 64-bit domain is calling the 32-bit version, then we also
>> need to ignore the top 32-bits. AFAICT CPU_ON also have the same issue.
>> I am not going to ask fixing CPU_ON (it would be good though), but I
>> will at least ask we don't spread the mistake further.
> 
> Maybe it would be better to return an error in this case?

Why should we return an error? This is valid for a 64-bit domain to use 
SMC32 convention.

> Should I also add checks for the case where the guest OS is 32-bit but
> tries to call the 64-bit version of SYSTEM_SUSPEND?

We already have this generic check at the beginning of vsmccc_handle_call().

Cheers,

-- 
Julien Grall


