Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5332B947A11
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 12:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772015.1182450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1savMQ-00018D-Ul; Mon, 05 Aug 2024 10:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772015.1182450; Mon, 05 Aug 2024 10:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1savMQ-00016d-Rh; Mon, 05 Aug 2024 10:54:42 +0000
Received: by outflank-mailman (input) for mailman id 772015;
 Mon, 05 Aug 2024 10:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1savMP-00016U-5A
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 10:54:41 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c88e616-5319-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 12:54:39 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso154347551fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 03:54:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec8884sm437302066b.193.2024.08.05.03.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 03:54:37 -0700 (PDT)
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
X-Inumbo-ID: 1c88e616-5319-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722855278; x=1723460078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l1JaD3qqSJVHtZGZQXMOIsNAb0JiZDTaP1+z2cdeRPY=;
        b=A4mRl08bHlf4p1yr8b8MSL/1zwuAvPr3b0nGIYxgNhzMGEdWbK2018hYCZssOgjmf8
         Rj73LdDLwtggcWwoo3A5xxAd/E+Yn+WfJakC/UwlhtNG19piFzCynQlNXAtEzuNWrG3l
         3k+A4Zli1+GU8sFazf5NQ5NIQ+50g58V2YiHHVO6FziKmANu2dPPDtzLN1/qnyt92rj+
         ReAGGCo/LzGIpfRJ8NbwdY9DKzMnweAYirrE81b8qctxVxqpNbOeI1NjnIfnBnOUj2xX
         RV1gDJcG1kzHo5IUVGtOXzAZlEn9Cxr6ZBHucHWF7gIA/y8u77yjNeJpzh8xqOSLFTLE
         Rb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722855278; x=1723460078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1JaD3qqSJVHtZGZQXMOIsNAb0JiZDTaP1+z2cdeRPY=;
        b=kk4v0NEyfkjsbv9Nz/P0nlRB2kfvK6w0qDlk7SA5wR0JkkDUKFaWgIzg3A1d0kjjFA
         MWd9HydoNpKnXyfTXJ3sBkxvhYg2+7rVhCQRJ0AqTDWZWVUIbTUWQBqk2NapR5bOWn96
         TYyKat7AQb4oePdfjcKIDgHNBlGmEPA2NWkBhdk2KWwOOjBhJOHt7IPsGLrQgTUSvuVV
         MQE2MsiAvd8eUtiSGDqDK4zmjIEn72TbneJ1kpjtBmtuGIPb6Z+RHr3VufL1jHywUwpQ
         r92D9vpj92F/kuYHYy8IB0ycUx0gLxyBhoDf4bSuxcAuylZRkUyzr7T+ASt5A/FS/cru
         GFOw==
X-Forwarded-Encrypted: i=1; AJvYcCULaeq/70AKUmMZVzk7ZEMySGtikVK+R0vahvuDIsFJz765BydiRc4mBdA26NL5N6cofSP5kIDAspp6y3atH8F0n8tM5tQ7Q1A/PFmgwyw=
X-Gm-Message-State: AOJu0YxfKEXIeCHO56ewf6x40adw8sEy08gmB6VWnWn/ZXhzIVG9QBaD
	q/rSjkAAnakrkLTGi7/HkKO+ZsTfe8nQOP+lBy95INlUNXT4XHRvttDADO93FQ==
X-Google-Smtp-Source: AGHT+IEiPwZVoMLIeyshCrtA4wU4JGm301M2yqzfpbJcjel/ePOk5B/z9V+/fmgmU6ZDhzQtNo7Fog==
X-Received: by 2002:a2e:9c84:0:b0:2ef:2dbe:7455 with SMTP id 38308e7fff4ca-2f15aa88c48mr101663321fa.1.1722855278137;
        Mon, 05 Aug 2024 03:54:38 -0700 (PDT)
Message-ID: <fac7981a-d003-4b84-bdc6-91e4f4769f11@suse.com>
Date: Mon, 5 Aug 2024 12:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/dom0: delay setting SMAP after dom0 build is done
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240802111244.99340-1-roger.pau@citrix.com>
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
In-Reply-To: <20240802111244.99340-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.08.2024 13:12, Roger Pau Monne wrote:
> @@ -1907,16 +1890,26 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>      if ( cpu_has_smep && opt_smep != SMEP_HVM_ONLY )
>          setup_force_cpu_cap(X86_FEATURE_XEN_SMEP);
>      if ( boot_cpu_has(X86_FEATURE_XEN_SMEP) )
> +    {
>          set_in_cr4(X86_CR4_SMEP);
> +        BUILD_BUG_ON(!(X86_CR4_SMEP & XEN_CR4_PV32_BITS));
> +        cr4_pv32_mask |= X86_CR4_SMEP;
> +    }
>  
>      if ( !opt_smap )
>          setup_clear_cpu_cap(X86_FEATURE_SMAP);
>      if ( cpu_has_smap && opt_smap != SMAP_HVM_ONLY )
>          setup_force_cpu_cap(X86_FEATURE_XEN_SMAP);
>      if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> -        set_in_cr4(X86_CR4_SMAP);
> -
> -    cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
> +        /*
> +         * Set SMAP on the %cr4 mask so that it's set for APs on bringup, but
> +         * don't set for the BSP until domain building is done.
> +         *
> +         * Don't set it in cr4_pv32_mask either, until it's also set on the
> +         * BSP.  Otherwise the BUG in cr4_pv32_restore would trigger for events
> +         * received on the BSP.
> +         */
> +        mmu_cr4_features |= X86_CR4_SMAP;
>  
>      if ( boot_cpu_has(X86_FEATURE_FSGSBASE) )
>          set_in_cr4(X86_CR4_FSGSBASE);

