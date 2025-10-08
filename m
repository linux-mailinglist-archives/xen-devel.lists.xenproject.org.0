Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40101BC4D81
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 14:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139619.1474894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6TOu-00085U-4G; Wed, 08 Oct 2025 12:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139619.1474894; Wed, 08 Oct 2025 12:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6TOu-00082T-0e; Wed, 08 Oct 2025 12:36:12 +0000
Received: by outflank-mailman (input) for mailman id 1139619;
 Wed, 08 Oct 2025 12:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6TOs-00082N-Kz
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 12:36:10 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d5f72d9-a443-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 14:36:08 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b48d8deaef9so1085758966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 05:36:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a83f5fsm1658402566b.32.2025.10.08.05.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:36:07 -0700 (PDT)
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
X-Inumbo-ID: 5d5f72d9-a443-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759926968; x=1760531768; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LRRWQrMYekMqD+3dHObSVgebkxGGFXnh5hWmfrN5GRw=;
        b=dJ06An5V4ScV55amFDqI8wJx2mV68TJqTGWQKv4HCvu9DsH25yxW1TytWW7y0eKPH9
         ZEkiOvvPACoAYbuEp9cnidYCU/w1dr8SA22X97cxN0ZR6Mvvk50+wqE7BL+bMUhuLehI
         vwN13sazoPeiUp0BkxiTDC/5rv8ZsImDc4FPNPYGLP2lgqqyQKXBT+qGL0rNY+uRN08l
         sMiZiO7FMfA2oSAXmpqgTIXydMI+b3DlV2+1vXRqSZmvrCTkamcH3opseZdFY+XwhXIz
         aqtYAIJuJ0cAbUtXqDbKT8J61DQ7r0m0o5vjHM12iJ7Pb95rxlWDF/yjHoeYQdDXjKL0
         jorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759926968; x=1760531768;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRRWQrMYekMqD+3dHObSVgebkxGGFXnh5hWmfrN5GRw=;
        b=JcIDJQeM8Mkhxt1rkR7tGw51i5hXnQGmPMQbJRtG2wPPGdAUI6NhkhgFFgHLCCdMzL
         87MZrpBJELUr2wzzCv1kSCzH74dSoWJUkRkJUC6N6ti2QOCQA8oDQx7x1WyFyrlJgqe2
         bDOjf67axnOj2K8ygQ9Pm9zQQPEglKn2NmzzxamOS+u59iizrm7iLzLwdrT5NteUhsT6
         PCBKcv1IP+7CzzPvMnGzilMxRClqqD2tNm2FK5oG0Q8VxVGhXxy2qUPXMHQaQ8tVxUFd
         12tieyhlerk+RZ4tnlIF6D3V4JKic1lQCayUQNaM7HVgTmF2N28+Gyiz/RiAo+YOgW3I
         8zWg==
X-Forwarded-Encrypted: i=1; AJvYcCWaPCVsNxr1c1hRBV/z4Ip+9R7YydINxFnJNnCAwktEaIrb9H0GXLVTfMmCAQ7g/CzOn5E4d5qQMCQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOE9cnqKOBxMi/Su/unbqNJWvpPwcu8or8x3ztaZyBdoU10ZWq
	h+J+wY4K+hJMHvSkRUxg5yXYx+Xm+bFM3JIykHRBArvJYckfALEfkG0lAqv11ZqAQw==
X-Gm-Gg: ASbGncslFlx2v6neOI/YORbtDH285e76VNG5bjlMOse6hPj1EzrQ3NpzV7owgUE50Yj
	5dhLoEgyurjYAKXQMeYrwCgaYuWx2p8Bgy/20XqKL3+/E+ZbiYbNKWh7jzZHT9mNnFkn/YlEfZM
	DesWnmvYIJpTWN5Ae3mqOv9YwlLAJdcw3E2e3S9UemDKot3y6vuN+HVgdIw809MmK8C50BRrMGt
	5dnDVuPm8WdXBzepacFowrYkv53yD3ulczkPvcDLLSMbcUTBZxbF3mUh4DLr4xcfRAwzw8Yh8cq
	5WXzspiolZQ02oWSApgpXuivOxMCcpkObjQts7DUQzeUbOJYq0G/l7dVzfe0Qt4ZKoEIHXV5uoK
	v2+MRyC/Lm7tTPE5fzfp5gpzoCB8DaAFwl1mRks/rYhoRnT4KrW/Ri69ye4gusN9H0Sh8vbsTBv
	7SCRuI5yOmUZEjsrVg80T531RVUxC5QQXJzSxzqUKCyw==
