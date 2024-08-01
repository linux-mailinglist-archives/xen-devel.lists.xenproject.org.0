Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA760944A91
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 13:45:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769630.1180515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZUEd-0003M8-O3; Thu, 01 Aug 2024 11:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769630.1180515; Thu, 01 Aug 2024 11:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZUEd-0003Jb-K9; Thu, 01 Aug 2024 11:44:43 +0000
Received: by outflank-mailman (input) for mailman id 769630;
 Thu, 01 Aug 2024 11:44:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZUEc-0003JS-AV
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 11:44:42 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fd05351-4ffb-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 13:44:40 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52f04c29588so11845412e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 04:44:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63590d1esm10074637a12.27.2024.08.01.04.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 04:44:39 -0700 (PDT)
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
X-Inumbo-ID: 6fd05351-4ffb-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722512680; x=1723117480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=00QZRtr/T91jStgL82WKO7QSvTC88plVV4PvbeL6ISI=;
        b=UVXSDzSbkp84+M8Nk/WwJaPu9GDPKbsM31RTCfTLuMVSFk34q4ocXTanya/K+0vOV+
         WYNFYWaAP8M70tOmW8+ru1KCig0E5tvo7TbRxZ2n5b7DXN4/v1jck7lZXfly5rdIeooV
         LQMzHzsoct9zryFYR/H3hRYFUrvXtIKagMrvpLrLK51anutu9vRlpUp4g3gVLq11o/uQ
         9G/vterPJcxo6fa6Y82oC5Z5AWO7Awwt7c5f1ue3VRu81O2PQEB9+Kzx7YSiloZOHgk/
         sp5CxSNIPNQsXlNAYcHU/OphPWNFwlutr4mpFx8Vp1Uh0efTVO1eO7vrF1fF0hOAFu/D
         aXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722512680; x=1723117480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00QZRtr/T91jStgL82WKO7QSvTC88plVV4PvbeL6ISI=;
        b=rfBt48Doj2xYZdZ9s5c7Fpbc8f0MhsMaasl9BhcYNyyTW8iijDCZmA4PEf1Z7jYCby
         CMyaErfgkG1FONtK68uzqi8gxwFumcC58trl2vXHjNfHlVATV93uuGkQBF31jWPf8dR1
         sjbEiGt/QN/sSdgNKscz/fTAZhvqIEP84IEUHOIXglDRec59rkRCAnqTheCJLff4u+yz
         sZQW6pOIxJJGLWnEwWUnToTNFfJmizS6JgF9H0Yx4KvytFs4IuyEgU/VpAzk2Nk9FmaV
         yhWj9yuECiTIxS2ENptSr1WaB3A6pi++oBhD7+3tA5oIRRN32AX2GYG3qB03JrduQ0km
         j0aw==
X-Forwarded-Encrypted: i=1; AJvYcCVjS0x+bcot+Vr73cD+NXY4xfmZ5XuI8fikTX0RBUrumb2HoMJ5ZTQHH8gKdUM68eivMXv7oSTNWACkSoZw7/TPw4bQAUwC3JXrzBlfY+g=
X-Gm-Message-State: AOJu0YzY27rNS5OYaoUcnfM+upNHLSlCQt4Phb/ZMXs3BtDskTo06vsB
	nvAeWzuJcW+uqucFXuy/Ahntf69ADC+sV3NuHQTICoFQDUmS1Q1aAkucovoCRA==
X-Google-Smtp-Source: AGHT+IEh6rj0J6YsMcRD+BGlscpjPy3NvQd9edMfBR+7WITAcEoy79ycio2HVZ3SkN9YtGKztLH96Q==
X-Received: by 2002:ac2:5ec1:0:b0:52d:b150:b9b3 with SMTP id 2adb3069b0e04-530b61bca34mr1161200e87.32.1722512679579;
        Thu, 01 Aug 2024 04:44:39 -0700 (PDT)
Message-ID: <a2ad6557-8162-4f06-84c6-b79c049cb326@suse.com>
Date: Thu, 1 Aug 2024 13:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/5] xen/riscv: introduce decode_cause() stuff
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 xen-devel@lists.xenproject.org
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
 <335b0b49720b3524b6c89c5ce62d3377a4bb1fb8.1721731887.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <335b0b49720b3524b6c89c5ce62d3377a4bb1fb8.1721731887.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 17:31, Oleksii Kurochko wrote:
> The patch introduces stuff needed to decode a reason of an
> exception.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in V11:
>  - Nothing changed. Only rebase.
> ---
> Changes in V10:
>  - add Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in V9:
>  - This patch was reverted as breaks both release and randconfig builds.
>    I don't see the failures now. ( probably it was because of printk usage
>    which was not ready at that moment ).
>  - drop inclusion of <asm/csr.h> and <asm/early_printk.h>
>  - add <asm/riscv_encoding.h> for CAUSE_* in decode_trap_cause().
> ---
> Changes in V8:
>   - fix typo in return string from decode_reserved_interrupt_cause
>   - add Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> Changes in V7:
>  - Nothing changed. Only rebase.
> ---
> Changes in V6:
>  - Remove usage of LINK_TO_LOAD() due to the MMU being enabled first.
>  - Change early_printk() to printk()
> ---
> Changes in V5:
>   - Remove <xen/error.h> from riscv/traps/c as nothing would require
>     inclusion.
>   - decode_reserved_interrupt_cause(), decode_interrupt_cause(), decode_cause, do_unexpected_trap()
>     were made as static they are expected to be used only in traps.c
>   - use LINK_TO_LOAD() for addresses which can be linker time relative.
> ---
> Changes in V4:
>   - fix string in decode_reserved_interrupt_cause()
> ---
> Changes in V3:
>   - Nothing changed
> ---
> Changes in V2:
>   - Make decode_trap_cause() more optimization friendly.
>   - Merge the pathc which introduces do_unexpected_trap() to the current one.
> ---
>  xen/arch/riscv/traps.c | 80 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> index 5415cf8d90..37cec40dfa 100644
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -9,13 +9,91 @@
>  #include <xen/sched.h>
>  
>  #include <asm/processor.h>
> +#include <asm/riscv_encoding.h>
>  #include <asm/traps.h>
>  
> -void do_trap(struct cpu_user_regs *cpu_regs)
> +static const char *decode_trap_cause(unsigned long cause)
> +{
> +    static const char *const trap_causes[] = {
> +        [CAUSE_MISALIGNED_FETCH] = "Instruction Address Misaligned",
> +        [CAUSE_FETCH_ACCESS] = "Instruction Access Fault",
> +        [CAUSE_ILLEGAL_INSTRUCTION] = "Illegal Instruction",
> +        [CAUSE_BREAKPOINT] = "Breakpoint",
> +        [CAUSE_MISALIGNED_LOAD] = "Load Address Misaligned",
> +        [CAUSE_LOAD_ACCESS] = "Load Access Fault",
> +        [CAUSE_MISALIGNED_STORE] = "Store/AMO Address Misaligned",
> +        [CAUSE_STORE_ACCESS] = "Store/AMO Access Fault",
> +        [CAUSE_USER_ECALL] = "Environment Call from U-Mode",
> +        [CAUSE_SUPERVISOR_ECALL] = "Environment Call from S-Mode",
> +        [CAUSE_MACHINE_ECALL] = "Environment Call from M-Mode",
> +        [CAUSE_FETCH_PAGE_FAULT] = "Instruction Page Fault",
> +        [CAUSE_LOAD_PAGE_FAULT] = "Load Page Fault",
> +        [CAUSE_STORE_PAGE_FAULT] = "Store/AMO Page Fault",
> +        [CAUSE_FETCH_GUEST_PAGE_FAULT] = "Instruction Guest Page Fault",
> +        [CAUSE_LOAD_GUEST_PAGE_FAULT] = "Load Guest Page Fault",
> +        [CAUSE_VIRTUAL_INST_FAULT] = "Virtualized Instruction Fault",
> +        [CAUSE_STORE_GUEST_PAGE_FAULT] = "Guest Store/AMO Page Fault",
> +    };
> +
> +    if ( cause < ARRAY_SIZE(trap_causes) && trap_causes[cause] )
> +        return trap_causes[cause];
> +    return "UNKNOWN";
> +}

While I committed this as-is, two more points: First, as soon any any
such array access becomes potentially reachable because of guest
activity, it wants to use array_access_nospec() or alike. Second, and
somewhat related, it may be desirable to avoid such double accesses.
Hopefully the compiler will do that for you. But

    const char *res = cause < ARRAY_SIZE(trap_causes) ? trap_causes[cause]
                                                      : NULL;

    return res ?: "UNKNOWN";

might be worthwhile anyway.

Jan

