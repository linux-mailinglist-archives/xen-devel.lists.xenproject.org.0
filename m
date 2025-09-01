Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DDDB3E29E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 14:24:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104646.1455692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut3Zo-0005B9-LK; Mon, 01 Sep 2025 12:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104646.1455692; Mon, 01 Sep 2025 12:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut3Zo-00058O-I3; Mon, 01 Sep 2025 12:24:00 +0000
Received: by outflank-mailman (input) for mailman id 1104646;
 Mon, 01 Sep 2025 12:23:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut3Zm-00058I-CD
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 12:23:58 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8776f9f6-872e-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 14:23:56 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afede1b3d05so719600766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 05:23:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff104fcdd5sm700706966b.55.2025.09.01.05.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:23:55 -0700 (PDT)
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
X-Inumbo-ID: 8776f9f6-872e-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756729435; x=1757334235; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ICf4Z1OI9cz3RcvcYspDyjxfK1HZRvacT3ENaDNmmE=;
        b=PRIlMvCWv1w2PxSKgTka+7cWxwuQVGWiKokJzucjqDJhITgSR06e4w5o/d3UTOvmoI
         Xe8cAX3CifuXS6zk8MY8XUBguxFA6Hu5dfJb0Xulp80LQ6DV0Wds2RTuRXWmk5miwDPj
         cv5VnF4xco9V350z3AHqHqJbpn1Y9GbddB1RXKgXRRoYRDDsObCyPsjQll66uOXA+baf
         7EOmlt321NZKWb1NwWONmbE4lrM5HCBShKMlIS8J2Vc8ovWcGaAxZ/ZARtG09EWJuS9f
         kA/XQJbRRYsKRQiE53Pbzl7kHkIA8KzK5IQQXKxMuCOl2i3LQN08eINg5irwSZ+5OrTB
         8YIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729435; x=1757334235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ICf4Z1OI9cz3RcvcYspDyjxfK1HZRvacT3ENaDNmmE=;
        b=WM2kDJhFcbg3A/nAZo7j9Rpr4LRyQeaQQ3hcjI70ndAwpKKjGcTpGA24R+EqKdSGhm
         GfJVQnu6n1pueGXegig52JOIMR6kskVd4dCPCXIAa1lulBZWoMF11tTz/fAKfkvoNBM5
         hG0eJHAuoPSvemf70Urwf1mrE8kgcZM8i662CO7Xd9I5RnBD3qn2cj3o557gNhjsh9OP
         Mc3ggwgpGuIgI6EPUwHXrXwK/4kJ7yTte0lGYnHccLkrpmFBOW7oxPgEvvv6oHG/4gnC
         osQcvHQUNvAdi8y6EJLuf2SwSmwE81/3KFl0QuoFJALOuk6okSo5MQuLeTP2pBkr+F4M
         4M8A==
X-Forwarded-Encrypted: i=1; AJvYcCUHpPtZbgn6i/63Xh+2AW5K9TL5+w+Vjcw1F6rxd12/CGrw/dC2FOsNsrTvvl+0hqvVyj54Xq5ZaWk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyniuwKUeJq3j95942U2xNQnZQvkOhlL1fbY2tpU8efE65IPg6p
	d1yy2M7DJ4pCZcy9Vnhr7jeLNfd6z37J232SGdmsWJNNDI3fMhZkWT6viiZmTt7q/ZyXm7LXX8N
	RbHw=
