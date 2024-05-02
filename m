Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3468B9B4C
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 15:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715810.1117723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2W7B-00015U-4N; Thu, 02 May 2024 13:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715810.1117723; Thu, 02 May 2024 13:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2W7B-00013A-1m; Thu, 02 May 2024 13:04:45 +0000
Received: by outflank-mailman (input) for mailman id 715810;
 Thu, 02 May 2024 13:04:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2W79-000134-Qz
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 13:04:43 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8931e3a4-0884-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 15:04:41 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-346359c8785so6366393f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 06:04:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m3-20020adffa03000000b0034db974d7a1sm1219207wrr.81.2024.05.02.06.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 06:04:39 -0700 (PDT)
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
X-Inumbo-ID: 8931e3a4-0884-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714655080; x=1715259880; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MjzMlQ+UB0mzimV8PSmOXAwTjeKig6Rkw1588EBUfaM=;
        b=NuWQ5L+Pjl3SCnrzP+50bVDvp1C2nnGgezNDGyTOPU3KeQQEENNl71I6u9jtYi+RkV
         v1qVa8xxneACWhEfUKpzaD0RgauvJxOElI3/xg7rrxyFzsDNY8cHHbeCqkWQUIRXleBa
         m1wej6XnmI3gFRPkSZrZnekjcc8m7NNdymwoX7FozSON4x6XAOX/xor1og9NTfDmm+XM
         XKLRp3p0y/KAxuscKdV1pwV7rREFSQn7XbCOD33KiEUWzbUttsOz67hBGbdDPpKmOHXD
         YM/arRH7CqsV36RjTBhNrtP1P2vDCrNwTEceMM6dzLOTYQ1ebB7d/N/XS5Ur03A1Sl+r
         PZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714655080; x=1715259880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjzMlQ+UB0mzimV8PSmOXAwTjeKig6Rkw1588EBUfaM=;
        b=BYEpNjtityaitV3/NeNM76Ia1iXFKo3b8okIisfxd4DNlPlww18lnBKg6WVT8S35CK
         b94GHF8r+Z98QWKdzbwNJO1vwmMxujGG6PpSqafRe3YZB8+QNfOUEMhu4hQ5KaeG9mY/
         sBbgE7R5wdF5SJeD1ufe2QIxzU2866oLUcwhyNd0gAiL5c0k8/znDBpdE/zTouo0Nbfr
         l4/zEaPFOf38HQ+PxFG1duCFpOEC0Rtj+DOUx45lBdTgyvcgM8PcBFtFSic/TcYA2xdP
         AB844YCnQsrMlqEKtfmA1re4S0NfLTxNWID9WvAegE2R3lX+i5YieXS7aP+puQ8BYDho
         yEFA==
X-Forwarded-Encrypted: i=1; AJvYcCXlQTO6ZUARDaNJOHdvc6cxnhn1o2aIz1KMA4t2PDrntSwQgEPJSH91Y8RuX1qbj6iu26PQtTF6qfuujwNG1JdJw5V8hH1ITzF7sUqEmC8=
X-Gm-Message-State: AOJu0YwQFhtOMXEA7BQz6raP3ZAiS6ny+ttoyp+yxU4zxnjLv0U7327p
	XEv5dLQcwzcxRrJs8pPVLeaVPaECCSG0cxIRWmTapyunuSlCqpySac/ynPlgAg==
X-Google-Smtp-Source: AGHT+IHw8AFL8VCNilQGKblSIl1CXF3gYHtTQGdG0DSXmS0QHATt06glj1ESCB1HIHX40h2Ij8LJfg==
X-Received: by 2002:a5d:4dc7:0:b0:34d:12c3:ffb0 with SMTP id f7-20020a5d4dc7000000b0034d12c3ffb0mr3508693wru.9.1714655079457;
        Thu, 02 May 2024 06:04:39 -0700 (PDT)
Message-ID: <d87b31be-6c52-4271-a61f-bf31043f507d@suse.com>
Date: Thu, 2 May 2024 15:04:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86/cpuid: Fix handling of xsave dynamic leaves
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
 <20240429182823.1130436-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240429182823.1130436-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.04.2024 20:28, Andrew Cooper wrote:
> If max leaf is greater than 0xd but xsave not available to the guest, then the
> current XSAVE size should not be filled in.  This is a latent bug for now as
> the guest max leaf is 0xd, but will become problematic in the future.

Why would this not be an issue when .max_leaf == 0xd, but .xsave == 0? Without
my "x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents"
I don't think we shrink max_leaf to below 0xd when there's no xsave for the
guest?

> The comment concerning XSS state is wrong.  VT-x doesn't manage host/guest
> state automatically, but there is provision for "host only" bits to be set, so
> the implications are still accurate.
> 
> Introduce {xstate,hw}_compressed_size() helpers to mirror the uncompressed
> ones.
> 
> This in turn higlights a bug in xstate_init().  Defaulting this_cpu(xss) to ~0
> requires a forced write to clear it back out.  This in turn highlights that
> it's only a safe default on systems with XSAVES.

Well, yes, such an explicit write was expected to appear when some xsaves-
based component would actually be enabled. Much like the set_xcr0() there.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> The more I think about it, the more I think that cross-checking with hardware
> is a bad move.  It's horribly expensive, and for supervisor states in
> particular, liable to interfere with functionality.

I agree, but I'd also like to see the cross checking not dropped entirely.
Can't we arrange for such to happen during boot, before we enable any such
functionality? After all even in debug builds it's not overly useful to do
the same cross-checking (i.e. for identical inputs) over and over again.
Of course doing in an exhaustive manner may be okay for the uncompressed
values, but might be a little too much for all possible combinations in
order to check compressed values, too.

> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -614,6 +614,65 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
>      return size;
>  }
>  
> +static unsigned int hw_compressed_size(uint64_t xstates)
> +{
> +    uint64_t curr_xcr0 = get_xcr0(), curr_xss = get_msr_xss();
> +    unsigned int size;
> +    bool ok;
> +
> +    ok = set_xcr0(xstates & ~XSTATE_XSAVES_ONLY);
> +    ASSERT(ok);
> +    set_msr_xss(xstates & XSTATE_XSAVES_ONLY);
> +
> +    size = cpuid_count_ebx(XSTATE_CPUID, 1);
> +
> +    ok = set_xcr0(curr_xcr0);
> +    ASSERT(ok);
> +    set_msr_xss(curr_xss);
> +
> +    return size;
> +}
> +
> +unsigned int xstate_compressed_size(uint64_t xstates)
> +{
> +    unsigned int i, size = XSTATE_AREA_MIN_SIZE;
> +
> +    if ( xstates == 0 ) /* TODO: clean up paths passing 0 in here. */
> +        return 0;
> +
> +    if ( xstates <= (X86_XCR0_SSE | X86_XCR0_FP) )

Same comment as on the earlier change regarding the (lack of) use of ....

> +        return size;
> +
> +    /*
> +     * For the compressed size, every component matters.  Some are
> +     * automatically rounded up to 64 first.
> +     */
> +    xstates &= ~XSTATE_FP_SSE;

... this constant up there.

> +    for_each_set_bit ( i, &xstates, 63 )
> +    {
> +        if ( test_bit(i, &xstate_align) )
> +            size = ROUNDUP(size, 64);
> +
> +        size += xstate_sizes[i];
> +    }

The comment is a little misleading: As you have it in code, it is not the
component's size that is rounded up, but its position. Maybe "Some have
their start automatically rounded up to 64 first"?

Jan

