Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101548B9B01
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 14:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715803.1117714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2ViY-0004hm-7F; Thu, 02 May 2024 12:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715803.1117714; Thu, 02 May 2024 12:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2ViY-0004fR-46; Thu, 02 May 2024 12:39:18 +0000
Received: by outflank-mailman (input) for mailman id 715803;
 Thu, 02 May 2024 12:39:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2ViX-0004fL-2b
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 12:39:17 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc73f02e-0880-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 14:39:15 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41dc9f98e8dso4857215e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 05:39:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o27-20020a05600c511b00b00418a386c17bsm5568772wms.12.2024.05.02.05.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 05:39:14 -0700 (PDT)
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
X-Inumbo-ID: fc73f02e-0880-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714653555; x=1715258355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/awNH/fDe7E4Ox9uD3aF+dalF3thUNmdxzqGEtHvNrc=;
        b=EpDSjJQcPbzIPLuhsikygILj7BC/wrKwLiBUM1pHDE+PlvfTX2azVWUjZbMoBZmzdn
         a2KDWq2wLYkf1RVdw+Usy1PXIdsht96qGtoiYD9l2PE4I1DY4vJ9SYkZiUOqXmDtZzhj
         kSGLd/4XDIaREz5cKrEFj8MHMkf3rmFQ4xSURz7RV+v/XkrmMI21QFVfrH9oPvsETa5D
         PtfhyioAw434aIr+O4ykM1tDlgsQ7QVUj9wQ+yahpG0kItV/y9eIUZXPMeqpDg9wYMtg
         4eFNjgwMWPUPBRhv5cQsa6yWJ38cPVg9c48jYT/daQuXOauKNU5Eqz225WaGPyPgwGkx
         6yCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714653555; x=1715258355;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/awNH/fDe7E4Ox9uD3aF+dalF3thUNmdxzqGEtHvNrc=;
        b=tzf4ruZEYMa2mfCxehaQAJ4LyXHBmoEoj8zpujyA230wKmetyArv2t1f3EFWhB5nUG
         r/sRBKpIbv4/xCeeuHSSj71uWXEr/qTwpFSj/K03SI2MvjX4yQ1hwXl1C50lgZ/znz8J
         uDZBzqHYNJEQSlF/Y5QKSLXeIyY+CivdtpccUqjdb64GV9FeKr7cm9WgmRsARYDCCC1W
         jt0KEyaCXpULoeg00A28B3/Fy33O70sUrLl2U1RxlqYOZUPEFCx7oFO/0RqZBB6Lhcxg
         AXTxZgvDMgRvNkB96ly5HFVDaTba7hYLbfhZjJ2V1VmOiYnQxrT0GqmKK27uUAuJvu4j
         vZqw==
X-Forwarded-Encrypted: i=1; AJvYcCW9+qqxNgLWdWwEnabPqiASVuwW4jM5WXUPCeEwq9q9CdU/MUMMbimeJwDnC41exBltq7yqMpLjWRH0FGngMo8BaJDg6AJEcP92C83fFdg=
X-Gm-Message-State: AOJu0YwY9hnoqTaTV1ik4OpPnXVTwgLbScZK6kVT68w4bPE89WTKmx8R
	OXaV4ly5ItPDUG88PbbcBeGmdSMf/1i7qf8qu5052o2OONZj92LlsaySbs+OxQ==
X-Google-Smtp-Source: AGHT+IGzYpgj+judUzZT+0x1OBwP2DKqGboOgTzGkFWPqLln42VByZYO8YpS+c5Z+hDKqEZlsSSclw==
X-Received: by 2002:a05:6000:188:b0:34d:c4c7:7ca with SMTP id p8-20020a056000018800b0034dc4c707camr2283014wrx.20.1714653555139;
        Thu, 02 May 2024 05:39:15 -0700 (PDT)
Message-ID: <ecd6e142-7a08-46e8-83c0-7d9b0bc6f66f@suse.com>
Date: Thu, 2 May 2024 14:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] x86/cpu-policy: Simplify recalculate_xstate()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
 <20240429182823.1130436-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240429182823.1130436-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2024 20:28, Andrew Cooper wrote:
> Make use of the new xstate_uncompressed_size() helper rather than maintaining
> the running calculation while accumulating feature components.

xstate_uncompressed_size() isn't really a new function, but the re-work of
an earlier one. That, aiui, could have been used here, too, just that it
would have been inefficient to do so. IOW perhaps drop "the new"?

