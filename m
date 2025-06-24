Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05615AE6C4E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 18:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023928.1399990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6Jy-0004Pm-Tg; Tue, 24 Jun 2025 16:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023928.1399990; Tue, 24 Jun 2025 16:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6Jy-0004NT-Qp; Tue, 24 Jun 2025 16:16:30 +0000
Received: by outflank-mailman (input) for mailman id 1023928;
 Tue, 24 Jun 2025 16:16:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU6Jx-0004NM-2Y
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 16:16:29 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94296399-5116-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 18:16:26 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so2871015f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 09:16:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d860aeacsm109511055ad.119.2025.06.24.09.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 09:16:25 -0700 (PDT)
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
X-Inumbo-ID: 94296399-5116-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750781786; x=1751386586; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oT/Ii2+4GWo8Jygo9rxc/j+w8imMtzdp5Iq2z0ArJ2k=;
        b=QSvmkUWkKeHkwLauyhI2wR6PbCjDAQMEYCCHgilTK1eM9vOqMVji/obCNd9MT5aSxs
         ivDgNci7khaEXWgpOxq8G6xaSKAZWwfj8BMRRoK7MR5IgW6JTzrKFKqdu1G/0FYGSSzR
         3x4hUqphDdPovfjmDg8SxG1zHHRuYfO4VUsvKTDuvvUrYwXw8msRAotPZoBqqWkk8z30
         cZCgnD1fIxKhNRTfdNgS9ckzpGc7vJRq9O0aC8PcXM21pC4tYTUTyWRT/l9ztdvSHaum
         BkKew8DWSUlvRX3bs05JCVVfAH31Qg+TCa6qqy6ylvC4SR5lKltS14IsWkv+YWlNYLWm
         Te/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781786; x=1751386586;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oT/Ii2+4GWo8Jygo9rxc/j+w8imMtzdp5Iq2z0ArJ2k=;
        b=RWQdZOU4goqETAO4nRojqRMbN3TWZqz3uDm9+BeiT+WxFKpEOUcKoNOIqXhbxjU3dM
         fb+HMzbTj626MfpleDb5qwYNcZhBPGv+O5GzgEmRfxcghCGvmE9GS/2DNVEvqF+Up0/x
         uSTlAwS1qvo6mHmemIh9qQwk32X0Ju97KJRYPgsen9m+ee4TNjkAdCUuNKOqqdrAKBzU
         suL9PZ2Sz7PzeAGsAUwE/iQYPf7vDqGj9rUp9/h6WhSefgKKVB9JnK1D3ZkD/RoS+HWs
         cXZh7k7q3REYSF8AS3pmlSAOM5CGcNtr1cYcO+J4zqckGTtIQ6WVuEADcUOpqTJiFkek
         IGFA==
X-Forwarded-Encrypted: i=1; AJvYcCXwFVksg89CYOauRTGahoMLwtKSziwe1Uahl3ukLMeib0RzA7BMm2U4SfC5i3YOCAqrmCWIOsfpLPo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBAWiNlBnvNPOpbMcu64cP8MRpzZLd/IM6FZGv2G0cjOpszNNh
	qsJFLDi3Xwn59ttO8jyWxXE80x0OpytsxwAtjr1nqH/cWxHyqkp64QYyRUCYxLxQxg==
X-Gm-Gg: ASbGncsYIQsoVORsAN4JBTgFzy4CkPDCh6sU9snZzlzelsqlyA6sS2at2MNVDgd7Qx7
	SQWDnTpHF2YcvHuvPWyeUg3Z8GWHHc6OcYyvJ1ZKPY49vd+f6IadpV0sJY/u52m29gyVdlXNLZZ
	lPCkCHZLzjHT6GMPB1gB1/q9KdNyo/6jPJjh8ECu27ib5gxYaaErQNwu3WD2s7Woz6a7jE5TDGq
	qs1CxVfGUk0q/G5uk9HWScx7+sRomesn0xQG14fQ01InV0YjgFpfJKLvnW2GFx12TqOh0o+broD
	CdRDvyl3asNKXT/Nf0XwSyHKVmsg16fJqazhjOpgoBnXBiay+L9ikw1dNN9DTUkAwywKJ0PL/QI
	7r9GciUFV0V2l7ejzmKSU62zcOJXYssvYjoGnmw5uyVxPgQ8=