A further few lines down from here we have

    trap_init();

which in turn calls cpu_init(), which in turn calls write_ptbase(). That,
however, loads CR4 from mmu_cr4_features (that's still the idle vCPU we're
on, but pv_make_cr4() wouldn't really be any better). Which I think
explains both of Marek's systems hitting

(XEN) [    3.321965] Xen SMAP violation
(XEN) [    3.325885] ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----
(XEN) [    3.333755] CPU:    0
(XEN) [    3.336818] RIP:    e008:[<ffff82d04031fd8f>] init_hypercall_page+0x11/0x6b
(XEN) [    3.345032] RFLAGS: 0000000000010287   CONTEXT: hypervisor
(XEN) [    3.351622] rax: cccccccccccccccc   rbx: ffff83047da9d000   rcx: 00007cfb7a7af8a4
(XEN) [    3.360399] rdx: ffff83047da9d000   rsi: ffffffff81df5000   rdi: ffff83047da9d000
(XEN) [    3.369241] rbp: ffff82d04045f890   rsp: ffff82d04045f890   r8:  ffff83048a9519c8
(XEN) [    3.378023] r9:  ffff8304800a83e0   r10: 0000000000000031   r11: 000000000000000a
(XEN) [    3.386852] r12: 0000000000000000   r13: 0000000000000000   r14: ffffffff83630000
(XEN) [    3.395653] r15: ffff83000009ef90   cr0: 000000008005003b   cr4: 0000000000f526e0
(XEN) [    3.404424] cr3: 000000047b631000   cr2: ffffffff81df5000
(XEN) [    3.410964] fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) [    3.419746] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) [    3.427978] Xen code around <ffff82d04031fd8f> (init_hypercall_page+0x11/0x6b):
(XEN) [    3.436599]  cc cc cc cc cc cc cc cc <48> 89 06 48 89 86 f8 0f 00 00 48 8d 7e 08 48 83
(XEN) [    3.445861] Xen stack trace from rsp=ffff82d04045f890:
(XEN) [    3.452094]    ffff82d04045fd38 ffff82d04043e39d ffff83000009ef90 ffffffff83630000
(XEN) [    3.461028]    0000000000000000 ffff83047b631000 0000000000003800 0000000000000ff0
(XEN) [    3.469974]    0000000000000000 0000000000000000 ffff83047da9d000 ffffffff83651000
(XEN) [    3.478873]    ffffffff81000000 ffffffff83630000 0000000000000000 0000000000000000
(XEN) [    3.487772]    000000000000001f 000000000047c000 ffffffff83630000 ffffffff83800000
(XEN) [    3.496657]    000000000000001f ffff83047b631ff8 0000000000478000 0000000000003800
(XEN) [    3.505569]    ffff83047b634ff0 ffffffff83631000 0000008000800000 ffffffff80000000
(XEN) [    3.514479]    0000000000004000 0000008000000000 0000000000024743 0000000000100000
(XEN) [    3.523394]    ffff83047b6330d8 0000000000000020 0000000024742cf0 ffff82d040494b60
(XEN) [    3.532293]    ffff83047da8b000 ffffffff003e856c 0000000000000000 ffff830489bbd768
(XEN) [    3.541198]    ffff830489bbd96c 0000000000000000 0000000000000000 0000000000000000
(XEN) [    3.550090]    0000000000000001 ffff82d040462b4e ffffffff83241160 0000000000000001
(XEN) [    3.559012]    ffff82d0403e7612 ffffffff81df5000 0000000000000001 ffff82d0403e75ec
(XEN) [    3.567915]    ffffffff80000000 0000000000000001 ffff82d040462ac4 0000000000000000
(XEN) [    3.576822]    0000000000000002 ffff82d040462ad1 ffff830489bbd7a4 0000000000000002
(XEN) [    3.585720]    ffff82d0403e75b0 ffff830489bbd778 0000000000000002 ffff82d040462add
(XEN) [    3.594618]    ffff830489bbd790 0000000000000002 ffff82d0403e75a9 ffff830489bbd880
(XEN) [    3.603499]    0000000000000002 ffff82d040462aeb ffff830489bbd86c 0000000000000002
(XEN) [    3.612422]    ffff82d0403e7621 ffff830489bbd81c 0000000000000000 0000000000000000
(XEN) [    3.621314]    0000000000000000 0000000000000001 ffff82d040462af4 ffff800000000000
(XEN) [    3.630212] Xen call trace:
(XEN) [    3.633848]    [<ffff82d04031fd8f>] R init_hypercall_page+0x11/0x6b
(XEN) [    3.641314]    [<ffff82d04043e39d>] F dom0_construct_pv+0x1414/0x1fc7
(XEN) [    3.648961]    [<ffff82d0404520d9>] F construct_dom0+0xa4/0xb7
(XEN) [    3.655955]    [<ffff82d04044a185>] F __start_xen+0x2247/0x246d
(XEN) [    3.663058]    [<ffff82d040203334>] F __high_start+0x94/0xa0

I'm a little puzzled though that this doesn't already hit during
elf_load_binary(). Nevertheless I'm afraid I see no reasonable alternative
to reverting, for the time being.

Jan

