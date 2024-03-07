Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679EE874E6E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 12:59:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689812.1075146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCOs-0003vu-UP; Thu, 07 Mar 2024 11:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689812.1075146; Thu, 07 Mar 2024 11:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCOs-0003tU-RK; Thu, 07 Mar 2024 11:59:02 +0000
Received: by outflank-mailman (input) for mailman id 689812;
 Thu, 07 Mar 2024 11:59:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riCOq-0003tK-Lg
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 11:59:00 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 152fe795-dc7a-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 12:58:59 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-512ed314881so777460e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 03:58:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ij26-20020a056402159a00b00562d908daf4sm7917540edb.84.2024.03.07.03.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 03:58:58 -0800 (PST)
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
X-Inumbo-ID: 152fe795-dc7a-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709812739; x=1710417539; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NkWgtVrgHNXYdr5zpOWR3hO6nJsL4QKcOzXrz3opT4s=;
        b=S0ActWMyVWscpOXDYLKZsP8m/NqAbjukSi+L771wiyAJ4qWBgJhw/fBq5GOwWrsjmo
         iZhkEZPCaOyIHUCCrQJc+KHd6moYIvRKZNzMd5cC1q3+18xDP2mbwTCHs3GGwp1qwZ07
         eyUrn6+XYECLfKMDmIddcutL0e89qQTGVi0M/Pwg+KCMDW4IA8uviGFDIwWWhpHquhFY
         JTHObddQlbG8TzX/2SvNZN5D4gPfKM0EQGzG/x4eH8zjuZM90crP8ejLB13YBIWmGsLh
         X//9AhRz8PVwAqxn9ClAeTe8X0So+t9dcburg1nnkgwF8bSNI0xtYJVf0kvMpNyrsYT5
         vUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812739; x=1710417539;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NkWgtVrgHNXYdr5zpOWR3hO6nJsL4QKcOzXrz3opT4s=;
        b=IOfDit8yEfexAF689rDIRh9OrRZoEhbiL07hsMCWb//rJJP3lt4PUUvUDjOVqH17M5
         pqWsA9MDXg7WaXFpFo2qfPx2EihkJ5Jy+QbMcWJZlulMOw76huEOVo7NmpXCCqhAq5qb
         jEo3rvrO1CZkxudNO7amihCaZ4MWs/sdBJxEncGoB7KFBsFcVIKYBznGO/IYo+FpN8kj
         YE41VHFjyh5pBBtiG+N5yk6XR7VwLcdPnL3vC6ur/F5jTri33dDVq/SRPKj8fpEM0fkO
         dTSGSYTQXLUSBCXZnjYR4DDalHdCVK5EfO62lMJyMocJG06rKZ3bZOh+jA4vVTS87O4t
         gB2A==
X-Forwarded-Encrypted: i=1; AJvYcCWE8zOiUwVbghI3k+DBNU2cmnGN1JLMWpPgefIkVJG+QrEw/RR8FlUfPeRTGLSvldZvxAvXwI5PUf0B3jnYDRSUYx5AWRbKoQGiQkYm1sY=
X-Gm-Message-State: AOJu0YzX5OVPUv/D8vBM1vQBuXiVFD0BwttBebgmrzkCbiuBwiVRGWVM
	IoA5GpUsB7EEKUgMBRIE0HAuHWWX/jyWyN7eVg5gE5ItQAUDYHJ4Ji2Lb3K1YQ==
X-Google-Smtp-Source: AGHT+IGQpnrdn98AeRdJWp4PM5NewRjaKr5623O/73AB2yb4toaBuVxTfTmjzg8C29o4pfcbtjU+8w==
X-Received: by 2002:a05:6512:118e:b0:513:25dc:25f8 with SMTP id g14-20020a056512118e00b0051325dc25f8mr1491189lfr.32.1709812739038;
        Thu, 07 Mar 2024 03:58:59 -0800 (PST)
