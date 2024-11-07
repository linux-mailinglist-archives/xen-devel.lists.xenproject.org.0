Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18079C01DC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 11:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831618.1246954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8zO1-00070P-9n; Thu, 07 Nov 2024 10:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831618.1246954; Thu, 07 Nov 2024 10:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8zO1-0006xr-6L; Thu, 07 Nov 2024 10:05:09 +0000
Received: by outflank-mailman (input) for mailman id 831618;
 Thu, 07 Nov 2024 10:05:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8zNz-0006xl-4k
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 10:05:07 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c266343f-9cef-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 11:05:04 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4315df7b43fso6493545e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 02:05:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05620b4sm17623045e9.20.2024.11.07.02.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 02:05:03 -0800 (PST)
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
X-Inumbo-ID: c266343f-9cef-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmYiLCJoZWxvIjoibWFpbC13bTEteDMyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMyNjYzNDNmLTljZWYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTczOTA0LjYxMjg1Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730973904; x=1731578704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSxWTJkgsKtlME+nUFx9gsnt01aHX1wyLAAIHuEqRYA=;
        b=KRwerDIlLJaV7yL77tGmtyH9C5BlqD3vin3tReV3Ge8My1u7Xz7KH3kY6aYujVfAfT
         5CijYI2IK3CO5WL5EOjLIwAac2sku+u1WYe6kP/9wl6v6E/pL2u/mlSOFiDyakPtPg/E
         CuICt3aAwG4ByaiofiVrW2QtXYRvUeeQzx1OPCWghJayfsVr+Zr6GeRzBRk5QxCUPebh
         kLo9s0TJVQz+dL4+W1yi9072CYvbhLKSrzf3pOIJiEJsu+ErO1jgiGQ8xD2rNJEe/kel
         +K9x4zD9yq1nKGhUWZZBdn8OhzNHkG3GwwtzQaQBNKyEc4QTTlZi5kHavLIs+cZOfxxV
         CpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730973904; x=1731578704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSxWTJkgsKtlME+nUFx9gsnt01aHX1wyLAAIHuEqRYA=;
        b=pDMht5Jj3ZU3sy3QUkwvF9CcMJ3ckdp/t2WhChMI7geeUI8QvrDXlV34AEcg+ijWN3
         Uy5L2rKPBxwqIziP8js8m2TkVfUseQ4NUmB7Zg6wiFn/edtHH16DotERD4oL2am3hLN4
         j+25l+23KF98lvX/14oeddjIixT/wiUM9w2zjxTqIhmSNRR7yHISra6XDP/o0Caac+7p
         N5uj4Ev0pJ22rLBpTRHRGD8SKVL3+lK5+R0tB3oQeO/iiBXrDmuAPmR98Ed7bCY9RbRZ
         mshu64eaZPqFKchQirFF3jxjsOm6N6fmmQEZUiO6h7YExT4z00EvYlv8jNPwTZy8jWzX
         S7gw==
X-Forwarded-Encrypted: i=1; AJvYcCXMfUVwmS4DxsgI3U7sqQ+oiTSSQvJGNmfOt5VoE4PjuZxOv7ki0n6FZ64vRekXkMeLf0VHGu0RXJ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGs2hvJfWTV8jNz69VIwsVQlr93llHeqkPCTy57caSuvjnkfP5
	+JBr6kQfFjCiOR43cKozu+B3fIsEIqTfYYQTVm7rJuH8y9w/2ImK15pNUoTKWg==
X-Google-Smtp-Source: AGHT+IEgTuJBXosDAk0w7sVNmnyYggkgpNIDwfXqTwOBNbiInn7BOuBdJMY9KOZqwN9twuJmH4e9Yg==
X-Received: by 2002:a05:600c:3593:b0:430:54a4:5ad7 with SMTP id 5b1f17b1804b1-4319ac76449mr399894515e9.1.1730973904011;
        Thu, 07 Nov 2024 02:05:04 -0800 (PST)
Message-ID: <d32a3eb9-c0cb-4f87-9f88-4fc0d32cf1e8@suse.com>
Date: Thu, 7 Nov 2024 11:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] x86/boot: eliminate module_map
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-3-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241102172551.17233-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.11.2024 18:25, Daniel P. Smith wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -790,15 +790,13 @@ static int __init early_microcode_load(struct boot_info *bi)
>  
>      if ( opt_scan ) /* Scan for a CPIO archive */
>      {
> -        for ( idx = 1; idx < bi->nr_modules; ++idx )
> +        for_each_boot_module_by_type(idx, bi, BOOTMOD_UNKNOWN)
>          {
> +            struct boot_module *bm = &bi->mods[idx];

pointer-to-const? You really want to get used to applying const to pointed-to
types whenever possible. IOW ...

> --- a/xen/xsm/xsm_policy.c
> +++ b/xen/xsm/xsm_policy.c
> @@ -33,22 +33,18 @@
>  int __init xsm_multiboot_policy_init(
>      struct boot_info *bi, void **policy_buffer, size_t *policy_size)
>  {
> -    int i;
> +    unsigned int i;
>      int rc = 0;
>      u32 *_policy_start;
>      unsigned long _policy_len;
>  
> -    /*
> -     * Try all modules and see whichever could be the binary policy.
> -     * Adjust module_map for the module that is the binary policy.
> -     */
> -    for ( i = bi->nr_modules - 1; i >= 1; i-- )
> +    /* Try all unknown modules and see whichever could be the binary policy. */
> +    for_each_boot_module_by_type(i, bi, BOOTMOD_UNKNOWN)
>      {
> -        if ( !test_bit(i, bi->module_map) )
> -            continue;
> +        struct boot_module *bm = &bi->mods[i];

... same here (and likely elsewhere in the series).

Jan

