Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D070AD393E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010930.1389183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOz4b-0004pN-So; Tue, 10 Jun 2025 13:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010930.1389183; Tue, 10 Jun 2025 13:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOz4b-0004mF-PZ; Tue, 10 Jun 2025 13:31:29 +0000
Received: by outflank-mailman (input) for mailman id 1010930;
 Tue, 10 Jun 2025 13:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOz4a-0004kw-6s
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:31:28 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35cfa4ab-45ff-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:31:27 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad1b94382b8so947981366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:31:27 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc3837asm725933366b.126.2025.06.10.06.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 06:31:25 -0700 (PDT)
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
X-Inumbo-ID: 35cfa4ab-45ff-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562286; x=1750167086; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fq3Y4rNcbO1HCEm99djykcuFV4Ao7obzej6I/Y2jK3I=;
        b=E5QSct0fWP8iPyPgO2MaCYl0czlWMWXludkBIukWNW1w3QlqlSJMQ2k6rELvyZLmfA
         hjWGZrnGu7xZ3/wByTlzsZ+QhmQvIocgOPRtrkg++DggIygaYqpRlZwVHM8e0gn1WF2j
         tr9nvYrmREv30xBDLWMUcO9VyPnnE9tuv9/AsJX4+tF3sDGdpWYDKI/dsRWeRsup44fH
         uqt2CaPInMrE6EKypseT1/8C4kdXo9vFIGGdLw1eP8TjlDcYhfEhlMw+CB1X+Fxwcu5v
         +GANLe60FIIVn0U5zVqn93T1JMxGcrlpIZ8YslCNzBuz3aLzh9EarjZaCUxO/o19UoCJ
         CG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562286; x=1750167086;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fq3Y4rNcbO1HCEm99djykcuFV4Ao7obzej6I/Y2jK3I=;
        b=ROsFghGqeRaunoV9lwhVi5mRyW7ITYBWg4kYIqisRoE8qMvqqDxklzU4HeOenZr4xf
         rqtzq+ygT8w9OBZ/mp8XdemX2AFc7m2gn4uxqNarFArbgCl2KXPaS1UVRarOzKC+MVUd
         oMTKUStcL2Kw8EZKh7FCMOC+ZL0SG433rjSJdoR4iZVZCTBrVSNMGyZL6+/KgAao3beo
         rPyJe1Ce5q+1ZBUExzaST0DuAdVdU1bdqcgFs+LyGj5XgxuzXXc8LxovZL8CjM+cf+5f
         UhC8JnBNvxnvny0P8P3SO9nzV6yEvQznfSi/UyhMRgEabzwhvJP4xBAn1Zu9SgtOBs1e
         Hhaw==
X-Forwarded-Encrypted: i=1; AJvYcCUadleTb5RXdgpmM38P7gEwYaZktwH0G4sBXwkO668AjKXQ/2dEN+h+iT+Y1bvAQk2Numsshmz8vLQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhsEF+1wW86OrXFkHEJv7uqLkD3cPqmjc3RcKI030o2GgdwJU3
	t2chEfDSEjo2Qey5QXhGYPEFkLP5VNnKpHK7uvKfLOlvkji/hsatU1IC
X-Gm-Gg: ASbGncs2XaoL8pphM1Kks+OsNzEmjUMBOnNcCi3l6qM0jo1FaymVLfmLMgGTaIDeVBk
	7LvuqoNxEn/B1aCBka+fpeyM4khKLH8r9ruaCzkM4XE7t2qUqLGS57JueBDBiX0PoU56NFgHdKf
	2taEQeV4H+UZSWCWQeMH9N+C94d43yPzRdixljq4bu2JGVF2brJlWTeuavo0/PtNHQ/uetTl+mw
	RQx//tWCfa+aqesUyKcozZAoiECMED+piY5TDZ9NT124X8TbzwjULqnadN0r1seTx6EqW2N2tOu
	XE1UsVHYb7zwSv9vqMOkphRkPV1FNqc4KQHN0db6xSjWV5bCMtk5BobJJtocKA7o8vcCwkB7DLj
	5xDk6ZVJ1ReKQYlf6usbF75baN0NWQMls+FhWA4dOeVDS+g==