X-Google-Smtp-Source: AGHT+IEjqM71Tw1eMGfZVe8z2+2MTh3rhR2gsunrL1uv3fkYyB2/d6tzjFrSOWVwVGEdKssJ0ofITA==
X-Received: by 2002:a05:6000:491a:b0:3a5:39e9:928d with SMTP id ffacd0b85a97d-3a6d1166d39mr16688472f8f.0.1750781785864;
        Tue, 24 Jun 2025 09:16:25 -0700 (PDT)
Message-ID: <e0339b2b-86cd-45ad-9b6f-a5e8ddbc623c@suse.com>
Date: Tue, 24 Jun 2025 18:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] pdx: introduce a new compression algorithm based
 on region offsets
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-9-roger.pau@citrix.com>
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
In-Reply-To: <20250620111130.29057-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.06.2025 13:11, Roger Pau Monne wrote:
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
> Unused lookup table entries are set to all ones (~0UL), so that we can
> detect whether a pfn or pdx is valid just by checking whether its
> translation is bi-directional.  The saturated offsets will prevent the
> translation from being bidirectional if the lookup table entry is not
> valid.

Right, yet with the sad effect of still leaving almost half the space unused.
I guess that's pretty much unavoidable though in this scheme, as long as we
want the backwards translation to also be "simple" (and in particular not
involving a loop of any kind).

> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -20,6 +20,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>       grant table or foreign memory.
>  
>  ### Added
> + - Introduce new PDX compression algorithm to cope with Intel Sapphire and
> +   Granite Rapids having sparse memory maps.

In the description you updated to mention Sierra Forest instead, but here you
didn't.

> --- a/tools/tests/pdx/harness.h
> +++ b/tools/tests/pdx/harness.h
> @@ -44,8 +44,10 @@
>  
>  #define MAX_RANGES 8
>  #define MAX_PFN_RANGES MAX_RANGES
> +#define CONFIG_PDX_OFFSET_TLB_ORDER 6
>  
>  #define ASSERT assert
> +#define ASSERT_UNREACHABLE() assert(0);

Nit: Stray semicolon.

