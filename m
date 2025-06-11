Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2DEAD5F1B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 21:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012131.1390669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPRCx-0004QG-Fc; Wed, 11 Jun 2025 19:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012131.1390669; Wed, 11 Jun 2025 19:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPRCx-0004Ni-CQ; Wed, 11 Jun 2025 19:33:59 +0000
Received: by outflank-mailman (input) for mailman id 1012131;
 Wed, 11 Jun 2025 19:33:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lgg=Y2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uPRCw-0004Nc-HV
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 19:33:58 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 044c273d-46fb-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 21:33:57 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so977706f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 12:33:57 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df34sm16459878f8f.71.2025.06.11.12.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 12:33:56 -0700 (PDT)
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
X-Inumbo-ID: 044c273d-46fb-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749670437; x=1750275237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5JsoGL62RQJ9r2fyOteGK+drFZ6jycFYnsWD2toOcmc=;
        b=COC73TujK+w5zp3KtTb96QoQ9FnGQM4wAwIwCB43YfWyPeqc/AzXEQTscPb60NvoDF
         2237yoDvzyMSoGTFCxDt0tBCSPG6VonEZYfaClvql12kNgFDA4TZQ69d6j4BBilsUDAA
         gRGtC/OaV4Z5Sn+JLzUQt0jVK7yuJ3ZgE37es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749670437; x=1750275237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JsoGL62RQJ9r2fyOteGK+drFZ6jycFYnsWD2toOcmc=;
        b=FLHpqDP7JNhSSG1YlYViMfHRIsKywQvr1PkSH3WEw1AlNfG8Buqg6YoohKprofZiSr
         alDEyYlxHSncRpwx+2zMmjZYYKkwGRKCI7r7nDXH9CM3y+h8wzcX0RXMg7BBR1SBIRb8
         LxL49tTlGwarXbRVH5eGngCnKczSVg+OL/i8TMG9GKo/bSSR0nMpNMAkD7jrxH4kAMjn
         AbiSVzYA/Z3tVptOiO2RxHf4727XWTf7o8VZw9TFv3lAzSABp+N4ALWMKm7RTgXB/MQ+
         SK8cacX5QmbZY0ymBLfGKHvBewHrZpa5Kz+n1gLIf8rjGVXSQi0wrTXJLMtiKsVhqPBy
         NEug==
X-Forwarded-Encrypted: i=1; AJvYcCVJRCk4wFXFkV1r4F8MCGsUrsLMww+wpXpYsvyrCPGSxdPjnxqh1Wn/B1B3yTrrAsUYZEui2m5iMxU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmC7NiX3IhEr/aSQg1RBxDFNa/agL+u4LReBMvXWwsb+O/K6rk
	V+voN4gJggYDiqD2ajsz81cm9G2WlRhuz54tnj6L/A+l9v46W4yAQJy4ElLMWPDUomQ=
X-Gm-Gg: ASbGncv/6DiQYg23eLW/N3c/dGcMj5XOcs+hZGcNukzTp8CVNH0kb4Cm2tCSSYcLt3u
	UCx1XEfiVlTLXkEWWyDBh/PMwp4xHyyCKA9DIzu0qfMDtVXRYWCR7gL93txV0WCQXAiX0CrzbkE
	TXYV2HRakhC3cCLh/9aPBsa6DLzIrcdfv4TLOzY9VUOau9GhsjhPywjYXjKJSdNyXWkjyYE2oUo
	X7vHh+glFBQMmVvDQ9XsBBhMjQ8erlNyJclzq4z7BL11q48uVtXM6Tf3a04e981bsGOVL4eShsF
	gtuEW7xnQJnS0bF+tNzoj8/39binzrJ4F58XVbAIuHvspAgqevaqy4jPMFZyoriN9UcVHsN/yDY
	=
X-Google-Smtp-Source: AGHT+IHttYsJIehol+ehwjyF1O6UWf9/PtbB2L86L8sJLX+8NO9ZJk9ZM5jYrAPlidmv+Rb3qRHTJQ==
X-Received: by 2002:a05:6000:178d:b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3a5608135aemr524805f8f.23.1749670436553;
        Wed, 11 Jun 2025 12:33:56 -0700 (PDT)
Message-ID: <8e34ac22-d05b-4ef3-9e31-6e5663cc1dc5@citrix.com>
Date: Wed, 11 Jun 2025 20:33:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] pdx: introduce a new compression algorithm based on
 offsets between regions
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-7-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250611171636.5674-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/06/2025 6:16 pm, Roger Pau Monne wrote:
> With the appearance of Intel Sierra Forest and Granite Rapids it's not

s/not/now ?

The problem here is that it's very possible to get such a system.

It might be worth nothing that SRF and GNR are socket compatible, in
Birch Stream platforms, which is relevant to why they're similar in this
regard.

