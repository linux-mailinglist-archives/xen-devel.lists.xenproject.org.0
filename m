Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF81D08DBF
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 12:20:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198572.1515466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veAWj-0002AV-Iq; Fri, 09 Jan 2026 11:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198572.1515466; Fri, 09 Jan 2026 11:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veAWj-00028V-Fe; Fri, 09 Jan 2026 11:19:33 +0000
Received: by outflank-mailman (input) for mailman id 1198572;
 Fri, 09 Jan 2026 11:19:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1veAWh-00028P-MY
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 11:19:31 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10124b94-ed4d-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 12:19:28 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so45150265e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 03:19:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e180csm21370659f8f.10.2026.01.09.03.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 03:19:27 -0800 (PST)
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
X-Inumbo-ID: 10124b94-ed4d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767957568; x=1768562368; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z5Kg0iZz2V5+JGG8wyvq+zNrYx/Z3iemfLBzPnVlScA=;
        b=Sx/DSJXNjkMxB8QLY+Ub8vYUS39fvLV+7zkRoJ71Z51Lw5Q9U6QyqILgpzClk5umdA
         Ezx70GJEINufwPV0ITljPGwapO14XNCdmpfv821/qfKGOXapsvUCovS4is18zqJxUgwP
         NwSv3G4GALePjWGHmd0hOeYjK0yOdkLUOxUbWRv9NejoFqNu4eoPPJp2w7+uCKJhJKNf
         EwZTZy8OBVNKkkP8+PURI32+zSE/9aRBtFI7UJ22SYA2yBj70M+GVVprjCivhi2/x5CO
         vLe4T0ZwFZ4i4X9hHWxZ4LSOsI1VnzgIbUl9YbOX7jiETcMW+hQWY31x6hjh2yEH2Iud
         sUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767957568; x=1768562368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5Kg0iZz2V5+JGG8wyvq+zNrYx/Z3iemfLBzPnVlScA=;
        b=fN5IMNTgPL6RPdjH65d6DrE8u7VQDJm1M7WnxguwnjObNcKw52iLBNy0LpahnEhVJ7
         q1zcsLEeKw0Q2n7YdhSE3QcgnzrnKpBNhzgcl1SJk7erkWmcNSwRDp1cF4gfqJXRnhm2
         iBrsRarTTBbEsUkLG06FNfBLbM+mXfkyWTybq59pyUmgT4dNoHzEd7lMwIN7mvuRiuvR
         SRXLcKk/rII64fF4hkFUzickjwEzA8txIUpjkIN16BLlm/9uFfnaay5a59pFvpDYOXk5
         celipnPZTpYQdQ65NoQJ9+JJ3ruhoilMhYKO1StiXblHbDm6reGbFYDqB0V+50IIJED6
         cCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZtgoaTvdOH8rVn3U6KSPauKGznWNTB8OPhz3tRD3SDxErUIW2molXm0bf9PjVl84zBrbkn1vdOYk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyx7F0AvnVqIBFaA2VONEB2R+db+oxnU9nHHGSPQhntVmh9la/a
	zb4DXR7UYhse6MpcegPxPCCNoA3aXlIoj20vR/rZM8Q0L7wN7WWE09CD4cdjmnt9uw==
X-Gm-Gg: AY/fxX76js+vpuEgw4ere4n3U7CdkD+GVOTwIt4f+i4RoZoZO4ko6ABBQS4xAdzLg7P
	JIrmXmxXUrq5ASFzxbAzMPk7Wmkmkg/hoYQfBFMqnCb7yNPTYxvX4SHM7H7+WGYqu4NQweitFkd
	0L/WmnO+BywBEeNQ5R8RCbis3Gbs2pZ3isx5d2RmMZkKofjBiKxJdYfwhdqvS5kztgQSjjpKzBI
	oS+vNKuZ4PbkWfJihiqh7kA+6BKux56j4T1WCDjIzEWdtAz2m1DlgUvikA8hkZOtUOMIyzKXzBB
	1OpAXLKZZ+96LgW5wuAUuyg4C1HDNuwsHuScOkXjnPefjncb4Re5Qyc5I7qNyu4euCCaGRBHF0T
	L817iUmmZEQhic9Asx59MwBiKr1a7JlVoVKP3bay/9z5HroWoL9Fm68OK1ZT+wds6jizBOzhu1Q
	2/Ggvw44PGVviozPSbxth/MfAUkl4in6zMmVj6nfatSsmwU/jMReaS88V9P/UCQgxGWZd9FEFmu
	to=
X-Google-Smtp-Source: AGHT+IEdKuuOO7zAhzWM3sTT3CilzFXkWQ52lXtmErcQ5bONUWcJIJXU2/escThixxSUWm4SBFoAPA==
X-Received: by 2002:a05:600c:4f53:b0:477:7991:5d1e with SMTP id 5b1f17b1804b1-47d84b3860fmr92418665e9.25.1767957568115;
        Fri, 09 Jan 2026 03:19:28 -0800 (PST)
