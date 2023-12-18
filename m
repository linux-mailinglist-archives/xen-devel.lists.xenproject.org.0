Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F8481747D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656113.1024097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFF5O-0003Yd-7d; Mon, 18 Dec 2023 14:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656113.1024097; Mon, 18 Dec 2023 14:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFF5O-0003WM-4e; Mon, 18 Dec 2023 14:59:14 +0000
Received: by outflank-mailman (input) for mailman id 656113;
 Mon, 18 Dec 2023 14:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFF5M-0003V8-0J
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:59:12 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff7d9952-9db5-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 15:59:09 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33666946422so924426f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 06:59:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b0033661255299sm5647133wrn.34.2023.12.18.06.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 06:59:08 -0800 (PST)
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
X-Inumbo-ID: ff7d9952-9db5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702911549; x=1703516349; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cxP29n4VWgPdbNOCi1SlYHTP9cf3/4CPHpClqTi9kAg=;
        b=fAF1q2rmDLcaOsHbOtpfDbYfw1vL4yxLSDSsK2vWBtlbb6+bu6ZDWuIKZyDM95dRbY
         dIJQx+1ErsuOld+HmW/O3hb4yx24si3D39ACGYQBy/4r9DGfrZ/wbma8TxV8kSI+17wG
         chVQcKR39OgVTQYRk3wnh7AaChyVf/IHSuLPRw7zVE2V5wvOP5hFwvPW3A9/n4gqpeYr
         ayMQB19KB5yHgqSNWgd9YkvxynV2EJgHppWWiCLADFyB8Jcl9sCRPm57JmUaEyfgP7Rw
         qmd5Zwo+BZVDa1IX/FLma5L10a9l9te9dMiG7pCyT2MLiaNPQDbYKSJAb3GFLaLn0yil
         kScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702911549; x=1703516349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxP29n4VWgPdbNOCi1SlYHTP9cf3/4CPHpClqTi9kAg=;
        b=esDCX2u6oCceXCyiyg60AKkji4G78bK9xEQ+K2K4xwVIcveljvsJbGWX6y+/DcDePh
         qqPqoifF2Ikipzyg9eku8lorSzxitEfyFuZmc3WT/RQ7Z12XrhJ1kXXUgOdaunkdOyFB
         WQ89wPqVnO0Z/xUWt8tM8xVtHItJGEuy5+7Cxl65S18ipz+vd4PYIXglD27gRqbLHXzL
         hoX6oyL0f2kgkxzKWHfwdewVbe7JObBu41jFvG4uKEm0Jv9soBFHhLgh5SyKWidDkMsq
         p40+AqChf99V5VM7KQiZpVSw2B/LZTk5yjghP/RB10fFimP8fVssDt+gpOz0Zyvud+S4
         vokg==
X-Gm-Message-State: AOJu0Yx2tPm1HeBQe11erOu58Lx3gXLvvMbneiiR8PIRV/gr/2HVZ26d
	KUH0D1hyemRvcfmIBkhtEQ+s
X-Google-Smtp-Source: AGHT+IGhDOv82I4kXat8MLnocczdOTQWF2fMhWWRpM8tZovtLHu+LvYc2bPkkEUfxPo9sTaiv639ag==
X-Received: by 2002:a5d:5f49:0:b0:336:6d62:763e with SMTP id cm9-20020a5d5f49000000b003366d62763emr604511wrb.7.1702911549174;
        Mon, 18 Dec 2023 06:59:09 -0800 (PST)
Message-ID: <c9542ac3-9d41-4efd-a466-0f4d78da70b8@suse.com>
Date: Mon, 18 Dec 2023 15:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: allow non-BIGMEM configs to boot on >= 16Tb systems
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <4b282f2f-bce8-4c98-897c-2866ec1b6dd0@suse.com>
 <ZXxovHNdNK_OfHUs@macbook> <3a41ab3a-c1e6-4371-bd71-26cd97baffd6@suse.com>
 <ZYApZTMGKOKlUdiA@macbook>
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
In-Reply-To: <ZYApZTMGKOKlUdiA@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 12:13, Roger Pau Monné wrote:
> On Mon, Dec 18, 2023 at 09:26:24AM +0100, Jan Beulich wrote:
>> On 15.12.2023 15:54, Roger Pau Monné wrote:
>>> On Wed, Jun 07, 2023 at 08:17:30AM +0200, Jan Beulich wrote:
>>>> While frame table setup, directmap init, and boot allocator population
>>>> respect all intended bounds, the logic passing memory to the heap
>>>> allocator which wasn't passed to the boot allocator fails to respect
>>>> max_{pdx,pfn}. This then typically triggers the BUG() in
>>>> free_heap_pages() after checking page state, because of hitting a struct
>>>> page_info instance which was set to all ~0.
>>>>
>>>> Of course all the memory above the 16Tb boundary is still going to
>>>> remain unused; using it requires BIGMEM=y. And of course this fix
>>>> similarly ought to help BIGMEM=y configurations on >= 123Tb systems
>>>> (where all the memory beyond that boundary continues to be unused).
>>>>
>>>> Fixes: bac2000063ba ("x86-64: reduce range spanned by 1:1 mapping and frame table indexes")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Thanks.
>>
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -1722,15 +1722,16 @@ void __init noreturn __start_xen(unsigne
>>>>  
>>>>      if ( max_page - 1 > virt_to_mfn(HYPERVISOR_VIRT_END - 1) )
>>>>      {
>>>> -        unsigned long limit = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
>>>> +        unsigned long lo = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
>>>> +        unsigned long hi = pdx_to_pfn(max_pdx - 1) + 1;
>>>
>>> Maybe use max_page to avoid the pdx_to_pfn() call?  (And is also more
>>> in context with the condition on the outside if).
>>
>> You mean
>>
>>         unsigned long hi = min(pdx_to_pfn(max_pdx - 1) + 1, max_page);
>>
>> ? I could switch to that, yes. I wouldn't feel well switching to using
>> just max_page, especially with me having nowhere to (reasonably) test.
> 
> Isn't max_page derived from max_pdx (see setup_max_pdx()), and
> hence we could avoid the pdx_to_pfn() conversion by just using it?
> 
> max_page = pdx_to_pfn(max_pdx - 1) + 1;
> 
> So hi == max_page in your proposed code.
> 
> Maybe there are further restrictions applied to max_pdx that are not
> propagated into max_page, the meaning of all those variables is very
> opaque, and hard to follow in the source code.

Looking more closely, the two appear to be properly in sync once
setup_max_pdx() was called the first time. I guess I was in part
mislead by

            e = (pdx_to_pfn(max_pdx - 1) + 1ULL) << PAGE_SHIFT;

just a few lines past an update to both variables. I'll switch to
max_page here, and I may also make a patch to tidy the line quoted
above.

Jan

