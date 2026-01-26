Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOuTM0std2kvdAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 10:00:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9B385B42
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 10:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213412.1523886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkISd-00065C-Bw; Mon, 26 Jan 2026 09:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213412.1523886; Mon, 26 Jan 2026 09:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkISd-00062w-9J; Mon, 26 Jan 2026 09:00:39 +0000
Received: by outflank-mailman (input) for mailman id 1213412;
 Mon, 26 Jan 2026 09:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zrcg=77=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vkISb-00062d-7s
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 09:00:37 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a903946-fa95-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 10:00:36 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b884ad1026cso659485166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 01:00:36 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8867d4d290sm550394266b.34.2026.01.26.01.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 01:00:34 -0800 (PST)
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
X-Inumbo-ID: 7a903946-fa95-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769418036; x=1770022836; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qA1Handwt6LDPUKAb1WD9f9kKzCHf5X64UJ5ohR7i9o=;
        b=nF8FN861T6gfu8M7A7wXDi5adRAIAtLYKrDjLG/fBFPTfjLYSJnjHMmROXCi3c49TG
         tJ3wTkVAczcSZHggxc6HMbjBezPdtvfwKc0kiW0zR/xYdrx1wJzPjvbtx2FVS/TBv250
         NfZiIH8VaS0dHSn2DnU16ayxtAQ9pWCfzIWhwxL3V/cpLFvYdVY+nfmShvR/zB/MWZxr
         Uem7bxVaDqRFGz9ARHZfZLEf+cLlObO/ClAo3sHCnpfDhnIpWcDjfFeMOOGQM9iyuPqc
         lO1LGeHYKxo1+b/KGJ4bNtsiDG3SzrUUfZ1H1TEIGuYXicFt+yfbJh/VmQAWM8uUZDAs
         Qq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769418036; x=1770022836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qA1Handwt6LDPUKAb1WD9f9kKzCHf5X64UJ5ohR7i9o=;
        b=l0c3/adNR52yWz+SjkzGgNGzZiGK87Jrn0wi9nNtYBX0a0aa/i0+nasq2g2CkWuRBQ
         Lsscin49SaBV+cpCxAvMLBxl5G+5n/CPm5giqyItcin4H2CnH1pufK56ZPMKq7dgvHED
         TdjhtHuTEUCL/8msvRnx0rrxjpQYN2053wlG9xqH8ylx6OLbZMi5Ov3cf+USOIiMZFiS
         t40UVuMjcy0pt0ZBVL114iaYYdCl9p3oJwxHkPJLZGzGyHXlO3seQa4qKjxkBRrGTxcr
         AcNE+YJKRXxY/IXlzKxhgyGSvMNFo1JZipJ1f2TvbzFz207Yc1062j1q8GdlPLIvG8pZ
         VUFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK1xU6UxJ9yo9hKoIYdrZKKyr89v0MQLJNLlex0zoxMdJF0hvnwWQJAdXh3miaBarLTSzgb4iNzoc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjpsRzBkHkELIgAtKGEJvA82NnEP6n0rob9534HQsOn4pHRC+1
	ttU+ZCSFbH+I9pTH5ofn1PrQiildxF6PCeUcFJzUYHUf/zx5vf+3w183
X-Gm-Gg: AZuq6aKhibrwbZapvellc867NIjATb9tBiyy685/pyyEyDDb+o4rpFd+YX0iH429Lr9
	zWEFiJb7CSpDJT8m2lPRoz3szUTEFrDnXJB905JSRDwKFa1LBskwwSgJottT7pMVPOb4prCSn9m
	yxSPMJg43QHV0Nhiq78kirGc2XKOl1DDpkjrYHNkJw3xB356cKWAy/ed5pZ/FyN/Hsu8pLhrwNe
	jGnbR2jULDjU4WG4dToU3kEUgD4sz4bPYXwduDnFudfzr58o4rIrilMs7Eooc0g2NFhLdBLA6tG
	YKn0i14cklr09/SfXqj/L6rIjQ+PjdShdziqpnl83JD0Tz+xPqKgQecE/Uel9ri6ShpMHBow47+
	lVQLSsJgMnKXdteqxGdfN1b1Cck7452XbHsw9e7/aXo4ED+Eb24REbTGg3QqdN/ilNEKLCR4/Nl
	LbeTQFIYSpr1PQTKn2QCPqI/JO4FYvTCVDw/ygCUqiHicXHTCf4zm/XPI47dOSIFQ=
