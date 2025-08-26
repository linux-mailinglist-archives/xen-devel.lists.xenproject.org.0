Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A226B36CDB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 17:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094759.1450008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqvBP-0000W9-S1; Tue, 26 Aug 2025 15:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094759.1450008; Tue, 26 Aug 2025 15:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqvBP-0000T2-P0; Tue, 26 Aug 2025 15:01:59 +0000
Received: by outflank-mailman (input) for mailman id 1094759;
 Tue, 26 Aug 2025 15:01:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33Xc=3G=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1uqvBO-0000Sw-Rh
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 15:01:58 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ca3c12a-828d-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 17:01:57 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55f3e4dfc5eso2136895e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 08:01:57 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8bce3sm2354226e87.95.2025.08.26.08.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 08:01:56 -0700 (PDT)
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
X-Inumbo-ID: 9ca3c12a-828d-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756220517; x=1756825317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x895p8T7d2BpjkE5US0OHJJS39eghSQ3fdIMQApqjs8=;
        b=MUuBp6NtM1dyQ702HJEgqGYNgY+Gvx449582LpioiZwXxyWhFXYqiiaVWGpqd5rhMe
         Qa1PBZ63N/gblI5O4bsoM5iUk7uDxV1E+uWgU7gge0zZgSq86xNlUM85wztG2um6KZnm
         AD0+oxXoPCKEtKDyRN5+j9zWwjkSXcRueklfRqm1Di4MGDdXRyqjjtLZ6IE4zwYAULF+
         3v3sFCACrO7IHf1ta7eR2RoQmlNTYDQxpritHo5R4J0TOaZy9/Y9QiMJwLwef3DqkmgL
         w82kdWn2GMemN2pinSVphh4CYqq7Tv/UzLRWuI1l9LoN2dIVkAyMOPPEMaK1GeHJTM35
         pAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756220517; x=1756825317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x895p8T7d2BpjkE5US0OHJJS39eghSQ3fdIMQApqjs8=;
        b=K2rtLI4I5hBHevuOLw4DKQwAYYme/7MJk40YrgShyxRzXdkowf3P4OWDlCBduqrF8w
         vckqyFjiAwFmoaR+WA6bZbBfEds6aTqSJk9O5pA7G3xXB1VZXyNkizr2PHcMYoTWBmnw
         zKSLY3nv6bsGo36ARxO5hTT2tUKorXDR1Jpz6YKgchE5KqG8xymqMBUEByj0OjJvAOnJ
         SKhnUneh+9NB6VoznN8GScJfbqWtwH9fJPGFHMwEPCmlOkw1wtY13GrqCwJb/0Lc1P3S
         Sd4o0olzd+GS0AzSZoLHHL/Aihf4Bjm3NerVXEOhsp1l4eCxIrzST+pwDU42Egcj2CBy
         YsEQ==
X-Gm-Message-State: AOJu0YyF4RNRDWDhVbomqiqLRWcjPFcAh/6p+134373ofyVi/hvx484P
	TQDJjkvG1a0nIrZn8kvh9Q5KGOiG9sk4y9ERkjuhdqIylTLbu+BaeQng
X-Gm-Gg: ASbGncsOU50N68MSnj34sPmqw+/QmOVx7ouLqOYkyY1LsGBcc/eAm2fvZhZJZwjvcfZ
	K8OKbkzpsdP28H8gCFCvDiZYJLtBRcwDrSoWOF+GchdWlMQ+GX/QH0smnLEFUmw5vRnqXdGJGGu
	JKJkA6qQPl9vfa48mzlrgvk4cGTQzfA66FC8cbdPwJXMxZbfg1IDPN8dPrMSboL/8Yw4ZFSprSo
	j2TMg6FeO4OPQfDW/vuRLsJnY8i6nt3tjmkQeoana02KasMdg4frZoW8ZwMHUgwRmG58HZr7aEM
	59Q0GwEl6cuUCEsxMsS0ByQ07Suerq8RL9b3wIL7TbOFt/duKhiC+C9ajDH5ynLIsT7ndRHt9D8
	wVW+Np/43PEV2/uYvbpa3vdy0pg==
X-Google-Smtp-Source: AGHT+IFEvpZhTrkf2aUfygOviZf/gU62uJ4OCuFedRjoWmCFye7q4qSRZ07WGj5knQ2kpUqt4EOlgA==
X-Received: by 2002:a05:6512:33d1:b0:55f:4b12:755b with SMTP id 2adb3069b0e04-55f4b127754mr1483577e87.20.1756220516744;
        Tue, 26 Aug 2025 08:01:56 -0700 (PDT)
Message-ID: <f42d9f13-3817-4922-b112-3cc807c0e4d7@gmail.com>
Date: Tue, 26 Aug 2025 18:01:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] xen/arm: Suspend/resume IOMMU on Xen
 suspend/resume
