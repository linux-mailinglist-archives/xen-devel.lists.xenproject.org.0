Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2693BCD9012
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 12:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192438.1511662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY07f-00080o-38; Tue, 23 Dec 2025 11:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192438.1511662; Tue, 23 Dec 2025 11:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY07e-0007zT-Vn; Tue, 23 Dec 2025 11:00:10 +0000
Received: by outflank-mailman (input) for mailman id 1192438;
 Tue, 23 Dec 2025 11:00:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vY07d-0007zN-SO
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 11:00:09 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8412dbe8-dfee-11f0-b15b-2bf370ae4941;
 Tue, 23 Dec 2025 11:59:56 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso32214745e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 02:59:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be273f147sm296650365e9.7.2025.12.23.02.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 02:59:55 -0800 (PST)
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
X-Inumbo-ID: 8412dbe8-dfee-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766487595; x=1767092395; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUxb7IXOHYguEnTfLHNdoKylW8Y6qc5xWntHdW2/2Cg=;
        b=AX2uoQp1rF7odFkxTLJU4+VqNuhbnBZA9uxXFbwgPI0mu5DhWQSPPtMdt5RCel2eSa
         i9NRS+dMtRkTGLPrF4+dAKomLWu3AWSgct0I9XmGa3wRMEQCNBaF21LhO7Bg/9sf2mCM
         bURoD94hOi67CVxcUfmIcb1ppHtsTHFusgp10QiLNIQhmZ2RWGjzRp2BK3boHa+wDXxG
         c4/4u9VNtgecS8Tmh8/c3S8tC+sNmwmC+zDFSaUcjOEdWVBVSsrWaIBRWzrpSXU51j7Q
         PcXwdCtntIhNHoUeCuUfEHwPGISSW4/fBWUHKgz7peiWXALcgrvkZfWHCxlNxTK/Nqud
         jy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766487595; x=1767092395;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUxb7IXOHYguEnTfLHNdoKylW8Y6qc5xWntHdW2/2Cg=;
        b=bhkMwA28bhE8mu61fG0rIMiPpVw8598exGNxdZT4FuEldxBTgVdOnqa4OfKLcIR01J
         0QTxGO4rI9eFMH0v3stLkLJOpLa4R66zfGC/6HhBxd8CYaKX4fubYuc6h/hajrLAXrT5
         7OoGBbqOOM8vtCDv9YIaQX37iPfULOy+QyCnjQ00l+By0RFIjQZohL9Qa52kSlTrLfuu
         9/5dAcGLn+0cp30jSTnnOf5IYyzQrijSypitMhO0xxV37vToH8gEijpzgW6XfEv4gEgM
         F+1Xt8RkxtjgzJyYfS7hd03St50rVrqDHCcSYFFum0PEuQ/dSVSBB9NsiakI7ucYzIZB
         0hqw==
X-Forwarded-Encrypted: i=1; AJvYcCXO9c9cLmTXUiT7mOj52VPhzpuzBjjiiKU36oCdjGsAjlSahyso7Oi9cMRziGUOQTKk4LkI5K9ZbJw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSw3QxHKdB0dqVDrShteIPS+Qcotbva/pidScxbSadIiqAMeep
	1OoENT6dGRqRptrON3K/cIPNyESXym0VEIyQGv2TblVBL1v0N4y+rPPJXD8lT26mpw==
X-Gm-Gg: AY/fxX7k3z6ecLDGYc+j5IplbJTqx4Jw5pmhVR6Zg4aI9wHLLiryV6/pOpzIt+bhSx2
	iJW8asjD5OVueOwo+kJIQ6QLC7+DiW/MqW6mJxyIuxPdpcJp1vsaItT8Nd5UPmhlcz/HFVoPKQy
	q5KNKnjJLM7iLuzMWLpPFwcqu7o2658UDniz0UkSzW4SGm5xFTy5UXB5pTIvVptufkeYTv+T9fl
	BbODvVihdwBiKDh0nrqfpjq2nYETnQ5FuesI2YcKgWpraOKZZcxW/px570z+SJQPBWc/QVoQ7Hg
	/VLA6N2e6FxOVAnGALpUL2nnMvelshtzdNA/a5KWyCC7Cylk4pC+s7XGfWX+BaI1WNgD2wtbD5h
	dvqiyPLW7OtEs9w5OKhRnmDLwIN0kHbV6m53XBwB8XP1y2ct6Qz3S8RrZlK/R1Y0vsVUyBirnQe
	8dVgkVtA+fc5UZGPi9HqFGMiOIpxNPo+i9AK/AL/q8PAsN44JJRvaa8eg+OR7qHmllMrAjUyDtp
	+g=
