Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B816385B835
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 10:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683353.1062819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcMmR-0002ab-Av; Tue, 20 Feb 2024 09:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683353.1062819; Tue, 20 Feb 2024 09:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcMmR-0002YT-7q; Tue, 20 Feb 2024 09:51:15 +0000
Received: by outflank-mailman (input) for mailman id 683353;
 Tue, 20 Feb 2024 09:51:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcMmP-0002YN-H8
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 09:51:13 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94683909-cfd5-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 10:51:12 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4126dd40a54so4443755e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 01:51:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fs14-20020a05600c3f8e00b00411a595d56bsm13901193wmb.14.2024.02.20.01.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 01:51:11 -0800 (PST)
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
X-Inumbo-ID: 94683909-cfd5-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708422671; x=1709027471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7/Yq2uTii1GCM68bdCxdDu0KhvKbyUGIl+DXx91luE=;
        b=XMkVRcTd7MEakLTK0pOHvTV2UWVwBhlCy0txYu/wXpS4hOy55Dp8zc1B75x1NW0dlq
         un/joKZcjrGuvHCaeDR5Mg+h3V+p7vxK8LzgrlTKhjtmtQm43Ej45eorJhl4PHNy/ccV
         D4tksM+yU8bI+ygV7NIKhgNr7M3ZIC29pIM12TkW4tsUgGm6nkoavXK+EotgMZ6/KxC5
         hIrppxfWQlQTofK9okGDBlIG6KjjjFbUKAMH0q13I+RlB/tRFNv5UyI8+lCqyesY5b/u
         OR6SUc+arD+FuPD37ghkhR8/aVzZzwmkpmKbW+wzvno4gBs2eXOom5k/sZrzIAlevc7K
         r1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708422671; x=1709027471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7/Yq2uTii1GCM68bdCxdDu0KhvKbyUGIl+DXx91luE=;
        b=CAPCNJ/E6JfEphEfIQbw3JGd46OFErwxAWrd1PIwSjJbHCYtDniV9tW7ChEjtjal+5
         9FUYvjVHU93/ILkwwzGNzpo2cWaEP/PFs7YbtIXvxsYK4Ji8+gtJ0i1bDLvuqFMIsimp
         u6YFq7xm5QzHWBBsf0NktQWGQhLjTmVEwigWRXkcfcbSwbKq46IxEKH9V3e/iFxx8nPR
         mb5KvKU0tyueJsrIqY697tNeA3zhpN6K9pVCsYT3JuOPdb4hkmEBWcGBPfycLlArVbDh
         EqykcHcHhRSsMkWjpo+r/XKDzru+zkt7VePd/FGct/xj+Z1J0n5rnF4MdsanWgUjngG6
         eXeA==
X-Forwarded-Encrypted: i=1; AJvYcCUIBprrJPumIhQLNzQPR6sf627d4R+xd/QHH2WlcYFBAMBGZMIC7y4yrkN+fY9rp2hZzk/u3pRxzmKm7OlTBBdL+F9qXmYud2BOak9ZmwY=
X-Gm-Message-State: AOJu0YxSCxNvqTXVSJ9cnyr18hqQ1R3D6Oy3jwr3sjGatqZqFHRIjw/t
	Mf65roKS5bGTfTFQbltbJwLaKgtKs42puwcaYdolQ47NZa1RTIv2fdfObUpOJQ==
X-Google-Smtp-Source: AGHT+IFdDWQvISjNtXBz8Jd95yjWmEtM9cF2XYPeEuuky7lj9OB1Gk53ff3KLjzPXe3qo59LboOO+g==
X-Received: by 2002:a05:600c:1994:b0:410:ac80:bf3e with SMTP id t20-20020a05600c199400b00410ac80bf3emr1960505wmq.37.1708422671532;
        Tue, 20 Feb 2024 01:51:11 -0800 (PST)
Message-ID: <a2ce9820-c57a-4690-9dc6-c15d8a1489f4@suse.com>
Date: Tue, 20 Feb 2024 10:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 07/27] x86: Map/unmap pages in
 restore_all_guests
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-8-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-8-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Before, it assumed the pv cr3 could be accessed via a direct map. This
> is no longer true.

