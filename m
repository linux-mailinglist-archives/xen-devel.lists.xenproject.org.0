Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F05AE9ED0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 15:32:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026415.1401613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmhr-0003Ys-Hq; Thu, 26 Jun 2025 13:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026415.1401613; Thu, 26 Jun 2025 13:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmhr-0003Wy-EN; Thu, 26 Jun 2025 13:31:59 +0000
Received: by outflank-mailman (input) for mailman id 1026415;
 Thu, 26 Jun 2025 13:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUmhp-0003Ws-Sw
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 13:31:57 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed90a8c4-5291-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 15:31:56 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so953866f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 06:31:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d872ffd5sm166317075ad.240.2025.06.26.06.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 06:31:54 -0700 (PDT)
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
X-Inumbo-ID: ed90a8c4-5291-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750944715; x=1751549515; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g4LQsjev7sNqxQo+ymGPdBu+bLwbE2u9tg5PJftsgZo=;
        b=VW8XolgTe/xCplFaEqlabnZ2r6/S29pZ3MRZhorwVhladkr1XVLRvKy98pSH8g8WTW
         96L7lR6ckfeWqDA7bugguHEKimluh3o291MOUyED17A3aOBtLW2s9jtYcArYxMc34Y/+
         SXZWK+s5oZnW91Stt1NL97LIwnf+oOu8fmN7qBfcD/UrERJANI12YMf6WbzUM1CdxpkE
         nRXDcf8CHMNlQNrejoClHDThOAauiYfLEMHzs5nVhDl4aobaTVccHPvhF4wOvpFz1yU7
         634eiDe1TtpJA8T0EApKkCmN/qSo82dCNW1QWqy0F2zGMnIz33wpsw2RjpNk47wnjsBh
         lk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944715; x=1751549515;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4LQsjev7sNqxQo+ymGPdBu+bLwbE2u9tg5PJftsgZo=;
        b=OtHGDEtdEdoYZofPgQDi4gv2iFfIrCdO+cVKbsw8feTXfZmVzsv1/8SKtwZ2YP29dz
         qg3uL2PIS0UzkZ4NVeko0qROg5VO98GA6aGDmW17Jr9I05KYV5DosUqljtcfXgApQJ7L
         GRocuX7GBLbQ54h6JVtNSyP1HxvrfvjMMqlEpJn5tjMlS3APGAodGph00CRoLtlPgwqY
         aILKav2xCb6teYptoyHaIh/pOM/GeR/xgMy/pLth7sjDyyjq56AciRsspNDk17Frjfjy
         TFEakQGpHNXyu6MiTCABJc31GlBhZNqvB8sROOEygFXNuUW9PXr9Bs7OTyLNtYo1ZEPB
         Uu5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8w1u09Rf4p1a/Pf7UP4Hs9qx3X9zksB1ZFM/U30SdBdczpX4k8oJqH8Eh4Uytyvqo7FAlDPJu+gk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2LhbPmNUtbk/NZL3yOwzN8f6A5k68VYkMNxD4lmn6qnD29MgP
	KPVCLAFT9Todo1mEkutECRSQT4m/RwrfQy8wIt4Pask+i0xaZBrdjthBetbCF70YIqMfO+drqlL
	YN8Q=
X-Gm-Gg: ASbGnctLMT9xn47JW5MZbuCral9eF5HsUqymiScpBeW26NVhVd35h3x8x6lwp/pKWem
	mcLH2BXQXQtFdwxMJSEdlBFB+rYWT0n3O8TX1p+7ky8Hpe7z5dX54hVT0B4l7F6PtS17HpLzhD4
	l3RAUjNn+qDHHPuJ1TpN5ckQYsoCzMDg4WAxnuRAHy1lDlF0QJOOQKZqJ8lppC+2zxhoFlJBxTN
	9iri5kACjzVlgOUy5UoOH9amjtugYAFNkF7bVMKQOdkKMdNotU0WQyDyNjocBZRvKHePDWeUrm4
	+UCBorocx6UDMeVaJFzkKdfMN8tz8O/JEODl3ikb7LEKq9CugZjsfUuHimJyD53gPAkflekRddP
	jYD3qRj5TSq/e6lakL8uU+OfxeAVM1UtV+opsBxUjh/uxvq0=
