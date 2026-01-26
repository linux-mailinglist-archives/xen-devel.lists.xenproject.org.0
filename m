Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPzjGr9Md2msdwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:15:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD59F878A9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:15:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213578.1524037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkKYI-00052Q-KN; Mon, 26 Jan 2026 11:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213578.1524037; Mon, 26 Jan 2026 11:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkKYI-0004zK-Hl; Mon, 26 Jan 2026 11:14:38 +0000
Received: by outflank-mailman (input) for mailman id 1213578;
 Mon, 26 Jan 2026 11:14:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkKYH-0004zD-4x
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 11:14:37 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32257d86-faa8-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 12:14:35 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso43842875e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 03:14:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d4f8417sm102275965e9.2.2026.01.26.03.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 03:14:34 -0800 (PST)
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
X-Inumbo-ID: 32257d86-faa8-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769426075; x=1770030875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=on4ZBGoNZjT6ZVd5JbLYn7EK6JWlqgQal6ewdA+Q0FM=;
        b=SvnwwaZ6DR1CyyI6FwqG4ZK6TD9IZY2qVZ/cZqq8FwsizmGuuZGlAb2KO/40QuYuWs
         diWfGIDUDFqRqLv8wcplIS3xoXBLZlAUm7733tnEZbFNu3/2QTJEbjXLF8IrPap9Ztub
         jlmxni9DFalQczzHmAGN4ouT9K29t6exb1gd4trYxXif6AOCqIqJM4cEP3ngzPxUaAbq
         7iA95dhs+ZRDdyOzlQQYWUYanYHODeZ34UGPqwG5S36PEWZc1fQKXClTdkzDye7pQeWr
         vnNs2No+qwgFtGSZOOG336hfgLYDCR7GBMDrMM6aSjhMdazqPjjvITv2IKjy2dl/a/G2
         xbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769426075; x=1770030875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on4ZBGoNZjT6ZVd5JbLYn7EK6JWlqgQal6ewdA+Q0FM=;
        b=NR2TdgCX6RkqLWSMxiokrlSgVzC/ZgpcSXOPBOiwpdcJQ0iqPAenpMM3wIJumJGHR2
         3J2NPHl4A52AEsysqssDm6BQWskOWTCwvLpV/aR7y+6kmBYEqSrqP1JjHL9rdmqVXzFD
         U2bT46N1DoZ0/q5yZBg9VRT0Tzx7Am4UE2q1KJOLeRFFCCPTMdreQj44NEJZZQZ4k5bt
         MgRKo9IDPFNaaiKlLOyfxwdGnyq77ebUQpT1COhEsqpmV0aEcigOHXSPvUxbBWG9RB/T
         vXMZiiOTkxRszgShrYd7o4MhQoY48HmcGi17Arkdl3Kf+qrx675OyG+d2wGddp+wEsVg
         Ygag==
X-Forwarded-Encrypted: i=1; AJvYcCUa8bqilGezFk8BQ/wS4SNLzpCTSnsrcc2AF84XvJAYTZ7MQaoSnMRGYK8oBL7yP1fVHUaonxxizXk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDH9MztxNpaZHUpoX5Eg71uMthx0wCICDWUnnuOVZZdwqOiEan
	zJN4ElFORA6QVtwp7AsgMSyG/RK1jNwo0YUYy9YH+T8bm/XbDG+q2x9XH5jSG3fA0Q==
X-Gm-Gg: AZuq6aLOT1y1/8sUB7rbmLhSHyohTtE5fyjK3RKE+/5i3Wgm+DOhKNYfyms1R0ttc8r
	WQJdJOhMtLDHJZMVIC5f7M0s+8vf10ThOO9xPyRPxBLVMSs/av44Ohsi5VorpUb8m+q6ZSfQtz8
	2Igjn/49ePfymHy+CngA1OjzJqL4WHAE56cuizcyAlBM89Z8SeHI3QIeTRJFCY2YUroR1k6oxu2
	rpMqHkANkFo/1MXksA1mkuwMAjHsel2+/Zk4rwIYWlBgd3PRlvYxRAIE2R72OcH1DIl+cVjlkIX
	ssONoVWzYFPOqotpGyuNOchKospjrPoGB8Dm75+ri6bcWTyhRua89p1RE9Fd5F9uONo/19RiyOA
	6LYzPu6KmH2lXvnnOdARjjTQsOJlJ59ZlOdOUuaolLYO59uka/P5IY8MFt5mtE7ebalzhNVkq26
	nEyMeH09M4Ig4wNxVUn21cD40cmnGmrBrNuNFLLJZAgXHIZQ12M04dkQqooeRil1y5XcM/9Hm3/
	+0=
