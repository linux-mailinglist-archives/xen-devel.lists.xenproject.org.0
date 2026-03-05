Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOeWK91gqWnj6QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 11:54:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 106AC210158
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 11:54:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246438.1545615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy6Kn-00056d-0n; Thu, 05 Mar 2026 10:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246438.1545615; Thu, 05 Mar 2026 10:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy6Km-00053i-UF; Thu, 05 Mar 2026 10:53:36 +0000
Received: by outflank-mailman (input) for mailman id 1246438;
 Thu, 05 Mar 2026 10:53:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy6Kl-00053c-Im
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 10:53:35 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e0e3322-1881-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 11:53:34 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso66974715e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 02:53:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439abded86esm39427342f8f.6.2026.03.05.02.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 02:53:32 -0800 (PST)
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
X-Inumbo-ID: 8e0e3322-1881-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772708013; x=1773312813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+/0CQKkeqc2XR5r4TdFszbCjUpD29tLEnzlXyjTUqUo=;
        b=EXCcvy52QPb0Cm3nfQMZBq3WMLy+R0w1E7/8cB/wPpfo1VWKojGewieKIkpxnYjW2p
         UuTAFZeWhS2k1ju79lERzISjjsay9kR6OxOUFdd74WW2D3g/dzhh5KnQwM4vPGzTR6CC
         39n0dDFWTXtC+kZfnJAAw7GWm0rRfILKZhNye4HMSLrqNsqZ6J6CAiEzActrB7HNkjtw
         PKWc72lwCiFqGBrG//nZY/mEhdq/4dwXpFg/Xa5Wi0xioDo+0Fpu59OdNThZuulpHaD3
         oG76ZVd6zUbwdFpaJ1z4mkPr83R1XpK/NyVFfHGVlqPl2irvc3p3lUzSNPEcTOjR6k3n
         XwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708013; x=1773312813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/0CQKkeqc2XR5r4TdFszbCjUpD29tLEnzlXyjTUqUo=;
        b=DprOFZ5XnYh5NOI0wexFDvYWLw3Uq76zF1ZrroSthzN0TwpP9Yw+kDSm2IVTtWfgy6
         cw9zYU37cGK0ZbVH7VtoCpBZZdOvkKnzuTG9HWL9W9G371eZhkWe3xaKMUIYTGtPSvF4
         vLMlr1ilnLFuA7lhSCunqhcutdWuAtgAyWnxXKd5FpYMI+64/ndRwbvAknMc7yyUuLWI
         MNRH42aLaKn8VL8bvroSa9NHCfvkMIOf7a1WPf/cp0w2gvKRIqAxuy3lNpjj7eJIQI0X
         U256QYCVFoNBM+t/ob44lLfIHcSMFenMRPqnD9Hgd2Eq4h3CS1MlD6YomGXfpWvf3mPP
         vMpg==
X-Forwarded-Encrypted: i=1; AJvYcCUrjVGFwfkV/14C9b/daDLgMG2VQDUIu22J5cUfeLV0K1IL4fpYtATGlaVy68z97wI8r3/MbgEbnBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweWEeRsFYulLNqw+vTPGnZIttAaFXiYjQ9qHUE0TL1WgFYrnj6
	Z9Y6iGARHD8MWqVf7FoIm+MlBGl7y+J+iZYa1MO+SMTTc63iXPuM0vVX4FvfkA5bOQ==
X-Gm-Gg: ATEYQzxYvUtW9X29rAUthP8KIZRQdwdcbsu1S/qYfCy7rgeLI2hf5MWlqmF2rNWKhWt
	Qjel9YxtIlpS1oB9e23S2gPp2KTVxgAo1vnTR3UGrXvqWL/Q55EpRMFraqJWOICUialfV7UPrvE
	jyn5VeaCmweZSrGMJ2qrN4EKC8Er4AQQnLfTMRRMSBvpVG1BILyIeBL83ImEoK83Djf0t6MmmqB
	2hq+1nBkBMT/5O9EnQ+kLfasuoWzc0iwf/8SX70jCqZMe/RCuba/PxYZ9Jz+o5jBST/LAMfvOV1
	8rjBctuWPbO9uE35y6kgCHTuho/wIRX1wKT72U+enuIGXJ1VFH4PZfkIiolRDDoUfyYpQS9wVIa
	SBeRxmIQn0ZmkwiFa5ulp3D3m4l/5GOss9ornZzfmeC3Lgqo9KDjF4Fz320alIiV4IJ+0GX2AT6
	F0hzcHKcuDHFHxxkFr+xZImI9L/DukSrCxzBAY9peKyzhj1hwUrJPrkUg5Hi6ohiJxgOeQ43OHr
	8soPDuXylmoRrc=
X-Received: by 2002:a05:600c:3e8f:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-485198d8b81mr91267535e9.35.1772708013257;
        Thu, 05 Mar 2026 02:53:33 -0800 (PST)
