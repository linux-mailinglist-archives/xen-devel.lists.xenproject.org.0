Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H9KMfc7sWmAswIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 10:55:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3500026164C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 10:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250942.1548275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0GHD-0004Mf-IZ; Wed, 11 Mar 2026 09:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250942.1548275; Wed, 11 Mar 2026 09:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0GHD-0004KI-FR; Wed, 11 Mar 2026 09:54:51 +0000
Received: by outflank-mailman (input) for mailman id 1250942;
 Wed, 11 Mar 2026 09:54:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ae2Q=BL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w0GHB-0004KC-Sl
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 09:54:50 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 566cc743-1d30-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 10:54:47 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-485409ab264so5572585e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 02:54:47 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854a18ddedsm40124975e9.0.2026.03.11.02.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 02:54:45 -0700 (PDT)
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
X-Inumbo-ID: 566cc743-1d30-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773222887; x=1773827687; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+RAOTjCwTLNedTNd0e/9yvXBzGGNZlJbi2KI22185o=;
        b=fVm/C5JLhU53g+B3dEIv7mFroL/Ys+AoMkcfS/MzuRCLNUZCuItQofvDufTsXX4k8e
         hEtRcAV2LQgz2ml/gq5GtezusVXRlztBFjdthitGX2J7dJgAalo7HudnUIq5fVK8x8wv
         CCZwV3KiRjbn8WIthTQiBuw2U3iTsxm76jfaBhNETEoVoeIvpTt22y9VPNoiMyd5yNia
         LAkuR7Mg97+XD0SYf7+NuBagEdSYSHE+fL8dSVG4cz7BZSlms5XQC74ABYHW5wBm4NgN
         /qhK7hYQqge3OrYNwfHA2iaif17nrfvh0mikxVAov5xm8Y6s5o5k6Uw8Rad3tN3QY2kj
         pV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222887; x=1773827687;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+RAOTjCwTLNedTNd0e/9yvXBzGGNZlJbi2KI22185o=;
        b=DyVrZz/NLXgy1DYxEA8ZWwVBNoFr0MhD8MJ2BZKY0y1KS4IcoMUb9C4dwMPwJgOZTK
         8R9IDit0Vt5aNqje7dFek3eEaQ+asUJukwtuLoiW0PQ4dkphkR6ulnP8sTrgBcrDIdKk
         1hHke+haTblF1ZRBV0oIs6cU3QP6kN1BkMGZeFCuaxMHQW463Xu5CP3bhP0A8OwpoSbY
         KMCo/tC/ZH5e7VjCDGNU5AyQKymRzLcYWTpAWSbPUjopIa/Htx7OnYLUBa12L9TFxZbh
         I7uvWZ6LhHejZrgeiOYzDYyuvrNrmdohhW8T8n6OVmeAd7M9HQmJzLk7in3akINUVOHR
         KAQw==
X-Forwarded-Encrypted: i=1; AJvYcCUdLr71MVzrgo7djn8AM84/GmbRnbJysnGTqxiN9uyvmysB4NkQkiG047mNQdATO5qD/fVq+iqZlYA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywp6aTvxQFG9tY/9vGFhn5yxqjYf93HuSL7xhmS4Zz/XXdeEcFP
	TAlZXGGc/yz1M5V/eCL6FWZetK9xh1t8Y6rPvJ8xegzviA9VLRvfAsp2VBVi5t1r
X-Gm-Gg: ATEYQzzG3h7QptOuoJqpHBS3LUhF0C92TXb3Qtxjk2TB9GDrcbDIHJhpL2llIwgF5iF
	mEWxoIkdnpCA31mKwA9ZXDx4P9FUeplBmEXNKGm3F86HnCZ6L4cFZPhwxbU8Uf0Zaig0pcbtgmz
	XiIYjkoifCYk3AjBa1jxBvDV5dMNk5SDm874Wltu/Ri51qh1RjS7dHVZs+7w4Hkrn5U/3KQdVUf
	Opr0+HAxSa/HVU/8MEW4U/QV8Hjc4BFlTBEJMAJHLyn5vvjNtSTwa0E4WXRfuFEe+KvXxhEt6sE
	D4pD0b9ujaCV1VM1G8jSxl4J1ND/m2CRwbmioywRXdZl3c24YldkDxmOhCAatYytT1TakmG+DeO
	/RitAZT6sMmSqJgEpkDlqv5UhWHwSldNsJmqaB2MNr3UXOdl4WqibB8OPrt7hoyqxAV8CtaOMHl
	7Z8hUSddEBEUAEy+N4U0rIGXVjj0eBwGmsn7lEW6qn8JKQpohMaP56vtwFOoxQ9xHV1dfhdcg2V
	BY=
