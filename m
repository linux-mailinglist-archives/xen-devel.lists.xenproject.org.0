Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98155392F1A
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:06:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133310.248552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFiU-0000Sx-01; Thu, 27 May 2021 13:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133310.248552; Thu, 27 May 2021 13:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFiT-0000QC-T8; Thu, 27 May 2021 13:06:25 +0000
Received: by outflank-mailman (input) for mailman id 133310;
 Thu, 27 May 2021 13:06:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lmFiT-0000Py-7q
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:06:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lmFiR-0008CS-CC; Thu, 27 May 2021 13:06:23 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lmFiR-000129-5t; Thu, 27 May 2021 13:06:23 +0000
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
	bh=bYm8+YoUMszRol+8NW8IYOBhNQiC/4d4yosbw40g3sA=; b=OVgsfzlXzZkMIIgEdg/fJgEe9F
	oK2xb4XwX7tk8jaIZQxr/5I1sqnTYUQZ1sJHqezrsAXj5J+l0oZ17NAQJ0irMAH49MvRncmC5pn1C
	X4tdG1UEmWi+hdns1FYUkAaJ2wtVyLGEZ5LM8h+BDFOaXOPBWpbLFeh8FksYF7ykAHy0=;
Subject: Re: [PATCH v2 07/12] mm: allow page scrubbing routine(s) to be arch
 controlled
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <49c46d4d-4eaa-16a8-ccc8-c873b0b1d092@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b1c10ad9-2cef-031d-39c2-8d2013b3e0b5@xen.org>
Date: Thu, 27 May 2021 14:06:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <49c46d4d-4eaa-16a8-ccc8-c873b0b1d092@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/05/2021 13:33, Jan Beulich wrote:
> Especially when dealing with large amounts of memory, memset() may not
> be very efficient; this can be bad enough that even for debug builds a
> custom function is warranted. We additionally want to distinguish "hot"
> and "cold" cases.

Do you have any benchmark showing the performance improvement?

> 
> Keep the default fallback to clear_page_*() in common code; this may
> want to be revisited down the road.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.
> ---
> The choice between hot and cold in scrub_one_page()'s callers is
> certainly up for discussion / improvement.

To get the discussion started, can you explain how you made the decision 
between hot/cot? This will also want to be written down in the commit 
message.

> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -55,6 +55,7 @@ obj-y += percpu.o
>   obj-y += physdev.o
>   obj-$(CONFIG_COMPAT) += x86_64/physdev.o
>   obj-y += psr.o
> +obj-bin-$(CONFIG_DEBUG) += scrub_page.o
>   obj-y += setup.o
>   obj-y += shutdown.o
>   obj-y += smp.o
> --- /dev/null
> +++ b/xen/arch/x86/scrub_page.S
> @@ -0,0 +1,41 @@
> +        .file __FILE__
> +
> +#include <asm/asm_defns.h>
> +#include <xen/page-size.h>
> +#include <xen/scrub.h>
> +
> +ENTRY(scrub_page_cold)
> +        mov     $PAGE_SIZE/32, %ecx
> +        mov     $SCRUB_PATTERN, %rax
> +
> +0:      movnti  %rax,   (%rdi)
> +        movnti  %rax,  8(%rdi)
> +        movnti  %rax, 16(%rdi)
> +        movnti  %rax, 24(%rdi)
> +        add     $32, %rdi
> +        sub     $1, %ecx
> +        jnz     0b
> +
> +        sfence
> +        ret
> +        .type scrub_page_cold, @function
> +        .size scrub_page_cold, . - scrub_page_cold
> +
> +        .macro scrub_page_stosb
> +        mov     $PAGE_SIZE, %ecx
> +        mov     $SCRUB_BYTE_PATTERN, %eax
> +        rep stosb
> +        ret
> +        .endm
> +
> +        .macro scrub_page_stosq
> +        mov     $PAGE_SIZE/8, %ecx
> +        mov     $SCRUB_PATTERN, %rax
> +        rep stosq
> +        ret
> +        .endm
> +
> +ENTRY(scrub_page_hot)
> +        ALTERNATIVE scrub_page_stosq, scrub_page_stosb, X86_FEATURE_ERMS
> +        .type scrub_page_hot, @function
> +        .size scrub_page_hot, . - scrub_page_hot

 From the commit message, it is not clear how the implementation for 
hot/cold was chosen. Can you outline in the commit message what are the 
assumption for each helper?

