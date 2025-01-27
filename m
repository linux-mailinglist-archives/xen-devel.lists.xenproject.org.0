Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F646A1D5A0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 12:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877790.1287938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcNeM-0000P3-5q; Mon, 27 Jan 2025 11:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877790.1287938; Mon, 27 Jan 2025 11:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcNeM-0000Mq-2w; Mon, 27 Jan 2025 11:51:30 +0000
Received: by outflank-mailman (input) for mailman id 877790;
 Mon, 27 Jan 2025 11:51:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcNeK-0000MU-5o
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 11:51:28 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a094958-dca5-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 12:51:26 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so843343266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 03:51:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab676114a73sm565474366b.162.2025.01.27.03.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 03:51:26 -0800 (PST)
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
X-Inumbo-ID: 0a094958-dca5-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737978686; x=1738583486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S9SfR02if+tlwa9xddtHusCS0O7ly8YKdWsp/8G8oHk=;
        b=Q/xOXGhDcXFC4GGH9OlHNcTh+4QlCxEb/Q2TIM3awD5Z2ZAHDw1InvBM6EWAArutH0
         ABxNyQ+CniNjoZcsHVWbOBoSvx52fEfvlNN4lnlmqwsn4Zvs8N5wkeXqxFP9gHMHuaN2
         PAgO42ynJzrERUZaO6KUEMYAJXmKjP+X0sJPhP290S4ZwJLd7ZNHbG1jmtBNcVkrG88a
         OqXXh9UmZdzA9TgphakJQ8qgvhwk/k7+/MBQbYqHYADWZAQn880myXgUzy6S/qs0SvyS
         41up5p9Zr2eYHjIUlZOotu+mhJQdtSkdxOdSKsIA3VXG2upY9qvAENRxq/8qLTWODBsZ
         +2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737978686; x=1738583486;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9SfR02if+tlwa9xddtHusCS0O7ly8YKdWsp/8G8oHk=;
        b=B5m8J2SMSmmDXfR7cfUKw4LCT+Eo4t4/XvVT2zqyuV0KV/3rVpUL5orzAP0xC1IpOe
         LZofi3UlOmyjaQA2n24He74j738FdpKsempWqq44xRwznbeMaB8du7uY9fZBbKzmefX3
         4s74vdXWzbY3g7keXCsXXYM6n7UzsND2KV6+9nH+PesULatebv9KsBapDko47A9tyGWY
         2W0HHPMrjS9FOLt/nQ4NCeXisdY76lFQfnZ3B7S+0GpAONKXxuj+/rsWRxCsa0a+QIs1
         8zNrZORgYOdAAwEpXTMGs1DCBmemPGz/FHSEkpH0G6X2zQ5DHP7m1nosTafRcX+uZFN9
         NUOA==
X-Forwarded-Encrypted: i=1; AJvYcCUVTSfh5EPRVfArVi6lhmwqppS78sxvxWXVIfZwp3YRTPEO1/z3hz+G1ytgyESKHtfBWBpylVj75+U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxuhCBZrDaIyM8V0cVfqJN+7c4db+3mWf4qLoWCb+2qc1JIdvk
	JKLEUn2CjY13/aH4otHs/IZVPmgfJVZCxs9ts4+9ipE6NLQdh1qENofKcOp1bQ==
X-Gm-Gg: ASbGncsKuIVgL6R3Zed3lOuvm1UfcgqemWftctoQqqtHFLxzJpKYDRN/i1nOpKVD1Ds
	6SBuQyATHUNwmVXT5Z8AQIBsLwsVWFg7uO+yZkpRSk1+jlIIvxdJiL8lRCmX+nKvPueCGqGKACE
	C1iq8nvCBGHNnVVpcAiJchTPfpr6Vza7GlMx4umH83OzddKlBxMNMQB2dFRhnQHBZOkLKWdih8V
	D0v7Bq3VvSyOWwa0FIy9sW73BzT+/f+cVmZHa0mxJghyyRxcaRXHntK/8DPwrxa+vx032/MdHod
	QPnYMInZ6W5ToFPJIPgIKlwdJs55Z4/+y3I7Uduh+/Pmd5dm1G6er14SpD9ML8OtqA==
X-Google-Smtp-Source: AGHT+IFl6VANnJi7IZLoLQLWCaClgPI59s/JxhskYEA+xPGyh13OXrE8twGLDffYBOz9fGJTZG42uQ==
X-Received: by 2002:a17:907:7eaa:b0:ab2:b5f1:567d with SMTP id a640c23a62f3a-ab38b1848ffmr3925918866b.32.1737978686311;
        Mon, 27 Jan 2025 03:51:26 -0800 (PST)
