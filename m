Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBEDB30287
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 20:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089203.1446854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upAVK-0004w9-VS; Thu, 21 Aug 2025 18:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089203.1446854; Thu, 21 Aug 2025 18:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upAVK-0004tt-SI; Thu, 21 Aug 2025 18:59:18 +0000
Received: by outflank-mailman (input) for mailman id 1089203;
 Thu, 21 Aug 2025 18:59:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1upAVJ-0004tg-QR
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 18:59:17 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef070a53-7ec0-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 20:59:15 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b9e411c820so875168f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 11:59:15 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c0771c1a12sm12330607f8f.34.2025.08.21.11.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 11:59:14 -0700 (PDT)
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
X-Inumbo-ID: ef070a53-7ec0-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755802755; x=1756407555; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3tuiRnKSy2Dzo7kRbhkh8BsaXVSlMYN8qP+iZe3KkTQ=;
        b=SZ5VPjtRgA0/W0GsMLy9UA1fkgqZT9e3HzxV85iFoQ9BegnVEqvubyS8rn3/i7MRVc
         jrD0AqimDduXrJLevChx4yoxQTTNyZmsu2HaNAyCnhQoldNbji3Wx3yqlXUazlWPMYml
         fadEKtMAc2p+02hloXjA0NColmhfYLuN4n6+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755802755; x=1756407555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tuiRnKSy2Dzo7kRbhkh8BsaXVSlMYN8qP+iZe3KkTQ=;
        b=Aq6BSFzlpqteGesutCFlwPKSE1hTwIIFGpH2xFMTXjfZRkMJB4DaG5NWQNF4Q1GtRn
         vd4uCGK+jybDGtR59u11PeEXTuRlqYEVXDr5kSZXwGKiUQr8p7cvRqqlD0BkVXxwvz42
         JxRE7gKOvlkRwQ3HjItaeVswjLndrfpe59DiNQ5eFPWeVks63vXL/CO2q9Lop6of4Nph
         v8vQd459fW8g/JZzNoiOfv9Krts5M0N10JLb/wpfsAXx1fiYn8Tez+7Dn+050s2hlOhC
         JKpJnGpZH4QpoZ6Fcey2k1JHyqQdQOn/BwUpsIK9P3Rl0M/ChNzoBt3i6X+EQOuqrvX7
         Rdnw==
X-Forwarded-Encrypted: i=1; AJvYcCW6Feku2bu+w1t31wLHMstsD8oJmaaxF4CRrCk0gXPfYDTICcCwea82J45l27q+VKO42KthGC1u/1g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLvdMwWf6zz7mhG215phXt7gn7jH2HUm7Sos497GxGb/4G1lRT
	WFXVJ4X3ShZYB3vUG9Ek6egpyAL/9b5mcwlsp85j70JSQPC9yg+zkJUo7Z3wUeG8oV4=
X-Gm-Gg: ASbGnctlrqNyNPW8RnjH2QHioGYe/BRrgxQsMKKbIT50rW7YeWYen8droixSC/sNWWg
	yHOhhpEQLrRpfK4KEA9vI2qRsF1lRWjHmj6Qjpz71TR7PiU8hk/xKDDiWVOtSyk3MsNbqRtxQFC
	B76D8jetvUsUiXxmv6v+MUnAy4hLvbb8Xc1CfMU8OokoM4aiePjk+t/5cj9wp+DkVm9O3O+lAPu
	+tVaSd+UCpncN4prvKfddGSk+71Ld2FiLuNZ2uFNFs72PwuzofuSFq3KCU2dKVsCVMWQ3vjw/7w
	Pdac/FGIb6NvWkycZMgbwmOnU7hRSC2HT0Go36iPu74hkLiaamntrlphLi6afMBkiQiqasuhepP
	Y7r+6X9F3C0+WuY9HkA9iAIafcyRV4ZTiG6TK/aB3Y0pCnEOYO1Zni6xqIf/S9fK7Pw4zT2xpZc
	epW48=
