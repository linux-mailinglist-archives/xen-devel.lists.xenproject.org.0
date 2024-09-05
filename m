Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4006796DC45
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 16:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791140.1200927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smDkA-0006pq-Up; Thu, 05 Sep 2024 14:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791140.1200927; Thu, 05 Sep 2024 14:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smDkA-0006no-SB; Thu, 05 Sep 2024 14:45:54 +0000
Received: by outflank-mailman (input) for mailman id 791140;
 Thu, 05 Sep 2024 14:45:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smDk8-0006n8-MU
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 14:45:52 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b8de73f-6b95-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 16:45:50 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53653ee23adso772089e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 07:45:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc54fc91sm1369788a12.35.2024.09.05.07.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 07:45:49 -0700 (PDT)
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
X-Inumbo-ID: 8b8de73f-6b95-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725547550; x=1726152350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CmWYrcWd06RRIPqYMzRA1KB6RL20uriseSyHIcGi7XM=;
        b=cQ7nR+ARWMe3qxZozx10Om7m4dn0GiF16NSX3dYmWOuMc4AivRiL6X0TSbvmIHaR11
         FSZjQrmTWLFnw2/fbvo4buN+48/8FlaSQgyMwD0D+rd6eqLY+7rwX1oodG1JTAZlJ/D4
         qxUkz9lUmGM2VuLR0BvStGjWPtdOnt01F6EksPp1v1eGDcdBGqzJmjcTuPtAMq3C4jfD
         FjzxVTV35Xygwunxv70R5TV6DISm7NDLZYgnd9B7qLdYDoL7yAhcUqgPbl70EiiYDmZr
         rJH5K8b7Q7lVb+s/SEX+SiwE/VjcjGOwReQsdpoxYljDehk3q61xXyTAGPajuSeIWMzd
         1R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725547550; x=1726152350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmWYrcWd06RRIPqYMzRA1KB6RL20uriseSyHIcGi7XM=;
        b=qiSc5/dKbIB4gV33P6FBPd/tbynZSmDmjqJDAo9WdqF35PV+PsshCFT5xYuT1oN84j
         XKoU6DBW+P4qfQNqHJ6DWvx3OCiwWKkjRoayCfOOlnKfv+iDhl5uRBV4oTx3pLkfSvKy
         Bc+WkdjOR4VtBsj1X0FjnUAYeiDU1UadAuTwA1GuiYWTYorEoElUxjhZ4LC0pev0JYJq
         OqBH7B4BPD4nq+7VSNUVQGGfh/ndfzLY/oWzCUNcCMtSOhmR39eZXAKXheSuyldFHKBd
         sBijrEf6zSSKJuyAgHG/8TNpZhnoVgtQWFK8KqpZkx2aQr88NColjzT0PAXaoX2LMT/t
         T6oA==
X-Forwarded-Encrypted: i=1; AJvYcCXbVPQW7dujX/T+i43HA9UQHMamQ7NxpGvdAynUTlCXATRciHXHsaANeDVHgCPNRY0LfWNQ5FTiKRw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSw9/bWGf1dJVfld1nzRKWs2Wcq48YB2I+PslKAJsKjtiGTJO5
	y0NYm6a+ckbK1FVEVMZYaZkde9fFctj6jmn9FM1DB6UpoY8TIDxR4685zyEXhA==
X-Google-Smtp-Source: AGHT+IGa2X8dDdFAev6Fxj5KMrDNIdbesqogZdjT2gm2pbEpXAYBdZaZnxqmvNnu/cXVyASLPGd8sQ==
X-Received: by 2002:a05:6512:68c:b0:52c:d76f:7f61 with SMTP id 2adb3069b0e04-53546bb4d04mr11150930e87.56.1725547549927;
        Thu, 05 Sep 2024 07:45:49 -0700 (PDT)
Message-ID: <afc0c048-8975-4162-85e0-9c16809e13a8@suse.com>
Date: Thu, 5 Sep 2024 16:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] x86emul: support LKGS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
 <257099d1-2632-47b9-bfb6-2d3fc44b0f21@suse.com>
 <dbf3506c-30fa-4c75-aa87-fd6697e5fba0@citrix.com>
Content-Language: en-US
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
In-Reply-To: <dbf3506c-30fa-4c75-aa87-fd6697e5fba0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2024 16:24, Andrew Cooper wrote:
> On 04/09/2024 1:28 pm, Jan Beulich wrote:
>> ---
>> Instead of ->read_segment() we could of course also use ->read_msr() to
>> fetch the original GS base. I don't think I can see a clear advantage of
>> either approach; the way it's done it matches how we handle SWAPGS.
> 
> It turns out this is littered with broken corners.  See below.

