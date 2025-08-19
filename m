Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E56B2BF31
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 12:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086442.1444636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoJnl-0003VB-Qc; Tue, 19 Aug 2025 10:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086442.1444636; Tue, 19 Aug 2025 10:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoJnl-0003TY-Lx; Tue, 19 Aug 2025 10:42:49 +0000
Received: by outflank-mailman (input) for mailman id 1086442;
 Tue, 19 Aug 2025 10:42:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoJnj-0003TQ-M2
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 10:42:47 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ded0c83-7ce9-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 12:42:45 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6188b5f620dso5696662a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 03:42:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a7560a0f8sm1496434a12.24.2025.08.19.03.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 03:42:44 -0700 (PDT)
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
X-Inumbo-ID: 3ded0c83-7ce9-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755600165; x=1756204965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WIsV9Vd3k3FZNRz6LQtn1B+cKcmfD9qtcjJc7rx23qg=;
        b=YtTKRuQ4y8pPNECsRjfkm3njXhVcFltNen2Pr6dqThytlHVIrew9otTIi3BoAdQoNM
         dDUy2beGLX+DLBf1pmrYalvHKen9b9QvdArLuu4bE83NdtWcoCXAZQGZI0NaRAMKM0qz
         EvwnlXZpmJzCbvYPVBZyWxGxFR6YUrHabGxnwP9IWVCg7F+waBXxzjmulZ1wXT/tyajE
         SmyqU9ZyDLExQRrbjO1+Z867pqjRGNSKnzduypAgshjYJ3JeyFvTKj3wfJOBwx0UK4CT
         ANBRQiu4fdMu8EfdfTRSJpukht7DB8TzSLcdSmZga53QTqd0J7tXgcVobMYWL5lDBJa1
         nr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600165; x=1756204965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIsV9Vd3k3FZNRz6LQtn1B+cKcmfD9qtcjJc7rx23qg=;
        b=BRIxQpE7PRC41nXBrtYvWXaLx9BV8InhmP9eWxlvtS50uLk1AzZp/CSfb0hY4nrJOE
         Vf3XOZur+cP3guwaZ7sAuZQatnyLCXW6OE8ae0RR8K/fBQYyIj2KT5alhmUrdB5IdqRk
         hixkRj47RB/lNUPP6BGilJ/wG0aw9VDBKETonRUSOpGy29HQibLs+yZRHvoTAp7ZTKHQ
         SR6jtYVdZoNztLvuw8/nfcTuy61bSJdJVhSTQ8wUSnBZVgwmmwWI6oUlYd05ZEDPnJvy
         3Lw4XcDmUjIkz0Rrnf/ZPSTFbNE5iaSTcVcWYWPxU/rM5GG8HgwZ8PC1DcePtf93XCvW
         i6bw==
X-Forwarded-Encrypted: i=1; AJvYcCXeilO8X7zwu/OGEezlvbQH1RWmBPIdw/a1jzqfQZAU1c+VnbIrZRPVggMCpqotRrSefs+U7F7nSBY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqeUuTSlZwlO/5YFzTplCO44O+yB6XuhciSNYUkSyQFgERG4YB
	0Rg1jd/joSe4AN3iN0PIqunds/QnFGIo0/2oJyjc8cjeoaH+B0Gy9o5IGJSUFnePmA==
X-Gm-Gg: ASbGncuBnGXp3TQu3OGnsc053BaZxwO9QhpS6zvSi8nZbQ2wIUPhHA5NYYO3io29ojW
	sHTFLKkVEPYCdJGeJt2aXtg/xn13I0/0npIWKpSwa8o76YJIz6b4a/C69F+qL19Y6g17Lxdq1ZC
	xzduwgYbQqNHRhDwiAyQm0yEOfSG5sTfbH6LV/5xhEY1EC9gRIxT86QbWXAo5ikgVDY0xyYcTw+
	b13G96CxPUd9B1wnnZILctMaAxwHgVa54hV7AUnjk18qwVUD/T1Sl5WoElM34fZiFUL6JheAe1T
	SyGoy2u/L0Eyi4+ztHeuiI/scMZyUbxbEMhXrm1SbnysBu5JH+SlijJk0lIirBZ53SnN1vS0pW+
	lKtTjebdEEoaWhrHZ5Pd12uildQEZa+H4ml57nE8+xPdtGTT81fXD+rE8hcjFWMccm0TMY+zeYN
	bXE3wgO/tLv8I/u+L+EFkPlQipcAfF
X-Google-Smtp-Source: AGHT+IFYDHtQunNVz01Hu0Tc98USIMYgaa7L0hngKjqy1sx9mSmwDNLqpF7kDcMZaHzM4KkgV6Q5Xg==
X-Received: by 2002:a05:6402:274d:b0:618:4ab5:e85c with SMTP id 4fb4d7f45d1cf-61a7e76c67cmr1559481a12.34.1755600165244;
        Tue, 19 Aug 2025 03:42:45 -0700 (PDT)
Message-ID: <9c1808fa-1865-40b6-91c2-d6e2cabd8ddc@suse.com>
Date: Tue, 19 Aug 2025 12:42:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] x86: Clean up asm/msr.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-10-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> Now that content has been split out, minimise the header files as msr.h is
> included by many translation units.  A few more TUs were pulling dependencies
> in transitively, so fix them up.
> 
> Give asm/time.h an SPDX tag, and strip trailing whitespace.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I think though that ...

> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -1,18 +1,13 @@
> -#ifndef __ASM_MSR_H
> -#define __ASM_MSR_H
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef X86_MSR_H
> +#define X86_MSR_H
>  
> -#include "msr-index.h"
> -
> -#include <xen/types.h>
>  #include <xen/percpu.h>
>  #include <xen/errno.h>
> -#include <xen/kernel.h>
> -
> -#include <xen/lib/x86/cpu-policy.h>
>  
> +#include <asm/alternative.h>
>  #include <asm/asm_defns.h>
> -#include <asm/cpufeature.h>
> -#include <asm/processor.h>
> +#include <asm/msr-index.h>
>  
>  #define rdmsr(msr,val1,val2) \
>       __asm__ __volatile__("rdmsr" \
> @@ -113,11 +108,6 @@ static inline int wrmsr_safe(unsigned int msr, uint64_t val)
>      return -EFAULT;
>  }
>  
> -#define rdpmc(counter,low,high) \
> -     __asm__ __volatile__("rdpmc" \
> -			  : "=a" (low), "=d" (high) \
> -			  : "c" (counter))
> -

... this removal wants mentioning in the description. I'm actually surprised this
is unused - how does vPMU get away?

Jan

