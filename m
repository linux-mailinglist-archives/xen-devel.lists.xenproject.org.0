Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9EA17055
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 17:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875011.1285341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZunl-00021D-5Z; Mon, 20 Jan 2025 16:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875011.1285341; Mon, 20 Jan 2025 16:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZunl-0001z2-1x; Mon, 20 Jan 2025 16:39:01 +0000
Received: by outflank-mailman (input) for mailman id 875011;
 Mon, 20 Jan 2025 16:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tZunj-0001yw-2h
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 16:38:59 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b8e150b-d74d-11ef-a0e4-8be0dac302b0;
 Mon, 20 Jan 2025 17:38:58 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso13046205e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2025 08:38:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438904084e7sm146023155e9.6.2025.01.20.08.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 08:38:57 -0800 (PST)
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
X-Inumbo-ID: 0b8e150b-d74d-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737391137; x=1737995937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I8acPMMNfBa5yJgbhB9KB8Wf6+4ucs4xk8J5nrdK9WA=;
        b=bR5mY+aDU/fd3JTFo/P6ApF1KiEa64CFqaIevoa1Mt8xX0Ql/yRQ5Jyv1rsgV60t9L
         FgAkwcqR65KlqML/sN0lUUsc+9vdU7dlpA/fyNYt/zz5NPfC0PCzvI4lXmEkKWBbvRbh
         Pnc+cP9XavzJDI7/MlyIK1L39wKVVe/rUvGXg301cfRMG2YCGlkF+gyUcyComSJIrZZg
         2SmQ/nyDFBbfvB+x8+rRBppRs7ydpP4fChRRaeB5dkNJfGWA1AuWVCtCE5EjxuIftXiM
         7eSuRbdE4sszKPNOHLFco+4FozepH3gSc/HRo9LcT05qh4khZLMXhW2uVZcGl2t+AZkJ
         aZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737391137; x=1737995937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8acPMMNfBa5yJgbhB9KB8Wf6+4ucs4xk8J5nrdK9WA=;
        b=ctN6beogR3H1bidTrNpH+elMc/rqRHIgpF8IYdGh5tBnDbjZwFGezZZJb5pVx1/w6m
         I51EeTD3QGlDXTl5evht6+2QmYXUe567CD4PX/PVlg1pT4SaNlADljDB5OuBt5+r2at+
         RtBu1RtxRBkCWQwMPgWzOH0a7yk9ulFlJO41M9Fj3MSC/50pUOL/AMqwRy5oEdznf45l
         qOLBD64Y7nyRqnoFwgM6O1KKvFwr4TZXZu9JPehZKZLF8YgkFGw8TC6umbXzQCfUgUS7
         1zESn15N3wO9PforlikUvAXJKm5BIsvS34Jq+dg2ZoXf78UCAVKVVa2iTmyJ4/Yglmhj
         Cd6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUFVTXxv/NAIi40f2UUvYZ8FecBBxvKqmS8KIx+ayeVUYqqDdzX8Drvuqdk0PCmssWZu7y0URtezk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpecI5GBQAREq4MuVZPUe6nixF4QY+Nkpx6Bj0mjBj3bbnL9zA
	mIsHPt48iDSC4e/cSAXylf5qsPxf8mlJhuVYY/Sz0tF8C0Td0hMmqMic3dv5iA==
X-Gm-Gg: ASbGncuf6qi5hWsFVCdHGj7gv7anUirnYTRmb6DMcL1K/j9rwZGWvCeRu+nFryc08Tn
	nLdmd1MzXSmuWkLTgRkf5+BQuFU6jVOrosyYLYsw8P/D5//hG9br1kOoVlyPCbEcwshOup/h5wU
	GX1hVMhhwVSjc18j59l+ssr9VjhvxIFkdish9TqEJSTbKUHgGobIZaCbPDD+UjAb+0IsGsdPIyz
	YSGMRj7q6/HYu1RvjC6dRgF131A8sRfjJUgTi2mptgf+O8SxjcczwlhxKWaG/k8mB0FoGkmK6sN
	uD4wdh7Mo5dYNA8OcqIpvI3UQnVNZQUwxq90uLGtFOZFsckrAZEXR0k=
X-Google-Smtp-Source: AGHT+IGVQxwvdR0ilcqOWNp2M+c38jQy/07RSNXDvHfc7+gKLsGJ0ijaK1AgUZgYVZOd950AH9BhFQ==
X-Received: by 2002:a05:600c:34d0:b0:434:fbda:1f44 with SMTP id 5b1f17b1804b1-4389142e805mr113200345e9.19.1737391137374;
        Mon, 20 Jan 2025 08:38:57 -0800 (PST)
Message-ID: <2682d50b-8152-427a-9184-322afdb9dd47@suse.com>
Date: Mon, 20 Jan 2025 17:38:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/10] x86: Enable XSTATE save/restore for arch LBR
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
 <20250102084413.102-7-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20250102084413.102-7-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2025 09:45, Tu Dinh wrote:
