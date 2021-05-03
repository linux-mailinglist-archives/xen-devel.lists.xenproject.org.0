Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAB537163D
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 15:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121611.229367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldYyL-00085p-BX; Mon, 03 May 2021 13:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121611.229367; Mon, 03 May 2021 13:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldYyL-00085S-8U; Mon, 03 May 2021 13:50:53 +0000
Received: by outflank-mailman (input) for mailman id 121611;
 Mon, 03 May 2021 13:50:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldYyJ-00085N-Bb
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 13:50:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d92f5217-d3b0-4323-b6fa-ca72bee66489;
 Mon, 03 May 2021 13:50:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19F1BB062;
 Mon,  3 May 2021 13:50:49 +0000 (UTC)
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
X-Inumbo-ID: d92f5217-d3b0-4323-b6fa-ca72bee66489
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620049849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9d2ZDMWcYWgpewOQuhG9aaHgilKUbd8W/T81pjlWNtE=;
	b=S9Hqsei5TXp932nsHa4vy+YoMR0N6LeUsf51b7zomx43YhNiXlp1npt+Bju4pxpTXeCJ9R
	wSXjgcThNdPU/LaaJ34CxKj4Sj8MVnHy5TkR7hhF9mKobytZ/UuafWv1SC9Ecv8Ll2RHOr
	ZGGv8nyTQsZ5yCREC4tlXpIxkYV4Ncg=
Subject: Re: [PATCH v3 01/22] mm: introduce xvmalloc() et al and use for grant
 table allocations
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <69778de6-3b94-64d1-99d9-1a0fcfa503fd@suse.com>
 <YI/e9wyOpsVDkFQi@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aeb6aa8e-7c90-be22-1888-21b7b178e1d1@suse.com>
Date: Mon, 3 May 2021 15:50:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YI/e9wyOpsVDkFQi@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.05.2021 13:31, Roger Pau Monné wrote:
> On Thu, Apr 22, 2021 at 04:43:39PM +0200, Jan Beulich wrote:
>> All of the array allocations in grant_table_init() can exceed a page's
>> worth of memory, which xmalloc()-based interfaces aren't really suitable
>> for after boot. We also don't need any of these allocations to be
>> physically contiguous.. Introduce interfaces dynamically switching
>> between xmalloc() et al and vmalloc() et al, based on requested size,
>> and use them instead.
>>
>> All the wrappers in the new header get cloned mostly verbatim from
>> xmalloc.h, with the sole adjustment to switch unsigned long to size_t
>> for sizes and to unsigned int for alignments.
> 
> We seem to be growing a non-trivial amount of memory allocation
> families of functions: xmalloc, vmalloc and now xvmalloc.
> 
> I think from a consumer PoV it would make sense to only have two of
> those: one for allocations that require to be physically contiguous,
> and one for allocation that don't require it.
> 
> Even then, requesting for physically contiguous allocations could be
> done by passing a flag to the same interface that's used for
> non-contiguous allocations.
> 
> Maybe another option would be to expand the existing
> v{malloc,realloc,...} set of functions to have your proposed behaviour
> for xv{malloc,realloc,...}?

All of this and some of your remarks further down has already been
discussed. A working group has been formed. No progress since. Yes,
a smaller set of interfaces may be the way to go. Controlling
behavior via flags, otoh, is very much not malloc()-like. Making
existing functions have the intended new behavior is a no-go without
auditing all present uses, to find those few which actually may need
physically contiguous allocations.

Having seen similar naming elsewhere, I did propose xnew() /
xdelete() (plus array and flex-struct counterparts) as the single
new recommended interface; didn't hear back yet. But we'd switch to
that gradually, so intermediately there would still be a larger set
of interfaces.

I'm not convinced we should continue to have byte-granular allocation
functions producing physically contiguous memory. I think the page
allocator should be used directly in such cases.

