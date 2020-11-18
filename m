Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210E32B8470
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 20:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30237.60087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfSqF-0003EU-Sn; Wed, 18 Nov 2020 19:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30237.60087; Wed, 18 Nov 2020 19:10:07 +0000
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
	id 1kfSqF-0003CH-OL; Wed, 18 Nov 2020 19:10:07 +0000
Received: by outflank-mailman (input) for mailman id 30237;
 Wed, 18 Nov 2020 19:10:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfSqE-0003BQ-PV
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 19:10:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfSqC-0000b2-Cb; Wed, 18 Nov 2020 19:10:04 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfSqB-0005Zx-Sk; Wed, 18 Nov 2020 19:10:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfSqE-0003BQ-PV
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 19:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ZPDYQeEJMUeJ53IrIFmyaECuSyUuN6lz1LGnQKhaaOY=; b=PeZOptQ+HEnC90bBU/nDLY1FqO
	SLrQoH42sNEM6noPRIzyEPtEbzbVgqgnACvoBZkwoyQByaupx8R24vzd5fuK8bJjxOjyNxrPogya9
	dpEOqoaDnUx/l4sJDZFDBWGJTcTWZV6LxKh1Th917AuSGQi30xRXQ+eLQQZnB2TKJfe8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfSqC-0000b2-Cb; Wed, 18 Nov 2020 19:10:04 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfSqB-0005Zx-Sk; Wed, 18 Nov 2020 19:10:04 +0000
Subject: Re: [PATCH 1/3] mm: introduce xvmalloc() et al and use for grant
 table allocations
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e0364274-f123-82bd-ec85-bea519a34049@suse.com>
 <d98aabe4-6c1b-0970-2e42-eb991e9075a2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e7b72c54-e8e4-428d-9264-484fc0061ba4@xen.org>
Date: Wed, 18 Nov 2020 19:10:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <d98aabe4-6c1b-0970-2e42-eb991e9075a2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/11/2020 07:11, Jan Beulich wrote:
> All of the array allocations in grant_table_init() can exceed a page's
> worth of memory, which xmalloc()-based interfaces aren't really suitable
> for after boot. 

I can see a few reasons why they are not suitable:
   - xmalloc() will try to using an order and then throw memory. This is 
pretty inneficient.
   - xmalloc() will allocate physically contiguous memory

It would be good to clarify which one you refer because none of them are 
really a problem only after boot...

One thing to be aware thought is xv*() are going to be more inefficient 
because they involve touching the page-tables (at least until the work 
to map on-demand the direct map is not merged). In addition, on Arm, 
they will also use only 4K mappings (I have a TODO to fix that).

So I think we will need to be careful when to use xmalloc() vs 
xvalloc(). It might be worth outlining that in the documentation of xv*().

The current use in the grant-table code looks fine to me.

[...]

> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -7,6 +7,7 @@
>   #include <xen/spinlock.h>
>   #include <xen/types.h>
>   #include <xen/vmap.h>
> +#include <xen/xvmalloc.h>
>   #include <asm/page.h>
>   
>   static DEFINE_SPINLOCK(vm_lock);
> @@ -299,11 +300,29 @@ void *vzalloc(size_t size)
>       return p;
>   }
>   
> -void vfree(void *va)
> +static void _vfree(const void *va, unsigned int pages, enum vmap_region type)

I don't think "unsigned int" is sufficient to cover big size. AFAICT, 
this is not in a new problem in this code and seems to be a latent issue 
so far.

However, I feel that it is wrong to introduce a new set of allocation 
helpers that contained a flaw fixed in xm*alloc() recently (see  commit 
cf38b4926e2b "xmalloc: guard against integer overflow").

