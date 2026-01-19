Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188DED3A9C1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 14:01:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208106.1520352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhosI-0004dr-2k; Mon, 19 Jan 2026 13:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208106.1520352; Mon, 19 Jan 2026 13:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhosH-0004bi-Va; Mon, 19 Jan 2026 13:00:53 +0000
Received: by outflank-mailman (input) for mailman id 1208106;
 Mon, 19 Jan 2026 13:00:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhosG-0004bc-9P
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 13:00:52 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0898b41-f536-11f0-9ccf-f158ae23cfc8;
 Mon, 19 Jan 2026 14:00:49 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso2347364f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 05:00:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569998240sm22465267f8f.43.2026.01.19.05.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 05:00:48 -0800 (PST)
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
X-Inumbo-ID: e0898b41-f536-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768827649; x=1769432449; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sbCaCYw061cnJ/iE1RROMXPKMgAIfNLHQNz/ou7YqPk=;
        b=A7dOfxyotD+VTQIV5Dn8/A8UMg1z/wV3YBoVxVP3r12JP7OIfn5EOzEsvTW+O1p7Tt
         ex+YDjS8MJfZX7C92uMfsTXJi13ytQutEJT7mjTMA4jxFFkuWeMR38KpIeuEROTqRIR2
         Vz2w36C5jBjA/49YRpBSB1sr2Mh1lX4/h8iJeV3xLbdNqMk1ivE+bXPhv1WZLRYOMGE0
         bAOwwnHXzYTmQU1VI7mJIYypHdBI+Rj7lxZg9C/MzhH+cELhMmz7cqSE1BklHhM/8rjm
         puld8ublBLTcbrhUmY4fZxU/snLgIN1v1Pkn3zjUOE5UXtQvUc5Zu5EkwMv1np5bnHZf
         89hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768827649; x=1769432449;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbCaCYw061cnJ/iE1RROMXPKMgAIfNLHQNz/ou7YqPk=;
        b=uigzXlnZJ4oKOYhzG8/zcn/xC1hhpUStl53rsSn4N+N8EvkzlxUYrKIQouCuwFH8wb
         8Ppmnaw655mQRPXXi+oqfN/YXquHcXBCtG4ttkfcqr/qln/cDfMOtLpHe/GptLnKELhS
         cvLDNmyS1oJ628Z+IZXi+Xy1XIy/oblGNODqAqMVJwdny2mkhsZ9BtuBTYwAGCKS5b2t
         yWSLoAnLddXInsojWW3GZKrAD0C0eAVVOYMDjldxKqbYB5meFDaKxUZqwVqpCXBChGYq
         ngqmQlQgd23Yu1J3635yR067YTpx9ratzRM5TLJMW6BD5mtMId+RnBlkD2Yol9vZzd1K
         nG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIuuZRKMgDOmVbU+HqB2fMZUyFYXn/JhIWkEjRLC8xfkaz+qycoRk2DyLTYfg2QcLCbwjKfAXwjAs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzja6J6OE7IfmkXWmcSyoeb8W9QzeQTm49qpU96BP+j/WmHovXb
	TtH1NCPZvLKx/m0Ge4YhWMnS55NYVNXk+BpYhY7Z8da3w1204wlglMnhLrJ73Jw4ew==
X-Gm-Gg: AZuq6aJ/FVxtxFN5UAxhZ+M8zSLUY8D8QHTSFGDrHzfv1+lZclv5A9n6o5sGcHEXCxx
	WebnV5FoYhgAixctG2Y6F41fE8TPUM6sNXV3GkL7L1QKwDl+r1tIjNeDcXzFnQ583fOAr2IEqNW
	nceYbCyysTV6QxTFJ13sciAazI/Jnm3ZclKSXT2YUYi7ZxN0D39ftQyVs5xXYfqIHBID6Lwa4rK
	pUlQEWldpVv8vDd0rCt/0Tu3YBnatzb6iaoRyAPk2zzNBqDVaENp4cKLEnyX9YpEeUD+QmrXgvW
	r8aW0GJQIce8mwFK4eLUdRqDDmSBRsZSRP7adyD74Rx7J/zBz4erskmJOa+bpeOYC4Cg8yd+DQx
	95cyGvdhOwW9DMbPzrfB/U3fg2gW1wJA3vXCwd7W/UtO9bChsNGfDS7vQslw6UpAYzhZ9iaX5AZ
	uT8gZ9GlOJhCR+qqlIcFUmJbzC120zcQNtGw6ixfBXhXgGVzUi5WtUmPe0HDz/JGrSX8IrVaipQ
	3g=
X-Received: by 2002:a05:6000:1a8a:b0:430:f9c2:84ec with SMTP id ffacd0b85a97d-4356999d50fmr16255153f8f.26.1768827648433;
        Mon, 19 Jan 2026 05:00:48 -0800 (PST)
Message-ID: <7387457f-104a-436d-96ae-b70c77745200@suse.com>
Date: Mon, 19 Jan 2026 14:00:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260115111804.40199-1-roger.pau@citrix.com>
 <20260115111804.40199-3-roger.pau@citrix.com>
Content-Language: en-US
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
In-Reply-To: <20260115111804.40199-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2026 12:18, Roger Pau Monne wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -722,6 +722,15 @@ static void _domain_destroy(struct domain *d)
>  
>      XVFREE(d->console);
>  
> +    if ( d->pending_scrub )
> +    {
> +        BUG_ON(d->creation_finished);
> +        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
> +        d->pending_scrub = NULL;
> +        d->pending_scrub_order = 0;
> +        d->pending_scrub_index = 0;
> +    }

