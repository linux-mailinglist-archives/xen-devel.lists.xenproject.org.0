Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A089090D90B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 18:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743230.1150122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJbaO-0001Y9-Vf; Tue, 18 Jun 2024 16:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743230.1150122; Tue, 18 Jun 2024 16:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJbaO-0001Vd-S8; Tue, 18 Jun 2024 16:21:32 +0000
Received: by outflank-mailman (input) for mailman id 743230;
 Tue, 18 Jun 2024 16:21:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJbaO-0001VX-7x
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 16:21:32 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2438740-2d8e-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 18:21:30 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6f177b78dcso718903566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 09:21:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f8186b686sm289176966b.7.2024.06.18.09.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 09:21:29 -0700 (PDT)
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
X-Inumbo-ID: d2438740-2d8e-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718727690; x=1719332490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=65l+y+VMGKICQfKg8KgEhKW8NBQP4Iy2j7XrYTn75M0=;
        b=UYOxfgZnwXJIaGBITUPqKvcX8Vfs/jmfm7B/Eq14JHHm4l367ZAF/d6N0YcjJ8m2kh
         4GhdwW1oAjg1X3tdHzZoeQ3SXNiss4ePTh+SlK8F33CXg8Q4kXrdjQ/nSX2tyyAlGwE8
         09ZETYrxaF86/dllgoAi3iyqsHAskRk1QzC4JSfFkVPs8msBSEkHFw5M4gPk5QmoK8uE
         uxTjt6p8DRNgkxZkq7IXcwYJ5c/7PkecJwQVSjnizg9H5vt3qrub0oohDvIWiGF595/9
         gee31R9UK5b9n1FoG/PMV7b3ryzHMnSX+ofaCbsuRxGG9QJ7IoYZopXKH9YKNeydIzBx
         y4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718727690; x=1719332490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65l+y+VMGKICQfKg8KgEhKW8NBQP4Iy2j7XrYTn75M0=;
        b=NGAhfN7VyS/+CBt552leNHNj2JR0YggkPPMS44i0ETc6OHaHv0yQovHjensM8dJHmz
         0kR0NzAy1eZsstyfaJvLBJ9LGdVrjNGAGaX71KluLIY08+nP+1ZoNIgNHEgoy5qeZoP7
         pQ97sg1NyeK3y46rnvwCMGAop9i4G4IwCc6ItGrMnrLcwP+7FT0is/fMliicq8UL5d8N
         vTYeErZ80+9JiEoHSzJ3uvC1KSC7LZECTKLzDTDvsffZgcxVOGAe3N/ffMq6mvzL2v7J
         wKtuv5MR75Cgs7IJm9YShy0ZDeKz9gTlU4e4ibtZA7M6adSZeIh9oFyRUZNco/qWaqrk
         YzZw==
X-Forwarded-Encrypted: i=1; AJvYcCVkcforXq3GabIT9TdfRRDqsP4j4JD69LxKj4BybZX2jh3qGFzcUH0LL6Kcv/FxrMN1iRkZN/usz3ShdDpL4Oa2O9LWFkyYs5KXSIlRik4=
X-Gm-Message-State: AOJu0YwE4EsbX0PdbMKH8R6tLkr64fy1j9R8xVi1aSH8OfMTs80EEi6f
	812LhpwFT73T1noexqoRDRRKXQYHZNbr7kHuyEf4h5WBPNimkhOVLUXbevdtVA==
X-Google-Smtp-Source: AGHT+IF4jWLGi0RBFY9Gll5lfUokxykgs+9rVIy5xj2yKvRAMZlZuMtcC/CYX2YsuGh8NiU/BxB94w==
X-Received: by 2002:a17:907:8b95:b0:a6e:fccc:e4a with SMTP id a640c23a62f3a-a6fab060dd2mr2007966b.0.1718727690174;
        Tue, 18 Jun 2024 09:21:30 -0700 (PDT)