X-Google-Smtp-Source: AGHT+IGP+g95mFEJR/IeHA/WMM9mq/zz/hq0XvhDeZq0IYbh+eonTPIgjX6pnM66rokGU24ZJ2aNcA==
X-Received: by 2002:a17:907:3f8b:b0:ad8:9257:5740 with SMTP id a640c23a62f3a-ade7ac53e18mr273409566b.13.1749562286128;
        Tue, 10 Jun 2025 06:31:26 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0IFly4YCQMApzFg4B9RmvMse"
Message-ID: <c17f544e-7f88-4eae-a2f1-190160dbf21a@gmail.com>
Date: Tue, 10 Jun 2025 15:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] mm: allow page scrubbing routine(s) to be arch
 controlled
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
 <dd4ef3b1-bc28-46e8-bb2e-be7ecf3a303b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <dd4ef3b1-bc28-46e8-bb2e-be7ecf3a303b@suse.com>

This is a multi-part message in MIME format.
--------------0IFly4YCQMApzFg4B9RmvMse
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/5/25 12:28 PM, Jan Beulich wrote:
> Especially when dealing with large amounts of memory, memset() may not
> be very efficient; this can be bad enough that even for debug builds a
> custom function is warranted. We additionally want to distinguish "hot"
> and "cold" cases (with, as initial heuristic, "hot" being for any
> allocations a domain does for itself, assuming that in all other cases
> the page wouldn't be accessed [again] soon). The goal is for accesses
> of "cold" pages to not disturb caches (albeit finding a good balance
> between this and the higher latency looks to be difficult).
>
> Keep the default fallback to clear_page_*() in common code; this may
> want to be revisited down the road.
>
> Signed-off-by: Jan Beulich<jbeulich@suse.com>
> Acked-by: Julien Grall<jgrall@amazon.com>
> ---
> v4: Re-base.
> v3: Re-base.
> v2: New.
> ---
> The choice between hot and cold in scrub_one_page()'s callers is
> certainly up for discussion / improvement.
>
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -144,6 +144,12 @@ extern size_t dcache_line_bytes;
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
> --- a/xen/arch/ppc/include/asm/page.h
> +++ b/xen/arch/ppc/include/asm/page.h
> @@ -188,6 +188,12 @@ static inline void invalidate_icache(voi
>   #define clear_page(page) memset(page, 0, PAGE_SIZE)
>   #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
>   
> +#define clear_page_hot  clear_page
> +#define clear_page_cold clear_page
> +
> +#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
> +#define scrub_page_cold      scrub_page_hot
> +
>   /* TODO: Flush the dcache for an entire page. */
>   static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>   {
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -198,6 +198,12 @@ static inline void invalidate_icache(voi
>   #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
>   #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
>   
> +#define clear_page_hot  clear_page
> +#define clear_page_cold clear_page
> +
> +#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
> +#define scrub_page_cold      scrub_page_hot
> +

LGTM: Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>   static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>   {
>       const void *v = map_domain_page(_mfn(mfn));
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -58,6 +58,7 @@ obj-y += pci.o
>   obj-y += physdev.o
>   obj-$(CONFIG_COMPAT) += x86_64/physdev.o
>   obj-$(CONFIG_X86_PSR) += psr.o
> +obj-bin-$(CONFIG_DEBUG) += scrub_page.o
>   obj-y += setup.o
>   obj-y += shutdown.o
>   obj-y += smp.o
> --- a/xen/arch/x86/include/asm/page.h
> +++ b/xen/arch/x86/include/asm/page.h
> @@ -226,6 +226,11 @@ void copy_page_sse2(void *to, const void
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
> +++ b/xen/arch/x86/scrub_page.S
> @@ -0,0 +1,39 @@
> +        .file __FILE__
> +
> +#include <asm/asm_defns.h>
> +#include <xen/page-size.h>
> +#include <xen/scrub.h>
> +
> +FUNC(scrub_page_cold)
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
> +END(scrub_page_cold)
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
> +FUNC(scrub_page_hot)
> +        ALTERNATIVE scrub_page_stosq, scrub_page_stosb, X86_FEATURE_ERMS
> +END(scrub_page_hot)
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -135,6 +135,7 @@
>   #include <xen/pfn.h>
>   #include <xen/types.h>
>   #include <xen/sched.h>
> +#include <xen/scrub.h>
>   #include <xen/sections.h>
>   #include <xen/softirq.h>
>   #include <xen/spinlock.h>
> @@ -779,27 +780,31 @@ static void page_list_add_scrub(struct p
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
> @@ -1079,12 +1084,14 @@ static struct page_info *alloc_heap_page
>       if ( first_dirty != INVALID_DIRTY_IDX ||
>            (scrub_debug && !(memflags & MEMF_no_scrub)) )
>       {
> +        bool cold = d && d != current->domain;
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
> @@ -1349,7 +1356,7 @@ bool scrub_free_pages(void)
>                   {
>                       if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
>                       {
> -                        scrub_one_page(&pg[i]);
> +                        scrub_one_page(&pg[i], true);
>                           /*
>                            * We can modify count_info without holding heap
>                            * lock since we effectively locked this buddy by
> @@ -2074,7 +2081,7 @@ static struct page_info *alloc_color_hea
>       if ( !(memflags & MEMF_no_scrub) )
>       {
>           if ( need_scrub )
> -            scrub_one_page(pg);
> +            scrub_one_page(pg, d != current->domain);
>           else
>               check_one_page(pg);
>       }
> @@ -2225,7 +2232,7 @@ static void __init cf_check smp_scrub_he
>           if ( !mfn_valid(_mfn(mfn)) || !page_state_is(pg, free) )
>               continue;
>   
> -        scrub_one_page(pg);
> +        scrub_one_page(pg, true);
>       }
>   }
>   
> @@ -2930,7 +2937,7 @@ void unprepare_staticmem_pages(struct pa
>           if ( need_scrub )
>           {
>               /* TODO: asynchronous scrubbing for pages of static memory. */
> -            scrub_one_page(pg);
> +            scrub_one_page(pg, true);
>           }
>   
>           pg[i].count_info |= PGC_static;
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
--------------0IFly4YCQMApzFg4B9RmvMse
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/5/25 12:28 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:dd4ef3b1-bc28-46e8-bb2e-be7ecf3a303b@suse.com">
      <pre wrap="" class="moz-quote-pre">Especially when dealing with large amounts of memory, memset() may not
be very efficient; this can be bad enough that even for debug builds a
custom function is warranted. We additionally want to distinguish "hot"
and "cold" cases (with, as initial heuristic, "hot" being for any
allocations a domain does for itself, assuming that in all other cases
the page wouldn't be accessed [again] soon). The goal is for accesses
of "cold" pages to not disturb caches (albeit finding a good balance
between this and the higher latency looks to be difficult).

Keep the default fallback to clear_page_*() in common code; this may
want to be revisited down the road.

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
Acked-by: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:jgrall@amazon.com">&lt;jgrall@amazon.com&gt;</a>
---
v4: Re-base.
v3: Re-base.
v2: New.
---
The choice between hot and cold in scrub_one_page()'s callers is
certainly up for discussion / improvement.

--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -144,6 +144,12 @@ extern size_t dcache_line_bytes;
 
 #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
 
+#define clear_page_hot  clear_page
+#define clear_page_cold clear_page
+
+#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
+#define scrub_page_cold      scrub_page_hot
+
 static inline size_t read_dcache_line_bytes(void)
 {
     register_t ctr;
--- a/xen/arch/ppc/include/asm/page.h
+++ b/xen/arch/ppc/include/asm/page.h
@@ -188,6 +188,12 @@ static inline void invalidate_icache(voi
 #define clear_page(page) memset(page, 0, PAGE_SIZE)
 #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
 
+#define clear_page_hot  clear_page
+#define clear_page_cold clear_page
+
+#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
+#define scrub_page_cold      scrub_page_hot
+
 /* TODO: Flush the dcache for an entire page. */
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -198,6 +198,12 @@ static inline void invalidate_icache(voi
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
 #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
 
+#define clear_page_hot  clear_page
+#define clear_page_cold clear_page
+
+#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
+#define scrub_page_cold      scrub_page_hot
+</pre>
    </blockquote>
    <pre>LGTM: Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:dd4ef3b1-bc28-46e8-bb2e-be7ecf3a303b@suse.com">
      <pre wrap="" class="moz-quote-pre">
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
     const void *v = map_domain_page(_mfn(mfn));
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -58,6 +58,7 @@ obj-y += pci.o
 obj-y += physdev.o
 obj-$(CONFIG_COMPAT) += x86_64/physdev.o
 obj-$(CONFIG_X86_PSR) += psr.o
+obj-bin-$(CONFIG_DEBUG) += scrub_page.o
 obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -226,6 +226,11 @@ void copy_page_sse2(void *to, const void
 #define clear_page(_p)      clear_page_cold(_p)
 #define copy_page(_t, _f)   copy_page_sse2(_t, _f)
 
+#ifdef CONFIG_DEBUG
+void scrub_page_hot(void *);
+void scrub_page_cold(void *);
+#endif
+
 /* Convert between Xen-heap virtual addresses and machine addresses. */
 #define __pa(x)             (virt_to_maddr(x))
 #define __va(x)             (maddr_to_virt(x))
--- /dev/null
+++ b/xen/arch/x86/scrub_page.S
@@ -0,0 +1,39 @@
+        .file __FILE__
+
+#include &lt;asm/asm_defns.h&gt;
+#include &lt;xen/page-size.h&gt;
+#include &lt;xen/scrub.h&gt;
+
+FUNC(scrub_page_cold)
+        mov     $PAGE_SIZE/32, %ecx
+        mov     $SCRUB_PATTERN, %rax
+
+0:      movnti  %rax,   (%rdi)
+        movnti  %rax,  8(%rdi)
+        movnti  %rax, 16(%rdi)
+        movnti  %rax, 24(%rdi)
+        add     $32, %rdi
+        sub     $1, %ecx
+        jnz     0b
+
+        sfence
+        ret
+END(scrub_page_cold)
+
+        .macro scrub_page_stosb
+        mov     $PAGE_SIZE, %ecx
+        mov     $SCRUB_BYTE_PATTERN, %eax
+        rep stosb
+        ret
+        .endm
+
+        .macro scrub_page_stosq
+        mov     $PAGE_SIZE/8, %ecx
+        mov     $SCRUB_PATTERN, %rax
+        rep stosq
+        ret
+        .endm
+
+FUNC(scrub_page_hot)
+        ALTERNATIVE scrub_page_stosq, scrub_page_stosb, X86_FEATURE_ERMS
+END(scrub_page_hot)
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -135,6 +135,7 @@
 #include &lt;xen/pfn.h&gt;
 #include &lt;xen/types.h&gt;
 #include &lt;xen/sched.h&gt;
+#include &lt;xen/scrub.h&gt;
 #include &lt;xen/sections.h&gt;
 #include &lt;xen/softirq.h&gt;
 #include &lt;xen/spinlock.h&gt;
@@ -779,27 +780,31 @@ static void page_list_add_scrub(struct p
         page_list_add(pg, &amp;heap(node, zone, order));
 }
 
-/* SCRUB_PATTERN needs to be a repeating series of bytes. */
-#ifndef NDEBUG
-#define SCRUB_PATTERN        0xc2c2c2c2c2c2c2c2ULL
-#else
-#define SCRUB_PATTERN        0ULL
+/*
+ * While in debug builds we want callers to avoid relying on allocations
+ * returning zeroed pages, for a production build, clear_page_*() is the
+ * fastest way to scrub.
+ */
+#ifndef CONFIG_DEBUG
+# undef  scrub_page_hot
+# define scrub_page_hot clear_page_hot
+# undef  scrub_page_cold
+# define scrub_page_cold clear_page_cold
 #endif
-#define SCRUB_BYTE_PATTERN   (SCRUB_PATTERN &amp; 0xff)
 
-static void scrub_one_page(const struct page_info *pg)
+static void scrub_one_page(const struct page_info *pg, bool cold)
 {
+    void *ptr;
+
     if ( unlikely(pg-&gt;count_info &amp; PGC_broken) )
         return;
 
-#ifndef NDEBUG
-    /* Avoid callers relying on allocations returning zeroed pages. */
-    unmap_domain_page(memset(__map_domain_page(pg),
-                             SCRUB_BYTE_PATTERN, PAGE_SIZE));
-#else
-    /* For a production build, clear_page() is the fastest way to scrub. */
-    clear_domain_page(_mfn(page_to_mfn(pg)));
-#endif
+    ptr = __map_domain_page(pg);
+    if ( cold )
+        scrub_page_cold(ptr);
+    else
+        scrub_page_hot(ptr);
+    unmap_domain_page(ptr);
 }
 
 static void poison_one_page(struct page_info *pg)
@@ -1079,12 +1084,14 @@ static struct page_info *alloc_heap_page
     if ( first_dirty != INVALID_DIRTY_IDX ||
          (scrub_debug &amp;&amp; !(memflags &amp; MEMF_no_scrub)) )
     {
+        bool cold = d &amp;&amp; d != current-&gt;domain;
+
         for ( i = 0; i &lt; (1U &lt;&lt; order); i++ )
         {
             if ( test_and_clear_bit(_PGC_need_scrub, &amp;pg[i].count_info) )
             {
                 if ( !(memflags &amp; MEMF_no_scrub) )
-                    scrub_one_page(&amp;pg[i]);
+                    scrub_one_page(&amp;pg[i], cold);
 
                 dirty_cnt++;
             }
@@ -1349,7 +1356,7 @@ bool scrub_free_pages(void)
                 {
                     if ( test_bit(_PGC_need_scrub, &amp;pg[i].count_info) )
                     {
-                        scrub_one_page(&amp;pg[i]);
+                        scrub_one_page(&amp;pg[i], true);
                         /*
                          * We can modify count_info without holding heap
                          * lock since we effectively locked this buddy by
@@ -2074,7 +2081,7 @@ static struct page_info *alloc_color_hea
     if ( !(memflags &amp; MEMF_no_scrub) )
     {
         if ( need_scrub )
-            scrub_one_page(pg);
+            scrub_one_page(pg, d != current-&gt;domain);
         else
             check_one_page(pg);
     }
@@ -2225,7 +2232,7 @@ static void __init cf_check smp_scrub_he
         if ( !mfn_valid(_mfn(mfn)) || !page_state_is(pg, free) )
             continue;
 
-        scrub_one_page(pg);
+        scrub_one_page(pg, true);
     }
 }
 
@@ -2930,7 +2937,7 @@ void unprepare_staticmem_pages(struct pa
         if ( need_scrub )
         {
             /* TODO: asynchronous scrubbing for pages of static memory. */
-            scrub_one_page(pg);
+            scrub_one_page(pg, true);
         }
 
         pg[i].count_info |= PGC_static;
--- /dev/null
+++ b/xen/include/xen/scrub.h
@@ -0,0 +1,24 @@
+#ifndef __XEN_SCRUB_H__
+#define __XEN_SCRUB_H__
+
+#include &lt;xen/const.h&gt;
+
+/* SCRUB_PATTERN needs to be a repeating series of bytes. */
+#ifdef CONFIG_DEBUG
+# define SCRUB_PATTERN       _AC(0xc2c2c2c2c2c2c2c2,ULL)
+#else
+# define SCRUB_PATTERN       _AC(0,ULL)
+#endif
+#define SCRUB_BYTE_PATTERN   (SCRUB_PATTERN &amp; 0xff)
+
+#endif /* __XEN_SCRUB_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */

</pre>
    </blockquote>
  </body>
</html>

--------------0IFly4YCQMApzFg4B9RmvMse--

