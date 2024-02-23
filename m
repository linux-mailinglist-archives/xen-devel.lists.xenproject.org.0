Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6BF860BA7
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 08:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684657.1064665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdQS5-0007AK-4B; Fri, 23 Feb 2024 07:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684657.1064665; Fri, 23 Feb 2024 07:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdQS5-00078E-19; Fri, 23 Feb 2024 07:58:37 +0000
Received: by outflank-mailman (input) for mailman id 684657;
 Fri, 23 Feb 2024 07:58:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hL0v=KA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rdQS2-000788-TY
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 07:58:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57272a4e-d221-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 08:58:33 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CB65A4EE073D;
 Fri, 23 Feb 2024 08:58:32 +0100 (CET)
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
X-Inumbo-ID: 57272a4e-d221-11ee-8a57-1f161083a0e0
MIME-Version: 1.0
Date: Fri, 23 Feb 2024 08:58:32 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen: cache clearing and invalidation helpers
 refactoring
In-Reply-To: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com>
References: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com>
Message-ID: <4f3b3d52a3ba20b05ecfa068b916b804@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-19 16:14, Nicola Vetrini wrote:
> The cache clearing and invalidation helpers in x86 and Arm didn't
> comply with MISRA C Rule 17.7: "The value returned by a function
> having non-void return type shall be used". On Arm they
> were always returning 0, while some in x86 returned -EOPNOTSUPP
> and in common/grant_table the return value is saved.
> 
> As a consequence, a common helper arch_grant_cache_flush that returns
> an integer is introduced, so that each architecture can choose whether 
> to
> return an error value on certain conditions, and the helpers have 
> either
> been changed to return void (on Arm) or deleted entirely (on x86).
> 
> Signed-off-by: Julien Grall <julien@xen.org>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> The original refactor idea came from Julien Grall in [1]; I edited that 
> proposal
> to fix build errors.
> 
> I did introduce a cast to void for the call to flush_area_local on x86, 
> because
> even before this patch the return value of that function wasn't checked 
> in all
> but one use in x86/smp.c, and in this context the helper (perhaps 
> incidentally)
> ignored the return value of flush_area_local.
> 
> [1] 
> https://lore.kernel.org/xen-devel/09589e8f-77b6-47f7-b5bd-cf485e4b60f1@xen.org/
> ---
>  xen/arch/arm/include/asm/page.h     | 33 ++++++++++++++++++-----------
>  xen/arch/x86/include/asm/flushtlb.h | 23 ++++++++++----------
>  xen/common/grant_table.c            |  9 +-------
>  3 files changed, 34 insertions(+), 31 deletions(-)
> 

I'll put this patch in the backlog at the moment: too many intricacies 
while trying to untangle xen/flushtlb from xen/mm.h, and there are 
easier cases that can be done faster. If someone is interested I can 
post the partial work I've done so far, even though it doesn't
build on x86.

