Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC93D1A4BD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 17:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202151.1517791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhL0-0008Q3-Te; Tue, 13 Jan 2026 16:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202151.1517791; Tue, 13 Jan 2026 16:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhL0-0008Nd-Qx; Tue, 13 Jan 2026 16:33:46 +0000
Received: by outflank-mailman (input) for mailman id 1202151;
 Tue, 13 Jan 2026 16:33:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8AK=7S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfhKz-0008NX-IL
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 16:33:45 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0aa63d9-f09d-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 17:33:44 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b874c00a39fso96876066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 08:33:44 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b871b5e60dasm630149866b.63.2026.01.13.08.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 08:33:43 -0800 (PST)
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
X-Inumbo-ID: a0aa63d9-f09d-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768322024; x=1768926824; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUlhDfD+5kJ3y3bTAFKu0Qryexyh4VkeiASI0Y9BHnc=;
        b=kPGESVAcApXehNze1qV6AsXHGrZq6BlSjJ6fzSx3UEJYiFGIrCVRmBs768tdHvIYp0
         Mf3ToDWKkkY/wo7munPSPma1/TV5YEq4g+wUSp4Ui9RAiLpxLG9VMGR+Kl+4qA/YCszZ
         ksSvk0W7WwE092/H4QrRawua4qkp8Rche48/oT6mL7IVjlKSUe0/T4Gl7BSg044cGmdK
         V8eAIawl+dT+DLtaFwrrOcAGDreGo2jqujnCdOdHdyFUziP1AbMYb5Lmowcu1iEI8S7c
         9T8HEopdnvFBOCVO2InvExU+67VKE/fJ4QJV/AxaxprbC3NrOVbLB4pmBDmiLBTez2Ql
         2NPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768322024; x=1768926824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUlhDfD+5kJ3y3bTAFKu0Qryexyh4VkeiASI0Y9BHnc=;
        b=D22ATOUSjpPPdZtM6PV/WMJqkSRwmzU1MOOWj7EQYBp4f8OfXnUeZOajRtjgRw97r7
         MCtj+LpJ/pU6MgSofb6K2O2fzshjfgeFphhFnzaMkFhk/A3BCY3m3MeJMOxMXDFEPCw4
         9MDV4Env+EZORS1QdJVPFG8pNrsb3L2Fjo9sTN88fiISlZeYCSeksUPyiPYIwEnc7sFt
         mDrbnQvkMP88f0xHz89vzeKlO2srL7jyPh0gBjmGs7MPQRF4tJ5Lo6TOmk9AZK5OciTM
         XYBPVcJGVu83ZB0VyTJU/w7ie2A4gbL+m7/Tzj29pX6W3wB4uXIFfXyKDPe0ji2z17pk
         PiRg==
X-Forwarded-Encrypted: i=1; AJvYcCVbQogxYWujj5iocr40J0bdkWPYiwOQM/oeySGwh9eB8D0SHBfu40HT5rh2uVQd8QwSEKJdCKWFKks=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzK+5UHioIlfmY9o1rKytDhDjDE/qtqP/qPQao4UCU6eP5dQREn
	o8Td2grUm/eggWEjpx8PYL5H0qHosW4BqSoUWoSM7eq/sUFJK2XMvZZx
X-Gm-Gg: AY/fxX4EqcB2u49Qi1fvg8mxLNPorJHxVJZeWRy27jGHBcnpS0gVL12ff2bXofUgWog
	1ig1MXJiLBq8WAnCKcR7eoplXZMMdIPBW1ddfJPBS98Y6cb0akbnhad3jZULabFc9iDg2Mj1FMw
	2OQFvmxUy1KqB3hSFNmGji0RiIve5PLFr2uoV8BzPzutc8x8r0xIy8tJENgQ1fpdvHY4kv04I5s
	Jo2nnhyxxbNDk1OxJk59kbSXWK0yKup3dWqPt/LkdaYaLv1lNdLe8iTwQdFB/i+g/UJBVyXsxwG
	P3OzTFS2q5osqeB//BDZ+kqsnUr56csNiaosbjpneF3HhnfMd4rOyA2gor8m8z2abEVu0GojwHJ
	Kt9ueVumu4LQzvsz7G4Nc9KWjRvsob1Q8gZt3ZFkTBrcqKTmfDhJ2DbHcifdanFYd94MlBRgxZ9
	RAJBXx8KY3LD7Q5DR1MpvVTtZ6QdanJtna6B6ksM/nWo0e6dm5rMfGPrRivJZcGtc=
X-Google-Smtp-Source: AGHT+IH/G0244y9OuKNun+CMAHAvQ1guMab8G9IMZZ5hsqp4Fvwl3y/XTCXI4nXTJwKMa5VRO86Szw==
X-Received: by 2002:a17:907:2887:b0:b87:59a8:4c8 with SMTP id a640c23a62f3a-b8759a805b3mr41562966b.5.1768322023537;
        Tue, 13 Jan 2026 08:33:43 -0800 (PST)
