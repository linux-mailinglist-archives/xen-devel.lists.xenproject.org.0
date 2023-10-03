Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E20B7B6CA3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 17:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612250.952096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qngza-00087t-Rr; Tue, 03 Oct 2023 15:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612250.952096; Tue, 03 Oct 2023 15:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qngza-00085b-PK; Tue, 03 Oct 2023 15:07:22 +0000
Received: by outflank-mailman (input) for mailman id 612250;
 Tue, 03 Oct 2023 15:07:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qngzZ-00085V-1G
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 15:07:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qngzX-0003BU-Sl; Tue, 03 Oct 2023 15:07:19 +0000
Received: from [15.248.2.158] (helo=[10.24.67.42])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qngzX-0005sd-Kn; Tue, 03 Oct 2023 15:07:19 +0000
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
	bh=9l5Ln8SF3Zh/g+DWAF7vPzP+Q7benGJL16V18HNYNRI=; b=OzJJUr0J4hkNpxmlmIspuSdouh
	/N9z4iuN5W/jgmVJoFNv8as9K9lMUS6L91XIO/BGtSLD1TJH0IJdKziAxNaEY+20vyTaTZJooRBH4
	9uXiITMcsoSMjBm82lqrb3shj2G8lR5IWCoJ1+YAawUhtNSY9HjwnltDfIVXjk6IkhUM=;
Message-ID: <8ee8d70b-5b69-4834-b7e3-572e96effa5c@xen.org>
Date: Tue, 3 Oct 2023 16:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org, henry.wang@arm.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <20231002151127.71020-7-roger.pau@citrix.com>
 <CABfawhnHg3KrGP-hp4_Q8GvSf2nVSVSyK24HKqAGuWp_AtD8-A@mail.gmail.com>
 <ZRwlXls8xRyc8AX4@MacBookPdeRoger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZRwlXls8xRyc8AX4@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 03/10/2023 15:29, Roger Pau Monné wrote:
> On Tue, Oct 03, 2023 at 09:53:11AM -0400, Tamas K Lengyel wrote:

Tamas, somehow your e-mails don't show up in my inbox (even if I am 
CCed) or even on lore.kernel.org/xen-devel. It is not even in my SPAM 
folder.

>> On Mon, Oct 2, 2023 at 11:13 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
>>>
>>> From: Jan Beulich <jbeulich@suse.com>
>>>
>>> In preparation of the introduction of new vCPU operations allowing to
>>> register the respective areas (one of the two is x86-specific) by
>>> guest-physical address, add the necessary fork handling (with the
>>> backing function yet to be filled in).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Changes since v4:
>>>   - Rely on map_guest_area() to populate the child p2m if necessary.
>>> ---
>>>   xen/arch/x86/mm/mem_sharing.c | 31 +++++++++++++++++++++++++++++++
>>>   xen/common/domain.c           |  7 +++++++
>>>   2 files changed, 38 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
>>> index 5f8f1fb4d871..99cf001fd70f 100644
>>> --- a/xen/arch/x86/mm/mem_sharing.c
>>> +++ b/xen/arch/x86/mm/mem_sharing.c
>>> @@ -1641,6 +1641,24 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
>>>       hvm_set_nonreg_state(cd_vcpu, &nrs);
>>>   }
>>>
>>> +static int copy_guest_area(struct guest_area *cd_area,
>>> +                           const struct guest_area *d_area,
>>> +                           struct vcpu *cd_vcpu,
>>> +                           const struct domain *d)
>>> +{
>>> +    unsigned int offset;
>>> +
>>> +    /* Check if no area to map, or already mapped. */
>>> +    if ( !d_area->pg || cd_area->pg )
>>> +        return 0;
>>> +
>>> +    offset = PAGE_OFFSET(d_area->map);
>>> +    return map_guest_area(cd_vcpu, gfn_to_gaddr(
>>> +                                       mfn_to_gfn(d, page_to_mfn(d_area->pg))) +
>>> +                                   offset,
>>> +                          PAGE_SIZE - offset, cd_area, NULL);
>>> +}
>>> +
>>>   static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
>>>   {
>>>       struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
>>> @@ -1709,6 +1727,16 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
>>>                   return ret;
>>>           }
>>>
>>> +        /* Same for the (physically registered) runstate and time info areas. */
>>> +        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
>>> +                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
>>> +        if ( ret )
>>> +            return ret;
>>> +        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
>>> +                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
>>> +        if ( ret )
>>> +            return ret;
>>> +
>>>           ret = copy_vpmu(d_vcpu, cd_vcpu);
>>>           if ( ret )
>>>               return ret;
>>> @@ -1950,7 +1978,10 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
>>>
>>>    state:
>>>       if ( reset_state )
>>> +    {
>>>           rc = copy_settings(d, pd);
>>> +        /* TBD: What to do here with -ERESTART? */
>>
>> There is no situation where we get an -ERESTART here currently. Is
>> map_guest_area expected to run into situations where it fails with
>> that rc?
> 
> Yes, there's a spin_trylock() call that will result in
> map_guest_area() returning -ERESTART.
> 
>> If yes we might need a lock in place so we can block until it
>> can succeed.
> 
> I'm not sure whether returning -ERESTART can actually happen in
> map_guest_area() for the fork case: the child domain is still paused
> at this point, so there can't be concurrent guest hypercalls that
> would also cause the domain hypercall_deadlock_mutex to be acquired.

hypercall_deadlock_mutex is also acquired by domctls. So, I believe, 
-ERESTART could be returned if the toolstack is also issuing domclt 
right at the same time as forking.

Cheers,

-- 
Julien Grall

