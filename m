Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PP+GXlUsWlHtwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 12:39:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB16263028
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 12:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251043.1548346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Htg-00030r-8c; Wed, 11 Mar 2026 11:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251043.1548346; Wed, 11 Mar 2026 11:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Htg-0002yu-4z; Wed, 11 Mar 2026 11:38:40 +0000
Received: by outflank-mailman (input) for mailman id 1251043;
 Wed, 11 Mar 2026 11:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ae2Q=BL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w0Hte-0002ym-38
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 11:38:38 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d732a5f6-1d3e-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 12:38:36 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4853c3c2fe7so20510725e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 04:38:36 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b0dcf2asm25150185e9.8.2026.03.11.04.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 04:38:34 -0700 (PDT)
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
X-Inumbo-ID: d732a5f6-1d3e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773229116; x=1773833916; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTMhN/XBLRhbVc49obxdvF8PZceTAcH/NBbJ45h94Rc=;
        b=TZc2pQtc8SXI8Q6iN3Ov0BqoImT+gjx8lwmF84NgRHlzLqP3C62sUz0De8Z/8dE+7q
         RVmuo2RemGg/olpAnyHRZHlV9NvluPDTpE8j+pwglXMIWN+4rxmvKukM4I3dpu6s5bbH
         TRIyGAk2OODTfFOPh46zdjkZphF7q/Y/xTiWwdtNGCkviQlrs5CF5s45OfQtWJMmmyph
         4+sPJl/AUYegREVHq0OlQyeaCVl1mwTNvxse6XPV0yEqtFTK4j9J49sjPHb0UGEzSWnz
         CgRI43tv+i3VA5PDp1uj/BfzOVDU4kw5f+E3vMFoNbnZ/I0j0e9H0SY649hIau04THBs
         o6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229116; x=1773833916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTMhN/XBLRhbVc49obxdvF8PZceTAcH/NBbJ45h94Rc=;
        b=bVKL8vWstJUi6ucPscAm3koAIPuk3F3CF1iRykVH9Z19BKtqcFvRZwoOz+Z4W6U6Rh
         Za7OpFaBm24oOdC17eNrr3/cWTWlV66rZa7FirJ6JZrFpgZ4pu/ESwiJPA8IEhCiIat6
         Tn7EbtAetwe4Snj1EoYKGCw76IMiSzFKnKjpSAnyXu65fyD1QYjGTK1P8rlbmGBN5mFa
         LTNEKitljbxdzdH5Uw67/Fm8Shl7iZpuT6WHqfVYPyaSoczvlx5JRzEH4eGC0oeASPSe
         8B3a94UXD2ybeXoWWnY64FAABFBZNFExJ8JW36PKIKESJsS4AeMtNHpr9GcBkeKlhejg
         lG2w==
X-Forwarded-Encrypted: i=1; AJvYcCVSm5GZiyDh2uKGv8sY7Dwf4SumlbvQIkSIgQn6uEyUDYTA+5pJRQTa3RW31exFPwEV976E8yfXqjE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpYgH9Kb9NusfjRCcblVdBfuuItpgKK29WN7x5tdER1dNA2Mio
	qWY1TgE7g1v90mIm2VuSXV1qE/TMf8e691Wgbxq5T3ckSlap6OH/0PiG
X-Gm-Gg: ATEYQzxmvNFA43iUMrnCmFsIfM23STcMMWoawN7kKtFcm0egEc+urQrrZCMvU3aydTo
	a4Xzq32WcnFqHWsVJWtp4yY5fpZ0rLtefwnCPeLVDk1QA3vX8+CfpKemZyv00Nj8zMEQJ/G4F6b
	Nsvl+ecygbm5ce6xscGFec4Fqx9ZZh0mjYZym1pje0FDFCUEj/F8Ymoai/2tu/XiacygGJx+Sgg
	puole6LyXVBn4yvSo7xABaguRARQbtwWnc1Ao6z+tGks7FKipGa31NA3tkpNN8AI1BYADhS3UjD
	IfWtds9LcKTxR+5u4Ua9xrGmzBBQuGYzt43aHj2kVpWjcMxcxeU67Qb9cjV15Y+SixJOf3C+NeS
	AMB5Fj4i1NNx6SZZrGh6QPF0dXo91A9Qn1gVMGz4UMGMQ5eTBmenKJY3gxZ4UnqmCAby318168A
	ng9V0YwhWFR4n3yvc4R400yA47oTtSF/4eoXE6OocXe6KQrcqad3e7hMCgOLI1lFkKn6hQl9x7i
	tY=
X-Received: by 2002:a05:600c:8710:b0:485:3f72:3230 with SMTP id 5b1f17b1804b1-4854b0d2917mr35612335e9.15.1773229115406;
        Wed, 11 Mar 2026 04:38:35 -0700 (PDT)