X-Received: by 2002:a05:600c:a46:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4854b25ab04mr25355385e9.8.1773222886218;
        Wed, 11 Mar 2026 02:54:46 -0700 (PDT)
Message-ID: <e0a891c4-3283-4e1b-81e4-f2b4bb62b5fa@gmail.com>
Date: Wed, 11 Mar 2026 10:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v7 14/14] xen/riscv: Disable SSTC extension and add
 trap-based CSR probing
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
 <f7b30c80eabd3ba371a0d541e3be023314ec37fd.1772814110.git.oleksii.kurochko@gmail.com>
 <9ff93ad1-0151-4f37-a6c2-f7dd4197ca84@suse.com>
Content-Language: en-US
In-Reply-To: <9ff93ad1-0151-4f37-a6c2-f7dd4197ca84@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3500026164C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,cardoe.com,kernel.org,wdc.com,gmail.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action


On 3/10/26 10:15 AM, Jan Beulich wrote:
> On 06.03.2026 17:33, Oleksii Kurochko wrote:
>> Some RISC-V platforms expose the SSTC extension, but its CSRs are not
>> properly saved and restored by Xen. Using SSTC in Xen could therefore
>> lead to unexpected behaviour.
> And what's wrong with (or what gets in the way of) adding proper
> saving/restoring? Also, wouldn't a guest use vstimecmp anyway? I.e. what
> saving/restoring are you talking about here?
>
>> To avoid this in QEMU, disable SSTC by passing "sstc=off". On real
>> hardware, OpenSBI does not provide a mechanism to disable SSTC via the
>> DTS (riscv,isa or similar property), as it does not rely on that
>> property to determine extension availability. Instead, it directly
>> probes the CSR_STIMECMP register.
>>
>> Introduce struct trap_info together with the do_expected_trap() handler
>> to safely probe CSRs. The helper csr_read_allowed() attempts to read a
>> CSR while catching traps, allowing Xen to detect whether the register
>> is accessible. This mechanism is used at boot to verify SSTC support and
>> panic if the CSR is not available.
>>
>> The trap handling infrastructure may also be reused for other cases
>> where controlled trap handling is required (e.g. probing instructions
>> such as HLV*).
> Hmm, won't you need a more generic way of dealing with traps anyway? See
> Linux'es _ASM_EXTABLE(). See also comments further down.

At the moment this approach works for me and I haven't had a need for more
generic approach. I will look at _ASM_EXTABLE(). I haven't checked yet but
I assume it will require some extra fixup code in trap handler what looks
like over complication for the current case, at least.

>> --- a/automation/scripts/qemu-smoke-riscv64.sh
>> +++ b/automation/scripts/qemu-smoke-riscv64.sh
>> @@ -7,7 +7,7 @@ rm -f smoke.serial
>>   
>>   export TEST_CMD="qemu-system-riscv64 \
>>       -M virt,aia=aplic-imsic \
>> -    -cpu rv64,svpbmt=on \
>> +    -cpu rv64,svpbmt=on,sstc=off \
>>       -smp 1 \
>>       -nographic \
>>       -m 2g \
> How does this fit with you panic()ing when SSTC isn't available (i.e. the
> register cannot be read)? I must be missing something, likely a result of
> me not being able to really understand the description.

When SSTC isn't available my panic() won't occur and then will continue to
be executed. Otherwise, when SSTC is enabled (it is enabled by QEMU by default)
my panic will occur.

