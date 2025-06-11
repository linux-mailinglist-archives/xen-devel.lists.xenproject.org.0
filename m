Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ABDAD5D9C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012078.1390639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPid-0006t0-Cg; Wed, 11 Jun 2025 17:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012078.1390639; Wed, 11 Jun 2025 17:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPid-0006qH-9R; Wed, 11 Jun 2025 17:58:35 +0000
Received: by outflank-mailman (input) for mailman id 1012078;
 Wed, 11 Jun 2025 17:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lgg=Y2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uPPib-0006MU-Qx
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:58:33 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b099147d-46ed-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 19:58:33 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a361b8a664so139692f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 10:58:33 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453252056bbsm27705295e9.26.2025.06.11.10.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 10:58:32 -0700 (PDT)
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
X-Inumbo-ID: b099147d-46ed-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749664713; x=1750269513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5gvOP0mKW1ypaQEOCG9IA46hEWtP+5hlN0TIFMVv5fg=;
        b=Png1jZbOtbmHQJbbEA8XcQp2VvglQvGJo+GsfSEClyW0yYeN0+hYPuKpo2mK4KGynv
         5NbuCRNnyc1baPWXHsirvY7U0qa5DAfV9+pM3Jn0vZo0OwKL1MAZOE9wRA+3XTjmSgBV
         K7QSZk3NNgS8h88xWYZmMV3qqyY4XwKvw7M8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749664713; x=1750269513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gvOP0mKW1ypaQEOCG9IA46hEWtP+5hlN0TIFMVv5fg=;
        b=TT18GnYujHyMZ/K97YrlZvWqcpWmni1dGr9ssFSf4a9KUGoXwzTdUdG2hJDPlIjJsL
         jv8i5IjCdV63WGMecbNKefjPmi3gzIt5Xe99aMVFZL6FTAZoRB4Uz+7N4fxZdVmjwo+m
         SfZRDq7u26UUJJtAY4EW8Me+Y2UAWf58avttv/cRjZMO/tax7Y6xTyvlzApTQMJBoi3Y
         f81tF/YkU8MyYRdDsbL7Ko/h7KRJRDI8owjrLRQloZd2gcH2x1zlNgRBrEBxRnrqSId3
         77hN9J6zi9L8tZGA8RgAnNygw8u10atMNgmDLotcoqPjZLv4rmuFUn6/8EgPs6MuyUAe
         3O+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXy5of86HOpJ3oxZ7gPZo/izbPljtyO3/Aubbn+hxTsO7s1rglEiS+yAyXpudy0mxfox16F2/5T6I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTm8i0qtWDrqfX1zvvMh9p80jq0mkRm6JDoizk+2ft2Gh9o+KO
	hLwXqlgYFISjNiN3bk9sxAhI8Zj7LEftVAYBCr+YqlGUYnttNynRqILExb3bV66L5jQ=
X-Gm-Gg: ASbGncvYQRVknZLj3x4/7prGowmh6qVcGK6izjKtXanJs5LDrw5CXdFQeXnr3fNS8eU
	DvbIuorvLJ0tbv6YkGpyzNvShJ0Ffo/TRpAvi4X5fZIChDmdxt1od80w/bYxaXA1bM6KFhkFpaf
	u6a69m0olE1LU9fIiu/KIm+lgp3O+XFPen6Mql23mPsHmuJoDzK/zLWg9Uxp8F7O13990Si6+CO
	Yp4JjERLLvofbTk65ArtOPrIqsjqeBQxz8erQOqOBjUl1joPS0n2GxPdneL7jwPcXAfRPdezemu
	oOv240rfxRin2zea9r45Uv15T+/e4tHJHWuZ821ZPFvUIy4Md7znYPckn4vpnrgQ5m/Lgwqo7yQ
	=
X-Google-Smtp-Source: AGHT+IFvAN/pIaBjnFe/+kc7F/hrDgz8XCXW6XBgbJqqNWMAc7NJmHMu+KFOYZH2rZktaKmSXWwjxA==
X-Received: by 2002:a5d:584e:0:b0:3a5:52cc:5e29 with SMTP id ffacd0b85a97d-3a5586dcd10mr3712431f8f.7.1749664712725;
        Wed, 11 Jun 2025 10:58:32 -0700 (PDT)
Message-ID: <b78a4877-353d-4320-95a2-f3cefa018a61@citrix.com>
Date: Wed, 11 Jun 2025 18:58:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] x86/pdx: simplify calculation of domain struct
 allocation boundary
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250611171636.5674-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/06/2025 6:16 pm, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 7536b6c8717e..2f438ce367cf 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -461,30 +461,6 @@ void domain_cpu_policy_changed(struct domain *d)
>      }
>  }
>  
> -#if !defined(CONFIG_BIGMEM) && defined(CONFIG_PDX_COMPRESSION)
> -/*
> - * The hole may be at or above the 44-bit boundary, so we need to determine
> - * the total bit count until reaching 32 significant (not squashed out) bits
> - * in PFN representations.
> - * Note that the way "bits" gets initialized/updated/bounds-checked guarantees
> - * that the function will never return zero, and hence will never be called
> - * more than once (which is important due to it being deliberately placed in
> - * .init.text).
> - */
> -static unsigned int __init noinline _domain_struct_bits(void)
> -{
> -    unsigned int bits = 32 + PAGE_SHIFT;
> -    unsigned int sig = hweight32(~pfn_hole_mask);
> -    unsigned int mask = pfn_hole_mask >> 32;
> -
> -    for ( ; bits < BITS_PER_LONG && sig < 32; ++bits, mask >>= 1 )
> -        if ( !(mask & 1) )
> -            ++sig;
> -
> -    return bits;
> -}
> -#endif
> -

I'm very happy to see this disappear.  Both because of a non-__init
function calling an __init function, and because this internal is just
horrible.

>  struct domain *alloc_domain_struct(void)
>  {
>      struct domain *d;
> @@ -498,14 +474,15 @@ struct domain *alloc_domain_struct(void)
>       * On systems with CONFIG_BIGMEM there's no packing, and so there's no
>       * such restriction.
>       */
> -#if defined(CONFIG_BIGMEM) || !defined(CONFIG_PDX_COMPRESSION)
> -    const unsigned int bits = IS_ENABLED(CONFIG_BIGMEM) ? 0 :
> -                                                          32 + PAGE_SHIFT;
> +#if defined(CONFIG_BIGMEM)
> +    const unsigned int bits = 0;
>  #else
> -    static unsigned int __read_mostly bits;
> +    static unsigned int __ro_after_init bits;
>  
>      if ( unlikely(!bits) )
> -         bits = _domain_struct_bits();
> +         bits = flsl(pfn_to_paddr(pdx_to_pfn(
> +             1UL << (sizeof(((struct page_info *)NULL)->v.inuse._domain) * 8))))
> +             - 1;

I think this would benefit greatly by not being a oneliner.  There's
sizeof_field() which helps a little.

But, isn't this UB with CONFIG_BIGMEM?  You're shifting 1UL by 64.

When __pdx_t is unsigned long, there's no bits restriction necessary. 
Therefore, don't you want !bits && sizeof_field(...) < BYTES_PER_LONG as
the entry criteria?

~Andrew