X-Received: by 2002:a05:600c:35c4:b0:47e:e9c9:23bc with SMTP id 5b1f17b1804b1-4805cf673f5mr71005565e9.30.1769426074640;
        Mon, 26 Jan 2026 03:14:34 -0800 (PST)
Message-ID: <69a64a89-af3f-47fe-8998-a3ff76e9484e@suse.com>
Date: Mon, 26 Jan 2026 12:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260122173857.83860-1-roger.pau@citrix.com>
 <20260122173857.83860-3-roger.pau@citrix.com>
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
In-Reply-To: <20260122173857.83860-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BD59F878A9
X-Rspamd-Action: no action

On 22.01.2026 18:38, Roger Pau Monne wrote:
> Physmap population has the need to use pages as big as possible to reduce
> p2m shattering.  However that triggers issues when big enough pages are not
> yet scrubbed, and so scrubbing must be done at allocation time.  On some
> scenarios with added contention the watchdog can trigger:
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
> Introduce a mechanism to preempt page scrubbing in populate_physmap().  It
> relies on stashing the dirty page in the domain struct temporarily to
> preempt to guest context, so the scrubbing can resume when the domain
> re-enters the hypercall.  The added deferral mechanism will only be used for
> domain construction, and is designed to be used with a single threaded
> domain builder.  If the toolstack makes concurrent calls to
> XENMEM_populate_physmap for the same target domain it will trash stashed
> pages, resulting in slow domain physmap population.
> 
> Note a similar issue is present in increase reservation.  However that
> hypercall is likely to only be used once the domain is already running and
> the known implementations use 4K pages. It will be deal with in a separate
> patch using a different approach, that will also take care of the
> allocation in populate_physmap() once the domain is running.
> 
> Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Introduce FREE_DOMHEAP_PAGE{,S}().
>  - Remove j local counter.
>  - Free page pending scrub in domain_kill() also.

Yet still not right in domain_unpause_by_systemcontroller() as well. I.e. a
toolstack action is still needed after the crash to make the memory usable
again. If you made ...

> @@ -1286,6 +1293,19 @@ int domain_kill(struct domain *d)
>          rspin_barrier(&d->domain_lock);
>          argo_destroy(d);
>          vnuma_destroy(d->vnuma);
> +        /*
> +         * Attempt to free any pages pending scrub early.  Toolstack can still
> +         * trigger populate_physmap() operations at this point, and hence a
> +         * final cleanup must be done in _domain_destroy().
> +         */
> +        rspin_lock(&d->page_alloc_lock);
> +        if ( d->pending_scrub )
> +        {
> +            FREE_DOMHEAP_PAGES(d->pending_scrub, d->pending_scrub_order);
> +            d->pending_scrub_order = 0;
> +            d->pending_scrub_index = 0;
> +        }
> +        rspin_unlock(&d->page_alloc_lock);

... this into a small helper function (usable even from _domain_destroy(),
as locking being used doesn't matter there), it would have negligible
footprint there.

As to the comment, not being a native speaker it still feels to me as if
moving "early" earlier (after "free") might help parsing of the 1st sentence.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -159,6 +159,66 @@ static void increase_reservation(struct memop_args *a)
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
> +    rspin_lock(&d->page_alloc_lock);
> +
> +    /*
> +     * Drop any stashed allocation to accommodated the current one.  This
> +     * interface is designed to be used for single-threaded domain creation.
> +     */
> +    if ( d->pending_scrub )
> +        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);

Didn't you indicate you'd move the freeing ...

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

... into this function?

Jan

