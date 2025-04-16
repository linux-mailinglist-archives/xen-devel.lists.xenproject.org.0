Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE31A8B4DC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 11:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955394.1349183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4yni-0005Xn-Q9; Wed, 16 Apr 2025 09:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955394.1349183; Wed, 16 Apr 2025 09:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4yni-0005Wb-NS; Wed, 16 Apr 2025 09:11:22 +0000
Received: by outflank-mailman (input) for mailman id 955394;
 Wed, 16 Apr 2025 09:11:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4ynh-0005WT-22
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 09:11:21 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1dcc16e-1aa2-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 11:11:19 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so56587515e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 02:11:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43d38fsm16574368f8f.71.2025.04.16.02.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 02:11:18 -0700 (PDT)
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
X-Inumbo-ID: c1dcc16e-1aa2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744794678; x=1745399478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UxfKgyK7xsguxNIIHCKB7S3OeeLOAIPL0VZurTpmNCs=;
        b=RpAbP0INphM84MHlsWnKG78iDjE4ukeF5NcBBUjxAVl1lKd1jL44U7FWN/oxBXy9kR
         jwu7KAnLCvUpIAGIAzFELLtI6pcbWcalIpmgQEILs16Ov5sOunhjEpTbPhGTZg/k2C0H
         WztZlWI35JKyJzr8l7FxbFfIaBiL73f9PFvuUGbj5CkymzDOjhAWAplIBP0LhJ0XL2Ae
         4AemlISpngFsw9dg3QQtit/BIBnJkWkKVZqguLaPoUvZ1ag5QVKe/5KU4BwXFq61UpD7
         migfQMNXzv9SigvFRWhQqEZqO4RAzdoL72I4jGxcTLy38JDFVN8/QRNmO0lVZJDWkYjq
         U/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794678; x=1745399478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxfKgyK7xsguxNIIHCKB7S3OeeLOAIPL0VZurTpmNCs=;
        b=qIaryPST5tssyqPlBwlyrI5+bGKgOKdtsEvyArpJCVg1Bv5e5145X4Ivno/CdNaEOK
         2jfKMFg7XezNKFImOzvQgqSlVEzY6cv3176/UugVMfOlPdjjnPBjLjSNw7WEkIL/9NA3
         OIhrhdmmkQ+3GDbyHJfLE4IgafdFnyMDDBDPJfTN0YOZ92L/g4H10cmAE4S8rvWc4Ppi
         TDh3BXnDu6qnJjDpPRB20W+I5BMlgGELkukzHCsybvOZNhgAe6EIf3iakENlGaIWAf23
         tyDzHdmuxhWTkOABsTpfaaom3mLR/doKa7t3Bv1XZr/s7/0gFEmEi5sFeHtqKms0x0qV
         eqog==
X-Gm-Message-State: AOJu0YwILyDY80/eiWlTET3LuyLGFsexl8Mfzh8DBaVk/mOAw3Q4obzm
	5Y83vDlcygNjeTGHtWKkUbn+3MbbiXFhiXSdsQTXH7gAroxzHVYUtzaWYa/WOw81v2t5hujbj5I
	=
X-Gm-Gg: ASbGncsFXXRJ4CcgONqL1/Qc4+MKvQ9zyPCiYwb6mJNVzh154hjT2rJ4xJUE4y4LcpQ
	/aHSLHkLGWTsqJP0saVMrasrQ9DUSQ4KhRRHaPSY2ueyZo9zoLifD4WnJ8mnghx00MHQJkQMd31
	38FSpkCEsGqnQ5RfgSuB9kL/EXdUm8FUm2jpcm4f+wiTxPNLH+3WSbvzDtFDcXU4zmpeNQ4j/7h
	07yC4LIeAqr4RPkGFz/DrJUFUp64344r90bEteHlMTiBaUAdtbI1I+sUiDqCo3cSeA60JUPv5/w
	SznP5QIW52Dd8WZxeoulQcWMplDAP0g57cnYcXRLJlBsN0AwAkxJy5SvOErG4/iT0s8k3JWx1WA
	oEygW64GFTMVTEYI8E0cl4jyxIQ==