> --- a/xen/arch/x86/include/asm/xstate.h
> +++ b/xen/arch/x86/include/asm/xstate.h
> @@ -33,13 +33,13 @@ extern uint32_t mxcsr_mask;
>  #define XSTATE_FP_SSE  (X86_XCR0_X87 | X86_XCR0_SSE)
>  #define XCNTXT_MASK    (X86_XCR0_X87 | X86_XCR0_SSE | X86_XCR0_YMM | \
>                          X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM | \
> -                        XSTATE_NONLAZY)
> +                        XSTATE_NONLAZY | XSTATE_XSAVES_ONLY)

This is odd - in the sole pre-existing place where the #define is used you
then remove X86_XSS_STATES again. Plus please see also
https://lists.xen.org/archives/html/xen-devel/2021-04/msg01336.html.

>  #define XSTATE_ALL     (~(1ULL << 63))
>  #define XSTATE_NONLAZY (X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | X86_XCR0_PKRU | \
>                          X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA)
>  #define XSTATE_LAZY    (XSTATE_ALL & ~XSTATE_NONLAZY)
> -#define XSTATE_XSAVES_ONLY         0
> +#define XSTATE_XSAVES_ONLY         (X86_XSS_LBR)
>  #define XSTATE_COMPACTION_ENABLED  (1ULL << 63)
>  
>  #define XSTATE_XSS     (1U << 0)
> @@ -91,6 +91,21 @@ struct xstate_bndcsr {
>      uint64_t bndstatus;
>  };
>  
> +struct xstate_lbr_entry {
> +    uint64_t lbr_from_ip;
> +    uint64_t lbr_to_ip;
> +    uint64_t lbr_info;
> +};
> +
> +struct xstate_lbr {
> +	uint64_t lbr_ctl;
> +	uint64_t lbr_depth;
> +	uint64_t ler_from_ip;
> +	uint64_t ler_to_ip;
> +	uint64_t ler_info;
> +	struct xstate_lbr_entry entries[32];
> +};

Doesn't this 32 appear in an earlier patch as well? They need tying together
via a #define then.

Also nit: Hard tabs slipped in.

> @@ -114,6 +129,9 @@ int xstate_alloc_save_area(struct vcpu *v);
>  void xstate_init(struct cpuinfo_x86 *c);
>  unsigned int xstate_uncompressed_size(uint64_t xcr0);
>  unsigned int xstate_compressed_size(uint64_t xstates);
> +void *get_xstate_component_comp(struct xsave_struct *xstate,
> +                                unsigned int size,
> +                                uint64_t component);
>  
>  static inline uint64_t xgetbv(unsigned int index)
>  {
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 289cf10b78..68a419ac8e 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -522,8 +522,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>          if ( !cp->xstate.xsaves )
>              goto gp_fault;
>  
> -        /* No XSS features currently supported for guests */
> -        if ( val != 0 )
> +        if ( val & ~(uint64_t)XSTATE_XSAVES_ONLY )
>              goto gp_fault;

Imo we'd be better off arranging for casts like this to not be required. It's
too easy to leave one out unintentionally.

> @@ -210,7 +214,7 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
>       * non-compacted offset.
>       */
>      src = xstate;
> -    valid = xstate_bv & ~XSTATE_FP_SSE;
> +    valid = xstate_bv & ~XSTATE_FP_SSE & ~X86_XSS_STATES;
>      while ( valid )
>      {
>          u64 feature = valid & -valid;
> @@ -276,7 +280,7 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
>       * possibly compacted offset.
>       */
>      dest = xstate;
> -    valid = xstate_bv & ~XSTATE_FP_SSE;
> +    valid = xstate_bv & ~XSTATE_FP_SSE & ~X86_XSS_STATES;
>      while ( valid )
>      {
>          u64 feature = valid & -valid;

I can't figure why these two changes are needed, and the description isn't
of any help here either.

> @@ -1072,6 +1085,30 @@ void xstate_set_init(uint64_t mask)
>          BUG();
>  }
>  
> +void *get_xstate_component_comp(struct xsave_struct *xstate,
> +                                unsigned int size,
> +                                uint64_t component)
> +{
> +    uint16_t comp_offsets[sizeof(xfeature_mask) * 8];
> +    uint16_t offset;
> +    unsigned int i = ilog2(component);
> +
> +    ASSERT(generic_hweightl(component) == 1);
> +
> +    if ( !(xstate->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED) ||
> +         i >= xstate_features ||
> +         xstate_sizes[i] == 0 ||
> +         !(xstate->xsave_hdr.xcomp_bv & component) )
> +        return NULL;
> +
> +    setup_xstate_comp(comp_offsets, xstate->xsave_hdr.xcomp_bv);
> +    offset = comp_offsets[i];
> +    if ( xstate_sizes[i] + offset > size )
> +        return NULL;
> +
> +    return (void *)xstate + offset;
> +}

The function is unused at this point. Besides this being a Misra violation
(unreachable code), it also means it's left unclear what the purpose is.
That would, for example, influence whether there should be some "const"
applied. I find it particularly worrying that the function returns a
pointer to non-const, thus permitting the caller to fiddle with the
contents. Similarly it's left unclear what the "size" parameter is for.

Jan

