Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D39898451
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 11:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700774.1094424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsJXz-0001MO-7I; Thu, 04 Apr 2024 09:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700774.1094424; Thu, 04 Apr 2024 09:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsJXz-0001Jx-3F; Thu, 04 Apr 2024 09:38:15 +0000
Received: by outflank-mailman (input) for mailman id 700774;
 Thu, 04 Apr 2024 09:38:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsJXx-0001Jr-It
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 09:38:13 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d46c036-f267-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 11:38:11 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56829f41f81so1073007a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 02:38:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w24-20020a056402071800b0056e0e8578ffsm1154763edx.70.2024.04.04.02.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 02:38:10 -0700 (PDT)
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
X-Inumbo-ID: 0d46c036-f267-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712223491; x=1712828291; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rw40+l+M8bjXx2sIoF1+HIH86wHCQV0kN95YGjZpj2E=;
        b=ZBbhuqaHsWv/ewwmjgXaYYC+KC3h/hr6yeoDux8zqGCLV4Wwl21lyJ1nJW0HgQ60Yk
         7F4t/zeAREH0LG2Y1w2rU9MY9S1BihmAOr7lbDWgFbExkmAmLGNsZB5/UGr2w95CPtyX
         0E0m7eqFCu2h2u6L94CE68SAMcHEhRKN0Ujoz61s0y03unkqxLrneVVe7xrau1G6v751
         hzdv83Qp3CY6UJ+twztZOp2xyoaktk1/BZg1xCwfowEq8ofwEWb+yzSxkzHQ2ueERkt3
         WrEksqTSD9I7WG23+MqXCpwJdwKql68V67d4qO94LDPjD09+yuCjd0FGklod9h/DFT2j
         lgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712223491; x=1712828291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw40+l+M8bjXx2sIoF1+HIH86wHCQV0kN95YGjZpj2E=;
        b=CmNsXnh7yUJpHgVJ2HbiAVTWTOE8ZVlTrwFUBGGfUdHOaASBlYnp9H2eExjJJNx+VG
         pUH3KyUGtChFjN+ke+vxOIKAhAMTJcrtft3+HhiRpJt0MjE5TZREO9xNYBIxKD9+SqEy
         YyoCyE1UIkxYWOQqID3bYWGMX4pAIjkmVYw5Alc7fkk0hN2PEX81jNFMS4QE2amdYtt6
         XWDbnVWj/0oGNDsJUzwKQBplMaaljJktCiD79okNpokRVrTKHizARGShCQsDodjqjj6Z
         Jbv+7v0W/WwlFS70pz2bSxKAH60w/Zou3YrCA9aF/qPwRk9MsaJHTWMXJ68Gw5C1g1EK
         cLZw==
X-Forwarded-Encrypted: i=1; AJvYcCUj8NA8qqfRWFebYZ6AIJp8d8YbFxc0teXkucFIn8hpDGtEDUcgxCjwT4k6VzIuTcBwuBzMEU4DN8sqhkwaZgHjITzclBAqXhMlzU271RE=
X-Gm-Message-State: AOJu0YyDr1FaTtYuso1kthzRhvn9oMlZIi8ANb7A8MECEidwelOCGZ55
	GIqY+rjQjAiURDK1bYo7SvbgTSaNjMRmovLkoIov3+1/2sk0x+7XSyLBtY30cQ==
X-Google-Smtp-Source: AGHT+IEmU8KF4qoptbHRGbTwlU6fzalhBEom551p06BRHiIczTY4Un2Iy09z1al4u7AFALIzI8ukjA==
X-Received: by 2002:a50:8713:0:b0:56b:b66d:5bfe with SMTP id i19-20020a508713000000b0056bb66d5bfemr1123168edb.31.1712223490960;
        Thu, 04 Apr 2024 02:38:10 -0700 (PDT)
