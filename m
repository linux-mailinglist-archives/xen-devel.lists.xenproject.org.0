Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1052A971B3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963194.1354221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Fw8-0007kx-P5; Tue, 22 Apr 2025 15:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963194.1354221; Tue, 22 Apr 2025 15:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Fw8-0007hN-MF; Tue, 22 Apr 2025 15:53:28 +0000
Received: by outflank-mailman (input) for mailman id 963194;
 Tue, 22 Apr 2025 15:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7Fw7-0007hH-CD
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:53:27 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eceaa9ca-1f91-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:53:25 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso46444675e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:53:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5d69bbsm175768875e9.34.2025.04.22.08.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 08:53:24 -0700 (PDT)
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
X-Inumbo-ID: eceaa9ca-1f91-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745337205; x=1745942005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yE4vTqawGHNjeaoMjayfoIo6/hpXgVKm5lv2CicEbak=;
        b=QcLkppj0ZEr4rd1u0AttWXchEMwRTdIKdelkdltCFRWwSdgUD2ufHcMoZqouiGfvqb
         wAe8ByjfceV/g4biWBPUdGtHzhkulFy5ziEH7I8FNO6r0TK62qtKv/+0i5hJJaHBxWHe
         nLeVBeqIIxhpZ1oGmr2FxeM01gAXXoIhOS7UJTjmakFOcIBnYNHbP7IWO5C+9LL2C1Nh
         ctobIOu6dwLvcaIqP1SEoemtM4mDM6L5AbBP+rmxYibugMaNAQtGmGrl1bGF9uroMtxa
         Q/PFYDiMTKmrK9GiYaRvM1TFkjM7zj5Oprz8GYvy7IJQXOTXsQisEiOZApqCYkTfyvBp
         8eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337205; x=1745942005;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE4vTqawGHNjeaoMjayfoIo6/hpXgVKm5lv2CicEbak=;
        b=JEv1xsviQlCHE8uqh1nl7thqcOJpskPtiLqxbsmISOdl74NV+Modm4Z4xsrdXQhPSQ
         7UuZBPvkxvXAMcwtnztHh2Or6j45iQMSZYFD5N5yySX8Fzj3F0Q2p5TafybT9zP1o4vD
         AJ4T8m+8uBWVFoDaTsjuDr4o82sm3lxH7x5GUXWrlptBbwJLbiE1fpmt2TeoIZrzm3Gu
         IboopiwEIwRbiD942OnHoJKNyq8LXknywNlQDia3Ulosudm0qVWJlKGC8DybwL31FqzJ
         Tgkpt90XDQ+mlTIWD+KvLShK6iJWDykc/JgyhmQAGuuPBn31fuEpQBvKxHp5sITcgfs7
         WDLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLDQCjw7dnL/Lga3GBMj+iPVC8ksL9nJqZc9VlWWmJSoN359l40hPh9bTZcJLPuday2M4nmZt5enQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzX3/8v/1MzG97T7QGObNzBtwI4tiCL8WACt59DhJGTBd294ASk
	d4O7FW2sYVKIBb0BDvD6IbgGI3NRQHfTXjKjLUykTEa6nsEHJkgcOhpXCxisFw==
X-Gm-Gg: ASbGncstnHr/sdCh0OgSkubI4SqHahp+y1mMCSTOqz/xcR5XnSJm6Vw4ok7U+tZ21/j
	aKx/KWUevCjIJtBItoMghoqlacB93odS/ZsQg6HDtiD2WXuKJ0mXgLkw3BznEC8lAIlu0N2IGfP
	3qJhYzNf+PGzcKa/9krYnoYJU6OAWkBteIQgI3/YdFJIjqbYK6JkHKG2HuNpesi9pHWYMmQs/pM
	3mrZVPdWtpySBQej1xiWpXnCAWcUWDV/9Nkv9bpGGz9b3KBoiWSP2iyitfNgc57KWpPnCJRsPkb
	MKlqC0u6tI/1TACvOKR6H2G8Bv2Cst7KmaaeS/r0PnvSs+p7PrMF8+jfH1NuOjSBVmoDqSMGmlP
	IjcXSTzdLX8kZoOheCfxjixn25g==
