Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F56A2B8F38
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 10:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30525.60604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfgWc-0003mJ-A7; Thu, 19 Nov 2020 09:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30525.60604; Thu, 19 Nov 2020 09:46:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfgWc-0003lw-73; Thu, 19 Nov 2020 09:46:46 +0000
Received: by outflank-mailman (input) for mailman id 30525;
 Thu, 19 Nov 2020 09:46:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfgWZ-0003lq-Vp
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:46:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df5730fa-f754-4bfd-b205-bff77ec3afe1;
 Thu, 19 Nov 2020 09:46:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFD7CABF4;
 Thu, 19 Nov 2020 09:46:40 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfgWZ-0003lq-Vp
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:46:44 +0000
X-Inumbo-ID: df5730fa-f754-4bfd-b205-bff77ec3afe1
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id df5730fa-f754-4bfd-b205-bff77ec3afe1;
	Thu, 19 Nov 2020 09:46:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605779201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u94emtc+aLV5/W+0yazA9hgYCHOSfmBt+1kwODKZvhw=;
	b=Kdu1GfeGAizOV59/6otQ/MkIQlifVWmf8MmNZiSzCP2+94rIZQD5GjUCKdDCVyO+g4gW4G
	gqVRL/JPzruTQjOlLXPTCa7hSXj6i11vf6vbaFyzDd8JfgW+pIw/RvPgnw7Tpbi5DkUuy1
	sHESoq9C/TcSetXcJFfkbI7KMNz6Fp4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DFD7CABF4;
	Thu, 19 Nov 2020 09:46:40 +0000 (UTC)
Subject: Re: [PATCH 1/3] mm: introduce xvmalloc() et al and use for grant
 table allocations
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e0364274-f123-82bd-ec85-bea519a34049@suse.com>
 <d98aabe4-6c1b-0970-2e42-eb991e9075a2@suse.com>
 <e7b72c54-e8e4-428d-9264-484fc0061ba4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9adc7ec2-c014-d9ae-a8b5-5b942640386c@suse.com>
Date: Thu, 19 Nov 2020 10:46:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <e7b72c54-e8e4-428d-9264-484fc0061ba4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.2020 20:10, Julien Grall wrote:
> On 06/11/2020 07:11, Jan Beulich wrote:
>> All of the array allocations in grant_table_init() can exceed a page's
>> worth of memory, which xmalloc()-based interfaces aren't really suitable
>> for after boot. 
> 
> I can see a few reasons why they are not suitable:
>    - xmalloc() will try to using an order and then throw memory. This is 
> pretty inneficient.

But addressing this inefficiency, while a nice side effect, is
not the goal here.

>    - xmalloc() will allocate physically contiguous memory

This aspect matters here only indirectly: What we care about
avoiding are runtime allocations of non-zero order. The assumption
of how I worded the description is that during boot non-zero-
order allocations can typically be fulfilled and hence aren't a
(general) problem.

> It would be good to clarify which one you refer because none of them are 
> really a problem only after boot...

Given the above, I'm not sure in which way you would see this be
clarified. Any suggestions welcome.

> One thing to be aware thought is xv*() are going to be more inefficient 
> because they involve touching the page-tables (at least until the work 
> to map on-demand the direct map is not merged). In addition, on Arm, 
> they will also use only 4K mappings (I have a TODO to fix that).
> 
> So I think we will need to be careful when to use xmalloc() vs 
> xvalloc(). It might be worth outlining that in the documentation of xv*().

The rule is quite simple and the inefficiencies you mention
shouldn't matter imo: Post-boot there should not be any
implicit allocations of non-zero order. "Implicit" here meaning
to still permit e.g. direct alloc_domheap_pages() invocations,
making apparent at the call site that the aspect of memory
fragmentation was (hopefully) taken into consideration. I'm
actually inclined to suggest (down the road) to have _xmalloc()
no longer fall back to multi-page allocations post-boot, but
instead return NULL.

If you think it is really needed, I can add something like "These
should be used in preference to xmalloc() et al whenever the size
is not known to be constrained to at most a single page" to the
comment at the top of the new header file.

Where the inefficiencies you mention would imo matter is in
(future) decisions whether to use vmalloc() et al vs xvmalloc()
et al: If the size _may_ be no more than a page, the latter may
want preferring.

>> --- a/xen/common/vmap.c
>> +++ b/xen/common/vmap.c
>> @@ -7,6 +7,7 @@
>>   #include <xen/spinlock.h>
>>   #include <xen/types.h>
>>   #include <xen/vmap.h>
>> +#include <xen/xvmalloc.h>
>>   #include <asm/page.h>
>>   
>>   static DEFINE_SPINLOCK(vm_lock);
>> @@ -299,11 +300,29 @@ void *vzalloc(size_t size)
>>       return p;
>>   }
>>   
>> -void vfree(void *va)
>> +static void _vfree(const void *va, unsigned int pages, enum vmap_region type)
> 
> I don't think "unsigned int" is sufficient to cover big size. AFAICT, 
> this is not in a new problem in this code and seems to be a latent issue 
> so far.
> 
> However, I feel that it is wrong to introduce a new set of allocation 
> helpers that contained a flaw fixed in xm*alloc() recently (see  commit 
> cf38b4926e2b "xmalloc: guard against integer overflow").

For _xmalloc() we're talking about bytes (and the guarding you
refer to is actually orthogonal to the limiting done by the
page allocator, as follows from the description of that change).
Here we're talking about pages. I hope it will be decades until we
have to consider allocating 16Tb all in one chunk (and we'd need
to have large enough vmap virtual address space set aside first).
Also note that
- the entire vmap.c right now uses unsigned int for page counts,
  so it would be outright inconsistent to use unsigned long here,
- at least on x86 passing around 64-bit function arguments is
  slightly less efficient than 32-bit ones, and hence I'd prefer
  to keep it like this.

>> --- /dev/null
>> +++ b/xen/include/xen/xvmalloc.h
>> @@ -0,0 +1,70 @@
>> +
>> +#ifndef __XVMALLOC_H__
>> +#define __XVMALLOC_H__
>> +
>> +#include <xen/cache.h>
>> +#include <xen/types.h>
>> +
>> +/*
>> + * Xen malloc/free-style interface.
> 
> It would be useful to emphase that they should only be used if the 
> caller does *not* need physically contiguous memory.

Actually first of all I shouldn't have copied to comment without
editing. I've now made it

/*
 * Xen malloc/free-style interface preferable for allocations possibly
 * exceeding a page's worth of memory, as long as there's no need to have
 * physically contiguous memory allocated.
 */

albeit I'm not sure the "physically discontiguous" really needs
pointing out, considering the 'v' in the function names.

Jan

