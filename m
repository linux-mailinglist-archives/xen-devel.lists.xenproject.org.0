Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F741D13FD6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:29:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200725.1516576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKma-0006uW-Ss; Mon, 12 Jan 2026 16:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200725.1516576; Mon, 12 Jan 2026 16:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKma-0006sF-PP; Mon, 12 Jan 2026 16:28:44 +0000
Received: by outflank-mailman (input) for mailman id 1200725;
 Mon, 12 Jan 2026 16:28:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g/6n=7R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfKmZ-0006s9-US
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:28:44 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c23f83f4-efd3-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 17:28:42 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-64b9b0b4d5dso13783725a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 08:28:42 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d5d4sm18008906a12.32.2026.01.12.08.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 08:28:41 -0800 (PST)
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
X-Inumbo-ID: c23f83f4-efd3-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768235322; x=1768840122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rE6yV5imzukGfSPD6lBGrgoUU53xvGqUNYJYiiMKies=;
        b=fzMa+Q5A10Uol5bRpsODSmehEG0uAGOzRFfT9juUVOYCwwJ8r0xKJe9MCj3cI6n8nr
         HG002rKyFTimecyaFTjJkutaltj8QsGS3HOMgXV3U2kkMmK/QTK9dftd6KrUSFOFx3mr
         dwg81bguX4zwu+CtRpUjdFTols4leE6xSAbxRhdmRvAvq03a4VpQiD2eDP6K9IELogij
         KYG5n+ARfQBcHppT/qOZ/jU7cpWv5hQDlo/qoB+qiHcFdCTu/sOe/lHNofXFzECInxwb
         gY9s6pt/PmjHLZjEuFu7J1xiBMYeePKSw6pQjcmoJ9sYp/vo3RnZdfKzznDKTlyN6tp+
         y35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235322; x=1768840122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rE6yV5imzukGfSPD6lBGrgoUU53xvGqUNYJYiiMKies=;
        b=iDICxVzt/aRChoUww5Ce5IIqWNkCxgbWjWTDAyBitBtxL4ZCHOS+HlydpbE5CkZCUA
         h95QC9k29OQKAOWnUSiM1GajD+Pi0/C/IXg4Z+e967/71EmJ1XGyyoZwWLHOLlE6DXmc
         lOFY82RaipaDgBFUcODVE6MSeXDgQSzOBGyC/t2/KcWOKhWwIV88pXsUiFjFtvO3hpTd
         bip4bmwZP1yBSMz3CbobQncINhZrwEc7EOpSaUmnZyROZosqSXBlOUokDKyJmW42+X2p
         qeGtdVk4JLKU4cTdNAVnp9cPpzS4hg+eeNTvz8hT48QXv0PJDEzmhiLTSnRJbYJ5eaLU
         Byzg==
X-Forwarded-Encrypted: i=1; AJvYcCXe25XwNmKlo7KLWpJ1aPj/wWeF4UYIejXtSTSsIO27eoOPX2vSJJlo9jje1GJ7m7/mtAJhH6gAd84=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0VQ14qTIffb+ASn19a4PZnP9n0nfkHZ5ZYrKlh0u87VsJgecz
	1HVEFQsqG8oUK7cpVXl9cK0KCrkwR1mPn+JmAAe3YyU7m9QujAdEEcUK
X-Gm-Gg: AY/fxX7nG/fEvSBuVfBIhFdG4B+O2TS4mpS92qQwpKj/3TifTP0z2TumAbfDH8VZZ1y
	kLvRy29ysIgrQJkMvIDXc4jkPqHxcmW3jcFGoMAWfjc3RaZMzTL5AjHmy/NzI4gN+ZVMNtx7g+i
	nTLel9w1o16alMeb2fEBkwuHlTWs699rlHbTbgZ1xXtfo7ZuyPiPHEU98y57WYHlmrZkYIX4MXo
	sROKwMtvGpx/6nasGlNtiMrqhiHr2/2iAGq6DFUpO09DT90lcWSAx3nimKU3a5aAmwPUCx7pW2Z
	8CjzyY1fd8RA9r3EJ9nL3owZbsb3dHrreDcsCL183HPglmNKgOiYGP3Ae34Pab+2INsJOtY4ske
	zAGK/w/5P5sg7nvDM4rDVaseBwRBS8tKQnDXE+gcfQfw0hXD4tsJjbHS5E+d7ljD9w7sIwJ4ndA
	QgL+wxuxz9r3UTHZFRt5sRytzASNpMESTYkmBCIw/p4cIWg84sNOMXpVOTNdCJ6TU=
