Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C52D97562F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 16:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796733.1206478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soOlc-000240-2s; Wed, 11 Sep 2024 14:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796733.1206478; Wed, 11 Sep 2024 14:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soOlb-000229-V4; Wed, 11 Sep 2024 14:56:23 +0000
Received: by outflank-mailman (input) for mailman id 796733;
 Wed, 11 Sep 2024 14:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soOlZ-00021i-Me
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 14:56:21 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01041213-704e-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 16:56:19 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5356bb5522bso8879969e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 07:56:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ce86e0sm627289666b.143.2024.09.11.07.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 07:56:18 -0700 (PDT)
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
X-Inumbo-ID: 01041213-704e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726066579; x=1726671379; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c0wDc1nP+wvWl2UV7nyYoijCf6Bh1fZ5JSamiEZjtBo=;
        b=eLqpqHqpUs8CUgIc8MttR8JuKiaMG7bhDS1bR9g4sEQ7WabcpfotD0768G74tXqHux
         tKYyP/ybE+elZdMcJnby02LGh1ItnTxOgvRprv50H1UKM/RgVauI2OBUV9IJXBXoJIOe
         e2M9HaYZr+525KIeDDJKd9FWHPAehCMaf0vZONr7ikkbGyXrvhvVrtxr9Dh4i63KgfzP
         DdInxrgs+KsUB8oDHuZzoU/FhGFfKlq0RYGRtnIddaiSEw8++xfiNA1SeU71Lt5Na5OW
         FWG2yW3Vn1Z8VpfR9k/ymvo6MERaRfwuTiXvnDIdsB/AC0NuS0jENjNzMPzp+mg0+1YN
         fu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726066579; x=1726671379;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0wDc1nP+wvWl2UV7nyYoijCf6Bh1fZ5JSamiEZjtBo=;
        b=JOA3JXgkQReJKStFPlhj6k9GyP67XLiBrMlVWnQUOn5wOWVvljciUbBZYFvkCx17+9
         oV4VxOA6GvjydhrMieNq0rUikgdyfMapZlDYK3RB1Vwho4c742jzV4JCsGgGTASgfoWM
         U+g+dDHTSGBq3hSuseXFmDN1pRArbuy5GZmVssf0quLDCVj4npZAGpgZt32emU8itLk+
         nQLNz/qlviYanU5xkpcFt68gw3TPZftDQ+zAj9i2zJ961+gJ8845JeZ40jbED5FGloqI
         5FmuE2iqbRzluenWznXwh2Ohfvs8ThEwgJn9fJ122lSFHUyB9qOBBNfMCR/86i0FN/0O
         3qyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnvuCDOXd/qtjVRrL6Km216Zyebqn3U5metH13WZIEPB63eNnKB7KiXb7tkqZPWWymzr/WYeFTEic=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8j5lDnb7fmqFI56O3nbBIRj0vDbZppQ+U+dTZM7veHJIMap+s
	A7Q5BFqWRFsua+zdhqZ4mso5VYnO34bzg0fyM0YyfRsz+15A1u7uym/e4fq4Rg==
X-Google-Smtp-Source: AGHT+IEpT4bsWnY51EIkKA6S1gSyV56YVayBogcuPFX2efSQjLYWv60ZamNmvsxyuUCIll8NErf+RQ==
X-Received: by 2002:a05:6512:1287:b0:536:5515:e9b5 with SMTP id 2adb3069b0e04-5365880cc78mr13857221e87.52.1726066579055;
        Wed, 11 Sep 2024 07:56:19 -0700 (PDT)
Message-ID: <2b44c966-5aba-4b6f-8e0a-5660f743d1f7@suse.com>
Date: Wed, 11 Sep 2024 16:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] EFI: address violations of MISRA C Rule 13.6
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <cover.1725994633.git.federico.serafini@bugseng.com>
 <2e893e6e83fdfb24c5f9c4d2da59114cba9a1df8.1725994633.git.federico.serafini@bugseng.com>
 <c068874b-a4bd-4ccc-a9bf-08a996797543@suse.com> <ZuGYOldX55_ZfJCv@mail-itl>
 <0a36284e-4b99-413c-bc12-0328b12da0d2@suse.com>
 <68ee6110-af2c-425c-872a-baf84948c051@citrix.com>
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
In-Reply-To: <68ee6110-af2c-425c-872a-baf84948c051@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.09.2024 16:27, Andrew Cooper wrote:
> On 11/09/2024 3:10 pm, Jan Beulich wrote:
>> On 11.09.2024 15:16, Marek Marczykowski-Górecki wrote:
>>> On Wed, Sep 11, 2024 at 02:50:03PM +0200, Jan Beulich wrote:
>>>> On 10.09.2024 21:06, Federico Serafini wrote:
>>>>> Refactor the code to improve readability
>>>> I question this aspect. I'm not the maintainer of this code anymore, so
>>>> my view probably doesn't matter much here.
>>>>
>>>>> and address violations of
>>>>> MISRA C:2012 Rule 13.6 ("The operand of the `sizeof' operator shall
>>>>> not contain any expression which has potential side effect").
>>>> Where's the potential side effect? Since you move ...
>>>>
>>>>> --- a/xen/common/efi/runtime.c
>>>>> +++ b/xen/common/efi/runtime.c
>>>>> @@ -250,14 +250,20 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
>>>>>          info->cfg.addr = __pa(efi_ct);
>>>>>          info->cfg.nent = efi_num_ct;
>>>>>          break;
>>>>> +
>>>>>      case XEN_FW_EFI_VENDOR:
>>>>> +    {
>>>>> +        XEN_GUEST_HANDLE_PARAM(CHAR16) vendor_name =
>>>>> +            guest_handle_cast(info->vendor.name, CHAR16);
>>>> .. this out, it must be the one. I've looked at it, yet I can't spot
>>>> anything:
>>>>
>>>> #define guest_handle_cast(hnd, type) ({         \
>>>>     type *_x = (hnd).p;                         \
>>>>     (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
>>>> })
>>>>
>>>> As a rule of thumb, when things aren't obvious, please call out the
>>>> specific aspect / property in descriptions of such patches.
>>> I guess it's because guest_handle_cast() is a macro, yet it's lowercase
>>> so looks like a function?
>> If Eclair didn't look at the macro-expanded code, it wouldn't even see
>> the sizeof(). Hence I don't expect the thing to be mistaken for a function
>> call.
> 
> The complaint is a sizeof in guest_handle_okay() being given ({ ... })
> to interpret.
> 
> ({}) can have arbitrary side effects in it, hence the violation.

I sincerely hope the tool actually looks inside the ({}).

Jan

