Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA602D01920
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 09:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197369.1514918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdlKF-00022p-TS; Thu, 08 Jan 2026 08:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197369.1514918; Thu, 08 Jan 2026 08:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdlKF-00021O-QJ; Thu, 08 Jan 2026 08:24:59 +0000
Received: by outflank-mailman (input) for mailman id 1197369;
 Thu, 08 Jan 2026 08:24:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdlKE-00021I-LE
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 08:24:58 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81be3124-ec6b-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 09:24:53 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so23072475e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 00:24:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e6784sm14638093f8f.19.2026.01.08.00.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 00:24:52 -0800 (PST)
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
X-Inumbo-ID: 81be3124-ec6b-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767860693; x=1768465493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LK4SUJLgNmI6mwIC4gB+nan6RaJdNdwyeWcgaJDMTDc=;
        b=JxzO6MY8AJhNdE78FvI3jKLXvCQNou7FLVsEu4R9zgp986TMd53ssWFgzq5+aPTmoD
         ZjvqT/qovoGHyeLkzHCHp8ZQAef2P7UOSjanbgSpXQSLLtBxSFTcL+XtbPUpR5C3ELdw
         ZRLM2PtYs7itjovjofAqhvpfI1NlbjF1rI2eMBxhuNA8bcDWZ2AxB5Bs2EugVEPH1nX9
         UT8w/w2WhdRdv23BH6InvEpILCQOTGQo50wefwldwseHbvpZHNb2pvCUEu8bcKzZooI7
         i15BKvBUB9BVJWc7ZOL/w+f4DCkjMn9mjqUIcyCcnrbaq+rhFyHj2/nktqOUT7JYZXI2
         MDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767860693; x=1768465493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LK4SUJLgNmI6mwIC4gB+nan6RaJdNdwyeWcgaJDMTDc=;
        b=aTtFG6kFB28tIAYM8lC5WdmzSBRGYOX0L4sBtUrzq2V0b+6La9FM/H+g0eSOjy/XLb
         J442KO5d/uiJN3fbRAuB4GsrqFsu7+qf3S9WMaFvWPI4uT5RnKDrNALQfkD1H/nAP6ut
         rO0ocqfhFsQLxHlfwmoCZ/i1p1wcYNhxF86kuo5rna4EGB3AMXPDIOtWeijMGNIrxlsG
         1onKy5ZZoNITkgWHbzp/rjhaYo+7LL9HWxvCoxrlrLZj45k69SqpSNNdMm1bWKDD6r7J
         sQlxLl4Wgw946dFIVhi4OVXGd37X69PaV/EVXN+exaN5KkBNt5dLelPFtdhusZoZtmLo
         axUA==
X-Forwarded-Encrypted: i=1; AJvYcCVYHX3jR//bXcskdOgJ49W4N22VKzpe354jT5W0FfYP0+/tOpDlQ4i/3rXsc4mSbXx8XEIYeEstj8c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze+r8c7jEQcu1iuTQ0dbdCQAIJG6jCRYa2LsnkqCvYDA70VCxP
	e+u9h95Ack0AlVLKvTFTceTQXFpPYOOYMiLWHovchnjXd5dz1jXWqrnONY4IQbqp3Q==
X-Gm-Gg: AY/fxX5BhsFFNk6tnf7hIDpkHvYYqDDot9NkjIiV/9+3GBTUA/MIfBk8sKuk9SrmG3Q
	+REhCjFTuLwBJK2YEZlO6vWSNU6iXUHh69ZrZCDSchHLa07YFRmEeuAUhn6yDVBsN11MNmEb9ga
	Jy3AJ8+DIU/Q+sEM1PgOFA7X5G68A4uj7pPgGep44HKRMo79+A6H/u9Je+vk9ajickoFOqaZCe7
	LXbXRY8OFw+oLBoBCqNJo1EbxZd8JJD0wmz+CwDMXJxoBA2OdYcC72MB/aQLpjBVhxLNumBaO2M
	sToWLJVjw6rN0yoCP6VBGmQm8fQSbUPhHA2BWcRIms/imWTw2UEDkHqQYN8qZQ3DWUQD027AqWJ
	kVLlYQAzluO6Sh3iZAXgOfGoHGxbgJycPcpB14hvato9ZIarnoRCPBgyhkTXBSfCUQoD5Qs95xv
	3zkSfqHSALZlVSeA823Rt90gi1M+dWFUz/iwFjJ30HuNmDqNLm+ITNBhvmsw6i5AxXLVk3xv+Gx
	Ws=
X-Google-Smtp-Source: AGHT+IHoblTzJCRaWBApVfWBfl6ljgVp36tsrxRsODhVbnXGaaV+JMBrG6LYgYBA3JHwa0Oc8IG68A==
X-Received: by 2002:a05:600c:4713:b0:477:1bb6:17de with SMTP id 5b1f17b1804b1-47d84b5b43dmr69733295e9.30.1767860692653;
        Thu, 08 Jan 2026 00:24:52 -0800 (PST)
