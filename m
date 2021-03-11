Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDA1337191
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 12:41:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96464.182522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKJgg-0002lt-0e; Thu, 11 Mar 2021 11:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96464.182522; Thu, 11 Mar 2021 11:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKJgf-0002lX-Tw; Thu, 11 Mar 2021 11:41:05 +0000
Received: by outflank-mailman (input) for mailman id 96464;
 Thu, 11 Mar 2021 11:41:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKJgd-0002lR-Ra
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 11:41:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4fedf5f-4a88-4785-baba-ba6eff214e59;
 Thu, 11 Mar 2021 11:41:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1EDDAC16;
 Thu, 11 Mar 2021 11:41:01 +0000 (UTC)
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
X-Inumbo-ID: f4fedf5f-4a88-4785-baba-ba6eff214e59
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615462861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPjS+8090b9vguY41fZmaGmXKDLlQpLQg8OBbk1MblI=;
	b=Q3RvNwxo71+zRCZjoN+kdO5Q+Tc0V4IMaTEKpZvtEj8M8doqOf4AwxLWY7bO57nNbXBIf+
	hN3m8kTZ2ywsalIqznymrlBqQA6d/ZdkKuSbP5o4MtW1gCDTDpU/1Uh3vo4D6NrWqtuJdG
	yz7rbO1oMbUps+3rnYympHiNwGVYXf8=
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 Paul Durrant <paul@xen.org>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
 <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
 <556ce32b-5087-b8b1-432e-643218dd8c6e@suse.com>
 <9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8ed458a-6064-95d3-f189-f0928b09baca@suse.com>
Date: Thu, 11 Mar 2021 12:41:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.03.2021 12:05, Andrew Cooper wrote:
> On 11/03/2021 08:27, Jan Beulich wrote:
>> On 10.03.2021 18:22, Andrew Cooper wrote:
>>> On 10/03/2021 17:12, Jan Beulich wrote:
>>>> On 10.03.2021 16:07, Andrew Cooper wrote:
>>>>> --- a/docs/designs/dmop.pandoc
>>>>> +++ b/docs/designs/dmop.pandoc
>>>>> @@ -4,9 +4,13 @@ DMOP
>>>>>  Introduction
>>>>>  ------------
>>>>>  
>>>>> -The aim of DMOP is to prevent a compromised device model from compromising
>>>>> -domains other than the one it is providing emulation for (which is therefore
>>>>> -likely already compromised).
>>>>> +The DMOP hypercall has a new ABI design to solve problems in the Xen
>>>>> +ecosystem.  First, the ABI is fully stable, to reduce the coupling between
>>>>> +device models and the version of Xen.
>>>>> +
>>>>> +Secondly, for device models in userspace, the ABI is designed specifically to
>>>>> +allow a kernel to audit the memory ranges used, without having to know the
>>>>> +internal structure of sub-ops.
>>>> I appreciate the editing, but the cited points still don't justify ...
>>>>
>>>>> --- a/xen/include/public/hvm/dm_op.h
>>>>> +++ b/xen/include/public/hvm/dm_op.h
>>>>> @@ -25,9 +25,6 @@
>>>>>  #define __XEN_PUBLIC_HVM_DM_OP_H__
>>>>>  
>>>>>  #include "../xen.h"
>>>>> -
>>>>> -#if defined(__XEN__) || defined(__XEN_TOOLS__)
>>>>> -
>>>>>  #include "../event_channel.h"
>>>>>  
>>>>>  #ifndef uint64_aligned_t
>>>>> @@ -491,8 +488,6 @@ struct xen_dm_op {
>>>>>      } u;
>>>>>  };
>>>>>  
>>>>> -#endif /* __XEN__ || __XEN_TOOLS__ */
>>>>> -
>>>>>  struct xen_dm_op_buf {
>>>>>      XEN_GUEST_HANDLE(void) h;
>>>>>      xen_ulong_t size;
>>>> ... this removal: What the kernel needs for its auditing (your 2nd
>>>> point) is already outside of this guarded region, as you can see
>>>> from the context above. You said there was a design goal of allowing
>>>> use of this interface by (and not only through) the kernel, e.g. by
>>>> a kernel module (which I don't think you mean to be covered by
>>>> "device models"). If that was indeed a goal (Paul - can you confirm
>>>> this?), this would now want listing as a 3rd item. Without such a
>>>> statement I'd call it a bug to not have the guards there, and hence
>>>> might either feel tempted myself to add them back at some point, or
>>>> would ack a patch doing so.
>>> Xen has absolutely no business dictating stuff like this.
>> Actually there's no "dictating" here anyway: People are free to clone
>> the headers and omit the guards anyway.
> 
> That is somewhere between busywork and just plain rude to 3rd parties. 
> "here are some headers but you need to unbreak them locally before use".
> 
>> Outside of our own build
>> system they really mainly serve a documentation purpose.
> 
> Header guards are not documentation

And I didn't say so - I said they server a documentation purpose.

> - they are active attempt to
> segregate hypercalls by "who we think is supposed to use them".
> 
> MiniOS, which uses this header within our build system, is not a part of
> the toolstack, and should not need to define __XEN_TOOLS__ to be able to
> use stable-ABI hypercalls.

I've not been able to spot a definition of __XEN_TOOLS__ in the
mini-os sources. Are you perhaps referring to tool stack libraries
getting built also for it?

> Equally, the fact that libxendevicemodel's private.h needed to define
> __XEN_TOOLS__ demonstrates the problem - dm_op.h (the structs and
> defines - not just the types) are necessary to use the ioctl() on
> /dev/xen/devicemodel in the first place.

But this library _is_ part of the tool stack. Looks like it really
boils down to ...

>>>   It is an
>>> internal and opaque property of the domain if the hypercalls happen to
>>> originate from logic in user mode or kernel mode.  Stubdomains would
>>> fall into the same "kernel" category as xengt in the dom0 i915 driver.
>>>
>>> However, the actual bug I'm trying to fix with this is the need for
>>> userspace, which doesn't link against libxc, to do
>>>
>>> #define __XEN_TOOLS__
>>> #include <xendevicemodel.h>
>>>
>>> to be able to use the libxendevicemodel stable library.
>>>
>>> The __XEN_TOOLS__ guard is buggy even ignoring the kernel device model
>>> aspect.
>> Depends on what __XEN_TOOLS__ really means - to guard things accessible
>> to any part of the tool stack, or to guard unstable interfaces only.
> 
> As far as I'm concerned, __XEN_TOOLS__ should always have been spelled
> __XEN_UNSTABLE_ABI__.

... this. If you added half a sentence to this effect to the description,
you may feel free to add
Acked-by: Jan Beulich <jbeulich@suse.com>

I still would appreciate if you also added the kernel (module) aspect to
the doc change.

Jan