Message-ID: <818ac202-5473-4638-b140-45272b1041ed@suse.com>
Date: Thu, 7 Mar 2024 12:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/virtual-region: Include rodata pointers
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@cloud.com>
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
 <20240305121121.3527944-3-andrew.cooper3@citrix.com>
 <87b82706-f538-4807-abaf-1e59cebd286b@suse.com>
 <CAG7k0EqWrPU0qocSJHyJAQca44LakQwZwAbiv5GRk-sQeaAYAg@mail.gmail.com>
 <82126c3a-0cde-452f-86aa-2571482f42aa@citrix.com>
 <76ce9dcf-8cac-44b3-9550-f516024bad6e@suse.com>
 <9e827057-9306-4a2a-8816-410661bf8892@citrix.com>
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
In-Reply-To: <9e827057-9306-4a2a-8816-410661bf8892@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2024 12:31, Andrew Cooper wrote:
> On 07/03/2024 7:39 am, Jan Beulich wrote:
>> On 06.03.2024 18:21, Andrew Cooper wrote:
>>> On 06/03/2024 5:09 pm, Ross Lagerwall wrote:
>>>> On Tue, Mar 5, 2024 at 2:17 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 05.03.2024 13:11, Andrew Cooper wrote:
>>>>>> --- a/xen/include/xen/virtual_region.h
>>>>>> +++ b/xen/include/xen/virtual_region.h
>>>>>> @@ -16,6 +16,9 @@ struct virtual_region
>>>>>>      const void *text_start;                /* .text virtual address start. */
>>>>>>      const void *text_end;                  /* .text virtual address end. */
>>>>>>
>>>>>> +    const void *rodata_start;              /* .rodata virtual address start (optional). */
>>>>>> +    const void *rodata_end;                /* .rodata virtual address end. */
>>>>>> +
>>>>>>      /* If this is NULL the default lookup mechanism is used. */
>>>>>>      symbols_lookup_t *symbols_lookup;
>>>>> While perhaps the least bad one can do without quite a bit more churn,
>>>>> I'm still irritated by a virtual region (singular) suddenly covering
>>>>> two ranges of VA space. At the very least I think the description should
>>>>> say a word of justification in this regard. An alternative, after all,
>>>>> could have been for livepatch code to register separate regions for
>>>>> rodata (if present in a patch).
>>>>>
>>>>> A follow-on question then would be why ordinary data isn't reflected in
>>>>> a virtual region. Aiui that's just because livepatch presently has no
>>>>> need for it.
>>>>>
>>>>> Underlying question to both: Is the virtual region concept indeed meant
>>>>> to be fully tied to livepatch and its needs?
>>>>>
>>>> Virtual regions were introduced for live patching but I don't think it
>>>> is completely tied to live patching. It was introduced so that any code
>>>> can participate in symbol lookup, bug frame and exception table entry
>>>> search, rather than special casing "if livepatch" in many places.
>>>>
>>>> I agree that the virtual region concept is being abused here - it's just
>>>> being used as a convenient place to store rodata start/end and doesn't
>>>> really have much to do with the text start & end / bug frame / exception
>>>> table entry search that the virtual region is intended for.
>>>>
>>>> Maybe Andrew can explain why he used this approach?
>>> I feel the simplicity and obviousness of patch 3 speaks for itself.
>>>
>>> How do you propose fixing it differently.
>> I'm not opposed to doing it the way you do, but I think it then needs
>> clarifying (up front) what a virtual region really is. It looks to be
>> morphing into a module description instead ... One easy option might
>> be to have a comment next to the struct additions here making clear
>> that this is rather an abuse, but chosen to be this way to keep things
>> simple elsewhere.
> 
> The thing called virtual_region already describes 6 ranges, and I'm
> adding a 7th.

Hmm, yes, in a way you're right.

> It has been a module-ish description right from the very outset.  I
> don't think it is fair to describe this as an abuse at all.
> 
> Is this going to satisfy the outstanding concerns?

Yes. And thank you for bearing with me.

Jan

> diff --git a/xen/include/xen/virtual_region.h
> b/xen/include/xen/virtual_region.h
> index d05362071135..9d150beb8a87 100644
> --- a/xen/include/xen/virtual_region.h
> +++ b/xen/include/xen/virtual_region.h
> @@ -9,6 +9,12 @@
>  #include <xen/list.h>
>  #include <xen/symbols.h>
>  
> +/*
> + * Despite it's name, this is module(ish) description.
> + *
> + * There's one region for .text/etc, one region for .init during boot only,
> + * and one region per livepatch.
> + */
>  struct virtual_region
>  {
>      struct list_head list;
> 
> ~Andrew


