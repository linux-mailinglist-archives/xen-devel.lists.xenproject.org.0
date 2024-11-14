Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AEC9C8D8C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 16:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836561.1252470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBbOB-0003BZ-Jk; Thu, 14 Nov 2024 15:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836561.1252470; Thu, 14 Nov 2024 15:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBbOB-00039W-GR; Thu, 14 Nov 2024 15:04:07 +0000
Received: by outflank-mailman (input) for mailman id 836561;
 Thu, 14 Nov 2024 15:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBbO9-00038k-H7
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 15:04:05 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae9ed242-a299-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 16:04:01 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53a097aa3daso690387e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 07:04:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dac0aea8sm22860965e9.31.2024.11.14.07.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 07:04:00 -0800 (PST)
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
X-Inumbo-ID: ae9ed242-a299-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzUiLCJoZWxvIjoibWFpbC1sZjEteDEzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFlOWVkMjQyLWEyOTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTk2NjQxLjY1MzM5Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731596641; x=1732201441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v35p9yEv9hOk2K6U2mAHAUIYQZuSvDHdY3VmEkeMV9U=;
        b=XLUOg7hE3Pl3e2z8LnR3cjrXYBC3kiP/JL9axhvhWgbcXFblSQQkw494uicPf70qFB
         bLTze5NQ/O/WPibNmj+KPdQfpnuUYMEVp/SlXj134Xzpzm8HemSnXsVFaPvUyWZbYG4w
         Rs9SgmrX6ODpgJ5GKDS1qk1cqfAgYX97N2HbtBI+4vCQxuWEgG7pOJe75cPXKS3oWPWJ
         sup9YtmTIdXXsS2kb8qwVBgaHifjHpfPzjtmQDsPMpKYr6vfyFKuN2SnVh6HcPqnE5xe
         tzTdWdZ89bsmqVYjDz4k6ulvYOgqis2A9ShuvlOACPpLsDJct4TNlnGa4itCULHNbyoP
         lvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731596641; x=1732201441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v35p9yEv9hOk2K6U2mAHAUIYQZuSvDHdY3VmEkeMV9U=;
        b=GAPIw4SvCyAo+6XV1MzWdUpdSO21Qx+XJHVW6tVKphDypbJuRoXIlIDEMYWonZZfRQ
         9WVWmhzedlXSyLf2NIC+jOu7DXwtmtqBRLD5Grr2HRoH+/5UrdY0Lct9jGUe8HgJD3EQ
         bjdZBXzPWenyGVk32R9JwT3/3iIKneNH0+gEVIxebNvtC0WzG9KtB6dUHgkP7TXWRvmr
         G30+W+I2tn2loJjBs+jNn9gZK1q/StUVZIOxI/cBQwncA6zY3PNOHTFS7rfYQDDnQ6vO
         6/9G7LufyG8BQrUyx8jbHqboInHJkCoxDztixicitGJcH24d5f/yz5ab+Y4shtqxvHyB
         h7vg==
X-Forwarded-Encrypted: i=1; AJvYcCUGxLsXylcd1G7K/cBUn1aTY5vI0I8UJz6P6VDNCwIayNihVs+/oIR4NWa18U4d0OF4hjEyKuBCn44=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXkHLhwCUAGGTbEHl9vcUoUGG+8f/8onhLv2UsJYgCFsqrEfEt
	U9ClX91ZloaRmSJ34ej7bHZNRAHgKJCcsY1X5tM7M49r6JysZPLGBrqktg+alwTRHLTZ6rXpNGs
	=
X-Google-Smtp-Source: AGHT+IFwDFwUN46tgjsK/Trm7u1LBrjyslwSQte6Ybo7GbfH6b4I+MQfwg4DiZzSj4rOPtwjEEbZjQ==
X-Received: by 2002:a05:6512:b0e:b0:53d:a23d:37e6 with SMTP id 2adb3069b0e04-53da5c829e5mr1444778e87.57.1731596640604;
        Thu, 14 Nov 2024 07:04:00 -0800 (PST)
