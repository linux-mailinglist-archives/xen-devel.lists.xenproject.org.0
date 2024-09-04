Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E044396C045
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 16:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790421.1200176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slqvl-0002yM-E0; Wed, 04 Sep 2024 14:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790421.1200176; Wed, 04 Sep 2024 14:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slqvl-0002wN-A0; Wed, 04 Sep 2024 14:24:21 +0000
Received: by outflank-mailman (input) for mailman id 790421;
 Wed, 04 Sep 2024 14:24:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slqvk-0002wH-3Z
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 14:24:20 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ec87617-6ac9-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 16:24:18 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a868d7f92feso765049966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 07:24:18 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989230a9dsm803547866b.224.2024.09.04.07.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 07:24:16 -0700 (PDT)
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
X-Inumbo-ID: 5ec87617-6ac9-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725459858; x=1726064658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Icv5a6YYe6oW4Y4/lZxaRc9u5MOda4J8yFVrvNgaIp4=;
        b=lavW0nm5+HsdeEk9pZtkcDiOD3FYJR3LBoIfxgnFan9IXXW4vYYr1BhaJPLNb9Qt0q
         r2ZdzxUb4MEvg+0dQ/L7RF8m5S5hBegy1cFraAtw4viRi7u8TQ00bmiQsa3EdX7j5Dg1
         9PvITOPCTo1/8We0PTyDqq66UtEV4gN5qTVuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725459858; x=1726064658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Icv5a6YYe6oW4Y4/lZxaRc9u5MOda4J8yFVrvNgaIp4=;
        b=VwFCeibUoVTPFbjCMqsQgWh89AugoZjht7dV0O0K0ehg1fpmTawr7i//PvQi8tro+E
         qPvkbIicO+dUftyNIcKQ0mhBRyE9GHwUfJhfqqhCikdFkpMcUQ9o/3HRokl6JP07dXGx
         /XgnvZxr/EeIXHG6Xt8ay1nf/6tjf+tytxtuIqDH9hHHewMSoZXSSoyxUZdcEyMFd6SV
         ragReT7rj+ygm9H6+CCo/qCyD5mtbjxDuWSneIwWG4Y3n2p4KHu448yrJHaJDalcJGl0
         IP74dUgKQSpirusCf6jeNQ/dCvWVgWkDI/jBSnjabQJ1ptxY49x6s5G7PrAe3HRmSm4A
         nCpw==
X-Forwarded-Encrypted: i=1; AJvYcCUK4uUJF8ChYen2bhBvaF96D6jOSuQm+vYKYulnTQUXjkz7AY9EaVmpi6nV6GW3PNmFb+LwXx+gYQw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOn2D4aq2z3fG091O1PuN8o37+oM2yiZPIxyc25VN/vctIF5Mn
	LJMVMur3x1brTvyDLEF3E9mmdwJICzQV5aHi/U9GiN0GeC9d/q67WfZ66Ozfy3o=
X-Google-Smtp-Source: AGHT+IFE214tvHc33wL64pYn/ylJd1eTrW9vwd9M8rMylTlb5Nnq8/F1CNPdh/Phn11czCBVFuZiYg==
X-Received: by 2002:a17:907:7d93:b0:a86:ac05:2112 with SMTP id a640c23a62f3a-a897fa75845mr1618071266b.51.1725459856752;
        Wed, 04 Sep 2024 07:24:16 -0700 (PDT)
Message-ID: <dbf3506c-30fa-4c75-aa87-fd6697e5fba0@citrix.com>
Date: Wed, 4 Sep 2024 15:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] x86emul: support LKGS
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
 <257099d1-2632-47b9-bfb6-2d3fc44b0f21@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <257099d1-2632-47b9-bfb6-2d3fc44b0f21@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/09/2024 1:28 pm, Jan Beulich wrote:
> ---
> Instead of ->read_segment() we could of course also use ->read_msr() to
> fetch the original GS base. I don't think I can see a clear advantage of
> either approach; the way it's done it matches how we handle SWAPGS.

It turns out this is littered with broken corners.  See below.

