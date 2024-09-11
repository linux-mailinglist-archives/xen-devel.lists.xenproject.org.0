Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C332E975638
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 16:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796740.1206488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soOmp-0002nq-Eg; Wed, 11 Sep 2024 14:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796740.1206488; Wed, 11 Sep 2024 14:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soOmp-0002mA-BG; Wed, 11 Sep 2024 14:57:39 +0000
Received: by outflank-mailman (input) for mailman id 796740;
 Wed, 11 Sep 2024 14:57:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soOmn-0002Va-Uz
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 14:57:37 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f22b685-704e-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 16:57:37 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c0aa376e15so3348566a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 07:57:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd52099sm5446503a12.48.2024.09.11.07.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 07:57:35 -0700 (PDT)
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
X-Inumbo-ID: 2f22b685-704e-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726066657; x=1726671457; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/iwopwPTwjIFL4x1Ik6lrg1TWis82RvmRAyVWiMv5WQ=;
        b=CYry7sxjkqM9HgNn5Wj0D2J34HCxxcm/uFWiH93Wk85711NH4VE/DXtUqh39zwMByJ
         b8sgWKNcsl+MU5wRtnN5oN1mNdBLKTYsEZT94F2MqZQsqH8DxHnWM1K32F/yz/86rWiV
         aZ4zwaSL0JFgn1Dxr+ng3EZm894CUm5s+yKIiE8Qx2V1XWIpKTLq537n7JhlbbwvTij6
         lrnyTxDtLft1HPaRFAkd+edTi5JpUq/AWWvf/YJK4lby0JI5moNXQw4eDsIQ+qy6k5vN
         QZabPlX9OW2rXAhC59pQicAjMDfOtmporGWCJ5Fa63C0Zw+xtoFcW8kUJMU3b+JGpEO+
         jdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726066657; x=1726671457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iwopwPTwjIFL4x1Ik6lrg1TWis82RvmRAyVWiMv5WQ=;
        b=R611jsvM+2TwpEverviNaES+siBWCoktN+FHZU3xCPKoaqaiLM+CobddtONRIx9u93
         0cBlTY7ZQ0gwsyKnOdOw7xmihtN2c/HP51Sff5t4anp+PuX3z8c3C2rPwNQnfPKbUEh0
         txWPgI74xLeyL9ZBftvWxv5aLXMnyRAjQbQpOylfcpW9odG4i9rlushJ1PqOlEuf4SS/
         qxXZGXF20nZ59Kxw43KtzmoNPf1GtUv+Yt6x5/BLcgCRHWoB3jrmaY7/9AxyyzBxf7bw
         KBb1+qZAuGEDgSsFi5khoETS9/lwqwv6UGKoVodHl7y+5uGIgt0kmGB0lvtKNeCI4vUi
         sQrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSc7jFrYg7KaUbW32UjpHf3bSoZB2ZhogNjzDQgA42v8gFqkPjZMN5b8id9RVzHuwqR643r7C4pEw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf5eW1N3S3c8YnoA2PHmnSINtRqwCF8mKNaw9tIk2qRTaZVluj
	W+0/FEABXKIowIavvqCeKUdw3/KQF3rM7+AZY1J/kNX5WaJENaDd1g54TjMkmA==
X-Google-Smtp-Source: AGHT+IGbqaiyQ4xifR4DY7KJ3dcMyymLAWa20bR/UbxDxQ0K9KKU0zWWIcJ4gAkXu1ogdcYmMJ+XjQ==
X-Received: by 2002:a05:6402:3712:b0:5c2:4d90:988 with SMTP id 4fb4d7f45d1cf-5c3dc7c0382mr16225856a12.32.1726066656621;
        Wed, 11 Sep 2024 07:57:36 -0700 (PDT)