There are a number of terminology issues here, starting with the title:
Unlike (iirc) in an earlier version, no mapping/unmapping occurs in
restore_all_guests itself anymore. When reading just the title I
thought "What? Didn't I say no there?" Then for the sentence above: If
what it stated was true, a bug would have been introduced in one of
the earlier patches. What I think is meant, though, is that this is
going to be no longer true.

Finally the use of "shadow" in identifiers in the code changes
themselves is somewhat problematic imo, seeing the shadow paging mode
we support for both HVM and PV. The nature here is different (it's
merely a secondary mapping aiui), so I think it would be better to
avoid the term "shadow". Maybe ...

> --- a/xen/arch/x86/include/asm/config.h
> +++ b/xen/arch/x86/include/asm/config.h
> @@ -202,7 +202,7 @@ extern unsigned char boot_edid_info[128];
>  /* Slot 260: per-domain mappings (including map cache). */
>  #define PERDOMAIN_VIRT_START    (PML4_ADDR(260))
>  #define PERDOMAIN_SLOT_MBYTES   (PML4_ENTRY_BYTES >> (20 + PAGETABLE_ORDER))
> -#define PERDOMAIN_SLOTS         3
> +#define PERDOMAIN_SLOTS         4
>  #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
>                                   (PERDOMAIN_SLOT_MBYTES << 20))
>  /* Slot 4: mirror of per-domain mappings (for compat xlat area accesses). */
> @@ -316,6 +316,16 @@ extern unsigned long xen_phys_start;
>  #define ARG_XLAT_START(v)        \
>      (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
>  
> +/* root_pt shadow mapping area. The fourth per-domain-mapping sub-area */
> +#define SHADOW_ROOT_PT_VIRT_START   PERDOMAIN_VIRT_SLOT(3)
> +#define SHADOW_ROOT_PT_ENTRIES      MAX_VIRT_CPUS
> +#define SHADOW_ROOT_PT_VIRT_END     (SHADOW_ROOT_PT_VIRT_START +    \
> +                                     (SHADOW_ROOT_PT_ENTRIES * PAGE_SIZE))
> +
> +/* The address of a particular VCPU's ROOT_PT */
> +#define SHADOW_ROOT_PT_VCPU_VIRT_START(v) \
> +    (SHADOW_ROOT_PT_VIRT_START + ((v)->vcpu_id * PAGE_SIZE))

... ROOT_PT_MAPPING_* throughout, or PV_ROOT_PT_MAPPING_*?

As to SHADOW_ROOT_PT_VIRT_END - when trying to check where it's used
and hence whether it really needs to use MAX_VIRT_CPUS I couldn't
spot any use. I don't think the constant should be defined when it's
not needed.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -505,6 +505,13 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
>      spin_unlock(&d->page_alloc_lock);
>  }
>  
> +#define shadow_root_pt_idx(v) \
> +    ((v)->vcpu_id >> PAGETABLE_ORDER)
> +
> +#define pv_shadow_root_pt_pte(v) \
> +    ((v)->domain->arch.pv.shadow_root_pt_l1tab[shadow_root_pt_idx(v)] + \
> +     ((v)->vcpu_id & (L1_PAGETABLE_ENTRIES - 1)))

I think uniformly named constant want using in both macros, i.e. either
some L1_* in the first macro (preferred) or an expression derived from
PAGETABLE_ORDER in the 2nd.