> For PV save_segments() would need adjustment, but the insn being
> restricted to ring 0 means PV guests can't use it anyway (unless we
> wanted to emulate it as another privileged insn).

PV guests can't have architectural FRED anyway (although I'd really like
to do paravirt FRED to simplify Linux as x86 PV is already ~80% there).

We already handle SWAPGS automatically on kernel/user transitions, and
have a dedicated hypercall for setting GSKERN, so I don't see any need
to provide LKGS even in a future where there's some kind of paravirt-FRED.

> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> @@ -693,6 +719,20 @@ static int read_msr(
>          *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
>          return X86EMUL_OKAY;
>  
> +#ifdef __x86_64__
> +    case 0xc0000101: /* GS_BASE */

It's only just occurred to me, but given x86-defns.h, isn't msr-index.h
suitably usable too ?

> @@ -1335,6 +1400,41 @@ int main(int argc, char **argv)
>          printf("%u bytes read - ", bytes_read);
>          goto fail;
>      }
> +    printf("okay\n");
> +
> +    emulops.write_segment = write_segment;
> +    emulops.write_msr     = write_msr;
> +
> +    printf("%-40s", "Testing swapgs...");
> +    instr[0] = 0x0f; instr[1] = 0x01; instr[2] = 0xf8;
> +    regs.eip = (unsigned long)&instr[0];
> +    gs_base = 0xffffeeeecccc8888UL;
> +    gs_base_shadow = 0x0000111122224444UL;
> +    rc = x86_emulate(&ctxt, &emulops);
> +    if ( (rc != X86EMUL_OKAY) ||
> +         (regs.eip != (unsigned long)&instr[3]) ||
> +         (gs_base != 0x0000111122224444UL) ||
> +         (gs_base_shadow != 0xffffeeeecccc8888UL) )
> +        goto fail;
> +    printf("okay\n");
> +
> +    printf("%-40s", "Testing lkgs 2(%rdx)...");
> +    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x00; instr[3] = 0x72; instr[4] = 0x02;
> +    regs.eip = (unsigned long)&instr[0];
> +    regs.edx = (unsigned long)res;
> +    res[0]   = 0x00004444;
> +    res[1]   = 0x8888cccc;
> +    i = cp.extd.nscb; cp.extd.nscb = true; /* for AMD */
> +    rc = x86_emulate(&ctxt, &emulops);
> +    if ( (rc != X86EMUL_OKAY) ||
> +         (regs.eip != (unsigned long)&instr[5]) ||
> +         (gs_base != 0x0000111122224444UL) ||
> +         gs_base_shadow )
> +        goto fail;
> +
> +    cp.extd.nscb = i;

I think I acked the patches to rename this?

I'd suggest putting those in now, rather than creating more (re)work later.

