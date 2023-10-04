Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CC67B8039
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 15:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612561.952517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1a4-0004vk-H7; Wed, 04 Oct 2023 13:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612561.952517; Wed, 04 Oct 2023 13:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1a4-0004tk-EL; Wed, 04 Oct 2023 13:06:24 +0000
Received: by outflank-mailman (input) for mailman id 612561;
 Wed, 04 Oct 2023 13:06:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qo1a3-0004te-4P
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 13:06:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qo1a2-00031g-7h; Wed, 04 Oct 2023 13:06:22 +0000
Received: from [15.248.2.150] (helo=[10.24.67.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qo1a1-0003G4-Vb; Wed, 04 Oct 2023 13:06:22 +0000
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
	bh=N8CRjNyPB7/AqWq5Ihubs/5Lrqto6esbsB/d8es/vWQ=; b=JU5QsBE0ITqWYajmS+R5u8Qc9y
	9Jmm+9VUEwSkltnFTdi3QxElW1aE6mByuNR6FrbRbO90hAB/RS7vi68dBLuXgfJ04nHnWtvXGiZMM
	L2WkAaKJl/kiHfBA+ichfGzE/cHBWZMGIpLCnky8xYHWLWPMDnMC31S/seaQyOs/f3Fk=;
Message-ID: <081ae245-9d47-4cab-ad64-54b33566429c@xen.org>
Date: Wed, 4 Oct 2023 14:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 henry.wang@arm.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <20231002151127.71020-7-roger.pau@citrix.com>
 <CABfawhnHg3KrGP-hp4_Q8GvSf2nVSVSyK24HKqAGuWp_AtD8-A@mail.gmail.com>
 <ZRwlXls8xRyc8AX4@MacBookPdeRoger>
 <8ee8d70b-5b69-4834-b7e3-572e96effa5c@xen.org>
 <CABfawhn0vH6rS8-SJQJVZtto2HA61By1bCG3w9bJMJR3x+rXsg@mail.gmail.com>
 <ZR0gX6wyXLD_6nY6@MacBookPdeRoger>
 <30582a7c-f505-462d-9dc4-22efb5a0860c@xen.org>
 <ZR1h7y2aazvEhtW_@MacBookPdeRoger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZR1h7y2aazvEhtW_@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/10/2023 14:00, Roger Pau Monné wrote:
> On Wed, Oct 04, 2023 at 12:01:21PM +0100, Julien Grall wrote:
>> Hi Roger,
>>
>> On 04/10/2023 09:20, Roger Pau Monné wrote:
>>> On Tue, Oct 03, 2023 at 04:25:58PM -0400, Tamas K Lengyel wrote:
>>>> On Tue, Oct 3, 2023 at 11:07 AM Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>> Hi Roger,
>>>>>
>>>>> On 03/10/2023 15:29, Roger Pau Monné wrote:
>>>>>> On Tue, Oct 03, 2023 at 09:53:11AM -0400, Tamas K Lengyel wrote:
>>>>>
>>>>> Tamas, somehow your e-mails don't show up in my inbox (even if I am
>>>>> CCed) or even on lore.kernel.org/xen-devel. It is not even in my SPAM
>>>>> folder.
>>>>
>>>> Thanks, I've switched mailservers, hopefully that resolves the issue.
>>
>> It did. Thanks!
>>
>>>>
>>>>>
>>>>>>> On Mon, Oct 2, 2023 at 11:13 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
>>>>>>>>
>>>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>>>>
>>>>>>>> In preparation of the introduction of new vCPU operations allowing to
>>>>>>>> register the respective areas (one of the two is x86-specific) by
>>>>>>>> guest-physical address, add the necessary fork handling (with the
>>>>>>>> backing function yet to be filled in).
>>>>>>>>
>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>>> ---
>>>>>>>> Changes since v4:
>>>>>>>>     - Rely on map_guest_area() to populate the child p2m if necessary.
>>>>>>>> ---
>>>>>>>>     xen/arch/x86/mm/mem_sharing.c | 31 +++++++++++++++++++++++++++++++
>>>>>>>>     xen/common/domain.c           |  7 +++++++
>>>>>>>>     2 files changed, 38 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
>>>>>>>> index 5f8f1fb4d871..99cf001fd70f 100644
>>>>>>>> --- a/xen/arch/x86/mm/mem_sharing.c
>>>>>>>> +++ b/xen/arch/x86/mm/mem_sharing.c
>>>>>>>> @@ -1641,6 +1641,24 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
>>>>>>>>         hvm_set_nonreg_state(cd_vcpu, &nrs);
>>>>>>>>     }
>>>>>>>>
>>>>>>>> +static int copy_guest_area(struct guest_area *cd_area,
>>>>>>>> +                           const struct guest_area *d_area,
>>>>>>>> +                           struct vcpu *cd_vcpu,
>>>>>>>> +                           const struct domain *d)
>>>>>>>> +{
>>>>>>>> +    unsigned int offset;
>>>>>>>> +
>>>>>>>> +    /* Check if no area to map, or already mapped. */
>>>>>>>> +    if ( !d_area->pg || cd_area->pg )
>>>>>>>> +        return 0;
>>>>>>>> +
>>>>>>>> +    offset = PAGE_OFFSET(d_area->map);
>>>>>>>> +    return map_guest_area(cd_vcpu, gfn_to_gaddr(
>>>>>>>> +                                       mfn_to_gfn(d, page_to_mfn(d_area->pg))) +
>>>>>>>> +                                   offset,
>>>>>>>> +                          PAGE_SIZE - offset, cd_area, NULL);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>     static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
>>>>>>>>     {
>>>>>>>>         struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
>>>>>>>> @@ -1709,6 +1727,16 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
>>>>>>>>                     return ret;
>>>>>>>>             }
>>>>>>>>
>>>>>>>> +        /* Same for the (physically registered) runstate and time info areas. */
>>>>>>>> +        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
>>>>>>>> +                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
>>>>>>>> +        if ( ret )
>>>>>>>> +            return ret;
>>>>>>>> +        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
>>>>>>>> +                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
>>>>>>>> +        if ( ret )
>>>>>>>> +            return ret;
>>>>>>>> +
>>>>>>>>             ret = copy_vpmu(d_vcpu, cd_vcpu);
>>>>>>>>             if ( ret )
>>>>>>>>                 return ret;
>>>>>>>> @@ -1950,7 +1978,10 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
>>>>>>>>
>>>>>>>>      state:
>>>>>>>>         if ( reset_state )
>>>>>>>> +    {
>>>>>>>>             rc = copy_settings(d, pd);
>>>>>>>> +        /* TBD: What to do here with -ERESTART? */
>>>>>>>
>>>>>>> There is no situation where we get an -ERESTART here currently. Is
>>>>>>> map_guest_area expected to run into situations where it fails with
>>>>>>> that rc?
>>>>>>
>>>>>> Yes, there's a spin_trylock() call that will result in
>>>>>> map_guest_area() returning -ERESTART.
>>>>>>
>>>>>>> If yes we might need a lock in place so we can block until it
>>>>>>> can succeed.
>>>>>>
>>>>>> I'm not sure whether returning -ERESTART can actually happen in
>>>>>> map_guest_area() for the fork case: the child domain is still paused
>>>>>> at this point, so there can't be concurrent guest hypercalls that
>>>>>> would also cause the domain hypercall_deadlock_mutex to be acquired.
>>>>
>>>> Perhaps turning it into an ASSERT(rc != -ERESTART) is the way to go at
>>>> this point. If we run into any cases where it trips we can reason it
>>>> out.
>>>
>>> In order to avoid possibly returning -ERESTART (which should never be
>>> seen by hypercall callers) we might want to convert it to -EBUSY and
>>> let the caller pick the pieces.
>>
>> I realize this is a matter of taste. I think EAGAIN is a better conversion
>> for ERESTART because we effectively want to caller to try again.
> 
> That's fine with me, but could we leave adding such translation to a
> further patch?

Wouldn't this mean that -ERESTART could be returned to the caller? If 
yes, then I think this should be handled here. Otherwise, we will be 
exposing a value that is not supposed to be exposed.

Cheers,

-- 
Julien Grall