> possible to get a production x86 host wit the following memory map:
>
> SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
> SRAT: Node 0 PXM 0 [0000000100000000, 000000407fffffff]
> SRAT: Node 1 PXM 1 [0000061e80000000, 0000065e7fffffff]
> SRAT: Node 2 PXM 2 [00000c3e80000000, 00000c7e7fffffff]
> SRAT: Node 3 PXM 3 [0000125e80000000, 0000129e7fffffff]
>
> This is from a four socket system, with each node having 256GB of memory.
> The total amount of RAM on the system is 1TB, but without enabling
> CONFIG_BIGMEM the last range is not accessible, as it's above the 16TB
> boundary covered by the frame table.
>
> Note that while the memory map is very sparse, it won't be compressible
> using the current algorithm that relies on all ranges having a shared
> zeroed region of bits that can be removed.

", it couldn't be compressed using the current PDX_MASK compression
algorithm, which relies ..."


>
> The memory map presented above has the property of all regions being
> similarly spaced between each other, and all having also a similar size.
> This allows to compress them using the following formula:
>
>  pdx = (pfn % offset) + ((pfn / offset) * size)
>
> Where offset and size are two static coefficients calculated at
> initialization.
>
> Obtaining the optimum offset and size coefficients is the complicated part.
> In this patch I introduce two different algorithms, a fast one that works
> correctly when the offset and size between ranges is mostly equal.  If such
> fast algorithm doesn't work, or the resulting compression is not enough to
> avoid truncation of the maximum usable page, it's possible to attempt a
> brute force approach for calculating the coefficients.  This is also
> implemented in this patch as the slow variant.  I've attempted to restrict
> the number of iterations in the slow approach so it can exit early if no
> better coefficients can be found due to the input constrains (minimum
> region size).
>
> The patch here focuses on introducing the logic to calculate the
> compression coefficients, plus adding a unit test to exercise the logic
> easily from user-space in order to test different layouts and possibly
> improve the generation of the coefficients.  The added unit tests only
> covers the newly added compression, but could also be extended to cover the
> existing PDX mask compression.

Is it possible to split out the userspace harness into an earlier patch,
and e.g. do some token testing of PDX_MASK ?

That halves the size of this patch.

>
> Note the translation functions (pfn to pdx, maddr to direct map offset),
> are not implemented as part of this patch, an identity set of macros are
> added to satisfy the build requirements.  The patch is already long enough
> without those.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> We can discuss whether we want both the fast and the slow variants.  The
> slow (brute force) was added as a result of me playing with weird region
> layouts where the fast one didn't manage to compress, or the resulting
> coefficients had a poor compression ratio.  However at this point the
> slow variant has only proven helpful in synthetic cases, I haven't (yet?)
> seen a real host memory layout that would benefit from it.

I'm going to hold off on opinions until I've read the rest of the series.

One question through.  Can we round offset up to the next power of two,
so we can replace the divide with a shift?

size is not a nice power of two, but I guarantee you that hardware is
not doing this routing with a divide.

It would result in some holes in PDX space, but it is almost certainly
faster.

> diff --git a/tools/tests/pdx/harness.h b/tools/tests/pdx/harness.h
> new file mode 100644
> index 000000000000..3d31cf488daf
> --- /dev/null
> +++ b/tools/tests/pdx/harness.h
> @@ -0,0 +1,73 @@
> ...
> +#define sort(elem, nr, size, cmp, swp) {                                \
> +    /* Consume swp() so compiler doesn't complain it's unused. */       \
> +    swp(&elem[0], &elem[0], size);                                      \

(void)swp;   ?

> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 93ebfc29635e..e71908b99c14 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -258,7 +258,7 @@ void __init init_pdx(void)
>      unsigned int bank;
>  
>      for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> -        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size);
> +        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size, bank);
>  

I'd suggest plumbing bank down in a previous patch.

> diff --git a/xen/common/pdx.c b/xen/common/pdx.c
> index 7d14100224fe..f2cf60bbc3f8 100644
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -21,6 +21,15 @@
>  #include <xen/nospec.h>
>  #include <xen/pfn.h>
>  #include <xen/sections.h>
> +#include <xen/sort.h>
> +
> +#ifdef __XEN__ /* For building the file in user-space. */
> +
> +/*
> + * Use a define for the static keyword, we want to export some otherwise static
> + * functions for the unit tests.
> + */
> +#define STATIC static

Most unit testing gets around this problem with the test harness itself
doing

#include "path/to/pdx.c"

If you do this right, the only thing needed is some #ifndef
_TEST_HARNESS around the includes at a the top.

> +static int __init cf_check cmp_node(const void *a, const void *b)
> +{
> +    const struct pfn_range *l = a;
> +    const struct pfn_range *r = b;
> +
> +    if ( l->base > r->base )
> +        return 1;
> +    if ( l->base < r->base )
> +        return -1;
> +
> +    ASSERT_UNREACHABLE();

I'm not sure if this is appropriate.  It's perfectly reachable if both
->base's are the same, and it may interfere with the inlining heuristics
for sort().

What you mean is "there shouldn't be two nodes that look like this", and
I'm not sure that the middle of sort() is the place to check this properly.

AFAICT, The real property you want is "len[i] && base[i] + len[i] <=
base[i+1]".

~Andrew

