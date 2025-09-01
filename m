Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F82EB3E44B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104742.1455791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4LS-0006Rs-Qm; Mon, 01 Sep 2025 13:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104742.1455791; Mon, 01 Sep 2025 13:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4LS-0006PF-Nv; Mon, 01 Sep 2025 13:13:14 +0000
Received: by outflank-mailman (input) for mailman id 1104742;
 Mon, 01 Sep 2025 13:13:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut4LR-0006P9-EL
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:13:13 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69850299-8735-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 15:13:12 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so703331466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 06:13:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0421939da1sm321263766b.27.2025.09.01.06.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 06:13:11 -0700 (PDT)
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
X-Inumbo-ID: 69850299-8735-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756732392; x=1757337192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zmP/0ptYzR7dKdtH5ZrLLoZGHqV9Yo6We6i71YTkul4=;
        b=Jf7uq2YFV2PYNdQkK8a4KiZzxDPGPc4aYhIc1kCxhuQzUPIgnd7NqG8J2CJ0JrDB96
         mctnDLbMD4YpBwP3eXdt8d+OW76lLSTOyKFDbvZptrLmqX6G4HGBBEFPoVsRIpKREhy9
         qTiqFosOVo5b9Nx5acGoqcnvpLihDJPc1cjbgQsTVAqMy3rBoKiHUmhvu0T8R6iBHPmz
         Qi5TZlzQjB4H+ApXg8W5Zxauqv2oSDz4JprWFE6kU8N188aEdluGDUHM81xbFFB/hQSX
         bD9EiMDLZYLOekYkPqblpD+G8JtS/cu6oJW2K8FzZ40sDCzYUk3jXgjo5d0hp8PsjsKx
         UwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756732392; x=1757337192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmP/0ptYzR7dKdtH5ZrLLoZGHqV9Yo6We6i71YTkul4=;
        b=R9Culi3JZkPksn2vfD9gPHUiz2eV7SykyNP5mkxCcq9TV/FjxvAbczQLwpVgy0czL5
         umhMzD32KM8pmrOZf6SRUH3romxJuQdMgVbrmOCTbk+9wg+n3JvayEEGT2Um7BPTlmzL
         AXKGz9LIVlBU0c3nX2BbA4TZ9vLFIQ5aa8SO1tVwfXkfdPdY9TKq8kATZLoLjtd+TB+k
         5Kzi3PvFIKemsE7KRhyGH2pK0Sd7GqebkWILugdb+01thxA2ZSew7rz7y3vw/sYBgYWt
         b9ygGQfn026ivEK1cm73DRnbwk1+83K4k7O8uM580Cfc+KajlHtDwWY8+ytLyS+lZ3WK
         gIsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGX12DUmiTEY6PJuDGltMyg4WvAAv4Vk9RpeL0HRH94tp+8kasQjdxE6k0HnqVzW3sdkKabURhets=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy625mF54tBiKlaUvSyF3jnlnjFBogJxbGwBs94DyQsVTdTP3nE
	qqUSwidVx2CX2UfcsVSxiPD+ubQps5Bws0g3YgtT6upsOazKwcAFqmWCUNv8XQvhKA==
X-Gm-Gg: ASbGnctoDu2n+9/R842J6UDsMjVCc8Pf6KRgB/bs/3YD8s7hkW6A24o3RsHShNBKcFK
	olCHjfZRQpMqkkhP8kj56Bf8PJ/qA3OE4Nw0/PtS705MN8fF/lNsLZojXBfE2lNk3Z7BEb9HXG2
	rEHOnlwZ6j5din7F0Sa+Tx8UiM0bWqeTqauaQyYT13NLTrcq+1gtZmqn7ZYb25bwRlNI8fCSHCO
	uqJPAqzEEC0n3Tsn3zimKcoU1YRBgBruUi6BSZNtmHlYOvHNiwA5wWfaEC2OBoFe88bdI7bYkYy
	yldE2wdToK4cv3S501RB6T5vlkq1aji2YeyXetOY9OBwnm+LhnFc5k40jMKCtqjzqqCfvAMlF38
	sLbFNVpjGINF7Py6tn5XZhTMUV4EcRTMcRXs9eL+GxXrG3k2OgeGfDC1dNUX075GHmzxWzYSfaA
	5771sHSN08BFafCMp+OExgq7QgV2hN
X-Google-Smtp-Source: AGHT+IE0979SlahFyoIQx28WEhEhaRVmqgi0822/kIuqmYC9rzNX0SWX6aho9TF9qwxdvGKJbrGAyQ==
X-Received: by 2002:a17:907:170c:b0:b04:1f42:5de1 with SMTP id a640c23a62f3a-b041f42615emr388275666b.42.1756732391644;
        Mon, 01 Sep 2025 06:13:11 -0700 (PDT)
Message-ID: <6dcd709e-088b-4c8a-bca8-1794639d5427@suse.com>
Date: Mon, 1 Sep 2025 15:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/23] x86/pv: ERETU error handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-22-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-22-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:04, Andrew Cooper wrote:
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

I understand that for ->csx and ->ssx sensible alternatives to using such magic
constants don't really exist. For ->rflags, though, I think it would be nice if
we could use constants we have.

Jan

