Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702B889BD75
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 12:43:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701904.1096519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtmSS-0002VA-PI; Mon, 08 Apr 2024 10:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701904.1096519; Mon, 08 Apr 2024 10:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtmSS-0002SW-MO; Mon, 08 Apr 2024 10:42:36 +0000
Received: by outflank-mailman (input) for mailman id 701904;
 Mon, 08 Apr 2024 10:42:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtmSR-0002SQ-3f
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 10:42:35 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4832752-f594-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 12:42:32 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so44970991fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 03:42:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n5-20020a5d5985000000b00345a5183f01sm2762504wri.108.2024.04.08.03.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 03:42:32 -0700 (PDT)
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
X-Inumbo-ID: b4832752-f594-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712572952; x=1713177752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFdfvxDdFvufEaNRn1R04TJsEnVhjfiJIYFD4KCzBjQ=;
        b=gnIJ/ksLCUC8pBRVh8mbtjBTjnhFxIARA4U8iEO/1MUamO0yxNVr2Gr5SPaNWsqZms
         X99ysP/P2e6Umm/4PiN0deMq7eg63JxHmptU5i1mwbA9t1jfU0faLQterTTu7aT1deJH
         98X9B9mEIBGjSR1BM/NzpqnGbpGgbdFE2QzodhJ1ti8NhUD63eMUY8TiualZMTknRcbV
         JFmBBTE9LXfZyXzB9Ez89ai5o03OjcREvYcQKMlDaKg9gPugij7T5wE6ok4FDTMlc6A+
         SaqYcZqPX3kriyn7SdAzTZRrPuUlQ0D8CIT9oCvtafaH7ftUTkNhMMWDDXkKyqautFyp
         ETPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712572952; x=1713177752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFdfvxDdFvufEaNRn1R04TJsEnVhjfiJIYFD4KCzBjQ=;
        b=UE9Jx0XQLMwMO9bCCNWhkO/h7LlxicNqwcIGVefdrecSb/R+8vrvuKCtofshKh6R8O
         vuYq5MLs+N/t4bIEe5jyIO1bzz6GFSNQFLX1o1fp4eKccGknSMAxbcO24A0NIVgsxafQ
         RSidKGCY5u/y37YDZSso9uCpKeBBR6cajapgkW+ILIiVBUkZIqSahJ4McISIeVPgBMpB
         u7HJRFLn8kqV2e1tcGooE90vrHbBlU91Qskcz7fFg3cxoeGx3ZJ0Jehjv7Yv1E7X/gw6
         yHkUVrcgOuW3tjHevOHCeYbX/GqLA78AAEs6UDavLa4dGb9M8TWsOFQZ8c6r/andM4lf
         dNCA==
X-Forwarded-Encrypted: i=1; AJvYcCWs/v26uFdVHuq3EKxyGaIhZgAiKLn0kP/sZVosfbdyjxd6gHHQ9+10JqioxuXfT/yQNqLFayKtIf/gEHHtp+tjo6qQhcITXT2+g7vnSM4=
X-Gm-Message-State: AOJu0YwtFgMV3Q8txz1Fh05LTL7psQyhbNO/BZdThojbfRCVHQ+lrd/l
	D9q7lV6frHLhn0d4jVoBSpkaXk1SJI9AepESZAltH389lQX2h7XGjb/Pk6Xr7w==
X-Google-Smtp-Source: AGHT+IGRyU4ptcu5ta0X+zjhEK/vosss3O5O1iTIsgwFgALoyn23i64WIGU0Ui6FqdnHeq9E9PItDA==
X-Received: by 2002:a2e:9b05:0:b0:2d8:2799:fbcf with SMTP id u5-20020a2e9b05000000b002d82799fbcfmr5801748lji.34.1712572952462;
        Mon, 08 Apr 2024 03:42:32 -0700 (PDT)
