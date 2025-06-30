Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76C6AEE241
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 17:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029205.1402972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGLI-0001gl-KF; Mon, 30 Jun 2025 15:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029205.1402972; Mon, 30 Jun 2025 15:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGLI-0001dl-Gv; Mon, 30 Jun 2025 15:22:48 +0000
Received: by outflank-mailman (input) for mailman id 1029205;
 Mon, 30 Jun 2025 15:22:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWGLH-0001da-La
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 15:22:47 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 123d95fa-55c6-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 17:22:44 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a522224582so2385890f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 08:22:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31bea22sm8333249a12.38.2025.06.30.08.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:22:43 -0700 (PDT)
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
X-Inumbo-ID: 123d95fa-55c6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751296964; x=1751901764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uaj4gs5EI0MgSknyxhjQiJCxQkzkS215TkkNr7OAfZs=;
        b=WA3LR+2G4rw2sHCYVEAyt++ApXPHb24fCAclOpMyZ/dWklOi31HZZf4UibGazrGQUH
         Fe5gRfmrM9d17tiJpa0egWzvPfEsVImZQduM+mVgk8qhgsLZJQAC5GQqJLnp7llSjaYi
         U0FhL+DA8HRdzwM1KCbVpI/P6kda3InewhGLsBFC/47Sg0bzqeRzJPeTsQaxIzh01vOr
         exJmv9uDfCYxsfkfjswFwleR6e37X2yBpnzLw2Pjo9HsycDs44qtBYFspuPOQ2mL3mT3
         JP5vxewEN/JMHsX39FXC3EJFBGkK24YjgCWTMK2R6wTQ7hIMCkmbMOCNs3M9iTGsS2Wv
         0zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751296964; x=1751901764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaj4gs5EI0MgSknyxhjQiJCxQkzkS215TkkNr7OAfZs=;
        b=Il2UHwT9h7mvuKXm6N7F9ea7VO2ZPKoVtx6bOLHenNv4MoIQY9eV4EPQCedqZgRRgQ
         Nifr+uVKl/pEkzz2tdNudPUh9dS8I7tx0qf/SMO3VvfynmIsmbQxu4C1F0d6TFZtJVey
         vRTSFt6kdoVtR2rGXjb3eUJVS/HWqksqo1npbITs1aGIzGtKs9L45ZZvTf60K9xi82GY
         HUP59s8QLy/gRJsMyMbMb1f4P0qt1jhX1mq3QbShHxWbO1MrTwL9LpGWXoISxHjpb9+C
         FyX/7a4p+8nJfoizvJiw9J8kJFW9NGKjVnbeBbCBsPuklv4TxBsiryNfKeIrMQPRgkRQ
         mVVg==
X-Forwarded-Encrypted: i=1; AJvYcCUSYJmVKu9eLp+yzsvjd/I8XEUjEmhjR8UDPcUSA4hnyJZsp1R/MxipK3jM9UGCUboL1bktWGWpQ9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFX/HxOargkTuUPlsQ7Ngh42UU5mDcpYPS64/0cddetcjEInzJ
	tDrI7v+LdKM7MmQ6MEL7Uc25iRszarx4P+mFSeMFZHW/aepLMz+IFgNxum/r3LGKQg==
X-Gm-Gg: ASbGncsgNKSYj6Wl2+UCFENZs7gCyu9ca01R7qDRtazsOXgmok9Z15+IfVioFCTT3pN
	1gMQEVEk/WwYtoU5ng4+3+2by9N8IuoAVzoceIIcLnWpkLEd9PBEEcjW1IU4t7Zp8Pmmqhr0foP
	JDkzgRoT0MH6LY7Jj86n9EzbOvhwH3IBz7vOzKM5twnTPjUcqolJtkyjomLyvlcKj+J1bzImzre
	w+aQeNmOTlzOYl+UdO108dFxSs1y+zqR6ryTdL+3WuDa6EVyH2LyGr0lYgxx/ic2nijj4VOEDN3
	L3l+mIYgcDnsy+Ifc+btiQoowfiXqddyrycJj4kpKMzVKexUFEYaBh6nWIjgHLRF5N2af2ONCIM
	DZq/o/+frtnAh/7VgUE7T9Wb7c3IrIaubhiys1a5faTB/XwM=
X-Google-Smtp-Source: AGHT+IHquY/zmuNVnI+mXBxHnpIHynLW/wDtxwghqFNPerrsyxIucaOq69ZKBEgSLmA0DYgKZYReCQ==
X-Received: by 2002:adf:b649:0:b0:3a0:7d27:f076 with SMTP id ffacd0b85a97d-3a8fdb29f1emr11754843f8f.2.1751296963902;
        Mon, 30 Jun 2025 08:22:43 -0700 (PDT)
