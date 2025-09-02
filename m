Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87457B40CF8
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 20:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107267.1457759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utVYI-0001Nc-S1; Tue, 02 Sep 2025 18:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107267.1457759; Tue, 02 Sep 2025 18:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utVYI-0001MH-Of; Tue, 02 Sep 2025 18:16:18 +0000
Received: by outflank-mailman (input) for mailman id 1107267;
 Tue, 02 Sep 2025 18:16:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cv9L=3N=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1utVYH-0001MB-NB
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 18:16:17 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea00ec09-8828-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 20:16:15 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45b8b25296fso18564045e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 11:16:15 -0700 (PDT)
Received: from [10.17.76.214] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3dcc19a386dsm118818f8f.4.2025.09.02.11.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 11:16:14 -0700 (PDT)
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
X-Inumbo-ID: ea00ec09-8828-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756836975; x=1757441775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SqMHAPMH4OTCuEp6LUw0NE0Zc7xhyAwnJYqEI+MXBxc=;
        b=EJ2JCwfcWItLUt/UmG3StAzcicecDRT8ET1FVeoZG8dRbxzCaDJ+frx//QM2oyIbO0
         CmUJQ8wRqAD9+i3NzKIE2QXMAD3MYIuzVmo75NWWaJzyN8t1OOIHg2WB2Rigf6tsWx7r
         F7GS+ZupLi9jiIBUgiafCwUOyAXjll5XMRTInECwJinHCIVE5sxuNRqwwViUkCvOwhrJ
         Xp1QV7z2a+dQ4ip/dSKUtvI1fWei4GFj09hMVfJT6BdJgeRzhg2DeRC1z3iWfkkkCk+/
         D/GuC+fMO9pd/e9hXB51DcYbEbUsoutHisdRK40N86eDqHv3A0XAj0rBUZ77maGU9EHd
         3+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756836975; x=1757441775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqMHAPMH4OTCuEp6LUw0NE0Zc7xhyAwnJYqEI+MXBxc=;
        b=iUyPW65Kva6cP7TyrlnfAEa3VBkoVz8xyxnEH+dT1wV+mXc03MuSo8XMZbMQJ6Axy9
         1As3NzYh+YXYRG1/A2WXpEvyTYW1wt7h1vZHEc6bhGwR7ANN7fzHzDSjsypi+OQbs8ty
         8Jz5K7Un+v95QioSMDQpuYrBiGgorDN8frHVEkEXkOvFCa9TX7YqK9KfpV6n7W2eD3b5
         JYeF/d1YHQkeWAVuyRBdhQETq7jjV+5X8LvYNTNyaRCTUwPcI25GKPwgA/dNUERXV8ne
         MWxmHh7OFoU6Vl7YjyyRQEN7WSDczRablUw0nwW5fKm0jQOPrk1D5bCBNhWpqlej/Hov
         U2bw==
X-Gm-Message-State: AOJu0Yy1p6Iyi2TSPUfKMv2NI4lda/7lHwY2eYWOmUJAoQp86N1X/2/x
	mQ3HRDh6toobR4bAegRPKf1ZHeuRQuJFgx0DXP8IF6KZ1Dwtp6i2STNE
X-Gm-Gg: ASbGncuw/dgpU0Kd18IwsIbYKq+1Lwnka+dsHH6xA2UdVZdimjpGbgsJ6twGw3J810K
	sYiCFQkwPsV8yQGMDh06TUWVV61naG2TR+t+uDQdNBwHEwAoAzKRl5b01OQDJZf0YoRMHfqGf8E
	iwk5POmVcSdzdkbVUjeZ18TNycdxfgFwVxDvGvJfF3B7znviBn2C/XxORMI7VhozQCW05KysH42
	lgBiOOKJXq98DmmLmlCitsFUpiuQhKuMSCAggvoB+Y+UsSvLPkElqNjhbkkDPi3n15FQlJtOcA9
	IByiXK3g/0hRTGt2ClHO8N+3hXGvTpkR++bICatJIJebQTe8kr5MrOfYlfSh9/zr6IVRsYfEPDi
	/3oueJjI15yhogzKShdK92H/my5P7UWeDWUkxUxNT1Y3kjMAtR6lPPPY=
X-Google-Smtp-Source: AGHT+IHN/azAid88EWGaKIY1h1/du7XllgDOPyRwqW5NXSxwfALXCk4Zpr321+MfGwM1Mu2Wl53bDA==
X-Received: by 2002:a05:6000:2207:b0:3cd:e63a:cfd5 with SMTP id ffacd0b85a97d-3d1e07a4cc1mr9205899f8f.56.1756836974674;
        Tue, 02 Sep 2025 11:16:14 -0700 (PDT)
