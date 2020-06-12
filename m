Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1073D1F763E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 11:54:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjgNX-0007aF-TD; Fri, 12 Jun 2020 09:53:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kdnc=7Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjgNW-0007aA-Jj
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 09:53:38 +0000
X-Inumbo-ID: 958c32da-ac92-11ea-b5b0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 958c32da-ac92-11ea-b5b0-12813bfff9fa;
 Fri, 12 Jun 2020 09:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SEIVc/Yz1hxdlqGX/ofEjIrjNOz6KZqGqNDqbSOUunk=; b=zCkbxHUVaW1J8DmMpSO/EdA5VZ
 NYwEoAys5Mc/pXFhBOFJB4m5NWnCtWyNa/3XX8RJXGw0Fm76oKHhqdSEIAIcSo1ib1/+I4goIBrHj
 aKCOy8ZcYQYmiK79HFBHgaqDiA/tNHx/TjcSpKZbPDaccez/APoQo26pSCcYWVu5IB9U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjgNQ-0006CL-9P; Fri, 12 Jun 2020 09:53:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjgNQ-0005HV-2F; Fri, 12 Jun 2020 09:53:32 +0000
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
To: Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3u7ztgSmJbhjVATrfJEBBVkHbZei6ydBQeV8nzdDFA3Q@mail.gmail.com>
 <alpine.DEB.2.21.2006111143530.2815@sstabellini-ThinkPad-T480s>
 <74475748-e884-1e6e-633d-bf67d5ed32fe@xen.org>
 <alpine.DEB.2.21.2006111250180.2815@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <a8379e95-3f9c-1ee3-61fd-741bb9c41d4b@xen.org>
Date: Fri, 12 Jun 2020 10:53:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006111250180.2815@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 12/06/2020 02:09, Stefano Stabellini wrote:
> On Thu, 11 Jun 2020, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 11/06/2020 19:50, Stefano Stabellini wrote:
>>> On Thu, 11 Jun 2020, Julien Grall wrote:
>>>>>> +        return -EINVAL;
>>>>>>        }
>>>>>>
>>>>>> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
>>>>>> +    v->arch.runstate_guest.page = page;
>>>>>> +    v->arch.runstate_guest.offset = offset;
>>>>>> +
>>>>>> +    spin_unlock(&v->arch.runstate_guest.lock);
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +
>>>>>> +/* Update per-VCPU guest runstate shared memory area (if registered).
>>>>>> */
>>>>>> +static void update_runstate_area(struct vcpu *v)
>>>>>> +{
>>>>>> +    struct vcpu_runstate_info *guest_runstate;
>>>>>> +    void *p;
>>>>>> +
>>>>>> +    spin_lock(&v->arch.runstate_guest.lock);
>>>>>>
>>>>>> -    if ( guest_handle )
>>>>>> +    if ( v->arch.runstate_guest.page )
>>>>>>        {
>>>>>> -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
>>>>>> +        p = __map_domain_page(v->arch.runstate_guest.page);
>>>>>> +        guest_runstate = p + v->arch.runstate_guest.offset;
>>>>>> +
>>>>>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>>>>>> +        {
>>>>>> +            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
>>>>>> +            guest_runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
>>>>>
>>>>> I think that this write to guest_runstate should use write_atomic or
>>>>> another atomic write operation.
>>>>
>>>> I thought about suggesting the same, but  guest_copy_* helpers may not
>>>> do a single memory write to state_entry_time.
>>>> What are you trying to prevent with the write_atomic()?
>>>
>>> I am thinking that without using an atomic write, it would be (at least
>>> theoretically) possible for a guest to see a partial write to
>>> state_entry_time, which is not good.
>>
>> It is already the case with existing implementation as Xen may write byte by
>> byte. So are you suggesting the existing code is also buggy?

It looks like I may have misread the code as we only copy one byte. But 
I still think this is fragile.

For this context, I agree that a write_atomic() should do the job.

However, I still want to answer to your comments below.

> 
> Writing byte by byte is a different case. That is OK. In that case, the
> guest could see the state after 3 bytes written and it would be fine and
> consistent.

Why? What does actually prevent a guest to see an in-between value?

To give a concrete example, if the original value is 0xabc and you want 
to write 0xdef. Why would the guest never see 0xabf or 0xaec?

> If this hadn't been the case, then yes, the existing code
> would also be buggy.
> 
> So if we did the write with a memcpy, it would be fine, no need for
> atomics:
> 
>    memcpy(&guest_runstate->state_entry_time,
>           &v->runstate.state_entry_time,
>           XXX);
> 
> 
> The |= case is different: GCC could implement it in any way it likes,
> including going through a zero-write to any of the bytes in the word, or
> doing an addition then a subtraction. GCC doesn't make any guarantees.
> If we want guarantees we need to use atomics.

Yes GCC can generate assembly for |= in any way it likes. But so does 
for memcpy(). So I still don't understand why one would be fine for you 
and not the other...

Cheers,

-- 
Julien Grall