> @@ -524,6 +531,13 @@ void write_ptbase(struct vcpu *v)
>  
>      if ( is_pv_vcpu(v) && v->domain->arch.pv.xpti )
>      {
> +        mfn_t guest_root_pt = _mfn(v->arch.cr3 >> PAGE_SHIFT);

While we do so in several other places, I think we'd be better off not
continuing to assume the top bits to all be zero. IOW MASK_EXTR() may
be better to use here.

> +        l1_pgentry_t *pte = pv_shadow_root_pt_pte(v);
> +
> +        ASSERT(v == current);
> +
> +        l1e_write(pte, l1e_from_mfn(guest_root_pt, __PAGE_HYPERVISOR_RW));

The mapping is the copy source in restore_all_guests, isn't it? In
which case couldn't this be a r/o mapping?

> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -288,6 +288,19 @@ static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
>                                1U << GDT_LDT_VCPU_SHIFT);
>  }
>  
> +static int pv_create_shadow_root_pt_l1tab(struct vcpu *v)
> +{
> +    return create_perdomain_mapping(v->domain, SHADOW_ROOT_PT_VCPU_VIRT_START(v),

This line looks to be too long. But ...

> +                                    1, v->domain->arch.pv.shadow_root_pt_l1tab,
> +                                    NULL);
> +}
> +
> +static void pv_destroy_shadow_root_pt_l1tab(struct vcpu *v)
> +
> +{
> +    destroy_perdomain_mapping(v->domain, SHADOW_ROOT_PT_VCPU_VIRT_START(v), 1);
> +}

... I'm not convinced of the usefulness of these wrapper functions
anyway, even more so that each is used exactly once.

> @@ -297,6 +310,7 @@ void pv_vcpu_destroy(struct vcpu *v)
>      }
>  
>      pv_destroy_gdt_ldt_l1tab(v);
> +    pv_destroy_shadow_root_pt_l1tab(v);
>      XFREE(v->arch.pv.trap_ctxt);
>  }
>  
> @@ -311,6 +325,13 @@ int pv_vcpu_initialise(struct vcpu *v)
>      if ( rc )
>          return rc;
>  
> +    if ( v->domain->arch.pv.xpti )
> +    {
> +        rc = pv_create_shadow_root_pt_l1tab(v);
> +        if ( rc )
> +            goto done;
> +    }
> +
>      BUILD_BUG_ON(X86_NR_VECTORS * sizeof(*v->arch.pv.trap_ctxt) >
>                   PAGE_SIZE);
>      v->arch.pv.trap_ctxt = xzalloc_array(struct trap_info, X86_NR_VECTORS);
> @@ -346,10 +367,12 @@ void pv_domain_destroy(struct domain *d)
>  
>      destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
>                                GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
> +    destroy_perdomain_mapping(d, SHADOW_ROOT_PT_VIRT_START, SHADOW_ROOT_PT_ENTRIES);

Too long line again.

>      XFREE(d->arch.pv.cpuidmasks);
>  
>      FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
> +    FREE_XENHEAP_PAGE(d->arch.pv.shadow_root_pt_l1tab);
>  }
>  
>  void noreturn cf_check continue_pv_domain(void);
> @@ -371,6 +394,12 @@ int pv_domain_initialise(struct domain *d)
>          goto fail;
>      clear_page(d->arch.pv.gdt_ldt_l1tab);
>  
> +    d->arch.pv.shadow_root_pt_l1tab =
> +        alloc_xenheap_pages(0, MEMF_node(domain_to_node(d)));
> +    if ( !d->arch.pv.shadow_root_pt_l1tab )
> +        goto fail;
> +    clear_page(d->arch.pv.shadow_root_pt_l1tab);

Looks like you simply cloned the GDT/LDT code. That's covering 128k
of VA space per vCPU, though, while here you'd using only 4k. Hence
using a full page looks like a factor 32 over-allocation. And once
using xzalloc() here instead a further question would be whether to
limit to the domain's actual needs - most domains will have far less
than 8k vCPU-s. In the common case (up to 512 vCPU-s) a single slot
will suffice, at which point a yet further question would be whether
to embed the "array" in struct pv_domain instead in that common case
(e.g. by using a union).

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -165,7 +165,15 @@ restore_all_guest:
>          and   %rsi, %rdi
>          and   %r9, %rsi
>          add   %rcx, %rdi
> +
> +        /*
> +         * The address in the vCPU cr3 is always mapped in the shadow
> +         * root_pt virt area.
> +         */
> +        imul $PAGE_SIZE, VCPU_id(%rbx), %esi

Nit: Another blank please after the insn mnemonic, to match what's
upwards in context as well as ...

> +        movabs $SHADOW_ROOT_PT_VIRT_START, %rcx
>          add   %rcx, %rsi

... this.

Jan