I'm afraid it hasn't become clear to me which of your further comments
are the "broken corners".

>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>> @@ -693,6 +719,20 @@ static int read_msr(
>>          *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
>>          return X86EMUL_OKAY;
>>  
>> +#ifdef __x86_64__
>> +    case 0xc0000101: /* GS_BASE */
> 
> It's only just occurred to me, but given x86-defns.h, isn't msr-index.h
> suitably usable too ?

We are doing so already. Just not in this function. And since there
were hex numbers with comments here, I (blindly) added more. I'll submit
a cleanup patch to change the pre-existing ones, and I've already
switched over this and further patches to use the named constants
instead.

>> @@ -1335,6 +1400,41 @@ int main(int argc, char **argv)
>>          printf("%u bytes read - ", bytes_read);
>>          goto fail;
>>      }
>> +    printf("okay\n");
>> +
>> +    emulops.write_segment = write_segment;
>> +    emulops.write_msr     = write_msr;
>> +
>> +    printf("%-40s", "Testing swapgs...");
>> +    instr[0] = 0x0f; instr[1] = 0x01; instr[2] = 0xf8;
>> +    regs.eip = (unsigned long)&instr[0];
>> +    gs_base = 0xffffeeeecccc8888UL;
>> +    gs_base_shadow = 0x0000111122224444UL;
>> +    rc = x86_emulate(&ctxt, &emulops);
>> +    if ( (rc != X86EMUL_OKAY) ||
>> +         (regs.eip != (unsigned long)&instr[3]) ||
>> +         (gs_base != 0x0000111122224444UL) ||
>> +         (gs_base_shadow != 0xffffeeeecccc8888UL) )
>> +        goto fail;
>> +    printf("okay\n");
>> +
>> +    printf("%-40s", "Testing lkgs 2(%rdx)...");
>> +    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x00; instr[3] = 0x72; instr[4] = 0x02;
>> +    regs.eip = (unsigned long)&instr[0];
>> +    regs.edx = (unsigned long)res;
>> +    res[0]   = 0x00004444;
>> +    res[1]   = 0x8888cccc;
>> +    i = cp.extd.nscb; cp.extd.nscb = true; /* for AMD */
>> +    rc = x86_emulate(&ctxt, &emulops);
>> +    if ( (rc != X86EMUL_OKAY) ||
>> +         (regs.eip != (unsigned long)&instr[5]) ||
>> +         (gs_base != 0x0000111122224444UL) ||
>> +         gs_base_shadow )
>> +        goto fail;
>> +
>> +    cp.extd.nscb = i;
> 
> I think I acked the patches to rename this?
> 
> I'd suggest putting those in now, rather than creating more (re)work later.

That was sitting on top, and I was kind of hoping that I could avoid the
re-basing ahead. But I've meanwhile done so, including the committing of
the result, as you've probably seen.