Message-ID: <d15e9313-c5d9-442f-9e47-caa504df9977@suse.com>
Date: Mon, 8 Apr 2024 12:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86: Call Shim Verify in the multiboot2 path
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240328151106.1451104-1-ross.lagerwall@citrix.com>
 <20240328151106.1451104-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20240328151106.1451104-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2024 16:11, Ross Lagerwall wrote:
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -3,6 +3,7 @@
>   * is intended to be included by common/efi/boot.c _only_, and
>   * therefore can define arch specific global variables.
>   */
> +#include <xen/multiboot2.h>
>  #include <xen/vga.h>
>  #include <asm/e820.h>
>  #include <asm/edd.h>
> @@ -808,9 +809,69 @@ static const char *__init get_option(const char *cmd, const char *opt)
>      return o;
>  }
>  
> +#define ALIGN_UP(arg, align) \
> +                (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))

Nit: I don't think aligning the opening parentheses is an appropriate
criteria here. Imo either

#define ALIGN_UP(arg, align) \
            (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))

or

#define ALIGN_UP(arg, align) \
        (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))

or

#define ALIGN_UP(arg, align) \
    (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))

.

> +static void __init efi_verify_dom0(uint64_t mbi_in)
> +{
> +    uint64_t ptr;
> +    const multiboot2_tag_t *tag;
> +    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
> +    EFI_STATUS status;
> +    const multiboot2_tag_module_t *kernel = NULL;
> +    const multiboot2_fixed_t *mbi_fix = _p(mbi_in);
> +    static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
> +    static EFI_GUID __initdata global_variable_guid = EFI_GLOBAL_VARIABLE;
> +
> +    ptr = ALIGN_UP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
> +
> +    for ( tag = _p(ptr); (uint64_t)tag - mbi_in < mbi_fix->total_size;
> +          tag = _p(ALIGN_UP((uint64_t)tag + tag->size, MULTIBOOT2_TAG_ALIGN)) )
> +    {
> +        if ( tag->type == MULTIBOOT2_TAG_TYPE_MODULE )
> +        {
> +            kernel = (const multiboot2_tag_module_t *)tag;
> +            break;

This could do with a comment along the lines of what __start_xen() has
("Dom0 kernel is always first").

> +        }
> +        else if ( tag->type == MULTIBOOT2_TAG_TYPE_END )

Not need for "else" here (personally I find such irritating).

> +            break;
> +    }
> +
> +    if ( !kernel )
> +        return;
> +
> +    if ( (status = efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> +                                          (void **)&shim_lock)) != EFI_SUCCESS )
> +    {
> +        UINT32 attr;
> +        UINT8 data;
> +        UINTN size = sizeof(data);
> +
> +        status = efi_rs->GetVariable((CHAR16 *)L"SecureBoot", &global_variable_guid,
> +                                     &attr, &size, &data);
> +        if ( status == EFI_NOT_FOUND )
> +            return;
> +
> +        if ( EFI_ERROR(status) )
> +            PrintErrMesg(L"Could not get SecureBoot variable", status);
> +
> +        if ( attr != (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_RUNTIME_ACCESS) )
> +            PrintErrMesg(L"Unexpected SecureBoot attributes", attr);

This wants to be blexit(), not PrintErrMesg().

> +        if ( size == 1 && data == 0 )
> +            return;
> +
> +        blexit(L"Could not locate shim but Secure Boot is enabled");
> +    }
> +
> +    if ( (status = shim_lock->Verify(_p(kernel->mod_start),
> +                                     kernel->mod_end - kernel->mod_start)) != EFI_SUCCESS )
> +        PrintErrMesg(L"Dom0 kernel image could not be verified", status);
> +}

Overall this is a superset of what efi_start() does. What I'm missing from
the description is some discussion of why what's done there is not
sufficient (beyond the env var check, which iirc there once was a patch to
add it). One could only then judge whether it wouldn't make sense to make
this function uniformly used by both paths (with mbi_in suitably dealt with
for the other case).

Jan

