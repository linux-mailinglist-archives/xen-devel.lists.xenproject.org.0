Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B5CAEA1B9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026616.1401805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo6L-00006Z-W1; Thu, 26 Jun 2025 15:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026616.1401805; Thu, 26 Jun 2025 15:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo6L-0008VR-Sr; Thu, 26 Jun 2025 15:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1026616;
 Thu, 26 Jun 2025 15:01:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUo6K-0008Tc-Vi
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:01:20 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a3a5e8c-529e-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 17:01:19 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso608139f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 08:01:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c887130fsm7279456b3a.145.2025.06.26.08.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 08:01:17 -0700 (PDT)
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
X-Inumbo-ID: 6a3a5e8c-529e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750950078; x=1751554878; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/XDDULvEyGusIDzXVz0upl5NaEZ+iog+pE4K6CNqNTY=;
        b=NWjz50ps2xvVwQOrXie0ephK6aEHnen/1IR2GPrT8XGpVlfOlujdDyxMMJyYVNFq8S
         wFGTN+q9otI3014K4ALXVVDpqPkbNYTl33Ilfd/wETTz1XKRIBctY+DuaKORrmuFfzUx
         fQvicNcWl48z5OMJuoPTG4jvfudPCNlf4ud2pgKFpHycE0cODceIl0gavu8ZH4Jqm8fu
         492YAJh5nb5ToHZ9aA1xEGNmdqpL/6ZSEd+377qeC77u/mHxQku4p1ONlIyEUMoA1OU/
         5YCHheIB2vbUGM22VhxjLEj0Rt1eEK2F9RFCdXyFm7Hz7JTXOoDyi3okcaJmLTP0tf8M
         /lEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750950078; x=1751554878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XDDULvEyGusIDzXVz0upl5NaEZ+iog+pE4K6CNqNTY=;
        b=puX4rP/afRDM8OtXeiNTlJHK/+0R7iLj7M80jiyIaTvqwXWCoNgEoA4YYwaHoY850i
         Q8UjJNh2kePri1jti3RpaZOeVZtCMKcieT7uS18sA5bWpGIxLBMoqL7r7KD5WawUVGlz
         UOhz1IpksWclXdmYQlu/24maEbLtFCsFRuWy6hTf1dj8AL24nkS6ZPaWdtGB9gki7PRC
         OiCXRG6/8eT3TQ6G3i1sofKpbFWd4C4rJx42b7EKff4i/jLcMlOg196sqsoHR4sZFQSU
         hjyScVek/IU47VuBrJMQrl+zmck3aD+G9nkqZUXWvW80sE+umex0DZC4UKWGO8lsOEdj
         gOfg==
X-Forwarded-Encrypted: i=1; AJvYcCUsOWqkCxRli9WArf1F6x7+u/SGQg9FyiBaDOWy+TTICk9RZpkix1r1Ub3OnQ5Nc7gJLp2kMXL4H18=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOaVLiyOnurslQK6Jy7+5SQubAN57ofbQVYEMp6XqWuUViH378
	mJkWeCVYGaUFyN1FL7LTleTAVuMs3tcOpix4UkqW8mOjpEnDNNjeO74lxjandmW2dw==
X-Gm-Gg: ASbGncvR52zxTak75XkzLOvVrlERekEHltIYgtAl1pqJ4VPwcO48CZe9AzSAgizrtjY
	PjCn82QuBfxi2Xgr72Hc1waYTshEz9X0TLJU30/XHL4TVrF8EAw1MSgSI7emnIy/Z1EwEG8ZHUL
	57jWfI6i/VxidEZ44XwaO5livgw94n/5wlIS3iGyvf87dMOTu+Se0M+fF/F38VY5EYS+W4bIn9A
	ZOh2evPZftXeqjdHVpvy367izZOZqW3+mfzP+bzmI8owspYC1/LCGDnoiNOlCj7lrgEQFTeQexG
	oSk3k6rfhp1AeSxcJ9rHeVgRQrRFjm5heg0HLX9zNIRkRzlwTSh0mNPGWZjqCSEz/isdY7FTuma
	LZ4l+AeO+XJszM2hU1dpuToA8atqZhyiQMv3UdMxW4b9ktFI=
X-Google-Smtp-Source: AGHT+IGPN95JPwhg9eSyVZ+BszLTzRuZYUSCyj+KA4MRUXCR0Hx0CzvIizvpS+boLm24X3O6twjBAQ==
X-Received: by 2002:adf:b647:0:b0:3a5:2d42:aa25 with SMTP id ffacd0b85a97d-3a6f30a9d15mr2751253f8f.50.1750950077933;
        Thu, 26 Jun 2025 08:01:17 -0700 (PDT)
