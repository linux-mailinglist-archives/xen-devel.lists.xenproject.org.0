Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102368AD18F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 18:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710118.1109174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rywCV-0005uF-DR; Mon, 22 Apr 2024 16:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710118.1109174; Mon, 22 Apr 2024 16:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rywCV-0005s7-9b; Mon, 22 Apr 2024 16:07:27 +0000
Received: by outflank-mailman (input) for mailman id 710118;
 Mon, 22 Apr 2024 16:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jl0+=L3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rywCT-0005rz-Up
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 16:07:26 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68060173-00c2-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 18:07:24 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2dac77cdf43so60329731fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 09:07:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c458e00b00417e5b71188sm17147912wmo.34.2024.04.22.09.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 09:07:23 -0700 (PDT)
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
X-Inumbo-ID: 68060173-00c2-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713802043; x=1714406843; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=975lVMnszytEl3upgLuu1p/Eg1HdndrOxAwKCJCMx/g=;
        b=UqaeoIN9cI9xoJ3F3+G5yL0pSO82HQZPQ1sc4E3Cxdn6aeyTqKmjtPJxU77exIKr7A
         Jvm2mdw6ssuzMCVzmYl/SfwcSBz/1w0VTq83+rY3oGl7PvJ2baADUQ2nXQrdyAxTqCrN
         0/YAobSHyrjspPLJBLmLtKV8b1nCttirsgmeho1tL9S4HbIj/okCMpvKhc382tHrLH3s
         FdN+SUf94mvSwHofu6RYBN+JgUkh69Ze7hcBJSiCs3lOt48BXoLjoZ8DCEBBsdVPs3X2
         6vnTbzCC2kLEcZcrkigtfZhcDVpcOmPN2wk0sW7g41dYvnJYSTLMYeOK6RDHZL4y88hk
         jOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713802043; x=1714406843;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=975lVMnszytEl3upgLuu1p/Eg1HdndrOxAwKCJCMx/g=;
        b=en2lUqB5G4W2zjmFB5Axpd7WucsBaFEv0KaUnSeDXN3Gf8teM2X5M7QT63+Azr9LHq
         PqeiUaHv/7jKMh22Q4Aok/4fGCpZ5JFO6IY/DDT9F7dJ0j40MZpu/C7CkXq7gbTsn1vG
         MLkAMmHLn8WJkv1Ly8PJ6Q0A4I/YH6CIeSlOtinaM3W2PhKWYu2w2mt9clnEEF+CnAK7
         7IVCKQLJ+pK2RWDzs4FYT5vPb2EQJiLBR8RSXp4H6OPhrK++XkxquiGuuhTZvMJ29OTC
         k1WID4X+u3R/Y4lRpHsd/V77jurH+y7sWOaweP11qnQTYDDxOJ9eF2eVGEE1tbNPp9y0
         0dZA==
X-Forwarded-Encrypted: i=1; AJvYcCXk61PUfWMak0+s4LcCiXR5W6B9CdCJLgvsvms4lOSig+oroVcAw/XxCrtPm33D+CTICOoDBklw8UW8/J0QZSGYqPfBdEMXSgyi+nlD+t0=
X-Gm-Message-State: AOJu0YwUuDEr++IlB4InUNdQr/7bn0Ma5BujvCt+cElsZ21FZxLqGDfr
	x/UPV0vCpDfCUV002Zq3qmN182lwAD1bT/Yap84uWM4PdKGHgNkyQWDhPgE7Zg==
X-Google-Smtp-Source: AGHT+IHfARgW5V2JDCfqk0PAAoSa7aqS4Bvb7alEL0QkXuTcOcjRKa2AZOS9ZFgzzDc/wiDXH1753w==
X-Received: by 2002:a2e:9bd4:0:b0:2d6:c23f:7dff with SMTP id w20-20020a2e9bd4000000b002d6c23f7dffmr7370130ljj.44.1713802043475;
        Mon, 22 Apr 2024 09:07:23 -0700 (PDT)
Message-ID: <9fe28d3e-67e3-4654-8cac-8af2d0272006@suse.com>
Date: Mon, 22 Apr 2024 18:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] xen/memory : Add a stats_table resource type
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <cover.1698589351.git.matias.vara@vates.fr>
 <ec106b56640c92f91473c8855c8dccc20e3eb5df.1698589351.git.matias.vara@vates.fr>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ec106b56640c92f91473c8855c8dccc20e3eb5df.1698589351.git.matias.vara@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.10.2023 17:21, Matias Ezequiel Vara Larsen wrote:
> This commit proposes a new mechanism to query the RUNSTATE_running counter for
> a given vcpu from a dom0 userspace application. This commit proposes to expose
> that counter by using the acquire_resource interface. For this purpose, the
> commit adds a new resource named XENMEM_resource_stats_table and a
> type-specific resource named XENMEM_resource_stats_table_id_vcpustats. This
> type-specific resource is aiming at exposing per-VCPU counters.
> 
> The current mechanism relies on the XEN_DOMCTL_getvcpuinfo and holds a single
> global domctl_lock for the entire hypercall; and iterate over every vcpu in the
> system for every update thus impacting operations that share that lock. This
> commit proposes to expose vcpu RUNSTATE_running via the xenforeignmemory
> interface thus preventing to issue the hypercall and holding the lock.

