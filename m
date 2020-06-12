Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2AB1F7DDA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 21:56:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjpmd-0002m1-L8; Fri, 12 Jun 2020 19:56:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kdnc=7Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjpmc-0002lw-Hd
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 19:56:10 +0000
X-Inumbo-ID: c2cffe76-ace6-11ea-b60f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2cffe76-ace6-11ea-b60f-12813bfff9fa;
 Fri, 12 Jun 2020 19:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VBtpWRc8jlMgL2vN/H+qq/4isF6/W9eOPtGCm879mSo=; b=7INsPKZj118d5gcpb90Iuymgkj
 ZQvB+JYQNr4gIMPvN7B6b51Jm7cMv1TkbMlr3cJcKpkC50A38ZIKu7a3aEtXQLAavjM/cPcFiCgsl
 VFOUV4BtFcSUK1z/0Y3IZ3BYGxnJrAFQrcTZj78KhsCm60T2ljHmn64XTbvjqvLqA6O0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjpmX-0001Fe-7e; Fri, 12 Jun 2020 19:56:05 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjpmW-00084s-W0; Fri, 12 Jun 2020 19:56:05 +0000
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <974bf796-d410-9dd7-9e60-873987cd8434@xen.org>
 <131FB1AE-656D-45E7-9019-FC50F9D5CF0B@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <68f7349e-c773-f0ef-bc77-cbf459796604@xen.org>
Date: Fri, 12 Jun 2020 20:56:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <131FB1AE-656D-45E7-9019-FC50F9D5CF0B@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/06/2020 15:13, Bertrand Marquis wrote:
> Hi Julien,

Hi,

>> On 12 Jun 2020, at 11:53, Julien Grall <julien@xen.org> wrote:
>> The code below suggests the hypercall will just fail if you call it from a different vCPU. Is that correct?
> 
> No the hypercall will work, but the area in this case won’t be updated.
> When the hypercall is called on the current vcpu, the area will be updated when the context will be restored before returning to the guest so there is no need to do it an extra time in the hypercall itself.

I am afraid this is not correct, update_runstate_area() is only called 
when context switching between 2 vCPUs. So the only way this could be 
called on return from hypercall is if the vCPU get preempted.

> When this is done for a different vcpu the current code is not updating the area anymore.
> 
> I did think at first to do it but the complexity it was adding (mainly due to the dual page case) was very high and I could not really think of a use case or find one in Linux.

You may want to have an updated view without forcing the vCPU to exit to 
the hypervisor and do a context switch.

> But now that I think of it I could, in that specific case, use a copy_to_guest.

I think you should be able to call update_runstate_area() directly.

> 
> Do you think this is something which would make sense to restore ?

I would like to avoid diverging too much from the current definition of 
the hypercall. In this case, I don't think the restriction you add is 
necessary.

>>
>>> +    if ( !page )
>>> +    {
>>> +        spin_unlock(&v->arch.runstate_guest.lock);
>>> +        gprintk(XENLOG_DEBUG, "Runstate pointer is not mapped\n");
>>> +        return -EINVAL;
>>>       }
>>>   -    __copy_to_guest(runstate_guest(v), &runstate, 1);
>>> +    v->arch.runstate_guest.page = page;
>>> +    v->arch.runstate_guest.offset = offset;
>>> +
>>
>> In the current implementation, the runstate area was update with the latest information during the hypercall. This doesn't seem to happen anymore. Is there any specific reason?
> 
> As explained before, this is still happening on the current vcpu as a result of the context switch back to the guest at the end of the hypercall.

See above, I don't believe this is correct. :).

>>> +    spin_unlock(&v->arch.runstate_guest.lock);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +
>>> +/* Update per-VCPU guest runstate shared memory area (if registered). */
>>> +static void update_runstate_area(struct vcpu *v)
>>> +{
>>> +    struct vcpu_runstate_info *guest_runstate;
>>> +    void *p;
>>> +
>>> +    spin_lock(&v->arch.runstate_guest.lock);
>>>   -    if ( guest_handle )
>>> +    if ( v->arch.runstate_guest.page )
>>>       {
>>> -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
>>> +        p = __map_domain_page(v->arch.runstate_guest.page);
>>> +        guest_runstate = p + v->arch.runstate_guest.offset;
>>> +
>>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>>> +        {
>>> +            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
>>> +            guest_runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
>>> +            smp_wmb();
>>> +        }
>>> +
>>> +        memcpy(guest_runstate, &v->runstate, sizeof(v->runstate));
>>>           smp_wmb();
>>> -        __raw_copy_to_guest(guest_handle,
>>> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
>>> +
>>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>>> +        {
>>> +            v->runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
>>> +            guest_runstate->state_entry_time &= ~XEN_RUNSTATE_UPDATE;
>>> +            smp_wmb();
>>
>> Why do you need this barrier?
> 
> As the bit is supposed to be used to wait for an update to be done, I felt it was better to push this out as soon as possible.

smp_wmb() only ensure that any write before the barrier will be seen 
before after write after the barrier. It doesn't guarantee the other end 
will see it right after it...

> As there is already one after the memcpy, the cost should be fairly limited here.

... so this feel like more a micro-optimization (happy to be proved 
wrong). The memory barriers are already tricky enough to use/understand, 
so I would rather not want to use more than necessary.

Cheers,

-- 
Julien Grall

