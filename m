Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A058F8455B5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 11:45:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674281.1049130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUZc-0000XP-9K; Thu, 01 Feb 2024 10:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674281.1049130; Thu, 01 Feb 2024 10:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUZc-0000V9-6j; Thu, 01 Feb 2024 10:45:36 +0000
Received: by outflank-mailman (input) for mailman id 674281;
 Thu, 01 Feb 2024 10:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVUZb-0000V2-Ao
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 10:45:35 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06d3df5d-c0ef-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 11:45:34 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-558f523c072so1060281a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 02:45:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dh8-20020a0564021d2800b0055f0b3ec5d8sm3675264edb.36.2024.02.01.02.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 02:45:33 -0800 (PST)
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
X-Inumbo-ID: 06d3df5d-c0ef-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706784333; x=1707389133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=36zQ2znP4kvPGoaJBxKSgCjs1iecbtwJ0jpIQ8VM5sM=;
        b=Di/Rw1OdfHBFgX9FwXAd0M/cffyCS9Gp/mLeBo3gMDfKy0Dt+N0fnCVprCV9GWx9nz
         w+IAslP8tn4fOFqgR6DB5Hw3aQFWJMgGP0wTPk/XAiBGFB4DDDSRRsb4F3ZggNF0M3+S
         QSkqRyvyZ9gUD9ieVLa835Ikleug9zH4gKQCbjwrA2L78icaqWXUSo3dU38B0KR7nUST
         v3Tgmg4Dgbvt/gjnYMlUefthmCyLMGnd4f67xStn9zRL6XDTF+m3OBBzGQeSVDIhszu7
         POmzDh2bEiWTL2N3N7WIoknJ1G0vkxlaxCe1wnypRcpL5SDwJuSlaaQ7R8Bf2+FhLsX+
         CrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706784333; x=1707389133;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=36zQ2znP4kvPGoaJBxKSgCjs1iecbtwJ0jpIQ8VM5sM=;
        b=YpCUPLc3ujlZU32ZJmiMy3iqhsImcdwQmILy2zxH9a8oYrqA/qczWyJrnKY1Wa0+Az
         TiZFBLpc2PpstaFmUxh4MDYrf5LMzpWcxD0PDuRfg+WGnRNszuesHt/mlrTcKXTTz2SA
         rHoWEuSq8aFB16wzWXSSwBmcXgVIKmc7bNVHcwejfcCHXxH6P17tO0BWbZexsUxgkswp
         VAoeJwTvqOU6q3Md9W7wamvmY+2HS6VUvq9wPsHv8qHAJX6X61tuEQuG2Te7UfdmciqD
         RXlUlabOiSIF+P7VGUv/kw2uyBcEptbx+L0nExNAt7xt09rOWRzH2B1ki0CEwDxV5BmA
         5Y4Q==
X-Gm-Message-State: AOJu0Yxbp8SI73KmoOEgAi4by0nlZdxSKbfWC0pdXUWAf52DibPDan8k
	Snrok3d3sVn0H5tCwEVgKTfHtKBT++2URq515nUNE49A5TBlVHLfyI1YA9f1pQ==
X-Google-Smtp-Source: AGHT+IHoKcEQI4G5dKMR9mfNE5wCzl3xe9xM2sdmat0isSflfGWkENqPDprgtmfVkSpMmKczQoqYnA==
X-Received: by 2002:a05:6402:3126:b0:55f:7b91:cbd5 with SMTP id dd6-20020a056402312600b0055f7b91cbd5mr3283824edb.8.1706784333612;
        Thu, 01 Feb 2024 02:45:33 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWnqi44md3/rfvumnOnsPaJCA87tDh4NdQ44RQilWZKSX4l1wjKYee6wY5TPWL3POn+igT3rDAnhBFIXKm2kiwdoy/g729lqytUkN1Ogd0HNOh7c/vgqzkioWC83osRUUYjrWLoBbo7MRERvMgMd6CT9uiDyYaR5K3p0ISmszv5XU63
