Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D029C8A986A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 13:19:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708229.1106924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPnB-0000NY-BN; Thu, 18 Apr 2024 11:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708229.1106924; Thu, 18 Apr 2024 11:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPnB-0000KZ-88; Thu, 18 Apr 2024 11:19:01 +0000
Received: by outflank-mailman (input) for mailman id 708229;
 Thu, 18 Apr 2024 11:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxPn9-0000KN-Q5
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 11:18:59 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 733b886b-fd75-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 13:18:58 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-418def30e50so4427365e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 04:18:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e15-20020a05600c218f00b004146e58cc35sm5985025wme.46.2024.04.18.04.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 04:18:57 -0700 (PDT)
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
X-Inumbo-ID: 733b886b-fd75-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713439138; x=1714043938; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHcEi203e2vk1EnLF0eYemKKOMZaurZNtGdQwkwH48o=;
        b=XAjfKOUBnMuRjE/7lV/CFLdVtb0xLW+mc7iMT3YxJ15EnaVS80Z7oRcCejL9xD/T2V
         mlTugTvNa8KTY8eCzm5wcSCwJqYPoYVSQRdrkU4xbN7zJAYBK9ouyn1NYg7ewGza/dML
         0dfGy4ZSicE19IX44U4CcLzsQ8IMtOIiRGlMnS0p2egffpqMAvCIcBCg8YqJUegRuFbL
         bgSCJ510d46IPqAzKW49BTpA4kIpLo+S6txFVKjCmjMynIJ+cmOnKXzKydZ+wCuRYZc9
         2QtTyFrEGEwdrNMyQBdFi4cisCAk5IL2rDsIYQO7MOqhveSMsryD5DX/q5UvgybQ0/Tk
         lVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713439138; x=1714043938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHcEi203e2vk1EnLF0eYemKKOMZaurZNtGdQwkwH48o=;
        b=ARLcG+Brrhix8hX8x7aahEOXrkClM5pHIOV1M+2U3SbWYyO3KWwazxNGKHYpYq/cC7
         TsGKb2QyeBWJAq755fCH1t4sEaTfNgaqUQhh4Yps3vCxyVDGQmY9mny/PUt6Uoo2r+Wy
         kldJqNo6l2xb6FSEeGwMVLhdrggsop3CX7ZGAbIdI31LdPFGtM9LADSU6owq4xFl6JW4
         MBXxaGHV7y7SrW/+S+05pluZNqAIa1UHIzkIIDYqXgI2Phc3lox4LyytxaeaLqqIXCCE
         DDWAVSt12PQW6Dc4SW8RheBZZzEgSg90gFfKuwKIgCzC4dwDbuALZJkeNstIkBiVX/+m
         aOWw==
X-Forwarded-Encrypted: i=1; AJvYcCUZap0UVrMVeK/P72YzUA+d53VmfZsrMydgMWPkBFA8TGMMxgEVPtPgz0H+PKlqNCIz+PK49Eze79Nz7iZPj4uylNyAFRkQnr6BKKyMhhY=
X-Gm-Message-State: AOJu0YweSo0lWztoncpiz/v6wg2cLoATsHpv0LatxZlw9wEhCXkUg+XS
	spMgLRyZ/BMsAJ+Twp0WvY59UPkAgSHZyWUKMUhuGh/TQsTTmTKARus/UwSzEA==
X-Google-Smtp-Source: AGHT+IH/9777xODx89hQxA9p4KeQxhHCuJgE9AWSBBC/G/k4MaJ7ypPx6uEzetATLLDQtbKlS6FA5A==
X-Received: by 2002:a05:600c:4f47:b0:414:90c3:f5be with SMTP id m7-20020a05600c4f4700b0041490c3f5bemr2000574wmq.36.1713439137684;
        Thu, 18 Apr 2024 04:18:57 -0700 (PDT)
Message-ID: <8fbd604e-5e5d-410c-880f-2ad257bbe08a@suse.com>
Date: Thu, 18 Apr 2024 13:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 02/15] x86/hvm: guard AMD-V and Intel VT-x
 hvm_function_table initializers
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240416062258.3468774-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240416062258.3468774-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2024 08:22, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -156,9 +156,9 @@ static int __init cf_check hvm_enable(void)
>  {
>      const struct hvm_function_table *fns = NULL;
>  
> -    if ( cpu_has_vmx )
> +    if ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx )
>          fns = start_vmx();
> -    else if ( cpu_has_svm )
> +    else if ( IS_ENABLED(CONFIG_SVM) && cpu_has_svm )
>          fns = start_svm();

Do we have or do we foresee any uses of cpu_has_{vmx,svm} that are relevant
when CONFIG_{VMX,SVM}=n respectively? If not, I'd prefer if the IS_ENABLED()
would be folded right into the definitions of cpu_has_{vmx,svm}, as is
already done for a few other CONFIG_*.

Jan

