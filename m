Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE822C3FA9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 13:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37691.70147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khti4-0007qI-2a; Wed, 25 Nov 2020 12:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37691.70147; Wed, 25 Nov 2020 12:15:44 +0000
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
	id 1khti3-0007pt-VY; Wed, 25 Nov 2020 12:15:43 +0000
Received: by outflank-mailman (input) for mailman id 37691;
 Wed, 25 Nov 2020 12:15:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1khti2-0007po-Qr
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:15:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khti0-0006MZ-KD; Wed, 25 Nov 2020 12:15:40 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khti0-0003Lg-8h; Wed, 25 Nov 2020 12:15:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khti2-0007po-Qr
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 12:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=CT754L8UlLzqqf/JvmUA01cwFf2t8+0xTpzu6BdkLFg=; b=HCh8XK5ur16qRvLx/M2qC+ZQvJ
	EtCwJwXt3QOoFgz6etAqNs6hmL5U97KibQMu/4Z8xFj9Z7hBTB9VTjjJS9rutbiIs/mclLTF7oDDF
	R6kOwqMMo5vhcsHdDTIdXGjKORzRWCIHnkCuMP8LlMQgzm3l8IR62edTiHqXZYnpnT1U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khti0-0006MZ-KD; Wed, 25 Nov 2020 12:15:40 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khti0-0003Lg-8h; Wed, 25 Nov 2020 12:15:40 +0000
Subject: Re: [PATCH v2 02/17] mm: introduce xvmalloc() et al and use for grant
 table allocations
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <23acd443-348c-5ef9-0fb5-880e06cc9a2d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0c40a6f6-af8c-1040-f249-36752df3a1f1@xen.org>
Date: Wed, 25 Nov 2020 12:15:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <23acd443-348c-5ef9-0fb5-880e06cc9a2d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/11/2020 14:23, Jan Beulich wrote:
> All of the array allocations in grant_table_init() can exceed a page's
> worth of memory, which xmalloc()-based interfaces aren't really suitable
> for after boot. We also don't need any of these allocations to be
> physically contiguous.. Introduce interfaces dynamically switching
> between xmalloc() et al and vmalloc() et al, based on requested size,
> and use them instead.
> 
> All the wrappers in the new header get cloned mostly verbatim from
> xmalloc.h, with the sole adjustment to switch unsigned long to size_t
> for sizes and to unsigned int for alignments.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Actually edit a copy-and-pasted comment in xvmalloc.h which was
>      meant to be edited from the beginning.
> ---
> I'm unconvinced of the mentioning of "physically contiguous" in the
> comment at the top of the new header: I don't think xmalloc() provides
> such a guarantee. Any use assuming so would look (latently) broken to
> me.

I haven't had the chance to reply to the first version about this. So I 
will reply here to avoid confusion.

I can at least spot one user in Arm that would use xmalloc() that way 
(see the allocation of itt_addr in arch/arm/gic-v3-its.c).

AFAIK, the memory is for the sole purpose of the ITS and should not be 
accessed by Xen. So I think we can replace by a new version of 
alloc_domheap_pages().

However, I still question the usefulness of introducing yet another way 
to allocate memory (we already have alloc_xenheap_pages(), xmalloc(), 
alloc_domheap_pages(), vmap()) if you think users cannot rely on 
xmalloc() to allocate memory physically contiguous.

It definitely makes more difficult to figure out when to use xmalloc() 
vs xvalloc().

I would like to hear an opinion from the other maintainers.

> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -37,7 +37,7 @@
>   #include <xen/iommu.h>
>   #include <xen/paging.h>
>   #include <xen/keyhandler.h>
> -#include <xen/vmap.h>
> +#include <xen/xvmalloc.h>
>   #include <xen/nospec.h>
>   #include <xsm/xsm.h>
>   #include <asm/flushtlb.h>
> @@ -1925,27 +1925,28 @@ int grant_table_init(struct domain *d, i
>       d->grant_table = gt;
>   
>       /* Active grant table. */
> -    gt->active = xzalloc_array(struct active_grant_entry *,
> -                               max_nr_active_grant_frames(gt));
> +    gt->active = xvzalloc_array(struct active_grant_entry *,
> +                                max_nr_active_grant_frames(gt));
>       if ( gt->active == NULL )
>           goto out;
>   
>       /* Tracking of mapped foreign frames table */
>       if ( gt->max_maptrack_frames )
>       {
> -        gt->maptrack = vzalloc(gt->max_maptrack_frames * sizeof(*gt->maptrack));
> +        gt->maptrack = xvzalloc_array(struct grant_mapping *,
> +                                      gt->max_maptrack_frames);
>           if ( gt->maptrack == NULL )
>               goto out;
>       }
>   
>       /* Shared grant table. */
> -    gt->shared_raw = xzalloc_array(void *, gt->max_grant_frames);
> +    gt->shared_raw = xvzalloc_array(void *, gt->max_grant_frames);
>       if ( gt->shared_raw == NULL )
>           goto out;
>   
>       /* Status pages for grant table - for version 2 */
> -    gt->status = xzalloc_array(grant_status_t *,
> -                               grant_to_status_frames(gt->max_grant_frames));
> +    gt->status = xvzalloc_array(grant_status_t *,
> +                                grant_to_status_frames(gt->max_grant_frames));
>       if ( gt->status == NULL )
>           goto out;
>   
> @@ -3870,19 +3871,19 @@ grant_table_destroy(
>   
>       for ( i = 0; i < nr_grant_frames(t); i++ )
>           free_xenheap_page(t->shared_raw[i]);
> -    xfree(t->shared_raw);
> +    xvfree(t->shared_raw);
>   
>       for ( i = 0; i < nr_maptrack_frames(t); i++ )
>           free_xenheap_page(t->maptrack[i]);
> -    vfree(t->maptrack);
> +    xvfree(t->maptrack);
>   
>       for ( i = 0; i < nr_active_grant_frames(t); i++ )
>           free_xenheap_page(t->active[i]);
> -    xfree(t->active);
> +    xvfree(t->active);
>   
>       for ( i = 0; i < nr_status_frames(t); i++ )
>           free_xenheap_page(t->status[i]);
> -    xfree(t->status);
> +    xvfree(t->status);
>   
>       xfree(t);
>       d->grant_table = NULL;
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
> @@ -301,11 +302,29 @@ void *vzalloc(size_t size)
>       return p;
>   }
>   
> -void vfree(void *va)
> +static void _vfree(const void *va, unsigned int pages, enum vmap_region type)
>   {
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
> @@ -317,18 +336,71 @@ void vfree(void *va)
>           type = VMAP_XEN;
>           pages = vm_size(va, type);
>       }
> -    ASSERT(pages);
>   
> -    for ( i = 0; i < pages; i++ )
> +    _vfree(va, pages, type);
> +}
> +
> +void xvfree(void *va)
> +{
> +    unsigned int pages = vm_size(va, VMAP_DEFAULT);
> +
> +    if ( pages )
> +        _vfree(va, pages, VMAP_DEFAULT);
> +    else
> +        xfree(va);
> +}
> +
> +void *_xvmalloc(size_t size, unsigned int align)
> +{
> +    ASSERT(align <= PAGE_SIZE);
> +    return size <= PAGE_SIZE ? _xmalloc(size, align) : vmalloc(size);
> +}
> +
> +void *_xvzalloc(size_t size, unsigned int align)
> +{
> +    ASSERT(align <= PAGE_SIZE);
> +    return size <= PAGE_SIZE ? _xzalloc(size, align) : vzalloc(size);
> +}
> +
> +void *_xvrealloc(void *va, size_t size, unsigned int align)
> +{
> +    size_t pages = vm_size(va, VMAP_DEFAULT);
> +    void *ptr;
> +
> +    ASSERT(align <= PAGE_SIZE);
> +
> +    if ( !pages )
>       {
> -        struct page_info *page = vmap_to_page(va + i * PAGE_SIZE);
> +        if ( size <= PAGE_SIZE )
> +            return _xrealloc(va, size, align);
>   
> -        ASSERT(page);
> -        page_list_add(page, &pg_list);
> +        ptr = vmalloc(size);
> +        if ( ptr && va && va != ZERO_BLOCK_PTR )
> +        {
> +            /*
> +             * xmalloc-based allocations up to PAGE_SIZE don't cross page
> +             * boundaries. Therefore, without needing to know the exact
> +             * prior allocation size, simply copy the entire tail of the
> +             * page containing the earlier allocation.
> +             */
> +            memcpy(ptr, va, PAGE_SIZE - PAGE_OFFSET(va));
> +            xfree(va);
> +        }
> +    }
> +    else if ( pages == PFN_UP(size) )
> +        ptr = va;
> +    else
> +    {
> +        ptr = _xvmalloc(size, align);
> +        if ( ptr )
> +        {
> +            memcpy(ptr, va, min(size, pages << PAGE_SHIFT));
> +            vfree(va);
> +        }
> +        else if ( pages > PFN_UP(size) )
> +            ptr = va;
>       }
> -    vunmap(va);
>   
> -    while ( (pg = page_list_remove_head(&pg_list)) != NULL )
> -        free_domheap_page(pg);
> +    return ptr;
>   }
>   #endif
> --- /dev/null
> +++ b/xen/include/xen/xvmalloc.h
> @@ -0,0 +1,73 @@
> +
> +#ifndef __XVMALLOC_H__
> +#define __XVMALLOC_H__
> +
> +#include <xen/cache.h>
> +#include <xen/types.h>
> +
> +/*
> + * Xen malloc/free-style interface for allocations possibly exceeding a page's
> + * worth of memory, as long as there's no need to have physically contiguous
> + * memory allocated.  These should be used in preference to xmalloc() et al
> + * whenever the size is not known to be constrained to at most a single page.
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