X-Google-Smtp-Source: AGHT+IEhh4Kb7Woj+fOh/o3K+ilJGWiozfdK9PXiovHb0wMRarYpA9jQsuC6RYdT4tJ2F6FtCF0lqw==
X-Received: by 2002:a05:6000:1867:b0:391:2a9a:478c with SMTP id ffacd0b85a97d-39ee5b1618dmr964970f8f.23.1744794678347;
        Wed, 16 Apr 2025 02:11:18 -0700 (PDT)
Message-ID: <e876c886-9a15-4193-9fb6-3c0624a288c6@suse.com>
Date: Wed, 16 Apr 2025 11:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assert in x86_emulate_wrapper triggerable by HVM domain
To: Manuel Andreas <manuel.andreas@tum.de>
References: <e7347061-6dc6-44a3-ad41-270e705db2c5@tum.de>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <e7347061-6dc6-44a3-ad41-270e705db2c5@tum.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.04.2025 23:52, Manuel Andreas wrote:
> Dear all,
> 
> my fuzzing infrastructure discovered that an assert in 
> x86_emulate_wrapper is able to be triggered by an HVM domain executing a 
> specially crafted repeating movs instruction.

That's

    /* All cases returning X86EMUL_EXCEPTION should have fault semantics. */
    if ( rc == X86EMUL_EXCEPTION )
        ASSERT(ctxt->regs->r(ip) == orig_ip);

?

> Specifically, if the emulation of the rep movs instruction triggers an 
> exception (e.g. by accessing invalid memory after some amount of 
> iterations), the emulation will be halted at that point.
> However, the instruction manual requires that _some_ register state 
> (namely the updated value of rcx) shall be commited, whereas the 
> instruction pointer needs to be rolled back to point to the address of 
> the instruction itself. The assert checks for the latter. Problematic is 
> the fact that for these type of repeating instructions, Xen seems to 
> eventually just commit all register state when it encounters an exception:
> 
>     557  #define put_rep_prefix(reps_completed) 
> ({                               \
>     558      if ( rep_prefix() 
> )                                                 \
>     559 { \
>     560          __put_rep_prefix(&_regs, ctxt->regs, ad_bytes, 
> reps_completed); \
>     561          if ( unlikely(rc == X86EMUL_EXCEPTION) 
> )                        \
>     562              goto 
> complete_insn;                                         \
>     563 } \
>     564  })

I fear I'm not following, considering __put_rep_prefix() has

    /* Reduce counter appropriately, and repeat instruction if non-zero. */
    ecx -= reps_completed;
    if ( ecx != 0 )
        int_regs->r(ip) = ext_regs->r(ip);

>    8356   complete_insn: /* Commit shadow register state. */
>    8357      put_fpu(fpu_type, false, state, ctxt, ops);
>    8358      fpu_type = X86EMUL_FPU_none;
>    8359
>    8360      /* Zero the upper 32 bits of %rip if not in 64-bit mode. */
>    8361      if ( !mode_64bit() )
>    8362          _regs.r(ip) = (uint32_t)_regs.r(ip);
>    8363
>    8364      /* Should a singlestep #DB be raised? */
>    8365      if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )
>    8366      {
>    8367          ctxt->retire.singlestep = true;
>    8368          ctxt->retire.sti = false;
>    8369      }
>    8370
>    8371      if ( rc != X86EMUL_DONE )
>    8372          *ctxt->regs = _regs; // <- Incorrect RIP is commited
> 
> I've attached an XTF test that should trigger the aforementioned assert 
> on the latest release commit: 3ad5d648cda5add395f49fc3704b2552aae734f7

I'll give this a try, perhaps it'll shed more light on the situation. I'd
be surprised though that the fuzzer we have in tree wouldn't have found
this (so far).

Jan