Message-ID: <5f658f5b-1c22-4bd7-9f25-f89576d5003e@gmail.com>
Date: Tue, 13 Jan 2026 17:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/15] xen/riscv: introduce sbi_set_timer()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <84cf8fb2331614c6d0cc6e9030571f42bfc6d928.1766595589.git.oleksii.kurochko@gmail.com>
 <de975e5d-4df7-4dee-9edf-400e5287cc82@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <de975e5d-4df7-4dee-9edf-400e5287cc82@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/12/26 4:12 PM, Jan Beulich wrote:
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> Introduce pointer to function which points to a specific sbi_set_timer()
>> implementation. It is done in this way as different OpenSBI version can
>> have different Extenion ID and/or funcion ID for TIME extension.
>>
>> sbi_set_time() programs the clock for next event after stime_value
>> time. This function also clears the pending timer interrupt bit.
>>
>> Introduce extension ID and SBI function ID for TIME extension.
>>
>> Implement only sbi_set_timer_v02() as there is not to much sense
>> to support earlier version and, at the moment, Xen supports only v02.
> Besides this somewhat contradicting the use of a function pointer: What
> about the legacy extension's equivalent?

I think this is not really needed, and the same implementation can be used for
both the Legacy and TIME extensions, since the API is identical and the only
difference is that|sbi_set_timer()| was moved into a separate extension.

Since Xen reports to the guest that it supports SBI v0.2, it is up to the guest
implementation to decide why it is still using|sbi_set_timer()| from the
Legacy extension instead of the TIME extension.

I think that I can add Legacy extension equivalent but considering that we are
using OpenSBI v0.2 for which Time extension is available it seems for me it is
enough to define sbi_set_timer to sbi_set_timer_v02() for now.

>
>> --- a/xen/arch/riscv/include/asm/sbi.h
>> +++ b/xen/arch/riscv/include/asm/sbi.h
>> @@ -33,6 +33,7 @@
>>   
>>   #define SBI_EXT_BASE                    0x10
>>   #define SBI_EXT_RFENCE                  0x52464E43
>> +#define SBI_EXT_TIME                    0x54494D45
>>   
>>   /* SBI function IDs for BASE extension */
>>   #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
>> @@ -65,6 +66,9 @@
>>   
>>   #define SBI_SPEC_VERSION_DEFAULT 0x1
>>   
>> +/* SBI function IDs for TIME extension */
>> +#define SBI_EXT_TIME_SET_TIMER  0x0
> Move up besides the other SBI_EXT_* and use the same amount of padding?

Sure, I will do that.

>
>> @@ -138,6 +142,19 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>>   int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
>>                                   size_t size, unsigned long vmid);
>>   
>> +/*
>> + * Programs the clock for next event after stime_value time. This function also
>> + * clears the pending timer interrupt bit.
>> + * If the supervisor wishes to clear the timer interrupt without scheduling the
>> + * next timer event, it can either request a timer interrupt infinitely far
>> + * into the future (i.e., (uint64_t)-1), or it can instead mask the timer
>> + * interrupt by clearing sie.STIE CSR bit.
>> + *
>> + * This SBI call returns 0 upon success or an implementation specific negative
>> + * error code.
>> + */
>> +extern int (*sbi_set_timer)(uint64_t stime_value);
> Despite the pretty extensive comment, the granularity of the value to be passed
> isn't mentioned.

I update the comment with the following then:
   The stime_value parameter represents absolute time measured in ticks.


>
>> --- a/xen/arch/riscv/sbi.c
>> +++ b/xen/arch/riscv/sbi.c
>> @@ -249,6 +249,26 @@ static int (* __ro_after_init sbi_rfence)(unsigned long fid,
>>                                             unsigned long arg4,
>>                                             unsigned long arg5);
>>   
>> +static int cf_check sbi_set_timer_v02(uint64_t stime_value)
>> +{
>> +    struct sbiret ret;
>> +
>> +#ifdef CONFIG_RISCV_64
>> +    ret = sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0,
>> +                    0, 0, 0, 0);
>> +#else
>> +    ret = sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
>> +                    stime_value >> 32, 0, 0, 0, 0);
>> +#endif
> How about
>
>      ret = sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
> #ifdef CONFIG_RISCV_64
>                      0,
> #else
>                      stime_value >> 32,
> #endif
>                      0, 0, 0, 0);
>
> ? Granted some may say this looks a little m ore clumsy, but it's surely
> less redundancy.
>
> Also I'd suggest to use CONFIG_RISCV_32 with the #ifdef, as then the "else"
> covers both RV64 and RV128.

Makes sense, I will update the function in mentioned way.

>
>> +    if ( ret.error )
>> +        return sbi_err_map_xen_errno(ret.error);
>> +    else
>> +        return 0;
>> +}
> While I understand this is being debated, I continue to think that this
> kind of use of if/else isn't very helpful. Function's main return
> statements imo benefit from being unconditional.

Considering what returns sbi_err_map_xen_errno() we can just drop if/else
and have only:
   return sbi_err_map_xen_errno(ret.error);
as if ret.error == SBI_SUCCESS(0) then sbi_err_map_xen_errno() will
return 0.

Thanks.

~ Oleksii


