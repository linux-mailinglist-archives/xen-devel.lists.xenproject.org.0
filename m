Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B823B3E6D9
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 16:18:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104946.1455951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut5Lx-00060q-IB; Mon, 01 Sep 2025 14:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104946.1455951; Mon, 01 Sep 2025 14:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut5Lx-0005zA-FO; Mon, 01 Sep 2025 14:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1104946;
 Mon, 01 Sep 2025 14:17:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut5Lw-0005z4-1G
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 14:17:48 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d4bacbc-873e-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 16:17:44 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so682661166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 07:17:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04312fc8eesm206241566b.59.2025.09.01.07.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 07:17:43 -0700 (PDT)
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
X-Inumbo-ID: 6d4bacbc-873e-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756736263; x=1757341063; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MYp/6n2FjRcTOZTBHgjlU3II5P2L4FoA2cfXoLeKOEo=;
        b=PHuS0yf0Vb8bEHtA4zuvmnm8Q0yHgsXAtFplxw+raupYs568RIbh9ndTb8gGGuwmSv
         e2894QNucSDc6WMpkKY/N8SUbA8luRBmbIPgRaHXAQF2vPbnK8eCwQnzMf7nbqIBvgBo
         gZz3HfIDfb2FeKp4+vw20iOdHDeFQPcgM7WHn1G3+7BNgCq/u87DT9GDx3urC0ZOW2+O
         TeegVkE8jYZdNWKEzMA8duyd+rontDq4MxQGjTcGnnFS4x7I/rshNveA8GtWCZD/gd9x
         kmIYHwTVQ6qYVkYvMeYqfLEV+D0MMnXdWUs6EuiehrYQPi0+5c58R0waJDj+N1HPi5Ws
         o1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756736263; x=1757341063;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYp/6n2FjRcTOZTBHgjlU3II5P2L4FoA2cfXoLeKOEo=;
        b=Wu5iYC/oTLHO6Qtw3Zke9wI8es2Q9aSRZKvI607EU8fzb4Uka3NJS7rNN7z28xNWte
         ZBX+6njJGWBrD59VNx1CY6gUdH4yUIkTAIY6hwcMV0XhTvAAZvfx9S6ZMmjgMs7qljqi
         CJndZ1Fl6UY1N0SuaYpxUhN7fd+GNCche/AiECBaunTDGFGKcxS2XTt3+hhXY6vx/8S2
         3QyfwtdiWJ/MC7UDWx8uokcJEWMlDsKQSNTPNLXqVfhekGO92o/merhUoGQm8Aedcdxy
         /yLQ8L1OYPTxynNOSACJvXfegilVu9YSmSwuz5hrXuqoD+HhDHi0Bj6ESHRu5hwNotxp
         wiAA==
X-Forwarded-Encrypted: i=1; AJvYcCWmyqYmDt8xpL+PBAZuZRiWnoTkjLrJSiIbwTtNIwYd/IZj1WsinfMHFSZ1JGQ6IKLlyJnmU67TPYY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJp0XY5xCWtCBDD4W+ESoHl6CwUENG1DrI0pgaWwN+fMHPtUay
	eLnhz6i2o6w+Kc9tRweXbkD7o9g6+wEBmxYpEhcUPnvtfFiGHxwK5Q/7X9gkoyPNFzWzClTIEHR
	dN0c=
X-Gm-Gg: ASbGnct1dAPq21vctyAwxAE+ZCO/MQXaygBng3u/wrQF9gv9wRw9J0pXOpEcrH+UOFs
	clfg0miWS9vrr48t9qewUqDOuEzOTPEmnctafUjY7NkcUJAE2rK926vqnTDCS1akq8LquIw5NvW
	f6cF3jcLbgawDF8uhvaFGUFfYEibPghIjApe+oiuiE+QEh/QrnVc2l4bfYxGhtxNaJcuXNXY9Gc
	bnBgE9yGcYE53Yoks36+PF2P2cWJFaIYCy15/A/DE015jDF/acBd16DYdAzApobk7uSRol1qCYi
	7oDxyokuAjQx2dWuc0Q/xyUL0zed/v4PChOW/U8giVX4Hz2bZjcC2ikfG8cL0VJiD8kGYxrOWle
	Ft/Pf9EjudL/8m0OOc6oD/lLHw823QBN5FiHSPCCbrpxcihRPjeavSzB9eqp0J3uAZ8hqIag9R1
	2V9FXBSuEjSmr8WpVcog==
