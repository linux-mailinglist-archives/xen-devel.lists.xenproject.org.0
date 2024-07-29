Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C0E93F60A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 15:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766722.1177232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYPzR-0003Dz-I1; Mon, 29 Jul 2024 13:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766722.1177232; Mon, 29 Jul 2024 13:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYPzR-0003C7-FQ; Mon, 29 Jul 2024 13:00:37 +0000
Received: by outflank-mailman (input) for mailman id 766722;
 Mon, 29 Jul 2024 13:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYPzQ-0003C1-Le
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 13:00:36 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ba7852e-4daa-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 15:00:35 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7d2a9a23d9so339205966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 06:00:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab52932sm501059566b.77.2024.07.29.06.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 06:00:34 -0700 (PDT)
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
X-Inumbo-ID: 8ba7852e-4daa-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722258035; x=1722862835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0M9z771BB643RbT6KD1Kab4CxpYlJRLqSLh2eCZUKik=;
        b=aJHqHrhPbcG1bn3hVZCUpXCt13EunADy79HfOZXANS6WIt43Qnd8SknQGZQ5C8anuk
         06FzatcwkiChOVPZgZnXfdVP9NujiUu/ygM4Ji332phmswcOgRu0PL2FdXdNXBhptP6d
         IAAXhy+XyLT7/jsNeqe1rvkL56CNcCwDICMfBYqOyeg4/0hkbIgDko/yX/R6jOknJI6h
         nfUzstrb8IvrcOFTsuppBEX5aYYxp8Ms6ag7bxii4A442ZA0Z/6On20Yqrl0n4xY2bnK
         6ySG67pdsFGcU936xVLy3w1p9c7gOZSOzWFuBzI4SMG78aYXoQ8eo/R9Fqn/x/ppsKsS
         KOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258035; x=1722862835;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0M9z771BB643RbT6KD1Kab4CxpYlJRLqSLh2eCZUKik=;
        b=Fnf7cULEatPlIKKtoVbMVRm3B6PWp5qyLLOrvKyIdESXfnaW2zLUuu0MnXo1mGZyVx
         3M1oVHdLRomfoxI48adihA4HuI3FD3dFh0Ax80H2fwYtzVlHBXj40AQzSKdS6xmnnMdI
         ViM18a8KMw3yf+Z2Jbtl0fNa3btqseutBDIAyrW/5rWYWmAe7+Ec7r6g/IbpsFzzNXYC
         GIpZEM9Yi8BraVXTuiO7ehhG3OjrznwxtxXKac48eRi2Fj+DSzxdaY+Ejilhk2cDQV0G
         hZkoLetuHo/dt55Kj//ocnc2p90XmmRP9mKIDDRzQMsqa5uc4B6RCijC1FPvgjnlQuiS
         9xpg==
X-Gm-Message-State: AOJu0YyS1fbEn3DdT499o18ZngOMe6GP6mc0bJD6nSA/6gsqnXLR7SMb
	YEdmOLDMOiYiPmuRRTi1JxwgNIkxeeWt9WobUheIeyy6033CZVgpYyKNSgeci/e2kwyYKv/Uc9k
	=
X-Google-Smtp-Source: AGHT+IFrfiPOfLPg4wHhDA2KK0TMTQikMg+Fwm7reAz4QMe3SH3FWJ8ifiFFwUMHtTE6teqE/Ydz7A==
X-Received: by 2002:a17:907:ea2:b0:a77:dd1c:6274 with SMTP id a640c23a62f3a-a7d401e13c5mr480017566b.69.1722258034998;
        Mon, 29 Jul 2024 06:00:34 -0700 (PDT)
Message-ID: <7c03ed78-7c80-45bf-acf3-a916b7abb7d5@suse.com>
Date: Mon, 29 Jul 2024 15:00:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/5] xen/riscv: enable GENERIC_BUG_FRAME
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
 <b79bcfb9031564fc8d275af66fa94c1e82e54de2.1721731887.git.oleksii.kurochko@gmail.com>
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
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <b79bcfb9031564fc8d275af66fa94c1e82e54de2.1721731887.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 17:31, Oleksii Kurochko wrote:
> To have working BUG(), WARN(), ASSERT, run_in_exception_handler()
> it is needed to enable GENERIC_BUG_FRAME.
> 
> ebreak is used as BUG_insn so when macros from <xen/bug.h> are
> used, an exception with BREAKPOINT cause will be generated.
> 
> ebreak triggers a debug trap, which starts in debug mode and is
> then filtered by every mode. A debugger will first handle the
> debug trap and check if ebreak was set by it or not. If not,
> CAUSE_BREAKPOINT will be generated for the mode where the ebreak
> instruction was executed.

Here and in the similar code comment you talk about an external
debugger, requiring debug mode, which is an optional feature. In
my earlier comments what I was referring to was pure software
debugging. I continue to fail to see how properly distinguishing
ebreak uses for breakpoints from ebreak uses for e.g. BUG() and
WARN() is going to be feasible.

> @@ -103,7 +104,39 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>  
>  void do_trap(struct cpu_user_regs *cpu_regs)
>  {
> -    do_unexpected_trap(cpu_regs);
> +    register_t pc = cpu_regs->sepc;
> +    unsigned long cause = csr_read(CSR_SCAUSE);
> +
> +    switch ( cause )
> +    {
> +    /*
> +     * ebreak is used as BUG_insn so when macros from <xen/bug.h> are
> +     * used, an exception with BREAKPOINT cause will be generated.
> +     *
> +     * ebreak triggers a debug trap, which starts in debug mode and is
> +     * then filtered by every mode. A debugger will first handle the
> +     * debug trap and check if ebreak was set by it or not. If not,
> +     * CAUSE_BREAKPOINT will be generated for the mode where the ebreak
> +     * instruction was executed.
> +     */
> +    case CAUSE_BREAKPOINT:
> +        if ( do_bug_frame(cpu_regs, pc) >= 0 )
> +        {
> +            if ( !(is_kernel_text(pc) || is_kernel_inittext(pc)) )
> +            {
> +                printk("Something wrong with PC: %#lx\n", pc);
> +                die();
> +            }
> +
> +            cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
> +        }
> +
> +        break;

Wouldn't you better fall through here, with the "break" moved into
the if()'s body?

Jan

> +    default:
> +        do_unexpected_trap(cpu_regs);
> +        break;
> +    }
>  }