Message-ID: <60c4bdb6-ea84-495a-a8a9-9e887181f531@suse.com>
Date: Wed, 11 Sep 2024 16:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] EFI: address violations of MISRA C Rule 13.6
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1725994633.git.federico.serafini@bugseng.com>
 <2e893e6e83fdfb24c5f9c4d2da59114cba9a1df8.1725994633.git.federico.serafini@bugseng.com>
 <c068874b-a4bd-4ccc-a9bf-08a996797543@suse.com> <ZuGYOldX55_ZfJCv@mail-itl>
 <0a36284e-4b99-413c-bc12-0328b12da0d2@suse.com>
 <a679972c919f4cf281f23b63ab98f312@bugseng.com>
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
In-Reply-To: <a679972c919f4cf281f23b63ab98f312@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.09.2024 16:27, Nicola Vetrini wrote:
> On 2024-09-11 16:10, Jan Beulich wrote:
>> On 11.09.2024 15:16, Marek Marczykowski-Górecki wrote:
>>> On Wed, Sep 11, 2024 at 02:50:03PM +0200, Jan Beulich wrote:
>>>> On 10.09.2024 21:06, Federico Serafini wrote:
>>>>> Refactor the code to improve readability
>>>>
>>>> I question this aspect. I'm not the maintainer of this code anymore, 
>>>> so
>>>> my view probably doesn't matter much here.
>>>>
>>>>> and address violations of
>>>>> MISRA C:2012 Rule 13.6 ("The operand of the `sizeof' operator shall
>>>>> not contain any expression which has potential side effect").
>>>>
>>>> Where's the potential side effect? Since you move ...
>>>>
>>>>> --- a/xen/common/efi/runtime.c
>>>>> +++ b/xen/common/efi/runtime.c
>>>>> @@ -250,14 +250,20 @@ int efi_get_info(uint32_t idx, union 
>>>>> xenpf_efi_info *info)
>>>>>          info->cfg.addr = __pa(efi_ct);
>>>>>          info->cfg.nent = efi_num_ct;
>>>>>          break;
>>>>> +
>>>>>      case XEN_FW_EFI_VENDOR:
>>>>> +    {
>>>>> +        XEN_GUEST_HANDLE_PARAM(CHAR16) vendor_name =
>>>>> +            guest_handle_cast(info->vendor.name, CHAR16);
>>>>
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
>>>
>>> I guess it's because guest_handle_cast() is a macro, yet it's 
>>> lowercase
>>> so looks like a function?
>>
>> If Eclair didn't look at the macro-expanded code, it wouldn't even see
>> the sizeof(). Hence I don't expect the thing to be mistaken for a 
>> function
>> call.
>>
> 
> Looking at the fully preprocessed code [1], there is an assignment to 
> CHAR *_x inside a sizeof(), therefore compat_handle_cast is triggering 
> the violation when used in such a way to be inside the sizeof().

I can see a number of initializers, but no assignment.

Jan

> if ( !((!!((((get_cpu_info()->current_vcpu))->domain)->arch.paging.mode 
> & ((1 << 4) << 10))) || (
> __builtin_expect(!!(((n)) < (~0U / (sizeof(**(({ CHAR16 *_x = 
> (__typeof__(**(info->vendor.name)._) *)(full_ptr_t)(info->
> vendor.name).c; (__compat_handle_CHAR16) { (full_ptr_t)_x }; 
> }))._)))),1) && ((unsigned long)((unsigned long)((void *)(
> full_ptr_t)(({ CHAR16 *_x = (__typeof__(**(info->vendor.name)._) 
> *)(full_ptr_t)(info->vendor.name).c; (
> __compat_handle_CHAR16) { (full_ptr_t)_x }; })).c) + ((0 + ((n)) * 
> (sizeof(**(({ CHAR16 *_x = (__typeof__(**(info->
> vendor.name)._) *)(full_ptr_t)(info->vendor.name).c; 
> (__compat_handle_CHAR16) { (full_ptr_t)_x }; }))._))) ? (0 + ((n))
> * (sizeof(**(({ CHAR16 *_x = (__typeof__(**(info->vendor.name)._) 
> *)(full_ptr_t)(info->vendor.name).c; (
> __compat_handle_CHAR16) { (full_ptr_t)_x }; }))._))) - 1 : 0)) < 
> ((void)(((get_cpu_info()->current_vcpu))->domain), 0)))
> ) )


