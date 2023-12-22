Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEAA81CA92
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 14:15:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659351.1028912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGfMb-0000WM-T1; Fri, 22 Dec 2023 13:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659351.1028912; Fri, 22 Dec 2023 13:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGfMb-0000U9-Q7; Fri, 22 Dec 2023 13:14:53 +0000
Received: by outflank-mailman (input) for mailman id 659351;
 Fri, 22 Dec 2023 13:14:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2k+=IB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGfMa-0000U3-9V
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 13:14:52 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 167e044d-a0cc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 14:14:50 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso1451841f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 05:14:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ay14-20020a05600c1e0e00b0040c6ab53cd2sm7076648wmb.10.2023.12.22.05.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 05:14:50 -0800 (PST)
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
X-Inumbo-ID: 167e044d-a0cc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703250890; x=1703855690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zTFroWiaMIko+RaoQqL2e1wH8B1Jg1tSJG3ohi1aRDM=;
        b=GiLoByh8mipaMJjETys58192UNsVfB3sjQ7DkxL5eJi6/RA0HwFiX5PJwactFgxjTI
         q7hUWcWoo7pEAt1Kf/G1kbWimrS6P7WpoibrlrkBA17YibJGDZHx+kt4j39JH89TKkaW
         uCxnSRaMO1qkgznt2y5AqoGHw9v9l8W0y8WyDaGMEh/IDQkBK7Sq++sAY7SEH9PuuD7p
         563xWw0oMUoGAU1xdBllMgynWIZspO0+M/lmLdfHd15+KRinMrOLqpkTtnzhMeJxixzw
         btQutOaWrISxivKM5g4/emg8Ji/9Pk9zWmRT5FnXoew+Ck7xtvtGFadY11isYgXyx2xc
         FAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703250890; x=1703855690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zTFroWiaMIko+RaoQqL2e1wH8B1Jg1tSJG3ohi1aRDM=;
        b=MNVwvsnbBkYbEHItPTV/XcToDQtlClpliQL2EHhibz0W0KoI7ZYdSXkfYV5ooJ5yfp
         T5fg72Puf/CYxnKzxl3Vj/YVRP7jgH8Ig0ABuvppDsg+g8oP5tE4/4dI/8MVxQTmhNAv
         1G7DlYSalzzkOjN9PBav6nZRA312bdMeIZIJqNIYktkbjtjmkywoQ3lF9jtFlr6c2+OL
         IlS1itGil3c7DkiH/gIcH8+DoP8Zhu4wOG/ZHSoNJJ3OTZu3Z6MiPMAXQfWPO8wBQxqH
         8DiJciZnLZa2NUPMioH7j42R/76ZblP6Ce4UAOMy4jqzKxwgl4zSoDvnMv3mINN3xvGX
         GncQ==
X-Gm-Message-State: AOJu0YyLGD+SCYsw9KzFww3Zx66nbPf0TDILl7Ay8p99xcRFUh+BLI+k
	0KFh0OTazjEk5MkPbWE7t8xgz0xhTU6x
X-Google-Smtp-Source: AGHT+IEqZIJZtUpwrZMg5Y0n6NcYRsP5SocsAR3JcTzB86L7jkA8IiiCcmc8oESrfRurGtcVfnEqBA==
X-Received: by 2002:a05:600c:1c9d:b0:40c:6920:4da8 with SMTP id k29-20020a05600c1c9d00b0040c69204da8mr669868wms.160.1703250890226;
        Fri, 22 Dec 2023 05:14:50 -0800 (PST)