Message-ID: <87eb8fb1-aa50-436c-8e2e-050981af4d1b@gmail.com>
Date: Wed, 11 Mar 2026 12:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <e0a891c4-3283-4e1b-81e4-f2b4bb62b5fa@gmail.com>
 <2e471f54-1885-4615-8a23-c33ce683158f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2e471f54-1885-4615-8a23-c33ce683158f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BCB16263028
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
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


On 3/11/26 11:58 AM, Jan Beulich wrote:
> On 11.03.2026 10:54, Oleksii Kurochko wrote:
>> On 3/10/26 10:15 AM, Jan Beulich wrote:
>>> On 06.03.2026 17:33, Oleksii Kurochko wrote:
>>>> --- a/automation/scripts/qemu-smoke-riscv64.sh
>>>> +++ b/automation/scripts/qemu-smoke-riscv64.sh
>>>> @@ -7,7 +7,7 @@ rm -f smoke.serial
>>>>    
>>>>    export TEST_CMD="qemu-system-riscv64 \
>>>>        -M virt,aia=aplic-imsic \
>>>> -    -cpu rv64,svpbmt=on \
>>>> +    -cpu rv64,svpbmt=on,sstc=off \
>>>>        -smp 1 \
>>>>        -nographic \
>>>>        -m 2g \
>>> How does this fit with you panic()ing when SSTC isn't available (i.e. the
>>> register cannot be read)? I must be missing something, likely a result of
>>> me not being able to really understand the description.
>> When SSTC isn't available my panic() won't occur and then will continue to
>> be executed. Otherwise, when SSTC is enabled (it is enabled by QEMU by default)
>> my panic will occur.
> Oh, I notice I misread the condition around the panic(), mainly because of
> the misleading / ambiguous message passed to it: "SSTC isn't supported\n"
> can mean unsupported by Xen or unsupported by the platform.
>
> Anyway, to me this is entirely bogus: Why would we panic() because there is
> a certain extension available?

It is bogus because then we need also add support of SSTC for a guest what isn't
done now thereby if it is detected that SSTC is available that it is dangerous
to continue about full support (guest part) of it.

I thought about the case to let Xen use SSTC and just don't tell Linux that SSTC
is available by dropping from riscv,isa property the mentioning of SSTC, so then
Linux will still continue to use SBI set timer call to Xen and the will just
safely reprogram (if it is needed) a timer using SSTC instructions. But if to do
in this way still nothing will prevent a guest to test if SSTC is available by
reading CSR_STIMECMP and nothing will prevent to access CSR_VSTIMECMP by guest
what could also lead to some misleading behavior.
Likely we could set henvcfg.STCE to zero and it will forbid guest to access SSTC
registers but I am not sure that we really want such behavior when Xen is using
SSTC to setup a timer, but guest isn't allowed. It seems it will be better just
support SSTC extension fully and not to support it only for now.

