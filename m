Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4468C4ECF
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 12:19:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721367.1124754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6pFI-0005f9-O2; Tue, 14 May 2024 10:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721367.1124754; Tue, 14 May 2024 10:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6pFI-0005cb-LS; Tue, 14 May 2024 10:18:56 +0000
Received: by outflank-mailman (input) for mailman id 721367;
 Tue, 14 May 2024 10:18:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6pFH-0005cV-Ni
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 10:18:55 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5de6c6b2-11db-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 12:18:54 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a5a5c930cf6so538896666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 03:18:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea65aasm7315199a12.5.2024.05.14.03.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 03:18:53 -0700 (PDT)
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
X-Inumbo-ID: 5de6c6b2-11db-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715681934; x=1716286734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pt8j63seJHbsi0uIXJsUqTLZo+0aMi4S6sWK+XPqS28=;
        b=NQQhQ5LDEMLpMu9Xcq0qDOL6QEwxR3yhfJKCL9qgIl5RS2diBUQexMRE1UDhv848/8
         ZJOcurm3fQlZ3Cvnt+8qvg5S5Ni1lm5WmdTGiNt+2veR7hU79TCwvJjO7Q/gVQeTGBq6
         SY+5M26zexawBfRmztQoumVx0//qAUf+MmYKVvls74ZINvYEG14qCu1Z/+w3oGnN06RJ
         UzGyiY/afp5vMi8aUMTVcAihvZUfShpv6Ag0rFxAzO83+xge+pCnSGF7dHS9Ttij5kzE
         y7nm/G56eOCztJV7OGlIheP3NVkipQWdvIQEOw1wCDJrU+eRkSUUH25TczQ9/1L+yLnj
         VHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715681934; x=1716286734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pt8j63seJHbsi0uIXJsUqTLZo+0aMi4S6sWK+XPqS28=;
        b=dyPK+wDFXmR7Q5YvOBZCuxpBoxRMS5/qAXhmaH8uq0h7Ab9ghCu6NycymzM5VJVQIn
         +CVi6IGERcwfqmPoelFVP8gcir9YPd6B25j7IIugvOYTtAHD0+xZ6vxIRIeS2SoQnBRC
         V6NZcRT4Rx3nFo2pmAw7DGMoBwv9BE8CIxRpjmg+1YuLdkgspoX/UIQJMBo/fcOx/RLd
         Lro1Ao9IaQ+987CZRHvMNtvoq4GDOQx9XPGhCKovpTS1vTIhY9vm5KhnX+HFhCj2U9I6
         FuIyxCIV3cSm6IviFxL0iGm4FVSJZZe7eg54rTE8Vo3Ab1aIdKHcaErgjOB3FcmyyDWi
         dicw==
X-Forwarded-Encrypted: i=1; AJvYcCWCkSmN3L2eQArY7vflu4caqIU5edheUMObR9dT64cc4Hl4rVLLIb2bGjHOisch5QxBKF0IpzfIrDlRogFh5rzcrgD2LKv22wTQ2/0jgGs=
X-Gm-Message-State: AOJu0Yyn0YMF7IVAQmNLSgDaBm7Aty9ib89zsq1SpbI95cZhXN4eHtU8
	Q67B6linIlgfVYGpRqGUSeOMRWJI9b54cJo24IZzIHK3fkkQCVt4m1KvUOaSkw==
X-Google-Smtp-Source: AGHT+IF44GkgoviWpQzA6w6+/Hf9pOtNXwBcFiyDX/h45zG3J6RjYjz4Y5nKaOe7vH2toMN5bBPBBQ==
X-Received: by 2002:a50:8e5d:0:b0:572:6ab0:6afc with SMTP id 4fb4d7f45d1cf-5734d6b1c30mr8276372a12.33.1715681933797;
        Tue, 14 May 2024 03:18:53 -0700 (PDT)
