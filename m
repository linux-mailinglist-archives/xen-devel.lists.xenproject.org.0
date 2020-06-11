Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7611F6E0E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 21:39:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjT1w-0008I8-6G; Thu, 11 Jun 2020 19:38:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmH/=7Y=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjT1u-0008I3-R8
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 19:38:26 +0000
X-Inumbo-ID: 1dcd6e70-ac1b-11ea-b570-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dcd6e70-ac1b-11ea-b570-12813bfff9fa;
 Thu, 11 Jun 2020 19:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q6cqqMdgtTXIpIzrKG4x/y7h7KqE1tyD+pSV9cB939s=; b=bvuut4iGxFjNfH+HSEpPLUeHOa
 sRDzMz5xULNUVUqFXYCmeUJ8VX0HH0keqTLd1bZ/tJWkVfXi9GS6ysHT182gadRJF9nx1bMSRF0Us
 +7GEs7uEiOkSmDO5F6lOW3sZeA+NJOKdSyFLKAOVnNz4vJd7UvaYPdkmC7aZUIXs92rk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjT1p-0003t9-1x; Thu, 11 Jun 2020 19:38:21 +0000
Received: from cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net
 ([81.100.41.95] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjT1o-0006Nm-Rh; Thu, 11 Jun 2020 19:38:20 +0000
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3u7ztgSmJbhjVATrfJEBBVkHbZei6ydBQeV8nzdDFA3Q@mail.gmail.com>
 <alpine.DEB.2.21.2006111143530.2815@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <74475748-e884-1e6e-633d-bf67d5ed32fe@xen.org>
Date: Thu, 11 Jun 2020 20:38:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006111143530.2815@sstabellini-ThinkPad-T480s>
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 11/06/2020 19:50, Stefano Stabellini wrote:
> On Thu, 11 Jun 2020, Julien Grall wrote:
>>>> +        return -EINVAL;
>>>>       }
>>>>
>>>> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
>>>> +    v->arch.runstate_guest.page = page;
>>>> +    v->arch.runstate_guest.offset = offset;
>>>> +
>>>> +    spin_unlock(&v->arch.runstate_guest.lock);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +
>>>> +/* Update per-VCPU guest runstate shared memory area (if registered). */
>>>> +static void update_runstate_area(struct vcpu *v)
>>>> +{
>>>> +    struct vcpu_runstate_info *guest_runstate;
>>>> +    void *p;
>>>> +
>>>> +    spin_lock(&v->arch.runstate_guest.lock);
>>>>
>>>> -    if ( guest_handle )
>>>> +    if ( v->arch.runstate_guest.page )
>>>>       {
>>>> -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
>>>> +        p = __map_domain_page(v->arch.runstate_guest.page);
>>>> +        guest_runstate = p + v->arch.runstate_guest.offset;
>>>> +
>>>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>>>> +        {
>>>> +            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
>>>> +            guest_runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
>>>
>>> I think that this write to guest_runstate should use write_atomic or
>>> another atomic write operation.
>>
>> I thought about suggesting the same, but  guest_copy_* helpers may not
>> do a single memory write to state_entry_time.
>> What are you trying to prevent with the write_atomic()?
> 
> I am thinking that without using an atomic write, it would be (at least
> theoretically) possible for a guest to see a partial write to
> state_entry_time, which is not good. 

It is already the case with existing implementation as Xen may write 
byte by byte. So are you suggesting the existing code is also buggy?

> In theory, the set of assembly
> instructions generated by the compiler could go through an intermediate
> state that we don't want the guest to see. In practice, I doubt that any
> possible combination of assembly instructions generated by the compiler
> could lead to something harmful.

Well, I think you first need to define the theoritical state you are 
worried about. Then we can discuss whether they can happen in practice 
and how we can prevent them in the existing and new code.

So what sort of state your are concerned?

Cheers,

-- 
Julien Grall