Message-ID: <1497b37d-f47a-41c6-8037-a00a555d13a0@suse.com>
Date: Thu, 5 Mar 2026 11:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] xen/page_alloc: Implement NUMA-node-specific
 claims
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Marcus Granado <marcus.granado@citrix.com>, xen-devel@lists.xenproject.org,
 Alejandro Vallejo <Alejandro.GarciaVallejo@amd.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <6927e45bf7c2ce56b8849c16a2024edb86034358.1772098423.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <6927e45bf7c2ce56b8849c16a2024edb86034358.1772098423.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 106AC210158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:marcus.granado@citrix.com,m:xen-devel@lists.xenproject.org,m:Alejandro.GarciaVallejo@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 26.02.2026 15:29, Bernhard Kaindl wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -944,6 +944,7 @@ struct domain *domain_create(domid_t domid,
>      spin_lock_init(&d->node_affinity_lock);
>      d->node_affinity = NODE_MASK_ALL;
>      d->auto_node_affinity = 1;
> +    d->claim_node = NUMA_NO_NODE;

If, as the cover letter says, the new domctl is going to allow claiming from
multiple nodes in one go, why would this new field still be necessary?

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -488,7 +488,10 @@ static unsigned long *avail[MAX_NUMNODES];
>  /* Global available pages, updated in real-time, protected by heap_lock */
>  static unsigned long total_avail_pages;
>  
> -/* The global heap lock, protecting access to the heap and related structures */
> +/*
> + * The global heap lock, protecting access to the heap and related structures
> + * It protects the heap and claims, d->outstanding_pages and d->claim_node
> + */
>  static DEFINE_SPINLOCK(heap_lock);

Nit: Comment style.

> @@ -510,6 +513,71 @@ static unsigned long node_avail_pages[MAX_NUMNODES];
>  /* total outstanding claims by all domains */
>  static unsigned long outstanding_claims;
>  
> +/*
> + * Per-node accessor for outstanding claims, protected by heap_lock, updated
> + * in lockstep with the global outstanding_claims and d->outstanding_pages
> + * in domain_set_outstanding_pages() and release_outstanding_claims().
> + *
> + * node_outstanding_claims(node) is used to determine the outstanding claims on
> + * a node, which are subtracted from the node's available pages to determine if
> + * a request can be satisfied without violating the node's memory availability.
> + */
> +#define node_outstanding_claims(node) (node_outstanding_claims[node])

See the comment on the earlier patch regarding such a wrapper.

> +/* total outstanding claims by all domains on node */
> +static unsigned long node_outstanding_claims[MAX_NUMNODES];

How come this is being added, rather than it replacing outstanding_claims?

> +/* Return available pages after subtracting claimed pages */
> +static inline unsigned long available_after_claims(unsigned long avail_pages,
> +                                                   unsigned long claims)
> +{
> +    BUG_ON(claims > avail_pages);
> +    return avail_pages - claims; /* Due to the BUG_ON, it cannot be negative */
> +}

A helper for a simple subtraction?

> +/* Answer if host-level memory and claims permit this request to proceed */
> +static inline bool host_allocatable_request(const struct domain *d,
> +                                            unsigned int memflags,
> +                                            unsigned long request)
> +{
> +    unsigned long allocatable_pages;
> +
> +    ASSERT(spin_is_locked(&heap_lock));
> +
> +    allocatable_pages = available_after_claims(total_avail_pages,
> +                                               outstanding_claims);
> +    if ( allocatable_pages >= request )
> +        return true; /* The not claimed pages are enough to proceed */
> +
> +    if ( !d || (memflags & MEMF_no_refcount) )
> +        return false; /* Claims are not available for this allocation */
> +
> +    /* The domain's claims are available, return true if sufficient */
> +    return request <= allocatable_pages + d->outstanding_pages;
> +}

This only uses variables which existed before, i.e. there's nothing NUMA-ish
in here. What's the deal?

> +/* Answer if node-level memory and claims permit this request to proceed */
> +static inline bool node_allocatable_request(const struct domain *d,
> +                                            unsigned int memflags,
> +                                            unsigned long request,
> +                                            nodeid_t node)
> +{
> +    unsigned long allocatable_pages;
> +
> +    ASSERT(spin_is_locked(&heap_lock));
> +    ASSERT(node < MAX_NUMNODES);
> +
> +    allocatable_pages = available_after_claims(node_avail_pages(node),
> +                                               node_outstanding_claims(node));
> +    if ( allocatable_pages >= request )
> +        return true; /* The not claimed pages are enough to proceed */
> +
> +    if ( !d || (memflags & MEMF_no_refcount) || (node != d->claim_node) )
> +        return false; /* Claims are not available for this allocation */
> +
> +    /* The domain's claims are available, return true if sufficient */
> +    return request <= allocatable_pages + d->outstanding_pages;
> +}

And this is the NUMA counterpart, almost identical in the basic logic. If
(for whatever reason) both are really needed, I think it should at least be
considered to fold them (with NUMA_NO_NODE indicating the non-NUMA intent).

In fact the node != d->claim_node would probably also apply to the non-NUMA
variant (as d->claim_node != NUMA_NO_NODE).

As to the comments in both functions, personally I think
s/not claimed/unclaimed/ would be slightly more logical to follow.

In any event, the first of these function looks like it could be split out
in a separate, earlier patch. Then (as per above) ideally here that function
would simply be extended to become NUMA-capable.

> @@ -539,14 +607,23 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>      return d->tot_pages;
>  }
>  
> -/* Release outstanding claims on the domain, host and later also node */
> +/* Release outstanding claims on the domain, host and node */
>  static inline
>  void release_outstanding_claims(struct domain *d, unsigned long release)
>  {
>      ASSERT(spin_is_locked(&heap_lock));
>      BUG_ON(outstanding_claims < release);
>      outstanding_claims -= release;
> +
> +    if ( d->claim_node != NUMA_NO_NODE )
> +    {
> +        BUG_ON(node_outstanding_claims(d->claim_node) < release);
> +        node_outstanding_claims(d->claim_node) -= release;
> +    }
>      d->outstanding_pages -= release;
> +
> +    if ( d->outstanding_pages == 0 )
> +        d->claim_node = NUMA_NO_NODE; /* Clear if no outstanding pages left */

I fear I don't understand this. If the domain has claims on other nodes,
why would would it be switched back to non-NUMA claims?

> @@ -564,14 +642,41 @@ void consume_outstanding_claims(struct domain *d, unsigned long allocation)
>  
>      /* Of course, the domain can only release up its outstanding claims */
>      allocation = min(allocation, d->outstanding_pages + 0UL);
> +
> +    if ( d->claim_node != NUMA_NO_NODE && d->claim_node != alloc_node )
> +    {
> +        /*
> +         * The domain has a claim on a node, but the alloc is on a different
> +         * node. If it would exceed the domain's max_pages, reduce the claim
> +         * up to the excess over max_pages so we don't reduce the claim more
> +         * than we have to to honor the max_pages limit.
> +         */
> +        unsigned long booked_pages = domain_tot_pages(d) + allocation +
> +                                     d->outstanding_pages;
> +        if ( booked_pages <= d->max_pages )
> +            return; /* booked is within max_pages, no excess, keep the claim */
> +
> +        /* Excess detected, release the exceeding pages from the claimed node */
> +        allocation = min(allocation, booked_pages - d->max_pages);
> +    }
>      release_outstanding_claims(d, allocation);

Please can there be another blank line above this one?

Why is the adjustment made excluded for the NUMA_NO_NODE case? That's odd in
itself, but particularly with release_outstanding_claims() possibly switching a
domain to NUMA_NO_NODE. Plus the caller looks to be passing in the actual node
memory was taken from, not what the original request said (which is specifically
relevant when the request named no particular node).

>  }
>  
> -int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
> +/*
> + * Update outstanding claims for the domain. Note: The node is passed as an
> + * unsigned int to allow checking for overflow above the uint8_t nodeid_t limit.
> + */
> +int domain_set_outstanding_pages(struct domain *d, unsigned long pages,
> +                                 unsigned int node)
>  {
>      int ret = -ENOMEM;
>      unsigned long claim, avail_pages;
>  
> +    /* When releasing a claim, the node must be NUMA_NO_NODE (it is not used) */

Why would this be?

> +    if ( pages == 0 && node != NUMA_NO_NODE )
> +        return -EINVAL;
> +    if ( node != NUMA_NO_NODE && (node >= MAX_NUMNODES || !node_online(node)) )
> +        return -ENOENT;
>      /*

Again, can there please be a blank line after each of the if()s?

> @@ -982,6 +1102,8 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
>              }
>          } while ( zone-- > zone_lo ); /* careful: unsigned zone may wrap */
>  
> + try_next_node:
> +        /* If MEMF_exact_node was passed, we may not skip to a different node */
>          if ( (memflags & MEMF_exact_node) && req_node != NUMA_NO_NODE )
>              return NULL;

As per this, ...

> @@ -1042,13 +1164,8 @@ static struct page_info *alloc_heap_pages(
>  
>      spin_lock(&heap_lock);
>  
> -    /*
> -     * Claimed memory is considered unavailable unless the request
> -     * is made by a domain with sufficient unclaimed pages.
> -     */
> -    if ( (outstanding_claims + request > total_avail_pages) &&
> -          ((memflags & MEMF_no_refcount) ||
> -           !d || d->outstanding_pages < request) )
> +    /* Proceed if host-level memory and claims permit this request to proceed */
> +    if ( !host_allocatable_request(d, memflags, request) )

... in the MEMF_exact_node case I see little reason to check the global value
here.

Jan

