Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30387AEA12A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 16:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026570.1401735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUntw-0002h5-G3; Thu, 26 Jun 2025 14:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026570.1401735; Thu, 26 Jun 2025 14:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUntw-0002f3-D8; Thu, 26 Jun 2025 14:48:32 +0000
Received: by outflank-mailman (input) for mailman id 1026570;
 Thu, 26 Jun 2025 14:48:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUntu-0002ex-Is
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 14:48:30 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d261cbc-529c-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 16:48:25 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so726999f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 07:48:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5382eecsm4476508a91.6.2025.06.26.07.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 07:48:24 -0700 (PDT)
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
X-Inumbo-ID: 9d261cbc-529c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750949305; x=1751554105; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NC1zhCG4gaYiUufABQmXdid/inR6JqOPVSGdC/cVfiY=;
        b=Y+JOTuhQIVS2sZQFqdRMHIIeyVrZCEOo+e5UbNTm4RShnGBKvAfcTolXb5/Gdx2Lh3
         4UZEJXCUknAx7uO6ii8gvE14Syn6tTTOJfdduja59fCVa7Mw+GQJCGYbk/tlqR01b3cX
         gz67k2W+3r9zo3KaWs8aMYdSkcFfX88fKUGfUVQJT+ru9BrclC/08CVqU57Wun7IzojI
         XSrbLxXu6yuwhpwbUuLsZcAS4uufRfOwvlFUX8ZHgJKYaIMBQnk/0jYKvcLOk4akm6+T
         jq6nkpgSi1F9+/yPtZuMvLzQpNbVdCI7bMHqxhZ3bzW0bZa1oXRz4En3R+UL3+XEbIHA
         ZK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949305; x=1751554105;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NC1zhCG4gaYiUufABQmXdid/inR6JqOPVSGdC/cVfiY=;
        b=JrKvKCKq3jfgBy5+HSsHdATW9Ef0EnQCsZlc1XUZEmFdnvWTBtSr8ERtgAUEj4jk6G
         E/Fdjis0ss8IBJvcE6QiJyZ6yQ/XSdNLAHpll1BUcCPLn3bdPE60tUGQ+zpXs23Qs0PA
         c06r4cGfgu559CTkhxdadjkC2IVgnQxBhvOqMZUM396sK1RSNUe/3tbAfRCC744CARcY
         BHFV6D6MFGMNo51ipVUx3aR0QWSyHxfU/VrA0/J4Id4QirxPJDC3Qe12Ju1biwPcf9F9
         HcqPoKYG7bvsl07Si9F7diFGnpkMxEBpdTC1+oLoL/+eE5i9upr3OdseR36IqBB04WKZ
         NknA==
X-Forwarded-Encrypted: i=1; AJvYcCXiQTDy4rGHcIX7PGXIReTMRCgjKVWYwJMNNEOvWfvM+UMaE06s4n/F+QnDdHjUm/I22d8VLlo4Noc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfGcaLSgxPNrxSF8+qqidMpex/PShWDzBn7/ErawQnQvuIv9U7
	qa32vcnbQRV+Uxxi/7Wsym+6wlGH3mlVjkYIG1E20oSsir0Dw43jws38hmzqpTOwiw==
X-Gm-Gg: ASbGncvWaXo70W1o8VcmQSxZpWpNWdRMsF/UEISMkh4scuvmjf0a9hWzHTxitz8nRgI
	Qxx/L57twNKj/TMuC+F5P1CRTTNLycBIZyTWqXw+/RIuploYshk1GcOPMR9Tfs7cSKsh11Q28Sw
	mvWd49AR/G07eS4TvFHlce0LnnMaR8A8kOpM0UkE9/SleY6vA2cKX6tGDxy5nlT+RjbZKvcgVXu
	4xkITO6UYQw1uYQRALCzL60EbAQElXrqq8AnckOVRa59QcYrYzXVeAqrL09dZnK9i1i9tnxH/dX
	qovRsq1VeCmqsD5iwPdKzSvU/YwPOUedLfHaeIuvYu68sz35br4/8rY9fZbuU7BH6rpxb96Ulsa
	llsByrIFGZ8L0/lGzifYuq7vpKHmRwOXWUoWaXfT67NvXRqs=
X-Google-Smtp-Source: AGHT+IFfbYd6hIl1ed4ToupI5sGQWvVLnf9k6tm6Oq5hWCNiIdOfoGM9qYRePhuepgm2d2OIL/pDhw==
X-Received: by 2002:a05:6000:4008:b0:3a5:8977:e0fd with SMTP id ffacd0b85a97d-3a6f30c897bmr3338263f8f.0.1750949304808;
        Thu, 26 Jun 2025 07:48:24 -0700 (PDT)
Message-ID: <3f250f66-e7fd-4072-8e55-e34eb9a14e58@suse.com>
Date: Thu, 26 Jun 2025 16:48:16 +0200
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
 <df050f76-d82b-479a-8ba2-97eea02b74ee@suse.com>
 <CACHz=ZgoB5vg=nFcr6Q+fy-N7CfAetahhfiZ-8cFM-jgr9YtJA@mail.gmail.com>
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
In-Reply-To: <CACHz=ZgoB5vg=nFcr6Q+fy-N7CfAetahhfiZ-8cFM-jgr9YtJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2025 16:24, Frediano Ziglio wrote:
> On Thu, Jun 26, 2025 at 2:29 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 25.06.2025 09:34, Frediano Ziglio wrote:
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -850,6 +850,74 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>>>      return true;
>>>  }
>>>
>>> +#pragma pack(1)
>>> +typedef struct {
>>> +    VENDOR_DEVICE_PATH              VenMediaNode;
>>> +    EFI_DEVICE_PATH                 EndNode;
>>> +} SINGLE_NODE_VENDOR_MEDIA_DEVPATH;
>>> +#pragma pack()
>>
>> Where is this coming from? And why is this declared locally here, but the ...
> 
> The declaration comes from e2dk code and it's similar to code in Linux.
> It's not a generic declaration so it's not in a header.

