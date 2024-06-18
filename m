Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2510490C5CF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 12:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742945.1149831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVix-0008Js-7G; Tue, 18 Jun 2024 10:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742945.1149831; Tue, 18 Jun 2024 10:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVix-0008HF-3O; Tue, 18 Jun 2024 10:05:59 +0000
Received: by outflank-mailman (input) for mailman id 742945;
 Tue, 18 Jun 2024 10:05:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJViv-0008H9-4V
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 10:05:57 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a26e3c0-2d5a-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 12:05:55 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57c8353d8d0so6988497a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 03:05:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cbdfe1428sm6474302a12.27.2024.06.18.03.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 03:05:54 -0700 (PDT)
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
X-Inumbo-ID: 5a26e3c0-2d5a-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718705155; x=1719309955; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nEQwruvM+KC5haEB6+QlUQopBtHXFRwc47OmNmDxcnM=;
        b=ZVWeyygKBFfQO9/8OS8GKt07VubUc/AX/5PY0v91gDvXheW8jwQw2YCncQrgWKLoSL
         X3d6xY9XRgYBQB24aVciT8AZZrPOCR35l/hV4KJ5v2TnmXm7AcpfIArA6lTJLjA12kTA
         1a3jivCcRM4yVTK5tz1mIg5rOhx2/i19Qvj+t3ojo2rqlOoG1mMDRxHdVij2l3b1zhNr
         btFiIZZxU+qF5/U+JaFI5UhwITDreRpRm9LKBDP7UJZtPgWLc+UWzekxtVSfGXHbQIxs
         o1Q2wl5e4tZAaqvmAC+wBFLMHMxsyGCEM6jr67w3e6e2Zzxt9kehL1H1oqpg7rd5qrBy
         1LBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718705155; x=1719309955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEQwruvM+KC5haEB6+QlUQopBtHXFRwc47OmNmDxcnM=;
        b=JQic4iCext6zb1lj63wjuCeoUgnZhQYNXJccNK9a4qe2YD5g3l431yf1B2j5AksDy6
         jLpYm5X1Cs85aKZsfmabRaXqXu1fL7VASUHvTWAOpFMaF6IS1PeVQY85OyKa9AH7cDSB
         d+PMwlIvNPeMxgndEvlbpD/CssVMBmZlkVezKvk8FAyAa5buyL4NnrbNPFjRiFFF3YeT
         IgFaE4pTUsMzJjeo4UvBgrkIE7EDFszZnJUb9t22plUt/yhO1bo8lC2AwlAMF+CzE59/
         +ndiX/m167qhhUI52xdO2BoHFf8KAiD7Vu7F/Plm8C9RI2IdsNA2d9wez9ni/FPATvT3
         OHKg==
X-Forwarded-Encrypted: i=1; AJvYcCV5Xy6YfwpFqaSsMEvCEOyMNCXNB3DpoMs+Vsr/q3CX74Hh9EID3l6keOJTW3rT3qWBgadjju8s52pupMVGOrb8NDFr+0y/FzuJPiE8rMA=
X-Gm-Message-State: AOJu0YzFllOCnhoddiLxmlrpNjNIMo0rMNX5WYXwyLDRaZ7bt93J/BBi
	l+7DQomOa8LA8VCCyDGtDwGAzj4p9798YX8UVpJ3/bNMgFUYnbxp1kJxCe9XdA==
X-Google-Smtp-Source: AGHT+IFX2oXBn9E+GQlj5WaLL56zRiqX9OyxdXPifbxESZfOKBZeVkpJ0qsKF8kBjprtR3n49csNYw==
X-Received: by 2002:a50:9b04:0:b0:578:60a6:7c69 with SMTP id 4fb4d7f45d1cf-57cbd69e7a0mr8551338a12.30.1718705154868;
        Tue, 18 Jun 2024 03:05:54 -0700 (PDT)
