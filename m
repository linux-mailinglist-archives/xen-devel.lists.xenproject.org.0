Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FD8A90553
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 16:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956249.1349724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53M8-00037d-VA; Wed, 16 Apr 2025 14:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956249.1349724; Wed, 16 Apr 2025 14:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53M8-00035X-Rm; Wed, 16 Apr 2025 14:03:12 +0000
Received: by outflank-mailman (input) for mailman id 956249;
 Wed, 16 Apr 2025 14:03:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u53M7-00035M-D3
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 14:03:11 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86fd3435-1acb-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 16:03:09 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39ee57c0b8cso609388f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 07:03:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43d053sm17422070f8f.68.2025.04.16.07.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 07:03:08 -0700 (PDT)
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
X-Inumbo-ID: 86fd3435-1acb-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744812189; x=1745416989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+wx+uDd8vzaHfR7KOsrw3bWeB/ycZnKz/FmtX6GOeSE=;
        b=Wq5n5ykVuDTozuT/nxff18dsaZslcWdw+P9xbWYKjuKCH/qluZag01JAqMMf9BnjNF
         nSxhOE5zOM47sEXa8X+wnpGfMOMtGhv7fvxknWctu+qRVkkRd3vuaxt2FWnfJtajzCYX
         OO6t9YZncRo/i99uec6lJS8V99QY5SiimPlfSZOjfVMN3YWNCHxCT4RpclbH68oX5+kK
         cuC0jlEHZ7aICdcXOVC+aFKGXPKDrWLLoBoezg5ZkpBEmsRTk2o/x127q4JPY9I9uCR/
         dX2KON23eZCqxMCoVejimX7mk0Tdt9s27nLNf+k8s266mwG4rYcrRsgxmcITdPuyqr6Q
         +UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744812189; x=1745416989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wx+uDd8vzaHfR7KOsrw3bWeB/ycZnKz/FmtX6GOeSE=;
        b=i/r30b3zIASgHRJdsR4KoamzaV9SIQcbmOUxWQisT2uki+NBq0Q6yZK0V4G4bY1HXV
         FmtFD9gf6OleUCbVBkJFuQc9cQdYx6saRsPnuR3ibLmPYIMTuccipnQNKmRYDoCPt704
         sUrryg6dGt9b3xV9jgqPErcYrTsx94t9q1lHNGAMAcqsgF9Z1MZ+OVnGP1d5KqgPzYGC
         dK/G8bTJxvtublXZcfxHNjxcREz7dcvG14l8vK7SP308mi7iTkFcvCm9B1tt+ONQbOUc
         9/M8zEcjjQVHeNIDhVKhvPujIgQPcJ0uPac+vvPmb0VDi80pj8ec9muz/kUncH4C/CTf
         zabg==
X-Forwarded-Encrypted: i=1; AJvYcCVXilg5tO+GO/TXG/YsPTvof2f6KHgO79f4AtvgRnVuk0yUKOnw1lK3rHyHPVUTosf/DmktnA9tEso=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxymnFVN9EVqSSo0AU3JyMomq5ieP0Eselpxgy21pVDguld9gBm
	TNAKn5UrhRXGAfINcKCfVKgRJW8jnWEv21ZMS73DRC6iUjjw8+FogvJ+nlzZKQ==
X-Gm-Gg: ASbGncvv0Psfolb7nlHyA0i4Ro/tqwfD3DMX7PU547VgV6RX//81h0jzTIQha9FJASX
	O/Tbu1DnpqM5NUJRXdVSpBJ/oiXCl4fs5e+FSRGaqyohy2wRW1a7u4sSbSYg2f426pA+gkYe+vu
	4W6gZSgSSZKjc/AeX7DzrCm506vXtSbWF2lmB6P1v9Wv8VE46R1tyJZcwEpeXQep4DMlldsJ79g
	vjIOg8YcFlkOiN+TYDGzgRrHHDTdqpHPHyBNzL7oP7CszgsJowMmXMH7/1Fw65P9e9hiewtROam
	+sLXHfAQ1NwAhSPejQl9SOfSIpFZ8UbsNzybx9TRzZsfttdpJku0eqN5b8KBzWubZ3x9qmMbfLR
	vOqEts3ju7R198bf1NFsYD8P2Og==
X-Google-Smtp-Source: AGHT+IEAmsgDwHb8HzxHJPEIoOcUJ2fpf5l4HJUVVZOv1uu4PXfU5FbCZ5xkocVF2iCdUnmjw4ecPg==
X-Received: by 2002:a5d:6dac:0:b0:39c:268e:ae04 with SMTP id ffacd0b85a97d-39ee5add7admr1912070f8f.0.1744812188745;
        Wed, 16 Apr 2025 07:03:08 -0700 (PDT)
Message-ID: <f6bd2fef-f3d8-46d6-9b65-d79974dd214c@suse.com>
Date: Wed, 16 Apr 2025 16:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/15] xen/decompressors: Remove use of *_to_cpup()
 helpers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Lin Liu <lin.liu@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
 <20250416115900.2491661-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250416115900.2491661-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2025 13:58, Andrew Cooper wrote:
> From: Lin Liu <lin.liu@citrix.com>
> 
> These wrappers simply hide a deference, which adds to the cognitive complexity
> of reading the code.  As such, they're not going to be included in the new
> byteswap infrastructure.
> 
> No functional change.
> 
> Signed-off-by: Lin Liu <lin.liu@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
with a request below.

> --- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
> +++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
> @@ -19,18 +19,19 @@ typedef uint32_t __le32;
>  static inline u32 cpu_to_le32(const u32 v)
>  {
>  #if BYTE_ORDER == BIG_ENDIAN
> -	return (((v & 0x000000ffUL) << 24) |
> -	        ((v & 0x0000ff00UL) <<  8) |
> -	        ((v & 0x00ff0000UL) >>  8) |
> -	        ((v & 0xff000000UL) >> 24));
> +        return __builtin_bswap32(v);

Supposedly a hard tab is to be used for indentation here, if original code
and ...

>  #else
>  	return v;

... this is to be trusted.

>  #endif
>  }
>  
> -static inline u32 le32_to_cpup(const u32 *p)
> +static inline u32 le32_to_cpu(const u32 p)
>  {
> -	return cpu_to_le32(*p);
> +#if BYTE_ORDER == BIG_ENDIAN
> +        return __builtin_bswap32(v);
> +#else
> +	return v;
> +#endif
>  }

Same here.

> --- a/xen/common/lz4/defs.h
> +++ b/xen/common/lz4/defs.h
> @@ -18,7 +18,11 @@
>  
>  static inline u16 get_unaligned_le16(const void *p)
>  {
> -	return le16_to_cpup(p);
> +	u16 v;

Here and below - I realize there's u16 in context (u32 elsewhere), yet it would
still be nice if no new instances appeared and you used uint16_t here (and
uint32_t in the other cases).

Jan

