Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CCCAE9EC4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 15:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026407.1401603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmfJ-0001yn-5V; Thu, 26 Jun 2025 13:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026407.1401603; Thu, 26 Jun 2025 13:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmfJ-0001vR-2r; Thu, 26 Jun 2025 13:29:21 +0000
Received: by outflank-mailman (input) for mailman id 1026407;
 Thu, 26 Jun 2025 13:29:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUmfI-0001vL-6C
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 13:29:20 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f796df8-5291-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 15:29:18 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so986518f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 06:29:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34c4320a15sm1738284a12.32.2025.06.26.06.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 06:29:16 -0700 (PDT)
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
X-Inumbo-ID: 8f796df8-5291-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750944557; x=1751549357; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n0YSGjtTnyxc0oIsd6TCtR4VeLrCFWR5/fPHWZKd58o=;
        b=UdwiVvEbD3bh2GITiWvrXbQYoR7tAfiJSbbFc5aozkuYPnNTIiBp6cVGwvRpBzaZyh
         FBgZrolAMq0WWDibBLmYlfLP6COeotfaRXCVUSgd8VmmhtQXIUAFmy0s9nvBWVSM68mU
         0C5CIfMkfgrJ+ycova60UErnYiuq0t01n0Z4Lcd8bOCy+45dHjelemwj9JYuxrRg7d1R
         xVpc9TMS6UE0LYBfseB3lhYCxHI4uT7ze+CkslaoV5EpFWE3uyrms6ZMVPBu5kTfg+CV
         tfhXc7bl300+FMq4W9+bvq5n24dfoTsPfP5iCrxk0Dfg+Jp1qiPYkDowrqe+uhr5aA2n
         b93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944557; x=1751549357;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0YSGjtTnyxc0oIsd6TCtR4VeLrCFWR5/fPHWZKd58o=;
        b=hQ5XEmhjXcSF/MVWQiPUhNlTPeb60HnYRdTikdnQ8vkiUQRZKMiIaDb5+vKyUPHIs9
         ghJ0iMN1egGjzItgvSfVKxszm4TD9LkQDCPU+qsYZK34ekxMsQqt3AgaeURy3OOkT+PM
         MtRtDRD+aNZeK5uAQdZa45rukUFLYw1IUzQue9W6f1/oQ2SDObpUJhHbb7ceBbi4mq6o
         Ue3SfQqYQ3YNvAPIDIteJDtIZCf2WX1I2mbMnRqrvVuuEZE/Fdc6zxDkE9AjyfGfqroT
         mkpSEApUg03L7nFx5zirvJlPsnDcO0ZIgElj6kKThr9WcjQdk9JykJwFLtS//TK8zjG6
         1laQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTk/cC8SSnTH8AoDLeXCoZ/Wh5kn9abnHvBazk/k9pbCBlpYvIhMEDFOgS8IO7f/14Mst/0DOr9+s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynGjUBZeMTzSGr1BJc9XwCgNlswarGrQS3nblzG1lnvLw2JIA+
	fxiabBjZBTphor7cwyCBFdVEv/1cpfHNROykOXyz36QYcWeTem+vG0n3PTYJkVY8kWIubHQV5cE
	qgUc=
X-Gm-Gg: ASbGnctNqNOz6oTnX/f7R2Bd2t01sG4KQqpf0ZAAOiBUsDq8SwMXbZT8rzPMCBTFSBU
	e4K56PP8D0ewt2dW7rpuPoqcaQOtDvi595NSFuEworemAkgROs8nnPDXQ7lr8gZpFoapURYSnqT
	TrfwLsilXud1t/zD6gzXdjRKR8rjYyJT8HPr+h06Ae8P5RpacAnEeCW+djp6s1XEzUNuup8tUnv
	0GSLummIudj+ZzHUFuoyU7iHah9z5f7i5qBYaS7MUUGPP1nmm9IOBeP3VgJb+09+ABvUj/IXg4q
	/N00h7MXNGJbMY9C7SLbZMUrZSeGctAhcidBr8Gkymf090es/5YpNGgWJwcezSo09M8ZBC0qY2d
	icUW1Oz5PP24DmMBKWX64HtCNC1mhFGG+WrHdEPVf1gJc5M+Hlfb1TGrTqw==
X-Google-Smtp-Source: AGHT+IEjnshZCBjUzlUKNsgqGIxMbZnCFBDBRHjT8ENSCXmS0sLEuKLALIYs+Xh65nyVKb4vP6bQMg==
X-Received: by 2002:a5d:5f91:0:b0:3a5:2465:c0a4 with SMTP id ffacd0b85a97d-3a6ed5db111mr5967480f8f.20.1750944557327;
        Thu, 26 Jun 2025 06:29:17 -0700 (PDT)
Message-ID: <df050f76-d82b-479a-8ba2-97eea02b74ee@suse.com>
Date: Thu, 26 Jun 2025 15:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/efi: Support loading initrd using GRUB2
 LoadFile2 protocol
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250625073408.7496-1-frediano.ziglio@cloud.com>
 <20250625073408.7496-3-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250625073408.7496-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 09:34, Frediano Ziglio wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -850,6 +850,74 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      return true;