Throughout can you please avoid "this commit" and "proposes" and alike? You
want to plainly describe what you do and why.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1092,6 +1092,27 @@ unsigned int ioreq_server_max_frames(const struct domain *d)
>      return nr;
>  }
>  
> +unsigned int stats_table_max_frames(const struct domain *d, unsigned int id)

Any particular reason this isn't next to its sibling acquire_stats_table()?

> +{
> +    unsigned int nr = 0;
> +    unsigned int size;
> +
> +    switch ( id )
> +    {
> +    case XENMEM_resource_stats_table_id_vcpustats:
> +        size = DIV_ROUND_UP(sizeof(struct vcpu_shmem_stats), SMP_CACHE_BYTES) +
> +               DIV_ROUND_UP(sizeof(struct vcpu_stats), SMP_CACHE_BYTES) * d->max_vcpus;
> +
> +        nr = DIV_ROUND_UP(size, PAGE_SIZE);
> +        break;
> +
> +    default:
> +        break;
> +    }
> +
> +    return nr;
> +}
> +
>  /*
>   * Return 0 on any kind of error.  Caller converts to -EINVAL.
>   *
> @@ -1113,6 +1134,9 @@ static unsigned int resource_max_frames(const struct domain *d,
>      case XENMEM_resource_vmtrace_buf:
>          return d->vmtrace_size >> PAGE_SHIFT;
>  
> +    case XENMEM_resource_stats_table:
> +        return stats_table_max_frames(d, id);
> +
>      default:
>          return -EOPNOTSUPP;
>      }
> @@ -1176,6 +1200,146 @@ static int acquire_vmtrace_buf(
>      return nr_frames;
>  }
>  
> +void stats_free_vcpu_mfn(struct domain * d)
> +{
> +    struct page_info *pg = d->vcpustats_page.pg;
> +    void * _va = d->vcpustats_page.va;

What use is the leading underscore here? Also (nit) stray blank after *.

> +    unsigned int i;
> +    unsigned int size;
> +    unsigned int nr_frames;
> +
> +    if ( !pg )
> +        return;
> +
> +    d->vcpustats_page.pg = NULL;
> +    d->vcpustats_page.va = NULL;
> +
> +    size = DIV_ROUND_UP(sizeof(struct vcpu_shmem_stats), SMP_CACHE_BYTES) +
> +           DIV_ROUND_UP(sizeof(struct vcpu_stats), SMP_CACHE_BYTES)
> +           * d->max_vcpus;
> +
> +    nr_frames = DIV_ROUND_UP(size, PAGE_SIZE);
> +
> +    vunmap(_va);
> +
> +    for ( i = 0; i < nr_frames; i++ )
> +    {
> +        put_page_alloc_ref(&pg[i]);
> +        put_page_and_type(&pg[i]);
> +    }
> +}
> +
> +static int stats_vcpu_alloc_mfn(struct domain *d)

Both functions' names suggest a single MFN is being allocated / freed.

> +{
> +    struct page_info *pg;
> +    int order;

This can't be negative, can it?

> +    unsigned int i;
> +    unsigned int size;
> +    unsigned int nr_frames;
> +    void *_va;
> +    mfn_t mfn;
> +    struct vcpu_shmem_stats *hd;
> +
> +    size = DIV_ROUND_UP(sizeof(struct vcpu_shmem_stats), SMP_CACHE_BYTES) +

Nit: Style is correct here, ...

> +           DIV_ROUND_UP(sizeof(struct vcpu_stats), SMP_CACHE_BYTES)
> +           * d->max_vcpus;

... but then not here (* belongs on the earlier line). Also this is the 3rd
instance of all the same expression, which thus likely wants putting in a
helper function.

> +    nr_frames = DIV_ROUND_UP(size, PAGE_SIZE);
> +
> +    order = get_order_from_bytes(size);
> +    pg = alloc_domheap_pages(d, order, MEMF_no_refcount);
> +
> +    if ( !pg )
> +        return -ENOMEM;
> +
> +    for ( i = 0; i < nr_frames; i++ )
> +    {
> +        if ( unlikely(!get_page_and_type(&pg[i], d, PGT_writable_page)) )
> +            /*
> +             * The domain can't possibly know about this page yet, so failure
> +             * here is a clear indication of something fishy going on.
> +             */
> +            goto refcnt_err;
> +    }
> +
> +    mfn = page_to_mfn(pg);
> +    _va = vmap(&mfn, nr_frames);

This won't work when nr_frames > 1. The first parameter of this function
points to an array of nr_frames elements. I think you mean vmap_contig(),
yet even better would be if you didn't needlessly allocate non-order-0
pages (and perhaps excess space) here.

> +    if ( !_va )
> +        goto refcnt_err;
> +
> +    for ( i = 0; i < nr_frames; i++ )
> +        clear_page(_va + i * PAGE_SIZE);
> +
> +    /* Initialize vcpu_shmem_stats header */
> +    hd = (struct vcpu_shmem_stats*)_va;

