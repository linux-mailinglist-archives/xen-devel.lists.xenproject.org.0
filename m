Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61958517E3
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 16:25:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679655.1057226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZYB5-0007mx-1b; Mon, 12 Feb 2024 15:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679655.1057226; Mon, 12 Feb 2024 15:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZYB4-0007l3-V1; Mon, 12 Feb 2024 15:25:02 +0000
Received: by outflank-mailman (input) for mailman id 679655;
 Mon, 12 Feb 2024 15:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZYB3-0007jg-FH
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 15:25:01 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2e9852b-c9ba-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 16:25:00 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3392b045e0aso2299551f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 07:25:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bw28-20020a0560001f9c00b0033b66ce7ae9sm7150916wrb.84.2024.02.12.07.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 07:24:59 -0800 (PST)
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
X-Inumbo-ID: e2e9852b-c9ba-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707751500; x=1708356300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0m91h5Pd6oFyMd+ETMzjc1rjEXaw9O+0243geydUybA=;
        b=gj5sk/+3KeUNU2/Qh+0Zy8Zj3tcgAt9N+pgy7qJE1BM+ivM1YuBul9j+OMAUrXPYBP
         YQkUqESP6fPFaZa4qGG8zVY7frFziwzweAfzj1DUuZBqknO2VKtfxSF8mUb976EgpoMt
         a5ndPYeljShNQGx7+iwPa4mPKam97GkOu/12bLKV87wwbdBB2hlJjEa5zoRHQG0hFZ+d
         bJLE9jcpgPhadxK2+b9R0tkeXFzisSj/PB6siPnq+RLrau9KJog45rApcwDJ7guJcQ4N
         /p7k6WtctVXfigxnICRvacqk/uDa/0TU2u98n0YlIE480KzBv1gqflI30/9jPMVW9yWJ
         LI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707751500; x=1708356300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0m91h5Pd6oFyMd+ETMzjc1rjEXaw9O+0243geydUybA=;
        b=crunKnMkxm0vAhAmHLmnBvytbQ8HoG9w91A/ek1SQaeJVNqdT2Vo9cK7Uu2uuH8/jM
         8WEvcg5AotmrZXCh23DIA0117hjXGmCniza1PDY5A5L7U64D2lYcxkkdAaXTxMU663E2
         R6GfWAYHaicLwxRsWivcjjhRroeEPKPu24NefQah7Ieq1XMk9ElEZiicuZqvGY5ZlSO9
         1ZU5PSUyP2747wSonEmjZLAWePa78cegKactX+1exPhnflL5KTlD63jr1+nG120w297u
         W0/1J21/okTiVvEuAHv0yIZEVMEY4IsFjQfdsOhaO3LFoFIjpG+1n4hKQEccVJDzLeKl
         khiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlfYM4tcEx7xAY0LTiwboTumhJ7ulvvuwEEGuCn1JsYW6hjbmexiMpDcBQG3OMNsnJyWDbllOL1VqltqqviB/6+k2nB5ZQSq/t4ttGgJA=
X-Gm-Message-State: AOJu0YwM8wXB6ZwTDhsYq+MtAe3s0VJB14cWX3xO70ndGZJKWi+zT4Cd
	5XoC3YPLbiLpIqFxS/LPU3cm+P0LVrJXo9p9c9PIKizT2CzTPj2MuPVc0Coe+w==
X-Google-Smtp-Source: AGHT+IENHIfHqkyoz+xsHs5lihxLeI+65XdaV7IqidpXCp2fefSuF9fD7lm3ldCtP+j4l2R95V8S1w==
X-Received: by 2002:adf:ea48:0:b0:33b:26d7:e6dd with SMTP id j8-20020adfea48000000b0033b26d7e6ddmr5262955wrn.48.1707751499926;
        Mon, 12 Feb 2024 07:24:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfeB7wDDaFzaUwEgxFK9wkwtgDdzGbB2ulZvcAGubdtD+uqnbNQ7Se9upKACT0Mq26JUe4gCf8HTB0AA6KyQgYmLOWvwHxAIJ0EAil+wP9rMrBrWZJ3//R3ZIycZO9v8HherSJOqqtklpAuq2/UAaHr/wUBZwJ+/IgMhXUR49MnMiLQC+NcU85Rc3tJRNm4HkSlfG4jILPF5n2g225oIMVKuAfTFgE+M/UD3Z4PTEk3yjKAOPDNn0W9e4OkH8pnXtzdsuKPru5XPEmh53ZZ/Xc6NkhF9cdgJ2o9L9cl/RPfe2/xbRdP40=
Message-ID: <cb20dcd4-ff74-46ea-aed2-8a19fbe17cd5@suse.com>
Date: Mon, 12 Feb 2024 16:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/30] xen/rirscv: add minimal amount of stubs to build
 full Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <e25d55d1cb95c1b2b8ad0b4eae9794b5b6f84075.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e25d55d1cb95c1b2b8ad0b4eae9794b5b6f84075.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/early_printk.c
> +++ b/xen/arch/riscv/early_printk.c
> @@ -207,4 +207,3 @@ void printk(const char *format, ...)
>  }
>  
>  #endif
> -

Unrelated change?

> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -4,6 +4,10 @@
>   *
>   * RISC-V Trap handlers
>   */
> +
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +
>  #include <asm/processor.h>
>  #include <asm/traps.h>
>  
> @@ -11,3 +15,24 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>  {
>      die();
>  }
> +
> +void vcpu_show_execution_state(struct vcpu *v)
> +{
> +    assert_failed("need to be implented");
> +}
> +
> +void show_execution_state(const struct cpu_user_regs *regs)
> +{
> +    printk("implement show_execution_state(regs)\n");
> +}
> +
> +void arch_hypercall_tasklet_result(struct vcpu *v, long res)
> +{
> +    assert_failed("need to be implented");
> +}
> +
> +enum mc_disposition arch_do_multicall_call(struct mc_state *state)
> +{
> +    assert_failed("need to be implented");
> +    return mc_continue;
> +}

The assert_failed() here want switching to the "canonical" BUG_ON().

Jan