Message-ID: <dc9c0aa5-cb0e-4e3b-9e5d-0f84745ef396@suse.com>
Date: Mon, 27 Jan 2025 12:51:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gnttab: introduce version agnostic macros
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.clark6@baesystems.com>
Cc: openxt@googlegroups.com, Christopher Clark
 <christopher.w.clark@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250110133711.3958202-1-dpsmith@apertussolutions.com>
 <20250110133711.3958202-2-dpsmith@apertussolutions.com>
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
In-Reply-To: <20250110133711.3958202-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2025 14:37, Daniel P. Smith wrote:
> @@ -310,16 +311,30 @@ nr_maptrack_frames(struct grant_table *t)
>  #define SHGNT_PER_PAGE_V1 (PAGE_SIZE / sizeof(grant_entry_v1_t))
>  #define shared_entry_v1(t, e) \
>      ((t)->shared_v1[(e)/SHGNT_PER_PAGE_V1][(e)%SHGNT_PER_PAGE_V1])
> +
> +/* Operations providing a single interface agnostic to grant table version */
>  #define SHGNT_PER_PAGE_V2 (PAGE_SIZE / sizeof(grant_entry_v2_t))
>  #define shared_entry_v2(t, e) \
>      ((t)->shared_v2[(e)/SHGNT_PER_PAGE_V2][(e)%SHGNT_PER_PAGE_V2])

The comment looks like it was misplaced, and rather wanted to go ahead of ...

> +
> +#define shared_entry_full_frame(gt, ref) \
> +    ( get_gt_version(gt) == 1 ? shared_entry_v1((gt), (ref)).frame : \
> +                                shared_entry_v2((gt), (ref)).full_page.frame )
> +#define set_shared_entry(gt, ref, val) \
> +    ( get_gt_version(gt) == 1 ? (shared_entry_v1((gt), (ref)).frame = (val)) : \
> +                                (shared_entry_v2((gt), (ref)).full_page.frame = (val)) )
> +#define status_addr(gt, ref, flags_addr) \
> +    ( evaluate_nospec(get_gt_version(gt) == 1) ? (flags_addr) : &status_entry((gt), (ref)) )

... this set of new #define-s?

Also a nit: There shouldn't be blanks immediately inside the opening parentheses
here. For readability you further want to omit parentheses around parameters
which are passed on unaltered (i.e. not becoming part of an expression). Plus
some of the lines are pretty obviously too long.

As to the single use of evaluate_nospec(): That looks odd here; on the surface
one would expect all three constructs to use it, or none of them. Deviations
from that likely require a comment, or at least some explanation in the
description.

> +
>  #define STGNT_PER_PAGE (PAGE_SIZE / sizeof(grant_status_t))
>  #define status_entry(t, e) \
>      ((t)->status[(e)/STGNT_PER_PAGE][(e)%STGNT_PER_PAGE])
> +
> +

No double blank lines please.

> @@ -1090,23 +1105,20 @@ map_grant_ref(
>      }
>  
>      /* Make sure we do not access memory speculatively */
> -    status = evaluate_nospec(rgt->gt_version == 1) ? &shah->flags
> -                                                   : &status_entry(rgt, ref);
> +    status = status_addr(rgt, ref, &shah->flags);

I was already wondering at the macro definition: How can it be that a
version-abstracting macro is passed something that's clearly version
1 only? That is, consider the opposite of the goal of this series,
someone wanting to allow building a gnttab-v2-only hypervisor. In that
case grant_entry_header_t would ideally not be defined at all (as a
struct; there may be a placeholder type). It would then be impossible
to de-reference the pointer. Hence I think that de-referencing ought to
live inside the macro.

> @@ -1930,7 +1938,7 @@ gnttab_grow_table(struct domain *d, unsigned int req_nr_frames)
>      }
>  
>      /* Status pages - version 2 */
> -    if ( evaluate_nospec(gt->gt_version > 1) )
> +    if ( evaluate_nospec(get_gt_version(gt) > 1) )

At this example: Assuming in the next patch get_gt_version() can end
up expanding to constant 1, the evaluate_nospec() would still be there,
for no good reason. I expect that wants further abstracting.