This will be helpful for anyone that may notice regression or even other 
arch if they need to implement it.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -124,6 +124,7 @@
>   #include <xen/types.h>
>   #include <xen/lib.h>
>   #include <xen/sched.h>
> +#include <xen/scrub.h>
>   #include <xen/spinlock.h>
>   #include <xen/mm.h>
>   #include <xen/param.h>
> @@ -750,27 +751,31 @@ static void page_list_add_scrub(struct p
>           page_list_add(pg, &heap(node, zone, order));
>   }
>   
> -/* SCRUB_PATTERN needs to be a repeating series of bytes. */
> -#ifndef NDEBUG
> -#define SCRUB_PATTERN        0xc2c2c2c2c2c2c2c2ULL
> -#else
> -#define SCRUB_PATTERN        0ULL
> +/*
> + * While in debug builds we want callers to avoid relying on allocations
> + * returning zeroed pages, for a production build, clear_page_*() is the
> + * fastest way to scrub.
> + */
> +#ifndef CONFIG_DEBUG
> +# undef  scrub_page_hot
> +# define scrub_page_hot clear_page_hot
> +# undef  scrub_page_cold
> +# define scrub_page_cold clear_page_cold
>   #endif
> -#define SCRUB_BYTE_PATTERN   (SCRUB_PATTERN & 0xff)
>   
> -static void scrub_one_page(const struct page_info *pg)
> +static void scrub_one_page(const struct page_info *pg, bool cold)
>   {
> +    void *ptr;
> +
>       if ( unlikely(pg->count_info & PGC_broken) )
>           return;
>   
> -#ifndef NDEBUG
> -    /* Avoid callers relying on allocations returning zeroed pages. */
> -    unmap_domain_page(memset(__map_domain_page(pg),
> -                             SCRUB_BYTE_PATTERN, PAGE_SIZE));
> -#else
> -    /* For a production build, clear_page() is the fastest way to scrub. */
> -    clear_domain_page(_mfn(page_to_mfn(pg)));
> -#endif
> +    ptr = __map_domain_page(pg);
> +    if ( cold )
> +        scrub_page_cold(ptr);
> +    else
> +        scrub_page_hot(ptr);
> +    unmap_domain_page(ptr);
>   }
>   
>   static void poison_one_page(struct page_info *pg)
> @@ -1046,12 +1051,14 @@ static struct page_info *alloc_heap_page
>       if ( first_dirty != INVALID_DIRTY_IDX ||
>            (scrub_debug && !(memflags & MEMF_no_scrub)) )
>       {
> +        bool cold = d && d != current->domain;

So the assumption is if the domain is not running, then the content is 
not in the cache. Is that correct?

> +
>           for ( i = 0; i < (1U << order); i++ )
>           {
>               if ( test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
>               {
>                   if ( !(memflags & MEMF_no_scrub) )
> -                    scrub_one_page(&pg[i]);
> +                    scrub_one_page(&pg[i], cold);
>   
>                   dirty_cnt++;
>               }
> @@ -1308,7 +1315,7 @@ bool scrub_free_pages(void)
>                   {
>                       if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
>                       {
> -                        scrub_one_page(&pg[i]);
> +                        scrub_one_page(&pg[i], true);
>                           /*
>                            * We can modify count_info without holding heap
>                            * lock since we effectively locked this buddy by
> @@ -1947,7 +1954,7 @@ static void __init smp_scrub_heap_pages(
>           if ( !mfn_valid(_mfn(mfn)) || !page_state_is(pg, free) )
>               continue;
>   
> -        scrub_one_page(pg);
> +        scrub_one_page(pg, true);
>       }
>   }
>   
> --- a/xen/include/asm-arm/page.h
> +++ b/xen/include/asm-arm/page.h
> @@ -135,6 +135,12 @@ extern size_t dcache_line_bytes;
>   
>   #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
>   
> +#define clear_page_hot  clear_page
> +#define clear_page_cold clear_page
> +
> +#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
> +#define scrub_page_cold      scrub_page_hot
> +
>   static inline size_t read_dcache_line_bytes(void)
>   {
>       register_t ctr;
> --- a/xen/include/asm-x86/page.h
> +++ b/xen/include/asm-x86/page.h
> @@ -239,6 +239,11 @@ void copy_page_sse2(void *, const void *
>   #define clear_page(_p)      clear_page_cold(_p)
>   #define copy_page(_t, _f)   copy_page_sse2(_t, _f)
>   
> +#ifdef CONFIG_DEBUG
> +void scrub_page_hot(void *);
> +void scrub_page_cold(void *);
> +#endif
> +
>   /* Convert between Xen-heap virtual addresses and machine addresses. */
>   #define __pa(x)             (virt_to_maddr(x))
>   #define __va(x)             (maddr_to_virt(x))
> --- /dev/null
> +++ b/xen/include/xen/scrub.h
> @@ -0,0 +1,24 @@
> +#ifndef __XEN_SCRUB_H__
> +#define __XEN_SCRUB_H__
> +
> +#include <xen/const.h>
> +
> +/* SCRUB_PATTERN needs to be a repeating series of bytes. */
> +#ifdef CONFIG_DEBUG
> +# define SCRUB_PATTERN       _AC(0xc2c2c2c2c2c2c2c2,ULL)
> +#else
> +# define SCRUB_PATTERN       _AC(0,ULL)
> +#endif
> +#define SCRUB_BYTE_PATTERN   (SCRUB_PATTERN & 0xff)
> +
> +#endif /* __XEN_SCRUB_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> 
> 

Cheers,

-- 
Julien Grall

