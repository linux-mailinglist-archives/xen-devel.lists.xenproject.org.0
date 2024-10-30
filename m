Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3576D9B60D6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 12:02:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828073.1242889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66T2-0006sp-V0; Wed, 30 Oct 2024 11:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828073.1242889; Wed, 30 Oct 2024 11:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66T2-0006pf-Rr; Wed, 30 Oct 2024 11:02:24 +0000
Received: by outflank-mailman (input) for mailman id 828073;
 Wed, 30 Oct 2024 11:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t66T2-0006pZ-6T
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 11:02:24 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f86b029-96ae-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 12:02:21 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-539f72c8fc1so8083215e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 04:02:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b70c73sm15318950f8f.72.2024.10.30.04.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 04:02:19 -0700 (PDT)
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
X-Inumbo-ID: 6f86b029-96ae-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzYiLCJoZWxvIjoibWFpbC1sZjEteDEzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZmODZiMDI5LTk2YWUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjg2MTQxLjM0NDQxNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730286141; x=1730890941; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tBrKegZzjlM9+VI8iKO9G3gNsd2neP/gFTAOb2ml2aA=;
        b=BJ4PVsEWuLAeH911EyhfLHdUcVdjOdwgGOI9iCttpxHfBeQ8vWE5Tv8NsssUXTRJ3P
         SSKjI8ln9g3Bwjo95fPk+/i5hy5g2vzJDLdYQp1lOd7gZfuxwTnpPnxOmvCK741M+GTO
         kcsyngtCchYv/hvJXKIodd9zEpzErjMsBhvcyAL6hhJ4xx4+ZQsVv6I8wPeDGiof57NY
         RoiQTA6UQv9BaTKyDNxHs/I4FA3waaYYpnBAQ03tzpbH2P+OQjkr8AKNjyzA27XsHQCR
         +AQOTfevCySGnZ3qNqv6JOeNaOTokwLCPH+fUZa9/1feStqqDhnJEDjKNb1HYNVBegdn
         mE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286141; x=1730890941;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBrKegZzjlM9+VI8iKO9G3gNsd2neP/gFTAOb2ml2aA=;
        b=ZE7rIhaG+QA7fU0XOQWAADpD5ePAtW+DF23AC+pHRVL8/iR0Od2VvWbgA3rVF1fgNl
         CoSLfujTbH9MCZWLvENFPSfKAyErbczdtdfoiBe8K0htXgjWl9L2zY8yd7epcKtNMtg7
         fnw6EJtuLwpTelziE1HDiWr+PKlajBkaHi4JRjoYTZpvXFZFxqDKuQ6LUnA0wvnoD7wb
         uF7NNBBxPjcEmQlkLUI1RHsPhm4ur3NgGo7jP47Kp0WaTajU2GRFru776NNBdXD6vnJI
         wdD5EwylwwPeiEPiWE7ineB8oJtcPnpwuq520M0VO+g/1WdGJPGqjLLDJv9jCV4qlsQU
         nfDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe/NOtAwxkCECXHL/LV6aaQ41KMBmpUWRlnzSc0ysfmdk7uDiiEQ/9aX0oj/M+bjy91QizpdJ569w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyr5XjaWaj5ZgkhBRT5PGMnGV1uz2CdoM9iARXrSXLTXNw/EIoS
	BmVsMrb552Y0TCkLDNBNbLFh9hHmtqhYYRtcqXkFII0mwDZxE6x1Y84F8WiZBg==
X-Google-Smtp-Source: AGHT+IFYU6YOjTIUPoJ8NhVd8RVsuFRowxd6YWUIEGALaqz863eN+D6sVLVoBn3PQhnhD/0FXc7HVg==
X-Received: by 2002:ac2:4e10:0:b0:539:8a9a:4e56 with SMTP id 2adb3069b0e04-53b8767483fmr1645891e87.53.1730286140567;
        Wed, 30 Oct 2024 04:02:20 -0700 (PDT)
Message-ID: <6a7bd508-99af-4602-86aa-f46d718e36c2@suse.com>
Date: Wed, 30 Oct 2024 12:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: Use standard C types for sized integers
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241030104406.2173357-2-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241030104406.2173357-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2024 11:44, Frediano Ziglio wrote:
> The header is already using these types.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Nevertheless I wonder whether ...

> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -230,7 +230,7 @@ struct page_info
>           * Only valid for: a) free pages, and b) pages with zero type count
>           * (except page table pages when the guest is in shadow mode).
>           */
> -        u32 tlbflush_timestamp;
> +        uint32_t tlbflush_timestamp;
>  
>          /*
>           * When PGT_partial is true then the first two fields are valid and
> @@ -284,8 +284,8 @@ struct page_info
>           *   in use.
>           */
>          struct {
> -            u16 nr_validated_ptes:PAGETABLE_ORDER + 1;
> -            u16 :16 - PAGETABLE_ORDER - 1 - 1;
> +            uint16_t nr_validated_ptes:PAGETABLE_ORDER + 1;
> +            uint16_t :16 - PAGETABLE_ORDER - 1 - 1;
>              uint16_t partial_flags:1;

... fixed width types are really needed here; afaict unsigned int ought to do.

>              int16_t linear_pt_count;

It's only here where the fixed width type is largely needed (or alternatively

            signed int linear_pt_count:16;

).

Jan

