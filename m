Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B265D11CBD
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 11:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199943.1515973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfF1H-0004fk-8D; Mon, 12 Jan 2026 10:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199943.1515973; Mon, 12 Jan 2026 10:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfF1H-0004de-5b; Mon, 12 Jan 2026 10:19:31 +0000
Received: by outflank-mailman (input) for mailman id 1199943;
 Mon, 12 Jan 2026 10:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g/6n=7R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfF1F-0004dY-LZ
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 10:19:29 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c8c50e2-efa0-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 11:19:28 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-64b9d01e473so10316433a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 02:19:27 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6648fsm17204943a12.28.2026.01.12.02.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 02:19:25 -0800 (PST)
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
X-Inumbo-ID: 2c8c50e2-efa0-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768213166; x=1768817966; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S8cNnMgGRzbmVNuAN76xJOWMAaiFOowG5vdLwJVgWDI=;
        b=HxMQodqxmMPozQoKt0HSHzCjlcN7Z8cNVc2ZlSGV37b81DeVArBvcF1rA4JG9omtpC
         oHiff9vpCvRlYPOOLZntnQPwt6uaZ4JA+Y+k+ifhuqBQlQiFL+b+mvssoYPo02IPJOv5
         nX6U5/otS7A9RgqQpwxD5gp2Vq1oHBhpGAx1GpVMlqBJr/fF8PUJnAbAduhFbe93TKnJ
         tMOEUJfUocC/zgBpNDwvxaYgcVWgkvk/sy9pqGPPLsoDKBReo7b2CUrYlrasTec6PcuQ
         ogjqenmexIXptz3sUGCDtnKLVwVp15G5dU0R2AhBN8niaqFtzYfK6nS/U/pJtywgwWBI
         BVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213166; x=1768817966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8cNnMgGRzbmVNuAN76xJOWMAaiFOowG5vdLwJVgWDI=;
        b=QlzNK+udgoo7aX5241QpgLGM4Jwty9PE7/qLAV3cEFjyrLmUlggqi3szL/Jg9wJrgT
         PyyY462uDjwtRw47Msx25BL+XnqZkKEfkOqyliQA/BQ1+4KOBOB5+HFDmlzNHX746phS
         aSclGC1eiBQZ/v5jeu+TNtUma/Zmy4M7ZZlzD1lDpjKSt4uw1XhsFk6cECK84j5vn6pp
         vT0kMHwfriLMxiXBeoQ8GQ9LTjuucsPGFPY24InjmFC/Ot57/9IChyCi/NWcAEcjq4dd
         gbt51UFCbHLP5WT9MP+FY5RQqUXleTj+JxoLrZBhMKJnVGhSRRR1UIZ3l3LLcqfzkvgL
         AZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxiRe+tweP6phupre9PR3ixfD6p/Addyfq55CRetPVdUp+vTiNYeGrFEwohJcdL/jxagOq6VrTDDQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHhp1Ipv+JC1r+LnkbXQDT2spO6bhbrMGrV/Gfy+pHUfyxt/PD
	crrSTs9gkSx4rfs848Qfhr+paGHBcMbx2DC8XgEt8+h/iQufOfbGeOCG
X-Gm-Gg: AY/fxX6fgM4FZ1jdxg7OoRp36MPKoCasqB6PChZ2Quu0AXH261j924k3E6HUW6Nd3Jt
	NxvxPtfrr79W/Ia6HllgSiYQ98p0KzhkeLEXJ74o7Mp/A6HDxsNNz+q2AR2Kn0NBKkcHfuTDNVr
	qOt65pZYFdk4WwtnYH1mjRz/BREb0rGFio76mjKnB5L0vZjFoflQQvNexdU6FKBNovKizPgu48F
	K3krrbsbMbAXno/5N0LRdMhghkBNyXv4boyaCMu+rjKApXACYAt6itf+434c4XiWMLddDRMdKj5
	H/yG52bAMhWt2IR4JHw/GrIdhVKPipIJCW/lmlI7Sm7CbyC5BgGJYm8U0/j5l/UaEb45kSyQyie
	aTeM0VbRdxePZyxlJVXZLN0VVZumR902/4nZSuhx5bAc+MrB7k5mk9xQaCOL5YLjvF7DPpG/WFe
	o+Z+OyqRYt3o6ScS/3otjT+V75S9PqPaWBbhXuFL/UqCS6ukLDl7L1pnM9IQ5oHak=
