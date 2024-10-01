Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E958D98C21E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 18:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808336.1220258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svfL0-0008K5-G4; Tue, 01 Oct 2024 16:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808336.1220258; Tue, 01 Oct 2024 16:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svfL0-0008Hp-D5; Tue, 01 Oct 2024 16:02:58 +0000
Received: by outflank-mailman (input) for mailman id 808336;
 Tue, 01 Oct 2024 16:02:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svfKz-0008Hf-Lb
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 16:02:57 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f123c90-800e-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 18:02:56 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2fabd2c4ac0so40582171fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 09:02:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245ea57sm6357326a12.55.2024.10.01.09.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 09:02:54 -0700 (PDT)
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
X-Inumbo-ID: 9f123c90-800e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727798575; x=1728403375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lzPTkHfSbyTni4eb9B9/vAO9Elzqh50Bauo7x+cTXls=;
        b=D8QWSm4JVHmsRP703KEmsylapyrhL2nKIsx9gJ6yTI4BIfhzOU//YR/vOC8gHcr1Ik
         aNInfRp2/ANxzAGEA/XAcRhwoy3RTqpe/93sCpj1NGRMtrDK/oy1MiMuO6EgYMXwZMkc
         2awVhXpktXjsNMLRDg6DoE6plx/HmF9MaaXqdlddFkVf/0KTWpk2hjS+lo3KLMJPLAym
         uy9MhzV2grHt8QpyeDPbOxIBJogcXCQzVFp9ZDmv90L4x6eUtGbj5npaGoPCQQLrTQGd
         vJQrPBhyFQIvS+AthPEC2iIHnlAevdnQ45bU7tUR/SNS/gbLJ4lniDxTbM9lu5GNuIEE
         s4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798575; x=1728403375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzPTkHfSbyTni4eb9B9/vAO9Elzqh50Bauo7x+cTXls=;
        b=sVaQvHjx3uXIteIeq5vN/PcmaE+XYNG+9wOCZfdxOyPDptd2/pvL8ORXm/dexlfCqe
         dWC1b/lXMmy96iQCXG0/4i2XwG8pxJ24IUzyFJTuRKBVMitEIxwPE5H/4irtFxRx9LkL
         kwzl2jdDCQaxPcbH7Ezjoptoqb07MIwUq8eem7yrW74pSUxelTHFgbevmfyMZCPiZzrR
         yt991QxZNJmYNgbStPWcTaWE5jc55Y4oLcWJz+uOVR1TOgiuW7zHUReNuK93qaNGIRCG
         HcQsMUtIJxz8KCGxvxY099bYIkUPHLbBkko9DkP6WIiBR/9JYcc/HI5j77ZSHd9XGKs/
         v52A==
X-Forwarded-Encrypted: i=1; AJvYcCW7oZ7qBMCuilqfTq/MDHKig+mRSRdQ2iYrU16d13LKIRozKJJ6zPDSAUFpQmtey7w+S1zyrT1f5EE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3edaBrNrWh2y9JTp3l88BIGlrSCFLdIXcR1CY2cPUXwk9daiK
	yRfQoRLIAf4BtVDOuBZZEC5Re+qD3Bkpo+g1DFipwylQwMIeI1nt41YeYLlxwg==
X-Google-Smtp-Source: AGHT+IEK6gITCp6ea0CUX0obcR/XzNLNEbEZRppBofyUvvm763aOsPd9evsMF0yOvioOf4QKGpkbGw==
X-Received: by 2002:a2e:be24:0:b0:2f6:4f17:aeaf with SMTP id 38308e7fff4ca-2fae10ba2e6mr1689891fa.45.1727798575204;
        Tue, 01 Oct 2024 09:02:55 -0700 (PDT)
Message-ID: <0d49ee74-9e19-4f77-9c5c-cbd86cac4b0d@suse.com>
Date: Tue, 1 Oct 2024 18:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] x86/boot: Improve MBI2 structure check
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
 <20241001102239.2609631-3-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241001102239.2609631-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 12:22, Frediano Ziglio wrote:
> --- a/xen/arch/x86/efi/mbi2.c
> +++ b/xen/arch/x86/efi/mbi2.c
> @@ -13,6 +13,7 @@ efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
>      EFI_HANDLE ImageHandle = NULL;
>      EFI_SYSTEM_TABLE *SystemTable = NULL;
>      const char *cmdline = NULL;
> +    const void *const mbi_raw = (const void *)mbi;
>      bool have_bs = false;
>  
>      if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
> @@ -21,7 +22,9 @@ efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
>      /* Skip Multiboot2 information fixed part. */
>      tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
>  
> -    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size &&
> +    for ( ; (const void *)(tag + 1) - mbi_raw <= mbi->total_size &&
> +            tag->size >= sizeof(*tag) &&
> +            (const void *)tag + tag->size - mbi_raw <= mbi->total_size &&
>              tag->type != MULTIBOOT2_TAG_TYPE_END;
>            tag = _p(ROUNDUP((unsigned long)tag + tag->size,
>                     MULTIBOOT2_TAG_ALIGN)) )

Hmm, looks like what I said on the earlier version still wasn't unambiguous
enough; I'm sorry. There is still potential for intermediate overflows in
the calculations. _If_ we care about avoiding overflows, we need to avoid
all of that. Even more so that Misra may not like this sort of pointer
calculations. You know tag >= mbi_raw, so tag - mbi_raw is always valid to
calculate. tag->size can further be checked to be less than mbi->total_size,
at which point mbi->total_size - tag->size can also be calculated without
risking {over,under}flow. (Similar then for the earlier (tag + 1) check.)

Jan