Message-ID: <b547676c-ff2e-4a56-b3b4-2b2da167e2f1@suse.com>
Date: Fri, 9 Jan 2026 12:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/mm: limit non-scrubbed allocations to a specific
 order
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260108175536.82153-1-roger.pau@citrix.com>
 <20260108175536.82153-3-roger.pau@citrix.com>
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
In-Reply-To: <20260108175536.82153-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.01.2026 18:55, Roger Pau Monne wrote:
> The current model of falling back to allocate unscrubbed pages and scrub
> them in place at allocation time risks triggering the watchdog:
> 
> Watchdog timer detects that CPU55 is stuck!
> ----[ Xen-4.17.5-21  x86_64  debug=n  Not tainted ]----
> CPU:    55
> RIP:    e008:[<ffff82d040204c4a>] clear_page_sse2+0x1a/0x30
> RFLAGS: 0000000000000202   CONTEXT: hypervisor (d0v12)
> [...]
> Xen call trace:
>    [<ffff82d040204c4a>] R clear_page_sse2+0x1a/0x30
>    [<ffff82d04022a121>] S clear_domain_page+0x11/0x20
>    [<ffff82d04022c170>] S common/page_alloc.c#alloc_heap_pages+0x400/0x5a0
>    [<ffff82d04022d4a7>] S alloc_domheap_pages+0x67/0x180
>    [<ffff82d040226f9f>] S common/memory.c#populate_physmap+0x22f/0x3b0
>    [<ffff82d040228ec8>] S do_memory_op+0x728/0x1970
> 
> The maximum allocation order on x86 is limited to 18, that means allocating
> and scrubbing possibly 1G worth of memory in 4K chunks.
> 
> Start by limiting dirty allocations to CONFIG_DOMU_MAX_ORDER, which is
> currently set to 2M chunks.  However such limitation might cause
> fragmentation in HVM p2m population during domain creation.  To prevent
> that introduce some extra logic in populate_physmap() that fallback to
> preemptive page-scrubbing if the requested allocation cannot be fulfilled
> and there's scrubbing work to do.  This approach is less fair than the
> current one, but allows preemptive page scrubbing in the context of
> populate_physmap() to attempt to ensure unnecessary page-shattering.
> 
> Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I'm not particularly happy with this approach, as it doesn't guarantee
> progress for the callers.  IOW: a caller might do a lot of scrubbing, just
> to get it's pages stolen by a different concurrent thread doing
> allocations.  However I'm not sure there's a better solution than resorting
> to 2M allocations if there's not enough free memory that is scrubbed.
> 
> I'm having trouble seeing where we could temporary store page(s) allocated
> that need to be scrubbed before being assigned to the domain, in a way that
> can be used by continuations, and that would allow Xen to keep track of
> them in case the operation is never finished.  IOW: we would need to
> account for cleanup of such temporary stash of pages in case the domain
> never completes the hypercall, or is destroyed midway.

How about stealing a bit from the range above MEMOP_EXTENT_SHIFT to
indicate that state, with the actual page (and order plus scrub progress)
recorded in the target struct domain? Actually, maybe such an indicator
isn't needed at all: If the next invocation (continuation or not) finds
an in-progress allocation, it could simply use that rather than doing a
real allocation. (What to do if this isn't a continuation is less clear:
We could fail such requests [likely not an option unless we can reliably
tell original requests from continuations], or split the allocation if
the request is smaller, or free the allocation to then take the normal
path.) All of which of course only for "foreign" requests.

If the hypercall is never continued, we could refuse to unpause the
domain (with the allocation then freed normally when the domain gets
destroyed).

As another alternative, how about returning unscrubbed pages altogether
when it's during domain creation, requiring the tool stack to do the
scrubbing (potentially allowing it to skip some of it when pages are
fully initialized anyway, much like we do for Dom0 iirc)?

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -279,6 +279,18 @@ static void populate_physmap(struct memop_args *a)
>  
>                  if ( unlikely(!page) )
>                  {
> +                    nodeid_t node = MEMF_get_node(a->memflags);
> +
> +                    if ( memory_scrub_pending(node) ||
> +                         (node != NUMA_NO_NODE &&
> +                          !(a->memflags & MEMF_exact_node) &&
> +                          memory_scrub_pending(node = NUMA_NO_NODE)) )
> +                    {
> +                        scrub_free_pages(node);
> +                        a->preempted = 1;
> +                        goto out;
> +                    }

At least for order 0 requests there's no point in trying this. With the
current logic, actually for orders up to MAX_DIRTY_ORDER.

Further, from a general interface perspective, wouldn't we need to do the
same for at least XENMEM_increase_reservation?

> @@ -1115,7 +1139,16 @@ static struct page_info *alloc_heap_pages(
>              if ( test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
>              {
>                  if ( !(memflags & MEMF_no_scrub) )
> +                {
>                      scrub_one_page(&pg[i], cold);
> +                    /*
> +                     * Use SYS_STATE_smp_boot explicitly; ahead of that state
> +                     * interrupts are disabled.
> +                     */
> +                    if ( system_state == SYS_STATE_smp_boot &&
> +                         !(dirty_cnt & 0xff) )
> +                        process_pending_softirqs();
> +                }
>  
>                  dirty_cnt++;
>              }

Yet an alternative consideration: When "cold" is true, couldn't we call
process_pending_softirqs() like you do here ( >= SYS_STATE_smp_boot then
of course), without any of the other changes? Of course that's worse
than a proper continuation, especially from the calling domain's pov.

> @@ -223,6 +224,14 @@ struct npfec {
>  #else
>  #define MAX_ORDER 20 /* 2^20 contiguous pages */
>  #endif
> +
> +/* Max order when scrubbing pages at allocation time.  */
> +#ifdef CONFIG_DOMU_MAX_ORDER
> +# define MAX_DIRTY_ORDER CONFIG_DOMU_MAX_ORDER
> +#else
> +# define MAX_DIRTY_ORDER 9
> +#endif

Using CONFIG_DOMU_MAX_ORDER rather than the command line overridable
domu_max_order means people couldn't even restore original behavior.

Jan