X-Received: by 2002:a17:907:9450:b0:b8a:f2de:e329 with SMTP id a640c23a62f3a-b8d20a1d7d6mr281616466b.25.1769418035107;
        Mon, 26 Jan 2026 01:00:35 -0800 (PST)
Message-ID: <06ee98c0-ec69-4955-a070-b0f611c8152e@gmail.com>
Date: Mon, 26 Jan 2026 10:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] xen/riscv: implement
 arch_vcpu_{create,destroy}()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <08b582179ebc4241140000972d89209c84c90fa4.1769099885.git.oleksii.kurochko@gmail.com>
 <4e2bf819-81f6-40f8-9bc3-c53aabf0967c@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4e2bf819-81f6-40f8-9bc3-c53aabf0967c@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3D9B385B42
X-Rspamd-Action: no action

Hello Teddy,

On 1/23/26 12:30 PM, Teddy Astie wrote:
> Hello,
>
> Le 22/01/2026 à 17:49, Oleksii Kurochko a écrit :
>> Introduce architecture-specific functions to create and destroy VCPUs.
>> Note that arch_vcpu_create() currently returns -EOPNOTSUPP, as the virtual
>> timer and interrupt controller are not yet implemented.
>>
>> As part of this change, add continue_new_vcpu(), which will be used after
>> the first context_switch() of a new vCPU. Since this functionality is not
>> yet implemented, continue_new_vcpu() is currently provided as a stub.
>>
>> Update the STACK_SIZE definition and introduce STACK_ORDER (to align with
>> other architectures) for allocating the vCPU stack.
>>
>> Introduce struct cpu_info to store per-vCPU state that lives at the top
>> of the vCPU's stack.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>    - Drop BUILD_BUG_ON() in arch_vcpu_create() as a check isn't very useful.
>>    - Use vzalloc() instead of alloc_xenheap_page() to use the larger domheap to
>>      allocate vCPU's stack.
>>    - Drop printk() inside arch_vcpu_create() to not have potential big noise
>>      in console as it could be that an amount of vCPUs is pretty big.
>>    - Use XVFREE() instead of free_xenheap_pages() as vCPU's stack allocation
>>      happens with a usage of vzalloc() now.
>>    - Drop stack field as it is enough to have only cpu_info as stack pointer
>>      could be calculated based on cpu_info.
>>    - Drop cast when v.arch.cpu_info is inialized as it is not necessary
>>           to have it.
>>    - Drop memset() for arch.cpu_info() as it is enough to have vzalloc().
>> ---
>>    xen/arch/riscv/Makefile              |  1 +
>>    xen/arch/riscv/domain.c              | 59 ++++++++++++++++++++++++++++
>>    xen/arch/riscv/include/asm/config.h  |  3 +-
>>    xen/arch/riscv/include/asm/current.h |  6 +++
>>    xen/arch/riscv/include/asm/domain.h  |  2 +
>>    xen/arch/riscv/stubs.c               | 10 -----
>>    6 files changed, 70 insertions(+), 11 deletions(-)
>>    create mode 100644 xen/arch/riscv/domain.c
>>
>> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
>> index 87c1148b0010..8863d4b15605 100644
>> --- a/xen/arch/riscv/Makefile
>> +++ b/xen/arch/riscv/Makefile
>> @@ -1,5 +1,6 @@
>>    obj-y += aplic.o
>>    obj-y += cpufeature.o
>> +obj-y += domain.o
>>    obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>>    obj-y += entry.o
>>    obj-y += imsic.o
>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>> new file mode 100644
>> index 000000000000..9c546267881b
>> --- /dev/null
>> +++ b/xen/arch/riscv/domain.c
>> @@ -0,0 +1,59 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/init.h>
>> +#include <xen/mm.h>
>> +#include <xen/sched.h>
>> +#include <xen/vmap.h>
>> +
>> +static void continue_new_vcpu(struct vcpu *prev)
>> +{
>> +    BUG_ON("unimplemented\n");
>> +}
>> +
>> +static void __init __maybe_unused build_assertions(void)
>> +{
>> +    /*
>> +     * Enforce the requirement documented in struct cpu_info that
>> +     * guest_cpu_user_regs must be the first field.
>> +     */
>> +    BUILD_BUG_ON(offsetof(struct cpu_info, guest_cpu_user_regs) != 0);
>> +}
>> +
>> +int arch_vcpu_create(struct vcpu *v)
>> +{
>> +    int rc = 0;
>> +    void *stack = vzalloc(STACK_SIZE);
>> +
> Are there alignment constraints for the stack ?

vzalloc() allocates page-aligned memory as far as I can see:
   ...
   va = __vmap(mfn, 1, pages, 1, PAGE_HYPERVISOR, type);
   ...
   
   where 1 -> means align and what will lead that in vm_alloc():
      ...
      start =(start +align)&~(align -1); ...

>
>> +    if ( !stack )
>> +        return -ENOMEM;
>> +
>> +    v->arch.cpu_info = stack + STACK_SIZE - sizeof(struct cpu_info);
>> +    memset(v->arch.cpu_info, 0, sizeof(*v->arch.cpu_info));
>> +
> Given that vzalloc ensures that the memory is cleared, you don't need to
> clear it another time.

Oh, right, missed to drop memset.

>
>> +    v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
>> +    v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
>> +
> You probably also want to set the first parameter of continue_new_vcpu
> (struct vcpu *prev), or otherwise I don't think we want the "prev"
> parameter in continue_new_vcpu if it's always going to be 0.

It will be set by RISC-V ABI (prev will be stored in a0) when __context_switch()
will be called in context_switch():
   void context_switch(struct vcpu *prev, struct vcpu *next)
   {
     ASSERT(local_irq_is_enabled());
     ASSERT(prev != next);
     ASSERT(!vcpu_cpu_dirty(next));

     local_irq_disable();

     set_current(next);

     prev = __context_switch(prev, next);

     schedule_tail(prev);
   }
First call of the __context_switch() will lead to jump to continue_new_vcpu()
function which will have a0=prev.

>
> IIRC continue_new_vcpu is only meant to bootstrap the new vCPU, not just
> perform a context switch to it.
>
>> +    /* Idle VCPUs don't need the rest of this setup */
>> +    if ( is_idle_vcpu(v) )
>> +        return rc;
>> +
>> +    /*
>> +     * As the vtimer and interrupt controller (IC) are not yet implemented,
>> +     * return an error.
>> +     *
>> +     * TODO: Drop this once the vtimer and IC are implemented.
>> +     */
>> +    rc = -EOPNOTSUPP;
>> +    goto fail;
>> +
>> +    return rc;
>> +
>> + fail:
>> +    arch_vcpu_destroy(v);
>> +    return rc;
>> +}
>> +
>> +void arch_vcpu_destroy(struct vcpu *v)
>> +{
>> +    vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info));
>> +}
> That doesn't look correct, you want to vfree what was allocated as the
> bottom of stack, i.e
>
> v->arch.cpu_info + sizeof(struct cpu_info) - STACK_SIZE

Agree formula should be correct, now it points to the end of the stack
memory.

>
> Or alternatively introduce bottom of stack as a additional vcpu_arch field.

There is not too much sense to have the separate field for that.

Thanks.

~ Oleksii