Message-ID: <9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com>
Date: Mon, 30 Jun 2025 17:22:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <76675ddb7517e4cceb63472c94944046b255da01.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <76675ddb7517e4cceb63472c94944046b255da01.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -26,6 +26,12 @@ struct p2m_domain {
>      /* Pages used to construct the p2m */
>      struct page_list_head pages;
>  
> +    /* The root of the p2m tree. May be concatenated */
> +    struct page_info *root;
> +
> +    /* Address Translation Table for the p2m */
> +    paddr_t hgatp;

Does this really need holding in a struct field? Can't is be re-created at
any time from "root" above? And such re-creation is apparently infrequent,
if happening at all after initial allocation. (But of course I don't know
what future patches of yours will bring.) This is even more so if ...

> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -133,11 +133,13 @@
>  #define HGATP_MODE_SV48X4		_UL(9)
>  
>  #define HGATP32_MODE_SHIFT		31
> +#define HGATP32_MODE_MASK		_UL(0x80000000)
>  #define HGATP32_VMID_SHIFT		22
>  #define HGATP32_VMID_MASK		_UL(0x1FC00000)
>  #define HGATP32_PPN			_UL(0x003FFFFF)
>  
>  #define HGATP64_MODE_SHIFT		60
> +#define HGATP64_MODE_MASK		_ULL(0xF000000000000000)
>  #define HGATP64_VMID_SHIFT		44
>  #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)

... VMID management is going to change as previously discussed, at which
point the value to put in hgatp will need (partly) re-calculating at certain
points anyway.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -41,6 +41,91 @@ void p2m_write_unlock(struct p2m_domain *p2m)
>      write_unlock(&p2m->lock);
>  }
>  
> +static void clear_and_clean_page(struct page_info *page)
> +{
> +    clean_dcache_va_range(page, PAGE_SIZE);
> +    clear_domain_page(page_to_mfn(page));
> +}

A function of this name can, imo, only clear and then clean. Question is why
it's the other way around, and what the underlying requirement is for the
cleaning part to be there in the first place. Maybe that's obvious for a
RISC-V person, but it's entirely non-obvious to me (Arm being different in
this regard because of running with caches disabled at certain points in
time).

> +static struct page_info *p2m_allocate_root(struct domain *d)
> +{
> +    struct page_info *page;
> +    unsigned int order = get_order_from_bytes(KB(16));

While better than a hard-coded order of 2, this still is lacking. Is there
a reason there can't be a suitable manifest constant in the header?

> +    unsigned int nr_pages = _AC(1,U) << order;

Nit (style): Missing blank after comma.

> +    /* Return back nr_pages necessary for p2m root table. */
> +
> +    if ( ACCESS_ONCE(d->arch.paging.p2m_total_pages) < nr_pages )
> +        panic("Specify more xen,domain-p2m-mem-mb\n");

You shouldn't panic() in anything involved in domain creation. You want to
return NULL in this case.

Further, to me the use of "more" looks misleading here. Do you perhaps mean
"larger" or "bigger"?

This also looks to be happening without any lock held. If that's intentional,
I think the "why" wants clarifying in a code comment.

> +    for ( unsigned int i = 0; i < nr_pages; i++ )
> +    {
> +        /* Return memory to domheap. */
> +        page = page_list_remove_head(&d->arch.paging.p2m_freelist);
> +        if( page )
> +        {
> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
> +            free_domheap_page(page);
> +        }
> +        else
> +        {
> +            printk(XENLOG_ERR
> +                   "Failed to free P2M pages, P2M freelist is empty.\n");
> +            return NULL;
> +        }
> +    }

The reason for doing this may also want to be put in a comment.

> +    /* Allocate memory for p2m root table. */
> +
> +    /*
> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
> +     * As explained in Section 18.5.1, for the paged virtual-memory schemes

The first sentence didn't finish when the 2nd starts. Is there a piece missing?
Do the two sentences want to be joined together?

> +static unsigned long hgatp_from_page(struct p2m_domain *p2m)

Function name and parameter type/name don't fit together.

> +{
> +    struct page_info *p2m_root_page = p2m->root;

As always: pointer-to-const wherever possible, please. But: Is this local
variable really useful to have?

> +    unsigned long ppn;
> +    unsigned long hgatp_mode;
> +
> +    ppn = PFN_DOWN(page_to_maddr(p2m_root_page)) & HGATP_PPN;
> +
> +#if RV_STAGE1_MODE == SATP_MODE_SV39
> +    hgatp_mode = HGATP_MODE_SV39X4;
> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
> +    hgatp_mode = HGATP_MODE_SV48X4;
> +#else
> +#   error "add HGATP_MODE"
> +#endif
> +
> +    return ppn | MASK_INSR(p2m->vmid, HGATP_VMID_MASK) |
> +           MASK_INSR(hgatp_mode, HGATP_MODE_MASK);
> +}
> +
> +static int p2m_alloc_root_table(struct domain *d)

As indicated earlier, in a wider context - this is a good candidate where
the caller rather wants to pass struct p2m_domain *. Once you get variations
on P2Ms (like x86'es altp2m or nestedp2m, the domain won't be meaningful
here to know which P2M to allocate the root for.

> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +    p2m->root = p2m_allocate_root(d);
> +    if ( !p2m->root )
> +        return -ENOMEM;
> +
> +    p2m->hgatp = hgatp_from_page(p2m);
> +
> +    return 0;
> +}
> +
>  static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
>  
>  /*
> @@ -228,5 +313,14 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>          }
>      }
>  
> +    /*
> +    * First, wait for the p2m pool to be initialized. Then allocate the root

Why "wait"? There's waiting here.

> +    * table so that the necessary pages can be returned from the p2m pool,
> +    * since the root table must be allocated using alloc_domheap_pages(...)
> +    * to meet its specific requirements.
> +    */
> +    if ( !d->arch.p2m.root )

Aren't you open-coding p2m_get_hostp2m() here?

Jan

> +        p2m_alloc_root_table(d);
> +
>      return 0;
>  }


