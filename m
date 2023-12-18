Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69E8167CC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 08:56:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655681.1023390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF8Ta-0007q7-Io; Mon, 18 Dec 2023 07:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655681.1023390; Mon, 18 Dec 2023 07:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF8Ta-0007oJ-G6; Mon, 18 Dec 2023 07:55:46 +0000
Received: by outflank-mailman (input) for mailman id 655681;
 Mon, 18 Dec 2023 07:55:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rF8TZ-0007oD-HN
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 07:55:45 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d79c4749-9d7a-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 08:55:42 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c3ceded81so25986665e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 17 Dec 2023 23:55:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fm21-20020a05600c0c1500b0040c03c3289bsm41299672wmb.37.2023.12.17.23.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Dec 2023 23:55:42 -0800 (PST)
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
X-Inumbo-ID: d79c4749-9d7a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702886143; x=1703490943; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k0dGek6JxjcMTscNQvyJtmYk1nYp4HTQSC09bgrSgjw=;
        b=UeCLiphdRpzer/BNj1DCagywjqE+NTAfBRRTA8/WOLyfxMWUaz2cC/d+njTyCZUbw4
         yEsI11F3ULY88oKbD7FqYODiCOSd3my3CT6gFPVN6vK6VTLaMZ6bCaiX7gvPVfbKkIat
         guIPjI9KvhlL7QE6ng/w+6Mx6hRK2fUIYGFonoamHnJAumOmcS/eyo0FRDVvqQok04O1
         mnz5b1EFfO6Y01gccCN2McSbQsvO+CU8IIXvs/iZn5wt1hpD7aDZFmO0CFBUdcT15OXL
         bHEBJZTEgi+YtgqMWii3h+O4eq04P9kxw2oowc6lOLR06KDpzn7t1unab/VytUnvDAgw
         p/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702886143; x=1703490943;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0dGek6JxjcMTscNQvyJtmYk1nYp4HTQSC09bgrSgjw=;
        b=S2ozZE84qRbT9m+Z6cGHMzCi6Pkb/pBCvzFOw3Ad6d7xR85LM6v1/+6kvNY72RGVTF
         h1Z3maEaPRfj8wfPX8fDUKW0KcmEFmRinSeJd199bEFgQjg8urilUUANEvEvAFdF7iyX
         2a1hN40aCgN8kOOZBdJI12rjMBaZ19z9rTLgRX1dznK/TCYUN2vdNZlsFFLSMHrCMoBv
         MOqlEMEUhfxBmvIIbp8t7sDFTrSYAnKbzRUVoWr5365GN/iYQLf/RP/NdRmGIYGH1pMc
         3ers/FGFuMSyr3SeVW24G46YaVC+04YIoZojY/wH5Ha/xoCNjMQ/RQTCnrYDwRVYRQvR
         WD8g==
X-Gm-Message-State: AOJu0Yzngp+Qhb7C+0EmNEaqm8/jwaf3AnaVOOoeUoUUBBKNyPrRE9gT
	36VhfcBy6FlOFSAXxGxnz4UO
X-Google-Smtp-Source: AGHT+IH+tWQZo/x6ERMgfipW7QwnA0RNyxQNhWPvDuufUNPtilU0UqITD7RR/d2sBsWi+ijZfRUhVQ==
X-Received: by 2002:a05:600c:2147:b0:40b:5e21:ec26 with SMTP id v7-20020a05600c214700b0040b5e21ec26mr7922558wml.88.1702886142717;
        Sun, 17 Dec 2023 23:55:42 -0800 (PST)
Message-ID: <5d76295f-0438-4c5d-8b2e-73a1abcc96e6@suse.com>
Date: Mon, 18 Dec 2023 08:55:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH] Argo: drop meaningless mfn_valid() check
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <580c6c48-9dd5-4296-8696-2b40beac2bc3@suse.com>
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
In-Reply-To: <580c6c48-9dd5-4296-8696-2b40beac2bc3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Christopher,

On 27.11.2023 14:55, Jan Beulich wrote:
> Holding a valid struct page_info * in hands already means the referenced
> MFN is valid; there's no need to check that again. Convert the checking
> logic to a switch(), to help keeping the extra (and questionable) x86-
> only check in somewhat tidy shape.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

much like "Argo: don't obtain excess page references" (with which the one
here actually also conflicts), this one is awaiting your ack or otherwise.
Note that the other one has now been pending for quite a bit more than a
year. I hope the same isn't going to happen here ...

Thanks, Jan

> ---
> Initially I had this (with less code churn) as
> 
> #ifdef CONFIG_X86
>     if ( p2mt == p2m_ram_logdirty )
>         ret = -EAGAIN;
>     else
> #endif
>     if ( (p2mt != p2m_ram_rw) ||
>          !get_page_type(page, PGT_writable_page) )
>         ret = -EINVAL;
> 
> But the "else" placement seemed too ugly to me. Otoh there better
> wouldn't be any special casing of log-dirty here (and instead such a
> page be converted, perhaps right in check_get_page_from_gfn() when
> readonly=false), at which point the odd "else" would go away, and the
> if() likely again be preferable over the switch().
> 
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -1421,15 +1421,24 @@ find_ring_mfn(struct domain *d, gfn_t gf
>          return ret;
>  
>      *mfn = page_to_mfn(page);
> -    if ( !mfn_valid(*mfn) )
> -        ret = -EINVAL;
> +
> +    switch ( p2mt )
> +    {
> +    case p2m_ram_rw:
> +        if ( !get_page_and_type(page, d, PGT_writable_page) )
> +            ret = -EINVAL;
> +        break;
> +
>  #ifdef CONFIG_X86
> -    else if ( p2mt == p2m_ram_logdirty )
> +    case p2m_ram_logdirty:
>          ret = -EAGAIN;
> +        break;
>  #endif
> -    else if ( (p2mt != p2m_ram_rw) ||
> -              !get_page_and_type(page, d, PGT_writable_page) )
> +
> +    default:
>          ret = -EINVAL;
> +        break;
> +    }
>  
>      put_page(page);
>  
> 