Please avoid casts when they're not needed.

> +    hd->magic = VCPU_STATS_MAGIC;
> +    hd->offset = ROUNDUP(sizeof(struct vcpu_shmem_stats), SMP_CACHE_BYTES);
> +    hd->size = sizeof(struct vcpu_stats);
> +    hd->stride = ROUNDUP(sizeof(struct vcpu_stats), SMP_CACHE_BYTES);

Don't you need an smp_wmb() here, to make sure ...

> +    d->vcpustats_page.va  = _va;
> +    d->vcpustats_page.pg = pg;

.. the global announcement of these pointers becomes visible only with the
page properly seeded?

> +    return 0;
> +
> + refcnt_err:
> +    /*
> +     * We can theoretically reach this point if someone has taken 2^43 refs on
> +     * the frames in the time the above loop takes to execute, or someone has
> +     * made a blind decrease reservation hypercall and managed to pick the
> +     * right mfn.  Free the memory we safely can, and leak the rest.
> +     */
> +    while ( i-- )
> +    {
> +        put_page_alloc_ref(&pg[i]);
> +        put_page_and_type(&pg[i]);
> +    }
> +
> +    return -ENODATA;
> +}
> +
> +static int acquire_stats_table(struct domain *d,
> +                               unsigned int id,
> +                               unsigned int frame,
> +                               unsigned int nr_frames,
> +                               xen_pfn_t mfn_list[])
> +{
> +    mfn_t mfn;
> +    int rc;
> +    unsigned int i;
> +    unsigned int max_frames;
> +
> +    if ( !d )
> +        return -ENOENT;
> +
> +    switch ( id )
> +    {
> +    case XENMEM_resource_stats_table_id_vcpustats:
> +        max_frames = DIV_ROUND_UP(d->max_vcpus * sizeof(struct vcpu_stats),
> +                                  PAGE_SIZE);

What about the sizeof(struct vcpu_shmem_stats) part? And what about the
SMP_CACHE_BYTES alignment enforced elsewhere?

> +        if ( (frame + nr_frames) > max_frames )
> +            return -EINVAL;
> +
> +        if ( !d->vcpustats_page.pg )
> +        {
> +            rc = stats_vcpu_alloc_mfn(d);
> +            if ( rc )
> +                return rc;
> +        }

I might guess you have taken acquire_vmtrace_buf() for reference, but
that looks to suffer the same issue as this code: What if two racing
requests appear? Both will allocate new memory, and either of the two
blocks will be leaked. With the "right" timing you may even end up with
inconsistent .va and .pg fields.

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -264,6 +264,11 @@ static inline void vcpu_runstate_change(
>  {
>      s_time_t delta;
>      struct sched_unit *unit = v->sched_unit;
> +    struct vcpu_shmem_stats *vcpu_shmem;
> +    struct vcpu_stats *vcpu_info;
> +    void *_va;
> +    struct domain *d = v->domain;
> +    int offset;

Once again - this can't be negative, can it? (I question the need for the
variable in the first place, though.)

> @@ -287,6 +292,21 @@ static inline void vcpu_runstate_change(
>      }
>  
>      v->runstate.state = new_state;
> +
> +    _va = d->vcpustats_page.va;
> +
> +    if ( !_va )
> +        return;
> +
> +    vcpu_shmem = (struct vcpu_shmem_stats*)_va;
> +    vcpu_info = (struct vcpu_stats*)((void*)vcpu_shmem + vcpu_shmem->offset);

You just cast _va from void *. And here you cast it back right away. As before,
please limit casts to ones actually necessary (and sensible).

> --- a/xen/include/public/vcpu.h
> +++ b/xen/include/public/vcpu.h
> @@ -235,6 +235,33 @@ struct vcpu_register_time_memory_area {
>  typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
>  DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
>  
> +struct vcpu_shmem_stats {
> +#define VCPU_STATS_MAGIC 0xaabbccdd
> +    uint32_t magic;
> +    uint32_t offset;
> +    uint32_t size;
> +    uint32_t stride;
> +};
> +
> +struct vcpu_stats {
> +    /*
> +     * If the least-significant bit of the seq number is set then an update
> +     * is in progress and the consumer must wait to read a consistent set of
> +     * values. This mechanism is similar to Linux's seqlock.
> +     */
> +    uint32_t seq;
> +    uint32_t pad0;
> +    /*
> +     * If the most-significant bit of a counter is set then the counter
> +     * is inactive and the consumer must ignore its value. Note that this
> +     * could also indicate that the counter has overflowed.
> +     */
> +     uint64_t runstate_running_time;

Nit: Indentation.

> +};
> +
> +typedef struct vcpu_shmem_stats xen_vcpu_shmemstats_t;
> +typedef struct vcpu_stats xen_shared_vcpustats_t;

When you properly use xen_ prefixes for the typedef names, why not also for
the structure tags and (then XEN_) for the magic number?

Also - no blank line above here please.

Jan

