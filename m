Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB27B98489A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 17:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803057.1213461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st7Qz-00028T-W9; Tue, 24 Sep 2024 15:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803057.1213461; Tue, 24 Sep 2024 15:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st7Qz-00026y-TH; Tue, 24 Sep 2024 15:26:37 +0000
Received: by outflank-mailman (input) for mailman id 803057;
 Tue, 24 Sep 2024 15:26:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st7Qy-00026r-6D
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 15:26:36 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61a857ec-7a89-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 17:26:34 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so847339466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 08:26:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930d1126sm94234666b.114.2024.09.24.08.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 08:26:33 -0700 (PDT)
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
X-Inumbo-ID: 61a857ec-7a89-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727191593; x=1727796393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uX1ngt/DxSsOEYCKgxhijjKnVXytTg3E1xX35p21nSs=;
        b=Y/sL0Vb2IJO3Lv/TAS0QLcqg+Ln6TZRmOYdfO1z8V5nl14shFQVPFe0kv7QdOl1466
         Ss4E0UUmcO9rBA+UTemW0cQueFARKzgmzo8+OcIvkJOZtv+V7YNGHUldwJAH7dwmmVCz
         tcPPlaC8kbuYa9nxagHttlXsd5O7MKbNFDs6VEI1ttdbld8bZkCq6MWO6c8kCnZiV5Um
         TyfmHFMRyXKgF2dQLy94DWfWFUbG+bePS2jd0juyd8Ll+5DYbdSyv0k0CxiRg2kqwGVs
         8YZm+LgNMLeMXZXeZ4g4V241gJaTCovafjXPNOvfuMhkXkatc01kSQdCMsoW10x0a8j8
         1gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727191593; x=1727796393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX1ngt/DxSsOEYCKgxhijjKnVXytTg3E1xX35p21nSs=;
        b=s2t45UrHarh7Yr9J4a61c0Xm3baSbD8o9d5ncGpk7ib4yuMkh3Ck7uW+HkqOrsKSxH
         cD7VPeh9pFyq44q/WDL5it301QPTgjwPV0PJJCWXsmq8oYyLbbhoSgE4W69oeIopkPot
         hDyjGcVf0K3vM4Q3peEdp1SqgSnDfsNMXTtsSHJE5fQkJSyNRPvLLEZLbzBxH4rb8YHO
         nRQxbF+oH/dzW4qO+soj6sMJuXcQ2sEV1/Nt6WKOtoOKKEv8AGlCrvIriAWshnmx0bEe
         ctqiFMfcTR5avjGQJ2+GRUaqHz7H6sL7cpYPMqOTm3BaZTS8WHZVbGHsW0D9+9P3qEve
         auZg==
X-Forwarded-Encrypted: i=1; AJvYcCVOgCTfgj/PEQDWiPt2FyBxrKR9d3HKg3a64f6WWP2wVPuje0iL1DBXdkTpk9XVCG1Kzg0Lhs9Jzxk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyr/lph4Wbm1Az+p8yZAWsqgvaD/39NePsf1d3HNhII9vcYNjap
	xu/3ZPxvDoHPOGTbpn0H2f/C83cs7Svr1JP+00u3HRugbjjkH8/VKwui9bNgyg==
X-Google-Smtp-Source: AGHT+IGhmmsIZadbUKWp8y4hq710/K5YjgaK0uFNIBu/FNC5zt3wU/gLqh8/OlmJTxidzGJVDfQTEw==
X-Received: by 2002:a17:907:2d88:b0:a8a:8cdb:83a7 with SMTP id a640c23a62f3a-a90d50fcf8bmr1817544866b.54.1727191593427;
        Tue, 24 Sep 2024 08:26:33 -0700 (PDT)
Message-ID: <d5dd9b06-6729-4c3f-b03d-b3e0255e0128@suse.com>
Date: Tue, 24 Sep 2024 17:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/boot: Rewrite EFI start part in C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
 <20240910161612.242702-4-frediano.ziglio@cloud.com>
 <5cf6fad1-16ce-46b4-9bed-151f936e3772@suse.com>
 <CACHz=Zifc9rKvfxh1EmH5VQQ1YtB7L-GUrBrMP734uc6Uhk_mQ@mail.gmail.com>
 <6133b856-1c02-486c-8932-b213e8b9ce0b@suse.com>
 <CACHz=Zg1UnDD9bXYgm01smay=mzRciNZ20v7ERi4OHsqSYGZFw@mail.gmail.com>
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
In-Reply-To: <CACHz=Zg1UnDD9bXYgm01smay=mzRciNZ20v7ERi4OHsqSYGZFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2024 17:21, Frediano Ziglio wrote:
> On Mon, Sep 23, 2024 at 3:26 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
> 
> ... omissis ...
> 
>>
>>>>> --- a/xen/arch/x86/efi/stub.c
>>>>> +++ b/xen/arch/x86/efi/stub.c
>>>>> @@ -17,7 +17,8 @@
>>>>>   */
>>>>>
>>>>>  void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
>>>>> -                                    EFI_SYSTEM_TABLE *SystemTable)
>>>>> +                                    EFI_SYSTEM_TABLE *SystemTable,
>>>>> +                                    const char *cmdline)
>>>>>  {
>>>>>      static const CHAR16 __initconst err[] =
>>>>>          L"Xen does not have EFI code build in!\r\nSystem halted!\r\n";
>>>>
>>>> This, if not a separate change, wants mentioning in the description.
>>>> It's a related observation that this wasn't properly updated, but
>>>> nothing that necessarily needs doing here. Question is whether the
>>>> declaration of the function wouldn't better go into a header now in
>>>> the first place.
>>>
>>> I had the same though about a header. But currently there's no such
>>> header, I mean it should be able to be included by both stub.c and
>>> efi-boot.h which are both x86 only code so it should go in
>>> xen/arch/x86/ I suppose. Suggestions? Maybe a different solution would
>>> be to have a xen/arch/x86/efi/efi-boot-stub.h instead of
>>> xen/arch/x86/efi/stub.c ?
>>
>> It's not quite the right place, but maybe (ab)using asm/efibind.h would
>> be slightly better than introducing asm/efi.h just for a single decl?
>>
>> Jan
> 
> Okay, I found the comment on the header to place the declaration.
> 
> Kind of works... but the headers are very crazily depending on each
> other, the header change is
> 
> diff --git a/xen/arch/x86/include/asm/efibind.h
> b/xen/arch/x86/include/asm/efibind.h
> index bce02f3707..1fa5522a0d 100644
> --- a/xen/arch/x86/include/asm/efibind.h
> +++ b/xen/arch/x86/include/asm/efibind.h
> @@ -1,2 +1,13 @@
> #include <xen/types.h>
> +#include <xen/init.h>
> #include <asm/x86_64/efibind.h>
> +#include <efi/efidef.h>
> +#include <efi/eficapsule.h>
> +#include <efi/eficon.h>
> +#include <efi/efidevp.h>
> +#include <efi/efiapi.h>
> +
> +void __init efi_multiboot2(EFI_HANDLE ImageHandle,
> +                           EFI_SYSTEM_TABLE *SystemTable,
> +                           const char *cmdline);
> +
> 
> How does it sound ?

Hmm, no, not good at all. All these #include-s are against the purpose
of the header. We'll need asm/efi.h then, I think.

As an aside - you don't need xen/init.h here, as declarations shouldn't
have __init attributes.

Jan