Message-ID: <f6468868-5814-44ff-aeab-20bffb064ae8@suse.com>
Date: Thu, 8 Jan 2026 09:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/mm: move adjustment of claimed pages counters on
 allocation
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260107175605.56617-1-roger.pau@citrix.com>
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
In-Reply-To: <20260107175605.56617-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2026 18:56, Roger Pau Monne wrote:
> The current logic splits the update of the amount of available memory in
> the system (total_avail_pages) and pending claims into two separately
> locked regions.  This leads to a window between counters adjustments where
> the result of total_avail_pages - outstanding_claims doesn't reflect the
> real amount of free memory available, and can return a negative value due
> to total_avail_pages having been updated ahead of outstanding_claims.
> 
> Fix by adjusting outstanding_claims and d->outstanding_pages in the same
> place where total_avail_pages is updated.  Note that accesses to
> d->outstanding_pages is protected by the global heap_lock, just like
> total_avail_pages or outstanding_claims.  Add a comment to the field
> declaration, and also adjust the comment at the top of
> domain_set_outstanding_pages() to be clearer in that regard.
> 
> Note that failures in assign_pages() causes the claimed amount that has
> been allocated to be lost, as the amount is not added back to the domain
> quota once pages are freed.  Given the intended usage of claims is limited
> to initial physmap populate, and the current failure paths in
> assign_pages() would lead to the domain being destroyed anyway, don't
> add extra logic to recover the claimed amount on failure - it's just adding
> complexity for no real benefit.
> 
> Fixes: 65c9792df600 ("mmu: Introduce XENMEM_claim_pages (subop of memory ops)")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Revert back to the approach in v1.

You didn't fully go back to v1. While ...

> @@ -548,9 +524,10 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
>      unsigned long claim, avail_pages;
>  
>      /*
> -     * take the domain's page_alloc_lock, else all d->tot_page adjustments
> -     * must always take the global heap_lock rather than only in the much
> -     * rarer case that d->outstanding_pages is non-zero
> +     * Two locks are needed here:
> +     *  - d->page_alloc_lock: protects accesses to d->{tot,max,extra}_pages.
> +     *  - heap_lock: protects accesses to d->outstanding_pages, total_avail_pages
> +     *    and outstanding_claims.
>       */
>      nrspin_lock(&d->page_alloc_lock);
>      spin_lock(&heap_lock);

... the comment improvement is of course okay to keep, ...

> @@ -999,7 +976,7 @@ static struct page_info *alloc_heap_pages(
>  {
>      nodeid_t node;
>      unsigned int i, buddy_order, zone, first_dirty;
> -    unsigned long request = 1UL << order;
> +    unsigned int request = 1UL << order;

... this I'm less certain about (and if it was to be kept, it should also
become 1U). For one, this bounds check:

    if ( (outstanding_claims + request > total_avail_pages) &&

ends up still being okay (perhaps except on Arm32, but the wrapping issue
there is pre-existing, albeit possibly benign due to other constraints),
but just because outstanding_claims is "long" (and it's unclear to me why
it isn't "unsigned long").

And then, what exactly is it that you want the more narrow type for (the
description says nothing in that regard)? The other relevant uses of the
variable are

    avail[node][zone] -= request;
    total_avail_pages -= request;

where both avail[][] and total_avail_pages are (unsigned) long (again
unclear to me why for total_avail_pages it's plain long).

Oh, wait, it is ...

> @@ -1071,6 +1050,30 @@ static struct page_info *alloc_heap_pages(
>      total_avail_pages -= request;
>      ASSERT(total_avail_pages >= 0);
>  
> +    if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
> +    {
> +        /*
> +         * Adjust claims in the same locked region where total_avail_pages is
> +         * adjusted, not doing so would lead to a window where the amount of
> +         * free memory (avail - claimed) would be incorrect.
> +         *
> +         * Note that by adjusting the claimed amount here it's possible for
> +         * pages to fail to be assigned to the claiming domain while already
> +         * having been subtracted from d->outstanding_pages.  Such claimed
> +         * amount is then lost, as the pages that fail to be assigned to the
> +         * domain are freed without replenishing the claim.  This is fine given
> +         * claims are only to be used during physmap population as part of
> +         * domain build, and any failure in assign_pages() there will result in
> +         * the domain being destroyed before creation is finished.  Losing part
> +         * of the claim makes no difference.
> +         */
> +        unsigned int outstanding = min(d->outstanding_pages, request);

... the desire to avoid use of min_t() here which wants "request" to be
"unsigned int". At some point we'll want to change the struct domain fields
to unsigned long anyway, at which point the above would need adjustment. It's
well possible that such an adjustment would end up being to then use min_t().
Imo we'd be better off using e.g.

        unsigned int outstanding = min(d->outstanding_pages + 0UL, request);

or even

        typeof(d->outstanding_pages) outstanding =
            min(d->outstanding_pages + 0UL, request);

right away. In the latter case the decl wouldn't even need touching when the
struct domain fields are promoted.

> +        BUG_ON(outstanding > d->outstanding_pages);

Unlike in v1, where the min() was different, this is now dead code.

Jan

