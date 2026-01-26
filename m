Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDogIJU2d2nhdAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 10:40:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5A4861E5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 10:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213433.1523907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJ4M-0002Uw-DG; Mon, 26 Jan 2026 09:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213433.1523907; Mon, 26 Jan 2026 09:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJ4M-0002TT-A4; Mon, 26 Jan 2026 09:39:38 +0000
Received: by outflank-mailman (input) for mailman id 1213433;
 Mon, 26 Jan 2026 09:39:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zrcg=77=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vkJ4K-0002TN-JR
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 09:39:36 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e79e43e5-fa9a-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 10:39:26 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4801d1daf53so47074725e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 01:39:26 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d8a5b2dsm281554265e9.9.2026.01.26.01.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 01:39:25 -0800 (PST)
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
X-Inumbo-ID: e79e43e5-fa9a-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769420366; x=1770025166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydSZiIt/GlLMYi1NrS1QCfMnBHYe/z17fCtuAwY3Xcs=;
        b=A2yi2NtWZzYVdWAWVQm92a0noNWV6iYbYgRrkmsCFHaTkACRqBCcXoLvz7v4OIIrAv
         Y7ShZT8+PblSjH7V3oJMqo0CkV9+pCxpXHuhbyBuF7ggdFZzKLCbCLQMHvmQ2RR3G+ua
         n18ruMovNZDB69hoEz8l8AYQLNP9vy+A3mHAod+PP9nVmZgJj7sB7uc5QCML1lZfNLVY
         U7DxwNycH4kD4vJmuopDc5TRSvux/vlKX231VEVFbJAwGvFs5+PoNTvlsvlAbNszNes7
         3OYCA3M2eMoXrND7cB5Wur/JP20fvGyGGeMv4iQwEzkgTRTCMWjyJqEV4weOD/u5cbJT
         UKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769420366; x=1770025166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydSZiIt/GlLMYi1NrS1QCfMnBHYe/z17fCtuAwY3Xcs=;
        b=SkMHt+NqVGGraWOUpojHG7cNDo43ms4GRlxD29r0+OYo4/GrOhTcJ0uV8CSmLoOs3a
         Wa5xS1RQ8XResbftYOz3Htg3pzZKWT579ngZeMwd58XzE3A7ZMJVba+E9a6Ddyd/8BGk
         PYmJkwmNOhgReDXXKin18q66rq3MMmxRxPBfF43Fv0WcTae6S0yM/dYtYR9xTIp5lVc8
         yjDtp+VklA5nGdu5BH7Grxqq9g9r8WfZixMM65TjLQ93HvcEyoVDcee0oEPxKp6KjQch
         pilHO/+Eyw1fLNjrRwc7YCg15h7PbGxQNAuq6q3LIiegx+/d7yZ9OGBL0UR8yxG7fp1h
         0tew==
X-Forwarded-Encrypted: i=1; AJvYcCXgtD/iVvjMW825A1gTcoLGlsgFsf4Cd8ncdeq62GkM2IvjfvWk4ufxC4XWXnkXGjqFCJ7zUT81+no=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yylr/eqGFOowsz7ZwhXNijVKNOe9J7ByeueDXnePFiuTMrLEdNm
	9YPAXrbRdiHgI0DC9iDekCBpZTauFUliJLv0f4VUw0Jw8Yxss1yZkVPb
X-Gm-Gg: AZuq6aJX4jVS9yg9XX88HPX0ifeuBq5IieZIM0Zs3wq3UjpX+z6pt9lZeEdEBTlSwq3
	JqiH8l7JnNRfHMPON1v65N5QNdWAZT+LzRutGtS728OxBz1kjaruiVdhbk3XB3R57JUHKvoZWCb
	AAURwsqAUp1h8EPPFwjwJesNx+rDDl7U4mmnfJXrkTQOCpz1rYMBfe8scg21SdSNOh5yHuTDLWL
	zXtsnP2T1Og3cWTrBEPV+fj92yIR/dAVqQ1IiKvBnQ4kt+nF9m9gX4BL1tlxs1RWYy0+UBEwK2A
	kLvbRiWQau4KDmwufMepnQEHIYxVxLBnZUjJbAx/g0o+eR652vHD3edewBh/3uxYzMgCfpmech0
	P4qPIwoNX5PRZw5h7iQ9d5OER4zE9idCcW10oN4Fb56c9S/otRI7E9Q66fjxjfdxgnbxHi8Hpfl
	BzdqQtYQQwqbgV+4hAg+0lh83ispUBw27fwB7pS5oGV6Ck1wA4m/OlN2rI2ebrDQs=