>> --- /dev/null
>> +++ b/xen/include/xen/xvmalloc.h
>> @@ -0,0 +1,73 @@
>> +
>> +#ifndef __XVMALLOC_H__
>> +#define __XVMALLOC_H__
>> +
>> +#include <xen/cache.h>
>> +#include <xen/types.h>
>> +
>> +/*
>> + * Xen malloc/free-style interface for allocations possibly exceeding a page's
>> + * worth of memory, as long as there's no need to have physically contiguous
>> + * memory allocated.  These should be used in preference to xmalloc() et al
>> + * whenever the size is not known to be constrained to at most a single page.
> 
> Even when it's know that size <= PAGE_SIZE this helpers are
> appropriate as they would end up using xmalloc, so I think it's fine to
> recommend them universally as long as there's no need to alloc
> physically contiguous memory?
> 
> Granted there's a bit more overhead from the logic to decide between
> using xmalloc or vmalloc &c, but that's IMO not that big of a deal in
> order to not recommend this interface globally for non-contiguous
> alloc.

As long as xmalloc() and vmalloc() are meant stay around as separate
interfaces, I wouldn't want to "forbid" their use when it's sufficiently
clear that they would be chosen by the new function anyway. Otoh, if the
new function became more powerful in terms of falling back to the
respectively other lower level function, that might be an argument in
favor of always using the new interfaces.

>> + */
>> +
>> +/* Allocate space for typed object. */
>> +#define xvmalloc(_type) ((_type *)_xvmalloc(sizeof(_type), __alignof__(_type)))
>> +#define xvzalloc(_type) ((_type *)_xvzalloc(sizeof(_type), __alignof__(_type)))
>> +
>> +/* Allocate space for array of typed objects. */
>> +#define xvmalloc_array(_type, _num) \
>> +    ((_type *)_xvmalloc_array(sizeof(_type), __alignof__(_type), _num))
>> +#define xvzalloc_array(_type, _num) \
>> +    ((_type *)_xvzalloc_array(sizeof(_type), __alignof__(_type), _num))
>> +
>> +/* Allocate space for a structure with a flexible array of typed objects. */
>> +#define xvzalloc_flex_struct(type, field, nr) \
>> +    ((type *)_xvzalloc(offsetof(type, field[nr]), __alignof__(type)))
>> +
>> +#define xvmalloc_flex_struct(type, field, nr) \
>> +    ((type *)_xvmalloc(offsetof(type, field[nr]), __alignof__(type)))
>> +
>> +/* Re-allocate space for a structure with a flexible array of typed objects. */
>> +#define xvrealloc_flex_struct(ptr, field, nr)                          \
>> +    ((typeof(ptr))_xvrealloc(ptr, offsetof(typeof(*(ptr)), field[nr]), \
>> +                             __alignof__(typeof(*(ptr)))))
>> +
>> +/* Allocate untyped storage. */
>> +#define xvmalloc_bytes(_bytes) _xvmalloc(_bytes, SMP_CACHE_BYTES)
>> +#define xvzalloc_bytes(_bytes) _xvzalloc(_bytes, SMP_CACHE_BYTES)
> 
> I see xmalloc does the same, wouldn't it be enough to align to a lower
> value? Seems quite wasteful to align to 128 on x86 by default?

Yes, it would. Personally (see "[PATCH v2 0/8] assorted replacement of
x[mz]alloc_bytes()") I think these ..._bytes() wrappers should all go
away. Hence I don't think it's very important how exactly they behave,
and in turn it's then best to have them match x[mz]alloc_bytes().

>> +
>> +/* Free any of the above. */
>> +extern void xvfree(void *);
>> +
>> +/* Free an allocation, and zero the pointer to it. */
>> +#define XVFREE(p) do { \
>> +    xvfree(p);         \
>> +    (p) = NULL;        \
>> +} while ( false )
>> +
>> +/* Underlying functions */
>> +extern void *_xvmalloc(size_t size, unsigned int align);
>> +extern void *_xvzalloc(size_t size, unsigned int align);
>> +extern void *_xvrealloc(void *ptr, size_t size, unsigned int align);
> 
> Nit: I would drop the 'extern' keyword from the function prototypes.

Ah yes, will do. Simply a result of taking the other header as basis.

Jan