X-Google-Smtp-Source: AGHT+IEMJdO+y8FTF/ninkWfW6Ch0l6BgVjKyaXzSDvx+Y5h7cJ39YRaEYcYeJ62AI/0awScpkL7Ig==
X-Received: by 2002:a05:6000:2b11:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a6ed646bebmr4033870f8f.46.1750944715073;
        Thu, 26 Jun 2025 06:31:55 -0700 (PDT)
Message-ID: <9d64c239-d6cc-4eb5-b180-a5034bedcfdb@suse.com>
Date: Thu, 26 Jun 2025 15:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] xen/efi: Update error flow for read_file function
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250626131059.61894-1-frediano.ziglio@cloud.com>
 <20250626131059.61894-4-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250626131059.61894-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2025 15:10, Frediano Ziglio wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -792,6 +792,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>  
>      if ( !name )
>          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> +
> +    what = L"Open";
>      if ( dir_handle )
>          ret = dir_handle->Open(dir_handle, &FileHandle, name,
>                                 EFI_FILE_MODE_READ, 0);
> @@ -800,54 +802,58 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      if ( file == &cfg && ret == EFI_NOT_FOUND )
>          return false;
>      if ( EFI_ERROR(ret) )
> -        what = L"Open";
> -    else
> -        ret = FileHandle->SetPosition(FileHandle, -1);
> +        goto fail;
> +
> +    what = L"Seek";
> +    ret = FileHandle->SetPosition(FileHandle, -1);
>      if ( EFI_ERROR(ret) )
> -        what = what ?: L"Seek";
> -    else
> -        ret = FileHandle->GetPosition(FileHandle, &size);
> +        goto fail;
> +
> +    what = L"Get size";
> +    ret = FileHandle->GetPosition(FileHandle, &size);
>      if ( EFI_ERROR(ret) )
> -        what = what ?: L"Get size";
> -    else
> -        ret = FileHandle->SetPosition(FileHandle, 0);
> +        goto fail;
> +
> +    what = L"Seek";
> +    ret = FileHandle->SetPosition(FileHandle, 0);
>      if ( EFI_ERROR(ret) )
> -        what = what ?: L"Seek";
> -    else
> -    {
> -        file->addr = min(1UL << (32 + PAGE_SHIFT),
> -                         HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> -        ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> -                                    PFN_UP(size), &file->addr);
> -    }
> +        goto fail;
> +
> +    what = L"Allocation";
> +    file->addr = min(1UL << (32 + PAGE_SHIFT),
> +                     HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> +    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> +                                PFN_UP(size), &file->addr);
>      if ( EFI_ERROR(ret) )
> -        what = what ?: L"Allocation";
> -    else
> -    {
> -        file->need_to_free = true;
> -        file->size = size;
> -        handle_file_info(name, file, options);
> +        goto fail;
>  
> -        ret = FileHandle->Read(FileHandle, &file->size, file->str);
> -        if ( !EFI_ERROR(ret) && file->size != size )
> -            ret = EFI_ABORTED;
> -        if ( EFI_ERROR(ret) )
> -            what = L"Read";
> -    }
> +    file->need_to_free = true;
> +    file->size = size;
> +    handle_file_info(name, file, options);
>  
> -    if ( FileHandle )
> -        FileHandle->Close(FileHandle);
> +    what = L"Read";
> +    ret = FileHandle->Read(FileHandle, &file->size, file->str);
> +    if ( !EFI_ERROR(ret) && file->size != size )
> +        ret = EFI_ABORTED;
> +    if ( EFI_ERROR(ret) )
> +        goto fail;
>  
> -    if ( what )
> -    {
> -        PrintErr(what);
> -        PrintErr(L" failed for ");
> -        PrintErrMesg(name, ret);
> -    }
> +    FileHandle->Close(FileHandle);
>  
>      efi_arch_flush_dcache_area(file->ptr, file->size);
>  
>      return true;
> +
> +fail:

Nit: Style (see ./CODING_STYLE).

Jan