X-Google-Smtp-Source: AGHT+IHtcwMCORvJOVGr6ksPewwPcvE740ftCSMTgZbIh+/nAGCtuyqUNYHlgV4CgYUDexwRQSQajA==
X-Received: by 2002:a05:6000:2384:b0:3b7:942c:5450 with SMTP id ffacd0b85a97d-3c5db8ab0a2mr62198f8f.9.1755802755031;
        Thu, 21 Aug 2025 11:59:15 -0700 (PDT)
Message-ID: <92abee8e-108a-4d2f-8f05-fb9397b64fca@citrix.com>
Date: Thu, 21 Aug 2025 19:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] x86/msr: Use MSR_IMM when available
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-14-andrew.cooper3@citrix.com>
 <3b367c39-4c4a-4bdd-91cd-7cb8ba18c2c9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3b367c39-4c4a-4bdd-91cd-7cb8ba18c2c9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/08/2025 1:55 pm, Jan Beulich wrote:
> On 15.08.2025 22:41, Andrew Cooper wrote:
>> Most MSR accesses have compile time constant indexes.  By using the immediate
>> form when available, the decoder can start issuing uops directly for the
>> relevant MSR, rather than having to issue uops to implement "switch (%ecx)".
>> Modern CPUs have tens of thousands of MSRs, so that's quite an if/else chain.
>>
>> Create __{rdmsr,wrmsrns}_imm() helpers and use them from {rdmsr,wrmsrns}()
>> when the compiler can determine that the msr index is known at compile time.
>>
>> At the instruction level, the combined ABI is awkward.  Explain our choices in
>> detail.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> The expression wrmsrns(MSR_STAR, rdmsr(MSR_STAR)) now yields:
>>
>>   <test_star>:
>>       b9 81 00 00 c0          mov    $0xc0000081,%ecx
>>       0f 32                   rdmsr
>>       48 c1 e2 20             shl    $0x20,%rdx
>>       48 09 d0                or     %rdx,%rax
>>       48 89 c2                mov    %rax,%rdx
>>       48 c1 ea 20             shr    $0x20,%rdx
>>       2e 0f 30                cs wrmsr
>>       e9 a3 84 e8 ff          jmp    ffff82d040204260 <__x86_return_thunk>
>>
>> which is as good as we can manage.  The alternative form of this looks like:
>>
>>   <test_star>:
>>       b9 81 00 00 c0          mov    $0xc0000081,%ecx
>>       c4 e7 7b f6 c0 81 00    rdmsr  $0xc0000081,%rax
>>       00 c0
>>       2e c4 e7 7a f6 c0 81    cs wrmsrns %rax,$0xc0000081
>>       00 00 c0
>>       e9 xx xx xx xx          jmp    ffff82d040204260 <__x86_return_thunk>
>>
>> Still TBD.  We ought to update the *_safe() forms too.  rdmsr_safe() is easier
>> because the potential #GP locations line up, but there need to be two variants
>> because of
> Because of ...?

Oh.  I guess I didn't finish that.  Because of asm goto with outputs.

The WRMSR side is harder because there are two different fault locations.

