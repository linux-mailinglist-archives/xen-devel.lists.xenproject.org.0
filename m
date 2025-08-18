Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C4B29FE7
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 13:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085910.1444166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unxcA-0003ZQ-NG; Mon, 18 Aug 2025 11:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085910.1444166; Mon, 18 Aug 2025 11:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unxcA-0003Xd-JE; Mon, 18 Aug 2025 11:01:22 +0000
Received: by outflank-mailman (input) for mailman id 1085910;
 Mon, 18 Aug 2025 11:01:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unxc9-0003XX-0a
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 11:01:21 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a587ca01-7c22-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 13:01:09 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7aea37cso499213566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 04:01:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd016ad2sm782422066b.99.2025.08.18.04.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 04:01:08 -0700 (PDT)
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
X-Inumbo-ID: a587ca01-7c22-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755514869; x=1756119669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4BJURpgMVEUlbZpRU1UuPujjvaDwapeZHZZROZ/10Q0=;
        b=egx0hXVDaqcRE8R5ExBln2pV8U5M5x8sDmByX8/7Ue+fQ+Bhmur8RXP4xJzgUVH04P
         +0UTxVKsWrSYMGS8p0BMdBmNWDGzS/Lj/WcOG4viwyd8RNuhq/4OZFWh8ZToXdngQpKt
         TS2XUrDnLEeRAZnQ19nTsXe8uzAa8qN+1Lsn/Ca0HZxwSnwq6MYeTygyRsjTxt3oEHnR
         dGtksL/bG0ZI2RnOnIVmXebWj2leraT0DE2UwY666gs0Y1FzoFVlQ1jzPiXzbFzOyEKz
         c3Anopjx5VV5VKh6qhktsIhGa9aPePNDSue+mZ5h/D5vD3h+1YV14YnIRAXCN1fpftM3
         AVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514869; x=1756119669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BJURpgMVEUlbZpRU1UuPujjvaDwapeZHZZROZ/10Q0=;
        b=MhLuy+gZgDv1Kio4wM1lG2GA5FHhGuaw7W35L2D34UOIVJargQu95uHmVcHyoBU7Dz
         eJaHcCcbMbnwYRBD8a2eBlPCu6QbPwmWzE832v2CgySA1FdRGNS7uSOKsUzmaDrbRI01
         iseqi/Z8tL1HHLZTbWWq6tN6NnubDs78HhLfy7fZHR9UY+6dm5Pcn+VkxM/IO9jQqKEe
         oJkpzzd4IdLLS7beaDUVfmZalGXShPDqR29LZSeFGP1hVn7WZflHwrQrL/Xgc/uAEKyn
         O3G7Jvxx2LN7rsKwQXSJNMxej+g8xvMQQufTSzbe9iJNfe/iUs2cv/sXbdS2tkXa8BEq
         191w==
X-Forwarded-Encrypted: i=1; AJvYcCXfqgHzuDbFac/ycfQ7i3vwS50jj7CuKiVVVIcgZ+Z/ElJpsqULWIF3EiUt7LryBpgPuN6OOcRx+nU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtwQuI/Il08kJU0/n/j7q3qfjNHUND24lzZBfdRtOfEAAjXLhR
	Hn0mAelmT+vVaJUailpiQ4JwzkxNe3JYr0NySQCxXENVCDvAQOlKBW+JOJN8aC3NcQ==
X-Gm-Gg: ASbGncvsAjdMb6biomRE/+PiruXSRhpLKmgEgfBelEfr/X4GMIabAEGuE+I143k/R34
	LCCdZYb+tcVfRmKC0QjkuvenMAyAPj/VMIkM7QqaNPFmgRr4QrYX7zYCJ8ihhqEwnUqkm0RbzJK
	HE9/p+mgfro1Hx8tN2IlhvNB2apqM0tC2Osol7iaVkAb8UZsGzfITbxFz6/7MwrCtYLIQMvyj02
	9uYMR3BYjWVIvVG+4oaK3vPg0XwupbLsE2kFIwTx8Yu2fgrdzpDpQTL/9wWprii5XG2e8VCg00q
	zOOqLnQzFY9nEJrUsAmlg66Vu/X6K6ayymE5nzvBFt1Ko4bCpc1BT1WaRjQtRWdPuAUMnZjMOoN
	L9SWuCdw32aRpslK4vFR1Cl1KecYU/G30zOqq8aZsOkw/e1unkAHGxwQz/I7/P9yV4UuZS5eF9V
	ac4v9uVDmvZ2lmoDQHJQ==
X-Google-Smtp-Source: AGHT+IFVAAytPel9ZMuCKy7P0wnGFRFCmcx+X/8+aMy5CR5wHNWdMJev/GUyPJ5UI8Tbpuw3Gwdb9A==
X-Received: by 2002:a17:907:2d27:b0:af9:6bfb:58b7 with SMTP id a640c23a62f3a-afcdc03c4acmr1038418466b.5.1755514868755;
        Mon, 18 Aug 2025 04:01:08 -0700 (PDT)
