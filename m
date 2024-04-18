Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1B28A9A72
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 14:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708345.1107199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRHt-0006y8-Mo; Thu, 18 Apr 2024 12:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708345.1107199; Thu, 18 Apr 2024 12:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRHt-0006vm-Jr; Thu, 18 Apr 2024 12:54:49 +0000
Received: by outflank-mailman (input) for mailman id 708345;
 Thu, 18 Apr 2024 12:54:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxRHs-0006vg-Fp
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 12:54:48 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5193410-fd82-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 14:54:46 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-418def30e50so5068555e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 05:54:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m25-20020a05600c3b1900b0041816c3049csm2605915wms.11.2024.04.18.05.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 05:54:45 -0700 (PDT)
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
X-Inumbo-ID: d5193410-fd82-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713444885; x=1714049685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7NJHCfTzkYDulmyK6Njyi3Xj7BVVTO4hKnBt5VNiSM=;
        b=EKfV4D+UfpJ4bZ0bgArb93/SZlLTNwRhN0tQPXaO31wnFMWMIW7qWNCe9qv1GKQ/1d
         RXCsG120/jFM99BJajgWwxKlC2kwDpB3vsEv3O1OQJBZt0aS1gI1TXp5O9UulPfz0MW8
         YdOrkwUyE5pT0Caeh4+JaOFQ0foMqdlEWZ3/mUdXEmn5dfEjhhGvHrO6RNtgwS3LppmJ
         RWSonQq7YlrANyr5oCM6zo/f2vqKejmMx9UaFfKv17K90whYwPp5aIf6JPfZwJu0rxG+
         z226RzcnlPmyE8L9EmCzRCbsJw8Xy75YWeTbUc/KGXBtrTXKRBfq9wpv1YzprrPLcY+Y
         IMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444885; x=1714049685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7NJHCfTzkYDulmyK6Njyi3Xj7BVVTO4hKnBt5VNiSM=;
        b=uFgCpsGNrYAB6Wh38XxY85+NXVnXWRLo7hpkijx3ISSUEXyN+2L7w3c7VCV9angAS4
         rHqQIZ9KvP6zhRqiRA8r3hh+ZGbMEdg7gEgQxBKiofCBVPjR9WycnmRJbMVG6NkcuAXc
         0jiy4ZSB3EuFuvrpKbWLzVaymq+Q98nhaJZl3zEp8+Ng6AitJnw7zV9stAzMUfOgcBND
         lqdJbxhTpnOm3fp7qE0UPfdGOQjC8OCLSOkRlOU6dlcztY5Pv5eGrxHBXOYLBNSwlDjL
         qZNWjC9YmBMqEpj3AOnud20Litf+Rpq5b84xFaLt8rpB87Dsii81DpbPILLQU29qFmoY
         xixw==
X-Forwarded-Encrypted: i=1; AJvYcCW5fS9UB5msM0eBmsorBq5Aun0SpCacx7fNSpbY3r0GfkHVYnYel+8u0hkd6fjAopW33fGi9DK46FoEmE0vekssjU+C8T4h2Y/seOXfMhA=
X-Gm-Message-State: AOJu0YzQJU30+1P6sz3xYoYMLZWsSZiF2EBIQqKQq7Et6Mzdhk/1h6TV
	7jOonuUohnjzGCMa3qc7oLPJhA+cwRpqPiahEHkfXZsBBpS3Q+jXP6vs0Ak9rg==
X-Google-Smtp-Source: AGHT+IGrc/BO9ZIXmh6NdN9Sf6OwVLJz0iPSCoMZUtJRsLEsY/14x4ShdRn4KOoFurPFCuWb6UCF4w==
X-Received: by 2002:a05:600c:4e0f:b0:418:fa37:60c0 with SMTP id b15-20020a05600c4e0f00b00418fa3760c0mr114569wmq.22.1713444885344;
        Thu, 18 Apr 2024 05:54:45 -0700 (PDT)
Message-ID: <cc4fd69b-4866-4f1b-b780-64c5fac7d2d6@suse.com>
Date: Thu, 18 Apr 2024 14:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] xen/memory, tools: Avoid hardcoding
 GUEST_MAGIC_BASE in init-dom0less
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Alec Kwapis <alec.kwapis@medtronic.com>,
 xen-devel@lists.xenproject.org, Daniel Smith <dpsmith@apertussolutions.com>
