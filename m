Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839FFB3E3CB
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 14:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104696.1455721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut46g-00029r-Oe; Mon, 01 Sep 2025 12:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104696.1455721; Mon, 01 Sep 2025 12:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut46g-00028N-Lp; Mon, 01 Sep 2025 12:57:58 +0000
Received: by outflank-mailman (input) for mailman id 1104696;
 Mon, 01 Sep 2025 12:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut46f-00028H-GW
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 12:57:57 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46e355e5-8733-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 14:57:55 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso7356766a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 05:57:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbbd1sm7182251a12.34.2025.09.01.05.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:57:54 -0700 (PDT)
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
X-Inumbo-ID: 46e355e5-8733-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756731475; x=1757336275; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pm3N569WsBs5aGMe2i6gJDw1Vplh6X00fnZ76aUICsg=;
        b=O264KnusR4JLKheBexgsGGC6BeFW+mPKMTQf7Q9PFFzCWgC2HPcGXMkcHtrgAvJBku
         AIazVs41UKmGQuHg6eE2d01oDrcdHgQhB8ZaSlXEBld6bApF3WHxh0w/+INXWxrGcGe5
         oodQCQ98/uAxADofB1k5MtterYcn3sKShdAqUbnf/8MB6HhHus11KNr4Ac2tV7+CPWMX
         4BGnORad+dj/5dioo0O5Lvq1D8vgoQnOdLWPWtG6z2rvpKysOd+wmeaToh8Q+TLkWPCf
         cFg87mUgzo6O7NeMhPbdFaP7HllDv8+3/UgWqoxMhqlUg1KgD4n7lo2aRN8gkckYDn97
         MSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731475; x=1757336275;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pm3N569WsBs5aGMe2i6gJDw1Vplh6X00fnZ76aUICsg=;
        b=ZFT7nvEBnehvo87grogscjqxq0XhiLxYPgT/ljdkqYHBLyCks0OjQXJ13xHptCcRCv
         hVFOOarBP5SH0SRAYEBk3iv5JR+HGj6QTpje1dLVRYc+Wdf3Ud4QZ6v9BAuHaog62JB9
         KsKf8wruUtzDKdJoCxyKhpeHKnSMytNDXgGz1zE4ybQkwK8GJpb1WXPe+Rjmz/k4WJQz
         AtaPPQAhaMMub2Atf9RlkyR6xTyqhhvXvQpSeYDql/JFJylGvMsFip1+5GCgiXJZfTZq
         enuRl/yoRuYDM69xdEqhLsH4LHR8SL67EBlRDYsVlFUY1VmFMmLZtV4GL2ewVRGaJpOd
         jDog==
X-Forwarded-Encrypted: i=1; AJvYcCW5msg7HRpalSbApGnDS+ZnMoUNnuYQCAshwsCEONkNE5iPxb7GVIH/FsTL8wf5V4737o9ATlhbTO4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoSkqR2gNf00Xe8ZkVSw/l/NDnukPeGx7kyxDgkkh3uJXuTRfq
	MSp9lFgh4FubLsiDKqOpIjr4mhn3SLMf/evCo5MgTAWgpUue2wJX5hhXNeptdJ75tQ==
X-Gm-Gg: ASbGncvBH4f1ZzSJVNhmrQ+utOVvWQMFfRfFAp+zeniiv9Kbe7ZxNC0vMCCH4vZTKIz
	CVq4FNfxX2hCprlZm0aX5ewIrd3N0IxgkopN0XR+6p//kcPFyEJRDErlxu0RfOe5TsiaEEpYz21
	WK+/pMm3crrzKdFq2UWZ/y/4kOdf2In+uRK6ItFKUD1h/eWxIJhprM2vaG3U7QCc2VrKesgjAhT
	uIznapzOBCiZcgNnfd+WFr3AYgTSb6y/+2sZHl+vo/nSCD5rL2Aohel9QtI7lQhwL9ebBYqiRhn
	DNuENIt9pN1GXOS5aFWv+Qt9u5iEuKCLrRo01Xj3LVGswAxDBbCQIqHhxfRSx5D1zDzGNn9krsV
	MhLSuprJCx14kz5KcgQ9rYyjuUQYMuP0YyIZVelM6OWPJBas7rSxEanAW68OC5iIXuy91q7WTPo
	3Mr3k6myOd9JmVG+W3Kw==
X-Google-Smtp-Source: AGHT+IEgmXFcicdsXwnsS7WShACTSHNXO33DMXdHeh2zCuw8+AvhSf1su6vGhe1cm/J6G3QDtEIQsA==
X-Received: by 2002:a05:6402:505c:b0:61c:e1d6:6bf6 with SMTP id 4fb4d7f45d1cf-61d26998f14mr7159411a12.7.1756731474598;
        Mon, 01 Sep 2025 05:57:54 -0700 (PDT)
Message-ID: <1800ea68-eee1-4433-aa22-954dcd226fe5@suse.com>
Date: Mon, 1 Sep 2025 14:57:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/23] x86/pv: Exception handling in FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-21-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-21-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:04, Andrew Cooper wrote:
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -2265,9 +2265,83 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
>  
>  void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
>  {
> +    struct fred_info *fi = cpu_regs_fred_info(regs);
> +    uint8_t type = regs->fred_ss.type;
> +    uint8_t vec = regs->fred_ss.vector;
> +
>      /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
> -    regs->entry_vector = regs->fred_ss.vector;
> +    regs->entry_vector = vec;
> +
> +    if ( !IS_ENABLED(CONFIG_PV) )
> +        goto fatal;
> +
> +    /*
> +     * First, handle the asynchronous or fatal events.  These are either
> +     * unrelated to the interrupted context, or may not have valid context
> +     * recorded, and all have special rules on how/whether to re-enable IRQs.
> +     */
> +    switch ( type )
> +    {
> +    case X86_ET_EXT_INTR:
> +        return do_IRQ(regs);
>  
> +    case X86_ET_NMI:
> +        return do_nmi(regs);
> +
> +    case X86_ET_HW_EXC:
> +        switch ( vec )
> +        {
> +        case X86_EXC_DF: return do_double_fault(regs);
> +        case X86_EXC_MC: return do_machine_check(regs);

Looking at patch 21, I came to wonder where it is that we're moving back to
SL0 in the #MC case (which may not be fatal), for ERETU to not fault.

Jan