Message-ID: <fd503d44-c1db-4aba-bb3d-9478cbdfe56d@suse.com>
Date: Tue, 18 Jun 2024 18:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] x86/xstate: Cross-check dynamic XSTATE sizes at
 boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
 <20240617173921.1755439-3-andrew.cooper3@citrix.com>
 <be1baa64-ba01-49ce-a59e-53f3bef1cda0@suse.com>
 <973b1d2c-c27c-4fb8-92b1-dfaefdeda7e2@citrix.com>
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
In-Reply-To: <973b1d2c-c27c-4fb8-92b1-dfaefdeda7e2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.06.2024 17:21, Andrew Cooper wrote:
> On 18/06/2024 11:05 am, Jan Beulich wrote:
>> On 17.06.2024 19:39, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/xstate.c
>>> +++ b/xen/arch/x86/xstate.c
>>> @@ -604,9 +604,164 @@ static bool valid_xcr0(uint64_t xcr0)
>>>      if ( !(xcr0 & X86_XCR0_BNDREGS) != !(xcr0 & X86_XCR0_BNDCSR) )
>>>          return false;
>>>  
>>> +    /* TILECFG and TILEDATA must be the same. */
>>> +    if ( !(xcr0 & X86_XCR0_TILE_CFG) != !(xcr0 & X86_XCR0_TILE_DATA) )
>>> +        return false;
>>> +
>>>      return true;
>>>  }
>>>  
>>> +struct xcheck_state {
>>> +    uint64_t states;
>>> +    uint32_t uncomp_size;
>>> +    uint32_t comp_size;
>>> +};
>>> +
>>> +static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
>>> +{
>>> +    uint32_t hw_size;
>>> +
>>> +    BUILD_BUG_ON(X86_XCR0_STATES & X86_XSS_STATES);
>>> +
>>> +    BUG_ON(s->states & new); /* States only increase. */
>>> +    BUG_ON(!valid_xcr0(s->states | new)); /* Xen thinks it's a good value. */
>>> +    BUG_ON(new & ~(X86_XCR0_STATES | X86_XSS_STATES)); /* Known state. */
>>> +    BUG_ON((new & X86_XCR0_STATES) &&
>>> +           (new & X86_XSS_STATES)); /* User or supervisor, not both. */
>>> +
>>> +    s->states |= new;
>>> +    if ( new & X86_XCR0_STATES )
>>> +    {
>>> +        if ( !set_xcr0(s->states & X86_XCR0_STATES) )
>>> +            BUG();
>>> +    }
>>> +    else
>>> +        set_msr_xss(s->states & X86_XSS_STATES);
>>> +
>>> +    /*
>>> +     * Check the uncompressed size.  Some XSTATEs are out-of-order and fill in
>>> +     * prior holes in the state area, so we check that the size doesn't
>>> +     * decrease.
>>> +     */
>>> +    hw_size = cpuid_count_ebx(0xd, 0);
>> Going forward, do we mean to get rid of XSTATE_CPUID? Else imo it should be
>> used here (and again below).
> 
> All documentation about CPUID, from the vendors and from secondary
> sources, is written in terms of numerals, not names.
> 
> XSTATE_CPUID is less meaningful than 0xd, and I would prefer to phase it
> out.

Fair enough; hence why I was asking.

>>> +    if ( hw_size < s->uncomp_size )
>>> +        panic("XSTATE 0x%016"PRIx64", new bits {%63pbl}, uncompressed hw size %#x < prev size %#x\n",
>>> +              s->states, &new, hw_size, s->uncomp_size);
>>> +
>>> +    s->uncomp_size = hw_size;
>> Since XSS state doesn't affect uncompressed layout, this looks like largely
>> dead code for that case. Did you consider moving this into the if() above?
> 
> If that were a printk() rather than a panic(), then having the
> assignment in the if() would be wrong.

Would it? For an XSS component the uncompressed size isn't supposed to
change. (Or else doing an == check, as per below, wouldn't be an option.)

> So while it doesn't really matter given the way the logic is currently
> written, it's more code, and interferes with manual debugging to move
> the check into the if().
> 
>> Alternatively, should the comparison use == when dealing with XSS bits?
> 
> Hmm.  We probably can make this check work, given that we ascend through
> user states first, and the supervisor states second.
> 
> Although I'd need to rerun such a change through the entire hardware
> lab.  There have been enough unexpected surprises with "obvious" changes
> already.

Well, we can of course decide to go with what you have for now, and then
see about tightening the check. I fear though that doing so may then be
forgotten ...

>>> +    /*
>>> +     * Check the compressed size, if available.  All components strictly
>>> +     * appear in index order.  In principle there are no holes, but some
>>> +     * components have their base address 64-byte aligned for efficiency
>>> +     * reasons (e.g. AMX-TILE) and there are other components small enough to
>>> +     * fit in the gap (e.g. PKRU) without increasing the overall length.
>>> +     */
>>> +    hw_size = cpuid_count_ebx(0xd, 1);
>>> +
>>> +    if ( cpu_has_xsavec )
>>> +    {
>>> +        if ( hw_size < s->comp_size )
>>> +            panic("XSTATE 0x%016"PRIx64", new bits {%63pbl}, compressed hw size %#x < prev size %#x\n",
>>> +                  s->states, &new, hw_size, s->comp_size);
>> Unlike for uncompressed size, can't it be <= here, for - as the comment
>> says - it being strictly index order, and no component having zero size?
> 
> The first version of this patch did have <=, and it really failed on SPR.
> 
> When you activate AMX first, then PKRU next, PKRU really does fit in the
> alignment hole, and the overall compressed size is the same.
> 
> 
> It's a consequence of doing all the user states first, then all the
> supervisor states second.  I did have them strictly in index order to
> begin with, but then hit the enumeration issue on Broadwell and reworked
> xstate_check_sizes() to have a single common cpu_has_xsaves around all
> supervisor states.
> 
> I could potentially undo that, but the consequence is needing an
> cpu_has_xsaves in every call passing in X86_XSS_*.

Just to say as much: To me, doing things strictly in order would feel more
"natural" (even if, see below, the other reason that would have seemed
desirable, really has vaporized). Other than the need for cpu_has_xsaves,
is there a particular reason you split things as all XCR0 first, then all
XSS? (I'm a little worried anyway that this code will need updating for
each new component addition. Yet "automating" this won't work, because of
the need for the cpu_has_* checks.)

>>> +        s->comp_size = hw_size;
>>> +    }
>>> +    else if ( hw_size ) /* Compressed size reported, but no XSAVEC ? */
>>> +    {
>>> +        static bool once;
>>> +
>>> +        if ( !once )
>>> +        {
>>> +            WARN();
>>> +            once = true;
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +/*
>>> + * The {un,}compressed XSTATE sizes are reported by dynamic CPUID value, based
>>> + * on the current %XCR0 and MSR_XSS values.  The exact layout is also feature
>>> + * and vendor specific.  Cross-check Xen's understanding against real hardware
>>> + * on boot.
>>> + *
>>> + * Testing every combination is prohibitive, so we use a partial approach.
>>> + * Starting with nothing active, we add new XSTATEs and check that the CPUID
>>> + * dynamic values never decreases.
>>> + */
>>> +static void __init noinline xstate_check_sizes(void)
>>> +{
>>> +    uint64_t old_xcr0 = get_xcr0();
>>> +    uint64_t old_xss = get_msr_xss();
>>> +    struct xcheck_state s = {};
>>> +
>>> +    /*
>>> +     * User XSTATEs, increasing by index.
>>> +     *
>>> +     * Chronologically, Intel and AMD had identical layouts for AVX (YMM).
>>> +     * AMD introduced LWP in Fam15h, following immediately on from YMM.  Intel
>>> +     * left an LWP-shaped hole when adding MPX (BND{CSR,REGS}) in Skylake.
>>> +     * AMD removed LWP in Fam17h, putting PKRU in the same space, breaking
>>> +     * layout compatibility with Intel and having a knock-on effect on all
>>> +     * subsequent states.
>>> +     */
>>> +    check_new_xstate(&s, X86_XCR0_SSE | X86_XCR0_FP);
>>> +
>>> +    if ( cpu_has_avx )
>>> +        check_new_xstate(&s, X86_XCR0_YMM);
>>> +
>>> +    if ( cpu_has_mpx )
>>> +        check_new_xstate(&s, X86_XCR0_BNDCSR | X86_XCR0_BNDREGS);
>>> +
>>> +    if ( cpu_has_avx512f )
>>> +        check_new_xstate(&s, X86_XCR0_HI_ZMM | X86_XCR0_ZMM | X86_XCR0_OPMASK);
>>> +
>>> +    if ( cpu_has_pku )
>>> +        check_new_xstate(&s, X86_XCR0_PKRU);
>>> +
>>> +    if ( boot_cpu_has(X86_FEATURE_AMX_TILE) )
>>> +        check_new_xstate(&s, X86_XCR0_TILE_DATA | X86_XCR0_TILE_CFG);
>>> +
>>> +    if ( boot_cpu_has(X86_FEATURE_LWP) )
>>> +        check_new_xstate(&s, X86_XCR0_LWP);
>>> +
>>> +    /*
>>> +     * Supervisor XSTATEs, increasing by index.
>>> +     *
>>> +     * Intel Broadwell has Processor Trace but no XSAVES.  There doesn't
>>> +     * appear to have been a new enumeration when X86_XSS_PROC_TRACE was
>>> +     * introduced in Skylake.
>>> +     */
>>> +    if ( cpu_has_xsaves )
>>> +    {
>>> +        if ( cpu_has_proc_trace )
>>> +            check_new_xstate(&s, X86_XSS_PROC_TRACE);
>>> +
>>> +        if ( boot_cpu_has(X86_FEATURE_ENQCMD) )
>>> +            check_new_xstate(&s, X86_XSS_PASID);
>>> +
>>> +        if ( boot_cpu_has(X86_FEATURE_CET_SS) ||
>>> +             boot_cpu_has(X86_FEATURE_CET_IBT) )
>>> +        {
>>> +            check_new_xstate(&s, X86_XSS_CET_U);
>>> +            check_new_xstate(&s, X86_XSS_CET_S);
>>> +        }
>>> +
>>> +        if ( boot_cpu_has(X86_FEATURE_UINTR) )
>>> +            check_new_xstate(&s, X86_XSS_UINTR);
>>> +
>>> +        if ( boot_cpu_has(X86_FEATURE_ARCH_LBR) )
>>> +            check_new_xstate(&s, X86_XSS_LBR);
>>> +    }
>> In principle compressed state checking could be extended to also verify
>> the offsets are strictly increasing. That, however, would require to
>> interleave XCR0 and XSS checks, strictly by index. Did you consider (and
>> then discard) doing so?
> 
> What offsets are you referring to?
> 
> Compressed images have no offset information.  Every "row" which has
> ecx.xss set has ebx (offset) reported as 0.  The offset information for
> the user rows are only applicable for uncompressed images.

Hmm, right, nothing to compare our calculations against. And for the
compressed form the (calculated) offsets aren't any different from the
previous component's accumulated size.

Jan

