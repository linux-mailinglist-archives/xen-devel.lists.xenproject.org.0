Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B84A9CF7D8C
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 11:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196000.1513871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd4Vd-00052n-Tn; Tue, 06 Jan 2026 10:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196000.1513871; Tue, 06 Jan 2026 10:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd4Vd-00050N-Qh; Tue, 06 Jan 2026 10:41:53 +0000
Received: by outflank-mailman (input) for mailman id 1196000;
 Tue, 06 Jan 2026 10:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8PS=7L=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vd4Vc-00050H-Uv
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 10:41:53 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f0112fb-eaec-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 11:41:50 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b727f452fffso412413466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 02:41:50 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a51543fsm191522466b.55.2026.01.06.02.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 02:41:49 -0800 (PST)
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
X-Inumbo-ID: 4f0112fb-eaec-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767696110; x=1768300910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/FTe9m+tOClIYe1qC/TkyZS0SAPAYTqJ/3osCXjap5Y=;
        b=nCrz/WCWZMn/Q9XMyjxGmMg6STNLBG2r5IaNR0yfl4clYAg4nc66Oxi+Ms5TnZg7G/
         3F6AxebURedCxbPbI3XuT3AMkXUEwtBZjDf4zLf5gVt0CTKm2pNXSXMc0JAYthJ9XadZ
         vx3rQm/YEBek2KzpZVCFrHwF/4LSLDS/3sYjyh7FE2U/lVxBHBzgmJbMJOI9qK21NrWN
         wegSqA6LC4kIM/wAsMazIp36RXxtAxNmDmoxNNZAuZ+6XhjVaE+/kwZcPje7vBf84si8
         rnyH+7mk97buICCYahCHUWlcboKLvuZlrd5xlcqDLSN2XiTSYyFPYDUq4DGYGgap66WX
         /W7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696110; x=1768300910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FTe9m+tOClIYe1qC/TkyZS0SAPAYTqJ/3osCXjap5Y=;
        b=X4uQo2BxdP1VDMfm0jqJHALuA/AizUEjVrf/1kCNsQBhWq3dY1rZaYhWF6S2J2QPgi
         SJFQfu7CxW7hi7AfCkLeybZULygXcnxKdjfzmch+bpFEfj0g0NSy24Ppk1SyKMilvGAl
         UPuMw5bDg11G2RKCwFtzqmlMEesszfUrW77tXMBHXOVompSZJo2CMX1jOUpf5ooIzV0b
         37qIwISdpfo2PVnnrpxnp94YI9HMImBmfbt0qprw1cjY4vyNWkpSJKhMzEWVtEl3xY4j
         X6mBUS4Usz1Ml7Yjx7FYv/rMzR3bMP/zhqNCPnl0yunVl+uNqGtiTMyaBNnMPpBii0wT
         wRNA==
X-Forwarded-Encrypted: i=1; AJvYcCWiFXJw1ooG7BZ4vpCT+6zmovwt7hi2ezUH6/jud2cfHqp6WNEvtWO7j8Jlbj+FPyR8KY7i/4mB5Gw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0j4dvyVCmmehJIgaT9duRwHjo14SQfOCq6697CzRQzz9En8Fi
	8uzRKgGGNNldMjJshyeRpiUo8ssOrL6+/ZqWlvZGWzLFny4pAaJ3CSC4
X-Gm-Gg: AY/fxX5k7PhNNsFwaxRWQg3qDV93R6l3JdmAmfKoM81cZiOfHluwTWubJQihXlU9wbL
	kGXW+ujLS0U7EKsQFTD1FNmANktFP8qesVvKOGWvzOnk2hvxWaTGEWdGG8A20aKqzxcntvcmeUm
	Mz3G1q9fzFRF6GEVwWbjLWZjDCYwELDMwhElUG137iybPO3jbOnTXIZk61Vt5XDFH5oIEx6B13l
	86RV+smH/G5PIDJ8PJBlvJFVB+yfFI0JdUZACgs0GcktpwAzxzqqGOW83pxyPSxNDJd1m7SWkz4
	ylX3mvS3Y+sqvgusoydTIf9ZWK2uMWBDZrM9vNSVKDOD1E/iFFpUodC5wzLRutacqw1JQfltG05
	S5okmL9OhqDpEFYtV3vZmPyxR/0l+jbcka4wXkwxmXpvLLD32IgDVOmChEaKxTP+dqMxt431bzT
	7F7WZmUA/pUL6NKsBcC9Oq2Iv9Gzr6D4FxMfKhZB+qz2Gs6ho7K4EVLTjWt5PNN3k=
X-Google-Smtp-Source: AGHT+IEPYDYiYjdLEn5HH9xuGeHUbcxplmWJdYHPJbCMz6E74+h7gmLC/QUgnDJSqIqqFJlWloTVow==
X-Received: by 2002:a17:907:9413:b0:b72:b7cd:f59e with SMTP id a640c23a62f3a-b84298bddeamr212845066b.8.1767696109810;
        Tue, 06 Jan 2026 02:41:49 -0800 (PST)
Message-ID: <78cb2186-1fa9-4ad1-9999-410beb34b71e@gmail.com>
Date: Tue, 6 Jan 2026 11:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1767108625.git.oleksii.kurochko@gmail.com>
 <d49e5b9555d4f04d569e20d9c9feb23b298c7ee1.1767108625.git.oleksii.kurochko@gmail.com>
 <63a1aa58-f609-4bfe-b827-90c59e40a02d@suse.com>
 <6bbe1965-ff08-46dc-9e9c-215ca73f9f16@gmail.com>
 <bc275f4f-4138-4120-9e85-3bf298efb276@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <bc275f4f-4138-4120-9e85-3bf298efb276@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/6/26 10:55 AM, Jan Beulich wrote:
> On 06.01.2026 10:30, Oleksii Kurochko wrote:
>> On 1/5/26 5:26 PM, Jan Beulich wrote:
>>> On 30.12.2025 16:50, Oleksii Kurochko wrote:
>>>> Add support of virtual SBI base extension calls for RISC-V guests, delegating
>>>> hardware-specific queries to the underlying SBI and handling version and
>>>> firmware ID queries directly.
>>>>
>>>> The changes include:
>>>> 1. Define new SBI base extension function IDs (SBI_EXT_BASE_GET_MVENDORID,
>>>>      SBI_EXT_BASE_GET_MARCHID, SBI_EXT_BASE_GET_MIMPID).
>>>> 2. Introduce XEN_SBI_VER_MAJOR, XEN_SBI_VER_MINOR for imeplenataion of
>>>>      SBI_EXT_BASE_GET_SPEC_VERSION.
>>>> 4. Introduce SBI_XEN_IMPID to implement SBI_EXT_BASE_GET_IMP_ID.
>>>> 5. Implement handling of SBI base extension functions, including version,
>>>>      firmware ID, and machine-specific queries.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> Thanks.
>>
>>> Albeit with a question:
>>>
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/vsbi/base-extension.c
>>>> @@ -0,0 +1,82 @@
>>>> +
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#include <xen/lib.h>
>>>> +#include <xen/sched.h>
>>>> +#include <xen/version.h>
>>>> +
>>>> +#include <asm/processor.h>
>>>> +#include <asm/sbi.h>
>>>> +#include <asm/vsbi.h>
>>>> +
>>>> +/* Xen-controlled SBI version reported to guests */
>>>> +#define XEN_SBI_VER_MAJOR 0
>>>> +#define XEN_SBI_VER_MINOR 2
>>> Is it clear from whatever spec it is that is ...
>>>
>>>> +static int vsbi_base_ecall_handler(unsigned long eid, unsigned long fid,
>>>> +                                   struct cpu_user_regs *regs)
>>>> +{
>>>> +    int ret = 0;
>>>> +    struct sbiret sbi_ret;
>>>> +
>>>> +    ASSERT(eid == SBI_EXT_BASE);
>>>> +
>>>> +    switch ( fid )
>>>> +    {
>>>> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
>>>> +        regs->a1 = MASK_INSR(XEN_SBI_VER_MAJOR, SBI_SPEC_VERSION_MAJOR_MASK) |
>>>> +                   XEN_SBI_VER_MINOR;
>>>> +        break;
>>> ... implied here (it's ..._SPEC_VERSION after all) under what conditions the
>>> version would need bumping and what effects this would have on existing (e.g.
>>> migrating-in) guests? Recall that ...
>> For example, sooner or later we will want to use the SBI DBCN (Debug Console
>> Extension) for early debug output for guests, as it provides an API to work with
>> strings instead of single characters. This will require bumping the SBI version
>> to 2.0.
> I fear there's a misunderstanding here, likely on my side: Why would it be 2.0?
> Didn't you say the version is Xen controlled? If so, why not 0.3 or 1.0?

I mentioned 2.0 because SBI DBCN support starts in SBI version 2.0 (2.0-rc2, to be
more precise). If we use 0.3 or 1.0 instead, the guest won’t know [1][2] that it
can use the SBI DBCN extension instead of the legacy extension.

[1] https://elixir.bootlin.com/linux/v6.18.3/source/arch/riscv/kernel/sbi.c#L692
[2] https://elixir.bootlin.com/linux/v6.18.3/source/drivers/tty/hvc/hvc_riscv_sbi.c#L67

>
> Contrary to what you said previously, it now looks to me as if the version
> wasn't "Xen-controlled", but instead what we pick reflects functionality
> required by a particular spec version of a spec we do not control. That's
> "SBI version implemented by Xen" to me though, not really a "Xen-controlled"
> version.

I will update the comment above definitions of XEN_SBI_VER_MAJOR and XEN_SBI_VER_MINOR
to:
   /* SBI version implemented by Xen and reported to guests */

~ Oleksii

>> I don’t think this should cause any migration issues. If a guest was fully booted
>> and running with Xen SBI version 0.2, it would continue to use the legacy extension
>> for early console output (or for hvc console which is using SBI calls in Linux for
>> the moment). If the guest was still in the initialization stage (before SBI
>> extensions were probed), it would simply use the newer SBI DBCN extension instead
>> of the Legacy one.
>>
>> ~ Oleksii
>>
>>>> +    case SBI_EXT_BASE_GET_IMP_ID:
>>>> +        regs->a1 = SBI_XEN_IMPID;
>>>> +        break;
>>>> +
>>>> +    case SBI_EXT_BASE_GET_IMP_VERSION:
>>>> +        regs->a1 = (xen_major_version() << 16) | xen_minor_version();
>>>> +        break;
>>>> +
>>>> +    case SBI_EXT_BASE_GET_MVENDORID:
>>>> +    case SBI_EXT_BASE_GET_MARCHID:
>>>> +    case SBI_EXT_BASE_GET_MIMPID:
>>>> +        if ( is_hardware_domain(current->domain) )
>>>> +        {
>>>> +            sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
>>>> +            ret = sbi_ret.error;
>>>> +            regs->a1 = sbi_ret.value;
>>>> +        }
>>>> +        else
>>>> +            /*
>>>> +             * vSBI should present a consistent, virtualized view to guests.
>>>> +             * In particular, DomU-visible data must remain stable across
>>>> +             * migration and must not expose hardware-specific details.
>>> ... what is being said here applies to other sub-functions as well. IOW it
>>> looks to me as if the version reported needs to be a per-guest property.
>>>
>>> Jan