Message-ID: <f7554cc0-893b-44a6-8987-7508dfeaba97@gmail.com>
Date: Tue, 2 Sep 2025 21:16:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] xen/arm: irq: Restore state of local IRQs during
 system resume
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
 <18c51957660441c945d51b02be965fbcc19c7c2b.1756763487.git.mykola_kvach@epam.com>
 <0fb4d962-a92a-4b8b-805d-60a03fe1b734@gmail.com>
 <CAGeoDV_XPjkpniPkaPXd82B80Q0qutfmXyRKedvRkWCkbL8bmQ@mail.gmail.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <CAGeoDV_XPjkpniPkaPXd82B80Q0qutfmXyRKedvRkWCkbL8bmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 02.09.25 20:43, Mykola Kvach wrote:
> Hi Oleksandr,

Hello Mykola

> 
> On Tue, Sep 2, 2025 at 7:49 PM Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
>>
>>
>>
>> On 02.09.25 01:10, Mykola Kvach wrote:
>>
>> Hello Mykola
>>
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> On ARM, the first 32 interrupts (SGIs and PPIs) are banked per-CPU
>>> and not restored by gic_resume (for secondary cpus).
>>>
>>> This patch introduces restore_local_irqs_on_resume, a function that
>>> restores the state of local interrupts on the target CPU during
>>> system resume.
>>>
>>> It iterates over all local IRQs and re-enables those that were not
>>> disabled, reprogramming their routing and affinity accordingly.
>>>
>>> The function is invoked from start_secondary, ensuring that local IRQ
>>> state is restored early during CPU bring-up after suspend.
>>>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>> Changes in V6:
>>> - Call handler->disable() instead of just setting the _IRQ_DISABLED flag
>>> - Move the system state check outside of restore_local_irqs_on_resume()
>>> ---
>>>    xen/arch/arm/irq.c | 39 +++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 39 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>>> index 6c899347ca..ddd2940554 100644
>>> --- a/xen/arch/arm/irq.c
>>> +++ b/xen/arch/arm/irq.c
>>> @@ -116,6 +116,41 @@ static int init_local_irq_data(unsigned int cpu)
>>>        return 0;
>>>    }
>>>
>>> +/*
>>> + * The first 32 interrupts (PPIs and SGIs) are per-CPU,
>>> + * so call this function on the target CPU to restore them.
>>> + *
>>> + * SPIs are restored via gic_resume.
>>> + */
>>> +static void restore_local_irqs_on_resume(void)
>>> +{
>>> +    int irq;
>>
>> NIT: Please, use "unsigned int" if irq cannot be negative
> 
> ok
> 
>>
>>> +
>>> +    spin_lock(&local_irqs_type_lock);
>>> +
>>> +    for ( irq = 0; irq < NR_LOCAL_IRQS; irq++ )
>>> +    {
>>> +        struct irq_desc *desc = irq_to_desc(irq);
>>> +
>>> +        spin_lock(&desc->lock);
>>> +
>>> +        if ( test_bit(_IRQ_DISABLED, &desc->status) )
>>> +        {
>>> +            spin_unlock(&desc->lock);
>>> +            continue;
>>> +        }
>>> +
>>> +        /* Disable the IRQ to avoid assertions in the following calls */
>>> +        desc->handler->disable(desc);
>>> +        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
>>
>> Shouldn't we use GIC_PRI_IPI for SGIs?
> 
> Yes, we should. But currently I am restoring the same value
> as it was before suspend...
> 
> I definitely agree that this needs to be fixed at the original
> place where the issue was introduced, but I was planning to
> address it in a future patch.
> 
>>
>>
>>> +        desc->handler->startup(desc);
>>> +
>>> +        spin_unlock(&desc->lock);
>>> +    }
>>> +
>>> +    spin_unlock(&local_irqs_type_lock);
>>> +}
>>> +
>>>    static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>>>                            void *hcpu)
>>>    {
>>> @@ -134,6 +169,10 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>>>                printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
>>>                       cpu);
>>>            break;
>>> +    case CPU_STARTING:
>>> +        if ( system_state == SYS_STATE_resume )
>>> +            restore_local_irqs_on_resume();
>>> +        break;
>>
>> May I please ask, why all this new code (i.e.
>> restore_local_irqs_on_resume()) is not covered by #ifdef
>> CONFIG_SYSTEM_SUSPEND?
> 
> I don’t see a reason to introduce such "macaron-style" code. On ARM, the
> system suspend state is only set when CONFIG_SYSTEM_SUSPEND is defined
> anyway.

right

> 
> If you would prefer me to wrap all relevant code with this define, please
> let me know and I’ll make the change. In this case, I think the current
> approach is cleaner, but I’m open to your opinion.

In other patches, you seem to wrap functions/code that only get called 
during suspend/resume with #ifdef CONFIG_SYSTEM_SUSPEND, so I wondered 
why restore_local_irqs_on_resume() could not be compiled out
if the feature is not enabled. But if you still think it would be 
cleaner this way (w/o #ifdef), I would be ok.

> 
>>
>>>        }
>>>
>>>        return notifier_from_errno(rc);
>>
> 
> Best regards,
> Mykola


