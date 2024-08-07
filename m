Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F370C94AA74
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 16:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773553.1183994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbhou-00006I-2p; Wed, 07 Aug 2024 14:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773553.1183994; Wed, 07 Aug 2024 14:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbhot-0008VV-W0; Wed, 07 Aug 2024 14:39:19 +0000
Received: by outflank-mailman (input) for mailman id 773553;
 Wed, 07 Aug 2024 14:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbhos-0008VP-Hm
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 14:39:18 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d27ed480-54ca-11ef-8776-851b0ebba9a2;
 Wed, 07 Aug 2024 16:39:16 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52f04b3cb33so4365702e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 07:39:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e841a7sm649381666b.179.2024.08.07.07.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 07:39:15 -0700 (PDT)
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
X-Inumbo-ID: d27ed480-54ca-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723041556; x=1723646356; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rV8lX1PlLqJsOe3OdUMnd/J2qEfLznI40xZkelHj5I0=;
        b=LB5JVC6+3FIR3QQWtYj0MKOrelesJz9QhyxnOp7JMxkAC+j+0mwU5T6VyncIYTYIoj
         flXFgos/hcF9w+8VmQmrbByvGGiupI+HE5tt0A6BfN5+nEWnGulAg0A/jV/5q5Ix5orp
         7owGdzeNENrBWdFymjQDf1TI7Ita2QgsGxWGFgvMqhMuy5Mm9VoKRepvo8AOewOmaw8Z
         X0w8i/CWKC3/bZhq9rgcYj+WHv6MTiGp4ZkGBNzuY1N9uV4qX8gR/buGIHPnwJVMbuWg
         j2ilkYSoggQpjG/2QFdRpBmRvKy/rPMLzcDuWIG+W8hXEuthe3p6kwAc/BqCM5oIeunT
         6xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723041556; x=1723646356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rV8lX1PlLqJsOe3OdUMnd/J2qEfLznI40xZkelHj5I0=;
        b=RfXcJ4SKjYkHjhYYVD2Z90r8jD43P0rx+cqD/a13YuQH/4Cl2PqpRdkmoDnKESiQ+5
         i/KA1h8+2lyfiwchyPvaJFPr/sFMxDQCewjYWSoXj2mzNycZ8Fd6lyP5vswihpkr/fzL
         S9I989YxDPC+D+yZm2bxJpr7kD4B73au0lB4vudIooxYHsg+W2dqiMMsJXtvH29RfLI+
         5i5W7ZTknALD5WYKQ2nDQ5M2nq9l0OZOGqJys/gk97AoJnTDTyRao3jwxIbvu5HRLLVC
         M9dNMC2Kj1Tst0ijtdwiiiC+tsd1D67zFncW+UscC/JXJ5K9NK947ElIY1nzWInm6Bu6
         xGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHFOZglZ7EWEm8RnGX7hS3ccdTWXW78ejdpEB5MYOKT9ALXzKZwxdGnGTNtX4hnGXKXejQw+7FByJK8thIEWUsAmWnzB4P8EmCgkMUKiY=
X-Gm-Message-State: AOJu0YzFj3wphgWgfe4JXDycb2IZimk3jUCyan7SUAWL16MKKxNJdIgU
	FNy/BGZTjJuiyXTfxBVo3o2CqfmzceXZ9eHQ3LfLqiUZrjh70FzC94eIJ0sHNw==
X-Google-Smtp-Source: AGHT+IGX0/uR4KmM4tEtp9euSANWYm8Ugg7qMsBiN9nb9yFSY0VTQZAVZAtuTS0x37qqRVk2oZIvIg==
X-Received: by 2002:a05:6512:b07:b0:529:b718:8d00 with SMTP id 2adb3069b0e04-530bb3734f5mr15518173e87.8.1723041555693;
        Wed, 07 Aug 2024 07:39:15 -0700 (PDT)
Message-ID: <714d14c9-cd5e-4456-84ac-379e736c31c1@suse.com>
Date: Wed, 7 Aug 2024 16:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] xen/riscv: enable GENERIC_BUG_FRAME
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1722960083.git.oleksii.kurochko@gmail.com>
 <516ada36487fd57f7a784f9fb3fe328f5365bd85.1722960083.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <516ada36487fd57f7a784f9fb3fe328f5365bd85.1722960083.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.08.2024 18:37, Oleksii Kurochko wrote:
> Enable GENERIC_BUG_FRAME to support BUG(), WARN(), ASSERT,
> and run_in_exception_handler().
> 
> "UNIMP" is used for BUG_INSTR, which, when macros from <xen/bug.h>
> are used, triggers an exception with the ILLEGAL_INSTRUCTION cause.
> This instruction is encoded as a 2-byte instruction when
> CONFIG_RISCV_ISA_C is enabled:
>   ffffffffc0046ba0:       0000                    unimp
> and is encoded as a 4-byte instruction when CONFIG_RISCV_ISA_C
> ins't enabled:
>   ffffffffc005a460:       c0001073                unimp
> 
> Using 'ebreak' as BUG_INSTR does not guarantee proper handling of macros
> from <xen/bug.h>. If a debugger inserts a breakpoint (using the 'ebreak'
> instruction) at a location where Xen already uses 'ebreak', it
> creates ambiguity. Xen cannot distinguish whether the 'ebreak'
> instruction is inserted by the debugger or is part of Xen's own code.
> 
> Remove BUG_INSN_32 and BUG_INSN_16 macros as they encode the ebreak
> instruction, which is no longer used for BUG_INSN.
> 
> Update the comment above the definition of INS_LENGTH_MASK as instead of
> 'ebreak' instruction 'unimp' instruction is used.
> 
> <xen/lib.h> is included for the reason that panic() and printk() are
> used in common/bug.c and RISC-V fails if it is not included.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Just one more (cosmetic) question:

> --- a/xen/arch/riscv/include/asm/bug.h
> +++ b/xen/arch/riscv/include/asm/bug.h
> @@ -9,7 +9,7 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -#define BUG_INSTR "ebreak"
> +#define BUG_INSTR "UNIMP"

Deliberately all uppercase?

Jan