>> --- a/xen/arch/riscv/cpufeature.c
>> +++ b/xen/arch/riscv/cpufeature.c
>> @@ -17,6 +17,8 @@
>>   #include <xen/sections.h>
>>   
>>   #include <asm/cpufeature.h>
>> +#include <asm/csr.h>
>> +#include <asm/traps.h>
>>   
>>   #ifdef CONFIG_ACPI
>>   # error "cpufeature.c functions should be updated to support ACPI"
>> @@ -483,6 +485,7 @@ void __init riscv_fill_hwcap(void)
>>       unsigned int i;
>>       const size_t req_extns_amount = ARRAY_SIZE(required_extensions);
>>       bool all_extns_available = true;
>> +    struct trap_info trap;
>>   
>>       riscv_fill_hwcap_from_isa_string();
>>   
>> @@ -509,4 +512,9 @@ void __init riscv_fill_hwcap(void)
>>       if ( !all_extns_available )
>>           panic("Look why the extensions above are needed in "
>>                 "https://xenbits.xenproject.org/docs/unstable/misc/riscv/booting.txt\n");
>> +
>> +    csr_read_allowed(CSR_STIMECMP, (unsigned long)&trap);
> Please avoid such casts; see also below.
>
>> --- a/xen/arch/riscv/entry.S
>> +++ b/xen/arch/riscv/entry.S
>> @@ -99,3 +99,27 @@ restore_registers:
>>   
>>           sret
>>   END(handle_trap)
>> +
>> +        /*
>> +         * We assume that the faulting instruction is 4 bytes long and blindly
>> +         * increment SEPC by 4.
>> +         *
>> +         * This should be safe because all places that may trigger this handler
>> +         * use ".option norvc" around the instruction that could cause the trap,
>> +         * or the instruction is not available in the RVC instruction set.
>> +         *
>> +         * do_expected_trap(a3, a4):
>> +         *   a3 <- pointer to struct trap_info
>> +         *   a4 <- temporary register
>> +         */
>> +FUNC(do_expected_trap)
>> +        csrr    a4, CSR_SEPC
>> +        REG_S   a4, RISCV_TRAP_SEPC(a3)
>> +        csrr    a4, CSR_SCAUSE
>> +        REG_S   a4, RISCV_TRAP_SCAUSE(a3)
>> +
>> +        csrr    a4, CSR_SEPC
> Why read sepc a 2nd time?

Because a4 was changed, so it should be re-read, but we can setup CSR_SEPC before a4
being changed.


> Yet further, what's the point of storing the value
> in the first place? The sole present user doesn't care.

I needed that initially for debug. And also it would be useful for trap redirection
for example, but it isn't a case now. So for now I can drop that.