>> --- a/xen/arch/x86/x86_emulate/decode.c
>> +++ b/xen/arch/x86/x86_emulate/decode.c
>> @@ -743,8 +743,12 @@ decode_twobyte(struct x86_emulate_state
>>          case 0:
>>              s->desc |= DstMem | SrcImplicit | Mov;
>>              break;
>> +        case 6:
>> +            if ( !(s->modrm_reg & 1) && mode_64bit() )
>> +            {
>>          case 2: case 4:
>> -            s->desc |= SrcMem16;
>> +                s->desc |= SrcMem16;
>> +            }
> 
> Well - not something I was expecting, but I've just had to go and find
> the Itanium instruction manuals...
> 
> Do we really need this complexity?  JMPE is a decoding wrinkle of
> Itanium processors, which I think we can reasonably ignore.
> 
> IMO we should treat Grp6 as uniformly Reg/Mem16, and rely on the
> !mode_64bit() to exclude the encodings commonly used as JMPE.

We already handle modrm_reg 0 and 1 differently. I'm not convinced of
making 7 match 6 without need. We can't predict what Intel will put
there - JMPE (which I'm not really concerned about here, and which
the logic being added also doesn't exclude) already didn't match the
reg/mem16 pattern.

>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -2870,8 +2870,35 @@ x86_emulate(
>>                  break;
>>              }
>>              break;
>> -        default:
>> -            generate_exception_if(true, X86_EXC_UD);
>> +        case 6: /* lkgs */
>> +            generate_exception_if((modrm_reg & 1) || vex.pfx != vex_f2,
>> +                                  X86_EXC_UD);
>> +            generate_exception_if(!mode_64bit() || !mode_ring0(), X86_EXC_UD);
>> +            vcpu_must_have(lkgs);
>> +            fail_if(!ops->read_segment || !ops->read_msr ||
>> +                    !ops->write_segment || !ops->write_msr);
>> +            if ( (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
>> +                                     ctxt)) != X86EMUL_OKAY ||
>> +                 (rc = ops->read_segment(x86_seg_gs, &sreg,
>> +                                         ctxt)) != X86EMUL_OKAY )
>> +                goto done;
>> +            dst.orig_val = sreg.base; /* Preserve full GS Base. */
>> +            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
>> +                                         ctxt, ops)) != X86EMUL_OKAY ||
>> +                 /* Write (32-bit) base into SHADOW_GS. */
>> +                 (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
> 
> The comment says 32-bit, but that's the full base, isn't it?

The function writes the full base, but what we retrieved via
protmode_load_seg() is only 32 bits wide. Hence the parenthesization
in the comment. I can add e.g. "zero-extended" if you think that makes
things more clear?

>> +                                      ctxt)) != X86EMUL_OKAY )
>> +                goto done;
>> +            sreg.base = dst.orig_val; /* Reinstate full GS Base. */
>> +            if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
>> +                                          ctxt)) != X86EMUL_OKAY )
>> +            {
>> +                /* Best effort unwind (i.e. no real error checking). */
>> +                if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
>> +                                    ctxt) == X86EMUL_EXCEPTION )
>> +                    x86_emul_reset_event(ctxt);
>> +                goto done;
>> +            }
> 
> Do we need all of this?
> 
> Either protmode_load_seg() fails and there's nothing to unwind, or
> write_msr() fails and we only have to unwind GS.
> 
> I think?

Since you say "all" I can only assume you mean both the write_segment()
and the write_msr(). We need the former, as we replaced the segment
base if protmode_load_seg() succeeded. It's only the write_msr() which
is debatable, yet as indicated that matches SWAPGS handling. I'd like
to keep the two as similar as possible.

> This is actually a good example of where pipeline microcode has a much
> easier time than we do.  Inside the pipeline, there's no such thing as
> "can't store to gs & GS_KERN once the checks are done".

Indeed.

> Although it does make me wonder.  Would LKGS trigger the MSR
> intercepts?  Architecturally, it writes MSR_GS_KERN, so ought to trigger
> the Write intercept.
> 
> However, version 7 of the FRED spec says:
> 
> "Because the base address in the descriptor is only 32 bits, LKGS clears
> the upper 32 bits of the 64-bit IA32_KERNEL_GS_BASE MSR."
> 
> so I suspect it does not architecturally read MSR_GS_KERN, so would not
> trigger the Read intercept (or introspection for that matter.)

Well, I'm looking at this differently anyway: The MSR is merely an alias
for the segment base. Just like LFS/LGS won't trigger respective MSR
intercepts, LKGS shouldn't either.

> AFAICT, we're only performing the read in order to do the best-effort
> unwind, so I think that path needs dropping.

No, as said - we need to put back the correct base of the "real" GS.

>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -296,6 +296,8 @@ XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /
>>  XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
>>  XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
>>  XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
>> +XEN_CPUFEATURE(FRED,         10*32+17) /*   Flexible Return and Event Delivery */
>> +XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */
> 
> Can we please keep this 's' until we've had a play on real hardware?

Sure.

> Also, as we're going for CPUID bits more generally these days, bit 20 is
> NMI_SRC also from the FRED spec.

I can add that, sure. It just seemed unrelated to me. I wanted to have
FRED to put in place the dependency in gen-cpuid.py. What isn't quite
clear to me is whether there should then also be a dependency recorded
between FRED and NMI_SRC.

>> @@ -338,6 +338,9 @@ def crunch_numbers(state):
>>  
>>          # The behaviour described by RRSBA depend on eIBRS being active.
>>          EIBRS: [RRSBA],
>> +
>> +        # FRED builds on the LKGS instruction.
>> +        LKGS: [FRED],
> 
> I'd be tempted to justify this differently.
> 
> It is intentional that LKGS is usable with CR4.FRED=0, for the benefit
> of FRED-aware-but-not-active OSes running on FRED-capable hardware.
> 
> However, FRED=1 systems cannot operate without LKGS.

This is what I'm meaning to say with the comment. Whereas ...

> So, perhaps "There is no hard dependency, but the spec requires that
> LKGS is available in FRED systems" ?

... this is weaker than what I think is wanted/needed.

Jan