> @@ -66,6 +68,8 @@ static inline unsigned int find_next(
>  #define find_next_zero_bit(a, s, o) find_next(a, s, o, false)
>  #define find_next_bit(a, s, o)      find_next(a, s, o, true)
>  
> +#define flsl(x) ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)

While this is perhaps indeed good enough for a testing utility, ...

> @@ -75,6 +79,12 @@ static inline unsigned int find_next(
>  
>  typedef uint64_t paddr_t;
>  
> +#define sort(elem, nr, size, cmp, swp) {                                \
> +    /* Consume swp() so compiler doesn't complain it's unused. */       \
> +    (void)swp;                                                          \
> +    qsort(elem, nr, size, cmp);                                         \
> +}

... this I think wants to use either do/while of ({ }).

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -54,7 +54,8 @@ config EVTCHN_FIFO
>  
>  choice
>  	prompt "PDX (Page inDeX) compression"
> -	default PDX_MASK_COMPRESSION if !X86 && !RISCV
> +	default PDX_OFFSET_COMPRESSION if X86
> +	default PDX_MASK_COMPRESSION if !RISCV
>  	default PDX_NONE
>  	help
>  	  PDX compression is a technique designed to reduce the memory
> @@ -73,12 +74,30 @@ config PDX_MASK_COMPRESSION
>  	help
>  	  Compression relying on all RAM addresses sharing a zeroed bit region.
>  
> +config PDX_OFFSET_COMPRESSION
> +	bool "Offset compression"
> +	help
> +	  Compression relying on size and distance between RAM regions being
> +	  compressible using an offset lookup table.
> +
>  config PDX_NONE
>  	bool "None"
>  	help
>  	  No compression
>  endchoice
>  
> +config PDX_OFFSET_TLB_ORDER

Please can we avoid the term "TLB" in the name? What we commonly call a TLB
is somewhat different. In fact is there anything wrong with just
PDX_OFFSET_ORDER?

> +	int "PDX offset compression lookup table order" if EXPERT
> +	depends on PDX_OFFSET_COMPRESSION
> +	default 6
> +	range 0 9

Is 0 really a sensible lower bound? There's not going to be any compression
then, I suppose?

> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -24,6 +24,7 @@
>  #include <xen/param.h>
>  #include <xen/pfn.h>
>  #include <xen/sections.h>
> +#include <xen/sort.h>
>  
>  /**
>   * Maximum (non-inclusive) usable pdx. Must be
> @@ -40,6 +41,8 @@ bool __mfn_valid(unsigned long mfn)
>  
>  #ifdef CONFIG_PDX_MASK_COMPRESSION
>      invalid |= mfn & pfn_hole_mask;
> +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION)
> +    invalid |= mfn ^ pdx_to_pfn(pfn_to_pdx(mfn));

Hmm, that's pretty expensive already. Involving two (presumably back-to-back)
JMPs when compression isn't enabled.

> @@ -290,7 +300,200 @@ void __init pfn_pdx_compression_reset(void)
>      nr_ranges = 0;
>  }
>  
> -#endif /* CONFIG_PDX_COMPRESSION */
> +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
> +
> +unsigned long __ro_after_init pfn_pdx_lookup[CONFIG_PDX_NR_LOOKUP];
> +unsigned int __ro_after_init pfn_index_shift;
> +
> +unsigned long __ro_after_init pdx_pfn_lookup[CONFIG_PDX_NR_LOOKUP];
> +unsigned int __ro_after_init pdx_index_shift;

For slightly better cache locality when only a few array indexes are in
use, may I suggest to put the indexes ahead of the arrays? Perhaps even
together, as they both take up a single unsigned long slot.

> +bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
> +{
> +    unsigned long pfn = PFN_DOWN(base);
> +
> +    return pdx_to_pfn(pfn_to_pdx(pfn) + npages - 1) == (pfn + npages - 1);

Aiui for this to be correct, there need to be gaps between the ranges
covered by individual lookup table slots. In the setup logic you have a
check commented "Avoid compression if there's no gain", but that doesn't
look to guarantee gaps everywhere (nor would pfn_offset_sanitize_ranges()
appear to)?

> +static void __init cf_check swp_node(void *a, void *b, size_t size)
> +{
> +    struct pfn_range *l = a;
> +    struct pfn_range *r = b;
> +    struct pfn_range tmp = *l;
> +
> +    *l = *r;
> +    *r = tmp;
> +}

Any reason you effectively open-code SWAP() here?

> +static bool __init pfn_offset_sanitize_ranges(void)
> +{
> +    unsigned int i = 0;
> +
> +    if ( nr_ranges == 1 )
> +    {
> +        ASSERT(PFN_TBL_IDX_VALID(ranges[0].base));
> +        ASSERT(PFN_TBL_IDX(ranges[0].base) ==
> +               PFN_TBL_IDX(ranges[0].base + ranges[0].size - 1));
> +        return true;
> +    }
> +
> +    /* Sort nodes by start address. */
> +    sort(ranges, nr_ranges, sizeof(struct pfn_range), cmp_node, swp_node);

Better sizeof(*ranges) or sizeof(ranges[0])?

> +bool __init pfn_pdx_compression_setup(paddr_t base)
> +{
> +    unsigned long size = 0, mask = PFN_DOWN(pdx_init_mask(base));
> +    unsigned int i;
> +
> +    if ( !nr_ranges )
> +        return false;

Also bail if there's just a single range?

> +    if ( nr_ranges > ARRAY_SIZE(ranges) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Too many PFN ranges (%u > %zu), not attempting PFN compression\n",
> +               nr_ranges, ARRAY_SIZE(ranges));
> +        return false;
> +    }
> +
> +    for ( i = 0; i < nr_ranges; i++ )
> +        mask |= pdx_region_mask(ranges[i].base, ranges[i].size);
> +
> +    pfn_index_shift = flsl(mask);

With this ...

> +    /*
> +     * Increase the shift as much as possible, removing bits that are equal in
> +     * all regions, as this allows the usage of smaller indexes, and in turn
> +     * smaller lookup tables.
> +     */
> +    for ( pfn_index_shift = flsl(mask); pfn_index_shift < sizeof(mask) * 8 - 1;

... you don't need to do this here another time.

Also - why the subtraction of 1 in what the shift is compared against? Logic
below should in principle guarantee we never exit the loop because of the
conditional above, but if we made it that far it looks like we could as well
also look at the top bit.

> +          pfn_index_shift++ )
> +    {
> +        const unsigned long bit = ranges[0].base & (1UL << pfn_index_shift);
> +
> +        for ( i = 1; i < nr_ranges; i++ )
> +            if ( bit != (ranges[i].base & (1UL << pfn_index_shift)) )
> +                break;
> +        if ( i != nr_ranges )
> +            break;
> +    }
> +
> +    /* Sort and sanitize ranges. */
> +    if ( !pfn_offset_sanitize_ranges() )
> +        return false;
> +
> +    /* Calculate PDX region size. */
> +    for ( i = 0; i < nr_ranges; i++ )
> +        size = max(size, ranges[i].size);
> +
> +    mask = PFN_DOWN(pdx_init_mask(size << PAGE_SHIFT));
> +    pdx_index_shift = flsl(mask);
> +
> +    /* Avoid compression if there's no gain. */
> +    if ( (mask + 1) * (nr_ranges - 1) >= ranges[nr_ranges - 1].base )
> +        return false;
> +
> +    /* Poison all lookup table entries ahead of setting them. */
> +    memset(pfn_pdx_lookup, ~0, sizeof(pfn_pdx_lookup));
> +    memset(pdx_pfn_lookup, ~0, sizeof(pfn_pdx_lookup));

Have the arrays have initializers instead?

> +    for ( i = 0; i < nr_ranges; i++ )
> +    {
> +        unsigned int idx = PFN_TBL_IDX(ranges[i].base);
> +
> +        pfn_pdx_lookup[idx] = ranges[i].base - (mask + 1) * i;
> +        pdx_pfn_lookup[i] = pfn_pdx_lookup[idx];
> +    }
> +
> +    printk(XENLOG_INFO
> +           "PFN compression using PFN lookup table shift %u and PDX region size %#lx\n",

I'd drop PFN and the latter PDX from this format string.

> +           pfn_index_shift, mask + 1);
> +
> +    for ( i = 0; i < nr_ranges; i++ )
> +        printk(XENLOG_DEBUG
> +               " range %u [%#013lx, %#013lx] PFN IDX %3lu : %#013lx\n",
> +               i, ranges[i].base, ranges[i].base + ranges[i].size - 1,
> +               PFN_TBL_IDX(ranges[i].base),
> +               pfn_pdx_lookup[PFN_TBL_IDX(ranges[i].base)]);

Do you really mean this to stay active also in release builds?

Also the outcome of the earlier loop isn't used by the intermediate printk().
Perhaps join both loops, thus allowing idx to be re-used here?

> +    return true;
> +}
> +
> +void __init pfn_pdx_compression_reset(void)
> +{
> +    memset(pfn_pdx_lookup, 0, sizeof(pfn_pdx_lookup));
> +    memset(pdx_pfn_lookup, 0, sizeof(pfn_pdx_lookup));

Why not ~0?

> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -65,6 +65,43 @@
>   * This scheme also holds for multiple regions, where HHHHHHH acts as
>   * the region identifier and LLLLLL fully contains the span of every
>   * region involved.
> + *
> + * ## PDX offset compression
> + *
> + * Alternative compression mechanism that relies on RAM ranges having a similar
> + * size and offset between them:
> + *
> + * PFN address space:
> + * ┌────────┬──────────┬────────┬──────────┐   ┌────────┬──────────┐
> + * │ RAM 0  │          │ RAM 1  │          │...│ RAM N  │          │
> + * ├────────┼──────────┼────────┴──────────┘   └────────┴──────────┘
> + * │<------>│          │
> + * │  size             │
> + * │<----------------->│
> + *         offset
> + *
> + * The compression reduces the holes between RAM regions:
> + *
> + * PDX address space:
> + * ┌────────┬───┬────────┬───┐   ┌─┬────────┐
> + * │ RAM 0  │   │ RAM 1  │   │...│ │ RAM N  │
> + * ├────────┴───┼────────┴───┘   └─┴────────┘
> + * │<---------->│
> + *   pdx region size
> + *
> + * The offsets to convert from PFN to PDX and from PDX to PFN are stored in a
> + * pair of lookup tables, and the index into those tables to find the offset
> + * for each PFN or PDX is obtained by shifting the to be translated address by
> + * a specific value calculated at boot:
> + *
> + * pdx = pfn - pfn_lookup_table[pfn >> pfn_shift]
> + * pfn = pdx + pdx_lookup_table[pdx >> pdx_shift]

I assume it's intentional (for simplicity) that you omit the index masking
here?

Jan