References: <20240409045357.236802-1-xin.wang2@amd.com>
 <20240409045357.236802-5-xin.wang2@amd.com>
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
In-Reply-To: <20240409045357.236802-5-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2024 06:53, Henry Wang wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -155,6 +155,14 @@ static void increase_reservation(struct memop_args *a)
>      a->nr_done = i;
>  }
>  
> +/*
> + * Alias of _MEMF_no_refcount to avoid introduction of a new, single-use flag.
> + * This flag should be used for populate_physmap() only as a re-purposing of
> + * _MEMF_no_refcount to force a non-1:1 allocation from domheap.
> + */
> +#define _MEMF_force_heap_alloc _MEMF_no_refcount
> +#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)

Nit (style): Blanks around << please.

Also do you really need both constants? I dont think so.

Plus please make sure to #undef the constant once no longer needed, to
help spotting / avoiding misuses.

> @@ -219,7 +227,8 @@ static void populate_physmap(struct memop_args *a)
>          }
>          else
>          {
> -            if ( is_domain_direct_mapped(d) )
> +            if ( is_domain_direct_mapped(d) &&
> +                 !(a->memflags & MEMF_force_heap_alloc) )
>              {
>                  mfn = _mfn(gpfn);
>  
> @@ -246,7 +255,8 @@ static void populate_physmap(struct memop_args *a)
>  
>                  mfn = _mfn(gpfn);
>              }
> -            else if ( is_domain_using_staticmem(d) )
> +            else if ( is_domain_using_staticmem(d) &&
> +                      !(a->memflags & MEMF_force_heap_alloc) )
>              {
>                  /*
>                   * No easy way to guarantee the retrieved pages are contiguous,
> @@ -271,6 +281,14 @@ static void populate_physmap(struct memop_args *a)
>              }
>              else
>              {
> +                /*
> +                 * Avoid passing MEMF_force_heap_alloc down to
> +                 * alloc_domheap_pages() where the meaning would be the
> +                 * original MEMF_no_refcount.
> +                 */
> +                if ( unlikely(a->memflags & MEMF_force_heap_alloc) )
> +                    a->memflags &= ~MEMF_force_heap_alloc;

As asked before: Why the if()?

> @@ -1404,6 +1422,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      {
>      case XENMEM_increase_reservation:
>      case XENMEM_decrease_reservation:
> +    case XENMEM_populate_physmap_heap_alloc:
>      case XENMEM_populate_physmap:
>          if ( copy_from_guest(&reservation, arg, 1) )
>              return start_extent;

Nit or not: Please insert the new case label last.

> @@ -1433,6 +1452,11 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>               && (reservation.mem_flags & XENMEMF_populate_on_demand) )
>              args.memflags |= MEMF_populate_on_demand;
>  
> +        /* Assert flag is not set from construct_memop_from_reservation(). */
> +        ASSERT(!(args.memflags & MEMF_force_heap_alloc));
> +        if ( op == XENMEM_populate_physmap_heap_alloc )
> +            args.memflags |= MEMF_force_heap_alloc;

Wouldn't this more logically live ...

>          if ( xsm_memory_adjust_reservation(XSM_TARGET, curr_d, d) )
>          {
>              rcu_unlock_domain(d);
> @@ -1453,7 +1477,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          case XENMEM_decrease_reservation:
>              decrease_reservation(&args);
>              break;

here, as

          case XENMEM_populate_physmap_heap_alloc:
              ...
              fallthrough;
> -        default: /* XENMEM_populate_physmap */
> +        default: /* XENMEM_populate_{physmap, physmap_heap_alloc} */

Otherwise: Just XENMEM_populate_physmap{,_heap_alloc} perhaps?

> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -21,6 +21,7 @@
>  #define XENMEM_increase_reservation 0
>  #define XENMEM_decrease_reservation 1
>  #define XENMEM_populate_physmap     6
> +#define XENMEM_populate_physmap_heap_alloc 29

Without a comment, how is one supposed to know what the difference is of
this new sub-op compared to the "normal" one? I actually wonder whether
referring to a Xen internal (allocation requested to come from the heap)
is actually a good idea here. I'm inclined to suggest to name this after
the purpose it has from the guest or tool stack perspective.

Speaking of which: Is this supposed to be guest-accessible, or is it
intended for tool-stack use only (I have to admit I don't even know where
init-dom0less actually runs)? In the latter case that also wants enforcing.
This may require an adjustment to the XSM hook in use here. Cc-ing Daniel
for possible advice.

Jan