> --- a/xen/arch/x86/x86_emulate/decode.c
> +++ b/xen/arch/x86/x86_emulate/decode.c
> @@ -743,8 +743,12 @@ decode_twobyte(struct x86_emulate_state
>          case 0:
>              s->desc |= DstMem | SrcImplicit | Mov;
>              break;
> +        case 6:
> +            if ( !(s->modrm_reg & 1) && mode_64bit() )
> +            {
>          case 2: case 4:
> -            s->desc |= SrcMem16;
> +                s->desc |= SrcMem16;
> +            }

Well - not something I was expecting, but I've just had to go and find
the Itanium instruction manuals...

Do we really need this complexity?  JMPE is a decoding wrinkle of
Itanium processors, which I think we can reasonably ignore.

IMO we should treat Grp6 as uniformly Reg/Mem16, and rely on the
!mode_64bit() to exclude the encodings commonly used as JMPE.

... not that I see any evidence that an Itanium processor wouldn't
decode LKGS as REP JMPE.

It is curious that Intel picked this encoding space for LKGS which, like
JMPE, is a CPL0-only instruction.  I assume it usefully shares a
group-decode row/column, but I've not had enough coffee for
higher-dimentional decode reasoning.


> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -2870,8 +2870,35 @@ x86_emulate(
>                  break;
>              }
>              break;
> -        default:
> -            generate_exception_if(true, X86_EXC_UD);
> +        case 6: /* lkgs */
> +            generate_exception_if((modrm_reg & 1) || vex.pfx != vex_f2,
> +                                  X86_EXC_UD);
> +            generate_exception_if(!mode_64bit() || !mode_ring0(), X86_EXC_UD);
> +            vcpu_must_have(lkgs);
> +            fail_if(!ops->read_segment || !ops->read_msr ||
> +                    !ops->write_segment || !ops->write_msr);
> +            if ( (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
> +                                     ctxt)) != X86EMUL_OKAY ||
> +                 (rc = ops->read_segment(x86_seg_gs, &sreg,
> +                                         ctxt)) != X86EMUL_OKAY )
> +                goto done;
> +            dst.orig_val = sreg.base; /* Preserve full GS Base. */
> +            if ( (rc = protmode_load_seg(x86_seg_gs, src.val, false, &sreg,
> +                                         ctxt, ops)) != X86EMUL_OKAY ||
> +                 /* Write (32-bit) base into SHADOW_GS. */
> +                 (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,

The comment says 32-bit, but that's the full base, isn't it?

> +                                      ctxt)) != X86EMUL_OKAY )
> +                goto done;
> +            sreg.base = dst.orig_val; /* Reinstate full GS Base. */
> +            if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
> +                                          ctxt)) != X86EMUL_OKAY )
> +            {
> +                /* Best effort unwind (i.e. no real error checking). */
> +                if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
> +                                    ctxt) == X86EMUL_EXCEPTION )
> +                    x86_emul_reset_event(ctxt);
> +                goto done;
> +            }

Do we need all of this?

Either protmode_load_seg() fails and there's nothing to unwind, or
write_msr() fails and we only have to unwind GS.

I think?


This is actually a good example of where pipeline microcode has a much
easier time than we do.  Inside the pipeline, there's no such thing as
"can't store to gs & GS_KERN once the checks are done".

Although it does make me wonder.  Would LKGS trigger the MSR
intercepts?  Architecturally, it writes MSR_GS_KERN, so ought to trigger
the Write intercept.

However, version 7 of the FRED spec says:

"Because the base address in the descriptor is only 32 bits, LKGS clears
the upper 32 bits of the 64-bit IA32_KERNEL_GS_BASE MSR."

so I suspect it does not architecturally read MSR_GS_KERN, so would not
trigger the Read intercept (or introspection for that matter.)

AFAICT, we're only performing the read in order to do the best-effort
unwind, so I think that path needs dropping.



>              break;
>          }
>          break;
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -296,6 +296,8 @@ XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /
>  XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
>  XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
>  XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
> +XEN_CPUFEATURE(FRED,         10*32+17) /*   Flexible Return and Event Delivery */
> +XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */

Can we please keep this 's' until we've had a play on real hardware?

Also, as we're going for CPUID bits more generally these days, bit 20 is
NMI_SRC also from the FRED spec.

>  XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
>  XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
>  
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -274,7 +274,7 @@ def crunch_numbers(state):
>          # superpages, PCID and PKU are only available in 4 level paging.
>          # NO_LMSL indicates the absense of Long Mode Segment Limits, which
>          # have been dropped in hardware.
> -        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL],
> +        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, LKGS],
>  
>          # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
>          # standard 3DNow in the earlier K6 processors.
> @@ -338,6 +338,9 @@ def crunch_numbers(state):
>  
>          # The behaviour described by RRSBA depend on eIBRS being active.
>          EIBRS: [RRSBA],
> +
> +        # FRED builds on the LKGS instruction.
> +        LKGS: [FRED],

I'd be tempted to justify this differently.

It is intentional that LKGS is usable with CR4.FRED=0, for the benefit
of FRED-aware-but-not-active OSes running on FRED-capable hardware.

However, FRED=1 systems cannot operate without LKGS.

So, perhaps "There is no hard dependency, but the spec requires that
LKGS is available in FRED systems" ?

~Andrew