Because of the other zeroing wanted (it's not strictly needed, is it?),
it may be a little awkward to use FREE_DOMHEAP_PAGES() here. Yet I would
still have recommended to avoid its open-coding, if only we had such a
wrapper already.

Would this better be done earlier, in domain_kill(), to avoid needlessly
holding back memory that isn't going to be used by this domain anymore?
Would require the spinlock be acquired to guard against a racing
stash_allocation(), I suppose. In fact freeing right in
domain_unpause_by_systemcontroller() might be yet better (albeit without
eliminating the need to do it here or in domain_kill()).

> @@ -1678,6 +1687,14 @@ int domain_unpause_by_systemcontroller(struct domain *d)
>       */
>      if ( new == 0 && !d->creation_finished )
>      {
> +        if ( d->pending_scrub )
> +        {
> +            printk(XENLOG_ERR
> +                   "%pd: cannot be started with pending dirty pages, destroying\n",

s/dirty/unscrubbed/ to avoid ambiguity with "dirty" as in "needing writeback"?

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -159,6 +159,74 @@ static void increase_reservation(struct memop_args *a)
>      a->nr_done = i;
>  }
>  
> +/*
> + * Temporary storage for a domain assigned page that's not been fully scrubbed.
> + * Stored pages must be domheap ones.
> + *
> + * The stashed page can be freed at any time by Xen, the caller must pass the
> + * order and NUMA node requirement to the fetch function to ensure the
> + * currently stashed page matches it's requirements.
> + */
> +static void stash_allocation(struct domain *d, struct page_info *page,
> +                             unsigned int order, unsigned int scrub_index)
> +{
> +    BUG_ON(d->creation_finished);

Is this valid here and ...

> +    rspin_lock(&d->page_alloc_lock);
> +
> +    /*
> +     * Drop any stashed allocation to accommodated the current one.  This
> +     * interface is designed to be used for single-threaded domain creation.
> +     */
> +    if ( d->pending_scrub )
> +        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
> +
> +    d->pending_scrub_index = scrub_index;
> +    d->pending_scrub_order = order;
> +    d->pending_scrub = page;
> +
> +    rspin_unlock(&d->page_alloc_lock);
> +}
> +
> +static struct page_info *get_stashed_allocation(struct domain *d,
> +                                                unsigned int order,
> +                                                nodeid_t node,
> +                                                unsigned int *scrub_index)
> +{
> +    struct page_info *page = NULL;
> +
> +    BUG_ON(d->creation_finished && d->pending_scrub);

... here? A badly behaved toolstack could do a populate in parallel with
the initial unpause, couldn't it?

> +    rspin_lock(&d->page_alloc_lock);
> +
> +    /*
> +     * If there's a pending page to scrub check it satisfies the current
> +     * request.  If it doesn't keep it stashed and return NULL.
> +     */
> +    if ( !d->pending_scrub || d->pending_scrub_order != order ||
> +         (node != NUMA_NO_NODE && node != page_to_nid(d->pending_scrub)) )

Ah, and MEMF_exact_node is handled in the caller.

> +        goto done;
> +    else
> +    {
> +        page = d->pending_scrub;
> +        *scrub_index = d->pending_scrub_index;
> +    }
> +
> +    /*
> +     * The caller now owns the page, clear stashed information.  Prevent
> +     * concurrent usages of get_stashed_allocation() from returning the same
> +     * page to different contexts.
> +     */
> +    d->pending_scrub_index = 0;
> +    d->pending_scrub_order = 0;
> +    d->pending_scrub = NULL;
> +
> + done:
> +    rspin_unlock(&d->page_alloc_lock);
> +
> +    return page;
> +}

Hmm, you free the earlier allocation only in stash_allocation(), i.e. that
memory isn't available to fulfill the present request. (I do understand
that the freeing there can't be dropped, to deal with possible races
caused by the toolstack.)

The use of "goto" here also looks a little odd, as it would be easy to get
away without. Or else I'd like to ask that the "else" be dropped.

> @@ -286,6 +365,30 @@ static void populate_physmap(struct memop_args *a)
>                      goto out;
>                  }
>  
> +                if ( !d->creation_finished )
> +                {
> +                    unsigned int dirty_cnt = 0, j;

Declaring (another) j here is going to upset Eclair, I fear, as ...

> +                    /* Check if there's anything to scrub. */
> +                    for ( j = scrub_start; j < (1U << a->extent_order); j++ )
> +                    {
> +                        if ( !test_and_clear_bit(_PGC_need_scrub,
> +                                                 &page[j].count_info) )
> +                            continue;
> +
> +                        scrub_one_page(&page[j], true);
> +
> +                        if ( (j + 1) != (1U << a->extent_order) &&
> +                             !(++dirty_cnt & 0xff) &&
> +                             hypercall_preempt_check() )
> +                        {
> +                            a->preempted = 1;
> +                            stash_allocation(d, page, a->extent_order, ++j);

Better j + 1, as j's value isn't supposed to be used any further?

> +                            goto out;
> +                        }
> +                    }
> +                }
> +
>                  if ( unlikely(a->memflags & MEMF_no_tlbflush) )
>                  {
>                      for ( j = 0; j < (1U << a->extent_order); j++ )

... for this to work there must already be one available from an outer scope.

Jan