Message-ID: <be1baa64-ba01-49ce-a59e-53f3bef1cda0@suse.com>
Date: Tue, 18 Jun 2024 12:05:53 +0200
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
In-Reply-To: <20240617173921.1755439-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2024 19:39, Andrew Cooper wrote:
> Right now, xstate_ctxt_size() performs a cross-check of size with CPUID in for
> every call.  This is expensive, being used for domain create/migrate, as well
> as to service certain guest CPUID instructions.
> 
> Instead, arrange to check the sizes once at boot.  See the code comments for
> details.  Right now, it just checks hardware against the algorithm
> expectations.  Later patches will add further cross-checking.
> 
> Introduce more X86_XCR0_* and X86_XSS_* constants CPUID bits.  This is to
> maximise coverage in the sanity check, even if we don't expect to
> use/virtualise some of these features any time soon.  Leave HDC and HWP alone
> for now; we don't have CPUID bits from them stored nicely.
> 
> Only perform the cross-checks when SELF_TESTS are active.  It's only
> developers or new hardware liable to trip these checks, and Xen at least
> tracks "maximum value ever seen in xcr0" for the lifetime of the VM, which we
> don't want to be tickling in the general case.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I may certainly give R-b on the patch as it is, but I have a few questions
first:

> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -604,9 +604,164 @@ static bool valid_xcr0(uint64_t xcr0)
>      if ( !(xcr0 & X86_XCR0_BNDREGS) != !(xcr0 & X86_XCR0_BNDCSR) )
>          return false;
>  
> +    /* TILECFG and TILEDATA must be the same. */
> +    if ( !(xcr0 & X86_XCR0_TILE_CFG) != !(xcr0 & X86_XCR0_TILE_DATA) )
> +        return false;
> +
>      return true;
>  }
>  
> +struct xcheck_state {
> +    uint64_t states;
> +    uint32_t uncomp_size;
> +    uint32_t comp_size;
> +};
> +
> +static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
> +{
> +    uint32_t hw_size;
> +
> +    BUILD_BUG_ON(X86_XCR0_STATES & X86_XSS_STATES);
> +
> +    BUG_ON(s->states & new); /* States only increase. */
> +    BUG_ON(!valid_xcr0(s->states | new)); /* Xen thinks it's a good value. */
> +    BUG_ON(new & ~(X86_XCR0_STATES | X86_XSS_STATES)); /* Known state. */
> +    BUG_ON((new & X86_XCR0_STATES) &&
> +           (new & X86_XSS_STATES)); /* User or supervisor, not both. */
> +
> +    s->states |= new;
> +    if ( new & X86_XCR0_STATES )
> +    {
> +        if ( !set_xcr0(s->states & X86_XCR0_STATES) )
> +            BUG();
> +    }
> +    else
> +        set_msr_xss(s->states & X86_XSS_STATES);
> +
> +    /*
> +     * Check the uncompressed size.  Some XSTATEs are out-of-order and fill in
> +     * prior holes in the state area, so we check that the size doesn't
> +     * decrease.
> +     */
> +    hw_size = cpuid_count_ebx(0xd, 0);

Going forward, do we mean to get rid of XSTATE_CPUID? Else imo it should be
used here (and again below).

> +    if ( hw_size < s->uncomp_size )
> +        panic("XSTATE 0x%016"PRIx64", new bits {%63pbl}, uncompressed hw size %#x < prev size %#x\n",
> +              s->states, &new, hw_size, s->uncomp_size);
> +
> +    s->uncomp_size = hw_size;

Since XSS state doesn't affect uncompressed layout, this looks like largely
dead code for that case. Did you consider moving this into the if() above?
Alternatively, should the comparison use == when dealing with XSS bits?

> +    /*
> +     * Check the compressed size, if available.  All components strictly
> +     * appear in index order.  In principle there are no holes, but some
> +     * components have their base address 64-byte aligned for efficiency
> +     * reasons (e.g. AMX-TILE) and there are other components small enough to
> +     * fit in the gap (e.g. PKRU) without increasing the overall length.
> +     */
> +    hw_size = cpuid_count_ebx(0xd, 1);
> +
> +    if ( cpu_has_xsavec )
> +    {
> +        if ( hw_size < s->comp_size )
> +            panic("XSTATE 0x%016"PRIx64", new bits {%63pbl}, compressed hw size %#x < prev size %#x\n",
> +                  s->states, &new, hw_size, s->comp_size);

Unlike for uncompressed size, can't it be <= here, for - as the comment
says - it being strictly index order, and no component having zero size?

> +        s->comp_size = hw_size;
> +    }
> +    else if ( hw_size ) /* Compressed size reported, but no XSAVEC ? */
> +    {
> +        static bool once;
> +
> +        if ( !once )
> +        {
> +            WARN();
> +            once = true;
> +        }
> +    }
> +}
> +
> +/*
> + * The {un,}compressed XSTATE sizes are reported by dynamic CPUID value, based
> + * on the current %XCR0 and MSR_XSS values.  The exact layout is also feature
> + * and vendor specific.  Cross-check Xen's understanding against real hardware
> + * on boot.
> + *
> + * Testing every combination is prohibitive, so we use a partial approach.
> + * Starting with nothing active, we add new XSTATEs and check that the CPUID
> + * dynamic values never decreases.
> + */
> +static void __init noinline xstate_check_sizes(void)
> +{
> +    uint64_t old_xcr0 = get_xcr0();
> +    uint64_t old_xss = get_msr_xss();
> +    struct xcheck_state s = {};
> +
> +    /*
> +     * User XSTATEs, increasing by index.
> +     *
> +     * Chronologically, Intel and AMD had identical layouts for AVX (YMM).
> +     * AMD introduced LWP in Fam15h, following immediately on from YMM.  Intel
> +     * left an LWP-shaped hole when adding MPX (BND{CSR,REGS}) in Skylake.
> +     * AMD removed LWP in Fam17h, putting PKRU in the same space, breaking
> +     * layout compatibility with Intel and having a knock-on effect on all
> +     * subsequent states.
> +     */
> +    check_new_xstate(&s, X86_XCR0_SSE | X86_XCR0_FP);
> +
> +    if ( cpu_has_avx )
> +        check_new_xstate(&s, X86_XCR0_YMM);
> +
> +    if ( cpu_has_mpx )
> +        check_new_xstate(&s, X86_XCR0_BNDCSR | X86_XCR0_BNDREGS);
> +
> +    if ( cpu_has_avx512f )
> +        check_new_xstate(&s, X86_XCR0_HI_ZMM | X86_XCR0_ZMM | X86_XCR0_OPMASK);
> +
> +    if ( cpu_has_pku )
> +        check_new_xstate(&s, X86_XCR0_PKRU);
> +
> +    if ( boot_cpu_has(X86_FEATURE_AMX_TILE) )
> +        check_new_xstate(&s, X86_XCR0_TILE_DATA | X86_XCR0_TILE_CFG);
> +
> +    if ( boot_cpu_has(X86_FEATURE_LWP) )
> +        check_new_xstate(&s, X86_XCR0_LWP);
> +
> +    /*
> +     * Supervisor XSTATEs, increasing by index.
> +     *
> +     * Intel Broadwell has Processor Trace but no XSAVES.  There doesn't
> +     * appear to have been a new enumeration when X86_XSS_PROC_TRACE was
> +     * introduced in Skylake.
> +     */
> +    if ( cpu_has_xsaves )
> +    {
> +        if ( cpu_has_proc_trace )
> +            check_new_xstate(&s, X86_XSS_PROC_TRACE);
> +
> +        if ( boot_cpu_has(X86_FEATURE_ENQCMD) )
> +            check_new_xstate(&s, X86_XSS_PASID);
> +
> +        if ( boot_cpu_has(X86_FEATURE_CET_SS) ||
> +             boot_cpu_has(X86_FEATURE_CET_IBT) )
> +        {
> +            check_new_xstate(&s, X86_XSS_CET_U);
> +            check_new_xstate(&s, X86_XSS_CET_S);
> +        }
> +
> +        if ( boot_cpu_has(X86_FEATURE_UINTR) )
> +            check_new_xstate(&s, X86_XSS_UINTR);
> +
> +        if ( boot_cpu_has(X86_FEATURE_ARCH_LBR) )
> +            check_new_xstate(&s, X86_XSS_LBR);
> +    }

In principle compressed state checking could be extended to also verify
the offsets are strictly increasing. That, however, would require to
interleave XCR0 and XSS checks, strictly by index. Did you consider (and
then discard) doing so?

Jan