Message-ID: <e9167c39-187f-4a66-b9a4-8b3a6ae3000b@suse.com>
Date: Thu, 4 Apr 2024 11:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/memory, tools: Avoid hardcoding
 GUEST_MAGIC_BASE in init-dom0less
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240403081626.375313-1-xin.wang2@amd.com>
 <20240403081626.375313-5-xin.wang2@amd.com>
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
In-Reply-To: <20240403081626.375313-5-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 10:16, Henry Wang wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -219,7 +219,8 @@ static void populate_physmap(struct memop_args *a)
>          }
>          else
>          {
> -            if ( is_domain_direct_mapped(d) )
> +            if ( is_domain_direct_mapped(d) &&
> +                 !(a->memflags & MEMF_force_heap_alloc) )
>              {
>                  mfn = _mfn(gpfn);
>  
> @@ -246,7 +247,8 @@ static void populate_physmap(struct memop_args *a)
>  
>                  mfn = _mfn(gpfn);
>              }
> -            else if ( is_domain_using_staticmem(d) )
> +            else if ( is_domain_using_staticmem(d) &&
> +                      !(a->memflags & MEMF_force_heap_alloc) )
>              {
>                  /*
>                   * No easy way to guarantee the retrieved pages are contiguous,
> @@ -271,6 +273,14 @@ static void populate_physmap(struct memop_args *a)
>              }
>              else
>              {
> +                /*
> +                 * Avoid passing MEMF_force_heap_alloc down to
> +                 * alloc_domheap_pages() where the meaning would be the
> +                 * original MEMF_no_refcount.
> +                 */
> +                if ( unlikely(a->memflags & MEMF_force_heap_alloc) )
> +                    clear_bit(_MEMF_force_heap_alloc, &a->memflags);

Why an atomic operation? &= will to quite fine here. And you can also
drop the if().

> @@ -1408,6 +1418,10 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( copy_from_guest(&reservation, arg, 1) )
>              return start_extent;
>  
> +        if ( op != XENMEM_populate_physmap
> +             && (reservation.mem_flags & XENMEMF_force_heap_alloc) )
> +            return -EINVAL;
> +
>          /* Is size too large for us to encode a continuation? */
>          if ( reservation.nr_extents > (UINT_MAX >> MEMOP_EXTENT_SHIFT) )
>              return start_extent;
> @@ -1433,6 +1447,10 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>               && (reservation.mem_flags & XENMEMF_populate_on_demand) )
>              args.memflags |= MEMF_populate_on_demand;
>  
> +        if ( op == XENMEM_populate_physmap
> +             && (reservation.mem_flags & XENMEMF_force_heap_alloc) )
> +            args.memflags |= MEMF_force_heap_alloc;

If in the end no new sub-op is used (see below), this and the earlier if()
want combining.

You further may want to assert that the flag isn't already set (as coming
back from construct_memop_from_reservation()).

> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -41,6 +41,11 @@
>  #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
>  /* Flag to indicate the node specified is virtual node */
>  #define XENMEMF_vnode  (1<<18)
> +/*
> + * Flag to force populate physmap to use pages from domheap instead of 1:1
> + * or static allocation.
> + */
> +#define XENMEMF_force_heap_alloc  (1<<19)

As before, a separate new sub-op would look to me as being the cleaner
approach, avoiding the need to consume a bit position for something not
even going to be used on all architectures.

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -192,6 +192,13 @@ struct npfec {
>  /* memflags: */
>  #define _MEMF_no_refcount 0
>  #define  MEMF_no_refcount (1U<<_MEMF_no_refcount)
> +/*
> + * Alias of _MEMF_no_refcount to avoid introduction of a new, single-use flag.
> + * This flag should be used for populate_physmap() only as a re-purposing of
> + * _MEMF_no_refcount to force a non-1:1 allocation from domheap.
> + */
> +#define _MEMF_force_heap_alloc _MEMF_no_refcount
> +#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)

Given its purpose and scope, this alias wants to be local to common/memory.c.

Jan