X-Google-Smtp-Source: AGHT+IGrCLljanlWvMtSPEyEDp5lPNKBD/dWw+YVwwLAP84UpWR9b80YwD7b6NmYHLNYipEdCcBnCw==
X-Received: by 2002:a17:906:4fc3:b0:b41:12bf:e3aa with SMTP id a640c23a62f3a-b50aab9c91dmr361400466b.16.1759926967992;
        Wed, 08 Oct 2025 05:36:07 -0700 (PDT)
Message-ID: <03eae750-36ff-4c6e-a5ab-d231848b599f@suse.com>
Date: Wed, 8 Oct 2025 14:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/22] x86/pv: ERETU error handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-21-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251003225334.2123667-21-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2025 00:53, Andrew Cooper wrote:
> ERETU can fault for guest reasons, and like IRET needs special handling to
> forward the error into the guest.
> 
> As this is largely written in C, take the opportunity to better classify the
> sources of error, and in particilar, not forward errors that are actually
> Xen's fault into the guest, opting for a domain crash instead.
> 
> Because ERETU does not enable NMIs if it faults, a corner case exists if an
> NMI was taken while in guest context, and the ERETU back out faults.  Recovery
> must involve an ERETS with the interrupted context's NMI flag.
> 
> See the comments for full details.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -2345,6 +2345,113 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
>      fatal_trap(regs, false);
>  }
>  
> +void nocall eretu_error_dom_crash(void);
> +
> +/*
> + * Classify an event at the ERETU instruction, and handle if possible.
> + * Returns @true if handled, @false if the event should continue down the
> + * normal handlers.
> + */
> +static bool handle_eretu_event(struct cpu_user_regs *regs)
> +{
> +    unsigned long recover;
> +
> +    /*
> +     * WARNING: The GPRs in gregs overlaps with regs.  Only gregs->error_code
> +     *          and later are legitimate to access.
> +     */
> +    struct cpu_user_regs *gregs =
> +        _p(regs->rsp - offsetof(struct cpu_user_regs, error_code));
> +
> +    /*
> +     * The asynchronous or fatal events (INTR, NMI, #MC, #DF) have been dealt
> +     * with, meaning we only have syncrhonous ones to consider.  Anything
> +     * which isn't a hardware exception wants handling normally.
> +     */
> +    if ( regs->fred_ss.type != X86_ET_HW_EXC )
> +        return false;
> +
> +    /*
> +     * Guests are permitted to write non-present GDT/LDT entries.  Therefore
> +     * #NP[sel] (%cs) and #SS[sel] (%ss) must be handled as guest errors.  The
> +     * only other source of #SS is for a bad %ss-relative memory access in
> +     * Xen, and if the stack is that bad, we'll have escalated to #DF.
> +     *
> +     * #PF can happen from ERETU accessing the GDT/LDT.  Xen may translate
> +     * these into #GP for the guest, so must be handled as guest errors.  In
> +     * theory we can get #PF for a bad instruction fetch or bad stack access,
> +     * but either of these will be fatal and not end up here.
> +     */
> +    switch ( regs->fred_ss.vector )
> +    {
> +    case X86_EXC_GP:
> +        /*
> +         * #GP[0] can occur because of a NULL %cs or %ss (which are a guest
> +         * error), but some #GP[0]'s are errors in Xen (ERETU at SL != 0), or
> +         * errors of Xen handling guest state (bad metadata).  These magic
> +         * numbers came from the FRED Spec; they check that ERETU is trying to
> +         * return to Ring 3, and that reserved or inapplicable bits are 0.
> +         */
> +        if ( regs->error_code == 0 && (gregs->cs & ~3) && (gregs->ss & ~3) &&
> +             (regs->fred_cs.sl != 0 ||
> +              (gregs->csx    & 0xffffffffffff0003UL) != 3 ||
> +              (gregs->rflags & 0xffffffffffc2b02aUL) != 2 ||
> +              (gregs->ssx    &         0xfff80003UL) != 3) )

... I continue to dislike these uses of literal numbers.

Jan