>
>> --- a/xen/arch/x86/include/asm/alternative.h
>> +++ b/xen/arch/x86/include/asm/alternative.h
>> @@ -151,6 +151,13 @@ extern void alternative_instructions(void);
>>          ALTERNATIVE(oldinstr, newinstr, feature)                        \
>>          :: input )
>>  
>> +#define alternative_input_2(oldinstr, newinstr1, feature1,              \
>> +                            newinstr2, feature2, input...)              \
>> +    asm_inline volatile (                                               \
>> +        ALTERNATIVE_2(oldinstr, newinstr1, feature1,                    \
>> +                      newinstr2, feature2)                              \
>> +        :: input )
>> +
>>  /* Like alternative_input, but with a single output argument */
>>  #define alternative_io(oldinstr, newinstr, feature, output, input...)   \
>>      asm_inline volatile (                                               \
>> diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
>> index 1bd27b989a4d..2ceff6cca8bb 100644
>> --- a/xen/arch/x86/include/asm/msr.h
>> +++ b/xen/arch/x86/include/asm/msr.h
>> @@ -29,10 +29,52 @@
>>   *  wrmsrl(MSR_FOO, val);
>>   */
>>  
>> -static inline uint64_t rdmsr(unsigned int msr)
>> +/*
>> + * RDMSR with a compile-time constant index, when available.  Falls back to
>> + * plain RDMSR.
>> + */
>> +static always_inline uint64_t __rdmsr_imm(uint32_t msr)
>> +{
>> +    uint64_t val;
>> +
>> +    /*
>> +     * For best performance, RDMSR $msr, %r64 is recommended.  For
>> +     * compatibility, we need to fall back to plain RDMSR.
>> +     *
>> +     * The combined ABI is awkward, because RDMSR $imm produces an r64,
>> +     * whereas WRMSR{,NS} produces a split edx:eax pair.
>> +     *
>> +     * Always use RDMSR $imm, %rax, because it has the most in common with the
>> +     * legacy form.  When MSR_IMM isn't available, emit logic to fold %edx
>> +     * back into %rax.
>> +     *
>> +     * Let the compiler do %ecx setup.  This does mean there's a useless `mov
>> +     * $imm, %ecx` in the instruction stream in the MSR_IMM case, but it means
>> +     * the compiler can de-duplicate the setup in the common case of reading
>> +     * and writing the same MSR.
>> +     */
>> +    alternative_io(
>> +        "rdmsr\n\t"
>> +        "shl $32, %%rdx\n\t"
>> +        "or %%rdx, %%rax\n\t",
>> +
>> +        /* RDMSR $msr, %rax */
>> +        ".byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]", X86_FEATURE_MSR_IMM,
>> +
>> +        "=a" (val),
> Strictly speaking "=&a". Not that it matters much here; just to not
> set a bad precedent.

Why?  A is not written to until after all inputs are consumed.

I don't see how it can qualify for being early-clobber.

>
>> @@ -55,11 +97,51 @@ static inline void wrmsr(unsigned int msr, uint64_t val)
>>  }
>>  #define wrmsrl(msr, val) wrmsr(msr, val)
>>  
>> +/*
>> + * Non-serialising WRMSR with a compile-time constant index, when available.
>> + * Falls back to plain WRMSRNS, or to a serialising WRMSR.
>> + */
>> +static always_inline void __wrmsrns_imm(uint32_t msr, uint64_t val)
>> +{
>> +    /*
>> +     * For best performance, WRMSRNS %r64, $msr is recommended.  For
>> +     * compatibility, we need to fall back to plain WRMSRNS, or to WRMSR.
>> +     *
>> +     * The combined ABI is awkward, because WRMSRNS $imm takes a single r64,
>> +     * whereas WRMSR{,NS} takes a split edx:eax pair.
>> +     *
>> +     * Always use WRMSRNS %rax, $imm, because it has the most in common with
>> +     * the legacy forms.  When MSR_IMM isn't available, emit setup logic for
>> +     * %edx.
>> +     *
>> +     * Let the compiler do %ecx setup.  This does mean there's a useless `mov
>> +     * $imm, %ecx` in the instruction stream in the MSR_IMM case, but it means
>> +     * the compiler can de-duplicate the setup in the common case of reading
>> +     * and writing the same MSR.
>> +     */
>> +    alternative_input_2(
>> +        "mov %%rax, %%rdx\n\t"
>> +        "shr $32, %%rdx\n\t"
>> +        ".byte 0x2e; wrmsr",
>> +
>> +        /* CS WRMSRNS %rax, $msr */
>> +        ".byte 0x2e,0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]", X86_FEATURE_MSR_IMM,
>> +
>> +        "mov %%rax, %%rdx\n\t"
>> +        "shr $32, %%rdx\n\t"
>> +        ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
> Isn't this the wrong way round for hardware which has both features? The
> last active alternative wins, iirc.

Bah - fooled once again by the nop optimisation.  I'll reorder.

But, we really should swap the order.  Especially now that you've
inserted serialisation, it's an expensive waste of time patching the
same site multiple times.

~Andrew