> @@ -2267,6 +2275,7 @@ gnttab_transfer(
>      mfn_t mfn;
>      unsigned int max_bitsize;
>      struct active_grant_entry *act;
> +    unsigned long frame;

Just going from indentation, ...

> @@ -2354,7 +2363,7 @@ gnttab_transfer(
>          }
>  
>          max_bitsize = domain_clamp_alloc_bitsize(
> -            e, e->grant_table->gt_version > 1 || paging_mode_translate(e)
> +            e, get_gt_version(e->grant_table) > 1 || paging_mode_translate(e)
>                 ? BITS_PER_LONG + PAGE_SHIFT : 32 + PAGE_SHIFT);
>          if ( max_bitsize < BITS_PER_LONG + PAGE_SHIFT &&
>               (mfn_x(mfn) >> (max_bitsize - PAGE_SHIFT)) )
> @@ -2452,22 +2461,12 @@ gnttab_transfer(
>          grant_read_lock(e->grant_table);
>          act = active_entry_acquire(e->grant_table, gop.ref);
>  
> -        if ( evaluate_nospec(e->grant_table->gt_version == 1) )
> -        {
> -            grant_entry_v1_t *sha = &shared_entry_v1(e->grant_table, gop.ref);
> +        frame = shared_entry_full_frame(e->grant_table, gop.ref);
> +        rc = guest_physmap_add_page(e, _gfn(frame), mfn, 0);
>  
> -            rc = guest_physmap_add_page(e, _gfn(sha->frame), mfn, 0);
> -            if ( !paging_mode_translate(e) )
> -                sha->frame = mfn_x(mfn);
> -        }
> -        else
> -        {
> -            grant_entry_v2_t *sha = &shared_entry_v2(e->grant_table, gop.ref);
> +        if ( !paging_mode_translate(e) )
> +            set_shared_entry(e->grant_table, gop.ref, mfn_x(mfn));
>  
> -            rc = guest_physmap_add_page(e, _gfn(sha->full_page.frame), mfn, 0);
> -            if ( !paging_mode_translate(e) )
> -                sha->full_page.frame = mfn_x(mfn);
> -        }
>          smp_wmb();
>          shared_entry_header(e->grant_table, gop.ref)->flags |=
>              GTF_transfer_completed;

... the variable looks to want declaring in a more narrow scope.

Also, related to an earlier comment: Where did the evaluate_nospec() go?

> @@ -2512,16 +2511,15 @@ release_grant_for_copy(
>      act = active_entry_acquire(rgt, gref);
>      sha = shared_entry_header(rgt, gref);
>      mfn = act->mfn;
> +    status = status_addr(rgt, gref, &sha->flags);
>  
> -    if ( evaluate_nospec(rgt->gt_version == 1) )
> +    if ( evaluate_nospec(get_gt_version(rgt) == 1) )
>      {
> -        status = &sha->flags;
>          td = rd;
>          trans_gref = gref;
>      }
>      else
>      {
> -        status = &status_entry(rgt, gref);
>          td = (act->src_domid == rd->domain_id)
>               ? rd : knownalive_domain_from_domid(act->src_domid);
>          trans_gref = act->trans_gref;

Same here - you're moving code across that speculation barrier.
Anything like this - assuming it is deliberate in the first place -
needs justifying.

> @@ -2573,7 +2571,6 @@ acquire_grant_for_copy(
>      struct active_grant_entry *act;
>      grant_status_t *status;
>      uint32_t old_pin;
> -    domid_t trans_domid;
>      grant_ref_t trans_gref;
>      struct domain *td;
>      mfn_t grant_mfn;

I fear I understand neither the movement of this variable, ...

> @@ -2597,6 +2594,7 @@ acquire_grant_for_copy(
>      /* This call also ensures the above check cannot be passed speculatively */
>      shah = shared_entry_header(rgt, gref);
>      act = active_entry_acquire(rgt, gref);
> +    old_pin = act->pin;

... nor that of this assignment ...

> @@ -2610,7 +2608,7 @@ acquire_grant_for_copy(
>          goto unlock_out;
>      }
>  
> -    if ( evaluate_nospec(rgt->gt_version == 1) )
> +    if ( evaluate_nospec(get_gt_version(rgt) == 1) )
>      {
>          sha2 = NULL;
>          status = &shah->flags;
> @@ -2621,9 +2619,10 @@ acquire_grant_for_copy(
>          status = &status_entry(rgt, gref);
>      }
>  
> -    old_pin = act->pin;

... (from here).

>      if ( sha2 && (shah->flags & GTF_type_mask) == GTF_transitive )
>      {
> +        domid_t trans_domid;

This makes me guess you want to narrow the scope of the variable, yet
then: How's that related to the subject of this patch?

> @@ -3878,10 +3877,7 @@ int gnttab_release_mappings(struct domain *d)
>  
>          act = active_entry_acquire(rgt, ref);
>          sha = shared_entry_header(rgt, ref);
> -        if ( rgt->gt_version == 1 )
> -            status = &sha->flags;
> -        else
> -            status = &status_entry(rgt, ref);
> +        status = status_addr(rgt, ref, &sha->flags);

Again relating to earlier comments, yet this time the other way around:
Suddenly we're gaining evaluate_nospec() here, for no apparent reason.

> @@ -4256,7 +4247,7 @@ int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn, mfn_t *mfn)
>  
>      grant_write_lock(gt);
>  
> -    if ( evaluate_nospec(gt->gt_version == 2) && (idx & XENMAPIDX_grant_table_status) )
> +    if ( evaluate_nospec(get_gt_version(gt) == 2) && (idx & XENMAPIDX_grant_table_status) )

I realize the line was already too long, but since you touch it you also
want to wrap it.

Jan