>
>>>> --- a/xen/arch/riscv/include/asm/csr.h
>>>> +++ b/xen/arch/riscv/include/asm/csr.h
>>>> @@ -9,6 +9,7 @@
>>>>    #include <asm/asm.h>
>>>>    #include <xen/const.h>
>>>>    #include <asm/riscv_encoding.h>
>>>> +#include <asm/traps.h>
>>>>    
>>>>    #ifndef __ASSEMBLER__
>>>>    
>>>> @@ -78,6 +79,37 @@
>>>>                               : "memory" );                        \
>>>>    })
>>>>    
>>>> +/*
>>>> + * Some functions inside asm/system.h requires some of the macros above,
>>>> + * so this header should be included after the macros above are introduced.
>>>> + */
>>>> +#include <asm/system.h>
>>>> +
>>>> +#define csr_read_allowed(csr_num, trap) \
>>>> +({ \
>>>> +    register unsigned long tinfo asm("a3") = (unsigned long)trap; \
>>> Why can't this variable be of the correct (pointer) type? This would then
>>> at the same time serve as a compile-time check for the caller to have
>>> passed an argument of the correct type.
>> Good point it could be an option.
>>
>>>> +    register unsigned long ttmp asm("a4"); \
>>>> +    register unsigned long stvec = (unsigned long)&do_expected_trap; \
>>> Fiddling with stvec may be okay-ish very early during boot. NMIs, for
>>> example, do exist in principle on RISC-V, aiui. There must be a way for them
>>> to be dealt with by other than just M-mode.
>> Do I understand correct that your concern is about that if NMIs will be handled
>> in HS-mode that switching stvec in this way could be dangerous as do_expected_trap()
>> doesn't know how to handle NMIs?
> Yes.
>
>> If yes, then NMIs should be handled by M-mode as:
>>     Non-maskable interrupts (NMIs) are only used for hardware error conditions, and
>>     cause an immediate jump to an implementation-defined NMI vector running in M-mode
>>     regardless of the state of a hart’s interrupt enable bits
>> and:
>>     The non-maskable interrupt is not made visible via the mip register as its
>>     presence is implicitly known when executing the NMI trap handler.
>>
>> So standard delegation registers like mideleg do not apply to NMIs because NMIs
>> are not visible in the mip register.
>>
>> I haven't found in OpenSBI how they are explicitly handling NMIs, but it looks
>> like if they happen in (H)S-mode or (V)U-mode then they will be just redirected
>> to (H)S-mode or V(U)-mode:
>>     https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_trap.c#L361
>> And then do_expected_trap() will fail to handle them...
>>
>> Interesting that other hypervisors are using the similar approarch (with temporary
>> updating of stvec) and they haven't faced such issue with NMIs yet...
> Well, NMIs may be rare to occur? And hence very unlikely to occur in this small
> a window?

It is still sound risky and ASM_EXTABLE approach sounds more safe particular in this
case.

>
>>>> +    register unsigned long ret = 0; \
>>>> +    unsigned long flags; \
>>>> +    ((struct trap_info *)(trap))->scause = 0; \
>>> "trap" would better be of the correct type. Don't use casts like this, please.
>>>
>>> Further, wouldn't you better set the field to a guaranteed invalid value? 0 is
>>> CAUSE_MISALIGNED_FETCH, after all.
>> I don't see that such an invalid value exist for scause. I think we have to reserved
>> a value from region 24-31 or 48-63 as they are designated for custom use.
> Not sure that's possible. "Custom use" may mean "custom" from hw perspective.
> I was rather thinking of picking something pretty high in the reserved range,
> like (1 << (MXLEN-1)) - 1 or 1 << (MXLEN-2).

Agree, it could be an option.

>
>>>> +    local_irq_save(flags); \
>>>> +    asm volatile ( \
>>>> +        ".option push\n" \
>>>> +        ".option norvc\n" \
>>> Shouldn't this come later?
>> Do you mean before where SSTC csr is really tried to be read ("csrr %[ret], %[csr]\n")?
> Yes.
>
>> Does it really matter in such small inline assembler?
> Yes, if nothing else then to not raise questions. Plus (depending on the
> specific operands used), the ADD (MV) could e.g. be representable by a C insn.
>
>>> And why set ttmp in the first place, when
>>> that's what do_expected_trap() writes to?
>> To force the compiler to materialize tinfo in register a4 (ttmp) before the
>> trap handler runs as handler will use a4 as temporary register.
> ??? I don't understand what you mean with "materialize".

Mean forcing the compiler to load the variable into the specific hardware
register (a4) before the potentially trapping instruction executes, so the
trap handler can safely use that register.

>
>>>> +        "csrr %[ret], %[csr]\n" \
>>>> +        "csrw " STR(CSR_STVEC) ", %[stvec]\n" \
>>>> +        ".option pop" \
>>>> +        : [stvec] "+&r" (stvec), [tinfo] "+&r" (tinfo), \
>>> tinfo isn't modified, is it?
>> It is modified by handler.
> Where? It's only used as the address of the two stores.

There are to updates of tinfo in the do_expected_trap():

FUNC(do_expected_trap)
         ...
         REG_S   a4, RISCV_TRAP_SEPC(a3)
         ...
         REG_S   a4, RISCV_TRAP_SCAUSE(a3)
         ...
END(do_expected_trap)


>
>>>> +          [ttmp] "+&r" (ttmp), [ret] "=&r" (ret) \
>>> ttmp isn't initialized (in C), so the compiler could legitimately complain
>>> about the use of an uninitialized variable here (due to the use of + where
>>> = is meant).
>> ttmp is modified by handler too.
> Of course, but just to repeat - you mean "=&r" there.
>
>>> Whereas for ret the situation is the other way around - you initialize the
>>> variable, just to then tell the compiler that it can drop this
>>> initialization, as - supposedly - the asm() always sets it (which it doesn't
>>> when the csrr faults).
>> It was done in that way as when csrr will lead to a fault, handler will jump
>> over the csrr instruction and so ret won't be set at all. For that case it was
>> set to 0.
> And again - this is meaningless if the constraint is "=&r".

Make sense...

>
>>>> +        : [csr] "i" (csr_num) \
>>>> +        : "memory" ); \
>>>> +    local_irq_restore(flags); \
>>>> +    ret; \
>>>> +})
>>> A macro of this name would better return an indicator of what it is checking,
>>> rather than the CSR value (which the sole user of this macro doesn't even
>>> care about).
>> With the current one use case it doesn't care but generally I think that someone
>> will want to use this macro just to get CSR value. I don't have a speicifc example
>> but still it could be used in this way.
> Well, if you want to keep it doing so, make the name match what it does (and
> in particular what it returns).
>
>>> Ideally such would also be an inline function.
>> I thought about that but I had difficulties with csr* instruction and their second
>> operand which expects to have immediate. But if I will have inline function that
>> csr_num will be in register.
> Only if the function wouldn't be inlined, I expect? Which hence you may need
> to force, by using always_inline.

It could work.

Thanks.

~ Oleksii