Message-ID: <edc4f604-d8e2-4227-abc9-9c5de5933417@suse.com>
Date: Thu, 14 Nov 2024 16:03:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20240819142953.415817-1-frediano.ziglio@cloud.com>
 <c55fdc20-2a58-4978-bd78-4cba90a7a8e4@suse.com>
 <CACHz=ZhGsE1fvhEi2k2X9ae2rx=ik3ZzZR4RN4Uajt_qvs2J=w@mail.gmail.com>
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
In-Reply-To: <CACHz=ZhGsE1fvhEi2k2X9ae2rx=ik3ZzZR4RN4Uajt_qvs2J=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.11.2024 15:02, Frediano Ziglio wrote:
> On Tue, Nov 5, 2024 at 2:52 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.08.2024 16:29, Frediano Ziglio wrote:
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -287,19 +287,36 @@ static bool __init match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2)
>>>  /* generic routine for printing error messages */
>>>  static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
>>>  {
>>> -    static const CHAR16* const ErrCodeToStr[] __initconstrel = {
>>> -        [~EFI_ERROR_MASK & EFI_NOT_FOUND]           = L"Not found",
>>> -        [~EFI_ERROR_MASK & EFI_NO_MEDIA]            = L"The device has no media",
>>> -        [~EFI_ERROR_MASK & EFI_MEDIA_CHANGED]       = L"Media changed",
>>> -        [~EFI_ERROR_MASK & EFI_DEVICE_ERROR]        = L"Device error",
>>> -        [~EFI_ERROR_MASK & EFI_VOLUME_CORRUPTED]    = L"Volume corrupted",
>>> -        [~EFI_ERROR_MASK & EFI_ACCESS_DENIED]       = L"Access denied",
>>> -        [~EFI_ERROR_MASK & EFI_OUT_OF_RESOURCES]    = L"Out of resources",
>>> -        [~EFI_ERROR_MASK & EFI_VOLUME_FULL]         = L"Volume is full",
>>> -        [~EFI_ERROR_MASK & EFI_SECURITY_VIOLATION]  = L"Security violation",
>>> -        [~EFI_ERROR_MASK & EFI_CRC_ERROR]           = L"CRC error",
>>> -        [~EFI_ERROR_MASK & EFI_COMPROMISED_DATA]    = L"Compromised data",
>>> -        [~EFI_ERROR_MASK & EFI_BUFFER_TOO_SMALL]    = L"Buffer too small",
>>> +#define ERROR_MESSAGE_LIST \
>>> +    ERROR_MESSAGE(EFI_NOT_FOUND, "Not found") \
>>> +    ERROR_MESSAGE(EFI_NO_MEDIA, "The device has no media") \
>>> +    ERROR_MESSAGE(EFI_MEDIA_CHANGED, "Media changed") \
>>> +    ERROR_MESSAGE(EFI_DEVICE_ERROR, "Device error") \
>>> +    ERROR_MESSAGE(EFI_VOLUME_CORRUPTED, "Volume corrupted") \
>>> +    ERROR_MESSAGE(EFI_ACCESS_DENIED, "Access denied") \
>>> +    ERROR_MESSAGE(EFI_OUT_OF_RESOURCES, "Out of resources") \
>>> +    ERROR_MESSAGE(EFI_VOLUME_FULL, "Volume is full") \
>>> +    ERROR_MESSAGE(EFI_SECURITY_VIOLATION, "Security violation") \
>>> +    ERROR_MESSAGE(EFI_CRC_ERROR, "CRC error") \
>>> +    ERROR_MESSAGE(EFI_COMPROMISED_DATA, "Compromised data") \
>>> +    ERROR_MESSAGE(EFI_BUFFER_TOO_SMALL, "Buffer too small")
>>> +
>>> +    static const struct ErrorStrings {
>>> +        CHAR16 start;
>>> +#undef ERROR_MESSAGE
>>> +#define ERROR_MESSAGE(code, str) CHAR16 msg_ ## code[sizeof(str)];
>>> +        ERROR_MESSAGE_LIST
>>> +    } ErrorStrings __initconst = {
>>> +        0
>>> +#undef ERROR_MESSAGE
>>> +#define ERROR_MESSAGE(code, str) , L ## str
>>> +        ERROR_MESSAGE_LIST
>>> +    };
>>> +    static const uint16_t ErrCodeToStr[] __initconst = {
>>> +#undef ERROR_MESSAGE
>>> +#define ERROR_MESSAGE(code, str) \
>>> +        [~EFI_ERROR_MASK & code] = offsetof(struct ErrorStrings, msg_ ## code),
>>> +        ERROR_MESSAGE_LIST
>>>      };
>>>      EFI_STATUS ErrIdx = ErrCode & ~EFI_ERROR_MASK;
>>>
>>
>> A while ago Andrew and I discussed this, and I was apparently wrongly expecting
>> him to come back here, as (iirc; no record of this that I could find in the mail
>> archives, so I'm sorry if my recollection is wrong) he was the one to object. We
>> concluded that it wants at least considering to undo the respective part of
>> 00d5d5ce23e6, finding a different solution to the Clang issue there.
> 
> I thought this patch was already applied.
> I didn't remember any clang issue.
> As far as I know, this was delayed by an issue that turned out to be different.
> So, any reason why not to merge the original patch?

Afaict the alternative would result in tidier code, and hence might indeed be
preferable. But since the reason I didn't long commit the patch is Andrew
wanting it to not be committed, it'll need to be him to chime in here. Even
if only to indicate that I'm misremembering.

Jan

