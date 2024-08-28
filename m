Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D52496266F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 13:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784768.1194160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjHGp-0003eZ-39; Wed, 28 Aug 2024 11:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784768.1194160; Wed, 28 Aug 2024 11:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjHGp-0003c6-0X; Wed, 28 Aug 2024 11:55:27 +0000
Received: by outflank-mailman (input) for mailman id 784768;
 Wed, 28 Aug 2024 11:55:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjHGn-0003c0-Dm
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 11:55:25 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68d4724b-6534-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 13:55:24 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a86e5e9ff05so238689666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 04:55:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e5878f79sm238983066b.179.2024.08.28.04.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 04:55:23 -0700 (PDT)
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
X-Inumbo-ID: 68d4724b-6534-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724846124; x=1725450924; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r6OLnEM0rsfbWkV6p9DNaXY2VSEmm6g3roxaIJuas68=;
        b=EnKLjTnKLwZDddi3OY9sYYY9lmnwwFXCL6fLOKeM61sb4rpTzMJc4F+YgZUHPzODbV
         iJRipicfsOphX+j6AxApsp8YedRFzbFoem3l4PzUZq7OABvlyW/jxUq13OVezlq8uXqz
         OEWEer+hdTJKPU65KQr+OCIV1+tyl3yqRw+YbpYwbtzD/zPq+rpET1uf3CqJkY96yemo
         GnRXAUyipEI9I91hslHd6l0ahEERlQwC6jYHdVRIvDfXwgWtsj1sqN/wl04MF2W347Sy
         yZL17bubXPEMDZmCZTcvU4qu1TTm1V/JKCgh1ry5KMFlWIDCZ39hOPt6cnu4NPQL8uC3
         TAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724846124; x=1725450924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6OLnEM0rsfbWkV6p9DNaXY2VSEmm6g3roxaIJuas68=;
        b=YPeqN3D17oOMBso6oDHEv7Xbkxi1uBvNXMvfjNiGgwQlFRrIZAKNZPaeogJd+u8NWZ
         ZQ+7ms2Sw3qrA85MNx9qMXUrpLSpTTcUZPElO/ccxoVUlRwvdyFXnQ0q2lviGS75Ii/a
         zTBug1Ev6TBF2PbFl15blT5nvrOUIuUrWU9FW6X00oHBy9rtwC2cdgm5RfvBhP58cYMk
         nV8Jzq2vy7RINofcp5SXnLt/qqLcAFIM3RSAm/9hLPRLP75nsvj1MajuAvy94eyJApsz
         wbQjp13BVUhGloFn+wlfuvyMnbdcvDWEUlChevz6VejKH6SMT5k+jQ01yFVVeFv77mKP
         fPkw==
X-Forwarded-Encrypted: i=1; AJvYcCUQaYWP0bRUajjCCyOKKKLK7qHW14Igsv9CXxNO8j0PTl9QCiHrstaQApiIEwMme8RKSL17rBeh9yc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxDuQx8oxb8MKriHPvWBL10n2yMkemYiK0Fc3sp+utizlQXgun
	pYfFyGQxxCScxJnGcSdv3PYViZ6cP7Ka0UbR1EYIRKYJYR+Kz09hj9oawEcdlw==
X-Google-Smtp-Source: AGHT+IGPYAVosAPed4eYLuKng5Tdy0tlpWaOpRwJIKgb2CxSjBhy9X2rfy5pfl2hK3Ryf4Qb8F5kCw==
X-Received: by 2002:a17:907:7d9e:b0:a86:8d9d:898a with SMTP id a640c23a62f3a-a870ab15453mr139295966b.58.1724846123645;
        Wed, 28 Aug 2024 04:55:23 -0700 (PDT)