>> --- a/xen/arch/riscv/include/asm/csr.h
>> +++ b/xen/arch/riscv/include/asm/csr.h
>> @@ -9,6 +9,7 @@
>>   #include <asm/asm.h>
>>   #include <xen/const.h>
>>   #include <asm/riscv_encoding.h>
>> +#include <asm/traps.h>
>>   
>>   #ifndef __ASSEMBLER__
>>   
>> @@ -78,6 +79,37 @@
>>                              : "memory" );                        \
>>   })
>>   
>> +/*
>> + * Some functions inside asm/system.h requires some of the macros above,
>> + * so this header should be included after the macros above are introduced.
>> + */
>> +#include <asm/system.h>
>> +
>> +#define csr_read_allowed(csr_num, trap) \
>> +({ \
>> +    register unsigned long tinfo asm("a3") = (unsigned long)trap; \
> Why can't this variable be of the correct (pointer) type? This would then
> at the same time serve as a compile-time check for the caller to have
> passed an argument of the correct type.

Good point it could be an option.

>> +    register unsigned long ttmp asm("a4"); \
>> +    register unsigned long stvec = (unsigned long)&do_expected_trap; \
> Fiddling with stvec may be okay-ish very early during boot. NMIs, for
> example, do exist in principle on RISC-V, aiui. There must be a way for them
> to be dealt with by other than just M-mode.

Do I understand correct that your concern is about that if NMIs will be handled
in HS-mode that switching stvec in this way could be dangerous as do_expected_trap()
doesn't know how to handle NMIs?

If yes, then NMIs should be handled by M-mode as:
   Non-maskable interrupts (NMIs) are only used for hardware error conditions, and
   cause an immediate jump to an implementation-defined NMI vector running in M-mode
   regardless of the state of a hart’s interrupt enable bits
and:
   The non-maskable interrupt is not made visible via the mip register as its
   presence is implicitly known when executing the NMI trap handler.

So standard delegation registers like mideleg do not apply to NMIs because NMIs
are not visible in the mip register.

I haven't found in OpenSBI how they are explicitly handling NMIs, but it looks
like if they happen in (H)S-mode or (V)U-mode then they will be just redirected
to (H)S-mode or V(U)-mode:
   https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_trap.c#L361
And then do_expected_trap() will fail to handle them...

Interesting that other hypervisors are using the similar approarch (with temporary
updating of stvec) and they haven't faced such issue with NMIs yet...

>
>> +    register unsigned long ret = 0; \
>> +    unsigned long flags; \
>> +    ((struct trap_info *)(trap))->scause = 0; \
> "trap" would better be of the correct type. Don't use casts like this, please.
>
> Further, wouldn't you better set the field to a guaranteed invalid value? 0 is
> CAUSE_MISALIGNED_FETCH, after all.

I don't see that such an invalid value exist for scause. I think we have to reserved
a value from region 24-31 or 48-63 as they are designated for custom use.


>
>> +    local_irq_save(flags); \
>> +    asm volatile ( \
>> +        ".option push\n" \
>> +        ".option norvc\n" \
> Shouldn't this come later?

Do you mean before where SSTC csr is really tried to be read ("csrr %[ret], %[csr]\n")?
Does it really matter in such small inline assembler?

>
>> +        "add %[ttmp], %[tinfo], zero\n" \
> Why "add", when you really mean "mv"?

I think it could be "mv".

> And why set ttmp in the first place, when
> that's what do_expected_trap() writes to?

To force the compiler to materialize tinfo in register a4 (ttmp) before the
trap handler runs as handler will use a4 as temporary register.

>   Don't you really mean to specify "a4"
> as a clobber?

Good point. It makes sense. Likely it can updated to:
   ...
   mv a4, %[tinfo] ... : ... : ... : "memory", "a4"

>
>> +        "csrrw %[stvec], " STR(CSR_STVEC) ", %[stvec]\n" \
> The assembler does understand "stvec" as an operand, doesn't it?

I haven't tried... I'll check that.

>
>> +        "csrr %[ret], %[csr]\n" \
>> +        "csrw " STR(CSR_STVEC) ", %[stvec]\n" \
>> +        ".option pop" \
>> +        : [stvec] "+&r" (stvec), [tinfo] "+&r" (tinfo), \
> tinfo isn't modified, is it?

It is modified by handler.

>
>> +          [ttmp] "+&r" (ttmp), [ret] "=&r" (ret) \
> ttmp isn't initialized (in C), so the compiler could legitimately complain
> about the use of an uninitialized variable here (due to the use of + where
> = is meant).

ttmp is modified by handler too.

>
> Whereas for ret the situation is the other way around - you initialize the
> variable, just to then tell the compiler that it can drop this
> initialization, as - supposedly - the asm() always sets it (which it doesn't
> when the csrr faults).

It was done in that way as when csrr will lead to a fault, handler will jump
over the csrr instruction and so ret won't be set at all. For that case it was
set to 0.

>
>> +        : [csr] "i" (csr_num) \
>> +        : "memory" ); \
>> +    local_irq_restore(flags); \
>> +    ret; \
>> +})
> A macro of this name would better return an indicator of what it is checking,
> rather than the CSR value (which the sole user of this macro doesn't even
> care about).

With the current one use case it doesn't care but generally I think that someone
will want to use this macro just to get CSR value. I don't have a speicifc example
but still it could be used in this way.

> Ideally such would also be an inline function.

I thought about that but I had difficulties with csr* instruction and their second
operand which expects to have immediate. But if I will have inline function that
csr_num will be in register.

Thanks.

~ Oleksii