Message-ID: <a3129918-d053-4243-b52d-2622dfd4a725@suse.com>
Date: Mon, 18 Aug 2025 13:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] pdx: introduce a new compression algorithm based on
 region offsets
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250812150624.64898-1-roger.pau@citrix.com>
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
In-Reply-To: <20250812150624.64898-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.08.2025 17:06, Roger Pau Monne wrote:
> With the appearance of Intel Sierra Forest and Granite Rapids it's now
> possible to get a production x86 host with the following memory map:
> 
> SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
> SRAT: Node 0 PXM 0 [0000000100000000, 000000807fffffff]
> SRAT: Node 1 PXM 1 [0000063e80000000, 000006be7fffffff]
> SRAT: Node 2 PXM 2 [00000c7e80000000, 00000cfe7fffffff]
> SRAT: Node 3 PXM 3 [000012be80000000, 0000133e7fffffff]
> 
> This is from a four socket Granite Rapids system, with each node having
> 512GB of memory.  The total amount of RAM on the system is 2TB, but without
> enabling CONFIG_BIGMEM the last range is not accessible, as it's above the
> 16TB boundary covered by the frame table. Sierra Forest and Granite Rapids
> are socket compatible, however Sierra Forest only supports 2 socket
> configurations, while Granite Rapids can go up to 8 sockets.
> 
> Note that while the memory map is very sparse, it couldn't be compressed
> using the current PDX_MASK compression algorithm, which relies on all
> ranges having a shared zeroed region of bits that can be removed.
> 
> The memory map presented above has the property of all regions being
> similarly spaced between each other, and all having also a similar size.
> Use a lookup table to store the offsets to translate from/to PFN and PDX
> spaces.  Such table is indexed based on the input PFN or PDX to translated.
> The example PFN layout about would get compressed using the following:
> 
> PFN compression using PFN lookup table shift 29 and PDX region size 0x10000000
>  range 0 [0000000000000, 0x0000807ffff] PFN IDX  0 : 0000000000000
>  range 1 [0x00063e80000, 0x0006be7ffff] PFN IDX  3 : 0x00053e80000
>  range 2 [0x000c7e80000, 0x000cfe7ffff] PFN IDX  6 : 0x000a7e80000
>  range 3 [0x0012be80000, 0x00133e7ffff] PFN IDX  9 : 0x000fbe80000
> 
> Note how the tow ranges belonging to node 0 get merged into a single PDX
> region by the compression algorithm.
> 
> The default size of lookup tables currently set in Kconfig is 64 entries,
> and the example memory map consumes 10 entries.  Such memory map is from a
> 4 socket Granite Rapids host, which in theory supports up to 8 sockets
> according to Intel documentation.  Assuming the layout of a 8 socket system
> is similar to the 4 socket one, it would require 21 lookup table entries to
> support it, way below the current default of 64 entries.
> 
> The valid range of lookup table size is currently restricted from 1 to 512
> elements in Kconfig.
> 
> An extra array is used to keep track of the base PFN for each translated
> range.  Non used slots are set to ~0UL, so that in mfn_valid() the mfn <
> base check always fails, thus reporting the mfn as invalid.
> 
> Introduce __init_or_pdx_mask and use it on some shared functions between
> PDX mask and offset compression, as otherwise some code becomes unreachable
> after boot if PDX offset compression is used.  Mark the code as __init in
> that case, so it's pruned after boot.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one cosmetic remark (sorry for not spotting this earlier):

> --- a/tools/tests/pdx/harness.h
> +++ b/tools/tests/pdx/harness.h
> @@ -44,8 +44,10 @@
>  
>  #define MAX_RANGES 16
>  #define MAX_PFN_RANGES MAX_RANGES
> +#define CONFIG_PDX_OFFSET_TBL_ORDER 6
>  
>  #define ASSERT assert
> +#define ASSERT_UNREACHABLE() assert(0)
>  
>  #define CONFIG_DEBUG
>  
> @@ -66,10 +68,22 @@ static inline unsigned int find_next(
>  #define find_next_zero_bit(a, s, o) find_next(a, s, o, false)
>  #define find_next_bit(a, s, o)      find_next(a, s, o, true)
>  
> +#define flsl(x) ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
> +#define ffsl(x) __builtin_ffsl(x)
> +
>  #define boolean_param(name, func)
>  
>  typedef uint64_t paddr_t;
>  
> +#define SWAP(a, b) \
> +   do { typeof(a) t_ = (a); (a) = (b); (b) = t_; } while ( 0 )
> +
> +#define sort(elem, nr, size, cmp, swp) ({                               \
> +    /* Consume swp() so compiler doesn't complain it's unused. */       \
> +    (void)swp;                                                          \

It generally shouldn't matter here, yet maybe still better to parenthesize swp.

Jan

