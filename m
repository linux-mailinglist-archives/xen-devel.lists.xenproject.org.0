Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F0F20B2AE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 15:41:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jooao-0004Rc-43; Fri, 26 Jun 2020 13:40:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jooam-0004RX-Or
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 13:40:32 +0000
X-Inumbo-ID: 994cb92a-b7b2-11ea-82bc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 994cb92a-b7b2-11ea-82bc-12813bfff9fa;
 Fri, 26 Jun 2020 13:40:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0B11AAC85;
 Fri, 26 Jun 2020 13:40:30 +0000 (UTC)
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200623135246.66170-1-roger.pau@citrix.com>
 <50e25ef7-e7a7-d2c1-5f78-ce32cae35f38@suse.com>
 <20200623155609.GS735@Air-de-Roger>
 <da8d4d26-0524-1d77-8516-e986dd0affaa@suse.com>
 <20200623172652.GU735@Air-de-Roger>
 <24d35c4d-e2b3-1f58-4c6e-71072de01b74@suse.com>
 <04410978-33bf-dedf-7401-248b1a038a9c@xen.org>
 <60ac0a67-1448-4b39-4489-42dc008b6355@suse.com>
 <20200625090552.GW735@Air-de-Roger> <20200625161002.GZ735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb74d243-bf0b-67bd-b0ec-fb1e71c3a9d6@suse.com>
Date: Fri, 26 Jun 2020 15:40:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625161002.GZ735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.06.2020 18:10, Roger Pau Monné wrote:
> On Thu, Jun 25, 2020 at 11:05:52AM +0200, Roger Pau Monné wrote:
>> On Wed, Jun 24, 2020 at 04:01:44PM +0200, Jan Beulich wrote:
>>> On 24.06.2020 15:41, Julien Grall wrote:
>>>> On 24/06/2020 11:12, Jan Beulich wrote:
>>>>> On 23.06.2020 19:26, Roger Pau Monné wrote:
>>>>>> I'm confused. Couldn't we switch from uint64_aligned_t to plain
>>>>>> uint64_t (like it's currently on the Linux headers), and then use the
>>>>>> compat layer in Xen to handle the size difference when called from
>>>>>> 32bit environments?
>>>>>
>>>>> And which size would we use there? The old or the new one (breaking
>>>>> future or existing callers respectively)? Meanwhile I think that if
>>>>> this indeed needs to not be tools-only (which I still question),
>>>>
>>>> I think we now agreed on a subthread that the kernel needs to know the 
>>>> layout of the hypercall.
>>>>
>>>>> then our only possible route is to add explicit padding for the
>>>>> 32-bit case alongside the change you're already making.
>>>>
>>>> AFAICT Linux 32-bit doesn't have this padding. So wouldn't it make 
>>>> incompatible the two incompatible?
>>>
>>> In principle yes. But they're putting the structure instance on the
>>> stack, so there's not risk from Xen reading 4 bytes too many. I'd
>>> prefer keeping the interface as is (i.e. with the previously
>>> implicit padding made explicit) to avoid risking to break other
>>> possible callers. But that's just my view on it, anyway ...
>>
>> Adding the padding is cleaner because we don't need any compat stuff
>> in order to access the structure from the caller, and we also keep the
>> original layout currently present on Xen headers.
>>
>> I can prepare a fix for the Linux kernel, if this approach is fine.
> 
> So I went over this, and I'm not sure the point of adding the padding
> field at the end of the structure for 32bit x86.
> 
> The current situation is the following:
> 
>  - Linux will use a struct on 32bit x86 that doesn't have the 4byte
>    padding at the end.
>  - Xen will copy 4bytes of garbage in that case, since the struct on
>    Linux is allocated on the stack.
> 
> So I suggest we take the approach found on this patch, that is remove
> the 8byte alignment from the frame field, which will in turn remove
> 4bytes of padding from the tail of the structure on 32bit x86.
> 
> That would leave the following scenario:
> 
>  - The struct layout in Linux headers would be correct.
>  - Xen already handles the struct size difference on x86 32bit vs
>    64bit, as the compat layer is currently doing the copy in
>    compat_memory_op taking into account the size of the compat
>    structure.

Hmm, I didn't even notice this until now - it looks to do so
indeed, but apparently because of a bug: The original
uint64_aligned_t gets translated to mere uint64_t in the
compat header, whereas it should have been retained. This
means that my concern of ...

>  - Removing the padding will work for all use cases: Linux will
>    already be using the correct layout on x86 32bits, so no change
>    will be required there. Any consumers using the tail padded
>    structure will continue to work without issues, as Xen simply won't
>    copy the tailing 4bytes.

... code using the new definition then potentially not working
correctly on  4.13, at least on versions not having this
backported, was not actually true.

I'll try to sort out this other bug then ...

> So I think the solution proposed in this patch is the correct one:
> switch uint64_aligned_t to uint64_t, no tail padding added on x86
> 32bits. I will adjust the commit message and resubmit if that's fine.

I think it is indeed.

Jan

