Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51B383F6D0
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jan 2024 17:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672845.1046940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rU7pe-0003TO-1H; Sun, 28 Jan 2024 16:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672845.1046940; Sun, 28 Jan 2024 16:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rU7pd-0003RK-Uf; Sun, 28 Jan 2024 16:16:29 +0000
Received: by outflank-mailman (input) for mailman id 672845;
 Sun, 28 Jan 2024 16:16:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YmAu=JG=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rU7pd-0003RE-6Y
 for xen-devel@lists.xenproject.org; Sun, 28 Jan 2024 16:16:29 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 947f7bc9-bdf8-11ee-98f5-efadbce2ee36;
 Sun, 28 Jan 2024 17:16:26 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33ae4eb360aso1010324f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jan 2024 08:16:23 -0800 (PST)
Received: from [192.168.69.100] (sev93-h02-176-184-17-196.dsl.sta.abo.bbox.fr.
 [176.184.17.196]) by smtp.gmail.com with ESMTPSA id
 ch19-20020a5d5d13000000b00337b47ae539sm5942414wrb.42.2024.01.28.08.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Jan 2024 08:16:22 -0800 (PST)
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
X-Inumbo-ID: 947f7bc9-bdf8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706458583; x=1707063383; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNQ1mZG/MGqiJb02NhZJ31w2Qw5Q82nN33CYLr2cWWo=;
        b=peTGCsuuxDb1/2EDyfpHFza4zWWbTlhQQ+AJerBuQjarwlAJY8Fqyswg73PD0rGgYi
         LBD7adncJa800njXZovG1d2qBbsHVPCgF8p6K0cFJzw0LBy6789fR5c7WFdE+UzlTKd0
         BJ4kmwnL1sDk9CTsgXV3ojS/w3YZZIH1LsFBhcHSigYOTT1FulXWwoBLGRaIADLC+5MW
         gRkkurI9SkbYOIWgaWrpo6tSMXgQ/SlKBEsf3xmQkLDAabx46TcxHoiSEGSmdP7e3Omj
         GxYu7GUlW1D/kRT1LlD/7ztJiz4Hw0kZujx9XqVBp3T2x1KSe7bp3IPqlogJzB3w35VP
         mZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706458583; x=1707063383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNQ1mZG/MGqiJb02NhZJ31w2Qw5Q82nN33CYLr2cWWo=;
        b=PmYllwbVYUycD/t5LMje2XbLrR3lHCqwitDHfTJy4hXe/608hTkJZIFuc7V8str+RS
         OLRQRorW9IuuEVCJpqjzxHjqMIMsvrFwmLB7OhSKNH4Y0X2a2BNLehiKJblGiJUaIsjq
         wAIeYWpbqCmHUprYWXOCmmqXb/+AKE2zivnPMP1MRVnJESqGbUiO2RqYo++wBST1bzz3
         h9uVE41c9iOwBmlNDvLojwZ/+IHDbWQLtPZnGjDvj2E7MRZ7+EnCaSSwvdBQSX1pIScC
         usDv/tzAioEdrMs97JunGEI2IO2XvrMD1IJotzTt4yiUZSO6Y2HwPe1rLY7YSId8UI1K
         wH3g==
X-Gm-Message-State: AOJu0Yw+Vx1jTyepnjuzuz1DJev3eZjo/dqxC8MBJn3wgO6+PEi+FXZ2
	EHkFm+pHzzfCuqCL7qP2zHSYGuHkVuLC0yNWpaoYnxbREp6l59k8FRqxn62wkRw=
X-Google-Smtp-Source: AGHT+IEZiXHH6VkkxIr4855VrA6mlwRi5ZK5DAlf4ThQoy+yRYfRVJ2hAzogGQOYO0OnwUHdVFeDqg==
X-Received: by 2002:a5d:604c:0:b0:33a:e5e5:163c with SMTP id j12-20020a5d604c000000b0033ae5e5163cmr1763182wrt.71.1706458583105;
        Sun, 28 Jan 2024 08:16:23 -0800 (PST)
Message-ID: <d7c11962-07c0-4c26-83e1-8b0a3d1e43d0@linaro.org>
Date: Sun, 28 Jan 2024 17:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/23] target/i386: Prefer fast cpu_env() over slower
 CPU QOM cast macro
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <20240126220407.95022-1-philmd@linaro.org>
 <20240126220407.95022-11-philmd@linaro.org> <ZbT1R7impEw4whqP@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ZbT1R7impEw4whqP@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/1/24 13:21, Zhao Liu wrote:
> Hi Philippe,
> 
> On Fri, Jan 26, 2024 at 11:03:52PM +0100, Philippe Mathieu-Daudé wrote:
>> Date: Fri, 26 Jan 2024 23:03:52 +0100
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: [PATCH v2 10/23] target/i386: Prefer fast cpu_env() over slower
>>   CPU QOM cast macro
>> X-Mailer: git-send-email 2.41.0
>>
>> Mechanical patch produced running the command documented
>> in scripts/coccinelle/cpu_env.cocci_template header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/i386/hvf/vmx.h               | 13 +++-------
>>   hw/i386/vmmouse.c                   |  6 ++---
>>   hw/i386/xen/xen-hvm.c               |  3 +--
>>   target/i386/arch_memory_mapping.c   |  3 +--
>>   target/i386/cpu-dump.c              |  3 +--
>>   target/i386/cpu.c                   | 37 +++++++++------------------
>>   target/i386/helper.c                | 39 ++++++++---------------------
>>   target/i386/hvf/hvf.c               |  8 ++----
>>   target/i386/hvf/x86.c               |  4 +--
>>   target/i386/hvf/x86_emu.c           |  6 ++---
>>   target/i386/hvf/x86_task.c          | 10 +++-----
>>   target/i386/hvf/x86hvf.c            |  6 ++---
>>   target/i386/kvm/kvm.c               |  6 ++---
>>   target/i386/kvm/xen-emu.c           | 32 ++++++++---------------
>>   target/i386/tcg/sysemu/bpt_helper.c |  3 +--
>>   target/i386/tcg/tcg-cpu.c           | 14 +++--------
>>   target/i386/tcg/user/excp_helper.c  |  3 +--
>>   target/i386/tcg/user/seg_helper.c   |  3 +--
>>   18 files changed, 59 insertions(+), 140 deletions(-)
>>
> 
> [snip]
> 
>> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
>> index 3b1ef5f49a..1e7fd587fe 100644
>> --- a/target/i386/hvf/x86hvf.c
>> +++ b/target/i386/hvf/x86hvf.c
>> @@ -238,8 +238,7 @@ void hvf_get_msrs(CPUState *cs)
>>   
>>   int hvf_put_registers(CPUState *cs)
>>   {
>> -    X86CPU *x86cpu = X86_CPU(cs);
>> -    CPUX86State *env = &x86cpu->env;
>> +    CPUX86State *env = cpu_env(cs);
>>   
>>       wreg(cs->accel->fd, HV_X86_RAX, env->regs[R_EAX]);
>>       wreg(cs->accel->fd, HV_X86_RBX, env->regs[R_EBX]);
>> @@ -282,8 +281,7 @@ int hvf_put_registers(CPUState *cs)
>>   
>>   int hvf_get_registers(CPUState *cs)
>>   {
>> -    X86CPU *x86cpu = X86_CPU(cs);
>> -    CPUX86State *env = &x86cpu->env;
>> +    CPUX86State *env = cpu_env(cs);
>>   
>>       env->regs[R_EAX] = rreg(cs->accel->fd, HV_X86_RAX);
>>       env->regs[R_EBX] = rreg(cs->accel->fd, HV_X86_RBX);
> 
> In this file, there's another corner case:
> 
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index 3b1ef5f49a8a..9a145aa5aa4f 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -342,8 +342,7 @@ void vmx_clear_int_window_exiting(CPUState *cs)
> 
>   bool hvf_inject_interrupts(CPUState *cs)
>   {
> -    X86CPU *x86cpu = X86_CPU(cs);
> -    CPUX86State *env = &x86cpu->env;
> +    CPUX86State *env = cpu_env(cs);
> 
>       uint8_t vector;
>       uint64_t intr_type;
> @@ -408,7 +407,7 @@ bool hvf_inject_interrupts(CPUState *cs)
>       if (!(env->hflags & HF_INHIBIT_IRQ_MASK) &&
>           (cs->interrupt_request & CPU_INTERRUPT_HARD) &&
>           (env->eflags & IF_MASK) && !(info & VMCS_INTR_VALID)) {
> -        int line = cpu_get_pic_interrupt(&x86cpu->env);
> +        int line = cpu_get_pic_interrupt(env);
>           cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
>           if (line >= 0) {
>               wvmcs(cs->accel->fd, VMCS_ENTRY_INTR_INFO, line |
> 
> 
> For this special case, I'm not sure if the script can cover it as well,
> otherwise maybe it's OK to be cleaned up manually ;-).

BTW I forgot to mention I had to skip target/i386/tcg/translate.c
(7100 LoC) because it is too complex for Coccinelle.

