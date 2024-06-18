Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D54890D719
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 17:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743209.1150101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJaen-0007Vu-CC; Tue, 18 Jun 2024 15:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743209.1150101; Tue, 18 Jun 2024 15:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJaen-0007UU-9A; Tue, 18 Jun 2024 15:22:01 +0000
Received: by outflank-mailman (input) for mailman id 743209;
 Tue, 18 Jun 2024 15:21:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=An5i=NU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJael-0007TB-Fs
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 15:21:59 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80a76a43-2d86-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 17:21:58 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6e349c0f2bso728905666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 08:21:58 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9982asm622875966b.202.2024.06.18.08.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 08:21:56 -0700 (PDT)
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
X-Inumbo-ID: 80a76a43-2d86-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718724117; x=1719328917; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3A5BvofJ84SXtt2DL854SMDMW7ui6tD+mZ1gzbNf5vw=;
        b=NVfnJYliB1iaZRvyXlAe3+nkI4BcdfmXZCqZnnyZknKVga//bAZPMOfxKfH1oLW5ar
         FsCa0VRokMjb0/uboy/y1oUXIVOAQqMMKTZiwzTJHTw0A8sNVLoHCP9y9clDFXkKdtO8
         N+6+eV/NuM9+KRTQ2dI/Aj1QfEkXFoYGvCLVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718724117; x=1719328917;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3A5BvofJ84SXtt2DL854SMDMW7ui6tD+mZ1gzbNf5vw=;
        b=NRb9fJYbaJu59Gdu9HAl//4YrsiJo+mMrQJe8JeDURNzmqCsjiLvTIOR67bxyzFizu
         ZTs7ZLK3AlEqH38quOVgVtNxDi9/HVEBrLkik2HfdeUpQBu86/3L/gEp7AjJm4S5Tcxl
         /NpiXbQiuMmrY5Nh88HBLnt74cuNTRex2342sxqYmMVUlvOzRi48vzz8N/hFpVXRUIyi
         Nto+epn1FvZo0bJIXUS5dhiyrl6rUUitU3qMh/ovTE8mrLZfgUVOZ0GAADLif3dIZqc+
         n727dWrhgBpQ7RvPbfp1Pj9EcrmnxoJr19og+NTSmLjas+ofFOExS+sIORmPDcW4mhHc
         m/EA==
X-Forwarded-Encrypted: i=1; AJvYcCVvCmWL5loZx54pQRxsBEHkJRiSVyoL9Ay16zAxLItA/4eETvbJjFpfZj2o54ir2oI7B5nhS7Xj7NzPsqwYIS8P5WnhfooyC2oT3EOV+NY=
X-Gm-Message-State: AOJu0YwQpobVDY6vh4f5V3FXdSPS9G+o+xG9wrHayFNAdeLmnYETYhhZ
	mWMEXTcMwMPW0/BBwdNTncszbbHWX/LvgSj0T62UMzYWId55Q4ixtZ2aPS2/TcPt640zCWbxjl0
	+1AE=
X-Google-Smtp-Source: AGHT+IGmnrdD5PWrFqSM0ZfAqFb8ANg9tdBb1PrWStrA5ZElm9f0HIPYflNyJhZg+kJGEfeyxfxpbA==
X-Received: by 2002:a17:906:b2c8:b0:a6f:5723:fb11 with SMTP id a640c23a62f3a-a6f60dc50bcmr815917266b.58.1718724117299;
        Tue, 18 Jun 2024 08:21:57 -0700 (PDT)
Message-ID: <973b1d2c-c27c-4fb8-92b1-dfaefdeda7e2@citrix.com>
Date: Tue, 18 Jun 2024 16:21:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] x86/xstate: Cross-check dynamic XSTATE sizes at
 boot
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
 <20240617173921.1755439-3-andrew.cooper3@citrix.com>
 <be1baa64-ba01-49ce-a59e-53f3bef1cda0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <be1baa64-ba01-49ce-a59e-53f3bef1cda0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/06/2024 11:05 am, Jan Beulich wrote:
> On 17.06.2024 19:39, Andrew Cooper wrote:
>> Right now, xstate_ctxt_size() performs a cross-check of size with CPUID in for
>> every call.  This is expensive, being used for domain create/migrate, as well
>> as to service certain guest CPUID instructions.
>>
>> Instead, arrange to check the sizes once at boot.  See the code comments for
>> details.  Right now, it just checks hardware against the algorithm
>> expectations.  Later patches will add further cross-checking.
>>
>> Introduce more X86_XCR0_* and X86_XSS_* constants CPUID bits.  This is to
>> maximise coverage in the sanity check, even if we don't expect to
>> use/virtualise some of these features any time soon.  Leave HDC and HWP alone
>> for now; we don't have CPUID bits from them stored nicely.
>>
>> Only perform the cross-checks when SELF_TESTS are active.  It's only
>> developers or new hardware liable to trip these checks, and Xen at least
>> tracks "maximum value ever seen in xcr0" for the lifetime of the VM, which we
>> don't want to be tickling in the general case.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I may certainly give R-b on the patch as it is, but I have a few questions
> first:
>
>> --- a/xen/arch/x86/xstate.c
>> +++ b/xen/arch/x86/xstate.c
>> @@ -604,9 +604,164 @@ static bool valid_xcr0(uint64_t xcr0)
>>      if ( !(xcr0 & X86_XCR0_BNDREGS) != !(xcr0 & X86_XCR0_BNDCSR) )
>>          return false;
>>  
>> +    /* TILECFG and TILEDATA must be the same. */
>> +    if ( !(xcr0 & X86_XCR0_TILE_CFG) != !(xcr0 & X86_XCR0_TILE_DATA) )
>> +        return false;
>> +
>>      return true;
>>  }
>>  
>> +struct xcheck_state {
>> +    uint64_t states;
>> +    uint32_t uncomp_size;
>> +    uint32_t comp_size;
>> +};
>> +
>> +static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
>> +{
>> +    uint32_t hw_size;
>> +
>> +    BUILD_BUG_ON(X86_XCR0_STATES & X86_XSS_STATES);
>> +
>> +    BUG_ON(s->states & new); /* States only increase. */
>> +    BUG_ON(!valid_xcr0(s->states | new)); /* Xen thinks it's a good value. */
>> +    BUG_ON(new & ~(X86_XCR0_STATES | X86_XSS_STATES)); /* Known state. */
>> +    BUG_ON((new & X86_XCR0_STATES) &&
>> +           (new & X86_XSS_STATES)); /* User or supervisor, not both. */
>> +
>> +    s->states |= new;
>> +    if ( new & X86_XCR0_STATES )
>> +    {
>> +        if ( !set_xcr0(s->states & X86_XCR0_STATES) )
>> +            BUG();
>> +    }
>> +    else
>> +        set_msr_xss(s->states & X86_XSS_STATES);
>> +
>> +    /*
>> +     * Check the uncompressed size.  Some XSTATEs are out-of-order and fill in
>> +     * prior holes in the state area, so we check that the size doesn't
>> +     * decrease.
>> +     */
>> +    hw_size = cpuid_count_ebx(0xd, 0);
> Going forward, do we mean to get rid of XSTATE_CPUID? Else imo it should be
> used here (and again below).

All documentation about CPUID, from the vendors and from secondary
sources, is written in terms of numerals, not names.

XSTATE_CPUID is less meaningful than 0xd, and I would prefer to phase it
out.


>> +    if ( hw_size < s->uncomp_size )
>> +        panic("XSTATE 0x%016"PRIx64", new bits {%63pbl}, uncompressed hw size %#x < prev size %#x\n",
>> +              s->states, &new, hw_size, s->uncomp_size);
>> +
>> +    s->uncomp_size = hw_size;
> Since XSS state doesn't affect uncompressed layout, this looks like largely
> dead code for that case. Did you consider moving this into the if() above?

If that were a printk() rather than a panic(), then having the
assignment in the if() would be wrong.

So while it doesn't really matter given the way the logic is currently
written, it's more code, and interferes with manual debugging to move
the check into the if().

> Alternatively, should the comparison use == when dealing with XSS bits?

Hmm.  We probably can make this check work, given that we ascend through
user states first, and the supervisor states second.

Although I'd need to rerun such a change through the entire hardware
lab.  There have been enough unexpected surprises with "obvious" changes
already.

>> +    /*
>> +     * Check the compressed size, if available.  All components strictly
>> +     * appear in index order.  In principle there are no holes, but some
>> +     * components have their base address 64-byte aligned for efficiency
>> +     * reasons (e.g. AMX-TILE) and there are other components small enough to
>> +     * fit in the gap (e.g. PKRU) without increasing the overall length.
>> +     */
>> +    hw_size = cpuid_count_ebx(0xd, 1);
>> +
>> +    if ( cpu_has_xsavec )
>> +    {
>> +        if ( hw_size < s->comp_size )
>> +            panic("XSTATE 0x%016"PRIx64", new bits {%63pbl}, compressed hw size %#x < prev size %#x\n",
>> +                  s->states, &new, hw_size, s->comp_size);
> Unlike for uncompressed size, can't it be <= here, for - as the comment
> says - it being strictly index order, and no component having zero size?

The first version of this patch did have <=, and it really failed on SPR.

When you activate AMX first, then PKRU next, PKRU really does fit in the
alignment hole, and the overall compressed size is the same.


It's a consequence of doing all the user states first, then all the
supervisor states second.  I did have them strictly in index order to
begin with, but then hit the enumeration issue on Broadwell and reworked
xstate_check_sizes() to have a single common cpu_has_xsaves around all
supervisor states.

I could potentially undo that, but the consequence is needing an
cpu_has_xsaves in every call passing in X86_XSS_*.
>> +        s->comp_size = hw_size;
>> +    }
>> +    else if ( hw_size ) /* Compressed size reported, but no XSAVEC ? */
>> +    {
>> +        static bool once;
>> +
>> +        if ( !once )
>> +        {
>> +            WARN();
>> +            once = true;
>> +        }
>> +    }
>> +}
>> +
>> +/*
>> + * The {un,}compressed XSTATE sizes are reported by dynamic CPUID value, based
>> + * on the current %XCR0 and MSR_XSS values.  The exact layout is also feature
>> + * and vendor specific.  Cross-check Xen's understanding against real hardware
>> + * on boot.
>> + *
>> + * Testing every combination is prohibitive, so we use a partial approach.
>> + * Starting with nothing active, we add new XSTATEs and check that the CPUID
>> + * dynamic values never decreases.
>> + */
>> +static void __init noinline xstate_check_sizes(void)
>> +{
>> +    uint64_t old_xcr0 = get_xcr0();
>> +    uint64_t old_xss = get_msr_xss();
>> +    struct xcheck_state s = {};
>> +
>> +    /*
>> +     * User XSTATEs, increasing by index.
>> +     *
>> +     * Chronologically, Intel and AMD had identical layouts for AVX (YMM).
>> +     * AMD introduced LWP in Fam15h, following immediately on from YMM.  Intel
>> +     * left an LWP-shaped hole when adding MPX (BND{CSR,REGS}) in Skylake.
>> +     * AMD removed LWP in Fam17h, putting PKRU in the same space, breaking
>> +     * layout compatibility with Intel and having a knock-on effect on all
>> +     * subsequent states.
>> +     */
>> +    check_new_xstate(&s, X86_XCR0_SSE | X86_XCR0_FP);
>> +
>> +    if ( cpu_has_avx )
>> +        check_new_xstate(&s, X86_XCR0_YMM);
>> +
>> +    if ( cpu_has_mpx )
>> +        check_new_xstate(&s, X86_XCR0_BNDCSR | X86_XCR0_BNDREGS);
>> +
>> +    if ( cpu_has_avx512f )
>> +        check_new_xstate(&s, X86_XCR0_HI_ZMM | X86_XCR0_ZMM | X86_XCR0_OPMASK);
>> +
>> +    if ( cpu_has_pku )
>> +        check_new_xstate(&s, X86_XCR0_PKRU);
>> +
>> +    if ( boot_cpu_has(X86_FEATURE_AMX_TILE) )
>> +        check_new_xstate(&s, X86_XCR0_TILE_DATA | X86_XCR0_TILE_CFG);
>> +
>> +    if ( boot_cpu_has(X86_FEATURE_LWP) )
>> +        check_new_xstate(&s, X86_XCR0_LWP);
>> +
>> +    /*
>> +     * Supervisor XSTATEs, increasing by index.
>> +     *
>> +     * Intel Broadwell has Processor Trace but no XSAVES.  There doesn't
>> +     * appear to have been a new enumeration when X86_XSS_PROC_TRACE was
>> +     * introduced in Skylake.
>> +     */
>> +    if ( cpu_has_xsaves )
>> +    {
>> +        if ( cpu_has_proc_trace )
>> +            check_new_xstate(&s, X86_XSS_PROC_TRACE);
>> +
>> +        if ( boot_cpu_has(X86_FEATURE_ENQCMD) )
>> +            check_new_xstate(&s, X86_XSS_PASID);
>> +
>> +        if ( boot_cpu_has(X86_FEATURE_CET_SS) ||
>> +             boot_cpu_has(X86_FEATURE_CET_IBT) )
>> +        {
>> +            check_new_xstate(&s, X86_XSS_CET_U);
>> +            check_new_xstate(&s, X86_XSS_CET_S);
>> +        }
>> +
>> +        if ( boot_cpu_has(X86_FEATURE_UINTR) )
>> +            check_new_xstate(&s, X86_XSS_UINTR);
>> +
>> +        if ( boot_cpu_has(X86_FEATURE_ARCH_LBR) )
>> +            check_new_xstate(&s, X86_XSS_LBR);
>> +    }
> In principle compressed state checking could be extended to also verify
> the offsets are strictly increasing. That, however, would require to
> interleave XCR0 and XSS checks, strictly by index. Did you consider (and
> then discard) doing so?

What offsets are you referring to?

Compressed images have no offset information.  Every "row" which has
ecx.xss set has ebx (offset) reported as 0.  The offset information for
the user rows are only applicable for uncompressed images.

The layout of a compressed image is a strict function of RFBM derived
from component sizes alone.

~Andrew

