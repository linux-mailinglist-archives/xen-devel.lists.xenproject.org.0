Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE7A75CB2
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 23:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931780.1333968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz0BG-0001zs-QN; Sun, 30 Mar 2025 21:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931780.1333968; Sun, 30 Mar 2025 21:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz0BG-0001y8-NV; Sun, 30 Mar 2025 21:26:58 +0000
Received: by outflank-mailman (input) for mailman id 931780;
 Sun, 30 Mar 2025 21:26:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tz0BF-0001y2-T1
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 21:26:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tz0BF-000Vri-0v;
 Sun, 30 Mar 2025 21:26:57 +0000
Received: from [2a02:8012:3a1:0:51d5:4bad:16b9:5cff]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tz0BF-00AS3J-0D;
 Sun, 30 Mar 2025 21:26:57 +0000
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
	bh=t2sn3LfiVsPy6HvSXqswysKi/h2aNhRpYPZTzmzUous=; b=DCWXU6S/TGvLSrlz7/OhE5+Ets
	d+eodsov+tAgqviOby428AUhTWgSlqPmyJwz1qLGz5ymqlQuQ/UeGfll7ncoH5fnWfnj/m6yVq+zr
	KhhqmuvQOZHTl/vUsqQ7MrF2X9fhtfKwPJs2RYOGGUZVrH563onMjDZemeIto/0b0RZk=;
Message-ID: <b8f70df9-0004-4733-b73d-33dea2bc37cf@xen.org>
Date: Sun, 30 Mar 2025 22:26:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] xen/arm: ffa: Introduce VM to VM support
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <8f0928b4e94b47d6fed201dcd8cfb1068573b297.1742824138.git.bertrand.marquis@arm.com>
 <338d8982-0a2e-4a40-a9a2-bed8f50d81e1@xen.org>
 <90051748-EA8A-4657-BCE1-EEDD1C4D080B@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <90051748-EA8A-4657-BCE1-EEDD1C4D080B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 27/03/2025 08:25, Bertrand Marquis wrote:
>> On 27 Mar 2025, at 00:14, Julien Grall <julien@xen.org> wrote:
>>> +static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
>>> +                                   void *dst_buf, void *end_buf,
>>> +                                   uint32_t dst_size)
>>>   {
>>>       int32_t ret;
>>> +    uint32_t src_size, real_sp_count;
>>> +    void *src_buf = ffa_rx;
>>> +    uint32_t count = 0;
>>> +
>>> +    /* Do we have a RX buffer with the SPMC */
>>> +    if ( !ffa_rx )
>>> +        return FFA_RET_DENIED;
>>> +
>>> +    /* We need to use the RX buffer to receive the list */
>>> +    spin_lock(&ffa_rx_buffer_lock);
>>> +
>>> +    ret = ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
>>> +    if ( ret )
>>> +        goto out;
>>> +
>>> +    /* We now own the RX buffer */
>>> +
>>> +    /* We only support a 1.1 firmware version */
>>> +    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
>>> +    {
>>> +        ret = FFA_RET_NOT_SUPPORTED;
>>> +        goto out_release;
>>> +    }
>>> +
>>> +    for ( uint32_t sp_num = 0; sp_num < real_sp_count; sp_num++ )
>>
>> What's the upper limit of real_sp_count? Asking just in case we need to handle preemption.
> 
> In theory that would be 32k but in practice the number of entries we can receive is
> limited by the size of the exchange area we have with the secure world.
> 
> This area is currently defined to be one page and each entry is 8 byte in the
> case where firmware is 1.0 (24 bytes otherwise).
> 
> This is an upper limit of 500 entries.
> 
> Now I do think this is completely unrealistic to imagine a secure world with 500 SPs
> so If you are ok I would rather define an upper limit in Xen (I would say 64 SPs) that
> can be changed in the code (through a define).
> 
> This call currently does not support preemption in the FF-A spec (and that is something
> i will check for future versions) so I would have no solution to "continue" it.

> Would the "define" solution be acceptable for now ?

I think the define solution is acceptable for now and possibly longer. 
It is an easy way to avoid dealing with preemption.

[...]


>>> +static uint32_t ffa_get_vm_count(void)
>>
>> Is this meant to be called often? If so, can we instead have a counter that will be incremented when the vTEE is first initialized and then decremented when the VM is destroyed?
> 
> As of now we could have a global counter that we increase or decrease
> when a domain version is negociated and when a domain is destroyed.
> 
> We could also have some kind of global save of the result to be returned
> to a guest.
> 
> But I did not do that because:
> - cpu time required to update the list would be taken out an FF-A call
> for FFA_VERSION of a VM which would require a global lock to protect
> the data

I would have thought an atomic counter would be sufficient. Is there 
anything you had in mind?

> - when we will have filtering the data will be per VM (which would make
> the initial update more complex)
> - incoming we have a notion of UUID and filtering depending on the
> requested UUID which will make the global value only useable in a
> limited number of cases.
> 
> I have 2 pending series on top of this one which would have to remove
> such optimisations.
> 
> At the end this is definitely not something supposed to call often (linux
> driver is calling it once during init).

I think it was a mistake for me to asked whether this is called often or 
not. When it comes to security, what matter is whether a malicious guest 
could indirectly call ffa_get_vm_count() and delay any work on the pCPU 
(Xen is not preemptible).

We don't have to resolve this now. But this will need to be addressed 
before we can we consider FFA security supported. So we should at least 
add it in the list of issue at the top of the file.

> 
>>
>>> +{
>>> +    struct domain *d = current->domain;
>>> +    struct domain *dom;
>>
>> NIT: "d" and "dom" are a bit too close. Could we rename "d" with "curr_d"?
> 
> i will go with curr_d dest_d to make this clearer.
> 
>>
>>> +    uint32_t vm_count = 0;
>>> +
>>> +    /* Count the number of VM with FF-A support */
>>
>> This comment implies this is including the current VM. But ...
>>
>>> +    rcu_read_lock(&domlist_read_lock);
>>> +    for_each_domain( dom )
>>> +    {
>>> +        struct ffa_ctx *vm = dom->arch.tee;
>>> +
>>> +        if ( dom != d && vm != NULL && vm->guest_vers != 0 )
>>
>> ... here you are excluding it. Also, it sounds like this is support by the OS rather than the VM itself. Is that correct?
> 
> I have a comment to explain that one in a different serie that i will put here.
 > > Basically before 1.2, the spec was a bit blurry on if or not the 
result should include the
> calling VM and in fact Linux driver (before 1.2) was ending with an error if its own data
> was included in the result hence this filter.

Thanks for the clarification. Just to clarify...

> 
> I will add a comment for that.

... will the comment be added in this patch?

> 
>>
>>> +            vm_count++;> +    }
>>> +    rcu_read_unlock(&domlist_read_lock);
>>> +> +    return vm_count;
>>
>> OOI, I guess this value is just used as an hint? Asking because the number of domains can change at any point.
> 
> Definitely yes. The data is what it is when called but anything could change after.
> 
> This is mostly used as hint by callers.

Does this mean we would always return a fixed number? Asking because 
this would solve nicely the preemption problem in ffa_get_vm_count().

Cheers,

-- 
Julien Grall


