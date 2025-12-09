Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D99CAF51B
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 09:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181244.1504323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vStMh-0007R9-Bc; Tue, 09 Dec 2025 08:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181244.1504323; Tue, 09 Dec 2025 08:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vStMh-0007Ob-7i; Tue, 09 Dec 2025 08:46:35 +0000
Received: by outflank-mailman (input) for mailman id 1181244;
 Tue, 09 Dec 2025 08:46:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vStMf-0007OV-Ee
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 08:46:33 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dbddb2b-d4db-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 09:46:29 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47a80d4a065so1086455e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 00:46:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353f8bsm30668265f8f.43.2025.12.09.00.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 00:46:28 -0800 (PST)
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
X-Inumbo-ID: 8dbddb2b-d4db-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765269988; x=1765874788; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mFtIhQCGGbUgj0sWRO3ulsjj1uTcjXKRJYwANcq9Kok=;
        b=NDk9zoUBrCeW1RgKwrn4DeF5r/6phVRG/rhIqiLg3eGMfh6Eo/7VQiaihW9UeOvh1u
         ner/ryVsEpooDQQGq+xoACIccn8MKlHOgIBXrlYzLXEv4aKuO/aS1jMUDqPlXCQm2L91
         YDOTKgFiG9kaTsFaIRm1dmwmAh/r2JePjJxVFTPyJH3DXJ/MpAFEG2HEIM2UsMFGteob
         SESDG5D6fwhUHoFnCqUmRLQPHtaxOoYFmW9w9QYSRY2+RqX5VuwGKiKCZmhXD7qu7TOH
         vbsrzSIUbhY3biOQ1NZYFAXlqztvf9wjNsU6FUdPq8mtEbTx1Rf9Et3em0cZmwPtjATZ
         fKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765269988; x=1765874788;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFtIhQCGGbUgj0sWRO3ulsjj1uTcjXKRJYwANcq9Kok=;
        b=vSCQCwQP/aAHO7nFT8T6bMPkNwnRkUTHZIPqAXH40f4tZvPkbA3FwIoV4nPEfjN/LN
         eslU5WWZGStIhZF4N6EpMYUA1Xv22COeBHqiyZE9dy7bpRhOBc+wpIRwHK6JJNPr3Sf4
         YatItSuUsiXZIOUvLZUGzV7400pTpWa4iHNcwZM7JFvCOIvyyRWQSvD4DfbW0fMjqp0Z
         bpAgtfX9two6ze7XrtWmHNKBi7OATn4npNlMz2y5lmr14WAgO/39WoVvV2QamH9KSe4H
         jP/HWN7r60j/vd+lKu9uEe7kk9rQWYTyBamgzw6mmtbE1XIXgIo2QKcNiszK0FUKI8ok
         iZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCVjvU5LUS04jh/EpwR+Ot6cwTJqVMluw4xbkyZndKqnwdiX5wXHTfoqzMp70lIDhWGjCn6jv63sX4g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUIPP7Zwrt3WNlfvZ0qc05gTm+86YsRhg5VXBa8HzlnovfB7BH
	w3RMl083GfLYePbDxLnizMsJbdtNOmdxm6XmJHY38Bn2mx5c1Oi+VPl3cRFt7bBzKQ==
X-Gm-Gg: ASbGnctWjlrT6SH7X6/fyHtX+V1hggtzI+wunDCmALvY40vbUsGgGuWkBh5cSo/0FSe
	qsTDUYCZQ2gfNZNrqwN+AviAjNFLrpHoNu7rF8r9EPxCO2A1pclfmUvHYXZGah5qvyjQvtVTNCw
	c30FguZfm6jv1ebVHzzC+qeKwsQD7gwhfafUFQf6od+/9bOB9A17APoYXcjJd/acPhJVEVZLk4r
	fZnqabBhd4Z5LpRW/4QXD5ovo8/ygCEgzEuKc2PAOh16UFYCC4rvb6+y9NkLmnA6RdlC/gkypbl
	C3/37CReEixIXQbnsaWXmmzmj3MI6uj/bAgNx22augYbcYDyZLHGQGhSm0XLkPUtS4T3MCMaoIz
	zTBhuKcMfYsZyycjukilLH+A5XunN8PDjwCp4v58+ZBzP+MdtAGaS6GhAeqjCW1MXnoOc3ZXhgc
	rOs5Gy4HADWSjTzQrk9ljw0memfRbMkMgQuwkaqp74qwE6Q1vitgHz78Gj/qQOUe7V0z/UTLr9G
	3Q=
