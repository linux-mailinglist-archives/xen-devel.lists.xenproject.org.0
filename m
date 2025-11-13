Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FCAC56AE3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 10:49:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160831.1488879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTwm-0005o4-AG; Thu, 13 Nov 2025 09:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160831.1488879; Thu, 13 Nov 2025 09:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTwm-0005lN-6y; Thu, 13 Nov 2025 09:48:56 +0000
Received: by outflank-mailman (input) for mailman id 1160831;
 Thu, 13 Nov 2025 09:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJTwk-0005lH-Ko
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 09:48:54 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f66d2ff1-c075-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 10:48:52 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b735487129fso63401466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 01:48:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed80f0sm124507266b.66.2025.11.13.01.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 01:48:51 -0800 (PST)
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
X-Inumbo-ID: f66d2ff1-c075-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763027332; x=1763632132; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SK0JPbL+U5AOnhbtjDfulyIUpo+HnOPs20u2boZFh9A=;
        b=KRuitHp1YeD8Q1yyHfnnMId7i7gxYzJ780J2kjvnr96MbheMckHcHC0ODM7PAA8ypB
         AyRnRYujw0WTFVF5MdV2rHFoKw+FWa01foPQmI5DV5Os0Vy4wEef1TFelFbt++iSe8dK
         XWiTu9/TBeC1+1RU9TpD5vO7CQfgBs1vIRLsKyHlyd8NVk0m1XBU7Hcy7WTgvgOQXc+p
         GrcUs6VYYIfC9rnZLkG+Okudej5bk5dIYIVsOBuJOVWmm3oNOM0DNM8oMqwjnGc6u7bm
         QZcYx6dzi7fJAH+0mAj2cIRxgqT3JUMkUUAoJ+T86vSdy3eeso+z3SBbf1QQqG3h9BJI
         TJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763027332; x=1763632132;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK0JPbL+U5AOnhbtjDfulyIUpo+HnOPs20u2boZFh9A=;
        b=vrAhpGx43Zn9iWQMlqfsCuZEyn4Zwq7ZyqvBUBhZZU4xIYS8tKa+MNbY3/B2q2Q/de
         dNBiJ255k1Nc5poIX+QuX4mMeKjZBkSmMAY/cSYiddACag5GpjEoLAKC0tW5oWyrsrrg
         qrpe/5mvi4BVW4X3O1ySAwuRy7FLvKJdhzyy//3xApEvSNYz7zhNFj0R2YfkecIC1e1/
         8in4YbkVQz+3kTpDO0GpeCo49VTLU1ibvKzrolmTdEnrQ3yUzS8RZliq3+6qb7DmkQmT
         YcpNhhOVHk62qL739z1Qd7ngVQAQzmPLO3hIsjJkW8fyzx07va3/+gosyPSBz2QVGrY5
         fqeA==
X-Forwarded-Encrypted: i=1; AJvYcCXRjA+Xap+OuV1t8SLQaY9+uudT7nmmazmmU52GAtxWgrxpg3ifFpkU4eKViJIS8Jav7qYodS+Y6ds=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9o8F1Vg+Z84Zp75hPBap+Swldp3PLls1BbXeu+7OZc/r+QOdz
	0MwpsOdC8yZQiTmqe08VaJDFBAlXbWhhTFuXsiEJSPYRLUfpVvSBU/IXXaOM6MeAfw==
X-Gm-Gg: ASbGncscIic8gQGm1wIc+rx86F+IfTK7F01KqQK4kj1mfzKFUTeSaWQtcz3YsYvsY0C
	Zr2GFRJKsYWb+nJUhQ5Etzub8Ct4I9fpVvgANQzmiJjOmk1TFZqV6WZSTEGr29p20oqM8x/4K+o
	MnqR6A8DJGCTULs4xrnzlDQN2qx9d4+PkGTzL+gvY3G8C8kSvaUxPbgVn81JxpRe3jZFZcuIqP6
	BqvIDXy7VW5rY3Z9xWBh5WEtSg0MdUl21J+XC3oX14GFbYMBJFxRg4u4mxf67m2dfJXBShFFsOS
	vHCu07jSms/Mhqx9Lygs8GcI7LFMhE15PzIO9tjKFUJ6WW6gEMhQG6ZMGxmezMPzK7DeZ97F0hR
	Tn0lsF6lq9U/KOtOxj2ezGmgmV5NsmZ8r1DHXRDICp/I/1rFVxGo3XSihPeGcnNPLYAU0tURTMP
	V4KcI1d48chQ58H4BFrKQOW9+EZJGt6ChFsUE0UcMk8fbnMZHkRWtJyn3BjMyn0TUf