> The rest of the CPUID data can come direct from the raw cpu policy.  All
> per-component data form an ABI through the behaviour of the X{SAVE,RSTOR}*
> instructions.
> 
> Use for_each_set_bit() rather than opencoding a slightly awkward version of
> it.  Mask the attributes in ecx down based on the visible features.  This
> isn't actually necessary for any components or attributes defined at the time
> of writing (up to AMX), but is added out of an abundance of caution.

As to this, ...

> @@ -206,61 +205,47 @@ static void recalculate_xstate(struct cpu_policy *p)
>          return;
>  
>      if ( p->basic.avx )
> -    {
>          xstates |= X86_XCR0_YMM;
> -        xstate_size = max(xstate_size,
> -                          xstate_offsets[X86_XCR0_YMM_POS] +
> -                          xstate_sizes[X86_XCR0_YMM_POS]);
> -    }
>  
>      if ( p->feat.mpx )
> -    {
>          xstates |= X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
> -        xstate_size = max(xstate_size,
> -                          xstate_offsets[X86_XCR0_BNDCSR_POS] +
> -                          xstate_sizes[X86_XCR0_BNDCSR_POS]);
> -    }
>  
>      if ( p->feat.avx512f )
> -    {
>          xstates |= X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
> -        xstate_size = max(xstate_size,
> -                          xstate_offsets[X86_XCR0_HI_ZMM_POS] +
> -                          xstate_sizes[X86_XCR0_HI_ZMM_POS]);
> -    }
>  
>      if ( p->feat.pku )
> -    {
>          xstates |= X86_XCR0_PKRU;
> -        xstate_size = max(xstate_size,
> -                          xstate_offsets[X86_XCR0_PKRU_POS] +
> -                          xstate_sizes[X86_XCR0_PKRU_POS]);
> -    }
>  
> -    p->xstate.max_size  =  xstate_size;
> +    /* Subleaf 0 */
> +    p->xstate.max_size =
> +        xstate_uncompressed_size(xstates & ~XSTATE_XSAVES_ONLY);
>      p->xstate.xcr0_low  =  xstates & ~XSTATE_XSAVES_ONLY;
>      p->xstate.xcr0_high = (xstates & ~XSTATE_XSAVES_ONLY) >> 32;
>  
> +    /* Subleaf 1 */
>      p->xstate.Da1 = Da1;
> +    if ( p->xstate.xsavec )
> +        ecx_mask |= XSTATE_ALIGN64;
> +
>      if ( p->xstate.xsaves )
>      {
> +        ecx_mask |= XSTATE_XSS;
>          p->xstate.xss_low   =  xstates & XSTATE_XSAVES_ONLY;
>          p->xstate.xss_high  = (xstates & XSTATE_XSAVES_ONLY) >> 32;
>      }
> -    else
> -        xstates &= ~XSTATE_XSAVES_ONLY;
>  
> -    for ( i = 2; i < min(63UL, ARRAY_SIZE(p->xstate.comp)); ++i )
> +    /* Subleafs 2+ */
> +    xstates &= ~XSTATE_FP_SSE;
> +    BUILD_BUG_ON(ARRAY_SIZE(p->xstate.comp) < 63);
> +    for_each_set_bit ( i, &xstates, 63 )
>      {
> -        uint64_t curr_xstate = 1UL << i;
> -
> -        if ( !(xstates & curr_xstate) )
> -            continue;
> -
> -        p->xstate.comp[i].size   = xstate_sizes[i];
> -        p->xstate.comp[i].offset = xstate_offsets[i];
> -        p->xstate.comp[i].xss    = curr_xstate & XSTATE_XSAVES_ONLY;
> -        p->xstate.comp[i].align  = curr_xstate & xstate_align;

... for this bit, isn't the move from this ...

> +        /*
> +         * Pass through size (eax) and offset (ebx) directly.  Visbility of
> +         * attributes in ecx limited by visible features in Da1.
> +         */
> +        p->xstate.raw[i].a = raw_cpu_policy.xstate.raw[i].a;
> +        p->xstate.raw[i].b = raw_cpu_policy.xstate.raw[i].b;
> +        p->xstate.raw[i].c = raw_cpu_policy.xstate.raw[i].c & ecx_mask;

... to this changing what guests get to see, i.e. (mildly?) incompatible?
(For .xss there's no issue because XSTATE_XSAVES_ONLY is still 0.)

Jan

