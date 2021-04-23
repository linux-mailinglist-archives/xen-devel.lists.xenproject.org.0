Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBC336941D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 15:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116397.222178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwHG-0000nu-2U; Fri, 23 Apr 2021 13:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116397.222178; Fri, 23 Apr 2021 13:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwHF-0000nV-VS; Fri, 23 Apr 2021 13:55:25 +0000
Received: by outflank-mailman (input) for mailman id 116397;
 Fri, 23 Apr 2021 13:55:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZwHE-0000nQ-63
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 13:55:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e410179-4005-4dc4-be59-52355106fb68;
 Fri, 23 Apr 2021 13:55:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0FA21ADD7;
 Fri, 23 Apr 2021 13:55:22 +0000 (UTC)
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
X-Inumbo-ID: 1e410179-4005-4dc4-be59-52355106fb68
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619186122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uF42qcj6uAe5IJIPaKlA6x1rKHWEXo6WJFxStEKqz/Y=;
	b=kzVBCtaRe9X+hRFvMnmW+SIphuaCj4nVXkpY6U3tQA0x/gT8CvIsnSOSrETEGalRGZWbRY
	Trm1VUpL9jZJl2yKylWrOyJ9kvgcTtMw07n2aMyDVZED4PElrPcc4j9FxwHPyYCv9xvmx5
	rDX2XozwQMRP0e6FAVKRb0M4o/Z0/FY=
Subject: Re: [PATCH] x86/oprofile: remove compat accessors usage from
 backtrace
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210423123509.9354-1-roger.pau@citrix.com>
 <7d77cd67-5866-9d58-b2d0-b8d28b827084@suse.com>
 <YILQ0tj8QceN1jaB@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c55c8955-89c1-c5f8-4a56-9596eb0ebd3b@suse.com>
Date: Fri, 23 Apr 2021 15:55:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YILQ0tj8QceN1jaB@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 15:51, Roger Pau Monné wrote:
> On Fri, Apr 23, 2021 at 02:53:14PM +0200, Jan Beulich wrote:
>> On 23.04.2021 14:35, Roger Pau Monne wrote:
>>> Remove the unneeded usage of the compat layer to copy frame pointers
>>> from guest address space. Instead just use raw_copy_from_guest.
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Just build tested. Note sure I'm missing something, since using the
>>> compat layer here was IMO much more complicated than just using the
>>> raw accessors.
>>
>> The main reason, I suppose, was that raw_copy_*() aren't supposed to
>> be used directly.
>>
>>> @@ -59,34 +56,17 @@ dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
>>>  {
>>>      frame_head_t bufhead;
>>>  
>>> -#ifdef CONFIG_COMPAT
>>>      if ( is_32bit_vcpu(vcpu) )
>>>      {
>>> -        DEFINE_COMPAT_HANDLE(frame_head32_t);
>>> -        __compat_handle_const_frame_head32_t guest_head =
>>> -            { .c = (unsigned long)head };
>>
>> You're losing the truncation to 32 bits here.
> 
> I didn't think it was relevant here, as value should already have the
> high bits zeroed?
> 
> One being the rbp from the guest cpu registers and the other a
> recursive call using bufhead.ebp.

Would you mind stating this (i.e. what guarantees the zero-extension)
in the description?

>>>          frame_head32_t bufhead32;
>>>  
>>> -        /* Also check accessibility of one struct frame_head beyond */
>>> -        if (!compat_handle_okay(guest_head, 2))
>>> -            return 0;
>>
>> If you intentionally remove this and ...
>>
>>> -        if (__copy_from_compat(&bufhead32, guest_head, 1))
>>> +        if (raw_copy_from_guest(&bufhead32, head, sizeof(bufhead32)))
>>>              return 0;
>>>          bufhead.ebp = (struct frame_head *)(unsigned long)bufhead32.ebp;
>>>          bufhead.ret = bufhead32.ret;
>>>      }
>>> -    else
>>> -#endif
>>> -    {
>>> -        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =
>>> -            const_guest_handle_from_ptr(head, frame_head_t);
>>> -
>>> -        /* Also check accessibility of one struct frame_head beyond */
>>> -        if (!guest_handle_okay(guest_head, 2))
>>> -            return 0;
>>
>> ... this, then you should justify why these aren't needed anymore
>> (or maybe were never really needed). They've been put there for a
>> purpose, I'm sure, even if I'm unclear about what one it was/is.
> 
> I've been doing some archaeology on Linux and I'm still not sure why
> this is required. Linux copies two frame_head{32,}_t elements, so we
> could follow suit and do the same - albeit I won't be able to provide
> a reasoning myself as to why this is required, the second element
> seems to be completely unused.

Well, my guess has always been that this is an attempt at making sure
the stack with the frame popped is still a valid one. This would still
seem to me to be a somewhat questionable reasoning for the two-element
access, but I couldn't think of any other possible thoughts behind
this.

Jan