X-Google-Smtp-Source: AGHT+IGe53vyA5B4792gpagjzkMJt8aZJIq+nefO3Wl7FctEtSy+ugCB92kaN8JfL+pnepocxizXZQ==
X-Received: by 2002:a05:600c:a143:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-44076c9c6fbmr97584575e9.10.1745337204521;
        Tue, 22 Apr 2025 08:53:24 -0700 (PDT)
Message-ID: <cb4451c0-6176-48a4-8bad-b428c3866e46@suse.com>
Date: Tue, 22 Apr 2025 17:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] xen/common: dom0less: introduce common
 domain-build.c
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <9dbf651ce177a7292f80879373e86a51305f216e.1744626032.git.oleksii.kurochko@gmail.com>
 <faa552cb-d933-492b-b3ed-e803856265ab@suse.com>
 <6010658f-9e29-40d9-902c-890cb27a2a4b@gmail.com>
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
In-Reply-To: <6010658f-9e29-40d9-902c-890cb27a2a4b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2025 17:26, Oleksii Kurochko wrote:
> 
> On 4/17/25 4:45 PM, Jan Beulich wrote:
>> On 14.04.2025 17:56, Oleksii Kurochko wrote:
>>> --- a/xen/include/xen/fdt-domain-build.h
>>> +++ b/xen/include/xen/fdt-domain-build.h
>>> @@ -5,6 +5,7 @@
>>>   #include <xen/bootfdt.h>
>>>   #include <xen/device_tree.h>
>>>   #include <xen/fdt-kernel.h>
>>> +#include <xen/mm.h>
>>>   #include <xen/types.h>
>>>   
>>>   #if __has_include(<asm/domain_build.h>)
>>> @@ -32,7 +33,37 @@ int make_memory_node(const struct kernel_info *kinfo, int addrcells,
>>>                        int sizecells, const struct membanks *mem);
>>>   int make_timer_node(const struct kernel_info *kinfo);
>>>   
>>> -unsigned int get_allocation_size(paddr_t size);
>>> +
>>> +static inline int get_allocation_size(paddr_t size)
>>> +{
>>> +    /*
>>> +     * get_order_from_bytes returns the order greater than or equal to
>>> +     * the given size, but we need less than or equal. Adding one to
>>> +     * the size pushes an evenly aligned size into the next order, so
>>> +     * we can then unconditionally subtract 1 from the order which is
>>> +     * returned.
>>> +     */
>>> +    return get_order_from_bytes(size + 1) - 1;
>>> +}
>>> +
>>> +typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
>>> +                                               paddr_t gpa,
>>> +                                               void *buf,
>> This very much looks like the latest now, when the code is made common,
>> it wants to be const void *. Even if this may require another prereq
>> patch.
>>
>> However, instead of using a function pointer, couldn't the now common
>> code call copy_to_guest_phys_flush_dcache() conditionally upon
>> IS_ENABLED(CONFIG_<whatever>)?
> 
> I thought about having IS_ENABLED(CONFIG_ARM) as, at the moment, this is necessary to
> be called only for Arm as guest domain on Arm could be ran with cache disabled so to be sure
> that DTB, kernel and initrd is fully in RAM this function should be called.
> 
> For RISC-V, it isn't possible case as guest domain won't run with cache disabled.
> 
>> Or provide a weak
>> copy_to_guest_phys_flush_dcache() which would simply call
>> copy_to_guest_phys()?
> 
> Could it be a weak function with empty implementation?

Not really, no, as the fallback has to work for the case where cache
management isn't explicitly necessary.

> Is copy_to_guest_phys() implemented for other archs?

What "other" are you thinking about here? An arch wanting to use this
code would need to provide one. But x86, for example, isn't going to
build this code aiui, and hence has no need for such a function. We
have hvm_copy_to_guest_phys() there.

Hmm, but I notice only now that Arm has no plain copy_to_guest_phys().
This certainly breaks the fallback idea I had outlined. So perhaps I
should recommend that you stick to the function pointer approach for
now, unless Arm folks come up with any good suggestion. (I notice PPC
has a (stub) copy_to_guest_phys_flush_dcache(), too; it's unclear to
me whether that's really needed there, or whether it isn't more like
RISC-V in this regard.)

Jan

