Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FDEAEF9A1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 15:05:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029730.1403473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWaen-0002dI-I1; Tue, 01 Jul 2025 13:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029730.1403473; Tue, 01 Jul 2025 13:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWaen-0002aB-F0; Tue, 01 Jul 2025 13:04:17 +0000
Received: by outflank-mailman (input) for mailman id 1029730;
 Tue, 01 Jul 2025 13:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWael-0002a5-Nd
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 13:04:15 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2803170-567b-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 15:04:13 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-553b3316160so3676852e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 06:04:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31da818sm9375954a12.61.2025.07.01.06.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 06:04:10 -0700 (PDT)
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
X-Inumbo-ID: e2803170-567b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751375052; x=1751979852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cr9yRSpwB4VLJQcyTJDPEiDMiJIqQ/HGaTsFqFrNYZA=;
        b=N6VISS+487tPnrwq00tIUJz/S2z2F7L4PWzge1Qj67a3MaUW7aruxQom8w8lmDAfyl
         dU19d6Sx7S3JjBHqb8mokPr71I4cZex+3p3ee+hmtGf8DNvwpFQnpBZNfrETTquK9SSt
         NUcykXm47M9X4h+oxltLzoTtfsy1ny5eaUnfhWxNrhzLl+SbHIek4ETk77D+rEc7HPjB
         bhtMWoSSxj3UmJlOJKex12UqBI6vOMNuf5CCr3L9wUpOztiE2W8GnboG9gWb4JWCUA8W
         Fjl4Uq3aZdaEG+a6gPigqxgNFDgkZSw/dj2vaL1iyzoYTHmYVUsWDz5VxRN56C1nQDJQ
         aU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751375052; x=1751979852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cr9yRSpwB4VLJQcyTJDPEiDMiJIqQ/HGaTsFqFrNYZA=;
        b=T5ZusxQJrbaIxMY8WQIcQyJGHgDR8S8Is2BjA3RvjGdKdVtUQstYtJnAECXlyNSq6G
         HjnEkb9f+4Lblf+pcdbmkVyy37Ug3u/x3x+fSKt66P2wHJexHnmfQ5+uSFDN/qHZk5O4
         IcygXh22o5rhmuyKuTePCgXRYLGwv20SAWuvpKj+hHQKYdBr2ddGcZ7aV0XHp0wkyuFF
         iNAu1l7P7hotO+YUYpjvHRkib9Ow0j8sx+dozDJfkqhTPpG5iy1q+oMoYJaz9TDGfAHq
         HRYp7uLC2w99odUkn94PURDCB4cUhnuCNlVvdoXB2l/Na2L7ZYuYwhFgrUGA18nlrSof
         wl+w==
X-Forwarded-Encrypted: i=1; AJvYcCVEnFXM3PmIVeETnoJmz9DD/r6E+E3FVYusi0wDo9vGPji5PoUmNDRO5/y6+9crGDKjQ0SEGY3jT9U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwC7NNLoo84qxQ3wkAXK+Si0AZm53SFkt5GYuCPFrKNc3G+DFup
	j3GXGJEjRmHonvUOoEHk1l8H8F+Boazki0bla76MYYt+wlndeF7Toyiqy8oI8G8KzA==
X-Gm-Gg: ASbGnctd3+YIkhDt7AD7V3amym6P1UiWlydsL3c17LZBhH1kKRbcGeBjOd8sC5/ZuWb
	B6uLh6Pl9PNu56/zzKNSTZyX4QhM+3azb+4lSyV44Ai0XlSmxSkSslQWtOJ4vkcjVKeFQ2UYBBk
	4smTguje1PqZuYvosPiBj+GrpVmkPE7/bDXrf8ZqLpuK9qga9blLcMYYUX2yqB7gvHTZNOjLvIs
	rcZOU5Ed9qe/pj9MSgXCQxv4lue6I96Jsd+zqaKZNw/gkCkhW/2YYmgQwY0U85nQ6iWjG02OQzH
	UeCwMfyASRJPL3cjfshU9wi6oaJWySgUR/iydchkZYhn5YKoC2bVS0EnGVBzHh9Zn0YW8p2oNB6
	0Hgg+cxnS/p5H810lgBn9Zwo6nkFhwgqthdpW8e9bpfW/3gc=
X-Google-Smtp-Source: AGHT+IFjaF60u1E5Ezt5jTZBaC6+Kj/5Eo22PvbPKLsfUBqFUahEaHgYtvFJMxpkWtAtScNx57wQkw==
X-Received: by 2002:a05:6512:3d22:b0:553:2e59:a104 with SMTP id 2adb3069b0e04-5550b8cfec0mr5671018e87.37.1751375051302;
        Tue, 01 Jul 2025 06:04:11 -0700 (PDT)
Message-ID: <f3761f21-1a7d-4820-ba74-31fb9becf36d@suse.com>
Date: Tue, 1 Jul 2025 15:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen/riscv: construct the P2M pages pool for
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <bdde7c97df218d3ac65f9e719c5777401da80495.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <bdde7c97df218d3ac65f9e719c5777401da80495.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> @@ -113,3 +117,58 @@ int p2m_init(struct domain *d)
>  
>      return 0;
>  }
> +
> +/*
> + * Set the pool of pages to the required number of pages.
> + * Returns 0 for success, non-zero for failure.
> + * Call with d->arch.paging.lock held.
> + */
> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
> +{
> +    struct page_info *pg;
> +
> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
> +
> +    for ( ; ; )
> +    {
> +        if ( d->arch.paging.p2m_total_pages < pages )
> +        {
> +            /* Need to allocate more memory from domheap */
> +            pg = alloc_domheap_page(d, MEMF_no_owner);
> +            if ( pg == NULL )
> +            {
> +                printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
> +                return -ENOMEM;
> +            }
> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages)++;
> +            page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
> +        }
> +        else if ( d->arch.paging.p2m_total_pages > pages )
> +        {
> +            /* Need to return memory to domheap */
> +            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
> +            if( pg )
> +            {
> +                ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
> +                free_domheap_page(pg);
> +            }
> +            else
> +            {
> +                printk(XENLOG_ERR
> +                       "Failed to free P2M pages, P2M freelist is empty.\n");
> +                return -ENOMEM;
> +            }
> +        }
> +        else
> +            break;
> +
> +        /* Check to see if we need to yield and try again */
> +        if ( preempted && general_preempt_check() )
> +        {
> +            *preempted = true;
> +            return -ERESTART;
> +        }
> +    }
> +
> +    return 0;
> +}

Btw, with the order-2 requirement for the root page table, you may want to
consider an alternative approach: Here you could allocate some order-2
pages (possibly up to as many as a domain might need, which right now
would be exactly one), put them on a separate list, and consume the root
table(s) from there. If you run out of pages on the order-0 list, you
could shatter a page from the order-2 one (as long as that's still non-
empty). The difficulty would be with freeing, where a previously shattered
order-2 page would be nice to re-combine once all of its constituents are
free again. The main benefit would be avoiding the back and forth in patch
6.

Jan

