Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B52F8B56FA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 13:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714013.1114970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1POQ-0000Ig-AY; Mon, 29 Apr 2024 11:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714013.1114970; Mon, 29 Apr 2024 11:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1POQ-0000H3-7Q; Mon, 29 Apr 2024 11:41:58 +0000
Received: by outflank-mailman (input) for mailman id 714013;
 Mon, 29 Apr 2024 11:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1POP-0000Gx-BQ
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 11:41:57 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ae2b9db-061d-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 13:41:56 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-34b64b7728cso3533346f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 04:41:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c5-20020a056000184500b0034d1fe44278sm1112954wri.39.2024.04.29.04.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 04:41:55 -0700 (PDT)
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
X-Inumbo-ID: 7ae2b9db-061d-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714390915; x=1714995715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRjQTJrtle5ImXBSw2C5JQ/FcUffmZJty/3CQAwYEQk=;
        b=ZEXAJF6eQHiihbWc1mlqYqIlNoBx/tDEFKWHnlAYPiZfTdlOln8F9zkVIWj61alMMH
         4KOOJlfy8ZxTkHWCRk/+aNZ6tr/6ixAoe+tRPrBAxjaRhvgQrjQhKpQ7nMRTISw+0n0B
         wpSNM4furUxlGVOCkagSIwHtrbJcg6Rd1gk9U97EHua30kJhZrOmzPpwtL3E02VaeREZ
         zrZ9W1xA63h/L+iDkbYAAYNJCux/u03KoQzkqrA3L1WrayeZ+zxvk3wbxRmwc7gEAnPQ
         4AZ+N3VbpIkCH2meq8WE4daBhR6Q/F1M99n3g/kYWlWRavvImJ88T5fiOGOdJQvfu8hu
         poag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714390915; x=1714995715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xRjQTJrtle5ImXBSw2C5JQ/FcUffmZJty/3CQAwYEQk=;
        b=XAVbCGc3eaiH7++WUxE7SW35QFgcgeoMFc2budHT/qrln5mwWZmBZrDauTg8T0uVGz
         wBb0UvktrKAVKIpXMCijZhnHr3/GAh4Bd+dVEIqYeGEuWSd5r2oaklHGcJknIxHWFxqS
         8EacScbPpCkuGJRTaR0qLaMLZWK+ksVFjzpY2H0gHWYF/DUclMfToVahPA9Yty18p2Xy
         EB/XKbEud7vMrXKlRfC9nznZrTsXuo+9MdgKfk2yQCh8gy9b2iVs5SShNrufoOionP9T
         kr6jbZ30s7XWmUFeBAbsNV+8DlOFKXlo77WmgzEzoExrMeZilU0Nux4XzkCSAUJ127ZN
         EEyA==
X-Forwarded-Encrypted: i=1; AJvYcCX3tkvSKR4b+KriZ1qhfdIz3IfZL6rvv5kXGSz3NGuAu0199ZKRy7cw4DKhcxMyvhobXazxifP98sMY7G2LDrvVwHsr1llJRgGxiibppL8=
X-Gm-Message-State: AOJu0YwSULQRvBzU8VB5htoYyjQzWu5ynds6FjcW/OtYAXlQAmVZe9Bi
	nzRHNUtEvrCunHMQLTLDV5xuOlElqpH/6SZSZ+Y1jy7FxkhagM0a8aWsWZUN1A==
X-Google-Smtp-Source: AGHT+IHiVZULqPxM1T7IO/BHdcG9X4O6QHu3o8qQ8EZCF0vsM73RSKobKIiZEf1C+xjB6xSVMYLFZw==
X-Received: by 2002:adf:ee4c:0:b0:34c:8adf:8fc9 with SMTP id w12-20020adfee4c000000b0034c8adf8fc9mr4971957wro.51.1714390915293;
        Mon, 29 Apr 2024 04:41:55 -0700 (PDT)
Message-ID: <9e67e0e5-8953-4903-b2a5-024bdbd842b9@suse.com>
Date: Mon, 29 Apr 2024 13:41:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/boot: Explain discard_initial_images() and
 untangle PV initrd handling
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240426140140.465506-1-andrew.cooper3@citrix.com>
 <20240426140140.465506-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240426140140.465506-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.04.2024 16:01, Andrew Cooper wrote:
> discard_initial_images() frees the memory backing the boot modules.  It is
> called by dom0_construct_pv{,h}(), but obtains the module list by global
> pointer which is why there is no apparent link with the initrd pointer.
> 
> Generally, module contents are copied into dom0 as it's being built, but the
> initrd for PV dom0 might be directly mapped instead of copied.
> 
> dom0_construct_pv() does it's own ad-hoc freeing of the module in the copy
> case, and points the global reference at the new copy, then sets the size to
> 0.  This only functions because init_domheap_pages(x, x) happens to be a nop.
> 
> Delete the ad-hoc freeing, and leave it to discard_initial_images().  This
> requires (not) adjusting initd->mod_start in the copy case, and only setting
> the size to 0 in the mapping case.
> 
> Alter discard_initial_images() to explicitly check for an ignored module, and
> explain what's going on.  This is more robust and will allow for fixing other
> problems with module handling.
> 
> The later logic in dom0_construct_pv() now cannot use initrd->mod_start, but
> that's fine because initrd_mfn is already a duplicate of the information
> wanted, and is more consistent with initrd_{pfn,len} used elsewhere.
> 
> Invalidate the initrd pointer with LIST_POISON1 to make it clearer that it
> shouldn't be used.
> 
> No practical change in behaviour, but a substantial reduction in the
> complexity of how this works.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> CC: Christopher Clark <christopher.w.clark@gmail.com>
> 
> In other akward questions, why does initial_images_nrpages() account for all
> modules when only 1 or 2 are relevant for how we construct dom0 ?
> ---
>  xen/arch/x86/pv/dom0_build.c | 22 +++++++++++-----------
>  xen/arch/x86/setup.c         |  9 ++++++++-
>  2 files changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index d8043fa58a27..64d9984b8308 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -630,18 +630,20 @@ int __init dom0_construct_pv(struct domain *d,
>                  }
>              memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
>                     initrd_len);
> -            mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
> -            init_domheap_pages(mpt_alloc,
> -                               mpt_alloc + PAGE_ALIGN(initrd_len));
> -            initrd->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));
> +            initrd_mfn = mfn_x(page_to_mfn(page));
>          }
>          else
>          {
>              while ( count-- )
>                  if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
>                      BUG();
> +            /*
> +             * Mapped rather than copied.  Tell discard_initial_images() to
> +             * ignore it.
> +             */
> +            initrd->mod_end = 0;
>          }
> -        initrd->mod_end = 0;
> +        initrd = LIST_POISON1; /* No longer valid to use. */
>  
>          iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
>                             PFN_UP(initrd_len), &flush_flags);
> @@ -653,12 +655,10 @@ int __init dom0_construct_pv(struct domain *d,
>      if ( domain_tot_pages(d) < nr_pages )
>          printk(" (%lu pages to be allocated)",
>                 nr_pages - domain_tot_pages(d));
> -    if ( initrd )
> -    {
> -        mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
> +    if ( initrd_len )
>          printk("\n Init. ramdisk: %"PRIpaddr"->%"PRIpaddr,
> -               mpt_alloc, mpt_alloc + initrd_len);
> -    }
> +               pfn_to_paddr(initrd_mfn),
> +               pfn_to_paddr(initrd_mfn) + initrd_len);
>  
>      printk("\nVIRTUAL MEMORY ARRANGEMENT:\n");
>      printk(" Loaded kernel: %p->%p\n", _p(vkern_start), _p(vkern_end));

Between what this and the following hunk touch there is

        if ( count < initrd_pfn || count >= initrd_pfn + PFN_UP(initrd_len) )
            mfn = pfn++;
        else
            mfn = initrd_mfn++;

I can't help thinking that this invalidates ...

> @@ -881,7 +881,7 @@ int __init dom0_construct_pv(struct domain *d,
>          if ( pfn >= initrd_pfn )
>          {
>              if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
> -                mfn = initrd->mod_start + (pfn - initrd_pfn);
> +                mfn = initrd_mfn + (pfn - initrd_pfn);
>              else
>                  mfn -= PFN_UP(initrd_len);
>          }

... the use of the variable here.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -294,7 +294,7 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
>      return nr;
>  }
>  
> -void __init discard_initial_images(void)
> +void __init discard_initial_images(void) /* a.k.a. free multiboot modules */
>  {
>      unsigned int i;
>  
> @@ -302,6 +302,13 @@ void __init discard_initial_images(void)
>      {
>          uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
>  
> +        /*
> +         * Sometimes the initrd is mapped, rather than copied, into dom0.
> +         * end=0 signifies that we should leave it alone.
> +         */
> +        if ( initial_images[i].mod_end == 0 )
> +            continue;
> +
>          init_domheap_pages(start,
>                             start + PAGE_ALIGN(initial_images[i].mod_end));
>      }

While I don't strictly mind the addition, it isn't really needed, as calling
init_domheap_pages() with twice the same address is simply a no-op (and
.mod_end being 0 had to work correctly already before anyway).

Jan