X-Google-Smtp-Source: AGHT+IFPOHIXQ2/GH1ywBHZjd4Vmw9dlyu3CeYjus0If5yuHr5iWxtpEZ+n9EXmKTK9K6leJ/I7dqA==
X-Received: by 2002:a05:6000:613:b0:429:dde3:659d with SMTP id ffacd0b85a97d-42f89f563femr10590497f8f.47.1765269988426;
        Tue, 09 Dec 2025 00:46:28 -0800 (PST)
Message-ID: <cf359ffb-02e7-4c7e-bf16-88a21e08722c@suse.com>
Date: Tue, 9 Dec 2025 09:46:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86: move / split usercopy.c to / into
 arch-specific library
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f46f89f6-242b-4433-958e-36088e567ccd@suse.com>
 <12852eae-849b-4576-a8e1-85edf401b455@suse.com>
 <7891d66e-cd51-4694-9926-cf8f62c3053f@epam.com>
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
In-Reply-To: <7891d66e-cd51-4694-9926-cf8f62c3053f@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.12.2025 22:48, Grygorii Strashko wrote:
> 
> 
> On 08.12.25 14:05, Jan Beulich wrote:
>> The file wasn't correctly named for our purposes anyway. Split it into its
>> "guest" and "unsafe" parts, thus allowing the latter to not be linked in
>> at all (for presently having no caller). The building of the "guest" part
>> can then (later) become conditional upon PV=y.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>>   xen/arch/x86/Makefile                         |  4 ----
>>   xen/arch/x86/lib/Makefile                     |  2 ++
>>   xen/arch/x86/{usercopy.c => lib/copy-guest.c} | 12 +---------
>>   xen/arch/x86/lib/copy-unsafe.c                | 22 +++++++++++++++++++
>>   4 files changed, 25 insertions(+), 15 deletions(-)
>>   rename xen/arch/x86/{usercopy.c => lib/copy-guest.c} (94%)
>>   create mode 100644 xen/arch/x86/lib/copy-unsafe.c
>>
>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
>> index 61e2293a467e..dfb258d7ac1c 100644
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -72,7 +72,6 @@ obj-y += time.o
>>   obj-y += traps-setup.o
>>   obj-y += traps.o
>>   obj-$(CONFIG_INTEL) += tsx.o
>> -obj-y += usercopy.o
>>   obj-y += x86_emulate.o
>>   obj-$(CONFIG_TBOOT) += tboot.o
>>   obj-y += hpet.o
>> @@ -93,9 +92,6 @@ hostprogs-y += efi/mkreloc
>>   
>>   $(obj)/efi/mkreloc: HOSTCFLAGS += -I$(srctree)/include
>>   
>> -# Allows usercopy.c to include itself
>> -$(obj)/usercopy.o: CFLAGS-y += -iquote .
>> -
>>   ifneq ($(CONFIG_HVM),y)
>>   $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
>>   endif
>> diff --git a/xen/arch/x86/lib/Makefile b/xen/arch/x86/lib/Makefile
>> index ddf7e19bdc1d..8fe2dfd88553 100644
>> --- a/xen/arch/x86/lib/Makefile
>> +++ b/xen/arch/x86/lib/Makefile
>> @@ -1 +1,3 @@
>> +lib-y += copy-guest.o
>> +lib-y += copy-unsafe.o
>>   lib-y += generic-hweightl.o
>> diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/lib/copy-guest.c
>> similarity index 94%
>> rename from xen/arch/x86/usercopy.c
>> rename to xen/arch/x86/lib/copy-guest.c
>> index a24b52cc66c1..25eeb35427e2 100644
>> --- a/xen/arch/x86/usercopy.c
>> +++ b/xen/arch/x86/lib/copy-guest.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/*
>>    * User address space access functions.
>>    *
>>    * Copyright 1997 Andi Kleen <ak@muc.de>
>> @@ -6,8 +6,6 @@
>>    * Copyright 2002 Andi Kleen <ak@suse.de>
>>    */
>>   
>> -#include <xen/lib.h>
>> -#include <xen/sched.h>
> 
> This will not build :(
> 
>    CC      arch/x86/lib/copy-guest.o
> In file included from ././include/xen/config.h:27,
>                   from <command-line>:
> arch/x86/lib/copy-guest.c: In function ‘copy_to_guest_pv’:
> ./arch/x86/include/asm/config.h:270:32: error: invalid use of undefined type ‘struct vcpu’
>    270 |     (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
> 

Hmm, yes. It does build here, but of course I have many other patches in
place. The issue looks to be that for me access_ok() isn't a macro anymore,
but a function.

Thanks for pointing out,
Jan

