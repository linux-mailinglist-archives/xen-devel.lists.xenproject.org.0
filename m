Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F9EADED52
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 15:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019126.1395952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRsRE-0002En-NC; Wed, 18 Jun 2025 13:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019126.1395952; Wed, 18 Jun 2025 13:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRsRE-0002CB-KP; Wed, 18 Jun 2025 13:02:48 +0000
Received: by outflank-mailman (input) for mailman id 1019126;
 Wed, 18 Jun 2025 13:02:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRsRD-0002C0-M6
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 13:02:47 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87955d9b-4c44-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 15:02:46 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5534edc6493so7402932e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 06:02:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b319dc80726sm6692738a12.68.2025.06.18.06.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 06:02:44 -0700 (PDT)
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
X-Inumbo-ID: 87955d9b-4c44-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750251766; x=1750856566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9mxW8Ip0OJGiaE4zcQWftfcdMa53m9+kFOqq7fEAC7Y=;
        b=TxJOHIoaLopgM8Ms4rOgcEO/VEH2ZYNObZUjxuDDUmz/kqgLmkdJ2LPp8YeGfFzcUC
         L0IL8nIL5jO8rXwU3eyN+edUO/ZqwurKaH46uD8efchjB4f4a5GZ1F9faC79AG9LBAV9
         yUYqiSj828lslOKq2j0jG6pDV3QxjPSticEs6bHW5Exe6vqXMS72DVMlXpJEdKG7NYl9
         LVSPQOu3wivX+1AbdRpCJuqL8D0d15BQlxlyAG70eEqKgHmTpL4uQ2Zw8C5S/T4+khIX
         L61kw0lHAcJ9ite273eeaesQthTJ+krCjmpDYSkGnuGyUPZ0OsoUK29vRPJ8diTPc8pi
         bE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251766; x=1750856566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mxW8Ip0OJGiaE4zcQWftfcdMa53m9+kFOqq7fEAC7Y=;
        b=bxq2Wnq9imS+/MEPc4nqLokTuoYnu6YxHUqiA/wAPcL/tRghlP1B6ahkyIsHhUgIhv
         CohYfYE/bZ7m8JhbPL2z/eIkm40po8n9ryjvcT+V9dbA2InhRdyNDoipk0xaV5ARWUAy
         q1Bnzzfbzy7ZcrqQMJNEIlD0y8eisaUeMhaidgtnlVxRrizig4VJTl2XJqL0CEWxOfEf
         HQkZJcZt/znCYrcFdZjfCVAUcL0NIrMp1ThkepzPS94fxdMp29GwKKM/TFPi4kK2tWbX
         Q/gHgql24asPGAryuDmk/I2N/9XZWtzec3IwEdAGXm6I/dB8AOEmfnWcs+N83ssvQBWm
         3AIA==
X-Forwarded-Encrypted: i=1; AJvYcCXFWCSuW/NmUe2fOCul6oJZ5Agqn7K53xmAW43Taj2kXEy2nuwJLmL9wVRKSCMQXhSkrmkYZY3YeUo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOPfBGpIKSd15AcpsNikRqcC552LV3+TwtlYBMmML/ad6BSkkh
	2RJ+6TEa45kMIiaWWoQ6zP0OJJpzLLdaf2x5+8gIFaMCrELhqWzNzoUQWdws/HyZbg==
X-Gm-Gg: ASbGnct95XfWPolEJsVx9fPyZEuPuw5zo+IphlItwZlzWeGNV4TjKYAa0cbE8lE3Dco
	ENJzm11LI+EX+5z4pr0LO0oleEXR2WiL3sFEKeVCp2ib1N4e+NcbvRnwsUnCPdRMYnkJ0GTcne4
	j2QLbo83U0GTf+iTW+0S6vZ5EQgPlCfTizAG1HQA335MpjLDT/9dffcWqrN0HAIONY9h4XoJIQ3
	Jv8/Ah+uVunN6FoH8R0THR4pJZ2/VBlwapsbAZRbKYAg5QkLYjG/tHI7wuOfDBzphHegQdmaiwW
	KcjRUreIwQjUNyN3wVz5ltb1ifkiUTsxGrBVsLMkfohFFze5VSHuLwB4qh31LMc9qpcYzgycSgA
	mWKcKaPNfBeFEenYCfMnPg1R7OTSkSe5iX5H4RcZJNp7uX/M=
X-Google-Smtp-Source: AGHT+IHB5JKeDvRaqXdeKot7/rQXchhr/yB3zfkDGX6fvI9p0Yz7aItJdqWC3+MK3g6vFfnEbBQHYA==
X-Received: by 2002:a05:6512:b0a:b0:54f:bce6:63bd with SMTP id 2adb3069b0e04-553b6f62293mr4655492e87.54.1750251765332;
        Wed, 18 Jun 2025 06:02:45 -0700 (PDT)