To: Mykola Kvach <xakep.amatop@gmail.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Mykola Kvach <Mykola_Kvach@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
 <821e0762f64c8b33260a59c672eabf1da5fb4dd4.1754943875.git.mykola_kvach@epam.com>
 <87frdh7wk0.fsf@epam.com>
 <CAGeoDV9ftF_hihWJHqEV8R8X6ddbbZ_GCe7pgftD+S1u+FCr8g@mail.gmail.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <CAGeoDV9ftF_hihWJHqEV8R8X6ddbbZ_GCe7pgftD+S1u+FCr8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26.08.25 16:42, Mykola Kvach wrote:

Hello Mykola, Volodymyr


> Hi Volodymyr,
> 
> On Sat, Aug 23, 2025 at 8:55 PM Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com> wrote:
>>
>> Hi,
>>
>> Mykola Kvach <xakep.amatop@gmail.com> writes:
>>
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> This is done using generic iommu_suspend/resume functions that cause
>>> IOMMU driver specific suspend/resume handlers to be called for enabled
>>> IOMMU (if one has suspend/resume driver handlers implemented).
>>>
>>> These handlers work only when IPMMU-VMSA is used; otherwise,
>>> we return an error during system suspend requests.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> Tested-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

I think, the Tested-by here should be dropped. A lot of time has passed 
since Oleksandr provided the tag, and the code has changed a bit (I am 
afraid, the tag is now stale).


>>> ---
>>>   xen/arch/arm/suspend.c | 21 +++++++++++++++++++++
>>>   1 file changed, 21 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
>>> index b5398e5ca6..cb86426ebd 100644
>>> --- a/xen/arch/arm/suspend.c
>>> +++ b/xen/arch/arm/suspend.c
>>> @@ -4,6 +4,7 @@
>>>   #include <asm/suspend.h>
>>>   #include <xen/console.h>
>>>   #include <xen/cpu.h>
>>> +#include <xen/iommu.h>
>>>   #include <xen/llc-coloring.h>
>>>   #include <xen/sched.h>
>>>
>>> @@ -49,6 +50,13 @@ static long system_suspend(void *data)
>>>
>>>       time_suspend();
>>>
>>> +    status = iommu_suspend();
>>> +    if ( status )
>>> +    {
>>> +        system_state = SYS_STATE_resume;
>>> +        goto resume_time;
>>> +    }
>>> +
>>>       local_irq_save(flags);
>>>       status = gic_suspend();
>>>       if ( status )
>>> @@ -105,6 +113,10 @@ static long system_suspend(void *data)
>>>
>>>    resume_irqs:
>>>       local_irq_restore(flags);
>>> +
>>> +    iommu_resume();
>>> +
>>> + resume_time:
>>>       time_resume();
>>>
>>>    resume_nonboot_cpus:
>>> @@ -140,6 +152,15 @@ int host_system_suspend(void)
>>>           return -ENOSYS;
>>>       }
>>>
>>> +    /* TODO: drop check once suspend/resume support for SMMU is implemented */
>>> +#ifndef CONFIG_IPMMU_VMSA

The original patch did not seem to have this check...

>>
>> This check is meaningless, as you can have CONFIG_IPMMU_VMSA enabled
>> along with CONFIG_ARM_SMMU on a system with SMMU. I think it is enough
>> that iommu_suspend() will fail during system_suspend(), isn't it?
> 
> Not exactly. In the case of SMMU, we don’t have valid iommu_suspend/iommu_resume
> handlers. So it’s possible to have CONFIG_ARM_SMMU enabled and iommu_enabled
> set, but without the appropriate suspend handlers. This could lead to
> a crash during
> system_suspend().

  ... I also have doubts whether this check is needed (at least in its 
current shape). Xen has 2 SMMU drivers at the moment. Lets imagine that 
S2R for SMMUv3 is implemented, so we will need to extend #ifndef above 
to cover CONFIG_ARM_SMMU_V3 as well, right (otherwise an attempt to 
suspend SMMUv2-powered system will lead to crash)? Or there is a plan to 
implement S2R for both SMMU implementations?

***

If we care for possible crash because iommu_suspend is NULL for 
SMMUv2/SMMUv3, maybe we should consider adding stub callbacks to the 
both SMMU drivers, just returning -ENOSYS?

Let's see what other people's opinions are.

> 
> 
>>
>>
>>> +    if ( iommu_enabled )
>>> +    {
>>> +        dprintk(XENLOG_ERR, "IOMMU is enabled, suspend not supported yet\n");
>>> +        return -ENOSYS;
>>> +    }
>>> +#endif
>>> +
>>>       /*
>>>        * system_suspend should be called when Dom0 finalizes the suspend
>>>        * procedure from its boot core (VCPU#0). However, Dom0's VCPU#0 could
>>
>> --
>> WBR, Volodymyr
> 
> Best regards,
> Mykola
> 


