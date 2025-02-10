Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6CA2EA74
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 12:04:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884723.1294466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRaL-0004bA-7B; Mon, 10 Feb 2025 11:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884723.1294466; Mon, 10 Feb 2025 11:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRaL-0004ZI-4J; Mon, 10 Feb 2025 11:04:17 +0000
Received: by outflank-mailman (input) for mailman id 884723;
 Mon, 10 Feb 2025 11:04:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thRaJ-0004ZC-0k
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 11:04:15 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c34dea2a-e79e-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 12:04:14 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so939601666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 03:04:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab79792121dsm575927866b.124.2025.02.10.03.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 03:04:13 -0800 (PST)
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
X-Inumbo-ID: c34dea2a-e79e-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739185453; x=1739790253; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKYa8F1jir2ab4QZ/oeL5A0sL+kEd1l75kc4kmGkNvI=;
        b=X7jhc9zJDDkSnCoSRQwrcu7VMfgHW7w45MIOIoj6lPOWUyFW7ANsC3K7lxB20WZ2TZ
         jj9La3EM0K7gMJXwOEIcRh5UPCx9T0hg6nBr2Cmmse9WDr9zA1fGYL2YouQbKQCUcO8m
         D3W476FtXP8rKxzkvZTaUSt0zGfvh7a7GaFYt12rpXFw2FgcITxHxzfuPJOBDpylB1ga
         nXVZBclVswCIDwJlCalNUlXvmGIxHSWtN8vX8GYMJplE1AvV6LCgPaW9Q1doZmMkVtkd
         G3SsxkoeQM3ep/oxyZT0kSRYkZQjAFcpLP1nORRkBgNwrW4TMb6SEKBZlortbc30ttkI
         19zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739185453; x=1739790253;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKYa8F1jir2ab4QZ/oeL5A0sL+kEd1l75kc4kmGkNvI=;
        b=qpVWJ5hbKOxQcT3X2FhFXwG76BCpEO+lt2JK8ws65Kq96j8LuRzUPi5rXXgRGl2Gu/
         OQaa27725tzZhvZq5F0Ds48c8WNE9IbDQRd3joJ9bPLfyqJp7UxGYNsH1tsb29EIhlDt
         Frg8FA9kZ/zwmpNp+FP66sn09KzjL6lOojbGyfe+9zP722LnX7R77o0YTNFhPJcjP1Fu
         sxFPHkFUlUjtJV5KJ4al2GXscmoZKHOyQgOYAXS4iFKbg4T5mis4fU/WghrT14UEuRgT
         UFeNsbMkPP45GUe0Z3OmgVE1+0OXJ+xYe1m07vKbVVVvZrXpV8ZFBd9kYThtUzeFMIhh
         Mppg==
X-Forwarded-Encrypted: i=1; AJvYcCU0RDquVey98uG3ZBv1psHOixf6oxJtlpqahy9eOYt30wr/LGFZqMWx7WDAl4Wg3UeX2o8KDiKvH+o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsECOg4gKbY3MzJDEH7sixMZLBJGIurI8A370aOe8UQK9YvWgM
	DiVOSVa2kpazmD0JGXwqzUUB7353t/w/nWv+1gDA+X0EW7OQtcW7KOk6KI4omQ==
X-Gm-Gg: ASbGncvleLhZ2slVTWOMy/sDHkMEimNxEYpGK15SVxfgxHAuVAFdKkeu5d3G6t7S/6o
	U/gYfMYdH8zNDqNMijNKl1oysQeasp/4X4a6Z8lxXknG21wzWzQzqATSYcSp/bjJIztMXnllFfp
	MMejGUAq+o4qRb3pGqNWz9fY2wo2cB0CrF8A/2bvDTGq47m6N/J9N+BFyIlIywpX21CIE6SKyBV
	s8455DrAXy2N+i8+SGkMZvB0A7XyoSQ2RpFrxa0THS0GDuG2+t0cvFucO7eH/s0OOx3wFkVccj0
	7F87R+f5awEuhBlXdnxvwvG/MddC2lrnM6okftR+5dXK7wKXcAZscyXjJ60jJerp/vP7ERufzAg
	J
X-Google-Smtp-Source: AGHT+IEek3lRzdIfzmrt/x1crQxn2OXKR0ahsAUH8Pqb7uEyb3umOZXjZipEKsDSzVDQkVVhXbgeeQ==
X-Received: by 2002:a17:907:7ea4:b0:ab7:9823:b76f with SMTP id a640c23a62f3a-ab79823b7famr1154248466b.30.1739185453384;
        Mon, 10 Feb 2025 03:04:13 -0800 (PST)
Message-ID: <2d66e39f-8d89-49a2-bdec-a5f39b20b218@suse.com>
Date: Mon, 10 Feb 2025 12:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] x86/iommu: disable interrupts at shutdown
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250206150615.52052-1-roger.pau@citrix.com>
 <20250206150615.52052-6-roger.pau@citrix.com>
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
In-Reply-To: <20250206150615.52052-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 16:06, Roger Pau Monne wrote:
> Add a new hook to inhibit interrupt generation by the IOMMU(s).  Note the
> hook is currently only implemented for x86 IOMMUs.

Yet then ...

> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -663,6 +663,12 @@ void iommu_crash_shutdown(void)
>  #endif
>  }
>  
> +void iommu_quiesce(void)
> +{
> +    if ( iommu_enabled )
> +        iommu_vcall(iommu_get_ops(), quiesce);
> +}

..., with this being in common code, the function wants checking that the pointer
to be called through isn't NULL.

As to the use on the crash path - iommu_crash_shutdown() was called a few lines
earlier. Why would we still need iommu_quiesce() there?

Jan