X-Google-Smtp-Source: AGHT+IEzblSRHenzGT1D9WFy+qk/RZC7irbon66oklI20cDD0wMf79Z+kqfuGQ6uaxvhlxQMS8Wvlw==
X-Received: by 2002:a05:6402:524c:b0:647:9380:103c with SMTP id 4fb4d7f45d1cf-65097df5672mr17321412a12.13.1768213166248;
        Mon, 12 Jan 2026 02:19:26 -0800 (PST)
Message-ID: <c0b36217-9620-46c3-8bb1-f21afefe72e1@gmail.com>
Date: Mon, 12 Jan 2026 11:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/15] xen/riscv: implement
 arch_vcpu_{create,destroy}()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <be49a360ad584edf5fd9891e5f4534a2c2586048.1766595589.git.oleksii.kurochko@gmail.com>
 <2e7ab738-6b5d-4ac4-a46b-1eef1cd09fb1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2e7ab738-6b5d-4ac4-a46b-1eef1cd09fb1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/6/26 4:56 PM, Jan Beulich wrote:
> (some or even all of the comments may also apply to present Arm code)
>
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/domain.c
>> @@ -0,0 +1,56 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/mm.h>
>> +#include <xen/sched.h>
>> +
>> +static void continue_new_vcpu(struct vcpu *prev)
>> +{
>> +    BUG_ON("unimplemented\n");
>> +}
>> +
>> +int arch_vcpu_create(struct vcpu *v)
>> +{
>> +    int rc = 0;
>> +
>> +    BUILD_BUG_ON(sizeof(struct cpu_info) > STACK_SIZE);
> I fear you're in trouble also when == or when only a few bytes are left on
> the stack. IOW I'm unconvinced that this is a useful check to have.
>
>> +    v->arch.stack = alloc_xenheap_pages(STACK_ORDER, MEMF_node(vcpu_to_node(v)));
>> +    if ( !v->arch.stack )
>> +        return -ENOMEM;
> You don't really need contiguous memory, do you? In which case why not
> vmalloc()? This would then also use the larger domheap.

There is really no need for contiguous memory, and|vmalloc()| could be used.
I expect that|vmalloc()| is more expensive and may make hardware prefetching less
effective, with more TLB pressure since it allocates 4 KB pages.
However, the latter two points do not really matter in this case, as only a
single 4 KB page is allocated, so we are unlikely to see any performance issues.

>
>> +    v->arch.cpu_info = (struct cpu_info *)(v->arch.stack
>> +                                           + STACK_SIZE
>> +                                           - sizeof(struct cpu_info));
> Why the cast?

Just for readability, from compiler point of view it could be just dropped.

>
>> +    memset(v->arch.cpu_info, 0, sizeof(*v->arch.cpu_info));
>> +
>> +    v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
>> +    v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
>> +
>> +    printk("Create vCPU with sp=%#lx, pc=%#lx, cpu_info(%#lx)\n",
>> +           v->arch.xen_saved_context.sp, v->arch.xen_saved_context.ra,
>> +           (unsigned long)v->arch.cpu_info);
> Please don't, as this is going to get pretty noisy. (And if this wanted
> keeping, use %p for pointers rather than casting to unsigned long.)

I didn’t consider the case where a large number of vCPUs are created, as
I have only tested with 2 vCPUs. However, if the number of vCPUs is large,
this could indeed get quite noisy.
I will keep these lines of code in downstream for debugging purposes and
drop them from upstream version of this patch.

>> --- a/xen/arch/riscv/include/asm/current.h
>> +++ b/xen/arch/riscv/include/asm/current.h
>> @@ -21,6 +21,12 @@ struct pcpu_info {
>>   /* tp points to one of these */
>>   extern struct pcpu_info pcpu_info[NR_CPUS];
>>   
>> +/* Per-VCPU state that lives at the top of the stack */
>> +struct cpu_info {
>> +    /* This should be the first member. */
>> +    struct cpu_user_regs guest_cpu_user_regs;
>> +};
> You may want to enforce what the comment says by way of a BUILD_BUG_ON().

Makes sense, I will add:
   BUILD_BUG_ON(offsetof(struct cpu_info, guest_cpu_user_regs) != 0);
in|arch_vcpu_create()|, somewhere around the initialization of|v->arch.cpu_info = ... . |I noticed that there is no|BUILD_BUG_ON()| variant that can be used outside
of a function, or does such a variant exist and I’m just missing it? Or there
is no such sense at all for such variant?

>
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -49,6 +49,9 @@ struct arch_vcpu
>>           register_t ra;
>>       } xen_saved_context;
>>   
>> +    struct cpu_info *cpu_info;
>> +    void *stack;
> Do you really need both fields, when one is derived from the other?

No, I don't need. I think we can just keep cpu_info and it would be 
enough. Thanks. ~ Oleksii


