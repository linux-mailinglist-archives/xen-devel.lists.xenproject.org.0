Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F54938DD4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761658.1171654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqoH-0001yb-1d; Mon, 22 Jul 2024 11:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761658.1171654; Mon, 22 Jul 2024 11:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqoG-0001wC-VK; Mon, 22 Jul 2024 11:02:28 +0000
Received: by outflank-mailman (input) for mailman id 761658;
 Mon, 22 Jul 2024 11:02:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVqoF-0001w6-Ai
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:02:27 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0a0eaa4-4819-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 13:02:25 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a77c9d3e593so397985266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 04:02:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c8c1e2asm406349166b.129.2024.07.22.04.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 04:02:24 -0700 (PDT)
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
X-Inumbo-ID: e0a0eaa4-4819-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721646145; x=1722250945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V/Qyihe1CLR3n1hjpSeTM+klYUGa72BEC21XM6gHDPk=;
        b=ddQrbksYpGr4SzKyfR0P/sxlcAtGRbxq3z5HP38pZdK0/Q3ofjtaPEOH94M6PJm5xL
         LqxUr7n+ed2plAJZ68L9YzUUNNeaLVdpoi18hcI4/8GOxvF7HewhmiausS57AdwSs/sk
         Q3Y10zzoq9fUk3Ar30ZBaCJVAxAiOFujxvI4WerBKh30iDjRin1RPp333U7YwTS4sShb
         l/AVKzuxOnAllQp3tzh4P8d6aSMsqvqVbDEEqbrCjJdTfLwZdY2pOetF3Sc1PwJ4Kkv4
         ao9nHge9faNiaQf7IC6YCLQ4U4FD7D4nx9jEs5EtWEtG9OnH/G6oEGsC1pnUD/4vi8O5
         ENNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721646145; x=1722250945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/Qyihe1CLR3n1hjpSeTM+klYUGa72BEC21XM6gHDPk=;
        b=pyNYBysPQuKK/lTwJ5lAIvjKAugOdFmkShfGeG5wtOQsf9l7bL9rmJeGPmszWiYwub
         nY0fJwJv/I/auJzO73RkMMm4U12w9m9/ZnOuj49qGnBg9D/W5vnN7wSIzX1UW8BzyVH3
         sEuuUt2jFqIktEeGPbUG0SIdRVVQJMeRC3C95DmRNCzWKhsQwgSlEld9WBRDANfDSExx
         fvzmJxn+JLDq1YhiL5qp0fOMmTLulo7nJOnQFOg0CcORf2ntJWy/uK/VT/lIUE2P0m6e
         q8e7Oq7b37IwN9Pih6bHK4q7f0V4vRCTeUB3/k/VcuijqkUoKnCUauX2sH4MYLttzkPR
         gCMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtcsnwBvfdjM+mkj/f/FyhJjIB42/uXz7NhAkc6QIiC58v41d3dAJCwDg+b8FtqiTfo44Y1afyeJP5ZWHtO1NZnMgJ+xoemnxdLkpLdOs=
X-Gm-Message-State: AOJu0Yw4FcU9urtkYzF2Uk5uKCfV4Kgbg1HM+3OPMZpHQswp9wkSCMTU
	x9IFTy4PyCxZ8EPNt0DRu/sds8ZDRytV4kODapKc0N6cqgfG1NJWPyqe+6XKCQ==
X-Google-Smtp-Source: AGHT+IGXVefAjZztsS5LQY0sSfZfXmHuhbmREn/g0R94pE+IoiqMjkWX2cJzgl5Ro2lnRtsDKOeEow==
X-Received: by 2002:a17:906:6a2a:b0:a77:cf9d:f498 with SMTP id a640c23a62f3a-a7a4c034e10mr389305566b.40.1721646144653;
        Mon, 22 Jul 2024 04:02:24 -0700 (PDT)
Message-ID: <5e3be451-188f-4092-a84e-1c40a5ad6b44@suse.com>
Date: Mon, 22 Jul 2024 13:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/5] xen/riscv: enable GENERIC_BUG_FRAME
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720799487.git.oleksii.kurochko@gmail.com>
 <c2bbbe2ac9f41c19f746418df324212b2e4684a5.1720799487.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c2bbbe2ac9f41c19f746418df324212b2e4684a5.1720799487.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 18:18, Oleksii Kurochko wrote:
> To have working BUG(), WARN(), ASSERT, run_in_exception_handler()
> it is needed to enable GENERIC_BUG_FRAME.
> 
> Also, <xen/lib.h> is needed to be included for the reason that panic() and
> printk() are used in common/bug.c and RISC-V fails if it is not included
> with the following errors:
>    common/bug.c:69:9: error: implicit declaration of function 'printk'
>    [-Werror=implicit-function-declaration]
>       69 |         printk("Xen WARN at %s%s:%d\n", prefix, filename,
>    lineno);
>          |         ^~~~~~
>    common/bug.c:77:9: error: implicit declaration of function 'panic'
>    [-Werror=implicit-function-declaration]
>       77 |         panic("Xen BUG at %s%s:%d\n", prefix, filename,
>    lineno);

I don't think the diagnostics themselves are needed here.

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V10:
>  - put 'select GENERIC_BUG_FRAME' in "Config RISCV".
>  - rework do_trap() to not fetch an instruction in case when the cause of trap
>    is BUG_insn.

It's BUG_insn here, but then ...

> @@ -103,7 +104,29 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>  
>  void do_trap(struct cpu_user_regs *cpu_regs)
>  {
> -    do_unexpected_trap(cpu_regs);
> +    register_t pc = cpu_regs->sepc;
> +    unsigned long cause = csr_read(CSR_SCAUSE);
> +
> +    switch ( cause )
> +    {
> +    case CAUSE_BREAKPOINT:

... BREAKPOINT here? Generally I'd deem something named "breakpoint" as
debugging related (and hence continuable). I'd have expected
CAUSE_ILLEGAL_INSTRUCTION here, but likely I'm missing something.

> +        if ( do_bug_frame(cpu_regs, pc) >= 0 )
> +        {
> +            if ( !pc ||

In how far does this really need special casing? Isn't that case covered by

> +                 !(is_kernel_text(pc + 1) || is_kernel_inittext(pc + 1)) )

... these checks anyway? And btw, why the "+ 1" in both function arguments?

> +            {
> +                printk("Something wrong with PC: 0x%lx\n", pc);

Nit: %#lx please in situations like this.

> +                die();
> +            }
> +
> +            cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
> +            return;

This isn't needed, is it? You'd return anyway by ...

> +        }
> +
> +        break;

.... going through here to ...

> +    default:
> +        do_unexpected_trap(cpu_regs);
> +    }
>  }

... here.

Two further nits for the default case: Please have a break statement
there as well, and please have a blank line immediately up from it.

Jan