X-Google-Smtp-Source: AGHT+IHzhjs/1H45IS3BGqVfo7ynlzuAVR+M4B1TH4b/4tLxq2Qa+Z7ZGUE5gvdh+aFe7Pd6cA9P4A==
X-Received: by 2002:a17:907:2d27:b0:b04:27a9:cfe1 with SMTP id a640c23a62f3a-b0427a9df6dmr327800066b.47.1756736263378;
        Mon, 01 Sep 2025 07:17:43 -0700 (PDT)
Message-ID: <02689181-5d1a-453b-9abb-c0d7664758b7@suse.com>
Date: Mon, 1 Sep 2025 16:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/23] x86/pv: Adjust eflags handling for FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-24-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-24-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2025 17:04, Andrew Cooper wrote:
> ERETU, unlike IRET, requires the sticky-1 bit (bit 2) be set, and reserved
> bits to be clear.  Notably this means that dom0_construct() must set
> X86_EFLAGS_MBS it in order for a PV dom0 to start.
> 
> Adjust arch_set_info_guest*() and hypercall_iret() which consume flags to
> clamp the reserved bits.
> 
> This is a minor ABI change, but by the same argument as commit
> 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()"), this change will
> happen naturally when the vCPU schedules.

It's no that similar, is it? MBS will be observed set once guest context is
entered, irrespective of any scheduling. So it's entirely benign if we set
it up-front, except of course for a back-to-back set/get.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> v2:
>  * New
> 
> The handling of VM is complicated.
> 
> It turns out that it's simply ignored by IRET in Long Mode (i.e. clearing it
> commit 0e47f92b0725 ("x86: force EFLAGS.IF on when exiting to PV guests")
> wasn't actually necessary) but ERETU does care.
> 
> But, it's unclear how to handle this in in arch_set_info().  We must preserve
> it for HVM guests (whih can use vm86 mode).  PV32 has special handling but
> only in hypercall_iret(), not in arch_set_info().

I think we need to either reject or clear VM, NT, IOPL, and whatever else
would make ERETU unhappy (for IOPL we already do so). It simply is of no
use to ...

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1273,7 +1273,7 @@ int arch_set_info_guest(
>          v->arch.user_regs.rax               = c.nat->user_regs.rax;
>          v->arch.user_regs.rip               = c.nat->user_regs.rip;
>          v->arch.user_regs.cs                = c.nat->user_regs.cs;
> -        v->arch.user_regs.rflags            = c.nat->user_regs.rflags;
> +        v->arch.user_regs.rflags            = (c.nat->user_regs.rflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
>          v->arch.user_regs.rsp               = c.nat->user_regs.rsp;
>          v->arch.user_regs.ss                = c.nat->user_regs.ss;
>          v->arch.pv.es                       = c.nat->user_regs.es;
> @@ -1297,7 +1297,7 @@ int arch_set_info_guest(
>          v->arch.user_regs.eax               = c.cmp->user_regs.eax;
>          v->arch.user_regs.eip               = c.cmp->user_regs.eip;
>          v->arch.user_regs.cs                = c.cmp->user_regs.cs;
> -        v->arch.user_regs.eflags            = c.cmp->user_regs.eflags;
> +        v->arch.user_regs.eflags            = (c.cmp->user_regs.eflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
>          v->arch.user_regs.esp               = c.cmp->user_regs.esp;
>          v->arch.user_regs.ss                = c.cmp->user_regs.ss;
>          v->arch.pv.es                       = c.cmp->user_regs.es;

... accept the bits here, just for the first exit to guest mode to fault on
the ERETU. The guest would have a hard time to recover from that, I expect.
Yet perhaps we should do this only conditionally when FRED is active. Then
again a VM migrating from a pre-FRED host to a FRED one might observe the
(minor) behavioral change later on.

> --- a/xen/arch/x86/hvm/domain.c
> +++ b/xen/arch/x86/hvm/domain.c
> @@ -194,7 +194,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
>          uregs->rsi    = regs->esi;
>          uregs->rdi    = regs->edi;
>          uregs->rip    = regs->eip;
> -        uregs->rflags = regs->eflags;
> +        uregs->rflags = (regs->eflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
>  
>          v->arch.hvm.guest_cr[0] = regs->cr0;
>          v->arch.hvm.guest_cr[3] = regs->cr3;
> @@ -245,7 +245,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
>          uregs->rsi    = regs->rsi;
>          uregs->rdi    = regs->rdi;
>          uregs->rip    = regs->rip;
> -        uregs->rflags = regs->rflags;
> +        uregs->rflags = (regs->rflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;

Why would the HVM code need changing at all? We never ERETU there.

Jan