X-Google-Smtp-Source: AGHT+IGZ3O0BovO6Xck0pkp2ZU6L3eB56G9cbd587fP3rD+GMmuuSYTtKFWkb7GDKVP6SVyECndPvA==
X-Received: by 2002:a05:600c:1f84:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-47d3884cfdemr15660625e9.33.1766487595385;
        Tue, 23 Dec 2025 02:59:55 -0800 (PST)
Message-ID: <754a5e55-828d-4b3f-85cd-574760ddc69b@suse.com>
Date: Tue, 23 Dec 2025 11:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mm: move adjustment of claimed pages counters on
 allocation
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251223081507.29325-1-roger.pau@citrix.com>
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
In-Reply-To: <20251223081507.29325-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.12.2025 09:15, Roger Pau Monne wrote:
> The current logic splits the update of the amount of available memory in
> the system (total_avail_pages) and pending claims into two separately
> locked regions.  This leads to a window between counters adjustments where
> the result of total_avail_pages - outstanding_claims doesn't reflect the
> real amount of free memory available, and can return a negative value due
> to total_avail_pages having been updated ahead of outstanding_claims.
> 
> Fix by adjusting outstanding_claims and d->outstanding_pages in the same
> place where total_avail_pages is updated.  This can possibly lead to the
> pages failing to be assigned to the domain later, after they have already
> been subtracted from the claimed amount.  Ultimately this would result in a
> domain losing part of it's claim, but that's better than the current skew
> between total_avail_pages and outstanding_claims.

For the system as a whole - yes. For just the domain rather not. It may be
a little cumbersome, but can't we restore the claim from the error path
after failed assignment? (In fact the need to (optionally) pass a domain
into free_heap_pages() would improve symmetry with alloc_heap_pages().)

> Fixes: 65c9792df600 ("mmu: Introduce XENMEM_claim_pages (subop of memory ops)")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Arguably we could also get rid of domain_adjust_tot_pages() given what it
> currently does, which will be a revert of:
> 
> 1c3b9dd61dab xen: centralize accounting for domain tot_pages
> 
> Opinions?  Should it be done in a separate commit, possibly as a clear
> revert?  Maybe it's worth keeping the helper in case we need to add more
> content there, and it's already introduced anyway.

Personally I think we're better off keeping that helper, even if it's now
pretty thin.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -515,30 +515,6 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
>      d->tot_pages += pages;
>  
> -    /*
> -     * can test d->outstanding_pages race-free because it can only change
> -     * if d->page_alloc_lock and heap_lock are both held, see also
> -     * domain_set_outstanding_pages below
> -     */
> -    if ( !d->outstanding_pages || pages <= 0 )
> -        goto out;
> -
> -    spin_lock(&heap_lock);
> -    BUG_ON(outstanding_claims < d->outstanding_pages);
> -    if ( d->outstanding_pages < pages )
> -    {
> -        /* `pages` exceeds the domain's outstanding count. Zero it out. */
> -        outstanding_claims -= d->outstanding_pages;
> -        d->outstanding_pages = 0;
> -    }
> -    else
> -    {
> -        outstanding_claims -= pages;
> -        d->outstanding_pages -= pages;
> -    }
> -    spin_unlock(&heap_lock);
> -
> -out:
>      return d->tot_pages;
>  }

Below here the first comment in domain_set_outstanding_pages() refers to
the code being deleted, and hence imo wants updating, too.

> @@ -1071,6 +1047,26 @@ static struct page_info *alloc_heap_pages(
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
> +         * domain are freed without replenishing the claim.
> +         */
> +        unsigned long outstanding = min(outstanding_claims, request);
> +
> +        outstanding_claims -= outstanding;
> +        BUG_ON(outstanding > d->outstanding_pages);
> +        d->outstanding_pages -= outstanding;
> +    }

This now happening with the domain alloc lock not held imo also needs at
least mentioning (if not discussing) in the description. Aiui it's safe as
long as all updates of d->outstanding_pages happen with the heap lock
held. Which in turn may want mentioning in a comment next to the field
definition, for (now) being different from e.g. ->tot_pages and
->xenheap_pages.

Jan