Please add some kind of reference to the patch description in such cases.

>>> +static bool __init initrd_load_file2(const CHAR16 *name, struct file *file)
>>> +{
>>> +    static const SINGLE_NODE_VENDOR_MEDIA_DEVPATH __initconst initrd_dev_path = {
>>> +        {
>>> +            {
>>> +                MEDIA_DEVICE_PATH, MEDIA_VENDOR_DP, { sizeof (VENDOR_DEVICE_PATH) }
>>> +            },
>>> +            LINUX_EFI_INITRD_MEDIA_GUID
>>> +        },
>>> +        {
>>> +            END_DEVICE_PATH_TYPE, END_ENTIRE_DEVICE_PATH_SUBTYPE,
>>> +            { sizeof (EFI_DEVICE_PATH) }
>>> +        }
>>> +    };
>>> +    static EFI_GUID __initdata lf2_proto_guid = EFI_LOAD_FILE2_PROTOCOL_GUID;
>>
>> ... corresponding GUID is put in a (random?) header file?
> 
> The GUID is declared in the header for device paths, being a GUID for
> a device path.

Oh, sorry, my comment belonged a few lines up, where the other GUID is
used.

>>> +    EFI_DEVICE_PATH *dp;
>>> +    EFI_LOAD_FILE2_PROTOCOL *lf2;
>>> +    EFI_HANDLE handle;
>>> +    EFI_STATUS ret;
>>> +    UINTN size;
>>> +
>>> +    dp = (EFI_DEVICE_PATH *)&initrd_dev_path;
>>
>> Instead of a (fragile) cast, why not
>>
>>     dp = &initrd_dev_path->VenMediaNode.Header;
> 
> It makes sense, although at the end it's just style. Code came from
> Linux in this case.

Using casts (or not) is "just style", yes, but imo a pretty important part
thereof.

>>> +    file->addr = min(1UL << (32 + PAGE_SHIFT),
>>> +                     HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
>>
>> I understand you took this from read_file(), but the construct looks
>> outdated. For one, it should have been abstracted away when the Arm64
>> work was done (I don't think such a restriction exists there), and
>> then I'm also not sure the restriction would unconditionally apply on
>> x86 anymore.
> 
> Do you have an updated/correct formula?

No, hence why I said "not sure". For Arm at least I would assume no
restriction applies at all.

>>> +    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>>> +                                PFN_UP(size), &file->addr);
>>> +    if ( EFI_ERROR(ret) )
>>> +        PrintErrMesg(L"Allocation failed", ret);
>>> +
>>> +    file->need_to_free = true;
>>> +    file->size = size;
>>> +
>>> +    ret = lf2->LoadFile(lf2, dp, false, &size, file->str);
>>> +    if ( EFI_ERROR(ret) )
>>> +    {
>>> +        efi_bs->FreePages(file->addr, PFN_UP(size));
>>> +        PrintErrMesg(L"Loading failed", ret);
>>> +    }
>>> +
>>> +    efi_arch_handle_module(file, name, NULL);
>>
>> Shouldn't it be handle_file_info() that you call, and a little earlier?
> 
> Already changed in the last series.
> Earlier where? You want it after loading data, right ?

See where read_file() has it.

>>> --- a/xen/include/efi/efidevp.h
>>> +++ b/xen/include/efi/efidevp.h
>>> @@ -398,5 +398,26 @@ typedef union {
>>>
>>>  } EFI_DEV_PATH_PTR;
>>>
>>> +#define EFI_LOAD_FILE2_PROTOCOL_GUID \
>>> +    { 0x4006c0c1, 0xfcb3, 0x403e, {0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0xe0, 0x6d } }
>>> +
>>> +typedef struct EFI_LOAD_FILE2_PROTOCOL EFI_LOAD_FILE2_PROTOCOL;
>>> +
>>> +typedef
>>> +EFI_STATUS
>>> +(EFIAPI *EFI_LOAD_FILE2)(
>>> +    IN EFI_LOAD_FILE2_PROTOCOL      *This,
>>> +    IN EFI_DEVICE_PATH              *FilePath,
>>> +    IN BOOLEAN                      BootPolicy,
>>> +    IN OUT UINTN                    *BufferSize,
>>> +    IN VOID                         *Buffer OPTIONAL
>>> +    );
>>> +
>>> +struct EFI_LOAD_FILE2_PROTOCOL {
>>> +    EFI_LOAD_FILE2                  LoadFile;
>>> +};
>>> +
>>> +#define LINUX_EFI_INITRD_MEDIA_GUID \
>>> +    { 0x5568e427, 0x68fc, 0x4f3d, {0xac, 0x74, 0xca, 0x55, 0x52, 0x31, 0xcc, 0x68} }
>>>
>>>  #endif
>>
>> While I'm not maintainer of this code anymore, I hope the new maintainers will
>> still respect the original idea of keeping these headers in sync with their
>> origin. The way it's arranged, this change doesn't look like it would have been
>> taken from the gnu-efi package (albeit I will admit I didn't go check).
>>
> 
> I'll have a look at gnu-efi headers.
> Note that the media GUID is GRUB/Linux specific so probably won't be in gnu-efi.

Right, in which case it doesn't belong in any of these headers.

Jan