Message-ID: <711d89a3-b1df-49d3-bd05-ebb0f4824f49@suse.com>
Date: Wed, 28 Aug 2024 13:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] xen/riscv: introduce functionality to work with
 CPU info
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <03a703996ae7300a9eda54283711b19c42a7d116.1724256027.git.oleksii.kurochko@gmail.com>
 <8f01fffa-ff7e-4a08-b707-7bf5175b461e@suse.com>
 <d5c6b74609d18a18ef789e795d6ce72469bff277.camel@gmail.com>
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
In-Reply-To: <d5c6b74609d18a18ef789e795d6ce72469bff277.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2024 12:56, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-27 at 15:44 +0200, Jan Beulich wrote:
>> On 21.08.2024 18:06, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/smp.h
>>> +++ b/xen/arch/riscv/include/asm/smp.h
>>> @@ -5,6 +5,10 @@
>>>  #include <xen/cpumask.h>
>>>  #include <xen/percpu.h>
>>>  
>>> +#include <asm/processor.h>
>>> +
>>> +#define INVALID_HARTID ULONG_MAX
>>
>> So what if the firmware report this value for one of the harts?
> It could be an issue, but in my opinion, there is a small chance that
> the firmware will use such a high number. I can add a BUG_ON() in
> start_xen() to check that bootcpu_id is not equal to INVALID_HARTID to
> ensure that the firmware does not report this value. Otherwise, we
> would need to add a 'bool valid;' to struct pcpu_info and use it
> instead of INVALID_HARTID.

Which route to go largely depends on expectations to actual hardware
we're intending Xen to be usable on.

>>> --- a/xen/arch/riscv/setup.c
>>> +++ b/xen/arch/riscv/setup.c
>>> @@ -8,6 +8,7 @@
>>>  #include <public/version.h>
>>>  
>>>  #include <asm/early_printk.h>
>>> +#include <asm/smp.h>
>>>  #include <asm/traps.h>
>>>  
>>>  void arch_get_xen_caps(xen_capabilities_info_t *info)
>>> @@ -40,6 +41,10 @@ void __init noreturn start_xen(unsigned long
>>> bootcpu_id,
>>>  {
>>>      remove_identity_mapping();
>>>  
>>> +    set_processor_id(0);
>>
>> This isn't really needed, is it? The pcpu_info[] initializer already
>> installs the necessary 0. Another thing would be if the initializer
>> set the field to, say, NR_CPUS.

As suggested here, ...

>>> --- /dev/null
>>> +++ b/xen/arch/riscv/smp.c
>>> @@ -0,0 +1,21 @@
>>> +#include <xen/smp.h>
>>> +
>>> +/*
>>> + * FIXME: make pcpu_info[] dynamically allocated when necessary
>>> + *        functionality will be ready
>>> + */
>>> +/* tp points to one of these per cpu */
>>> +struct pcpu_info pcpu_info[NR_CPUS] = { { 0, INVALID_HARTID } };
>>
>> As to the initializer - what about CPUs other than CPU0? Would they
>> better all have hart_id set to invalid?
> I thought about that, but I decided that if we have INVALID_HARTID as
> hart_id and the hart_id is checked in the appropriate places, then it
> doesn't really matter what the processor_id member of struct pcpu_info
> is. For clarity, it might be better to set it to an invalid value, but
> it doesn't clear which value we should choose as invalid. I assume that
> NR_CPUS is a good candidate for that?

... yes. With that you'd also avoid the need for a "valid" flag: An
entry's hart ID would be valid (no matter which value) if its
processor_id field is valid (less than NR_CPUS).

>> Also, as a pretty strong suggestion to avoid excessive churn going
>> forward: Please consider using dedicated initializers here. IOW
>> perhaps
>>
>> struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
>>     .hart_id = INVALID_HARTID,
>> }};
>>
>> Yet as said earlier - in addition you likely want to make sure no
>> two CPUs have (part of) their struct instance in the same cache line.
>> That won't matter right now, as you have no fields you alter at
>> runtime, but I expect such fields will appear.
> Is my understanding correct that adding __cacheline_aligned will be
> sufficient:
>    struct pcpu_info {
>    ...
>    } __cacheline_aligned;

Yes, that's what we do elsewhere.

Jan

