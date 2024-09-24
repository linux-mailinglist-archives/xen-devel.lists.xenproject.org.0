Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E06F98474A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 16:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802967.1213328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6Cd-0008Ok-M4; Tue, 24 Sep 2024 14:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802967.1213328; Tue, 24 Sep 2024 14:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6Cd-0008M1-J5; Tue, 24 Sep 2024 14:07:43 +0000
Received: by outflank-mailman (input) for mailman id 802967;
 Tue, 24 Sep 2024 14:07:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st6Cc-0008Lv-9T
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 14:07:42 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c8fe5e1-7a7e-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 16:07:41 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2f758f84dfbso44273671fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 07:07:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf48c437sm796439a12.5.2024.09.24.07.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 07:07:39 -0700 (PDT)
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
X-Inumbo-ID: 5c8fe5e1-7a7e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727186860; x=1727791660; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JWs7A3Sz7GxSsBJgpbMO5rK3bHTeforAYXiNEAYM/wQ=;
        b=Hj1kKUcKMHNEZ3d6iqdmQuJH0Fc4SEdMW5s0zsj3y2SP5fKNMLHmk6l7S0GkbOjJ8R
         SE3uvK3jZMmycHiIl86EDzHaIbC7kP/1HAiVppGB6E96ZQGHWM7VeftFl339E4EQfiZh
         ApLKRMuBPbcB9BB2qlbLW6UxMCCxtHzQ+dsqEdGOMTXcmcefstV1Rk5uVXPHEXSmbKPN
         amcFaL3FmBSolKJy88Z3f1fHJ2q5SS1Tp9Me/bNgOmCINyMOhvrNLb2Mb8RuUK7sAQM0
         DT/RQEscX+EKfXtAsvLVWvcsMVfG0Sb69VF4VT4XBYqbopEHtJ28odwfCS4iSVGYWL6J
         NmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727186860; x=1727791660;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWs7A3Sz7GxSsBJgpbMO5rK3bHTeforAYXiNEAYM/wQ=;
        b=FzU9E/eJG3dhFpf3ZnrnfM53lcCzY63HJ2JYuSWpL3OkrMd6GSjJZ2T0bXfMYYA0Ww
         g7GsZRddn6XWV2fs18Nr0apkw+SWA8MIXpum4AZ4cXvjPAqFWFysq487Ev6r8TiAM6go
         3EcbnwN95HS8bLxI51EDU1o2PpcvM10CYcqQy+pHc7reOBlMGuT13iJOkb3DuguCFWzI
         yriMUwkZ+eOZ5OAk0y7N6O5fAOk7GsOpNUr85T3do/NDRq6fHXhEwr4yFVCPBWi0vzls
         7c8/MgIB9N+Mt8uVvq32EHwDCueERXeG0niiVmSCowVgL6a8zClNEXYxC6ptjTsUWcT6
         xKBA==
X-Forwarded-Encrypted: i=1; AJvYcCXk2cTjP5R3NH7Vm9/lOoPueIzmUk2KwvCa/x1FrvUwisA1Ytjw/erXHY0DWc0whQ6rLESTXfz6iLI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtrQv9FsJv/upyKKXUwl2DvAh8+HG5cIb4EchNvaDy9WB345cQ
	wwiOsO9PexXfmQu+ichrEPLebJCiPAv2ZLCLS86TnH7KWGSr5xFCCkKCuE53Bg==
X-Google-Smtp-Source: AGHT+IGwtck/YyVftHnT+84GhpakV2mWBPhVaURNhl4wpw7E5QyA+5bV5v28I4NnaKswmIIwx2TQ3A==
X-Received: by 2002:a05:6512:3a8d:b0:530:ae22:a6f0 with SMTP id 2adb3069b0e04-536ac2d6358mr8635504e87.5.1727186860223;
        Tue, 24 Sep 2024 07:07:40 -0700 (PDT)
Message-ID: <ad54bd8d-b780-4ee0-a3a6-c7dd4e7b3500@suse.com>
Date: Tue, 24 Sep 2024 16:07:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix XEN_SYSCTL_numainfo[node].memsize for memory holes
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240924101400.5186-1-bernhard.kaindl@cloud.com>
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
In-Reply-To: <20240924101400.5186-1-bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2024 12:14, Bernhard Kaindl wrote:
> Fix a long-standing issue (known at since 2014) with the numainfo call.
> 
> The Hypercall `XEN_SYSCTL_numainfo` returns `memsize` for each NUMA node:
> 
> xl info -n:
> node:    memsize    memfree    distances
>    0:  -> 67584 <-   60672      10,21  <- memsize is off by 2048 MB
>    1:     65536      60958      21,10
> 
> So far, `memsize` is calculated from `NODE_DATA->node_spanned_pages`.
> It includes memory holes, leading to wrong memsize on x86.

Depending on what "memsize" means, it is or is not wrong that way. I'm
not sure we can change it like that, at the very least not without
bumping the interface version and proving that in-tree uses (if any)
are either unaffected or improved.

> This patch gets the sum of E820_RAM entries for each NUMA node on boot,
> stores it in NODE_DATA->node_present_pages and uses it for `memsize`.
> 
> It also increases it like `total_pages` on memory_add() for memory hotplug.
> 
> The new NODE_DATA->node_present_pages can be slighly lower than the
> physical node's RAM due to reserved memory for some of the NUMA nodes.

The introduction and maintenance of ->node_present_pages wants to be a
separate, prereq change imo.

> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -1333,6 +1333,8 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
>      /* We can't revert any more */
>      share_hotadd_m2p_table(&info);
>      transfer_pages_to_heap(&info);
> +    /* Update the node's present pages (like the total_pages of the system) */
> +    NODE_DATA(node)->node_present_pages += epfn - spfn;

Nit: Blank line ahead of the insertion please.

> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -504,10 +504,22 @@ void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
>  {
>      unsigned long start_pfn = paddr_to_pfn(start);
>      unsigned long end_pfn = paddr_to_pfn(end);
> +    paddr_t map_start, map_end;
> +    int i = 0, err;

arch_get_ram_range()'s first parameter is unsigned int.

>      NODE_DATA(nodeid)->node_start_pfn = start_pfn;
>      NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
>  
> +    /* Add RAM pages within the node to get the present pages for memsize infos */
> +    NODE_DATA(nodeid)->node_present_pages = 0;
> +    while ( (err = arch_get_ram_range(i++, &map_start, &map_end)) != -ENOENT ) {
> +        if ( err || map_start >= end || map_end <= start )
> +            continue;  /* Skip non-RAM and maps outside of the node's memory range */
> +        /* Add memory that is in the node's memory range (within start and end): */
> +        map_start = max(map_start, start);
> +        map_end = min(map_end, end);
> +        NODE_DATA(nodeid)->node_present_pages += (map_end - map_start) >> PAGE_SHIFT;
> +    }

Style (whole block): Brace placement, line length.

I'm also not convinced the actual calculation is correct: Neither map_start
nor map_end need to be page aligned aiui, and hence the present result doesn't
necessarily give the actual number of pages (that are usable, and hence
meaningful to the consumer of the field).

Blank line here please.

> @@ -675,7 +687,7 @@ static void cf_check dump_numa(unsigned char key)
>          mfn_t mfn = _mfn(node_start_pfn(i) + 1);
>  
>          printk("NODE%u start->%lu size->%lu free->%lu\n",
> -               i, node_start_pfn(i), node_spanned_pages(i),
> +               i, node_start_pfn(i), node_present_pages(i),

"size" here really can mean two things. I'd suggest to keep printing
node_spanned_pages() and add printing of node_present_pages().

Jan

