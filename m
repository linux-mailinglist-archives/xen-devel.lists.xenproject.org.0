Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C628B5DFA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714269.1115425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1TC4-0004EF-MP; Mon, 29 Apr 2024 15:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714269.1115425; Mon, 29 Apr 2024 15:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1TC4-0004Bu-Iu; Mon, 29 Apr 2024 15:45:28 +0000
Received: by outflank-mailman (input) for mailman id 714269;
 Mon, 29 Apr 2024 15:45:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1TC3-0004Bo-A1
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:45:27 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ebf8a4b-063f-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:45:25 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4196c62bb4eso35508875e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:45:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c4f9200b004169836bf9asm45669019wmq.23.2024.04.29.08.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 08:45:24 -0700 (PDT)
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
X-Inumbo-ID: 7ebf8a4b-063f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714405525; x=1715010325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9yE8/ejgd04g2DivR7ffT5b7HXSpg6jS8PgMe+disww=;
        b=GvGoI/nNlDpTCc1TU5w1bl5T13UlulPgFMZRiENR+KCr91uGlVXey/vIp5K6G4E3x6
         +0wHNOBWnfBIINzr3iqpJxfJaxa0W1AAr3k0J4cckjNgH1d/Sb8gLW4Xu1wDo2EEiLhg
         VxpOAawKJ69YCzB4le+iA8MBEb8tv4WeB/cl1mL5YMal6R/jUsqB254nJKeGCJ8boCPu
         GoXhijlqBxTRaU9Kjf+9L9+67XT+gxJgnDsHOgVQvn2n/IFIrYFCS0tr3CyOAhVtJCAB
         6s53/yjLXdVR6OpPrMmX5iMq3IO9c/+HGCLdbax8vl4tJ75QA+soN2gcRZ06q8/mybIR
         LRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714405525; x=1715010325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9yE8/ejgd04g2DivR7ffT5b7HXSpg6jS8PgMe+disww=;
        b=dDzLhwtYo6Qwv/qL3tamam7iBWlVY2qlIEvEl17gneIsN1ukQ3YuyewKITorFx5F7G
         m0EwLkwyS5nLZiYxfOSCF6LCm1GpiH/hZ3EeZg+3ZxnTYxhF9WJHFyvUpQDzsRs07pn3
         FGAvhqTNn+xrUrDHaZnh8u81cwkxhF+HTxsq9Ju2bXoVwSMuf1ifSoa+asadHRTgBwb/
         6vB5KSSckZqpZAVcP6c2+ywH5NMTEillYXwOl1hT3OH1phO4UTeaexW5dMzsZLngHFwe
         ELr9wkQdKwktB1lYlKnRfrAmecFVaPhEEs5mWwEzZWAf3h5Md0a/EtnaCO52AdNB3l4S
         pqWw==
X-Forwarded-Encrypted: i=1; AJvYcCXDaMcV7OnQ887FZwVHXU/sVqNGjMUYD6kqDtLvTHYnySZPPh3/ya+ZcG/rYYsE29v2zkbWIKp+jK8ds6WnRItdPq/0sLrNE/GbQLDHdQA=
X-Gm-Message-State: AOJu0Yw5FA7l9TGSpyWgrF+Y+OFF0r0+08U+qEiaPSJp54jeUGa5dwWr
	HvH0l5ULK+23FK0zOVHxnC7cYdhadPX+2SNaaRixqyQTHxqNu27TnMV1m8afjvWn8keWmRYa6TE
	=
X-Google-Smtp-Source: AGHT+IHaiUbZRuHHx1+rlnQBXl6dJxpNEn5n/K+hTzYd1mMnkGgSXHJHimJ+Hh1fgNuENm8DhCF2Ww==
X-Received: by 2002:a05:600c:c0c:b0:41b:ef52:1677 with SMTP id fm12-20020a05600c0c0c00b0041bef521677mr4312415wmb.27.1714405524682;
        Mon, 29 Apr 2024 08:45:24 -0700 (PDT)
Message-ID: <bbf9204c-6556-48e3-b7bb-f7097b2dc316@suse.com>
Date: Mon, 29 Apr 2024 17:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 5/7] x86/MCE: guard {intel/amd}_mcheck_init() calls
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
 <0c7d28740db4d6581ebc81a158c970258e547959.1713860310.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <0c7d28740db4d6581ebc81a158c970258e547959.1713860310.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 10:56, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -761,7 +761,8 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
>      {
>      case X86_VENDOR_AMD:
>      case X86_VENDOR_HYGON:
> -        inited = amd_mcheck_init(c, bsp);
> +        inited = IS_ENABLED(CONFIG_AMD) ? amd_mcheck_init(c, bsp) :
> +                                          mcheck_unset;
>          break;
>  
>      case X86_VENDOR_INTEL:
> @@ -769,7 +770,8 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
>          {
>          case 6:
>          case 15:
> -            inited = intel_mcheck_init(c, bsp);
> +            inited = IS_ENABLED(CONFIG_INTEL) ? intel_mcheck_init(c, bsp) :
> +                                                mcheck_unset;
>              break;
>          }
>          break;

Same question as on an earlier patch: Why set a value different from
what "default:" below here does (really: keeps)? And why not arrange to
have that "default:" take care of what's build-disabled?

Jan

