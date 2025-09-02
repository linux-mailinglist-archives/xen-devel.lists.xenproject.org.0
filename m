Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EA6B3FCC2
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 12:38:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106036.1456831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utOOk-0002uZ-Rj; Tue, 02 Sep 2025 10:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106036.1456831; Tue, 02 Sep 2025 10:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utOOk-0002rv-Nk; Tue, 02 Sep 2025 10:37:58 +0000
Received: by outflank-mailman (input) for mailman id 1106036;
 Tue, 02 Sep 2025 10:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utOOj-0002rn-8L
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 10:37:57 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e26b7bbb-87e8-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 12:37:55 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b042cc39551so277222766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 03:37:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0425ce98f1sm509644466b.67.2025.09.02.03.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 03:37:54 -0700 (PDT)
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
X-Inumbo-ID: e26b7bbb-87e8-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756809474; x=1757414274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J0nm8NxkCxzoPBauDSqefKIe23HsEQbIoRtT9FTRhjc=;
        b=P0EoGDUr8ddQKKcWWi56sQUnNCPFjOZ5/SXw9UNwn2gs66cVNFkTE727HXA/e64NcX
         deWqQ9mDiJ/2+7O0CeCYiGmGzhuQuTNOB5/SY7EMEQGPeGEozO1wF/dgVSbbLt4t7Amy
         PLT8C/140ZPbCdP5KIbJ+Igvh3S0vhjXBKUpytETBZvyThl1S+q8oSobI1MCw0+hkGyK
         75QAEMXBE2PCQ/kh15jbpnyjYReepgo0gfIyFL5zjGH0S1ozuFB5j3cHbuQLXFsLgcvM
         uze3srvEDz+dZ1DdM3SFVmp+yDqMO1iImwREAA2wRIiJD7CT7pBsysg42RhvEG0+SdLT
         ZZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756809474; x=1757414274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0nm8NxkCxzoPBauDSqefKIe23HsEQbIoRtT9FTRhjc=;
        b=lFE3VuPQEbuYmN54N47rkTX6oaYCHHFccbwaTAHHkiFQVWvCjNIRtK3EBGt/Agi1GB
         wVtsPx/4yMyqwTEdJaeNLGJNBJnuAuaatQQqostWn56agXEzFG7jm+a5vhQAStd5ETPl
         MI6tpwbOmr2UIZoQPB5ENFYt1A6K3lhHAYG+jpavpRLvpNKHlAp1eDSjcuegyJWVBPSx
         kfMPjayiu9Fq3lThzSg53igiHPTGSO+NWDidykVEFgT4n+2ij/Z0yaiqD1LNZS5vnB9V
         /F2SZhz6oe7G0M+ZFrIfC9nJhoS8OXRFR8RyfAVqhima2ITFw3hw37JpEYpXOd9UhcXM
         HeGw==
X-Gm-Message-State: AOJu0YyzW/oSMvrzCqvL4lX0lHZ9VaYBm/EW0RXvD5nAuB9TUhKijSA+
	qAciOQAkWZhqjt97iwDJ07JJgNmTcHKLICygqiq3zPDmapmrI527p/mhavGFhzsFOA==
X-Gm-Gg: ASbGncvRJNXqD4IBh2DjctSRL4HztyT1CN9S7Dj8yQ0BE2v6WblwbfLPeZdFOWSgEhg
	1LQCCbM6gFmmRMw+Kw8/SyrclDm619GKlc2UAcJBa+eu+z8yOCE1iJNqOOINSLRgpbYKBEVGg1k
	PGnxbGxowWIZN62zFLgXJFT/yfSFmaf30HO4tT3E7UJA7ZccqWQEb5PUalZawFMxQpuocjVQnOk
	dRKTYT6HAQsYnKYbYztHiA7+/gPqDCRQiPKwLmmszEIiqpDgTKvWEww8BVHQ/4Vwjrw4Sm4AiFl
	u/LJffDQ5XsBFd1KQAaxY1xVsQ0qXaNP/57poUiu/5t/XC4WGp3sXI1W6v/YoYWVrSAJaOahzKk
	30Cp+PojtFSlsBfr0MieRmUpLSGLPDLdJGiFwEOW1aIoCP90JrZrHDkvIpJl9Krt9eKAhRaFQNu
	xLCmhihfKCOu5XfBTU7Q==
X-Google-Smtp-Source: AGHT+IHRBCyN9Qd5DucgluDdOwHZYf7UHKJm164aLcm7UBqlDemu/QuBFdorTGRitfN9FJbUiRGPrA==
X-Received: by 2002:a17:907:d78b:b0:afe:cb06:ee2c with SMTP id a640c23a62f3a-b01f20becc7mr1062598066b.59.1756809474382;
        Tue, 02 Sep 2025 03:37:54 -0700 (PDT)
Message-ID: <2d351d66-f55f-4ca3-8a27-525018558bdb@suse.com>
Date: Tue, 2 Sep 2025 12:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Rationalise CS limit handling in
 arch_set_info_hvm_guest()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20250901180814.1366701-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250901180814.1366701-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2025 20:08, Andrew Cooper wrote:
> Ever since it's introduction in commit 192df6f9122d ("x86: allow HVM guests to
> use hypercalls to bring up vCPUs"), %cs.g/limit has been handled differently
> to all other segments.
> 
> The hypercall takes full 32bit,

This is an implication from the implementation, but it's not said anywhere in
the public header. Without it saying that .g is ignored when .p is set (due
to ...

> and hvm_set_segment_register() fixes up all
> segments .g to match the limit being 2^20 or more.

... this internal behavior), I'd imply the opposite from what the public
header has right now. IOW I think the public header also needs touching in
the course of consolidating the code.

>  Therefore, treating %cs
> only as having architectural (20-bit) limit field is weird and unexpected.
> 
> Remove the custom handling for %cs.  This is a guest ABI change, but all
> callers are expected to be setting up flat segmentation, at which point limit
> will be ~0U and there will be no change in practice whether .g is set or not.

A legitimate input to achieve flat segmentation would be to pass in a CS
limit of 0xfffff and .g set. Just that people trying to do so would have
learned that this doesn't do what's intended. (This is just to further
emphasize that the public header commentary needs adjusting.)

That said, what hvm_set_segment_register() does isn't quite right for the
purpose here: If we assume the limit to be the full 32-bit value, then
when any of the upper 12 bits is set (meaning we would set .g) really
we'd need to reject values with the lower 12 bits not all ones. (That
could be a separate change to check_segment(), though.)

I'm further puzzled by comments in the header talking of starting a vCPU
in compatibility mode. How would that work sensibly? The guest can't
really set up any of the long mode control structures, unless confining
all of them into the low 4Gb (virtual and, for CR3, physical).

The TR setup for VCPU_HVM_MODE_64B also looks suspicious: What use is it
to set up a TSS at linear address 0, with a limit of 0x67? Wouldn't we
better make the limit as small as possible (0?), such that any implicit
access to it would fault? (I don't recall whether both SVM and VT-x
would permit an entirely invalid TR.) Furthermore to enter a guest in
compat mode, CR0.PG and CR4.PAE would also need to be set, whereas CS.L
would need to be clear.

Finally, why do we check both EFER.LME and EFER.LMA in the 32-bit case,
but only EFER.LME in the 64-bit one?

Jan