X-Gm-Gg: ASbGncvXHDl4u5d/vaQCKKjLRzOWUQAZZN/W2uEYVj62EX1psHRThCAPD5IC/9oW3Po
	IuuiCF/JjAyPi8ehW5j9UApwQJdsfKn4qO5I4C6leEk7eEaiifAAXzNYAyx/I3ttoqW6HKGFHDF
	bGd62hWA1mohmcPf4/uqR+xFG1cGVaQC7WQUY9C08yA6du3uLFyCxK86+Ilc3uOlP/GGryqeanv
	KPTQa1lUo9F57oeypZPQUyNBhZ4oJ7LYZPd16TVH7shlM9aVerlBiN1SLnZEzUSkaqrdNYfIHgA
	lI8Go2pJClPSGIwdMlsjUxNh2pTd+j4iawq5lv8DKHaNkOa7LgvcGA9zteLejwH/QlO+xqyrpVX
	stPlZE6O50czqkes8jmdxSxur36FZ/rcW9MfzYIioCQfT9+nn0t37c0sF0b8H7Dd6k2EZ/8h8dC
	/MIK+ZJ30=
X-Google-Smtp-Source: AGHT+IFNOY2tOo4qDEdbgY+RWjV4ljJE/6u98kg+2/jQo2uGXNX9X61XahggRZK9mRfoLWnPJrOvHg==
X-Received: by 2002:a17:906:6a20:b0:afe:dbfb:b123 with SMTP id a640c23a62f3a-b01f20c7034mr749593766b.64.1756729435440;
        Mon, 01 Sep 2025 05:23:55 -0700 (PDT)
Message-ID: <107e57a0-6f13-4827-8548-ef17d10136e5@suse.com>
Date: Mon, 1 Sep 2025 14:23:54 +0200
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
> +        }
> +        break;
> +    }

This switch() is identical to entry_from_xen()'s. Fold into a helper?

> +    /*
> +     * With the asynchronous events handled, what remains are the synchronous
> +     * ones.  Guest context always had interrupts enabled.
> +     */
> +    local_irq_enable();

In the comment, maybe s/Guest/PV guest/?

> +    switch ( type )
> +    {
> +    case X86_ET_HW_EXC:
> +    case X86_ET_PRIV_SW_EXC:
> +    case X86_ET_SW_EXC:
> +        switch ( vec )
> +        {
> +        case X86_EXC_PF:  handle_PF(regs, fi->edata); break;
> +        case X86_EXC_GP:  do_general_protection(regs); break;
> +        case X86_EXC_UD:  do_invalid_op(regs); break;
> +        case X86_EXC_NM:  do_device_not_available(regs); break;
> +        case X86_EXC_BP:  do_int3(regs); break;
> +        case X86_EXC_DB:  handle_DB(regs, fi->edata); break;
> +
> +        case X86_EXC_DE:
> +        case X86_EXC_OF:
> +        case X86_EXC_BR:
> +        case X86_EXC_NP:
> +        case X86_EXC_SS:
> +        case X86_EXC_MF:
> +        case X86_EXC_AC:
> +        case X86_EXC_XM:
> +            do_trap(regs);
> +            break;
> +
> +        case X86_EXC_CP:  do_entry_CP(regs); break;
> +
> +        default:
> +            goto fatal;
> +        }
> +        break;

This again looks identical to when entry_from_xen() has. Maybe, instead of
a helper for each switch(), we could have a common always-inline function
(with all necessary parametrization) that both invoke?

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -63,7 +63,7 @@ UNLIKELY_END(syscall_no_callback)
>          /* Conditionally clear DF */
>          and   %esi, UREGS_eflags(%rsp)
>  /* %rbx: struct vcpu */
> -test_all_events:
> +LABEL(test_all_events, 0)
>          ASSERT_NOT_IN_ATOMIC
>          cli                             # tests must not race interrupts
>  /*test_softirqs:*/
> @@ -152,6 +152,8 @@ END(switch_to_kernel)
>  FUNC_LOCAL(restore_all_guest)
>          ASSERT_INTERRUPTS_DISABLED
>  
> +        ALTERNATIVE "", "jmp eretu_exit_to_guest", X86_FEATURE_XEN_FRED
> +
>          /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
>          mov VCPU_arch_msrs(%rbx), %rdx

I assume it's deliberate that you don't "consume" this insn into the
alternative, but without the description saying anything it's not quite
clear why.

Jan

