Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61E185F54D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 11:07:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684299.1064053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd5yd-0002Vf-9N; Thu, 22 Feb 2024 10:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684299.1064053; Thu, 22 Feb 2024 10:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd5yd-0002Td-5r; Thu, 22 Feb 2024 10:06:51 +0000
Received: by outflank-mailman (input) for mailman id 684299;
 Thu, 22 Feb 2024 10:06:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rd5yb-0002TV-Kq
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 10:06:49 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1747582f-d16a-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 11:06:48 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55f279dca99so2004147a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 02:06:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x3-20020aa7d383000000b005646c7b9712sm3887432edq.16.2024.02.22.02.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 02:06:47 -0800 (PST)
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
X-Inumbo-ID: 1747582f-d16a-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708596408; x=1709201208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jr6cF09++WzpyKRiizw7qNFbitKB6CkyWilkhKAB7Lw=;
        b=gxCX6N+k+Ty7qj6lsBrYcEMqLYK73cLMVfJeo5lufpjL6ujGSYHL8INXjYEi0NyU9u
         CVYSv3a43KNvN0jWEj9oNKz2LcYJ0ffnbnVYTlhu5dWzcJA9dchL7QEq1Ofr4tWIFCCH
         Ku/fTuLE2Im7T0N/06ehlsphXzLzPUnjOrER2IQoxCJXIK5c2txNlBfgSGzAFhvVKLRh
         Ae5ht7kW40ZC619kI7+A/senPN3B1i0Jl/xo7yZQezFPcPuK6cf8MbcYKNxWAKgAjrGz
         zUTbQk+jZdU4093Q9ddX2u6YssgpZ+bxXsZG/whpTsg9wss5oO3nd//Ggm4Bzrs9YDQW
         k4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708596408; x=1709201208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jr6cF09++WzpyKRiizw7qNFbitKB6CkyWilkhKAB7Lw=;
        b=xJccG/E9bheQ2YFPd/oLApLUtBFhh7DZ3rQOBAxuulA/lUXyN6y+4tM8k5R10NzS27
         jrwbdILIHK2H5MWiNqbEaq9UgaWJu6cY92VMjtGqu/TC53cBRaXEVTY4qAdbg3Wegydo
         NkH2bOYL7qyvSrW3RcJmH+KUwBB2FdXpxHT6aORT1qpxvxfIjIzODUuxEUv/UjUnyGyX
         vRcPM1hmLuqRZA1TjiJQs9M/EQ5U92XuVaPafKSkIhv35xeMH0HjgvdPithvK2rfR8v0
         9L4j2AHVn71NDHJjUzNUUZdmT7s3lV3TJGjYcmfuxXOQQkLVnjVX4efTlMjs+KEakwiU
         3a8A==
X-Forwarded-Encrypted: i=1; AJvYcCXaLrXNvcUqfWkSMrH7B+QPRfjA3PZijkldi02ytJXaQ6gWJYI/t20srZumhlXFUtPnpH1tUitk+Pdh+7bPcGghBqMIWSBnvcdsVu0WUNY=
X-Gm-Message-State: AOJu0YwuLiej+R+L4pxDenf+H3K08kcOW5vmJG+RgcXnTorG3MGnWocs
	7+BeDOI/nEFJLDZY8Q1UjCzaNXovpl9p7eXfv0S6P5Xdsq0gSW5Ey/k27hgUiw==
X-Google-Smtp-Source: AGHT+IFRc9oXLanoTt8ZFK0yLdYL9uWAYn76sOlvgQ8KvQ5NpLqhlldSAgaxKw3iLtSwObZDPYUD6g==
X-Received: by 2002:a05:6402:351:b0:565:1a91:94ad with SMTP id r17-20020a056402035100b005651a9194admr1928130edw.22.1708596407833;
        Thu, 22 Feb 2024 02:06:47 -0800 (PST)
Message-ID: <d8939069-a1cb-4794-a6aa-75a3e4d97884@suse.com>
Date: Thu, 22 Feb 2024 11:06:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/memsharing: use an atomic add instead of a
 cmpxchg loop
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240222090530.62530-1-roger.pau@citrix.com>
 <20240222090530.62530-2-roger.pau@citrix.com>
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
In-Reply-To: <20240222090530.62530-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.02.2024 10:05, Roger Pau Monne wrote:
> The usage of a cmpxchg loop in get_next_handle() is unnecessary, as the same
> can be achieved with an atomic increment, which is both simpler to read, and
> avoid any need for a loop.
> 
> The cmpxchg usage is likely a remnant of 32bit support, which didn't have an
> instruction to do an atomic 64bit add, and instead a cmpxchg had to be used.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -179,13 +179,7 @@ static void mem_sharing_page_unlock(struct page_info *pg)
>  
>  static shr_handle_t get_next_handle(void)
>  {
> -    /* Get the next handle get_page style */
> -    uint64_t x, y = next_handle;
> -    do {
> -        x = y;
> -    }
> -    while ( (y = cmpxchg(&next_handle, x, x + 1)) != x );
> -    return x + 1;
> +    return arch_fetch_and_add(&next_handle, 1) + 1;
>  }

... the adding of 1 here is a little odd when taken together with
next_handle's initializer. Tamas, you've not written that code, but do
you have any thoughts towards the possible removal of either the
initializer or the adding here? Plus that variable of course could
very well do with moving into this function.

Jan

