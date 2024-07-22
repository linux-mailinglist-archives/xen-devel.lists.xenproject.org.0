Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954D2938DF3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761707.1171714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqxY-0006aA-3i; Mon, 22 Jul 2024 11:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761707.1171714; Mon, 22 Jul 2024 11:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqxY-0006Yb-14; Mon, 22 Jul 2024 11:12:04 +0000
Received: by outflank-mailman (input) for mailman id 761707;
 Mon, 22 Jul 2024 11:12:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVqxX-0006YV-1R
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:12:03 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 386c0b0d-481b-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 13:12:02 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5a22f09d976so4729317a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 04:12:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c9230f5sm409219966b.187.2024.07.22.04.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 04:12:01 -0700 (PDT)
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
X-Inumbo-ID: 386c0b0d-481b-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721646721; x=1722251521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3A9dTe8cHsRzPksCLzlIijFJ4yJyFKya6mDRlo91Kto=;
        b=E80fEI0MUTkzQBKOpw50/RpE2Hgob24NXDJWU9kTzI/tMVECGb8rIwu4Wl6+77mZDn
         Hy3niLVI54UydB0E1cWC8l/gXFCeRrWDjf4vfLUw5E97tzicir6SJnHl7C+yr3m/tXEa
         3gZtHet1CuAyzNGVvLU4R1oLwmXTq0wjofLIwxFp7NN5V4cLFIf4e7lIAVuGwLfD02M/
         TDinPQ+W1QC8DoqpAM/ubFEUkbQNMTqDr9VLQ92gwmzIrYuzXFFqxucV10qgadCO+LpK
         xXRxeKomuz78DrD/5z7xjmyiX0rp6zX8Xx9oW0G4Maw2N2ZrKxIdI+AjlZg1Xz1P7XhF
         fPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721646721; x=1722251521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3A9dTe8cHsRzPksCLzlIijFJ4yJyFKya6mDRlo91Kto=;
        b=XLFDf6AB5E35e9RjD4lyOVB9sXoAMtYVvXcOsx73cBxkIqkOT8GDNQ0qUrxjl2MrQ/
         bemmc10t1FN+fYoEbZRkxbF0+li7KE+Ukm5bKT3VoBhCb4c7PUOoZgx8OnZnDV5E7QNX
         d2umddZBZJ/njxtXVkdcmog5DRscyO6HCmyHixSfE48mHEa1+6x9xP9KVvTXuYIsy0Cc
         6zyNZuG683AechRWKPc0tSm5YerJG7+cxIXJ8OQExnS/8aeyIuJ5ZzZaZSW8dvk/1RCi
         VzLO5fwfT/33l+0XEkNPzfQOA0bYV16v+GRacHFeGiyPy58junLX2RqrWHw0OBb3TyVM
         IWqA==
X-Forwarded-Encrypted: i=1; AJvYcCWXJ5NLOqqdocqKP/L3gDmx/o2cDqWsehF5D1JcIowfVBjK21NyMPY6oCe75PSsVuYIALHRXGBQlISNnfiT/5Lt218GSxXlN6shZpqHVM0=
X-Gm-Message-State: AOJu0YzXixz2SAim9MlUQ3MHI+FNWDIV2TCATHBXGhOSSQCnL68YM9oS
	CMMvM3ss4rNymaGmNd8Bcnvxt5mlbvXBkE+CD48l8Yj/TH6ZD0orBP/uGpFg2A==
X-Google-Smtp-Source: AGHT+IHrvDXmMEi49l4TAlKSugEtiCWWPVz/8L7A8I0CbavrYo1KK9ltKn3pl55BOpTXKCcTLyejAw==
X-Received: by 2002:a17:907:7285:b0:a7a:81ba:8eb3 with SMTP id a640c23a62f3a-a7a81ba9195mr14127066b.27.1721646721460;
        Mon, 22 Jul 2024 04:12:01 -0700 (PDT)
Message-ID: <5e49cddd-3185-4576-90dd-0ed089436967@suse.com>
Date: Mon, 22 Jul 2024 13:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] xen/riscv: test basic exception handling stuff
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720799487.git.oleksii.kurochko@gmail.com>
 <17ee34d97af4bebc87facf8576cee519ca26bf12.1720799487.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <17ee34d97af4bebc87facf8576cee519ca26bf12.1720799487.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 18:18, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

As to the once again empty description and as to earlier comments of mine:

> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -19,6 +19,22 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>  
> +#ifdef CONFIG_SELF_TESTS
> +static void test_run_in_exception(const struct cpu_user_regs *regs)
> +{
> +    printk("If you see this message, ");
> +    printk("run_in_exception_handler is most likely working\n");
> +}
> +
> +static void test_macros_from_bug_h(void)
> +{
> +    run_in_exception_handler(test_run_in_exception);
> +    WARN();
> +    printk("If you see this message, ");
> +    printk("WARN is most likely working\n");
> +}
> +#endif
> +
>  void __init noreturn start_xen(unsigned long bootcpu_id,
>                                 paddr_t dtb_addr)
>  {
> @@ -26,6 +42,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      trap_init();
>  
> +#ifdef CONFIG_SELF_TESTS
> +    test_macros_from_bug_h();
> +#endif
> +
>      printk("All set up\n");
>  
>      for ( ;; )

While for the moment having this may be okay, I'd like the commit itself to
clarify what the future plans here are. The latest once Xen comes up properly
on RISC-V, this is likely going to get in the way because of the noise it
causes in the log.

Jan