>  }
>  
> +#pragma pack(1)
> +typedef struct {
> +    VENDOR_DEVICE_PATH              VenMediaNode;
> +    EFI_DEVICE_PATH                 EndNode;
> +} SINGLE_NODE_VENDOR_MEDIA_DEVPATH;
> +#pragma pack()

Where is this coming from? And why is this declared locally here, but the ...

> +static bool __init initrd_load_file2(const CHAR16 *name, struct file *file)
> +{
> +    static const SINGLE_NODE_VENDOR_MEDIA_DEVPATH __initconst initrd_dev_path = {
> +        {
> +            {
> +                MEDIA_DEVICE_PATH, MEDIA_VENDOR_DP, { sizeof (VENDOR_DEVICE_PATH) }
> +            },
> +            LINUX_EFI_INITRD_MEDIA_GUID
> +        },
> +        {
> +            END_DEVICE_PATH_TYPE, END_ENTIRE_DEVICE_PATH_SUBTYPE,
> +            { sizeof (EFI_DEVICE_PATH) }
> +        }
> +    };
> +    static EFI_GUID __initdata lf2_proto_guid = EFI_LOAD_FILE2_PROTOCOL_GUID;

... corresponding GUID is put in a (random?) header file?

> +    EFI_DEVICE_PATH *dp;
> +    EFI_LOAD_FILE2_PROTOCOL *lf2;
> +    EFI_HANDLE handle;
> +    EFI_STATUS ret;
> +    UINTN size;
> +
> +    dp = (EFI_DEVICE_PATH *)&initrd_dev_path;

Instead of a (fragile) cast, why not

    dp = &initrd_dev_path->VenMediaNode.Header;

? And then perhaps also as initializer of the variable?

> +    ret = efi_bs->LocateDevicePath(&lf2_proto_guid, &dp, &handle);
> +    if ( EFI_ERROR(ret) )
> +    {
> +        if ( ret == EFI_NOT_FOUND)
> +            return false;
> +        PrintErrMesg(L"Error getting file with LoadFile2 interface", ret);
> +    }
> +
> +    ret = efi_bs->HandleProtocol(handle, &lf2_proto_guid, (void **)&lf2);
> +    if ( EFI_ERROR(ret) )
> +        PrintErrMesg(L"LoadFile2 file does not provide correct protocol", ret);
> +
> +    size = 0;
> +    ret = lf2->LoadFile(lf2, dp, false, &size, NULL);
> +    if ( ret != EFI_BUFFER_TOO_SMALL )
> +        PrintErrMesg(L"Loading failed", ret);

Here it's particularly bad, but throughout: How would one know in what
context the failure was? Wouldn't you want to include "name" in the
output? read_file() does include this detail.

> +    file->addr = min(1UL << (32 + PAGE_SHIFT),
> +                     HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);

I understand you took this from read_file(), but the construct looks
outdated. For one, it should have been abstracted away when the Arm64
work was done (I don't think such a restriction exists there), and
then I'm also not sure the restriction would unconditionally apply on
x86 anymore.

> +    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> +                                PFN_UP(size), &file->addr);
> +    if ( EFI_ERROR(ret) )
> +        PrintErrMesg(L"Allocation failed", ret);
> +
> +    file->need_to_free = true;
> +    file->size = size;
> +
> +    ret = lf2->LoadFile(lf2, dp, false, &size, file->str);
> +    if ( EFI_ERROR(ret) )
> +    {
> +        efi_bs->FreePages(file->addr, PFN_UP(size));
> +        PrintErrMesg(L"Loading failed", ret);
> +    }
> +
> +    efi_arch_handle_module(file, name, NULL);

Shouldn't it be handle_file_info() that you call, and a little earlier?

> --- a/xen/include/efi/efidevp.h
> +++ b/xen/include/efi/efidevp.h
> @@ -398,5 +398,26 @@ typedef union {
>  
>  } EFI_DEV_PATH_PTR;
>  
> +#define EFI_LOAD_FILE2_PROTOCOL_GUID \
> +    { 0x4006c0c1, 0xfcb3, 0x403e, {0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0xe0, 0x6d } }
> +
> +typedef struct EFI_LOAD_FILE2_PROTOCOL EFI_LOAD_FILE2_PROTOCOL;
> +
> +typedef
> +EFI_STATUS
> +(EFIAPI *EFI_LOAD_FILE2)(
> +    IN EFI_LOAD_FILE2_PROTOCOL      *This,
> +    IN EFI_DEVICE_PATH              *FilePath,
> +    IN BOOLEAN                      BootPolicy,
> +    IN OUT UINTN                    *BufferSize,
> +    IN VOID                         *Buffer OPTIONAL
> +    );
> +
> +struct EFI_LOAD_FILE2_PROTOCOL {
> +    EFI_LOAD_FILE2                  LoadFile;
> +};
> +
> +#define LINUX_EFI_INITRD_MEDIA_GUID \
> +    { 0x5568e427, 0x68fc, 0x4f3d, {0xac, 0x74, 0xca, 0x55, 0x52, 0x31, 0xcc, 0x68} }
>  
>  #endif

While I'm not maintainer of this code anymore, I hope the new maintainers will
still respect the original idea of keeping these headers in sync with their
origin. The way it's arranged, this change doesn't look like it would have been
taken from the gnu-efi package (albeit I will admit I didn't go check).

Jan

