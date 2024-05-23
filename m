Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA70B8CD6C3
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 17:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728645.1133663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAA5o-0004fr-RJ; Thu, 23 May 2024 15:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728645.1133663; Thu, 23 May 2024 15:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAA5o-0004dP-NZ; Thu, 23 May 2024 15:10:56 +0000
Received: by outflank-mailman (input) for mailman id 728645;
 Thu, 23 May 2024 15:10:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sAA5n-0004dJ-6J
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 15:10:55 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e9464ad-1916-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 17:09:47 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a59cf8140d0so935804166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 08:09:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1787c63bsm1949324766b.51.2024.05.23.08.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 08:09:46 -0700 (PDT)
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
X-Inumbo-ID: 7e9464ad-1916-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716476987; x=1717081787; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=buMAg0LS8akaLYVn1mf1luZlef5FqtF+8iT745eiTPQ=;
        b=M4Zjy8lA++k1LH1tBehoWiNrSnil4lkDgJKQU5rzB6HtSx3zjRt8ev/RejGfXRzNHd
         U25PHBDigg7CWp44YPTJvjaDvWbUPJ5VOv/yGnjxC0+xatoTNWeY7cO5OXBGYrWfJXz/
         E9TqiGjz20V04z/W/oKVwdnrHlyTsWOH7TXEN4IIdmw1fz369RLeMduJ6gvAJUybS6Vk
         ywnpmHleg0NGxlPMklRNFJ81grAsJ2okJirihyNP0KcvgT3fvgPx1WkyzNDlE/lGV3jV
         fWS3r/L3spfbInoWnU66zHJYNhJMC0arFX9luTJBlAEwVR94fi8TszSB35XKvbAzUm95
         dnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716476987; x=1717081787;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buMAg0LS8akaLYVn1mf1luZlef5FqtF+8iT745eiTPQ=;
        b=sOUYi4XJHDLM4sOVpPHrU8NNadprsJ9rjcq3aXu0+mDVhGK02nWs1QsaqqDcBfIRSL
         HPBqQlQcu5AUuVv7Qn23+CkoYCNGv5yCVm/KmbqW50PU+r4pSqpRlKM93LjcbEQtArwM
         qtbd257fM27AF0HFpuaUQ6C7q2rqPpLyV9qSyX8H/pmyzwE5doxwvscOjUVZ3ejW10bv
         4yggBIxylV3bJv0MtU963Y8p3+IUvfCpVdxmKR7BRy1Es3UbKJG8CekiElHTGrmGYebH
         fgeUuP1T1G5JnpBo+N5t3r2o1BDjShpzInHA0w0k83LgpuWVx29YM7asAjVLqB/51ggF
         mmbw==
X-Forwarded-Encrypted: i=1; AJvYcCWcjLVC3wTIEvOihKzX4cc4yNZ19fR9KbpcdSj96RVcCYY8UPXD0ws183rQln+bTrV2E8CVKicdPA6fxgILR1AzlSnXHfK5pllaGf05gkY=
X-Gm-Message-State: AOJu0Yzbtfcpx5daRCWIDVUPxiEzDJCPynBz60Za6aPP7khisJdR0vyl
	WEP97I6hs+mO3fWxvvwFZIGyqJUFCNdOXj+GYr4AMDCqLvhS8MccskIoQl3bsA==
X-Google-Smtp-Source: AGHT+IFJHdPcenIMGjRAmc4re1PrzhAy95N3NTcdJzLheVYPZq5oaJ6ZqnQn+4w1/sliI+3BAX498Q==
X-Received: by 2002:a17:907:26cb:b0:a59:f30e:fecd with SMTP id a640c23a62f3a-a622807a844mr454892266b.2.1716476986989;
        Thu, 23 May 2024 08:09:46 -0700 (PDT)
Message-ID: <1def14d9-f98e-432e-b5bb-db6cd64676a2@suse.com>
Date: Thu, 23 May 2024 17:09:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] x86/xstate: Fix initialisation of XSS cache
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240523111627.28896-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2024 13:16, Andrew Cooper wrote:
> The clobbering of this_cpu(xcr0) and this_cpu(xss) to architecturally invalid
> values is to force the subsequent set_xcr0() and set_msr_xss() to reload the
> hardware register.
> 
> While XCR0 is reloaded in xstate_init(), MSR_XSS isn't.  This causes
> get_msr_xss() to return the invalid value, and logic of the form:
> 
>   old = get_msr_xss();
>   set_msr_xss(new);
>   ...
>   set_msr_xss(old);
> 
> to try and restore the architecturally invalid value.
> 
> The architecturally invalid value must be purged from the cache, meaning the
> hardware register must be written at least once.  This in turn highlights that
> the invalid value must only be used in the case that the hardware register is
> available.
> 
> Fixes: f7f4a523927f ("x86/xstate: reset cached register values on resume")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, I view it as pretty unfair that now I will need to re-base
https://lists.xen.org/archives/html/xen-devel/2021-04/msg01336.html
over ...

> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -641,13 +641,6 @@ void xstate_init(struct cpuinfo_x86 *c)
>          return;
>      }
>  
> -    /*
> -     * Zap the cached values to make set_xcr0() and set_msr_xss() really
> -     * write it.
> -     */
> -    this_cpu(xcr0) = 0;
> -    this_cpu(xss) = ~0;
> -
>      cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
>      feature_mask = (((u64)edx << 32) | eax) & XCNTXT_MASK;
>      BUG_ON(!valid_xcr0(feature_mask));
> @@ -657,8 +650,19 @@ void xstate_init(struct cpuinfo_x86 *c)
>       * Set CR4_OSXSAVE and run "cpuid" to get xsave_cntxt_size.
>       */
>      set_in_cr4(X86_CR4_OSXSAVE);
> +
> +    /*
> +     * Zap the cached values to make set_xcr0() and set_msr_xss() really write
> +     * the hardware register.
> +     */
> +    this_cpu(xcr0) = 0;
>      if ( !set_xcr0(feature_mask) )
>          BUG();
> +    if ( cpu_has_xsaves )
> +    {
> +        this_cpu(xss) = ~0;
> +        set_msr_xss(0);
> +    }

... this change, kind of breaking again your nice arrangement. Seeing for how
long that change has been pending, it _really_ should have gone in ahead of
this one, with you then sorting how you'd like things to be arranged in the
combined result, rather than me re-posting and then either again not getting
any feedback for years, or you disliking what I've done. Oh well ...

Jan