Message-ID: <71c96690-cd9a-4e1e-b2a0-7783dc13c35e@suse.com>
Date: Tue, 14 May 2024 12:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 13/27] x86: Add a boot option to enable and
 disable the direct map
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-14-eliasely@amazon.com>
 <18795bde-bfd5-41ab-bef5-f74819bae956@suse.com>
 <20fb9bf9-b24a-4119-807b-c0a4fd6b7439@amazon.com>
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
In-Reply-To: <20fb9bf9-b24a-4119-807b-c0a4fd6b7439@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 12:50, Elias El Yandouzi wrote:
> On 20/02/2024 11:14, Jan Beulich wrote:
>> On 16.01.2024 20:25, Elias El Yandouzi wrote:
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -29,6 +29,7 @@ config X86
>>>   	select HAS_UBSAN
>>>   	select HAS_VPCI if HVM
>>>   	select NEEDS_LIBELF
>>> +	select HAS_SECRET_HIDING
>>
>> Please respect alphabetic sorting. As to "secret hiding" - personally I
>> consider this too generic a term. This is about limiting the direct map. Why
>> not name the option then accordingly?
> 
> I think it is a fairly decent name, would you have any suggestion? 
> Otherwise I will just stick to it.

See how Roger, on v3, has now responded along the same lines? His naming
suggestion (with spelling adjusted) would be fine with me.

>>> +    eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
>>
>> Irrespective I don't see a need to replace the initializer by an assignment.
> 
> I guess it was to avoid the useless min() computation in case directmap 
> is disabled. I can put it back to what it was.

The compiler ought to be able to re-arrange code accordingly, if it thinks
the overall result will then be better.

>>> +config SECRET_HIDING
>>> +    bool "Secret hiding"
>>> +    depends on HAS_SECRET_HIDING
>>> +    ---help---
>>> +    The directmap contains mapping for most of the RAM which makes domain
>>> +    memory easily accessible. While making the performance better, it also makes
>>> +    the hypervisor more vulnerable to speculation attacks.
>>> +
>>> +    Enabling this feature will allow the user to decide whether the memory
>>> +    is always mapped at boot or mapped only on demand (see the command line
>>> +    option "directmap").
>>> +
>>> +    If unsure, say N.
>>
>> Also as an alternative did you consider making this new setting merely
>> control the default of opt_directmap? Otherwise the variable shouldn't exist
>> at all when the Kconfig option is off, but rather be #define-d to "true" in
>> that case.
> 
> I am not sure to understand why the option shouldn't exist at all when 
> Kconfig option is off.

I didn't say "option", but "variable", and ...

> If SECRET_HIDING option is off, then opt_directmap must be 
> unconditionally set to true. If SECRET_HIDING option is on, then 
> opt_directmap value depends on the commandline option.

... I did clearly say what I think you want to do, bringing things in line
with other opt_* that reduce to a constant when a certain CONFIG_* is not
defined.

> The corresponding wrapper, has_directmap(), will be used in multiple 
> location in follow-up patch. I don't really see how you want to do.

The wrapper is fine to have if, as per the earlier reply still visible in
context below, the variable itself can then be suitably static (and the
fallback #define local to that same C file). Otherwise I simply don't see
the value of the wrapper function.

>>> --- a/xen/include/xen/mm.h
>>> +++ b/xen/include/xen/mm.h
>>> @@ -165,6 +165,13 @@ extern unsigned long max_page;
>>>   extern unsigned long total_pages;
>>>   extern paddr_t mem_hotplug;
>>>   
>>> +extern bool opt_directmap;
>>> +
>>> +static inline bool has_directmap(void)
>>> +{
>>> +    return opt_directmap;
>>> +}
>>
>> If opt_directmap isn't static, I see little point in having such a wrapper.
>> If there are reasons, I think they want stating in the description.
> 
> I don't think there is a specific reason to be mentioned, if you really 
> wish to, I can remove it.
> 
>> On the whole: Is the placement of this patch in the series an indication
>> that as of here all directmap uses have gone away? If so, what's the rest of
>> the series about? Alternatively isn't use of this option still problematic
>> at this point of the series? Whichever way it is - this wants clarifying in
>> the description.
> 
> This patch is not an indication that all directmap uses have been 
> removed. We need to know in follow-up patch whether or not the option is 
> enabled and so we have to introduce this patch here.

There's a pretty clear indication: "directmap=off" means "no directmap".
It does not mean "a little less of direct mapping". Aiui that won't even
change by the end of the series. It's only the ratio which is going to
change.

> At this point in the series, the feature is not yet complete.

Right, and again - see how Roger, on v3, has now replied along the same
line.

Jan