X-Received: by 2002:a05:600c:1d06:b0:47d:6140:3284 with SMTP id 5b1f17b1804b1-4805d06cd4fmr45401595e9.37.1769420365887;
        Mon, 26 Jan 2026 01:39:25 -0800 (PST)
Message-ID: <a21a534a-ae23-4326-90a0-e9185936fefc@gmail.com>
Date: Mon, 26 Jan 2026 10:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] xen/riscv: implement vcpu_csr_init()
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
 <57ef3bcff854d4b50641641d300b3e8aa715c3c3.1769099885.git.oleksii.kurochko@gmail.com>
 <99289a63-b4be-42f8-974b-7445a6a479dc@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <99289a63-b4be-42f8-974b-7445a6a479dc@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DE5A4861E5
X-Rspamd-Action: no action


On 1/24/26 11:44 PM, Teddy Astie wrote:
> Le 22/01/2026 à 17:49, Oleksii Kurochko a écrit :
>> Introduce vcpu_csr_init() to set up the initial hypervisor-visible CSR
>> state for a vCPU before it is first scheduled.
> To me, "hypervisor-visible CSR state" sounds like some state of the
> guest the hypervisor has view on. But to what I read, it's more
> hypervisor state CSRs regarding what to intercept and various
> virtualization behavior.

I'll rephrase then to:
Introduce vcpu_csr_init() to initialise hypervisor CSRs that control
vCPU execution and virtualization behaviour before the vCPU is first
scheduled.


>
>> The function configures trap and interrupt delegation to VS-mode by
>> setting the appropriate bits in the hedeleg and hideleg registers,
>> initializes hstatus so that execution enters VS-mode when control is
>> passed to the guest, and restricts guest access to hardware performance
>> counters by initializing hcounteren, as unrestricted access would
>> require additional handling in Xen.
>> When the Smstateen and SSAIA extensions are available, access to AIA
>> CSRs and IMSIC guest interrupt files is enabled by setting the
>> corresponding bits in hstateen0, avoiding unnecessary traps into Xen
>> (note that SVSLCT(Supervisor Virtual Select) name is used intead of
>> CSRIND as OpenSBI uses such name and riscv_encoding.h is mostly based
>> on it).
>> If the Svpbmt extension is supported, the PBMTE bit is set in
>> henvcfg to allow its use for VS-stage address translation. Guest
>> access to the ENVCFG CSR is also enabled by setting ENVCFG bit in
>> hstateen0, as a guest may need to control certain characteristics of
>> the U-mode (VU-mode when V=1) execution environment.
>>
>> For CSRs that may contain read-only bits (e.g. hedeleg, hideleg,
>> hstateen0), the written value is re-read from hardware and cached in
>> vcpu->arch to avoid divergence between the software state and the actual
>> CSR contents.
>>
> AFAIU from RISC-V isa document, at least for some CSRs the read-only-0
> bits are well-defined and means "can't be configured" due to not having
> a meaning (e.g hedeleg defines as read-only "Environment call from
> HS-mode" because guest can't be in a "actual" HS-mode).

It was said about bits which hypervisor tries to set in the mentioned
registers and IIRC all of them could be r/o-0  as, for example, M-mode
can decide not to delegate them to HS-mode.

>
>> As hstatus is not part of struct arch_vcpu (it already resides in
>> struct cpu_user_regs), introduce vcpu_guest_cpu_user_regs() to provide
>> a uniform way to access hstatus and other guest CPU user registers.
>>
>> This establishes a consistent and well-defined initial CSR state for
>> vCPUs prior to their first context switch.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>    - As hstatus isn't a part of arch_vcpu structure (as it is already a part of
>>      cpu_user_regs) introduce vcpu_guest_cpu_user_regs() to be able to access
>>      hstatus and other CPU user regs.
> Sounds like hstatus wants to be splitted from guest_cpu_user_regs (which
> are supposed to be GPR ?).

Generally, agree. But hstatus want to be saved during a trap even before guest
is started and considering that we already have the code which stores it in
guest_cpu_user_regs structure and handle it during the trap, I've decided just
to drop hstatus from arch_vcpu.


