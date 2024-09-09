Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43AE971C83
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 16:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794586.1203588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfNa-0005im-Ek; Mon, 09 Sep 2024 14:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794586.1203588; Mon, 09 Sep 2024 14:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfNa-0005gA-Bb; Mon, 09 Sep 2024 14:28:34 +0000
Received: by outflank-mailman (input) for mailman id 794586;
 Mon, 09 Sep 2024 14:28:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snfNY-0005g4-SL
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 14:28:32 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c95bfa01-6eb7-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 16:28:30 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so423424566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 07:28:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d54978sm348907266b.199.2024.09.09.07.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 07:28:30 -0700 (PDT)
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
X-Inumbo-ID: c95bfa01-6eb7-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725892110; x=1726496910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UWZMbvwWhIE273du1eUM/azQXUe7AsJB1EQLB2t7Tr4=;
        b=dVfZ6Kz0JP2BbbcPNxDIZ7wxRWHk3jwnOtJf5tO1nwnKac4lzfHtfBW8tiixXTLKob
         eKXjBtxVKhbH2I8oI6+pbIE6sYEnxT8LqMCuYtD1v/h2glZZ52zVZyxXRv1l7RVOImyr
         cpDY1LFmMt4x3qEhWssGwmV5SVpq/Ta6ddNK/ehBKO/ikUp/dPFn2B8T+B6NqTMfxwTB
         eInklQkei26olLiWsjcp7SpryEChzzgtycx2o6gxP/rqIvAF929LYFfJRs4STO5Jtgmo
         V2ZuP0wo3abm/+EHkyWue77aq/oJqOyWeWCk/W4CsUSxTacn44TW05Js3efPgoJlxKst
         Bapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725892110; x=1726496910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWZMbvwWhIE273du1eUM/azQXUe7AsJB1EQLB2t7Tr4=;
        b=eNH6ixo6WemTa9M0shftIuHD/dkT7zxvw2+k/ybM1uJhy8mcvVccvEerepLrs66wB0
         uNpSBCcTk8vZ65vothJCXGT92b90KgFyFAh1IAz+1Gb3HpFCnl0TIylowt0eYR3xMiyM
         Dmoldc34V2VlXuIpQfd4oT5fceNrcMmwbyK9e5MDeB5nZP6fZYI+hanZXMGG0AFR63E1
         7rl7ZKa3QugE6LPdfa9hyz09Sq3IdSthBHO+m7eopJIrAMw+zMB0+J03Bh62YyKDLCB1
         TX+abU3XWdVDvgG427s+ZERRB8okuY6Gv6DXTo+b/p9qlyhXKsGO+1336Z+Nm8fYXN1K
         gjgg==
X-Forwarded-Encrypted: i=1; AJvYcCU6r1GoeeJ9KJPeHv9TsvUj7NVFQTXm1IMN0V5SWicaadlZdXaRRf+5UVFZlf3ba3WOMArrZv4SVNA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyyqs7JrbhXEThJy5EITLkjF9Du8hiro6CZ/wBhgrAlIB+/5Is1
	nL7i6Pqa2t0ex1QAQZV5x5/EmZrEPVPUhFf/2gqAhT9FNha3upDEz01bqVXOZw==
X-Google-Smtp-Source: AGHT+IFwWRT5mu03/7rav8umfPAjACaSM7gMC95Zz8nCbWmWEMoso908l7TA8l3OwzTfnaNyzPz6Rg==
X-Received: by 2002:a17:907:7fa9:b0:a7a:aa35:408c with SMTP id a640c23a62f3a-a8d24512940mr628176566b.8.1725892110290;
        Mon, 09 Sep 2024 07:28:30 -0700 (PDT)
Message-ID: <6526365b-fcfe-410a-934a-4e18083ac993@suse.com>
Date: Mon, 9 Sep 2024 16:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] x86/mwait-idle: add dependency on general Intel
 CPU support
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240905160058.493057-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240905160058.493057-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2024 18:00, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/cpu/Makefile
> +++ b/xen/arch/x86/cpu/Makefile
> @@ -8,7 +8,7 @@ obj-y += common.o
>  obj-y += hygon.o
>  obj-y += intel.o
>  obj-y += intel_cacheinfo.o
> -obj-y += mwait-idle.o
> +obj-$(CONFIG_INTEL) += mwait-idle.o

I'm okay this way, but I wonder whether Andrew - just like for PSR - would
like this not directly keyed to INTEL.

> --- a/xen/arch/x86/include/asm/cpuidle.h
> +++ b/xen/arch/x86/include/asm/cpuidle.h
> @@ -15,7 +15,14 @@ extern void (*lapic_timer_on)(void);
>  
>  extern uint64_t (*cpuidle_get_tick)(void);
>  
> +#ifdef CONFIG_INTEL
>  int mwait_idle_init(struct notifier_block *nfb);
> +#else
> +static inline int mwait_idle_init(struct notifier_block *nfb)
> +{
> +    return -ENOSYS;
> +}

As mentioned elsewhere before - please don't abuse ENOSYS. Seeing how the
function is used I even wonder why it has return type "int".

Jan