X-Google-Smtp-Source: AGHT+IFoAhvsg2/W5nDRaxMO1muF8GQxquWD77duxoXlrb1wnVj6s8wnXEg+WP45cdQTYc9IGQFOFQ==
X-Received: by 2002:a17:907:e10d:b0:b87:205c:1aa7 with SMTP id a640c23a62f3a-b87205c1d96mr226774466b.44.1768235321702;
        Mon, 12 Jan 2026 08:28:41 -0800 (PST)
Message-ID: <131d5d1d-f13c-486a-beac-59f7f7b45606@gmail.com>
Date: Mon, 12 Jan 2026 17:28:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/15] xen/riscv: introduce vtimer
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <94ffc70d3050e532290126560355dc548161f466.1766595589.git.oleksii.kurochko@gmail.com>
 <c3f7b30e-0b39-42d0-88b5-6a5d0801e428@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c3f7b30e-0b39-42d0-88b5-6a5d0801e428@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/7/26 4:21 PM, Jan Beulich wrote:
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> Introduce a virtual timer structure along with functions to initialize
>> and destroy the virtual timer.
>>
>> Add a vtimer_expired() function and implement it as a stub, as the timer
>> and tasklet subsystems are not functional at this stage.
> Shouldn't those pieces of infrastructure be made work then first?

It could be an option; it’s just not really critical until a guest is running.

I actually considered adding this in the current patch series, but decided to
introduce it later to avoid making the series too large. (On the other hand, it
would be only one additional patch, IIRC)

> I also
> don't quite understand why the subsystems not being functional prevents
> the function to be implemented as far as possible. Most if not all
> functions you need from both subsystems should be available, for living
> in common code.

I chose the wrong words here; this is not the main (that some subsystems isn't
fully functional) reason why I’m using a stub here instead of something functional.

Basically, implementing this requires vcpu_kick() and vcpu_set_interrupt(),
which are introduced later in this patch series.

As an alternative, I could drop vtimer_expired() and the related code from this
patch and reintroduce them after vcpu_kick() and vcpu_set_interrupt() are
available.

>
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -8,6 +8,7 @@
>>   #include <public/hvm/params.h>
>>   
>>   #include <asm/p2m.h>
>> +#include <asm/vtimer.h>
>>   
>>   struct vcpu_vmid {
>>       uint64_t generation;
>> @@ -52,6 +53,9 @@ struct arch_vcpu
>>       struct cpu_info *cpu_info;
>>       void *stack;
>>   
>> +    struct vtimer vtimer;
>> +    bool vtimer_initialized;
> Assuming the field is really needed (see remark further down), why is this
> not part of the struct?

Agree, it would be better to have it as a part of struct vtimer if it will
be used in future.

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/vtimer.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * (c) 2023-2024 Vates
>> + */
>> +
>> +#ifndef ASM__RISCV__VTIMER_H
>> +#define ASM__RISCV__VTIMER_H
>> +
>> +#include <xen/timer.h>
>> +
>> +struct domain;
>> +struct vcpu;
> I don't think this one is needed, as long as you have ...
>
>> +struct xen_arch_domainconfig;
>> +
>> +struct vtimer {
>> +    struct vcpu *v;
> ... this. Question is why this is here: You should be able to get hold of the
> struct vcpu containing a struct vtimer using container_of().

Good point, I haven't thought about that. It could really be done using container_of().


>
>> --- /dev/null
>> +++ b/xen/arch/riscv/vtimer.c
>> @@ -0,0 +1,39 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/sched.h>
>> +
>> +#include <public/xen.h>
>> +
>> +#include <asm/vtimer.h>
>> +
>> +int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
>> +{
>> +    /* Nothing to do at the moment */
>> +
>> +    return 0;
>> +}
> The function has no caller and does nothing - why do we need it?

It will be called later in arch_domain_create().

It will be needed if SSTC extension will be supported but could be dropped now.

>
>> +static void vtimer_expired(void *data)
>> +{
>> +    panic("%s: TBD\n", __func__);
>> +}
>> +
>> +int vcpu_vtimer_init(struct vcpu *v)
>> +{
>> +    struct vtimer *t = &v->arch.vtimer;
>> +
>> +    t->v = v;
>> +    init_timer(&t->timer, vtimer_expired, t, v->processor);
>> +
>> +    v->arch.vtimer_initialized = true;
> init_timer() has specific effects (like setting t->function to non-NULL
> and t->status to other than TIMER_STATUS_invalid). Can't you leverage
> that instead of having a separate boolean? (Iirc we do so elsewhere.)

Nice, it could be used instead of having vtimer_initialized in struct vtimer.

Thanks.

~ Oleksii


