Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D005F32FD00
	for <lists+xen-devel@lfdr.de>; Sat,  6 Mar 2021 21:04:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94379.177937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lId9a-0007AB-4l; Sat, 06 Mar 2021 20:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94379.177937; Sat, 06 Mar 2021 20:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lId9a-00079m-10; Sat, 06 Mar 2021 20:03:58 +0000
Received: by outflank-mailman (input) for mailman id 94379;
 Sat, 06 Mar 2021 20:03:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lId9Y-00079h-1U
 for xen-devel@lists.xenproject.org; Sat, 06 Mar 2021 20:03:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lId9X-0008Eq-2d; Sat, 06 Mar 2021 20:03:55 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lId9W-0007sB-NU; Sat, 06 Mar 2021 20:03:54 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Syn83vuW1WGUDekL3bFYX9LzT5XraSaDjKXparENo7Y=; b=WWj1SPxgDf24mYrpa0BlnDjfjZ
	jZ3VJlZPcTRVe4e890GSrirPZlLlgPkfsg/I16VXp0tPDmmjkljJx/8aGbzsD1PBc6Wru9CrjapyM
	eYQisHFptwcqhPeOqOKKHI8wZD9HwKWSmBxJ21ycccQIA51SQSe5heae2uz/xdCD8PgA=;
Subject: Re: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210216102839.1801667-1-george.dunlap@citrix.com>
 <c5eb64fc-a90b-6e28-bb0d-075e3a870299@xen.org>
 <E820CE9D-9671-4ED3-872E-3AECE21505AC@citrix.com>
 <E0E24EA5-CF14-45AA-8C0A-122F87051EC0@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9d63df30-6de7-4ea8-1e38-d70318b4b7bb@xen.org>
Date: Sat, 6 Mar 2021 20:03:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <E0E24EA5-CF14-45AA-8C0A-122F87051EC0@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi George,

On 16/02/2021 11:17, George Dunlap wrote:
> 
> 
>> On Feb 16, 2021, at 11:16 AM, George Dunlap <george.dunlap@citrix.com> wrote:
>>
>>
>>
>>> On Feb 16, 2021, at 10:55 AM, Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi George,
>>>
>>> On 16/02/2021 10:28, George Dunlap wrote:
>>>> Document the properties of the various allocators and lay out a clear
>>>> rubric for when to use each.
>>>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>>>> ---
>>>> This doc is my understanding of the properties of the current
>>>> allocators (alloc_xenheap_pages, xmalloc, and vmalloc), and of Jan's
>>>> proposed new wrapper, xvmalloc.
>>>> xmalloc, vmalloc, and xvmalloc were designed more or less to mirror
>>>> similar functions in Linux (kmalloc, vmalloc, and kvmalloc
>>>> respectively).
>>>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>> CC: Roger Pau Monne <roger.pau@citrix.com>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Julien Grall <julien@xen.org>
>>>> ---
>>>> .../memory-allocation-functions.rst           | 118 ++++++++++++++++++
>>>> 1 file changed, 118 insertions(+)
>>>> create mode 100644 docs/hypervisor-guide/memory-allocation-functions.rst
>>>> diff --git a/docs/hypervisor-guide/memory-allocation-functions.rst b/docs/hypervisor-guide/memory-allocation-functions.rst
>>>> new file mode 100644
>>>> index 0000000000..15aa2a1a65
>>>> --- /dev/null
>>>> +++ b/docs/hypervisor-guide/memory-allocation-functions.rst
>>>> @@ -0,0 +1,118 @@
>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>> +
>>>> +Xenheap memory allocation functions
>>>> +===================================
>>>> +
>>>> +In general Xen contains two pools (or "heaps") of memory: the *xen
>>>> +heap* and the *dom heap*.  Please see the comment at the top of
>>>> +``xen/common/page_alloc.c`` for the canonical explanation.
>>>> +
>>>> +This document describes the various functions available to allocate
>>>> +memory from the xen heap: their properties and rules for when they should be
>>>> +used.
>>>> +
>>>> +
>>>> +TLDR guidelines
>>>> +---------------
>>>> +
>>>> +* By default, ``xvmalloc`` (or its helper cognates) should be used
>>>> +  unless you know you have specific properties that need to be met.
>>>> +
>>>> +* If you need memory which needs to be physically contiguous, and may
>>>> +  be larger than ``PAGE_SIZE``...
>>>> +
>>>> +  - ...and is order 2, use ``alloc_xenheap_pages``.
>>>> +
>>>> +  - ...and is not order 2, use ``xmalloc`` (or its helper cognates)..
>>>> +
>>>> +* If you don't need memory to be physically contiguous, and know the
>>>> +  allocation will always be larger than ``PAGE_SIZE``, you may use
>>>> +  ``vmalloc`` (or one of its helper cognates).
>>>> +
>>>> +* If you know that allocation will always be less than ``PAGE_SIZE``,
>>>> +  you may use ``xmalloc``.
>>>
>>> AFAICT, the determining factor is PAGE_SIZE. This is a single is a single value on x86 (e.g. 4KB) but on other architecture this may be multiple values.
>>>
>>> For instance, on Arm, this could be 4KB, 16KB, 64KB (note that only the former is so far supported on Xen).
>>>
>>> For Arm and common code, it feels to me we can't make a clear decision based on PAGE_SIZE. Instead, I continue to think that the decision should only be based on physical vs virtually contiguous.
>>>
>>> We can then add further rules for x86 specific code if the maintainers want.
>>
>> Sorry my second mail was somewhat delayed — my intent was: 1) post the document I’d agreed to write, 2) say why I think the proposal is a bad idea. :-)

No worry, I jumped too quickly in the discussion :).

>>
>> Re page size — the vast majority of time we’re talking “knowing” that the size is less than 4k.  If we’re confident that no architecture will ever have a page size less than 4k, then we know that all allocations less than 4k will always be less than PAGE_SIZE.  Obviously larger page sizes then becomes an issue.
>>
>> But in any case — unless we have BUG_ON(size > PAGE_SIZE), we’re going to have to have a fallback, which is going to cost one precious conditional, making the whole exercise pointless.
> 
> Er, just in case it wasn’t clear — I agree with this:
> 
>>> I continue to think that the decision should only be based on physical vs virtually contiguous.

We have two opposite proposal with no clear way to reconciliate them. 
Should we request a vote on the two proposals?

Cheers,

-- 
Julien Grall