> diff --git a/xen/arch/arm/include/asm/page.h 
> b/xen/arch/arm/include/asm/page.h
> index 69f817d1e68a..e90c9de3616e 100644
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -123,6 +123,7 @@
> 
>  #ifndef __ASSEMBLY__
> 
> +#include <public/grant_table.h>
>  #include <xen/errno.h>
>  #include <xen/types.h>
>  #include <xen/lib.h>
> @@ -159,13 +160,13 @@ static inline size_t read_dcache_line_bytes(void)
>   * if 'range' is large enough we might want to use model-specific
>   * full-cache flushes. */
> 
> -static inline int invalidate_dcache_va_range(const void *p, unsigned 
> long size)
> +static inline void invalidate_dcache_va_range(const void *p, unsigned 
> long size)
>  {
>      size_t cacheline_mask = dcache_line_bytes - 1;
>      unsigned long idx = 0;
> 
>      if ( !size )
> -        return 0;
> +        return;
> 
>      /* Passing a region that wraps around is illegal */
>      ASSERT(((uintptr_t)p + size - 1) >= (uintptr_t)p);
> @@ -188,17 +189,15 @@ static inline int 
> invalidate_dcache_va_range(const void *p, unsigned long size)
>          asm volatile (__clean_and_invalidate_dcache_one(0) : : "r" (p 
> + idx));
> 
>      dsb(sy);           /* So we know the flushes happen before 
> continuing */
> -
> -    return 0;
>  }
> 
> -static inline int clean_dcache_va_range(const void *p, unsigned long 
> size)
> +static inline void clean_dcache_va_range(const void *p, unsigned long 
> size)
>  {
>      size_t cacheline_mask = dcache_line_bytes - 1;
>      unsigned long idx = 0;
> 
>      if ( !size )
> -        return 0;
> +        return;
> 
>      /* Passing a region that wraps around is illegal */
>      ASSERT(((uintptr_t)p + size - 1) >= (uintptr_t)p);
> @@ -211,18 +210,16 @@ static inline int clean_dcache_va_range(const 
> void *p, unsigned long size)
>              idx += dcache_line_bytes, size -= dcache_line_bytes )
>          asm volatile (__clean_dcache_one(0) : : "r" (p + idx));
>      dsb(sy);           /* So we know the flushes happen before 
> continuing */
> -    /* ARM callers assume that dcache_* functions cannot fail. */
> -    return 0;
>  }
> 
> -static inline int clean_and_invalidate_dcache_va_range
> +static inline void clean_and_invalidate_dcache_va_range
>      (const void *p, unsigned long size)
>  {
>      size_t cacheline_mask = dcache_line_bytes - 1;
>      unsigned long idx = 0;
> 
>      if ( !size )
> -        return 0;
> +        return;
> 
>      /* Passing a region that wraps around is illegal */
>      ASSERT(((uintptr_t)p + size - 1) >= (uintptr_t)p);
> @@ -235,8 +232,6 @@ static inline int 
> clean_and_invalidate_dcache_va_range
>              idx += dcache_line_bytes, size -= dcache_line_bytes )
>          asm volatile (__clean_and_invalidate_dcache_one(0) : : "r" (p 
> + idx));
>      dsb(sy);         /* So we know the flushes happen before 
> continuing */
> -    /* ARM callers assume that dcache_* functions cannot fail. */
> -    return 0;
>  }
> 
>  /* Macros for flushing a single small item.  The predicate is always
> @@ -266,6 +261,20 @@ static inline int 
> clean_and_invalidate_dcache_va_range
>              : : "r" (_p), "m" (*_p));                                  
>  \
>  } while (0)
> 
> +static inline int arch_grant_cache_flush(unsigned int op, const void 
> *p,
> +                                         unsigned long size)
> +{
> +    if ( (op & GNTTAB_CACHE_INVAL) && (op & GNTTAB_CACHE_CLEAN) )
> +        clean_and_invalidate_dcache_va_range(p, size);
> +    else if ( op & GNTTAB_CACHE_INVAL )
> +        invalidate_dcache_va_range(p, size);
> +    else if ( op & GNTTAB_CACHE_CLEAN )
> +        clean_dcache_va_range(p, size);
> +
> +    /* ARM callers assume that dcache_* functions cannot fail. */
> +    return 0;
> +}
> +
>  /*
>   * Write a pagetable entry.
>   *
> diff --git a/xen/arch/x86/include/asm/flushtlb.h 
> b/xen/arch/x86/include/asm/flushtlb.h
> index bb0ad58db49b..c37bf4455714 100644
> --- a/xen/arch/x86/include/asm/flushtlb.h
> +++ b/xen/arch/x86/include/asm/flushtlb.h
> @@ -10,6 +10,7 @@
>  #ifndef __FLUSHTLB_H__
>  #define __FLUSHTLB_H__
> 
> +#include <public/grant_table.h>
>  #include <xen/mm.h>
>  #include <xen/percpu.h>
>  #include <xen/smp.h>
> @@ -182,21 +183,21 @@ void flush_area_mask(const cpumask_t *mask, const 
> void *va,
>  }
> 
>  static inline void flush_page_to_ram(unsigned long mfn, bool 
> sync_icache) {}
> -static inline int invalidate_dcache_va_range(const void *p,
> -                                             unsigned long size)
> -{ return -EOPNOTSUPP; }
> -static inline int clean_and_invalidate_dcache_va_range(const void *p,
> -                                                       unsigned long 
> size)
> +
> +static inline int arch_grant_cache_flush(unsigned int op, const void 
> *p,
> +                                     unsigned long size)
>  {
> -    unsigned int order = get_order_from_bytes(size);
> +    unsigned int order;
> +
> +    if ( !(op & GNTTAB_CACHE_CLEAN) )
> +        return -EOPNOTSUPP;
> +
> +    order = get_order_from_bytes(size);
>      /* sub-page granularity support needs to be added if necessary */
> -    flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
> +    (void) flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
> +
>      return 0;
>  }
> -static inline int clean_dcache_va_range(const void *p, unsigned long 
> size)
> -{
> -    return clean_and_invalidate_dcache_va_range(p, size);
> -}
> 
>  unsigned int guest_flush_tlb_flags(const struct domain *d);
>  void guest_flush_tlb_mask(const struct domain *d, const cpumask_t 
> *mask);
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 5721eab22561..8615ea144bb3 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -3572,14 +3572,7 @@ static int _cache_flush(const 
> gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref
>      v = map_domain_page(mfn);
>      v += cflush->offset;
> 
> -    if ( (cflush->op & GNTTAB_CACHE_INVAL) && (cflush->op & 
> GNTTAB_CACHE_CLEAN) )
> -        ret = clean_and_invalidate_dcache_va_range(v, cflush->length);
> -    else if ( cflush->op & GNTTAB_CACHE_INVAL )
> -        ret = invalidate_dcache_va_range(v, cflush->length);
> -    else if ( cflush->op & GNTTAB_CACHE_CLEAN )
> -        ret = clean_dcache_va_range(v, cflush->length);
> -    else
> -        ret = 0;
> +    ret = arch_grant_cache_flush(cflush->op, v, cflush->length);
> 
>      if ( d != owner )
>      {

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