Message-ID: <f5d19510-bb74-413a-931b-66ac8c44973f@suse.com>
Date: Thu, 26 Jun 2025 17:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] xen/efi: Update error flow for read_file function
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250626131059.61894-1-frediano.ziglio@cloud.com>
 <20250626131059.61894-4-frediano.ziglio@cloud.com>
 <9d64c239-d6cc-4eb5-b180-a5034bedcfdb@suse.com>
 <CACHz=ZjUHVGo+qQvwb5cz=q=QE8r=-WAjPYZ2vWGbfZCMsOatA@mail.gmail.com>
 <d0508105-c2e0-4f98-bc60-20be2336b044@suse.com>
 <CACHz=ZjVqZU_A0YYJ42StqM=PxF2T_CrfxWUXJgxm6WuQA5x-w@mail.gmail.com>
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
In-Reply-To: <CACHz=ZjVqZU_A0YYJ42StqM=PxF2T_CrfxWUXJgxm6WuQA5x-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2025 16:57, Frediano Ziglio wrote:
> On Thu, Jun 26, 2025 at 3:50 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 26.06.2025 15:41, Frediano Ziglio wrote:
>>> On Thu, Jun 26, 2025 at 2:31 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 26.06.2025 15:10, Frediano Ziglio wrote:
>>>>> --- a/xen/common/efi/boot.c
>>>>> +++ b/xen/common/efi/boot.c
>>>>> @@ -792,6 +792,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>>>>>
>>>>>      if ( !name )
>>>>>          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
>>>>> +
>>>>> +    what = L"Open";
>>>>>      if ( dir_handle )
>>>>>          ret = dir_handle->Open(dir_handle, &FileHandle, name,
>>>>>                                 EFI_FILE_MODE_READ, 0);
>>>>> @@ -800,54 +802,58 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>>>>>      if ( file == &cfg && ret == EFI_NOT_FOUND )
>>>>>          return false;
>>>>>      if ( EFI_ERROR(ret) )
>>>>> -        what = L"Open";
>>>>> -    else
>>>>> -        ret = FileHandle->SetPosition(FileHandle, -1);
>>>>> +        goto fail;
>>>>> +
>>>>> +    what = L"Seek";
>>>>> +    ret = FileHandle->SetPosition(FileHandle, -1);
>>>>>      if ( EFI_ERROR(ret) )
>>>>> -        what = what ?: L"Seek";
>>>>> -    else
>>>>> -        ret = FileHandle->GetPosition(FileHandle, &size);
>>>>> +        goto fail;
>>>>> +
>>>>> +    what = L"Get size";
>>>>> +    ret = FileHandle->GetPosition(FileHandle, &size);
>>>>>      if ( EFI_ERROR(ret) )
>>>>> -        what = what ?: L"Get size";
>>>>> -    else
>>>>> -        ret = FileHandle->SetPosition(FileHandle, 0);
>>>>> +        goto fail;
>>>>> +
>>>>> +    what = L"Seek";
>>>>> +    ret = FileHandle->SetPosition(FileHandle, 0);
>>>>>      if ( EFI_ERROR(ret) )
>>>>> -        what = what ?: L"Seek";
>>>>> -    else
>>>>> -    {
>>>>> -        file->addr = min(1UL << (32 + PAGE_SHIFT),
>>>>> -                         HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
>>>>> -        ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>>>>> -                                    PFN_UP(size), &file->addr);
>>>>> -    }
>>>>> +        goto fail;
>>>>> +
>>>>> +    what = L"Allocation";
>>>>> +    file->addr = min(1UL << (32 + PAGE_SHIFT),
>>>>> +                     HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
>>>>> +    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>>>>> +                                PFN_UP(size), &file->addr);
>>>>>      if ( EFI_ERROR(ret) )
>>>>> -        what = what ?: L"Allocation";
>>>>> -    else
>>>>> -    {
>>>>> -        file->need_to_free = true;
>>>>> -        file->size = size;
>>>>> -        handle_file_info(name, file, options);
>>>>> +        goto fail;
>>>>>
>>>>> -        ret = FileHandle->Read(FileHandle, &file->size, file->str);
>>>>> -        if ( !EFI_ERROR(ret) && file->size != size )
>>>>> -            ret = EFI_ABORTED;
>>>>> -        if ( EFI_ERROR(ret) )
>>>>> -            what = L"Read";
>>>>> -    }
>>>>> +    file->need_to_free = true;
>>>>> +    file->size = size;
>>>>> +    handle_file_info(name, file, options);
>>>>>
>>>>> -    if ( FileHandle )
>>>>> -        FileHandle->Close(FileHandle);
>>>>> +    what = L"Read";
>>>>> +    ret = FileHandle->Read(FileHandle, &file->size, file->str);
>>>>> +    if ( !EFI_ERROR(ret) && file->size != size )
>>>>> +        ret = EFI_ABORTED;
>>>>> +    if ( EFI_ERROR(ret) )
>>>>> +        goto fail;
>>>>>
>>>>> -    if ( what )
>>>>> -    {
>>>>> -        PrintErr(what);
>>>>> -        PrintErr(L" failed for ");
>>>>> -        PrintErrMesg(name, ret);
>>>>> -    }
>>>>> +    FileHandle->Close(FileHandle);
>>>>>
>>>>>      efi_arch_flush_dcache_area(file->ptr, file->size);
>>>>>
>>>>>      return true;
>>>>> +
>>>>> +fail:
>>>>
>>>> Nit: Style (see ./CODING_STYLE).
>>>>
>>>
>>> What specifically? I checked the indentation and it's 4 spaces. if-s
>>> are spaced correctly. About labels I didn't find much on CODING_STYLE
>>> so I opened 3/4 files and most of them are indented with no spaces
>>> (they start at column 1).
>>
>> You didn't search for the word "label" then, did you? Quote:
>>
> 
> I did, I probably mis-typed it.
> 
>> 'Due to the behavior of GNU diffutils "diff -p", labels should be
>>  indented by at least one blank.  Non-case labels inside switch() bodies
>>  are preferred to be indented the same as the block's case labels.'
> 
> I suppose labels should be indented less than the code they refer to,
> so in this case from 1 to 3 spaces. I supposed 2 would be the best
> option.

Except that I think 1 is what we commonly use (levaing aside the many bad
examples that we still have).

Jan

