Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A826B92CEBC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 12:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756722.1165437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRU8U-0004cD-Bg; Wed, 10 Jul 2024 10:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756722.1165437; Wed, 10 Jul 2024 10:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRU8U-0004ZC-8N; Wed, 10 Jul 2024 10:01:18 +0000
Received: by outflank-mailman (input) for mailman id 756722;
 Wed, 10 Jul 2024 10:01:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRU8S-0004Z6-To
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 10:01:16 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57e76163-3ea3-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 12:01:14 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so64259541fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 03:01:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b54ec730fsm868185b3a.173.2024.07.10.03.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 03:01:11 -0700 (PDT)
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
X-Inumbo-ID: 57e76163-3ea3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720605674; x=1721210474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NIa8MX1cMLGDqXEKBQ3cvHlOcOao6eY0qmi6NjpyPSs=;
        b=Rc5/lQ/Bj4udGkXzS07sgHTUprGOISVyUhTrz9rgOI081zoKhNd+5z+5614rRC2Rz/
         Xw4LET7lHMe8zGRkfUgjStavo/zG/Pb2MV+AraifkAxrH336sWP2bYR+EculWMHrpwSc
         8sruNJtybm/4tTagx2svV1NF1l9MfDXAcS08RSokRpcOE8ljEM9+YJlM1jZMbwoKdf0W
         oOVlF0knRclvaoGfZ4V/3yO7ghtcBTR+PXCo15wIlzvwQa3D9bnAUk43elEMe0T+pb9t
         yzYkPWJz1fwByf7PZsLjOgkIMLDgVXee0H5pQU6hwDoWqtxwDxVg5RAZ3yrVPYfZcMBI
         0xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720605674; x=1721210474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIa8MX1cMLGDqXEKBQ3cvHlOcOao6eY0qmi6NjpyPSs=;
        b=tQkNgq4KVLz6KCN+1abz6rnDAkk248K2ntiUMpRrtt4Qz+EazCXRPRn+pyJCwd77E3
         HmvGFt7ZWJKj/BZ+RzGpDfCiMGuZMPdz6ktCjsXJ7rAxCU4U0xnc1Q3uYV5+k2ZYApoj
         /LurfGTDbcEojwYiqdT5ME2iU8hsZnvFI1/7hTjXLYc3GsntQci1RjVWfbCDGkWpr5vh
         P7PKaGgJseIV+ogOAFHGkMfIDDHKE+/uwnrUsIWvBu/A39QQHHIebjliE1GANpN53wH4
         AqhAQnFyEzQgujmwjZMZ9sfjucAlzrvesmIF4VlfHV9SuRG9r/B7YwrSVdLi/pzLDRNL
         PzJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdCFHsjLkUHz/7QBBhm9uMadYVsFNokwTdn5SmS5JdTHWrmC1KeOUAG0c2MkIPjUz0iCujeg7gK/+FILCxnCB5z60lyY+u/SiXbhF8PHE=
X-Gm-Message-State: AOJu0YwLTGhj2NvhZvySLblBmVshY++qKaCrj0MI83IVISHCt9KWtXlF
	NZNARR0EXeFmmQMyiIyqTzP4zpVGv8l9TNol79Znih+z326S5MrLCXaHFJ5n1z4F4OktF3k3xLY
	=
X-Google-Smtp-Source: AGHT+IFNdEjKYx9fVk5Y06UriIlyQZU5ZT5QGOPdNzvI45o3yC9sm+bE8dueS8T49uvaFDHwh0D0KA==
X-Received: by 2002:a2e:a581:0:b0:2ee:8453:5164 with SMTP id 38308e7fff4ca-2eeb304eec9mr43206421fa.0.1720605671789;
        Wed, 10 Jul 2024 03:01:11 -0700 (PDT)
Message-ID: <ca373d42-22f1-41a2-bdbb-4733145c635a@suse.com>
Date: Wed, 10 Jul 2024 12:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] xen/riscv: enable GENERIC_BUG_FRAME
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
 <c51c485bac43b7589961aabec8af1b82d4673b94.1719918148.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c51c485bac43b7589961aabec8af1b82d4673b94.1719918148.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 13:23, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/Kconfig |  1 +
>  xen/arch/riscv/traps.c | 31 +++++++++++++++++++++++++++++++
>  xen/common/bug.c       |  1 +
>  3 files changed, 33 insertions(+)
> 
> diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
> index b4b354a778..74ad019fe7 100644
> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -5,6 +5,7 @@ config RISCV
>  config RISCV_64
>  	def_bool y
>  	select 64BIT
> +	select GENERIC_BUG_FRAME

Any particular reason to put this here, and not higher up with RISCV?

> @@ -101,8 +102,38 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>      die();
>  }
>  
> +static bool is_valid_bug_insn(uint32_t insn)
> +{
> +    return insn == BUG_INSN_32 ||
> +           (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16;
> +}
> +
> +/* Should be used only on Xen code */
> +static uint32_t read_instr(unsigned long pc)
> +{
> +    uint16_t instr16 = *(uint16_t *)pc;
> +
> +    ASSERT(is_kernel_text(pc + 1) || is_kernel_inittext(pc + 1));
> +
> +    if ( GET_INSN_LENGTH(instr16) == 2 )
> +        return instr16;
> +
> +    ASSERT(is_kernel_text(pc + 3) || is_kernel_inittext(pc + 3));
> +
> +    return *(uint32_t *)pc;
> +}

Related to the point made further down: If either of these assertions fails,
won't we come back again right here? If either of the is_kernel_*text()
wasn't working quite right, wouldn't we be at risk of entering an infinite
loop (presumably not quite infinite because of the stack overflowing at some
point)?

>  void do_trap(struct cpu_user_regs *cpu_regs)
>  {
> +    register_t pc = cpu_regs->sepc;
> +    uint32_t instr = read_instr(pc);
> +
> +    if ( ( is_valid_bug_insn(instr) ) && ( do_bug_frame(cpu_regs, pc) >= 0 ) )

No consideration of the kind of exception? I'd expect it is one very
specific one which the BUG insn would raise, and then there's no point
fetching the insn when it's a different kind of exception.

Further, nit: Certainly no need for the parentheses on the lhs of the &&.
Having them on the rhs is a matter of taste, so okay, but then the
blanks immediately inside will want dropping.


> --- a/xen/common/bug.c
> +++ b/xen/common/bug.c
> @@ -1,6 +1,7 @@
>  #include <xen/bug.h>
>  #include <xen/errno.h>
>  #include <xen/kernel.h>
> +#include <xen/lib.h>
>  #include <xen/livepatch.h>
>  #include <xen/string.h>
>  #include <xen/types.h>

Unrelated change? Or did you simply forget to mention in the description
why it's needed?

Jan