>
>>    - Sort hideleg bit setting by value. Drop a stray blank.
>>    - Drop | when the first initialization of hcounteren and hennvcfg happen.
>>    - Introduce HEDELEG_DEFAULT. Sort set bits by value and use BIT() macros
>>      instead of open-coding it.
>>    - Apply pattern csr_write() -> csr_read() for hedeleg and hideleg instead
>>      of direct bit setting in v->arch.h{i,e}deleg as it could be that for some
>>      reason some bits of hedeleg and hideleg are r/o.
>>      The similar patter is used for hstateen0 as some of the bits could be r/o.
>>    - Add check that SSAIA is avaialable before setting of SMSTATEEN0_AIA |
>>      SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT bits.
>>    - Drop local variables hstatus, hideleg and hedeleg as they aren't used
>>      anymore.
>> ---
>>    xen/arch/riscv/cpufeature.c                 |  1 +
>>    xen/arch/riscv/domain.c                     | 73 +++++++++++++++++++++
>>    xen/arch/riscv/include/asm/cpufeature.h     |  1 +
>>    xen/arch/riscv/include/asm/current.h        |  2 +
>>    xen/arch/riscv/include/asm/riscv_encoding.h |  2 +
>>    5 files changed, 79 insertions(+)
>>
>> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
>> index 02b68aeaa49f..03e27b037be0 100644
>> --- a/xen/arch/riscv/cpufeature.c
>> +++ b/xen/arch/riscv/cpufeature.c
>> @@ -137,6 +137,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>>        RISCV_ISA_EXT_DATA(zbb),
>>        RISCV_ISA_EXT_DATA(zbs),
>>        RISCV_ISA_EXT_DATA(smaia),
>> +    RISCV_ISA_EXT_DATA(smstateen),
>>        RISCV_ISA_EXT_DATA(ssaia),
>>        RISCV_ISA_EXT_DATA(svade),
>>        RISCV_ISA_EXT_DATA(svpbmt),
>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>> index 9c546267881b..3ae5fa3a8805 100644
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -5,6 +5,77 @@
>>    #include <xen/sched.h>
>>    #include <xen/vmap.h>
>>    
>> +#include <asm/cpufeature.h>
>> +#include <asm/csr.h>
>> +#include <asm/riscv_encoding.h>
>> +
>> +#define HEDELEG_DEFAULT (BIT(CAUSE_MISALIGNED_FETCH, U) | \
>> +                         BIT(CAUSE_FETCH_ACCESS, U) | \
>> +                         BIT(CAUSE_ILLEGAL_INSTRUCTION, U) | \
>> +                         BIT(CAUSE_BREAKPOINT, U) | \
>> +                         BIT(CAUSE_MISALIGNED_LOAD, U) | \
>> +                         BIT(CAUSE_LOAD_ACCESS, U) | \
>> +                         BIT(CAUSE_MISALIGNED_STORE, U) | \
>> +                         BIT(CAUSE_STORE_ACCESS, U) | \
>> +                         BIT(CAUSE_USER_ECALL, U) | \
>> +                         BIT(CAUSE_FETCH_PAGE_FAULT, U) | \
>> +                         BIT(CAUSE_LOAD_PAGE_FAULT, U) | \
>> +                         BIT(CAUSE_STORE_PAGE_FAULT, U))
>> +
>> +#define HIDELEG_DEFAULT (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
>> +
>> +static void vcpu_csr_init(struct vcpu *v)
>> +{
>> +    register_t hstateen0;
>> +
>> +    csr_write(CSR_HEDELEG, HEDELEG_DEFAULT);
>> +    v->arch.hedeleg = csr_read(CSR_HEDELEG);
>> +
>> +    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
>> +
>> +    csr_write(CSR_HIDELEG, HIDELEG_DEFAULT);
>> +    v->arch.hideleg = csr_read(CSR_HIDELEG);
>> +
> To me, that feels odd to set machine CSR here. Especially if (I guess)
> that we would update them anyway during context switches.

Yes, they will be updated anyway.

When this approach was initially suggested, I considered the case where
some code might attempt to use these bits before the context-switch logic
runs. In that situation, we could end up executing code that assumes the
feature is available (because the bit is set in|v->arch.some_reg|), only
to later discover that the corresponding CSR bit is read-only zero.

>
> I think it would be better to have :
> - vcpu_csr_init -> sets initial state CSR in vcpu structure, doesn't
> touch machine CSR
> - context switching logic -> loads vcpu-specific machine CSR from vcpu
> structure
>
> We would have to make a context switch to enter the vcpu for the first
> time; but that's to be expected.
>
> With my proposal, we would also want to move the vcpu_csr_init()
> invocation to the place we initialize the vcpu_arch structure rather
> than the first time we schedule inside that vcpu.

I think I may be misunderstanding something here. vcpu_csr_init() is now
called from arch_vcpu_create(), which initialises architecture-specific
arch_vcpu fields. Am I missing something?


>
> That would also allow to take account of per-domain configuration if we
> need to (e.g feature flags).

Thanks.

~ Oleksii