X-Google-Smtp-Source: AGHT+IF+oY/iXXqDvmvaiS5+26d5qafl56HrbUWIOBEu6AJMU7vOtUM3htqMmteVbfHINRFrROFrNA==
X-Received: by 2002:a17:907:60cb:b0:b6d:5718:d43f with SMTP id a640c23a62f3a-b7331a69bb1mr619141966b.39.1763027332204;
        Thu, 13 Nov 2025 01:48:52 -0800 (PST)
Message-ID: <a4407571-5185-4203-a0a5-8cb7821055b2@suse.com>
Date: Thu, 13 Nov 2025 10:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] xen/mem_access: wrap memory access when VM_EVENT=n
To: Penny Zheng <Penny.Zheng@amd.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20251113031630.1465599-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 04:16, Penny Zheng wrote:
> Feature memory access is based on vm event subsystem, and it could be disabled
> in the future. So a few switch-blocks in do_altp2m_op() need
> IS_ENABLED(CONFIG_VM_EVENT) wrapping to pass compilation when ALTP2M=y and
> VM_EVENT=n(, hence MEM_ACCESS=n), like HVMOP_altp2m_set_mem_access, etc.
> Function p2m_mem_access_check() still needs stub when VM_EVENT=n to
> pass compilation.
> Although local variable "req_ptr" still remains NULL throughout its lifetime,
> with the change of NULL assignment, we will face runtime undefined error only
> when CONFIG_USBAN is on. So we strengthen the condition check via adding
> vm_event_is_enabled() for the special case.

As to this, didn't I ask for ...

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -52,6 +52,7 @@
>  #include <asm/i387.h>
>  #include <asm/mc146818rtc.h>
>  #include <asm/mce.h>
> +#include <asm/mem_access.h>
>  #include <asm/monitor.h>
>  #include <asm/msr.h>
>  #include <asm/mtrr.h>
> @@ -2081,7 +2082,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>  #endif
>      }
>  
> -    if ( req_ptr )
> +    if ( req_ptr && vm_event_is_enabled(curr) )
>      {
>          if ( monitor_traps(curr, sync, req_ptr) < 0 )
>              rc = 0;

... a comment next to the (now seemingly excessive) condition?

> @@ -4862,58 +4863,70 @@ static int do_altp2m_op(
>          break;
>  
>      case HVMOP_altp2m_set_mem_access:
> -        if ( a.u.mem_access.pad )
> -            rc = -EINVAL;
> -        else
> -            rc = p2m_set_mem_access(d, _gfn(a.u.mem_access.gfn), 1, 0, 0,
> -                                    a.u.mem_access.access,
> -                                    a.u.mem_access.view);
> +        if ( IS_ENABLED(CONFIG_VM_EVENT) )

Wouldn't this then better be vm_event_is_enabled()? Or can this (and the ones below)
be carried out ahead of enabling? Tamas?

In any event, here and even more so ...

> +        {
> +            if ( a.u.mem_access.pad )
> +                rc = -EINVAL;
> +            else
> +                rc = p2m_set_mem_access(d, _gfn(a.u.mem_access.gfn), 1, 0, 0,
> +                                        a.u.mem_access.access,
> +                                        a.u.mem_access.view);
> +        }
>          break;
>  
>      case HVMOP_altp2m_set_mem_access_multi:
> -        if ( a.u.set_mem_access_multi.pad ||
> -             a.u.set_mem_access_multi.opaque > a.u.set_mem_access_multi.nr )
> +        if ( IS_ENABLED(CONFIG_VM_EVENT) )

... here please avoid this heavy churn by using the inverted condition plus break;
In all cases you fiddle with rc also needs setting to a suitable error indicator,
e.g. -EOPNOTSUPP, I think.

Jan

