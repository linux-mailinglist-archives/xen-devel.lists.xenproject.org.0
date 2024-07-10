Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514C092CED7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 12:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756729.1165447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUDV-0005F1-U4; Wed, 10 Jul 2024 10:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756729.1165447; Wed, 10 Jul 2024 10:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUDV-0005CA-R7; Wed, 10 Jul 2024 10:06:29 +0000
Received: by outflank-mailman (input) for mailman id 756729;
 Wed, 10 Jul 2024 10:06:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRUDU-0005Ab-B3
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 10:06:28 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12606ea9-3ea4-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 12:06:27 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77e392f59fso476655666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 03:06:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ab7d9csm30068935ad.157.2024.07.10.03.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 03:06:26 -0700 (PDT)
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
X-Inumbo-ID: 12606ea9-3ea4-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720605987; x=1721210787; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=btjSNm5FN0TsaOi2KgoyCCNuDTHHlVE7dy4Ew46xS2E=;
        b=CrTuSSJb2ouC8HKW11fGiXJHUu/KdKlY7OWcyFZRdNdIp87IPFVy+rnyx2fNYSj9jB
         Ga5FMvYRIqLdZ+yQD0NteuLznadUvTrEPoJwZKnL2B/HIuTjHskd1BzYi+OhHvTOb5rl
         p3U8643/eDgCtdUDQ4oezSNZX/7OdWtA5kWYKlSfotVNosP9GZVyjJEQLyQ7qAvbtU5j
         gxbQCuyDRb55O2n3cjrN+9+TP5KN9nkFexrZ7xK2DBw1ZITX2QOn+y+NYQumfZ/QkFLp
         HQZSSfnOGfjyPvulaplZhOFeRiiipDyI+fQGxRSRnUD/X7My4jqHD8XnZ3blDsG3z3GX
         NA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720605987; x=1721210787;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btjSNm5FN0TsaOi2KgoyCCNuDTHHlVE7dy4Ew46xS2E=;
        b=gQ3WMYzQJez7Mg6m0rKh4pTGofIQ+y1H0gQyRJk2uLmiO7vVr1SvujGUZ8/zoWYzwM
         CzEzjdgHAIphOJJxMKgKGGmCCVi5HfIS3tq/FedxlirfqE4oLDK1FXEY2e+zh/sSprky
         FC60v7aZX+6CiKpwVnPZiFMhD0L6R6avBp8PRzhN/wQEAq4yZAoVCF9EW0yXarMFmybk
         plrBZKsf3d+jZAS5MKPtAlBw6cR4H1eR3KivAMx2xQhx6Sg3pZGb9x1CgOGkqvkvUY9J
         hU8fcx6klN6jLSx1F2ExSbKbZBDEpzMFMPblfDXYrnZYYIKVLg3UG8QxsofYm1g0MEYE
         DFmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb2KmuoD8+0BDWLYDwfYWQsmQzAI30j+jWWobCH5kHd6nFp5Omhuu2bmlgrs477u4q5t6AUMLiU5toGf1ORQ0Q3Ppkl2P1JNEbyWg3TTg=
X-Gm-Message-State: AOJu0YxnvaxocnWvmEVp23hHSIpS7BjvcbGPzJDnj20KYlxcrZvBIrlb
	2+Ti7DGsYiNViWAP225cVDJUzu5J8YEDX0O08Kk5T3yyyQXWqWnrfsfbnKnzzg==
X-Google-Smtp-Source: AGHT+IFReCUuAYRz9PtOf8a28JcPRmNoXktsOIqdMhgZN2vAA23E45u/Lq8zdkYeNTZK6IEq3gSFOA==
X-Received: by 2002:a17:906:c00f:b0:a6f:cf64:a5d9 with SMTP id a640c23a62f3a-a780b885722mr283180266b.49.1720605987038;
        Wed, 10 Jul 2024 03:06:27 -0700 (PDT)
Message-ID: <48dcb83f-3314-4091-9e57-9f757d7bc9db@suse.com>
Date: Wed, 10 Jul 2024 12:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] xen/riscv: test basic handling stuff
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
 <62cce91351f00f80cb1c7701906e2d8cd3301ec1.1719918148.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <62cce91351f00f80cb1c7701906e2d8cd3301ec1.1719918148.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 13:23, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  xen/arch/riscv/setup.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index a6a29a1508..4f06203b46 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -19,6 +19,20 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>  
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

While for the moment this may be okay, in the longer run WARN() will cause
quite a bit of output that you don't want on every boot. The further plans
here will want mentioning in the description.

Additionally as part of re-basing I think you would have wanted to put this
under the (relatively new) SELF_TESTS Kconfig control.

Jan

> @@ -26,6 +40,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      trap_init();
>  
> +    test_macros_from_bug_h();
> +
>      printk("All set up\n");
>  
>      for ( ;; )


