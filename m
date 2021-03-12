Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EADF3392DB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 17:15:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97228.184604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkRo-0005IC-Ke; Fri, 12 Mar 2021 16:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97228.184604; Fri, 12 Mar 2021 16:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkRo-0005Hn-HU; Fri, 12 Mar 2021 16:15:32 +0000
Received: by outflank-mailman (input) for mailman id 97228;
 Fri, 12 Mar 2021 16:15:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKkRn-0005Hi-Ji
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 16:15:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9027e64-dd70-40c4-87b5-f82e55ba734e;
 Fri, 12 Mar 2021 16:15:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91D4DB124;
 Fri, 12 Mar 2021 16:15:29 +0000 (UTC)
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
X-Inumbo-ID: f9027e64-dd70-40c4-87b5-f82e55ba734e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615565729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ptNN89Tr4Hseul/yPniugb6TyK0HibSDrG8wIPcmymI=;
	b=Rbav+Ity4tBaDZ3DZ5iCbTMU8c/CfRCNvHvqEQU3b0v4YXwd5q8i6yEfl56Uy/jr9pyi2A
	W3elV1+h0kA/h3awCO9kLbKS1rwtJLaPPRBs+/CwS9SxuOHDvH2guHwyZe0OGRKHTnphoN
	f4JEm/e55xBf0IZIeaLK4N1pj9nFbcM=
Subject: Re: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210216102839.1801667-1-george.dunlap@citrix.com>
 <b225be0f-3eed-426e-8829-6e7c57cd7635@suse.com>
 <63895FAD-B848-461D-8A31-E6C9973B6726@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1391dbd2-2839-67f9-0570-a466cadacc63@suse.com>
Date: Fri, 12 Mar 2021 17:15:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <63895FAD-B848-461D-8A31-E6C9973B6726@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.03.2021 15:32, George Dunlap wrote:
>> On Feb 16, 2021, at 3:29 PM, Jan Beulich <JBeulich@suse.com> wrote:
>> On 16.02.2021 11:28, George Dunlap wrote:
>>> --- /dev/null
>>> +++ b/docs/hypervisor-guide/memory-allocation-functions.rst
>>> @@ -0,0 +1,118 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Xenheap memory allocation functions
>>> +===================================
>>> +
>>> +In general Xen contains two pools (or "heaps") of memory: the *xen
>>> +heap* and the *dom heap*.  Please see the comment at the top of
>>> +``xen/common/page_alloc.c`` for the canonical explanation.
>>> +
>>> +This document describes the various functions available to allocate
>>> +memory from the xen heap: their properties and rules for when they should be
>>> +used.
>>
>> Irrespective of your subsequent indication of you disliking the
>> proposal (which I understand only affects the guidelines further
>> down anyway) I'd like to point out that vmalloc() does not
>> allocate from the Xen heap. Therefore a benefit of always
>> recommending use of xvmalloc() would be that the function could
>> fall back to vmalloc() (and hence the larger domain heap) when
>> xmalloc() failed.
> 
> OK, that’s good to know.
> 
> So just trying to think this through: address space is limiting factor for how big the xenheap can be, right?

Yes, with the current direct-map model only memory which has a
permanent mapping can be "Xen heap". Obviously, for the mapping
to be permanent, its VA range needs to be set up front (at
build time in reality). FAOD the distinction (at least on x86)
matters only on systems with a lot of memory.

>  Presumably “vmap” space is also limited, and will be much smaller?

Yes and yes, albeit for the 2nd one I'd like to add "currently",
because once we do away with the direct map, I'd envision to use
all the VA space for such on-demand mapping purposes.

>  So in a sense the “fallback” is less about getting more memory,
> but about using up that extra little bit of virtual address space?

Not really, no. If no memory is left on the Xen heap, there may
still be some left on the domain heap.

Falling back could also be the other way around, yes - if we've
run out of vmalloc() address space, we may still have a chance
find the requested space in the Xen heap.

> Another question that raises:  Are there times when it’s
> advantageous to specify which heap to allocate from?  If there
> are good reasons for allocations to be in the xenheap or in the
> domheap / vmap area, then the guidelines should probably say
> that as well.

I can't think of such reasons (beyond ones already named, like
e.g. wanting to avoid mapping overhead), but I agree that if
there are any, mentioning them would be desirable.

> And, of course, will the whole concept of the xenheap / domheap
> split go away if we ever get rid of the 1:1 map?

I expect so, yes.

>>> +Properties of various allocation functions
>>> +------------------------------------------
>>> +
>>> +Ultimately, the underlying allocator for all of these functions is
>>> +``alloc_xenheap_pages``.  They differ on several different properties:
>>> +
>>> +1. What underlying allocation sizes are.  This in turn has an effect
>>> +   on:
>>> +
>>> +   - How much memory is wasted when requested size doesn't match
>>> +
>>> +   - How such allocations are affected by memory fragmentation
>>> +
>>> +   - How such allocations affect memory fragmentation
>>> +
>>> +2. Whether the underlying pages are physically contiguous
>>> +
>>> +3. Whether allocation and deallocation require the cost of mapping and
>>> +   unmapping
>>> +
>>> +``alloc_xenheap_pages`` will allocate a physically contiguous set of
>>> +pages on orders of 2.  No mapping or unmapping is done.
>>
>> That's the case today, but meant to change rather sooner than later
>> (when the 1:1 map disappears).
> 
> Is that the kind of thing we want to add into this document?

Not sure what to answer here - my intention with raising the point
was ...

>  I suppose it would be good to make the guidelines now such
> that they produce code which is as easy as possible to adapt
> to the new way of doing things.

... precisely this.

Jan