Message-ID: <f78e0ef7-2c25-40bf-b34d-1c4b88839424@suse.com>
Date: Fri, 22 Dec 2023 14:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] xen/asm-generic: introduce stub header monitor.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <49c8e0f5997063ed65c3b135c0003ca9570c0bc6.1703072575.git.oleksii.kurochko@gmail.com>
 <a4dccfb1-6bbf-418d-b8c5-1e99c75d1b64@citrix.com>
 <09579f818b778d3f7db3f2dd33e39b9d712e86c3.camel@gmail.com>
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
In-Reply-To: <09579f818b778d3f7db3f2dd33e39b9d712e86c3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.12.2023 14:02, Oleksii wrote:
> On Wed, 2023-12-20 at 16:33 +0000, Andrew Cooper wrote:
>> On 20/12/2023 2:08 pm, Oleksii Kurochko wrote:
>>> diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-
>>> generic/monitor.h
>>> new file mode 100644
>>> index 0000000000..74e4870cd7
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/monitor.h
>>> @@ -0,0 +1,57 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * include/asm-generic/monitor.h
>>> + *
>>> + * Arch-specific monitor_op domctl handler.
>>> + *
>>> + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
>>> + * Copyright (c) 2016, Bitdefender S.R.L.
>>> + *
>>> + */
>>> +
>>> +#ifndef __ASM_GENERIC_MONITOR_H__
>>> +#define __ASM_GENERIC_MONITOR_H__
>>> +
>>> +#include <xen/errno.h>
>>> +
>>> +struct domain;
>>> +struct xen_domctl_monitor_op;
>>> +
>>> +static inline
>>> +void arch_monitor_allow_userspace(struct domain *d, bool
>>> allow_userspace)
>>> +{
>>> +}
>>> +
>>> +static inline
>>> +int arch_monitor_domctl_op(struct domain *d, struct
>>> xen_domctl_monitor_op *mop)
>>> +{
>>> +    /* No arch-specific monitor ops on GENERIC. */
>>> +    return -EOPNOTSUPP;
>>> +}
>>> +
>>> +int arch_monitor_domctl_event(struct domain *d,
>>> +                              struct xen_domctl_monitor_op *mop);
>>
>> Turn this into a static inline like the others, and you can delete:
>>
>> arch/ppc/stubs.c:100
>>
>> int arch_monitor_domctl_event(struct domain *d,
>>                               struct xen_domctl_monitor_op *mop)
>> {
>>     BUG_ON("unimplemented");
>> }
>>
>> because new architectures shouldn't have to stub one random piece of
>> a
>> subsystem when using the generic "nothing special" header.
>>
>> Given the filtering for arch_monitor_domctl_op(), this one probably
>> wants to be ASSERT_UNREACHABLE(); return 0.
> What you wrote makes sense. However, doing it that way may limit the
> reuse of other parts of the asm-generic header. It would require
> introducing an architecture-specific monitor.h header, which would be
> nearly identical.
> 
> For instance, at present, the only difference between Arm, PPC, and
> RISC-V is arch_monitor_domctl_event(). If this function is implemented
> with BUG_ON("unimplemented"), reusing the asm-generic monitor.h header
> for Arm (as it is partly done now) becomes challenging.
> 
> To address this, I propose wrapping arch_monitor_domctl_event() in
> #ifdef:
> 
> #ifndef HAS_ARCH_MONITOR_DOMCTL_EVENT
> int arch_monitor_domctl_event(struct domain *d,
>                               struct xen_domctl_monitor_op *mop)
> {
>     BUG_ON("unimplemented");
> }
> #endif
> 
> In the architecture-specific monitor.h, you would define
> HAS_ARCH_MONITOR_DOMCTL_EVENT and provide the architecture-specific
> implementation of the function. For example, in the case of Arm:
> 
> #ifndef __ASM_ARM_MONITOR_H__
> #define __ASM_ARM_MONITOR_H__
> 
> #include <xen/sched.h>
> #include <public/domctl.h>
> 
> #define HAS_ARCH_MONITOR_DOMCTL_EVENT
> 
> #include <asm-generic/monitor.h>
> 
> static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
> {
>     uint32_t capabilities = 0;
> 
>     capabilities = (1U << XEN_DOMCTL_MONITOR_EVENT_GUEST_REQUEST |
>                     1U << XEN_DOMCTL_MONITOR_EVENT_PRIVILEGED_CALL);
> 
>     return capabilities;
> }
> 
> int monitor_smc(void);
> 
> #endif /* __ASM_ARM_MONITOR_H__ */
> 
> This approach maintains a clean and modular structure, allowing for
> architecture-specific variations while reusing the majority of the code
> from the generic header.
> 
> Does it make sense?

With the state things are in right now in the tree, perhaps yes. But
as with NUMA and other subsystems: Generally the case of the subsystem
not used should be handled in common code. What's in asm-generic/ is
supposed to be a default implementation when the subsystem _is_ used.
Unlike NUMA, there's no Kconfig control for MONITOR (or VM_EVENT).
Hence why getting this sorted is somewhat more involved here; (ab)using
the asm-generic/ header for the time being is an option, but would then
need properly justifying (imo).

Jan