> -    unsigned int i, pages;
> +    unsigned int i;
>       struct page_info *pg;
>       PAGE_LIST_HEAD(pg_list);
> +
> +    ASSERT(pages);
> +
> +    for ( i = 0; i < pages; i++ )
> +    {
> +        pg = vmap_to_page(va + i * PAGE_SIZE);
> +        ASSERT(pg);
> +        page_list_add(pg, &pg_list);
> +    }
> +    vunmap(va);
> +
> +    while ( (pg = page_list_remove_head(&pg_list)) != NULL )
> +        free_domheap_page(pg);
> +}
> +
> +void vfree(void *va)
> +{
> +    unsigned int pages;
>       enum vmap_region type = VMAP_DEFAULT;
>   
>       if ( !va )
> @@ -315,18 +334,71 @@ void vfree(void *va)
>           type = VMAP_XEN;
>           pages = vm_size(va, type);
>       }
> -    ASSERT(pages);
>   
> -    for ( i = 0; i < pages; i++ )
> +    _vfree(va, pages, type);
> +}
> +

[...]

> --- /dev/null
> +++ b/xen/include/xen/xvmalloc.h
> @@ -0,0 +1,70 @@
> +
> +#ifndef __XVMALLOC_H__
> +#define __XVMALLOC_H__
> +
> +#include <xen/cache.h>
> +#include <xen/types.h>
> +
> +/*
> + * Xen malloc/free-style interface.

It would be useful to emphase that they should only be used if the 
caller does *not* need physically contiguous memory.

> + */
> +
> +/* Allocate space for typed object. */
> +#define xvmalloc(_type) ((_type *)_xvmalloc(sizeof(_type), __alignof__(_type)))
> +#define xvzalloc(_type) ((_type *)_xvzalloc(sizeof(_type), __alignof__(_type)))
> +
> +/* Allocate space for array of typed objects. */
> +#define xvmalloc_array(_type, _num) \
> +    ((_type *)_xvmalloc_array(sizeof(_type), __alignof__(_type), _num))
> +#define xvzalloc_array(_type, _num) \
> +    ((_type *)_xvzalloc_array(sizeof(_type), __alignof__(_type), _num))
> +
> +/* Allocate space for a structure with a flexible array of typed objects. */
> +#define xvzalloc_flex_struct(type, field, nr) \
> +    ((type *)_xvzalloc(offsetof(type, field[nr]), __alignof__(type)))
> +
> +#define xvmalloc_flex_struct(type, field, nr) \
> +    ((type *)_xvmalloc(offsetof(type, field[nr]), __alignof__(type)))
> +
> +/* Re-allocate space for a structure with a flexible array of typed objects. */
> +#define xvrealloc_flex_struct(ptr, field, nr)                          \
> +    ((typeof(ptr))_xvrealloc(ptr, offsetof(typeof(*(ptr)), field[nr]), \
> +                             __alignof__(typeof(*(ptr)))))
> +
> +/* Allocate untyped storage. */
> +#define xvmalloc_bytes(_bytes) _xvmalloc(_bytes, SMP_CACHE_BYTES)
> +#define xvzalloc_bytes(_bytes) _xvzalloc(_bytes, SMP_CACHE_BYTES)
> +
> +/* Free any of the above. */
> +extern void xvfree(void *);
> +
> +/* Free an allocation, and zero the pointer to it. */
> +#define XVFREE(p) do { \
> +    xvfree(p);         \
> +    (p) = NULL;        \
> +} while ( false )
> +
> +/* Underlying functions */
> +extern void *_xvmalloc(size_t size, unsigned int align);
> +extern void *_xvzalloc(size_t size, unsigned int align);
> +extern void *_xvrealloc(void *ptr, size_t size, unsigned int align);
> +
> +static inline void *_xvmalloc_array(
> +    size_t size, unsigned int align, unsigned long num)
> +{
> +    /* Check for overflow. */
> +    if ( size && num > UINT_MAX / size )
> +        return NULL;
> +    return _xvmalloc(size * num, align);
> +}
> +
> +static inline void *_xvzalloc_array(
> +    size_t size, unsigned int align, unsigned long num)
> +{
> +    /* Check for overflow. */
> +    if ( size && num > UINT_MAX / size )
> +        return NULL;
> +    return _xvzalloc(size * num, align);
> +}
> +
> +#endif /* __XVMALLOC_H__ */
> 

-- 
Julien Grall

