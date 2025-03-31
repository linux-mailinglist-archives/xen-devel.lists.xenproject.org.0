Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD10A75EF8
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 08:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931887.1334070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8sc-00087x-7E; Mon, 31 Mar 2025 06:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931887.1334070; Mon, 31 Mar 2025 06:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8sc-00086V-4J; Mon, 31 Mar 2025 06:44:18 +0000
Received: by outflank-mailman (input) for mailman id 931887;
 Mon, 31 Mar 2025 06:44:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tz8sb-00086P-B6
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 06:44:17 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 900fe5f6-0dfb-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 08:44:15 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso27241205e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 30 Mar 2025 23:44:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e304sm10449515f8f.73.2025.03.30.23.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Mar 2025 23:44:14 -0700 (PDT)
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
X-Inumbo-ID: 900fe5f6-0dfb-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743403455; x=1744008255; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1FATQMDpjR5kbuY5BSIHnpoXirOGJY4yiiev3V/7pP8=;
        b=WpHf+SByVbZG6ue64DBfSKBu62InJqfnPHiuJ/cyndo8zMuI3CxeMnf25K1tqrqEti
         qu18u3uSx9h7F3py8ieE17DSD53keR45JmH3FFhg2Pp5UmLZAwUTHwJtXaB/DHmiFW2O
         ofzDBGDbrlZH46mNZ+vz1d0e5w/I4zwus5B5w872J3In4+6RKmnRNB8euR9JX4kVvZJ/
         EUmruqr1yQDko2WgY+x15dFRibjtFMo8p/GRrvvVyqcodNLikCndSQxm6Xc9LVcSH1WL
         GBQDPQ9Y8xaej+G9jzvDS4jgsT12290Wpm3/DJCCWANVg7GOOZfLwUVYJKJ7Ix33czPa
         bteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403455; x=1744008255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FATQMDpjR5kbuY5BSIHnpoXirOGJY4yiiev3V/7pP8=;
        b=ApNjDKkHZvMkx7r2ZYrIFD+3Xa29JL+/Siv7tW/c9YZCaIm7OkgasbB35jR2gQgFrH
         6ytegwSG2i0yMLNXk3/hZm5ccP13e4KoVIcWsTDMfU/YSSMPe6xTvFRAyZWVU3jaPUJB
         WvW8rNeyatNxmDp7QBOYN4NElcMcytBAzt+eYFB3SEaUEkiANJEp7tkrn9YxfkzLsBGO
         +X10DpPDyRYqYmTqgECrSSM2X2Xww8Ho+/r+0hmI1n+B9xnmUh6vj+BptPmZyE0kPq01
         8h2F7F/qrRxtMOYMc8xl2SVvgjY8YztvzITz7axz+K4WW4K2wKASou6w2w82FcpDz+vL
         cFtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSH1FQTjC1CMKtQrnVGposNEgg6fgVieTL/raqYOD74qIPpc8Pyjd7Zxz59LvNgfshDZe3rcVL+lU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhuEK9eFd3IZ8VSI57Y8C6v3S4+Vhwynt0p2AeF6Arz+ZGqIMj
	5UkMCkjQchHSKA5Hn+++iQLeXunPva6jSNRQEcwdph4024x/fUy5XZP9t14JAw==
X-Gm-Gg: ASbGncvEWj3yiuqWduGrh5s2QiKOGbLB+o5tnyVNMjW1VVToONEOHYCwMpDrj1y/f6Q
	LsXNw4MZzVdCdJRCjWsvSJaQToCDV4JevV9diGrLD+IlhoKwjg5nm9Hur6tSKgo7/SORlTqTR81
	6qxImPKaeL4r4Rulb51jEF3QOcOEl578lFdYGGJDMiirAaS5D9DfxZ3LsSRBTlAvAawleXradgz
	7mqVHrtxpFHH+b0qgGe2A9mnSolhFJH5LZCge49GMsjR2MJj9IkgzOJa/9830rN21rz6ZAYDUAz
	iCQpK34nVC/AqqT1lzIiyAz5XjWSR0qw6MHl5rr1CljEgVP0sT4sjJ2eZFdUGJrphMs9wj10nNA
	msALVVNUKkhNMnAGrYEvVWCbym+lbKQ==
X-Google-Smtp-Source: AGHT+IFY/BxpK2+Cm3GTW5eEoquPd41ZtMCd4k6uZsp8PFcsiJw54SQkOLADev3QPpYKS17su9diMg==
X-Received: by 2002:a05:600c:b98:b0:43d:16a0:d82c with SMTP id 5b1f17b1804b1-43db61d7b53mr78526035e9.2.1743403454901;
        Sun, 30 Mar 2025 23:44:14 -0700 (PDT)
Message-ID: <217ed304-ca5d-4422-a187-da5493cecb5e@suse.com>
Date: Mon, 31 Mar 2025 08:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 julien@xen.org, michal.orzel@amd.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20250327233419.1119763-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20250327233419.1119763-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 00:34, Stefano Stabellini wrote:
> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -52,7 +52,7 @@ static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
>  	unsigned int remainder = nbits % 8;
>  
>  	if (remainder)
> -		bp[nbits/8] &= (1U << remainder) - 1;
> +		*bp &= (1U << remainder) - 1;
>  }

Technically there's nothing wrong with dropping the if(), I think. Even more
so then than now, ...

> @@ -338,7 +338,6 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
>  			nbits -= 8;
>  		}
>  	}
> -	clamp_last_byte(bp, nbits);
>  }
>  
>  static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
> @@ -363,7 +362,6 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
>  				unsigned int nbits)
>  {
>  	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
> -	clamp_last_byte(bp, nbits);
>  }

... with the two prior call sites now shrunk to ...

> @@ -384,21 +382,41 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
>      uint8_t zero = 0;
>      int err = 0;
>      unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
> -    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
> -
> -    if ( !bytemap )
> -        return -ENOMEM;
> +    uint8_t last;
>  
>      guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
>      copy_bytes  = min(guest_bytes, xen_bytes);
>  
> -    bitmap_long_to_byte(bytemap, bitmap, nbits);
> +    if ( IS_ENABLED(__BIG_ENDIAN) )
> +    {
> +        uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
>  
> -    if ( copy_bytes &&
> -         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
> -        err = -EFAULT;
> +        if ( !bytemap )
> +            return -ENOMEM;
>  
> -    xfree(bytemap);
> +        bitmap_long_to_byte(bytemap, bitmap, nbits);
> +        last = bytemap[nbits / 8];
> +
> +        if ( copy_bytes > 1 &&
> +             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
> +            err = -EFAULT;
> +
> +        xfree(bytemap);
> +    }
> +    else
> +    {
> +        const uint8_t *bytemap = (const uint8_t *)bitmap;
> +        last = bytemap[nbits / 8];
> +
> +        if ( copy_bytes > 1 &&
> +             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
> +            err = -EFAULT;
> +    }
> +
> +    clamp_last_byte(&last, nbits);

... just one, I wonder if that being a separate function is actually still
necessary.

As indicated before, I think it would be nice if the two identical copy-out
operations could also be folded.

Jan