Message-ID: <88b0e4bb-7f1c-4dc6-a22b-42c5dcd2ca46@suse.com>
Date: Thu, 1 Feb 2024 11:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/bitmap: Consistently use unsigned bits values
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240201103339.549307-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240201103339.549307-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.02.2024 11:33, Andrew Cooper wrote:
> Right now, most of the static inline helpers take an unsigned nbits quantity,
> and most of the library functions take a signed quanity.  Because
> BITMAP_LAST_WORD_MASK() is expressed as a divide, the compiler is forced to
> emit two different paths to get the correct semantics for signed division.
> 
> Swap all signed bit-counts to being unsigned bit-counts for the simple cases.
> This includes the return value of bitmap_weight().
> 
> Bloat-o-meter for a random x86 build reports:
>   add/remove: 0/0 grow/shrink: 8/19 up/down: 167/-413 (-246)
> 
> which all comes from compiler not emitting "dead" logic paths for negative bit
> counts.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a question at the bottom.

> There is much more wanting cleaning up here, but we have to start somewhere.
> Some observations:
> 
>  * Various of the boolean-like return values have -1 for zero-length bitmaps.
>    I can't spot any callers which care, so this seems like a waste.
>  * bitmap_zero() and similar clear predate us switching to use
>    __builtin_memset(), because there's no need for bitmap_switch().
>  * Should we consolidate 'bits' vs 'nbits'?

This looks desirable to me.

>  * The internals of these helpers want converting too.  Other helpers need
>    more than just a parameter conversion.

This may or may not relate to my question; it's not exactly clear what you
mean here.

> --- a/xen/include/xen/bitmap.h
> +++ b/xen/include/xen/bitmap.h
> @@ -66,25 +66,25 @@
>   * lib/bitmap.c provides these functions:
>   */
>  
> -extern int __bitmap_empty(const unsigned long *bitmap, int bits);
> -extern int __bitmap_full(const unsigned long *bitmap, int bits);
> -extern int __bitmap_equal(const unsigned long *bitmap1,
> -                	const unsigned long *bitmap2, int bits);
> -extern void __bitmap_complement(unsigned long *dst, const unsigned long *src,
> -			int bits);
> -extern void __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
> -			const unsigned long *bitmap2, int bits);
> -extern void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
> -			const unsigned long *bitmap2, int bits);
> -extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
> -			const unsigned long *bitmap2, int bits);
> -extern void __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
> -			const unsigned long *bitmap2, int bits);
> -extern int __bitmap_intersects(const unsigned long *bitmap1,
> -			const unsigned long *bitmap2, int bits);
> -extern int __bitmap_subset(const unsigned long *bitmap1,
> -			const unsigned long *bitmap2, int bits);
> -extern int __bitmap_weight(const unsigned long *bitmap, int bits);
> +int __bitmap_empty(const unsigned long *bitmap, unsigned int bits);
> +int __bitmap_full(const unsigned long *bitmap, unsigned int bits);
> +int __bitmap_equal(const unsigned long *bitmap1,
> +                   const unsigned long *bitmap2, unsigned int bits);
> +void __bitmap_complement(unsigned long *dst, const unsigned long *src,
> +                         unsigned int bits);
> +void __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
> +                  const unsigned long *bitmap2, unsigned int bits);
> +void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
> +                 const unsigned long *bitmap2, unsigned int bits);
> +void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
> +                  const unsigned long *bitmap2, unsigned int bits);
> +void __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
> +                     const unsigned long *bitmap2, unsigned int bits);
> +int __bitmap_intersects(const unsigned long *bitmap1,
> +                        const unsigned long *bitmap2, unsigned int bits);
> +int __bitmap_subset(const unsigned long *bitmap1,
> +                    const unsigned long *bitmap2, unsigned int bits);
> +unsigned int __bitmap_weight(const unsigned long *bitmap, unsigned int bits);
>  extern void __bitmap_set(unsigned long *map, unsigned int start, int len);
>  extern void __bitmap_clear(unsigned long *map, unsigned int start, int len);

What about these two, and the subsequent (in the .c file at least)
bitmap_*_region()? That last remark above may mean you deliberately
left them out for now (which is okay - as you say, this is merely a
1st step).

Jan