Message-ID: <4e8efcc9-9721-450b-b27c-2caac4aedfb7@suse.com>
Date: Wed, 18 Jun 2025 15:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] pdx: introduce a new compression algorithm based on
 offsets between regions
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-7-roger.pau@citrix.com>
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
In-Reply-To: <20250611171636.5674-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2025 19:16, Roger Pau Monne wrote:
> With the appearance of Intel Sierra Forest and Granite Rapids it's not
> possible to get a production x86 host wit the following memory map:
> 
> SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
> SRAT: Node 0 PXM 0 [0000000100000000, 000000407fffffff]
> SRAT: Node 1 PXM 1 [0000061e80000000, 0000065e7fffffff]
> SRAT: Node 2 PXM 2 [00000c3e80000000, 00000c7e7fffffff]
> SRAT: Node 3 PXM 3 [0000125e80000000, 0000129e7fffffff]

Looks like these aren't the numbers that the test harness uses. The main
properties (relevant for the algorithms) look to be the same, though.

> ---
> We can discuss whether we want both the fast and the slow variants.  The
> slow (brute force) was added as a result of me playing with weird region
> layouts where the fast one didn't manage to compress, or the resulting
> coefficients had a poor compression ratio.  However at this point the
> slow variant has only proven helpful in synthetic cases, I haven't (yet?)
> seen a real host memory layout that would benefit from it.

I'm not convinced we need the slow variant right away. What exactly (if
anything) is going to be wanted/needed on future hardware we'll only really
know when such arrives. However, see also my comment on xen/pdx.h.

> @@ -297,7 +309,223 @@ void __init pfn_pdx_compression_reset(void)
>      pfn_pdx_hole_shift = 0;
>  }
>  
> -#endif /* CONFIG_PDX_COMPRESSION */
> +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
> +
> +unsigned long __ro_after_init pdx_offset = ~0UL;
> +unsigned long __ro_after_init pdx_size = ~0UL;
> +
> +static unsigned long __initdata top_pfn;
> +
> +bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
> +{
> +    return !pdx_size ? true
> +                     : (PFN_DOWN(base) % pdx_offset) + npages <= pdx_size;
> +}
> +
> +STATIC bool __init pfn_offset_calculate_fast(unsigned long base)
> +{
> +    unsigned long size = max((1UL << MAX_ORDER), base);

Since pfn_pdx_compression_setup(), where "base" originally comes from, has no
caller (yet), it's hard to follow what "base" is and why it would affect "size".

> +    unsigned long offset = ~0UL;
> +    unsigned int i;
> +
> +    if ( nr <= 1 )
> +        return false;
> +
> +    /* Calculate minimal offset between regions. */
> +    for ( i = 1; i < nr; i++ )
> +        offset = min(offset, ranges[i].base - ranges[i - 1].base);
> +
> +    /* Return early if offset is smaller than the minimum size. */
> +    if ( size >= offset )
> +        return false;

Comment and code are off by one with one another. I actually wonder whether, for
the scheme to be beneficial, there shouldn't be some threshold below which we
would also go without doing any compression.

> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -65,6 +65,31 @@
>   * This scheme also holds for multiple regions, where HHHHHHH acts as
>   * the region identifier and LLLLLL fully contains the span of every
>   * region involved.
> + *
> + * ## PDX offset compression
> + *
> + * Alternative compression mechanism that relies on RAM ranges having a similar
> + * size and offset between them:
> + *
> + * ┌────────┬──────────┬────────┬──────────┐   ┌────────┬──────────┐
> + * │ RAM 0  │          │ RAM 1  │          │...│ RAM N  │          │
> + * ├────────┼──────────┼────────┴──────────┘   └────────┴──────────┘
> + * │<------>│          │
> + * │  size             │
> + * │<----------------->│
> + *         offset
> + *
> + * The compression removes the holes between RAM regions:
> + *
> + * ┌────────┬────────┐   ┌────────┐
> + * │ RAM 0  │ RAM 1  │...│ RAM N  │
> + * ├────────┼────────┘   └────────┘
> + * │<------>│
> + *    size
> + *
> + * The compressed index is calculated as:
> + *
> + * index = (pfn % offset) + ((pfn / offset) * size)
>   */

Would be nice imo if the presentation here wouldn't give the impression that
the offsets are all identical, and hence the compressed map ends up being
entirely without holes. In fact I can't help the impression that with enough
nodes (but otherwise the same properties, i.e. only node 0 being special) at
least the "fast" calculation will fail. Which in turn would be an argument
to keep the "slow" one.

In fact, the alternative approach we discussed - avoiding division, but
using a table of offsets - would seem to avoid such a weakness, because the
offsets can then vary (to some degree; it still needs to be possible to
easily determine the table indexes).

Jan

